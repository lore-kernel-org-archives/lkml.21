Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095680;
	b=3EGsz2fpBWC2qogmp1xJ7eSr1E9f/MzpzbHFIqp/wfskYT7BupfUmL/1VCt92dwLRMR/
	 RcUWN1vSxHwyoQXZb8xUERz5/VkVA/HK7n7Z1HXSto4Y5mT0NoJQfToGVSah5Y27U0HXn
	 4KiPS7aT8TC5VdiGOdYGuzBLC74ekAumsPxsbchoZ4r2RU1xnSZv1DlJMSHxDpbwpAXse
	 Oexm2M7DNbaWLADCrGmJRBWupET34QD82dRPh+o5CJQyQYIpiS0/X6B1nidfngMCRlxFO
	 z/1j7xUDwe0F90ZtLdK+VbrOUb1veWCusnr130Y8uzhgVtrz66NYq43loa3itK2rGxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+/1aPW2sN47IVO6KfZ/XPY38JhDzQlQVktdUgLy0gIY=;
	b=tcr9mYr4Dl9tg/nnJzhUa6j3x1y6q4Piy8i54PGC9NtBBr+hGc4tx1lETcLTrK1NxRnp
	 h+kUpaNJwLdeEO1Jl/svxUs1Tf2CQ3eC6mhUTPcjpCahJpsN5mxCV3ipbpT4uj7YoK9Ey
	 rc2veyAmQJWehVp+PERdd3B8MQEf7fsX+faJUDfEtCk5ZUMgXz8bFkkiMaVXC2qCwzW7p
	 Khb5X7TO/kknLbmGUC0wvh7gUJH1s2L6TbTZCWYbUamxMVDucpiw+pMPnTRbW/4cMusll
	 WPdiirNd/HShpIFGLJeWAIj7fTURNuec3VRXs6d3LRd496BCc+10B8yKFjGq6MEio4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LCWRpfQV;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A92C60A2626
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A92C60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LCWRpfQV
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d581da0aaso280935666b.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095678; x=1795700478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/1aPW2sN47IVO6KfZ/XPY38JhDzQlQVktdUgLy0gIY=;
        b=LCWRpfQV4dqgT6dBAbuXUx9xqe+vOcA5eKQZ9cJY9QQ9gX+groDau+9bU366T90D+c
         M2MPcZHDKFk1WboIIGi2kvpiRq3KR+Vk/LY3UnYeAbDrL3f/sf8iCpNsAAWmVVe7bFNJ
         vmS9bBKjbYeAOFEg/OwVzLxL3AK1t17Ro/qKuT1RAsTKi5hCBH++GYsjKa54F69nJGGX
         iYSL++iP/aHUdr77iz2LxXPMAyHPgQtUMQAu+ot2QwbLuqNSJ0lGPslszzc5Nd0OXS5g
         oJl+l6+u6JnM9iMJHN6+8wW1OU/V8NOdby3DYyNnLmHHMe0Fjcd6L6kySGDJWV6UlU+L
         e6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095678; x=1795700478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/1aPW2sN47IVO6KfZ/XPY38JhDzQlQVktdUgLy0gIY=;
        b=y+eZl+PyKoT2r5VtUGr/9hAAyxfSOB7WS+pjOCg+m7xBj3BcqNBWiiRBxveY6cotbd
         KNVYHqU08tT7G2FIxSl42xhQCL8xaT1dMdN+5mrJM8rj1B+EnIxebSSvMemen16opth7
         Y32SaWi4xRQiwPauz1cbEvcNWQOYKc7u7bk8bFKDyHhfqj4XJTTVLKlsXjKjgkf7J9tQ
         iNme80dGx9iAVGCtnm5RElN9QWVR1PQdm71xOTk8khsTQsMcfVBIogymGaJF8WiqJine
         ekE1NLZdtm5qcEWEAUVyvNirw2DY/04qzELVVcrF8rNcSAzN3/enEEk8V2O1NxM9c5EY
         oPRA==
X-Forwarded-Encrypted: i=1; AL+hErEli3IcDIwyIrz3iFMzIZ7q1nfzeJ/ufBuDpIekR4ZBYD4iEiWsrUUCdwiAEaRlnpdry1WaivRQm0tHslA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sw82UlQ3K+IwjMs2zlyeGJZlvdUqseBo4huv0QqiKG67vgNZJ
	aBUVycbpdou84HWWUiX0ArBC0GbgM8qYL/tMyBgy3f+jndiHSy9avMmc
X-Gm-Gg: AYBFou1NbkVh5e+vBdMQUd4E1qGil1ITleuvEZ6qX7Q8IKXgLVufSphHX+QqLJLOLew
	rRBpX2IDwOCd3OR9dZVQR22MySGu9rOCx7XHc51RxvBHpG3ccSu2UNVo+824+1agrpDKe6mFmYT
	B7vIhunWKVHBevnnmEy6MlpTGvDP61BQI8P8O4L/yTt+76sXLSHZBvEqETR76CINkRN5mS7iPRN
	oYrr3gpVXpmvuChS8lQBYaEzNS1BHb+bMSZXt4HK6XX7aykQ00n8kSxbQAkxVTqeRzW2tMc3Ls2
	m9dBmn8KXXlzJwQ3QLqwq+PvBWCDwEEWmUPxoWdvTB5PyU0lZy6iGQ2A3pdcuu9GiOkz5ldMkaG
	b8JIzNxlmMZEGZ9Mu4SZM/KyKUmyOxazXPShk4x3n9lWPOW46CukBAv/7ELLLzceo10X6BvH+fd
	7+wpkcb2RO6eVJDU/O87OpjZZdB9Vec3/1HqLnHIS/GuBOLb3rqG8grqHCCC4i9Pj3XbV4/mPeN
	PLe9h8ApPhGpZ2FwVFGBlLmJu0qbQvJqEB9TXMZoeRAe/sF5VOyFt4isHZq7re0Nb8mp+rUY6xG
	FBypG5Y7S2JsdlrfJTPTZiOiDIYtSEBlt8vkF/ePo/DwwnOClt2a7R86FZYcJuauM0LuZeOzs8N
	L+eJGsjgWFoSSdQ==
X-Received: by 2002:a17:906:5605:b0:c46:7645:86c with SMTP id a640c23a62f3a-c510e4f880fmr428831366b.47.1795095677744;
        Thu, 19 Nov 2026 05:41:17 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (user-31-175-182-49.play-internet.pl. [31.175.182.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c512346fc3fsm105582666b.59.2026.11.19.05.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:41:17 -0800 (PST)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yongzhao Chen <yongzhao.derek@gmail.com>,
	Alexey Immoreev <luixo-public@luixo.me>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 3/4] net: dsa: qca8k: check the length of MIB autocast frames
Date: Thu, 19 Nov 2026 14:41:09 +0100
Message-ID: <20261119134110.15048-4-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119134110.15048-1-kuncy7@gmail.com>
References: <20261119134110.15048-1-kuncy7@gmail.com>
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

qca_tag_rcv() makes only the 2 byte tag linear before it hands a MIB
frame to qca8k_mib_autocast_handler(). The handler then reads the
counters that follow the Ethernet header, up to 164 bytes on QCA833x,
straight from skb->data, without checking the frame length. A short or
non-linear frame makes it read past the packet data.

Pull the counters into the linear area before reading them. A frame
that is too short is left uncounted, so the request times out and
the caller reads the counters from the registers instead.

An LLM assistant (Claude, claude-fable-5-1) helped write the change
and this description; I reviewed both and built them with W=1 on
arm64.

Fixes: 5c957c7ca78c ("net: dsa: qca8k: add support for mib autocast in Ethernet packet")
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 4de7da9c8e..76c0f7c97b 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -1669,6 +1669,7 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 	struct qca8k_priv *priv = ds->priv;
 	const struct qca8k_mib_desc *mib;
 	struct mib_ethhdr *mib_ethhdr;
+	unsigned int len = 0;
 	__le32 *data2;
 	u8 port;
 	int i;
@@ -1691,6 +1692,16 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 	if (port != mib_eth_data->req_port)
 		goto exit;
 
+	/* Past the first 3, the counters follow the header. Leave a short
+	 * frame uncounted, so that the request times out and the caller
+	 * reads the registers instead.
+	 */
+	for (i = 3; i < priv->info->mib_count; i++)
+		len += ar8327_mib[i].size * sizeof(u32);
+	if (!pskb_may_pull(skb, len))
+		goto unlock;
+
+	mib_ethhdr = (struct mib_ethhdr *)skb_mac_header(skb);
 	data2 = (__le32 *)skb->data;
 
 	for (i = 0; i < priv->info->mib_count; i++) {
-- 
2.43.0

