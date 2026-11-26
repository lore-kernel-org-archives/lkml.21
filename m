Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716205;
	b=3b7JgZ0+1Shza8p+EtKeaIt/pWgNw8Xeh7uO45lqNJQbCbpuSnI2RfF1yiEESH9qTXba
	 dBBgp+BK78nNQX6Ewxad3mzFuALEAUx8bLIttJGiGzvFNOveBa++tZsplHjIjIdTve0WR
	 jZZMPKygR/E+Bha9sqGQcK5k2m6kHL7wZgzDoQ6UWUOouUJNBn0ByPsTD9RYeTH3Ugx8a
	 YFIl79/XqbORqrF/yLvJ1WABEeYvzu4W/zioU8bCrqBVX+YnksSkRdR6A8wsGAQ9N4Iyu
	 Eqwm1ekHczOHXMS0NguOdLPA+RDFr0HrOc74StlBZiLgJ1NrFxDu6RXxe1ZMoQk6TOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WuHE4xVuwPbHoJJDUazvRjThuTJ3/8xHzVYiIGey9/0=;
	b=jk85pE51Hw2QjgYDS72+fbzta8L67JEj7oniIR0MkAedYYswnznIx1Gp5v75PGx5DeSt
	 +NlxdxKiGkx6A86li4uf43WTONUhXPvUhrjkmAB1HCFi8CjJmxGT63EbMhCw2zkJP3OU3
	 i3F8ZIPhBwWO/LpAAVVX6ThrWdG8DLvvbrOWNST3qMxNY9Xjxt+ixM8++IYYRucJa19hA
	 ytS9cLOKmM7HNpbIlJxLKOfEIa4o9TeKfsuQ/CScBggMNX8vMtdVFfJAlJ6S4Dxi2yTvI
	 Xq8OIELI/PpwTIXxh0FKwgSxa+PtFFsyciSuP8Yz17sOHEl5QH3XCHsQMNfDHOL0Bmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jGbETmZr;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3784606A338
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3784606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jGbETmZr
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso3348903f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716203; x=1796321003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WuHE4xVuwPbHoJJDUazvRjThuTJ3/8xHzVYiIGey9/0=;
        b=jGbETmZrNFtM3pjEYK+LBOFQJe1WmjF008+9gjsGBzCLSb0JE/OYF+KYRWj1XcMROt
         3POEgILHWdzhVjbHNhZLx+2qTXqB6AdFRMTAgLf6IeIsndzkbmliAz2Ox1OcRtJrcIrd
         xk1rzlUiATS/MXYMRgvXBjzmkhPLYZNV28tifShqgYNcFNYHp2Z2UMK+mtxYNURFtZAY
         wd4+KGbt38dvG9wPr3nfLvdc5H6OW1KTUq2AvktbP6deXZPTpjh/zMv0ZrJrQEA0Knlk
         n0ksfpVkIm4x+C+dmpiQVbycwSe11RMfq13C0DtflN+aQjMu9N849pnEo8d8/U+jU38d
         01Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716203; x=1796321003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WuHE4xVuwPbHoJJDUazvRjThuTJ3/8xHzVYiIGey9/0=;
        b=2Ayr0zKKXYRMNk9w8zjv/1hR/3BD6QQ1LLE8PL/ZoHylEuphkXlEvrJgQR55WYCtEy
         jYrNYOdxy2IBZ9pM8DJsvhpxEB3m7vhB8gMrMQoE+uCC5agYrugLNFaXH7i2iYQ9WYUR
         x+P44fWRj71JHJN7+C6LPuO3Ukw158KW0bhdxEvXoj2yVoTsmmV3VQdj0lQ2GSWuivg3
         N5r/7g6SWM9xiiZRqKqV4h60sMqmtn2W0x3BTAyxxESNUA2Ukoww1c4LYoBu9rSNpP4N
         SD7rlPVMlkxG79hBhtZVaGefNsPQZyAIimG5YeU6GupagJBcTpsYdAbqYAspHPOAZXvA
         oAcg==
X-Forwarded-Encrypted: i=1; AL+hErHFs0BXgTRzWF3rL56pntlsxdVD/xsNBtX2DYHfzUo28yj3JnDpbwD2yFtum21bSYO0xktIUtBr9ltinK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yJlsxOeliG40w2V/122/Hnl+T3W1f1i6ay4n5+iLqsQMuPf71
	37gHT/LOtITPC9fnNEIx/KkEyIL4EzG6mJs3OyaaPWqGxwG/rJAEbUI=
X-Gm-Gg: AZFdTZfqtIiDyK6gx86TtFRG7bDx1Plk8/vLH5DJmzAqQNqMordZI7l/icPhtMr7IiS
	OjriaeWZqX9smM56egWlTmxGeDlk02bXvKWmi9KB80VABP0DTsPUtzlF6VRMXFghQG9BNjWEVv/
	d+x3ctadS9gAPcwkwNI4nyDkRf6VBtIBBqcY6gzfI18dygg4Z6mcOVHqkMcgbcVP3kmte2YCmsj
	/zUqK7DTEji4Luz38MBiLYye/flqWPV7pL3V6XL/p5AWpwqKEDkffPCtOnGw2rKdHaOGzTilOVw
	A1suSCIEywemJW2RYYBs9hBGhVnUu92DZhdg4xxeTCtfzkuEd1oXHvWh8QzDQ4LjKRakQOPA6CS
	BPn/orpGK97U0Kx7fXOiga+8OZdK3+svG2K8fhaLRRFhEfwg3/7OBUq/RKvBGnaI5Egd7iNSxuQ
	/S6EhrJ1DxFRk9788kSXtzwEJ0B/3olWtea5lmD5dRMgBU6cfLcWDOqqWpSX0MN145g32xJpDeS
	MYCTAeunryNW8mgKD5i2RM/hgDH+tmqZvzhwslS/RcTc8v16HZVB5L6K6PSMVtpaUVJRv9uY/ph
	G42MTOH9XfsX3w0ViZDKsN8Id/j92Z5m2vvjKoyzL2OO31Y1aHni8banQyxW1CNeLTe2kiSR/0D
	NL1PXV+4+qMLnZr5jrNRDIo/J0WClFydjGrVOo8aCbz0lNm5lYcCk2/adG+QSvggbC9sONmplyB
	bQe/qT
X-Received: by 2002:adf:e008:0:20b0:48f:bba5:732e with SMTP id ffacd0b85a97d-4abb560e1c7mr30064709f8f.57.1795716203246;
        Thu, 26 Nov 2026 10:03:23 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42265115f8f.41.2026.11.26.10.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:03:22 -0800 (PST)
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
Subject: [PATCH 4/5] gpio: fxl6408: Add pull-up and pull-down bias configuration
Date: Thu, 26 Nov 2026 19:03:14 +0100
Message-Id: <20261126180315.98034-5-gianfranco.mariotti94@gmail.com>
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

The FXL6408 and PI4IOE5V6408 GPIO expanders provide per-pin programmable
pull-up / pull-down resistor selection (register 0x0d) and enable
control (register 0x0b).

Expose both registers in the regmap access tables and wire up the
gpio-regmap .set_config callback to support PIN_CONFIG_BIAS_DISABLE,
PIN_CONFIG_BIAS_PULL_UP, and PIN_CONFIG_BIAS_PULL_DOWN.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpio/gpio-fxl6408.c | 47 +++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index 5132177ab2837..ae9003fc513a1 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -7,6 +7,7 @@
  * Author: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
  */
 
+#include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
@@ -14,6 +15,7 @@
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
@@ -33,6 +35,12 @@
 /* Bits here make the output High-Z, instead of the OUTPUT value. */
 #define FXL6408_REG_OUTPUT_HIGH_Z	0x07
 
+/* Bits here enable either pull-up or pull-down according to FXL6408_REG_PULL_UP. */
+#define FXL6408_REG_PULL_ENABLE		0x0b
+
+/* Bits set here (when PULL_ENABLE is set) select pull-up instead of pull-down. */
+#define FXL6408_REG_PULL_UP		0x0d
+
 /* Returns the current status (1 = HIGH) of the input pins. */
 #define FXL6408_REG_INPUT_STATUS	0x0f
 
@@ -51,6 +59,8 @@ static const struct regmap_range rd_range[] = {
 	{ FXL6408_REG_IO_DIR, FXL6408_REG_IO_DIR },
 	{ FXL6408_REG_OUTPUT, FXL6408_REG_OUTPUT },
 	{ FXL6408_REG_OUTPUT_HIGH_Z, FXL6408_REG_OUTPUT_HIGH_Z },
+	{ FXL6408_REG_PULL_ENABLE, FXL6408_REG_PULL_ENABLE },
+	{ FXL6408_REG_PULL_UP, FXL6408_REG_PULL_UP },
 	{ FXL6408_REG_INPUT_STATUS, FXL6408_REG_INPUT_STATUS },
 };
 
@@ -59,6 +69,8 @@ static const struct regmap_range wr_range[] = {
 	{ FXL6408_REG_IO_DIR, FXL6408_REG_IO_DIR },
 	{ FXL6408_REG_OUTPUT, FXL6408_REG_OUTPUT },
 	{ FXL6408_REG_OUTPUT_HIGH_Z, FXL6408_REG_OUTPUT_HIGH_Z },
+	{ FXL6408_REG_PULL_ENABLE, FXL6408_REG_PULL_ENABLE },
+	{ FXL6408_REG_PULL_UP, FXL6408_REG_PULL_UP },
 };
 
 static const struct regmap_range volatile_range[] = {
@@ -96,6 +108,38 @@ static const struct regmap_config regmap = {
 	.num_reg_defaults_raw = FXL6408_REG_INT_STS + 1,
 };
 
+static int fxl6408_gpio_set_config(struct gpio_regmap *gpio,
+				   struct gpio_chip *chip,
+				   unsigned int offset, unsigned long config)
+{
+	struct regmap *regmap = gpio_regmap_get_drvdata(gpio);
+	unsigned int mask = BIT(offset);
+	unsigned int enable = 0, pullup = 0;
+	int ret;
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		enable = mask;
+		pullup = mask;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		enable = mask;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	if (enable) {
+		ret = regmap_update_bits(regmap, FXL6408_REG_PULL_UP, mask, pullup);
+		if (ret)
+			return ret;
+	}
+
+	return regmap_update_bits(regmap, FXL6408_REG_PULL_ENABLE, mask, enable);
+}
+
 static int fxl6408_identify(struct device *dev, struct regmap *regmap)
 {
 	int val, ret;
@@ -126,6 +170,7 @@ static int fxl6408_probe(struct i2c_client *client)
 		.reg_set_base = GPIO_REGMAP_ADDR(FXL6408_REG_OUTPUT),
 		.reg_dir_out_base = GPIO_REGMAP_ADDR(FXL6408_REG_IO_DIR),
 		.ngpio_per_reg = FXL6408_NGPIO,
+		.set_config = fxl6408_gpio_set_config,
 	};
 
 	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(fxl6408_supplies),
@@ -148,6 +193,8 @@ static int fxl6408_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(gpio_config.regmap),
 				     "failed to allocate register map\n");
 
+	gpio_config.drvdata = gpio_config.regmap;
+
 	ret = fxl6408_identify(dev, gpio_config.regmap);
 	if (ret)
 		return ret;
-- 
2.25.1

