Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596546;
	b=G9NJPGsvlT+RJKRTdj5F072FnQ6XQbBWfw5/0O0keqJpproiBqDgPbrN1av9MwHhqu5/
	 ixfPVbj5G7QAwzYV1GQE3Y59sHHQc/E3ynryMJlp4UXVoUgzaeSBi7pGbTGtSoipAmmND
	 XCH3xo5ieaAZO9cqxybjy8DgLyIMf1VNQktF3D2XPGYm2ERsFdmGbQcQuTbbKn/7ijLK0
	 t3SWLQ4QvkN1WOFTHUJddyaLKzcHhGLVQT8R8sSSpg3/cEuiAwx/V2C3cbmn9GGjyBHQc
	 WgkgiwugJ3muMlJkFT5h9o9ViUoW7WR/hncm2wtrJ/9zg3h+fqra11sEyapfKrnkQPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZH9Zcii4Ufv0oOYz5ijgMN+AjFd95SziDw7KuLJghzw=;
	b=Erg2ofFz/RWNjNGAdoWhBk8I4rON0HdMn1uRiDVAGKeyhcMtZzHIhJHZIqjB0XX5bSbK
	 /hyLy0uvncQemto3+YccD0mntj8vd1GCWgVxFO7oCtWx8U0KXY28xKDWM6nqB1jK3AD/0
	 QUDZxSpkTbr2q2o80fONtryZtwLUyjmFmjyoG9nGb4XCoWgzBH9fsI9qw7qCh/xt6UrC0
	 jmX0b4yuaJWiCaGwmoSiIO5StGXX0bnziLqiaIoiSiVoZkM8UeQMiZUyzi9GhPpBuNLYQ
	 HuugwoKBPFirgtIxgXopt2nBJFWWE8jb51lTZ4oio/3Hyf3rvAYvHh6b8TynjbWjpSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oC8bqpkt;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115E9606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 115E9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oC8bqpkt
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-3869c1f4d19so1400212eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596545; x=1796201345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZH9Zcii4Ufv0oOYz5ijgMN+AjFd95SziDw7KuLJghzw=;
        b=oC8bqpktROIYUAvwf/LLQsgYplIxIgeO9Cj792jJsv+SJBvUa8camQuvaJylY2SHmr
         h7CYgmLVrHNGYIRey70F7SO0S8XtiBsJ3vyXzr8gfh+8po+FB65En/8RV4U5g0EjuNbs
         Cksg/M2xjsGtjJX6FtBWA+d1FNid6oJgOH7oD6WZWb7aC6N+iv5vphyqUqqgIVCXEFAS
         u3kNlG76zyO1CjQ6RVkWRgPv6KO+QtT2f9NStinnY6XOXCJIBcXV7gZ4HiuDaWQsrLy0
         TuDtuPOa97Eru4BRPmSCvY8U9tSDlaWI6e0SY2LnAzvhNd7k0XuTzZ2/rYJIW1h0z9nG
         Q2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596545; x=1796201345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZH9Zcii4Ufv0oOYz5ijgMN+AjFd95SziDw7KuLJghzw=;
        b=hL333WxUHwxHFhZ27s0IxH7yYQcOcg0x7cwULNZXwctjZZBj2R0ZoY2GcT8bX1o8kJ
         1IcG2OBhwETedY33p/1gaDoghN62067QXQH4etZH2XB/w+OLc5Rg6ZGsMEDl4BFfkp2e
         8Zm6fVUaLRccXiwXUHBxKIS8gUn/7hJ4wKtHjNa30PkksIzMkJknsmj/X9L77C1awHQo
         D9FqIYXQSLjCGVhJvVHRxe5bXGA6ZpnfHOVAnYUYA4H69arYJFUfBmjPIv5DFCAoBl18
         7TRT14J2Zm9EqHS4F/Ubwr2xAtWo1cv/+DdiyFCUUa3WBNgsJfEhlnDh9GcWKtM/2Q+n
         Ndmw==
X-Forwarded-Encrypted: i=1; AL+hErFqGv7/hf0GqCNZsd/uiYgQGNEmXKX6xZCMH9dcwc+w9+lBFVbdoviBQLhZMleiIwpEzb5UUeIwxdPyQz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ci/v4Yvv7sktPBTOOcmnCW5dvtZK8gd1TaBMgV+1SQs/6jQw6
	0kMmvgI9snVb/BcGeNvJYGuEUjjItVLSof4sAjVQdYYmr1i+FfsGF6Tj
X-Gm-Gg: AZFdTZeMngMTxj5ytOghtZiCQR93e4IQautzYvwg9csEK/WaIlcxTAOR1RfRC6+/5+l
	zdUP6+2ul9dL8BVoA3hw3v1l2kmXfcnIheTrctg+9BSr67icp2InNLr6zzEgTvsJNYezLw1w9jH
	Vzrdh3dwVeMuZQ/k00DubBwE71ucd7OZ0kicdDAjWOPVNMdWhEXPHMJHiZk787+DnT+gJhU700E
	cfjlGTaIwVcXzQvvoUHgvPpcCn+KfPd0bqmYnQL6zkYXxlQHli79DMc7xKA9DLTNNJvaWDj7R2z
	rDPYAtywO+lcqS2/A6zeEKetDNBCGTAME5yluCNqnLff1ntjFWsA7j2ANaBGqViB474VXyUQmZC
	iMEpPIsvee0cxzg3q4SOmVPPhkLwrTkIj5VgKqqcNZ/a0iox2GT8gUBY7ZYZvGlBxaD34yCxa4c
	7I3HuSjMVmaNA++lWLcgarQRdE/R58X3DkLjEI218V43Z8tglNNz1NJ8oz9qGG16CFyq6dFQ7RE
	Df0SmCciNfRYUSBNiL633CK/nviel4O722RctGZf1Ub0UWEeSU3vVeVfvjUuvk7ymPlp60i14dv
	nb+UuM92ECtNpFc1/k1cDzbCq617
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3856c4b844cmr17149965eec.1.1795596544846;
        Wed, 25 Nov 2026 00:49:04 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm18879252eec.9.2026.11.25.00.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:49:04 -0800 (PST)
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
Subject: [PATCH v4 4/6] platform/x86: thinkpad_acpi: Restore keyboard backlight level ourselves
Date: Wed, 25 Nov 2026 16:46:41 +0800
Message-ID: <20261125084644.137506-5-kmatzkaczor244@gmail.com>
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

kbdlight_suspend() and kbdlight_resume() leave the keyboard backlight to
the LED core across sleep: the LED core caches the current brightness
and turns the backlight off on suspend, and writes that brightness back
on resume.

On a ThinkPad X1 Carbon Gen 14 with thinkpad_acpi unloaded, the firmware
turned the backlight off when entering both s2idle and hibernation.
After waking from s2idle the EC was back at its previous level, for each
of the four levels tested; after waking from hibernation it was at 0.

Drop kbdlight_suspend() and leave turning the backlight off to the
firmware.  On resume, write the cached level back to the EC on all
models, instead of relying on the LED core: this brings the backlight
back where the firmware came up with it off, and changes nothing
where the EC already has that level.  For this to hold for every
mode, have kbdlight_brightness track the EC level itself, 0 to 3,
rather than the brightness reported to the LED core, in which the auto
mode (level 3) shows up as 0; translate it only when reporting a
brightness.

Only s2idle and S4 were available on the test machine; S3-capable
models were not tested.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 38 +++++++++++----------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 16bf2267d..764b1efa6 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5105,7 +5105,12 @@ static struct ibm_struct video_driver_data = {
 /* EC level that selects the auto mode for the keyboard backlight */
 #define TPACPI_KBD_LIGHT_AUTO_LEVEL 3
 
-static enum led_brightness kbdlight_brightness;
+/*
+ * Cached EC level, including TPACPI_KBD_LIGHT_AUTO_LEVEL.  All state
+ * tracking compares EC levels; the auto mode is translated to a
+ * brightness value only when reporting to the LED core.
+ */
+static int kbdlight_brightness;
 static DEFINE_MUTEX(kbdlight_mutex);
 
 static int kbdlight_set_level(int level)
@@ -5247,7 +5252,10 @@ static int __init kbdlight_init(struct ibm_init_struct *iibm)
 		return -ENODEV;
 	}
 
-	kbdlight_brightness = kbdlight_sysfs_get(NULL);
+	kbdlight_brightness = kbdlight_get_level();
+	if (kbdlight_brightness < 0)
+		kbdlight_brightness = 0;
+
 	tp_features.kbdlight = 1;
 
 	rc = led_classdev_register(&tpacpi_pdev->dev,
@@ -5281,14 +5289,20 @@ static void kbdlight_notify_level(int level)
 		return;
 
 	kbdlight_brightness = level;
-	led_classdev_notify_brightness_hw_changed(led_cdev, level);
+	led_classdev_notify_brightness_hw_changed(led_cdev, kbdlight_level_to_brightness(level));
 }
 
 static void kbdlight_notify_change(void)
 {
+	int level;
+
 	guard(mutex)(&kbdlight_mutex);
 
-	kbdlight_notify_level(kbdlight_sysfs_get(NULL));
+	level = kbdlight_get_level();
+	if (level < 0)
+		return;
+
+	kbdlight_notify_level(level);
 }
 
 static int kbdlight_read(struct seq_file *m)
@@ -5337,31 +5351,19 @@ static int kbdlight_write(char *buf)
 	return 0;
 }
 
-static void kbdlight_suspend(void)
-{
-	struct led_classdev *led_cdev;
-
-	if (!tp_features.kbdlight)
-		return;
-
-	led_cdev = &tpacpi_led_kbdlight.led_classdev;
-	led_update_brightness(led_cdev);
-	led_classdev_suspend(led_cdev);
-}
-
 static void kbdlight_resume(void)
 {
 	if (!tp_features.kbdlight)
 		return;
 
-	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
+	guard(mutex)(&kbdlight_mutex);
+	kbdlight_set_level(kbdlight_brightness);
 }
 
 static struct ibm_struct kbdlight_driver_data = {
 	.name = "kbdlight",
 	.read = kbdlight_read,
 	.write = kbdlight_write,
-	.suspend = kbdlight_suspend,
 	.resume = kbdlight_resume,
 	.exit = kbdlight_exit,
 };
-- 
2.56.1

