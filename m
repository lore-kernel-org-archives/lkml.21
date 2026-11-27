Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806600;
	b=iweT40Rab8AIezymFwFDwqUulFZiNPpd4F5XZnnZwzd72TB/JViYqczfSHI+D7ut++uO
	 eHo986uDQ3JNjAme8R0j/38rrwx4znj4PUN4piW0VmYCK8TMjfIz3cT0djyITRvNlSNXd
	 AnL2g+u8CE6ByxmN40y8DoXlsu9jfuQ0DmNcqIzqixUUBjC7zoc0CGpJeYp+C6+IkStfg
	 Jhzjg04RtU6UJa+XFV2hyr4gEoN3Ko4+9p6ImSUvCFLFVZz/28LjN8e3eDp93OUpRNdsq
	 VcF5/XltALwiWiiD6lBadbBR6dkEzogdxljPyFLT/jO+z7TGBhImp8HznY/YYwvc+qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nSwTlk+qW9HaX1IW1y5n0J0zLzYJ3qzpDghagGtO0AE=;
	b=NAjBAsEp9LQAlE1wSa9sC63mo8fGvzy2dIGpZ1l2oYHPjeymWonYZx7NDwiWzOG38ltE
	 VNFum8Vf6HVfDDPmHtm4zG6mci9lbjbx3UXUoFIsrhkrtoMKKVFTr55NWPv8hAi8yiyFE
	 9aC/vMFbJJJljFj51gym9ygXuTRFZl0alg07lW6lqpCPiNDlVaCwATkNb4MlJCTrsh3om
	 R4Pb18SXMatUVKaZdvefH8l7LtbLYlZwK630Zn9f8icFmySdt2ZGlLpcap7ZcaoHdd137
	 4Jk2SLC8job7IIltSvWws2DwBQxlw92f908dCZQboPgspMWTA2opaTrKiitcI9YM0XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZBCD39nP;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4011606A6AE
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4011606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZBCD39nP
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c5127c7abd5so1286946666b.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795806598; x=1796411398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nSwTlk+qW9HaX1IW1y5n0J0zLzYJ3qzpDghagGtO0AE=;
        b=ZBCD39nPvH4exZZJgv7VykpkHGuo91cS3rRVnhV+HRIsdUwxGMWrrhaukdIQp1rNMC
         aIHtoTLHA1RQmmQTCFT+mqhkAfBnqaVqK7zv3tMX76ZvWDVkfai1FSxg8bNfb1yrrrvJ
         9RIzMUqL5aVLxO96fTeqEKRwGSm2GYaP3M8fgxdyG6i27rdQ+ZrHnNOR3nSlLhHuq0I3
         AO/gzLGzzEBPOO+aG3ZFCh30UUDo3D4vTyq3jWYJBkppcPt6Ld+epujPgsCGw5bt+enC
         D4by+qYX0RcAmdTzK4yCAnh6xB2CQqWgdQK0ZSty0RMTgiETj1iL+YnF/maxUgLnL4EW
         23ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795806598; x=1796411398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nSwTlk+qW9HaX1IW1y5n0J0zLzYJ3qzpDghagGtO0AE=;
        b=H8e1qh1eZ6CWf80Se71j7yAdErD6m6XTauta9HM+D1DEMf0+p0DBsk9gPqxt7Umv+R
         vEDNVhWw18SSct8NXkFyCdwj+zCCDFVb0oRG33X2mnij5Z/HjiplH9ZA6/oancqoWZDG
         HgK5EMUkG7QZky4Krx9Wu+/MXmxpMaXBFeNWlaROdrbs8RBj51EikaA+piijL3ORKyQb
         r3HWHB8jzbRaVYpOwhPUHJ1Slam05yqz8sRP5N8oHKYtQFxzpmQKXsBLOgRGkPDH2yGm
         FT2Ivv64+yOd5sTInhPmsqq5hv8v1JpXf8idGZk//zPE+KKcDy6FeezMHbf0R8Yc1gwr
         XUSA==
X-Forwarded-Encrypted: i=1; AL+hErEs8+V1/3OwzP0zMVH1v9GEVB7ESH4IeZf0edCybMxbpUCZqrS17hkuanZ2BQvzLnWnKHP23zqajDD1VmU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CUwlGsaOwIIq6NF47TUIgr+EawOQj+r6Za/yWd15cN61b0Anb
	BxqRU3k3N7Zw/j4UXhrsSfcHiBn1s8Gq8HvK5DF27XtvsY1VAsWQZl5vAbkdjTQA20QRhn7r/jk
	1MD6LQAk=
X-Gm-Gg: AZFdTZcW8ffD+BbvP9oPzqVXAIRk1DxXlE+SbKQ6J4fjaPYgouKv2jvuYZr+9h2zn+Z
	YJYDTsFMddX3VlhhD+Bv5OY9u5yFEb/xXEIqpCcf2KFqAhlCYpDvbYDfm49evhheRCrgScuy8Qn
	7v6GA9lsceEpP4aqvkqwJnqqASDZzo90/NUITqD8UfiYSbaQK7HmAA14z2sEpYxZuMknJ5Sj7Ds
	D6cDWvJyujubtlKAy3DhGjAKsybXoFW90MnEFch0tev0ppd+FD9r1TIyl7kgubunFE2wUFrfuIX
	eoVfJr0P4yRy/BDPXmvekItgO/lf4Q2MUt7/o9p1jzkxZTdcRl45o3QAGRcQaU7ji5b8nJVCCYj
	AS3AGvfM0oOCUt8hY/8A9W2H/VA35rEDdutfwJj3m4IigEjm4U6amxepLbUQLfSInfVM3Iz9rgR
	gIp8Jzd0dzXcS8BiIUrHB/50B0bllcVm/DmKKpZmRldqjftvX2cY5UijmTpEkGqRwxU1CKzpH6c
	+HjiJQHE1NZXnt0XQrLAiRuIuFF16NrcdiOxv+AhqKb9P4C4qC0gX6xGOl1ozK7n/Q6CvRfJIIh
	OhQQVprdP9F0wpnh4fKZQAAbuW+J1aleoFxAAaFkPe3rrPqy/rNANzrdE9m5jFCrRZSvm7p8Q90
	UodIq5ADQwldz6ge4kg==
X-Received: by 2002:a17:907:9d81:b0:c51:3697:d0de with SMTP id a640c23a62f3a-c513a81488emr1386646666b.20.1795806597885;
        Fri, 27 Nov 2026 11:09:57 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85fdsm909175266b.69.2026.11.27.11.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:09:57 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Nov 2026 19:09:55 +0000
Subject: [PATCH 4/6] power: supply: max77759: notify on mode or input limit
 change
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
Message-Id: <20261127-max77759-charger-fixes-v1-4-b364a0862d72@linaro.org>
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

Event-driven userspace (such as UPower or healthd), downstream consumers
(such as the max17042 fuel gauge), and power_supply LED triggers miss
changes to the charger's ONLINE or INPUT_CURRENT_LIMIT properties when
psy_work_item() changes the charger mode or input current limit in
response to a supplier update without triggering a charger hardware
interrupt (for example, changing CHGIN_ILIM while already charging, or
toggling mode with a full battery).

Only the charger interrupt handlers call power_supply_changed().
set_input_current_limit() and charger_set_mode() do not report whether
the hardware state changed, and psy_work_item() never notifies the
power_supply core.

Add a bool *changed output parameter to set_input_current_limit() (via
regmap_update_bits_check()) and charger_set_mode(), and call
power_supply_changed(chg->psy) from psy_work_item() whenever either
changes.

Fixes: 70d7dd27f6dc ("power: supply: max77759: add charger driver")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/power/supply/max77759_charger.c | 48 ++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supply/max77759_charger.c
index 49ab1766cc5d..7a7d9a54d888 100644
--- a/drivers/power/supply/max77759_charger.c
+++ b/drivers/power/supply/max77759_charger.c
@@ -345,21 +345,30 @@ static int get_input_current_limit(struct max77759_charger *chg)
 	return ret ? ret : val;
 }
 
-static int set_input_current_limit(struct max77759_charger *chg, int ilim_ua)
+static int set_input_current_limit(struct max77759_charger *chg, int ilim_ua,
+				   bool *changed)
 {
+	bool ilim_changed;
 	u32 regval;
+	int ret;
 
 	if (ilim_ua < 0)
 		return -EINVAL;
 
 	linear_range_get_selector_within(chgin_ilim_ranges, ilim_ua, &regval);
 
-	return regmap_update_bits(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_09,
-				  MAX77759_CHGR_REG_CHG_CNFG_09_NO_AUTOIBUS |
-				  MAX77759_CHGR_REG_CHG_CNFG_09_CHGIN_ILIM,
-				  MAX77759_CHGR_REG_CHG_CNFG_09_NO_AUTOIBUS |
-				  FIELD_PREP(MAX77759_CHGR_REG_CHG_CNFG_09_CHGIN_ILIM,
-					     regval));
+	ret = regmap_update_bits_check(chg->regmap,
+				       MAX77759_CHGR_REG_CHG_CNFG_09,
+				       MAX77759_CHGR_REG_CHG_CNFG_09_NO_AUTOIBUS |
+				       MAX77759_CHGR_REG_CHG_CNFG_09_CHGIN_ILIM,
+				       MAX77759_CHGR_REG_CHG_CNFG_09_NO_AUTOIBUS |
+				       FIELD_PREP(MAX77759_CHGR_REG_CHG_CNFG_09_CHGIN_ILIM,
+						  regval),
+				       &ilim_changed);
+	if (!ret && changed && ilim_changed)
+		*changed = true;
+
+	return ret;
 }
 
 static const enum power_supply_property max77759_charger_props[] = {
@@ -422,7 +431,7 @@ static const struct power_supply_desc max77759_charger_desc = {
 };
 
 static int charger_set_mode(struct max77759_charger *chg,
-			    enum max77759_chgr_mode mode)
+			    enum max77759_chgr_mode mode, bool *changed)
 {
 	int ret;
 
@@ -445,6 +454,9 @@ static int charger_set_mode(struct max77759_charger *chg,
 		return ret;
 
 	chg->mode = mode;
+	if (changed)
+		*changed = true;
+
 	return 0;
 }
 
@@ -452,14 +464,14 @@ static int enable_chgin_otg(struct regulator_dev *rdev)
 {
 	struct max77759_charger *chg = rdev_get_drvdata(rdev);
 
-	return charger_set_mode(chg, MAX77759_CHGR_MODE_OTG_BOOST_ON);
+	return charger_set_mode(chg, MAX77759_CHGR_MODE_OTG_BOOST_ON, NULL);
 }
 
 static int disable_chgin_otg(struct regulator_dev *rdev)
 {
 	struct max77759_charger *chg = rdev_get_drvdata(rdev);
 
-	return charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
+	return charger_set_mode(chg, MAX77759_CHGR_MODE_OFF, NULL);
 }
 
 static int chgin_otg_status(struct regulator_dev *rdev)
@@ -553,7 +565,7 @@ static int max77759_charger_init(struct max77759_charger *chg)
 		return ret;
 
 	chg->mode = FIELD_GET(MAX77759_CHGR_REG_CHG_CNFG_00_MODE, regval);
-	ret = charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
+	ret = charger_set_mode(chg, MAX77759_CHGR_MODE_OFF, NULL);
 	if (ret)
 		return ret;
 
@@ -600,6 +612,7 @@ static void psy_work_item(struct work_struct *work)
 	struct max77759_charger *chg =
 		container_of(work, struct max77759_charger, psy_work.work);
 	int current_limit, online, ret;
+	bool changed = false;
 
 	scoped_guard(mutex, &chg->retry_lock) {
 		current_limit = chg->tcpm_current_limit;
@@ -607,18 +620,21 @@ static void psy_work_item(struct work_struct *work)
 	}
 
 	if (online && current_limit) {
-		ret = set_input_current_limit(chg, current_limit);
+		ret = set_input_current_limit(chg, current_limit, &changed);
 		if (ret) {
 			dev_err(chg->dev,
 				"Unable to set current limit, ret=%d\n", ret);
 			goto err;
 		}
 
-		charger_set_mode(chg, MAX77759_CHGR_MODE_CHG_BUCK_ON);
+		charger_set_mode(chg, MAX77759_CHGR_MODE_CHG_BUCK_ON, &changed);
 	} else {
-		charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
+		charger_set_mode(chg, MAX77759_CHGR_MODE_OFF, &changed);
 	}
 
+	if (changed)
+		power_supply_changed(chg->psy);
+
 	scoped_guard(mutex, &chg->retry_lock) {
 		if (chg->psy_work_retry_cnt)
 			dev_dbg(chg->dev,
@@ -630,7 +646,9 @@ static void psy_work_item(struct work_struct *work)
 	return;
 
 err:
-	charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
+	charger_set_mode(chg, MAX77759_CHGR_MODE_OFF, &changed);
+	if (changed)
+		power_supply_changed(chg->psy);
 	scoped_guard(mutex, &chg->retry_lock) {
 		if (chg->psy_work_retry_cnt >= MAX_NUM_RETRIES) {
 			dev_err(chg->dev, "chg psy work failed, giving up\n");

-- 
2.56.1.839.g22a8290db9-goog

