Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009915;
	b=nwoPK5P6BfMeCX8k3OKPIz0DEZ2wCpMsHrorEHir924On9CAsqSiwVLkNnrtYnh4XI+B
	 wQcPrhoy6zf0AC1o6fMWodoNMn5qzd7NCYWVEpKFKD3tZcM2OlcA1BopXv7a18Pf6wMbp
	 Ba2Mt+bT5k+wxvy2zz52QV8oI3Y8APyxiDWJZm5Mbca8syraqQ2896i3uIDhZOQT7A/J0
	 Jse7/0xJkxA4GFjFh/bWP25cy7IZdNbt3USfRu1WA2/jfBoHdXfGNmZPIknGenBuOalAv
	 UfvDiZCqRm/cJq+7XdKyNekd4zg6KhgFZc+tINLkXdNvd5MbEH9CESzon/Y6vUbEsmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=STYsoKiQ4GtW6xSh6oMC3HJ7BXu0FDj645iWOpLD8G8=;
	b=r9KFVVcNxZxihZI0NYXfNfbJb1DGwMVhynbMxlmPCSTen3x7BnWkSGzt4KaDf+lfEwsB
	 45a0Yp3eqLmgmQMqE97DOUsVL1JmnM2et3U1LiNHvlZsDzW9z8uxtkwSDNIMEfkV4FbED
	 VXZH0XnfCFFVg4ku9EJ0E1mNB0I77yo6l6dOZ5YQUTrioDlSMmASU8nPxVQGZ1C5tAerb
	 4Nbd/hk2SZasT57NcRXEXL9Kgf23cHHVF+DsQfB7Jwsa3+zbF6LpooTj1SuTNyloP74I2
	 a+qOZJsGxCs4IGxay1vsoseKXxCo8wGpTwm3SueDKJ/UZGezN3EckyQD0vzO5r1Bm+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZdowkXOe;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435A860A260F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 435A860A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZdowkXOe
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb61185057so8304035e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795009913; x=1795614713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=STYsoKiQ4GtW6xSh6oMC3HJ7BXu0FDj645iWOpLD8G8=;
        b=ZdowkXOetp8ZMHp+N3L5O2YXMS73xKtAOJ1T+py6tMUicL6+MXmI2paR9g0AMfhTe4
         efDDCkY9mKbZZ1TL8skFj++MSkhzQZFB1kRD9EYvw8UlW/JrHt5TZHeY2fh6GVYp4mYe
         vg9DwoGTrQ2CSL/maF+fezXm15j64CUH9YtVDQftq1j8A2V007mHiv+zxuYHtzKXWWoi
         PAGgZBaqKtnSXIE46N+z80nrsDrD3JDBZKAVYdb7l2M1Zw6D7caqH67Ly40PplA+MOVH
         5RK8lbVC1cbLnKsUPiZhZnTpJlvJTMgi5IFIxDoviVuGooSaTsbQXTbgNHGY69EARCl3
         ol6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009913; x=1795614713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STYsoKiQ4GtW6xSh6oMC3HJ7BXu0FDj645iWOpLD8G8=;
        b=IHj/46/YfBNIksEfvbwL+0gkvpSaFWEflWp1K1Y2mKvANJVwPWPXPf1jsuGGBdeVxz
         CuD7TkHaFHlqbqGh8NVBnQ2hUvTq3SDhc/Ix0E5lBjVwVbtuAEtL4D+LORWDmfT3Q3t7
         rmu0HDtL5YpO5fygwzJXi1KUqSOaQOKT5felEO4WKlHayXjltkMb5V+vimNt2MSFqXf0
         FO8pmsa7eL0OJIJnh77mPFmmvqWkzcag7iYd4Ad1Bo5A8/MWGK4xii4IRH4IS4m+JO5b
         SlQBau9y7ZJBlMDibdTKhxlWzKe3bVK4I21tfWLfkRlC6mY9jmPM/3tXMgMGghu5nn6d
         O4Zw==
X-Forwarded-Encrypted: i=1; AL+hErEkAj4fAw70EC0i7FLg48F+MDacd7ul0oYA2/OZz6+fKcG6CwhP7aIik6VYnqjtTpOzz3bNFeX8TRyWgmQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/el4ciKAhQAzDlKsQAxsK4I9G/Me+Y7iEkK9++mXYeKmTdwvNk
	90cSXHdbUDecsy4c0uCpgxcKSdJpcWb4kBVrCmi5hF/4MP8x7mMI9UvCPOh/DvZmxLc=
X-Gm-Gg: AYBFou1lPOAP0DbxLjl7oLbxCpyIV7md8zbF/7I8G+kAyNY8538/Ztc97b3/DhWpVf4
	qzXV2LvNztOLHeQpnK3+E0yU/NZfCBsqY/XqODidzphHCpw7jzaMJIHbec7LgKlahmXyYnlrd2W
	Dy9tQtcUnGzdJHpyaMdtprLJlrKVbJndAbUqug1ERmHL5HlmeqejPluQ/uAoaNgG1ULMfG2A63Y
	K7VRHZIfjmMWIAQExPhu1nDxrJHkKyTNapSUzzUc/tEOTL6O2g7A9OzVisn5wdQUn28PEgZI1ZT
	hSFVXej3zKsNKsvZWLhy8tc1+d+2ZPb2Y1CZWvcvjLwTDsKlYkSnSLNvYBj4w1gZRO92bT3aHNL
	PvNSOTMoXpCyhAT2NDnjomvFb2MGAPxRth8Zm05coY3VCXHicYWpLAjuGCbV7dmjKR1DiT/XgAC
	hwGa1imnC0FSgv7RrJC8l+agFWITFvCPEc0wXwvQrTGNMGLIa6nXXyvnHNlyZU2KWbBwwfivKzN
	c4pQYk8jZJsL+zkTrlxraQRrJQIsUFuZxSnBeLkT3Xdb8VRvdyHOfnpl+2Ds1QHOOJPeWLYNJzR
	TRKj6E7//mfUneX3uhCoGoQg3kPYot8Uw2sspXP5pp8mvAaroW7xr9IMr4syRHvH2q920uqvNnS
	259i1XVf4UtU8ke/40y7n02A=
X-Received: by 2002:a05:600c:3ac5:b0:4b8:4af2:88b3 with SMTP id 5b1f17b1804b1-4bb7da4af9bmr51955375e9.22.1795009912555;
        Wed, 18 Nov 2026 05:51:52 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:80a3:e955:3785:90b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78422d2dsm208544775e9.10.2026.11.18.05.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:51:51 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 18 Nov 2026 13:51:46 +0000
Subject: [PATCH v2 2/3] thermal: samsung: acpm-tmu: refactor SoC-specific
 operations into driver data
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
Message-Id: <20261118-acpm-tmu-e850-support-v2-2-19848c0d97e5@linaro.org>
References: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
In-Reply-To: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mateusz Majewski <m.majewski2@samsung.com>, 
 Thomas Turner <tturner@lineageos.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

The current ACPM TMU driver assumes that all TMU operations (init,
threshold updates, and interrupt clearing) are handled exclusively
via ACPM IPC commands, which is true for the GS101.

However, other Exynos platforms (like Exynos850) lack complete firmware
support for these operations and require direct MMIO register access
instead for missing ACPM TMU IPC calls.

Prepare the driver for multi-SoC support by moving the hardcoded GS101
IPC calls into SoC-specific callbacks: "tz_control", "tmu_init",
"tmu_update_thresholds" and "tmu_check_and_clear_irqs" within the
acpm_tmu_driver_data struct. Additionally, save the regmap pointer in
the private structure so that these callbacks can utilize it for other
SoCs.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 113 +++++++++++++++++++++++++++----------
 1 file changed, 82 insertions(+), 31 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 4799ef518a7a..0def0ec09084 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -74,6 +74,8 @@ struct acpm_tmu_sensor {
 };
 
 struct acpm_tmu_priv {
+	const struct acpm_tmu_driver_data *data;
+	struct regmap *regmap;
 	struct regmap_field *regmap_fields[REG_INTPEND_COUNT];
 	struct acpm_handle *handle;
 	struct device *dev;
@@ -86,9 +88,18 @@ struct acpm_tmu_priv {
 
 struct acpm_tmu_driver_data {
 	const struct reg_field *reg_fields;
+	const struct regmap_config *regmap_config;
 	const struct acpm_tmu_sensor_group *sensor_groups;
 	unsigned int num_sensor_groups;
 	unsigned int mbox_chan_id;
+
+	/* SoC-specific TMU routines and values */
+	int (*tz_control)(struct acpm_tmu_sensor *sensor, bool on);
+	int (*tmu_check_and_clear_irqs)(struct acpm_tmu_sensor *sensor,
+					bool *pending_irq);
+	int (*tmu_init)(struct acpm_tmu_priv *priv);
+	int (*tmu_update_thresholds)(struct acpm_tmu_sensor *sensor,
+				     u8 thresholds[2], u8 inten);
 };
 
 #define ACPM_TMU_SENSOR_GROUP(_mask, _id)		\
@@ -131,24 +142,32 @@ static const struct regmap_config gs101_regmap_config = {
 	.max_register = GS101_REG_INTPEND(15),
 };
 
-static const struct acpm_tmu_driver_data acpm_tmu_gs101 = {
-	.reg_fields = gs101_reg_fields,
-	.sensor_groups = gs101_sensor_groups,
-	.num_sensor_groups = ARRAY_SIZE(gs101_sensor_groups),
-	.mbox_chan_id = 9,
-};
+static int gs101_tz_control(struct acpm_tmu_sensor *sensor, bool on)
+{
+	struct acpm_tmu_priv *priv = sensor->priv;
+	struct acpm_handle *handle = priv->handle;
+
+	return handle->ops->tmu.tz_control(handle, priv->mbox_chan_id,
+					   sensor->group->id, on);
+}
+
+static int gs101_tmu_init(struct acpm_tmu_priv *priv)
+{
+	struct acpm_handle *handle = priv->handle;
+
+	return handle->ops->tmu.init(handle, priv->mbox_chan_id);
+}
 
 static int acpm_tmu_op_tz_control(struct acpm_tmu_sensor *sensor, bool on)
 {
 	struct acpm_tmu_priv *priv = sensor->priv;
-	struct acpm_handle *handle = priv->handle;
-	const struct acpm_tmu_ops *ops = &handle->ops->tmu;
 	int ret;
 
-	ret = ops->tz_control(handle, priv->mbox_chan_id, sensor->group->id,
-			      on);
-	if (ret)
-		return ret;
+	if (priv->data->tz_control) {
+		ret = priv->data->tz_control(sensor, on);
+		if (ret)
+			return ret;
+	}
 
 	WRITE_ONCE(sensor->enabled, on);
 
@@ -227,8 +246,8 @@ static int acpm_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
 	return 0;
 }
 
-static int acpm_tmu_update_thresholds(struct acpm_tmu_sensor *sensor,
-				      u8 thresholds[2], u8 inten)
+static int gs101_tmu_update_thresholds(struct acpm_tmu_sensor *sensor,
+				       u8 thresholds[2], u8 inten)
 {
 	struct acpm_tmu_priv *priv = sensor->priv;
 	struct acpm_handle *handle = priv->handle;
@@ -292,7 +311,8 @@ static int acpm_tmu_set_trips(struct thermal_zone_device *tz, int low, int high)
 	if (ret)
 		return ret;
 
-	ret = acpm_tmu_update_thresholds(sensor, thresholds, inten);
+	if (priv->data->tmu_update_thresholds)
+		ret = priv->data->tmu_update_thresholds(sensor, thresholds, inten);
 
 	pm_runtime_put_autosuspend(dev);
 
@@ -331,12 +351,12 @@ static const struct thermal_zone_device_ops acpm_tmu_sensor_ops = {
 	.set_trips = acpm_tmu_set_trips,
 };
 
-static bool acpm_tmu_clear_pending_irq(struct acpm_tmu_sensor *sensor)
+static int gs101_handle_irqs(struct acpm_tmu_sensor *sensor, bool *pending_irq)
 {
 	struct acpm_tmu_priv *priv = sensor->priv;
 	const struct acpm_tmu_ops *ops = &priv->handle->ops->tmu;
 	unsigned long mask = sensor->group->mask;
-	bool pending_irq = false;
+	bool pending = false;
 	int i, ret;
 	u32 val;
 
@@ -345,16 +365,16 @@ static bool acpm_tmu_clear_pending_irq(struct acpm_tmu_sensor *sensor)
 	for_each_set_bit(i, &mask, EXYNOS_TMU_SENSORS_MAX_COUNT) {
 		ret = regmap_field_read(priv->regmap_fields[i], &val);
 		if (ret)
-			return false;
+			return ret;
 
 		if (val) {
-			pending_irq = true;
+			pending = true;
 			break;
 		}
 	}
 
-	if (!pending_irq)
-		return false;
+	if (!pending)
+		return 0;
 
 	ret = ops->clear_tz_irq(priv->handle, priv->mbox_chan_id,
 				sensor->group->id);
@@ -362,10 +382,12 @@ static bool acpm_tmu_clear_pending_irq(struct acpm_tmu_sensor *sensor)
 		dev_err_ratelimited(priv->dev,
 				    "Sensor %u: failed to clear IRQ (%d)\n",
 				    sensor->group->id, ret);
-		return false;
+		return ret;
 	}
 
-	return true;
+	*pending_irq = true;
+
+	return ret;
 }
 
 static irqreturn_t acpm_tmu_thread_fn(int irq, void *id)
@@ -383,8 +405,13 @@ static irqreturn_t acpm_tmu_thread_fn(int irq, void *id)
 
 	for (i = 0; i < priv->num_sensors; i++) {
 		struct acpm_tmu_sensor *sensor = &priv->sensors[i];
+		bool pending_irq = false;
 
-		if (!sensor->tzd || !acpm_tmu_clear_pending_irq(sensor))
+		if (!sensor->tzd)
+			continue;
+
+		ret = priv->data->tmu_check_and_clear_irqs(sensor, &pending_irq);
+		if (ret || !pending_irq)
 			continue;
 
 		handled = true;
@@ -398,15 +425,30 @@ static irqreturn_t acpm_tmu_thread_fn(int irq, void *id)
 	return handled ? IRQ_HANDLED : IRQ_NONE;
 }
 
+static const struct acpm_tmu_driver_data acpm_tmu_gs101 = {
+	.reg_fields = gs101_reg_fields,
+	.regmap_config = &gs101_regmap_config,
+	.sensor_groups = gs101_sensor_groups,
+	.num_sensor_groups = ARRAY_SIZE(gs101_sensor_groups),
+	.mbox_chan_id = 9,
+	.tz_control = gs101_tz_control,
+	.tmu_check_and_clear_irqs = gs101_handle_irqs,
+	.tmu_init = gs101_tmu_init,
+	.tmu_update_thresholds = gs101_tmu_update_thresholds,
+};
+
 static const struct of_device_id acpm_tmu_match[] = {
-	{ .compatible = "google,gs101-tmu-top" },
+	{
+		.compatible = "google,gs101-tmu-top",
+		.data = &acpm_tmu_gs101
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, acpm_tmu_match);
 
 static int acpm_tmu_probe(struct platform_device *pdev)
 {
-	const struct acpm_tmu_driver_data *data = &acpm_tmu_gs101;
+	const struct acpm_tmu_driver_data *data;
 	struct acpm_handle *acpm_handle;
 	struct device *dev = &pdev->dev;
 	struct acpm_tmu_priv *priv;
@@ -414,6 +456,10 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 	void __iomem *base;
 	int i, ret;
 
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return dev_err_probe(dev, -ENODEV, "No matching driver data found\n");
+
 	acpm_handle = devm_acpm_get_by_phandle(dev);
 	if (IS_ERR(acpm_handle))
 		return dev_err_probe(dev, PTR_ERR(acpm_handle),
@@ -423,6 +469,7 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->data = data;
 	priv->dev = dev;
 	priv->handle = acpm_handle;
 	priv->mbox_chan_id = data->mbox_chan_id;
@@ -434,10 +481,12 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return dev_err_probe(dev, PTR_ERR(base), "Failed to ioremap resource\n");
 
-	regmap = devm_regmap_init_mmio(dev, base, &gs101_regmap_config);
+	regmap = devm_regmap_init_mmio(dev, base, data->regmap_config);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to init regmap\n");
 
+	priv->regmap = regmap;
+
 	ret = devm_regmap_field_bulk_alloc(dev, regmap, priv->regmap_fields,
 					   data->reg_fields, REG_INTPEND_COUNT);
 	if (ret)
@@ -464,10 +513,12 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to resume device\n");
 
-	ret = acpm_handle->ops->tmu.init(acpm_handle, priv->mbox_chan_id);
-	if (ret) {
-		ret = dev_err_probe(dev, ret, "Failed to init TMU\n");
-		goto out_pm_put;
+	if (priv->data->tmu_init) {
+		ret = priv->data->tmu_init(priv);
+		if (ret) {
+			ret = dev_err_probe(dev, ret, "Failed to init TMU\n");
+			goto out_pm_put;
+		}
 	}
 
 	for (i = 0; i < priv->num_sensors; i++) {

-- 
2.53.0

