Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.143.172.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805911;
	b=qq26KmqN03z03j1AS9Z84SUG/AcHTfcvOo1j9APuDeHqibCt6eGNQI5x6u4FXqoJYQfy
	 Iv84dsdL34WecRAmhnTRP/yieH5Ea8fmev+fyp6SHOZt2zq+GQLr+9ngqSDegMj44G8Jg
	 VQxC12/bsx0MWie2Ua4AoKsPPra63wkLIM42dvvidfJQj3b52cMmBKUOkdkofH1ucZ6CN
	 5CL2Joy6A/mlITHpN3fDGZ5JQ+qaiA+0hXsnC4ARhdI+B7s7+DGPhQeEfWFpTaH7vm1Xx
	 50Ty8dQzDAth6OzH27bxPunjquxrUrUSVsFvj9WkU9Zr/nzPJP5pK5sRa1GJaOUubBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805911;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Bar:X-Rspamd-Report:X-Rspamd-Score:DKIM-Signature;
	bh=13Im6NjMRVUnMmBZBKdEmfUNzbWwvMI0PbIOHyXXUHA=;
	b=Gqzk0KJ2+qDNyS/1gQFnodd8I1bEUsI/rzJSIfnI8v9C4rV6paSYiFDnl8RYdKuR9z6J
	 u8z1MSAzRo6pCO7jKIC2xZ8rsVK+tWdR92K0LZMtjikECPwe8qT5bHR8uEqvCjc2AinaI
	 3ZStsZdJubdXGlYBFuMh1QXw5f/NN3Qn14TRxdMNs9mdEsgEdaQg1NI4GjfEaDXlh+k8C
	 5Eeabz5AbAtX26Z7+CRhsE6dsRu4pey7EmyGOnXBB281rffbzVaJF+XDn4iir1i410Ezm
	 kL19/Xdi4WMmWzQN40KrWIbILDmRqGKtaUMsPClDEj80iztB+BkX8gG+dCeKi6vMDnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=david-bauer.net;
	spf=pass smtp.mailfrom=david-bauer.net;
	dkim=pass header.d=david-bauer.net header.i=@david-bauer.net header.a=rsa-sha256 header.s=uberspace header.b=KA61qEUH;
	arc=none smtp.remote-ip=95.143.172.20
Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15AB60A3817
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A15AB60A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=david-bauer.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=david-bauer.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=david-bauer.net header.i=@david-bauer.net header.a=rsa-sha256 header.s=uberspace header.b=KA61qEUH
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 457B461B09
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:58:27 +0100 (CET)
Received: (qmail 18833 invoked by uid 988); 27 Nov 2026 18:58:27 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by perseus.uberspace.de (Haraka/3.1.1) with ESMTPSA; Fri, 27 Nov 2026 19:58:26 +0100
From: David Bauer <mail@david-bauer.net>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76 1/2] wifi: mt76: mt7603: provide timeout trigger to mt7603_watchdog_check
Date: Fri, 27 Nov 2026 19:58:14 +0100
Message-ID: <20261127185819.1340117-1-mail@david-bauer.net>
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
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.999999) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.099999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=7bfiLualbveH/vmJMKNmgItfJglWVbEZKv1+aO2WROo=;
	b=KA61qEUHitWr/v+uWQ6eotK/cLd+8/jwqFNuAn97PzcFfuXoGmU2u1jnQDcJ7sePhaNaLooEyr
	CtcJLYyPxPXPDtQksJNmI1pbK90tZ+5gyOxdxu9Y15w3ivk/TmLFacwarM9uvOQjtk+n3Xasm09j
	oj2awwLiu5iljvfhHUmOU00iCKGOjNV4lnN1ZsmIHckOOiWAlgyWSlz+UJMYJ3my74E+73E4APiG
	I9Vl4li5+lLsqngBvYDKf4m1gj+dikP22dSRkn8ypX0cva2gVXiR0xmzho/pWXdEEFaznVN5aIvi
	bNt9cpEO6KCuFt7fNX7UdsqRP0+TXQabsPtEOcO6c/QxTLpbgb7vaKqrJXpaP4bZTHX3aXPNYqWQ
	HvMgxBru+tCSXMrRadFqxADB1XcfA/BEUbV/a5EM1RbzZB/+nBAzocFWvh/n6vtWu7GSVY/x9Bmi
	OjFVaPEmbQEOG3wSVsFTvR1BT68dtn/hlQWi4eHCGJTgIdcMGl47RMM9o5AjqS2aAsj1znJjFatG
	m46eSyU6FbTNNubLXNiW31Is0SuMaJ6FYXyR4rAd2IgxYsA3yT4AqWKteR5tTmh4L6Gq/pp4gHJh
	86ByS/lEFqupKJxnrOwlugymZIo0VboDITtIXJyasfsB2FNfne+h+7zsP8vatQDiHbe3IC/XFZkS
	8=

Supply the timeout trigger threshold value to mt7603_watchdog_check.

This is required in order to define individual threshold values for
reset types.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/net/wireless/mediatek/mt76/mt7603/mac.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index 5940306ed3ce2..634bb67b57d52 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
@@ -1602,6 +1602,7 @@ static bool mt7603_rx_pse_busy(struct mt7603_dev *dev)
 static bool
 mt7603_watchdog_check(struct mt7603_dev *dev, u8 *counter,
 		      enum mt7603_reset_cause cause,
+		      u8 counter_timeout,
 		      bool (*check)(struct mt7603_dev *dev))
 {
 	if (dev->reset_test == cause + 1) {
@@ -1610,7 +1611,7 @@ mt7603_watchdog_check(struct mt7603_dev *dev, u8 *counter,
 	}
 
 	if (check) {
-		if (!check(dev) && *counter < MT7603_WATCHDOG_TIMEOUT) {
+		if (!check(dev) && *counter < counter_timeout) {
 			*counter = 0;
 			return false;
 		}
@@ -1618,7 +1619,7 @@ mt7603_watchdog_check(struct mt7603_dev *dev, u8 *counter,
 		(*counter)++;
 	}
 
-	if (*counter < MT7603_WATCHDOG_TIMEOUT)
+	if (*counter < counter_timeout)
 		return false;
 trigger:
 	dev->cur_reset_cause = cause;
@@ -1897,21 +1898,27 @@ void mt7603_mac_work(struct work_struct *work)
 
 	if (mt7603_watchdog_check(dev, &dev->rx_pse_check,
 				  RESET_CAUSE_RX_PSE_BUSY,
+				  MT7603_WATCHDOG_TIMEOUT,
 				  mt7603_rx_pse_busy) ||
 	    mt7603_watchdog_check(dev, &dev->beacon_check,
 				  RESET_CAUSE_BEACON_STUCK,
+				  MT7603_WATCHDOG_TIMEOUT,
 				  NULL) ||
 	    mt7603_watchdog_check(dev, &dev->tx_hang_check,
 				  RESET_CAUSE_TX_HANG,
+				  MT7603_WATCHDOG_TIMEOUT,
 				  mt7603_tx_hang) ||
 	    mt7603_watchdog_check(dev, &dev->tx_dma_check,
 				  RESET_CAUSE_TX_BUSY,
+				  MT7603_WATCHDOG_TIMEOUT,
 				  mt7603_tx_dma_busy) ||
 	    mt7603_watchdog_check(dev, &dev->rx_dma_check,
 				  RESET_CAUSE_RX_BUSY,
+				  MT7603_WATCHDOG_TIMEOUT,
 				  mt7603_rx_dma_busy) ||
 	    mt7603_watchdog_check(dev, &dev->mcu_hang,
 				  RESET_CAUSE_MCU_HANG,
+				  MT7603_WATCHDOG_TIMEOUT,
 				  NULL) ||
 	    dev->failed_pse_reset_attempts) {
 		dev->beacon_check = 0;
-- 
2.53.0

