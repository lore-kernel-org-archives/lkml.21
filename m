Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417333;
	b=oHI86gmziUsEvN8sBa4aDKIPEBVBlNBw76TqHT9oMUzV14v26GrKdN80TxyoOkWAJmBd
	 HvNsbg3oHdldEruCbxJS25xhZHg17HEpL7y/+akmxAwFw+1knYCOa55QFMgOpHQd3ymc2
	 vXqvcMrCTv87Yazj3Inzfu1xnHlGEjmZ0FRiNlBU5cE5kWisraeiTmjNj7ROHL0GaOSUE
	 mr8GWLQ//+JiJ64g9RyKn8mmSBQZ4sRDJPF5FPDeCYTA5aJIj69GBF6pyIUVz+z7rodaN
	 xGLet5nwT+/5DbdSbCrf6s+z4mmacLOjXGKqwzQnGCG3hpE94tgUCXtkf+QaCqEGv7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MS6DmB/ULBdfOhhhYecAUBRl9PiNKo3+G/EHjFt3o2U=;
	b=3y151JsgjVtkKtAKlOtlfIDzj/hbFt+y3km67KZUjZiN5CZMfESZs5BDXh1qHYw9ZUwt
	 yxzeVMEKrRF3AliScZG8ZqM8ip6UWHBAlVx0/I6P3lzHQy+c+hlkoaST6iPAMSDMRW9hl
	 0y/LvdOanxyC/ShoxXAhSjYEfDO/NM/f2pSomm70KuA7/8SoYGRuWOtjp9tQm5mP1J5dH
	 lLvzp6C0eclpnZmJ+ykAiN4OJucPpJ7BpYHSHfq3w+1XKHXEfCfu2ulAHcOmGoPTnGTPy
	 TTP6LJG+LxjmMec+XxW93eAsiNHZZMPnosBpu79Csd6G1H6EeAMtSZyEbhisVrQnAWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pJgNShhB;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5A1606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C5A1606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pJgNShhB
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2004284f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417331; x=1796022131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MS6DmB/ULBdfOhhhYecAUBRl9PiNKo3+G/EHjFt3o2U=;
        b=pJgNShhBPrgLBlaRCOzqSoRSYkU66yOc/HGDwRAVvK2DCrmGb20XChLl1QLoK8H0iN
         rZnXDHj7T4W8G02NAf8W0LWz6Pb0DoKyVgf16ZhJ9uVjL7hUd/GkRCWd8+if+DiqA1Jn
         Kihym0fPctgn90S1mp0gkiEL3ii3/3YmowXVL/NuTuEQryIXy3LoJL6qK+WivzXkoP2S
         ZWSeAfT7U39RAJmCwzX5cIyrc7hMowhZuz0zSv23piFJ9WMG3QPuI0tCCdRlyKQKAZSW
         JAKh4x2N6j0j+35pRBAqspqAGtg3+Yng/yta2jktso38QI6Xeuu+kdulfJw7jwJ62Vr6
         F9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417331; x=1796022131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MS6DmB/ULBdfOhhhYecAUBRl9PiNKo3+G/EHjFt3o2U=;
        b=Nc5hHdIy9VtatH2xe5/GHqDYCBjJVL26t1ttlV011PMflXgXqAngJA+89aDpFVle1b
         hjktM8Fq3OeGiH2D6tm9mUPDrpLDN8FzbFgU2pcaDtioHUoXYLHGVotkWGWv/gVR06VO
         ctyH3oklEObr674z11otvp4yiyWCNkp152vye6lja1fY4a7FZfpNUh8HuhNkjn7DbOMP
         KBx5iAxEwQAg/9JVDhaKM2wKbgcPxz3WRPfMw/tLLVwpLpsBD5px1tFPcpvmB2h9qQY/
         N6Zt/bnZgTikbV8xwdx4cvmKygGke3B4acGul1k40qSlHYMFTLIoGdQDb2xZO2a3VsTo
         co9A==
X-Forwarded-Encrypted: i=1; AL+hErHkFLGSWAYcVm0XSxEd6a4oWO1HHs4ozZ3znLfkqTABdO4BAYug/+sq9CdQThGfarZZOxg0EzkOlgAFzcs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SR60MA/VIuhKq11BMCt7H/8i0zW/+0/qguWclAZ5QYpYc0VU/
	cAX5EqDWPB/SJoTxpZko4J1om5r/T19BJ1Z6YHUubh5Wcy/PcCftL9WT
X-Gm-Gg: AZFdTZfpTN3E9b4Vmh/ZperDhlak05lBUceWjhcvF2bbAZjeoZc9pfTDMTofiIJicGk
	NgVMlm2dxq/bsAmHzA3rXYE7Pdy+KSkRNK4xr+Wk2TmGzEVCdoMqCLFJXdsFcRCA8QtM4BBDQHT
	RFvWqMbYE6kpXwYy/vw5kPR0g1UQ/3hKv3aUl0WuyY5y6Q7pSrVuoO/csmoIN5ySbzKP1qZH6Rp
	K9+nHBIqOLjc/+7hk/5SxNHDc2fWnYcpezPlnOBpiHiwj1oZZbjziE1+CcgD2pfZygftC83GyiR
	fND2ci1Khwb2RPpXI5REqFX+DvgIuR2qUmXguy9/Ssj1whaHFucc62dbVqiR+4u1lhh+VQBuGXN
	Evunz1ueG2QHlRjewO7iQUqBAzbu9QhMc9c90qk5TLZmPxl1KI395/CQSuj53oB3Rf74Mrr9BLd
	LU9wVztgbqpu1WA21wE7LX3Y47TleO0l803OWScrDwuJrXFOJBh4j+PjOHs78Ei1OjrM1tbIirG
	pVWtWOpXgyVS7SHfal80Lo+IzLXZw3Va+HJpXKoFKjw4795UmyJWCMwwkB9EKJ8dBkBovDwG6qo
	5o7KIiAVLuY80k9oEcovs5+UdrZkIRjKxrCP
X-Received: by 2002:adf:e014:0:10b0:48f:bcdf:6f7d with SMTP id ffacd0b85a97d-4abb3c37b20mr15296742f8f.34.1795417331345;
        Sun, 22 Nov 2026 23:02:11 -0800 (PST)
Received: from fedora ([154.182.66.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm20779007f8f.3.2026.11.22.23.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:02:10 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com,
	amin.gattout@gmail.com,
	antoniu.miclaus@analog.com,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v5 8/8] iio: adc: at91_adc: convert to device-managed resources
Date: Mon, 23 Nov 2026 09:01:01 +0200
Message-ID: <20261123070101.53868-9-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
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

Convert the driver to device-managed APIs so that all resources are
freed automatically on probe failure and on driver detach:
  - allocate and register the IIO triggers directly in at91_adc_probe()
  with devm_iio_trigger_alloc() and devm_iio_trigger_register(),
  dropping at91_adc_allocate_trigger(), at91_adc_trigger_init() and
  at91_adc_trigger_remove() along with their manual rollback paths.
  The st->trig array is no longer needed and is removed as well, since
  the triggers are now owned by devres
  - set up the triggered buffer with devm_iio_triggered_buffer_setup()
  directly in at91_adc_probe(), dropping at91_adc_buffer_init() and
  at91_adc_buffer_remove()
  - allocate the touchscreen input device with
  devm_input_allocate_device(), dropping at91_ts_unregister() and the
  manual input_free_device() error path in at91_ts_register()
  - register the IIO device with devm_iio_device_register()

Redundant allocation error messages ("Failed to allocate TS device!" and
"Couldn't setup the triggers.") are dropped, and at91_ts_register() now
uses dev_err_probe() to report its remaining error.  Errors from
devm_iio_trigger_register() are reported with dev_err_probe() as well.

at91_adc_probe() no longer needs any error unwinding labels and
at91_adc_remove() is removed together with the platform driver's
.remove callback.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 187 +++++++------------------------------
 1 file changed, 34 insertions(+), 153 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 62f8db630640..5163583aa4f8 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -230,7 +230,6 @@ struct at91_adc_state {
 	u32			startup_time;
 	u8			sample_hold_time;
 	bool			sleep_mode;
-	struct iio_trigger	**trig;
 	bool			use_external;
 	u32			vref_mv;
 	u32			res;		/* resolution used for conversions */
@@ -607,96 +606,6 @@ static const struct iio_trigger_ops at91_adc_trigger_ops = {
 	.set_trigger_state = &at91_adc_configure_trigger,
 };
 
-static struct iio_trigger *at91_adc_allocate_trigger(struct iio_dev *idev,
-						     const struct at91_adc_trigger *trigger)
-{
-	struct iio_trigger *trig;
-	int ret;
-
-	trig = iio_trigger_alloc(idev->dev.parent, "%s-dev%d-%s", idev->name,
-				 iio_device_id(idev), trigger->name);
-	if (trig == NULL)
-		return NULL;
-
-	iio_trigger_set_drvdata(trig, idev);
-	trig->ops = &at91_adc_trigger_ops;
-
-	ret = iio_trigger_register(trig);
-	if (ret) {
-		iio_trigger_free(trig);
-		return NULL;
-	}
-
-	return trig;
-}
-
-static int at91_adc_trigger_init(struct iio_dev *idev)
-{
-	struct at91_adc_state *st = iio_priv(idev);
-	int i, ret;
-
-	st->trig = devm_kcalloc(&idev->dev,
-				st->caps->trigger_number, sizeof(*st->trig),
-				GFP_KERNEL);
-
-	if (st->trig == NULL) {
-		ret = -ENOMEM;
-		goto error_ret;
-	}
-
-	for (i = 0; i < st->caps->trigger_number; i++) {
-		if (st->caps->triggers[i].is_external && !(st->use_external))
-			continue;
-
-		st->trig[i] = at91_adc_allocate_trigger(idev,
-							st->caps->triggers + i);
-		if (st->trig[i] == NULL) {
-			dev_err(&idev->dev,
-				"Could not allocate trigger %d\n", i);
-			ret = -ENOMEM;
-			goto error_trigger;
-		}
-	}
-
-	return 0;
-
-error_trigger:
-	for (i--; i >= 0; i--) {
-		if (!st->trig[i])
-			continue;
-
-		iio_trigger_unregister(st->trig[i]);
-		iio_trigger_free(st->trig[i]);
-	}
-error_ret:
-	return ret;
-}
-
-static void at91_adc_trigger_remove(struct iio_dev *idev)
-{
-	struct at91_adc_state *st = iio_priv(idev);
-	int i;
-
-	for (i = 0; i < st->caps->trigger_number; i++) {
-		if (!st->trig[i])
-			continue;
-
-		iio_trigger_unregister(st->trig[i]);
-		iio_trigger_free(st->trig[i]);
-	}
-}
-
-static int at91_adc_buffer_init(struct iio_dev *idev)
-{
-	return iio_triggered_buffer_setup(idev, &iio_pollfunc_store_time,
-		&at91_adc_trigger_handler, NULL);
-}
-
-static void at91_adc_buffer_remove(struct iio_dev *idev)
-{
-	iio_triggered_buffer_cleanup(idev);
-}
-
 static int at91_adc_read_raw(struct iio_dev *idev,
 			     struct iio_chan_spec const *chan,
 			     int *val, int *val2, long mask)
@@ -930,17 +839,13 @@ static int at91_ts_register(struct iio_dev *idev, struct device *dev)
 {
 	struct at91_adc_state *st = iio_priv(idev);
 	struct input_dev *input;
-	int ret;
 
-	input = input_allocate_device();
-	if (!input) {
-		dev_err(&idev->dev, "Failed to allocate TS device!\n");
+	input = devm_input_allocate_device(dev);
+	if (!input)
 		return -ENOMEM;
-	}
 
 	input->name = DRIVER_NAME;
 	input->id.bustype = BUS_HOST;
-	input->dev.parent = dev;
 	input->open = atmel_ts_open;
 	input->close = atmel_ts_close;
 
@@ -954,12 +859,9 @@ static int at91_ts_register(struct iio_dev *idev, struct device *dev)
 				     0, 0);
 		input_set_abs_params(input, ABS_PRESSURE, 0, 0xffffff, 0, 0);
 	} else {
-		if (st->touchscreen_type != ATMEL_ADC_TOUCHSCREEN_4WIRE) {
-			dev_err(dev,
-				"This touchscreen controller only support 4 wires\n");
-			ret = -EINVAL;
-			goto err;
-		}
+		if (st->touchscreen_type != ATMEL_ADC_TOUCHSCREEN_4WIRE)
+			return dev_err_probe(dev, -EINVAL,
+					     "This touchscreen controller only support 4 wires\n");
 
 		input_set_abs_params(input, ABS_X, 0, (1 << MAX_RLPOS_BITS) - 1,
 				     0, 0);
@@ -970,20 +872,7 @@ static int at91_ts_register(struct iio_dev *idev, struct device *dev)
 	st->ts_input = input;
 	input_set_drvdata(input, st);
 
-	ret = input_register_device(input);
-	if (ret)
-		goto err;
-
-	return ret;
-
-err:
-	input_free_device(input);
-	return ret;
-}
-
-static void at91_ts_unregister(struct at91_adc_state *st)
-{
-	input_unregister_device(st->ts_input);
+	return input_register_device(input);
 }
 
 static int at91_adc_probe(struct platform_device *pdev)
@@ -1142,16 +1031,34 @@ static int at91_adc_probe(struct platform_device *pdev)
 	 * trigger for classic adc.
 	 */
 	if (!st->touchscreen_type) {
-		ret = at91_adc_buffer_init(idev);
-		if (ret < 0)
+		ret = devm_iio_triggered_buffer_setup(dev, idev,
+						      &iio_pollfunc_store_time,
+						      &at91_adc_trigger_handler,
+						      NULL);
+		if (ret)
 			return dev_err_probe(dev, ret,
 					     "Couldn't initialize the buffer.\n");
 
-		ret = at91_adc_trigger_init(idev);
-		if (ret < 0) {
-			dev_err(dev, "Couldn't setup the triggers.\n");
-			at91_adc_buffer_remove(idev);
-			return ret;
+		for (unsigned int i = 0; i < st->caps->trigger_number; i++) {
+			struct iio_trigger *trig;
+
+			if (st->caps->triggers[i].is_external && !st->use_external)
+				continue;
+
+			trig = devm_iio_trigger_alloc(dev, "%s-dev%d-%s",
+						      idev->name,
+						      iio_device_id(idev),
+						      st->caps->triggers[i].name);
+			if (!trig)
+				return -ENOMEM;
+
+			iio_trigger_set_drvdata(trig, idev);
+			trig->ops = &at91_adc_trigger_ops;
+
+			ret = devm_iio_trigger_register(dev, trig);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "Couldn't register trigger %u.\n", i);
 		}
 	} else {
 		ret = at91_ts_register(idev, dev);
@@ -1161,36 +1068,11 @@ static int at91_adc_probe(struct platform_device *pdev)
 		at91_ts_hw_init(idev, adc_clk_khz);
 	}
 
-	ret = iio_device_register(idev);
-	if (ret < 0) {
-		dev_err(dev, "Couldn't register the device.\n");
-		goto error_iio_device_register;
-	}
+	ret = devm_iio_device_register(dev, idev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't register the device.\n");
 
 	return 0;
-
-error_iio_device_register:
-	if (!st->touchscreen_type) {
-		at91_adc_trigger_remove(idev);
-		at91_adc_buffer_remove(idev);
-	} else {
-		at91_ts_unregister(st);
-	}
-	return ret;
-}
-
-static void at91_adc_remove(struct platform_device *pdev)
-{
-	struct iio_dev *idev = platform_get_drvdata(pdev);
-	struct at91_adc_state *st = iio_priv(idev);
-
-	iio_device_unregister(idev);
-	if (!st->touchscreen_type) {
-		at91_adc_trigger_remove(idev);
-		at91_adc_buffer_remove(idev);
-	} else {
-		at91_ts_unregister(st);
-	}
 }
 
 static int at91_adc_suspend(struct device *dev)
@@ -1340,7 +1222,6 @@ MODULE_DEVICE_TABLE(of, at91_adc_dt_ids);
 
 static struct platform_driver at91_adc_driver = {
 	.probe = at91_adc_probe,
-	.remove = at91_adc_remove,
 	.driver = {
 		   .name = DRIVER_NAME,
 		   .of_match_table = at91_adc_dt_ids,
-- 
2.56.0

