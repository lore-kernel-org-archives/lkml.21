Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381689;
	b=32IUamK/f8rz5osDBlLEKf9no0PTx+6kKMSfobaTMwK1K4AG7XabTtkR0cO/jUYJ0P3K
	 IRGU256dJ6cdw6v8TKqUko2/4yjPbrbrsjSW4I2kvPLX9L8kUPxoCY7SbuHqaod4llh4F
	 MEEvhQTlG+LZweHvBSN4taq6VGjJa9S3TK5hI94we7vmavdUFELik35kowDbSNSYBNrY4
	 QwuNi+fbarMZgBro299V0UJiqwFEnDxTlqpCdmbK12WuQkogOIc/MsGJXe+h+B0jea1u/
	 zsBgyuLnXbofjDEPpbFeK1b30pikWlnCOTEeyo4TDe1KpKmGj/wEqmZxJUJOO2z3NmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aflJJ38bjdZjg38SRGXSXCVpGppEVOtqLz1Kzz0bSiw=;
	b=G4K2SHfWwwnttQDb6/1CAEUmkA/WkFnMPDctAsNMXDCIJP8ZJQazuevSLuPsROUTUvYk
	 qonlmj4HuZCwZzuwA8AlRSqMaKyry/kVrbtLPnvxJGvcw1UwpdQLhvlD34KC+jsjofIsz
	 kmXQggF0LJ2jN+1U4bo/DaagWOfwljzoXoBdeurmOAwGuebuS4YTR8ta5rudgbwGigv7g
	 yKluhbGrrk5OflvhSMjFAPLUTZGZssx9URTUH28YEmOKW2XWt2DQ41/S5LXZh1RxP8nlq
	 ovU3pw89NGtVjZg7p5B3lviEaJ5wFo4i0UHknRAY7nm5+WLGWieNHkgUVjwRDuTzXcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=PIgVIzCK;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8561D606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8561D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=PIgVIzCK
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5154989984so266473966b.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381688; x=1795986488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aflJJ38bjdZjg38SRGXSXCVpGppEVOtqLz1Kzz0bSiw=;
        b=PIgVIzCKE6SJkmg6efpInkthL3unvMpL2cFeRF2f1s6ildvJKUgFG0S91ZN7LziRlo
         plLyGAWAuAMQmMSfaWD9i+vRJd9+5MLvSFEQGS8J2wcR2kjUpnIztPTbmgh1oXbHQtFi
         BP0Dv4cbvuTElln7+pZIq/a2B6yfoM0jjygfw9BPZpXzAl0MxRjeAzljgRS1/i48gXJn
         yHA+qUNDUgADSWwdcyZCKl14yNR5FoogL9vzUTq2NBVj1Tc2ZQzEKTUVIY/7ru8v/xUC
         2Z3qKyUH21QP6CHwrVJADbXze5UJa4vGqmEIvaDuhLKq/CXSnKJIHx9xgWazA9iaU2Ez
         F/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381688; x=1795986488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aflJJ38bjdZjg38SRGXSXCVpGppEVOtqLz1Kzz0bSiw=;
        b=jXwDJ6Pbl2V685PXGxW0UVkn5XcSrP7gatAPwqQfSLbd/+6NKT/4o4w21R9FLGC5ry
         oYtkGj460QzIn77v9J9a4nSh/aopRaoPxWaoBz+cLMem187WSM+mH8XFcCAhNa+eWAhD
         NPO9/av97RdhpZwaAvC/fJNIOWryWOt5rXu7/42CrJ4V0WEh7gHXwRO8noq5DxQgiavD
         PJLZTmSZ58NdYlUxTEHdN4Ds6FGQKTuXGblHDu4dEPvhV+KlX9EMP9BClaLClfbFNdYE
         LEXOgI00YAgSj5IT5awRvx9Tj1crf6hzodQyacbkdcgPsKrn0omx7yNFLpvHXn3hMonN
         rtTQ==
X-Forwarded-Encrypted: i=1; AL+hErFHrdY+w8yxoowlknlAKv8V301GtnTs877ek0pCsCIYiMbakcs1bcT1N6sgfB8Myc7DQloP/jfKzNWSjLo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LG6AgK0Dp6n0P3hE08bML+ImofIQoY7x8/qCslELOmUB0xH+c
	N8R9fm2OFaOSPOV4dlvBuQFj7AJaJedc5lorJNqonsfiymRuWQPykpdCV9SGpEF8bw==
X-Gm-Gg: AZFdTZel4MDp5IE3iNCQfp9cLtZS22+BKaVSkqKKs0R67fa6hTC/bRsEJ1to9bBITfG
	OT8C6TcmpaUpAKY3F3MEyEWzBJM6CIOvdI+ZFjKyXb24F0qwh3GZxRAVVKI3DvDk98V+8DOCqQs
	jx45+BQJ4Ch6rz29s7WWgbGXi0yyK44Wd0vb/Qly65GQfKnyTz+r4ivUxZiheF0unV+I+5grkR5
	ir+piu3wPtT+nQqofUHtXxRLxrEeB8P2XLu2LzcEUbEvWouDZbFmzNSsJbDcyKT5N7JmA6JpO/R
	yjcU/H7WqHghPiVwU/hnEoML9JcBdZDOid2bhm/0IKo5QmhB3FxfcXuJBh9Ia4zWY6Wu7u4zNc6
	ptVpNQ6ECXFjLxLMCoen+iX59f+BMQwsJ8DPqscoRCMwMOfdHGOGidGOl7IKkaLpqcXdq7yXQ1W
	IAngXahyD5TslWD1SKT2emtSbsAz2E8PAB7WitG8g1DTuIUT2tiKn3akvcyoPpHP0Kjz1X2jpMf
	QFo4kxAKotLOb3Fem83NZinPlC9rSiJl01qc60pnATKSQ8CEtGuouBfo5TmmAQa4jPKwWL40MH9
	h8jNuxLkECo1Fzqhn3dYkdEgS37QN17IU26EF2Xlu+mOmGxj5GW2JGy+lwrVe9T5ohk3dHQ/ZRZ
	O5ZtvvB9km9bV2+/d2YkVYM8caduViQBh1qpIcEhFHnOMRetp2v8/37j5q5RFhASYw1nt9mRBc1
	ZuMmJrdOMBJpsdH+sXjO/QLFFOncMxRhowHyiisCQPwvvv37RE5LRSN8ajbWK84jUlBUcPCXZRM
	/byNZpIOX+ZqhZDs3D22Kv9AfDoGEHqijCxiNZnumdLkTY0VDTBXv2VUwXqAG99qMZxAw7RQk+i
	rhA2/5YYSbiDuXTSs2cO4ZAeN7AOPQxVeV6dB4+OMcFoEcQfSvz0hH92O2VjtMkgRnadLMsbJiF
	8l5qbLMVh7sXWUE4OArA=
X-Received: by 2002:a17:906:b7d2:b0:c2e:52d6:1fb7 with SMTP id a640c23a62f3a-c513a82d478mr572934466b.22.1795381687920;
        Sun, 22 Nov 2026 13:08:07 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d50069697652bafd0866.dip0.t-ipconnect.de. [2003:f2:4713:d500:6969:7652:bafd:866])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae9f705sm345077966b.42.2026.11.22.13.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:08:07 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Subject: [PATCH ath-next] wifi: ath12k: drop decapped frames with a source other than the station
Date: Sun, 22 Nov 2026 22:08:09 +0100
Message-ID: <20261122210809.2087836-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

With Ethernet decap, ath12k hands mac80211 an MSDU with the Ethernet
source the hardware took from the frame, which for an A-MSDU subframe
is whatever its subframe header carries, and mac80211's 802.3 receive
path takes it as the station's address. When mac80211 deaggregates an
A-MSDU itself, ieee80211_amsdu_to_8023s() drops a subframe whose source
is not the station on an access point; the decap path has no such
check.

Drop such an MSDU on an AP for a station that does not use four
addresses, as ath11k does. The address compared with is that of the
ieee80211_sta, which for a multi-link station is its MLD address, the
one mac80211 compares with too. A four-address MPDU from such a station
passes: ath12k_dp_rx_h_undecap() hands it to mac80211 as an 802.11
frame, from which mac80211 reports the station for dynamic WDS.

Found by reading the code.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Applies on top of "wifi: ath11k, ath12k: RX correctness fixes",
which changes the same function:
https://lore.kernel.org/all/20261122210525.2076058-1-julius@bairaktaris.de/

I used Claude (Anthropic) to help write these patches.

 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 1d52eab418a1..abc3b6d197f1 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -354,6 +354,40 @@ static void ath12k_wifi7_dp_rx_h_csum_offload(struct sk_buff *msdu,
 			   CHECKSUM_NONE : CHECKSUM_UNNECESSARY;
 }
 
+/*
+ * With Ethernet decap the hardware passes on the source address of the frame,
+ * which the header of an A-MSDU subframe sets, and mac80211's 802.3 path takes
+ * it as the address of the station. An access point takes no other source from
+ * a station that does not use four addresses: mac80211 drops such a subframe
+ * in ieee80211_amsdu_to_8023s() when it deaggregates the A-MSDU itself. The
+ * address it compares with is the station's, its MLD address for a multi-link
+ * station. A four-address frame from such a station is left alone:
+ * ath12k_dp_rx_h_undecap() hands it to mac80211 as an 802.11 frame, from which
+ * mac80211 reports the station for dynamic WDS.
+ */
+static bool ath12k_wifi7_dp_rx_h_eth_sa_valid(struct ath12k_dp_peer *peer,
+					      struct hal_rx_desc_data *rx_info,
+					      struct sk_buff *msdu)
+{
+	struct ath12k_sta *ahsta;
+	struct ethhdr *eth;
+
+	if (rx_info->decap_type != DP_RX_DECAP_TYPE_ETHERNET2_DIX ||
+	    !peer->sta || peer->use_4addr ||
+	    (rx_info->is_from_ds && rx_info->is_to_ds))
+		return true;
+
+	ahsta = ath12k_sta_to_ahsta(peer->sta);
+	if (ahsta->ahvif->vdev_type != WMI_VDEV_TYPE_AP)
+		return true;
+
+	if (msdu->len < ETH_HLEN)
+		return false;
+
+	eth = (struct ethhdr *)msdu->data;
+	return ether_addr_equal(eth->h_source, peer->sta->addr);
+}
+
 static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 				     struct sk_buff *msdu,
 				     struct hal_rx_desc_data *rx_info)
@@ -390,6 +424,9 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 				return -EINVAL;
 		}
 
+		if (!ath12k_wifi7_dp_rx_h_eth_sa_valid(peer, rx_info, msdu))
+			return -EINVAL;
+
 		/* resetting mcbc bit because mcbc packets are unicast
 		 * packets only for AP as STA sends unicast packets.
 		 */

base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
prerequisite-patch-id: ed566369a9bbda0ac9a48357261e8cfe1cc0f1d1
prerequisite-patch-id: 726d7737c833da0842192eccececad4a0dedb1a6
prerequisite-patch-id: cf0b8ff1ac6cef681433247e4b937a3e23af78a3
prerequisite-patch-id: 03c89df01745ac9a80653431261f9a003dbca7db
prerequisite-patch-id: cb48c0eddbe0c2fe176e8edc94c6bc40be3c48a9
prerequisite-patch-id: 1956ec85ad80b68868538070fc0e89c29603467a
-- 
2.53.0

