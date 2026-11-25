Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611446;
	b=FaW0GRjWRwX9QVgD+HUTDwLZgANcUu2PzkGYeXjovBqvuPtya4Ap+8q4GKeBB4jvsuqJ
	 okqjp1D2XoeSyhCGsFwPjaLImzfIs1dXuVhkzrCslxo6zN+7Qhu/roBI0HIQQ6zAGHn0j
	 KP2a4WbkgJjBtdksg20N7t1l35XKcAxeARqrYuuEbFAZCivbto9O+gQhtd3Mx5LRlu7d5
	 rI/AeWsocXZ6U9dIfUQZa2HP46aiezByTx8Cof86dyKZJiNzbIF+0ZfqU77GG0qMA0Hg1
	 8ihO51KCCXvPHA5xiurj8k/SEabP59DUuvH8pIiNRPkwJ4AYEAl/MyxOjsFKtoX9/3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mfltfNq/ZPnpD4OYvm+F8Ne+9+ic89UiJvGsMBg0vdc=;
	b=2V4vj+iQY8dwGr1Ti6h8QZvyBuJTefYkCuVhkXea2xGoyqpRGRZEiiZOv+GErlFDzQVC
	 Hgt12JwiLnHNMPoPmtygSbAgQ+MsA8xVdcl3ydcgnpWa0aUyaO4gYKX1t52DMYJ5rWOxt
	 luRj48hFBbVyAHajFxqAsA0Pn/gNrxfUWPuL02BDuLapfJ0XjeI++68e7ieAT4b5YA+w0
	 w2UBoIeNGW6uQI0o9POm9FTOXkEIJDaydoBplUG//OcfMM130fP5BUzhT2Br8jgIMitOu
	 EnygLFQjeiiLE5+eJhobNYRONoEd+DvRa+p913dLZgaXSs6WlVVq2Dbs2eKPV2aMmrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTJuGvhu;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA0C606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FA0C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTJuGvhu
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so9529618c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795611446; x=1796216246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mfltfNq/ZPnpD4OYvm+F8Ne+9+ic89UiJvGsMBg0vdc=;
        b=tTJuGvhuVbfbDZwkwiZCCFSEqZTCM4VIkwck/4VX8pBV0n5Ui7iwE33MkXy/FKxwec
         uQ2dtuJZzTajC3KNTqNZwfIpsUngEZFVpCzfVgg5e/OgUFt5OkXEuYXkafqBGRtCNID4
         Fk3AVhvPdOherDXQw3uR2Tu/lOlt3YAr9bi8alP/PU6CZZq5vQafMqetHTSLKfgCMESV
         SzP344mVC+pokZYHXUWN3XKOyP5o8D9ywjTVtc6Pc32jgVySDIi7RsVHFMonNSUvK7Vg
         cM9H2UADvTbPboeJowCrMP4bpqsOolz7iOV/8NtDVnYHkmGaxkGWJFD7Nzhe9GI4GRbx
         sl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611446; x=1796216246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mfltfNq/ZPnpD4OYvm+F8Ne+9+ic89UiJvGsMBg0vdc=;
        b=IdV+vBf+okoYSRkRE+N46bF2yNgkw+R7sr4OuMbq3J16jOWbKrJZslsL4KFGdacTFR
         B4t4peo7PyNPUE9+ukp9G3GYP0xH0hH2+WvzNE0IwUbLCbw8+UQuHA7GagzRYDOwO+aP
         ESiY8EY7AqSs1lEWVGH8Bofjs3YjOD+00/UpWcaK64YvtoGqFNvmgquKzq9PcrXkSDfv
         R1DwA9oGwHgoWvKyhQmIO8rUf7gQC52G4mJ8u642FsIRSLVHA93RH62N4CRw5sJuUFzX
         wIBNOmwqBngtf9GdTbe5xuMdbHBrTxbZHKmRQzmxLVmxwtAOQ9Q3ayNOdtlS36V5L1A/
         ixuw==
X-Forwarded-Encrypted: i=1; AL+hErGt/Ur7izmhAW86td/1glzEBqD0JqYdfVyFxKp9rj2suTVWLgtfgKke70tTfTAwD0xG7EbLxuXPXsVG028=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TQj9pOrgWw1m3iPaRn6iRFP20I35fuytBhYvB9fpAn4nTuvvU
	6t1ZpVD5+HHEBrh1AppTABwA0hulO2VJlx8g9najnxd5sm6BO/A/6Kwb
X-Gm-Gg: AZFdTZdj0hqbm52yzIq1s39i8BURvW4c/u9j5WKtAqcXDtu2XH1qNdDmWGnZht7ACwE
	Niz6ydbTaETl5uH04ZAGGpWnVUD34kLw6EHmxeRt08La4OnYwfPf9oRBOjql+aA/wG4KmBF8TZ2
	TRs6X/2OTV88/uK2ymdSVWEBCfQnkKTyuvTNT6P7cb/HYLcZg6D/8xYQTCnw9hkFR5w0v30a7Rr
	m3eSXFxJdLxZcv/fIvWiy/1maFMUFXrsXXQ4dJcEQx5vmZ5YqUx2LoXWFiZIUMNcq3Fvy7hdoCl
	/zA74DW224PH434vNc5KixiCO69RdPLoXlnK+6E1QgSW0lepI5W1jw8K/PLunGLt7FtShLTZh9Q
	VY/WTr6JS1SQvYqYIJ1u0xDzTXn8YPMl8hfYn/wkTDy1olBlPCFJZARzdanlB6memYzNEsEeDj4
	Zx7KnwNMBx+g8bDUUf7teXDy+NWgdEuwcXsrFrvmSKbWxoJIagZ9uELpaoP3rdQ6/CPdoHz3JzY
	S6v31tn39a3I5G7g/2Tk8RFl7m2+Y73N4FWvO2odiBR19OBKhLi+2zY80RLvFs29eXMoOQGgoXJ
	OM5txOb+B/fioOTHGRGrxBS2JD/oXhsTUeIolIs+P7HxDwaJcp+Gjp/y9IfDNzq2am6j
X-Received: by 2002:a05:701b:4354:b0:1b2:6cba:7f7c with SMTP id a92af1059eb24-1b5568fdafemr16762078c88.37.1795611445269;
        Wed, 25 Nov 2026 04:57:25 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm42379243c88.8.2026.11.25.04.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:57:24 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: =?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] leds: rgb: ktd202x: allocate the LED array for the chip's LED count
Date: Wed, 25 Nov 2026 19:57:19 +0700
Message-Id: <20261125125719.2565828-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

ktd202x_probe() allocates chip->leds[] with one entry per LED child node.
The allocation helper sets chip->num_leds to that count, but probe then
overwrites it with the number of LEDs the chip supports (3 for KTD2026,
4 for KTD2027).

If the firmware describes fewer LEDs than the chip supports,
ktd202x_chip_in_use() reads entries past the end of the allocation each
time a brightness is set.

Allocate the array with the number of LEDs the chip supports, and set
chip->num_leds right after the allocation, because the helper only sets
the counter on compilers that support __builtin_counted_by_ref. Entries
without a firmware node stay zeroed.

Fixes: 0ebdb7210943 ("leds: Add ktd202x driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v2:
- Set chip->num_leds explicitly after the allocation. v1 relied on
  devm_kzalloc_flex() to set it, but on compilers without a working
  __builtin_counted_by_ref() the helper does not set the counter, so
  num_leds stayed 0 and probe failed with -EINVAL.

v1: https://lore.kernel.org/r/20261124095707.3852724-1-congnt264@gmail.com
---
 drivers/leds/rgb/leds-ktd202x.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index f1822281c3e6..bfb28c38ba14 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -533,6 +533,7 @@ static int ktd202x_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct ktd202x *chip;
+	unsigned long num_leds;
 	int count;
 	int ret;
 
@@ -540,10 +541,14 @@ static int ktd202x_probe(struct i2c_client *client)
 	if (!count || count > KTD202X_MAX_LEDS)
 		return dev_err_probe(dev, -EINVAL, "Incorrect number of leds (%d)", count);
 
-	chip = devm_kzalloc_flex(dev, *chip, leds, count);
+	num_leds = (unsigned long)i2c_get_match_data(client);
+
+	chip = devm_kzalloc_flex(dev, *chip, leds, num_leds);
 	if (!chip)
 		return -ENOMEM;
 
+	chip->num_leds = num_leds;
+
 	chip->dev = dev;
 	i2c_set_clientdata(client, chip);
 
@@ -558,8 +563,6 @@ static int ktd202x_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	chip->num_leds = (unsigned long)i2c_get_match_data(client);
-
 	chip->regulators[0].supply = "vin";
 	chip->regulators[1].supply = "vio";
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(chip->regulators), chip->regulators);
-- 
2.25.1

