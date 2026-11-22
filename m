Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371137;
	b=xiwcmdftyrE/7MVvuvFoJ+so8FyyInB9O5Miok9uMVP3CqpCuN8p9qmlYsF5tlj1AcFU
	 0u8TurLRhwcTKQYe0yWf91cipd4qvXfH1RnAd2+hgl7uIeHEBbB2VUTto9QUeEL9qdZkW
	 cEvS3HAKY/oojs7ulLmuFl2JnPlTUrWzoxnmHprqqqXz8VkM01CUm1Zf56wSouVQ1fTkl
	 EWIaIrwnyt5xEwV2fOJoLahK3z7S/s+xIncqAl+4C79xL/QzXdZZeNwDRBRZ6HDnGQqn4
	 wUhIXjGwdJJ9iWyRZzmcFdHf46bYxzpVga2bNsYz4VlbcSqKzPJfZTFC4LgcxBZ/u8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TXtQuQYdk/h+VPS19Qx8ZxnBKtguIQfQlp5+pm4QqHk=;
	b=YGR3M+1d6zfsaMBEaj+cUkgtAe7UpiUATNEKHUQseNzbU4y4wVlQy/+FP2I3trOmsGmF
	 VJ2574UuCoPINFigCxwZnJ+/jRSCstrXhjZ1o7UfQKWiYizeMNf8djkUrVOXBn04WSyqY
	 oNz9BP8kXJ4a/JnMxfhks867uMGCA6ttIUX/kUBflgHpC0rigytaDm18H/OoirHQUROnK
	 OjVb6KFK1qohl/LPamX3srQow5rP7hJiVKOLg1sX3oW+HaTeSVz0GX1RPch/VrkXQYZYD
	 vBP5C5aQVfR/QozFOvjtUcl/GF8+Vp/bTpPXLKYNUju1GjPMmJgbzAdDk3d+lMWSk4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="kIMH/Jl5";
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD69E606A338
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD69E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kIMH/Jl5
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso3064069a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371135; x=1795975935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TXtQuQYdk/h+VPS19Qx8ZxnBKtguIQfQlp5+pm4QqHk=;
        b=kIMH/Jl5Dp5VIFfR5zjYr099IESRRuCWJPtK3fToWAqJCN3js3bQUy4xPFrrAkXy13
         cfOcaUHqeGDbEr2ddy73PhDoPXs6KdggKISW4O7UxMasl5yKx4JjnLywTcGd5IlFGOUs
         jPE1jXwj5mVjefTP1q+7wnCvpljMoCIFLVBc2bfbQta6w/MCCckHOLil0zwWytdJGNEf
         KqEDRK3IDcFr5aXpFBiSEfR06jk2znzDbSGnVKCJd9GO28RFxpgR7yIFJHulc7RTfTqk
         pYcyIoZOWoZKBz3B8Zm+iMI88yBAARpxkydI+S6vS9RyZD7fWlFAzqq3+v5lgZBqcFVo
         Vy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371135; x=1795975935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TXtQuQYdk/h+VPS19Qx8ZxnBKtguIQfQlp5+pm4QqHk=;
        b=Rso/QmuP4h1y13A0M8rS7ESn9PAneexYbO71zfhd3BrN9sDVT6Cux15TL6oc1L4hPm
         7lrbQOrixhRiIXXs+QwcvrQMGzSZAY0fMkw5qBwnDn/zx5QcHWZ4jxXXbrW37MgETCTz
         aQkbQB/+yr7pOjrdo/qBrYxhF2Q3of4GMS2Giev/+mE5sfqzcZp8jlTQah1DP9cf+ICd
         tlqwt/OW3ZBNhi9GdeRfO8QxC3Pcp0b0aXFEi9/7LATYKJUHWahFm7f7rQn4Fy9Im25h
         LK5YbptljA8wnTVxVj3s4h0FXzSCHh168vvY0+3D0g/QoBJkKd10uaual2KpY26tySEp
         wjxw==
X-Forwarded-Encrypted: i=1; AL+hErFYKpDey8XBzvDFHnOpz1+AOUUazcEbC5xvg8nk+95MECPEaJfYfAacgIKpkkNR5m7uSRUkxgwZJt3D8E8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qym6ibvILXjGw8NTffwhKNKU7AhVOG6+4d15OPC/fSjdzycn/
	NFFu+KU1gi76w8Rxy02RMyYTE87mwuAUZtDB2mu5m9Sk1wMtEg3mVAeq2zEdfr1gww==
X-Gm-Gg: AZFdTZdUNB0fuICzom10P/iLX0tL4WlredyhlDyisOWcL+Z/7tR/9el8a0tP8qd0GTa
	DMUMhP1yWHB9CCwExE7Gc12CTbykILmIFZcJFlJ3kx/5cvA3OrEqJscI4iEJxXPU1YBqPqTl0SG
	JSOsBv4Fffap7Yv34pc/9htxdNB5VKiOj8/8qSxMsEA+o4iy+HR7wbT8FnF1uS6GPq6D1iY6oz3
	SlNqnukqFiewP8LMVVA+vk+odHIuiGzuPnPj1KcZIlnrcEYvt2qpnE3jRLjSbvoUYvc4mDzZLC2
	aYblfsAcE29MS7OsSXT5gFXJLA/mJ/Z8BEWDJDk2YC++HvHeqI0/jggoR82s92vGhhEFU/K34Ky
	QSYdaC6OXFqrXH7/8VlZRj6aT1rqxNG23sRfM1TlJrtdiPbdxjQw76RYpEjaZe3PcdOazDBp0qL
	9OE0GYYTfZCFouahi3nXSWl30zx9UaKFBjFL3/LN6wd9XU5M2BmDgF4lR2GidwKYqNeGlHJGvLO
	C2CVbR7yAJrx7PNv0ZQ4T97olPzytqp1XxhsiILRi9WYpnY1XkK8EH7HFekr6cDkB6N+HYFweHS
	vXPIO+w3NmS71wrvdSNPuo7qhOehTyDqlokzryxUTYrDLWpSL+QOFREFnD0+mqGmZoEBqwJnBaV
	OXCiSPP/hHTmLS5XsNd8Z2sVh0n6ogx/6TvmpVB5fqiX3AJZcSkvNlxz971EChxvacwYErqIf8U
	YA8ycTASAu/UuXMQdV6mYmaALW5seA8DzgMI2xWxCenyaRyNcQGlGnMbWLMKTJJ8vn8CtmdSXwY
	L7V/9ZRzfZzilTKuE7uo3MInqMP6k7Hp9LTJJrp7ADJTA/DaHqMaLhmcq6RcAYymOBuSpSvm/BO
	3+5Oa8OyqbJft7hCh21s5Cy7hcLViqbys81ozu/skbdV2M+cufVEvjFIyvJgCn+KINECPXTf
X-Received: by 2002:aa7:d592:0:b0:6b6:efc4:9eb2 with SMTP id 4fb4d7f45d1cf-6ba37acf02amr4637287a12.0.1795371135166;
        Sun, 22 Nov 2026 10:12:15 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:14 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 1/9] wifi: ath11k: batch TX completion frees and peer lookups
Date: Sun, 22 Nov 2026 19:12:05 +0100
Message-ID: <20261122181213.1016590-2-julius@bairaktaris.de>
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

The TX completion handler takes base_lock and searches the peer list for
every frame, although consecutive completions mostly belong to one peer,
and it frees each buffer on its own. Carry the peer's station and TX rate
across one completion run and look them up again only when the peer ID
changes. Collect the completed buffers on the status free list and free
them with napi_consume_skb() at the end of the run.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 49 ++++++++++++++++++-------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 5c3ddc8aad41..4f509771d60a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -629,9 +629,21 @@ void ath11k_dp_tx_update_txcompl(struct ath11k *ar, struct hal_tx_status *ts)
 	spin_unlock_bh(&ab->base_lock);
 }
 
+/*
+ * State carried across one completion run: consecutive frames mostly belong
+ * to one peer, and the statuses hand their buffers back to be freed in bulk.
+ */
+struct ath11k_dp_tx_compl {
+	struct list_head free;
+	struct ieee80211_sta *sta;
+	struct rate_info rate;
+	u16 peer_id;
+};
+
 static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 				       struct sk_buff *msdu,
-				       struct hal_tx_status *ts)
+				       struct hal_tx_status *ts,
+				       struct ath11k_dp_tx_compl *c)
 {
 	struct ieee80211_tx_status status = {};
 	struct ieee80211_rate_status status_rate = {};
@@ -639,8 +651,6 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 	struct ieee80211_tx_info *info;
 	struct ath11k_skb_cb *skb_cb;
 	struct ath11k_peer *peer;
-	struct ath11k_sta *arsta;
-	struct rate_info rate;
 
 	if (WARN_ON_ONCE(ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_TQM)) {
 		/* Must not happen */
@@ -707,30 +717,34 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 		ath11k_dp_tx_cache_peer_stats(ar, msdu, ts);
 	}
 
-	spin_lock_bh(&ab->base_lock);
-	peer = ath11k_peer_find_by_id(ab, ts->peer_id);
-	if (!peer || !peer->sta) {
+	if (!c->sta || c->peer_id != ts->peer_id) {
+		spin_lock_bh(&ab->base_lock);
+		peer = ath11k_peer_find_by_id(ab, ts->peer_id);
+		c->sta = peer ? peer->sta : NULL;
+		c->peer_id = ts->peer_id;
+		if (c->sta)
+			c->rate = ath11k_sta_to_arsta(c->sta)->last_txrate;
+		spin_unlock_bh(&ab->base_lock);
+	}
+
+	if (!c->sta) {
 		ath11k_dbg(ab, ATH11K_DBG_DATA,
 			   "dp_tx: failed to find the peer with peer_id %d\n",
 			    ts->peer_id);
-		spin_unlock_bh(&ab->base_lock);
 		ieee80211_free_txskb(ar->hw, msdu);
 		return;
 	}
-	arsta = ath11k_sta_to_arsta(peer->sta);
-	status.sta = peer->sta;
+	status.sta = c->sta;
 	status.skb = msdu;
 	status.info = info;
-	rate = arsta->last_txrate;
+	status.free_list = &c->free;
 
-	status_rate.rate_idx = rate;
+	status_rate.rate_idx = c->rate;
 	status_rate.try_count = 1;
 
 	status.rates = &status_rate;
 	status.n_rates = 1;
 
-	spin_unlock_bh(&ab->base_lock);
-
 	ieee80211_tx_status_ext(ar->hw, &status);
 }
 
@@ -775,6 +789,8 @@ int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
 	struct sk_buff *msdu;
 	struct hal_tx_status ts = {};
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
+	struct ath11k_dp_tx_compl c = { .free = LIST_HEAD_INIT(c.free) };
+	struct sk_buff *tmp;
 	unsigned long push = 0;
 	int done = 0;
 	u32 *desc;
@@ -848,7 +864,12 @@ int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
 		if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 			wake_up(&ar->dp.tx_empty_waitq);
 
-		ath11k_dp_tx_complete_msdu(ar, msdu, &ts);
+		ath11k_dp_tx_complete_msdu(ar, msdu, &ts, &c);
+	}
+
+	list_for_each_entry_safe(msdu, tmp, &c.free, list) {
+		skb_list_del_init(msdu);
+		napi_consume_skb(msdu, budget);
 	}
 
 	/* A completion returns the airtime the frame was charged, which is
-- 
2.53.0

