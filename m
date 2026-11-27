Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775873;
	b=jtr6RjyIEVqu084BeHGk3pwcadzL/6kaO0Iz7EMIVCpeO+tWokfS8C9Dg6N3xHy6LjMY
	 qetkjH4+mxQkdEQ3r1N6XElXg36htfyyZo1iQzT2cQdC9mZyVgFSDrehvYS43yl3aLTy+
	 e/h60Th6XVxo7FqfrKewDNN0xeZAhmDR6ROyhjyG3Nl4ThMnAfPBapgBKD64xCmK/dh9B
	 cz31lJ2IGU9jGj2Hv58N7mcME4vY25ZbAznjR8hz/GAfdPVYmjYSWW3p99Ac9soK5P5MI
	 eFFR3NgJ863l6b3Ym7b67i30dVvqtntjnvUYBlCh4zmASXk07j/46EwjZH/dPcafCrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WCcSULvlLrU2xkg1gi/cTVgyvaGO2KEpoODvKxtBE20=;
	b=IoUyJ+lyjHS1d13ChB0TFZ5zXLz3JB6Shnt/u89DPszDY/lwS3DET0lpVpiaBlbEANLx
	 3Ujef8qmZrnwe4CAz1tJ9r4yvEJNNzDdICH6sydu7GYWdQ3tj1ctxxkXs3mfbQoK9zu4r
	 bBDOpc7kriHJs8//HJZejGA+0iSLX1IfZ2dcse3RUW4qm88zfgzpK+ua8jL6vGGmAdi6+
	 yyrSd/753ecA69dgQLVxxiVF+WDId04+/LD4Be0MkMPrkGtzuCxppf/mqAD+MDQjJGoXm
	 BOteZ8juLA/ZUkDEQzhCxBxAFDbV3f6/WN8Nv3ROyy1i+3gfR8FyGFz1tXq8Gsk8xbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NIrCPSEl;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3BB606A680
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C3BB606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NIrCPSEl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-498f5fa5103so4713383f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795775870; x=1796380670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCcSULvlLrU2xkg1gi/cTVgyvaGO2KEpoODvKxtBE20=;
        b=NIrCPSElnrFTxBATM+z8hoHRHYK88zwdJjrZqOLLwIDUT4P7tAb5EZq4qt7y8V8iJu
         PxiZ9fOFToBiWkzyNEh2URfrC6T9xkdK1c7Bii2OACATys34l4WEhpLUaOeW/e65DpzB
         tSjl4jyokPeLj7fxe2MXm4NfeWuFmLsUCyQ13sVnuObsNlqpN7InUfB3Fc6vYNZtLsNh
         Bu3CYF+f1Xbp/m/xMQdLbHFFpTZ9VjR1H76EESoWifpDpEjuk7h+xsuLsOREviwm/bsR
         jImlWjzj6l33e1ksM8c7dL1ECozjgs1wMfjhv8eYOIR5M2docacTWsEy5lpgbgDVWZon
         iVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775870; x=1796380670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCcSULvlLrU2xkg1gi/cTVgyvaGO2KEpoODvKxtBE20=;
        b=lIPiKKjhN7ygLsMVqw6x3+bxPSEM+k5mwl/ksG8d28ZkrU0zZP9I3UdSBfc3qp8b+y
         4uxNCi56Zfk0DXjM7FCFbUC/VUK5K4dViaRF8+b4ID3zZ8BknrH19Za0Ycc0sDhg7xEl
         WE5qgx+z+Zi12SeRdjt4P3o6x2h9ABitx+k2y0xAQhF0Vva7fpPHqjZdd1XFXGtvft9U
         aTAXck3aZLnGD4ovBWKYWZNodWkCKTqqRqXJpjx9LHhMepofg3HvWuShDzvFHVsGsJLF
         K5w+O2dxeFf9fuqVFbL1+0QO1q8VsK27y0NT91BXyn3I2awrKylRemQQZGeMslEtQiRY
         15dQ==
X-Forwarded-Encrypted: i=1; AL+hErGzNr71Lq908oAlNf3wjm/CsfX6Igy2/qRF3e8gd8pHg0UzgFLLXPLlrlrEFBNyLQXtebJ68BN5MT/mLfM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9u2XhQOKYkG8cVy+RDdVIcplISpTjTPaoDrLtWaoEIhDYf1+MH
	D3EJx66bXYtRH1SokfwyA3yrPHz53V8kSKi4/dnV7BG6AeBMsYp66Dup9VptMcMwrIU=
X-Gm-Gg: AZFdTZcdDoJHDYY5X7B9MqEMG/N8cjCOgxvHgc6ZaDhfa5yS6oPSxrPY974z8lHGkxq
	iM6xiShENtJeEhN/P1eZTQwcRJBcqjeU/xSzxLOCbFFBienJWNspZ8qrpMfydjuNg53+fGTSfgI
	xaPEu9ZEx20v3C+Zt1FdGjIWp7s57dliBbcRBThVYFObExw52PJkXgCD8npsI565OaK4iSvI3yM
	fZlgrkfSh+ttDtyoTJ5XQsLFVOHNMCCEGKK0ariFoFS1MNsk229CPYO9n46TFS7RgSzieB/NYHZ
	+k51IBY1knS9UXEVPZDSk5BBM0bx+tIkEBjQIP1Jo1lFRgI7T/lexJQovi7saOIQbjC6gadaCOb
	yQDzqEN/JQf5294ylXNCiXqKOuLvQEjDG2URa31+XHZE2OYbk+O57qteXQFFyMkYIlLNIQyNvCX
	javHmByw06KYkBocJXcQFZvDsR1nxesaVeQO8/v3dD5m7ill/9qkRT0bBHVMoD4IJVvUOPZGkU0
	+9cog9yTXgfXtnYLVitFm3SKz3RXeevD/3ruzv9tbGw0taOv4EPn5CO1b74w07tSRRF9cei9gAB
	xro5HG97u0xlrr84K1/xlagD/Le8+qnkp1R6xxqRm3/IZ2yP
X-Received: by 2002:a05:600c:154f:b0:4bb:6842:66ef with SMTP id 5b1f17b1804b1-4bb8893a963mr460358005e9.30.1795775870518;
        Fri, 27 Nov 2026 02:37:50 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm714014105e9.2.2026.11.27.02.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:37:50 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 27 Nov 2026 11:37:36 +0100
Subject: [PATCH v9 2/5] mfd: axp20x-i2c: Fix i2c instantiation
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
Message-Id: <20261127-axp318-regulator-v9-2-986b68f3c4a0@baylibre.com>
References: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
In-Reply-To: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3852; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=avi9IFPWiAVWFQGWnKZC1/X7ESTAnJfLwhLIKQW4SsE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcsVVhMxhMbT/PLffc79DFJs35NFVq1YLVnuuebn1+5
 Hj3/ljHjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEzEuIKR4XRDS7tcT3j0nqUL
 DoZpf2VVFhBW+DM5+vAiscvnzfeeU2f4nzKj7Ne6+M/bj72e8KFGMt3Ssts64egR05+lu+8LXXd
 YywQA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Apparently this device never really supported i2c instantiation via
sysfs, because the driver does not even look at the i2c device data,
which are not set. It would only probe if the device matched through DT.

Fix that for correctness, even-though it is probably useless.
Add the missing AXP323 while at it.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel.org
Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loading")
Acked-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x-i2c.c   | 24 +++++++++++++-----------
 drivers/mfd/axp20x-rsb.c   |  1 +
 drivers/mfd/axp20x.c       |  1 -
 include/linux/mfd/axp20x.h |  3 +--
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index 9ddc73b8af43..aac4fe03f7dd 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -35,6 +35,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c)
 	axp20x->irq = i2c->irq;
 	dev_set_drvdata(axp20x->dev, axp20x);
 
+	axp20x->variant = (kernel_ulong_t)i2c_get_match_data(i2c);
 	ret = axp20x_match_device(axp20x);
 	if (ret)
 		return ret;
@@ -76,17 +77,18 @@ MODULE_DEVICE_TABLE(of, axp20x_i2c_of_match);
 #endif
 
 static const struct i2c_device_id axp20x_i2c_id[] = {
-	{ "axp152" },
-	{ "axp192" },
-	{ "axp202" },
-	{ "axp209" },
-	{ "axp221" },
-	{ "axp223" },
-	{ "axp313a" },
-	{ "axp717" },
-	{ "axp803" },
-	{ "axp806" },
-	{ "axp15060" },
+	{ .name = "axp152",	.driver_data = AXP152_ID },
+	{ .name = "axp192",	.driver_data = AXP192_ID },
+	{ .name = "axp202",	.driver_data = AXP202_ID },
+	{ .name = "axp209",	.driver_data = AXP209_ID },
+	{ .name = "axp221",	.driver_data = AXP221_ID },
+	{ .name = "axp223",	.driver_data = AXP223_ID },
+	{ .name = "axp313a",	.driver_data = AXP313A_ID },
+	{ .name = "axp323",	.driver_data = AXP323_ID },
+	{ .name = "axp717",	.driver_data = AXP717_ID },
+	{ .name = "axp803",	.driver_data = AXP803_ID },
+	{ .name = "axp806",	.driver_data = AXP806_ID },
+	{ .name = "axp15060",	.driver_data = AXP15060_ID },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
diff --git a/drivers/mfd/axp20x-rsb.c b/drivers/mfd/axp20x-rsb.c
index dfc665f696bd..e48cae751fb1 100644
--- a/drivers/mfd/axp20x-rsb.c
+++ b/drivers/mfd/axp20x-rsb.c
@@ -35,6 +35,7 @@ static int axp20x_rsb_probe(struct sunxi_rsb_device *rdev)
 	axp20x->irq = rdev->irq;
 	dev_set_drvdata(&rdev->dev, axp20x);
 
+	axp20x->variant = (kernel_ulong_t)device_get_match_data(axp20x->dev);
 	ret = axp20x_match_device(axp20x);
 	if (ret)
 		return ret;
diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 4d770e718716..de6946d4bb13 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1267,7 +1267,6 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
 	const struct mfd_cell *cells_no_irq = NULL;
 	int nr_cells_no_irq = 0;
 
-	axp20x->variant = (long)device_get_match_data(dev);
 	switch (axp20x->variant) {
 	case AXP152_ID:
 		axp20x->nr_cells = ARRAY_SIZE(axp152_cells);
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index b352661d99a1..1badb4868d17 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -997,8 +997,7 @@ static inline int axp20x_read_variable_width(struct regmap *regmap,
 /**
  * axp20x_match_device(): Setup axp20x variant related fields
  *
- * @axp20x: axp20x device to setup (.dev field must be set)
- * @dev: device associated with this axp20x device
+ * @axp20x: axp20x device to setup (.dev and variant fields must be set)
  *
  * This lets the axp20x core configure the mfd cells and register maps
  * for later use.

-- 
2.53.0

