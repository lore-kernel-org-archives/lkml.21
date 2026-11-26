Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716204;
	b=OzR4NlEAdEqJVBNgWxfVwp6xi8/O2uZLur5x40nvnzMVzN4XCwFun9naNsK/Kx6Di/zK
	 Uyprp/ydDF2pNzcQcpm/WgFKx2QIFo5QQLfC7TehTQEjJlt9GfmIVMDfv/Xpnvsk8cT1m
	 hRvXxsBGPn0lH4lirN9FuR5LLIBO1bbHtMgwIu4EUkYBnoaJNLkXwW1Qcv1XWoD+WsxKa
	 RW2Fe5miV6BJW9rgMWeZjAAiENk+Iv8VHHA1px/noVCul22d4pIAeCb1/Mx4DmyxUT+Xg
	 jpQaqaggr749qbG73r5AJ4jF9wsy/PAGT67kDsYUYuruZY9aQITbLMbbOsOhK6rW6/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MWjWbCDRLzNbOgaM4N+L9AIS4oA7KwmKeVxKr/CyST4=;
	b=bNNv3HBq4/FxSYGc6uj6PBMChuf0GQexi4tOdbyt3lhxCWPAr/j1jh64uX5qUPcDgxp0
	 hfifu8TmJLI85SuzMxMY711bAIDzWKobo3EUL6rf5D+hoOjAOSeOR6CBEbFPHdZymprU+
	 FuHjnEVEEfG0eRt9sqtIsh06U6IS05VPRenlNCD4o+oerWyUmXQdiewh/HWruqh4rmr22
	 jAkWxRmecMyMEEjVfkExFBwWm+dLWORF/oSOZMG+RAK+VVdWx6YnPJc8Grkc/wrSBxxeX
	 awop7uOWliSIdseEa7Ge6IBfub90pvbpD2m3ickXRiOvwB2zGV1OHBugdpGEnFyjAtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EutVzTX3;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8420606A335
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8420606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EutVzTX3
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so66389555e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716202; x=1796321002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MWjWbCDRLzNbOgaM4N+L9AIS4oA7KwmKeVxKr/CyST4=;
        b=EutVzTX3ArqMEdzUKgVA0SrklEJXHUsiIpN1waVURscx28BvUx3z8sAp9ydSH4/bpG
         PewpjvUbCiHYmIP3/gXCHvjYrS0NPN+UV48LwLURrP7HI/SrsONSl4Ct9UfHwdlPKP3l
         oQjCPbepKJCx3RTw2p5JamEVZk3tg9UY8o7MJgaMYrpkyeGFRhIOWcnYxUJxQhbXqPaS
         2meW3DPMROeMTIBy/G4TEDyew9ULHyUK3bw5YaQ5j4j5AVroBTsiPLiWtsG5EUfRmsZ4
         RIj7PmxZyT1wxj5UVP1iq4xGvd12OL2ittQZuLc5Lc5sUdfEYpi5p5RNt3tTKhZu8RCk
         ILtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716202; x=1796321002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MWjWbCDRLzNbOgaM4N+L9AIS4oA7KwmKeVxKr/CyST4=;
        b=C7YsRyETVy54clowukB3NM+ibbKtaZj9apkHuAE4Redz5GT2/v5wLD19KumgTjSv+n
         qjP5LaQ1q4iE1PJj3LJU3OuXBJuD33CTw5Xb5UGI2WcenWNzczyeEW7F3UhjGq5DrWt4
         LkCt2+CQTiz9kiYjFGH+6y9rXSEC5nuzgruc//xTu7dpiLT3+jCb3ahEVY2688Wr1JrZ
         hCTqu5u6+P0+H7rZv8zChSQABXQrlRmx1sn+fY5mKEhVw0iRw6/6K/w1uUiPcLOwy2sJ
         IY3xF61HtLeTdFfUUuiLJFiHZQHb8pwRcwVBQLp3STP2yCFU4dFiiWEPY1llrTu+PD90
         /RLw==
X-Forwarded-Encrypted: i=1; AL+hErEu4xOgpMyQcGqnYcUAcRUpU5HH+nJY0hYy4ta3FjHWhfWRtmE8U0Q8SbZMRslu7lFEwr26jNLMVr4NSt0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vcd3c6k03Bj/SlZRW6J1T48iOuvToUFPyZpXxtuiTp6aSkUxW
	ACoXSCYrXue/eBhtxamgyFbzl3yw6ZrT7lyaaKLOeSA9uzs1eu0n6vo=
X-Gm-Gg: AZFdTZfG3OJiuJ235fYxxEVZ1GQzO3j3tAVYzDw4qjCCwQlZTvGgFDMg0V2d7KMjJfB
	1/69l5q1+oljkoN9n7OfLzCiiiaDqgrF7CUT2Cy/u9G4XCCDHg2at5OG+IM/4rr6fieYYbduQx4
	TzLdE4WWu11K9u0gEDVR+4oBf61GZb8+u9pst5of3Y2YANKFUpzzfe3GrkYQK5HNjyaxv+IKWt1
	Xd4jlcwXDYxpPDAKOPLRzJ1SE31bS2Xtsy3DZ+EokZN4duxgyO+S04YpR/PaGfeX6hOCNtumzX8
	tK2I//DhyaUnSytAi8QvpVQ9ynmdG0VjGf5y/fM1pu348RYQ/RFnV5udJQxDom8YFTP37/sJU0d
	nCfQzwopn6hH52i6jHEg2JG/v0ucLEG4yC4jaCUc2ag6FoeYtkLjUczLmFdOSm8higo+ac58MFb
	oZErXTIdtdxbLLjJn7Y4jO1VxUNyBbS15A8e0PxUl1KxpgHIGhpCTZZ2UWXJrpcBAkOW/dYaFVN
	lbVgX1MXd000/1pWOM6sss90cAD87gE9eXBh9Dj3amIujkUl6dARTlPS86Ysxj04nsm1S80aZ5V
	ZxDohRYHIEf4k2dZW7tgMKBE6+3qgz7/7jIeDAhq5TjemKICrD1QI/lLI89/7QwoqxTLGWKif4h
	JIAo9qx0/2H6XQTfE2mwSqadxUAqqJUy3+5hlbSF3fVLfhsrN3sG6s+pQ834=
X-Received: by 2002:a05:600c:37c6:b0:4bb:7033:c938 with SMTP id 5b1f17b1804b1-4bb888147b7mr437653295e9.14.1795716202272;
        Thu, 26 Nov 2026 10:03:22 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42265115f8f.41.2026.11.26.10.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:03:21 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 3/5] gpio: fxl6408: Support optional power supplies and reset GPIO
Date: Thu, 26 Nov 2026 19:03:13 +0100
Message-Id: <20261126180315.98034-4-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
References: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
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

Enable the optional vcc and vddio power supplies and pulse the optional
reset GPIO (minimum pulse width and recovery time of 150 ns according to
the FXL6408 / PI4IOE5V6408 datasheets) prior to initializing the I2C
regmap and reading the device ID.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpio/gpio-fxl6408.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index 9f80ea1214e03..5132177ab2837 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -7,12 +7,15 @@
  * Author: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
  */
 
+#include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/regmap.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 #define FXL6408_REG_DEVICE_ID		0x01
 #define FXL6408_MF_FAIRCHILD		0b101
@@ -106,9 +109,15 @@ static int fxl6408_identify(struct device *dev, struct regmap *regmap)
 	return 0;
 }
 
+static const char * const fxl6408_supplies[] = {
+	"vcc",
+	"vddio",
+};
+
 static int fxl6408_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
+	struct gpio_desc *reset_gpio;
 	int ret;
 	struct gpio_regmap_config gpio_config = {
 		.parent = dev,
@@ -119,6 +128,21 @@ static int fxl6408_probe(struct i2c_client *client)
 		.ngpio_per_reg = FXL6408_NGPIO,
 	};
 
+	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(fxl6408_supplies),
+					     fxl6408_supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable supplies\n");
+
+	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(reset_gpio),
+				     "failed to get reset GPIO\n");
+	if (reset_gpio) {
+		fsleep(1);
+		gpiod_set_value_cansleep(reset_gpio, 0);
+		fsleep(1);
+	}
+
 	gpio_config.regmap = devm_regmap_init_i2c(client, &regmap);
 	if (IS_ERR(gpio_config.regmap))
 		return dev_err_probe(dev, PTR_ERR(gpio_config.regmap),
-- 
2.25.1

