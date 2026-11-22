Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335523;
	b=TlHbMkf5SYEJR+HmqFIwWr/DZU32T5Nt3d1s2d73Kx0iMfRvtiZ57rf3JYxlXqPjKsrt
	 ZlajNu8YsRfZzoB/d9Hc0/nO3b26zPVmUFBYo9PrK8yr/O5otWnmo6xCtJIbgHgKUEEA2
	 rqiYXfqBXrr9YN9pUdL4B3VgjmjUUHLYPvsGYGquKYeEOZS4L6ngspi0ZZqPS2U6PJki8
	 QSZQgrz0UOM9gg3KoZnh3Sh57qaZrrEffGE3D66uAOWyIk/VDMEdyjzMbjyVKb8AsSRzz
	 iJytX8gTPjgdyebhVk21IJI5zN//K2+yEvWDpwZ7qVjca7UKeZ9ntjCVC1Hylr1Of8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sCblpvWCEGWSGmqyLTXb89MP/KfXdJ6wTD0eb//JjLg=;
	b=WjfJ8Ho6zpEtHlXFaV9ZMPUV0MFJbU+HPI6em0MIyELUhwDiUfdZlyw7cxogM+3hXSId
	 bT9FZbxP2cJruwPcCYr5zUpPdRhV3QzgFTsBWMVjeMw3BW5V8zhJ48GkGYofPlDxSy2p7
	 wyo7sb08kytLcXWpu8/JIgW27TMAbr7bC3osJnFCTDVHB+Y5cBmr/yLPBDXebenD2J3yX
	 Uzjq7LMz/A3z+88Ql7vxh7P8rzFrSdZOsuutYy+h7lrH60/LkyoUEUe+2f1Q7azDPVrge
	 wLEybnrXFxMkf/pwfFDzQp7SaJnrR0rF7869HbpyksKBLxEKv+L5emPhAizbQ74u2TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxgHJVt7;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546B3606A336
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 546B3606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxgHJVt7
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so3325418a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335522; x=1795940322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCblpvWCEGWSGmqyLTXb89MP/KfXdJ6wTD0eb//JjLg=;
        b=kxgHJVt7FC7OGHNAwXHpSuQyyJcAEB0fLEUL/KRqeJ5wNrfNQnUCxQkW/P1m5dBYTx
         rMoWnNqF5532YzfFEm7O8Wb6/IEHXkBlaaHTZ6szRBtBpgvt18sOBPyuDQYtmH9M1gWo
         KJBbvpOnFEsmo5ozXwP8ZB0AlE+KkeZawbh8MHACZthtk+ds9qa9cR44r/cCLSwxDiaG
         iFtzqdkYZj7xlFsGjH3hpxLZZ3pdGY4IWxGFfdZ/b1BFjFU7nd7PNC5rKa3c99oQWT4G
         ZrTy4+4cyVsvXJURC1XdaY73hY4PGV1jYZAzscOX+Wbyf1XSuYYoY59KEzU4R2ae9LGK
         s8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335522; x=1795940322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCblpvWCEGWSGmqyLTXb89MP/KfXdJ6wTD0eb//JjLg=;
        b=LX9NH3KJuU9VJbGorIsIK2n7xcUKqK8MkA557O4m2T3h4G115hZjUPXicsAprP1W2q
         koQI4uMuLzS9E/HafNtHGSb1gmxziqX5wYDgkMAJSb2gW9gLF27WtxoyJ+zSXS+grN6e
         DxRKp295qa80NkQ1RRwdfD4WFqqbmFVpEX+hgzXws/oKw+rq+oykMEj4bozFZWfHu45r
         H3tgsEzF6iw4jOqvx3fb86bSK26K9Z1NP+yjwu/RLAguR6uDl8kbUToWZUrsxE74ywuz
         26sIzsm8zJWDUMrHr6OrKP5wsPDo1foRRQt+LzHHp9kzhw2A2S3zBVh5Vd9lhQZxEqww
         wBRw==
X-Forwarded-Encrypted: i=1; AL+hErEcaATknBdcwrP1VQ5IU868h3zVhEMDp3ekJh2hI2GSTd/aRWkV6OtupgvryGc3j7j8qSwz4z0GZ6bs1eI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kvC8OvsQC6TN6wFAqfCzvyN3huGBVWmSVGDS2u/fizUPTitC8
	I9JikEAgmV66lhAQPjYZmCqpqBv0eeo0KtqPshs7exP+iWRg47FlDivv
X-Gm-Gg: AZFdTZeWAHG9/dP3svWbTIDo0txldV98GiIrLT24idloE4iutBh6Z+6Cq3Y4x3iwWP6
	gPjIvZpVPVDRz6O4L9o1SalImzmQzxgYNO3FMljSpwYAqF8MlmlrwLKMTaDpQxOh4siDjPjHWFF
	/2Nnon9q9A+DyO4JKaPZZaBtBIEUwatxtyqkrhFpvyegsNy1NxvrcrlIkbeg0jJqNfsR3/5iiK2
	fNDhxZXNWzFS78XbluKj+BspbzUhMoB2SuEoqQS5qTBsSx5p2hZXP7ovBp6VLCRNQXg/VA7QFxp
	E5q5HsQKfwpAQZmgR5Qq8UR3LyYYE3/CUnccxwa0bBOXLrdUnXfwGrP5VFRxzZ1moqJspoHjrq7
	837bSexFPorMyksv9v0XKivl6A7QDGCtQf7XYJYgGIAAwGXgXZc5tgyzbVWErFix2BTEhda2H08
	NX9CEQCtOeEmATXA3h8YaoBFJurnRdEzT0UWTR4wFbO0b0yl1qC2S0ZU49+Q5+obplt3JKacjR+
	PNLLfOgwUEsXpRtGiHyJvgbY5kzxkck9hUKpmsj5iuDEbwaFFUMhY3rGc/EAJy0vyD2NVboG7QU
	IOA3qNhuFeJEaJhM1wYpAnHX76SBQKvzsY/RhmwMtroJRjyquJnw08tP9/K7k4I2a6/7C7w5bbv
	wAuWUwg54jA==
X-Received: by 2002:aa7:c4d9:0:b0:6b5:9731:90fa with SMTP id 4fb4d7f45d1cf-6ba37cc0ad9mr3980018a12.6.1795335521825;
        Sun, 22 Nov 2026 00:18:41 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:18:40 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 02/12] drm/panel: panel-hitachi-tx10d07vm0baa: Convert to use MIPI DBI bus
Date: Sun, 22 Nov 2026 10:18:10 +0200
Message-ID: <20261122081820.53199-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122081820.53199-1-clamor95@gmail.com>
References: <20261122081820.53199-1-clamor95@gmail.com>
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

Switch from a generic platform driver to a dedicated MIPI DBI Type B
driver.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
index 83c2af1be9755..318ece68b7806 100644
--- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
+++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
@@ -14,6 +14,7 @@
 #include <video/mipi_display.h>
 
 #include <drm/drm_mipi_dbi.h>
+#include <drm/drm_mipi_dbi_bus.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -25,7 +26,7 @@ static const struct regulator_bulk_data hitachi_tx10d07vm0baa_supplies[] = {
 
 struct hitachi_tx10d07vm0baa {
 	struct drm_panel panel;
-	struct mipi_dbi *dbi;
+	struct mipi_dbi_device *dbidev;
 
 	struct regulator_bulk_data *supplies;
 	struct gpio_desc *reset_gpio;
@@ -40,9 +41,10 @@ static inline struct hitachi_tx10d07vm0baa *to_hitachi_tx10d07vm0baa(struct drm_
 ({ \
 	const u8 d[] = { seq }; \
 	struct drm_panel *panel = &(priv)->panel; \
+	struct mipi_dbi_device *dbidev = (priv)->dbidev; \
 	struct device *dev = panel->dev; \
 	int ret; \
-	ret = mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_SIZE(d)); \
+	ret = mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRAY_SIZE(d)); \
 	if (ret) \
 		dev_err_ratelimited(dev, "error %d when sending command %#02x\n", ret, cmd); \
 	ret; \
@@ -54,10 +56,6 @@ static int hitachi_tx10d07vm0baa_prepare(struct drm_panel *panel)
 	struct device *dev = panel->dev;
 	int ret;
 
-	priv->dbi = dev_get_drvdata(dev->parent);
-	if (!priv->dbi)
-		return -ENODEV;
-
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(hitachi_tx10d07vm0baa_supplies), priv->supplies);
@@ -243,9 +241,9 @@ static const struct drm_panel_funcs hitachi_tx10d07vm0baa_panel_funcs = {
 	.get_modes = hitachi_tx10d07vm0baa_get_modes,
 };
 
-static int hitachi_tx10d07vm0baa_probe(struct platform_device *pdev)
+static int hitachi_tx10d07vm0baa_probe(struct mipi_dbi_device *dbidev)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = &dbidev->dev;
 	struct hitachi_tx10d07vm0baa *priv;
 	int ret;
 
@@ -264,6 +262,9 @@ static int hitachi_tx10d07vm0baa_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
 				     "Failed to get reset gpio\n");
 
+	priv->dbidev = dbidev;
+	mipi_dbi_set_drvdata(dbidev, priv);
+
 	ret = drm_panel_of_backlight(&priv->panel);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");
@@ -272,9 +273,7 @@ static int hitachi_tx10d07vm0baa_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add panel\n");
 
-	platform_set_drvdata(pdev, priv);
-
-	return 0;
+	return devm_mipi_dbi_attach(dev, dbidev);
 }
 
 static const struct of_device_id hitachi_tx10d07vm0baa_of_match[] = {
@@ -283,14 +282,14 @@ static const struct of_device_id hitachi_tx10d07vm0baa_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, hitachi_tx10d07vm0baa_of_match);
 
-static struct platform_driver hitachi_tx10d07vm0baa_driver = {
+static struct mipi_dbi_driver hitachi_tx10d07vm0baa_driver = {
 	.driver = {
 		.name = "panel-hitachi-tx10d07vm0baa",
 		.of_match_table = hitachi_tx10d07vm0baa_of_match,
 	},
 	.probe = hitachi_tx10d07vm0baa_probe,
 };
-module_platform_driver(hitachi_tx10d07vm0baa_driver);
+module_mipi_dbi_driver(hitachi_tx10d07vm0baa_driver);
 
 MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
 MODULE_DESCRIPTION("HITACHI TX10D07VM0BAA MIPI DBI Type B panel driver");
-- 
2.53.0

