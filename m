Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689023;
	b=nWycG9fuYShyneeNFnNuMfSBR6zWXS5AcNpdTHKltvQo+1smazczfsZRWe3l2u6/GkUU
	 VvU1E5rZAYKpWUY9Yk+bFopZZMnyJ79bMnWsrnQ3+qnRR/u1pW5BY7CXYtk9kmu+YmamC
	 SpXDwJA0t3LiOsFfRB3aDuipvs5VB/Rzc8ybJpUOEOkvWwWSNE9TBfwYP5qTXh+3bAAQt
	 zDjbbRAml6WN4qT7ZNUc7WSsvnBbFli/NpoTrgRoHPIgWeHSNyehxLK8/YhkqPUZ4K/EY
	 W4wp+djejuqNgb9MwK1MoBbQEN9RWuiYF3FhQBrceLgYHUWJQ+zXbdvYCbVEnk8rLPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=vJxNJoJMMyX6l0IUefGOFKwu/dnBh0wOlecLAsXII5Q=;
	b=EY13gHCj7jNITnpkffMQW2bNnpEvzR6LpoLkaSjbDYBsyGxUrGiJg2BluMn4V1JbsxdB
	 ZFiznh7eA/2XVCWg5E1hY6S5FcZ02YzN+nhuuWG7klMo34f3pznHIFkt10I9fUx4hZrO2
	 hEra6nTJlCQMckDj2Dxb0vIpjJa7xmmNbqo7Vf7mjbvo2lpl7UjbC5o6JKCc+pAcop3Wp
	 hD6D8JE+CHQ6EXFQjBIstGTcwnciPk5YfgZUusn7M5Qon8RiGCRpdz7r0uU6kbFTmPv5S
	 UUlfmt/2RzPLKtPpBz9oAnUTnsrI2/COXMkIXe9QVNW9VrvsgX3HYF+VS5Nu7OuJRtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ful9cSz4;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291D7606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 291D7606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ful9cSz4
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c40e30c26a4so1445096166b.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795689018; x=1796293818; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vJxNJoJMMyX6l0IUefGOFKwu/dnBh0wOlecLAsXII5Q=;
        b=Ful9cSz4OvMP/4H7AJDn0ZxuqmCuPCyTsrwlmZU1GGF86sRjV6gx8n0z6N/exN1oKl
         NGP5wAVPZ2Ab6M4y9e4GQSxeD6VnyflDomAfcPYJS0nFIqeSfgousxS2ZpWbSZoCDaGh
         TPM+Cx+OYsCivlWlc/+gXX+MbsOV+ltpmq+l3uOn+VXK3VH7aw7xPX22nZdE8Tdyq5RA
         QXChsF0iBnL6FldrulAoiKD2Z/FG7CeKCWQPMbdQ1XbvIZj0tQX+aFtUduhi8eCfVAIk
         wPPKHVzPMnT7NlENPllHkquD+w5LIFFnA2sXyRjRp7Nq90GlNZQMIoNIsNcmkrf0vBN8
         omyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689018; x=1796293818;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vJxNJoJMMyX6l0IUefGOFKwu/dnBh0wOlecLAsXII5Q=;
        b=RuiuJktYdrnhFygvjG1LkDLNbus6wf+QdBjNvhoRrbQklYMMgA7PnXq4oxLsZGJI24
         6BT3bWHixFZazURJmvr9MMMLCdWoc3l29W2bo9wI45DWbrxTtJY+4WZmUGarnGaK3GUT
         3uwIZx/ZqvhowtbSzH2LKg6ObjVc9qDQbR+jXRRhNFz1FU9fm87sfHN0pMzWHxdvu5Ty
         iO2Svub2/+Hi4uKJjyPydjj3SHH6DAzISYyXw0Ve6KHA1jSoqVe7/0bAi3loR4vALvNA
         pS8K1RpBJSxFZyvbkqso7BC0QAhOKyh5kFdv31lEDfCdHxH4NZPClOnbvVJWKcoSeOR4
         5Rkg==
X-Forwarded-Encrypted: i=1; AL+hErFTNiNuPnY3C7l+V3G+I2d3bNXdoaGtYmBiGhyFdtXf9q76+I7ibJeA4yZDkTFhqrtDeJff8FFPEKiHYEc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K3BbXrHrvxbfTRRHdBW4dOhdZ/ZkAsSYV+tPolrcNcqdZwBVc
	tNMiqEMe0VB+qCt8u3hkV6hoPvByeHOqk1ewI7jY9u0gCxOjPD8uLfzvn62T6tPtEgw=
X-Gm-Gg: AZFdTZc1PxuhEbpIBxp/r9Iaf8hMGTHyOsG3b7ly9Hrw/YCPUgYWORMDv7H5I6SADAv
	ryi2BOg16dW5LC/6iUFRPgUX5OwhLp2AWEWjzqxOjYaSzpQzdmVbyy4r1K1PhSSMqIK5OCx7Vqv
	7RDzuwXtXxoYck7P8n8p5ZYNGlhtJj/SytmoY4gRQjd6R/jLOrrDob98ftbrPANU2PygFDUySih
	v+FaxwDaiwrK13Aiv3kMvM+lS6HrU5d1/MH7/38i7XfUI5DgUdIU0g8omACxZ3wiP4biOEfU/wl
	rpdG1z18KYYIEMS8jVcBTFhYRrMjJjJgpFzrhLkILKLYF+53VERkjfuc/DRkTBWguPL2HRg1u5f
	sD0ZH1XlW7tt3aoU3HdupjqmFBD82Cly0zddfAC2HOP8sVZIID7KiZGqQtzXa43OYZrzkUUafCV
	CvJWCgI1YftRBlGpELIJDJG3frxrESE77/aO/4LaxhAIyuBTOxG5dwubxBcWLBcTm8JgHJexHTt
	GiZb//CdYdJIIzCSl7qvmQvlLhJC9BcF/axb8VLXleEiyyeNKCe+dgjDufZKQk/eJ4I30FEP/Ev
	M9R9wzOjTtbUa2ExtEE8vtncHBCV1mGv2PkgXCy0NoiSMNj+n5vZEG2BqUS+TvAVxjycNUyLHPO
	QtS8FINdhkq6sf70+DQ==
X-Received: by 2002:a17:907:2d23:b0:c40:2439:4d9a with SMTP id a640c23a62f3a-c51319c24fcmr1933667066b.28.1795689018365;
        Thu, 26 Nov 2026 02:30:18 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc5396sm734524266b.58.2026.11.26.02.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:30:18 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 26 Nov 2026 10:30:16 +0000
Subject: [PATCH] mfd: max77759: Use REGCACHE_FLAT_S regmap caches
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
Message-Id: <20261126-max77759-regcache-flat-s-v1-1-edfb4b93685f@linaro.org>
X-B4-Tracking: v=1; b=H4sIADgKCGsC/x3MSwqAMAwA0atI1gZMbS16FXFRa9SAP1oRQby7x
 eVbzDwQOQhHaLIHAl8SZd8SKM/Az26bGGVIBlWoikgZXN1trTU1Bp688zPjuLgTIxaajNJEZV9
 pSPkReJT7X7fd+37b844wagAAAA==
X-Change-ID: 20261125-max77759-regcache-flat-s-041524113b64
To: Lee Jones <lee@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

Reading /sys/kernel/debug/regmap/1-0066-charger/registers triggers a
regmap warning and prints fake zero values for unreadable register
addresses:

    max77759 1-0066: using zero-initialized flat cache, this may cause
    unexpected behavior

The top, maxq, and charger regmaps use REGCACHE_FLAT with
.num_reg_defaults_raw, so regcache_hw_init() populates only readable,
non-volatile registers and leaves unreadable register gaps (such as
0x00-0xaf in the charger regmap) invalid in the cache bitmap. When
debugfs checks regmap_printable() across the unreadable gaps,
regmap_cached() calls regcache_flat_read(), which warns on unset
validity bits yet still returns 0; _regmap_read() then serves the
uninitialized 0 from the cache before checking regmap_readable().

Switch all three regmap configs to REGCACHE_FLAT_S so regcache_read()
returns -ENOENT for unpopulated addresses, allowing debugfs to skip
unreadable gaps and stray reads to fail with -EIO. Also drop
.num_reg_defaults_raw so cacheable entries are populated from hardware
on demand instead of triggering eager probe-time I2C reads across all
registers (including the 33-byte AP_DATAOUT command buffer).

Fixes: bb71e40db1b7 ("mfd: max77759: Add Maxim MAX77759 core driver")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/max77759.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
index 5818ee2811d1..9c6b85be8289 100644
--- a/drivers/mfd/max77759.c
+++ b/drivers/mfd/max77759.c
@@ -91,8 +91,7 @@ static const struct regmap_config max77759_regmap_config_top = {
 	.wr_table = &max77759_top_wr_table,
 	.rd_table = &max77759_top_rd_table,
 	.volatile_table = &max77759_top_volatile_table,
-	.num_reg_defaults_raw = MAX77759_PMIC_REG_CONTROL_FG + 1,
-	.cache_type = REGCACHE_FLAT,
+	.cache_type = REGCACHE_FLAT_S,
 };
 
 static const struct regmap_range max77759_maxq_registers[] = {
@@ -139,8 +138,7 @@ static const struct regmap_config max77759_regmap_config_maxq = {
 	.wr_table = &max77759_maxq_wr_table,
 	.rd_table = &max77759_maxq_rd_table,
 	.volatile_table = &max77759_maxq_volatile_table,
-	.num_reg_defaults_raw = MAX77759_MAXQ_REG_UIC_SWRST + 1,
-	.cache_type = REGCACHE_FLAT,
+	.cache_type = REGCACHE_FLAT_S,
 };
 
 static const struct regmap_range max77759_charger_registers[] = {
@@ -181,8 +179,7 @@ static const struct regmap_config max77759_regmap_config_charger = {
 	.wr_table = &max77759_charger_wr_table,
 	.rd_table = &max77759_charger_rd_table,
 	.volatile_table = &max77759_charger_volatile_table,
-	.num_reg_defaults_raw = MAX77759_CHGR_REG_CHG_CNFG_19 + 1,
-	.cache_type = REGCACHE_FLAT,
+	.cache_type = REGCACHE_FLAT_S,
 };
 
 /*

---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-max77759-regcache-flat-s-041524113b64

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

