Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441310;
	b=aJ6CNUfm8gCOrxlz4ugfERjSyZ5wUWWkGIdqkj3lTFWRf/xbrcy+H/UoFhYC5njpLLhn
	 pIU/uYS93xxTT0hMNXbw6JnzgDUzFyPlK3V9UWUn57JXwB5GtY7OhmFymj0eIXOnE/oJA
	 tf4H800IZag6/qdYuwN1uErnDfpkiox56U2+/q8Tjlj7+tdIUhDiSGIE4oxjpOlSIIVzs
	 lkOteGvTtfmbAUrsNoe2n7jquxwqhETFqwbW1KNIgtBRJMav4h7iEJ18uKc9bKCgkd+E2
	 lqWxwb7cJYVDwEL4NxoOW40r62ir/MqO+7GVU2YyvP2F6TBiJTj2aahu0Beu0S2A5RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JEwCxqYSa78a+8RvsiiGGU+aVSJtIui2RNJ0j0sohk8=;
	b=lP9EhlWMkSFxfcOGu7oO6TdBThxo9qCfykNNv5trI0kFAzj2ezdl80Jz068BxP0EghLv
	 AW5H8oiua72Rhq4+Pc4WQqUxM2vgG/+B5t6QNipeVm1YrXndn2/+Js2csCHrQ5oVsPuKX
	 9IQNsmBwdrFDvDtFlbEu06CbCJDnPHtR8HARiHsz2rBbtroH9JHAhx3lofy4hTC0jDx2Q
	 gZ7K3pbUKIhH4OZYvdCYFGMmztLmUzeHrwhv1iOrj4Vp3T0vmyVBhADoiJBjyPdNDAFZA
	 5PS1zbzTfW8daWtBRpqvcWxcIqkc5LVnz3PH9SwBWPjGdaEym0bTKViGtLnrmNTlB3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=CVBN7bkd;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C408A60724FB
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C408A60724FB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=CVBN7bkd
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so4836299a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441308; x=1796046108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JEwCxqYSa78a+8RvsiiGGU+aVSJtIui2RNJ0j0sohk8=;
        b=CVBN7bkd/BZGPJoW8CbECg3mPq8FieJKLu1s+0qaxSck6Z4P5NwmKDF6tEI/KsSzE+
         A7jFUFyy88eiwh1NZhPe7R+jGvFJDwR+SP8QYput/zw6r5rHYjGICwgoe0dwNo+xm0Vj
         CJxpnHAPmp2r5GkdOeiVavT8y8Kius+vnP9CCpwkyKBw5ejEPH3Q96s/gBNZfh8D8ypF
         +1Q0Qyw0npiFpYbU71Ma04pVkO+T7wxQWCUajREkk5m7PD8WB8Xhz2qwZX+l/4hkNWLB
         eTmA8PFGJv5cPF9eJDbzitFXBENsb+Jhl43kXf3VWMZd1rEnTX1qpjLZUPlO9VQX9P5J
         p3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441308; x=1796046108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JEwCxqYSa78a+8RvsiiGGU+aVSJtIui2RNJ0j0sohk8=;
        b=Tx1FyMfBOPpq0UHcHFf4w/bEANqVPwq3Hy12u18R7O8hfu72a0i7nHTF9mJzRDO3TZ
         dwM3IYY4vH6LvV3/kK8yV8wrj63gazUmdn96SeTrQwjcdFhMesGYcFpX0y2IGc3fUn+1
         ipWlXYy4Ok/enKUwgKRs2idTIahTqhGHQkVm5JlsLpgmXBbnFSdFpXOFQ4F2SO4wzdOT
         sS2xuP6+O0Yys53OOIHDjely2GhwmknKEWDHa9weDDPnoBqv431yzIwZZ8kd/AdV7e+U
         /fcSl7I//CFMuoqqAzgf3zzbBFAn1BASGNiGJoXNIIWZfuEhxerNAwzdX1hna2h+Ztnu
         9j4A==
X-Forwarded-Encrypted: i=1; AL+hErHkQK21E8SZ/w/1bce/gfnatYme1DS+1kp1TTq1CSl6ZFD58STcLlSchon18N6uEqfviIHGMiV9ndNNE7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6C3irFuE1WWZ9A48m4xVhVfSnJugCas4MR7db5y2ezgyLh4wb
	3umM3MdNL0r2FhyfvcItfKvmQj9n+jSZTimUiBpz47H7F6eKDHijTIts5q4Szfyv7Q==
X-Gm-Gg: AZFdTZevF4IodF4NkVeolzKkxte76d9wGNyCxwVVgBKv4QqYOV4VLxc2dYfJuljfsGG
	p5HWhE4zjC0JukG+FqUpwhhj502dhgiumGLKP1vfipn5UQQ5RPvQ0WOm9YLpYZA636tAmwZmEoU
	DOhomVmEvDPWdcjmauwwP/LHRL7hX3N7BqLD/1jQ49c3hDbPHMHaYP5G1CWfAYJYwjl3BgxOfQ3
	Z2PtBSKLzkopcAfHtfpWoDvsKCC/xqcfSWopNvi8igxZZSN6WkC/qV2RIIoJcQlRPjNReaB7GNg
	DogSosJt9OLA47TizVnOY0Dfnvkb3caLhBcXaepTqoEOPBy+fP7BAICpwfEMoau/qxlKHfJAcGm
	TeQ+yfc3EvlW6GhFGlnmeE2URcd5h6vM4EI9A7Am+ozHWoIuf8nIK+xrUelXrnAVlxwitEEshuU
	SBTypPpwpC295KhjcJxBfuvhIsvxbDaI7rWPJd2XAy5fP2lo4SNMTvuVcxqdKJIj0BgsrZo43Qa
	PGOQL2lVXuKd8mS3+3uJp5thLm47DE6P/Ofdr2ejcro8e71E6TjSWGA83SDbPW+iL+Cisej3JQt
	rY1jEDvqDJJYMPNCdclTwQGk2pldOtXzu3V862YVn/81FUQNiF357NYmcHFSXteOzX6GXzorwGS
	98EDNeB56yDIOr2hVPctuIinU8X+2zP3RrsFp4j83SmfIphu6vvBQl1B18Ss5ndVFApLrGYnBvo
	xZdxlGIFTm4Dstr+clVzoEpYF19zpXCceqONyMJ7eAsp57LUEmAykgtvmL7NygRCXFH09cYJuBT
	7gMCnoSyA+G7DBUxdm/RKGEJvLWizbNcA+knaxTX1ZrpismlC3JJ13PLZg/E1Ljq05ni9W+SUBg
	RV2ld7YMomU6OvJOePB40KzfmkE1bc+3c+Tx2r8d9t/i6RAg9ZzkikfmS61qBOAwz6rN/keHMg=
	=
X-Received: by 2002:a05:6402:5411:b0:6ba:1f74:ba6b with SMTP id 4fb4d7f45d1cf-6ba37eed98fmr8090525a12.36.1795441308127;
        Mon, 23 Nov 2026 05:41:48 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:47 -0800 (PST)
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
Subject: [PATCH ath-next v1 10/10] wifi: ath11k: give the refill buffers their ids a chunk at a time
Date: Mon, 23 Nov 2026 14:41:37 +0100
Message-ID: <20261123134137.718575-11-julius@bairaktaris.de>
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

The refill takes the buffer table lock of the refill ring once per
buffer, and the cache line of the lock moves between the CPUs of the REO
rings, whose reaps take it for every frame: in a profile of bridged
uplink at 850 Mbit/s (IPQ8074, one run) the compare-and-swap of that
spin_lock() in ath11k_dp_rxbufs_replenish() takes 0.84 % of all samples.

Allocate the buffers of a chunk of up to 16 first, outside the lock, and
give them their ids under one hold of it. A buffer that gets no id or no
ring entry goes back and ends the refill with what is on the ring, as an
allocation failure does. The reaps still hold the lock for one table
entry at a time, so they wait at most for 16 id operations.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 142 +++++++++++++++---------
 1 file changed, 92 insertions(+), 50 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 313a39f15781..a85edaf19bfb 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -497,12 +497,65 @@ static struct sk_buff *ath11k_dp_rx_pp_alloc_skb(struct dp_rxdma_ring *rx_ring)
 	return skb;
 }
 
+/*
+ * The refill takes buffer ids for this many buffers under one hold of the
+ * buffer table lock, which the reaps of every REO ring take too.
+ */
+#define ATH11K_DP_RX_REFILL_CHUNK	16
+
+/* A buffer for the refill of @rx_ring and the address the device writes it at */
+static struct sk_buff *ath11k_dp_rx_refill_alloc(struct ath11k_base *ab,
+						 struct dp_rxdma_ring *rx_ring,
+						 dma_addr_t *paddr)
+{
+	struct sk_buff *skb;
+
+	if (rx_ring->page_pool) {
+		skb = ath11k_dp_rx_pp_alloc_skb(rx_ring);
+		if (skb)
+			*paddr = ath11k_dp_rx_pp_dma_addr(skb);
+		return skb;
+	}
+
+	skb = dev_alloc_skb(DP_RX_BUFFER_SIZE + DP_RX_BUFFER_ALIGN_SIZE);
+	if (!skb)
+		return NULL;
+
+	if (!IS_ALIGNED((unsigned long)skb->data, DP_RX_BUFFER_ALIGN_SIZE))
+		skb_pull(skb, PTR_ALIGN(skb->data, DP_RX_BUFFER_ALIGN_SIZE) -
+			      skb->data);
+
+	*paddr = dma_map_single(ab->dev, skb->data,
+				skb->len + skb_tailroom(skb), DMA_FROM_DEVICE);
+	if (dma_mapping_error(ab->dev, *paddr)) {
+		dev_kfree_skb_any(skb);
+		return NULL;
+	}
+
+	return skb;
+}
+
+/* Frees a buffer ath11k_dp_rx_refill_alloc() gave that is not on the ring */
+static void ath11k_dp_rx_refill_free(struct ath11k_base *ab,
+				     struct dp_rxdma_ring *rx_ring,
+				     struct sk_buff *skb, dma_addr_t paddr)
+{
+	if (!rx_ring->page_pool)
+		dma_unmap_single(ab->dev, paddr, skb->len + skb_tailroom(skb),
+				 DMA_FROM_DEVICE);
+	dev_kfree_skb_any(skb);
+}
+
 /* Returns number of Rx buffers replenished */
 int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 			       struct dp_rxdma_ring *rx_ring,
 			       int req_entries,
 			       enum hal_rx_buf_return_buf_manager mgr)
 {
+	struct sk_buff *skbs[ATH11K_DP_RX_REFILL_CHUNK];
+	dma_addr_t paddrs[ATH11K_DP_RX_REFILL_CHUNK];
+	int ids[ATH11K_DP_RX_REFILL_CHUNK];
+	int n, got, ided, i, j;
 	struct hal_srng *srng;
 	u32 *desc;
 	struct sk_buff *skb;
@@ -528,70 +581,59 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 	num_remain = req_entries;
 
 	while (num_remain > 0) {
-		if (rx_ring->page_pool) {
-			skb = ath11k_dp_rx_pp_alloc_skb(rx_ring);
-			if (!skb)
-				break;
-
-			paddr = ath11k_dp_rx_pp_dma_addr(skb);
-		} else {
-			skb = dev_alloc_skb(DP_RX_BUFFER_SIZE +
-					    DP_RX_BUFFER_ALIGN_SIZE);
+		n = min(num_remain, ATH11K_DP_RX_REFILL_CHUNK);
+		for (got = 0; got < n; got++) {
+			skb = ath11k_dp_rx_refill_alloc(ab, rx_ring, &paddr);
 			if (!skb)
 				break;
-
-			if (!IS_ALIGNED((unsigned long)skb->data,
-					DP_RX_BUFFER_ALIGN_SIZE)) {
-				skb_pull(skb,
-					 PTR_ALIGN(skb->data,
-						   DP_RX_BUFFER_ALIGN_SIZE) -
-					 skb->data);
-			}
-
-			paddr = dma_map_single(ab->dev, skb->data,
-					       skb->len + skb_tailroom(skb),
-					       DMA_FROM_DEVICE);
-			if (dma_mapping_error(ab->dev, paddr))
-				goto fail_free_skb;
+			skbs[got] = skb;
+			paddrs[got] = paddr;
 		}
 
 		/* bottom halves are off with the ring lock */
 		spin_lock(&rx_ring->bufs_lock);
-		buf_id = ath11k_dp_rx_buf_get_id(rx_ring, skb);
+		for (ided = 0; ided < got; ided++) {
+			buf_id = ath11k_dp_rx_buf_get_id(rx_ring, skbs[ided]);
+			if (buf_id <= 0)
+				break;
+			ids[ided] = buf_id;
+		}
 		spin_unlock(&rx_ring->bufs_lock);
-		if (buf_id <= 0)
-			goto fail_dma_unmap;
-
-		desc = ath11k_hal_srng_src_get_next_entry(ab, srng);
-		if (!desc)
-			goto fail_idr_remove;
-
-		ATH11K_SKB_RXCB(skb)->paddr = paddr;
 
-		cookie = FIELD_PREP(DP_RXDMA_BUF_COOKIE_PDEV_ID, mac_id) |
-			 FIELD_PREP(DP_RXDMA_BUF_COOKIE_BUF_ID, buf_id);
+		for (i = 0; i < ided; i++) {
+			desc = ath11k_hal_srng_src_get_next_entry(ab, srng);
+			if (!desc)
+				break;
 
-		num_remain--;
+			ATH11K_SKB_RXCB(skbs[i])->paddr = paddrs[i];
 
-		ath11k_hal_rx_buf_addr_info_set(desc, paddr, cookie, mgr);
-	}
+			cookie = FIELD_PREP(DP_RXDMA_BUF_COOKIE_PDEV_ID, mac_id) |
+				 FIELD_PREP(DP_RXDMA_BUF_COOKIE_BUF_ID, ids[i]);
 
-	ath11k_hal_srng_access_end(ab, srng);
+			num_remain--;
 
-	spin_unlock_bh(&srng->lock);
+			ath11k_hal_rx_buf_addr_info_set(desc, paddrs[i], cookie,
+							mgr);
+		}
 
-	return req_entries - num_remain;
+		/*
+		 * A buffer that got no id or no ring entry goes back, and the
+		 * refill ends with what is on the ring.
+		 */
+		if (i < got) {
+			spin_lock(&rx_ring->bufs_lock);
+			for (j = i; j < ided; j++)
+				ath11k_dp_rx_buf_put_id(rx_ring, ids[j]);
+			spin_unlock(&rx_ring->bufs_lock);
+			for (j = i; j < got; j++)
+				ath11k_dp_rx_refill_free(ab, rx_ring, skbs[j],
+							 paddrs[j]);
+			break;
+		}
 
-fail_idr_remove:
-	spin_lock(&rx_ring->bufs_lock);
-	ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
-	spin_unlock(&rx_ring->bufs_lock);
-fail_dma_unmap:
-	if (!rx_ring->page_pool)
-		dma_unmap_single(ab->dev, paddr, skb->len + skb_tailroom(skb),
-				 DMA_FROM_DEVICE);
-fail_free_skb:
-	dev_kfree_skb_any(skb);
+		if (got < n)
+			break;
+	}
 
 	ath11k_hal_srng_access_end(ab, srng);
 
-- 
2.53.0

