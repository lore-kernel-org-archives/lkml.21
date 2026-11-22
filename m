Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371111;
	b=Ppo7k08vYd/m9ZiMqPZIESch8ye+EBCdLdh0w0ug/tZaz5C6WaLW1MPxFYlBdDk066C6
	 yt6O5oLCf2rX4XcEjh+qaWdtWU5hw0q0TTPQuahHfcdTddagczHsRUugffL1C6NihAYQq
	 mv3Tso9h3jNX5cb3KhSogVGlA7cYqjYmFwNVljZlAVQmurQI2fywEkuW7t+jC0St8zWzg
	 caNTw09ju0enlRxtHdjC/KT3ZC5kqA61y8/ygkiVVW8FUSXcgG0I5sLW1uLdECo0q5dlz
	 lmNG0DlZP5j8QD00L1aSf0r8X7xAGglBmCWcjaHkPr++N2hDR9yw/mOpRJezbWHIxlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QPQ6Z0+Ejkb86/QqsMqCsz6Be6K0g3JHqbeFjXLeLac=;
	b=bYt/0aGGzyoHPb+aPUVo0yrKR2b0Jm8xdu1vGcjs76cqdDQlAK61K3pRqyENlj1gCHEe
	 Rk6ybS3NKMSKvbuo4b6ADy1Ity7h3RN7f+qo0iwxBg+coRn5AFMoacEere2LC3+ZVaLLB
	 kSALQrgAMAIstkRCLU7WlkVM5/+soKMU2gteclP9ea78CmlM4027KCI0V9VxaQM1K/AKc
	 EssTBoAQ00BJSCH1qhVWACt8M9clYXkn/hcVv6fBv+5JXADgimVut3E0PY2y8YHXN5qr8
	 sZJ0VdnNYFq58r5ewbdBXch9tg6nxcgkyX7CCo0nq0xJxLJgGNBH7tXsk6nkdeSmLTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=P2BF8BbE;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5282F60A2609
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5282F60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=P2BF8BbE
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d28f75d62so427849366b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371109; x=1795975909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QPQ6Z0+Ejkb86/QqsMqCsz6Be6K0g3JHqbeFjXLeLac=;
        b=P2BF8BbEr4Fus4fFKk+CbC5C0+w4m9qkCX7anjEBqS9boBEmAE1ITiNiUqKA43igVC
         4HMQ3Uny2BwhtSyZCqhz5um6WdbvZMbvzc+ZeFR6Zv2uLHcJhZn50FsR79OQrMzDUuv4
         yQxovLO/dptSaN354PiEJQe6FUNBQeSA1eKUYpUAayh+tkZEgfS6TD8EZTCGwvhHyqI8
         DBXzGX1dC0RI1P9Su8UnpAGIVRxvlQBvBiNckhHWWAo4SvGhFtIEHWSkupgQkCzkbxA2
         HW9JWRcO+eWBzYaAe+W3msrknu0NF//S9jd4ZMCMifsrm/tb8wDZt1/JUb8unCjsq2/k
         dhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371109; x=1795975909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QPQ6Z0+Ejkb86/QqsMqCsz6Be6K0g3JHqbeFjXLeLac=;
        b=rMVp1Hl1Nu9wXhbj7hcwJqKGFx2C+HyFYJ96NepBnz8OYgOWjPPHJLCfSQYRvY39HP
         rBNGQk8u9Vy4j2WwXCagKnbvJloRuXqJpdbvGIigX/v5VVLQ4u5r4t3HWo97JGxjb7pL
         iTiyANsK0vqPqjJ5opdh4SjkATFQcUBGhmBnecqwySCVON+7vGUlCAZ+qdHQykQHmHdO
         jxcceYf3rTGHQFGw7VGV/T77ko/K5C9PO5Grs40+PJg8vAqDerINZYw038KtFguib3YZ
         656a+4RPVqb7a74pZD4rjvMUcTTOt7qDNlFPhutXije41eUmLJbvJuW7MOuiJvJ+p4xh
         VOgw==
X-Forwarded-Encrypted: i=1; AL+hErFq98uM6W6Qa8o3iPhTQLxEdbm5gaj6vUg92b73JaineLEJVeM8rpHjNA8ThcBob7b3Z8dYtMHkd7fkyPw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wuMP9XcRaXaGdvvKpwNOxE87ha2yNXB1etJriJR4jBs3R92p7
	pCXG8XWviVy87wgmpjEPEisR2Tea+er5FSR7pjkDfHDqDNZxeGLdmAgyn8YloZGyDg==
X-Gm-Gg: AZFdTZfsfXTaUIkZ1wsxB0rkVe2fCwKTIMPjPQyxHXv4L4SJ+k+g7/QvAWu8r8k5Ucj
	9nx6pMC6btzohUGsewMOqUP18iKSp9USm+fIf06zj2Oybn5FQ38Rup2hR8n5e/ISPdsqHKxjtcV
	2QJ2MUCrlvY9owB0JYSPza5QMbgIdPadZWnRBSs+FHSj9V63btCNzduQ5Ul3tGaWKN2SHEpxToz
	rW2ju8kVNIKkADOgX9jehEF394bjBNZOYY/bwVSNhEOrO+STXO/kD+QFsNRvQNj+8YVEWzgKK7t
	/P07hzVgulc1xK6j5YeQuadrY2bqBT9zyq2HuBelF0zD6NShG114JkjqG+L3/uqf2WvH0M412uE
	GRfXMwBqyTyE9Y8Li/BA6wc8i8pAGoDq8mU+rfF2EtybVlIAOK7+yZ/Mz8mjt0UEJfmfVkg+JgS
	dLJKe951sXLtjOunxaqV7Le9Le4gyhvTahSHZ+xLuw93IbzQXiCU2K/09NtSY/zZ8oXu5791EOi
	9NPm9YXpTr/Nw07A+NKp8z8XZVa81hRJVo73gG5HIJBd0Li/lXqIXl2VGKS0JJPMtUhE6Qs2xJd
	izvUggxGQxCo2QT221MCffEiHwt6yK7B47FrGYv48O6ES5lSb9Ca52amyuZLY77x+OGzuu73ULt
	OBgrSYB08telpDHF88T9FNAxtTvawNHRavvtwFQrJnPLsNULt8Oion6xHVy0lZTSFJSfX+WxY/N
	PDAzIVsylfa67fL7NZdsEQNInJdWUU1f0gERrZa9JY82ueu+cxYMS8JDrVuhYE1nX6EaJAQKAOF
	rdaUuyBIhUdmo7AoewY0hn98SJzC/2lXwk+YUZlDBH3fgy4H4h63hbC2oWK4GZlU1HwbPzEElkx
	vuXXeB9uAd/aoV6zEjveheqOj/Zxb8P0M6wL7TNBdHlp4LZy3l3R2KOjF+ksFrZ5pLWLSESA
X-Received: by 2002:a17:906:3814:b0:c41:cf68:bbcf with SMTP id a640c23a62f3a-c513ab497afmr548454966b.32.1795371108676;
        Sun, 22 Nov 2026 10:11:48 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:48 -0800 (PST)
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
Subject: [PATCH ath-next v6 6/9] wifi: ath11k: run the TXQ scheduler on tx completion
Date: Sun, 22 Nov 2026 19:11:42 +0100
Message-ID: <20261122181145.1015729-7-julius@bairaktaris.de>
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

A station at its airtime queue limit gets airtime back only when the
hardware completes its frames, but ath11k starts a round only from
wake_tx_queue, so the backlog waits for the next frame from the stack.
Start a round for each access category, taken from the frame's queue
mapping, that a reaped completion belonged to, whether the hardware or
the firmware released the frame.

TCP download from a wired host to one 1x1 VHT80 station, BE
aql_txq_limit 500/1000 us, 20 s, three interleaved runs per arm, sender
RTT:

                    Mbit/s              RTT mean ms   RTT max ms
  with this patch   94.5, 94.4, 94.6    68, 62, 67    126, 135, 121
  without           74.0, 78.5, 72.4    28, 27, 27     55,  40,  40

Without it the link idles between arrivals, which also lowers its RTT.
At the default limits both arms reach 88 to 95 Mbit/s.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 33 +++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/mac.c   |  7 ++++++
 drivers/net/wireless/ath/ath11k/mac.h   |  1 +
 3 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 081e79d3759c5..0cdc0493f10d2 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -286,7 +286,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 				    int msdu_id,
-				    struct dp_tx_ring *tx_ring)
+				    struct dp_tx_ring *tx_ring,
+				    unsigned long *push)
 {
 	struct ath11k *ar;
 	struct sk_buff *msdu;
@@ -307,6 +308,8 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 
 	ar = ab->pdevs[mac_id].ar;
+	__set_bit(mac_id * IEEE80211_NUM_ACS + skb_get_queue_mapping(msdu),
+		  push);
 	ieee80211_free_txskb(ar->hw, msdu);
 
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
@@ -352,7 +355,8 @@ void ath11k_dp_tx_free_pending(struct ath11k_base *ab)
 static void
 ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 				 struct dp_tx_ring *tx_ring,
-				 struct ath11k_dp_htt_wbm_tx_status *ts)
+				 struct ath11k_dp_htt_wbm_tx_status *ts,
+				 unsigned long *push)
 {
 	struct ieee80211_tx_status status = {};
 	struct sk_buff *msdu;
@@ -375,6 +379,8 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 	info = IEEE80211_SKB_CB(msdu);
 
 	ar = skb_cb->ar;
+	__set_bit(ar->pdev_idx * IEEE80211_NUM_ACS +
+		  skb_get_queue_mapping(msdu), push);
 
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 		wake_up(&ar->dp.tx_empty_waitq);
@@ -426,7 +432,8 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 static void
 ath11k_dp_tx_process_htt_tx_complete(struct ath11k_base *ab,
 				     void *desc, u8 mac_id,
-				     u32 msdu_id, struct dp_tx_ring *tx_ring)
+				     u32 msdu_id, struct dp_tx_ring *tx_ring,
+				     unsigned long *push)
 {
 	struct htt_tx_wbm_completion *status_desc;
 	struct ath11k_dp_htt_wbm_tx_status ts = {};
@@ -451,12 +458,12 @@ ath11k_dp_tx_process_htt_tx_complete(struct ath11k_base *ab,
 		else
 			ts.peer_id = HTT_INVALID_PEER_ID;
 
-		ath11k_dp_tx_htt_tx_complete_buf(ab, tx_ring, &ts);
+		ath11k_dp_tx_htt_tx_complete_buf(ab, tx_ring, &ts, push);
 
 		break;
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_REINJ:
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_INSPECT:
-		ath11k_dp_tx_free_txbuf(ab, mac_id, msdu_id, tx_ring);
+		ath11k_dp_tx_free_txbuf(ab, mac_id, msdu_id, tx_ring, push);
 		break;
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_MEC_NOTIFY:
 		/* This event is to be handled only when the driver decides to
@@ -736,9 +743,10 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	struct sk_buff *msdu;
 	struct hal_tx_status ts = {};
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
+	unsigned long push = 0;
 	u32 *desc;
 	u32 msdu_id;
-	u8 mac_id;
+	u8 mac_id, i;
 
 	spin_lock_bh(&status_ring->lock);
 
@@ -782,7 +790,7 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 			ath11k_dp_tx_process_htt_tx_complete(ab,
 							     (void *)tx_status,
 							     mac_id, msdu_id,
-							     tx_ring);
+							     tx_ring, &push);
 			continue;
 		}
 
@@ -798,12 +806,23 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 		spin_unlock(&tx_ring->tx_idr_lock);
 
 		ar = ab->pdevs[mac_id].ar;
+		__set_bit(mac_id * IEEE80211_NUM_ACS + skb_get_queue_mapping(msdu),
+			  &push);
 
 		if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 			wake_up(&ar->dp.tx_empty_waitq);
 
 		ath11k_dp_tx_complete_msdu(ar, msdu, &ts);
 	}
+
+	/* A completion returns the airtime the frame was charged, which is
+	 * what an airtime-limited station in that access category is waiting
+	 * on. The arrivals that would otherwise start a round are themselves
+	 * queued behind that limit.
+	 */
+	for_each_set_bit(i, &push, ab->num_radios * IEEE80211_NUM_ACS)
+		ath11k_mac_tx_push_pending(ab->pdevs[i / IEEE80211_NUM_ACS].ar,
+					   i % IEEE80211_NUM_ACS);
 }
 
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 226e1417ffe74..4527ab6977d04 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10156,6 +10156,13 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 	ath11k_mac_schedule_txq(hw->priv, txq->ac);
 }
 
+void ath11k_mac_tx_push_pending(struct ath11k *ar, u8 ac)
+{
+	rcu_read_lock();
+	ath11k_mac_schedule_txq(ar, ac);
+	rcu_read_unlock();
+}
+
 static const struct ieee80211_ops ath11k_ops = {
 	.tx				= ath11k_mac_op_tx,
 	.wake_tx_queue			= ath11k_mac_op_wake_tx_queue,
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 127cb476b44b7..b78a357b5472e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -161,6 +161,7 @@ struct ath11k *ath11k_mac_get_ar_by_vdev_id(struct ath11k_base *ab, u32 vdev_id)
 struct ath11k *ath11k_mac_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id);
 
 void ath11k_mac_drain_tx(struct ath11k *ar);
+void ath11k_mac_tx_push_pending(struct ath11k *ar, u8 ac);
 void ath11k_mac_peer_cleanup_all(struct ath11k *ar);
 void ath11k_mac_tx_mgmt_pending_free(struct ath11k *ar);
 u8 ath11k_mac_bw_to_mac80211_bw(u8 bw);
-- 
2.53.0

