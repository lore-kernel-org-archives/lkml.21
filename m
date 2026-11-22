Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795334907;
	b=KFPI1HdYuqcRQtJ+f6gub0vqEr/XGrFZwm/Se/1KvGd0RA825RSH0uxvaWV9KcHI2sOp
	 zne+yBzsrE0diYAx5Q3C+KblLJ07xbGpwChMdzmwDiF7vDTmoi9Aht817TJrHaF6RBoxP
	 2+rPPTHt1d7wNiEz7rSj/Zoz41hedWw/gUT1Md7xiFldZEytcpviITNKmGiabBN0PbZBz
	 5JARZuUfQPydu34aRYWUyjGCDfa370Z+Dsn1PE2sPevuDQRwz0eS5Bw09RPdjnJNAQbKC
	 sGgAb48RjHcvX/c/U2mXVXlEgF7dziiVzZzdYcmYOaWdJUq1ycPYeNOPLc0+1sEKpiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795334907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PMAfi4twJ36iN8tjhwSnMqn/E9zFaRT558AabvI1gwo=;
	b=LmZkaeufuB8Uu9kfGzjWezAFbKOkbB5WIheWGC+V2XByCX5CgdvODBDfHRRrcmYuK92C
	 m5VsBKB3bxBCDtV/KQz7Ad7ktlLxggSn9mjuRTokCB/dmTb/WVA6HQbAeQpUVBWx2+/Jc
	 78A5GQAT2s9bTAbbM9pSn2yAugVyQbefnKvpZbPQsrJxjgj7gP3gdKeAO4M9BjFqXyVac
	 0PKlKtfyGMoqJteYO/3FRDS6PciPmlooV446vs1qoKo9EloLuNaoURWBNVJtAWKttdO0N
	 2x0WVOC2xtI8lepGRKu0n5e1DiMagV4HbR467CIKya7umi9abRdjlJyxr3Xr2txF5Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dc3dnVTb;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD867606A333
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD867606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dc3dnVTb
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b86fcbd647so3700014a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795334905; x=1795939705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PMAfi4twJ36iN8tjhwSnMqn/E9zFaRT558AabvI1gwo=;
        b=Dc3dnVTbD08OYXiMiVb8/paCLnWLXrk1Vf+I5catzuaYGnphJsRHGk+Uo3EMpJkIxm
         9EVy7QX7NffyQqdSKXuTWdjVShSH/c3df/UfLxqlCasNFvXN7PBRXKt52rBLi2ZWkJcT
         nuWG8ECjWs9B4ytMwQPL1nIC3/RfBIiDjyN5nNr0ueH+SOqpK7Eqar6l5YrmTRhdosE5
         jajhdidU93UA1O+DjdzXdIayKTazHOdqOs5YUhQaXor9bcVdHBZYF62Omj6jgQNHoE1J
         +/yyIqLDkWl91gQQXOD/qwhyP0Qavnv2e6LcHDKXNo5jNPoSpIHlu+tsQmYbPzXBFni0
         wLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795334905; x=1795939705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PMAfi4twJ36iN8tjhwSnMqn/E9zFaRT558AabvI1gwo=;
        b=2jle1P4XsbQiiBawTpBUX16fbhSh27WDJRth0/N+tfrcjr0/WCmsyVzDI+2SERud9k
         Y3rcWhhbG5gtj38lLk+9Cb3RYbiaYXxORmlrlbUIPGocUaRff0N3prZ+LegqQLzZqLRd
         pkR6orfMSX/hpyMH7ub4xQn2vg8s7IQZJiJ0j1fyF4wIXoYsFUpe/r9iKjxNndp/drrD
         a1vXgMlb5XjBwIYSrkP/DHibV7IEy/6K33A2EhEcq//QLWAwi2pryPzepLKMlvtu6ftG
         grqozaxBc8CjGu6L+xTG4g2do0mO6geD6NfxFti+ER0I8RejFmSTNkKXISYffrgqOpxm
         9r+g==
X-Forwarded-Encrypted: i=1; AL+hErEMn7fN6eUvnYHab4VNSUyWwNMvv1rPtNTDyhyaqc7TS88VbHMiSqnY/KtyWCxGbgVCSywzm0BuuMWguyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h3Mi3FCs+UA/UhuHrr5+gzapf8RJ3F3mbD2jaeC/rBGflXGSg
	M29kNF+PBHdsW70/is/FK+tOzkABIalLwN+qyKH/+XZdZ3A8bM9fmaol
X-Gm-Gg: AZFdTZdGFxBQzU3vshZkfYNzpQeess58WIhFRoBBFAlTNH5U8AHHCVKCdKnXMkQTht5
	ybCb3fIyppZHFEq29PNS+5xGuq4Fz84VBJj4LvlEYv/5Ne2Uu5Lh7ijP8Dxqr0YdzY4UaicFt1B
	Pq+qmwzQrLqdaaTASSE0oU4HmP3quFVQfTMT14vymNo7auBiVZONL3+N97aoD11hYa0VQi5XQf8
	wnipedikU2HtZ77FNaHgO9BqbddOA3emkFEA/0S/tj7J3W/D4Aqz/6d87QzbIHM+ofu52lTSpRm
	6KanbAkyAcuMMgcLhbjC4Mqqfh5TanCMJhTBMZSFTT+rg/RDes4+J3dJX4v9opAPnhhHp+IN7nw
	Soun7KuWIO62GojOsV8Abj4Tv98WZQxsk4gpD7obueR/MOSbXnlkNSHXsvSIUJylcul46vXh+3U
	JiVWrjTTNUkk1bscoYmAMPHDya4wYiwjEr99T4xFmwt6/g2U7DkzB0VwzbKABKrOr8dIWz3z8A4
	RFko5aGcNTJekSAVRTjIX9m92OTUUOz2cMu8pUBSf3v49pJA6CW7TfEvEV9/K/wQjdIvBBCMzwa
	x26TveSES4shO32ewEeB1iUnZoehrI7Fh1csA1q9pfIJLqJziYhD3Z9b09WkbpiIuVHpgz6XzjY
	9OLJwWoUFhA==
X-Received: by 2002:a05:6402:28c3:b0:6b7:fc6b:a041 with SMTP id 4fb4d7f45d1cf-6ba37ac5b6bmr5649236a12.0.1795334905184;
        Sun, 22 Nov 2026 00:08:25 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3710601esm3596014a12.27.2026.11.22.00.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:08:23 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] iio: light: ltr501: Switch to modern match mechanism
Date: Sun, 22 Nov 2026 10:07:51 +0200
Message-ID: <20261122080753.36349-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122080753.36349-1-clamor95@gmail.com>
References: <20261122080753.36349-1-clamor95@gmail.com>
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

Remove the chip enum, break the chip list structure into individual
elements, and pass each element using i2c_get_match_data().

Preserve the iio_dev name configuration and replace the
iio_get_acpi_device_name_and_data() call with a simple dev_name(), since
the former is just a wrapper for the latter in this use case.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/ltr501.c | 164 +++++++++++++++++--------------------
 1 file changed, 74 insertions(+), 90 deletions(-)

diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
index 9e660ec4e25e7..a471c90cf0a75 100644
--- a/drivers/iio/light/ltr501.c
+++ b/drivers/iio/light/ltr501.c
@@ -90,14 +90,6 @@ struct ltr501_samp_table {
 
 #define LTR501_RESERVED_GAIN -1
 
-enum {
-	ltr301,
-	ltr303,
-	ltr329,
-	ltr501,
-	ltr559,
-};
-
 struct ltr501_gain {
 	int scale;
 	int uscale;
@@ -1178,62 +1170,64 @@ static const struct iio_info ltr501_info = {
 	.write_event_config = &ltr501_write_event_config,
 };
 
-static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
-	[ltr301] = {
-		.partid = 0x08,
-		.als_gain = ltr501_als_gain_tbl,
-		.als_gain_tbl_size = ARRAY_SIZE(ltr501_als_gain_tbl),
-		.als_mode_active = BIT(0) | BIT(1),
-		.als_gain_mask = BIT(3),
-		.als_gain_shift = 3,
-		.channels = ltr301_channels,
-		.no_channels = ARRAY_SIZE(ltr301_channels),
-	},
-	[ltr303] = {
-		.partid = 0x0A,
-		.als_gain = ltr559_als_gain_tbl,
-		.als_gain_tbl_size = ARRAY_SIZE(ltr559_als_gain_tbl),
-		.als_mode_active = BIT(0),
-		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
-		.als_gain_shift = 2,
-		.channels = ltr301_channels,
-		.no_channels = ARRAY_SIZE(ltr301_channels),
-	},
-	[ltr329] = {
-		.partid = 0x0A,
-		.als_gain = ltr559_als_gain_tbl,
-		.als_gain_tbl_size = ARRAY_SIZE(ltr559_als_gain_tbl),
-		.als_mode_active = BIT(0),
-		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
-		.als_gain_shift = 2,
-		.no_irq_support = true,
-		.channels = ltr301_channels,
-		.no_channels = ARRAY_SIZE(ltr301_channels),
-	},
-	[ltr501] = {
-		.partid = 0x08,
-		.als_gain = ltr501_als_gain_tbl,
-		.als_gain_tbl_size = ARRAY_SIZE(ltr501_als_gain_tbl),
-		.ps_gain = ltr501_ps_gain_tbl,
-		.ps_gain_tbl_size = ARRAY_SIZE(ltr501_ps_gain_tbl),
-		.als_mode_active = BIT(0) | BIT(1),
-		.als_gain_mask = BIT(3),
-		.als_gain_shift = 3,
-		.channels = ltr501_channels,
-		.no_channels = ARRAY_SIZE(ltr501_channels),
-	},
-	[ltr559] = {
-		.partid = 0x09,
-		.als_gain = ltr559_als_gain_tbl,
-		.als_gain_tbl_size = ARRAY_SIZE(ltr559_als_gain_tbl),
-		.ps_gain = ltr559_ps_gain_tbl,
-		.ps_gain_tbl_size = ARRAY_SIZE(ltr559_ps_gain_tbl),
-		.als_mode_active = BIT(0),
-		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
-		.als_gain_shift = 2,
-		.channels = ltr501_channels,
-		.no_channels = ARRAY_SIZE(ltr501_channels),
-	},
+static const struct ltr501_chip_info ltr301_chip_info_tbl = {
+	.partid = 0x08,
+	.als_gain = ltr501_als_gain_tbl,
+	.als_gain_tbl_size = ARRAY_SIZE(ltr501_als_gain_tbl),
+	.als_mode_active = BIT(0) | BIT(1),
+	.als_gain_mask = BIT(3),
+	.als_gain_shift = 3,
+	.channels = ltr301_channels,
+	.no_channels = ARRAY_SIZE(ltr301_channels),
+};
+
+static const struct ltr501_chip_info ltr303_chip_info_tbl = {
+	.partid = 0x0A,
+	.als_gain = ltr559_als_gain_tbl,
+	.als_gain_tbl_size = ARRAY_SIZE(ltr559_als_gain_tbl),
+	.als_mode_active = BIT(0),
+	.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
+	.als_gain_shift = 2,
+	.channels = ltr301_channels,
+	.no_channels = ARRAY_SIZE(ltr301_channels),
+};
+
+static const struct ltr501_chip_info ltr329_chip_info_tbl = {
+	.partid = 0x0A,
+	.als_gain = ltr559_als_gain_tbl,
+	.als_gain_tbl_size = ARRAY_SIZE(ltr559_als_gain_tbl),
+	.als_mode_active = BIT(0),
+	.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
+	.als_gain_shift = 2,
+	.no_irq_support = true,
+	.channels = ltr301_channels,
+	.no_channels = ARRAY_SIZE(ltr301_channels),
+};
+
+static const struct ltr501_chip_info ltr501_chip_info_tbl = {
+	.partid = 0x08,
+	.als_gain = ltr501_als_gain_tbl,
+	.als_gain_tbl_size = ARRAY_SIZE(ltr501_als_gain_tbl),
+	.ps_gain = ltr501_ps_gain_tbl,
+	.ps_gain_tbl_size = ARRAY_SIZE(ltr501_ps_gain_tbl),
+	.als_mode_active = BIT(0) | BIT(1),
+	.als_gain_mask = BIT(3),
+	.als_gain_shift = 3,
+	.channels = ltr501_channels,
+	.no_channels = ARRAY_SIZE(ltr501_channels),
+};
+
+static const struct ltr501_chip_info ltr559_chip_info_tbl = {
+	.partid = 0x09,
+	.als_gain = ltr559_als_gain_tbl,
+	.als_gain_tbl_size = ARRAY_SIZE(ltr559_als_gain_tbl),
+	.ps_gain = ltr559_ps_gain_tbl,
+	.ps_gain_tbl_size = ARRAY_SIZE(ltr559_ps_gain_tbl),
+	.als_mode_active = BIT(0),
+	.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
+	.als_gain_shift = 2,
+	.channels = ltr501_channels,
+	.no_channels = ARRAY_SIZE(ltr501_channels),
 };
 
 static int ltr501_write_contr(struct ltr501_data *data, u8 als_val, u8 ps_val)
@@ -1398,9 +1392,7 @@ static int ltr501_probe(struct i2c_client *client)
 	struct ltr501_data *data;
 	struct iio_dev *indio_dev;
 	struct regmap *regmap;
-	const void *ddata = NULL;
-	int partid, chip_idx;
-	const char *name;
+	int partid;
 	int j = 0;
 	int ret;
 
@@ -1481,18 +1473,10 @@ static int ltr501_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	if (id) {
-		name = id->name;
-		chip_idx = id->driver_data;
-	} else {
-		name = iio_get_acpi_device_name_and_data(&client->dev, &ddata);
-		chip_idx = (intptr_t)ddata;
-	}
-	if (!name)
+	data->chip_info = i2c_get_match_data(client);
+	if (!data->chip_info)
 		return -ENODEV;
 
-	data->chip_info = &ltr501_chip_info_tbl[chip_idx];
-
 	if ((partid >> 4) != data->chip_info->partid)
 		return -ENODEV;
 
@@ -1514,7 +1498,7 @@ static int ltr501_probe(struct i2c_client *client)
 	indio_dev->info = &ltr501_info;
 	indio_dev->channels = data->chip_info->channels;
 	indio_dev->num_channels = data->chip_info->no_channels;
-	indio_dev->name = name;
+	indio_dev->name = id ? id->name : dev_name(&client->dev);
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
 	ret = ltr501_init(data);
@@ -1585,29 +1569,29 @@ static int ltr501_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(ltr501_pm_ops, ltr501_suspend, ltr501_resume);
 
 static const struct acpi_device_id ltr_acpi_match[] = {
-	{ .id = "LTER0301", .driver_data = ltr301 },
+	{ .id = "LTER0301", .driver_data = (kernel_ulong_t)&ltr301_chip_info_tbl },
 	/* https://www.catalog.update.microsoft.com/Search.aspx?q=lter0303 */
-	{ .id = "LTER0303", .driver_data = ltr303 },
+	{ .id = "LTER0303", .driver_data = (kernel_ulong_t)&ltr303_chip_info_tbl },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ltr_acpi_match);
 
 static const struct i2c_device_id ltr501_id[] = {
-	{ .name = "ltr301", .driver_data = ltr301 },
-	{ .name = "ltr303", .driver_data = ltr303 },
-	{ .name = "ltr329", .driver_data = ltr329 },
-	{ .name = "ltr501", .driver_data = ltr501 },
-	{ .name = "ltr559", .driver_data = ltr559 },
+	{ .name = "ltr301", .driver_data = (kernel_ulong_t)&ltr301_chip_info_tbl },
+	{ .name = "ltr303", .driver_data = (kernel_ulong_t)&ltr303_chip_info_tbl },
+	{ .name = "ltr329", .driver_data = (kernel_ulong_t)&ltr329_chip_info_tbl },
+	{ .name = "ltr501", .driver_data = (kernel_ulong_t)&ltr501_chip_info_tbl },
+	{ .name = "ltr559", .driver_data = (kernel_ulong_t)&ltr559_chip_info_tbl },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltr501_id);
 
 static const struct of_device_id ltr501_of_match[] = {
-	{ .compatible = "liteon,ltr301", },
-	{ .compatible = "liteon,ltr303", },
-	{ .compatible = "liteon,ltr329", },
-	{ .compatible = "liteon,ltr501", },
-	{ .compatible = "liteon,ltr559", },
+	{ .compatible = "liteon,ltr301", .data = &ltr301_chip_info_tbl },
+	{ .compatible = "liteon,ltr303", .data = &ltr303_chip_info_tbl },
+	{ .compatible = "liteon,ltr329", .data = &ltr329_chip_info_tbl },
+	{ .compatible = "liteon,ltr501", .data = &ltr501_chip_info_tbl },
+	{ .compatible = "liteon,ltr559", .data = &ltr559_chip_info_tbl },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ltr501_of_match);
-- 
2.53.0

