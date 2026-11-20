Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218166;
	b=S7QH3l49u9WIgT7aVh4LvEaW2ZPqpiphqrAMO0xnrRTjICjk6FLms7iLSyZQmbJIMk3E
	 l7ZuhABbp3HzwMQCaYXc4ibSgcXcsX76BCbI9pTETtvz1efDorGOn/nI/DizI8N8Pmfe7
	 zX5EWiEXAbRMd/ztFnXHM0CYNeHLQCLHMT1YoEmzwOENeYSIFPFUY6xQfCcUg1Ng710iw
	 MWa2mHTJQjEoTRHA4jniuycjERPdbzzMQSpwygLrp8C2asivhREkuDXCBsTZa2yOyrvfM
	 HQbQfJN/JdqpwWBUlHEBXE4pgBlf3M20vznB0B7MBfCQEn80FUzV6EP0jMDzPSnGakw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wwBraWobBItGeKC6KHMZfI8h4IHsYw6kjmjUtwXO9Sg=;
	b=dOWGf2FULcTVz0i2d5Xf4w1iX+hHJfNq41Vd0d5IH7bwZu1OzXzcrsQ7UVakERF7Iybv
	 yq4CgDpjoCjsqa6QcJhmhH8cSeAjX2Q4ZxazcaOd3tl5ArsSU0VANpwg3XtTGGHZXK7oV
	 vWsl9tI+tak8UWx3qBIdqdF2aItsqjwViB0IETVnUnuHxziIhgieykjZuLVWjY0sHrt04
	 GFtZyuwT3QRe6hJc8JhiNxaZNUIXyRXEDmw7P6ZzkrAllomda1XIxeZ/Qg1a2tA03g8x5
	 dZxa4TaptSJ8TDoHSH8ynSAG/tor8Jz1ssF4UxIxFk4oTC87pjutE6bWCgqONMxbUhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4GqLAnE;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FC3606A334
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63FC3606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4GqLAnE
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so13710005e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218164; x=1795822964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwBraWobBItGeKC6KHMZfI8h4IHsYw6kjmjUtwXO9Sg=;
        b=I4GqLAnE/M95ySZsHhBdHSnjPCrJF4TlOlEqpQ0TQinAFRF9Y1SbCwa2D4Z8GyCNZW
         pNe626d8v1MaMNRcOP4M0OvVD2BTHhy8o0BAbYEgZ8z+WXzyI3+oXkILxJOLKWBqxjtN
         jdvksX7U/0Kup/J8qEwNz38vHpP+lDwKfmGZbr3x8wlEyC3qYzqGcebLrNxhRglc19cm
         Rb8ZIj2xvEdsgVlar0pkwDRSbCkJD4EGQA2167qzKCOh3FLgT8CotM0xW5GkD0fAwmnd
         LagK07e4d0RGmjnMEjTLTuN/R6AJIgQSdUMN/Gi6UJ7Y1rdZasFSazfdnk7Vv04kMIiw
         3D2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218164; x=1795822964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwBraWobBItGeKC6KHMZfI8h4IHsYw6kjmjUtwXO9Sg=;
        b=eXAx0PeQq2z7ihIAC8U9mRUWT68sgU5fMThhSSnnh/TliAOCxZm9+tk68wJklBMujW
         ZMgxZ19NUlAvMrguIiQ1rJGrXhY9ymk+XJ5tVFMBtWBuF/v86KHK31GNYLWhMXd0YK3P
         iZP4qME3mddQ5Sn3QQd16LkIhmkbvhCMj8pqthADf/RyhQEfsBwh4eZEF6ixFyvNhUeP
         aZS9JHy+VKE/SnJeCSTukkwYCkX1RZWzyqafHvU37MNKqsrWQcZS2De3UzODBaXVlQbK
         EmqVXY9Bqk0/uFa2WuEw/gBLgLOozEyjru2SytabSd28eDE6xluxRh7qdC5WzRm8Ors7
         EQiA==
X-Forwarded-Encrypted: i=1; AL+hErELDwiEKgn+K7grD5yJMzJWwJ5TNXjESClwvFirdoPvg8+2AxJ0wSDecZet+XuKy16yNg/YRPn6qeBzbho=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cW/3hB24QytIT8YIlTlNco4EEs5VV6Tu7C+jyxeZfgLX9Ew66
	xn5i7Z5aCuS55Pb9DRUWu6YUOQf/v71JtP1LUna5m/yq37Q+DXZm05l+n9QshhD5
X-Gm-Gg: AYBFou3jUwhhxFZGMs7CJWiW/ErCwyRPXVBniKMfHxer81OoIe+6OrVAb3jkLgdy1Si
	F0N4dXHcf927lSHlRFXDG8/KZCXmY8slKE6RbT4qA1pLA3IDmTxLArUdPVQwphWTeYqmNbOIJLL
	pIPJqrFn6NVZIyq0e63UXzu4z5nvZkyd55pR5fwi4DhAUgyRAfZEbUq/Xqf95jCxpGC3lvywF8B
	8ux8omM6ewJFjYS1Vaim0SyW849LM/9ewbnhaj9eOkl+0HuLTgS4G1ye+5dD8d0ejDABn/N/GU3
	pF3zsDxOiTKmmDPLqauxXAc3t/SEDYAuRCnNacg2I4TJXJjyfw5jlRocHl9Xi2WK57c7vd85sPk
	nXoP0HHQzMc/Yn0nxtndABKddvGJjS9j50aBXXZ6r3M0NAbHoDyatASHDl3XuOYPaTFM/1eJSZp
	uZ+O5UKQ+RsAoyV1LH3V8+S+oqACstq9oplXpjiVi5GOwvNUyCaF83TVQoPBkFpvGgnOsTTVVsW
	gTke0FEpGMP3GurLD27CnA9fjjGucAI6yOvwzn8xb4ddzz69+syIjaURf1m+WCyqrbz30A8+7c+
	yLJK7WZVejPjsf6mxn6LRZMr2/VJsKUpgmDbPhTQEiYCUxLk
X-Received: by 2002:a05:600c:4e16:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb88810991mr114710275e9.21.1795218163665;
        Fri, 20 Nov 2026 15:42:43 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm8085462f8f.7.2026.11.20.15.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:42:42 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Sat, 21 Nov 2026 02:42:27 +0300
Subject: [PATCH v2 1/2] platform/asus: asus-wmi: clamp keyboard brightness
 hotkey updates
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
Message-Id: <20261121-b4-asus-kbd-fixes-v2-1-52cda07d233f@gmail.com>
References: <20261121-b4-asus-kbd-fixes-v2-0-52cda07d233f@gmail.com>
In-Reply-To: <20261121-b4-asus-kbd-fixes-v2-0-52cda07d233f@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Antheas Kapenekakis <lkml@antheas.dev>, 
 Benjamin Tissoires <bentiss@kernel.org>
Cc: Alex Bogusta <alex@bogusta.com>, 
 Denis Benato <benato.denis96@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartu Alev <bartualev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

The NOTIFY_KBD_BRTUP/DWN/TOGGLE handlers pass led_value ± 1 into
kbd_led_set_by_kbd(), which stores the value into asus->kbd_led_wk
without clamping it. Pressing brightness-down at level 0 drives the
cached level negative (-1, -2, ...); kbd_led_update_all() then drops
every hardware update on its "value >= 0" check while
led_classdev_notify_brightness_hw_changed() hands the wrapped negative
to userspace, so brightness_hw_changed reports 4294967294+ or ENODATA
and the brightness-up key appears dead until the counter climbs back
to 0. Pressing brightness-up at maximum reports 4, above
max_brightness.

Compute the level as int and clamp it in kbd_led_set_by_kbd(): the
stepping must happen in a signed type, because enum led_brightness is
an unsigned type in practice and 0 - 1 passed through it wraps to a
value that clamps to full brightness instead of staying off.

Also clear kbd_led_notify when snapshotting it in
kbd_led_update_all() instead of after updating the hardware, so a
keypress queued while the worker runs is not swallowed by the late
clear.

This addresses the same bug as Alex Bogusta's earlier patch
(reviewed by Denis Benato) [1], while also closing the kbd_led_notify
race in kbd_led_update_all()."

[1] https://lore.kernel.org/r/20261016015117.32174-1-alex@bogusta.com/

Fixes: fac55d29581f ("platform/x86: asus-wmi: Add support for multiple kbd led handlers")
Cc: stable@vger.kernel.org
Cc: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Alex Bogusta <alex@bogusta.com>
Cc: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/asus/asus-wmi.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/asus/asus-wmi.c b/drivers/platform/asus/asus-wmi.c
index b33ebdb21aa2..f1a94bcdb0c0 100644
--- a/drivers/platform/asus/asus-wmi.c
+++ b/drivers/platform/asus/asus-wmi.c
@@ -1784,6 +1784,7 @@ static void kbd_led_update_all(struct work_struct *work)
 		registered = asus->kbd_led_registered;
 		value = asus->kbd_led_wk;
 		notify = asus->kbd_led_notify;
+		asus->kbd_led_notify = false;
 	}
 
 	if (!registered) {
@@ -1806,11 +1807,8 @@ static void kbd_led_update_all(struct work_struct *work)
 
 	if (value >= 0)
 		do_kbd_led_set(&asus->kbd_led, value);
-	if (notify) {
-		scoped_guard(spinlock_irqsave, &asus_ref.lock)
-			asus->kbd_led_notify = false;
+	if (notify)
 		led_classdev_notify_brightness_hw_changed(&asus->kbd_led, value);
-	}
 }
 
 /*
@@ -1958,10 +1956,16 @@ static int kbd_led_set(struct led_classdev *led_cdev, enum led_brightness value)
 	return 0;
 }
 
-static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
+static void kbd_led_set_by_kbd(struct asus_wmi *asus, int value)
 {
+	/*
+	 * The hotkey callers step the level by one, which must happen in
+	 * a signed type: enum led_brightness is an unsigned type in
+	 * practice, so -1 passed through it wraps to a value that clamps
+	 * to ASUS_EV_MAX_BRIGHTNESS instead of staying off.
+	 */
 	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
-		asus->kbd_led_wk = value;
+		asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
 		asus->kbd_led_notify = true;
 	}
 	queue_work(asus->led_workqueue, &asus->kbd_led_work);
@@ -4677,7 +4681,7 @@ static int asus_wmi_get_event_code(union acpi_object *obj)
 
 static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 {
-	enum led_brightness led_value;
+	int led_value;
 	unsigned int key_value = 1;
 	bool autorelease = 1;
 

-- 
2.56.1

