Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446170;
	b=MwlVSyfr4MEmLqOm6/8Xgw/ltFZU9AazeMQa5J9fiOG5wEX6RnI1GV10ju1AZFSkx7ph
	 3XsBBFlpa8IhWC+fs4wEccABuft4zRQvGbnR88OanbjWOHJmKL4RNAtBsG3wMnZ6dBFK7
	 QCESit/4nLAVrZri5FGtqv326upivFGGEcncE81bCNjX9U3QE+HPOcvyXwnzDoF3SNjVf
	 cOWdIcIyjfSwuBFkyxr7A7jIeddbsHVNm6OveN8bUpOFTk3UeaHxUSrj2rzRKgla+w5Ef
	 jOAVjMfC9odgb4xLOLmk2trMFMmUSFLkTLlGGIHyi+JcHeM1GgQQXXytYSoCClIZPlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d1ZJTOlPpkmyEezbE4KbgiuX0pNhZ8GISGXxCw031pI=;
	b=Mac0vvYu0vSvNoY8f4b+hvNIVQ70j5GI/3gx1iejvhpHP3q/ZUI6f92bA8PCoLZZo87z
	 gExUoCAxhLavcY5IUDq/KX8496FnvDiQEnJjhy0qBOkAmx4G1XlSyYPrnRgKJi9TKXzDb
	 g3rJtIS0FJxnp1a0nIOGfKXoxeunbGEWwICoprKTTrDAqZmm3A5B1t+gyxLFymJWOuc1w
	 MPQKZZDgRHkQsuF+uo/h60QTw0gL5fIFSYKmFos03zU2uD/DSNgXCf304RjKO+7Sk60up
	 Jb6iGDRCRQyng7qlmQGdRLFj40nq+h7iHTFvEBOFQI7sJbxQGkAz88MAr3m6hMHb+8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xgRDaRR6;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C9D606A6A1
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04C9D606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xgRDaRR6
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6bab10844b5so1792695a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446168; x=1796050968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1ZJTOlPpkmyEezbE4KbgiuX0pNhZ8GISGXxCw031pI=;
        b=xgRDaRR6AiWu1uvekbWWw56DHIJ+VJTDZSK6uAo+Gi6MFXXP6Xd3HbI2XbKjrP2Try
         9jHUdy0UnyYxfNwOJNcH+vQ0IpngVnQ0QpX/wS8P7cGYQqQAGub5B6qBJxK4J9t81n0g
         Md//A8EXWx7kg13Z6EDENTwJvnIU0xoLW2MIi9v5WTTx9PAniKRmwfXg++XVSA7evOJ1
         bO/iF6LLPa3ltaOYUny6/VhiHHPlsVBWadg4dYebmjEJ49EM/KRIKyWV8KBDBROH97P7
         2PiVfNGoAtVj2rmNaTN2UVTc8kAPxg2wtKbg2s5Le747DAHibhMTuW8xLxxKOMBY8ZDG
         TvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446168; x=1796050968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1ZJTOlPpkmyEezbE4KbgiuX0pNhZ8GISGXxCw031pI=;
        b=mcv7DBSR1P4o49DH69xkkeEyD+kxng19g+28j+zSroFiROf8YsxbBlywjI8ATQPOva
         t44eynvhzL1a5+KYyupdITv9VPXG3+zHoanKw+coUqs1zKSJIiyY89QdahQ56ShYOsDf
         BPmb2xuzCkD6ZTuFaRhAhjRn51IuQu1VO2vJbRSu2a2hcteJWnfjoajgx6U8en+mR0Ac
         I/h1oiAbYp6RNx/ySTbypbyv/N2j2Fdflaa+yejuL07Zq/YZdn+kUEbmfI5i7LN5fpxW
         +ClnwQlpeTRiksLOph8p6Y3L8z03LyqwrtY1WFY3Qr+NjnbFlSztrO37LYwpcZomLhAo
         W4cA==
X-Gm-Message-State: APuU4Z+91Nb9SJe6LdQpsaZYmEeY0TAlSLOecfBwhmNFxSwb2lRy786p
	TVZAw2lin2xpPMw7ibDw+8W3bCx3u8R/uTFvnwHd+M9st1Js6WvbsVZD
X-Gm-Gg: AZFdTZe9SFkyAHbFHMyuwB3GyzOxfgHSJM9ByKEjf+2t4/3ReZcD0Jh+SfEV2easlgp
	kxczet0jmNO2P92oqjd7PWluHB8/EAZzONum1+Q2F7r8QGxBl8RleDCLskIpIA+BRZP+DEdBWxX
	ecbPxlzyR73VnUhD91FgelWEJzCjqzNWNMNY5hFxtHpnHtpa4g+obPl8A5VW887rwv67ENIYB58
	OK/29fpQMgk5FwJ+DtxNPwYCxVvH/Y1puWByyw+zXwX5SmHDfkCwnhtMrQTFRqhz8F5keoqpZ83
	jY0//qiJxYKchwvvdgPJPcgqH4gfYyZ6Yp1zjWSf8Mkg5+xHyt7Qtr8W3B9lsFaTOYBGC2znzHU
	pV+/1nNJ2tBkN7FjOk1ivOp+yxE46IMSSf6K4BAvby9ZGMrcWcqPmmc2ncYeBVik92jfigpJPwp
	YoOVQlKCG+Rnt0iuJJnsvQ0mmqnFq/3O+R09/eHnnbfKno6x+6AN8gQTE/2zhiO6WasaXCcVbx/
	6T9zGBJWahki4KbAbOcV0q5pS0bYbr8pA3ZFXe3oJt5qEN6j7jh8OhzvGIgVg5HnujYPe5msJcl
	NCVU7X1cqSNUQEZhJkrNHx+VtAZsPOJw3Wfhb4pKUjlmuH7bp/Bk/skxiNAbgFqfJuegyIYF2W8
	7lTts274Mzg==
X-Received: by 2002:a17:906:9fca:b0:c51:8690:8265 with SMTP id a640c23a62f3a-c5186908490mr137322066b.24.1795446166955;
        Mon, 23 Nov 2026 07:02:46 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm418484866b.8.2026.11.23.07.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:02:46 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 3/5] mfd: max8907: Switch to resource-managed versions of helpers
Date: Mon, 23 Nov 2026 17:02:22 +0200
Message-ID: <20261123150224.199601-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123150224.199601-1-clamor95@gmail.com>
References: <20261123150224.199601-1-clamor95@gmail.com>
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
index a0e0c480ff43e..f1cabb666d8ed 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -186,117 +186,70 @@ static int max8907_power_off(struct sys_off_data *data)
 
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
@@ -319,7 +272,6 @@ static struct i2c_driver max8907_i2c_driver = {
 		.of_match_table = of_match_ptr(max8907_of_match),
 	},
 	.probe = max8907_i2c_probe,
-	.remove = max8907_i2c_remove,
 	.id_table = max8907_i2c_id,
 };
 
-- 
2.53.0

