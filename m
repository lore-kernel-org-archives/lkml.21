Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810196;
	b=EHcj6gPBlOmU5YNQqtaqoSn0sxoXyopNBXhuK7V/QJdFVku2kiO64L/0JZ/S7OJIlLH5
	 yqTmTcG5YOwcYYPsck84HA8H21ZhbqEebAUTfw/eFU65jJQsqfAqASE/npmP+WpirYdZ4
	 gR2M5prN/1QUCYqQzt4Q/qkWTjVzna56JUPcfvRwoyilWCbTACmFrv9tUgV5h0Mpfjv+O
	 ozFT3xpty2Qd2wXgH3PFsm59hOez6fVJHjm4cjUXBfWWL/2MldtlxqI92DGWXftpWqHt6
	 igl9BFlt2nwD24/aLSEMFJsECCRW3RMJr2MSVo/Mo7kWioZwRAIQKu9zBMnYvo/dr0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JIsYAG/w26E6FxvUJAJzo1Ty0QYQDvImmexX9oITg8g=;
	b=CnOIejBjvXvfbQB/yM0mF4VCponGO9N8Iq6BjFGOpoQ6XIrpSGNA7iw6sxNVimKpt2aK
	 MvpDQSdSCJbm/STh0EUFEGgCbr4WwKff00wn6wj1raTS84QFwOqw13oIcrwjFbkdarGPG
	 w9siLtkd1b+AoAfnOMCsUtfGR+vubWNVbhhJV3eJayx6VvUK6wPHLwjTs2rxui49Z5cb2
	 sm48lMMdgSUuVecvTLMxzALx7On/LpEDE8sngl1lQ38SQxsPX2u308HZOohsktiLBx9ru
	 wa0YaYVXlBnuBNNMs4apEtuNCjgv3hEEsOt4TTa6NJudRi3xsAdQWIOmpcG8feo7irg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QU81oq6f;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78835606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78835606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QU81oq6f
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6d68de53053so6228920eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810195; x=1796414995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIsYAG/w26E6FxvUJAJzo1Ty0QYQDvImmexX9oITg8g=;
        b=QU81oq6fTlpFdk3vUjuTftMB0IYJFT5KFeOmyR+gqnr7I+8ZRuMtV8mAft0y+pqHb+
         x9vUCYwZqszqFmfc6/QW/3xExMCe4qZtn3kU6B+bLzNvREYf+F+vHJrB0y4kEf3MHYA9
         OHSO6qkLLm7BS2vG3/eVJoBTKVgNMSNObZGQ6lNiUs4wVwRiBTksIDSzODEhEBKRUlgN
         mAtX03HCjDZFUeIIr22sE5p9CbD+t/EmouZ9qf9iBPrBWXGaAkAYY9nj+nrQx1NP0KE2
         WHzpHvxYspLKPIZFg5biPJxHaoMzOrW8uZBtjH6Qr+xxM5eXyy1DTeza4+M215KD+C4D
         iyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810195; x=1796414995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIsYAG/w26E6FxvUJAJzo1Ty0QYQDvImmexX9oITg8g=;
        b=pKkSmPZ47ya+bDjx+nMWR58tpXSLzx7/8Yeo0DrzbUVqtfdFVfCAjDWT7WUZwgFW2N
         yfsz2eFNISgLsyhyYnrzKMuQVY6/hDK5XAF73QEXqbDIWykJq+WPVsA/gJpjKD7T7ULJ
         fPHjek335aMynckv9TJ0vekm1oCmEsKhflHZ/CTAeEsN7z8uw2jdJ6Eje+lrSmcjvz4e
         izxgGntTn+BAR4BS09V6eoMb0wLPH8XmlOssV5zOUq6ObkANUTZ7SgDjTm2HMdLuOpYo
         fCdXxrJL+qlF1zwS2VZ/IzJTM5tFWtmDUw62DDtus7le+47Azdq53ufvDlqY4jpBhgkS
         SEuw==
X-Forwarded-Encrypted: i=1; AL+hErHLAPMXS81l4RhyGTQVXF/QBubmtmGXTzVlxu/AfZqz6lW+fd9T+qdYF5eIf8kYZP+NbTwuxRfHIHZukYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BQxKiCFoiYRiDKeJgoSteewZMao9xC08oknrIc0HC/6L58OJd
	xCG0SnQHDfKlO3FMTX9YJ4rg1sxsqyRvDyjKXXWNWoqluin4qShGDvEI
X-Gm-Gg: AZFdTZc2PN+GTHDANM58l7pCmZdJnFcAomYQKIKJKhq8g8dJUwHYiccGo5HaElaLxXT
	Ubl66Io9yRcWlmJsMNuYGasMm9pgtwb8i6e5oI66hfr2StMEUn4rfMrppp+1sZ/bWAt/Y9rev3O
	thTOe6DA+hlC1elR2vVyYR+6ME4ndm/hiJsR6VT37XYZOr2KLxGZDTT1REIPq40Eslu6JhXu6sw
	L6DXOn75inZJY6sh47ei6tvnKrOpZreiZZVO/ZoF2e/5HeEvQ6yOOc8BwCytm+mXsMQnimyD6WY
	tOKMZqeXiv4XrZoc6ZNrHVLzg0HEe2Zeogn+GvMIn3pPnpnrC+w8XPoxsA9km9CmZX2PxYV9h8M
	Ft/g1F7LbqSFn68oNEs08jeE75QAc/jHtbaS0aciznY5kC8cWrCB2VThd+IkSMdMWJY/Jp6DTNB
	Ex11spTkysy8ECNa7uCHno9S1UIPCYH+sJ8YupW1eM0LXnAO7eTCX5g9lp9cZ87M8KjHKIM87x8
	XTbU9nMgOZjuVJX1GyCauKH7V+5Ye0nBWxr1YO5HQ6DnRNHiOUENZ+3PZKpvVdYJWoWA8t+BTYb
	ZmMeESJVPV6gLsrLFMVK4/gIjDw4gQ==
X-Received: by 2002:a05:6820:c30f:b0:71a:ecfc:442c with SMTP id 006d021491bc7-71b3955e035mr16217300eaf.71.1795810195459;
        Fri, 27 Nov 2026 12:09:55 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b8590ba0fsm4834662eaf.2.2026.11.27.12.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:09:54 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Sat, 28 Nov 2026 04:08:33 +0800
Subject: [PATCH v4 4/5] pinctrl: upboard: fix I2C pinmux-select set CPLD
 GPIO OUT not function mode
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
Message-Id: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-4-029071f417d5@gmail.com>
References: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-0-029071f417d5@gmail.com>
In-Reply-To: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-0-029071f417d5@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gary Wang <is0124@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

The CPLD I2C pin mode setting through pinmux-select is not correct.
Should be set UPBOARD_PIN_MODE_FUNCTION on AANT0F04 devices.

Change UPBOARD_PIN_MODE_GPIO_OUT to UPBOARD_PIN_MODE_FUNCTION for both
i2c0_grp and i2c1_grp. Additionally, replace the check variable `mode`
with `modes` to prevent the value of `mode` from being 0.

Cc: stable@vger.kernel.org
Fixes: dca2f73cf19f ("pinctrl: Add pin controller driver for AAEON UP boards")
Signed-off-by: Gary Wang <is0124@gmail.com>
---
 drivers/pinctrl/pinctrl-upboard.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctrl-upboard.c
index b9af6dd93c34..bcd2dae9969f 100644
--- a/drivers/pinctrl/pinctrl-upboard.c
+++ b/drivers/pinctrl/pinctrl-upboard.c
@@ -289,8 +289,8 @@ static const unsigned int upboard_up_adc0_pins[] = {
 
 static const struct upboard_pingroup upboard_up_pin_groups[] = {
 	UPBOARD_PINGROUP("uart1_grp", upboard_up_uart1_pins, &upboard_up_uart1_modes[0]),
-	UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, UPBOARD_PIN_MODE_GPIO_OUT),
-	UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, UPBOARD_PIN_MODE_GPIO_OUT),
+	UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, UPBOARD_PIN_MODE_FUNCTION),
+	UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, UPBOARD_PIN_MODE_FUNCTION),
 	UPBOARD_PINGROUP("spi2_grp", upboard_up_spi2_pins, &upboard_up_spi2_modes[0]),
 	UPBOARD_PINGROUP("i2s0_grp", upboard_up_i2s0_pins, &upboard_up_i2s0_modes[0]),
 	UPBOARD_PINGROUP("pwm0_grp", upboard_up_pwm0_pins, UPBOARD_PIN_MODE_GPIO_OUT),
@@ -710,7 +710,8 @@ static int upboard_pinctrl_set_mux(struct pinctrl_dev *pctldev, unsigned int fun
 		return -EINVAL;
 
 	for (i = 0; i < grp->grp.npins; i++) {
-		mode = upgroups[group_selector].mode ?: upgroups[group_selector].modes[i];
+		mode = upgroups[group_selector].modes ? upgroups[group_selector].modes[i] :
+		upgroups[group_selector].mode;
 		if (mode == UPBOARD_PIN_MODE_FUNCTION) {
 			ret = upboard_pinctrl_set_function(pctldev, grp->grp.pins[i]);
 			if (ret)

-- 
2.43.0

