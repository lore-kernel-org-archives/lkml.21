Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447018;
	b=4bV2zNotNvsBzROr6uHY3kuDIelRq5iUD5jSCOecmLNyMpzRr46oOgJFyrlRyBwFnvq3
	 Hjgp+aqY7I4F0xvf0PLSujuao8VzCwWE6KfZS/wK1rECumujpsE6B9uCkVyjJQ9CpQoXR
	 /9Px+FyMj8HzSIvdWU+7vnkU87v6/javDbmJTArduzsffMkYrbmwHKq3Ka1c8oIhlRok9
	 5u1wow/CS2GBt2gtYr3GUoTvOno/4FPcsHwpp6wey437GxYTg3+2sVfQ4iRbaim4g+T1Q
	 Hx7RUzYlvlnHy2onIIszpFycsGHV+hXgkXuR5Hm9O2SA2pfqgI8wSD4qZCabS5gW3Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tSXne0eFSt3J93YlYm+5HBbf8tEO/NOSC0O1Mc/J9n0=;
	b=fOqfsp5gvmBqhJlO8w2WhEUDb7wO1tOadFnvw/N0gfLeJBovyfZSytn0LiSYAFc/qvuh
	 s+aG6N6MqqQyLY2XsW+1T27tGKfAwc4i38Yy447HwWlfZ13zYKP8jSGMS3q6BPeGmfC0+
	 cHwDI9/4lrgizqM5OepeoT6PeNsI9ZYo7sd97ZPoyfFOXFTbwhdB4MyoMEbGxfSmg01um
	 vOyTWrBrVPzMbrwn1n/q/6xZBgF8hM0RwSnTcfHnjgHJ/J5XSDA7TC5q6NMSeeR+yYgPB
	 xNvm49T/gbI93+h7IhTfs5mKF/viGyBfAuuAFLv1RvsXYiv3OeYfZyTy1ozERu0T+zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DxCvjj8Z;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E860606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E860606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DxCvjj8Z
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b405d8f1cfso1623233a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447018; x=1796051818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSXne0eFSt3J93YlYm+5HBbf8tEO/NOSC0O1Mc/J9n0=;
        b=DxCvjj8Zy05C/UG/Gosszmux+ROyuvE93znej2tokQMY1UAJ3+kguZ508V6luN55Al
         yaKj2zvKa9jlVvjarByCANCpUh+gqq/zwnvFfqFZJjSkarc0bpxjDlHdyqUGpN3gBGsw
         uL+YdSfiUNF+uezoBDZrgna9xHCbgiPCQ/ZUZ8zVIkzcc6b2UaZDK5EQ6pNU7fX0XVxY
         qcAJelmxa2k64GqMwlZy4+HXhAGlPi5xDFxfuh8WCZs0zSuNrTj23wIHrO56EiMlTbTf
         7ERxDdm0yVaIO20pN44TlXipI8IN3ixMfJZ/SCDUnAogeRt7bCFF84UnCuYFhs0xYvT3
         2MkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447018; x=1796051818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSXne0eFSt3J93YlYm+5HBbf8tEO/NOSC0O1Mc/J9n0=;
        b=lytRpJBrhceXCfafGg9yUsxlte7lzu/psmTAO6CmX1okxrGa4T2DoTk9/ZtLr5qsvI
         nEOhICotHxAF9PMPlPdYlQ407xVK+4QWlTmUSAnK7ycEGw9apmiA6vsd02nzHU2QEBgy
         C4xHttp02wvBBm/q2Dxzik7nnYzg9HN/fxiPH39IBf8y7/a2OdnedZLrgfsOGPe4+ZGB
         Ud96u5vxV+b7OzWBpLR+OG2vbQoXvjHT79aLveey72K46/Z5IqxPyOyH7xxmOuDg2pJ2
         EsZfuI43TF9LqKBRAH9ehmPpBdA7QUtQMN2nP8hypZsVRQWd4vgOwX2BZ1rvkRKVz8IK
         9dTg==
X-Forwarded-Encrypted: i=1; AL+hErHSwyJso95mlFkd0Jcj/M65Th2b+/4XrquPcWX0hnsIz0WMWaUVPFWKq2u6ed5nlzW/ThuWepHMRs7WpKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ox+6REhmkbMyFqgiGfBy4eEsM+pP1sXliKWkUP5myCXLaTmS2
	jQbnC2nH2gjBdT7MSH+O25273U63IJ9OpOpsN1Y0YoiOp2WSTfwVASSu
X-Gm-Gg: AZFdTZf8UIJYXB3M+k2r2LPe6ffflrD9HslH9ykIF7smcqrl2eZeKsDLaO28v5sXqBM
	iGKlTdVORcTyfus4bENPYlrFOpNjLLgNyvz8PinKXW9AdPp2f5259ZAJdqv8McE4mpGFiTicV1t
	RD0RUx8cZLs4MJUO1qo4A01j0MOYgO3U3KFYHZ0iH9FU2Cm3zW5lPHMPVw5n1TRwGUDSK35FPPa
	fX6rarr8ObLf95iSAf2pLWiUGXKGygECdG2wF7V1dcw87fQ4oTLUyfXudVwMXi+EAphd55F1qFK
	IZiUZ+JkKWimCTByNH5K56NUPckArSwmshhtLWUSqEpS9GSXum8rBdJawOUtEwAp8CR//jCUSxK
	Inuu8biR/q+TllHrqsR7tZf6fG2Me7jwyKcnTY61F7MEH4Gbjcjbbplo4+6+OGO6fh1D8CSGD+x
	2IXl3X7gqv6N1kEBepU+TyOgccZqKTdugKSMoEp9L0ojn5AEfO5jSs3XINnV33uChUiKXMXUrk6
	AExiXVpokl7r3rINewHPGluMdNrqX+T9jzrQcP5hQihAxrPWu/v/kRr0WI+38zZS7+VCqxuHGIk
	9vmHH9FvP5Uo358TSVs/qCBw0QpqJA==
X-Received: by 2002:a17:90b:2fd0:b0:3a4:e735:b39d with SMTP id 98e67ed59e1d1-3b41c982d97mr10577101a91.64.1795447017561;
        Mon, 23 Nov 2026 07:16:57 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm20067482a91.5.2026.11.23.07.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:16:57 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Mon, 23 Nov 2026 23:16:17 +0800
Subject: [PATCH 4/5] pinctrl: upboard: fix I2C pinmux-select set CPLD GPIO
 OUT not function mode
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-4-f2322a91686d@gmail.com>
References: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
In-Reply-To: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 BillyChou <BillyChou@aaeon.com.tw>, Gary Wang <is0124@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

The CPLD I2C pin mode setting following uart & spi used modes array
on device AANT0F04.

CC: stable@vger.kernel.org
Fixes: dca2f73cf19f ("pinctrl: Add pin controller driver for AAEON UP boards")
---
 drivers/pinctrl/pinctrl-upboard.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctrl-upboard.c
index b9af6dd93c34..66c1c3e3bfe0 100644
--- a/drivers/pinctrl/pinctrl-upboard.c
+++ b/drivers/pinctrl/pinctrl-upboard.c
@@ -225,11 +225,21 @@ static const unsigned int upboard_up_i2c0_pins[] = {
 	UPBOARD_UP_BIT_TO_PIN(I2C0_SDA),
 };
 
+static const enum upboard_pin_mode upboard_up_i2c0_modes[] = {
+	UPBOARD_PIN_MODE_FUNCTION,
+	UPBOARD_PIN_MODE_FUNCTION,
+};
+
 static const unsigned int upboard_up_i2c1_pins[] = {
 	UPBOARD_UP_BIT_TO_PIN(I2C1_SCL),
 	UPBOARD_UP_BIT_TO_PIN(I2C1_SDA),
 };
 
+static const enum upboard_pin_mode upboard_up_i2c1_modes[] = {
+	UPBOARD_PIN_MODE_FUNCTION,
+	UPBOARD_PIN_MODE_FUNCTION,
+};
+
 static const unsigned int upboard_up_spi2_pins[] = {
 	UPBOARD_UP_BIT_TO_PIN(SPI_MOSI),
 	UPBOARD_UP_BIT_TO_PIN(SPI_MISO),
@@ -289,8 +299,8 @@ static const unsigned int upboard_up_adc0_pins[] = {
 
 static const struct upboard_pingroup upboard_up_pin_groups[] = {
 	UPBOARD_PINGROUP("uart1_grp", upboard_up_uart1_pins, &upboard_up_uart1_modes[0]),
-	UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, UPBOARD_PIN_MODE_GPIO_OUT),
-	UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, UPBOARD_PIN_MODE_GPIO_OUT),
+	UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, &upboard_up_i2c0_modes[0]),
+	UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, &upboard_up_i2c1_modes[0]),
 	UPBOARD_PINGROUP("spi2_grp", upboard_up_spi2_pins, &upboard_up_spi2_modes[0]),
 	UPBOARD_PINGROUP("i2s0_grp", upboard_up_i2s0_pins, &upboard_up_i2s0_modes[0]),
 	UPBOARD_PINGROUP("pwm0_grp", upboard_up_pwm0_pins, UPBOARD_PIN_MODE_GPIO_OUT),

-- 
2.43.0

