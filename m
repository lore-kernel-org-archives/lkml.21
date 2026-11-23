Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433599;
	b=SoBMBq5yYE0s1monAbMl3bkAMIf3HyVjfUBwj8dGJs5sDlSP8KelG+zrQXzfaqMsAsxY
	 xWcdQeT+Kyr4HjBrR7bdGu3UnCtt4sQHhbx7U7B3lMO6d7HEABvBYL6dr1JD+s9tQ5i9t
	 6UJM7w49TwXMS/Zi7R4U2dXycGJdkLCD953Y6qEhk7r6y3OEzHp06pu441nDT4RM1OzBN
	 o/qEMMmDzjWZ0lNgS+Fip1iWW8f8qmqdetAvSa1ChHAcMMN/3JlcvqyUEalO/SvvmKc3z
	 ymVfymHVriaatZ9VkPTKlHv00Kxlye57Qkpz2A4Ap9Yb6HD7OUxBtUyyGLc222FtWVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5nRCKmjw8s473RAx2JKEdq4M1Q3NyMbXMqfx2Az/4ns=;
	b=mUsj49XEBtBePbsaoda7sWlYwl0QJzHbt4V+qIJrPB73z3PearLWeK0zdBiDJ1i0vRAu
	 sPOB8+Ew6Q9a7V9v0caZGHWXn3W/ZdVsAwKtKUIZWyDOyG5SZrC2etIj4upY3ZwCDsHts
	 DcF6Pm+tYtp3AJ07K6h/Zp4qdx4hgSL01rWWjt4bPNQ+FqLafAEnVdTO+xscTe0PqJNUn
	 gM4ZCSYiFwOoMLOrep+IIoXkH80+t8Ua3GKeLpbJ5iReLAa9J8cB+GsfWuBePmw4wTbA/
	 +poo99VhahEQ8u7pW05VD+m/7rLxLtovDJYGuWgciRco4xslFfGIFeOIfmxomKspbjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=biUKYNCE;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14232606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14232606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=biUKYNCE
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c5127c7abd5so504155266b.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795433597; x=1796038397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5nRCKmjw8s473RAx2JKEdq4M1Q3NyMbXMqfx2Az/4ns=;
        b=biUKYNCEDSO6ZYbSULcp133TIES6V1dgvHI/IVIY7FWNLyjJ4bHQ5LUQrP/OQ1QBgQ
         ktn45i/V0kMZbn/0X8cosa8dTNA9Pd2Slc7OLVlL9CSAAFROwkZL0Ldzbb1HxHFGEFPi
         cQRAL0AnW2VfMRFL3I5Fpyk/xUqSIRRPKzygNWZvQOws6bPpq6ptdKBUptrgLGm+WE7Z
         XM8wNv4QMbBTbgRzqUHvliKV114GQiNifJ1lpxUpTcWHFa4ruYCLnKGAVXra3wV2dNXX
         krxxXo0QgOKMeaHYY3+6BbRdpvxl3LScp9p6TPo4bLmncb4BgGbls2rkVyuatTMQU4z8
         eV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433597; x=1796038397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5nRCKmjw8s473RAx2JKEdq4M1Q3NyMbXMqfx2Az/4ns=;
        b=PbtVkljczJ8Rx7X4XigmstKedtCyMmixxgXCCwcyZzqbR3N1MI7ttJHE6uTWTRoXXn
         xTHdS9qyyQO3ZLOhThDkAZ1sFAJJPJzS5kmNVXEmEOerP9GREemR9QWquhc76B5sD9pE
         dcr3VLeQEE6ItzoMV88JPyTS5b9sewKY6hzlbSDecUWwdLUcSynwIO49LECp3FHjepie
         Y+fQ6GUO4Ol/5tfBfBmepKQJMQB9MumS2Ag+r66kcduQXCbAr/q09wu8+x+6+/1S88H4
         zrCEuQiDTwT0YgWhBBYg2eOA/e/OJa+nPHrFl+p0pBMdCmO09uD9uOt+M0vuhr9MHHtL
         pHAw==
X-Forwarded-Encrypted: i=1; AL+hErG6iHsZ7I6kOCoT2ixi/YgsPGPPMyytA8VboNPpWO9nUlZLvTZa34Pr4dh/40DPSD0o2jcFr+8+Y8Se5qw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B9TABQvTUrw8YjxtXJGxlu5PN9KCq/yGKMtnAURvL0apafBAZ
	Dgu/5j+vmKyEL207uNM93vA93ZesC4ikSSbnZONwMRKHRDeXBLcbsMQKSZU7wX058tU=
X-Gm-Gg: AZFdTZeY/4go1iV3vj2kQBdjx4YYQuuzEpE79rox1CMT1sNPTycZtkmuZcynRG2a9bC
	4WStJUoJ3vLEk5/U72THcAips0L81aQ0AWVLiaVOwUjt+g0i0kgslirG3VUpQHsJhKL53rxeACg
	RrvWNFUc3m+zUkVkxVeFm/xXpY2L8OsMWqVFPC04aiKQc3gBXdRkHWhbD8E+LXW2GufZJCkm/mq
	A0YyDUqGoPhN9Keu3m49L7qZHdwefiJ8VS96W5wFdEatlkoVLbJr+8ww3mRcdN+SBT2djmfCvLZ
	pCLRD0FFLzoVpwiijIB9c64AV/4G4yxh7X4OrLtRZ3+jX26O/bXTQAtrzOpp0NGFKz02s4Oiq7o
	g0CDZ0kLSf03DMlftxjSvN6sjzvnvcTVzSanOvXZx0zdxRelM1s9jpfupl/TyZsLArG2JWlTh2w
	j7jdmLefWgerK/jdraqO8xLBkJtQAjoE3g48jK+saGwgotBckNOq7qCMILgwLuJHlwklnAkjHi1
	QkTAIYDPcY7GhPdtvdv8Nid8OJBmBIJq5mYnD1S05SEnUN6M2GFo8Z1fTkfkmu7hUrEiUn7dWqo
	BvjiiZsxTnRi7HSHA8vtMPzDWlQU
X-Received: by 2002:a17:906:564b:b0:c29:f5d8:9c72 with SMTP id a640c23a62f3a-c513a9a466emr618942666b.33.1795433596901;
        Mon, 23 Nov 2026 03:33:16 -0800 (PST)
Received: from lin-mg ([178.226.61.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afca58asm382625566b.65.2026.11.23.03.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:33:16 -0800 (PST)
From: Maria Garcia <mariagarcia7293@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Guy Morand <guy.morand@bytesatwork.ch>,
	=?UTF-8?q?Theo=20L=C3=A9brun?= <theo.lebrun@bootlin.com>,
	Maria Garcia <mariagarcia7293@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpio: pca953x: Fix TCA6418 bulk transfers and input caching
Date: Mon, 23 Nov 2026 12:32:33 +0100
Message-ID: <20261123113234.197852-2-mariagarcia7293@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261123113234.197852-1-mariagarcia7293@gmail.com>
References: <20261123113234.197852-1-mariagarcia7293@gmail.com>
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

The TCA6418E does not support PCA-style 0x80 auto-increment on the
command byte, uses MSB-first bit ordering in Bank 0, and requires
input registers to be marked volatile so regmap does not return
stale cached values.

Disable REG_ADDR_AI for TCA6418_TYPE, apply bitrev8() to Bank 0
in bulk read/write helpers, and mark TCA6418_INPUT volatile.

Also, add IRQ-related registers to the tca6418_check_register
function for the sake of completion: GPIO_INT_EN, GPIO_INT_LVL,
GPIO_INT_STAT, INT_STAT

Fixes: 6c99a046edfa ("gpio: pca953x: Add support for TI TCA6418")
Reported-by: Guy Morand <guy.morand@bytesatwork.ch>
Closes: https://lore.kernel.org/linux-gpio/CAFOBSkSHt5nwdqsf=V0esBh23oTkOzy--9-vBQFPBoroGK3-HA@mail.gmail.com/
Tested-by: Guy Morand <guy.morand@bytesatwork.ch>
Signed-off-by: Maria Garcia <mariagarcia7293@gmail.com>
---
 drivers/gpio/gpio-pca953x.c | 41 +++++++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 3b2407690281..10a6fbdcb64d 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -10,6 +10,7 @@
 
 #include <linux/atomic.h>
 #include <linux/bitmap.h>
+#include <linux/bitrev.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/errno.h>
@@ -37,9 +38,14 @@
 #define PCA953X_INVERT		0x02
 #define PCA953X_DIRECTION	0x03
 
+#define TCA6418_INT_STAT	0x02
+#define TCA6418_INT_STAT_GPI	BIT(1)
+#define TCA6418_GPIO_INT_STAT	0x11
 #define TCA6418_INPUT		0x14
 #define TCA6418_OUTPUT		0x17
+#define TCA6418_GPIO_INT_EN	0x1a
 #define TCA6418_DIRECTION	0x23
+#define TCA6418_GPIO_INT_LVL	0x26
 
 #define REG_ADDR_MASK		GENMASK(5, 0)
 #define REG_ADDR_EXT		BIT(6)
@@ -384,22 +390,37 @@ static bool pcal6534_check_register(struct pca953x_chip *chip, unsigned int reg,
 	return true;
 }
 
-/* TCA6418 breaks the PCA953x register order rule */
+/*
+ * TCA6418 breaks the PCA953x register order rule
+ * Access masks: BIT(0) readable, BIT(1) writeable, BIT(2) volatile
+ */
 static bool tca6418_check_register(struct pca953x_chip *chip, unsigned int reg,
 				   u32 access_type_mask)
 {
-	/*  Valid Input Registers - BIT(0) for readable access */
+	if (reg == TCA6418_INT_STAT)
+		return access_type_mask & (BIT(0) | BIT(1) | BIT(2));
+
+	if (reg >= TCA6418_GPIO_INT_STAT &&
+	    reg < (TCA6418_GPIO_INT_STAT + NBANK(chip)))
+		return access_type_mask & (BIT(0) | BIT(2));
+
 	if (reg >= TCA6418_INPUT && reg < (TCA6418_INPUT + NBANK(chip)))
-		return (access_type_mask & BIT(0));
+		return (access_type_mask & (BIT(0) | BIT(2)));
 
-	/*  Valid Output Registers - BIT(1) for writeable access */
 	if (reg >= TCA6418_OUTPUT && reg < (TCA6418_OUTPUT + NBANK(chip)))
 		return (access_type_mask & (BIT(0) | BIT(1)));
 
-	/*  Valid Direction Registers - BIT(2) for volatile access */
+	if (reg >= TCA6418_GPIO_INT_EN &&
+	    reg < (TCA6418_GPIO_INT_EN + NBANK(chip)))
+		return access_type_mask & (BIT(0) | BIT(1));
+
 	if (reg >= TCA6418_DIRECTION && reg < (TCA6418_DIRECTION + NBANK(chip)))
 		return (access_type_mask & (BIT(0) | BIT(1)));
 
+	if (reg >= TCA6418_GPIO_INT_LVL &&
+	    reg < (TCA6418_GPIO_INT_LVL + NBANK(chip)))
+		return access_type_mask & (BIT(0) | BIT(1));
+
 	return false;
 }
 
@@ -577,6 +598,9 @@ static int pca953x_write_regs(struct pca953x_chip *chip, int reg, unsigned long
 	for (i = 0; i < NBANK(chip); i++)
 		value[i] = bitmap_get_value8(val, i * BANK_SZ);
 
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
+		value[0] = bitrev8(value[0]);
+
 	ret = regmap_bulk_write(chip->regmap, regaddr, value, NBANK(chip));
 	if (ret < 0) {
 		dev_err(&chip->client->dev, "failed writing register: %d\n", ret);
@@ -598,6 +622,9 @@ static int pca953x_read_regs(struct pca953x_chip *chip, int reg, unsigned long *
 		return ret;
 	}
 
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
+		value[0] = bitrev8(value[0]);
+
 	for (i = 0; i < NBANK(chip); i++)
 		bitmap_set_value8(val, value[i], i * BANK_SZ);
 
@@ -1251,7 +1278,9 @@ static int pca953x_probe(struct i2c_client *client)
 
 	pca953x_setup_gpio(chip, chip->driver_data & PCA_GPIO_MASK);
 
-	if (NBANK(chip) > 2 || PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
+	if (PCA_CHIP_TYPE(chip->driver_data) != TCA6418_TYPE &&
+	    (NBANK(chip) > 2 ||
+	     PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE)) {
 		dev_info(dev, "using auto increment\n");
 		regmap_config = &pca953x_ai_i2c_regmap;
 	} else {
-- 
2.52.0

