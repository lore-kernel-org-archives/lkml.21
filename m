Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335932;
	b=Q4HId5ha/1Sy0dii4x6w/AAFV1oIzm8s1QFsMlmGs5Nj8x77nqpLTBoI+m8BXKWhhr5F
	 kkddY7263RbnOA0m01ld5u6gLFpV/AxTboGz5IRT4Xg3mEbXKZlwWkxeMBdKpfOPXZgoo
	 ihE4JkBgEgXIjEr57wIFSTZ/qF66bSe7Drrku115AdYXGQZpHm/JkXvHAQUwGIbZZDd+7
	 eOes0oWlBlN6V595M2rDGEzbuEbImWeeRSTO+Qy4iWIKpLwYbdptI/PZRWhmqXj38Q7F/
	 GZFHzeypaHz0VPp1RAOLP22mn8tpDgSo1Z+kNoMuAXG4VWKG3QbsyG+JtxvPEk1+91Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bKejfDl0TR5tOHV0HrkVJmB2rh7rbM0WGFOnvl0w6ck=;
	b=Gsr2IsrzqoYLpCetrPdHa2hcEfrWWeuavycfKPacbu+3hss8yWujhzYijVASx/uvsM4F
	 QJdsQWppH2pW+dWvFMta3KRbKabQUEM5eO4uw2MDO/bCPlY1QtA3cdVoIpxeY657uZLlv
	 +WTTCrqr7VC2rBvxUig20E48ivmp3cP+sZfn0Ml66zK2k2cFH5m/nTWgnSBsAwgdPjRZy
	 wcXbxsTPCkcxSdWYaMslOwa/sIx1GaD53STnMyZB9jBWviKyAzCXghEt7CpA/xnOXXMkf
	 nbmkILBZU3unSLU6YCj2F1/OVBTJQAdz9X/XbAS2BncnRWc+BN9Hka+5w743A9W2hvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xw50pjoy;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284A5606A686
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 284A5606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xw50pjoy
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c516a192844so40466366b.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335930; x=1795940730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKejfDl0TR5tOHV0HrkVJmB2rh7rbM0WGFOnvl0w6ck=;
        b=Xw50pjoyrUSjrMX1UIMnoqik2agbejMnMYibFwTaOqN2T8SNBjpOZp1ZjjAW5NVsdM
         0j+YIW6lwK6vOvHhj1jjcbrI9bZQyQZt185OttTDYIB0IbL5dnATkdqdFcxhCssYBky4
         4BH7aONjDzVj046Q9Q+SiIwAtwJkrIDOkn5D4moMIiJ7Z3JNbMDCRMajGDf48NAaloWf
         fLiLAequOClRJsfGqRRrHiZqBiyKHPW08Df+c3AFt1hi85y2zeBFyLoRjPeS2FeI9Vr+
         lPW2HZmwGLQrOL9mdWIo0eGbn+Hh7Ww7M6Z4n/zTDwVZaBEJNig2odQf05XvZsLCSusG
         emKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335930; x=1795940730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKejfDl0TR5tOHV0HrkVJmB2rh7rbM0WGFOnvl0w6ck=;
        b=bvWAPgkHXHBgWMavVxwi5C+BYXRsUA62Zm/hMzqb/7aRC+KkoDeQjHJogjWYxEqsUW
         ZgcIS7SgwzveLRPpudlK4FkhDRwKk5KngDrF/DWuAkAPVFcUzWreZYWxCHcbJy106pB1
         Hui/AYreAOCaLUlLKdcA5vecCgkfFD/dTIMAQK8IGoM2jw3yhIqRZ7ADJdmnyI7Kaq28
         oRwhmb5RxgSfrHDT9iO5dKPJ2qVFXKCpwljY/pHnrLX49G40L4+b0a0lmrvd3SVxFL2U
         Sl0av5ZvglSL8W5crLedRW8A5CEP48D9FBAwZlLp/1qxVeE7o06SNZIzuYzj6Y6pY4AN
         2wXA==
X-Forwarded-Encrypted: i=1; AL+hErEONVfrIyQQ1Ocw1qxkmDQCBgCqAfX/OJaMS3W68P+ttTn2URsVOj319bogqlaYNA2i2P6p+ddPdngQTBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IHAe3SUVg6lOuQ7SXfs85k3q3myI4CFK94QoqX103Oz1FgOE+
	u+QXFv4OQD5P4dbnHlkBngPBApvNnWxYpT8avCUxIvLi931IhZ/q1j2i
X-Gm-Gg: AZFdTZdnCVqR1EeXUtjdBxNGYySxIH4HkFqDKQEoJLmLyF1o39epd6ergbEeHB745v0
	JVbhIr43mAkoNGFOQrA5d+B/lwCBg8ZuFMc7tXFNeYO1wNy4Uftj1Sni3x1UUpOtUIdrpVhQZ1I
	Ccbuw2+pNPXIU6tjxSEA8B85SpbvEUR7KC9WpbzYfVfQU5ba5m4hrZEK6dI234HfKIbem7iHqn7
	b2wQ3HGdOt04vNIO0EO7R/0txXH4StXPtFu8pxImoh+1R2yiJY/62F6dZsyQSKzaabHSrlDYvg7
	ehWX46M72oPA51OgpzD6QAPmcGjJUBDTY+KSfpU9p6btrCMM+YysGXZnxnTY1EITAvPhfwzvsGq
	HYtwoMPuiNhcOI2NrvS3jDtd9vYvU8z0LuQegypA25mk0oZgiv9lSHohesS9VxcPuZYHyZfETKy
	qiuKfnLF75zU3m8GcfsODYEo+MHCeuEPOcNPLWtbriFHSBgr2zS/aoMq0wkRzx9Hw8Qq/vPyYNU
	nZK6zjgF9n5EaVwO+mR74mwLzuZoifHPXDmU8jSAAwP83QHkxz0dc8C/h3OVq+x96XsIYZlFiDc
	mws3cf7GUZJgSerh1ZVxWuS39r6fbLVfBHi5aT3uYavqwU9Y4K3UaMJ2FDfkabluCHD2Y1lczn8
	uR6y/9X2kAQ==
X-Received: by 2002:a05:6402:1ec9:b0:6ba:38c1:57e7 with SMTP id 4fb4d7f45d1cf-6ba38c16228mr5590577a12.24.1795335930340;
        Sun, 22 Nov 2026 00:25:30 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba6f8fa5b9sm2116187a12.37.2026.11.22.00.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:25:28 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] usb: misc: onboard_usb_dev: Add USBest Technology SiS HID Touch Controller support
Date: Sun, 22 Nov 2026 10:25:12 +0200
Message-ID: <20261122082512.64304-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122082512.64304-1-clamor95@gmail.com>
References: <20261122082512.64304-1-clamor95@gmail.com>
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

The USBest Technology SiS HID Touch Controller is built in Asus Portable
AiO P1801-T and attached on the USB controller via integrated Genesys
Logic 4-port USB2.0 Hub. Add the support for these device for the power
supply and reset.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 2 ++
 drivers/usb/misc/onboard_usb_dev.h | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index f846d7fe331ea..5435e2b1f535f 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -574,6 +574,7 @@ static struct platform_driver onboard_dev_driver = {
 #define VENDOR_ID_REALTEK	0x0bda
 #define VENDOR_ID_TERMINUS	0x1a40
 #define VENDOR_ID_TI		0x0451
+#define VENDOR_ID_USBEST	0x0457
 #define VENDOR_ID_VIA		0x2109
 #define VENDOR_ID_XMOS		0x20B1
 
@@ -687,6 +688,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_TI, 0x8440) }, /* TI USB8044 3.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_TI, 0x8442) }, /* TI USB8044 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_USBEST, 0x0817) }, /* USBest Technology SiS HID Touch Controller */
 	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817 3.1 HUB */
 	{ USB_DEVICE(VENDOR_ID_VIA, 0x2817) }, /* VIA VL817 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_XMOS, 0x0013) }, /* XMOS XVF3500 Voice Processor */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 10f010fb57c07..8c218c8a82fca 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -66,6 +66,14 @@ static const struct onboard_dev_pdata ti_tusb8020b_data = {
 	.is_hub = true,
 };
 
+static const struct onboard_dev_pdata usbest_hidtouch_data = {
+	.reset_us = 1000,
+	.power_on_delay_us = 100000,
+	.num_supplies = 1,
+	.supply_names = { "vdd" },
+	.is_hub = false,
+};
+
 static const struct onboard_dev_pdata bison_intcamera_data = {
 	.reset_us = 1000,
 	.num_supplies = 1,
@@ -147,6 +155,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb451,8142", .data = &ti_tusb8020b_data, },
 	{ .compatible = "usb451,8440", .data = &ti_tusb8020b_data, },
 	{ .compatible = "usb451,8442", .data = &ti_tusb8020b_data, },
+	{ .compatible = "usb457,817", .data = &usbest_hidtouch_data, },
 	{ .compatible = "usb4b4,6504", .data = &cypress_hx3_data, },
 	{ .compatible = "usb4b4,6506", .data = &cypress_hx3_data, },
 	{ .compatible = "usb4b4,6570", .data = &microchip_usb424_data, },
-- 
2.53.0

