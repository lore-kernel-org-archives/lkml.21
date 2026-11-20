Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174297;
	b=eJvHI0gpAaoJOcy4HPTGW6ld8LXs5crcqhh6VaUmL14eV8VgAln3ic9rQVfQDyLcX1/u
	 AQoUbLd2X3iL039ejonGjOd7PHZDzQqS4JAM3YF646bcznweMrjkFwg1Iknu7D/Mi2nLI
	 okSG0qZ+an+/Pz5k+ZHVCnBUtlbyFLmhvu26KkN3W6/O9rRToJZ0c+htiplxyZPIQMfLD
	 c3ddU/StiXzTp9ZELBmp36Mlut9bvgX3urW8xwe5cH19ux5DvtjfweGv41vWFPTsYjo+K
	 SVOrWu1ZB9N86gKGXWAzjpckaPutRyZehl4Ro80T/Tr1IAmKUxh+Ect59vdLJbtZ1Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Cig+jScI/TQIlFINEQ7/KEmc9aqF9xYIoI0bZxnjsQU=;
	b=aT0kyPEx5aVKGRiVfhqMHlJg4mrrFx7nFHwxeKTRtyRQowFTDTChuneSnFtiHh4+0HCR
	 eRFFhYFX1fUEPrtZzzYq2hKZ15cv3kf69d8an0MP8/7oODrbKHUOzXtEd+Js0aem1fhSq
	 Qs44+eJVyNUru396t/mxAQxw/mGa1cCx5adsD22A5eLj/5VW/W8kEAFx6m6hd/eJmLy+O
	 G/XNvINuFmDB/eIt7hlPdK1Da9+rhMNH0cLm/XsITtY7ZuwMU/2y8FRIu1y+yjincJvMI
	 9GCyD5Q/JLPzISZdgfnEmBbTKVhT8wVsQjQLn6kkK6JuioI+PbCxF2FYlVaQFEoxhwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=us6QNTHX;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C20060A3803
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C20060A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=us6QNTHX
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38190551625so1267455eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174296; x=1795779096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cig+jScI/TQIlFINEQ7/KEmc9aqF9xYIoI0bZxnjsQU=;
        b=us6QNTHX8oXhp/mQk6OZMFrKfqOv5ZM4HFYQMEmcWnn6dOL8G8XY4qS/NYQiAbqKl0
         MNUeQaLnm/A4uXtK9DtPZBYplSw7AmCqWou/o3/juZdgxO99o5z5MIsCjCoC9fahklDi
         oUp7b/PLmeDt2K82N00KV9fu9NfNTYQ671oupRm82B1aPiw0VzTAxOcNR2aGEMsLC9MO
         L0ocpY+M5q/gYou99bTVOTJIHgNL6AQ+Bf/hTITHpXAwCFjqoGjngsKp/FG3epXLpABp
         38nZ0NvpNcWCFDMHzg++ES1+kekQgSdkeHjd73PNZDm/Vaw7R3Ij2fUG5sCflUoDyOcp
         tXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174296; x=1795779096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cig+jScI/TQIlFINEQ7/KEmc9aqF9xYIoI0bZxnjsQU=;
        b=m0TT/i7vISr5QDtw5EK837K63MYttp1zMkNCC/3z1WEdx5/tYwk3tIUt5ii1Rs+3j5
         oUpu8Nfo0kFK/ewh/aLgvikFfSg4eR/yTgAlM5C2xb7g1c9zbEnIEhGaqFDpp3EXjbhd
         gz/UsQkICQjauKXXUj+v3rRO0cRp1QH3io89FT0pG5fziCKlorYMG70BBMH63OfQ0dLS
         raBWtwCD8eKS/qCKpO4967P3V6uZ+2ibV0GGaDOxcrxq8zjAoElxHmkY6AL1DAg3BSjE
         Br6MNvf/mL77M5kcmL448trznr0WSfchbxXKrWv65M4jS4s8ZpUk5ZOjDBD7bB+KcRiV
         ptOQ==
X-Forwarded-Encrypted: i=1; AL+hErFXl4snBw68QdltIsPuoseoRqcmdDLoobUjz6WkFSSQwYaLdMWXaY/aRfgLtSwC9gIuYd1P140Se/QgS7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lpoXQIyJ14504hPEkf8I1RfC2GnXMQSnSmu9EOD/p07ps+RuA
	4gqwSdlb13/4oHfjPP4dW9Nv0yXV7Iof8NYKUyUOif3w3MoV5gQqbGBJ
X-Gm-Gg: AZFdTZcCfoo4hzEQekXOMZt3N/xuY4HN88i72lTGEU5H90UVtX9KyhEuAw48ztddlml
	gwllQp9P2lWyzIG3h3ZS7aK6uY1KjWqMl9dFBreA9rHrMbHuUpI3DILRC2XO3lshbzyUuUZkBD6
	8vwURZxGqUt2F2bBiTs3vYH0+YLh0jL6fb+9/N5kVar+tDbKvVYY1NzIP3TvtGIxeD5fOuyCjOq
	LYkpfHP7Mj+YEaAwSeO3vapj4yGJQl5D2TqiBQFE+wIvSWzErKP7tfsl+iPIW5uJ3S9oNd3/sLq
	Y4FDRbN7JvdFJ1Ejc+4D01fQlHMCw3nIB1ksw7XWr0N0Bq5eTLEv6toTri8oJP4t3MO9ONzmEiI
	YJ6LWaBg759xdE2hwiX+xtPegQ1+0TszOVgHaKc4caPMnhFbKdl+DsTBQOIReYPE6cBTwzwxN6h
	fZn7akv007v3FUypBgrTOZaI4ADRIGszWpOQazlZrE858Rru5q946uLD8RYjv4BtI/1MjLZda/w
	t4uXJEUGFOu7FdaPVGoxqSqMbauUY/RixQfwu0Xl/WSjzhmKPy7cDBMSXEm1JhPm+rY/ThVeSO0
	hrwIESYJR1Z1w6M2SfwGh38tTmamrehm1B3biyVfeRP8A1qTLKwhbdBggdoeyUa7I3K5Mh6EKa+
	X4iwD4BHxlIKreAWyDMu0Sizq6lbmxmXyRwoWbbNEdIwI
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7ab3 with SMTP id 5a478bee46e88-3860bd88965mr1263059eec.29.1795174296329;
        Fri, 20 Nov 2026 03:31:36 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:fe98:6351:c2cf:22c3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm7134347eec.16.2026.11.20.03.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:31:36 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v3 3/5] wifi: rtlwifi: usb: unify the RX code path
Date: Fri, 20 Nov 2026 19:31:12 +0800
Message-ID: <20261120113116.153232-4-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120113116.153232-1-hjf3108@gmail.com>
References: <20261120113116.153232-1-hjf3108@gmail.com>
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

_rtl_usb_rx_process_agg is a copy of _rtl_usb_rx_process_noagg
except without the tail end. The noagg function can be used for
aggregated frames, so drop it and rename _rtl_usb_rx_process_noagg
to _rtl_usb_rx_process to unify the code path.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtlwifi/usb.c | 52 ++--------------------
 1 file changed, 3 insertions(+), 49 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/usb.c b/drivers/net/wireless/realtek/rtlwifi/usb.c
index d013e59869..d7b3192262 100644
--- a/drivers/net/wireless/realtek/rtlwifi/usb.c
+++ b/drivers/net/wireless/realtek/rtlwifi/usb.c
@@ -366,50 +366,7 @@ static int _rtl_prep_rx_urb(struct ieee80211_hw *hw, struct rtl_usb *rtlusb,
 	return 0;
 }
 
-static void _rtl_usb_rx_process_agg(struct ieee80211_hw *hw,
-				    struct sk_buff *skb)
-{
-	struct rtl_priv *rtlpriv = rtl_priv(hw);
-	u8 *rxdesc = skb->data;
-	struct ieee80211_hdr *hdr;
-	bool unicast = false;
-	__le16 fc;
-	struct ieee80211_rx_status rx_status = {0};
-	struct rtl_stats stats = {
-		.signal = 0,
-		.rate = 0,
-	};
-
-	skb_pull(skb, RTL_RX_DESC_SIZE);
-	rtlpriv->cfg->ops->query_rx_desc(hw, &stats, &rx_status, rxdesc, skb);
-	skb_pull(skb, (stats.rx_drvinfo_size + stats.rx_bufshift));
-	hdr = rtl_get_hdr(skb);
-	fc = hdr->frame_control;
-	if (!stats.crc) {
-		memcpy(IEEE80211_SKB_RXCB(skb), &rx_status, sizeof(rx_status));
-
-		if (is_broadcast_ether_addr(hdr->addr1)) {
-			/*TODO*/;
-		} else if (is_multicast_ether_addr(hdr->addr1)) {
-			/*TODO*/
-		} else {
-			unicast = true;
-			rtlpriv->stats.rxbytesunicast +=  skb->len;
-		}
-
-		if (ieee80211_is_data(fc)) {
-			rtlpriv->cfg->ops->led_control(hw, LED_CTL_RX);
-
-			if (unicast)
-				rtlpriv->link_info.num_rx_inperiod++;
-		}
-		/* static bcn for roaming */
-		rtl_beacon_statistic(hw, skb);
-	}
-}
-
-static void _rtl_usb_rx_process_noagg(struct ieee80211_hw *hw,
-				      struct sk_buff *skb)
+static void _rtl_usb_rx_process(struct ieee80211_hw *hw, struct sk_buff *skb)
 {
 	struct rtl_priv *rtlpriv = rtl_priv(hw);
 	u8 *rxdesc = skb->data;
@@ -470,8 +427,7 @@ static void _rtl_rx_pre_process(struct ieee80211_hw *hw, struct sk_buff *skb)
 	WARN_ON(skb_queue_empty(&rx_queue));
 	while (!skb_queue_empty(&rx_queue)) {
 		_skb = skb_dequeue(&rx_queue);
-		_rtl_usb_rx_process_agg(hw, _skb);
-		ieee80211_rx(hw, _skb);
+		_rtl_usb_rx_process(hw, _skb);
 	}
 }
 
@@ -490,11 +446,9 @@ static void _rtl_rx_work(struct tasklet_struct *t)
 		}
 
 		if (likely(!rtlusb->usb_rx_segregate_hdl)) {
-			_rtl_usb_rx_process_noagg(hw, skb);
+			_rtl_usb_rx_process(hw, skb);
 		} else {
-			/* TO DO */
 			_rtl_rx_pre_process(hw, skb);
-			pr_err("rx agg not supported\n");
 		}
 	}
 }
-- 
2.53.0

