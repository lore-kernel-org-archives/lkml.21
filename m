Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806600;
	b=gGChybPhNxth2NaA5SvhmGylE7IlyaUcxxk76sWC6jdb6XO9pVXxni6i/3CLjM9QfxDB
	 PDwttDRtEioQnwiJRHIbA1bwKBKXTUCcb7IYN0RHN4uERt2hQEhrL+BGH+KFFndznj+E8
	 qt05TpjEORFDQX3yuWI0LFFLOtu4ej6Koko9LMjI0ASh+04lpv8Xt1TDLOcm7T+r8Yd09
	 ChiZj7XFHk3oTlyDXUsm2hWiRY0lOAelZzQHiz4/QAf8/njJ7xdiJSOQTSyYWnRlzm2e0
	 LS23BPpm58QUvO5ZDv7V6Dm54kGOxmDF6uv+a30ljWrAsIVw3OIK2o3hAlCxsyGvofg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gMUEHr5+RLy5VN9K88In7HKPCt0PQK7KPkn/dGa+2MI=;
	b=TNM30qpaD0C0n4oJSijl5DL0q5jBEfh6TLtBEfeaRB+m/PqlczKpkQM8dEIxZNc1ltmv
	 k0sfNQaIGNiKlUFJW/kFDL33uvH+eD7mxW0y88qof0HQmP2f5kjzlNztRz68BEZot4Hvb
	 dw/+Nj4F/BDDiaBa9C9ibLypF8blIdWhaudUBQAU/PagCdqpjgFnbUCb0JaNomjvQrKrd
	 AtOCbBLg0XFLk/XX5uPk2xiz+XwJbBlqs+cAcdn3Anmjxunpj8JLaxdjrxDehTzNqWy8I
	 M6vxhL7trfVuWkGTmD+Ti39QBnugV5UKhz82ZfdZJ1DW2iixff4XROR8cQCrRjUUvWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NHAqD3p4;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0291606A6B1
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0291606A6B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NHAqD3p4
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c5126505cb3so1105529766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795806598; x=1796411398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMUEHr5+RLy5VN9K88In7HKPCt0PQK7KPkn/dGa+2MI=;
        b=NHAqD3p4/CgaMMToaEN7P74q0g/caivQ/b+ti0c0fLLKp1cZi98di9wkKw4rsBvdSq
         h7itirNf7U2rBjiZmNVVPGwLRRYw73tIUZ+7vcsgvTU/DDiMPaJe07UeC7r8ah+kNTqw
         0tx4AebCuvY+IhRAa1Pu0StyO8OCUlZHh24CiOhfL4sTELqBXSaW8O3FYibSmOG9LUhP
         4MXKggtPIJ2d+mxDYuMHDOfx+A4UBzZp1iStQUAMGf89UihTdMNAlCddox66SUEgxJh8
         LLR42ozQSaIPi/nGbrf3smVKtcHT8ysYFrgNxGE1DwkOjFKWIONr4zh1kdBI4GDOo2Dy
         J9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795806598; x=1796411398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMUEHr5+RLy5VN9K88In7HKPCt0PQK7KPkn/dGa+2MI=;
        b=EyHqxTaA/OBpzCak/XTAyZDpw8r6SQtBvF37G2jKYdGBliFyVy7oc51Tv3KRc8xWvU
         SwKE+CP5BM4dbf9yrV91Q3F/gfTJSfL5fvCUmGGSx5EM/lHXrPxt/8YMc11xinqO1aZ7
         eTK8ShhRCSvyfA8Mjn9HvrW7rjA9+WEKBZ+xuLl5LlhoRYMcNtHM3M2MyeszVYl7xqUs
         rV6bmP1BDQvka1IWrJA+IsxbHo/hM1EdySAjp2SaoRsFYjEJ1TswwNaoNR1jlpKmipKA
         o58EHcLB9rIyFR/hOBI26ugigpkLewxQilp0DJLEFVYZcX1267qfQgLfLxUTqiFjBAAq
         AbbQ==
X-Forwarded-Encrypted: i=1; AL+hErE9SYaoIAX2sgpTVPJWlmRb/btHcvEidYaPjDrrCU5lYdiRy5qFPHdvBzEQAoVLIsVe7adSIuIM/ihDPjM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f9YbksgRwjprSlPBxJK1o7o2i+TK1lojY3vY9UiHMxWyXarsr
	yd35kO/LHxpFeNLQBwejS5wGxwStsFErqkPuInKWNrgoCr0oBbojb3LW6/19VmzyWw7K9/8M1Kb
	1dgw0rH0=
X-Gm-Gg: AZFdTZf3+2LLC+QHRL8U+WX4uzerY5z3RYYXkTo57N9rEP3BfK7MlnP+BW/yKqTHhFN
	6Zfpx6PgyCL6hJ8zmj/ie2RZMTFpCkssGug4S0dCPqxNBZnFB78WeCSrnN3cc0ZoHngrtI2vKI4
	FbSy1ADRnCdJKwa+N/B2ZYKa845bFr1MlRJ80U8E5bY00LlWxC7KqWkHyX/z7novX347Ti5GiEw
	QnuZQnwWqLZ3HP04VYpiAYWHXljuBzN+k7dARBUMzvsrnWzQD8MyRAPyf7KXMAO07XKLYoEAHCp
	ClhtUDS6rJdfgHWtXjnF9eCB6UEPGaHUHKAoIv8oKqboShBXPAYJ/ZDInKv5VBmLd67ws24ENB8
	zZHjNl8eFdXsYCcVXzJ2LWxVM7cUtQmmLQeGlZ3g+7jn2xKQee5S4guf3cKK32RaVdTz9KkcOrB
	tAGyjSWnPAU1DOZn/IV221gOGPQZoYsYfUQFGr4VTQd6OMbOEIZM0vfhr7Jfy7w0cDtmn53U6iu
	InJ5/HfINjVsPETNaCC3bDfn9Py9b905FZIze2W1+MaQXC4cW+RCM/av3i/HD84637FqOkgHds9
	KXye3CbPfig69jEe+TCN2Jto7lCwIrXqRCNe4l3tybuGP1l8ulx74UkJLslGqTBtfO3nTUw8+AS
	1XlXZ1S+B9/V78tVfSw==
X-Received: by 2002:a17:907:7f91:b0:c50:c747:a4ce with SMTP id a640c23a62f3a-c513a4b083bmr2229259766b.4.1795806598370;
        Fri, 27 Nov 2026 11:09:58 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85fdsm909175266b.69.2026.11.27.11.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:09:58 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Nov 2026 19:09:56 +0000
Subject: [PATCH 5/6] power: supply: max77759: sync supplier state at probe
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
Message-Id: <20261127-max77759-charger-fixes-v1-5-b364a0862d72@linaro.org>
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

Supplier events emitted before max77759_charger finishes probing (or
before reloading the charger module) are missed, leaving charging off
until the next supplier event.

max77759_charger_probe() calls max77759_charger_init(), which forces
MODE_OFF, and then registers the power_supply notifier without reading
the supplier's current state.

Extract the supplier read and work scheduling from psy_changed() into
max77759_sync_tcpm_psy() and run it via power_supply_for_each_psy() at
the end of probe. Hold chg->retry_lock across the property reads and
state update so the initial scan cannot overwrite a concurrent notifier
event with stale values.

Fixes: 70d7dd27f6dc ("power: supply: max77759: add charger driver")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/power/supply/max77759_charger.c | 61 +++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 22 deletions(-)

diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supply/max77759_charger.c
index 7a7d9a54d888..fe71e8143954 100644
--- a/drivers/power/supply/max77759_charger.c
+++ b/drivers/power/supply/max77759_charger.c
@@ -663,34 +663,31 @@ static void psy_work_item(struct work_struct *work)
 	}
 }
 
-static int psy_changed(struct notifier_block *nb, unsigned long evt, void *data)
+static int max77759_sync_tcpm_psy(struct power_supply *psy, void *data)
 {
-	struct max77759_charger *chg = container_of(nb, struct max77759_charger,
-						    nb);
 	union power_supply_propval current_limit, online;
 	static const char *psy_name = "tcpm-source";
-	struct power_supply *psy = data;
+	struct max77759_charger *chg = data;
 	int ret;
 
-	if (!strnstr(psy->desc->name, psy_name, strlen(psy_name)) ||
-	    evt != PSY_EVENT_PROP_CHANGED)
-		return NOTIFY_OK;
-
-	ret = power_supply_get_property(psy, POWER_SUPPLY_PROP_ONLINE,
-					&online);
-	if (!ret && online.intval)
-		ret = power_supply_get_property(psy,
-						POWER_SUPPLY_PROP_CURRENT_MAX,
-						&current_limit);
-	if (ret) {
-		if (ret != -ENODEV)
-			dev_err(chg->dev,
-				"Failed to get supplier psy property: %d\n",
-				ret);
-		online.intval = 0;
-	}
+	if (!strnstr(psy->desc->name, psy_name, strlen(psy_name)))
+		return 0;
 
 	scoped_guard(mutex, &chg->retry_lock) {
+		ret = power_supply_get_property(psy, POWER_SUPPLY_PROP_ONLINE,
+						&online);
+		if (!ret && online.intval)
+			ret = power_supply_get_property(psy,
+							POWER_SUPPLY_PROP_CURRENT_MAX,
+							&current_limit);
+		if (ret) {
+			if (ret != -ENODEV)
+				dev_err(chg->dev,
+					"Failed to get supplier psy property: %d\n",
+					ret);
+			online.intval = 0;
+		}
+
 		chg->tcpm_online = online.intval;
 		chg->tcpm_current_limit = online.intval ?
 					  current_limit.intval : 0;
@@ -699,6 +696,20 @@ static int psy_changed(struct notifier_block *nb, unsigned long evt, void *data)
 
 	schedule_delayed_work(&chg->psy_work, 0);
 
+	return 1;
+}
+
+static int psy_changed(struct notifier_block *nb, unsigned long evt, void *data)
+{
+	struct max77759_charger *chg = container_of(nb, struct max77759_charger,
+						    nb);
+	struct power_supply *psy = data;
+
+	if (evt != PSY_EVENT_PROP_CHANGED)
+		return NOTIFY_OK;
+
+	max77759_sync_tcpm_psy(psy, chg);
+
 	return NOTIFY_OK;
 }
 
@@ -773,7 +784,13 @@ static int max77759_charger_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "Failed to add devm action to unregister psy notifier\n");
 
-	return max77759_init_irqhandler(chg);
+	ret = max77759_init_irqhandler(chg);
+	if (ret)
+		return ret;
+
+	power_supply_for_each_psy(chg, max77759_sync_tcpm_psy);
+
+	return 0;
 }
 
 static const struct platform_device_id max77759_charger_id[] = {

-- 
2.56.1.839.g22a8290db9-goog

