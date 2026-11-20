Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167861;
	b=3OwX3YQ/XEsoh9NcOFQaH2HzVE6jFk7+iwqIgYGqy9duqK0vkQd9aYX1d8IpQpLTyQ55
	 sb9NOnU6zHOXCM+pG/jS74FVbBpjm5Y39YuLd0339w90Z87TZUZ8vG9TH0CUDYm5rt5oX
	 OlRiUMWgBhFFnuIV4eWTsJcBIeb4yW29hzSSg70dskcQZo+COcNQ1mNnVOYfm1n1n+kEn
	 Nw6wRM5q7TyEbQwjPzFg9qUs4R3v7ad/+3mWKeb2mCHI7zqoSJtnZhbeWK0L/EMDqTJvW
	 HgBhzlVbhFk3+OyfYvK4XjBJTWkTYC5gy3912Kbb68cnnsefSgnHE1THLqT7bW/y+vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P3CbdVECzHkNah5hBh+CX5V1muidzZFJcZgyMPPIoGM=;
	b=0XqRLkeJVrnymDlBD9M2GtLQr8qdTwt2YqRp4Q2JOOrCT7LSsqRNtYXDgEafcm448kvy
	 BI2VRqjasTTSDng4k4aXW8l/aSstqiwyd6VU7TFo2UznFdYg+kdSALSGywfBIdlXszn4h
	 bn2IdxqqSlEN9WiA5DexsOAnkstkyLUf6pHk2Mir5DQrNhSKXMa+Imf26CldaUotXyq7b
	 iISYq8F0AwQIxQhesa6bNinWhJcmC1TlAoG2Y6K61iCD5E2UEOQG2uZsFKYmCbucv6L/7
	 h32B8qewK0uPIPrRN/JHDPMJ3Tcd1DF14mRFNWjipstO9BsZ36pjcrASKvTtGqqq5Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FndfR0JK;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2628606A334
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2628606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FndfR0JK
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38190551625so1119710eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167860; x=1795772660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3CbdVECzHkNah5hBh+CX5V1muidzZFJcZgyMPPIoGM=;
        b=FndfR0JKp8StOClhw3XHVoOiIhurenT7bz5qhjoNm0Dcd7Nnh1Gz+dxSSbgvT6PWG3
         JMnF8DkCYDqWyfa8GRNTwvTSp0Z2pNikTdFAsw/Pxge1TQNWrvH1PpJRe2V/HDviv1rx
         f51gJX/IEkJz5d2LdDDBsFs0r1AWKywFjSzP9hmCdBWOJ5sVj8TNEY4x+Yng/z9+GyW/
         vwnqZPITzGoII1RTGAb1QQneGvbegkvdqXazg+ADeP+z/S3cS62TyekRmydOVxaubGLg
         z7C8VdJ5wJAwkbvBUGbeKnxPOBW2Inc+DrqLXj/H4Kq2oEmx4X/zridhGG2ov2ZXqDen
         GClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167860; x=1795772660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P3CbdVECzHkNah5hBh+CX5V1muidzZFJcZgyMPPIoGM=;
        b=EmKhQq8hic4F5wNdx3XHU/QF6cmRSLzIVWzxa+SFmXILAvia/OpzohhI7gDUYtcDUj
         xBY41/ZSRXc4w8fNONSz76dt+NU6OUaTpA1Wtz+iO3y870Gp8tUQ/HJx1euA+zrY57Yj
         3/F5cyPnhnCLnKs5RYRMx+iNQcOaWjAvpM/IalbifVdWEPeaZqISqQKSd1xVo21iRVRE
         3Z8v8woDPfVL4orJ11PEwmKrzKOjX0kKNXrZC77X/4TOOH4J0+zTRZJGngM4FPOGFwfH
         77pAABVH9jrc1AaUIKwO02AvK97I0j8hwlYJxQPur9fi8ryZET7CJm04UfwJlocdGLNL
         H/ag==
X-Forwarded-Encrypted: i=1; AL+hErGQJ5kfkITPDzToZtZqZ5eobMA/MKTc37xXf92osB/If88LhW91x78lBRP9lBMCDlz6HrP4HdFmedKhZfY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jy0oZpncq3qDmR4aBzdi/RFY5InZF1yYc67xtLcFcReCf6Aq1
	mT3M5Hwh755dYDzm6/DBAhoAUrT8qi5D1SK4JJng0eM50aMJ0OTTEmVH
X-Gm-Gg: AZFdTZdGYfJ4yNlIIZ1j6ANBhQObOJRl3QbJjFUidQUeu4IbCRktb70JoVkYJRn9OyN
	KuKqNZw0Wdcw+eOzbI6ndxgNg02gDe7TVwnrX8qYcNFop4w3ca2EQ3rNntPrKPJzbDEpkx67GDV
	1UZgaEECy7C87pZ3SwEs47zRws6XUDppn1bZH1u62I1jhkJQIue2I3xDegtMoSJvWUhP2WUvo3U
	KuF6l2Wf6xF5+2f9C3SbjLehK8IOtnGjf1aJ60Mch1YBLbSK1akWCNv0pFpvVZ0Q2Pe5vHTNNxB
	4mTxTVEkRFono6Z93LoL9CdRG/0SXSYywTxQOR7beLP9snfeeO/vVZUs8z0cr/mllWyfzip/PnP
	Nruu9jJvDUha21KOLBfGNR4SAVgC7YFvOYVmbd1v1aJPrA7jzwA5BsYOJw+5dBGfzcd5yj1OahA
	uw7MSiNdFcDBSBABcMbMmfIcKgNoyaDwWskYL6nR0qWPwOqmVoyD7i/PVLaAg9kJgDFEboKdN5I
	wE7N5XQeVN8k8u6Wd9NxqG6D/9GzSbWr2PaXMp4YO8M0aEjv0Kv11TIJjQ3nO/WIIVTQA3yMuyz
	PX3sIjZUfhswkWOC8HTE/oslGfrdlhn5XlFDmdiF+D25ubwyBh5a0xq7w+k2lYHZ3lAO3X9Chs2
	ByS+lK+wCHstaoFaQofE/9PcqzOvW+ndB2nksePWZZt/w
X-Received: by 2002:a05:7301:a0d:b0:369:fa21:ba0b with SMTP id 5a478bee46e88-38570847a85mr2483136eec.33.1795167859917;
        Fri, 20 Nov 2026 01:44:19 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm3982974eec.13.2026.11.20.01.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:44:19 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] ASoC: atmel: mchp-spdiftx: Improve probe error handling
Date: Fri, 20 Nov 2026 16:43:52 +0700
Message-ID: <20261120094354.6814-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120094354.6814-1-phucduc.bui@gmail.com>
References: <20261120094354.6814-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when retrieving clocks to avoid logging errors
for deferred probes.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index fc635ed6856e..6ab32f0b8b8e 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -815,21 +815,15 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 
 	/* Get the peripheral clock */
 	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
-	if (IS_ERR(dev->pclk)) {
-		err = PTR_ERR(dev->pclk);
-		dev_err(&pdev->dev,
-			"failed to get the peripheral clock: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(dev->pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
+				     "failed to get the peripheral clock\n");
 
 	/* Get the generic clock */
 	dev->gclk = devm_clk_get(&pdev->dev, "gclk");
-	if (IS_ERR(dev->gclk)) {
-		err = PTR_ERR(dev->gclk);
-		dev_err(&pdev->dev,
-			"failed to get the PMC generic clock: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(dev->gclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->gclk),
+				     "failed to get the PMC generic clock\n");
 
 	ctrl = &dev->control;
 	spin_lock_init(&ctrl->lock);
-- 
2.43.0

