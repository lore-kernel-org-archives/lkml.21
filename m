Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441301;
	b=5uEvk6oeCrkqom+ZZe9NXJMsWCGu3vWoQCdLoVeWbpJ+h5XvpWpJyfMZNdjRifIqkfUu
	 bAwV2GVe9RkV+kmYAIfRPXB8NfMpmFXEp61U53TwirsChEeIaoQ4t37VUZkVE/Bp5AkVH
	 OXbYd+GcYb9WdLNZPKdbjR6MXmI2QSm0/CJdR+hqfPIITW5xuZJzuHCkhMAe7wdPEkmzn
	 zBEmwu52lEgveBmxT+Kotid9U0HAnyNWvuPjgrde2v/bqXsZtfQ3iiY7jHEt5e2u/2/ma
	 Bipo06ndOo4YQr6Aj5zAIcChti3ksw14fH+8IWLOzN0LpwufRpMANWU03tR+t+5uz+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wWUon97vTJTRISIOUEFFYAZHy2rS/9m/ivsdCH0vErk=;
	b=0NjyfBPJq930+Kb96gS5qruHv1Mk/WsuOkmzdb2xVmBWqU+kcgj9ogmYNf8bonZvAORy
	 24Pxyf5hOdlrAUIR87v+jRwhcyoFv9sr1Aq9ux3efCyirhJ3wxAcot7Q4v4C0Lv4TMCqW
	 o3cAAMkLUX7AdD+pRtJL7Qb5/gap0hqKsJOpfUvF22WAv2p8AvB16/He6+OkM080bfQ1o
	 iGLJ39pu3BRhDBNsBaUU+cI3PSk5FJKkGgw4tic5OzUK2U7ymKnSTXywc3ZsXbjcsbmYa
	 dKAojQEq3NhPanGR9UscsIgwTpKdeBq3wfnkGlUZecg/g3OzN0nOLKXtQLmQWWC6TUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Wq6P1Nww;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBB860A5BC2
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FBB860A5BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Wq6P1Nww
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so4996469a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441299; x=1796046099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWUon97vTJTRISIOUEFFYAZHy2rS/9m/ivsdCH0vErk=;
        b=Wq6P1NwwtXB8kVDVXMe9631U0Y2V8rYQeXWE7SsCTLM/WbZzrHm/APa4zsbSLCSTSJ
         IB6DEfxRBfLHPNRz5QXCTlS4fEAobk0Y8xiJHFRAwhEnl7z670opnobsrArx5ty0Ayw9
         pcPgfsp/YVWQuLgbQ4d8eLe0XAIgNeF1mUSg+L866W6yEeElEWpAtu6c67pc/+TmukJ7
         5pEEae+GWMRiVid0QYipwvbAVTyDtrM3SphhLdI/tQcegeyA2OejtsWrphPcgyYqQZhS
         ZR3J8SPZRpZRiy98XoNVp2/XpQOvu0M0Krp9gBRolg+Tj05geRYT8DBJvpFaiSaEILPR
         vG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441299; x=1796046099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wWUon97vTJTRISIOUEFFYAZHy2rS/9m/ivsdCH0vErk=;
        b=YLj6ZYn+oQKijedZZoNO8wQvgmWmNYPhH9xEMqzL63YUDfMmKWKveYG1XGDPRZ7u/U
         jC6HHLEPtGJ3ykTPxSzkp8M3dweEaIPZduE2EZi3tegw3OWnvTid316a95XLM+m+GSpC
         V44Gzuxxy+cPlZYaGefyua99sd5fSHWetK5jZr9FgmpAU8nvnVmjpDT2RQA0nsvw41G+
         GmKFLKnYsiKMmQ9/J+vVzUxXKk3iBsnVJ1QpZnRTXenWYyYuf2YKa+I/eQljZaMzF2Y5
         +kEIKlkCOzuVcVoPH+E0xbUKMPDJXre9IfotPWFicJd3uN7bN8IMmt1orEobWqcP8Q18
         B4Ug==
X-Forwarded-Encrypted: i=1; AL+hErFtwwrZkVeJ8Pep9ELeUpFBuC07o5XeeJRiqF/lSIxEqOPlVFGWGYOJd1Bu0iJ1XhSq7GaAoVTF+op3oL0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UtgwyRyJ8dHqP2gg7eV9cT/F/Et+50nxmCyuNC6NyazM8qjKR
	T7JYeZkJKec9ol19QewiMPvcAtWIXiZ1rLHaVgSX7dPg4WBnb1QGxeorsp68YUDl8BxIe/kFPiK
	C4g2wqFE/
X-Gm-Gg: AZFdTZeGxOawOwNCbnOpf0camBEkLvg5HfAU0WkbWgfqDFKK+X2CXDJ7Z5ZhOBn9LMw
	MEyOWNVM9FHwGvGpEIQA/zO7Pj5HFvNKf1/wQrHtp+YGPy2GbQLPMSVe3IwYsHCDOiDa7VWkSkK
	nbf76jgLJ0EbmQ4Mhfz43+j5mhrC/V6LvCoY49BgD8Xks8FWIkxgAZPROZGrDvHog3zD+PKJBdz
	II9CIQjcF2/q3uDjzPXPy0XrlXtIJ3MRmnezV1oOusyR4VSTPVNu/28XSSIM/ngol7oLDgeOiit
	W1AEoF6JgHobtWhspa/RFq310tq7s9CMOC7mNNTMv97R9GAYuoNV7dOrendt4mVDb/om6G1IKfs
	18POh8Xl6lVt4WLiC0rQ6vK0RgL7Hh6NUteX65iv4y407qTieb17Jhj393Nwo30fyErfoN8m7Aj
	IyxO51zQPGtoMBypOBwZeX7edrqSE/NFeqLXfVRSSJwKu5G+5z2pKVH+e/u9NO9Duq/9rp1pHXj
	/+yxLDew0jeRyWNY7M/n2qedHgzCCsrTYgxP/O6lrNjpN7qhZOoOH+9x6ZF7XpEwuev5cjFlmS2
	pRqIf2DWXNSOpP4S7EZiKepvLZGGiD+4dZOBDpRC6I1OMbMl/wRGosP8KaYOm+UvcMGTvDPZ7AZ
	20ehMQvE0aYKfXv/1QErJjq4Stj1Mw+Z2AYJxk0K9VgZQtMalEF9SnWq9WS4szmrEBDIn3NDY5D
	R/qgL+GAT9X+NYY1pE2f9IA6GBEy7wWNZzqKuidye2yDMeFYt6waoe58GcA/gekIumu31azBEMz
	CROFSUKvneo+yLjKPy3xZbohTCPbxDLle3o7AcA4hxD84RBbTXIF4Hc3Z4Fgd3pL8FBDPRoTT+W
	Kkj+boxZDayTs96tBhcdB7KrfUrhQjPZZLR+NgdJvknEeB0BcDIeg4Ial5QY0m7gjZClBTUNAg=
	=
X-Received: by 2002:a05:6402:2745:b0:6ba:9d0c:cca4 with SMTP id 4fb4d7f45d1cf-6ba9d0cced2mr3125038a12.33.1795441299335;
        Mon, 23 Nov 2026 05:41:39 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:38 -0800 (PST)
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
Subject: [PATCH ath-next v1 01/10] wifi: ath11k: use page_pool for the RX refill ring
Date: Mon, 23 Nov 2026 14:41:28 +0100
Message-ID: <20261123134137.718575-2-julius@bairaktaris.de>
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

The RX refill ring takes every buffer from dev_alloc_skb(), maps it with
dma_map_single() and unmaps it again when the frame is reaped, so each
received frame costs one allocation from the per-CPU page-frag cache and
one map and unmap. Buffers of the ring also share that cache with
unrelated allocations, so one long-lived skb pins a whole high-order
page.

Give the refill ring of each radio its own page_pool. The pool keeps the
DMA mapping of its pages, the reap paths sync the buffer for the CPU
instead of unmapping it, and a freed skb returns its page to the pool.
Each order-1 page carries three 128-byte aligned buffers, about the
memory the page-frag allocation took for the same three. The pool holds
as many pages as the ring has entries. The monitor rings keep
dev_alloc_skb().

A defragmented frame that is reinjected into the refill ring is synced
for the device when it comes from the pool, and mapped as before
otherwise.

Mark Ruvald Pedersen's RFC proposed private page-frag caches for these
rings.

Link: https://lore.kernel.org/linux-wireless/20260719215817.2468580-1-wabsie@gmail.com/
Link: https://lore.kernel.org/linux-wireless/20261008-ath12k-pp-v1-0-68f888cd7eec@oss.qualcomm.com/
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/Kconfig |   1 +
 drivers/net/wireless/ath/ath11k/dp.h    |   4 +
 drivers/net/wireless/ath/ath11k/dp_rx.c | 191 +++++++++++++++++-------
 3 files changed, 138 insertions(+), 58 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 99f625b82fe1..5c949e856649 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -3,6 +3,7 @@ config ATH11K
 	tristate "Qualcomm 802.11ax chipset support"
 	depends on MAC80211 && HAS_DMA
 	select QCOM_QMI_HELPERS
+	select PAGE_POOL
 	help
 	  This module adds support for Qualcomm Technologies 802.11ax family of
 	  chipsets.
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 84f66839f0c6..357185e45ae6 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -72,6 +72,7 @@ struct dp_srng {
 
 struct dp_rxdma_ring {
 	struct dp_srng refill_buf_ring;
+	struct page_pool *page_pool;
 	struct idr bufs_idr;
 	/* Protects bufs_idr */
 	spinlock_t idr_lock;
@@ -229,6 +230,9 @@ struct ath11k_pdev_dp {
 #define DP_RX_BUFFER_SIZE	2048
 #define	DP_RX_BUFFER_SIZE_LITE  1024
 #define DP_RX_BUFFER_ALIGN_SIZE	128
+#define DP_RX_PP_ORDER		1
+#define DP_RX_PP_FRAG_SIZE	ALIGN(SKB_HEAD_ALIGN(DP_RX_BUFFER_SIZE), \
+				      DP_RX_BUFFER_ALIGN_SIZE)
 
 #define DP_RXDMA_BUF_COOKIE_BUF_ID	GENMASK(17, 0)
 #define DP_RXDMA_BUF_COOKIE_PDEV_ID	GENMASK(20, 18)
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6fdcd2aed7dc..bad5c58dfafa 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -8,6 +8,7 @@
 #include <linux/ieee80211.h>
 #include <linux/kernel.h>
 #include <linux/skbuff.h>
+#include <net/page_pool/helpers.h>
 #include "core.h"
 #include "debug.h"
 #include "debugfs_htt_stats.h"
@@ -340,6 +341,56 @@ static int ath11k_dp_purge_mon_ring(struct ath11k_base *ab)
 	return -ETIMEDOUT;
 }
 
+static bool ath11k_dp_rx_buf_is_pp(struct sk_buff *skb)
+{
+	return skb->pp_recycle && skb->head_frag;
+}
+
+static void ath11k_dp_rx_unmap_buf(struct ath11k_base *ab, struct sk_buff *skb,
+				   enum dma_data_direction dir)
+{
+	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(skb);
+	unsigned int len = skb->len + skb_tailroom(skb);
+
+	if (ath11k_dp_rx_buf_is_pp(skb))
+		dma_sync_single_for_cpu(ab->dev, rxcb->paddr, len,
+					DMA_BIDIRECTIONAL);
+	else
+		dma_unmap_single(ab->dev, rxcb->paddr, len, dir);
+}
+
+static dma_addr_t ath11k_dp_rx_pp_dma_addr(struct sk_buff *skb)
+{
+	struct page *page = virt_to_head_page(skb->data);
+
+	return page_pool_get_dma_addr(page) +
+	       (skb->data - (u8 *)page_address(page));
+}
+
+static struct sk_buff *ath11k_dp_rx_pp_alloc_skb(struct dp_rxdma_ring *rx_ring)
+{
+	struct sk_buff *skb;
+	unsigned int offset;
+	struct page *page;
+	void *va;
+
+	page = page_pool_dev_alloc_frag(rx_ring->page_pool, &offset,
+					DP_RX_PP_FRAG_SIZE);
+	if (!page)
+		return NULL;
+
+	va = page_address(page) + offset;
+	skb = build_skb(va, DP_RX_PP_FRAG_SIZE);
+	if (!skb) {
+		page_pool_put_full_page(rx_ring->page_pool, page, false);
+		return NULL;
+	}
+
+	skb_mark_for_recycle(skb);
+
+	return skb;
+}
+
 /* Returns number of Rx buffers replenished */
 int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 			       struct dp_rxdma_ring *rx_ring,
@@ -371,23 +422,32 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 	num_remain = req_entries;
 
 	while (num_remain > 0) {
-		skb = dev_alloc_skb(DP_RX_BUFFER_SIZE +
-				    DP_RX_BUFFER_ALIGN_SIZE);
-		if (!skb)
-			break;
+		if (rx_ring->page_pool) {
+			skb = ath11k_dp_rx_pp_alloc_skb(rx_ring);
+			if (!skb)
+				break;
 
-		if (!IS_ALIGNED((unsigned long)skb->data,
-				DP_RX_BUFFER_ALIGN_SIZE)) {
-			skb_pull(skb,
-				 PTR_ALIGN(skb->data, DP_RX_BUFFER_ALIGN_SIZE) -
-				 skb->data);
-		}
+			paddr = ath11k_dp_rx_pp_dma_addr(skb);
+		} else {
+			skb = dev_alloc_skb(DP_RX_BUFFER_SIZE +
+					    DP_RX_BUFFER_ALIGN_SIZE);
+			if (!skb)
+				break;
 
-		paddr = dma_map_single(ab->dev, skb->data,
-				       skb->len + skb_tailroom(skb),
-				       DMA_FROM_DEVICE);
-		if (dma_mapping_error(ab->dev, paddr))
-			goto fail_free_skb;
+			if (!IS_ALIGNED((unsigned long)skb->data,
+					DP_RX_BUFFER_ALIGN_SIZE)) {
+				skb_pull(skb,
+					 PTR_ALIGN(skb->data,
+						   DP_RX_BUFFER_ALIGN_SIZE) -
+					 skb->data);
+			}
+
+			paddr = dma_map_single(ab->dev, skb->data,
+					       skb->len + skb_tailroom(skb),
+					       DMA_FROM_DEVICE);
+			if (dma_mapping_error(ab->dev, paddr))
+				goto fail_free_skb;
+		}
 
 		spin_lock_bh(&rx_ring->idr_lock);
 		buf_id = idr_alloc(&rx_ring->bufs_idr, skb, 1,
@@ -421,8 +481,9 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 	idr_remove(&rx_ring->bufs_idr, buf_id);
 	spin_unlock_bh(&rx_ring->idr_lock);
 fail_dma_unmap:
-	dma_unmap_single(ab->dev, paddr, skb->len + skb_tailroom(skb),
-			 DMA_FROM_DEVICE);
+	if (!rx_ring->page_pool)
+		dma_unmap_single(ab->dev, paddr, skb->len + skb_tailroom(skb),
+				 DMA_FROM_DEVICE);
 fail_free_skb:
 	dev_kfree_skb_any(skb);
 
@@ -445,14 +506,18 @@ static int ath11k_dp_rxdma_buf_ring_free(struct ath11k *ar,
 		/* TODO: Understand where internal driver does this dma_unmap
 		 * of rxdma_buffer.
 		 */
-		dma_unmap_single(ar->ab->dev, ATH11K_SKB_RXCB(skb)->paddr,
-				 skb->len + skb_tailroom(skb), DMA_FROM_DEVICE);
+		ath11k_dp_rx_unmap_buf(ar->ab, skb, DMA_FROM_DEVICE);
 		dev_kfree_skb_any(skb);
 	}
 
 	idr_destroy(&rx_ring->bufs_idr);
 	spin_unlock_bh(&rx_ring->idr_lock);
 
+	if (rx_ring->page_pool) {
+		page_pool_destroy(rx_ring->page_pool);
+		rx_ring->page_pool = NULL;
+	}
+
 	return 0;
 }
 
@@ -486,6 +551,25 @@ static int ath11k_dp_rxdma_ring_buf_setup(struct ath11k *ar,
 	num_entries = rx_ring->refill_buf_ring.size /
 		ath11k_hal_srng_get_entrysize(ar->ab, ringtype);
 
+	if (ringtype == HAL_RXDMA_BUF) {
+		struct page_pool_params pp_params = {
+			.order = DP_RX_PP_ORDER,
+			.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV,
+			.pool_size = num_entries,
+			.nid = NUMA_NO_NODE,
+			.dev = ar->ab->dev,
+			.dma_dir = DMA_BIDIRECTIONAL,
+			.max_len = PAGE_SIZE << DP_RX_PP_ORDER,
+		};
+		struct page_pool *pp;
+
+		pp = page_pool_create(&pp_params);
+		if (IS_ERR(pp))
+			return PTR_ERR(pp);
+
+		rx_ring->page_pool = pp;
+	}
+
 	rx_ring->bufs_max = num_entries;
 	ath11k_dp_rxbufs_replenish(ar->ab, dp->mac_id, rx_ring, num_entries,
 				   ar->ab->hw_params.hal_params->rx_buf_rbm);
@@ -497,9 +581,11 @@ static int ath11k_dp_rxdma_pdev_buf_setup(struct ath11k *ar)
 	struct ath11k_pdev_dp *dp = &ar->dp;
 	struct ath11k_base *ab = ar->ab;
 	struct dp_rxdma_ring *rx_ring = &dp->rx_refill_buf_ring;
-	int i;
+	int i, ret;
 
-	ath11k_dp_rxdma_ring_buf_setup(ar, rx_ring, HAL_RXDMA_BUF);
+	ret = ath11k_dp_rxdma_ring_buf_setup(ar, rx_ring, HAL_RXDMA_BUF);
+	if (ret)
+		return ret;
 
 	if (ar->ab->hw_params.rxdma1_enable) {
 		rx_ring = &dp->rxdma_mon_buf_ring;
@@ -2775,9 +2861,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 		spin_unlock_bh(&rx_ring->idr_lock);
 
 		rxcb = ATH11K_SKB_RXCB(msdu);
-		dma_unmap_single(ab->dev, rxcb->paddr,
-				 msdu->len + skb_tailroom(msdu),
-				 DMA_FROM_DEVICE);
+		ath11k_dp_rx_unmap_buf(ab, msdu, DMA_FROM_DEVICE);
 
 		num_buffs_reaped[mac_id]++;
 
@@ -3209,9 +3293,7 @@ static int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
 				idr_remove(&rx_ring->bufs_idr, buf_id);
 				spin_unlock_bh(&rx_ring->idr_lock);
 
-				dma_unmap_single(ab->dev, rxcb->paddr,
-						 skb->len + skb_tailroom(skb),
-						 DMA_FROM_DEVICE);
+				ath11k_dp_rx_unmap_buf(ab, skb, DMA_FROM_DEVICE);
 
 				dev_kfree_skb_any(skb);
 				pmon->buf_state = DP_MON_STATUS_REPLINISH;
@@ -3227,9 +3309,7 @@ static int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
 					pmon->buf_state = DP_MON_STATUS_MATCH;
 			}
 
-			dma_unmap_single(ab->dev, rxcb->paddr,
-					 skb->len + skb_tailroom(skb),
-					 DMA_FROM_DEVICE);
+			ath11k_dp_rx_unmap_buf(ab, skb, DMA_FROM_DEVICE);
 
 			__skb_queue_tail(skb_list, skb);
 		} else {
@@ -3516,11 +3596,20 @@ static int ath11k_dp_rx_h_defrag_reo_reinject(struct ath11k *ar, struct dp_rx_ti
 	/* change msdu len in hal rx desc */
 	ath11k_dp_rxdesc_set_msdu_len(ab, rx_desc, defrag_skb->len - hal_rx_desc_sz);
 
-	paddr = dma_map_single(ab->dev, defrag_skb->data,
-			       defrag_skb->len + skb_tailroom(defrag_skb),
-			       DMA_TO_DEVICE);
-	if (dma_mapping_error(ab->dev, paddr))
-		return -ENOMEM;
+	if (ath11k_dp_rx_buf_is_pp(defrag_skb)) {
+		paddr = ath11k_dp_rx_pp_dma_addr(defrag_skb);
+		dma_sync_single_for_device(ab->dev, paddr,
+					   defrag_skb->len +
+					   skb_tailroom(defrag_skb),
+					   DMA_BIDIRECTIONAL);
+	} else {
+		paddr = dma_map_single(ab->dev, defrag_skb->data,
+				       defrag_skb->len +
+				       skb_tailroom(defrag_skb),
+				       DMA_TO_DEVICE);
+		if (dma_mapping_error(ab->dev, paddr))
+			return -ENOMEM;
+	}
 
 	spin_lock_bh(&rx_refill_ring->idr_lock);
 	buf_id = idr_alloc(&rx_refill_ring->bufs_idr, defrag_skb, 0,
@@ -3583,8 +3672,10 @@ static int ath11k_dp_rx_h_defrag_reo_reinject(struct ath11k *ar, struct dp_rx_ti
 	idr_remove(&rx_refill_ring->bufs_idr, buf_id);
 	spin_unlock_bh(&rx_refill_ring->idr_lock);
 err_unmap_dma:
-	dma_unmap_single(ab->dev, paddr, defrag_skb->len + skb_tailroom(defrag_skb),
-			 DMA_TO_DEVICE);
+	if (!ath11k_dp_rx_buf_is_pp(defrag_skb))
+		dma_unmap_single(ab->dev, paddr,
+				 defrag_skb->len + skb_tailroom(defrag_skb),
+				 DMA_TO_DEVICE);
 	return ret;
 }
 
@@ -3805,7 +3896,6 @@ ath11k_dp_process_rx_err_buf(struct ath11k *ar, u32 *ring_desc, int buf_id, bool
 	struct ath11k_pdev_dp *dp = &ar->dp;
 	struct dp_rxdma_ring *rx_ring = &dp->rx_refill_buf_ring;
 	struct sk_buff *msdu;
-	struct ath11k_skb_rxcb *rxcb;
 	struct hal_rx_desc *rx_desc;
 	u8 *hdr_status;
 	u16 msdu_len;
@@ -3823,10 +3913,7 @@ ath11k_dp_process_rx_err_buf(struct ath11k *ar, u32 *ring_desc, int buf_id, bool
 	idr_remove(&rx_ring->bufs_idr, buf_id);
 	spin_unlock_bh(&rx_ring->idr_lock);
 
-	rxcb = ATH11K_SKB_RXCB(msdu);
-	dma_unmap_single(ar->ab->dev, rxcb->paddr,
-			 msdu->len + skb_tailroom(msdu),
-			 DMA_FROM_DEVICE);
+	ath11k_dp_rx_unmap_buf(ar->ab, msdu, DMA_FROM_DEVICE);
 
 	if (drop) {
 		dev_kfree_skb_any(msdu);
@@ -4258,9 +4345,7 @@ int ath11k_dp_rx_process_wbm_err(struct ath11k_base *ab,
 		spin_unlock_bh(&rx_ring->idr_lock);
 
 		rxcb = ATH11K_SKB_RXCB(msdu);
-		dma_unmap_single(ab->dev, rxcb->paddr,
-				 msdu->len + skb_tailroom(msdu),
-				 DMA_FROM_DEVICE);
+		ath11k_dp_rx_unmap_buf(ab, msdu, DMA_FROM_DEVICE);
 
 		num_buffs_reaped[mac_id]++;
 		total_num_buffs_reaped++;
@@ -4328,7 +4413,6 @@ int ath11k_dp_process_rxdma_err(struct ath11k_base *ab, int mac_id, int budget)
 	u32 msdu_cookies[HAL_NUM_RX_MSDUS_PER_LINK_DESC];
 	enum hal_rx_buf_return_buf_manager rbm;
 	enum hal_reo_entr_rxdma_ecode rxdma_err_code;
-	struct ath11k_skb_rxcb *rxcb;
 	struct sk_buff *skb;
 	struct hal_reo_entrance_ring *entr_ring;
 	void *desc;
@@ -4383,10 +4467,7 @@ int ath11k_dp_process_rxdma_err(struct ath11k_base *ab, int mac_id, int budget)
 			idr_remove(&rx_ring->bufs_idr, buf_id);
 			spin_unlock_bh(&rx_ring->idr_lock);
 
-			rxcb = ATH11K_SKB_RXCB(skb);
-			dma_unmap_single(ab->dev, rxcb->paddr,
-					 skb->len + skb_tailroom(skb),
-					 DMA_FROM_DEVICE);
+			ath11k_dp_rx_unmap_buf(ab, skb, DMA_FROM_DEVICE);
 			dev_kfree_skb_any(skb);
 
 			num_buf_freed++;
@@ -4857,10 +4938,7 @@ u32 ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar, int mac_id,
 			}
 			rxcb = ATH11K_SKB_RXCB(msdu);
 			if (!rxcb->unmapped) {
-				dma_unmap_single(ar->ab->dev, rxcb->paddr,
-						 msdu->len +
-						 skb_tailroom(msdu),
-						 DMA_FROM_DEVICE);
+				ath11k_dp_rx_unmap_buf(ar->ab, msdu, DMA_FROM_DEVICE);
 				rxcb->unmapped = 1;
 			}
 			if (drop_mpdu) {
@@ -5489,10 +5567,7 @@ ath11k_dp_rx_full_mon_mpdu_pop(struct ath11k *ar,
 
 			rxcb = ATH11K_SKB_RXCB(msdu);
 			if (!rxcb->unmapped) {
-				dma_unmap_single(ar->ab->dev, rxcb->paddr,
-						 msdu->len +
-						 skb_tailroom(msdu),
-						 DMA_FROM_DEVICE);
+				ath11k_dp_rx_unmap_buf(ar->ab, msdu, DMA_FROM_DEVICE);
 				rxcb->unmapped = 1;
 			}
 			if (drop_mpdu) {
-- 
2.53.0

