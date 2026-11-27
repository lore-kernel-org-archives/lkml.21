Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810207;
	b=oAG1ZOYexllbfjEGHGa7/xOQbOffiUh+JwlOiG9p4qle8kMU8NZ3G3fqfiaKablnyE6i
	 9h5LgIN83oLMlqzVMoA0NQ1eXTv/6MQooDpurIW4IVAxUQQPSFgNycN03w+G+DHCMkive
	 9bhHuiq2JwwDJ1xPkNyjq8QYfqCgObhqO+DvDO3Xb4EuFMpyjZ3Gsd0UpR99kyPfJ3wEn
	 3n51B+9zstS7hKMjBKdJDLFTku+shD8ZuHxbLOXzX4ciBCKm0MSF3f2M2sGPT2DemyHRz
	 UNsN4hp+CQ6lhO/HxEmeDL8XNU+B9hsB+SFjknhhxf52k4lyHOjGHSuxn1HfaqptOkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=iwinBqJVI6CfJQnf2HrLfPVQ0/rpb948wCB1K04dFmA=;
	b=dwW8uvZky8xyb0IclgU8FI8nXAak3OU4iBVh26MJxFjMu0eMHYqvV4DaZmogCJzGWA/U
	 FXCGVq1OIScchqINgvqd9qkhfWVl+y9g2MEHDrXrMVtBsesZR5AG5jvmNHj3aozqmvnoN
	 Wo51Jk8wwjtuBzdgJz4wgzFL4BD4usHlOV9XGqU6gL3gYtMlL7+rwtqpPMR8ssofXu6Xl
	 gPG3lM1TGVBwCJQ+PEAdg51C0ZcB/Sn86WPGFpV+E3PP3I4T/3gJM6lwcY/GxpHXoZuFj
	 L4uCke3Fs8GI+oFK+We5kX/vg4r7IalH+hA/Fbx5hYBUGCbCigAetP6bbMQDPPlF3VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VFkituvX;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F12606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78F12606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VFkituvX
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-71b47eede22so5036278eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810205; x=1796415005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwinBqJVI6CfJQnf2HrLfPVQ0/rpb948wCB1K04dFmA=;
        b=VFkituvXBbHNHAsMZaLgubeRUts9st8z8FIxbGXilNOoefQXSvQ4AQxONHqByST8d4
         iUC+6KwbySRPU1s/Aod4eoaRjLR7z1xm3/9JcOlmRw7Lj/+xB0cpqGf9gp/D1fRbFMo7
         MqCpRsATR20ht+ZISQb7xPlIzxLALU7KMb0QzmMIa0OJYd+LHYAg0LIVdIxvLwaqboYX
         tSj9et2MASNfErEto9y0/n/xHjp1bsizqmKtddkbk4zhYcr6RizEGYjt5lEEnL2lZwyl
         CVUaDaIHk0msNLuzHbohKLcUAB4idUY0+YfP2fpAvnigMZZ7gBgbKROJubo5KcSrBRF6
         rMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810205; x=1796415005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwinBqJVI6CfJQnf2HrLfPVQ0/rpb948wCB1K04dFmA=;
        b=Pv3E7+FBb/URYl4SHeBcur9Rwyy8+8/1f3lMfUvUgLjvdfPOL4ZHddaGKKM7FhnrtG
         HNifK/YGp1jtD+A7s5AaUfcEXK/At4k+khdREzKbgoRKH+v4xnAdbU6kuKyFe+Fjd/gl
         wA2+pNvgOcZ22AYf2d1AkMw5eAWiLDmGdiXrCRThT41TFHVWgHjII+kDR4SRujVGQY2Z
         bIQCYQ6Qp+ZjAhoWkRMSZxH2kJX5eEdG0r9X6gAM8M7ifxwkr1AOyl32Jmz6D+Txk6HA
         wSPaPuSVEgfa1CpJ59bG15fa746kOdosPCBH/5tK/+gx9KK4w2/+UnlooJH1hAv0aDqY
         XdDg==
X-Forwarded-Encrypted: i=1; AL+hErGHgI/fnzmWOIMXfYadGeBu6s9tSV0SJfxdXCm/vcjV/mcmz9rUy5CZJKNCu3JVV3ErHD8hcjPh3S3mRec=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KddA/giy5oyoP8l90572dZ8gesjuMoywTaGWPEuIHUJJRV8j1
	iVw6dV4aHZX4TvZrPUkmI3U/HrAwfT+WN1x66QPrptZ/QHAKMPG/7nkl
X-Gm-Gg: AZFdTZesE2Vj5LOx1l0JMTTSnUOmcgPAhoJity30miOsBwt9lYhYWOKQ+dNS4ws7t+Q
	3dEjNDeEjbzyR3D88/QKNC8qoOYnIyO1CAmRLN+4jZjXpLBThsdM48OaP7F0edQm2XWB0UGUCIc
	4A/I5GVQsrsN96I3vzqQrfhoBcIoqLISNPBTTXz2tc25XifCzVkPnXpTO1YlcdDuBMUN7/Nnc8B
	eY0n19KBxYoL7EkcCrtpQsjxvaugs033Wly+7U//D179Srx46BhmZIMu7bs8uuL/SJXku0foWLZ
	Sjbfjlt8wJwL+cXXSOxYo9TL5U68Xlycz0u0ox6IA3gX3XuQhjNp4OORqV2FJ2D2aM4gqEwznBW
	dV8Wo238W69+NRdSyMNejfqrztisCn3uzwS1yTOq2202PFW/D5o+zq3tWKCErrn3f5UrsGYPfAh
	XdwtN3r+acHv6wWqCcREZyrtIFxyKIyslfyhaOeafvsEo+k+7YNAH16ZUmXUNlOzndAOdw0kxb/
	LMsRHWVcxL0E7lusejq4Nw8qqlix2WnkrOl4HAtMu84czmMJSIw+gH0HxXnf5XVUWHoOkSHpuR8
	TpDQA40Cm0JZI4RTjvJrNpPe0KivQg==
X-Received: by 2002:a05:6820:a284:10b0:6d9:e2f3:9b51 with SMTP id 006d021491bc7-71b39544cf5mr16352909eaf.66.1795810205054;
        Fri, 27 Nov 2026 12:10:05 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b8590ba0fsm4834662eaf.2.2026.11.27.12.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:10:03 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Sat, 28 Nov 2026 04:08:34 +0800
Subject: [PATCH v4 5/5] pinctrl: upboard: add device id INTC1055 & INTC1057
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
Message-Id: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-5-029071f417d5@gmail.com>
References: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-0-029071f417d5@gmail.com>
In-Reply-To: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-0-029071f417d5@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
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
index bcd2dae9969f..7c947158b07c 100644
--- a/drivers/pinctrl/pinctrl-upboard.c
+++ b/drivers/pinctrl/pinctrl-upboard.c
@@ -913,7 +913,7 @@ static const struct upboard_pinctrl_map upboard_pinctrl_map_apl01 = {
 	.nmaps = ARRAY_SIZE(pinctrl_map_apl01),
 };
 
-static const struct pinctrl_map pinctrl_map_adl[] = {
+static const struct pinctrl_map pinctrl_map_upxadlp[] = {
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c0_grp", "i2c0"),
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c1_grp", "i2c1"),
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "pwm0_grp", "pwm0"),
@@ -921,9 +921,61 @@ static const struct pinctrl_map pinctrl_map_adl[] = {
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
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "ish_uart0_grp", "ish_uart0"),
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
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "ish_i2c0_grp", "ish_i2c0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "ish_i2c1_grp", "ish_i2c1"),
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
@@ -941,7 +993,47 @@ static const struct dmi_system_id dmi_platform_info[] = {
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

