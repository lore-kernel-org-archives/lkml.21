Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799739;
	b=eO4fnzHbjn53ocqSmwCnDxlV6Hwh39D5uRsyfJ57Nx7AXBnyvjm0iqVaUG0NKhJeJAX1
	 978vuT3s9EQOhJujBofAGFfVJJHO+jAA6mvNLt3DXYGrf0MwkDBHzAqNjcjp3ylgjbfZZ
	 Tqdnk7+hnzaELwZqDoNSk7399zINFx3o/paSkvarGceHaQvw9Krh+hTPvRaMKaYs/2A6k
	 +mMqNn8H/O6xvkyNujeWKkoOdvSyyYK9A8Sl7Xt4pfkdqmxtdwZBhbQwFa6i7rjS6yq6C
	 CqmbOw+UIGrDeaGE6Ktau3H9SkhnUAUdogDpvos8XqhZx3wUx3fXJPpvonwx1Q++hjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799739;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=KytjIuTnNAUcC2+yr4qMHng6hLmZHKp8pJkTxpSN+lw=;
	b=v13wcUwdq8sZzYwBpOQWQHylcyq6vMcZxaiWYeTbm69dsnA3LyR5h7vcM3L4Sh8jOnUf
	 mUqT1HNxc2wlDPGAPLDPdjvKmUCF0r1wAJwMkWD1NlsSc6/lr6u9x74oIb3Ou9mv3iyUt
	 WofO31I9/bE3hRf7axgLNji4krl9akLrJBof90MtujkxmhWIpW33NQXvgyofzcB5CcRz1
	 fmAqT5DBLG+wlRpy7JBlj+HXXckr1TNyTWq/M9qKrRnydFEOl7U6uAI40coujRqsdAHwo
	 8F7Q5CbVKN8oFky+irl9ZRuu+nLjCrAECevC6qGdfykDpC+pv5LgIYUUO1Cq+FSqJlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=gtolZfOu;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FE0606A330
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90FE0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=gtolZfOu
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261127171535euoutp0282ba2e3f01d787e9be8a362eb3107880~r9lhVAePw0537405374euoutp02s
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:15:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261127171535euoutp0282ba2e3f01d787e9be8a362eb3107880~r9lhVAePw0537405374euoutp02s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795799735;
	bh=KytjIuTnNAUcC2+yr4qMHng6hLmZHKp8pJkTxpSN+lw=;
	h=From:To:Cc:Subject:Date:References:From;
	b=gtolZfOubwLZRgg/GZ8r5+fTpi841x+AGvezlU/9xBxz8ZwMGMcK+0Evfw8WJ49NB
	 QD1kipBM+bSNaQzGhEvcpGKOYQcrpEnYmaLGfWkkdyygwmYh/ePc0iWwMkuxwA1TUr
	 wgiMDt+lHHC6V1V/pzdOCksg4Ai3X9BiJseKii44=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261127171534eucas1p1adc65490fcfb09b573d27aaa834f2912~r9lf2IqVo1591815918eucas1p1H;
	Fri, 27 Nov 2026 17:15:34 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261127171533eusmtip233350304d37e3b8d712d3f184b49b3da~r9lfRYG2J2536825368eusmtip2I;
	Fri, 27 Nov 2026 17:15:33 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
	<robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe
	<jgg@nvidia.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Honglei Huang
	<honghuan@amd.com>, prakash.gupta@oss.qualcomm.com, stable@vger.kernel.org
Subject: [PATCH v2] iommu/dma: restore flush queue use in dma_iova_destroy()
Date: Fri, 27 Nov 2026 18:15:28 +0100
Message-ID: <20261127171529.2917893-1-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261127171534eucas1p1adc65490fcfb09b573d27aaa834f2912
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261127171534eucas1p1adc65490fcfb09b573d27aaa834f2912
X-EPHeader: CA
X-CMS-RootMailID: 20261127171534eucas1p1adc65490fcfb09b573d27aaa834f2912
References: <CGME20261127171534eucas1p1adc65490fcfb09b573d27aaa834f2912@eucas1p1.samsung.com>

Commit 1acce29926d9 ("iommu/dma: simplify dma_iova_destroy() and drop
the free_iova helper") turned dma_iova_destroy() into dma_iova_unlink()
followed by dma_iova_free(). Before it, the destroy path marked its
IOTLB gather as queued for DMA-FQ domains, skipped iommu_iotlb_sync()
and handed the IOVA over to the flush queue, exactly like
__iommu_dma_unmap(). After it:

  - dma_iova_unlink() never queues its gather and always calls
    iommu_iotlb_sync() after iommu_unmap_fast(),
  - dma_iova_free() passes a NULL gather to iommu_dma_free_iova(), so
    the IOVA goes straight back to the allocator via free_iova_fast().

DMA-FQ domains therefore get strict invalidation on this path. This
includes blk_rq_dma_map(), which NVMe uses for all data transfers, so
iommu.strict=0 has no effect on NVMe I/O. On a Qualcomm Glymur CRD
(SMMUv3 without RANGE_INV, 4K pages, NVMe on PCIe Gen5 x4) sequential
fio throughput drops from 10.6/11.9 GiB/s (write/read) to the strict
mode level of ~2.7 GiB/s.

Fix this by letting dma_iova_destroy() unmap the linked range into its
own gather, queued for flush queue domains like in __iommu_dma_unmap(),
and retire that gather together with the IOVA free: either by
iommu_iotlb_sync(), or by handing the IOVA space (and any page table
pages released by the unmap) over to the flush queue via queue_iova().
The whole reservation is still freed, keeping the size fix of the
mentioned commit.

A gather must always be retired, either by iommu_iotlb_sync() or by
handing it to the flush queue together with the IOVA, and the IOVA must
never be returned to the allocator while a queued invalidation for it is
still pending. To keep that obvious, the internal unlink helper only
unmaps into a gather supplied by its caller, and each caller retires it
right away: dma_iova_destroy() syncs or queues it together with the IOVA
free, while dma_iova_unlink() always uses a never queued gather and
syncs it, as the unlinked range remains owned by the caller and may be
linked again immediately.

Consequently dma_iova_free(), and dma_iova_destroy() with nothing
mapped, keep returning the IOVA directly to the allocator: no queued
gather was ever created for it, so there is no deferred invalidation to
wait for.

Fixes: 1acce29926d9 ("iommu/dma: simplify dma_iova_destroy() and drop the free_iova helper")
Reported-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Closes: https://lore.kernel.org/all/20261125135120.1126571-1-sibi.sankar@oss.qualcomm.com/
Cc: stable@vger.kernel.org # v7.3+
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
The series has been developped with an aid of LLM, build tested on arm64
and x86_64. Sibi, it would be great if you could rerun your fio test on
top of it.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland


Changelog:
v2:
- dma_iova_free() and dma_iova_destroy() with nothing mapped return the
  IOVA directly to the allocator instead of the flush queue, as there is
  no deferred invalidation to wait for (pointed out by Sashiko review)
- dropped DMA_IOVA_USE_FQ flag and flags related rework (pointed out by
  Jason)

v1: https://lore.kernel.org/all/20261127115849.2780625-1-m.szyprowski@samsung.com/
---
 drivers/iommu/dma-iommu.c | 100 +++++++++++++++++++++++++++-----------
 1 file changed, 72 insertions(+), 28 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 78742aeba932..44fa02c35bad 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1857,6 +1857,19 @@ bool dma_iova_try_alloc(struct device *dev, struct dma_iova_state *state,
 }
 EXPORT_SYMBOL_GPL(dma_iova_try_alloc);
 
+static void __dma_iova_free(struct device *dev, struct dma_iova_state *state,
+		struct iommu_iotlb_gather *gather)
+{
+	struct iommu_domain *domain = iommu_get_dma_domain(dev);
+	struct iommu_dma_cookie *cookie = domain->iova_cookie;
+	struct iova_domain *iovad = &cookie->iovad;
+	size_t iova_start_pad = iova_offset(iovad, state->addr);
+	size_t size = dma_iova_size(state);
+
+	iommu_dma_free_iova(domain, state->addr - iova_start_pad,
+			iova_align(iovad, size + iova_start_pad), gather);
+}
+
 /**
  * dma_iova_free - Free an IOVA space
  * @dev: Device to free the IOVA space for
@@ -1871,14 +1884,12 @@ EXPORT_SYMBOL_GPL(dma_iova_try_alloc);
  */
 void dma_iova_free(struct device *dev, struct dma_iova_state *state)
 {
-	struct iommu_domain *domain = iommu_get_dma_domain(dev);
-	struct iommu_dma_cookie *cookie = domain->iova_cookie;
-	struct iova_domain *iovad = &cookie->iovad;
-	size_t iova_start_pad = iova_offset(iovad, state->addr);
-	size_t size = dma_iova_size(state);
-
-	iommu_dma_free_iova(domain, state->addr - iova_start_pad,
-			iova_align(iovad, size + iova_start_pad), NULL);
+	/*
+	 * Nothing is linked anymore and every dma_iova_unlink() has already
+	 * invalidated the IOTLB synchronously, so there is no deferred
+	 * invalidation to wait for and the IOVA can be reused right away.
+	 */
+	__dma_iova_free(dev, state, NULL);
 }
 EXPORT_SYMBOL_GPL(dma_iova_free);
 
@@ -2097,27 +2108,20 @@ static void iommu_dma_iova_unlink_range_slow(struct device *dev,
 		arch_sync_dma_flush();
 }
 
-/**
- * dma_iova_unlink - Unlink a range of IOVA space
- * @dev: DMA device
- * @state: IOVA state
- * @offset: offset into the IOVA state to unlink
- * @size: size of the buffer
- * @dir: DMA direction
- * @attrs: attributes of mapping properties
- *
- * Unlink a range of IOVA space for the given IOVA state.
+/*
+ * Unmap a range of IOVA space into @gather. The caller owns @gather and must
+ * retire it, either by iommu_iotlb_sync() or, for a queued gather, by handing
+ * it over to the flush queue together with the IOVA via iommu_dma_free_iova().
  */
-void dma_iova_unlink(struct device *dev, struct dma_iova_state *state,
+static void __dma_iova_unlink(struct device *dev, struct dma_iova_state *state,
 		size_t offset, size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
+		unsigned long attrs, struct iommu_iotlb_gather *gather)
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
 	dma_addr_t addr = state->addr + offset;
 	size_t iova_start_pad = iova_offset(iovad, addr);
-	struct iommu_iotlb_gather iotlb_gather;
 	size_t unmapped;
 
 	if ((state->__size & DMA_IOVA_USE_SWIOTLB) ||
@@ -2125,14 +2129,38 @@ void dma_iova_unlink(struct device *dev, struct dma_iova_state *state,
 	     !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))))
 		iommu_dma_iova_unlink_range_slow(dev, addr, size, dir, attrs);
 
-	iommu_iotlb_gather_init(&iotlb_gather);
-
 	size = iova_align(iovad, size + iova_start_pad);
 	addr -= iova_start_pad;
-	unmapped = iommu_unmap_fast(domain, addr, size, &iotlb_gather);
+	unmapped = iommu_unmap_fast(domain, addr, size, gather);
 	WARN_ON(unmapped != size);
+}
 
-	iommu_iotlb_sync(domain, &iotlb_gather);
+/**
+ * dma_iova_unlink - Unlink a range of IOVA space
+ * @dev: DMA device
+ * @state: IOVA state
+ * @offset: offset into the IOVA state to unlink
+ * @size: size of the buffer
+ * @dir: DMA direction
+ * @attrs: attributes of mapping properties
+ *
+ * Unlink a range of IOVA space for the given IOVA state.
+ */
+void dma_iova_unlink(struct device *dev, struct dma_iova_state *state,
+		size_t offset, size_t size, enum dma_data_direction dir,
+		unsigned long attrs)
+{
+	struct iommu_iotlb_gather iotlb_gather;
+
+	/*
+	 * The IOVA range stays owned by the caller and may be linked again
+	 * right away, so the IOTLB has to be invalidated synchronously even
+	 * for flush queue domains. The gather is therefore never queued and
+	 * is retired right here.
+	 */
+	iommu_iotlb_gather_init(&iotlb_gather);
+	__dma_iova_unlink(dev, state, offset, size, dir, attrs, &iotlb_gather);
+	iommu_iotlb_sync(iommu_get_dma_domain(dev), &iotlb_gather);
 }
 EXPORT_SYMBOL_GPL(dma_iova_unlink);
 
@@ -2152,14 +2180,30 @@ void dma_iova_destroy(struct device *dev, struct dma_iova_state *state,
 		size_t mapped_len, enum dma_data_direction dir,
 		unsigned long attrs)
 {
-	if (mapped_len)
-		dma_iova_unlink(dev, state, 0, mapped_len, dir, attrs);
+	struct iommu_domain *domain = iommu_get_dma_domain(dev);
+	struct iommu_iotlb_gather iotlb_gather;
+
+	iommu_iotlb_gather_init(&iotlb_gather);
 
 	/*
 	 * We can be here if the first call to dma_iova_link() failed and
 	 * there is nothing to unlink, so let's be more clear.
 	 */
-	dma_iova_free(dev, state);
+	if (mapped_len) {
+		iotlb_gather.queued = READ_ONCE(domain->iova_cookie->fq_domain);
+		__dma_iova_unlink(dev, state, 0, mapped_len, dir, attrs,
+				&iotlb_gather);
+	}
+
+	/*
+	 * Retire the gather together with the IOVA, like __iommu_dma_unmap()
+	 * does: either invalidate the IOTLB now, or hand the IOVA space and
+	 * any page table pages released by the unmap over to the flush queue,
+	 * so the IOVA cannot be reused before the deferred invalidation.
+	 */
+	if (!iotlb_gather.queued)
+		iommu_iotlb_sync(domain, &iotlb_gather);
+	__dma_iova_free(dev, state, &iotlb_gather);
 }
 EXPORT_SYMBOL_GPL(dma_iova_destroy);
 
-- 
2.43.0

