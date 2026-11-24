Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540291;
	b=siPntfhzsACylUqw0u9ZUThSzgEZT19vyfmkXHzwZxtjqSeGg6JUXBiNzvcB4p3nhG67
	 XTDCYfKPLlSgvFnNLisboYbxT6PhDdGy0TrvmzRw7f8aZkXxyLxxwHL5u2sALStUU/u5M
	 RF+Jb29Mqew30GBI8oFXONEMscU8aI22WtjA+WeVucWcNe1F1DdXtLqz44tUP4JSIC2gw
	 NF2L393GbHAgnZxNlINLHAcN6Kln1NknNedQGvMfUtfbiST0wIxwDFi9AZdW6NGYkUkIK
	 5QjaY2GCyJ7c96i0YzBXN5JaYNJRb0VnUcss7xlmCTKjlrxQYbOjXNYSSzmJ7sMlurA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gnWF9t6Ikmgl21AYsFaDMu1qgmT/r8tnqfNnG1PTC8E=;
	b=3GyOI7QIYhFPLUVzDJWtepSbd1/K6ke26gD6P2sUJ9vidxcO4uOZbB65hASA1ddCKll7
	 Y7aQIpWDK5iX8yJatVEbNu0ZKXJN+Oxlwk93L2pfclYcCoB4oddDqKHavxaov+/0uBwiY
	 72eZYpbBS+aBwL/imRNJI5zF9/SUaPxlDbw4D4GWJwZfu/5w8EGVCD6CvrkhFEBF4GPJH
	 Rak5mI/9RFobFXzvKlMp8goFo1em6WSfBIAqd+P6xqhqdiwPcHiwjps0w5ytjQrxaSxbo
	 wK7E4oHrfhz3pqSuDZ9K0yeYwEuII1IQ24UrizdD3jP7ZFK2Hh0ozIG+6Wh4DxQ3OaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwT6ARen;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC80606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBC80606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwT6ARen
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-862b090e41eso2532023a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795540290; x=1796145090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnWF9t6Ikmgl21AYsFaDMu1qgmT/r8tnqfNnG1PTC8E=;
        b=uwT6ARenn0C576iVXiEC3I8K1VLP1hiSiBsK95HubxUIJCLGG/LQR6hgTnThzGDrVT
         AaXzCM+bAobpKun8qIgCsKt3Vi2wgr37FP+NnmDwdH8WI1T/549ub8x05pRzglj8ECQK
         b/yYwj6mPNmbDnKBE0zDLvPW1gVRCHF9wltSxlMv1FEs0k+3fwxOGbgBQomF7YHF4Vpr
         nOUDeZrb2j4aH8pqgfuyDTSVutozOMSOz1hNzXw5biFSi+olenGaSWibGbUOiSXQ6kLN
         syhmADK4zCm0EmUiVwlPlDviICDvtudy2SGi0MHFf1Xft7twGD8Ly3TPemtOe1KG0CxZ
         bZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540290; x=1796145090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnWF9t6Ikmgl21AYsFaDMu1qgmT/r8tnqfNnG1PTC8E=;
        b=dC7DDjBvFHwDic3XW0GVzklkKiF4DSuo1w6AeodqKf824DkhZ+6Qy0c3ygtAkzNVBS
         2d9qQRr3/QzIXwt5dFACVeMDJKIlWwRx1q67sA9R7j+Ri4FNJJF8Xv23AQ8pZ4uFZnvD
         i7mTlN5Tb0zIl+fywfsx873KS7eO7K04q1YJc4fGAUEoq/gTPTQu83aLqrquuBfRguf7
         L6wMalTuNbDOvmut2wS5rdPLoa7stNi9YbG17VuoL4DDb7gO3LhEBrX5wGbUP20yfiPT
         O7UVSxk14LXPZ8cUKckej8otcBuuUQA9VBpkRdVW0JB4oP8OarGCOtX2Q1ekLtRO/RVQ
         k+PQ==
X-Forwarded-Encrypted: i=1; AL+hErGB6k/++CAw/um+8Q6/3aAopD+9c/oW/knSqP6ofnLFXRlkYDoZ2+WSzp56Q7oibO4k6eMG38F74gowZFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DnHyHKzRqFTahnPsOpWKere1zzo9+3cx9QMJp3aaoSHJgD7VI
	dunCCyzeXCyT3j/OfziOdPYu2MTk5bwlT8rU9AbkE/bw1rqK1eSPg35Q
X-Gm-Gg: AZFdTZeH6UtoD9dn/t5oinfveOTGHyjKJ+mrCzvlDcWdAUUXAsy2O6K1B9CDm1fdsPc
	/K11RlGB0yPWXNVvEwJ2k1GJsQSoG1lJoBNqG9pnp2u+slqPdixRRoWllmotnj4X4QnoCa5Do5W
	aLnzWPgiAb3q235aCAhgh9nhhBtzTn+1AmKU9Tge/EG9sflPniV0wzylYTRwguvcUA+SXOXiFDP
	TPeZcsXBFxkV1KIds4TyaxVOjdWsJ8QEw9c9qIk9S6GHRM3SOPsfelN0MlXNajLlT4AOVLz8eaV
	vefUInzBTdcXH8gQqYb9Il63R0frSngcXf3nX5QYnoFxzxTMlnC5DrQOT+qoCHyibHzzP18Xyv7
	81Oq8iLnCbAzf5giUYxMafnVrQWn8lKOueQf0ik97o2II/66rynvgDxpcHnobtxriHEhIVOeEML
	4ynpNf74In08X7yWiV99a+bzRVrCAFciyuL4UIFPp0XCm5CtMguJCjg/uBb2sD/Q58BtN/WZyoI
	NWVoB+Vkhom3ZXrl9nvgetJhfiYE4p0E3EC5Ea21Xs3Z1rpkLOgCfHJGcFIIrZWIkol70Jezdec
	vC0+9SjNSuqNM+gnU6MlJUkTmtDIJQ==
X-Received: by 2002:a05:6830:6512:b0:862:acfe:9281 with SMTP id 46e09a7af769-86315979898mr17123473a34.15.1795540289528;
        Tue, 24 Nov 2026 09:11:29 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6besm11131021a34.11.2026.11.24.09.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:11:29 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Wed, 25 Nov 2026 01:10:39 +0800
Subject: [PATCH v2 5/5] pinctrl: upboard: add device id INTC1055 & INTC1057
 & INTC105E based UP boards support
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
Message-Id: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-5-c8079f8f569f@gmail.com>
References: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
In-Reply-To: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gary Wang <is0124@gmail.com>
X-Mailer: b4 0.13.0

Add support "UP Xtreme ARL","UP Xtreme i14","UP Squared Pro 7000",
"UP Squared i12","UP 7000" and I2C/PWM/UART/SPI pins mapping data.

Signed-off-by: Gary Wang <is0124@gmail.com>
---
 drivers/pinctrl/pinctrl-upboard.c | 102 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 97 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctrl-upboard.c
index 090316349331..6b53d6fd5996 100644
--- a/drivers/pinctrl/pinctrl-upboard.c
+++ b/drivers/pinctrl/pinctrl-upboard.c
@@ -912,7 +912,7 @@ static const struct upboard_pinctrl_map upboard_pinctrl_map_apl01 = {
 	.nmaps = ARRAY_SIZE(pinctrl_map_apl01),
 };
 
-static const struct pinctrl_map pinctrl_map_adl[] = {
+static const struct pinctrl_map pinctrl_map_upxadlp[] = {
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c0_grp", "i2c0"),
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c1_grp", "i2c1"),
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "pwm0_grp", "pwm0"),
@@ -920,9 +920,61 @@ static const struct pinctrl_map pinctrl_map_adl[] = {
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "ssp2_grp", "ssp2"),
 };
 
-static const struct upboard_pinctrl_map upboard_pinctrl_map_adl = {
-	.maps = &pinctrl_map_adl[0],
-	.nmaps = ARRAY_SIZE(pinctrl_map_adl),
+static const struct upboard_pinctrl_map upboard_pinctrl_map_upxadlp = {
+	.maps = &pinctrl_map_upxadlp[0],
+	.nmaps = ARRAY_SIZE(pinctrl_map_upxadlp),
+};
+
+static const struct pinctrl_map pinctrl_map_upsadlp[] = {
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c0_grp", "i2c0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c1_grp", "i2c1"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "pwm0_grp", "pwm0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "ish_uart_grp", "ish_uart"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "ssp2_grp", "ssp2"),
+};
+
+static const struct upboard_pinctrl_map upboard_pinctrl_map_upsadlp = {
+	.maps = &pinctrl_map_upsadlp[0],
+	.nmaps = ARRAY_SIZE(pinctrl_map_upsadlp),
+};
+
+static const struct pinctrl_map pinctrl_map_upadln[] = {
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "i2c0_grp", "i2c0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "i2c1_grp", "i2c1"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "pwm0_grp", "pwm0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "uart0_grp", "uart0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "ish_spi_grp", "ish_spi"),
+};
+
+static const struct upboard_pinctrl_map upboard_pinctrl_map_upadln = {
+	.maps = &pinctrl_map_upadln[0],
+	.nmaps = ARRAY_SIZE(pinctrl_map_upadln),
+};
+
+static const struct pinctrl_map pinctrl_map_upnadln[] = {
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "ish_i2c0_grp", "i2c0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "ish_i2c1_grp", "i2c1"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "pwm0_grp", "pwm0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "uart0_grp", "uart0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "ish_spi_grp", "ish_spi"),
+};
+
+static const struct upboard_pinctrl_map upboard_pinctrl_map_upnadln = {
+	.maps = &pinctrl_map_upnadln[0],
+	.nmaps = ARRAY_SIZE(pinctrl_map_upnadln),
+};
+
+static const struct pinctrl_map pinctrl_map_upxarl[] = {
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC105E:00", "i2c0_grp", "i2c0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC105E:00", "i2c1_grp", "i2c1"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC105E:00", "pwm0_grp", "pwm0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC105E:00", "uart0_grp", "uart0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC105E:00", "spi0_grp", "spi0"),
+};
+
+static const struct upboard_pinctrl_map upboard_pinctrl_map_upxarl = {
+	.maps = &pinctrl_map_upxarl[0],
+	.nmaps = ARRAY_SIZE(pinctrl_map_upxarl),
 };
 
 static const struct dmi_system_id dmi_platform_info[] = {
@@ -940,7 +992,47 @@ static const struct dmi_system_id dmi_platform_info[] = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AAEON"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "UPX-ADLP01"),
 		},
-		.driver_data = (void *)&upboard_pinctrl_map_adl,
+		.driver_data = (void *)&upboard_pinctrl_map_upxadlp,
+	},
+	{
+		/* UP Squared i12 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "UPS-ADLP01"),
+		},
+		.driver_data = (void *)&upboard_pinctrl_map_upsadlp,
+	},
+	{
+		/* UP Squared Pro 7000 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "UPN-ADLN01"),
+		},
+		.driver_data = (void *)&upboard_pinctrl_map_upnadln,
+	},
+	{
+		/* UP 7000 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "UP-ADLN01"),
+		},
+		.driver_data = (void *)&upboard_pinctrl_map_upadln,
+	},
+	{
+		/* UP Xtreme i14  */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "UPX-MTL01"),
+		},
+		.driver_data = (void *)&upboard_pinctrl_map_upxarl,
+	},
+	{
+		/* UP Xtreme ARL  */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "UPX-ARL01"),
+		},
+		.driver_data = (void *)&upboard_pinctrl_map_upxarl,
 	},
 	{ }
 };

-- 
2.43.0

