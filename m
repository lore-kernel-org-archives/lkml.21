Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795885103;
	b=PP51Y/BEbP0vdJ+sDNVhhi98QJYbXCgMLWsfDH2zzPV7JS5x5yi3WlEwoUinxPsdmLam
	 OdpehwafN6VvMMSE+FY1tHL6Kc5//GuVtFKYYyVjsXi/qx3MdlUcDqm5DJBAvuZM9HvfF
	 zRGbPXuEnkLlS763+RBycNkB2avEiNhs5EVQS9qSyRTcsRqPitplkJFaH76UOX0uyLARc
	 jVGbcaZbGQ+VMIv+PoWXveiKfluVx/galQczy/MrlqLVNk/ygeWTy782TAi3hbcRFup+K
	 Ob/CCm+QZvvfytWwjdM2jQf63c7DV0+8v5neHP0+P5+4picz6kdJbwUF/5NdWwFjyYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795885103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9ILCeNtw6TJMqEBerWeWNF4jhp1/rFCO5JoGYAlQeqU=;
	b=VLYHWKN4wQQKuHHrNvO8MJGe69Ey/eT+V4o5tSXFGVOljvAZQq9UAguW1/3MBL0gkCSH
	 r+hqQy9UILFjXDDleAXVkzBtrCn8txU2GEx/TmhaIJm5ySs+bQnvhSmhFZffrTAQESHxi
	 TFzdW7LJ90GQdBH1c7/sDTsRFYFh7gGmGFcNc71WztjLFN1kA5ZtJAA7HWuelbAXQQG3w
	 wI2QFboX+mCey/zeakCZIUzyveUJscT/jhpRzQmzp2nXkCYTDPthxJJcP+oLiPqahKdvM
	 hj0G6jJ8aWdZOri03Uz2kINRjh0V7L+UYK6SMMXtK+Ie+cxs013q3afhL4iD1P6SJqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cKP8AQzM;
	arc=none smtp.remote-ip=209.85.216.66
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17CB606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A17CB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cKP8AQzM
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so5022492a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795885102; x=1796489902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ILCeNtw6TJMqEBerWeWNF4jhp1/rFCO5JoGYAlQeqU=;
        b=cKP8AQzME8tLzuG8qYhT3Fc6sKoLVFUaEqJoi+z3JahKDKRjMiUJEDhlgL0FKeVrSG
         5yJU337rD/3pjYEoHHkJGzErNHKILa/+b/I/5aMUqtfLEOrVGcVgUri5honcG83dIJkW
         behfFksP7EnyaOAt2kvUNSIMVKrarOd0b7+LMXo8Eo1cBgruo9fWsPJbPOJZVZeqflYb
         596GvHpDxEPzG4iBmhbi+Tp0FclKQVbBc02cBSJmIWxHVOgMMFz/HamDsYHJocGnbvV+
         jAN1DVSzslx+5DPu7YEf6K6F+1ff2wjMzC6bIptR+GBf8typX5RdKEEuMEa+Pibcb3Lc
         FTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795885102; x=1796489902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ILCeNtw6TJMqEBerWeWNF4jhp1/rFCO5JoGYAlQeqU=;
        b=BRYIotOy2mE5EiB0geq3W4HQS0bhdqmu97BITXIio9QEPxSCyDshJJOsqTd6aXb8xt
         0ZX4Q+Yed60lA+xeY0goWfk67NyNCY4oDduyMm+sJDjkjc4pFdn+LFSWoUIAdrx2Beio
         FDScL5jrWkgnki/hbQAEV7x8riK6OdCkJyKcdZh5HPMHKiOHN7B/QRA0ICqtdAOV8Bqw
         zeCEBSlb1nLzQgK8qihIW8WI0X+EqFsWuUYFIu+yuUznpT/VNQ6BtEKXbvmjSP150Tf8
         NVmYkc9Ul/Tn4Rakly8HKf5fS6x4bFtNd2Xy8I/SL//z7P3WrX+PShIRX9s4H4/30rCP
         etbg==
X-Gm-Message-State: APuU4Z90y+edPCPbGAUxDAVM3EEk3Bw0/fuN/Xhy81ebktpHApXqBdIx
	KPB1ZljHKNG6m1sAjgo3PkURqDDpDZS3xIcVZimErwT7i258gNgu/o+7
X-Gm-Gg: AZFdTZcHxGtiYqFqK0UiOXPfU1E6pQrPOg8d+jEkjbE/9ffhU6VPOg7e70mTFXjTeKN
	swxLQVcvgSRLepH5X2MP1NMNNoCnCaPJBzrHT7A7ufMtBesiO2ZE8hNcmnitpDVveLOgY2x84sa
	Ov6OL87ISsC41R1MZEIz8eUAz6WD40JLF5D5AtFC+dpmJjX45QTidQlw6uLMVBZm2UT9mPbTMbf
	awpOJQXgHHYr8L9LIha72UFWF+kNYaqbUJkJsNlp5/PfnHiWO/2uddjh9cgCEOl82m6/NFPvgew
	JUZ/EVyswhFhkJVAXXt2Lkxt2NqrQ7lDm/LZCtlz5Kb7Wte0HoZeBppaFFXfKugYqWA7BpQklnG
	ooDEhIet/S3pMV75N7gbsVa7qRy8+s1cCipij/XQMp2QFBSIlf6BcHpNtRlpTOqofK4/WosLnNk
	+Io5/MALRkXnYMuAQWyw7G844/GJuRwR9exvz5L1PoStOpjiYBGZ2DsIolrrnqoZUtlobWOVAwl
	5Wv1cWT+Cor2rSwgaw5cH6fW4DN+bY9M52IOTNB/H+c32bGuyQSjYBHF/TPURFNWiu248n0xZMv
	nwUGBsGI60pxNYsAopyiEI5wbjoh295SuDQswe/2CJz/xUo=
X-Received: by 2002:a17:90b:2247:b0:3b3:fe38:d8d4 with SMTP id 98e67ed59e1d1-3b40a5f92ddmr23046039a91.34.1795885101740;
        Sat, 28 Nov 2026 08:58:21 -0800 (PST)
Received: from AERO17.orionisli.com ([64.118.149.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea770asm15102730a12.3.2026.11.28.08.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:58:21 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] reset: core: translate GPIO specifier via of_xlate for reset GPIO devices
Date: Sun, 29 Nov 2026 00:58:14 +0800
Message-ID: <20261128165814.740455-1-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.1
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

In __reset_add_reset_gpio_device(), when parsing GPIO arguments from
firmware nodes, the code assigns:
  offset = args->args[0];
  flags = args->args[1];

However, this assumes a direct mapping between the devicetree GPIO
specifier argument and the driver's internal GPIO chip pin offset. While
this holds for controllers using the standard simple 2-cell binding,
it fails on GPIO controllers that implement a custom of_xlate() callback
(such as Tegra's tegra186-gpio, where GPIOs are addressed as
TEGRA186_MAIN_GPIO(port, pin)).

This leads to two issues on such platforms:
1. Wrong pin assignment or lookup failure: Since args->args[0] is not
   translated through chip->of_xlate, the GPIO hardware offset passed to
   PROPERTY_ENTRY_GPIO() does not match the chip-relative pin offset,
   causing the driver to request the wrong GPIO pin or fail with -EINVAL.
2. Unparsed or corrupted flags: Devicetree GPIO flags are not parsed
   through chip->of_xlate(), preventing drivers from translating or
   validating custom cell flags.

Fix this by looking up the gpio_device from args->fwnode earlier,
retrieving its gpio_chip, and invoking chip->of_xlate() when the node is
an OF node. The resulting translated hardware offset and flags are then
used for subsequent reset-gpio device registration.

Fixes: c721f189e89c ("reset: Instantiate reset GPIO controller for shared reset-gpios")
Cc: stable@vger.kernel.org
Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 drivers/reset/core.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 1ae7ca1e8..ce524820b 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -1072,6 +1072,36 @@ static int __reset_add_reset_gpio_device(struct fwnode_handle *fwnode,
 	offset = args->args[0];
 	flags = args->args[1];
 
+	struct gpio_device *gdev __free(gpio_device_put) =
+			gpio_device_find_by_fwnode(args->fwnode);
+	if (!gdev)
+		return -EPROBE_DEFER;
+
+#if IS_ENABLED(CONFIG_OF_GPIO)
+	if (is_of_node(args->fwnode)) {
+		struct gpio_chip *chip = gpio_device_get_chip(gdev);
+
+		if (chip && chip->of_xlate) {
+			struct of_phandle_args of_args;
+			u32 of_flags = flags;
+			unsigned int i;
+			int xlate_ret;
+
+			of_args.np = to_of_node(args->fwnode);
+			of_args.args_count = args->nargs;
+			for (i = 0; i < args->nargs; i++)
+				of_args.args[i] = args->args[i];
+
+			xlate_ret = chip->of_xlate(chip, &of_args, &of_flags);
+			if (xlate_ret < 0)
+				return xlate_ret;
+
+			offset = xlate_ret;
+			flags = of_flags;
+		}
+	}
+#endif
+
 	/*
 	 * Later we map GPIO flags between OF and Linux, however not all
 	 * constants from include/dt-bindings/gpio/gpio.h and
@@ -1086,11 +1116,6 @@ static int __reset_add_reset_gpio_device(struct fwnode_handle *fwnode,
 		return -EINVAL;
 	}
 
-	struct gpio_device *gdev __free(gpio_device_put) =
-			gpio_device_find_by_fwnode(args->fwnode);
-	if (!gdev)
-		return -EPROBE_DEFER;
-
 	guard(mutex)(&reset_gpio_lookup_mutex);
 
 	list_for_each_entry(rgpio_dev, &reset_gpio_lookup_list, list) {
-- 
2.56.1

