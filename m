Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371113;
	b=b+/zzIKFhOXn616b+0L+5dtraxpOBJwB/XFme91um+m5KpTKO+O7daxmkbDIUaIwv19H
	 ryp5FwC8qlGooS24aobzrml+NqnjvkqrElPs3x0elvPIuk+Tf3oKcFwBEczQBD4d400di
	 B99ry1xDVHlG4AZ2PXgbjuVYWXDrONK/i8fsC2ZWh2yNFu+Dv2efdadQ3o9fTmyKDuO3W
	 dXCdL4cL/0pwxRTHGksXqbEESR01EBffXKu7OpMnmPyLyERMualSj6xjpn4McjSo/n0GP
	 bL7ihPbRaI6IOJn48gfYZVtY/7AnKvrJajZtqbdPPumBT5YnwRjCIn3LBR9PoQ975BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u1Tw1aT0cYq0nfbsxqxhp0yxACH3DD8+q+sLIF8m4To=;
	b=LzjC8ldqYavDPvD2/4GrxEHsBHWbrr93WiFaM0DjsnPHsmOXcJpdkDsPuDQEAYvgzVU5
	 I0mPR4t2BDO6PiwFatlDVKFQCwOwGI3gcXWgYA+zhmqwjPdnfl606jUdt0DBrEVrXfpHW
	 LgUyq40+1KiD8j9NWXGeS2DMyvNt1dv8Eytfp4XndzOO1UXIPLomm2NLnzO2qjR14oRzk
	 yQQCU55U2u1H4DSS0xyJWvcRJKFxuhVhenTfrMRs5PDmxTKgUJOad7wSS88uqmp8wH3sd
	 og1mzPSZ0OeR0YbskPEH27wzYy5JSAinRj/6mdfARiXqMblovkQD/JF5IOt6Wjp/hIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=lv9CfTdk;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94B3606A69E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E94B3606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=lv9CfTdk
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50aaad19fbso287354566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371110; x=1795975910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u1Tw1aT0cYq0nfbsxqxhp0yxACH3DD8+q+sLIF8m4To=;
        b=lv9CfTdknAfAD6Op2Lw04B4WaOjbaDOB32iS4u4Oavu6EQi7NbsAh7Zk9ppD9B7uLM
         6tPTVNuYYMOcex/kUr8D6x9/qnZdDNq5AhGi+yRkExYP4JhY7VUiBUOiVtoonh6qbSwU
         f03amgh3FlhBjAc0Qg2oHP8aTq9rX0CSObHr8Yez+1GOFDZUgk5XGipl5dg2A4u19Ms7
         vNz1vDGpa1q6yCHtsFmsl71ZRkEiIgjKZHFzy1Z6p47/9bd8jx/el5+Iz4Cqy5zAIlKH
         Rm1cWF2JceICjRrdHisObhqE2A3KR4TsqjZ1EKHMaz286JsVFLSvVb296d2+CT8YAz+Y
         eMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371110; x=1795975910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u1Tw1aT0cYq0nfbsxqxhp0yxACH3DD8+q+sLIF8m4To=;
        b=tgYAvBvwDN+3X+wELREhKGbbf+ngWPt/+wY0dXjZOLimWs4ZxSuwXysbNrp5RdCBXk
         SqdVkuZi2D8lFfdXuOVl1OlGNg3Ap/IReMgDiwgFpl8lkGsGVapADst1ekgSlpnGOiI8
         Z7kw4JEKt7UvrRZ0vPH9RQERhyofp9xiQ6h0YixfP6P+pSgBAJsUnmUEiza1E/fmCJLf
         AAwdG4wSFQsKl210RdHQbe82+JtKBp8dG/LfN6Tild4j1GEjpm8gIQXRWBaBGaEv685c
         rtY3DKHIMU6AkEEpvub5m7kd2a20InIqB37o3YeljRn2DWkeAxV6EraDA9fUzSmFEDSR
         9F0g==
X-Forwarded-Encrypted: i=1; AL+hErF0PvBzBUr6O1RkuLb4nZk8kaXAS4SyUbhjc+hQ3n4cKutNtvAd8Q+wtsXe1p92IqtTekOhsM5JiEIVNCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZKV8N4xtfFEtsd/y1/d3vHcdFKIZqKYCsR/HmtzFHCLAPOiZf
	V+WKFpyCTDKyZB92m5C7Np2Y+HnqZmcTt3Y3U3mWX/UiBf10wa7mWWOQjGheXVOgXg==
X-Gm-Gg: AZFdTZczEYZZQCeONjOPDkB0uya5JMeiI3UH9gItclDTYrLT7weLB53YWuIrrYRIQKu
	38Y9k7yNSMhHBG7MCdWow630Zxjfs8ZpzwXXaKm7yw6Hf1X23sSOMPXXW8dcy0OSIilUZXCTCJ/
	EnSjpobpijsF4IF747iVug2vAXp3IHNPwvFU3bWQQAEKGhoocWWkQY6+RRTrm59Zb6qlszMWtcY
	F3BPupDR9CpvhTUUSYDgvx/2Z2f5KPrS1iU/aLgGc9lRQYG4TtGjIUjhCMVaMe2F6hsgs+8W4o2
	ZvnQs/53OzSnOBQCZ0DJZirhoJMoIXeAnyi/BFpmZIQdkimk6/oliXiTc4PYZOsMZxkZBP2Ae1W
	ykHuH8RvCq7FwNCLdVZljmJeb3y4ClI0wY7yrR7is+w72ar5wla8Kn91iyZnx90V6dajXitFLdp
	Wfm2dyGO16NSQ8K5XJGFqUkuwaaTY5A7MK2NwgY6O/RIQkQ2Rp5ItC74yJhFsQSf5vKZd3AdJTc
	ikkOrNtDXHpCMnwclNNJVI0yaM5jI3Y/Es0otVGtpM46AY5bnoBimd6QTuhLdZoh/UPeN7QilmI
	Gdt+A/Rre6H4HkwBhIVx4bWnllQRoQFcnPNhmfu8WKxF983VdvOrOz19hSqHoCvrSY1YyQiEZ33
	o3Je0E3QFCtiU0KXZJgZi+rMTsKdl1MvGDXT8E2z+nMbNpgsE1npMGbNOCGZF62EyjGXPquDxsK
	na6TEBv6A+vA+7otncCfzFeEupRiD58fVVHxoTbg4mE0R2PCaOFmx65AUuGqvheN++9fK+QXdmY
	+ciqSOliMwiuFpFC9QkAQvfUDDtUeUWWbEjy2ZwALEJlNqPVEqfooAJIK/ADUhylJRNOgfGIHb3
	TuPz+cvqACSad8+R+/FyouAXdGLrRr+0VkWORwsA0kNo2zAM2afe8cxjtJgaCfKZF5rEDubp
X-Received: by 2002:a17:907:73cd:b0:c40:38b5:d784 with SMTP id a640c23a62f3a-c513a614467mr750479466b.22.1795371110347;
        Sun, 22 Nov 2026 10:11:50 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:49 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk,
	Christopher Griffin <christophergriffin05@gmail.com>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v6 8/9] wifi: ath11k: stop a scheduling round when the hardware is full
Date: Sun, 22 Nov 2026 19:11:44 +0100
Message-ID: <20261122181145.1015729-9-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181145.1015729-1-julius@bairaktaris.de>
References: <20261122181145.1015729-1-julius@bairaktaris.de>
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

A round dequeues a frame from mac80211 before ath11k_dp_tx() can refuse
it, and ath11k_mac_tx() then frees it. ath11k_dp_tx() returns -ENOSPC
when the ring's MSDU idr, DP_TX_IDR_SIZE - 1 ids, is full and -ENOMEM
when no TCL descriptor is free or a DMA mapping fails. Without airtime
queue limits, as with aql_enable off, nothing keeps the frames in flight
below that.

Count the ids in use per ring and end the round before a dequeue when
the idr or the TCL ring has no room, so a frame leaves the queue only
when it can be sent. A frame refused anyway, because one sent outside a
round took the last slot, still ends the round and leaves the frames
behind it queued; other errors concern only the frame. A category whose
round ended this way may have nothing of its own in flight, so mark it
and start its round from the next tx completion on the device.

Such a completion is due only while a frame is pending, so the round
ends only then. It marks the category before it reads the pending
counts, and tx completion reads the marks after the fully ordered
decrement of its frame's count, so either the round sees no frame
pending and goes on, or a completion sees the mark. With no frame
pending, a refused frame is dropped and the round goes on, as before.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h  |  2 +
 drivers/net/wireless/ath/ath11k/dp.c    |  1 +
 drivers/net/wireless/ath/ath11k/dp.h    |  6 ++-
 drivers/net/wireless/ath/ath11k/dp_tx.c | 55 +++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/dp_tx.h |  1 +
 drivers/net/wireless/ath/ath11k/mac.c   | 54 ++++++++++++++++++++----
 6 files changed, 103 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 40895d276de5f..8b7bfb0cefcf2 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -713,6 +713,8 @@ struct ath11k {
 	 * other contexts that drive it
 	 */
 	spinlock_t txq_lock[IEEE80211_NUM_ACS];
+	/* access categories whose round ended for lack of room */
+	unsigned long txq_starved;
 
 	struct list_head arvifs;
 	/* should never be NULL; needed for regular htt rx */
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 3e0a6bdfa0505..615384a4bb75e 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -1088,6 +1088,7 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
 
 	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
 		idr_init(&dp->tx_ring[i].txbuf_idr);
+		atomic_set(&dp->tx_ring[i].num_txbuf, 0);
 		spin_lock_init(&dp->tx_ring[i].tx_idr_lock);
 		spin_lock_init(&dp->tx_ring[i].wake_tx_lock);
 		dp->tx_ring[i].tcl_data_ring_id = i;
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 6d99501aa269c..bf7439e8b37d0 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -85,8 +85,12 @@ struct dp_tx_ring {
 	struct dp_srng tcl_data_ring;
 	struct dp_srng tcl_comp_ring;
 	struct idr txbuf_idr;
-	/* Protects txbuf_idr and num_pending */
+	/* Protects txbuf_idr; num_txbuf changes with it and is read without */
 	spinlock_t tx_idr_lock;
+	/* MSDU ids in use, one per frame between ath11k_dp_tx() and its
+	 * completion
+	 */
+	atomic_t num_txbuf;
 	/* Serializes wake_tx_queue operations for this ring */
 	spinlock_t wake_tx_lock;
 	struct hal_wbm_release_ring *tx_status;
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 0cdc0493f10d2..1c4cb98f89292 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -79,6 +79,35 @@ enum hal_encrypt_type ath11k_dp_tx_get_encrypt_type(u32 cipher)
 	}
 }
 
+/* The caller holds tx_ring->tx_idr_lock. */
+static struct sk_buff *ath11k_dp_tx_idr_remove(struct dp_tx_ring *tx_ring,
+					       int msdu_id)
+{
+	struct sk_buff *msdu;
+
+	msdu = idr_remove(&tx_ring->txbuf_idr, msdu_id);
+	if (msdu)
+		atomic_dec(&tx_ring->num_txbuf);
+
+	return msdu;
+}
+
+/**
+ * ath11k_dp_tx_idr_has_room() - tell whether ath11k_dp_tx() can take a frame
+ * @tx_ring: the ring the frame would go to first
+ *
+ * ath11k_dp_tx() allocates the frame's MSDU id from the ring's idr, which
+ * holds DP_TX_IDR_SIZE - 1 ids and frees one when the frame completes. A
+ * caller that takes a frame from mac80211 only to have it refused for a full
+ * idr loses the frame, so it checks first.
+ *
+ * Return: true if the idr has an id free.
+ */
+bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring)
+{
+	return atomic_read(&tx_ring->num_txbuf) < DP_TX_IDR_SIZE - 1;
+}
+
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 struct ath11k_sta *arsta, struct sk_buff *skb)
 {
@@ -123,6 +152,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	spin_lock_bh(&tx_ring->tx_idr_lock);
 	ret = idr_alloc(&tx_ring->txbuf_idr, skb, 0,
 			DP_TX_IDR_SIZE - 1, GFP_ATOMIC);
+	if (likely(ret >= 0))
+		atomic_inc(&tx_ring->num_txbuf);
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
 	if (unlikely(ret < 0)) {
@@ -274,8 +305,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 fail_remove_idr:
 	spin_lock_bh(&tx_ring->tx_idr_lock);
-	idr_remove(&tx_ring->txbuf_idr,
-		   FIELD_GET(DP_TX_DESC_ID_MSDU_ID, ti.desc_id));
+	ath11k_dp_tx_idr_remove(tx_ring,
+				FIELD_GET(DP_TX_DESC_ID_MSDU_ID, ti.desc_id));
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
 	if (tcl_ring_retry)
@@ -294,7 +325,7 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 	struct ath11k_skb_cb *skb_cb;
 
 	spin_lock(&tx_ring->tx_idr_lock);
-	msdu = idr_remove(&tx_ring->txbuf_idr, msdu_id);
+	msdu = ath11k_dp_tx_idr_remove(tx_ring, msdu_id);
 	spin_unlock(&tx_ring->tx_idr_lock);
 
 	if (unlikely(!msdu)) {
@@ -338,7 +369,7 @@ void ath11k_dp_tx_free_pending(struct ath11k_base *ab)
 
 		spin_lock_bh(&tx_ring->tx_idr_lock);
 		idr_for_each_entry(&tx_ring->txbuf_idr, msdu, msdu_id) {
-			idr_remove(&tx_ring->txbuf_idr, msdu_id);
+			ath11k_dp_tx_idr_remove(tx_ring, msdu_id);
 			__skb_queue_tail(&pending, msdu);
 		}
 		spin_unlock_bh(&tx_ring->tx_idr_lock);
@@ -366,7 +397,7 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 	struct ath11k_peer *peer;
 
 	spin_lock(&tx_ring->tx_idr_lock);
-	msdu = idr_remove(&tx_ring->txbuf_idr, ts->msdu_id);
+	msdu = ath11k_dp_tx_idr_remove(tx_ring, ts->msdu_id);
 	spin_unlock(&tx_ring->tx_idr_lock);
 
 	if (unlikely(!msdu)) {
@@ -795,7 +826,7 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 		}
 
 		spin_lock(&tx_ring->tx_idr_lock);
-		msdu = idr_remove(&tx_ring->txbuf_idr, msdu_id);
+		msdu = ath11k_dp_tx_idr_remove(tx_ring, msdu_id);
 		if (unlikely(!msdu)) {
 			ath11k_warn(ab, "tx completion for unknown msdu_id %d\n",
 				    msdu_id);
@@ -818,8 +849,18 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	/* A completion returns the airtime the frame was charged, which is
 	 * what an airtime-limited station in that access category is waiting
 	 * on. The arrivals that would otherwise start a round are themselves
-	 * queued behind that limit.
+	 * queued behind that limit. It also frees the ring space and MSDU ids
+	 * that a round ended early on any radio is waiting on. The fully
+	 * ordered decrement of num_tx_pending orders the read of the mark
+	 * after the frame is counted done.
 	 */
+	for (i = 0; i < ab->num_radios; i++) {
+		ar = ab->pdevs[i].ar;
+		if (unlikely(READ_ONCE(ar->txq_starved)))
+			push |= xchg(&ar->txq_starved, 0) <<
+				(i * IEEE80211_NUM_ACS);
+	}
+
 	for_each_set_bit(i, &push, ab->num_radios * IEEE80211_NUM_ACS)
 		ath11k_mac_tx_push_pending(ab->pdevs[i / IEEE80211_NUM_ACS].ar,
 					   i % IEEE80211_NUM_ACS);
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 9a26de411e83a..f82df5d2f6033 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -21,6 +21,7 @@ void ath11k_dp_tx_update_txcompl(struct ath11k *ar, struct hal_tx_status *ts);
 int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 struct ath11k_sta *arsta, struct sk_buff *skb);
+bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring);
 void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id);
 void ath11k_dp_tx_free_pending(struct ath11k_base *ab);
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index d17f80cbcdb5d..a0f1451a8fafe 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6519,9 +6519,9 @@ static int ath11k_mac_mgmt_tx(struct ath11k *ar, struct sk_buff *skb,
 	return 0;
 }
 
-static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
-			     struct ieee80211_tx_control *control,
-			     struct sk_buff *skb)
+static int ath11k_mac_tx(struct ieee80211_hw *hw,
+			 struct ieee80211_tx_control *control,
+			 struct sk_buff *skb)
 {
 	struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB(skb);
 	struct ath11k *ar = hw->priv;
@@ -6553,7 +6553,7 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
 				    ret);
 			ieee80211_free_txskb(ar->hw, skb);
 		}
-		return;
+		return ret;
 	}
 
 	if (control->sta)
@@ -6564,6 +6564,15 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
 		ath11k_warn(ar->ab, "failed to transmit frame %d\n", ret);
 		ieee80211_free_txskb(ar->hw, skb);
 	}
+
+	return ret;
+}
+
+static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
+			     struct ieee80211_tx_control *control,
+			     struct sk_buff *skb)
+{
+	ath11k_mac_tx(hw, control, skb);
 }
 
 void ath11k_mac_drain_tx(struct ath11k *ar)
@@ -10079,6 +10088,26 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 	return ret;
 }
 
+/* A round that stops for lack of room is restarted by the next tx completion
+ * on the device, which reads the mark after counting its frame done. Mark
+ * first, then check that a frame is still pending, or no completion is due.
+ */
+static bool ath11k_mac_mark_txq_starved(struct ath11k *ar, u8 ac)
+{
+	struct ath11k_base *ab = ar->ab;
+	int i;
+
+	set_bit(ac, &ar->txq_starved);
+	/* pairs with the decrement of num_tx_pending in tx completion */
+	smp_mb__after_atomic();
+
+	for (i = 0; i < ab->num_radios; i++)
+		if (atomic_read(&ab->pdevs[i].ar->dp.num_tx_pending))
+			return true;
+
+	return false;
+}
+
 static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 {
 	struct ieee80211_tx_control control = {
@@ -10090,6 +10119,7 @@ static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 	struct sk_buff *skb;
 	u32 ring_selector;
 	int num_free;
+	int ret;
 	u8 ring_id;
 
 	ring_selector = ar->ab->hw_params.hw_ops->get_ring_selector(txq->ac);
@@ -10099,7 +10129,9 @@ static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 
 	/* ieee80211_tx_dequeue() applies the airtime queue limit, so a
 	 * selection ends where that limit binds or the queue empties. A full
-	 * TCL ring ends the whole round.
+	 * TCL ring or MSDU idr ends the whole round before a frame is taken
+	 * from the queue, and so does a frame the hardware refuses anyway,
+	 * as long as a frame in flight will restart it.
 	 */
 	while (1) {
 		if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH,
@@ -10112,9 +10144,11 @@ static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 		num_free = ath11k_hal_srng_src_num_free(ar->ab, tcl_ring, true);
 		spin_unlock_bh(&tcl_ring->lock);
 
-		if (num_free == 0) {
+		if (num_free == 0 || !ath11k_dp_tx_idr_has_room(tx_ring)) {
 			spin_unlock_bh(&tx_ring->wake_tx_lock);
-			return -ENOSPC;
+			if (ath11k_mac_mark_txq_starved(ar, txq->ac))
+				return -ENOSPC;
+			continue;
 		}
 
 		skb = ieee80211_tx_dequeue(hw, txq);
@@ -10123,9 +10157,13 @@ static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 			break;
 		}
 
-		ath11k_mac_op_tx(hw, &control, skb);
+		ret = ath11k_mac_tx(hw, &control, skb);
 
 		spin_unlock_bh(&tx_ring->wake_tx_lock);
+
+		if (unlikely(ret == -ENOSPC || ret == -ENOMEM) &&
+		    ath11k_mac_mark_txq_starved(ar, txq->ac))
+			return ret;
 	}
 
 	return 0;
-- 
2.53.0

