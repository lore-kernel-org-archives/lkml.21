Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447301;
	b=Lg12QRdez1VQu9KiADRCdG6yyO9zoNE9aTpiOxIKAP3qGeQPgbU3m0y50gxrBMK/HsJv
	 s7bVsso6s0Ip16Ov5n9ZUKXd9dRXXavmneUPSNRJyVRlUVdjiy8qsjDEMyIKfxgnsyi6F
	 LfmtzzK7NC4P/TV6uGpGYgLAIZIwAfkxASmu/HkjTPGSsuElguyRgC6lCU2uUu3GrVHc5
	 T4slW69apMSt3NOhgkTVBbPZCPg15Ge1ZRA2k4BKXpQxki0qGgZ7I2xBtjdKJAdKU6hRq
	 67YB2cKF2vQcFAq2hpNc/lPEOxi6nRpvoZpRV0Z3d+pNeJosk8KUYcTBzjMLem2fHyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=82cpJHaTF2XahHyniK0CnRQ00nLg09WJnkzOKC3qftk=;
	b=wRpaH2RQwubPRZcbe9+kq0dF1kSToY7cqgQyXwmSjnegUoAYFPwOiYwPSG5AhbavO7Cj
	 njyH8FePaE/wsUIkXoLUQ1RNQ4DZ7G4pxyUhNzWjwX6DTxXCmUo4sSXe80JZh18p7ZyEZ
	 kVMA/Mm+9fyG5r6H8MotVVGfivRO+Ih98iJ30n2tm5iBZkpfAhR4LROdcDl5Dw88JFNv0
	 Lgg6nIA7eaVWp5Xz1j8JjoP9hEgSQIjVPcuc0VTkxLwQamzCZAhhMTJFQbnlPZtGrUYet
	 8YAA/RqIYVDkKEuCSWUmodAFINWDvQL8ZGXG8IwZ6mU2h0xfSEwjYX6MErSZRBxcKXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=b1sFCBkg;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A550606A69A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A550606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=b1sFCBkg
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e47347279so2015595f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447300; x=1796052100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=82cpJHaTF2XahHyniK0CnRQ00nLg09WJnkzOKC3qftk=;
        b=b1sFCBkgfhFhzOsyFgsBuguGSd4ohphQgP3C77v2vFJgEQDWALGkMiIN87XBqGlw5H
         L+bmvzpUXtB0+Vpu+2kDpLxxKJQRcQxKLVdkfZfsEy2Dc/28jkbO5Ug/nVX7Xuf0zijE
         j5Zxg2D4v+D1CHcnOK4BV3khvcC1jqRm5iBNWAX8UbstSVEiMHGXRgIEVaj06XVMG39s
         hVsXlIQSsQG9fptJsTKF7HpvsG03GtCd1bJX1zy3HIy8DLfcoIjXMzK2zT/fImojWk1M
         lqoU0P3hdkcq63Le6BCGcAkPELf8M1JbEvGT+aqIlM//4gJUd2s87wbTRXqAAtyyrfKd
         GP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447300; x=1796052100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=82cpJHaTF2XahHyniK0CnRQ00nLg09WJnkzOKC3qftk=;
        b=HNCJqpdsMfDYfyPv/TUOZvZfDHVjWPw6zXJVVkcEYnOBz5+hkFefr4O/wCUp7Xzwlw
         SWqvy865XPp/N131Dpub8XKpXiYGD0Cm3LIJ2QHZ+YeHtkhi3mwwOze7JnKajGOBmTcd
         QyrcWfqpii/CosOKQ0rj71bHNWkp+1o98wZn0+qBXjWSW0LN7x/xCjcJVqUNTwUSsn6+
         9YMnKrbk8nahPiX5K3tsiYWmdVZAI6pzcsfQVDlnIHHh6hGVDlL+5x8Mk8a7gbLCeKAG
         IpnWG4n8onbwdhZE1avRA0tLKtPJBNiJXpcujrIdGJAUgwfLbUElM4eS55JZTt37eglL
         R+6g==
X-Forwarded-Encrypted: i=1; AL+hErHWIoLKzcpFoV2S2UxZ9zfx10rpxxEmMl4zFXaN7nht5IVA38O6+1AcsCp82u8ufm0YE9oRVmUIWFCb3BM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oCqrxDO7bfBxonytWrpq5RFT7UlPU0sPNAe+GZfRUEEzx6eEf
	4KlvdVr56c13OH5M7ezeG8cGW0Rto+2rM7HEoacgCsDMEG8BuDVeISsxBZ5jKPhaQ94=
X-Gm-Gg: AZFdTZd2nf0tUQhe9dj4728wvFSIi1dLodoydebabGMa+/1QJIhRm9e5vmYkpEpxa12
	zfRt6QhLBFlu0M1+jWdSoIIfngrhMCDJlaQbLfVDU0xa+J7cNvfR3/krrVvxxOrJwJLU4auBSLp
	Ydr00pEuhevtwpkJznmizTcBDvc2GbWSId8SRsYIbIs3CMJZ/6qvy75MetFQUNUERnCDCyydxvj
	RmV6o58nh3f+M9RsPFCmDlBufhzn74LkgvZJwRSfBO5Mf7trrvgYZCwY66l5WjFjP3mxn6i1Kho
	gYVHP2YTiTAEdBy7J9XVqPpeB78lz+83bSIwIpr2oIsUsXn2yLBswr96ewXWCWlhw7iA16RRs9g
	CDWAqIpkgcQdiwmoP7ji5fwXoGojDfO6n9sQKjWtjzYVp0mrkRO9MBonMokuVKjrAaKcd+pyRIv
	3+rikHHy9Ivvzt0wIRB4FmvRZ+Mw34bkuLcAIgRPiBgF8QAJSzWSEnUdB3uW3EclFk8FY5YZgno
	myQOQACq3olrFUvFLcVylmTueUMaDDxw8hQS2yK3dGS6AhMPMNz4Ox6eJsFuikaCIpl+FS+4Na6
	y+pb6Tf7f+qCIv3ECYFDTfUSt2x775rLVAxc3Do1ickY5WFEh9M=
X-Received: by 2002:adf:e183:0:b0:4a7:790c:4a56 with SMTP id ffacd0b85a97d-4abb5cc17dcmr21011491f8f.33.1795447299625;
        Mon, 23 Nov 2026 07:21:39 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm4832434f8f.9.2026.11.23.07.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:39 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:32 +0100
Subject: [PATCH v3 10/10] pinctrl: scmi: select the GPIO function on GPIO
 requests
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-10-d61f039be008@baylibre.com>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

On a GPIO request, select the GPIO function of the pin, on the pin for a
pin-only function or on its single-pin group. Without a GPIO function the
mux is left as it is.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 61 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index ed563514898a..a8285b5f307d 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -75,6 +75,66 @@ static int pinctrl_scmi_free(struct pinctrl_dev *pctldev, unsigned int offset)
 	return pinctrl_ops->pin_free(pmx->ph, offset);
 }
 
+static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
+{
+	unsigned int nr_functions, nr_elems, nr_pins;
+	const unsigned int *elems, *pins;
+	bool pin_only, gpio;
+	int ret;
+
+	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
+	for (unsigned int func = 0; func < nr_functions; func++) {
+		ret = pinctrl_ops->function_flags_get(pmx->ph, func, &pin_only, &gpio);
+		if (ret)
+			return ret;
+
+		if (!gpio)
+			continue;
+
+		ret = pinctrl_ops->function_groups_get(pmx->ph, func, &nr_elems, &elems);
+		if (ret)
+			return ret;
+
+		for (unsigned int i = 0; i < nr_elems; i++) {
+			if (pin_only) {
+				if (elems[i] != pin)
+					continue;
+
+				return pinctrl_ops->pin_mux_set(pmx->ph, func, pin);
+			}
+
+			ret = pinctrl_ops->group_pins_get(pmx->ph, elems[i], &pins, &nr_pins);
+			if (ret)
+				return ret;
+
+			if (nr_pins == 1 && pins[0] == pin)
+				return pinctrl_ops->mux_set(pmx->ph, func, elems[i]);
+		}
+	}
+
+	dev_dbg(pmx->dev, "No GPIO function for pin %u, mux left unchanged\n", pin);
+
+	return 0;
+}
+
+static int pinctrl_scmi_gpio_request_enable(struct pinctrl_dev *pctldev,
+					    struct pinctrl_gpio_range *range,
+					    unsigned int offset)
+{
+	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
+	int ret;
+
+	ret = pinctrl_ops->pin_request(pmx->ph, offset);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_scmi_gpio_mux_set(pmx, offset);
+	if (ret)
+		pinctrl_ops->pin_free(pmx->ph, offset);
+
+	return ret;
+}
+
 static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.request = pinctrl_scmi_request,
 	.free = pinctrl_scmi_free,
@@ -83,6 +143,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_function_groups = pinmux_generic_get_function_groups,
 	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
+	.gpio_request_enable = pinctrl_scmi_gpio_request_enable,
 };
 
 static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,

-- 
2.56.1

