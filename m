Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371109;
	b=Kc4fd7ir4dk+pifC3sJtdpWQwm+GNRtj5kEhepENjuel8X0HwaHNi+RF3kS3+8x3E6pi
	 mQi5+rrQIZoCDo9vBAwRvoQQI7787EE5X07DVqak92kr+5qtf1aGdpnOdlbzJtmpDWaGc
	 tweB8NY+UE2rRl77UJIYmaGWV02pBsfZI95K7zC0P9siq2M9adFaLfMF0TX8tMKHJr0YO
	 ueiYsL2bHx4ISDbjJWRh9nbl2Qbtyi8NzsWXHIuFASEabweVMjJBRNhzW5IbA4NtBoc9B
	 VpGYFy06W7tns9JRObO2JEGVNxMh7YiLeZTklnOA+rd/zn0QpV1zfhSUzG9dDVRRnjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mE/A8sDoniLUUaDAUsGG7lJKqfa/94EhZzjG2JUFfCQ=;
	b=xDOvYWFfI+CurNCLxWUI0fNi1FlFyCubFg1EL2Ct5GijnFZaPX720YiZDAAoh3yUp5n9
	 k74BM83cQi3RuuJPZ4sIHPznXlM8amwVUrRRmqz5r0TJK6hJHGmIsFBgxmN8c3yoNCRGi
	 VTen2jkdVIM4ut1XhAp6n1qvbhPckOPHLhAJVM9SI4twengMopI5F4+PDM1H1y3xv+ph8
	 HfBiR65UhbMOFbjoHRQ2SlG2Kmx4FrVzWxt0j17TRNnEEv3/Hp55pcCA5Uy8OHN2BB2Lm
	 BDPxEmL/EAlBODVuWnI1NX3CvC6Cgjqbpacp/YKWH47ukV4HkKOlvCOnvpQXAYTvCtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Be1CQCHM;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9982A606A334
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9982A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Be1CQCHM
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c513a854320so432010566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371107; x=1795975907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mE/A8sDoniLUUaDAUsGG7lJKqfa/94EhZzjG2JUFfCQ=;
        b=Be1CQCHMVz21lUKkuzjDUxwCH5Crn7ZDBY2BszDWbr+dZQ0FrzBwYAO5sYzNqMipfr
         kNDa+VoKtuMAmEnfHCCuqiIVGLuUMLkDJnUoFDEy+AOnnggf10eJLGhf8WHuIyqpYd15
         dvDtNdJMJjqXXfQQsIw15xudU4wB/DwzBszsL8E8Cb694WSdchFa2pDW/DCWTkKfUhN5
         xSHztUq6IdQ6hlYrMeQuBORAcCGJ8LEsBgx20gsTIshx07fjBmszT9DrHvVRtKOQ1qUJ
         FzxAOm0mKmWbMGCIB92e0IlnAr4bPsYRDIZwE3Vy0w2rGNkl0jZBJE06hCdw46LIV49v
         wKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371107; x=1795975907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mE/A8sDoniLUUaDAUsGG7lJKqfa/94EhZzjG2JUFfCQ=;
        b=RUOhTJtxwztDXsaWlMAkjze50RqN61KVn+/kKlAZppO/YhFYMPXSx2bU2V441fDIq4
         4fHhk/PzNJ9WsfJccpor0pmYUg8Z8vLujSxwkJCmAyEovYmchNm8eLIunOLpSg7rt1SQ
         unbvVR8qyd//0bfs8DKC/tlGEwm/NG1VaGF1Sobej4Y2Tp+qieqhkt06Du7rKa/7s1ll
         YvgsjY7NNQXzrBHFddWThFzRcRDiydEwFfejVk+B60M5SyteZ1gZzRPRjDRXfd3DWuFV
         CKAkg3BP2mFwpFb/u5CiRHjUpjSoaskfS5JSYmMQCpZ2ZaODWlKpfxLy2Ym31sznNMpQ
         IV7w==
X-Forwarded-Encrypted: i=1; AL+hErE631pnCfF/k8C80JtwqzXmjQKkR1GUSZjii+ncqvZbAg5n5q1wvJnCGpl2YCREyEnbqdYIQMphxtVVZ7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Crrs6IEX9HOLiCWCT8LSrGjSsbmcHejoKORbPSx4DW6YVWo3E
	Nlf3rgk449hlKAIkWpo0WFLXijhaovjAZVHuEONyRVy72DvYCITN+KmonbmIpwJcDQ==
X-Gm-Gg: AZFdTZf2eZEgYt4E3iWEMK0L/TPwHymke//WiPWJdEeFk6xE2eUat0AuFWwyssNAFKt
	j9dMR7dLo/e1Nkbsw5DzI1v+RoO1GKGOKLOsdhSExPWmj0N/ZnqesnHSAtGU+yNX5lYVbuzueuE
	rVF9F8AQSYMDk/v3dzmk5xwhjE1YB2YGnU4z+stoV9Gd4SvNxQPXGgZjQjvfUksoGDcKyRZWrBN
	gdan554BJ9SqZCf2Ma4kIolVvHZq0ZyCDWsWv3a0EONtAL5UtMHrWMn8bmOSfR4dQHKVih0lccf
	QpgNHC2nWuimiRa0F7XRnx74g2ctjSqEcYE4CYwluq1bmIJPZ01dTd99hHILLfVwAR7/8n6gSSw
	HNjOelwbn/1BL9s2cTCCRmuJ4U54eYe64NO8PKmQQgQKoXnFobaxxeQXtr9QeNuCbTIrUb934Ln
	JBUsW21jYvCpzgYediMklHFxaN7OmHkMNYF0S4JwjeiCSw8ITltK2KqEGZGcty3u0T5lQ2djGqi
	Y/UTPyt/Da5+m1Hq7fthsGSiZiOt+UNsJPHeZxk/te/d5C8L//qL0Oc3WnhooAX0/LCUgQ39/ID
	i8l+h0LoioQ9mLbkmGG5FdhPqgezZbIuWIzWAzDjo6QcjCj4ohrqnxubbJpp3MhuLOoRjSyx2nU
	TzVbe/vq7zvWGo9B/IG8gIWydfuH48chf8TmmU1kbNfwQ4rUU42LAXxFv51ez8UrsjupX1fZGBG
	n5Ey5YxvMRvGb8WApgYbVTSU6tR+zw6mMR1uhlHJd3e00Ho10hjRAPWg3hA4O/Gmcy1Kbkgkyc+
	tBomzUplmwzuwDKw8dsUACpbS/VLgAcrfgJCwBGb6cW2B90DBQaQ/MeKXqk+z8FdfYin04UwNCK
	ea0iFjAvxcHt0EQMUwCKB3/VErtd9jsNU9dlbter2nS5AmFLH36mvDi8lXYZ/bjnoLTCz2PG
X-Received: by 2002:a17:906:3713:b0:c50:4d71:a85d with SMTP id a640c23a62f3a-c513aac5448mr605392366b.32.1795371107075;
        Sun, 22 Nov 2026 10:11:47 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:46 -0800 (PST)
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
Subject: [PATCH ath-next v6 4/9] wifi: ath11k: report tx airtime and enable airtime fairness
Date: Sun, 22 Nov 2026 19:11:40 +0100
Message-ID: <20261122181145.1015729-5-julius@bairaktaris.de>
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

mac80211 charges the airtime deficit only through
ieee80211_sta_register_airtime(), which ath11k never calls, so with
NL80211_EXT_FEATURE_AIRTIME_FAIRNESS alone every station stays in
credit. Register fes_duration_us from the PPDU stats, which ath11k
already adds to arsta->tx_duration, and set the bit. The TID comes from
the ack/BA status TLV, sent only for a PPDU that drew a response, then
from the completion or rate TLV, then BE. fes_duration_us is the
duration of the whole PPDU, from the common TLV that all its users
share, so each user of a downlink OFDMA or MU-MIMO PPDU is charged the
duration divided by num_users, in arsta->tx_duration as well. mac80211
takes only local->active_txq_lock[ac] inside the call, which runs under
ar->data_lock and ab->base_lock.

'iw station set <mac> airtime_weight' fails with -EOPNOTSUPP before this
patch and succeeds after it.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 23 ++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/mac.c   |  2 ++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a55..777c56e416aed 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1382,6 +1382,7 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	u16 rate = 0, succ_pkts = 0;
 	u32 tx_duration = 0;
 	u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
+	u8 airtime_tid;
 	bool is_ampdu = false;
 
 	if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
@@ -1400,8 +1401,12 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 				usr_stats->ack_ba.info);
 	}
 
+	/* fes_duration_us is in the common TLV, one value for the whole PPDU
+	 * that every user's stats repeat; a user holds its share of it.
+	 */
 	if (common->fes_duration_us)
-		tx_duration = common->fes_duration_us;
+		tx_duration = common->fes_duration_us /
+			      max_t(u8, common->num_users, 1);
 
 	user_rate = &usr_stats->rate;
 	flags = HTT_USR_RATE_PREAMBLE(user_rate->rate_flags);
@@ -1490,6 +1495,22 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 
 	arsta->txrate.bw = ath11k_mac_bw_to_mac80211_bw(bw);
 	arsta->tx_duration += tx_duration;
+
+	/* The ack/BA status TLV names the TID only for a PPDU that drew a
+	 * response; fall back to the completion and rate TLVs, then to BE.
+	 */
+	airtime_tid = tid;
+	if (airtime_tid >= IEEE80211_NUM_TIDS &&
+	    usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_COMMON))
+		airtime_tid = usr_stats->cmpltn_cmn.tid_num;
+	if (airtime_tid >= IEEE80211_NUM_TIDS)
+		airtime_tid = user_rate->tid_num;
+	if (airtime_tid >= IEEE80211_NUM_TIDS)
+		airtime_tid = 0;
+
+	if (tx_duration)
+		ieee80211_sta_register_airtime(sta, airtime_tid, tx_duration, 0);
+
 	memcpy(&arsta->last_txrate, &arsta->txrate, sizeof(struct rate_info));
 
 	/* PPDU stats reported for mgmt packet doesn't have valid tx bytes.
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 6f4462b7d3f15..eca16a151d068 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10653,6 +10653,8 @@ static int __ath11k_mac_register(struct ath11k *ar)
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_AQL);
+	wiphy_ext_feature_set(ar->hw->wiphy,
+			      NL80211_EXT_FEATURE_AIRTIME_FAIRNESS);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
 	if (test_bit(WMI_TLV_SERVICE_BSS_COLOR_OFFLOAD,
 		     ar->ab->wmi_ab.svc_map)) {
-- 
2.53.0

