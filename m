Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700162;
	b=08ugt8fFeupBXysaWPbLZ/Qn/MIu6ADK8Y8DGEa1qqWyL7PtE2QGN7w/Caz2an4tdNOq
	 /D09ErJV4ZAaFHV7ehGFPIIKu90Xb22PqbZHHX1Odbcouzo1MMjeUgMeQdneKn3hLpRSH
	 nie0sJw+hkxsbLiioNHvaZO1ksmHJkkYLLt7M7cv3f5bzLIpCw1wZZ6UvPSa3i0nHJAa/
	 Nf1SwpvyYrwUwm1SUkUwU/8TdSMBQJe57A0dAWGT/+5hli57qDDfJ21dhp7jE89QE1UZF
	 AE7VYz8R322NoDrf144m/UiaNePViOzTfA5jApNqDWytBQwpbitjhrG4TD9d4SI37Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/L59GtHvh66Qoj8GKGfFbB0DmYWNSBlgqJLSXZ9x1vs=;
	b=0vJn7XDYNk8AaLC0RHm+IdTDfXI9NxsGZ0ud9YdYDrTJ45SqPurwbZz1b6cEOJNrgrmc
	 dclCoOtSmVyewewq/4kwuahkxyvAEIbbZoQBnyqMsTw1AykLl69ANy5DnOjdsEUO/OsWZ
	 iQAGYBOOffOkgwBEpcyXe7eV7U1hl1qJIyVC+P1Qj9ZOlSyCgINxJYFfZHlBIpsn3Scre
	 DTID6hj402zjaVyfA6o8yik+/pyCnRUUP87eAlL07ccXwcH75q3+whiXyDAg5JPqcp8Z2
	 lmXKnIiEE9t9Vge63ghDoh295iBPMsd2GVyr7TPaju5FcR3YdMvOcOezSryUNrTp5eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWImdMzU;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF51A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF51A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWImdMzU
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso4043697a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795700161; x=1796304961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/L59GtHvh66Qoj8GKGfFbB0DmYWNSBlgqJLSXZ9x1vs=;
        b=lWImdMzU1KImNUW8qT4asW+bHXqUn/R42L3XAwMpWQ3IPo5nIwxl7dT+aYhGDrk90w
         dPRT9/EbY3LZTjrvRDT5e4JGuPjxVbaal0c+tDOnbjcKJPSb1g7Ba5v+AGqB6GAzQqCZ
         xfDaaqKkYWNxWwKfh6nYVT8vpM1uiJPTWdBtkQMFTZyXz0eiFnmQ2aYuylpfL8qpSCrC
         nyLpGlczhkJ3RM2zQNzO/MHwj/QoiBfAXSroJN/jkfiqbW1i+WoRQAorXxlyX/1gpVcr
         DnRPIgx/KjjHp29vJ06+ecFXMUls7vGR6myfrE9FUJm4T+r20eGWLOnVHYYM9h2ocZ48
         pwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700161; x=1796304961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/L59GtHvh66Qoj8GKGfFbB0DmYWNSBlgqJLSXZ9x1vs=;
        b=nwg1rezU3kxnluwEMFdm9ufg/mH9zLeVGtjnn1LVbRIkUt6B9H0sjMw+Rq5Cs/dFmN
         vuSS61IU7032domZXxWOET7A5S9UVusD5YxaHqr9NKTf9r3ukrN0HCWnCROtaOh8fdC9
         SQkx747cTcxP5ETruO+OTew8FTbGhubj7rNfEo+1SmSQgyBvTk4S+T6D02tdstwJMaV+
         K10nE+oNELWKTIyHyF2hvoV1egbKGvU8T5P6Nvn9qX89G+aGQWFHa8HByvjtLMyddEXX
         cFm4TGscchnb4anzaUKdsL/fFKbxBiDLNy1TkUiDgxhN3DoBw6u8kJSaKPny+UKiELNS
         OgHQ==
X-Forwarded-Encrypted: i=1; AL+hErGczJQWlETRHplF4husImohEUu7AYqqyRGZXbxDDIJ/pcbAjHc7r95HDCD4LjbPFgAKheAnbVC1r8BZkaU=@vger.kernel.org
X-Gm-Message-State: APuU4Z92zWjP9sDvkVbF0EHLb6LgKAH++t6snhjNdutzJNzaSY2m5kce
	97vCysrdJ/8SnhT5X4IMI5ga26bg7eh5GpoSmsIeA+wzVjunsZawmCFt+5kUKp9d9Q==
X-Gm-Gg: AZFdTZezfiGJyaItkqNulURGq3JQ4dB+69uewmR5rT+ZEBz7cpqfwzCPtR7zWQJIGND
	qHguFYqYQbotCMSq9MH/NUtnyOOFojQzbieDx0ynfj6etyY5/P1bbpYMgP6X1owhCQWkSpV81Sz
	hor+lJ54UMPL1K2skEtkoIx3a71cZ+/X5A5JKlBwm1ullC5PHt6fqKlOaB/V+rVYMy6StiBxAyB
	dufJtc+zTn0MzNpCnibq8MOkVdXg8odPzzqJDJ1MyRPGUFoyajMIrTeMZoq+WM2iAh5f6mX7KTK
	4Njdu0b7bPkqxXga+DbSrf1V1H+HzSC68rqsVju9yVJQo0pJpQwduVtbyGilxbZHFBf9N/wJlub
	00U/Z0av6cObrDjpaSTMKyVIbfS8vqB0AF9OiAa8GSkGxdNMJGCEv0FzVAQ3RH+XYRuGVVo9bJg
	8r3y62FVRcKGS1Bt1uPNBDoOnYbAtw8KPnQI6P7gIgx8n7QL3ER5Gy2jq7SqC6DOcIVoKe9oQFh
	qgwAYpj4i5bzze28x9HsDoiJmGFmMhOYdG7aQ4uj+VZMuD/kbt4ZneNKWO6XFCsh0XLKc8N1yGD
	CPy+nfgTI0fmmHEKUz4KnV5EAxI5MJJufdaiHROsRzONpivR/P8gHx27tywEgNmbYDeWA6xcDiU
	RKAHb01GKyEj1
X-Received: by 2002:a17:90b:3e81:b0:3b3:ff66:4097 with SMTP id 98e67ed59e1d1-3b41c92a1cdmr18216781a91.26.1795700161363;
        Thu, 26 Nov 2026 05:36:01 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fe711sm14480336a91.1.2026.11.26.05.35.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 05:36:01 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] fbdev: ssd1307fb: release PWM if panel initialization fails
Date: Thu, 26 Nov 2026 21:35:56 +0800
Message-ID: <rc-b1-20261110-vc-112-b07bbe936b75@gmail.com>
X-Mailer: git-send-email 2.50.1
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

On the SSD1307 variant, ssd1307fb_init() gets and enables the PWM
before it sends the panel init commands over I2C. If one of those
writes fails, ssd1307fb_probe() jumps to regulator_enable_error, below
the pwm_disable()/pwm_put() at panel_init_error. The PWM is left
enabled and requested, and its references on the PWM chip device and
module are never dropped. As the PWM stays marked as requested, a later
probe of the display can no longer get it (pwm_device_request() returns
-EBUSY).

The sashiko AI review bot pointed this out on 2026-09-26, while
reviewing an unrelated ssd1307fb error-handling patch.

Jump to panel_init_error instead and drop the now unused
regulator_enable_error label. pwm_disable() and pwm_put() accept NULL,
which covers variants without a PWM, so clear par->pwm when pwm_get()
fails instead of leaving an ERR_PTR() for the error path.

Fixes: bbc79089ae2b ("video: ssd1307fb: Add support for SSD1306 OLED controller")
Cc: stable@vger.kernel.org
Link: https://sashiko.dev/#/patchset/20260926-fix-fbdefio-error-handling-v1-0-a94810b6e263%40kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_FB_SSD1307=m, CONFIG_PWM=y, CONFIG_COMPILE_TEST=y; baseline and patched ssd1307fb.o, no new warnings.
No hardware or runtime test was performed.
The path needs an I2C write error during panel init on a solomon,ssd1307fb-i2c device.

 drivers/video/fbdev/ssd1307fb.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index ef4bb920c6ff..dbe5dc67e044 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -403,7 +403,9 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
 		par->pwm = pwm_get(&par->client->dev, NULL);
 		if (IS_ERR(par->pwm)) {
 			dev_err(&par->client->dev, "Could not get PWM from device tree!\n");
-			return PTR_ERR(par->pwm);
+			ret = PTR_ERR(par->pwm);
+			par->pwm = NULL;
+			return ret;
 		}
 
 		pwm_init_state(par->pwm, &pwmstate);
@@ -794,7 +796,7 @@ static int ssd1307fb_probe(struct i2c_client *client)
 
 	ret = ssd1307fb_init(par);
 	if (ret)
-		goto regulator_enable_error;
+		goto panel_init_error;
 
 	bl = backlight_device_register("ssd1307fb-bl", dev, par, &ssd1307fb_bl_ops,
 				       NULL);
@@ -823,7 +825,6 @@ static int ssd1307fb_probe(struct i2c_client *client)
 panel_init_error:
 	pwm_disable(par->pwm);
 	pwm_put(par->pwm);
-regulator_enable_error:
 	if (par->vbat_reg)
 		regulator_disable(par->vbat_reg);
 reset_oled_error:

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
