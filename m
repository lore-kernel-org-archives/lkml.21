Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716202;
	b=E5EMfH0W8aUhQLFj6fiDbz2xb/zEf8yv7k2pq/rWhvzFiJRZKi8/q8ltKwl1cyUctg7G
	 0CZ0FsEW7l2Mu/XkCWBFB3X/fEtYXdX+jydUBvniTTsgc2cRnpmcYGxvmmW7SpUP5eroe
	 FGuGjUsvhOEhNcNjCaDb9EFVQ7PmcjJmHv/4StYhjKuMYRXPQxSrD6O637ovrwsC37KOp
	 MtHNFKeWEJa9FwKXI+32xvB5TQYsyUMCDkncIQ7u7IPpK2TXu20DZzoHVqnF3x5dzycsE
	 L5m9pDY1m61dVaK/fUMllWNWDnlXgaI9JqCKDD2cHahHVIH/H3NffrlGBrDpgTpTCRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=byjiEAVbgVFr0Nir+Ue5CFd2zsKVy7OkbkAJjnT09DI=;
	b=Jjmy59jXPAQ1IBdK0UKW4fP9zH8gETWX65OhXVgZToZrvMOOWNmneHulQzwH8rYth0Eu
	 AztYtJ11RNsottuaH4N8xPl3MbMen7q0tZIjLo4Q0rxELcZViT59tRUw+/H5XNdO+2r1g
	 NBz8afQk7YFPkj/cT7CcsFKVdzj2iyCxgewby17KK10cr95l5DYT/UgJAxKOa8WIuCnjr
	 HRIbAeSr4YZhxPJ5plClS0sCyA8y8cN/Q3AOA2q0DisieDn6nwXSMdCkO5fGwcntJMv4X
	 A/irNw2Oqgjyz9AqHCEWfveXI1sE9ZqWFgZ1M9gzKXn8oZtu323C4bS169WzwH4Ob9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NAK/uEvn";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9A2606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA9A2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NAK/uEvn
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a32576da88so4214697f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716200; x=1796321000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=byjiEAVbgVFr0Nir+Ue5CFd2zsKVy7OkbkAJjnT09DI=;
        b=NAK/uEvnGhKF+M0LNPHchp71K9d6SgR6eBnLmdYlhqJ1KvCK/46Wt1KOoRWjBXWu6l
         WOCZDbdb0Ovx0QxqWmOmyDm7ULACSwAYC5cMYH5V+tNW8T4mG2akD47or0ZbbjtYBulx
         6p3piW3ShqB2/U00vqg55ttqjeL9TdWoSiJ3iB4PZKI+JhQgrkW4+2D830//EvEuKmPe
         MqpRdoJt3vbGESd5rlyWwLEMgaExPGhDIC4QmXTiE4da0FtRAxOonWCdqLhm6Fwo3Y2E
         yU8Xig+sETNRy/ZZ6uPY95qiTrLgKw925GwiEXj2rtrZwMnqnTIfYMYDzpgnF0NVyISC
         Ayrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716200; x=1796321000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=byjiEAVbgVFr0Nir+Ue5CFd2zsKVy7OkbkAJjnT09DI=;
        b=XrELY/l+5JSDbKeOrRMSCMk1VT1og77zVhN6tTgD1JZAw58c3+c09q0whJXZ0Ds5aF
         p5S9gevIPh5q4VX8nXiMyo7Cppi2EWE/qiwXcn+LNg3+1qQnL9nmpiTa2OGXFoXgceW3
         rlbUD3Ykgu/plulgsHPpAOYxyFRHYHrLfYtxSwUB4kbDnplNX6iiDu9ZdaTth+BiEO9v
         sxmWox3HVaPd4t3h9ZfIIS6nRx3zdiorGsiw1W+FhPEhSVEYKUN75U9muH9CSO52u7dZ
         bRHt5tFaIgHWk5Rm6TgHSTT7utGWWXq8YXif3/ahuxjiAI4x/Kx/4FGFvsWKJsjc56+U
         jyfg==
X-Forwarded-Encrypted: i=1; AL+hErHvHtwGUth2tpM4y6HlsliY2cIsbJyLL9MwM+YakwacFbGVYU/zcXuDxXVh/rdoGJMxBndq/6zR+kxmhDE=@vger.kernel.org
X-Gm-Message-State: APuU4Z95vDeI0BgjgHpAXel6n62YBKfLtYUla28IsGgylcsAMzjNb7J4
	rIe73TeFiwXfXtNN3fQ0rozFxQfeUn83JqkujDGbOjBJX86MGJySGUs=
X-Gm-Gg: AZFdTZedNMjpGvoHCBIsLsrwARzrtGXtugH0YZASEoy8bDIfRp4TBzg50PJUVBFQ3d1
	MEBz62R0hw477tJJCmBKVyGjWIVHixt6faiCyirDOS7iFXwBWgEECae16cK3jkw3DUSxBXJvQg3
	qElzOlksG9pYmDXCSJhKdxyC56wPX6HE/DFg0Cbi1T+nFLK+7yO5LjUMJhPLVa0/GtdvJYffJVs
	XMBgfkAV2gQNjm9/dTIz4Uli0ZN+KYYYSAoqgt1KBH8rF28O52GpK1Jd6Iw7LXYLQNIMhyczBxR
	1uAp7V6+lIgnHTFeWom6qjoSFnRqfaaQEak09fb6hAm02rt+Qj0+Zwu9FR21F4E4jDk8IJtJIOn
	F8xJPX5B6vtW11m1uUxvAZ7kefrDrD9xQSfchfU+9rB9hzk17SwXcXbnnDbYNMqf2IdPJdrpSBr
	VCTmZ71qD3MRiSSuvp+piAbQ+/d8ST57eKxk5GF476aldSdWD4P5Qkt1R61CPcbNgnNhJZ7HVnV
	nCx/Csd817thmNVxI3ny4lPgN2qz2G06MhJcnEO9gIP4vOXtCdox73G38dQ7dKf8A6HtPr9frR5
	Bkjv+G0cGzLBsdNmHsDHfyYcS/FitfcuEzx4S9Nvsn1Fu7mOV0/uCEkMR7RQgUrtazqTHz/I2iZ
	P8AF7hemdMokVa/rUD8g2RAm2egRFNharA+S/UH4s0nM6nKwDDBw3dqkyH6E=
X-Received: by 2002:a05:6000:1789:b0:491:971a:c568 with SMTP id ffacd0b85a97d-4abb3861356mr40253790f8f.10.1795716200322;
        Thu, 26 Nov 2026 10:03:20 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42265115f8f.41.2026.11.26.10.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:03:20 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 1/5] gpio: fxl6408: Fix reserved register access and disable burst transfers
Date: Thu, 26 Nov 2026 19:03:11 +0100
Message-Id: <20261126180315.98034-2-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
References: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
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

All valid registers on the FXL6408 are at odd addresses (0x01..0x13),
while all even addresses (0x02..0x12) are marked Reserved in the
datasheet. In addition, the FXL6408 datasheet explicitly states that I2C
burst read and write modes are not supported.

Currently rd_range and wr_range specify { FXL6408_REG_IO_DIR,
FXL6408_REG_OUTPUT } (0x03..0x05), which exposes the reserved register
0x04 to regcache_hw_init() and debugfs, and causes REGCACHE_MAPLE to
group 0x03..0x05 into a contiguous block that regcache_sync() attempts
to restore with a multi-byte raw I2C write on resume. Meanwhile, the
read/write OUTPUT_HIGH_Z register (0x07) was omitted from rd_range.

List only the valid odd registers in rd_range and wr_range, include
FXL6408_REG_OUTPUT_HIGH_Z in rd_range, and set use_single_read and
use_single_write in regmap_config.

Fixes: 03810031c91d ("gpio: fxl6408: add I2C GPIO expander driver")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpio/gpio-fxl6408.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index 8a7e70180efd9..9f80ea1214e03 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -45,13 +45,16 @@
 
 static const struct regmap_range rd_range[] = {
 	{ FXL6408_REG_DEVICE_ID, FXL6408_REG_DEVICE_ID },
-	{ FXL6408_REG_IO_DIR, FXL6408_REG_OUTPUT },
+	{ FXL6408_REG_IO_DIR, FXL6408_REG_IO_DIR },
+	{ FXL6408_REG_OUTPUT, FXL6408_REG_OUTPUT },
+	{ FXL6408_REG_OUTPUT_HIGH_Z, FXL6408_REG_OUTPUT_HIGH_Z },
 	{ FXL6408_REG_INPUT_STATUS, FXL6408_REG_INPUT_STATUS },
 };
 
 static const struct regmap_range wr_range[] = {
 	{ FXL6408_REG_DEVICE_ID, FXL6408_REG_DEVICE_ID },
-	{ FXL6408_REG_IO_DIR, FXL6408_REG_OUTPUT },
+	{ FXL6408_REG_IO_DIR, FXL6408_REG_IO_DIR },
+	{ FXL6408_REG_OUTPUT, FXL6408_REG_OUTPUT },
 	{ FXL6408_REG_OUTPUT_HIGH_Z, FXL6408_REG_OUTPUT_HIGH_Z },
 };
 
@@ -78,6 +81,8 @@ static const struct regmap_access_table volatile_table = {
 static const struct regmap_config regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
+	.use_single_read = true,
+	.use_single_write = true,
 
 	.max_register = FXL6408_REG_INT_STS,
 	.wr_table = &wr_table,
-- 
2.25.1

