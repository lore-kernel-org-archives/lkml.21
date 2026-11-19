Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.101.131.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070319;
	b=zBBa2JVpfHQbA54olpWucCfG5XdZ6PM1TOTHL1fZ8V/S45uq9nQpjxNzO7j+nx/luxsA
	 Pkx7XRtvuSL1IjbqOZu+dSJ+/C+HvvZLLGSMgZ4WYe0056Qqb19K0XtFp7C5tYTI/Cpur
	 aMhWQMOWQoEk+kjJ2ED5GIyLeMeDh+QUy7bPJJFfFhz3l354w2Cw9OtxU+i/2NE7procY
	 7DE1MocgKeTSG+y/9zUvDgtvdlD8uelgZwowijNtEQITnsgUz4TS4/Aiz/i8vmJo49kuq
	 FQaELMKRLmT5blt8T3trB9zmOyeHLAwN3Bar9sLIWGefFIR+oX6Nd+NlSwnFdVXCZ+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070319;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+4Lm1j9czUDMGXfMKQZThbTqAaYkDXrh7VxBy05kOuI=;
	b=XXIPd8oDuTDLTgKs4yZ2uQJMjv0KsqkQNevjHHNCYqbOUwL44m/ST1u9S12YGOtmzzmi
	 3Nk2bMYN3nfSqvr7srGeM7PNIDbwdt4VyBdTTDT6bqkTqcXYmG8gqcbjm1lcBrSOB+tMl
	 M8KjSgfxbaiQlLQEpFfcr5mZXusntAHWYjIoLk00vXL38jqu+df6gYcf7ORN67Y6BKvCo
	 OQr2LJZR7CcHY5IklELaTy/eE3xlI4o+9dNTGiUWhOuYhjqchoaQ1cur2nFZrly1lCWRe
	 oUAN9rdPHqegt12cvCZZSEUGTofeX1JYDHGsG79c4DZiA+JKnEm+UvXet6tRUN+d+VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=citrix.com;
	spf=pass smtp.mailfrom=citrix.com;
	arc=none smtp.remote-ip=160.101.131.9
Received: from na1pdmzitismtp02.tibco.com (unknown [160.101.131.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5B1606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B5B1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Received: from cdev-nkg (unknown [10.113.40.46])
	by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 35C12852CB0A;
	Thu, 19 Nov 2026 01:37:06 -0500 (EST)
From: Lin Liu <lin.liu01@citrix.com>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	andrew.cooper3@citrix.com,
	ross.lagerwall@citrix.com,
	xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] xen/swiotlb: Bounce mappings that cross the segment boundary
Date: Thu, 19 Nov 2026 06:38:32 +0000
Message-ID: <4a2d59f8d5a2b1399fc8bdf6e49202c9c2f394a7.1795069501.git.lin.liu01@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <807c3b040b02d7d89f1cac76eb137afbee91015d.1794573814.git.lin.liu01@citrix.com>
References: <807c3b040b02d7d89f1cac76eb137afbee91015d.1794573814.git.lin.liu01@citrix.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The block layer applies a device's DMA segment boundary to
pseudo-physical addresses, but in a Xen PV domain the bus address is the
machine address.  A segment that is contiguous in both spaces can still
cross the boundary in machine space and reach the device.  AHCI declares
a 4 GiB boundary, and controllers that do not carry across it (e.g.
Marvell 88SE9230) then DMA the tail of the transfer 4 GiB too low.

Bounce such streaming mappings.  Coherent allocations need no check:
they are naturally aligned in bus space (range_requires_alignment()), so
they cannot cross a boundary they fit in.

Signed-off-by: Lin Liu <lin.liu01@citrix.com>
---
v2:
- Only check streaming mappings; coherent allocations are naturally
  aligned in bus space and cannot cross the boundary (Ross, Jürgen).
- Leave range_straddles_page_boundary() unchanged.
- Comment why alloc_coherent needs no boundary check (Jürgen).

 drivers/xen/swiotlb-xen.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index e2538824e..5041be7d3 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -96,6 +96,15 @@ static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
 	return 0;
 }
 
+/* Bus-contiguous, but may still cross the device's segment boundary */
+static inline bool range_crosses_seg_boundary(struct device *dev,
+					      dma_addr_t dma, size_t size)
+{
+	unsigned long mask = dma_get_seg_boundary(dev);
+
+	return size && ((dma ^ (dma + size - 1)) & ~mask);
+}
+
 static struct io_tlb_pool *xen_swiotlb_find_pool(struct device *dev,
 						 dma_addr_t dma_addr)
 {
@@ -157,6 +166,7 @@ xen_swiotlb_alloc_coherent(struct device *dev, size_t size,
 	phys = virt_to_phys(ret);
 
 	*dma_handle = xen_phys_to_dma(dev, phys);
+	/* No seg boundary check: __get_free_pages() is naturally aligned */
 	if (*dma_handle + size - 1 > dma_mask ||
 	    range_straddles_page_boundary(phys, size) ||
 	    range_requires_alignment(phys, size)) {
@@ -234,6 +244,7 @@ static dma_addr_t xen_swiotlb_map_phys(struct device *dev, phys_addr_t phys,
 	if (dma_capable(dev, dev_addr, size, true, attrs) &&
 	    !dma_kmalloc_needs_bounce(dev, size, dir) &&
 	    !range_straddles_page_boundary(phys, size) &&
+	    !range_crosses_seg_boundary(dev, dev_addr, size) &&
 		!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
 		!is_swiotlb_force_bounce(dev))
 		goto done;

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.52.0

