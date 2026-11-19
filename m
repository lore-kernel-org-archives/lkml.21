Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084481;
	b=eYHfjctHVHWIn9mQDGTRyq5oUFF02RH1N5MhhzqFwB80FmfU6n9gDLQLRkf2yQJMs3pk
	 d7OUNZ3yflwcvcfa9+p9/cLj/VVkpMLlXkD8Pux/sjGY9Yf9pqUbHkGDioy2dpBfeEL8f
	 j+ciyWzY5R4Phz7vT7ym+xQSmKy9j2ioKF69qLoc0ZU2j6Of5UaSSu2gqQfNdVtpPvnMf
	 Q6eG/iGZTJELCnS5cZI8Pgk9VQFBSb5JS59Pr3a65xszzeKAO7V8Iagx2DvJ7j0avuQVY
	 FXdm0Xto8bVxyqVn8yZu4la7PAE4UCYu/TUR10GuAkGZkg+TpsdWbmHoSZ8wAUns1bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ku1LNAdK9+Sshw+wLpGB4DZKU6CyeOx3BEylFZHlcIU=;
	b=nTSNaIeX8uGPu7FkLfLaerx9zxAAQ6Tb2ng98h5GWtMk3NWvwTaH8RMo2TyR0t/HS6wk
	 mX9GSUaQWNltZQrzvPAuPArsai/xvEijkG9hayiUDhVeZRlS3V92U68Hkb/tsb0rtmH/9
	 QvHrSI//NQ0FsxmZ37cFITMV4+Yif8sf4zOUy0N/lfEAPpqCnY8sQvln5xtbKp5sMmZfg
	 fnB1P8vZeUWmzBap/q4PgVlAvdFnlHByGqsGJ5hSLblZdRBStjLZ9B6ezgP1Hi33S6YSX
	 rd6JWrCGnv1WRLj/iXgW6gcOmmG6VFdjfTcDGEe2ZvaoVVipewsjMS/1Fj6zw+K6EMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mYUNWGDE;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583B7606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 583B7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mYUNWGDE
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso270004a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084481; x=1795689281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ku1LNAdK9+Sshw+wLpGB4DZKU6CyeOx3BEylFZHlcIU=;
        b=mYUNWGDEwnbsX7jaSFNNTy3mEIrxRynuj8No94Ygc3RIVR44fOQnAC1BPG8dUKO2TY
         8culHafC2z4hTKVW9WDtKOyFiPN/OlvZw8dHN+peW+CKph1sH8b0XQ4xwx4/BeWfjBOQ
         DqI3toX3L7u7PNXbAw/f2EZZ4pitCH/UcRLchnQfa5MJcFm6cGMznQA5hm5r9PNCSZiv
         vqlmWanKmd+015wBAXIEVBlhYd6GxSFRRmG+gk6AZx9ta3tHekY/YYuTyflozjTdPpIB
         FmeFHewar/tFR40IXr0I3kaQDy09uZ9hH4CYrpSF6pIW9UlfnDglQz8kaqDj8O1yPOxt
         1VCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084481; x=1795689281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ku1LNAdK9+Sshw+wLpGB4DZKU6CyeOx3BEylFZHlcIU=;
        b=cGTIhYmhOAJY8gUYBrjoSNoh2TVrtRphMzrC8NgSfga/y1FNRGia07JQuJ6AtWMuRU
         VH2CAA4fgVf8UjkkUbdBOxTFqrNzvuC1b/H3G8WdXjDVD44VjwEzQ17reA4COWM36x1y
         MdSXzZgzQg9AIXr8nxsrgogGRTN0slVPyJVgibxwslqzN0D8O8byaQZJhoBPDeJGrprr
         Y3hmetR3Y7v7DVQDKIsnCMGLSW4IWsbeAPPXNWm2RBeCgM//2GsKAdu58gl8tSBJrjLO
         7Qo8C1ac64q2ySBYlDh7+1WqQn82snbha9q503UF+gu92sE2k8WYmrNGtWuIi/brAyRU
         LTMw==
X-Forwarded-Encrypted: i=1; AL+hErGOrtGI0Yfu9UwcFE8KBoGnvKAX1d3PlhdqN8b2fRFxXkQiMsdeJct4JT+MlPKSM0wI78LB9Id53Pl8Sug=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tsaXos3CVKxzqx5b1GVg6GkWlfveTA5EG2rfZrob5LwoSzCn5
	QQArTeLxroZ7e8ccwFbNUR995Tcx9BSl5HW+3R3ltIkFPPeSdSZNyx6i
X-Gm-Gg: AZFdTZe8lLLzGT/wzUv8QZ5XYI8Bv4OUz/LQA/VN++QpWgGDRyVVOplAzxUOkPQi30a
	8Rr2DG3YfbzcGyy5iqdZx9HogsGUyuVHZ9fwljsHYpwR4/AqlECmHmOY2vNF9pNm81zM0yi/DQj
	OSh6cvPTCyBERoUxw+71nOE2QY1pHgNjYp/bzINI/8QgJR/lKaySZJlygKS9x4ZaO+bDRjFJiuz
	M1EKOvm0ZUYm2nCIBCw5HWyr7+r6Nf63QeT6MQYgPfVvuVe/lzFk5AFfWIWgwh3cJGV/Grrywsz
	0WAuL7BlCagt9DbcW0gDIzrZAzSvocFY6YwAKNdr4Ihdh+WwfKEfoT0a50UGxJOOby9q9L+Q5zb
	lgIc1MmP29VRveeqLjSnLmHG/yFkTzD9MnYclEFIOdKPQr8ZTqzZJ/pVdr5H69EBu8YHwXsZEmA
	BSbOccRTbHpPV1H722uVkPQMXolUNGg0os/juLQOSAFJVb+lAGuhFe7V3YyVk0rJDVCFnmgsAqr
	TeTL16r7FVCa8YgKCs7w3vkJLWu7Kca4r4M5U1ktr8llnqx5SdBpUQzB4jQaBKBChpZb6t9S06O
	AploGfSchATFl2OOHddzWRxeKWXvZi2n2u3n0gJoq+CjqnyXVMeB1sHBEIVL6QCigofAY8bQdrh
	XbnNU7bxWdXGkkbFrgDOCgpIL04FKJsYZFiXPfP+bA6rB
X-Received: by 2002:a17:90b:3f88:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3b3d074e2a8mr5208458a91.17.1795084480615;
        Thu, 19 Nov 2026 02:34:40 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6116323sm28617325ad.23.2026.11.19.02.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:34:40 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/4] ASoC: atmel: mchp-spdifrx: Use devm helpers for runtime PM
Date: Thu, 19 Nov 2026 17:34:11 +0700
Message-ID: <20261119103413.31729-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119103413.31729-1-phucduc.bui@gmail.com>
References: <20261119103413.31729-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Use devm_pm_runtime_enable() and a devm action to handle runtime PM
cleanup automatically.

This removes the manual runtime PM cleanup from the probe error
paths and the remove callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 47 ++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 7d80f35576cd..25122f6ef3c9 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -1079,6 +1079,15 @@ static const struct dev_pm_ops mchp_spdifrx_pm_ops = {
 		       NULL)
 };
 
+/* Runtime suspend the device on cleanup if necessary */
+static void mchp_spdifrx_runtime_suspend_action(void *data)
+{
+	struct device *dev = data;
+
+	if (!pm_runtime_status_suspended(dev))
+		mchp_spdifrx_runtime_suspend(dev);
+}
+
 static int mchp_spdifrx_probe(struct platform_device *pdev)
 {
 	struct mchp_spdifrx_dev *dev;
@@ -1141,11 +1150,22 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
 
-	pm_runtime_enable(dev->dev);
+	err = devm_add_action(dev->dev, mchp_spdifrx_runtime_suspend_action,
+			      dev->dev);
+	if (err)
+		return err;
+
+	err = devm_pm_runtime_enable(dev->dev);
+	if (err)
+		return err;
 	if (!pm_runtime_enabled(dev->dev)) {
 		err = mchp_spdifrx_runtime_resume(dev->dev);
-		if (err)
-			goto pm_runtime_disable;
+		if (err) {
+			devm_remove_action(dev->dev,
+					   mchp_spdifrx_runtime_suspend_action,
+					   dev->dev);
+			return err;
+		}
 	}
 
 	dev->capture.addr	= (dma_addr_t)mem->start + SPDIFRX_RHR;
@@ -1154,7 +1174,7 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 	err = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (err) {
 		dev_err(&pdev->dev, "failed to register PCM: %d\n", err);
-		goto pm_runtime_suspend;
+		return err;
 	}
 
 	err = devm_snd_soc_register_component(&pdev->dev,
@@ -1162,34 +1182,17 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 					      &mchp_spdifrx_dai, 1);
 	if (err) {
 		dev_err(&pdev->dev, "fail to register dai\n");
-		goto pm_runtime_suspend;
+		return err;
 	}
 
 	regmap_read(regmap, SPDIFRX_VERSION, &vers);
 	dev_info(&pdev->dev, "hw version: %#lx\n", vers & SPDIFRX_VERSION_MASK);
 
 	return 0;
-
-pm_runtime_suspend:
-	if (!pm_runtime_status_suspended(dev->dev))
-		mchp_spdifrx_runtime_suspend(dev->dev);
-pm_runtime_disable:
-	pm_runtime_disable(dev->dev);
-	return err;
-}
-
-static void mchp_spdifrx_remove(struct platform_device *pdev)
-{
-	struct mchp_spdifrx_dev *dev = platform_get_drvdata(pdev);
-
-	pm_runtime_disable(dev->dev);
-	if (!pm_runtime_status_suspended(dev->dev))
-		mchp_spdifrx_runtime_suspend(dev->dev);
 }
 
 static struct platform_driver mchp_spdifrx_driver = {
 	.probe	= mchp_spdifrx_probe,
-	.remove = mchp_spdifrx_remove,
 	.driver	= {
 		.name	= "mchp_spdifrx",
 		.of_match_table = mchp_spdifrx_dt_ids,
-- 
2.43.0

