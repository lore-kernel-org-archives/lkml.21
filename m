Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=165.204.217.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026510;
	b=L4BUrwzH/Wy/0BY02tboGXAzfF1Kxwpbj2H8UsfMDHi1tSsH0QKGxvXXrSJxVu0JcrE1
	 gIaIC0ITwL++fRRQE6uHtTS4Y46fw+bBt3HMonu/A6oG20ctmpZQu7piluwLu0UGIm3Bd
	 DM0udlbtH4Zd40el2KIqks2yl/z8hGYBb2OBs2YLvblZO0K5FPnRswO+McrGtnNL9Qibu
	 +9QcOKi/ZoqIzk3Bs4CEdYxDjX26uMOo19FYI+N0e1rLqQBIytvKyWQe+dmUdAhlJ825d
	 VE8gAUYM4q1mFaOR/AtvOLCHCIXOF9JTBSuKSGC8KUDFcSltKeYSSXdO+mT4SYJdsFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026510;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Qf4RKFZTv3ZBg8vCBP+Sc5gSgd36ZuU6rU4YWRT/FAQ=;
	b=N9J48P5xcU1fcV78F3K74ftq/NzRosGzOtiSN7ZqXLDdIx+Gn1K9YyjFSOADt/whUPzg
	 B+V7RYLv8BM1IKgutAhWCHM740Vy0NYIg6RkiI0oG96wzMZaeQQ5i8r03rSS8U1IaR0g+
	 hP6e4u1DtTl5StOkmxCYjRymDL5O+vIWMnOfPG+2tKTxATrqbEWKvjutMaFUa5btzk5lD
	 AQ4T11ExFyvkPCqoxNK5NzOXxfjHqy0Uv/x62hti7kIVr3ebaUM2S/QRnNGlwH3Ajsnzr
	 DbDbGxuii6zuaQUlplWAfY3KGcvVVOTOBwfxux4UfGQbLBDBbYQTRLad/2iIaGQ64uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=amd.com;
	spf=none smtp.mailfrom=aocl-turin-03-9e62.amd.com;
	arc=none smtp.remote-ip=165.204.217.251
Received: from aocl-turin-03-9e62.amd.com (unknown [165.204.217.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D26D606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D26D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=aocl-turin-03-9e62.amd.com
Received: by aocl-turin-03-9e62.amd.com (Postfix, from userid 1000)
	id B35F2172044D; Wed, 18 Nov 2026 18:28:25 +0000 (UTC)
From: "S. Biplab Raut" <Biplab.Raut@amd.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>,
	Gao Xiang <xiang@kernel.org>,
	hsiangkao@linux.alibaba.com,
	Nick Terrell <terrelln@meta.com>,
	Yann Collet <yann.collet.73@gmail.com>,
	guoxuenan@huawei.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] lib/lz4: backport upstream fast decode loop
Date: Wed, 18 Nov 2026 18:28:25 +0000
Message-ID: <20261118182825.1641673-1-Biplab.Raut@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114171452.1484344-1-Biplab.Raut@amd.com>
References: <20261114171452.1484344-1-Biplab.Raut@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrew,

Please drop this patch.  As you suggested, I compared notes with Michal
Wilczynski's series [1], and I'll contribute there instead of carrying
a parallel backport.  His series vendors upstream LZ4 v1.10.0, which
brings the same fast decode loop together with the in-place margin
change this patch lacked, so it supersedes this one.

On the three review points against this patch, two are real bugs in
this v2 and the third is a divergence from upstream.

I've posted KUnit tests for lib/lz4 on top of Michal's series, in his v2
thread ("lib/lz4: add KUnit tests for compression and decompression").
They cover the first two points.  They also port upstream's worst-case
in-place test: upstream has since raised its own margin to + 65 for the
64-byte wild copies its decoder makes since v1.11.0 [2], so the kernel's
margin will need the same change if lib/lz4 is re-synced past v1.10.0.

[1] https://lore.kernel.org/r/20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com
[2] https://github.com/lz4/lz4/pull/2104

Thanks,
Biplab
