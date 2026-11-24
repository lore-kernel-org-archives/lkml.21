Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532520;
	b=W9p0vTUDcmA5CaYk8+R5JhociNR2fbBwExx2rIwA3euvfJQR/UTzSoPBbwEYLRnNklHK
	 F6ZSyXewYCxK002DEDPbo8EvofbJYRCLFePAzcEw68ow6vt57YBYqKyL9lF+7x1mIeB2M
	 xGYOUgKPjR596wIH+FhaZMDUh0GBo1AcwFvpPTAjO9/hYStN89JmL3OY2kcW6e4BIfuO8
	 3EAiCy5uFqSc55mKyZ1kHDC7Bq4JwsS6VmrMS2FuNqB0C+Qgf3XdkCF3xpdrYwJk2s785
	 gr5euLZvJhrBV/zp33/UGRFNpVjRQj1//46rFoX/FOeOTJwaD2c9f2pBzKZbuvFlEJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532520;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=bpN98SL1MCwWUh8dbQ9cdj1LeUak/IvNk2HcKSVXVCU=;
	b=KKYUkL9S63zfJdwBarBBZLe14uxjTJMkWkZSklq1idB5SH5BnYnCU4TcT6UIn35jRMmM
	 3sK38O7qAIVtrZJRkr9QBh4FrfwO08Kcmk2ZphkeTnYflM28g3omZSMMbJaN5tS6+GH8u
	 05yx6eSMYyh8S2p+kGL6R0ed/5vNE77aYswdnwwLJcVUaH/VWggw4DHF6/tEalF6SZ5rz
	 yJM6fokEH3T/XVc7uXY4vbUzNDInDSokiplhwXzsXtR3/HqRHPoZ1GOsEC5FEhU+QJlxe
	 nL2yHsAylkuasxsSV8zBrJiH/+VKjmKe5BiSKYk+p7SwhuQqOaz/s2s13k/tFKqQV/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CvpqEnSe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD07606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CvpqEnSe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46441F000C6;
	Tue, 24 Nov 2026 15:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795532519;
	bh=bpN98SL1MCwWUh8dbQ9cdj1LeUak/IvNk2HcKSVXVCU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=CvpqEnSeLHdFWrDFKh4NESXYRXxCNwsUxH1ZphnZjzzbCIqUtfW6dlKYZGajy8KQk
	 RfX6y0ZICxAhtoFbDmsWSn8mWAtDMJO5djVWCae7DM0njZOPcxAnbVRf7hwteiRjL6
	 v4WP+z2OLTf9dT8LohKTNHFGAvFEZF8vkxsqSiIJJO+IaBPVBwKat9UIi1tk7NgVww
	 fyMQZRSt/jhG0yxsupW2BsSVIR3ythnN1476qB+ZvbJJIUM0k40Hnb73E1h50dCuqG
	 UkfjY5pWlgVb0OQ3D7ZXZT6+h+hl4TRSnJ7AAAHBI9DtV0Uktm2+YeQUj5mBZEru+f
	 MEzhXdmMt1Jvw==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Srivatsa S. Bhat (Microsoft)" <srivatsa@csail.mit.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,  Baoquan He
 <baoquan.he@linux.dev>,  Mike Rapoport <rppt@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Pratyush Yadav <pratyush@kernel.org>,
  Alexander Graf <graf@amazon.com>,  kexec@lists.infradead.org,
  linux-mm@kvack.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MAINTAINERS: Add missing files to KDUMP subsystem
In-Reply-To: <20261124-fix-kexec-kdump-maintainers-v1-2-79c6a6144de4@csail.mit.edu>
	(Srivatsa S. Bhat's message of "Tue, 24 Nov 2026 01:37:54 +0530")
References: <20261124-fix-kexec-kdump-maintainers-v1-0-79c6a6144de4@csail.mit.edu>
	<20261124-fix-kexec-kdump-maintainers-v1-2-79c6a6144de4@csail.mit.edu>
Date: Tue, 24 Nov 2026 15:01:56 +0000
Message-ID: <2vxzbj7ez317.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Nov 24 2026, Srivatsa S. Bhat (Microsoft) wrote:

> The KDUMP entry covers crash-reservation code and the vmcore interface,
> but omits the crash-reservation header and the vmcoreinfo implementation
> and header. It also omits the dedicated kexec/kdump and vmcoreinfo sysfs
> ABI documentation.
>
> Add these files to KDUMP so that scripts/get_maintainer.pl can recommend
> the subsystem maintainers and kexec mailing list for changes to them.
>
> Signed-off-by: Srivatsa S. Bhat (Microsoft) <srivatsa@csail.mit.edu>

Thanks!

Acked-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
