Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099696;
	b=n64a/QMqWVn3YTy0TKSTR0BZMDhSAZY8vqOyFGagiqnfJopxAv9w0tiZQ+PKm3gAriP6
	 tq35rT5XbU8xnGxJcyWIsovVKsZtWfcVIhmz7WG+RBVwwEWTG6l4nu75FG39QGAt0kAXU
	 f+7/XH9jLPvMRzFIDJUOqzRoLAm+PE+Y264/oO8RFpt98Tou3yoxhYtyzf4VXrpy5ixf8
	 8/NhQJhurjN22vGBU38MoEx+fYHmJlBX1dq+qRhawcF0y7jiIR6d0YduS65aOI8X8EyOT
	 wpG1vQIqIiOKPZtxewEE9klj8wEBqMD5S1UDsx0cfvSF7MiDUvprx+9ogqN/xAUdl6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=FZ6TvTj2l2k7OQkE238MtaeNlSEmFIdYntk0TxQZ5a8=;
	b=pL5FaAuU7t3icy9ZCG1bsAtYm6pLBa7dyAmtan8FADxeBRMM+EvSRr9jgrnsP8VOpWym
	 /2XvsvM4AJpIf/Ts2FWKRbF+qXC28MUhiohuIvwEfRk5qo8ceIkstGw3etlUea3VfLnlI
	 wBAPry7hYkZFLdFsFhk3B6JgOvnGllLobSD9XfWK+X6+U4XbPTeS/Sr4Zq3Ru/XXctgoB
	 dPTxyU4kBuGNJr8Vf1ntTPpsDc2wS4wS0WBNxq06KQGtTdPXbrQjZhQnU1DbN0TqeriAV
	 gCmvpjiDnk5WL8WKt6pysWNqQzFNoj7PQ9R0fnK6taTCfqA4KSem5rihCcOTHFZ50Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=cr2iEDjy;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC7D606C335
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC7D606C335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=cr2iEDjy
Received: from trampoline.thunk.org (pool-173-48-114-214.bstnma.fios.verizon.net [173.48.114.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJElcB7017979
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795099661; bh=FZ6TvTj2l2k7OQkE238MtaeNlSEmFIdYntk0TxQZ5a8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cr2iEDjylkvib2YyFvJByFT+p2xHROA328ySzQKeDa0hKULR2u3JnSeopsgrZtMdp
	 px6PEfEjvGNCCqWXTbzlDfKJemiNP3SZ3vGmeXvg3TjPGRjJd5kFkvHpoutQguy/pY
	 GrGFUJQzugknf9Wa8zSnC1lPudH2E/0qXiCAXNzMNVlZuSP1oXL2nQsjb4c65XtzDv
	 gLVwAGRHfjglkWpzq3i+sCaUyvsBTb9ZjltAR3fluBYxHksHDlBxWU/gakvr5WWwOB
	 DwrRYy3SmXFOMg1kIMDayY6eiWCrKLSwe4KKSDomv7s9GhOfG5J+P9HFTBnUcifxzN
	 xPWMLF2Ad2Z1g==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id EEC4B2E0158; Thu, 19 Nov 2026 09:47:32 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, adilger.kernel@dilger.ca,
        libaokun@linux.alibaba.com, jack@suse.cz, ojaswin@linux.ibm.com,
        ritesh.list@gmail.com, yi.zhang@huawei.com, djwong@kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ext4: preserve force-fsck requests across unmount
Date: Thu, 19 Nov 2026 09:46:49 -0500
Message-ID: <179509948720.1938961.7467339538966692480.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027035857.72265-1-dennylin0707@gmail.com>
References: <20261027035857.72265-1-dennylin0707@gmail.com>
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


On Tue, 27 Oct 2026 03:58:57 +0000, Hungyu Lin wrote:
> EXT4_TUNE_FL_FORCE_FSCK sets EXT4_ERROR_FS in the on-disk superblock
> but leaves s_mount_state unchanged. On a normal read-write unmount,
> ext4_put_super() restores s_state from s_mount_state, clearing the
> requested flag.
> 
> As a result, a successful EXT4_IOC_SET_TUNE_SB_PARAM call can be lost
> before e2fsck runs: after unmount it treats the filesystem as clean
> and skips the requested check.
> 
> [...]

Applied, thanks!

[1/1] ext4: preserve force-fsck requests across unmount
      commit: fe66a3e2a6627bef578137722f430bd633dee3e5

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
