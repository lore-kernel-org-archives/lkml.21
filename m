Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106943;
	b=rihdaRvAVU/FDrW3gkPrCvJ4NxCh2prg+DuvAO/9qVGdusPYCLXiGIsFByEa9UkZO8Un
	 rVIYhIBqRR2ge2O7/gA1SM5xQYpD/AaVyEl6zvvQm5/JC7PZP2X+4iZ21yku/09OX2VC5
	 Kvepyf8BZKv5LSbKmtCrrasedJGCwJIi16z20MqSl7MqQjzNmUvn3NROkPc3sEb4XaYF/
	 hZvGaOHaPaXnyj9bk3rxHYvQ6nm1689854ae3/VQlMB1MlC6VjPPWoHkfXSwGyeqMVW4h
	 VBlAy8n8r8yafU8hmtXKCjszh+VTfdZqwnb8lGI+uJc4oDW6gQnf/m03Mk9ig85wh6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZMPheRzDd1YHr1QUJ9JxTtEYcWTfkEtW99n5PgbERIY=;
	b=3jJ0olnJba61oQ9GjId+/hi9G34yoGb4zanlNVd6OXo/GH3/Bb3QlrqbrJbpOfzGuhhH
	 Mq0Xk3QzcoRQ1xSFPU84LCVTuP3GzgHlj/HAhqQRZiKIDrzpwuXMxb12vWMAqOJiAn5Rg
	 vJLDmIKanFSJPxeY+OCB3fKT6cWF7Ll3rWMs3ESMr0VOYxqoCkIaKiG+FedmMJHhOW5t2
	 O1uAjBuDPfU/dhBgTlVJ/oBMzaqmILjkLrLJujfDKLGOjX8QDLHDwJ+JpMEHQFdhPNZid
	 DAenobgtKm2kc+b8SktXV+lMY7p2EHXmUGGXdgcGio6NmuRWt2O2o6lA9FgpE1m24GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zVjme470;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C65606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3C65606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zVjme470
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso1705152e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106941; x=1795711741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZMPheRzDd1YHr1QUJ9JxTtEYcWTfkEtW99n5PgbERIY=;
        b=zVjme470Sv2ijY7fzWSAITq6EqG4nmv3ggBADUa/j0lVaUlRMfqrjX3OgwfEzSAWCF
         O/hevpXCgcxQffXlbrv+ubUtF/1tTtfjV76HoiKi+4tc7D0xLPAEcNquuesAzVYF2JDH
         LuuVCr/3khlqphgCT8pBTLfHQNTFlWAyl0tNYCrcJyXZp3I5dXgtv41XWn2B/Ir1xULL
         fNf1lAmK86Dm589yxim0NWb9flsXmWsNmK1cnCee3sPkeAbSN6h2ALy9Vd1Rn7UHq9UA
         W7Qd4xWbXWx815fkyqOPVW6WcCerMSW/wt1kzP+bcB9VAo4F21itd2ojFDFmpBHPpTPd
         v8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106941; x=1795711741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZMPheRzDd1YHr1QUJ9JxTtEYcWTfkEtW99n5PgbERIY=;
        b=yeylOmpCPXTc47OwT+uUeNgB0LQ6AQ3dwU+pUV1ru86ow8/5KXXPyJe6Ay30RcKY+u
         Ro8i3dOh9CJyUBcdFFzvZKk8FdwpQvjHgeGsn3L8BaHSKnFXu7ELLW67Kd2YdjLqtacO
         7plT3wlqOnMYO0MMTbYeL7XP51aE1JRTKdT6Z5c7IlT9f/vEm8zzJo2fu9mjSzykYEzi
         57w4lIxCKJBK66mZO9mXKqE47chytpcDk1Pr/yADVzso18pB29LZMb/C/IhIVMHMhplA
         YmKSLMMLBbEaLKLh9WXmpnh7DL0HhiQfACJuxzCW7mBg6dGQX+HWCFoKyCgwB0X/tUWK
         7TEg==
X-Forwarded-Encrypted: i=1; AL+hErEMvBVIU6T6iVGhh9NhR3xdDLyIWjTzYPU1Kvf/wF7vE7pNgFJNJrd72HFEynWWtcu5X1bqnMLtet0Mid0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uW8fXwdqa/9lNC2fkBaJs4vo1/4ZlOWWOhb/MZ8zwWL1alOre
	iKGzNG6cBEDzEELOx1zVS7EgTEq3Op9DvtrCojLQJbYKOBJGgs3TEEowgM2pjnGJ
X-Gm-Gg: AYBFou1nKLfg0ZbMIjL0WnRusar3WzuxKJ2Y4vUihfU02hOmiRPOZual3e3KzTrqpSY
	kyb5jie8g7q7SAnLS0/PQSuKIotly1Ii7DofTF6NGJljfrFfyOYRYosa4W4lLfT4JeyFyaomZcd
	Sr/RrezGR/NA/7aKVkzjIVHwf9iTS3iVSSx4Aj3bwjIg4uoCpyi741VDfPl6hqEeSDENM03zaAN
	xSuNbsORlUV9bj/Teh6ndev1kHFR4UTXHJ/vlKp6C2CXrbpW3kSOcVXV36tMxSMgxY7Vv5cFFa2
	dnO1gY0A5ruYYHqX0fuAIPuBjysZx/mNtc6LoWBo+i9QVKTEWjn3w8ifet9JYPpwVb9S34VEEsP
	EVgI3pnOfsSgRLUpc2zHW4rv8oAIU/XvlmZhK5MbgAuVwm475lYUNA27j34Pj3t26Cw0USegnPD
	IeryzKq6NRsF9rXl83XXajXvVDpBjHeKmU9w+hhPSjfBQ6x3LTZPe1omdDhni/D5065K3D9lHYn
	PRTgfxexHUXFp+DVjEdQx/51Y88DIdLaaE5dG2YjsgyiWjsTSXGwN8aO0Sqp/VqIe2dvPMdNyQQ
	2aJ3fDlPomYDjWWxkx2Z3jhmJ6Le2ESuHXi+Pmhlhw2o+y2/iIF0BkJeCRj4qYKozbh+YXP7tmt
	TJgKZXRFYiSkVClwOhqIf2BYy+Q==
X-Received: by 2002:ac2:4e07:0:b0:5c1:ad4b:4bc8 with SMTP id 2adb3069b0e04-5c1bc7da07emr107942e87.33.1795106940819;
        Thu, 19 Nov 2026 08:49:00 -0800 (PST)
Received: from localhost ([2a02:fe1:8175:9200:d77a:e280:1a11:2086])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa77ebecsm1705162e87.50.2026.11.19.08.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:49:00 -0800 (PST)
From: Sven Ulland <sven.ulland@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Sven Ulland <sven.ulland@gmail.com>
Subject: [PATCH] watchdog: gpio: Keep GPIO level when taking over a running watchdog
Date: Thu, 19 Nov 2026 17:48:41 +0100
Message-ID: <20261119164841.1847870-1-sven.ulland@gmail.com>
X-Mailer: git-send-email 2.43.0
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

For a watchdog with the always-running property, the driver takes over
at probe: it requests a toggle GPIO as input, and gpio_wdt_start()
then drives it low and toggles it. These level changes happen within
microseconds, and a watchdog that needs hw-min-interval-ms resets the
system when pinged that fast, so taking over from the bootloader can
trigger a reset.

The Aruba AP-305 access point (Qualcomm IPQ4029) has an external
watchdog that resets the board when its GPIO is toggled every 6 ms or
faster. Even with hw-min-interval-ms set to 100 ms, 7 of 10 boots
started from the bootloader still reset within two seconds of the kernel
starting.

If the watchdog has both always-running and hw-min-interval-ms, request
the GPIO as is and keep its current level. The watchdog core then sends
the first ping once the minimum interval has passed. Other watchdogs are
unaffected.

Tested on the Aruba AP-305 with this change backported to Linux 6.18,
and 10 of 10 boots survived.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Sven Ulland <sven.ulland@gmail.com>
---
This applies on top of watchdog-next, as it depends on Florian's commit
2791c2bc6aca ("watchdog: gpio: Support watchdogs with a minimum
heartbeat interval").

 drivers/watchdog/gpio_wdt.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
index 1c79498db69e..4f4f9e9a7031 100644
--- a/drivers/watchdog/gpio_wdt.c
+++ b/drivers/watchdog/gpio_wdt.c
@@ -79,6 +79,20 @@ static int gpio_wdt_start(struct watchdog_device *wdd)
 	return gpio_wdt_ping(wdd);
 }
 
+/* Take over a running watchdog without changing the GPIO level */
+static int gpio_wdt_adopt(struct gpio_wdt_priv *priv)
+{
+	int level = gpiod_get_value_cansleep(priv->gpiod);
+
+	if (level < 0)
+		return level;
+
+	priv->state = level;
+	set_bit(WDOG_HW_RUNNING, &priv->wdd.status);
+
+	return gpiod_direction_output(priv->gpiod, priv->state);
+}
+
 static int gpio_wdt_stop(struct watchdog_device *wdd)
 {
 	struct gpio_wdt_priv *priv = watchdog_get_drvdata(wdd);
@@ -112,6 +126,7 @@ static int gpio_wdt_probe(struct platform_device *pdev)
 	enum gpiod_flags gflags;
 	unsigned int hw_margin;
 	const char *algo;
+	bool adopt = false;
 	int ret;
 
 	priv = devm_kzalloc_obj(dev, *priv);
@@ -120,12 +135,17 @@ static int gpio_wdt_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
+	priv->always_running = device_property_read_bool(dev, "always-running");
+
 	ret = device_property_read_string(dev, "hw_algo", &algo);
 	if (ret)
 		return ret;
 	if (!strcmp(algo, "toggle")) {
 		priv->hw_algo = HW_ALGO_TOGGLE;
-		gflags = GPIOD_IN;
+		/* Switching the GPIO to input could cause an edge */
+		adopt = priv->always_running &&
+			device_property_present(dev, "hw-min-interval-ms");
+		gflags = adopt ? GPIOD_ASIS : GPIOD_IN;
 	} else if (!strcmp(algo, "level")) {
 		priv->hw_algo = HW_ALGO_LEVEL;
 		gflags = GPIOD_OUT_LOW;
@@ -168,8 +188,6 @@ static int gpio_wdt_probe(struct platform_device *pdev)
 			return -EINVAL;
 	}
 
-	priv->always_running = device_property_read_bool(dev, "always-running");
-
 	watchdog_set_drvdata(&priv->wdd, priv);
 
 	priv->wdd.info		= &gpio_wdt_ident;
@@ -184,8 +202,13 @@ static int gpio_wdt_probe(struct platform_device *pdev)
 
 	watchdog_stop_on_reboot(&priv->wdd);
 
-	if (priv->always_running)
+	if (adopt) {
+		ret = gpio_wdt_adopt(priv);
+		if (ret)
+			return ret;
+	} else if (priv->always_running) {
 		gpio_wdt_start(&priv->wdd);
+	}
 
 	return devm_watchdog_register_device(dev, &priv->wdd);
 }

base-commit: 865c2d0f1dd3f0937865dd11819eeb59298a814c
-- 
2.43.0

