Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596538;
	b=EZE+LoOW1LJz6s+go/6fqmniOrn3tHFNwaxIsr/WDOWCrx6jnXYYgxr/a4Fc3T42rnVv
	 D5ulVNW5RFC7v5ldeC4riQRMbNBbDNypcfEaeUvVGGldkYRMUr/bGwRhdd4OOD9XUdDtd
	 +SGGIkwf5KCSF4Ug9FPsBtm1Opu7kvg3LdIE5YiQuxelKLopUKLknKrRvv2rWXBoXuTEX
	 rE7oYhVuqsR2133ChGsGWj1IrS4620y7HDgGCQF9eWh07JBpiDnzJ+7CkJRu9II7r0elX
	 3s5BBe9DZScVovYAVG6aPOUNqtJIF4cJqOTP01xzGPqx3GJOCQN3VKFtWCGq4M2IQXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yJT1/+IdhoDhu7NfM3kA57WDlfCrtbwZwKhYF0N2rZM=;
	b=lqKDh2OW2mvhZMH2ODyye3GQO7C1FDdrxJoyvprF+wfjJGQsymjhLlXE/iGmamxXehY3
	 7VtB4Y6aVsvzpyDQIUizDPOo5RUN4HigszWf5cUPHKALkbKqAj0C4FSP6MfmyoIBgtiTT
	 8oPmnyZHIMLHz8tlsRVo4e12GJwiTYJWlmDl043ZSxdgD/93eidRXxt/YHnkTihH4+k3F
	 Tb3RjFKvEC4RjlHUSRsdZ41p6K6IX9yRDSpIlAC6yJMS4jbcJQZKMh7nvSTSHcHJX4UKk
	 hwfnswYErs4eu8Nfq/8z+mqMRLCWKIfqV+oerVVaB8pMVlaOr1e5/H72QQTlA16B2Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OEn/KbW5";
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF68A606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF68A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OEn/KbW5
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-382afece6d8so1097647eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596537; x=1796201337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJT1/+IdhoDhu7NfM3kA57WDlfCrtbwZwKhYF0N2rZM=;
        b=OEn/KbW5jpAo+41iRtKb1w9uUHwteSvs6/MPi9hNvFMG7O9KHOXJWPZZqbSgMDWRFk
         8+C4gN4GnxsqYK5YWtogGjhuDz8sAqz2Ksq2fEfNY8egzqlX++bR1ZHiwi2HZ20z9B7f
         lZ89cMvxdMGjPRi5bqQIquHuOOa98bkxrtIKT8uax933U70r7CRgc5iRLf9qXbAoosPw
         QKuINJaaFA59jsb+kjcPuDOqAzKetTTaNi47f9EvChflPiI4V6lEoyPhVLG+1LnCA3zd
         Y++V3HjA82QB/2rutvHyv2do69KEavmqC3nrCCI1c6WVKrAy6ICvtX8vcl/N9x7ucDSG
         mWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596537; x=1796201337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yJT1/+IdhoDhu7NfM3kA57WDlfCrtbwZwKhYF0N2rZM=;
        b=rjUsjgV50/ZvU3QTEHgvp54Fe2f0tZfZu8NVzwZQJ2Xs5/ER18xiHaVMfK/lh+Znr3
         kVb8yt7YPxQ438Mwd23iWF/S1xTZ1Kftun4giSkavTXQzz7GVQGHmsg0Qoh7clcNibVA
         i3FmHV1Uqsp1Ohp37RCh9HM7VYSa501gDmtqXoceV8A5VK4YQsfZlif3++GO1AN/GHXd
         zVnlVOSGDcVi/b9pw2OCzioGCJagAA68KlXSA4ILK/HE0tXbjlSCLEcUWYnnSUtcyFUa
         MUKpcK24uyjh4/vzGPZqTMjb33IZvGD2T8pPpaQ+O9AnfbGR9EKq2ubVf7d5P3kgj0dN
         L0Hw==
X-Forwarded-Encrypted: i=1; AL+hErFz/MS7PB5wmKJtXaCGvwlSF3vl1W9OFhgeJ+JSxusPOVb4HbSFZaaBXssof5Ka0H8Nua6slWG77HbDf74=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LI2VqontUjgouRQiFomCaOEMf6VvfafmXYoyQAR20b92yOL4x
	E7O3M9LAeTZEEGv7GJ5Z0TZYzReaqvqWboL+T+6+bQs0IGyIr4F9dQLZ
X-Gm-Gg: AZFdTZcuh2Gyi2pEox0Ok21fuZ/9xBl/+xZwl7hbf2Fw6MHSg+8w5D+kyMTqyxMClKl
	8wHPom1rC5ArxDAhDgHVwteYzgpC+U1p45p+LNAY+fK4o7QLTSj3EMfxoUSFDzMCqzsJvLtPm1L
	kkE+I+366gImVltKrHqljdu0wV6pli3qNhmibsxR1L2ETcpButsqGQyQPmUKTh6e6h4Fkk3L5qc
	oQBET3ZmexDs5KgjXplBFvKrBMkal8m9w2esFDY51OCvRjFpywyu9vnNNucDXas8aHLkGlbFYmB
	/IfPxIDdxm/lrmAr6aBPWcurKMIGnDNEIg3M/xlUExYvOFeLxGQrgTE/n9fTo/EOULLae/k732W
	aVYZ6Vz9DKaGQRcalMcomI6dRLR66gNxba20OUaLa3oa7wWs/MzOFxhQhe4i89f4QUwi2IcUI3G
	lp3N6d80YcVwuFyxHrVcVd6U6LsBofoHnQ/2M/DC9grEf2t8BFB2sdzqQDblSNF+TOXrsNOfXQX
	UoEOfnpRYZbW/zne1V0PJika3tKuHA+evtu+dT8+IgVFJTntpTBftGf5ECir3GKd2Fxk3T8tiCv
	5Mls+XVXPLxXWzCTA+0+0ibsPJ7mCQ==
X-Received: by 2002:a05:693c:42da:b0:386:95e7:8497 with SMTP id 5a478bee46e88-38695e790e1mr13921792eec.28.1795596536872;
        Wed, 25 Nov 2026 00:48:56 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm18879252eec.9.2026.11.25.00.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:48:56 -0800 (PST)
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
Subject: [PATCH v4 3/6] platform/x86: thinkpad_acpi: Don't poke keyboard backlight's LED core brightness
Date: Wed, 25 Nov 2026 16:46:40 +0800
Message-ID: <20261125084644.137506-4-kmatzkaczor244@gmail.com>
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

A write to /proc/acpi/ibm/kbdlight writes the EC level and updates the
cached level under kbdlight_mutex, but then assigns led_cdev->brightness
directly after releasing the lock, without telling the LED core.
Commit 06da5325d02e ("platform/x86: thinkpad_acpi: Stop setting
led_classdev brightness directly") already removed this pattern from the
sysfs path but had to keep it for the proc interface, which has no LED
core path of its own.

Stop writing to that cache.  kbdlight_set_level_and_update() now only
writes the EC level and updates the cached level, under kbdlight_mutex;
the sysfs path uses it, as a write that already goes through the LED core
does not need to be reported back to it.  The proc write path instead
calls kbdlight_notify_level(), which updates the cached level and reports
the new one through brightness_hw_changed, like commit 07f48f668fac
("platform/x86: ideapad-laptop: add FnLock LED class device") did for
the ideapad FnLock LED.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>

---
After a procfs write, led_cdev->brightness can retain its previous
value.  This is acceptable:

- Reading the brightness attribute calls brightness_get(), which reads
  the level back from the EC and refreshes the cache.
- At this point in the series, kbdlight_suspend() also refreshes the
  cache before suspend, so led_classdev_resume() does not write a stale
  value back.
- Software blinking may pick up the old value as its "on" level, as it
  can after a Fn+Space change.
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 44 ++++++++++++---------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index b4b3d7dcc..16bf2267d 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5113,12 +5113,11 @@ static int kbdlight_set_level(int level)
 	if (!hkey_handle)
 		return -ENXIO;
 
-	guard(mutex)(&kbdlight_mutex);
+	lockdep_assert_held(&kbdlight_mutex);
 
 	if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
 		return -EIO;
 
-	kbdlight_brightness = level;
 	return 0;
 }
 
@@ -5147,6 +5146,21 @@ static int kbdlight_level_to_brightness(int level)
 	return level;
 }
 
+static int kbdlight_set_level_and_update(int level)
+{
+	int ret;
+
+	guard(mutex)(&kbdlight_mutex);
+
+	ret = kbdlight_set_level(level);
+	if (ret)
+		return ret;
+
+	kbdlight_brightness = level;
+
+	return 0;
+}
+
 static bool kbdlight_is_supported(void)
 {
 	int status = 0;
@@ -5195,7 +5209,7 @@ static bool kbdlight_is_supported(void)
 static int kbdlight_sysfs_set(struct led_classdev *led_cdev,
 			enum led_brightness brightness)
 {
-	return kbdlight_set_level(brightness);
+	return kbdlight_set_level_and_update(brightness);
 }
 
 static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_cdev)
@@ -5253,20 +5267,6 @@ static void kbdlight_exit(void)
 	led_classdev_unregister(&tpacpi_led_kbdlight.led_classdev);
 }
 
-static int kbdlight_set_level_and_update(int level)
-{
-	int ret;
-	struct led_classdev *led_cdev;
-
-	ret = kbdlight_set_level(level);
-	led_cdev = &tpacpi_led_kbdlight.led_classdev;
-
-	if (ret == 0 && !(led_cdev->flags & LED_SUSPENDED))
-		led_cdev->brightness = level;
-
-	return ret;
-}
-
 static void kbdlight_notify_level(int level)
 {
 	struct led_classdev *led_cdev = &tpacpi_led_kbdlight.led_classdev;
@@ -5326,7 +5326,15 @@ static int kbdlight_write(char *buf)
 	if (level >= 3 || level < 0)
 		return -EINVAL;
 
-	return kbdlight_set_level_and_update(level);
+	guard(mutex)(&kbdlight_mutex);
+
+	res = kbdlight_set_level(level);
+	if (res)
+		return res;
+
+	kbdlight_notify_level(level);
+
+	return 0;
 }
 
 static void kbdlight_suspend(void)
-- 
2.56.1

