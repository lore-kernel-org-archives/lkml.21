Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417322;
	b=wfqYktRlKoxpgA4Iw5Wh4XPUzuA+qC8dA2mVa+bmdvuiT4nK1OuW7g083f/iksb6vmot
	 Cv1OyuSfSu951EGl5H5A5dPOdvZVWf4oSIwXuOOzF1aS1YXYVNUUE/UMSLeGG8l+s/s0u
	 jg3Xb7i8A2HKkpKFeQZzgzFPAZH5LIAP1sbVttmdaV8zyELYTnVfMQk4IUTu1RLzmjrVW
	 xO57s2o1MaRPyUZajChSpJzQEERpdmZ4bJloZDePDLuw18EaGq7SbZi/pmfN6SXlJ3MJL
	 AkzALygiMWcpi9R3LvSb6MgN7HPj8B1KpFpUfUtGmXERIo9Sir+tZns81V44CZjBrfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=itP1hoxcgyxT3Gqtak+dePMpVPLjPeNpaNu3XlNcqvw=;
	b=F4BZWYPqTisw/DhQoeDVQQlwtAfQPQ+AxEYX3gbzuiUs93Hor7ZzPCwACtACuYPunp7w
	 V/y/wHCpn69h/CB5kqkGqSGD5cfVj2rpvCVQnariyqYgDU9fGfQl2W2la9lHsV/vpLi68
	 1DOt5lbj0QfYzr5zzb5Bu/qOJfkx0t4jcaqQLULs3CltourRvhXUYQwd391Xs00WeMn2m
	 TJyzMbwsTdqI2uxN9SM83jiA47XdTgQMb/9CnjchLaWrCuPktHtGQ45+dtvCl2gO9o2U+
	 8qrlSg7T5U3lsj4nklfqrDHjNP+zsW6d6ci+LudnU7749bPXnE/NRWhqY+6SOmd0o8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bF2hp56X;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72528606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72528606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bF2hp56X
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492690dd5daso2177477f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417321; x=1796022121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itP1hoxcgyxT3Gqtak+dePMpVPLjPeNpaNu3XlNcqvw=;
        b=bF2hp56Xq2rIag6eJRwAOTnk3Gj0c4889uXhlex2fV9Qe0c9H/votPte01U+uQI9mE
         DYSQ/o8TikWhaoBoravTlcSCJxMRilP6MLdJwlp+SCkQKyREAJZ2TzQiPo5P58Es4lME
         Ss0i0zr2BotC1iJtLZXCOjQtIollvxAplH1Augpk/ILTOCtGrD4eTAHOSNMd5uqjhk3X
         D4anTu0YF0f6gKMX3febTyXiuk6gtDOoDxMKyxHOQJrwt5KDrT3z9VuIdt4pyUzFGEw+
         LSv3pN9Q6s/+U5RjrbM0H32kNxZ0sy2ATAmx/Gv4KqTYprP2YoZdNinYqO3AjOou8S1p
         xQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417321; x=1796022121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=itP1hoxcgyxT3Gqtak+dePMpVPLjPeNpaNu3XlNcqvw=;
        b=NLy0p7QTzDFTaTYuaQuofYPL5KqCMpedT/P5mWxEYDyEVYcaPRVGBETd9p5KnIhNiw
         bI0ntVHgyxCAsem1JZoHdkHRclfjy7HkU2P7mDTe7uXBYGN1Vuu7cZoWGx0irVkrw49b
         LslRfgKjVDFIcFknvVn3BpRUdba0tahvTobgnh826KwePpBR615TSHdqzKnw5JA6zE7i
         HC4GaE5UGHZvwznEoi7kQAAXiQyihxSiFCxVDLxpqZsW3op7I3OjrVIqQEBraUlznxmA
         Gt9Y9FTBlU2ERfuzex9LX6Qc5SKoe8/dW0f1sUyc1qnjPG2C3GW1zAZvqiRdtweD5pwY
         KSuQ==
X-Forwarded-Encrypted: i=1; AL+hErGJN4ZWnwAk7eBGoC/FoMVfbhJoo1SJ+U5RaJp95KgEagcR/cd8185FnYhIxYtqlqyZ5mhNjRsG3mFUv/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cre3qN5YryHQC7S2RR7dFX2hzJbifjk7Fus3rzn8e+fKaOlCr
	ux+lXqyG+8QcsdYSmFXUbkTTyCYulICkExun8X/+4BThO27YBTEof+g1
X-Gm-Gg: AZFdTZerZkZ5tguBEYhaa4hq40EAoM3dJoeqRjJz99E7H7i64aK3zp2+1L8vNHOlC4D
	RBOgC/7XUZLpwScjbJVc/SzgLA0n2IzQvS4M254M6m/8tpzwO2J7muGMPeFi1RbrdSTlwNjXDsX
	QTQgkUEn2yrVgA0At1gpAuLj2IAUgEiZoFni54HPnR5QY9/9kbpL03+cTsyk4UxsTH3WcaVunYj
	mtcicwLLb+o5mQNGLSddifmTmiX6zmEPn4uredOHprz2OSfkd0dn0FGRjHO6HVx2V6IgB1JVtuM
	mvUkIUHpj+E+tLGB6hqrzohUN2uT61MzyjO6zrRheg73Tm/Ir/Pcosj/ag9nWsuHD5wklx0C7B6
	jQRzZ/O0mAR0omEaR2LPCEY6g8YsKNLBR2wW9hzJcSfbAwNOgIa76kk16jLt24SqbxVnYG/xSUX
	lmiVriyPnmSrw1tVnjB0hfuuyMY6Mg4hJQVkeE7qPRYxI6ubNk0H7BGr67MzXcJhETwaHBM4hlS
	lOgN42Hnz+ys1oPjp6b3RkewdtLyKx0louztueXjuf8G5X2tNNZvlzXrpc9XRCyB+XlYiG9gM5b
	EX4D9uaArbWIzikExNZl/Cj2khPPCJ0kOeSBXAiYd1DyzvdEYR4HIZx4Ug==
X-Received: by 2002:a05:6000:2312:b0:48e:b62:d133 with SMTP id ffacd0b85a97d-4abab6de675mr21620895f8f.5.1795417320763;
        Sun, 22 Nov 2026 23:02:00 -0800 (PST)
Received: from fedora ([154.182.66.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm20779007f8f.3.2026.11.22.23.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:02:00 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com,
	amin.gattout@gmail.com,
	antoniu.miclaus@analog.com,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v5 6/8] iio: adc: at91_adc: pass struct device to at91_ts_register()
Date: Mon, 23 Nov 2026 09:00:59 +0200
Message-ID: <20261123070101.53868-7-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
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

The at91_ts_register() helper only uses its platform_device argument to
obtain the parent struct device.  Pass that device directly and simplify
the function signature and its call site.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 3d9ae99a2ce6..05e8b3deb043 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -925,8 +925,7 @@ static int at91_ts_hw_init(struct iio_dev *idev, u32 adc_clk_khz)
 	return 0;
 }
 
-static int at91_ts_register(struct iio_dev *idev,
-		struct platform_device *pdev)
+static int at91_ts_register(struct iio_dev *idev, struct device *dev)
 {
 	struct at91_adc_state *st = iio_priv(idev);
 	struct input_dev *input;
@@ -940,7 +939,7 @@ static int at91_ts_register(struct iio_dev *idev,
 
 	input->name = DRIVER_NAME;
 	input->id.bustype = BUS_HOST;
-	input->dev.parent = &pdev->dev;
+	input->dev.parent = dev;
 	input->open = atmel_ts_open;
 	input->close = atmel_ts_close;
 
@@ -955,7 +954,7 @@ static int at91_ts_register(struct iio_dev *idev,
 		input_set_abs_params(input, ABS_PRESSURE, 0, 0xffffff, 0, 0);
 	} else {
 		if (st->touchscreen_type != ATMEL_ADC_TOUCHSCREEN_4WIRE) {
-			dev_err(&pdev->dev,
+			dev_err(dev,
 				"This touchscreen controller only support 4 wires\n");
 			ret = -EINVAL;
 			goto err;
@@ -1154,7 +1153,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 			return ret;
 		}
 	} else {
-		ret = at91_ts_register(idev, pdev);
+		ret = at91_ts_register(idev, dev);
 		if (ret)
 			return ret;
 
-- 
2.56.0

