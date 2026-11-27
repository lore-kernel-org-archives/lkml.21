Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797670;
	b=mDL22pQ8ra0PkF355q78CY30Cp0wi+XEZFsNnQ/Gm5PdO5GkKIWSUGh/LRCUehH2y+fm
	 og0I2V/7VVHXCSdtQWM6jWqJym4HOdt0EtGyxhNlLBlGHLkhrnNkjfvdBr80rB+oMzkNA
	 83mGlzCBc56m1LFhdSVPuTH1fX3t7OZ8qN15zvIvIvP1Ii1vC9ht9xFlfm+nAiQstLWgi
	 A5RwGY4x/SFMRSRyifu/dr64435Zdl+WoSlHla8zauVPDs51WeMKH1NVBJa1PZKtlCSaY
	 3QRlei9tBh10/11fs1ep2Hv4UD/n5F+rl//EAj0U/bgA7EJRmKeHMGhRgq5J8uOvt7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uG5JxLGrv1nNKZ+yQ+rxZ9VqDOk21eO6r4YsffFQfF4=;
	b=TQkFEDtVB5J86OS14gojFbGJq7K0Qo5UB2lFCvS0TpDRxfrv63qeyrhbMItoLM5fPYUn
	 7tDd+P51Kn7uy9DDCO3wH4gH+0GYHmHb3qzjdm2PZ/JSEf8GflW90LDD8WmxRZ+kyaM9M
	 a3Mg7NaMDVIXWc4wKftmWlB42InwATaT1o90ypIrsLMBLg61IiKXCmwlWT/5Ef20binv3
	 t6rt3XR0kJC2/9tgH6AqA0FXRwzj6amzSlgwwHNzmlGQGtRWWW7cKPJFlbbuELnXkZ/tB
	 a4ZdlmPQHIEWWKGOTpwefqbarQtKkYLHXfAIApN7sR7petKZ2bdF1Ac1K5LpQzr9+LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wi+px2ps;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901F2606A687
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 901F2606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wi+px2ps
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so1327817366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797664; x=1796402464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uG5JxLGrv1nNKZ+yQ+rxZ9VqDOk21eO6r4YsffFQfF4=;
        b=Wi+px2psv7dM2t9qiCLWY8namt//C717F5jZAm1ss/PIcD2l7NPEcp1hc6t/f/Bzga
         o4nI4X6QOdmgr79QAGo85IDo3Q1whOx15wy9r8/TXbegdITrR67gt7wG1hVKYh9ds/7e
         U22jmZhPkU5z0thbwbmwkLGfgXgZTg4JXQ4U4fAagT1hoCT36azrrE06F61krb9k/GiW
         /ITGuVoiyc4vz6xcClA1TSoq6z+KQzlorvpxJEWT7FRaCkxM8M09VtlyXsg1GZ6k77yL
         APPlPIalJ5mqUeoRzWJY2WNhTCzP+wKyjM3Hv3wiJ0z0/LzEz11BD8S+qOB7aixBxcDK
         xAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797664; x=1796402464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uG5JxLGrv1nNKZ+yQ+rxZ9VqDOk21eO6r4YsffFQfF4=;
        b=2NCcHGlPnuDkBMqg2GS4aWiy8tRJn+gbwC/3IMV/1Im8FjXZ3kCTjm3yErX6YCZA8u
         yEK35oNY7CtqU7IahFXWCP+RPgeI5IdF+Z/Z6z2hJh97/9nn6FOt4x3sGJhRofmYCNlS
         deX4eO9SjEerYRyH5b8iXZweH92/KwFpKBsNzeZ6xiBVzBGFnL5huJdqmDAOqFPDcVMa
         ZPt1rGSSnulfVjWZepmAVOJSS4VoWHNY1msD7/mYM0uckqEbSM3VWtpAj8LnzXixRDDb
         hm+EpjLyzITKWwiP5zgO0m2xD39Q6O06liJ7fmwfxNVHBLknEM/ZFzoSFxjjdROYSnIg
         rqOA==
X-Gm-Message-State: APuU4Z8fFrRtFCjfb1FXwnReCZpWdySHQNbahyEZer7wvMNqzjdJRlpZ
	P7sYtDQIxCWRRnddcRbiNQq1RpzqOUPQvQSMjDZxfFnAJnEdtrgAy7Uq
X-Gm-Gg: AZFdTZf4yxT8oDxeL5oaShS3WTUOc0G0yrMpKbwXElMItteXN6ScZcULJSTgIDiQWwU
	SKE0NExHyH+EhA/w35eojsNqdU5E7TYfxKRW3qE+HVnTCC/dSSnKNvXVSksNLFHmhXXUUXZcFgE
	cE23KVZGhIfdfBfDo1Bj9BtOxUo1JRzxgOr2JZEKO70ipjf0XGlfTmqGkmQFEIANO2fvs/2cmLD
	AKmzwWqAX2qWQtmHG6PZVFxf3T4CFIj69CaP9U+/mzWU+Er1/rbIaTzD0ysW7mvRe4MJei6myRU
	D9vicxJePmMA0ebk6xdFPOrfSs3xu5OQuAt4+Es0ztZFHlDV2+wuwT8dM7rILdZSKsfgPXjvnj8
	TGH3fw0k3lPxvokIsjuDcI4lgyDiHwq1+DI2opPrTWRaUs1kwA2gMQRBtsYHKx1CLU5SCF9aiUP
	fInm90rC20N7yXFs2BTkBdZFPJcL+DEeFaFXtLJQItdNYC55qMCxkwUQzfth5VTu9fS9rH5y5G5
	Ch9bczwu7bx7nji3TNasJKfY4vBN4Ijdwie7xVoB+SVczZHuCM1w0pKg0+JHbwQJOmKLWEdyZSD
	NmJVlpdVC1UtoE0S/PU6/DiRxanr8wyv9ts8nzHAaIE0g8zewIO3jSjGcOKhIM5avYt+Z4JR7gc
	gcDUm/E2LWw==
X-Received: by 2002:a17:907:60c8:b0:c51:de44:dcdf with SMTP id a640c23a62f3a-c51de44dddemr248191066b.43.1795797663954;
        Fri, 27 Nov 2026 08:41:03 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66674sm885397966b.15.2026.11.27.08.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:41:03 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 1/6] mfd: max8907: Remove platform_data based probing
Date: Fri, 27 Nov 2026 18:40:39 +0200
Message-ID: <20261127164044.285910-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127164044.285910-1-clamor95@gmail.com>
References: <20261127164044.285910-1-clamor95@gmail.com>
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

There are no in-tree users of this driver, but it supports devicetree
based probing, which means external dtb files may exist that work with
this.

Remove the unused legacy code and make this a DT-only driver.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c                 | 8 +-------
 drivers/regulator/max8907-regulator.c | 8 +++-----
 include/linux/mfd/max8907.h           | 5 -----
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 88d2448ae3a31..1ecfb313757cc 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -189,13 +189,7 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct max8907 *max8907;
 	int ret;
-	struct max8907_platform_data *pdata = dev_get_platdata(&i2c->dev);
-	bool pm_off = false;
-
-	if (pdata)
-		pm_off = pdata->pm_off;
-	else if (i2c->dev.of_node)
-		pm_off = of_property_read_bool(i2c->dev.of_node,
+	bool pm_off = of_property_read_bool(i2c->dev.of_node,
 					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc_obj(&i2c->dev, struct max8907);
diff --git a/drivers/regulator/max8907-regulator.c b/drivers/regulator/max8907-regulator.c
index fd227fd136121..84de0c443c945 100644
--- a/drivers/regulator/max8907-regulator.c
+++ b/drivers/regulator/max8907-regulator.c
@@ -274,7 +274,6 @@ static inline struct device_node *match_of_node(int index)
 static int max8907_regulator_probe(struct platform_device *pdev)
 {
 	struct max8907 *max8907 = dev_get_drvdata(pdev->dev.parent);
-	struct max8907_platform_data *pdata = dev_get_platdata(max8907->dev);
 	int ret;
 	struct max8907_regulator *pmic;
 	unsigned int val;
@@ -312,10 +311,9 @@ static int max8907_regulator_probe(struct platform_device *pdev)
 		struct regulator_dev *rdev;
 
 		config.dev = pdev->dev.parent;
-		if (pdata)
-			idata = pdata->init_data[i];
-		else
-			idata = match_init_data(i);
+
+		idata = match_init_data(i);
+
 		config.init_data = idata;
 		config.driver_data = pmic;
 		config.regmap = max8907->regmap_gen;
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index 82e195fefc6d7..35b2ede54f856 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -227,11 +227,6 @@ enum {
 	MAX8907_IRQ_RTC_ALARM0,
 };
 
-struct max8907_platform_data {
-	struct regulator_init_data *init_data[MAX8907_NUM_REGULATORS];
-	bool pm_off;
-};
-
 struct regmap_irq_chips_data;
 
 struct max8907 {
-- 
2.53.0

