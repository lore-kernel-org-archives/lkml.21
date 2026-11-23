Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462095;
	b=z8MVZ63Pa5vp6W1skndoF9g6WB86t42lvE2KbxxTK3ECi0u0m/tWUOaNVznjTQh9smc+
	 x/oVri4iBU9jgKYQbCx7qYBEOLwQ19vRTqpUTENc2/6nuU0iE0DNNhTJdGWipGpCk3GvL
	 UKrugBebO9VeEa80WnnhQ84jvY5UpLodg50xFlk+vUG97B9k9XXPNYd6Xf26aW97zm6j8
	 pQAQzAx3fnJJnFl6NBxRchBk57ZJNjvertTjbkzWVVORLbsXcn5aTxs9ToIs1o2iIyDZz
	 J0IJDqZfYMRwi1iH1GMAzsVnCQkoBPFXNRGotlBRORXK02l1LwwW5o/nxN9GY5uGsRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tVpg3m8XkKzY55cEmyE7VyD81pFXe7BeKUYNIVpFSxU=;
	b=aEDpx9PgF+Yk/L4PJuzOXPPlHoB78f6/OVZzsCM4Q7Uka/C4Up/Gi+IA3NuUNIXSoUQU
	 DEBQR5MczqEDmrYWNgiWux588pawR5U4kPH6xWLwNhSIyBGLvuZ412i/xYFg17Rjsm4TL
	 G+4AwN3cDXOwV8Nt5sZOIID8UqPS2fvkjAvAhvc4k3hbpUkm6K/s6B+EplyvjhIePbcOL
	 hxfaBjVo/Ot1XYO+rygnyVcC8ddB/WkyWHAaoIHhFx7Fgwb4c7JUj9T84nXpZiksCyo7W
	 jIXv1CUzPOmMj4qK2WZ7MidE6+Yw7rRRcTj1iE9IyDdCbpy1m8xSM8N0BePQaO5SIHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jPun4PYc;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69A8606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D69A8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jPun4PYc
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-498f5fa5103so2210476f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795462093; x=1796066893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tVpg3m8XkKzY55cEmyE7VyD81pFXe7BeKUYNIVpFSxU=;
        b=jPun4PYc206kAk+3Uwxp6Ymyh+O4JNvUqJorysOKey6OoUP4/ziwG4Htla4hDohJvY
         KQNfFR1L0mbxtyZci5Hn6ZClFI+MqLjTvujneLsOHRAUG71i89v5wjnssLr/zPDI04BV
         +NYjTAD4nZ4TVAfpswdNoqRNOrZFm89XkQak0R/mdAfT/H/pIm8cNKCX+w6Q262JFODT
         7QIYlwRgvG3e+FEYy1DDe8ORLMoLFFqIQWKVj4Ldgm1caVXrLEe55Nf65UBuBg4RNsac
         wImABrxwdg2kzf7bE9VdOWkBvw5SHfyCiOWS6ySqIIZJ/3qLt2PbHGa3RnjqyXYXgMO4
         DhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462093; x=1796066893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVpg3m8XkKzY55cEmyE7VyD81pFXe7BeKUYNIVpFSxU=;
        b=aXOEeEpDgVU45w3QjfX3gOEGut81dhbbNnooU8Napzor/k25lXV1RJLOSIUgkwULam
         vAuhHx2XWFAQapbHvMQC7Ksdom+pckN0TUkf2HPAmELIBBjf0vRmiVVKHBf5Fmp4nAny
         T+tXztjhS8JGVKvr1T3XUnXGXWB4rkcHnstccsYkb7V7K8NNuwuMl4XziBLEv2vA2pnu
         GGPIjpz4dNwLbsWQv0D9t8GbdR/m0xBjqIAbm7FEAgTIZ/I5A7k+dBTSW3ihN4uIbi+k
         uMnBKyFPH9F1UQWN/ikq35K5USrsmTsIXlTW4f4qMQl0q675nhy3V/p+TC+MZZBk6IAw
         6mTA==
X-Forwarded-Encrypted: i=1; AL+hErGNUx/dXjiUmvZIbnVSFfkam8qeVFjpk2RgbgBpCR/5jaO2lYd5T9ibyZLXhai6uM4Wu2T/obqhJ62NN+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0fcQFjOIdCHae5HIhHsnxSctwIaL8MOEirwbn3A99juMUdgRB
	l98h24sL3TLqpSaaSXzX1wDWgKP6S333K32Cm9lR01S6MNmPIVKG0y/l
X-Gm-Gg: AZFdTZew2hMeDtAmzlf+yRAorTO+YPXo7Tv9PH0b/1sK8EodpjsQDjNaKKET4LOTMy7
	qN7++LCgFWaKx46E0QmVv1AcACf5bBS//zYaT1qfK0Hg0TPS/cELezDzyv0UQmYM521QRBfr5yb
	fB7xeQ9+TbCoPUYDLMW0rfBL0aedx04zH/R32t34IRd+OwipJ4HS1YJ03QPuUE4xek88dl/QD+4
	MHwkvsBhDmMFE45Ny5ri8oi/ImXMVe5bfo8ulpHXNY2V7xU1HcoFyyuBLw5DZjMQqnomItdMTgZ
	4vuc+sRJc8fLHBRDC9h/VYToFg65+dAwJNohrBc1hcHYtnC7XS9h+6nwBSRxTr9CZek3n8BhrIh
	MjXaTO4gJEEgGXu7Tk4Y74Pqu0c48xVr4HMav3AMDLqeIDI+QQ2482A8WBMtK8Py3Z+aQuCWeYh
	rAe8EchoaG+5eeEVs0PVbhUZKtdI/hGJZ8QnNxHdKlOxOV0fHuiYreEvjkqlRyzGjDyxdQoT+GN
	rrnd9V7Fp6bEX9R1tANFKmgZxB9J/BXJNm5J6Cu36zm1ejUaHnPscDpfAMgEz5XiuVZqz4yhkEx
	pGYRTLaSqM1q2raDRUe9bWZaLzMXTa4eF62UhNAJIgyJ8S5/44YR6tI7BZSMu4NuDlvLJUE=
X-Received: by 2002:a05:6000:2383:b0:4a8:8004:5261 with SMTP id ffacd0b85a97d-4abb6d04250mr27449503f8f.44.1795462092747;
        Mon, 23 Nov 2026 11:28:12 -0800 (PST)
Received: from kidala-computer.. (ip-109-41-51-17.web.vodafone.de. [109.41.51.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm24879522f8f.8.2026.11.23.11.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:28:12 -0800 (PST)
From: Oleh Shcherba <scherbaoleg4@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oleh Shcherba <scherbaoleg4@gmail.com>
Subject: [PATCH] wifi: mt76: mt7603: remove dead WEP handling code
Date: Mon, 23 Nov 2026 20:27:34 +0100
Message-ID: <20261123192734.7149-1-scherbaoleg4@gmail.com>
X-Mailer: git-send-email 2.43.0
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

mt7603_set_key() only offloads TKIP and CCMP keys to the hardware and
returns -EOPNOTSUPP for everything else, so WEP is always handled in
software by mac80211. Hardware WEP was disabled as broken in the
out-of-tree mt76 repository before the driver was merged upstream (see
Link below), and in mainline mt7603_set_key() has never accepted WEP
ciphers.

The WEP cases in mt7603_mac_get_key_info() and the WEP-specific key
offset/length handling in mt7603_wtbl_set_key() are therefore
unreachable. No functional change.

Link: https://github.com/openwrt/mt76/commit/cd456ca87fb0afe4485ce9b091f40cf2faa3991a
Signed-off-by: Oleh Shcherba <scherbaoleg4@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7603/mac.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index 196c39f..836ce7d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
@@ -894,10 +894,6 @@ mt7603_mac_get_key_info(struct ieee80211_key_conf *key, u8 *key_data)
 	memcpy(key_data, key->key, key->keylen);
 
 	switch (key->cipher) {
-	case WLAN_CIPHER_SUITE_WEP40:
-		return MT_CIPHER_WEP40;
-	case WLAN_CIPHER_SUITE_WEP104:
-		return MT_CIPHER_WEP104;
 	case WLAN_CIPHER_SUITE_TKIP:
 		/* Rx/Tx MIC keys are swapped */
 		memcpy(key_data + 16, key->key + 24, 8);
@@ -916,18 +912,12 @@ int mt7603_wtbl_set_key(struct mt7603_dev *dev, int wcid,
 	enum mt76_cipher_type cipher;
 	u32 addr = mt7603_wtbl3_addr(wcid);
 	u8 key_data[32];
-	int key_len = sizeof(key_data);
 
 	cipher = mt7603_mac_get_key_info(key, key_data);
 	if (cipher == MT_CIPHER_NONE && key)
 		return -EOPNOTSUPP;
 
-	if (key && (cipher == MT_CIPHER_WEP40 || cipher == MT_CIPHER_WEP104)) {
-		addr += key->keyidx * 16;
-		key_len = 16;
-	}
-
-	mt76_wr_copy(dev, addr, key_data, key_len);
+	mt76_wr_copy(dev, addr, key_data, sizeof(key_data));
 
 	addr = mt7603_wtbl1_addr(wcid);
 	mt76_rmw_field(dev, addr + 2 * 4, MT_WTBL1_W2_KEY_TYPE, cipher);
-- 
2.43.0

