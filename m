Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010482;
	b=f6dg8DEdBWOaGfgIzbC9iyzXzgDbFB4epYOW05U9LNDnTNzXP6LaClOw+dFOpqpqmA+l
	 wVZGkUk0LaLjH1p/f8EgXqucqg1EyNbrv4GmQzgGbOakw+iQaMQqfp4RsHybSoExeOVOI
	 m0CNfa0Bmo6uHNtF/sfVnoC88m2mNN0X6+jHzAH6h5aoe7mrmv8GFAtcAwXDgo4QEAmNx
	 MyXzbyaHlNVN1blZrMq5AGe4dZrhgtf1azfpHcMmj71fG9uo3fM5rV+S8AlE2ipBHi8tF
	 eQBXhRQKsocTPJnqnA/qgVUSft3byrJggVMy72Gyt9c5UNBZTKoU7ybD86vF2kzvHZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010482;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=wQ/2jUYFKVawqfmCq9N92iagih9sJQ5jouErSdo6RaA=;
	b=1j0eR5/lviPhkeX1cfmXs4qcpEvnubwBiRFY0LFnyUAs0EXfAblUoURB61lQG6HNT1wC
	 WjAzA3FPCBWipbmqRFUJf7Bt13cAMz5DmfAnRbgIUXaflGKG/cDypKyW8y8fa1TCKyz+P
	 I7HaUzTxweQTdRaVK51NRVBLYBohljgnJfR+sfKv5GxU5wfdMVUKCmRBpCTxtmTgfukS/
	 Jqy7ZzLhnz2k/sBmW22sRkSsYForNwH6oS0qwgicdB2vxVq+gEG5rz2c49Li5o3Yn5W0O
	 sYgomPi2djjhABImL4ZvwJ8xdVdkqDN0uBVZvutqgrgBgMPegvnDt8TasY3xsM1K+OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=j6sfakvh;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF87A60A2607
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF87A60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=j6sfakvh
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261118140113euoutp026d79ef3db0ef2f45965e9fc1b80f48c6~pKIPZYX0h3090130901euoutp02M
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:01:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261118140113euoutp026d79ef3db0ef2f45965e9fc1b80f48c6~pKIPZYX0h3090130901euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795010473;
	bh=wQ/2jUYFKVawqfmCq9N92iagih9sJQ5jouErSdo6RaA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=j6sfakvhYQqBwc62F20ON+yLmmkU969m7faGY2WExdknOVv4t6zj9QBspjbyFl7Cr
	 Y28Z+BAuPzwQduhMAf+aHbIROagi0aOgBBEVPXq9xW8GOi9cNKI9kEglEQ452gbjUT
	 v8WRHzwv+SI2SoGcCtf+sZN/Jv8DP0PiOgkJfqPw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261118140112eucas1p1f60a3d28537856e94a285334dc1e2f58~pKIPGQhrl2369423694eucas1p1A;
	Wed, 18 Nov 2026 14:01:12 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261118140112eusmtip29a314bd4e0df4a5648b5dcf218673c23~pKIO1YYEK1853118531eusmtip2X;
	Wed, 18 Nov 2026 14:01:12 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Marek Szyprowski
	<m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [GIT PULL] dma-mapping fixes for Linux 7.4
Date: Wed, 18 Nov 2026 15:00:59 +0100
Message-ID: <20261118140101.249506-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
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
X-CMS-MailID: 20261118140112eucas1p1f60a3d28537856e94a285334dc1e2f58
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261118140112eucas1p1f60a3d28537856e94a285334dc1e2f58
X-EPHeader: CA
X-CMS-RootMailID: 20261118140112eucas1p1f60a3d28537856e94a285334dc1e2f58
References: <CGME20261118140112eucas1p1f60a3d28537856e94a285334dc1e2f58@eucas1p1.samsung.com>

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux.git tags/dma-mapping-7.4-2026-11-18

for you to fetch changes up to 14866e632fa48a0b4c385ab0121526575eb8f88c:

  dma-pool: decrypt pages before creating the shared remap (2026-11-16 11:29:54 +0100)

----------------------------------------------------------------
dma-mapping fixes for Linux 7.4

Various fixes for the issues identified by sashiko.dev review
system in the dma-mapping helpers (Marek Szyprowski):
- added serialization to reserved memory region initialization
- fixed initialization of the shared memory for confidential
  computing memory pools
- fixed error and exit code paths

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

----------------------------------------------------------------
Marek Szyprowski (6):
      dma-coherent: serialize reserved memory pool initialization
      dma: swiotlb: Serialize restricted DMA pool initialization
      dma-pool: release CMA pages on atomic_pool_expand() error path
      dma: swiotlb: Round restricted DMA pool size down to IO_TLB_SEGSIZE
      dma: swiotlb: Properly tear down the default pool on exit
      dma-pool: decrypt pages before creating the shared remap

 kernel/dma/coherent.c | 11 ++++++++++-
 kernel/dma/pool.c     | 51 ++++++++++++++++++++++++++++-----------------------
 kernel/dma/swiotlb.c  | 35 ++++++++++++++++++++++++++++++++---
 3 files changed, 70 insertions(+), 27 deletions(-)

----------------------------------------------------------------

Thanks!

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland


