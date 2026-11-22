Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371111;
	b=fiTLHoMTCN88JDXTL5fule5ckxgdinuioBZLoN2kW7k2lIzmmHOPteV5GEALy/a+QCCx
	 zfOqy+f6rIpNPgH1DxUKsJ34yAR69+ulf4aM5nFUnzJWeuDu4UVOylAYFPswGU7TNKmmp
	 hj/W4TSG+xa5zLq5ocZYG5pAmYD762Oh0vr/Js76mzoBsU8KeaAY10IjsmOHYppEYwLyf
	 zv/e6N4j3dn0LC9KfWOAlNXSRLv16bB5FLuhBi0PIEitpWMivuk8XR6LzBbTtJLN0NxZw
	 8Xn8oVAmou9sHXdb31YrtxN/ekgTiWkpjagpatYwU/SzJDp8N0EkimM2tMiA9zNSpkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KP7khDe++7fc98wXYbOy2kUEZEGprttgeO7wiuURcgo=;
	b=ztfWVZtgWb6LUaV9378S2qmaKfiHwljoLXDLgqGODmPdxpghsIO4pf/iEn8HI5TZsWR+
	 Z10lMiWFD3/VWEohAi07AxFAe47dVKtR1MYSGlh7J9L3inVJZZwpAUeFOpTdFt22gVu3R
	 Z0bAKXZoKccpmsTY0VMqz6NgIErgMEl+BVLnGfbevBTU1QzL5zL9vO/LMggkaHKMOhIa3
	 76/qlajI76hNKJlqq2vzFqtcpidug7frt7pGdIeb/6geBhWxs5mpWhypuAqBPLRGY/Wqx
	 rigLbKXRK6EB8jVWx4/Fxsk96tSCrEecIK9GSmaaeuYhriWtchBCss37P+aWMLdVqMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=eWZxsdTT;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15945606A699
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15945606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=eWZxsdTT
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so762506366b.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371109; x=1795975909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KP7khDe++7fc98wXYbOy2kUEZEGprttgeO7wiuURcgo=;
        b=eWZxsdTTy5LP8T69/vEVfk3Vv51q1FIr/ibktW+61VnmQljeFT5gq6uNMt36e+wYyc
         i4kEH2xlD90NmxVefmdG8dTxLjwb4QE4CqNksI4MIyRxJ03pyiZ9RnaBmb3A9eKEMBht
         PluKCUBKGYEeXBtPKTt1l7sRa0+hKV91yh6ZwNyOuOCiFWAArAwus35LZmEd+e4Xvue0
         m0qaHxUuM+8EC7E4utiSxMfetGoY2pVAR7sdslVEM/U65opPBKgJvfc0Kz7DElK+EQCo
         +Z1LJuKza70WKElCSo6MfCOfxlsaeAC+0TSeqSBNEUb31eZKeIOzyg2VP0uHa3OeuUzB
         KPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371109; x=1795975909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KP7khDe++7fc98wXYbOy2kUEZEGprttgeO7wiuURcgo=;
        b=Vx37Kh2QW9yQUSdvtR3y9SvuGhafBkSAC5iKe6vdKzoH0gwnSYSYRh2KBdo99aIknV
         MUXO4XHSUX/8bbXM9y9+9niphNwtlae2XVcBoIVmFRVrW0O7UcyN+KH+d9CoGLbtALHD
         vj66YRjJ7iNuIo6QSOIru6NleuM4YxCAbbNSUkONNhjyND8EEDRf77TRSfH2r2mK/kVR
         l9N8TlfeL7HbQfGVzk+tAfY97g2FE8Da6PvNA8fP9QxUT3TpIyVVgH0JfwflQIhoLMux
         MDpYtQICFxFz6wS0YkDFcTRcnR6UGN6HOy+g7+zK/87ZcuXipW+XDli0Mz9zmeVxOVJk
         v0Ew==
X-Forwarded-Encrypted: i=1; AL+hErE5pArl9VjLe5n2WVzOR9kD4kiZd/NX5HcJkKG0R3wmyGWZekMIUWP0G4/5FWwDqHVjvT8dGoE3Obg0iYo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WOBEpHsC3WIE1Nj5jgHiKOqhEGbCCDylYuls3rsz9OLCdxE9F
	jbF25rupnaaoWHrxOvMSHU2IM388CjLq0POIBDX29FZLt8Z/4maLzRApQEBg+SiCkQ==
X-Gm-Gg: AZFdTZcOo+DPNA27bacPTHDR/LMpzOCVJwTBpmcqNtfXcJuwEeGD1D11VxhKFGO2SYC
	CeJK+XpdeOS6lgRE2aXqAPZhsJQTpGgTVUa0epZsSUOWB0bp8TTRZhgP00jtbDtClwwhx/LAmHD
	EfzS+V1itGDL2ad/+t2UsX0/xgFm9BmLJDPQm6MvOanG/Iq05KpAFrsgEPXBtUEbIliAnWosTAG
	tZhA6Rfigo2JrNReAASPdoxhoNs6NwQPIKSwJEiIlSp2WjHKwfE7+eV1PUqQOB4Z4/Q9leFGqz3
	rwLepd+AptNxE7LxPhaSYQZg99gHX8+VgHrLc2k5+R4b4NREai8ErWDQXMDJBISJ00hTjaJ1uSv
	LN+5MfHpPLeYOJ68yLEiwaGsCr/I1Vk+32Ixrjm1r13bw8hP3G/mjFcO9CzaDZW9A7uYD7Y88vZ
	FgFXKOdH1Hm6s9/cgstAC5obcahz3Wbp444KmbUJyI4uJppQeBZNuas1tEYMZoBHVBM+4kTRewc
	iqfa6umnMPJ27wVA/r8qhVYhv5q7WBrlWt4J6uWw7vxzKfAhPfiM7qk+cYR0+C3Ft6+mjdXCiz2
	ZZ4X2P35vBhmKJfUUXpquHAksgsdPayd02jqTagqKqN7IQtawQl3rLFenlig4ZpmJKOCSU+GArH
	SzxjvYCzkcZUQZp0+Xzp8At+Z40prLh8iaKVxMlx2NxSE/8+eMFaamxz9GFcLW10XYbJ4UVCMfM
	dTK2n0nW+drUIM5jwr86otrbyS1bjrK0PBKizjeyFtzS8fT8RQvh7CWt16loh+ZLTBdoVafwa3g
	/U8cwBzE/erJROwcbU8OQzBKDEEW2p70T+jjo9CJj/C0ch+13fgY514eDrM/DETfllQY1UJH4Oa
	q0r8XhX+SHY4LfuBNmQtyNCBMRBuvPgkYsf/IpQz/aaUJ7SPVi04ChFGC6h1/uRnLhT9Xp6l
X-Received: by 2002:a17:906:a1d4:b0:c4d:31be:1f27 with SMTP id a640c23a62f3a-c513a80de57mr563735166b.9.1795371109556;
        Sun, 22 Nov 2026 10:11:49 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.48
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
Subject: [PATCH ath-next v6 7/9] wifi: ath11k: charge received airtime to the station deficit
Date: Sun, 22 Nov 2026 19:11:43 +0100
Message-ID: <20261122181145.1015729-8-julius@bairaktaris.de>
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

mac80211 charges received airtime to the same deficit, as AIRTIME_USE_RX
is set by default, but ath11k reports none. Register each received
PPDU's duration, which ath11k already adds to rx_duration, once against
the PPDU's first TID, or BE when it names none. The TID comes from the
PPDU end user stats TLV, which is added to the default monitor status
filter. The call runs under ab->base_lock, as on the transmit side:
ath11k_mac_op_sta_state() drops the station from its peer under that
lock, and mac80211 frees it after that without an RCU grace period.

A station uploading with DSCP CS5 moved its VI deficit in 3 of 3 runs;
uploads marked BE left it unchanged in 3 of 3.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 11 +++++++++++
 drivers/net/wireless/ath/ath11k/mac.c   |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 777c56e416aed..1e4080caaa80d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5280,6 +5280,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta;
 	int num_buffs_reaped = 0;
+	u8 tid;
 	u32 rx_buf_sz;
 	u16 log_type;
 	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&ar->dp.mon_data;
@@ -5347,6 +5348,16 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		arsta = ath11k_sta_to_arsta(peer->sta);
 		ath11k_dp_rx_update_peer_stats(arsta, ppdu_info);
 
+		/* Charged once per PPDU with the measured duration, as on
+		 * the transmit side, to the first TID of the PPDU; BE when
+		 * it names none. mac80211 frees the station without a grace
+		 * period after the peer drops it under base_lock.
+		 */
+		tid = ppdu_info->tid < IEEE80211_NUM_TIDS ? ppdu_info->tid : 0;
+		if (ppdu_info->rx_duration)
+			ieee80211_sta_register_airtime(peer->sta, tid, 0,
+						       ppdu_info->rx_duration);
+
 		if (ath11k_debugfs_is_pktlog_peer_valid(ar, peer->addr))
 			trace_ath11k_htt_rxdesc(ar, skb->data, log_type, rx_buf_sz);
 
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 4527ab6977d04..d17f80cbcdb5d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -229,6 +229,7 @@ ath11k_phymodes[NUM_NL80211_BANDS][ATH11K_CHAN_WIDTH_NUM] = {
 const struct htt_rx_ring_tlv_filter ath11k_mac_mon_status_filter_default = {
 	.rx_filter = HTT_RX_FILTER_TLV_FLAGS_MPDU_START |
 		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END |
+		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS |
 		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE,
 	.pkt_filter_flags0 = HTT_RX_FP_MGMT_FILTER_FLAGS0,
 	.pkt_filter_flags1 = HTT_RX_FP_MGMT_FILTER_FLAGS1,
-- 
2.53.0

