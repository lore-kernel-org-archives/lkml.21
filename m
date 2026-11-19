Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101336;
	b=yd9uOG2gYQ0RD6sgrYu9dmpNJ/6W46nrzZE1YA1iXtXmm+219vzpVlKU8UZuUYewzkpC
	 aUWh2dip3KbCNWHDl+2fdTP5ZAuY0ZQYzo0zreYFhuAvQtFPudO06Nmv7hTK8zOl3X/1b
	 b62TT5zK8VkL8h3sLtlfd/gst8vQuYwXkfVgaQUMWyLYmN3BRuDpwkCbGM4gaF2kv0n7H
	 ZNZfsi2QiwW2NbxyrEJIIfN3fdj/6WC7RpV6S/MQlsc+fa6LrYvw4GryXU558StKkDESl
	 +zKqsLJa3xrXprOhpfafKFeO4vVIKPkDa33LTjSdL7GXyG90htddWRcHlu4Vb8gPxlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101336;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=PAOoyIXuxloMyFzXEbyj4BFenlPEGjvo8fDerrpcXPw=;
	b=AAGHDJVGV4S7O3jIJIT8e2U64rlHmWJtJcA2A8HhBbdJBKtMFnkbxapuOY+MPtDViS+p
	 sX1CKZVQcOMuHq17aqsWSy2uiGGTGruTObDvZWzex6sae/A1sqwwBWGbsR5V/eT99Z6Qa
	 815C7eaWBHWO/Oin4bMw5KFO7gKDXEGh9aIrSmlHZwycMdxoBX5ZmovsgsMOcMPtU2xvM
	 Elso3Pc9SkHBBAnHBMMTG7DQ1Yr1+QshZuXoTT+QvVUVinHn5a3brJSH/ouWGQSPbFLau
	 KeHZEfsMJL0QHBFOQt9KhyndjFtcWb8j4+Hz1C0dMwMyY/6Gghcyr3Rsgqu3agypGiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=GGwysuCM;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCA860A2622
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FCA860A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=GGwysuCM
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261119151534euoutp01931ffb7bcd36be22e04caed23acb1970~peycR-Xn92744527445euoutp01B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:15:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261119151534euoutp01931ffb7bcd36be22e04caed23acb1970~peycR-Xn92744527445euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795101334;
	bh=PAOoyIXuxloMyFzXEbyj4BFenlPEGjvo8fDerrpcXPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GGwysuCMXPEPYjVeusWJL4cnqdklOJrdDsEMbcw/j3NnvHZMPeqlUcr4E/oDluULx
	 4BwDs44vQQGvR0Z6rAM3EckKj6w3zfKtvxLpq5/xho3Zacs13TyFMxW0SYJahcYFYj
	 3IyjED6THoWPLR7KO/NTPgI9Xu+NcX+iHjPMbsr0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261119151533eucas1p26a727ce85c6e07dad9cb117162de518e~peybucct00881508815eucas1p2E;
	Thu, 19 Nov 2026 15:15:33 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261119151532eusmtip1c3870825822d25974aa0874a95107a8d~peya_J3Vx2049720497eusmtip15;
	Thu, 19 Nov 2026 15:15:32 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
	<robin.murphy@arm.com>, Christoph Hellwig <hch@infradead.org>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
	Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
	<chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v3 7/8] dma-direct: do not skip cache maintenance for
 highmem pages in no-mapping allocations
Date: Thu, 19 Nov 2026 16:15:15 +0100
Message-ID: <20261119151520.2383226-8-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119151520.2383226-1-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261119151533eucas1p26a727ce85c6e07dad9cb117162de518e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261119151533eucas1p26a727ce85c6e07dad9cb117162de518e
X-EPHeader: CA
X-CMS-RootMailID: 20261119151533eucas1p26a727ce85c6e07dad9cb117162de518e
References: <20261119151520.2383226-1-m.szyprowski@samsung.com>
	<CGME20261119151533eucas1p26a727ce85c6e07dad9cb117162de518e@eucas1p2.samsung.com>

dma_direct_alloc_no_mapping() calls arch_dma_prep_coherent() only for
lowmem pages. The check was added when the DMA_ATTR_NO_KERNEL_MAPPING
handling was moved to dma-direct, because some implementations of the
hook used page_address() and could not handle highmem pages.

As a result, a buffer backed by a highmem CMA page is handed to the
device without removing the dirty cache lines covering it, which may
still be present from the previous user of the page. These lines can be
evicted later and corrupt data written by a non-coherent device.

All implementations of arch_dma_prep_coherent() now handle highmem
pages, and the hook is documented to do so; dma_direct_alloc() already
calls it on highmem pages in its remap path. Drop the check so that
highmem pages get the same cache maintenance as lowmem pages.

Fixes: d98849aff879 ("dma-direct: handle DMA_ATTR_NO_KERNEL_MAPPING in common code")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 kernel/dma/direct.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 25e9a86835fd..fea0dd36dd25 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -207,8 +207,7 @@ static void *dma_direct_alloc_no_mapping(struct device *dev, size_t size,
 		return NULL;
 
 	/* remove any dirty cache lines on the kernel alias */
-	if (!PageHighMem(page))
-		arch_dma_prep_coherent(page, size);
+	arch_dma_prep_coherent(page, size);
 	/*
 	 * return the page pointer as the opaque cookie.
 	 * Never used for unencrypted allocation
-- 
2.43.0

