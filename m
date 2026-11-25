Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596521;
	b=Etlc2cFJ0PE9MfWTiDerlnsREC5sCyUX3HIISpEk+vRdSjuH7bWAG+B4tV9LfQfqkUDa
	 La5HYVtw5ahEIR7mZwWf8m/1BiSPsPjQ8ixlYxJ67CJXekXp7ayMN7gft8/Ohg5L3DNRf
	 HOznXoGe82KDEyTY87LQX/lwzVRoTAPWjO8ssAomnrfmYW1LhNNyVcPwtAnR/4tyWKeDi
	 nMjuvqz8Bv5iWyEr3F8fRpO1kecHeaXLXlLI430R/2aDSMbwSpMl8f4Twu+S1xwmsO+xn
	 O5nJpspxOdaF4mI5f/FdlkeXrYQ9opZdxtianUj9r2Z3eyEWVxnNZcEluMqBixES7Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P+wd9JyZvI+Ds8ItKadr6A0TrwDEYi2YNevvWKQHylE=;
	b=Vc6D5XawkLblJKGlrsIJdX7ZNenX3LVnOzv4aW2tNZTHhdK6SwrQM9p0BwrselWZLR/L
	 lmM/nyQdJ8STgOFDdYCiLpxOPxIi99u4uTeeqa8GfAidJiopCzzTWb+knqzUxzr6uQ1P2
	 4FyFnaV9/bL2uOPvZqwKdsbq+xnYmyqezNlycrEYeQvLeXadQHtpfNzujostdWwhqf2zi
	 6EHmTmNqwZ0ZssfsbDVnbif5ciOWRx4BD7ya0NW5yVcz0nOnBs376S2ajcuDqQODMUKl6
	 uln75h3uYLpq0NtKWzfLAAVhl8Wc9Glckj5LW7+o0MFwHwmvLUceR+WLZWvXx71NedA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RYMn/SoQ";
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DDE606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6DDE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RYMn/SoQ
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-377157fde7bso1870145eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596520; x=1796201320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+wd9JyZvI+Ds8ItKadr6A0TrwDEYi2YNevvWKQHylE=;
        b=RYMn/SoQcx7Wdjnvdd1EPOCTHZ/QS6ZqKmnjEg9C7Gkwnemv1AZtInz9AH1DeL0C78
         4cYjAQE9JMzqNo/aJGHpD1YpTTkbr4QNcNy+6I4v7UEsRWrKYBwG2nY8MIapgtyrhq+J
         DRh9yTGf8RiHae9Oa5bhBFQhQcafPHm7B9w8wQaplQ1dA2p55c68uLZ7+h8fInuqY6aK
         PhSnu1cooMe3qksY0t+GB+lzhtEOz//5kiBAc6uVGUvLxWUamSd2LSHrK6GmbXI18/ny
         evTL8ldRhykDqEt2VNdVFPKYlzgpt4UjeGVCPqqAepEdwvFEKHgIZm6wFDdhgJBaILo6
         EshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596520; x=1796201320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P+wd9JyZvI+Ds8ItKadr6A0TrwDEYi2YNevvWKQHylE=;
        b=QmJUkT7DfzDiyKCFg1UyiWktHUaemIXJGuXBt1xSMxsHM7n4Xju3rQVobumNEb8jJ0
         /RmaShrc5jdlOKQAK0/+SithEQi0H6hLo5xA+4xEf+iA7hgU1jdRxJKiVJJq4aFHAOWC
         l44GU9Us8SdGmOJOqr9ye4nNRJDr7yiFNxqJ1FPzVQCaax4If2/pK1gdb7UBDulOYjab
         4B7EirIbqjwscl2Vtou7kjydFtl++06AXKHzqxk0e9TxJfj2XoEXJWAIketD0tBpH+2D
         qZaQmEg1LyyWPSEafkrk3kiPKGWuowWP8/NL0fgvrWFRYh8UMcKfpo2wFWeVimSgOZnv
         EfGw==
X-Forwarded-Encrypted: i=1; AL+hErG6pnBGO/lU7PY6R6uFsRgTSiA36TQ0UBPFUeUPW5FthlA8rKim1zA+kvcn1SkqYV1a5AlWWVFJPwOLQxA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ofx3uuzL0fzvlII6T2yVfsBTL1q9jpE3wrVHBR/1mb2r5PyJ0
	GfdZkbrF3pf533IaAcTSuxsdC6xPxWWBFfe2hAORBWAnA3HlRYPBWjmm
X-Gm-Gg: AZFdTZeP4UxREjpBMw8sRRFUTZrqEZVFbP3VkvngKyo98IpGxPdLvvzkH5jN+hhV2lJ
	eaxltOTI5OqXnjlZsl8dwcp6Qadx0qUys82oIzajHPWHRLt48pUpBUe3KLioxU68uB9jPd0noOf
	3A2ybu6nHy1WAhREpjPe1yH+i1P/v52vowQ5DpkyuKfGHhqaRCfRnM520ztr9guKkUR+b8uLCJB
	PaHgoZpT3HvtxpfE+zNnIdyTLdIqE+iqBNQnLdRQI9ZO3KY3UNsyonkfL1IuOoDlYP9Z+v09/+4
	F/+5cN0J+wggvrgEnulYwDcFENIHCBOi+5ix60/aiHaIpkdVp8jERYvX1EslJVqameSyFr/qZXe
	79SKofOzrtqEmMpCapFBOs4teACk6e3DW7FmtGtTJ1/vJRvTM53zyw8hIWw6kv6KhMneI1Dncr1
	P74Fqbe9NEOnhoyHox6heDg9zj+IuxunE3hFPJ6PBXOMli6GDr2mxSKDZRUsQTecMKwz3hJyZp1
	egWodoqkQoW3uYS26F4GDMlkQq8wSpdmw+pIutP2YHMZ0WcQmNPrIEu6PF2BZz8Yndjg3ttKi25
	09h2i3nZ985syi+gh+wuQIOxEDPc
X-Received: by 2002:a05:7300:ec8e:b0:386:a97c:f80d with SMTP id 5a478bee46e88-386ce3a8f03mr1873307eec.27.1795596520027;
        Wed, 25 Nov 2026 00:48:40 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm18879252eec.9.2026.11.25.00.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:48:39 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
Subject: [PATCH v4 1/6] platform/x86: thinkpad_acpi: Report auto keyboard backlight mode as off
Date: Wed, 25 Nov 2026 16:46:38 +0800
Message-ID: <20261125084644.137506-2-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
References: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
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

The EC keyboard backlight level 3, which selects the auto mode, is
passed to the LED classdev verbatim by kbdlight_sysfs_get().  The LED
then reports a brightness of 3 with max_brightness 2, both through the
brightness sysfs attribute and through brightness_hw_changed
notifications.

This is not only cosmetic.  According to a report on a ThinkPad X9-14
Gen 1, UPower 1.91.x treats the out-of-range value as invalid and stops
watching brightness_hw_changed, so the desktop no longer follows the
Fn+Space hotkey after auto mode has been entered.

The auto mode is not a brightness level.  Report it as 0, which is
within the exported brightness range, in a new helper,
kbdlight_level_to_brightness(), as ideapad-laptop does for its auto
mode.

Fixes: bb28f3d51ff5 ("thinkpad_acpi: Add support for keyboard backlight")
Reported-by: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
Closes: https://lore.kernel.org/r/CAENjc+w0Rqy=kDSew7XtNJCSvyPiXPJ5faWdmCr5RGYFhpunCA@mail.gmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
Reviewed-by: Rong Zhang <i@rong.moe>

---
Mark Pearson's Reviewed-by was given on the v3 version of this patch,
which did the mapping inline in kbdlight_sysfs_get().  The helper was
added at Rong's request, so the tag is not carried over.

With this patch on its own, on kernels that still use the LED core
suspend/resume path, a backlight that went to sleep in auto mode comes
back off after resume; before, it came back in auto mode, since that
path wrote the unmapped value back.  The rest of this series restores
the level the EC had.
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad..31d3721bb 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5102,6 +5102,9 @@ static struct ibm_struct video_driver_data = {
  * Keyboard backlight subdriver
  */
 
+/* EC level that selects the auto mode for the keyboard backlight */
+#define TPACPI_KBD_LIGHT_AUTO_LEVEL 3
+
 static enum led_brightness kbdlight_brightness;
 static DEFINE_MUTEX(kbdlight_mutex);
 
@@ -5135,6 +5138,15 @@ static int kbdlight_get_level(void)
 	return status & 0x3;
 }
 
+static int kbdlight_level_to_brightness(int level)
+{
+	/* Auto mode is not a brightness level; report it as off. */
+	if (level == TPACPI_KBD_LIGHT_AUTO_LEVEL)
+		return 0;
+
+	return level;
+}
+
 static bool kbdlight_is_supported(void)
 {
 	int status = 0;
@@ -5194,7 +5206,7 @@ static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_cdev)
 	if (level < 0)
 		return 0;
 
-	return level;
+	return kbdlight_level_to_brightness(level);
 }
 
 static struct tpacpi_led_classdev tpacpi_led_kbdlight = {
-- 
2.56.1

