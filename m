Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447024;
	b=TA13Rh+hF7hPJifUzMcQ01GIjab4cZawbi5ljpgFzGtzZ4LgSM5cLhAZL5VZHTaqHYWL
	 m+VV0ZUnooo8+unflSAQ/GllGZEhveOQe8h/bNHzTvtU8vnCFiLbzHFfToCQhcm5Lef/3
	 E6L+uV6xjPEP3a2dsOSs5V25sl5t5mCuBD4JiVjLv1E8X0Ngrcq/1Gq/ar//9FL80RPyE
	 AxIjmpH9MkUKIL6zf5vUDcOhAt3Ul11VkNqEYT79ytJHzm8+5SqRamQpfKKEsB/nG17BB
	 R5xOryBQ3I8DpyIAS9g3gFfVkfHjopK7greUVafbiO0k7trXe9tjTKmjfR/mZXbw6Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=riC1NYgSZjSkHoH2+prXZK8ReZ+OOKUQUT09kf88/Zk=;
	b=Sv/GriimE9gX3q+Bh4/Q6vghEu7+qYKdJu3LTuxqZRZbgI3mUSlyMZEqT/dws89FA86O
	 QDJiKfOKr9RU+wN4CiECZJsWdKQ3nGgrS3h0Oo9Z//tNZHsIK8VOXmh5HPWHGwGyrz1FO
	 qunwb7CE6xTeAgRAUBVtcTBpfv0tJwKfCABugFR2Ux+PUUMMlZnSlR/InIXFL39GY7DPh
	 dBRI6Fi4J0ajJGruiPK2CDAfv4k31zjOSir0KcXXMINEBJUE5055lHWmUN9MWdxo8iK2A
	 5D1GFlc+nX4CX/TzAkiH88xmRPPlHSgqJZ34TKfSxQeCsT80OOiUEauke/FUpm5MgDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvacZEQk;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F455606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F455606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvacZEQk
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1773415a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447024; x=1796051824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riC1NYgSZjSkHoH2+prXZK8ReZ+OOKUQUT09kf88/Zk=;
        b=qvacZEQkezWPIkkrVAsmoroDaIt4CLLUwFFVUlIxxyXLUIuNhsNO+aYrOuQQZhJa8P
         Nln9ZtPlOdbFZZXiCZEZKIYjBrjvLoulnM5WXP2Y+vmOtSEjoddklUpXCRWuGUppyIG1
         3dZ6tR3DqlTRDj+fiXYcWiKDtI3KfADbaQyhCXCFM4HmBInO+ZGDDNRYqkiUi9GRPS9j
         yV2uqKv9SDzOgplv2gD7GJzGYTQdVhQ24+CF5U2R3AEcvoaPGwig2lEYnmg9uQ0JVVK7
         63+fm3CQWdcfzI4bbGK7U/a6mdf65IYfQ/JyCuOc2D+bFxH6i+ayGQd4T/9dDFpTMcNf
         bJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447024; x=1796051824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riC1NYgSZjSkHoH2+prXZK8ReZ+OOKUQUT09kf88/Zk=;
        b=olcED5u3/KArEGPoYWlh5qY/0VmLoc0E5a6Ukwq6rznDq8AoCqe7CLGPwO4gRI63yR
         aepQMyisQikKCFEXMWG1rDVYFWbJPy4NA7T7djzTHsLn80b93SJMNmCqWPSaguOtP1xm
         LR+J9wquNf7h6bHm2dVRrOnzfuNYEeBsZmAjKpsl0dYEORLp8QtEGVFGHPInTB6PWpLY
         hKgGPKgUh/fm6xpAJe2u3omg2cUUYWeIy2rpp1vmVND/TUPgHbFQCmhm/tbk8m2X+34n
         vxpH5gEmcwFgzlgGybdtT+arAyv0F49M5WXuaf4QTT0qnM8fFNUlwgNqRCe7IKaGzQ8O
         31SQ==
X-Forwarded-Encrypted: i=1; AL+hErFJZbJJlzMRTbi+jPgavwITdNYmPXmWqDVoIcLTYySiKFuE81N9YXU7b0GvPyN4xDwWvlb+h/gweGBVyOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+w+tJBFk93ENQ3bnU5b5OtyFuj5tl3XGWGU8BFQVCKR+W6YPID
	XtBP5WTrkFRSbzazm4obAjZGFdJ3yA2zh9E6z7BP1XYfsq8uXlAR4p9J
X-Gm-Gg: AZFdTZf6P9+ouHvcq5lbG3ySwf2fV1fx4YIpeqjpi83HvNBVgUUFdnA9sjqzpW715XK
	tTyfMSHN397rsjYcUGojN5g0rWTWMxxK8PKtnEREi1CP6Dq3CWnGTPcZ6PHtfLSJBcGwFWAGZhA
	hZPPk35aaqbHrrgt1jMaiZsgwQG4E+bQdvLj1WS9Cs8Cvk7TiZ9nw0/YjWoLAagVzDQssCKCzyc
	5ZRVMyBscroyVyVC8Uh/wfUJeHlgR2LehCEeJ/WbR0moCRvKM8DgzU5KqkVyxrkxUnrXzOTgN2s
	+Qx+IMemCsrWzS3CQPp+wTIC9LZ5FPNS/4pczX30L/qUwVhbTcpVgE9d12OgAx9XJrgLHZKDmMr
	z/x5ZE7pAUqms10o4OYVe5Gy4FeY9tk+8ojbqZHvrzl7Y2HYNj7FDknmopl4VKciEOwgOx2Pz/T
	IkF+9W7XSeq0i8nDQg0bi4bYKO/LzIksUSKxGpY9TTPGB0jGdw4tFpL1EZb3Kl8E4Btkhe3rVQq
	zbQEjDOeQLCCW8Ymaaj7c+V5vhZOwJSqqbmKg11o7PyvzD2eeaKT62RAkmzZZ6ZhR8rmwWHCnLA
	dPfhjd97R0dYamaTQG0BOcLeeRQkkQ==
X-Received: by 2002:a17:90b:3d8d:b0:3b3:b750:d2ed with SMTP id 98e67ed59e1d1-3b41c7b56c9mr10765037a91.8.1795447023716;
        Mon, 23 Nov 2026 07:17:03 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm20067482a91.5.2026.11.23.07.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:17:03 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Mon, 23 Nov 2026 23:16:18 +0800
Subject: [PATCH 5/5] pinctrl: upboard: add device id INTC1055 & INTC1057 &
 INTC105E based UP boards support
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
Message-Id: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-5-f2322a91686d@gmail.com>
References: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
In-Reply-To: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 BillyChou <BillyChou@aaeon.com.tw>, Gary Wang <is0124@gmail.com>
X-Mailer: b4 0.13.0

Add support "UP Xtreme ARL","UP Xtreme i14","UP Squared Pro 7000",
"UP Squared i12","UP 7000" and I2C/PWM/UART/SPI pins mapping data.
---
 drivers/pinctrl/pinctrl-upboard.c | 102 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 97 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctrl-upboard.c
index 66c1c3e3bfe0..232678fb811e 100644
--- a/drivers/pinctrl/pinctrl-upboard.c
+++ b/drivers/pinctrl/pinctrl-upboard.c
@@ -922,7 +922,7 @@ static const struct upboard_pinctrl_map upboard_pinctrl_map_apl01 = {
 	.nmaps = ARRAY_SIZE(pinctrl_map_apl01),
 };
 
-static const struct pinctrl_map pinctrl_map_adl[] = {
+static const struct pinctrl_map pinctrl_map_upxadlp[] = {
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c0_grp", "i2c0"),
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c1_grp", "i2c1"),
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "pwm0_grp", "pwm0"),
@@ -930,9 +930,61 @@ static const struct pinctrl_map pinctrl_map_adl[] = {
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
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "ish_uart_grp", "uart1"),
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
@@ -950,7 +1002,47 @@ static const struct dmi_system_id dmi_platform_info[] = {
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

