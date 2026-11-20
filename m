Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218176;
	b=IVpSmTjufuLpZkOPS6BtLSnLd4CvfpAgH79pGAjwujyE3HT6tC67c2BeEGiIEYVFIbTg
	 SF8AuElHbBkGt96PFD32fx39lQsndeF66SpMu96BYmproQKtat+CJZp3CrhfZxuBDJNSA
	 w4us4nZL5yC+khaHSedoyWOK0Y+06a59SKfUM32L1KN6Tgmif9Udte7K2B9pWOfr6hPpg
	 LFJfb5VjZU7pIILon/hZyQXXm6TupSEzBFNPj+ssG00tU+twGl1E+nSTXA0N1iDWUJA89
	 1FXcHuLZNNEEavRR0pPw+7EFrlVc50OQrEVQy1rzbWELJyU3bJZY3tBYQJzU2rx1j2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/mVPhUNXoCA56KaLtR5xbl5KLypVc48RMjcE+btZlGg=;
	b=3o0RrqiPvTVXWSx21ARKOrDHOd3elgIvLrV1qtgKl9JRIYM39eMeEq3vJC7Dau4Tyli/
	 pmApVuflKYO+h1hf1EY+LuQjfPSKwdnlNCIG7k9YjnM+j/OitqXS+vn+WvHBH7jO0tu0I
	 L0qJGsFp7I7buc7yIHSWbZcuCzII3Cpold+SfBNB2hjqYt1mFdP+ZAVfKd3HNqHl0VVUZ
	 qqREJAetNcJsZbTOeCsW7hPwoTg/R6CS/Mv8l+LOj/yBFRfPSeHlh7B9CATywrCHN2cIv
	 0vQMtOxbKcygs0FtlOIxL/Nz2OpxwYgn0tk8mN8BWMOyXpVbQn0XT73YfaEkJ1N5EtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IHWj7hVn;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFDC606A691
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CFDC606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IHWj7hVn
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso684808f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218169; x=1795822969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/mVPhUNXoCA56KaLtR5xbl5KLypVc48RMjcE+btZlGg=;
        b=IHWj7hVn+zpELdemFCWFjAvbNu2zXFQDCfpwASr7BjCK7+NIXTG0DhpAr5Gq2meyda
         uJznKSCadWmyzIY1FB/IjTmPrzJpkv0oWmT1HhlmGUwpn0sq+jpG7AVBRV3u0CUUUu6c
         AYy2Xo242i1+cjM7qBgqCbHTXZfQ3gAAx1yOy2d4om4vXb1zayofUJwMlK47JzXQrvcD
         gcUNJJI+vPfYqj9pQy53KkEytCj5KxEtJetuhiEW21hPOKQpQFnt7qGNpwkFgzQagdGL
         DNvzZJgvWBlVfAvnfvNuEGf2OEFCwqVZjpA8M6LU4sntxFkAwzaozoKfh654ugXAno1g
         2ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218169; x=1795822969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/mVPhUNXoCA56KaLtR5xbl5KLypVc48RMjcE+btZlGg=;
        b=nvfvrgnB7Xz+MBZv/ZYmbLJiWPK/ldEnH8teAy70kqP/HQ0Dc8fbr4sqBLigKYGSMd
         44XV5S6fQegocw+a+VA58OsDsD7XHyvWlV4hBfkfkZgfTOERc43pxs3SMjOvKnoH0zV/
         n6zI3xBZWfFGSwhOqy1yCzlouec8rhH/+xzHqcreB1QiTawA3yB2W8AMkPTba2YQMYHA
         zJjKETwZtW6Cj9lsuXZBv+B0shzeZfBWQtln9PyKS0lrwOLF3Y8ndQVxEUYmBA1IqKyD
         zu3gQSOtgUmQ62my6WNC0U0nhQQSNE17Tt3B4cCEuOBjyVd67MUaYtukJQfAqCSrN9OC
         qk7w==
X-Forwarded-Encrypted: i=1; AL+hErGn3UkAj4DWRGSKwrNgnol95sYFg7KQyNtR8DYLn7JfN15tJDkchE69WlmgpAku/RZs9bh/XSHPpUN4PJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qcfl2EfJjZ9KBn7ajbSRYvWBGhkrGx6MHukUGXxx6Wjw8VTO0
	UDJGlBZFu5WoD8/aSKUEun8qSEDvxm0EHjLE9+1yNUNFSmr1xsJmAuYe
X-Gm-Gg: AZFdTZcNWRdyrOcuD1LxZXzflTFX+AXmx0WhfSHe+0sFCWUy8nCvNoObV3TfkrsRmmk
	cNm8n5sJf8F28jEiwxmmxAIxT8l2IMGIIYjBbEqda6M5Iy+f3h2UNjJwKsp4KNXGvekotrgcTva
	bo4t1Hh1U2I35Apw9aZWB8R7OW9uU6JtGHySV9TUyARP9OI+CTcTScH4n9nSjsB55F3vDaMc98G
	pvMJaiZjRzYwgvv+OxZJ5jJe8y8PIa5wut8vIRGsvSq6JIY/VDWo7JEr9k/MOfP0K079TgwQkKb
	PyW5vecg/GBT3xbQJSOrTUwZry2TxzTtGqx/b+PqCLYK0yzNNPteOdVM9x/oDwj4vdzsq0jRAfA
	gir69MrJ+BYFvM0ULlHVYKgqm1HWPC/rbMY1eZTilBJH1a8hXmKxQ9bYkUZEPNZapMP0wOoO+EL
	tZbJdbNvqog0EqmCPcQVWUvrbRjv94hz15ux87dfjU9S9VWP0JhlMH9Yzyz1TVzIMFsLd+yDrYp
	3fhC9XUTWP/usP94JIPA23kCFbWz844PkWkNTeRtZDrS11XnnGOvXWOhwY/RS55JTJ4EORu5/sO
	/v/bZNNlqcIUb6361Cqh3gYEu6I=
X-Received: by 2002:a05:6000:2883:b0:4a4:39bb:970d with SMTP id ffacd0b85a97d-4abab02c469mr9410317f8f.2.1795218169588;
        Fri, 20 Nov 2026 15:42:49 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm8085462f8f.7.2026.11.20.15.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:42:48 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Sat, 21 Nov 2026 02:42:28 +0300
Subject: [PATCH v2 2/2] platform/asus: asus-wmi: unify WMI and HID keyboard
 brightness stepping
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-b4-asus-kbd-fixes-v2-2-52cda07d233f@gmail.com>
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
 Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

The WMI notify handlers and asus_hid_event() each carry their own copy
of the brightness stepping arithmetic. The WMI path also reads
kbd_led_wk under asus_ref.lock, drops the lock, and re-acquires it in
kbd_led_set_by_kbd(), so a concurrent event between the two critical
sections can overwrite the newer state, and every WMI event pays for a
lock hold it does not need.

Move the arithmetic into asus_kbd_led_calc_next() and add
asus_kbd_led_step() to compute and store the new level under a single
asus_ref.lock hold. Route the WMI hotkey handlers through it, drop
kbd_led_set_by_kbd(), and reuse the helper in asus_hid_event().

Normalizing an unknown (-1) starting level to 0 before stepping also
makes the first brightness-up or toggle press turn the backlight on at
level 1 on devices where the WMI readout is unavailable, instead of
leaving it off.

Cc: Antheas Kapenekakis <lkml@antheas.dev>
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/asus/asus-wmi.c | 79 ++++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/asus/asus-wmi.c b/drivers/platform/asus/asus-wmi.c
index f1a94bcdb0c0..c216f7166c2f 100644
--- a/drivers/platform/asus/asus-wmi.c
+++ b/drivers/platform/asus/asus-wmi.c
@@ -1811,6 +1811,37 @@ static void kbd_led_update_all(struct work_struct *work)
 		led_classdev_notify_brightness_hw_changed(&asus->kbd_led, value);
 }
 
+static int asus_kbd_led_calc_next(int cur, enum asus_hid_event event)
+{
+	/* -1 means the level is unknown; start stepping from off. */
+	if (cur < 0)
+		cur = 0;
+
+	switch (event) {
+	case ASUS_EV_BRTUP:
+		cur += 1;
+		break;
+	case ASUS_EV_BRTDOWN:
+		cur -= 1;
+		break;
+	case ASUS_EV_BRTTOGGLE:
+		cur = (cur >= ASUS_EV_MAX_BRIGHTNESS) ? 0 : cur + 1;
+		break;
+	}
+
+	return clamp(cur, 0, ASUS_EV_MAX_BRIGHTNESS);
+}
+
+static void asus_kbd_led_step(struct asus_wmi *asus, enum asus_hid_event event)
+{
+	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
+		asus->kbd_led_wk = asus_kbd_led_calc_next(asus->kbd_led_wk, event);
+		asus->kbd_led_notify = true;
+	}
+
+	queue_work(asus->led_workqueue, &asus->kbd_led_work);
+}
+
 /*
  * This function is called from hid-asus to inform asus-wmi of brightness
  * changes initiated by the keyboard backlight keys.
@@ -1818,31 +1849,13 @@ static void kbd_led_update_all(struct work_struct *work)
 int asus_hid_event(enum asus_hid_event event)
 {
 	struct asus_wmi *asus;
-	int brightness;
 
 	guard(spinlock_irqsave)(&asus_ref.lock);
 	asus = asus_ref.asus;
 	if (!asus || !asus->kbd_led_registered)
 		return -EBUSY;
 
-	brightness = asus->kbd_led_wk;
-
-	switch (event) {
-	case ASUS_EV_BRTUP:
-		brightness += 1;
-		break;
-	case ASUS_EV_BRTDOWN:
-		brightness -= 1;
-		break;
-	case ASUS_EV_BRTTOGGLE:
-		if (brightness >= ASUS_EV_MAX_BRIGHTNESS)
-			brightness = 0;
-		else
-			brightness += 1;
-		break;
-	}
-
-	asus->kbd_led_wk = clamp_val(brightness, 0, ASUS_EV_MAX_BRIGHTNESS);
+	asus->kbd_led_wk = asus_kbd_led_calc_next(asus->kbd_led_wk, event);
 	asus->kbd_led_notify = true;
 	queue_work(asus->led_workqueue, &asus->kbd_led_work);
 	return 0;
@@ -1956,21 +1969,6 @@ static int kbd_led_set(struct led_classdev *led_cdev, enum led_brightness value)
 	return 0;
 }
 
-static void kbd_led_set_by_kbd(struct asus_wmi *asus, int value)
-{
-	/*
-	 * The hotkey callers step the level by one, which must happen in
-	 * a signed type: enum led_brightness is an unsigned type in
-	 * practice, so -1 passed through it wraps to a value that clamps
-	 * to ASUS_EV_MAX_BRIGHTNESS instead of staying off.
-	 */
-	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
-		asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
-		asus->kbd_led_notify = true;
-	}
-	queue_work(asus->led_workqueue, &asus->kbd_led_work);
-}
-
 static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
 {
 	struct asus_wmi *asus;
@@ -4681,7 +4679,6 @@ static int asus_wmi_get_event_code(union acpi_object *obj)
 
 static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 {
-	int led_value;
 	unsigned int key_value = 1;
 	bool autorelease = 1;
 
@@ -4698,22 +4695,16 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 
-	scoped_guard(spinlock_irqsave, &asus_ref.lock)
-		led_value = asus->kbd_led_wk;
-
 	if (code == NOTIFY_KBD_BRTUP) {
-		kbd_led_set_by_kbd(asus, led_value + 1);
+		asus_kbd_led_step(asus, ASUS_EV_BRTUP);
 		return;
 	}
 	if (code == NOTIFY_KBD_BRTDWN) {
-		kbd_led_set_by_kbd(asus, led_value - 1);
+		asus_kbd_led_step(asus, ASUS_EV_BRTDOWN);
 		return;
 	}
 	if (code == NOTIFY_KBD_BRTTOGGLE) {
-		if (led_value >= ASUS_EV_MAX_BRIGHTNESS)
-			kbd_led_set_by_kbd(asus, 0);
-		else
-			kbd_led_set_by_kbd(asus, led_value + 1);
+		asus_kbd_led_step(asus, ASUS_EV_BRTTOGGLE);
 		return;
 	}
 

-- 
2.56.1

