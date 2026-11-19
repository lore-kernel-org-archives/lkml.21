Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099685;
	b=5Y4zo+RWCBdvZAfUXoID2OWGdLQEysEIz9HiS5O8s6j5OHccC45ZL8XHzgYujM7n7PHl
	 mbqWIrM42eb/FZ7h4vg23Mqr0RguO0VKgBz6URhOmTXiSKmZXiG/I/Q0/t3h35bRV3tOD
	 6rCDcbzB6Z7xNIpzYx/hc+rxDxuAprR5F1s2+Jun3Jovo0JGGUbboRby6qd3ubVukZ3ND
	 YjyrD7gtQqlirY2hfr19a68xTft0xXE6CgtRQ72Stlktn2hRq4DYrk3orPJGBXAJ4GaGd
	 YVFQ5PbRBQd+OAmIINLoI2Zl466bM5ksdiWZRgD4uu5waH0Hef768mgGjKgfkbvwyxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099685;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=6HBvvlIub12wrSr52ZlJQDUQHfx6B9c7JQjlNcoZPgk=;
	b=i7n7oXhHVU/VVWa87LB86bm8oENdZt+o11oP1mbd3i3kZkmD8LnIkHbQW8hIIlpnQVnP
	 NZdLXD3Q4+OJ1YGbnkIaJjmXpRYmDkvi3fi4TV/MkRA6uMEEr3EVnh2o4rllx8lCQQKOp
	 R1i1aB4dLs7j4lDwZ4E3CD9bE7s7fzfwSBjWe5SB3dHGLkAkR0ZX3PzlFfCFKYePSYJpd
	 jL5GJj2j21TQNhX4Se70+iZ7/gW9b7+EkWXFDH+KyKTPMIqqoj6eq1SQsTtXlleLVWNhE
	 HlOOyCU6kGVDDXVHrS2cdc4wkw4VOGOGGMHEZat5t0AhWcuv655UQtNMct1IEeHJjhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b="aNvEM7/W";
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DEF60A3832
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59DEF60A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=aNvEM7/W
Received: from trampoline.thunk.org (pool-173-48-114-214.bstnma.fios.verizon.net [173.48.114.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJElfSP018223
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:47:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795099664; bh=6HBvvlIub12wrSr52ZlJQDUQHfx6B9c7JQjlNcoZPgk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aNvEM7/WCycX4QKbTcA1DaaI6Mf21EFld8dhfYgMCqJHKmAbZOLiSzQbIS35lm8s6
	 qew5iE9JnIPX8iV2q0S59LgC+Hi6AcuAPm56IaGApuHk50Q1Oj837jtcTe4kKHY96u
	 R6/W6erKGjIKdMRleMEu43/uZJ3hH3S7C7jRWCOno8ldiOD9PtJ/jbTnO4Ld4h91xk
	 izYiEPehsr1b2KwOrU+3YQ3qAWtEZxIJATlMxKXWKgLl6kV0QB9fhKn/KO74q52jch
	 zIDfl3SpCwcG8X1sgwoGmG6ZDC/etl4043Dto0+bDp/+su73qnB7W+pF8Kvhfr+Msz
	 PDsUi4Lud+akQ==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 65C862E0197; Thu, 19 Nov 2026 09:47:33 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>, jack@suse.cz,
        adilger.kernel@dilger.ca, Jiaming Zhang <r772577952@gmail.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, libaokun@linux.alibaba.com,
        linux-kernel@vger.kernel.org, ojaswin@linux.ibm.com,
        ritesh.list@gmail.com, stable@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [PATCH v2] ext4: clear in-inode xattr space before adding the first xattr
Date: Thu, 19 Nov 2026 09:47:20 -0500
Message-ID: <179509948712.1938961.7903640953071741786.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021085635.3633692-1-r772577952@gmail.com>
References: <20261021085635.3633692-1-r772577952@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 21 Oct 2026 16:56:35 +0800, Jiaming Zhang wrote:
> An inode can hold extended attributes in the space that follows its extra
> fields, whose size is given by i_extra_isize.  When ext4 loads an inode,
> ext4_iget_extra_inode() validates that space only if it starts with the
> xattr magic, and only then sets EXT4_STATE_XATTR.  Without the magic, the
> space is treated as empty and is not checked.
> 
> ext4_xattr_ibody_set() passes the space to ext4_xattr_set_entry() whether
> or not EXT4_STATE_XATTR is set.  ext4_xattr_set_entry() walks the entries
> there to find min_offs, the lowest value offset.  That offset decides
> whether the new value fits and where the value is copied:
> 
> [...]

Applied, thanks!

[1/1] ext4: clear in-inode xattr space before adding the first xattr
      commit: ab7d0fdc084fa3812613378af181fcc047c81beb

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
