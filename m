Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101338;
	b=46nRWVVg2z1tY5keg7c0g3iAKbzkvmPinlSjFjLjM023SdfNMYCyPTMLKhx87Mxg/YJC
	 6T61oRK/zZ2CDYw4sE5r5Mz9YOZkt4Q64dbvCub2WraGj9I78X0OZTgqpZmgCCTRAHMOy
	 H8BD2XkDjNposdKs0l2tBemHzjm1nMy1heTdtwcTpT1on0Y+mMtsqvC0zoTRX6nJt7uP9
	 SItCv9stGv8jPkTxltROdUTNYvYKB5H/mcHpXedVwOtA8X6Ge2IqPGntewUHaKj9Rpmzr
	 EL+hn0Zjznlv2Sv+4YNe3ICrAYjAyRAyOHyHBVotMeozyieWz2ZnUMVuX9Qy5PQIr6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101338;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=gxN1ZewiMpX0+b+JDMmfiinoYR53ANKzemFoRYJsP0E=;
	b=t0VDJjyHWCqEgJ4ccQORpxU9+e4SPurKtCWbMAEJVJo8k2qRrA+tyFakh32BcvGz8V04
	 H0Lm4wQg7o0aH0h3f0IWzZ0T9X5s7Mifm4OIKJsHIDpzJ7j3c9r0YwfFyApI0UcgKrIli
	 cA12m7bFHBTd/Nlqye/XcLQqDqinmSgwxg14GIpyfGl7rw2Brorcg1aMtWQqYqSqA+qZ3
	 yZOfifOkA8WKEKQBl68ojbNc2XeWyIslYo9ohhqIVgeS6L/tk88p6+I8ZGi1iOS0SME6J
	 QZQoey3JRcFUfLolSHe5J/ZgwyCRHx3V5vTEjMpxX+Gtyh9RiaAhnyike8iyOmRuv+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=W0k80mXX;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E532960A3809
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E532960A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=W0k80mXX
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261119151530euoutp02f398e44f8e3b2a2058303c9f7139b410~peyY2jkEJ1775617756euoutp02N
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:15:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261119151530euoutp02f398e44f8e3b2a2058303c9f7139b410~peyY2jkEJ1775617756euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795101330;
	bh=gxN1ZewiMpX0+b+JDMmfiinoYR53ANKzemFoRYJsP0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W0k80mXX9Fa+Mxf2KZvYR6uhNbHFqnZD7NuK7smpqMh0PUiJO5G1NNlTpak412S/B
	 VW3zADU/wlkqlTRNDXLJr/bQ5duU2E6+i3atkY8BuGzMECUIQ4EbUAOdvPFM24aYeC
	 vHoXtUpzFc/S1Akz/7tXAnTKFZ36LSVdkmosQtoQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261119151530eucas1p1c9ea2bbd100b25bb9c3e442717068c01~peyYW1ZF43080130801eucas1p1U;
	Thu, 19 Nov 2026 15:15:30 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261119151529eusmtip15d80844270716648685b6c396bde9947~peyXm2s7I2051120511eusmtip1k;
	Thu, 19 Nov 2026 15:15:29 +0000 (GMT)
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
Subject: [PATCH v3 3/8] MIPS: mm: handle highmem pages in
 arch_dma_prep_coherent()
Date: Thu, 19 Nov 2026 16:15:11 +0100
Message-ID: <20261119151520.2383226-4-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261119151530eucas1p1c9ea2bbd100b25bb9c3e442717068c01
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261119151530eucas1p1c9ea2bbd100b25bb9c3e442717068c01
X-EPHeader: CA
X-CMS-RootMailID: 20261119151530eucas1p1c9ea2bbd100b25bb9c3e442717068c01
References: <20261119151520.2383226-1-m.szyprowski@samsung.com>
	<CGME20261119151530eucas1p1c9ea2bbd100b25bb9c3e442717068c01@eucas1p1.samsung.com>

arch_dma_prep_coherent() performs the cache maintenance on the address
returned by page_address(). On 32-bit MIPS with CONFIG_HIGHMEM the kernel
uses HASHED_PAGE_VIRTUAL, so page_address() returns NULL for a highmem
page that is not kmapped, and dma_cache_wback_inv() then operates on
the virtual range starting at 0 instead of the buffer, leaving any dirty
cache lines of the buffer in place.

Highmem pages do reach this function: dma_alloc_contiguous() can return
a highmem CMA page, which dma_direct_alloc() handles by forcing the remap
path and calling arch_dma_prep_coherent() on that page before creating
the uncached mapping. Since commit f5ff79fddf0e ("dma-mapping: remove
CONFIG_DMA_REMAP") this path is available on all MMU architectures,
including MIPS, which previously rejected highmem CMA pages.

Fix this by reusing dma_sync_phys(), which already handles highmem pages
by mapping them one page at a time with kmap_atomic(). For lowmem pages
it does a single dma_cache_wback_inv() over the whole range, so the
behaviour is unchanged there.

Fixes: f5ff79fddf0e ("dma-mapping: remove CONFIG_DMA_REMAP")
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/mips/mm/dma-noncoherent.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index 30ef3e247eb7..d8e5bc85bb3b 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -44,11 +44,6 @@ static inline bool cpu_needs_post_dma_flush(void)
 	}
 }
 
-void arch_dma_prep_coherent(struct page *page, size_t size)
-{
-	dma_cache_wback_inv((unsigned long)page_address(page), size);
-}
-
 void *arch_dma_set_uncached(void *addr, size_t size)
 {
 	return (void *)(__pa(addr) + UNCAC_BASE);
@@ -127,6 +122,11 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 	dma_sync_phys(paddr, size, dir, true);
 }
 
+void arch_dma_prep_coherent(struct page *page, size_t size)
+{
+	dma_sync_phys(page_to_phys(page), size, DMA_BIDIRECTIONAL, true);
+}
+
 #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
-- 
2.43.0

