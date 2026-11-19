Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055361;
	b=Y5VDGGHZHD63V4NPB7FHSek+y9qZEQ1/4Io4RJRdtqISadRspmWvpQEOyfRU3tugsR4u
	 qcvm2Ue+1HIlrb+CQN1Ssiln+fHuifG6SKGR4I7H1i9bSwO0uGTfVUokPPnzMaOPS2c/F
	 Q9pTjasMPrsvbkn8Fa43ilr/abbqsEpOPJAyu/RKlnLanO4nWUzOity6ImxTxE3I0iv6I
	 oxzoM/c+mYFFjbqyYH0WQtfWy9c6hFnaCHS26kF1RcMVAXfQ8xrgEXfGim+M6ffkEC1bU
	 qDvnJsZNjGSQ93fWtQaTKXLu7N+Hd1m0f+RPPN9KRM24qs0XlG0xnk3g4OjMBC/+qOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kbYJLFT1DlhR6lcyzknCYcaYqjsgEktI+N+QrE2ZDK4=;
	b=0pdFd+dYkDEdYWR+ZX5AIxfYvTMq3hMe8PbsDsZG2wQKIdzTe2bq/R+H6zLT9Heop8Qm
	 NCeh53F5xHBCfIQRJxl8d/ikAiKcdSm2lAcIx0wXOzbKJYD9VxNimIrR95WWu+v/H2OXy
	 /498QCfW9Fzp+vJndubCT8eM4CmZralYdAFHSi8Ps7pS+5wt9Wa3vgYlCj91+zlGDlTXD
	 AgrVgWq8Q4v0L51DT45HEp4ApaoH00st4bI9W0Xy7TwkzCKINoH660Ka7cKkNA1vXDumO
	 RnmTRqrRHBRfmeXCPUpR1i//Y01m4eUp0spiLyMJqpiDJ6/UiZILmnPZAyzEI0FfxEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q1N0ltpF;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A21606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0A21606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q1N0ltpF
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so4641243eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795055359; x=1795660159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbYJLFT1DlhR6lcyzknCYcaYqjsgEktI+N+QrE2ZDK4=;
        b=q1N0ltpFawRKWSwxcD4XgqVnXfcdX1n1qI/6sPyS/+A07kz+ysPeyw0EDcvqD0dU5m
         mbPwSrAyJrZeCKe+Gj+PiXji7SwlIIzfxzX76+sbaqoJJ/6IT5aNLMJeLdXPTp91yT6z
         c5e+uCNcOKeliriYmzlRL+ywX3mbS939FTbFRTIMKaBzjwsrWeklXebw+Jy0twpeUB34
         lXAYNtP4IEb1inLcnfHZy2PpbKTRlxMO8di9URk/Hsf1PdHuIaKlm+e65J2yjzpC5iO+
         XnaC/pOI+NdZ4QZAkD7uKA7wWN+9c5BN4JjLaHvw6826Yy4RttEoDFYyxoh83V9JhpMf
         D0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795055359; x=1795660159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kbYJLFT1DlhR6lcyzknCYcaYqjsgEktI+N+QrE2ZDK4=;
        b=pxTPjqOMndlZlm+Goj5xiyQZpM6fG7tzMis4tsIWiWrj88RGhYkfo0ALc05dQw/Gkf
         W88DCeIjR5MP1te1evH4g4eOtm6e3eV5WhKg1B4x95UeCn/Ul6DyrGZG3aPSe9bNr6Tk
         NV95sxUzWR60FfXabeKC/e1sy7L50irZFJ6BHqRYwHNiaxJGLPv1kSPfq7P+ejrQWpyd
         yO7OcXBWzj9Nh4es4329Uj1CWOXiRDNC8VXD7UZnj3cEjrtl+ktgKQnWbpB2Yjm8bgxT
         qDrF0I2gIhmWWQzBPY7jWXbyNeK0Z/irgVb3/bPq5LJ6LUp3Tom48d5nvWFnLwTzabV6
         Ceng==
X-Forwarded-Encrypted: i=1; AL+hErF65sDsoG09TXhyv64u41tp9bqKu7YQoYUOKqWFA6Wm12OJFbmwQ2nLFLXg6zrscWD62nLTyjwPgqL3lqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fc8OR8S7UBb5spGM3fpdZz8oPdaks6oeeGB5vGLlVVS4HUSh+
	UbFgMgs4W5CMDS9TXDV8XJ+I+5br1TlFgTfLLti4OyDDLldqf7flbS33
X-Gm-Gg: AZFdTZcNJ62nIKoFP8D0BsL288Of9bZ6KeY6TLKrMXV0rSTEqIh62elhPFMq/mKrFvh
	iWxBUcu01wUkRahNe4TLWFuYEGnWTcr6itGLwbaGKnfjBo2qhnxLTGjScgNfwJOg8afIx3geyo/
	Q3ZY/dctH1lcMM6cWGSUNwbxjduQRlOsgVKnw3MSGfYK2PmXD3u7l5GvVZObD1KGrWjc6B16YhT
	+Xajq2vuZAiZwbAn3VTSnsH3c5tAJi8s+yg9rjO3p+OxoW/f6qcV7QnsZPYzMhw4aTrWYJnV1Hs
	kww22r+EQonEdkiuUw6p4VOvxCF8udZ/m7BZVm98IsXVPPXbUAE1tnd9o984t2/zVJiQXR8b8a+
	1cKE21WtT/i0naiV9or+o+io25PcEUrxPDfqrEe24t7htKsh1cn478GjKu3heNU+HlTzRYXl3N7
	ajxd4C+tM4YnplF+z/8w060n4ZKzcbXdgg5w2rS8Ra4bHTJl7yA0yBe847F8nmBDAKqUg7mJpuZ
	fXiHAudQLxaJQr9bK8m1A036bqEIatpOvhbjnA3316TaMcil17aln9xZwKgTZrhFInQtf1OW2X6
	zTwSbQp01BtyQkJjy3SxCxaQvxtM8iekcexRmkoc0M/Px/XlY2EJZnQyQWn//v9SdYqwga1j6mn
	gSQYNXcy5OW3DRY2KjrTfvdHPlShZ6cvYzxT2vyRY
X-Received: by 2002:a05:7300:bc03:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-38281427c34mr5661563eec.39.1795055358638;
        Wed, 18 Nov 2026 18:29:18 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:38a8:0:f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72eb2f3sm13958331eec.18.2026.11.18.18.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 18:29:18 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: miquel.raynal@bootlin.com,
	rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: rui.zhang@intel.com,
	lukasz.luba@arm.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	edubezval@gmail.com
Subject: [PATCH v2] thermal/drivers/armada: request the overheat IRQ before enabling the source
Date: Thu, 19 Nov 2026 10:29:11 +0800
Message-Id: <20261119022911.1493538-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118072339.1259719-1-shunsheng1218@gmail.com>
References: <20261118072339.1259719-1-shunsheng1218@gmail.com>
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

armada_thermal_probe() requests the overheat interrupt before it registers
the thermal zones.  Devres releases resources in the reverse order, so the
zones are unregistered first and the interrupt is freed afterwards: a
handler that is still running, or that fires in the window between the
two, passes a zone that has already been destroyed to
thermal_zone_device_update().

Request the interrupt after the zone loop instead.  The handler is then
freed before the zones it updates, and the interrupt is only requested
when a critical trip point was found, which is the only case in which the
driver has an overheat source to enable.

The interrupt stays optional: a device without one, or with an invalid
IRQ number, keeps working without overheat detection instead of failing
to probe.

The source has to be enabled after the handler is registered, so
armada_configure_overheat_int() only programs the thresholds now and
armada_thermal_probe() enables the source once the request has succeeded.
A failed request then cannot leave an interrupt enabled that nobody
handles.  The source is masked at probe time as well, in case the firmware
left it on.

The handler polls its sensor once per second until the temperature is back
below the hysteresis, and devres waits for it in free_irq().  ->remove()
masks the source and sets a shutdown flag so that the poll gives up
instead of keeping the removal blocked until the sensor cools down.

Fixes: 879d7362d1d0 ("thermal: armada: add overheat interrupt support")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested only: arm64, aarch64-linux-gnu-gcc 11.4,
CONFIG_ARMADA_THERMAL=y and CONFIG_ARCH_MVEBU=y.  No hardware was available,
so the removal path was not exercised and no race injection was run.

AI assistance: prepared with Claude (Anthropic) as a coding assistant; the
author reviewed the reasoning and takes responsibility for the content.

Changes in v2:
 - Request the interrupt after the thermal zones are registered instead of
   freeing it from ->remove(); Miquel asked for the smaller shape, so the
   helper and the stored IRQ number are gone.
 - Enable the source only after the handler is registered, so a failed
   request cannot leave an interrupt enabled that nobody handles.
 - Mask the source at probe time, but only on the variants that describe the
   overheat interrupt as a DFX cause.
---
 drivers/thermal/armada_thermal.c | 69 ++++++++++++++++++++++++--------
 1 file changed, 52 insertions(+), 17 deletions(-)

diff --git a/drivers/thermal/armada_thermal.c b/drivers/thermal/armada_thermal.c
index 83672f95b011..23f820415e56 100644
--- a/drivers/thermal/armada_thermal.c
+++ b/drivers/thermal/armada_thermal.c
@@ -68,6 +68,7 @@ struct armada_thermal_priv {
 	struct thermal_zone_device *overheat_sensor;
 	int interrupt_source;
 	int current_channel;
+	bool shutdown;
 	long current_threshold;
 	long current_hysteresis;
 };
@@ -297,12 +298,19 @@ static void armada_enable_overheat_interrupt(struct armada_thermal_priv *priv)
 	regmap_write(priv->syscon, data->syscon_control1_off, reg);
 }
 
-static void __maybe_unused
-armada_disable_overheat_interrupt(struct armada_thermal_priv *priv)
+static void armada_disable_overheat_interrupt(struct armada_thermal_priv *priv)
 {
 	struct armada_thermal_data *data = priv->data;
 	u32 reg;
 
+	/*
+	 * Only the variants that describe the overheat interrupt as a DFX
+	 * cause have this source; leave the control register alone on the
+	 * others.
+	 */
+	if (!data->dfx_overheat_irq)
+		return;
+
 	regmap_read(priv->syscon, data->syscon_control1_off, &reg);
 	FIELD_MODIFY(CONTROL1_TSEN_INT_EN, &reg, 0);
 	regmap_write(priv->syscon, data->syscon_control1_off, reg);
@@ -538,7 +546,7 @@ static irqreturn_t armada_overheat_isr_thread(int irq, void *blob)
 		mutex_unlock(&priv->update_lock);
 		if (ret)
 			goto enable_irq;
-	} while (temperature >= low_threshold);
+	} while (temperature >= low_threshold && !READ_ONCE(priv->shutdown));
 
 	regmap_read(priv->syscon, priv->data->dfx_irq_cause_off, &dummy);
 
@@ -802,7 +810,6 @@ static int armada_configure_overheat_int(struct armada_thermal_priv *priv,
 	armada_set_overheat_thresholds(priv, temperature, 0);
 	priv->overheat_sensor = tz;
 	priv->interrupt_source = sensor_id;
-	armada_enable_overheat_interrupt(priv);
 
 	return 0;
 }
@@ -891,20 +898,16 @@ static int armada_thermal_probe(struct platform_device *pdev)
 	drvdata->data.priv = priv;
 	platform_set_drvdata(pdev, drvdata);
 
+	/*
+	 * The firmware may have left the overheat source enabled.  Keep it
+	 * masked until a handler is in place.
+	 */
+	armada_disable_overheat_interrupt(priv);
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq == -EPROBE_DEFER)
 		return irq;
 
-	/* The overheat interrupt feature is not mandatory */
-	if (irq > 0) {
-		ret = devm_request_threaded_irq(&pdev->dev, irq,
-						armada_overheat_isr,
-						armada_overheat_isr_thread,
-						0, NULL, priv);
-		if (ret)
-			return ret;
-	}
-
 	/*
 	 * There is one channel for the IC and one per CPU (if any), each
 	 * channel has one sensor.
@@ -937,9 +940,29 @@ static int armada_thermal_probe(struct platform_device *pdev)
 			armada_configure_overheat_int(priv, tz, sensor->id);
 	}
 
-	/* Just complain if no overheat interrupt was set up */
-	if (!priv->overheat_sensor)
+	/*
+	 * The overheat interrupt is optional: a device without one keeps
+	 * working, and an invalid IRQ number must not be requested.
+	 */
+	if (irq <= 0 || !priv->overheat_sensor) {
 		dev_warn(&pdev->dev, "Overheat interrupt not available\n");
+		return 0;
+	}
+
+	/*
+	 * Request the interrupt only now that the thermal zones are
+	 * registered: devres releases what was registered last first, so the
+	 * handler is freed before the zones it updates.  The source stays
+	 * masked until the handler is in place, so the device cannot raise an
+	 * interrupt that nobody handles.
+	 */
+	ret = devm_request_threaded_irq(&pdev->dev, irq, armada_overheat_isr,
+					armada_overheat_isr_thread, 0, NULL,
+					priv);
+	if (ret)
+		return ret;
+
+	armada_enable_overheat_interrupt(priv);
 
 	return 0;
 }
@@ -948,8 +971,20 @@ static void armada_thermal_exit(struct platform_device *pdev)
 {
 	struct armada_drvdata *drvdata = platform_get_drvdata(pdev);
 
-	if (drvdata->type == LEGACY)
+	if (drvdata->type == LEGACY) {
 		thermal_zone_device_unregister(drvdata->data.tz);
+		return;
+	}
+
+	/*
+	 * devres frees the interrupt before the thermal zones, so the thread
+	 * is waited for in free_irq().  Mask the source so that no new
+	 * interrupt is raised for a handler that is about to go away, and let
+	 * the poll loop give up instead of keeping ->remove() blocked until
+	 * the sensor cools down.
+	 */
+	WRITE_ONCE(drvdata->data.priv->shutdown, true);
+	armada_disable_overheat_interrupt(drvdata->data.priv);
 }
 
 static struct platform_driver armada_thermal_driver = {
-- 
2.34.1

