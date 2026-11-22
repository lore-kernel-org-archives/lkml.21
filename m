Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371138;
	b=ehHtiZJastGxxzvdYDI4uwJVRVg8RWysfsrNZ2Ph7vmktFdoYRpQsvuyEQ9/GShQ9NzN
	 6vwdSIlg0H6KavHATXCT1eolOZxRTEA+sZrHebUEIHp2VzZA5vDxwpNxqhqRkeBoIS8BY
	 yKhGNbVoQA0Ei9NXlQ1qtooT43INnPs4z4o7UMS0nj8B+7Xze58+SweY0jUw1SU59SwUK
	 INMfcg0pcvNMMqg12IqdPKWZPfPlFS0eBYE+w2xsCyF3D+Xgrnb0YlvAO4MfWCJfUs/Gl
	 L0tu0fiiVSl/YdMV/MdPIOZ9EnkNazLtRPcA5F0tw3a2Qr6f+or5WI+rkDER3NOe3wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eil5Or1kTjxXApsN+46KoMKUA0/qV6GEUo9vYFMijv4=;
	b=DaYM+e/Z7kW3BWnAECx2bXW1uu8E6oD4N9nw6qbCCzV2Wmzf3kRFr2Qcv6zZ7Lg/oMIA
	 /S3DCEdkq5GDyEShqXWLhQ2xU8cS/eyR58azpJpKeUQcfIZS1WWdluzVAmmQ7qHE7fx4k
	 IyvT3d0YOCgT69nDfdG1nmYXdaJz/pwVFTvxmKwCLfHIylH2p+2brQ0xwShMSYsiTHnAH
	 XL6Zej0RWapeIfpU4aKSQeyaq3ovsnumC7JpBJy+CBg0AeQkweceYlcvglQ5xJorP/KP0
	 diR7k0+3rrDsHolvSK/ouqFbC3eMKehQEV7m7nTPg/KGE6vFnhCzkjaE5QVFn1WQUzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=mRpfeKOK;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534E3606A33F
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 534E3606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=mRpfeKOK
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6ba380cd8dbso3237444a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371137; x=1795975937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eil5Or1kTjxXApsN+46KoMKUA0/qV6GEUo9vYFMijv4=;
        b=mRpfeKOKXxANjPT0/9tD/ZIzFDfKfQQ+c08Okc8EnLW2u5M44uzf99kMj1ll2FK5Qp
         VbRZahUBrv+umkCTGl2MV/3VN1/jwu16aIcg8SqMkpF1p/TL48SiaAhH4QjAuFYb0sNY
         QocUG99J0MfzfgEu1RL3qRqs/qP02YQDib3bMvAim6j+DEXOJCa6M5FDyfFOY7SDPIp6
         L3UJGGNgGaFstQ6oTJbe2FKNik4N1c7eMFSTONvTkH8fLF4vaRNM6LKMIfsCwXkHSLtE
         LdFFxSn4FWZI9WiBg2humstQ9vg/hUTzfw6tNGQNU49JL1UEm67PdzDdgX4noGrxIYDs
         AK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371137; x=1795975937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eil5Or1kTjxXApsN+46KoMKUA0/qV6GEUo9vYFMijv4=;
        b=jN0xmQkecMlvp83nHDNriU3r8c8TcbLhDEgu9izLWNbFsIjXzFjpGTvkckgaG7z9cj
         YreXtvyZP7mwjP/CzV9ddYsTtZwJ4pt9l273PzGCtmaGx6xEixHq/8/XHPaozhuqiOc2
         I3w6UGFQAPqqZ75c8VlOxA5w+C9O4nXU/BBn0FNFmXXBPiwCeIbLVHFXN3p6GLEy092D
         CHdCcaaIPOM9zIeZfzw9+uETjbb7dCbqRPCS2YAIjhnW8XzFYpYZxQadX7WAN3kjUdCW
         3sD72qtJWRKeAb99wYL0J/fkjZll5LwsEte+glID5QzPuqc2a4HX404+3fR6fdMBSRKP
         IYCg==
X-Forwarded-Encrypted: i=1; AL+hErHig6ziTR76tjlD0qCq2cxrwdzUQkpUfNvOCs2fwYrNp6T4lbt8k6zZoNBM3UBsFafl5ifq3HAmULsB8lk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3BoVgVUTa09JvAJ2gyqk7guEbNM2SdUtU0klgse9yXrnotxUN
	gQhtU5Z+uc5JGT5FJpDWTwkPyU8KDDPeygNjU0Z6be5BTGM+S8NTEkDjYPalcza7iQ==
X-Gm-Gg: AZFdTZd0dwlpjwaoDgNJgYcDP4R4lDqmsQ/1JEJG6FzLIMpvxqGj+U1xSYf+hjapBWA
	Xm4mspO9RBkPZkyphvb4ntBmg9I2u5KQiGw0jRLiIj9QIOHEhdgJmR3kQu9Xl8HEESj9Qj+ZFfK
	iR7QRHO20yYQU0fvYgrle45NbzoPJETgKDzrP0xrxREXv27N3bltG1LZiUmKxqfNL1kkYqgkYoC
	wfeMMad0IGqI4JH55F7jiEO4q4nL8kI9P787mwme7m8CVITIZOOK6R+zm9Fe5syN+myFfGmjtJz
	/l3UHDb7trnuLZj9BJIkywu7B+wHv5IdDQSCQQykjPs0hF8RDRec47xP74jSILd4q9v20inZXa2
	fBXlUfX88WnGAHA+4lgt3M6ypSLSgXWB6M/Q7lU9w/xN9bASi0cZUOFTxDE+K7S6LgGFBQ9Xiuz
	gvwe9wfT1un0osy/jubX729M/DXY+f49zIQh1Ah2MdJoX9pKgU/9WiByBeEhakvpzV67q9bv4N1
	qhPRdjp0g0NutQn6YvwFUa/STPyX/9VWJlcittOlF5pPrSYyMl4AjSpmHE0hJVJMjyvWYvw9ztM
	+azluwwNFaw6LjHCw7B1GZfBrhNo8nq1X9r4Jr5AopBU3m09qeLeJwC5iKAWDcoRsFoeh7q2Zv+
	5IxhY9sPFNuTwGxhLf+aDdXuv1eyhEl/78T1S3ST2qqJmOFjzUIQXhrmGXcuzwVi3v/haW09DTC
	sukKL8XmIXgvJIi9O8QxhLpnQQHK4/JocueXKC60syW+l3TYZcHk98FKQFWodzzoy/GONELRx6j
	QbCwtme5mnoAmfBpAxeMDvQORQJGH9SSqC+6sWCn0HN6iieYGOuTSkYY5e9nZoeNjfeaMaRGCeW
	LnBSm8nX/aAqH8YQWCX4U0GvnZEm4Tav0Tjw0kyOKfnMxoRiYeykzMZjp4fe4fu4dP38XqobczL
	VJV45cd1pADJcLOwKO7o=
X-Received: by 2002:aa7:c148:0:b0:6b7:8444:a44e with SMTP id 4fb4d7f45d1cf-6ba37cc0b7cmr4557133a12.4.1795371136615;
        Sun, 22 Nov 2026 10:12:16 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:15 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 2/9] wifi: ath11k: fill the TCL ring once per dequeue run
Date: Sun, 22 Nov 2026 19:12:06 +0100
Message-ID: <20261122181213.1016590-3-julius@bairaktaris.de>
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

Each frame a TXQ hands over took the TCL ring lock twice, read the
hardware tail pointer three times and wrote the head pointer once. Take
the ring once for the whole dequeue run instead: read the free count at
the start, queue the frames on that ring and write the head pointer after
the last one. ath11k_dp_tx() takes the ring the caller holds and does not
fall back to another ring while it is held.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 37 ++++++++++----
 drivers/net/wireless/ath/ath11k/dp_tx.h |  2 +-
 drivers/net/wireless/ath/ath11k/mac.c   | 68 ++++++++++++++++---------
 3 files changed, 72 insertions(+), 35 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 4f509771d60a..bd5edab32a1f 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -108,8 +108,13 @@ bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring)
 	return atomic_read(&tx_ring->num_txbuf) < DP_TX_IDR_SIZE - 1;
 }
 
+/*
+ * A caller that passes @held_ring holds that TCL ring's lock with an access
+ * open, and ends the access itself once it has queued its last frame; the frame
+ * goes on that ring or not at all.
+ */
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
-		 struct ath11k_sta *arsta, struct sk_buff *skb)
+		 struct ath11k_sta *arsta, struct sk_buff *skb, int held_ring)
 {
 	struct ath11k_base *ab = ar->ab;
 	struct ath11k_dp *dp = &ab->dp;
@@ -137,7 +142,10 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 	pool_id = skb_get_queue_mapping(skb) & (ATH11K_HW_MAX_QUEUES - 1);
 
-	ring_selector = ab->hw_params.hw_ops->get_ring_selector(skb_get_queue_mapping(skb));
+	if (held_ring >= 0)
+		ring_selector = held_ring;
+	else
+		ring_selector = ab->hw_params.hw_ops->get_ring_selector(skb_get_queue_mapping(skb));
 
 tcl_ring_sel:
 	tcl_ring_retry = false;
@@ -157,7 +165,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
 	if (unlikely(ret < 0)) {
-		if (ring_map == (BIT(num_tx_rings) - 1) ||
+		if (held_ring >= 0 || ring_map == (BIT(num_tx_rings) - 1) ||
 		    !ab->hw_params.tcl_ring_retry) {
 			atomic_inc(&ab->soc_stats.tx_err.misc_fail);
 			return -ENOSPC;
@@ -256,11 +264,17 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	hal_ring_id = tx_ring->tcl_data_ring.ring_id;
 	tcl_ring = &ab->hal.srng_list[hal_ring_id];
 
-	spin_lock_bh(&tcl_ring->lock);
-
-	ath11k_hal_srng_access_begin(ab, tcl_ring);
+	if (held_ring < 0) {
+		spin_lock_bh(&tcl_ring->lock);
+		ath11k_hal_srng_access_begin(ab, tcl_ring);
+	}
 
 	hal_tcl_desc = (void *)ath11k_hal_srng_src_get_next_entry(ab, tcl_ring);
+	if (unlikely(!hal_tcl_desc && held_ring >= 0)) {
+		ab->soc_stats.tx_err.desc_na[ti.ring_id]++;
+		ret = -ENOSPC;
+		goto fail_unmap_dma;
+	}
 	if (unlikely(!hal_tcl_desc)) {
 		/* NOTE: It is highly unlikely we'll be running out of tcl_ring
 		 * desc because the desc is directly enqueued onto hw queue.
@@ -287,11 +301,12 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	ath11k_hal_tx_cmd_desc_setup(ab, hal_tcl_desc +
 					 sizeof(struct hal_tlv_hdr), &ti);
 
-	ath11k_hal_srng_access_end(ab, tcl_ring);
-
-	ath11k_dp_shadow_start_timer(ab, tcl_ring, &dp->tx_ring_timer[ti.ring_id]);
-
-	spin_unlock_bh(&tcl_ring->lock);
+	if (held_ring < 0) {
+		ath11k_hal_srng_access_end(ab, tcl_ring);
+		ath11k_dp_shadow_start_timer(ab, tcl_ring,
+					     &dp->tx_ring_timer[ti.ring_id]);
+		spin_unlock_bh(&tcl_ring->lock);
+	}
 
 	ath11k_dbg_dump(ab, ATH11K_DBG_DP_TX, NULL, "dp tx msdu: ",
 			skb->data, skb->len);
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 760251c68b93..380e35e354f5 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -20,7 +20,7 @@ struct ath11k_dp_htt_wbm_tx_status {
 void ath11k_dp_tx_update_txcompl(struct ath11k *ar, struct hal_tx_status *ts);
 int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
-		 struct ath11k_sta *arsta, struct sk_buff *skb);
+		 struct ath11k_sta *arsta, struct sk_buff *skb, int held_ring);
 bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring);
 int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
 				    int budget);
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index a0f1451a8faf..090df2f1cadf 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6521,7 +6521,7 @@ static int ath11k_mac_mgmt_tx(struct ath11k *ar, struct sk_buff *skb,
 
 static int ath11k_mac_tx(struct ieee80211_hw *hw,
 			 struct ieee80211_tx_control *control,
-			 struct sk_buff *skb)
+			 struct sk_buff *skb, int held_ring)
 {
 	struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB(skb);
 	struct ath11k *ar = hw->priv;
@@ -6559,7 +6559,7 @@ static int ath11k_mac_tx(struct ieee80211_hw *hw,
 	if (control->sta)
 		arsta = ath11k_sta_to_arsta(control->sta);
 
-	ret = ath11k_dp_tx(ar, arvif, arsta, skb);
+	ret = ath11k_dp_tx(ar, arvif, arsta, skb, held_ring);
 	if (unlikely(ret)) {
 		ath11k_warn(ar->ab, "failed to transmit frame %d\n", ret);
 		ieee80211_free_txskb(ar->hw, skb);
@@ -6572,7 +6572,7 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
 			     struct ieee80211_tx_control *control,
 			     struct sk_buff *skb)
 {
-	ath11k_mac_tx(hw, control, skb);
+	ath11k_mac_tx(hw, control, skb, -1);
 }
 
 void ath11k_mac_drain_tx(struct ath11k *ar)
@@ -10118,7 +10118,7 @@ static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 	struct hal_srng *tcl_ring;
 	struct sk_buff *skb;
 	u32 ring_selector;
-	int num_free;
+	int num_free, avail;
 	int ret;
 	u8 ring_id;
 
@@ -10132,38 +10132,60 @@ static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 	 * TCL ring or MSDU idr ends the whole round before a frame is taken
 	 * from the queue, and so does a frame the hardware refuses anyway,
 	 * as long as a frame in flight will restart it.
+	 *
+	 * The run holds the TCL ring for its whole length: the free count is
+	 * read once and the head pointer written once, after the last frame,
+	 * rather than per frame. The head pointer is a device register, which
+	 * is not written while the firmware restarts or when no frame was
+	 * added.
 	 */
-	while (1) {
+again:
+	if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags)))
+		return -ESHUTDOWN;
+
+	spin_lock_bh(&tx_ring->wake_tx_lock);
+	spin_lock_bh(&tcl_ring->lock);
+	ath11k_hal_srng_access_begin(ar->ab, tcl_ring);
+	num_free = ath11k_hal_srng_src_num_free(ar->ab, tcl_ring, false);
+	avail = num_free;
+
+	ret = 0;
+	while (num_free) {
 		if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH,
 				      &ar->ab->dev_flags)))
 			break;
 
-		spin_lock_bh(&tx_ring->wake_tx_lock);
-
-		spin_lock_bh(&tcl_ring->lock);
-		num_free = ath11k_hal_srng_src_num_free(ar->ab, tcl_ring, true);
-		spin_unlock_bh(&tcl_ring->lock);
-
-		if (num_free == 0 || !ath11k_dp_tx_idr_has_room(tx_ring)) {
-			spin_unlock_bh(&tx_ring->wake_tx_lock);
-			if (ath11k_mac_mark_txq_starved(ar, txq->ac))
-				return -ENOSPC;
-			continue;
+		if (!ath11k_dp_tx_idr_has_room(tx_ring)) {
+			ret = -ENOSPC;
+			break;
 		}
 
 		skb = ieee80211_tx_dequeue(hw, txq);
-		if (!skb) {
-			spin_unlock_bh(&tx_ring->wake_tx_lock);
+		if (!skb)
 			break;
-		}
 
-		ret = ath11k_mac_tx(hw, &control, skb);
+		ret = ath11k_mac_tx(hw, &control, skb, ring_id);
+		if (unlikely(ret == -ENOSPC || ret == -ENOMEM))
+			break;
+		ret = 0;
+		num_free--;
+	}
 
-		spin_unlock_bh(&tx_ring->wake_tx_lock);
+	if (num_free != avail &&
+	    likely(!test_bit(ATH11K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags))) {
+		ath11k_hal_srng_access_end(ar->ab, tcl_ring);
+		ath11k_dp_shadow_start_timer(ar->ab, tcl_ring,
+					     &ar->ab->dp.tx_ring_timer[ring_id]);
+	}
+	spin_unlock_bh(&tcl_ring->lock);
+	spin_unlock_bh(&tx_ring->wake_tx_lock);
 
-		if (unlikely(ret == -ENOSPC || ret == -ENOMEM) &&
-		    ath11k_mac_mark_txq_starved(ar, txq->ac))
+	if (!num_free)
+		ret = -ENOSPC;
+	if (unlikely(ret == -ENOSPC || ret == -ENOMEM)) {
+		if (ath11k_mac_mark_txq_starved(ar, txq->ac))
 			return ret;
+		goto again;
 	}
 
 	return 0;
-- 
2.53.0

