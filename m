Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371113;
	b=4sTgX3uWBgs5D9geVsoA9rAoeOsLXA6JmCunM8xgEVPeiPZC/Uz1zqGQiIJH0/HYXl9F
	 7u2OPxCZjI9Y/ogeugzOVCojalX4bItAK6dsbIOn66UdoUx5cnh8Q10Zpckw6pa7AHfYR
	 NIgc05wj+gONyY10AtMg6O9zJV+2tkA312tGG0+aSkdnk7PaRUGkgzpaPdh8lSQzaJQdH
	 TktQTqLhcbQvkKSEN6f1wKWTT2dxo5qpn7OKwM/De6E+CuAWQwdC5RsiPYX5l829BhPBh
	 miqnGMSCWDuaK3UMadR0T+unp9fuz6/lrhoAC7d/FglHCUcjitSyQ80xEyt3167MZ5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nXaqa51VcSPJXED3QUfcyRH7/CS/duyW16m/AG0rVAE=;
	b=DCQpMqOzGWqmqnBmxuQGJdAlV+1A1isbSVeE2QBue8JAwkBhKt3Gj+e0Ymo2KEVwbjFB
	 6NF+xvYHwcU5MZy/RqRKEqa1IO9oKHSsRmb5BpL+d+eBmUFWJNhTjhi2brnJ8zhADsOzn
	 UiwyXPUD/1BslQ9kMBv1C/YKgQdg/6TQpGoazcvpxzH1VbjZi+4b09EaN+bIZmUxZ+/L4
	 JjnvMeYWSGt47cLEvuF98kXMtYZgfmg5xf9UWzGiLfBbG35n/+Bv8rfcOMGusOU4p4Fdn
	 0bPJGs1s2+Vyy7XEhF7GKQPpvZO0D3R4iG2EDcQke/5nYotvw/k/iHOaqKuGLi6K8Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=SuKdxpk8;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C62860A380B
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C62860A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=SuKdxpk8
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c511cdd5a82so288686066b.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371111; x=1795975911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nXaqa51VcSPJXED3QUfcyRH7/CS/duyW16m/AG0rVAE=;
        b=SuKdxpk8iNU8lt/p8Fs3RXd65JfVjS9b9Ti2KNsZAgMFiraZjOhStI0HYWR78WY5Kn
         mgQ85g3qhL2o4D7yiSF++ZEpx8oL9Wk6c8luhaJOhMvQlCzyllDWhnQp/miTTVtgXYSn
         J7T280wsKtXhlet3pI1okGsYUcYmY0SGU73lcdMglcCFhHnOhu2K7aQWsyt56k7YndCh
         lk5YQgEqytem4CTCtZxRao0TI35myyOj7jqNV+n96YS7HUtRVBC1P+3GohDfBpunANX6
         65c6Vsu4gIJsCZTMuoR5AR7SBOUfvqstUTfW6Bng9LfZh+XmTy7uCdc27fgjscHq9ar3
         50kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371111; x=1795975911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nXaqa51VcSPJXED3QUfcyRH7/CS/duyW16m/AG0rVAE=;
        b=QSRVg66pFr5aduwBQu9oV7yHMlesiSMgknSfosogWLa+486rWg2v5h0nUZ0/HRsP4A
         cAiBU1boyvf7PJ7Fv5KahoZI5jmn5fq9c1fpeDXdTr0YCeEnqKKB94wGaFjOtH5c5k8/
         GCKg02dKExbx96zXKrr3ANc8e4LdxkukhCHncG8VmoxHNmWKAGwZsdCzV5Dr2EAOQgOF
         FcaIVBwBepaFDeslfYBP6bhxuLlXh1Arh1ElX0cEzTT2AHN7eOQHG9j2DDgVE0OdT1j4
         21a+ut/LUGIayRT6vs4jIBP1STuajTTd/QLTxM3H9KmUyE5lpsJ/6kgLTjCcB279V6Ou
         2I0g==
X-Forwarded-Encrypted: i=1; AL+hErF9B8q5FrWIOkQ/8Aj8ximcRWYJtVBCxb6xVFF7W5bsBSkv5BO4RwTeRw9k3vLrzoKfMgaAvrKbnm+bmDU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PipI7+XmQshdovBLU55Icy7ZoczW1QrP9hmPuxmvNIn45pdvM
	G7tnpuZAYsh90s/2EklGfh8yWMRwGRk0xtdH16lzBDKdki0r+rjNZ6Jw5h9rla3rXQ==
X-Gm-Gg: AZFdTZe0iEAtlQf+wQmx46iLiSd/nwn62A1U/GBVne3+MiFTBFbbu6LNFYbkgJCEdr1
	Yr72dJET++1+RRMr83WUip4qnUvsIu8r55rOcK66xX0j5PBfx12MVNtiISWFJqxD0JfYdOlSJjq
	I4q+PEoTPw1GjYMfO59+PwARVCMwyz0dyDTkihvhZ3OJZsewhFoeP8d5m7mqAbtBNoimwVVnyXK
	2O9fuOhpoGmTfjnW8ZOSWl8ITYXOS4KWzqxEgSPmJxeQJD+PlB4vrW9bfHWqis8WjywZ2j4dvg4
	HSbg5h2IvVnZ3oM6xXmF6doaHkRvQ2QKHgKNbQryhzJEe5J+7YKhXdUWQSv8NflDsY5ZNeTTP9m
	FLRcPr/TYsbxIjwjOf3lC4G+gbM2tyDhkfhtG2OCrFmalDwDqRg3NHhprmCvDHqpGh7HDYOdSgD
	2uNTpdl20+DEeswlm8HfuqTGQjU1/k4CIyAwxRo105TxUTRDIn42A4yjurFUL2XnlEz+6salDyt
	lOdfxtqj+BkhwrSv3Fs5EjelZA2HN/1JzIPM+mFFgXRVSlMS9nQChcEyhxWx+RFLNlmyGUDcjce
	q3KjzdsHKlS4QoId0IBurKFY3Iyg+GDkR5L4opjJviSI9LGjnf7uaApHBCVv2SiL3eeb81Eeu6H
	00T7C9z629sSR4gj/w3g0fr9hlTqgHxVs1SvNJjEt19lPvwgusA+8/xWLDABAUzOg+AEhBI32UZ
	dZfvthFctl1ytRlClEXwNBBTVjjJAUL9rXXj4qrh0HataF1l4bsRZVbwhmxKqIve71PNYW6U3lf
	fYzbztfIi97mMmRiwvAg1HB3iulpQmcmDQ7rJICXfBdRl+XkIdqpROZJesMBG1nPNDx+nHc/WxS
	NIzeBh2u8hNNC1h2qLTcTEc8JhhYvJzOCV9ffD3OgMBzL4Oc9/P3jLA32yKjGDGANnQugRNA
X-Received: by 2002:a17:906:9fd0:b0:c50:5a93:3bd7 with SMTP id a640c23a62f3a-c513a52b574mr686313966b.3.1795371111072;
        Sun, 22 Nov 2026 10:11:51 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:50 -0800 (PST)
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
Subject: [PATCH ath-next v6 9/9] wifi: ath11k: budget the tx completion handler
Date: Sun, 22 Nov 2026 19:11:45 +0100
Message-ID: <20261122181145.1015729-10-julius@bairaktaris.de>
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

ath11k_dp_tx_completion_handler() reaps the whole release ring, and
ath11k_dp_service_srng() charges none of it against the NAPI budget,
unlike the receive handlers. Since the handler now ends in a scheduling
round, a full ring gets one round for all of it. Reap at most the budget
per poll and return the count, so a round runs once per budget of
completions; NAPI polls again at once for the rest.

BE aql_txq_limit 500/1000 us, three interleaved runs per arm: both arms
reach 94.4 to 94.8 Mbit/s, and the sender retransmits 4, 6 and 8
segments with this patch against 8, 644 and 296 without.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp.c    | 10 ++++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.c | 11 +++++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.h |  3 ++-
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 615384a4bb75e..833feb981cfc0 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -783,8 +783,14 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 
 	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
 		if (BIT(ab->hw_params.hal_params->tcl2wbm_rbm_map[i].wbm_ring_num) &
-		    ab->hw_params.ring_mask->tx[grp_id])
-			ath11k_dp_tx_completion_handler(ab, i);
+		    ab->hw_params.ring_mask->tx[grp_id]) {
+			work_done =
+				ath11k_dp_tx_completion_handler(ab, i, budget);
+			budget -= work_done;
+			tot_work_done += work_done;
+			if (budget <= 0)
+				goto done;
+		}
 	}
 
 	if (ab->hw_params.ring_mask->rx_err[grp_id]) {
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 1c4cb98f89292..5c3ddc8aad41b 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -765,7 +765,8 @@ static inline void ath11k_dp_tx_status_parse(struct ath11k_base *ab,
 		ts->rate_stats = 0;
 }
 
-void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
+int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
+				    int budget)
 {
 	struct ath11k *ar;
 	struct ath11k_dp *dp = &ab->dp;
@@ -775,6 +776,7 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	struct hal_tx_status ts = {};
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
 	unsigned long push = 0;
+	int done = 0;
 	u32 *desc;
 	u32 msdu_id;
 	u8 mac_id, i;
@@ -803,10 +805,13 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 
 	spin_unlock_bh(&status_ring->lock);
 
-	while (ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_tail) != tx_ring->tx_status_head) {
+	while (done < budget &&
+	       ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_tail) !=
+	       tx_ring->tx_status_head) {
 		struct hal_wbm_release_ring *tx_status;
 		u32 desc_id;
 
+		done++;
 		tx_ring->tx_status_tail =
 			ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_tail);
 		tx_status = &tx_ring->tx_status[tx_ring->tx_status_tail];
@@ -864,6 +869,8 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	for_each_set_bit(i, &push, ab->num_radios * IEEE80211_NUM_ACS)
 		ath11k_mac_tx_push_pending(ab->pdevs[i / IEEE80211_NUM_ACS].ar,
 					   i % IEEE80211_NUM_ACS);
+
+	return done;
 }
 
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index f82df5d2f6033..760251c68b933 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -22,7 +22,8 @@ int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 struct ath11k_sta *arsta, struct sk_buff *skb);
 bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring);
-void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id);
+int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
+				    int budget);
 void ath11k_dp_tx_free_pending(struct ath11k_base *ab);
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
 			      enum hal_reo_cmd_type type,
-- 
2.53.0

