Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441302;
	b=jn9RMjOWtEyTzmm6PRjZ12EqNCzwsYaDqjj/XQDn8+mLK54vbxl0aF6Nr9WPmRVmboBg
	 A/e8YnCTitJZyc6QVhdmIlxEKcCXUtTutdvhzMF3KamHzjvK/zE7IRxZ0nu969uyZRm36
	 x8GrnLkzewvk8tNouCMuOPWOR4/dKlmFKNXUHvxC2I6yy++e3d0xZmQiyXnSZG/r5oAF+
	 9oBpsWweGQkEr1qY+QYrd6ENhwEoqfuLzDV2SvKmISrLJc3HBHVUMVTi2EFrT5HwB3kZq
	 vcyULhlYAbIhBdSTV8WZlrmocY8jvA5cdufYSqliIqMHG8h03V5EfWxfNgSBy5e/vwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=grepWVLzeUBtCj/pUc0eCATuCcMmtVEX4tnzLZWc9aU=;
	b=a9PoFQ1ppZcD20iMUtJjNMShLT6MQCl/kClqKHMktUbJUNVqMB1VcUwKO51Ah8N2cmSU
	 NshX9jQ1Lq77MY/lVOLYepTlygShluVxBfHVnS+Fp4iubLqvNSrQxUA6xrWQQmCL+jqjv
	 iHEeVUWwd9HtCqbwo28gKvJ7UKt+zZD8mQPciggISjNc+YWYgnl3AzPlEl4cXbGJPwQ7m
	 jyo+c0BUP2nVEwQpmsr6z5V5KDQxkKHCtlQi7h6mOMURzZGDljy+2k4DaxFwMH20Ejxj2
	 yMvboEgELQujei0qRhLpMS8NADsgqYnYYd5DKW2Vj+9emYuAA+duYhM64G9VQvwXMgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=r8yvpo4p;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FAC60A5BDC
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1FAC60A5BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=r8yvpo4p
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so4208816a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441300; x=1796046100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grepWVLzeUBtCj/pUc0eCATuCcMmtVEX4tnzLZWc9aU=;
        b=r8yvpo4pKqOghksLQ0K0QNHM9Xv4a39ISqLtY06/B2X3qlKsRpyEfSs2IMMjnl9Gyy
         L3A0dgeLxc/fAEI6NPS04vYTTWCdbduRwIaJtxivHoQCZWnxTQSi0tmB3KcSqo36sIms
         k19L5YJbPSpKhTGiCWsSUEB7zZuzEMaKcG/CPLvEoVuDjD/wLqEYNmJI5Scr/nU1ZOqn
         bUaKUThlPCgfC9VRniyjxCqLNAlhgQ6kPtl8gmg3jORKE2jCVmHAkvxOpaGIV/uu9wbR
         egW01I6EF5aHScPFHY+jd4kSOlK6dxH6IUqmBbxXST3RRoygmlHb+NTgXtnMdnEuQq8W
         w+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441300; x=1796046100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=grepWVLzeUBtCj/pUc0eCATuCcMmtVEX4tnzLZWc9aU=;
        b=mWa3YUAfR6UP06NqtRU3aitAwKnCuSY8BaIpMOkYB9PycsIRVb18z+reJrRt853JrH
         X+rZZtLOkeA/f0LAhfvzrbUvTVQQoQHVH1ZvsajCrvnwynSLxbWU+S7eUEeeLdC6ZNGC
         5/ygTzcKwCOdea+cyCklxRhPm3Ph+AVCXqilFENBsLQalqs+wDc4EoJhgYXhtzmM0UZG
         jvZ9J1GL+vi432K2OgbNeTPe6SdW2nQxyVZhOBnNJZslDClbOAnRz+ZbVTrQRXtjkHQY
         K5oMJPpLEwCl3eeGcOS7z01i/GMjfqAGpW+UvVh082uuHqBBwI668IfFBxmeeYiQRHob
         gpGA==
X-Forwarded-Encrypted: i=1; AL+hErF3wfXYLtbvXin8gwV3n7OqOOChjUrnrSApxKHchDmeu5Pv4JE+GpbP0G7KqlnK1UDfa1BNVgerMSJ+Is0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Kmf8I37qGogqQGqCsRw+sg89ixhNIG364HGGMF83ZF9KNeyvW
	R7qIRnir2mn2B69cJhj8+2g1AYE3u5jTPaVGFxYobek0RJYGweSCUuNOxe2EjwP6TQ==
X-Gm-Gg: AZFdTZd9tCp7KdX1udVKEV0g+pGbcoYREBHOz7WeovSku4sZFFJ0ssg5nYog23Bt6nM
	wM/3KsrXVoyEeExr3xT6lmjQ2uYWAN5yXDPK6Vbs8y31g+jEb8/udVDGUpKIDvVr34XQ3TrXnWO
	RJ/VIRYzhM3DlCpKYUTGtTcpx5c3+iJ3NsZwzIuhdFBQOs1M/Gnmh4fj1h57tXHO6UKOTK1PZtk
	VCOWyB9YwSU1R1wddVWRkeqzQ6SQZqJS3YP17NyU5P2lona0QqqR5HJhhQm2/y3zjm5SrJKF5EF
	nloDKw61fWrhCVLI9ySvRnykD7Mq+7b+JPckp/r/T2aobC0NKcYpzPE2tw0aUuGpr/a+ABvxAUM
	i4ZvbxZeVlIPqQRmAMbSbvnARmgKJ4vLYpKw1gzwO2rLIP95Gsj4j9AXAtQifybmHLnFwHlHjJp
	5bVzurS/EkUCWWQkJg/E3iIuuKMmOtIA7MwNzmAatbbLkNJ+pscM7GjkhTxNb9hEQLlwPQqNjZE
	efId3OzuzD9Gq1RY9nhT5Wp20+WF8ym23vomTOvWjzpPtz9oWtwY//eYjyeuoMHPbggoiBdVLWf
	TgAr6BFHR+zDRqQ1NvWgz6+nOQkxlCl8QKaNyTCe0uq+I4wSIzcetqy1R2xIa4NQwAVjgN5gHsm
	ip2NfIHu5aMmTX///72scrtiYp79+qNOwpjcvV9IuAzdcJuOG9Qi33j1vnK2wOcLoKQu0w35Yzd
	H3BUjTlcdAlH+CH+t39BhgMsuayH31n6gX8EvTU9Qut5pAyCY7/RvsAbEh/eu3mf98tmGR4X9mM
	0IjW7GFnrqth+KJN/GuWfNMpvWGBNVl1QJgu997o/JhObbXgUs4kUOVATgc8whWl734E3ePq4Hv
	6jmDZykLavaLreadfhnBatZnH/9CACSL5rSbH6FrJsHMdBu9oFi7t4WPQZOCND65ra0mrr7W17b
	PhyO9I+Y3ebGjaArhht0=
X-Received: by 2002:aa7:d789:0:b0:6b7:6c8:70d5 with SMTP id 4fb4d7f45d1cf-6ba37c76e5bmr5780868a12.3.1795441300094;
        Mon, 23 Nov 2026 05:41:40 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:39 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Praneesh P <praneesh.p@oss.qualcomm.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Mark Ruvald Pedersen <wabsie@gmail.com>,
	Rosen Penev <rosenp@gmail.com>
Subject: [PATCH ath-next v1 02/10] wifi: ath11k: replace the RX buffer IDR with a table
Date: Mon, 23 Nov 2026 14:41:29 +0100
Message-ID: <20261123134137.718575-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123134137.718575-1-julius@bairaktaris.de>
References: <20261123134137.718575-1-julius@bairaktaris.de>
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

Every RX buffer gets an id from its ring's IDR when it is posted and
gives it back when it is reaped, so each received frame costs an
idr_alloc() and an idr_remove(), each a radix tree walk with node
allocation and freeing under the ring lock.

The ids a ring hands out are bounded by its size, so keep them in a table
indexed by id, with a stack of the free ones. Posting a buffer pops an id
and reaping it pushes the id back, both in constant time under the same
lock, and a lookup is an array index.

The table holds twice the ring size: a ring never has more buffers posted
than entries, plus the defragmented frames reinjected into the refill
ring. Id 0 stays unused, because the refill path treats it as invalid.
An id outside the table, or one the table does not hold, finds no buffer,
as an id unknown to the IDR did.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp.c    |   9 +-
 drivers/net/wireless/ath/ath11k/dp.h    |  10 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c | 214 ++++++++++++++++--------
 3 files changed, 155 insertions(+), 78 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index be65d73b904b..e29a49df2a42 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -897,16 +897,13 @@ void ath11k_dp_pdev_pre_alloc(struct ath11k_base *ab)
 		ar = ab->pdevs[i].ar;
 		dp = &ar->dp;
 		dp->mac_id = i;
-		idr_init(&dp->rx_refill_buf_ring.bufs_idr);
-		spin_lock_init(&dp->rx_refill_buf_ring.idr_lock);
+		spin_lock_init(&dp->rx_refill_buf_ring.bufs_lock);
 		atomic_set(&dp->num_tx_pending, 0);
 		init_waitqueue_head(&dp->tx_empty_waitq);
 		for (j = 0; j < ab->hw_params.num_rxdma_per_pdev; j++) {
-			idr_init(&dp->rx_mon_status_refill_ring[j].bufs_idr);
-			spin_lock_init(&dp->rx_mon_status_refill_ring[j].idr_lock);
+			spin_lock_init(&dp->rx_mon_status_refill_ring[j].bufs_lock);
 		}
-		idr_init(&dp->rxdma_mon_buf_ring.bufs_idr);
-		spin_lock_init(&dp->rxdma_mon_buf_ring.idr_lock);
+		spin_lock_init(&dp->rxdma_mon_buf_ring.bufs_lock);
 	}
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 357185e45ae6..e6e05eb25692 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -73,9 +73,13 @@ struct dp_srng {
 struct dp_rxdma_ring {
 	struct dp_srng refill_buf_ring;
 	struct page_pool *page_pool;
-	struct idr bufs_idr;
-	/* Protects bufs_idr */
-	spinlock_t idr_lock;
+	/* Buffers by the id their descriptor carries, and the ids not in use */
+	struct sk_buff **bufs;
+	u32 *free_ids;
+	u32 num_free;
+	u32 num_ids;
+	/* Protects bufs and free_ids */
+	spinlock_t bufs_lock;
 	int bufs_max;
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index bad5c58dfafa..b3b8afb82a78 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -341,6 +341,68 @@ static int ath11k_dp_purge_mon_ring(struct ath11k_base *ab)
 	return -ETIMEDOUT;
 }
 
+/*
+ * The ids a ring hands out, as a table indexed by id with a stack of the
+ * free ones: the descriptor cookie names the buffer directly. Id 0 is never
+ * handed out, because the refill path treats it as invalid. Callers of the
+ * id helpers hold bufs_lock.
+ */
+static int ath11k_dp_rx_bufs_init(struct dp_rxdma_ring *rx_ring)
+{
+	u32 num = rx_ring->bufs_max * 2 + 1;
+	u32 id;
+
+	rx_ring->bufs = kvcalloc(num, sizeof(*rx_ring->bufs), GFP_KERNEL);
+	rx_ring->free_ids = kvcalloc(num, sizeof(*rx_ring->free_ids),
+				     GFP_KERNEL);
+	if (!rx_ring->bufs || !rx_ring->free_ids) {
+		kvfree(rx_ring->bufs);
+		kvfree(rx_ring->free_ids);
+		rx_ring->bufs = NULL;
+		rx_ring->free_ids = NULL;
+		return -ENOMEM;
+	}
+
+	rx_ring->num_ids = num;
+	rx_ring->num_free = 0;
+	for (id = num; id-- > 1;)
+		rx_ring->free_ids[rx_ring->num_free++] = id;
+
+	return 0;
+}
+
+static int ath11k_dp_rx_buf_get_id(struct dp_rxdma_ring *rx_ring,
+				   struct sk_buff *skb)
+{
+	u32 id;
+
+	if (unlikely(!rx_ring->num_free))
+		return -ENOSPC;
+
+	id = rx_ring->free_ids[--rx_ring->num_free];
+	rx_ring->bufs[id] = skb;
+
+	return id;
+}
+
+static struct sk_buff *ath11k_dp_rx_buf_lookup(struct dp_rxdma_ring *rx_ring,
+					       u32 id)
+{
+	if (unlikely(id >= rx_ring->num_ids))
+		return NULL;
+
+	return rx_ring->bufs[id];
+}
+
+static void ath11k_dp_rx_buf_put_id(struct dp_rxdma_ring *rx_ring, u32 id)
+{
+	if (unlikely(id >= rx_ring->num_ids || !rx_ring->bufs[id]))
+		return;
+
+	rx_ring->bufs[id] = NULL;
+	rx_ring->free_ids[rx_ring->num_free++] = id;
+}
+
 static bool ath11k_dp_rx_buf_is_pp(struct sk_buff *skb)
 {
 	return skb->pp_recycle && skb->head_frag;
@@ -449,10 +511,9 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 				goto fail_free_skb;
 		}
 
-		spin_lock_bh(&rx_ring->idr_lock);
-		buf_id = idr_alloc(&rx_ring->bufs_idr, skb, 1,
-				   (rx_ring->bufs_max * 3) + 1, GFP_ATOMIC);
-		spin_unlock_bh(&rx_ring->idr_lock);
+		spin_lock_bh(&rx_ring->bufs_lock);
+		buf_id = ath11k_dp_rx_buf_get_id(rx_ring, skb);
+		spin_unlock_bh(&rx_ring->bufs_lock);
 		if (buf_id <= 0)
 			goto fail_dma_unmap;
 
@@ -477,9 +538,9 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 	return req_entries - num_remain;
 
 fail_idr_remove:
-	spin_lock_bh(&rx_ring->idr_lock);
-	idr_remove(&rx_ring->bufs_idr, buf_id);
-	spin_unlock_bh(&rx_ring->idr_lock);
+	spin_lock_bh(&rx_ring->bufs_lock);
+	ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+	spin_unlock_bh(&rx_ring->bufs_lock);
 fail_dma_unmap:
 	if (!rx_ring->page_pool)
 		dma_unmap_single(ab->dev, paddr, skb->len + skb_tailroom(skb),
@@ -500,9 +561,13 @@ static int ath11k_dp_rxdma_buf_ring_free(struct ath11k *ar,
 	struct sk_buff *skb;
 	int buf_id;
 
-	spin_lock_bh(&rx_ring->idr_lock);
-	idr_for_each_entry(&rx_ring->bufs_idr, skb, buf_id) {
-		idr_remove(&rx_ring->bufs_idr, buf_id);
+	spin_lock_bh(&rx_ring->bufs_lock);
+	for (buf_id = 0; buf_id < rx_ring->num_ids; buf_id++) {
+		skb = rx_ring->bufs[buf_id];
+		if (!skb)
+			continue;
+
+		ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
 		/* TODO: Understand where internal driver does this dma_unmap
 		 * of rxdma_buffer.
 		 */
@@ -510,8 +575,13 @@ static int ath11k_dp_rxdma_buf_ring_free(struct ath11k *ar,
 		dev_kfree_skb_any(skb);
 	}
 
-	idr_destroy(&rx_ring->bufs_idr);
-	spin_unlock_bh(&rx_ring->idr_lock);
+	kvfree(rx_ring->bufs);
+	kvfree(rx_ring->free_ids);
+	rx_ring->bufs = NULL;
+	rx_ring->free_ids = NULL;
+	rx_ring->num_ids = 0;
+	rx_ring->num_free = 0;
+	spin_unlock_bh(&rx_ring->bufs_lock);
 
 	if (rx_ring->page_pool) {
 		page_pool_destroy(rx_ring->page_pool);
@@ -571,6 +641,14 @@ static int ath11k_dp_rxdma_ring_buf_setup(struct ath11k *ar,
 	}
 
 	rx_ring->bufs_max = num_entries;
+	if (ath11k_dp_rx_bufs_init(rx_ring)) {
+		if (rx_ring->page_pool) {
+			page_pool_destroy(rx_ring->page_pool);
+			rx_ring->page_pool = NULL;
+		}
+		return -ENOMEM;
+	}
+
 	ath11k_dp_rxbufs_replenish(ar->ab, dp->mac_id, rx_ring, num_entries,
 				   ar->ab->hw_params.hal_params->rx_buf_rbm);
 	return 0;
@@ -2848,17 +2926,17 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 
 		ar = ab->pdevs[mac_id].ar;
 		rx_ring = &ar->dp.rx_refill_buf_ring;
-		spin_lock_bh(&rx_ring->idr_lock);
-		msdu = idr_find(&rx_ring->bufs_idr, buf_id);
+		spin_lock_bh(&rx_ring->bufs_lock);
+		msdu = ath11k_dp_rx_buf_lookup(rx_ring, buf_id);
 		if (unlikely(!msdu)) {
 			ath11k_warn(ab, "frame rx with invalid buf_id %d\n",
 				    buf_id);
-			spin_unlock_bh(&rx_ring->idr_lock);
+			spin_unlock_bh(&rx_ring->bufs_lock);
 			continue;
 		}
 
-		idr_remove(&rx_ring->bufs_idr, buf_id);
-		spin_unlock_bh(&rx_ring->idr_lock);
+		ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+		spin_unlock_bh(&rx_ring->bufs_lock);
 
 		rxcb = ATH11K_SKB_RXCB(msdu);
 		ath11k_dp_rx_unmap_buf(ab, msdu, DMA_FROM_DEVICE);
@@ -3039,10 +3117,9 @@ static struct sk_buff *ath11k_dp_rx_alloc_mon_status_buf(struct ath11k_base *ab,
 	if (unlikely(dma_mapping_error(ab->dev, paddr)))
 		goto fail_free_skb;
 
-	spin_lock_bh(&rx_ring->idr_lock);
-	*buf_id = idr_alloc(&rx_ring->bufs_idr, skb, 0,
-			    rx_ring->bufs_max, GFP_ATOMIC);
-	spin_unlock_bh(&rx_ring->idr_lock);
+	spin_lock_bh(&rx_ring->bufs_lock);
+	*buf_id = ath11k_dp_rx_buf_get_id(rx_ring, skb);
+	spin_unlock_bh(&rx_ring->bufs_lock);
 	if (*buf_id < 0)
 		goto fail_dma_unmap;
 
@@ -3111,9 +3188,9 @@ int ath11k_dp_rx_mon_status_bufs_replenish(struct ath11k_base *ab, int mac_id,
 	return req_entries - num_remain;
 
 fail_desc_get:
-	spin_lock_bh(&rx_ring->idr_lock);
-	idr_remove(&rx_ring->bufs_idr, buf_id);
-	spin_unlock_bh(&rx_ring->idr_lock);
+	spin_lock_bh(&rx_ring->bufs_lock);
+	ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+	spin_unlock_bh(&rx_ring->bufs_lock);
 	dma_unmap_single(ab->dev, paddr, skb->len + skb_tailroom(skb),
 			 DMA_FROM_DEVICE);
 	dev_kfree_skb_any(skb);
@@ -3181,9 +3258,9 @@ ath11k_dp_rx_mon_buf_done(struct ath11k_base *ab, struct hal_srng *srng,
 
 	buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID, cookie);
 
-	spin_lock_bh(&rx_ring->idr_lock);
-	skb = idr_find(&rx_ring->bufs_idr, buf_id);
-	spin_unlock_bh(&rx_ring->idr_lock);
+	spin_lock_bh(&rx_ring->bufs_lock);
+	skb = ath11k_dp_rx_buf_lookup(rx_ring, buf_id);
+	spin_unlock_bh(&rx_ring->bufs_lock);
 
 	if (!skb)
 		return DP_MON_STATUS_NO_DMA;
@@ -3245,9 +3322,9 @@ static int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
 		if (paddr) {
 			buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID, cookie);
 
-			spin_lock_bh(&rx_ring->idr_lock);
-			skb = idr_find(&rx_ring->bufs_idr, buf_id);
-			spin_unlock_bh(&rx_ring->idr_lock);
+			spin_lock_bh(&rx_ring->bufs_lock);
+			skb = ath11k_dp_rx_buf_lookup(rx_ring, buf_id);
+			spin_unlock_bh(&rx_ring->bufs_lock);
 
 			if (!skb) {
 				ath11k_warn(ab, "rx monitor status with invalid buf_id %d\n",
@@ -3289,9 +3366,9 @@ static int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
 				if (reap_status == DP_MON_STATUS_NO_DMA)
 					continue;
 
-				spin_lock_bh(&rx_ring->idr_lock);
-				idr_remove(&rx_ring->bufs_idr, buf_id);
-				spin_unlock_bh(&rx_ring->idr_lock);
+				spin_lock_bh(&rx_ring->bufs_lock);
+				ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+				spin_unlock_bh(&rx_ring->bufs_lock);
 
 				ath11k_dp_rx_unmap_buf(ab, skb, DMA_FROM_DEVICE);
 
@@ -3300,9 +3377,9 @@ static int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
 				goto move_next;
 			}
 
-			spin_lock_bh(&rx_ring->idr_lock);
-			idr_remove(&rx_ring->bufs_idr, buf_id);
-			spin_unlock_bh(&rx_ring->idr_lock);
+			spin_lock_bh(&rx_ring->bufs_lock);
+			ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+			spin_unlock_bh(&rx_ring->bufs_lock);
 			if (ab->hw_params.full_monitor_mode) {
 				ath11k_dp_rx_mon_update_status_buf_state(pmon, tlv);
 				if (paddr == pmon->mon_status_paddr)
@@ -3611,10 +3688,9 @@ static int ath11k_dp_rx_h_defrag_reo_reinject(struct ath11k *ar, struct dp_rx_ti
 			return -ENOMEM;
 	}
 
-	spin_lock_bh(&rx_refill_ring->idr_lock);
-	buf_id = idr_alloc(&rx_refill_ring->bufs_idr, defrag_skb, 0,
-			   rx_refill_ring->bufs_max * 3, GFP_ATOMIC);
-	spin_unlock_bh(&rx_refill_ring->idr_lock);
+	spin_lock_bh(&rx_refill_ring->bufs_lock);
+	buf_id = ath11k_dp_rx_buf_get_id(rx_refill_ring, defrag_skb);
+	spin_unlock_bh(&rx_refill_ring->bufs_lock);
 	if (buf_id < 0) {
 		ret = -ENOMEM;
 		goto err_unmap_dma;
@@ -3668,9 +3744,9 @@ static int ath11k_dp_rx_h_defrag_reo_reinject(struct ath11k *ar, struct dp_rx_ti
 	return 0;
 
 err_free_idr:
-	spin_lock_bh(&rx_refill_ring->idr_lock);
-	idr_remove(&rx_refill_ring->bufs_idr, buf_id);
-	spin_unlock_bh(&rx_refill_ring->idr_lock);
+	spin_lock_bh(&rx_refill_ring->bufs_lock);
+	ath11k_dp_rx_buf_put_id(rx_refill_ring, buf_id);
+	spin_unlock_bh(&rx_refill_ring->bufs_lock);
 err_unmap_dma:
 	if (!ath11k_dp_rx_buf_is_pp(defrag_skb))
 		dma_unmap_single(ab->dev, paddr,
@@ -3901,17 +3977,17 @@ ath11k_dp_process_rx_err_buf(struct ath11k *ar, u32 *ring_desc, int buf_id, bool
 	u16 msdu_len;
 	u32 hal_rx_desc_sz = ar->ab->hw_params.hal_desc_sz;
 
-	spin_lock_bh(&rx_ring->idr_lock);
-	msdu = idr_find(&rx_ring->bufs_idr, buf_id);
+	spin_lock_bh(&rx_ring->bufs_lock);
+	msdu = ath11k_dp_rx_buf_lookup(rx_ring, buf_id);
 	if (!msdu) {
 		ath11k_warn(ar->ab, "rx err buf with invalid buf_id %d\n",
 			    buf_id);
-		spin_unlock_bh(&rx_ring->idr_lock);
+		spin_unlock_bh(&rx_ring->bufs_lock);
 		return -EINVAL;
 	}
 
-	idr_remove(&rx_ring->bufs_idr, buf_id);
-	spin_unlock_bh(&rx_ring->idr_lock);
+	ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+	spin_unlock_bh(&rx_ring->bufs_lock);
 
 	ath11k_dp_rx_unmap_buf(ar->ab, msdu, DMA_FROM_DEVICE);
 
@@ -4332,17 +4408,17 @@ int ath11k_dp_rx_process_wbm_err(struct ath11k_base *ab,
 		ar = ab->pdevs[mac_id].ar;
 		rx_ring = &ar->dp.rx_refill_buf_ring;
 
-		spin_lock_bh(&rx_ring->idr_lock);
-		msdu = idr_find(&rx_ring->bufs_idr, buf_id);
+		spin_lock_bh(&rx_ring->bufs_lock);
+		msdu = ath11k_dp_rx_buf_lookup(rx_ring, buf_id);
 		if (!msdu) {
 			ath11k_warn(ab, "frame rx with invalid buf_id %d pdev %d\n",
 				    buf_id, mac_id);
-			spin_unlock_bh(&rx_ring->idr_lock);
+			spin_unlock_bh(&rx_ring->bufs_lock);
 			continue;
 		}
 
-		idr_remove(&rx_ring->bufs_idr, buf_id);
-		spin_unlock_bh(&rx_ring->idr_lock);
+		ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+		spin_unlock_bh(&rx_ring->bufs_lock);
 
 		rxcb = ATH11K_SKB_RXCB(msdu);
 		ath11k_dp_rx_unmap_buf(ab, msdu, DMA_FROM_DEVICE);
@@ -4455,17 +4531,17 @@ int ath11k_dp_process_rxdma_err(struct ath11k_base *ab, int mac_id, int budget)
 			buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID,
 					   msdu_cookies[i]);
 
-			spin_lock_bh(&rx_ring->idr_lock);
-			skb = idr_find(&rx_ring->bufs_idr, buf_id);
+			spin_lock_bh(&rx_ring->bufs_lock);
+			skb = ath11k_dp_rx_buf_lookup(rx_ring, buf_id);
 			if (!skb) {
 				ath11k_warn(ab, "rxdma error with invalid buf_id %d\n",
 					    buf_id);
-				spin_unlock_bh(&rx_ring->idr_lock);
+				spin_unlock_bh(&rx_ring->bufs_lock);
 				continue;
 			}
 
-			idr_remove(&rx_ring->bufs_idr, buf_id);
-			spin_unlock_bh(&rx_ring->idr_lock);
+			ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+			spin_unlock_bh(&rx_ring->bufs_lock);
 
 			ath11k_dp_rx_unmap_buf(ab, skb, DMA_FROM_DEVICE);
 			dev_kfree_skb_any(skb);
@@ -4928,9 +5004,9 @@ u32 ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar, int mac_id,
 			buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID,
 					   msdu_list.sw_cookie[i]);
 
-			spin_lock_bh(&rx_ring->idr_lock);
-			msdu = idr_find(&rx_ring->bufs_idr, buf_id);
-			spin_unlock_bh(&rx_ring->idr_lock);
+			spin_lock_bh(&rx_ring->bufs_lock);
+			msdu = ath11k_dp_rx_buf_lookup(rx_ring, buf_id);
+			spin_unlock_bh(&rx_ring->bufs_lock);
 			if (!msdu) {
 				ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
 					   "msdu_pop: invalid buf_id %d\n", buf_id);
@@ -4997,9 +5073,9 @@ u32 ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar, int mac_id,
 next_msdu:
 			pmon->mon_last_buf_cookie = msdu_list.sw_cookie[i];
 			rx_bufs_used++;
-			spin_lock_bh(&rx_ring->idr_lock);
-			idr_remove(&rx_ring->bufs_idr, buf_id);
-			spin_unlock_bh(&rx_ring->idr_lock);
+			spin_lock_bh(&rx_ring->bufs_lock);
+			ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+			spin_unlock_bh(&rx_ring->bufs_lock);
 		}
 
 		ath11k_hal_rx_buf_addr_info_set(rx_link_buf_info, paddr, sw_cookie, rbm);
@@ -5553,17 +5629,17 @@ ath11k_dp_rx_full_mon_mpdu_pop(struct ath11k *ar,
 			buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID,
 					   msdu_list.sw_cookie[i]);
 
-			spin_lock_bh(&rx_ring->idr_lock);
-			msdu = idr_find(&rx_ring->bufs_idr, buf_id);
+			spin_lock_bh(&rx_ring->bufs_lock);
+			msdu = ath11k_dp_rx_buf_lookup(rx_ring, buf_id);
 			if (!msdu) {
 				ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
 					   "full mon msdu_pop: invalid buf_id %d\n",
 					    buf_id);
-				spin_unlock_bh(&rx_ring->idr_lock);
+				spin_unlock_bh(&rx_ring->bufs_lock);
 				goto next_msdu;
 			}
-			idr_remove(&rx_ring->bufs_idr, buf_id);
-			spin_unlock_bh(&rx_ring->idr_lock);
+			ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+			spin_unlock_bh(&rx_ring->bufs_lock);
 
 			rxcb = ATH11K_SKB_RXCB(msdu);
 			if (!rxcb->unmapped) {
-- 
2.53.0

