Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371151;
	b=Fq2o3ZELuBJ0Nx3CALSKiwZmotDO8BCKkKeOnz3DkyzbgBOfKnLVp/adnWeJlr0l8uGG
	 5krBpdp4Srcb4dxdck+Zel7MN/0+X/RCQOnLUCilvAQgjnu6GZJ2VXqTRfswUe64brAhq
	 6WGV6i4FeHJr2ZfbdVeCOyeM+Qmven1sOeyBMHrKhj2wkvxqHgPGBotV/4dcgoUszN2uE
	 ydS7ZIsugkI2sXokA0B5nZSHOJvxWf/U/AY3fXUHxXF5l8Eh51vdati6cMtgkN2AITjJL
	 rIsSJY353YJr9xl7J2eVtFp1d/2UVIU61dlr2T0rniOEaJ8qNpJWdKeRdCjKACMbanw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g+9Vw6GD+kj8DkWaZDhjtYfJzZmDs1hAIA4ATrmqD4A=;
	b=VDAp3xbLfO9EEMM0/iROVCWDdXpUWWbBaBMB0MJL6FH+NiAC34uBJh1aJ9oHhxCTsZCK
	 1sT4HKwfb9ye750ehYhf53jTffa7lrqySOvEeu1uW+O4fnpQ/gh2qC4nBaLGQwPaHIrmG
	 u6iGJfytuBArFXw+UiIBq5koy1iT498UUrHEzp2wmOboORtM5IvQ4I9IZncgZCPGl8Jhz
	 dJdGJf7HQ7zKsFnTcv/HSVKORBLsuvt3t7tmtgL9xE0qzzx2x5btKrCv5L2pysYNiEv71
	 nDntUg4aBM5fJH5S2Yk49AN037ZSUZM7+mwDO313d/yAKl3d7PN0TGvBJRFbZ+9y9RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=n55T4atq;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C30606A33B
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C30606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=n55T4atq
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so3052040a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371149; x=1795975949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+9Vw6GD+kj8DkWaZDhjtYfJzZmDs1hAIA4ATrmqD4A=;
        b=n55T4atq0RkqaxITMJ1n9Dv2RTjlzbtf5aBwf8j8k3A9cA5QS2DknjUkkx36MhIQ+0
         J94D9QeUOAbAMKLHCRWSDP5plHTb4+ZjRJ9Rvu1ot3LP3Nugx7Kh6nhfHsqU6qFc0dg8
         uKRzUpWbgKupK0CeMhuHVYiYe4jgNpOFxzibB0tdZFs47+G1ncAx/g4LXa19IZx+oYNK
         Uy4ar3o7XRW4bUZ5OeWAyPjZlurFACG4T0+kI48ac6eNaV7JupOrNTVsZn+xt4oZi/Xs
         ZtHTIJvnABHBYWM+4z9aHCYkz3dUAEoshGVVRqZR1OSxmk3BERzQd6KdzaFwwiz8XVkP
         EhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371149; x=1795975949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+9Vw6GD+kj8DkWaZDhjtYfJzZmDs1hAIA4ATrmqD4A=;
        b=mVxRQ3NsaZfegu6lLptRC5tIYQ8KctppbLsMbIB3WwU3DZDXriYdpXAUm3X9zBwSLV
         FivjWBmb0bM3lsljphWbGa5VLYRqsfOIl5A+4WiXr7OMuh7nYP2WADYhZfOs6IgQjWKW
         vQADFWVr8hfXjklryUp3S5KTsis9hDbLLP0UuPbUHCE0NF7OD8byUHyLJxs8AYZki+wu
         iPXdv3Itx9N3Kjbx09d/DMS7kcseVUa5cURyvK5Lg5vSYMAEnJrn2SalfS/JuYxzMtD2
         GwRBqQ+KvOl+VPI45Datxg592ErkfvvAoaOFXhFcoPnBqpiy0D61QZ8hwYrDpdHWFYtW
         2Lcw==
X-Forwarded-Encrypted: i=1; AL+hErESQwHxGRhAfhfev1bPNxxDKaQGYYXj+6aLm9tdiJgzjE8Zj/uQqcKeQGZtH0yoViX9Yr9AL1S5MsxMc8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oJwMDTJTEb/kqSwfd3R2gBjQpMbZ+xQ5ZAhpI8s7LJhldd5UV
	tkPu8A6U9pLZSO0e4ORntT3muqRmHb9dNPOulMntXoOJUax/NjgkRUjmT8XNa13MbQ==
X-Gm-Gg: AZFdTZcmpwuZc6wtLgBAuQcB8IJe8M6kYV9sbtKNjb5jZs2C3MacFx3IhLf9SmjImI/
	rxEaEmyv5ANd0jyOGlYfFM5ixuEzejvAJwQTyomKpSl+mM6evUrtV7K4Gm4w+WbrSW9lGg3QME/
	L0DOpZgAEc+qJ2yUtu5I5QIWTtXzyBjoiQlc2KwQ2zNDZJi2Vpba7rv+GBD1cBlRVsfdX9AdzjQ
	FVvQxQjxznOnMuttAbOwt76mhXsGSCdplqd+DtrvrB9uIf+3Eh+Ilu5lxTRWOQGXecfXN48sncY
	iaRF8x0ENeQ9JWpBbA0XBUoeFvG9e/Q4W/7p46LYheDn1K7VM9ANDb8nORDxSLWWjfDF87eFX0c
	ALylviMcC9CPO83mFvPYZG2O1DG/u9zZz4ZVHtysJa79y5Tsa3eobALKcKIe4pvLs5Vb5KSDQU8
	/c8tM50X1aWZmJtJyHJi0phhp/lzfRRVGheqFIIG4/BjTKKKDJRPW//lhwPYHTKqnzS18kl5RGy
	/KdkmMxWO3Hd7lbP3bOkp638Ww+72eLWEJPc6KsU72lb31kwIcH+/ql2H7LVmi2rPVetR538ru3
	b1dL//euJ1DDzBUJuLVStbuf1T+ZVhydH32+2xoBma3xhq3AZQ8sk2jlbFobXa+FLEAnhPrq6Tu
	ZKgm/pLY1nzDRQdpLd+HpejsQEpQtCA0IcB6Y5q/fmtHbwmcrru3aL9k1V5SoaAj/6Onr54s4Ty
	NmNiCvs90AiGHf3D43oCcX/AOXIOH99fpbnvdQ7EXoIF/K97sojyarvEUv3mTiVZO5mWo8158+X
	3CtuKGt+KZrGcXrAVgAMHHBT+EdqaAfwFLac43EojzhyIANTTkGMycUB1rEPWPheSjXdKZoNqjw
	BPBhJwtg7VQE2tW3SYvxUvbAueuh/RH+VdNGgRBmCpxZASihSXRxLCtPSSAZmJ0VgBGQatrc
X-Received: by 2002:a05:6402:4009:b0:6b9:c43e:19df with SMTP id 4fb4d7f45d1cf-6ba37ed9a8bmr5872445a12.41.1795371149157;
        Sun, 22 Nov 2026 10:12:29 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:28 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 8/9] wifi: ath11k: give an extension descriptor the number of its buffer id
Date: Sun, 22 Nov 2026 19:12:12 +0100
Message-ID: <20261122181213.1016590-9-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181213.1016590-1-julius@bairaktaris.de>
References: <20261122181213.1016590-1-julius@bairaktaris.de>
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

A TSO segment takes a buffer id from the id stack and an MSDU extension
descriptor from a second stack, and a table indexed by id records which
descriptor the id took. Its completion reads that table, then the payload
map of the descriptor, a 36 byte entry that crosses into a second cache
line for half of the descriptors. All of these were written when the batch
was queued and are cold when its completions come: in a profile of bridged
downlink at 900 Mbit/s (IPQ8074, one run), the instruction after the load
of the segment length from the map in ath11k_dp_tx_buf_put_id() takes
1.05 % of all samples, the instructions around the load of the payload
addresses 0.42 % and the comparison of the table entry 0.19 %.

Reserve the ids below DP_TX_EXT_DESC_NUM for the extension descriptors,
id n for descriptor n, handed out from the descriptor stack, and the others
for frames sent from one buffer. The id then names its descriptor: the
table goes, together with its write at queue time and its read and reset
at completion. End the payload pieces of a map at the first of length 0,
which no mapped piece has, instead of a count, so the map is 32 bytes and,
aligned to that, never crosses a cache line. Frames sent from one buffer
keep 30719 ids, where they shared 32767 with the segments before.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp.h    | 21 +++---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 95 ++++++++++++-------------
 2 files changed, 60 insertions(+), 56 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 1bdf2f564dac..e47949ed7c4a 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -88,15 +88,18 @@ struct dp_rxdma_ring {
  * or more.
  */
 #define ATH11K_DP_TX_TSO_MAX_SEGS	64
-#define ATH11K_DP_TX_NO_EXT		0xffff
 
+/*
+ * The payload mappings of an extension descriptor, which end at the first
+ * piece of length 0 or after the last one, and the frame the descriptor
+ * makes, headers included. 32 bytes, so that the map of a completion is one
+ * cache line.
+ */
 struct ath11k_dp_tx_ext_map {
 	u32 dma[HAL_TX_MSDU_EXT_NUM_BUFS - 1];
 	u16 len[HAL_TX_MSDU_EXT_NUM_BUFS - 1];
-	/* the frame this descriptor makes, headers included */
 	u16 seg_len;
-	u8 num;
-};
+} __aligned(32);
 
 /* What a buffer id held when it was released */
 struct ath11k_dp_tx_seg {
@@ -116,16 +119,18 @@ struct dp_tx_ring {
 	u32 num_free;
 	/*
 	 * MSDU extension descriptors for TSO segments, placed by
-	 * ath11k_dp_tx_ext_off(), the payload mappings of each, the
-	 * descriptor each buffer id uses, and the ones not in use
+	 * ath11k_dp_tx_ext_off(), and the payload mappings of each. The
+	 * buffer ids below ext_ids are those of the extension descriptor of
+	 * the same number and are handed out from ext_free, the others from
+	 * free_ids.
 	 */
 	struct hal_tx_msdu_ext *ext;
 	dma_addr_t ext_paddr;
 	struct ath11k_dp_tx_ext_map *ext_map;
-	u16 *ext_slot;
 	u16 *ext_free;
 	u32 ext_num_free;
-	/* Protects bufs, free_ids, ext_slot and ext_free */
+	u32 ext_ids;
+	/* Protects bufs, free_ids and ext_free */
 	spinlock_t tx_idr_lock;
 	/* Serializes wake_tx_queue operations for this ring */
 	spinlock_t wake_tx_lock;
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 6d950afb90f1..089696bff4c8 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -114,8 +114,10 @@ static size_t ath11k_dp_tx_ext_off(unsigned int slot)
 
 /*
  * The ids a ring hands out, as a table indexed by id with a stack of the free
- * ones: the completion's cookie names the buffer directly. Callers of the id
- * helpers hold tx_idr_lock.
+ * ones: the completion's cookie names the buffer directly. The ids below
+ * ext_ids are those of the extension descriptors and have a stack of their
+ * own, so that a completion finds the descriptor of its id without a table.
+ * Callers of the id helpers hold tx_idr_lock.
  */
 int ath11k_dp_tx_bufs_init(struct ath11k_base *ab, struct dp_tx_ring *tx_ring)
 {
@@ -125,9 +127,9 @@ int ath11k_dp_tx_bufs_init(struct ath11k_base *ab, struct dp_tx_ring *tx_ring)
 				 GFP_KERNEL);
 	tx_ring->free_ids = kvcalloc(DP_TX_IDR_SIZE - 1,
 				     sizeof(*tx_ring->free_ids), GFP_KERNEL);
-	tx_ring->ext_slot = kvmalloc_array(DP_TX_IDR_SIZE - 1,
-					   sizeof(*tx_ring->ext_slot),
-					   GFP_KERNEL);
+	BUILD_BUG_ON(sizeof(struct ath11k_dp_tx_ext_map) != 32);
+	BUILD_BUG_ON(DP_TX_EXT_DESC_NUM + 1 >= DP_TX_IDR_SIZE);
+
 	if (ab->hw_params.tx_tso) {
 		tx_ring->ext = dma_alloc_coherent(ab->dev, ATH11K_DP_TX_EXT_SIZE,
 						  &tx_ring->ext_paddr,
@@ -139,24 +141,22 @@ int ath11k_dp_tx_bufs_init(struct ath11k_base *ab, struct dp_tx_ring *tx_ring)
 					     sizeof(*tx_ring->ext_free),
 					     GFP_KERNEL);
 	}
-	if (!tx_ring->bufs || !tx_ring->free_ids || !tx_ring->ext_slot ||
+	if (!tx_ring->bufs || !tx_ring->free_ids ||
 	    (ab->hw_params.tx_tso &&
 	     (!tx_ring->ext || !tx_ring->ext_map || !tx_ring->ext_free))) {
 		ath11k_dp_tx_bufs_free(ab, tx_ring);
 		return -ENOMEM;
 	}
 
-	memset(tx_ring->ext_slot, 0xff,
-	       (DP_TX_IDR_SIZE - 1) * sizeof(*tx_ring->ext_slot));
+	tx_ring->ext_ids = tx_ring->ext_free ? DP_TX_EXT_DESC_NUM : 0;
 
 	tx_ring->num_free = 0;
-	for (id = DP_TX_IDR_SIZE - 1; id--;)
+	for (id = DP_TX_IDR_SIZE - 1; id-- > tx_ring->ext_ids;)
 		tx_ring->free_ids[tx_ring->num_free++] = id;
 
 	tx_ring->ext_num_free = 0;
-	if (tx_ring->ext_free)
-		for (id = DP_TX_EXT_DESC_NUM; id--;)
-			tx_ring->ext_free[tx_ring->ext_num_free++] = id;
+	for (id = tx_ring->ext_ids; id--;)
+		tx_ring->ext_free[tx_ring->ext_num_free++] = id;
 
 	return 0;
 }
@@ -165,7 +165,6 @@ void ath11k_dp_tx_bufs_free(struct ath11k_base *ab, struct dp_tx_ring *tx_ring)
 {
 	kvfree(tx_ring->bufs);
 	kvfree(tx_ring->free_ids);
-	kvfree(tx_ring->ext_slot);
 	if (tx_ring->ext)
 		dma_free_coherent(ab->dev, ATH11K_DP_TX_EXT_SIZE,
 				  tx_ring->ext, tx_ring->ext_paddr);
@@ -173,12 +172,12 @@ void ath11k_dp_tx_bufs_free(struct ath11k_base *ab, struct dp_tx_ring *tx_ring)
 	kvfree(tx_ring->ext_free);
 	tx_ring->bufs = NULL;
 	tx_ring->free_ids = NULL;
-	tx_ring->ext_slot = NULL;
 	tx_ring->ext = NULL;
 	tx_ring->ext_map = NULL;
 	tx_ring->ext_free = NULL;
 	tx_ring->num_free = 0;
 	tx_ring->ext_num_free = 0;
+	tx_ring->ext_ids = 0;
 }
 
 static int ath11k_dp_tx_buf_get_id(struct dp_tx_ring *tx_ring,
@@ -198,10 +197,11 @@ static int ath11k_dp_tx_buf_get_id(struct dp_tx_ring *tx_ring,
 static void ath11k_dp_tx_tso_unmap(struct device *dev,
 				   struct ath11k_dp_tx_ext_map *map)
 {
-	while (map->num--)
-		dma_unmap_page(dev, map->dma[map->num], map->len[map->num],
-			       DMA_TO_DEVICE);
-	map->num = 0;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(map->len) && map->len[i]; i++)
+		dma_unmap_page(dev, map->dma[i], map->len[i], DMA_TO_DEVICE);
+	map->len[0] = 0;
 }
 
 /*
@@ -215,8 +215,8 @@ struct sk_buff *ath11k_dp_tx_buf_put_id(struct ath11k_base *ab,
 					bool *more,
 					struct ath11k_dp_tx_seg *seg)
 {
+	struct ath11k_dp_tx_ext_map *map;
 	struct sk_buff *skb;
-	u16 slot;
 
 	*more = false;
 	if (seg) {
@@ -232,18 +232,18 @@ struct sk_buff *ath11k_dp_tx_buf_put_id(struct ath11k_base *ab,
 		return NULL;
 
 	tx_ring->bufs[id] = NULL;
-	tx_ring->free_ids[tx_ring->num_free++] = id;
 
 	if (seg)
 		seg->skb = skb;
 
-	slot = tx_ring->ext_slot[id];
-	if (unlikely(slot != ATH11K_DP_TX_NO_EXT)) {
+	if (id >= tx_ring->ext_ids) {
+		tx_ring->free_ids[tx_ring->num_free++] = id;
+	} else {
+		map = &tx_ring->ext_map[id];
 		if (seg)
-			seg->len = tx_ring->ext_map[slot].seg_len;
-		ath11k_dp_tx_tso_unmap(ab->dev, &tx_ring->ext_map[slot]);
-		tx_ring->ext_free[tx_ring->ext_num_free++] = slot;
-		tx_ring->ext_slot[id] = ATH11K_DP_TX_NO_EXT;
+			seg->len = map->seg_len;
+		ath11k_dp_tx_tso_unmap(ab->dev, map);
+		tx_ring->ext_free[tx_ring->ext_num_free++] = id;
 
 		if (!skb_unref(skb)) {
 			*more = true;
@@ -507,10 +507,11 @@ static int ath11k_dp_tx_tso_map(struct device *dev, struct sk_buff *skb,
 				unsigned int len)
 {
 	struct skb_shared_info *shinfo = skb_shinfo(skb);
-	unsigned int avail, take;
+	unsigned int avail, take, num = 0;
 	dma_addr_t dma;
 
-	map->num = 0;
+	/* every piece mapped has a length, so the first 0 ends them */
+	memset(map->len, 0, sizeof(map->len));
 	while (len) {
 		if (!*piece)
 			avail = skb_headlen(skb) - *off;
@@ -523,7 +524,7 @@ static int ath11k_dp_tx_tso_map(struct device *dev, struct sk_buff *skb,
 			*off = 0;
 			continue;
 		}
-		if (map->num == HAL_TX_MSDU_EXT_NUM_BUFS - 1)
+		if (num == ARRAY_SIZE(map->len))
 			return -E2BIG;
 
 		take = min(avail, len);
@@ -538,11 +539,11 @@ static int ath11k_dp_tx_tso_map(struct device *dev, struct sk_buff *skb,
 		if (dma_mapping_error(dev, dma))
 			return -ENOMEM;
 
-		map->dma[map->num] = dma;
-		map->len[map->num] = take;
-		map->num++;
-		ext->buf[map->num].addr_lo = lower_32_bits(dma);
-		ext->buf[map->num].info =
+		map->dma[num] = dma;
+		map->len[num] = take;
+		num++;
+		ext->buf[num].addr_lo = lower_32_bits(dma);
+		ext->buf[num].info =
 			FIELD_PREP(HAL_TX_MSDU_EXT_BUF_INFO_ADDR_HI,
 				   upper_32_bits(dma)) |
 			FIELD_PREP(HAL_TX_MSDU_EXT_BUF_INFO_LEN, take);
@@ -658,7 +659,7 @@ static int ath11k_dp_tx_ext(struct ath11k *ar, struct ath11k_vif *arvif,
 	struct hal_tx_info ti = {};
 	struct dp_tx_ring *tx_ring;
 	struct hal_srng *tcl_ring;
-	u16 ids[ATH11K_DP_TX_TSO_MAX_SEGS], slots[ATH11K_DP_TX_TSO_MAX_SEGS];
+	u16 ids[ATH11K_DP_TX_TSO_MAX_SEGS];
 	u32 seq = 0, flags = 0, ip_id = 0;
 	dma_addr_t hdr_dma;
 	struct tcphdr *th;
@@ -730,15 +731,15 @@ static int ath11k_dp_tx_ext(struct ath11k *ar, struct ath11k_vif *arvif,
 	tcl_ring = &ab->hal.srng_list[tx_ring->tcl_data_ring.ring_id];
 
 	spin_lock_bh(&tx_ring->tx_idr_lock);
-	if (tx_ring->num_free < n || tx_ring->ext_num_free < n) {
+	if (tx_ring->ext_num_free < n) {
 		spin_unlock_bh(&tx_ring->tx_idr_lock);
 		return -EAGAIN;
 	}
+	/* the id of a segment is the number of its extension descriptor */
 	for (i = 0; i < n; i++) {
-		slots[i] = tx_ring->ext_free[--tx_ring->ext_num_free];
-		ids[i] = ath11k_dp_tx_buf_get_id(tx_ring, skb);
-		tx_ring->ext_slot[ids[i]] = slots[i];
-		tx_ring->ext_map[slots[i]].num = 0;
+		ids[i] = tx_ring->ext_free[--tx_ring->ext_num_free];
+		tx_ring->bufs[ids[i]] = skb;
+		tx_ring->ext_map[ids[i]].len[0] = 0;
 	}
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
@@ -765,8 +766,8 @@ static int ath11k_dp_tx_ext(struct ath11k *ar, struct ath11k_vif *arvif,
 	left = skb->len - off;
 	for (i = 0; i < n; i++) {
 		struct hal_tx_msdu_ext *ext = (void *)tx_ring->ext +
-					      ath11k_dp_tx_ext_off(slots[i]);
-		struct ath11k_dp_tx_ext_map *map = &tx_ring->ext_map[slots[i]];
+					      ath11k_dp_tx_ext_off(ids[i]);
+		struct ath11k_dp_tx_ext_map *map = &tx_ring->ext_map[ids[i]];
 		unsigned int len = tso ? min(left, mss) : left;
 		u32 seg_flags = flags;
 
@@ -861,7 +862,7 @@ static int ath11k_dp_tx_ext(struct ath11k *ar, struct ath11k_vif *arvif,
 			     FIELD_PREP(DP_TX_DESC_ID_POOL_ID,
 					skb_get_queue_mapping(skb) &
 					(ATH11K_HW_MAX_QUEUES - 1));
-		ti.paddr = tx_ring->ext_paddr + ath11k_dp_tx_ext_off(slots[i]);
+		ti.paddr = tx_ring->ext_paddr + ath11k_dp_tx_ext_off(ids[i]);
 		/* the command follows the TLV header of the ring entry */
 		desc = ath11k_hal_srng_src_get_next_entry(ab, tcl_ring);
 		ath11k_hal_tx_cmd_desc_setup(ab, desc + sizeof(struct hal_tlv_hdr),
@@ -890,18 +891,16 @@ static int ath11k_dp_tx_ext(struct ath11k *ar, struct ath11k_vif *arvif,
 
 fail_unmap:
 	for (j = 0; j < i; j++)
-		ath11k_dp_tx_tso_unmap(ab->dev, &tx_ring->ext_map[slots[j]]);
+		ath11k_dp_tx_tso_unmap(ab->dev, &tx_ring->ext_map[ids[j]]);
 	dma_unmap_single(ab->dev, hdr_dma, skb_headlen(skb), DMA_TO_DEVICE);
 fail_put:
 	if (pad)
 		ath11k_dp_tx_ext_unpad(skb, hdr_len, pad);
 	spin_lock_bh(&tx_ring->tx_idr_lock);
 	for (j = n; j--;) {
-		/* no reference was taken yet: release the id and slot only */
+		/* no reference was taken yet: release the id only */
 		tx_ring->bufs[ids[j]] = NULL;
-		tx_ring->free_ids[tx_ring->num_free++] = ids[j];
-		tx_ring->ext_slot[ids[j]] = ATH11K_DP_TX_NO_EXT;
-		tx_ring->ext_free[tx_ring->ext_num_free++] = slots[j];
+		tx_ring->ext_free[tx_ring->ext_num_free++] = ids[j];
 	}
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
-- 
2.53.0

