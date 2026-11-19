Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101333;
	b=nSwa9Qdpk3x2xJ3JnGT4DvnkrWqPHWvWDJbD2MsWonVwJEoy3tYyHwHOzyluyLOuY+Xr
	 XFaUX7trUPh1DHYLSzMVAwFCAPPebgcfpX/iVAlPS6ICHPffGBmKxkNX6gsZsI7axcL+R
	 jaQB5IDwhD9Y+fmzlnM3u5nP8uTWH4EpXG3aCrvipxGrDDqhQO3YMq5I6T5FX4hcZ2uHo
	 1zQesKCcF1+A4dhcUKD4BtsyGikjz5hY81iLuSJ8PyFVrcy2yIUqZ0eC+tgbEskILSAlT
	 DwU0ez0i2awdZUKXTDU3xSxunObqK4b+kauuaPRXhlnacCy1Uyr04+SbpBrRGh7hZ+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101333;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=i2GzEcfojg35eLu9fwG+rXcXBdIHA+y+JtfGhwa3unI=;
	b=BRhVUhpwe9lDhIeZsiauk0EGxZn7V1Xchnz/vlbsrQhtP4BKuzEHq2csS/E8V8ZHk2X2
	 Btm4na0pgXdgPqgqz9AVbjvkneCja5cZ8mlSAvVDdM1DAhYN0L/wyHvydN1xXm/Y4oKOO
	 NtLp5WEzuG33tn9ZtHJ3K69+1jZEbmd1+6VbA3XlsOclHe9vclJ3xLizFdz3VTERtMQAl
	 WG5WnqGfHrct0/uoXf7uK1bASoeZRFsxgj0F83fXTBepOD513oWqWos3/SNvLyTTLfp/6
	 gz1o+h4OWYTy8RUXyc+fRs8j8uOOwgjhEIiIZS9jfVvuhQOrykbRCxcCseEz3CJ22hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=BIrdkgKD;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7627606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7627606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=BIrdkgKD
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261119151531euoutp011662f190f00788e00403940b94f85698~peyZhfKXM2923629236euoutp01S
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:15:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261119151531euoutp011662f190f00788e00403940b94f85698~peyZhfKXM2923629236euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795101331;
	bh=i2GzEcfojg35eLu9fwG+rXcXBdIHA+y+JtfGhwa3unI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BIrdkgKDiOzg9gHz4gH3o71RswsACtDyyokIFJgAIiruK/ScIGGn7gw5PQAGO+dYd
	 j2Y1eSwXX7PVJfXnlE2FWNMCbk0pazaE4DXokrXPcBNeGsmiDB5DJ4rV3qaHJ6rw3H
	 YxhTaqceAru36Pwk1j9ExkFbqa6gMFxKBICN4n8s=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261119151530eucas1p1724ca5c2a4cb0e5a7d9ad91c936a2c6f~peyZMkmrr3078730787eucas1p1T;
	Thu, 19 Nov 2026 15:15:30 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261119151530eusmtip19c24465bd0b31b833b21629651ac1c4e~peyYclo922049720497eusmtip14;
	Thu, 19 Nov 2026 15:15:30 +0000 (GMT)
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
Subject: [PATCH v3 4/8] powerpc/mm: skip kmap for lowmem pages in
 __dma_sync_page()
Date: Thu, 19 Nov 2026 16:15:12 +0100
Message-ID: <20261119151520.2383226-5-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261119151530eucas1p1724ca5c2a4cb0e5a7d9ad91c936a2c6f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261119151530eucas1p1724ca5c2a4cb0e5a7d9ad91c936a2c6f
X-EPHeader: CA
X-CMS-RootMailID: 20261119151530eucas1p1724ca5c2a4cb0e5a7d9ad91c936a2c6f
References: <20261119151520.2383226-1-m.szyprowski@samsung.com>
	<CGME20261119151530eucas1p1724ca5c2a4cb0e5a7d9ad91c936a2c6f@eucas1p1.samsung.com>

With CONFIG_HIGHMEM enabled, __dma_sync_page() unconditionally goes
through __dma_sync_page_highmem(), which disables interrupts and
kmaps the buffer one page at a time. This adds needless per-page
overhead to every streaming DMA sync on such kernels.

Use the per-page kmap path only when the buffer reaches into highmem
and do a single __dma_sync() on the linear mapping otherwise.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/powerpc/mm/dma-noncoherent.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-noncoherent.c
index 30260b5d146d..3ce7dfc213d9 100644
--- a/arch/powerpc/mm/dma-noncoherent.c
+++ b/arch/powerpc/mm/dma-noncoherent.c
@@ -96,12 +96,16 @@ static void __dma_sync_page(phys_addr_t paddr, size_t size, int dir)
 	struct page *page = pfn_to_page(paddr >> PAGE_SHIFT);
 	unsigned offset = paddr & ~PAGE_MASK;
 
+	if (!size)
+		return;
+
 #ifdef CONFIG_HIGHMEM
-	__dma_sync_page_highmem(page, offset, size, dir);
-#else
-	unsigned long start = (unsigned long)page_address(page) + offset;
-	__dma_sync((void *)start, size, dir);
+	if (PageHighMem(pfn_to_page(PHYS_PFN(paddr + size - 1)))) {
+		__dma_sync_page_highmem(page, offset, size, dir);
+		return;
+	}
 #endif
+	__dma_sync(page_address(page) + offset, size, dir);
 }
 
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-- 
2.43.0

