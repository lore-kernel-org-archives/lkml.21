Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797667;
	b=qDs/NMF2Pq13LW+Q0i8IMgN9wZ3GWdKeinv1I8tKGfrTPC2N5t8X5qDQsWk0s5zlWmtL
	 xot+yRq2V7iolQzU8ok/TlybTGu96g+wbuLWg/4ray0du+Nt8Fs5+Z0j5ojYrRT5/ELEL
	 QjQ+vD03xFG1Mvpc9JkAgAKZ58CtM8AJf5KCHoQV0UmLPMdgdp0kDmQUxxToK7owM0uN1
	 y0MYE1ThFB5vyHpKQ0QLtWhkUePfOk5fBn7gy1jy/eatH7LV18qAHZbVAbRz61Bj5iLQL
	 sRWwUChVfyaueh1XzyECG8L8I399hgnrYAjabojvpJrNTf0EpDxqVwo20G8LZlntKPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tVdKswOr4QbIStLqt2YNrog3pYH25T6MktJu3RrelFs=;
	b=GAY9TKuLIg4SSDia6YMLeW0b19sOgE0UkF5p05EY1g7D8WMk8Ygyus5gs5+6IDfZytb6
	 SdX6gcdDDt0y4sX2s2ql/beiMfYrqlY69We6yWCc8nOyyuo1SyMkHvsLK07Ca5VEthOEC
	 YJNieDOH75QXiZaJ+BoYr8+unJzEbPWkJK70wVcgW/pyQ9szC4aFE37Fm5+xVSDvQRHZw
	 hjrYyprSRxPL2D4FSQn1F9G68oNMZKb9sweN9MYNaclxnLbX7FCXYZniej8T6XJ1kYU2E
	 KuuGPQtD3OYnZQgOWPCa6TV9YLJj4hfXrPE+h1js4bdcImsOU985YOD7GvA2Dq0uzbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SAzARD90;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9AA606A698
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA9AA606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SAzARD90
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so1498046966b.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797665; x=1796402465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVdKswOr4QbIStLqt2YNrog3pYH25T6MktJu3RrelFs=;
        b=SAzARD908+TAzFuSujRb+2qMkI6QeDM296Yo8V2k1kR5aDFecQEjqUy4FHCim6eE2x
         NFZBTUgpm59YD06nFIoEYylyKUgR+xw8LSdMmiM8jnfc5ma2D4V4amCW7y0TV0qVB+vM
         XAst99r/v6J6m9uotibX/BBnWsjNZKvuMjL/eLDpxYzaJlSumNv0LqaLmb6MgBdSFSBp
         C/QD43XRZCPwc6WOg6f/p13qh3axcbD7nBGbGC44aZsrjuzGof2Sut0CS7S2tvtOtRf4
         t3fdKfpSIUMxg8Fgo1enpKmAW+pWETaDZOpQw7pvqxVn9ljUKVeebGZQToIAop+GQwpl
         yyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797665; x=1796402465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tVdKswOr4QbIStLqt2YNrog3pYH25T6MktJu3RrelFs=;
        b=W2UBSNkJ0YlFTs9T1BMMjhnStI1BrLmrGyq/pxQH9H9YDLYneM8usXrD/nwQ2EUxqY
         /Hj8cVur5OR+304u4Vu30z4L8wiNVyYV3TO1Vdl4s4aJwSum4W7AvOWtVNrbEO5+Idu0
         w6CN2hr+jb3mSyTLlXdmj8p/41G+GTnSei9NYfoGoalVn2S5oJkCdesPvEk1hqoBqFIr
         y42SULz4Wa86hj7bJL+c550kiSI2o3rsfWTkt31Rbs8dY3S56NXgPURBWcVsZEcMl5vz
         IPpCljlkQKFQEz02A/IISOECtd77pveGgknG4EnJ0VX/CvlkmVQ0xgALaqyUjOVjlMFS
         PtTg==
X-Gm-Message-State: APuU4Z9Dy/FXtpmoRbGsN4yAmtNDsgaWEu32FZnYL5MjA/zLxN/aGqc2
	c0yF6lW347lXiq+rpFKOU1H/cWeeA4/0RKMET072yffYzKbLiqbpo+Zt
X-Gm-Gg: AZFdTZc+li06dPCqF+SSSvJfrI1b+O9+0P5i8r0sih+MWW3+aN4ICjlQuTBaeqXFLtG
	0Ur975WY5ZvUdjmXenFfYSJQ39v+qEky7r+11G7Smo57MUoXG5saWgmQTFLGJxhxbCm/xmqylhN
	zb5pQkHSIP2USTbd5kNMgvDAO0dbG/p3wnueU207U/dmQemJ2Uv6+ukINdAd39aM5xj9yNntapp
	suepqKu93Am8VXozJ9iSu5UkL3X3/YNX7DvsmHPuNwLUOTTAgnpqKyLw8aeQksFN+ckc8GPGGN2
	pLujKHcbGy4lhtr45mBH/aY87l6bmDgWAsmPCz4NESS6CrIJH4yL/g4Gd9wOou4PY4Tz4VZ3C+U
	p1M1wvLlHhaUuJuvnJSj/03MMkLu8mTE+f4HYCirRFoIy6sliQXgdx9Gx9rjbKvsgCz9dm9DJ39
	uc+ETJv8KE9KKOk9j3S7sjWGWkZSj9k4p1CEqpxiC0a1/pc/mmlzglz+VArZ9ZtEQv5Pz+mUZWO
	4WL7GbI7E5446s8PkkTopzwfub/4use03TeaR35Xn+KtTB7sqFHjkMLTtB/BcDbeph/O7yZj0WH
	Suu/zOzpE0lJwLuA9a/FWrPSBSuzoBXMHqu1dFn2oz6JD1pV0Xf0z8R62lPkwT46abqDePhJn8k
	jpYBpSv3dCg==
X-Received: by 2002:a17:906:3814:b0:c41:cf68:bbcf with SMTP id a640c23a62f3a-c513ab497afmr1478444566b.32.1795797665052;
        Fri, 27 Nov 2026 08:41:05 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66674sm885397966b.15.2026.11.27.08.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:41:04 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 2/6] mfd: max8907: Switch to resource-managed versions of helpers
Date: Fri, 27 Nov 2026 18:40:40 +0200
Message-ID: <20261127164044.285910-3-clamor95@gmail.com>
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

Switch to resource-managed versions of regmap_add_irq_chip() and
i2c_new_dummy_device(). This involves probe refactoring in order to
remove jumps and allows to drop the .remove callback.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 140 ++++++++++++++----------------------------
 1 file changed, 46 insertions(+), 94 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 1ecfb313757cc..8091514c28aa1 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -187,117 +187,70 @@ static int max8907_power_off(struct sys_off_data *data)
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
+	struct device *dev = &i2c->dev;
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(i2c->dev.of_node,
+	bool pm_off = of_property_read_bool(dev->of_node,
 					"maxim,system-power-controller");
 
-	max8907 = devm_kzalloc_obj(&i2c->dev, struct max8907);
-	if (!max8907) {
-		ret = -ENOMEM;
-		goto err_alloc_drvdata;
-	}
+	max8907 = devm_kzalloc_obj(dev, struct max8907);
+	if (!max8907)
+		return -ENOMEM;
 
-	max8907->dev = &i2c->dev;
+	max8907->dev = dev;
 	max8907->i2c_gen = i2c;
 	i2c_set_clientdata(i2c, max8907);
+
 	max8907->regmap_gen = devm_regmap_init_i2c(i2c,
-						&max8907_regmap_gen_config);
-	if (IS_ERR(max8907->regmap_gen)) {
-		ret = PTR_ERR(max8907->regmap_gen);
-		dev_err(&i2c->dev, "gen regmap init failed: %d\n", ret);
-		goto err_regmap_gen;
-	}
+						   &max8907_regmap_gen_config);
+	if (IS_ERR(max8907->regmap_gen))
+		return dev_err_probe(dev, PTR_ERR(max8907->regmap_gen),
+				     "GEN regmap init failed\n");
 
-	max8907->i2c_rtc = i2c_new_dummy_device(i2c->adapter, MAX8907_RTC_I2C_ADDR);
-	if (IS_ERR(max8907->i2c_rtc)) {
-		ret = PTR_ERR(max8907->i2c_rtc);
-		goto err_dummy_rtc;
-	}
-	i2c_set_clientdata(max8907->i2c_rtc, max8907);
-	max8907->regmap_rtc = devm_regmap_init_i2c(max8907->i2c_rtc,
-						&max8907_regmap_rtc_config);
-	if (IS_ERR(max8907->regmap_rtc)) {
-		ret = PTR_ERR(max8907->regmap_rtc);
-		dev_err(&i2c->dev, "rtc regmap init failed: %d\n", ret);
-		goto err_regmap_rtc;
-	}
+	max8907->i2c_rtc = devm_i2c_new_dummy_device(dev, i2c->adapter, MAX8907_RTC_I2C_ADDR);
+	if (IS_ERR(max8907->i2c_rtc))
+		return PTR_ERR(max8907->i2c_rtc);
 
-	ret = regmap_add_irq_chip(max8907->regmap_gen, max8907->i2c_gen->irq,
-				  IRQF_ONESHOT | IRQF_SHARED,
-				  -1, &max8907_chg_irq_chip,
-				  &max8907->irqc_chg);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add chg irq chip: %d\n", ret);
-		goto err_irqc_chg;
-	}
-	ret = regmap_add_irq_chip(max8907->regmap_gen, max8907->i2c_gen->irq,
-				  IRQF_ONESHOT | IRQF_SHARED, -1,
-				  &max8907_on_off_irq_chip,
-				  &max8907->irqc_on_off);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add on off irq chip: %d\n", ret);
-		goto err_irqc_on_off;
-	}
-	ret = regmap_add_irq_chip(max8907->regmap_rtc, max8907->i2c_gen->irq,
-				  IRQF_ONESHOT | IRQF_SHARED, -1,
-				  &max8907_rtc_irq_chip,
-				  &max8907->irqc_rtc);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add rtc irq chip: %d\n", ret);
-		goto err_irqc_rtc;
-	}
+	i2c_set_clientdata(max8907->i2c_rtc, max8907);
 
-	ret = mfd_add_devices(max8907->dev, -1, max8907_cells,
-			      ARRAY_SIZE(max8907_cells), NULL, 0, NULL);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add MFD devices %d\n", ret);
-		goto err_add_devices;
-	}
+	max8907->regmap_rtc = devm_regmap_init_i2c(max8907->i2c_rtc,
+						   &max8907_regmap_rtc_config);
+	if (IS_ERR(max8907->regmap_rtc))
+		return dev_err_probe(dev, PTR_ERR(max8907->regmap_rtc),
+				     "RTC regmap init failed\n");
+
+	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_gen, max8907->i2c_gen->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_chg_irq_chip,
+				       &max8907->irqc_chg);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add chg irq chip\n");
+
+	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_gen, max8907->i2c_gen->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_on_off_irq_chip,
+				       &max8907->irqc_on_off);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add on off irq chip\n");
+
+	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_rtc, max8907->i2c_gen->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_rtc_irq_chip,
+				       &max8907->irqc_rtc);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add rtc irq chip\n");
+
+	ret = devm_mfd_add_devices(dev, -1, max8907_cells, ARRAY_SIZE(max8907_cells),
+				   NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
 
 	if (pm_off) {
-		ret = devm_register_sys_off_handler(&i2c->dev,
-						    SYS_OFF_MODE_POWER_OFF,
+		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
 						    SYS_OFF_PRIO_DEFAULT,
 						    max8907_power_off, max8907);
-		if (ret) {
-			dev_err(&i2c->dev,
-				"failed to register sys-off handler: %d\n",
-				ret);
-			goto err_sys_off;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register sys-off handler\n");
 	}
 
 	return 0;
-
-err_sys_off:
-	mfd_remove_devices(max8907->dev);
-err_add_devices:
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_rtc);
-err_irqc_rtc:
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_on_off);
-err_irqc_on_off:
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_chg);
-err_irqc_chg:
-err_regmap_rtc:
-	i2c_unregister_device(max8907->i2c_rtc);
-err_dummy_rtc:
-err_regmap_gen:
-err_alloc_drvdata:
-	return ret;
-}
-
-static void max8907_i2c_remove(struct i2c_client *i2c)
-{
-	struct max8907 *max8907 = i2c_get_clientdata(i2c);
-
-	mfd_remove_devices(max8907->dev);
-
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_rtc);
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_on_off);
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_chg);
-
-	i2c_unregister_device(max8907->i2c_rtc);
 }
 
 #ifdef CONFIG_OF
@@ -320,7 +273,6 @@ static struct i2c_driver max8907_i2c_driver = {
 		.of_match_table = of_match_ptr(max8907_of_match),
 	},
 	.probe = max8907_i2c_probe,
-	.remove = max8907_i2c_remove,
 	.id_table = max8907_i2c_id,
 };
 
-- 
2.53.0

