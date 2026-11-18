Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026965;
	b=HbyftFasnBaT/qt0J3FDV50YYTtSiZJE5ASZQfqy8uA3IxGUmJ/WCJo+wk3dbyHHZevO
	 ihoIotffiujKMnbsv8NbbOFQhkmyHMnvFo+6nMjppSBAZjF8713MyIq/CapXBOXnY69DW
	 DimAyFSIMqKZEQniIR+NkmF552rP24LC0/ZPv7vUfrLWGy688T0gSUl9L856EmBrO7c6L
	 cYbY+/98EJJhh7Fww0/0k8iQokiAKdTcW174tNkls/1qkGCf8rn+3av7okLJlHomN3ocV
	 kqMKUslj8Qx+1cMpk2NuxPMGI3Xdch/W9xaJsQ/U1ZGyzoPKrOm8VCm5vZi7dNGC8Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8RDyAIx6GdPyur2p4krhRfb/lrH/VMCLoWVTsANEHhI=;
	b=FoPqC9piMM7Xr6mgjx/4gRuWX9TvwsU9KPwhPRtfr0pJoXv285zqrndAjYq1GyImnZ4r
	 PldXZ9kwCc2TyxOa2ZkkIHGFMMWaVwoqVUaqnYor58BpLhFq99CHnxCdDgmwZQ8gaGTRt
	 18mwlnW8bBDmS+G6kH4lPW5hxf5KQ537O/tQByROOJ/5awmbxqJ4sRROiKxgAXCUciZJp
	 u1f94qdP3tMNw8EzXHXLCYXRgj5UFXOAVQxN0iZFnnn5wC3gbgA/vkwm9f9aLrPCogvJe
	 9doWixiDDEAgC1BE7BsiVWhwMrfba1Tjqw1dggE7u2oCCRd7A3FWejCKC6r+CzI9Ngw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kmAcvJnL;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCA9606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACCA9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kmAcvJnL
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3712b6d9843so1534580eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795026964; x=1795631764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RDyAIx6GdPyur2p4krhRfb/lrH/VMCLoWVTsANEHhI=;
        b=kmAcvJnL0+eiYXsyN8IMK9D8KwnlkRZHRuuD9sBxVGn5t2mob9W8a/IaGyCKBnoPXo
         Vd+TDCxJ7g5FKRfitt4LhgaQYVaYShyMWk7KrCzqg0gNLr3+tArJDgRuyYbrZk/Y9IDC
         ghCHM6Agc+jSakuk3SRYN53xY27OzB6ErohGLrGTYKtqp1c64tQLONvhveiUtiSjih5X
         h3xwBeRiQlOVpLqaLA5JxJiBAsmBx8E4R93y7TqFHbZ18gvvQUSGpC3gdZ9ptWMIwG0X
         EZ7JvNQqIpAfbPLC/lgL0HQqcCdE8Hc6GepMhdP9SYzv62xf5tkTQZQbkxW72NbHHLjl
         kBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026964; x=1795631764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8RDyAIx6GdPyur2p4krhRfb/lrH/VMCLoWVTsANEHhI=;
        b=GBK+P9Fbsd9S5QgFzrgZ23mSAxB0yOxq2S+wIR9uINBUQFBtKc6HlqOfj/yiXyT0vu
         36KEpGQKYef/Gy9x8c8N61UlREE6JSTixE7cxl9fFSZw261eNfND6as7I8xqBzwdNGT9
         Ge9cXM2kVtp+8VbdggNgA+wmlFPTruppj2REw/0HKtMALuoVpGPJTqOcHZig0fn+2RRs
         nG1v6GqdB8FgIJKybsX7zEV01gTek9UN0nHe9pEElt/W91labxYmZymqMeNQJKjkFGqv
         hYs04W7831yTLYddEK8j6AzRQ0xzLecpiyQYokVcYZj6Go3mJmV9xYWTKo2S0KfNaA/s
         UVnQ==
X-Forwarded-Encrypted: i=1; AL+hErE0XmrnVPf9ca/eGOfJ3+6huRwtjtmnREYEwWIftJ2GUFgOb1Ewjd6ubHNADYdOMWSFWTytxoRCg4I3jv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wwQ55WqQKHVxttlECqGPdZC/WF/y8dUMg4j3ZJOuO3kd2iOwe
	5p/96GOqZgufhHsbB5r1TlgectQumjhGelPsjGV+iMOFpTN3DL8TizPd
X-Gm-Gg: AZFdTZfhxP+mlNVar0Mt2Y9xCFcZ/OyxJD8EJaq1ktytXaT7WkvP3hdx5setwX852qx
	CiRGJr4Km5JfPGY7je6BZBgLkX+7cu5TJ5czt2AgxqpLTuVhrXBXZR9VWTGe9s75I5s/DtF9aJ+
	2/9okGvj430iYd4HJIUj6aAAyCMPPD+hXYpG9tzJd95wv5yv7tcEU3oB8DhpqdSvogc+Jo5rUfJ
	gwZyWgRAXkL4CZgkdfWqWTXIEiClM52GRcG1uZUYxX9ZVPAbsWcyrGpugSM5VlUVe7AzBlSKygC
	hfSrgx53RLt8TPhdg2SV5N7Nt6nxYykEZibQsAsoLff6CVR3F/jnPoRbk+Ajta3BfYmpJjd7KNx
	wpdRQz4DoCNUKwsEDzOQbX/jLSEC93YRFJqzS8U1XogIwd0et5Mr02tFIcX55zMkoJ5xramBmGs
	eIiigxUbVP/H1m5x69fBPM0zQ3DghdufAijy/tSlN9eSzvM29LNBAKPV9FEWKmvM6/c9t0aGWJm
	dcC60D/TFGwDNjSBT32wyLtpbeUSgW7iJXhYvNZqKhHYWlffhzFajkG+Kz+BMvhBczD8nXSpufi
	LXAWGIN4IFl6tRli4hzVaX6jaeVVy2IJhUPgNbceGPyZzBOrQQ==
X-Received: by 2002:a05:7301:190a:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-38281bfa917mr3311876eec.38.1795026963313;
        Wed, 18 Nov 2026 10:36:03 -0800 (PST)
Received: from G7XWH7K1F3 ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45274aesm10450189eec.2.2026.11.18.10.35.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 10:36:03 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	Linmao Li <lilinmao@kylinos.cn>,
	Kees Cook <kees+treewide@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH wireless v2 4/4] wifi: nxpwifi: stop AP when delayed channel switch fails
Date: Thu, 19 Nov 2026 02:35:06 +0800
Message-ID: <20261118183506.45749-5-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118183506.45749-1-enderaoelyther@gmail.com>
References: <20261118183506.45749-1-enderaoelyther@gmail.com>
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

The delayed channel-switch work can fail while stopping the BSS, setting
the beacon or restarting the AP. It then returns without telling
cfg80211, and TX stays enabled over the stopped BSS unless the request
set block_tx.

On each failure, stop the carrier and TX queues, clear uap_stop_tx and
request interface shutdown, then free the beacon update as on success.

Found by code review. Compile-tested with W=1.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
No new W=1, sparse or smatch warnings.

AI assistance was used.

 drivers/net/wireless/nxp/nxpwifi/11h.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/11h.c b/drivers/net/wireless/nxp/nxpwifi/11h.c
index a6c87dfad9ee..d83f36b1c8a5 100644
--- a/drivers/net/wireless/nxp/nxpwifi/11h.c
+++ b/drivers/net/wireless/nxp/nxpwifi/11h.c
@@ -300,22 +300,22 @@ void nxpwifi_dfs_chan_sw_work(struct wiphy *wiphy, struct wiphy_work *work)
 	bss_cfg = &priv->bss_cfg;
 	if (!bss_cfg->beacon_period) {
 		nxpwifi_dbg(adapter, ERROR,
-			    "channel switch: AP already stopped\n");
-		goto out;
+			    "channel switch: AP configuration is missing\n");
+		goto stop_iface;
 	}
 
 	if (nxpwifi_send_cmd(priv, HOST_CMD_UAP_BSS_STOP,
 			     HOST_ACT_GEN_SET, 0, NULL, true)) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "channel switch: Failed to stop the BSS\n");
-		goto out;
+		goto stop_iface;
 	}
 
 	if (nxpwifi_cfg80211_change_beacon(adapter->wiphy, priv->netdev,
 					   priv->ap_update_info)) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "channel switch: Failed to set beacon\n");
-		goto out;
+		goto stop_iface;
 	}
 
 	nxpwifi_uap_set_channel(priv, bss_cfg, priv->dfs_chandef);
@@ -323,7 +323,7 @@ void nxpwifi_dfs_chan_sw_work(struct wiphy *wiphy, struct wiphy_work *work)
 	if (nxpwifi_config_start_uap(priv, bss_cfg)) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "Failed to start AP after channel switch\n");
-		goto out;
+		goto stop_iface;
 	}
 
 	nxpwifi_dbg(adapter, MSG,
@@ -337,6 +337,13 @@ void nxpwifi_dfs_chan_sw_work(struct wiphy *wiphy, struct wiphy_work *work)
 		priv->uap_stop_tx = false;
 	}
 
+	goto out;
+
+stop_iface:
+	netif_carrier_off(priv->netdev);
+	nxpwifi_stop_net_dev_queue(priv->netdev, adapter);
+	priv->uap_stop_tx = false;
+	cfg80211_stop_iface(wiphy, &priv->wdev, GFP_KERNEL);
 out:
 	kfree(priv->ap_update_info);
 	priv->ap_update_info = NULL;
-- 
2.56.1

