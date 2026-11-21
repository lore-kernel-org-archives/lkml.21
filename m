Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219787;
	b=eg0yBVQLH5plWBKHvUAT2c3/IG0XfAeo7hr2UTq5aefdhYBb5ZvjUHVtjW8VMfYpG8qa
	 Lyu4q4EDpeaYJg6z+EU2iR5cY8tU/Qeu8Hojyx+0csD25SgemOKMf8YsBndibrvagaVRU
	 4fOpDGmNkByYT5EYLp7qe8L4gdmfomF1KzFsCWVc2SwzsjAjXFrH4mzKJESYRgdeL+YtX
	 VKoHBL2FIvTtjElZ2LWH8x7JX8mBAqob+8KWYq8oqIP1OekhQJ846JH80eTLf2zlOSWJ6
	 BwYc2NDKfcpnAdgU/nrLUWfju541/hkvz9BWLZG0r0jHJNAnT33c5jTWpYH+CPVZ1dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1CzFBBszFhkiIIYt9wFudFnmrxdhz1D8UxoY045S5U4=;
	b=Ycun0zcc3F8q16ULBWJcYV68S/UfyXFcBgsHhoWwRPHnsJpTxjjfXf4IYMmi61ZNKggH
	 i2Kjdwrqbxh2CSFHs+n9tBvIvajB1QVMVnCokSugG25vkysUd4FrwFK+fELxwt9gduJ7B
	 XZ8ctUxhNTiRp86swausHoGIw+Aic/3fVAW+o2ZDRcTJFj+7bAqYLz/+fIUd+IOsmYU7D
	 gAkMPy3OxX3hCkrCGkzsG+dHuL/65nRjW9VnZ8bhbVmz0GQpLMe6b7ucY2QXkTrMqaKGE
	 U9lXWs85zKC8Ddk8sDtmFgnix803yPfDBvvhx4c1YAqAqC2uhrcRvKGPnaQKp1Bz0Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p1CJsbYh;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D16060A2622
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D16060A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p1CJsbYh
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso1040414a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795219782; x=1795824582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CzFBBszFhkiIIYt9wFudFnmrxdhz1D8UxoY045S5U4=;
        b=p1CJsbYhNdt1bUXy8sOs/aU1AzB93Z8SwfZnyJ80pjKaY/Ut4gkjV1UrUeeT5GGiEp
         87vbB0ar0Rvu/6eNeanyRdnyO4TLs51vfExQbO2oWcfHlhb/0ZW+PcI+X6iwZjA0M59j
         EmaO8EtlkvLNMLuJ86iPV6bUIcKqWxiCfu3HFOGqgyfgaEZi7m+b8XD18Ybp3cbncnvk
         Biz7lKVfUGhWAdnCEfQ6EnzkZUxKw5hVE4boN6mA23YBs1CLap1SZ8MZbbyNMv6Fytpn
         ybdx1KkBxLSPsydnwE3MyoZQwpDfpUKbfC+iwQa+zaQWBW/9V126jyXsRCDop7NfXeJa
         FRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219782; x=1795824582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1CzFBBszFhkiIIYt9wFudFnmrxdhz1D8UxoY045S5U4=;
        b=s3dlI/dNdBkM16kesuDd72DQksP6vIHyEo9P2cDn85dmzdsjzbBQcoxWW3vk+vlM4l
         uHX1iQKhHbNeRO/2iHqXCRbt3PQ7tVdUVD+Uy1Orz+BHWV8fMHVl9yrhCQ191dOrat4p
         Z/xK4qMBnb57vzYVGrJnsxaJW9ka4nG3E3bdaWhdIRm7v/t2Lki0hz5fp+hWQnlosqy+
         POM9SOBJF6CVCRJF3h4TtoNVCX0b2Vi5K9PTCFvj9I1cimTACCrl2YoVF+BUR5SfNzn+
         S5hFr9UC/MZF89Tci+t3x5WbrFNAXTT1X3Dupc0+VRyVqUyenKgSxav5VrBrLMz0OizJ
         0pAw==
X-Forwarded-Encrypted: i=1; AL+hErF6Woew9F2ZKehW/vFihpD0mfP94VAFRMXL2bynHSlF4qitfmoDXTfe5M/j5obdWrwP24rPvvLusGI46OE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9npzrcMJFUCv6IDnFjxRhpJTNbmJ6AWtaOF33NeGjqwQ+I1P0O
	EYjDvqX4dqTI34WfWWZuTTc30+fEdfE+FSakKPis3uJLt1rlDKqnNLTXuoDhVA==
X-Gm-Gg: AZFdTZeIuLD+ohyJ4zCn9bTeJAqgPRvPCwB81sS3nOiZZzJqWwWuxsFtzldqlVNuW9t
	X48n+Yy6SLjAncaib/opjDWu3tC3jK5NIkLHhmPZON2va55StqfP2tr2XrCxcAiYHHs2Kx5Mi3d
	/qPQ1dKxPquV7/oIJTu6aPNJtwPKvSlmWnMaGDxzdF64rOAozBSHWZbeWe45Q6G2Upy5T9SFEZD
	EPwq4rZqix8kv2tuyI7f/YreS6+nW2eWVDG8Ou2X4FhnMlSL4xSdaqnR45Gee+pxH4XKvAiU3DO
	YofgoXers1n8XVuZud4IXM34VGYAjKwpuOY0Nnz+DTQZN+AHzTax0DyyxD7laZJgBTgE/0Q4EnM
	FXkPPlsp9SjWoZhf7VVcesgIoN2mxKuaPlCrh6NMX+ixrEud1niSG9Urzx2MLTdtl6Btulx1QM4
	zneRc+nGXFUehM0WCdFo5cal3k5qZ41ebC34gSA3QqC2+WP0Rk+9DBm8BBAmBA+kRMO8WTPLVy3
	j2yewQugW8uWUjKVV/mPlDNXxIqx5gSRe6stwfQPEparwUIh+s2e0ChA6qjbXr6A/wXZmgzVPsb
	39t6ZO24a5TMQtCOofvlt3wdaHKAdLeuubJszQTGkH9/+VaJSQT2GDICYhoVSXFncd8jMXIYTSE
	LBBKoMXBTqEDeH7+xuNKlraP1GOiUtNz9CQuH7yR3guaaBSGkynFHn479tjoBYG9p+EpjFM9MN/
	qpbsI=
X-Received: by 2002:a17:90b:2e8c:b0:3ab:884b:65a9 with SMTP id 98e67ed59e1d1-3b41c9e430fmr4919985a91.25.1795219781727;
        Fri, 20 Nov 2026 16:09:41 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc613csm1920509a12.5.2026.11.20.16.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:09:40 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	Darren Hart <dvhart@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] platform/x86: dell-laptop: Fix keyboard backlight timeout overflow
Date: Fri, 20 Nov 2026 16:09:29 -0800
Message-ID: <ee9e976209ac07dd390676c4cf9d0643719ff2af.1795219225.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795219225.git.rosenp@gmail.com>
References: <cover.1795219225.git.rosenp@gmail.com>
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

kbd_led_timeout_store() converts a timeout that is too large for its
unit to seconds with plain int multiplication. A large enough value
wraps, and if the wrapped number happens to be a valid timeout it is
accepted. On a Precision M4800, writing "4424214d" (over 12000 years)
to stop_timeout sets the timeout to 4 minutes, and "18989323d" sets it
to 2 minutes.

Do the conversion and the following unit selection on a u64 seconds
value instead. With value <= INT_MAX this cannot overflow, so such
inputs are now rejected with -EINVAL like any other timeout that is too
large for the hardware, and nothing that was valid before is rejected.

Fixes: 02b2aaaa57ab ("platform: x86: dell-laptop: Add support for keyboard backlight")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
v2: use a u64 seconds value instead of check_mul_overflow() on the int

 drivers/platform/x86/dell/dell-laptop.c | 34 +++++++++++++++----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index cad2bd06f28a..c1a51bf95c25 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -25,6 +25,7 @@
 #include <linux/sysfs.h>
 #include <linux/acpi.h>
 #include <linux/mm.h>
+#include <linux/math64.h>
 #include <linux/i8042.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
@@ -1553,6 +1554,7 @@ static ssize_t kbd_led_timeout_store(struct device *dev,
 	struct kbd_state new_state;
 	struct kbd_state state;
 	bool convert;
+	u64 seconds;
 	int value;
 	int ret;
 	char ch;
@@ -1599,38 +1601,42 @@ static ssize_t kbd_led_timeout_store(struct device *dev,
 		convert = true;
 
 	if (convert) {
-		/* Convert value from current units to seconds */
+		/*
+		 * Convert value from current units to seconds. This is done in
+		 * 64 bits so that it cannot overflow: value <= INT_MAX.
+		 */
+		seconds = value;
 		switch (unit) {
 		case KBD_TIMEOUT_DAYS:
-			value *= 24;
+			seconds *= 24;
 			fallthrough;
 		case KBD_TIMEOUT_HOURS:
-			value *= 60;
+			seconds *= 60;
 			fallthrough;
 		case KBD_TIMEOUT_MINUTES:
-			value *= 60;
-			unit = KBD_TIMEOUT_SECONDS;
+			seconds *= 60;
 		}
 
 		if (quirks && quirks->needs_kbd_timeouts) {
 			for (i = 0; quirks->kbd_timeouts[i] != -1; i++) {
-				if (value <= quirks->kbd_timeouts[i]) {
-					value = quirks->kbd_timeouts[i];
+				if (seconds <= quirks->kbd_timeouts[i]) {
+					seconds = quirks->kbd_timeouts[i];
 					break;
 				}
 			}
 		}
 
-		if (value <= kbd_info.seconds && kbd_info.seconds) {
+		if (seconds <= kbd_info.seconds && kbd_info.seconds) {
+			value = seconds;
 			unit = KBD_TIMEOUT_SECONDS;
-		} else if (value / 60 <= kbd_info.minutes && kbd_info.minutes) {
-			value /= 60;
+		} else if (div_u64(seconds, 60) <= kbd_info.minutes && kbd_info.minutes) {
+			value = div_u64(seconds, 60);
 			unit = KBD_TIMEOUT_MINUTES;
-		} else if (value / (60 * 60) <= kbd_info.hours && kbd_info.hours) {
-			value /= (60 * 60);
+		} else if (div_u64(seconds, 60 * 60) <= kbd_info.hours && kbd_info.hours) {
+			value = div_u64(seconds, 60 * 60);
 			unit = KBD_TIMEOUT_HOURS;
-		} else if (value / (60 * 60 * 24) <= kbd_info.days && kbd_info.days) {
-			value /= (60 * 60 * 24);
+		} else if (div_u64(seconds, 60 * 60 * 24) <= kbd_info.days && kbd_info.days) {
+			value = div_u64(seconds, 60 * 60 * 24);
 			unit = KBD_TIMEOUT_DAYS;
 		} else {
 			return -EINVAL;
-- 
2.56.1

