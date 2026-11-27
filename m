Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795818786;
	b=Ef0XalgCIgN1w0FjDlqGbQZIwvsYBHvMxb8N18UGyNmPyuJUrUy7J1T5kSMH2AKoIAy8
	 BBjElTgP630h+CtdISWeIST4y7WlHPaXX9Goijo7wEDURMD5jZ3EwER4NMZmEA46W+Xkh
	 7O549KzNZQdBPP2jy8icyE3GF+ZI0RXqwrlKS9GS8u1nWr6K9cngKgd7E/cUvvkhiS5Mv
	 Us3YtFp64j0SEvS0iFG+BoYabXSItPwV5m5NbRm+4p/Kaq1DdnWimwTWJoOGE3Tq5oxox
	 to38B9BNFj+Qi/D1jUCyQ+xDTXW3YiZrds7Td0u0mhzSduhi3oPi1IxHpehEHOhfpmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795818786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CrQD3lwMnz0z6petJkG+bLaq3UykExl4nKzRKQ7m+nQ=;
	b=R3OVaBC/75OM6I5QpodkSkG8OId8S7saBx+08u3myFY97rttkFSfOeHRLH19veTc5YLw
	 ryRv5TvbJ3GYzCWQH9Eg0F9wc2/llWLCNChkBEijO2oNw+uocPpqwcB6GpwCa3eK+WfiR
	 yAJOxGfb2CI0XuKn0O46sV7fUoU+84lCSLD+Kicw4d+1R2AxVZun4AwGmCJe5kBq4EhNF
	 LXGYZNzgzUP3Lc+yij75mQ1S7U+Qm+bMF8eXu3q5saJfdrrty31pEnXLd1VEVHAvy+Ldx
	 ev9D5y3xILVweoZ+0zrfsx8WDN1jw124mu+oCo7aG4l7IUV6HqHq1uW+UAWl86vDAeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U0fb5O4q;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D4F606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6D4F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U0fb5O4q
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so5827865f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795818784; x=1796423584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrQD3lwMnz0z6petJkG+bLaq3UykExl4nKzRKQ7m+nQ=;
        b=U0fb5O4qfhP5SKYTzf5w5qGHB3hYCAD52OjrDQL6AnWRhWfdPFC8RGiWWi61e9sToq
         OnU3km4yk54UTQ7i5Rlb+Wz6V1U4o+BJW7uIFEUMNvd3RNIm1nz5TZL5HmMM88IceXjA
         zsvs+ruwKAXsDA6HrHpEKcuZvoBaKP9oKde6hRTGfndf+XEF5j7nIw9QJfHHktW6Y4yj
         V1kEE/XPUIQtfKp37qRlBGrVk8eWrS9Oh73W/0ly3ur/KHuebuKj0rovP8+09wIdV2Xd
         SCw6MjdRpc074SRXu6K1pBH9IBxHCe7eIcAjbcgxn44zWAJsxA2fI3Ztn02erjR41uST
         ZJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795818784; x=1796423584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CrQD3lwMnz0z6petJkG+bLaq3UykExl4nKzRKQ7m+nQ=;
        b=kbAAOezgoeuZsdJgUHglKc8BAcS+yBRhyUKKGGvdHUy/5wk853XlWRQpiTaVmVY+4g
         hTV0LiKTTn4MvYEwUA0kTtWs+yeqiihfafthiPlmHVEVNqRqaE44gk2cdz8kWpjA6aTm
         9LRcqQxFKNv8vIDxZv/4z2hIuKKkHeiy/dgVXQSSanB1SHinDrskdNZnnod/HN9/jMZx
         mN7Nu6dMDUjM4B4cfYolkE3cDaqR2fITuhGOP1SXZE9kDqSbTmYjr9419YLQxTFTRrvh
         PcHrUoR+hvWC41fWdMzfPZ5EcOVZyxhmLURYysLiQW4/CWcIzvZsQXmISjkpscmc6MiS
         9Mqg==
X-Forwarded-Encrypted: i=1; AL+hErH9LFsbp3LnRY13r3zXjRYFJrWWoUiSfO9p8QmomWMaGn/IVdlcRDUZb32UyxmXhbjLNF0JU3Sy2yevrNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+714yHfHBZ0DerM6zmBR5R7C4R0Vm3txG4HQ0mLRgpvaCJiamH
	8vgfp7HIFqFX2LGT0ZPu+AAlSXLwH2Bk8krxGOBOVo7h/rV2gZv9eNYn
X-Gm-Gg: AZFdTZfYG2Eov6hVBb4SieNlusEiYm/KqgeFt+jxvtLGS2HEeDe7e1YbJbsN5jpvBHr
	wt1DtXStHB2l4Nu1ohHM6eRd9LM4N6nqjDI0gn9URz2Kot8gHgy/HeGXkY+v4MXq4BS0fduT5/h
	//m6U4myOxxtM1RSnaI0dz6480Q2xUXhnqo+7C3AFiW/HlIbvHJhf/Z0PcP+oNed1QvHtP8Axi2
	5S0izCGVeQGpB5oLs+JX74lqU+6gPMahQAWSsaGDU6E4mxKkw4AMcjfNsnltNfMYtGZNLyknJu+
	ZBs/0FO9sI/1IQtX+3YUQuIaa2meBw1EY8OckwVHvr+Oi2agqQxQZaSzi4T9vAQg67I6CQn2Bzq
	/lgCCcf5XivhY+x3UL4GklGkGnbXtvgYOI5UeuYj01/h0XOsJgPFxAIz2KW2bZNptVum/s6iAPj
	HtInNxjR8Si+IvsEmqGGrH6TzZZ8kjnyMrmFfwx0e1eztfM5CywY53kQlFuN6qHL62toZGUld5v
	U9WY+KA8HxhxYb4VAMK8ACpUVOsNkAs/ouymLQWsRCl6zEi5T7BtXfwZ950L2D2yObpIeixUQMc
	J0gMFupCkyeozeqq5O6HBIVfwpy3QWuV
X-Received: by 2002:a05:6000:3107:b0:4aa:1ae2:ff2a with SMTP id ffacd0b85a97d-4abaa977260mr61370948f8f.2.1795818784066;
        Fri, 27 Nov 2026 14:33:04 -0800 (PST)
Received: from [127.0.1.1] ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm50430285f8f.20.2026.11.27.14.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 14:33:03 -0800 (PST)
From: =?utf-8?q?Adil_H=C3=BCsrev_Tepe?= <tadilhusrev@gmail.com>
Date: Sat, 28 Nov 2026 01:32:55 +0300
Subject: [PATCH v2 3/3] power: supply: s2mu005-battery: add S2MU106 support
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261128-s2mu106-fg-v2-3-2c3142e05aaf@gmail.com>
References: <20261128-s2mu106-fg-v2-0-2c3142e05aaf@gmail.com>
In-Reply-To: <20261128-s2mu106-fg-v2-0-2c3142e05aaf@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Yassine Oudjana <y.oudjana@protonmail.com>, 
 =?utf-8?q?Adil_H=C3=BCsrev_Tepe?= <tadilhusrev@gmail.com>
X-Mailer: b4 0.16.0

The S2MU106 fuel gauge uses the same STATUS/RVBAT/RCURCC/RSOC registers
and scaling as the S2MU005, but has no MONOUT averaging path; reading the
averaged voltage and current through it returns bogus values. Add a
per-variant descriptor so the S2MU106 exposes only the instantaneous
voltage, current, capacity and status, and derive the status from the
instantaneous current when no average is available.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 drivers/power/supply/s2mu005-battery.c | 61 +++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 9 deletions(-)

diff --git a/drivers/power/supply/s2mu005-battery.c b/drivers/power/supply/s2mu005-battery.c
index 9798a62ffec..a1bd9ffdd61 100644
--- a/drivers/power/supply/s2mu005-battery.c
+++ b/drivers/power/supply/s2mu005-battery.c
@@ -38,6 +38,7 @@ struct s2mu005_fg {
 	struct regmap *regmap;
 	struct power_supply *psy;
 	struct mutex monout_mutex;
+	bool has_monout;
 };
 
 static const struct regmap_config s2mu005_fg_regmap_config = {
@@ -168,16 +169,18 @@ static int s2mu005_fg_get_capacity(struct s2mu005_fg *priv, int *value)
 
 static int s2mu005_fg_get_status(struct s2mu005_fg *priv, int *value)
 {
-	int current_now, current_avg, capacity;
+	int current_now, current_avg = -1, capacity;
 	int ret;
 
 	ret = s2mu005_fg_get_current_now(priv, &current_now);
 	if (ret < 0)
 		return ret;
 
-	ret = s2mu005_fg_get_current_avg(priv, &current_avg);
-	if (ret < 0)
-		return ret;
+	if (priv->has_monout) {
+		ret = s2mu005_fg_get_current_avg(priv, &current_avg);
+		if (ret < 0)
+			return ret;
+	}
 
 	/*
 	 * Verify both current values reported to reduce inaccuracies due to
@@ -240,12 +243,47 @@ static const struct power_supply_desc s2mu005_fg_desc = {
 	.get_property = s2mu005_fg_get_property,
 };
 
+/*
+ * The S2MU106 fuel gauge shares the direct STATUS/RVBAT/RCURCC/RSOC
+ * registers and their scaling, but not the MONOUT average-monitoring path,
+ * so the averaged voltage and current are not exposed on it.
+ */
+static const enum power_supply_property s2mu106_fg_properties[] = {
+	POWER_SUPPLY_PROP_VOLTAGE_NOW,
+	POWER_SUPPLY_PROP_CURRENT_NOW,
+	POWER_SUPPLY_PROP_CAPACITY,
+	POWER_SUPPLY_PROP_STATUS,
+};
+
+static const struct power_supply_desc s2mu106_fg_desc = {
+	.name = "s2mu106-fuel-gauge",
+	.type = POWER_SUPPLY_TYPE_BATTERY,
+	.properties = s2mu106_fg_properties,
+	.num_properties = ARRAY_SIZE(s2mu106_fg_properties),
+	.get_property = s2mu005_fg_get_property,
+};
+
+struct s2mu005_fg_variant {
+	const struct power_supply_desc *desc;
+	bool has_monout;
+};
+
+static const struct s2mu005_fg_variant s2mu005_fg_variant = {
+	.desc = &s2mu005_fg_desc,
+	.has_monout = true,
+};
+
+static const struct s2mu005_fg_variant s2mu106_fg_variant = {
+	.desc = &s2mu106_fg_desc,
+	.has_monout = false,
+};
+
 static int s2mu005_fg_i2c_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct s2mu005_fg *priv;
 	struct power_supply_config psy_cfg = {};
-	const struct power_supply_desc *psy_desc;
+	const struct s2mu005_fg_variant *variant;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -264,11 +302,12 @@ static int s2mu005_fg_i2c_probe(struct i2c_client *client)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to initialize MONOUT mutex\n");
 
-	psy_desc = device_get_match_data(dev);
+	variant = device_get_match_data(dev);
+	priv->has_monout = variant->has_monout;
 
 	psy_cfg.drv_data = priv;
 	psy_cfg.fwnode = dev_fwnode(dev);
-	priv->psy = devm_power_supply_register(priv->dev, psy_desc, &psy_cfg);
+	priv->psy = devm_power_supply_register(priv->dev, variant->desc, &psy_cfg);
 	if (IS_ERR(priv->psy))
 		return dev_err_probe(dev, PTR_ERR(priv->psy),
 				     "failed to register power supply subsystem\n");
@@ -276,7 +315,7 @@ static int s2mu005_fg_i2c_probe(struct i2c_client *client)
 	if (client->irq > 0) {
 		ret = devm_request_threaded_irq(priv->dev, client->irq, NULL,
 						s2mu005_handle_irq, IRQF_ONESHOT,
-						psy_desc->name, priv);
+						variant->desc->name, priv);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to request IRQ\n");
 	}
@@ -287,7 +326,11 @@ static int s2mu005_fg_i2c_probe(struct i2c_client *client)
 static const struct of_device_id s2mu005_fg_of_match_table[] = {
 	{
 		.compatible = "samsung,s2mu005-fuel-gauge",
-		.data = &s2mu005_fg_desc,
+		.data = &s2mu005_fg_variant,
+	},
+	{
+		.compatible = "samsung,s2mu106-fuel-gauge",
+		.data = &s2mu106_fg_variant,
 	},
 	{ }
 };

-- 
2.53.0

