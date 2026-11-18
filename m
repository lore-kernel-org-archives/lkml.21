Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991929;
	b=X+8rmp7Ni6QXVaShGjJRyrQbwPtTwIgIeDJrs1wJWQqoevv7uonphGfBcXuuSI58i/h9
	 EgazHjrNvts8GSvQI7QjJvc+Bs66UtQa+juOckylehSqllwjbGVLMQg20Iylt0EZ/BYzW
	 jYAM4PDQOXy6XUhdIdYxwBSr9iwOr3jF/MBGhIH6/UvCR2/iKDtJzSYEya+Ij0LTPfaRB
	 5HW8j6g1W8YSGk6ha7Hc7yvbmvVmBVL4FaJQ1vOnNngGM4HuzqCMqU9588SirdtFg+EU7
	 7xyFjtserTt6C6B7CZgXj7hUwN3kyH/wwzBdfyAszEReM1tGru+yjRLadeD9O4lSGDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TzG6CB5mbUjL4i1wwOtQqcjpwm9NDorO8ya/2ZN5BSk=;
	b=d1BvR1VrSHK5M7PsD/meAZW1bJdIyJHQ3iUgcbhmAx+tdGXtHDHluCB39ie/fs9SZPJ5
	 VnDdYhMB0QbD+K3HCWVSQw4jj/xFMKzzUHQzxxfhQycvAYoFcA4drO85OgDykbodejm+t
	 emC4y0OlZA3XAKyDqZcGQWybHyEuor7b9fcbKSBvBTlruFHEPbohVyl089i7ChJ9ZH2bo
	 53OkIFiPoWBijurPM7sInp1bQqi74c5bx7ACV0HtT2ikW2iA18S75e26Ql9/6Dqb6iWVr
	 7TajzqWEyTHhvb/1ai7EJI1vYJpylSlyCSct1EJl/SSPuJbwOqbSTMBpmD0sK8ZbkKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JFMwgP8I;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F41606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5F41606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JFMwgP8I
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so6339625e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991927; x=1795596727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TzG6CB5mbUjL4i1wwOtQqcjpwm9NDorO8ya/2ZN5BSk=;
        b=JFMwgP8I3SBwcTIPLThzf+iPr/z6yVuItYnGncHMENVrHIde2NLOwFiqujUbsO25ZB
         KWn8Q/aPwf1BGiWhDjhIHyIEiBi1ZD42BFUFLOXLPVxPjXwhXIgbovfoKnGlhSRLKgtZ
         q1CLaIeV1p9Mv4ZKsCcKsOIr1SHgsvlLBroJ5b772BTRu4teF7WkLkOWp9IXTMyPrgI6
         TPjbfrtZcKd2+7QNmZkcWTNbVKPQGv9/ZCjG8kceDoWmzJLKbxoh9GDdaTQe2iWQLPxw
         mfWRkrYTSHXbZggWWjYHJ65KFy0E33eE5lTjm0wWzyhb27YlDO4y8M1zREVIPB3QONhR
         BhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991927; x=1795596727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzG6CB5mbUjL4i1wwOtQqcjpwm9NDorO8ya/2ZN5BSk=;
        b=P9jNJ2QJCCAengknotMZ4VffPHLYGogod77+ptRu+/+fVPxNmFnbXj17uV4nXYfjvh
         2ZWowLDgDOlOUi9EwsnvDaUQtgNBkVdF1+BNZKDcY1GjZxtpnh50vpESycXTx/0Gzf1D
         P5coX2OZH523AA+3qsGlalZNHDLk5IXBl5E41ZnoHULMSgGw1w2Q93QHfR/wI5+nTmjl
         FiQh3/mh9M5oMKZ5N8o25SXzknDtMYR6qeU9fwCCt43SZ3XkrFwogZzdCIZVwdKMVuIT
         IuMv/Ug17K0u7He8HY6Te2/QdC50l3ih0mfvq3q8bL98BPKF90N8oyCvPzuRhVm08t6y
         eraw==
X-Forwarded-Encrypted: i=1; AL+hErHtiVA+nTvr/EF0Yw8Z0Voq2nAHmGEbJi2+8FrrSh52P0DAllZglyQz/KtF8XCEYQj9yAFhBsUvkUwjVHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HeqjKKo03lm57yZNTfcZLBgVm9uhmXITrcbHpvYapwypFqSs2
	+ZmFXn839r+Zol5n/yU4gh9dXIBNBtNxQJcbGqIaZe3o2hbaKbwFJWDR
X-Gm-Gg: AYBFou2so9jCWb3FdzJ+KGsIKih3k5juOLIjZ6y4xL6o8HRNdWKE4nydx8PhMTwpFjl
	MYNjssBT3D4MZDY2y+9UGqz3uiftgI4NfoIajoQSN1hPqzCFXrsMK57zFCJcTOVgWKruugUgrHO
	lZPskJMSpwUQd6UuP/6ufvw1Pt7UnOf5N04evl4BxK3rlVgNL5poiEXJLvb2r9bfTSuVQbLmhNT
	7WsziPgC4arXJVlyEQQy8u7bwiJaRqPMG8rlK/8xIJ6ltpuW9K7IusJmzhF4JOn/lAFBQ8NW1Gv
	QjA7AOJf+0Iayi8IXCB1NjhTTNAhBpmYBMpyCgz0t2iHhRxZoGqPb3xvsoKid3IcNCrCKU+LtsU
	+8hR5/oyuYg69XJzIsz5uIE0cRtta+AEkgCdLleB/IrhxKn3dixAX+vwzwzeAFtmVEuFVP5Zb6w
	G0DzCO5Pi0xvcb62yDkX57XdIw35Hf6FkQ9onrFdMNp9Ae0UvqL2PmYsRKzawM16Xn3Q8JJJ+bG
	mLdW20tJ02xh8d4UjfXTMbo4IDD/ixKvgymnhbV2j3u7Q1/4M9WMohLwTtVoQTBgqWyGdippxxw
	NdUS8Xr0q29o+Ccvk//KbDSyIHHQVk7ZAOw=
X-Received: by 2002:a05:600c:8b05:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4bb7da26eacmr32193455e9.29.1794991927122;
        Wed, 18 Nov 2026 00:52:07 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm234525265e9.3.2026.11.18.00.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:52:06 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: "John W . Linville" <linville@tuxdriver.com>,
	Sujith Manoharan <Sujith.Manoharan@atheros.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH ath-next] wifi: ath9k_htc: free an unsent frame with ieee80211_free_txskb()
Date: Wed, 18 Nov 2026 09:52:05 +0100
Message-ID: <20261118085205.1989547-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

When ath9k_htc_tx() cannot send a frame, for example because the USB
send fails or no TX slot is free, it frees the frame with
dev_kfree_skb_any(). mac80211 keeps a copy of a frame whose TX status
was asked for, such as an authentication response of hostapd, until
the driver reports that frame. Freed this way, the frame is never
reported: the sender gets no TX status, and mac80211 holds the copy
until the device is unregistered, where it warns:

  Have pending ack frames!
  WARNING: net/mac80211/main.c:1761 at ieee80211_free_ack_frame+0x4c/0x70 [mac80211]

Free the frame with ieee80211_free_txskb(), which reports it as not
acknowledged.

Fixes: fb9987d0f748 ("ath9k_htc: Support for AR9271 chipset.")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Tested on an i.MX8MP board with an AR9271 as AP (hostapd), ath9k_htc of
    this base. A test hook in htc_issue_send() fails the send of the first
    two frames with a TX status request while a station joins, after the
    driver headers are pushed; both are authentication responses. Without
    the patch no TX status event is reported for them (iw event) and the
    unload of the driver warns as above. With it both are reported as not
    acknowledged and the unload does not warn, 2 of 2 runs each. The
    station joins in both cases.
    
    This applies on top of "wifi: ath9k_htc: count a frame as queued before
    it is sent" v2, both change the end of ath9k_htc_tx():
    https://lore.kernel.org/r/20261117071620.1650281-1-mehmet.fide@gmail.com/

 drivers/net/wireless/ath/ath9k/htc_drv_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_main.c b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
index 3c52e66c79f4..7f85e980fc81 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_main.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
@@ -902,7 +902,7 @@ static void ath9k_htc_tx(struct ieee80211_hw *hw,
 	__ath9k_htc_check_wake_queues(priv, true);
 	ath9k_htc_tx_clear_slot(priv, slot);
 fail_tx:
-	dev_kfree_skb_any(skb);
+	ieee80211_free_txskb(hw, skb);
 }
 
 static int ath9k_htc_start(struct ieee80211_hw *hw)

base-commit: 465fcc982a221f774594aa7d7351fde8c03a3deb
prerequisite-patch-id: 9b2187facf209488bb53b815bff10f3731764adc
-- 
2.56.0

