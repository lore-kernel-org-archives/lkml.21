Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110614;
	b=hJ1LH5C+JKRFdmfeOiydfFPOgniEZwEwMZZKBbudmZ+YiuAHBbmdckPwkVJgQNf7BP8A
	 Tp4FhgS0aMUIw8WmQnY3R/1nBud2EYq0wXo91Jn16jaTknH4KW4xVo9e65gJUMIWag4Py
	 ZYdBY8KW3hjfHXpUISjnHje886DbAT7zWPkUQo+8pYGaWgivS6Ac4Bv9Nya49/a4vyDQF
	 uPZIDYbNJOFoDOe6s/YQOptyb0uk+YldYBOcrq/6x9WCoovBENrKjiNv/83NCRG15XEyl
	 zY22h5RTu6VfP4RX0YllLWJYj0uDf3i1psQ8Gi1f1fcAiOZ6MFtZe973vVV278jtCXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CvEm5T+elZmAIVJRuKb7mSJIVKxbHtl2NRkj0Gb2l8U=;
	b=yG+J3yhTWRhhzK+TR8GypL1QTZ4PpP428AO+iU4Y61+NXuCcjK/oRjohBblClLTpi3I9
	 g4Gad3cBAdYKhNILuSLSArpJzGHjnW2aHb0kYOnf+ccPXtA367JvIpRHfT2wAR624LTJN
	 zwUP0xLTLmBSh0AXK9eRx0/IvQ5Bd4Do0TopADSmrulXSnUiS38QLwcTM8y52oBBZhcke
	 tsNVGnMNXxXpWiUxvMIaIzT9krFlSCBKnisiVqVJQA5cVcSKqA/2AYSGgv0c3A/2FaCXa
	 4oilrlRDlDH8FWJDMJNFxOtCED5dd7m2iCFaugG/AE+m/0kQRSsURNhwKjGCKucSHTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gMr5ru9l;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F86F60A262E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F86F60A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gMr5ru9l
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so19517845e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110612; x=1795715412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvEm5T+elZmAIVJRuKb7mSJIVKxbHtl2NRkj0Gb2l8U=;
        b=gMr5ru9lLh5siTDux9OeJMjctF8puIy6nYysyT9y+2aXt30gBNSeo2LqIHd4LgYy3W
         W0xYnInGeBUJFzMeXImmASrU0JOYIksebNC3t6YcmeH97eq3P36pDRT+5JJ+FyfsG7Dw
         3QUUkbjuahCxGBtzHeZi1Dz688ZBghQ8eXw51SPAOjg32nIfMgEN6B4+iZArnmGVWKDZ
         KMGYy00pfZsrXSuLERVR40hV3dFbwvDuSKmHfWIhL8dWSP8VOKuQoHzoTXAVcOa3rF58
         KPgS6QBL5VPg2PT2fEw6KWl8hnNJ708LdPoON05k/vfQaV4nDvl++XI2oRl/Y5bqHDwF
         T+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110612; x=1795715412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvEm5T+elZmAIVJRuKb7mSJIVKxbHtl2NRkj0Gb2l8U=;
        b=yH2o2VUKz0k2wZnyWG50qH7wj/kDDs9ITT7AgSNN64/9kbEUgtyLslXotCPYGkHiUR
         l+p/UBBZJknjReiM7fWQKBHVfgN9hADAdTvbV5OHw7caH8VCz+Mt4/9C9Hs+HjRpcxHI
         QscRSIySgFNfZFoYZYal2STqElQ4BCRgfZFTYLM3EljR0QYUaD6uCzQHwqrzOAY3sVcs
         pbvyVG1lq66D24AcHx8wzvMXBOe4aykaM7OutzeKaBUMY8WYo+sGwE/11kAfm5h31d4R
         i+/EW8zd5yB6ZNgt7jPlaEgcFOnhOG7Ubhfu5NC/7XtelJNL9yB95bEjmMYY9gBUI98l
         J2Ng==
X-Forwarded-Encrypted: i=1; AL+hErH/L0/EenxP/DKrdEFP/SFIat19EAlS77YGxG/BJruJxB9ZFozAgPwHCbXC1RL+QqcrTDnpHPPcxBw/zx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I9PPuw8p1zzeHXhuJH7vK2SSQywXqtCiRGfZEmAFNjrKl6QrM
	LgC0diQFMAsUVFoVA9cS70lkY0xuwfBY19J2+P/lblW6wsHz7wfIgGwji4z7NgqXhQk=
X-Gm-Gg: AYBFou3zSyaGmjZH2KKWTo1gtyfmJwS7sQeHEwJWaiovIPArKnNjgUJDMtDjESxRS/K
	JI2J19TtgFwcKZqejn32k3J1Q/sg/SjyyiuTzggfkUHXd9dDNx5g6Y3PaJclxoWSeWwqRJuL2Le
	MkI/Tn7F1/x5D+JHcu7IWkk2KMQUyIeELlE80oU+L/38/2k1PeitD6ONXi+gdJqJBCk6wN/nJ4Z
	dTw/kUOEnG8r9aV3LkgVtOracH0BQSB2z2xC+y44KFnQIs+8/m1F7wLeKqTeF8Slyw6CmaUcFjh
	QW7zBkbXdmUoWIS9HtGRspq8zNLz1dzA5TiRJapN4d5rBpx60XAzIx65DGHv+ABZ83v/sb33Qhu
	ZU2tJ4l9g81hCg0C5ZvirkRnbVhUdnt60hGgTIM7uJiLdK6WB8XoUquAtXZTE81PcUZHgDFCxh/
	zRFfBVRWearV5LAWFAiEs0cHXGlO/m/xgEtt825xNTtXZl14BuTRnIhIRf8sfHw42i/Ln6/UhUE
	0fODxYUUYpfPXO78FRFbOrtpGpmrD9pS8xNchiUnGAqgxgdp39SJbrcjHAOxceB1os715zcSX8H
	/lprifR+4ZTtjGBrDipMNlultb2M6ewEigPd/BDov70RCHLSFES2d4daXi2NVM04T3hAW8oDjPG
	wQ0olHtaJR1nkEHkmUCKw08DgeD9yt9B0JgODOCTlYPOg/OApwiluP6YT62GGFC9njSDMPKsXZq
	C8zg==
X-Received: by 2002:a05:600c:820d:b0:4bb:7b4d:6396 with SMTP id 5b1f17b1804b1-4bb887e21c6mr6739265e9.3.1795110611578;
        Thu, 19 Nov 2026 09:50:11 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e06c73sm90733095e9.2.2026.11.19.09.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:11 -0800 (PST)
From: Arthur Heymans <arthur@aheymans.xyz>
To: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	Solomon Peachy <pizza@shaftnet.org>,
	linux-kernel@vger.kernel.org,
	Arthur Heymans <arthur@aheymans.xyz>
Subject: [PATCH wireless-next 04/10] wifi: cw1200: unwind GPIO interrupt setup on error
Date: Thu, 19 Nov 2026 18:49:56 +0100
Message-ID: <20261119175002.458988-5-arthur@aheymans.xyz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119175002.458988-1-arthur@aheymans.xyz>
References: <20261119175002.458988-1-arthur@aheymans.xyz>
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

If requesting the GPIO interrupt fails, the wake reference and the
card interrupt enables remain set. Drop the wake reference and restore
the original CCCR interrupt-enable byte on the error paths.

Prepared with OpenAI Codex.

Fixes: a910e4a94f69 ("cw1200: add driver for the ST-E CW1100 & CW1200 WLAN chipsets")
Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 drivers/net/wireless/st/cw1200/cw1200_sdio.c | 38 ++++++++++----------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/st/cw1200/cw1200_sdio.c b/drivers/net/wireless/st/cw1200/cw1200_sdio.c
index 1894359ee9b4..dda201e69735 100644
--- a/drivers/net/wireless/st/cw1200/cw1200_sdio.c
+++ b/drivers/net/wireless/st/cw1200/cw1200_sdio.c
@@ -143,37 +143,35 @@ static irqreturn_t cw1200_gpio_irq(int irq, void *dev_id)
 static int cw1200_request_irq(struct hwbus_priv *self)
 {
 	int ret;
-	u8 cccr;
+	int err;
+	u8 ien;
 
-	cccr = sdio_f0_readb(self->func, SDIO_CCCR_IENx, &ret);
-	if (WARN_ON(ret))
-		goto err;
-
-	/* Master interrupt enable ... */
-	cccr |= BIT(0);
-
-	/* ... for our function */
-	cccr |= BIT(self->func->num);
+	ien = sdio_f0_readb(self->func, SDIO_CCCR_IENx, &ret);
+	if (ret)
+		return ret;
 
-	sdio_f0_writeb(self->func, cccr, SDIO_CCCR_IENx, &ret);
-	if (WARN_ON(ret))
-		goto err;
+	sdio_f0_writeb(self->func, ien | BIT(0) | BIT(self->func->num),
+		       SDIO_CCCR_IENx, &ret);
+	if (ret)
+		return ret;
 
 	ret = enable_irq_wake(self->pdata->irq);
-	if (WARN_ON(ret))
-		goto err;
+	if (ret)
+		goto restore_ien;
 
 	/* Request the IRQ */
 	ret =  request_threaded_irq(self->pdata->irq, cw1200_gpio_hardirq,
 				    cw1200_gpio_irq,
 				    IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 				    "cw1200_wlan_irq", self);
-	if (WARN_ON(ret))
-		goto err;
-
-	return 0;
+	if (!ret)
+		return 0;
 
-err:
+	disable_irq_wake(self->pdata->irq);
+restore_ien:
+	sdio_f0_writeb(self->func, ien, SDIO_CCCR_IENx, &err);
+	if (err)
+		dev_warn(&self->func->dev, "cannot restore interrupt enables: %d\n", err);
 	return ret;
 }
 
-- 
2.56.0

