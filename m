Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806598;
	b=mJLya60z3oYkFB/5TohNVbD4wdwR1iAdOGNSh2bV5ISwy7/nNkuyL0ZgmgsrGmewZe5f
	 3wzbGZOP7FNBv9lAKOEsl6wkJ7tax3Ycr0LYFmBixQloa1tc/6SKDthkuXY0fHkZwFAy6
	 lF9KiMCmlpxW4N5bW298SfzRCTBL1sf6BcOvf2yQLAuh0POR3KSKLcNm92a0vufCiLF14
	 23am3R6jLn8usseB0usQb4H3H9R6f9zUExNSASWFaY1yFPGnVZmr0aUX25cXrYfjkpwXA
	 jWIWjdSCR/9ndNT0wdo3sUuy3oQ0iMEan+AXnDLvnnvJjVJltmc9ypSuYA67uwMSaiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jnEBKmIjlMDJzz7/vlO75PN6QRpLxAhezHtALAyCDMU=;
	b=jBF8dfFrT7BCYHmHMDNZqFHWzGpEBLehhwdD8sy9Szb/a9TX76bf0jpYwHV6XEi8lOsK
	 L09Ou1QhXzjPxkm4iv1v/L4L/RSr8DXNssH6f+kRtv9mxLTQokeAvzYVMoCPlUHQwj+l/
	 bcjBLSlpR5IMg77GUSr6T67UkSn3t14zrYHtst/iie889DpkkNQOqyqkw+RDhOByT0GzC
	 jVwWNIr+oFE4QwrVKIIy8GkQUPsC18yu7214UNJr/vTAa5ry4UE9o6tFyfrjN9biY3vUS
	 qNYs2FE1WW7M5ZWNnwj8gNuI0cu+/0/+9DMGI2PZ+aDbKOi5jAyDC4sWX3qUxxIjmJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q6nMvkMS;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC046606A339
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC046606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q6nMvkMS
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c51a02ad3acso559362366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795806596; x=1796411396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jnEBKmIjlMDJzz7/vlO75PN6QRpLxAhezHtALAyCDMU=;
        b=Q6nMvkMS/6xOHo8tE/uE7YyMfPdgwFb3iQHYfy7BS9+nniOwVyvXwLl7Gc+Y8gOBEp
         0xEWlBwnjHE1USHlsTzxhx1IVyxw8fN6u/S5+m/LVu3nkAFdbjnNP/macFHfBr1XHPJp
         DRqz7Y/njOVaLTmYQwOxAqzDAjOqV8+9JSJ/D5Y9F567spN+79C3nBx78HIl4iO4BHZe
         smXyOxA1OjQ37FA6Oj2ObUtFNBLWWOqyJTROPMq6v9lfnfYX2jvGP5vVOG/yUCgbIjn1
         hM0EN3tkLvA4ftyqUk4PF2f8H+cLRRuHqQSlGHEa1tb3KOInDPPxBm7xXGf2rYFGbB61
         whlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795806596; x=1796411396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jnEBKmIjlMDJzz7/vlO75PN6QRpLxAhezHtALAyCDMU=;
        b=mpPuQPs+u8dMEon8h/h9bB7Yf+iUbBP28ApumIVaYWvVv8f43thn1Ws86i1cFNNiRv
         eaPcMrdRvwgDIynBo3/PmFf3bQjTthw5QoNWkBF6UFyMpXdW/awEwPiY0x35CyARN+EN
         DkSRS6F7OQ8My6dIbuvQElZ/8J/DWtBlBLLo+PRPXLcrIgsEadEJ8qrN1GeMmNozqKm7
         JuCciUVk7/LveNbJSpgU7UU0uXKVkU/2cV9KaPxWUMEVV5kynfB8zcueL9+B0Mn4Bi9f
         LnCy4FfXod77lgyKIGSi8XkEKWiCKPd+C6gUZNEdKx+m1nfrlsxqD15cn9raVbrRzMsf
         BKEw==
X-Forwarded-Encrypted: i=1; AL+hErFjX1LHh1vnM2adg7PFn1Z/OAm1B9cLGT88B+lR/5Op/0SeENams62HeX9RbMVgUrSs9cGmzVEIwzw7Akc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yqKYcRFq97OGcJNr3HnGzZWUtg4QsM6bEOKkq5JyTSt4I9Oea
	wYMFZxUYRULVoidCGy1d1uA7i5xv+LHoT4qO26/eSzghCxQjdK32pA9BjWYel716TJtyA+TS5i0
	nESs5/B4=
X-Gm-Gg: AZFdTZfR25Fcf1mm74XKxvt7LuRa2ddnk68yh0sk7sZZE2GcvKsYngD5Lu2Ou/1P+zU
	xluDXfp+oXclFCIYykRKf+g93SsZ4k6KVglmGeZYGIFZTVS0vGI2a3vQEJkejPAVnTdFs3BOiUP
	1CLdnDjGMHlDRbDYePpyxkkH/8cBUaAVqn4xQSPrYkqYXXJtvn5vO3EUiRYv7G69vZMx98HCJ/o
	7/BGElysLwAze5AZSDEcSk62Dpr16KpTe7hw4DoeTjh3VezUdhE6JwTx/W+rAcsDO/LG4BuWjfg
	QD0kCX6Jwjj/skjJVL+RJGIb/frD2N9NHDc+4UE2fSUP7InawXxPRGxJx+FKTYXjXeUy4ST2aa+
	0+youZjGa/QeZ8XVy97/cjCUbT5JSsdMvgQ0lNVW2FIIbvKLXWxSOs7tFNUOClI9mNUZTumW3kf
	kVgRmca5rtS+mfTLtoo5fxUcEHJkQqlytfcJLSy+ujSeZFVggO/yYYuG4ALDZD52UGc5HTrldQm
	R2Gp/7aF6axsIKt2TXHJiVaTrGV+MqyibtAQun3YAyQXOXc+d1wKn2krgnn6xvldeMOlRmRNEfe
	eqIRvkM2cGjws29ioIWnVnfhdBThoUmW7Zru+rGNVnPq2P6CZEZxiIo7dZU87A7kx0g7RtpaD8T
	mNllXqh/PeREGav9i3w==
X-Received: by 2002:a17:907:1187:b0:c49:903e:1e19 with SMTP id a640c23a62f3a-c513a8595d0mr1656720366b.26.1795806596148;
        Fri, 27 Nov 2026 11:09:56 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85fdsm909175266b.69.2026.11.27.11.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:09:55 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Nov 2026 19:09:53 +0000
Subject: [PATCH 2/6] power: supply: max77759: report charge voltage in uV
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
Message-Id: <20261127-max77759-charger-fixes-v1-2-b364a0862d72@linaro.org>
References: <20261127-max77759-charger-fixes-v1-0-b364a0862d72@linaro.org>
In-Reply-To: <20261127-max77759-charger-fixes-v1-0-b364a0862d72@linaro.org>
To: Amit Sunil Dhamne <amitsd@google.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

The max77759 charger power supply reports constant_charge_voltage_max
in millivolts instead of microvolts (for example
POWER_SUPPLY_CONSTANT_CHARGE_VOLTAGE_MAX=4300 instead of 4300000 in
sysfs), violating the power_supply ABI.

POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE_MAX is defined in microvolts,
but chg_cv_prm_ranges, CHG_FV_DEFAULT_MV, get_float_voltage(), and
set_float_voltage_limit() operate in millivolts, and
max77759_charger_init() divides constant_charge_voltage_max_uv by 1000.

Convert chg_cv_prm_ranges and the float-voltage helpers to microvolts
so the driver reports and programs CONSTANT_CHARGE_VOLTAGE_MAX in uV.

Fixes: 70d7dd27f6dc ("power: supply: max77759: add charger driver")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/power/supply/max77759_charger.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supply/max77759_charger.c
index a75005c0b582..6876ae0a8188 100644
--- a/drivers/power/supply/max77759_charger.c
+++ b/drivers/power/supply/max77759_charger.c
@@ -25,7 +25,7 @@
 
 /* Default values for Fast Charge Current & Float Voltage */
 #define CHG_CC_DEFAULT_UA			2266770
-#define CHG_FV_DEFAULT_MV			4300
+#define CHG_FV_DEFAULT_UV			4300000
 
 #define MAX_NUM_RETRIES				3
 #define PSY_WORK_RETRY_DELAY_MS			10
@@ -60,10 +60,10 @@ static const struct linear_range chgcc_limit_ranges[] = {
 	LINEAR_RANGE(200000, 0x3, 0x3C, 66670),
 };
 
-/* Charge Termination Voltage Limits (in mV) */
+/* Charge Termination Voltage Limits (in uV) */
 static const struct linear_range chg_cv_prm_ranges[] = {
-	LINEAR_RANGE(3800, 0x38, 0x39, 100),
-	LINEAR_RANGE(4000, 0x0, 0x32, 10),
+	LINEAR_RANGE(3800000, 0x38, 0x39, 100000),
+	LINEAR_RANGE(4000000, 0x0, 0x32, 10000),
 };
 
 /* USB input current limits (in uA) */
@@ -310,14 +310,14 @@ static int get_float_voltage(struct max77759_charger *chg)
 	return ret ? ret : val;
 }
 
-static int set_float_voltage_limit(struct max77759_charger *chg, u32 fv_mv)
+static int set_float_voltage_limit(struct max77759_charger *chg, u32 fv_uv)
 {
 	u32 regval;
 	bool found;
 
 	linear_range_get_selector_high_array(chg_cv_prm_ranges,
 					     ARRAY_SIZE(chg_cv_prm_ranges),
-					     fv_mv, &regval, &found);
+					     fv_uv, &regval, &found);
 	if (!found)
 		return -EINVAL;
 
@@ -555,10 +555,10 @@ static int max77759_charger_init(struct max77759_charger *chg)
 		return ret;
 
 	if (power_supply_get_battery_info(chg->psy, &info)) {
-		fv = CHG_FV_DEFAULT_MV;
+		fv = CHG_FV_DEFAULT_UV;
 		fast_chg_curr = CHG_CC_DEFAULT_UA;
 	} else {
-		fv = info->constant_charge_voltage_max_uv / 1000;
+		fv = info->constant_charge_voltage_max_uv;
 		fast_chg_curr = info->constant_charge_current_max_ua;
 	}
 

-- 
2.56.1.839.g22a8290db9-goog

