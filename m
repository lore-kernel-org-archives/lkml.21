Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371107;
	b=y9coFXXsBujPboY8GPmqR4kK359isufTedB5aYBzzfqjWow7GPIRwGNie73XtaCeefoF
	 e8iOUR8PDqw2qkVKGJKiQSjO+E0AVak/3TCM+uk/Kk8YCsQq0gkejv8gQ8jYRL/YW1uOM
	 7HEDDLvUzrHTOs3jfkyCxQWG7IvvSosdqxlgqxBoadKhZwUhlFlGbFrRPU3TOKaNyJAFl
	 iMfPksQrp3UOObIIFHQs8ByfbtP3RqJKm6jo0CjcE/9g7YWjPPAMLLjVdWIDu9Jo8rYPz
	 vttaBhZgoThKvnskaLYtX8pIb0E95g/dT34IM8bX5LBi5OuAzfGTNghztUBKhI4pyeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VbRn6lUIefHO9idsi1h3mMXbFeQtqB3zWbpoKodoBns=;
	b=WV1CkkGGIocK+tnq/4v6YeNPTlTnQDj3TTilHEAueTQiffAVmlWMnfdR3sBbP1E/nu8c
	 MNpR5GToZHukhuwVJENBf8NxplDBHP9axPo75wZH9l1rjhVsWOnp4qRUotBAFaLBuuOLM
	 pRiPrZDpTb75m3cMWIYRUNxZCkjCyhbapWk4d7i75FR7RAUKBbW1FPJaXDm12Lqv0nzm/
	 7hlIyAUojgywJDrrWUbrse1VrWL3Zl6zIuOLDCp5+3xlD9kdhVgsdk52Tgfws4Wj158ZY
	 Vf9IE3x037Cr1Rf/J8r570isvKvJLf4oNZIKl4w3bMAaLj2dFoeip9CdAGRZ7NyJd0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=m7bp2Vrf;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD8B606A682
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FD8B606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=m7bp2Vrf
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so416619166b.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371105; x=1795975905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VbRn6lUIefHO9idsi1h3mMXbFeQtqB3zWbpoKodoBns=;
        b=m7bp2Vrfqa0aHM9Yw8BJMpNb02/+acqC51Cs8Atw0TtC6Xg0n282++SueOTPMyFiqJ
         f5mr0KoO8f95LWQUZiJFcHz+h0DB12ejFSEkNMvbMwoQ2Vqe85WwSfgGaWAEYoLnrdln
         KP/stVxIx4kHMKhgiKDU3jRZXF+AiyOknd4mWaJjIz2S56hj4vvHvBLmvO2+i1YAiKqc
         BgH4Xl1wpR3V2N9vBvr/ZtxIZ3JYIc8SdE1N5XQuvi0APZNk1Ch2g2M2cliZswfIvkqn
         8TZhLYvDF1JH8BUP0ZGCzPS1KBa41gZ5WS+rJcyx8KieRMG8rZf07tEA97dndJAq2cTV
         AZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371105; x=1795975905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VbRn6lUIefHO9idsi1h3mMXbFeQtqB3zWbpoKodoBns=;
        b=B0FF7hB0kPMFVoydsNXDE3WuuZB2QNsPWA5KghjeCdR+uKMlL6XvACgHDfDVis7EUn
         WxWY8TxEbsTsxEbuXqo+s1SaLj2fh6gD/6mJx/d7Zk9lvzLGkh/psUqEaIVgYZvIwUg6
         ttkZIZCYGrSMAoKSXsfaQVDDAOMJan2OYI27pNSOteuVBcU63Nl+bafT1EsUDF+kE2sc
         qF9lzM5l4dC9/VMDntfZ1Oqtx8MfCzthjPFwXrl7LISASMZX0FE4RYFXvIsLO5qxsNZn
         NapDOZi9DtYoYMEvhapQ0NNdKAb+r7L6B5sxTu/3K+DL0X4cbsS4EOdYeJBvxWszAKD1
         bNCg==
X-Forwarded-Encrypted: i=1; AL+hErF/OHpNgbpddoAXfDc4pcxnmjdk6yZPa4P2sriKogFKBdb4evBVYDIN9hEudtc/eWzXiOo00jGxlFewbv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Gx5LwcqTYbvM2OYC2gh2p3mSajw5J0vKovZyKYwHlEd8HeRPu
	ujAmxwQxIhzkZexf2pL0+tOJ5r2JcF5GDxZau0QkTJTexsv7jncNQYJsbTTGMuqlqQ==
X-Gm-Gg: AZFdTZcOAw91H9ia69JaPZ7B3HS3xmLjpZsbTyPlQc6PU+tosOy+t0WYE5/Ye3aVhJW
	dGhBx2xNjS0OS4o7pWIog7hjUrhz8X9+mDpQ4k65rJaI9AYwkhzzPP3Kz9ZUTgrrWEGz/yewjXb
	pnUVH7qGhsixwtRRoH0j40Xrpv2+UNsqp+/2DRhAk1yXXTR9GiExalnHzRv8t6GFwJKaTHd6D0U
	TtHWJt4pts585eFyWrqZBIP0wlJU2b/x45/zlBGUiD0RD0JrS0oYB+ewJ0QMC9ft6J4LbewkyrO
	r9ce9Pg524Nqf3XSy3PwBW+dHALqYuzVa+CzL6qRkS+okJrJqm52rhR3PBDR2rhP0KkhilAZq9b
	D8br6AcWQNSuvOfMEAjJxhRc8z+wDx3FWxDqdZcRTdj9OLydfgpQKneRsdFIHAKK9lZ0ts200Q9
	/OFcjcDp9xvKq1nYRejzALtJR6afrhG9Y+QoNMTeZt0/ZL9HtS8xluFXeXo18DtmMrLZfstnPQi
	/DxZFsS8QXZnYMoGBQfGaiC+KXQRBoLqApSijwOYC1fv4fx4GUL3kcbCHlPpZyceZSbvll/u/Nn
	JKhRMnO65mluQ2VYmPvUyOtvo2ciswaXkdvvehNu09AAQxD0NXlD3UO7jL0C1V6fnGw4cJbWtPV
	tBcftXpVJBTx2jVvC7djvm5qOXqIggAga3Mrzgndc041jbd6XSrcTQJqCgh43CXcheNNBa9Zu/B
	yXogY1hV0U8dNf1tyl9rwUlcfb8ihehJmXl7VA61DSg+BCOUZ8j3vi04WBRX7fpw2TX506C7Bvh
	REKwLoeY2mgzXaEl5sste7CdWuwaeouUkjk9+s7HGZact2WXP8YC+uQPkTJk6PaXreSsypsXqMW
	/Ppu9YdhthIiKmXUUsLt0qU2dVi2Xazyd0K2OZDQiwV8N08pAkPlUYfvOH2F+scHwKBCv5hx
X-Received: by 2002:a17:906:f9cb:b0:c50:576f:b3a8 with SMTP id a640c23a62f3a-c513aaff1e8mr650474766b.48.1795371105507;
        Sun, 22 Nov 2026 10:11:45 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:45 -0800 (PST)
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
Subject: [PATCH ath-next v6 2/9] wifi: ath11k: enable airtime queue limits
Date: Sun, 22 Nov 2026 19:11:38 +0100
Message-ID: <20261122181145.1015729-3-julius@bairaktaris.de>
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

Without NL80211_EXT_FEATURE_AQL, mac80211 applies no airtime queue limit,
and a saturated download moves every queued frame into the hardware TX
rings. Set the bit. mac80211 estimates each frame's airtime from the
rate ath11k reports through ieee80211_tx_status_ext(), and charges its
4 us floor while that rate is unset. Only the PPDU stats set it, so
single pdev chips, which take the rate from the tx completion instead,
would stay at the floor; set it there as well.

With the series and the AP pinned to VHT MCS 0, a TCP download to one
1x1 VHT80 station keeps 22 Mbit/s while the sender's mean RTT falls from
526-587 ms to 42-44 ms (three interleaved runs per arm, default limits).

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 6 ++++++
 drivers/net/wireless/ath/ath11k/mac.c   | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 0e3b4e836001f..081e79d3759c5 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -578,6 +578,12 @@ void ath11k_dp_tx_update_txcompl(struct ath11k *ar, struct hal_tx_status *ts)
 			ath11k_mac_he_ru_tones_to_nl80211_he_ru_alloc(ru_tones);
 	}
 
+	/* Single pdev chips have no other source for the rate reported to
+	 * mac80211, which estimates airtime from it.
+	 */
+	if (ab->hw_params.single_pdev_only)
+		arsta->last_txrate = arsta->txrate;
+
 	if (ath11k_debugfs_is_extd_tx_stats_enabled(ar))
 		ath11k_debugfs_sta_add_tx_stats(arsta, peer_stats, rate_idx);
 
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 90a0404a101a1..6f4462b7d3f15 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10652,6 +10652,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	ar->hw->sta_data_size = sizeof(struct ath11k_sta);
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
+	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_AQL);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
 	if (test_bit(WMI_TLV_SERVICE_BSS_COLOR_OFFLOAD,
 		     ar->ab->wmi_ab.svc_map)) {
-- 
2.53.0

