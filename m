Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381530;
	b=2VpQNXVjCCJL/Xj/o4TxbqMCNaCiy07BDvxoIiD30yveK+N061May/twMf2lGuvE2HcT
	 3OFkArfzccfEg3Pdlx6bWQGrlxIIvaKd1ROvGGfVemY7C0w95x/1CumRIAysEn9gY7vMI
	 w0qZb69iy6G7xOVr4InkA6hyq0xGyz8Vdb2WSJrWm3LsHzYubEu+HwUVzi5kFnj+Agast
	 MoKgfIahzX9iQKkxrr6PxI27NAnPTZA130mN5G/yv54ByTwQUL+F2VTKAZLkILNkYPp+h
	 t+Zgf2VxKLllWVKYlO8eWi9e0RCnyKYT332i0wSk0JxeFounCPknidD96iO1hEpdzbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iY7hP57Ks22ZQX6VPKHgfCkwRw7bMvU+dJUsFxLR+Wk=;
	b=j3gMhcvee374bKVearpMu5HdcgBEfhMQ9dgHmmi8so18C/IAaIlmzvQxPR+UaACnE2Ql
	 /4morz/R8qub8cXYYrf4460HQcDQcUKIoeVU5UhzpFLkCTf0vpftCBHfxr3mhX203+Nnc
	 CwuaxKTzptWmR5azrrZ5OVhG2oVViXOmeU3DviCyu4BSm2JJsOIfdDCRgHBTiz00096w0
	 jBgz0gBuULP9QWuUdY5kk7zoSvtHrlGzqcWi3I7D0neRtpeQT/OQY/egzS/F9+DdLi2J8
	 PnAO51Az9Nk4BfETZ1b465bYZeXGHBKzzdEi7mAeu2oKORzoC7QAY+hdWOBOmbuwZJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="ef/YRhQe";
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23026606A33C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23026606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ef/YRhQe
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c516a160d24so87627866b.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381528; x=1795986328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iY7hP57Ks22ZQX6VPKHgfCkwRw7bMvU+dJUsFxLR+Wk=;
        b=ef/YRhQe4fH6qtohzizg3tjYWYtnyYk9jYtGYBtDz7R1uZ1XXw+dgCyZxvBEnGTENt
         mIJIPyZMcPa3efgAAZApuXgZH0+L6aQeQ78bmBNLGKOTm2FOQfQq+5orq6G2EiSDgH64
         mUwXD2RY/lAvvEixd6wYgk/JO7QUfOJyuEbihCg00xSXmL1g2WmWpvzV9Bp5M9OdYGy6
         L68FltfbK4hRyqCZ5fFkb5I1aYIGrEfbu1OiLYhrzndabk80Ss7GIaonrmjYfG5NUkYl
         1id1rteV7xI/jPqX9A2cc03FgYzeP3fObTomgkfseVNTVD6ufcnn4q9cEAnL8D7H6/3F
         rbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381528; x=1795986328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iY7hP57Ks22ZQX6VPKHgfCkwRw7bMvU+dJUsFxLR+Wk=;
        b=OnMjV5bNfxLXwrI4W4O/sygIrjOziherJDnWoNHlKUmZT7sZYdIpWvR8l0cuCzsRrj
         ct+CIif5UZiFrkDpup2T9Syzfy4Sn+XnC/HU5BYL7flWpWcivI9QMmUY3b/d43QAn3T8
         C0gDZipLpD8ItJBaWCql4FyE1/uh2lXb5gAN6JJ69CpKTb/UfLsmEohH/dD+37XiJGtR
         ETm1EqkpJ9P/hnZYWNx10DepEEZUv4rH6eIkjogYJWzKmXWTfyDevW8kqk1BMbCV74SF
         yaKlMaQXRSUK06lRftJ6zQHtFiGYkK/lPY+echSGtOnUsqpwYI8J2Dxt22/KiRXnitax
         Zluw==
X-Forwarded-Encrypted: i=1; AL+hErHgxj3GrFHaMgb8DpBd3E+H+Ss9YIQpjEEvH3aR/nO8mJw+VWS//G0X6XNz1cZsrvzoGjx/d5loJdc9HUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lnQ9LvSXuYyCKt4tPmLe9W9etKeXgApCyqBQ4cojTHXRgnbbO
	ht6qmSc56AtmS8In91CIw/iNDa55oD2HrWAPzsWc3WPEFfWKk/bZ3Xx7DSx2e5GuasyvyfukcaN
	biKSpWq8C
X-Gm-Gg: AZFdTZc2/ktHF7kQ3yAJKvsVakWT0TqnIn2nLVIwrdjFrCCrGuuwIMBnMQi8Oc8PlJ7
	LLmb62U3FaDeNBIEGQ2YraTSUiks5SudcHXTBPzWf298DggN2IOWxFmxEdjFLC611wO0vr4tuze
	sNenAREa4HN1nM6jV7j3Zoctn88MIkns2+HE989O/zPlN+w9oZn7Uz3crfqcSYCvPJUI9k5xugX
	OuEhozY0p9RGM52JlNkT4qjn4HedlmHbwr7UmqOjpUA91/NSvbq96CDFCwy1QHo95vwr1Ni+isI
	xZugTv7RUr7xgtVfJzGNT4lCbYtoCe+gKN9UglQtfMlIRZZx+uEus/9Ie5Khf7UUSdiIgZyhYw2
	QsK3NRMstEAfOhPIAE0e/4RB2uO4R0EAampBw30s8T/uo9rx+ddFs9ky6Mt++LnyXGhMqUZlciW
	qDszx8SGtEBRgDEbZu5k9n8vbh3xlqJdpHVwN3NO2ES5o4N737Tu/d5ogY2w2dt0wQeArGPfG7S
	2SENLw+IW50+RccV/MGAkNynwEl95h49Cjw88rPOQhdE342zcfcSUoLz1Mrz+MMfD5ISxw26PHM
	WZKh8jcWRV6EiD4FLbOYp1Ww+DJjWtLAqB38saYUCzV7uOay+fwTFqEQAIPJRSVD3saP0WlnXwy
	eE7MxfBUVVt29G9ty9+6cVmickREU/BFPJR2o7rvHIG9u1PlBl/+GQYqh3EIHtL+yCQnHxq53mu
	KJAp0WbGNhJ6n3PALcP2e96TCy8fZlAREyhnfJ4BCurfVviumjAEWJDkFread4FxZI6B+N8OTXv
	EUPgVS7eImdHqZMyW/Cj8eJu+IvbcCHrEQpqAjOh/tUDr62+F7EA/EsBmjsjODMB5vn/ZGOXUxU
	nhh4IRxINi1aoZSQSZOF+JBHLFpeDBWck69gCIbMRLgeI1myuu9CAiH9gWNLxSPjgU4m2c4f0Q=
	=
X-Received: by 2002:a17:907:e00b:20b0:c4d:22e2:1a2b with SMTP id a640c23a62f3a-c513a47e2ffmr509115366b.1.1795381528414;
        Sun, 22 Nov 2026 13:05:28 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:27 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	John Crispin <john@phrozen.org>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Jouni Malinen <quic_jouni@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>
Subject: [PATCH ath-next 3/6] wifi: ath11k: drop decapped frames with a source other than the station
Date: Sun, 22 Nov 2026 22:05:22 +0100
Message-ID: <20261122210525.2076058-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122210525.2076058-1-julius@bairaktaris.de>
References: <20261122210525.2076058-1-julius@bairaktaris.de>
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

With Ethernet decap (frame_mode=2), ath11k hands mac80211 the Ethernet
source address of a decapped MSDU without comparing it with the address
of the station that sent it. ieee80211_rx_8023() delivers the frame
under that source, and for EAPOL and decrypted group frames
ath11k_dp_rx_h_undecap_eth() writes it into the 802.11 header it
rebuilds. mac80211 compares the source with the station only for the
A-MSDU subframes it deaggregates itself (check_sa in
__ieee80211_rx_h_amsdu()).

On IPQ8074 hw2.0 with firmware WLAN.HK.2.12-01460, the firmware passes
the fourth address of a 4-address data frame through as the Ethernet
source, also from a station the AP has not set up for 4-address use. A
station associated to the AP can therefore turn on 4-address mode on
its own side and send frames under any source address, and a bridge on
the AP learns that address on the Wi-Fi port. An ath10k station sent
200 broadcasts with a forged source this way, and all 200 reached the
AP's bridge.

On an AP vdev, drop an Ethernet II frame from a peer that does not use
four addresses when its source is not the peer's address. Frames of a
4-address station keep their path, as do frames on a station vdev,
whose sources are the hosts behind the access point.
ath11k_dp_rx_h_mpdu() looks the peer up under base_lock already; it now
returns an error for such a frame and both callers free it. ath12k
already hands such 4-address frames to mac80211 as 802.11 frames
(ath12k_dp_rx_h_undecap()), and mac80211 drops them on an AP interface.

Found by reading the code with an AI review tool; the trigger above was
then reproduced on hardware.

Fixes: 2167fa606c0f ("ath11k: Add support for RX decapsulation offload")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 58 ++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 93425ee02774..f8c08b8b6b08 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2253,13 +2253,47 @@ ath11k_dp_rx_h_find_peer(struct ath11k_base *ab, struct sk_buff *msdu)
 	return peer;
 }
 
-static void ath11k_dp_rx_h_mpdu(struct ath11k *ar,
-				struct sk_buff *msdu,
-				struct hal_rx_desc *rx_desc,
-				struct ieee80211_rx_status *rx_status)
+/*
+ * With Ethernet decap the hardware takes the source address from the frame,
+ * for a four-address frame from address 4, which a station can send although
+ * the access point did not set it up for four addresses, and mac80211's 802.3
+ * path and ath11k_dp_rx_h_undecap_eth() take it as the address of the station.
+ * An access point takes no other source from a station that does not use four
+ * addresses.
+ */
+static bool ath11k_dp_rx_h_eth_sa_valid(struct ath11k_base *ab,
+					struct ath11k_peer *peer,
+					struct hal_rx_desc *rx_desc,
+					struct sk_buff *msdu)
+{
+	struct ath11k_sta *arsta;
+	struct ethhdr *eth;
+
+	lockdep_assert_held(&ab->base_lock);
+
+	if (ath11k_dp_rx_h_msdu_start_decap_type(ab, rx_desc) !=
+	    DP_RX_DECAP_TYPE_ETHERNET2_DIX || !peer->sta)
+		return true;
+
+	arsta = ath11k_sta_to_arsta(peer->sta);
+	if (arsta->arvif->vdev_type != WMI_VDEV_TYPE_AP || arsta->use_4addr_set)
+		return true;
+
+	if (msdu->len < ETH_HLEN)
+		return false;
+
+	eth = (struct ethhdr *)msdu->data;
+	return ether_addr_equal(eth->h_source, peer->addr);
+}
+
+static int ath11k_dp_rx_h_mpdu(struct ath11k *ar,
+			       struct sk_buff *msdu,
+			       struct hal_rx_desc *rx_desc,
+			       struct ieee80211_rx_status *rx_status)
 {
 	bool  fill_crypto_hdr;
 	enum hal_encrypt_type enctype;
+	bool sa_valid = true;
 	bool is_decrypted = false;
 	struct ath11k_skb_rxcb *rxcb;
 	struct ieee80211_hdr *hdr;
@@ -2284,11 +2318,16 @@ static void ath11k_dp_rx_h_mpdu(struct ath11k *ar,
 			enctype = peer->sec_type_grp;
 		else
 			enctype = peer->sec_type;
+		sa_valid = ath11k_dp_rx_h_eth_sa_valid(ar->ab, peer, rx_desc,
+						       msdu);
 	} else {
 		enctype = ath11k_dp_rx_h_mpdu_start_enctype(ar->ab, rx_desc);
 	}
 	spin_unlock_bh(&ar->ab->base_lock);
 
+	if (!sa_valid)
+		return -EINVAL;
+
 	rx_attention = ath11k_dp_rx_get_attention(ar->ab, rx_desc);
 	err_bitmap = ath11k_dp_rx_h_attn_mpdu_err(rx_attention);
 	if (enctype != HAL_ENCRYPT_TYPE_OPEN && !err_bitmap)
@@ -2322,13 +2361,15 @@ static void ath11k_dp_rx_h_mpdu(struct ath11k *ar,
 			       enctype, rx_status, is_decrypted);
 
 	if (!is_decrypted || fill_crypto_hdr)
-		return;
+		return 0;
 
 	if (ath11k_dp_rx_h_msdu_start_decap_type(ar->ab, rx_desc) !=
 	    DP_RX_DECAP_TYPE_ETHERNET2_DIX) {
 		hdr = (void *)msdu->data;
 		hdr->frame_control &= ~__cpu_to_le16(IEEE80211_FCTL_PROTECTED);
 	}
+
+	return 0;
 }
 
 static void ath11k_dp_rx_h_rate(struct ath11k *ar, struct hal_rx_desc *rx_desc,
@@ -2626,7 +2667,9 @@ static int ath11k_dp_rx_process_msdu(struct ath11k *ar,
 	}
 
 	ath11k_dp_rx_h_ppdu(ar, rx_desc, rx_status);
-	ath11k_dp_rx_h_mpdu(ar, msdu, rx_desc, rx_status);
+	ret = ath11k_dp_rx_h_mpdu(ar, msdu, rx_desc, rx_status);
+	if (ret)
+		goto free_out;
 
 	rx_status->flag |= RX_FLAG_SKIP_MONITOR | RX_FLAG_DUP_VALIDATED;
 
@@ -4018,7 +4061,8 @@ static int ath11k_dp_rx_h_null_q_desc(struct ath11k *ar, struct sk_buff *msdu,
 
 	ath11k_dp_rx_h_ppdu(ar, desc, status);
 
-	ath11k_dp_rx_h_mpdu(ar, msdu, desc, status);
+	if (ath11k_dp_rx_h_mpdu(ar, msdu, desc, status))
+		return -EINVAL;
 
 	rxcb->tid = ath11k_dp_rx_h_mpdu_start_tid(ar->ab, desc);
 
-- 
2.53.0

