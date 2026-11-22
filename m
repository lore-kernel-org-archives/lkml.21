Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335531;
	b=PUMdPRq5nnb9Atdf59xWfd2Q1E04ZyKhG31sjyd8aWN1wGv0jUNz3xfMrbxamoIsyRyK
	 R3oKTOzKOO1wcApad6nZkBd8n/Akbcf7+7PPyU1UFv97EZOkOsrMteDyOi5pB5HgXICdR
	 B9dKv5EzUVZNmW9vW3KxY02x+cdna+Kowd+lYK2COYjdHjaGkW8WOnCXen2dl1ntYyU7r
	 mi2qnLg/clGWn7xlXBWOkLBSs9xFmHbWF+BY+cjXXkCn5TvqyAl2khHC5m5J27NcIQuY8
	 Ta7ggJAasf+Junrtt99/QPRCTARFdpEQ5x/+f56OTIHHSQJ+K4Q8oJuwiQkTlGEkhkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p3WSfUrzAFZ6C8avlWVorHXjO1aUqVAyT5MLm+GUqW8=;
	b=w+ObodcNexCnCKXZVqpXduakWBPre2i7BoPjjQlxX5m3LjPd1OF/gsU7BJGPQzG9KXTr
	 iEsfDF5THP3vH95ZtvpA76mO0r06uUfiu/Wo3BP0UaCyCWYmby7rM2RnSlW/by2sENyWL
	 gglcDaMaeH/fYUKxQWMj8BqvT7Xxj1lGFpEytAahwNZ8ao4mikZLKczvdczfah/xjrWJY
	 tGm8taTQSNiEzKR1imcWl8xl3stYg8zmPFEdUkbEpTw76/5GhOoY7Pa7Y1wpRNscCRQKK
	 O3Mnkj0rjCmw1RvZz5Oy2ua8kNyh6fjTyQWONWFjgmdX5NutheLc+5jpTdOSHPWOoFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bB26HDf6;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C72E606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C72E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bB26HDf6
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b8c60e0d39so2787376a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335530; x=1795940330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3WSfUrzAFZ6C8avlWVorHXjO1aUqVAyT5MLm+GUqW8=;
        b=bB26HDf600jdMqxCKutJPmbsqrb8UZ5Jx77PmaK8AmGNXP9Zdth99ToXahTI8I9fGH
         k0j7n049EpqXTbWdvSbQKB721kBIAY40T4HdjoZ8WR9jjHaoSBwUlQN51ul0nSGrRr1g
         p5hUYJx08CxznYsnpigmJdThiVzp1tdAMyTKPrLICt2jPoS1vW89davjz7D/4ZVJmuR/
         5z4EhvXS9X2PSggMbIKii2kA3xhUY3epdlmLrEB4zQ7x5UUdRqSiNbi74OVc2SfzePkk
         nmmA/VdUeyD44VTJnPIcYrZ4YGdrh0QZSQ/Z+x0dWvU3V9KzvshiINP6/S/4h1V0AMc9
         FFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335530; x=1795940330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p3WSfUrzAFZ6C8avlWVorHXjO1aUqVAyT5MLm+GUqW8=;
        b=AFSyFiOtvexP/T+9F4PcYfFtZQTxH5peDLl0WAAUvcYZUqP8sXoOtOb3+IFdB2PD/z
         6MLAXuir2kWcRD8bTO74Ut82BQg60aS/o2qCNV9XeacGO4kBcoLuZqACXZFOVE5BTxSF
         OrDPjMqAGlKaKtjC3CXtOFB5yxJHgb4YEoavKdI/4IB4aAbCbfbqFzClzrdqrgpw2PLw
         tN651jSZdcEIZE4Uec9dGeMWB2wdSidgAzYvrTQpT75rXlmgiWTTwyY47/knKHXz2GHE
         sS8M2lxntMKbkmLfYSinb5low7azm0qW+Fk5fU9oXUU5m874fycYikptn3PLsf5lXX44
         sLiw==
X-Forwarded-Encrypted: i=1; AL+hErE8fvwPAAqetU7b98S6u+oyYcL8aECoNOX75Cq2m0I8X58r9lSzmRRHYWNj2xEgC8e6318K0re25otqWW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kLho0NHZqDPR8pjGvaNaLTmTMVCFrOi7a9EGFlMxn8nOX2GSz
	8mMood+SQaVi+cisnpN/szZC7JAuOV2PuIFHJTsmaqxgGZHdrgmJt2Y/
X-Gm-Gg: AZFdTZfbLS+vSazlwE1tZJO4LBBLqcXth/9eVpKkv/x/HxHg5fUnSpsj5YltxkKo6UV
	XmXY//mT9N88vPbJnqrQn7+no+RsLQHJHr+uWxoCx5tz5OhOBnl3X9IyjU1rA+wXfeNGrFpp7dQ
	UcaxqQ2jVrE+970tihqRamlAmfJUXV1Tq8sILPQUa18CxBxcSnJZT5Fs21G4IVOgC09/2tUEDc7
	AhsI7pkB1cmJJaoJNAm5kLr3Fgyi3u/jrUnTKnYv5azXbxKxJ7tMFUyg+umxhJali1n1uBSmltN
	HdT4+EKIZ0uj6uF2gNcYpfuKmBpRpyDMou9oFGGo+tOCxUY3sa/RfZ0EJLf7F0/h91AoM4J0aGS
	5nEpKlN0NFj1WRo5dj9i6CEBZUOBnNzFIKSZWO5Q1Ife6KLiNyk/kuDpiwqH9H27Luel2j6Cpq2
	QVKMi3tH77XZhGPEb0wJOKb4J9oIQ6SVkO+qUvMkWJE0AjEwYTfrSzJHBj3RMr+9vsYD8cCqrhb
	M5ODiP+hOp6L6/VWHRo8VpLj6/bgeHMM+vXn3eptyET3XhKCx/xA5ASuoCwKoUGQ02+MXmeXzeH
	6c8LsYEtStECCr2+O6dspQwfsJlABq5/ZhAKoMhSBiqID+i4QmJE7XW/KCsZCkfi3Q4u/gMxVKs
	+4tZY+F8q9yOMSdebM2cPbxsSRID/ptc=
X-Received: by 2002:a05:6402:320f:b0:6b4:59d0:7294 with SMTP id 4fb4d7f45d1cf-6ba37e9ec85mr6083730a12.31.1795335529477;
        Sun, 22 Nov 2026 00:18:49 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:18:47 -0800 (PST)
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
Subject: [PATCH v8 04/12] drm/panel: panel-lg-lh400wv3: Convert to use MIPI DBI bus
Date: Sun, 22 Nov 2026 10:18:12 +0200
Message-ID: <20261122081820.53199-5-clamor95@gmail.com>
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
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c | 27 +++++++++++------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
index 557bcb6f2ca70..63efeb434be13 100644
--- a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
+++ b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
@@ -14,6 +14,7 @@
 #include <video/mipi_display.h>
 
 #include <drm/drm_mipi_dbi.h>
+#include <drm/drm_mipi_dbi_bus.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -25,7 +26,7 @@ static const struct regulator_bulk_data lg_lh400wv3_supplies[] = {
 
 struct lg_lh400wv3 {
 	struct drm_panel panel;
-	struct mipi_dbi *dbi;
+	struct mipi_dbi_device *dbidev;
 
 	struct regulator_bulk_data *supplies;
 	struct gpio_desc *reset_gpio;
@@ -40,9 +41,10 @@ static inline struct lg_lh400wv3 *to_lg_lh400wv3(struct drm_panel *panel)
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
@@ -54,10 +56,6 @@ static int lg_lh400wv3_prepare(struct drm_panel *panel)
 	struct device *dev = panel->dev;
 	int ret;
 
-	priv->dbi = dev_get_drvdata(dev->parent);
-	if (!priv->dbi)
-		return -ENODEV;
-
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(lg_lh400wv3_supplies), priv->supplies);
@@ -129,7 +127,7 @@ static int lg_lh400wv3_disable(struct drm_panel *panel)
 	usleep_range(10000, 11000);
 
 	return 0;
-};
+}
 
 static int lg_lh400wv3_unprepare(struct drm_panel *panel)
 {
@@ -182,9 +180,9 @@ static const struct drm_panel_funcs lg_lh400wv3_panel_funcs = {
 	.get_modes = lg_lh400wv3_get_modes,
 };
 
-static int lg_lh400wv3_probe(struct platform_device *pdev)
+static int lg_lh400wv3_probe(struct mipi_dbi_device *dbidev)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = &dbidev->dev;
 	struct lg_lh400wv3 *priv;
 	int ret;
 
@@ -203,6 +201,9 @@ static int lg_lh400wv3_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
 				     "Failed to get reset gpio\n");
 
+	priv->dbidev = dbidev;
+	mipi_dbi_set_drvdata(dbidev, priv);
+
 	ret = drm_panel_of_backlight(&priv->panel);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");
@@ -211,9 +212,7 @@ static int lg_lh400wv3_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add panel\n");
 
-	platform_set_drvdata(pdev, priv);
-
-	return 0;
+	return devm_mipi_dbi_attach(dev, dbidev);
 }
 
 static const struct of_device_id lg_lh400wv3_of_match[] = {
@@ -222,14 +221,14 @@ static const struct of_device_id lg_lh400wv3_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lg_lh400wv3_of_match);
 
-static struct platform_driver lg_lh400wv3_driver = {
+static struct mipi_dbi_driver lg_lh400wv3_driver = {
 	.driver = {
 		.name = "panel-lg-lh400wv3",
 		.of_match_table = lg_lh400wv3_of_match,
 	},
 	.probe = lg_lh400wv3_probe,
 };
-module_platform_driver(lg_lh400wv3_driver);
+module_mipi_dbi_driver(lg_lh400wv3_driver);
 
 MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
 MODULE_DESCRIPTION("LG LH400WV3-SD04 MIPI DBI Type B panel driver");
-- 
2.53.0

