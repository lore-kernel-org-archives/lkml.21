Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703801;
	b=4i3FNhB9pxsYBX0kTNgXRCqY396zqq6WcgnJXGBViFQGSf+AHV7D0gxSpo1Qeqkq6x29
	 jhLAgtj9aOx4SlBGWyfpqGMEG52wZLLiP9ELX0Htk2b5vS3a9ddp3cQxfC4V0/xWgKTKD
	 fu/kn5XqQ2LsHQ6vQw/L7KMz+UZ+NSG+YQ9JomGdFAYorF0w7fOKbjWXDAYgTjcjW6I85
	 sqSJ6M8BeBEdUjq6gmNn9OLNvQDTOi/+UlFqMeyS17NKSZBKOZ+U5cuX+y8ZBmwnTEt12
	 X9ajWjl9i+2u/UlQQqM0Sc40tzYY+ZS52y2iTOpFAZuNHiVlqMnEJ0FiriURgMWsqkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=wZ2A4qfQpgB1E9Hmrqw85vL60jFNYPf3t/HcdS6s4Lc=;
	b=fhArGq+HuMuavzHZ7ZowepVRaGWD2E+4gNPmgCy7gIQHNo/c81AY6AiYEhi/6jfy+Auy
	 K9Vw+hO35PZPi8oTSD7WkHJ/B2r4m0Dft7CB0OaQ/Du8hiyjPNkluol43m+XAfAp1kTSA
	 lSts4Of9qhtrf08nF4BUsydl/TyLEsCVA+E9p2rQFoki5iVqmNLsXyqytwBmKef0NsQhn
	 xuP3/KEtqdgfJOMOvy5yCs1msnUdgzgZy7q6OUU6kNddoCjIi7C5802s9tZdemfsFVYO+
	 J3u9/EfhWQYP6A09ZNtbOmZkiZvfzPIlbW2xNKFPR2quO39wDKh2TwVW7mDlwg06J0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LJEFTgK2;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE384606A339
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE384606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LJEFTgK2
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ae25c846edso47005571fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795703799; x=1796308599; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wZ2A4qfQpgB1E9Hmrqw85vL60jFNYPf3t/HcdS6s4Lc=;
        b=LJEFTgK2y+bSpXry0PbbjVe1EY/gQIxL0YjKFkbtnmSeP2S3iAFI4cpcJpA0QfgVf2
         t1p7/r5jtP5ruD7Zaniry3wA6I29YfBMO67y/KyyN1YFvJHJrUNO5NowSSA4mm3hKTAm
         jsDENlFJr0+j8Ohz8rimlhi1RnEn3SNcnGzDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703799; x=1796308599;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wZ2A4qfQpgB1E9Hmrqw85vL60jFNYPf3t/HcdS6s4Lc=;
        b=HSak0abIH8l9zBHuS5q0M85WmCJ+At+glSiRAIN689/ZrgKJtAZ+a9ypB67d3N++5a
         DjEipNVFoFXgiAMlCLZ03cw+AgM8ghVsU9EKJ55HS52i243cAHDdFyIvMpGZp1k77MmM
         GqpCcOWkms3wpb3FsKnemxOzj2JgBUSQf2J5Znzt0P8ysK7FuBLr4VpweNqzfInSUoe9
         SvSqLhzWIM9Vawt2IRVWKHCmiN5vbi0JqksdQaPYznQryrZe8cGjLM0U8lG+RoT8NsWr
         hQtZXUtzrf3CDUUDOi7NPVkpTPuDFd7/Vxj03Kt4DF83iLp8FT1VU5iD4ZrwJRNGWWFY
         X2og==
X-Forwarded-Encrypted: i=1; AL+hErFw0G+vHqt2BVkexfOZXXCqzTi/uZhTywsiKkGt1caq4Af0r5O7JFx4TxswnAowBozmjzsca1SHr9mOHJw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jnaQzik/TAMOO6i66ZMj4IVGWH2kS1/6pZOemlEw7LsYSwmoJ
	js1qpOjOAD+GeR8z7DhNmjJiGlIrNWIh93Gk9eWajgzzX8USJM5f1DH85miYG7Vnhg==
X-Gm-Gg: AZFdTZdX/JG1fU4X1DuBaxdCfAnbTjN9tLmvfx5uyIeBmrAV3tbpdP8crLJmuDhTrYJ
	SpQY2oUjpU0uxrlKSJg6gl+38p6EGmD1yeiF3bcOc46oP2VEq20mGT0ihq0joQOka+DrEKXpNQd
	QVEEZqTq25C49o9C9sVfJdAYdaJN97OHAF6w1rfWdSCWUJ1QWkPtC80Hl81QEnshF5O5G3O87hq
	ygltxBfeJvnZwC35zrnpC90ESxDeZM/QqqVdxaoC2UMycDPhmQ7rWOC+GKDAZ20hNIq6rKdXh8G
	yNYvmFRLPvnv8zrFLL0EGfbMoee56kdD/lOrEtYWh3WdOHdwr7pcSRKesAa/r/Am4mV63psFxzu
	mhb/+JEHEZd71h/3r5nhInSQcDlnCvj5pabReEmNf1pq0AGmFv8QcktgpGFhTg+UMbb17AwsLvg
	so6041EtkjdWPiHd6MedHM97YBPbsS1dVVA0TPzV4ZtcT766fucow5n8k0QRB4j7JKDwGuE7FJ+
	Ryp5CLzhkABMApI8qMpR5SSK/qMuDCkAxoR9xm6opnBNmvgVj41CnPhKvr14lZc8ZFm/+yvVVUn
	IuCLh3pPim8p+QbL1/VN0X2ZXRoDFqVRzV6xSu0quNN7RPWzWfD1FB9HuUk0k5oCcWvpOXy6sQO
	+JDbW9VTNlqGNswbH/JtLAR1Gtnn0jlE=
X-Received: by 2002:a05:6512:3b21:b0:5c1:5746:9c3a with SMTP id 2adb3069b0e04-5c1bc8f3c5emr6643497e87.62.1795703798763;
        Thu, 26 Nov 2026 06:36:38 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0563casm5231653e87.67.2026.11.26.06.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:36:38 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 26 Nov 2026 14:36:35 +0000
Subject: [PATCH v2] HID: Merge duplicated documentation for Lenovo Legion
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
Message-Id: <20261126-lenovo-go-v2-1-99db2904513e@chromium.org>
X-B4-Tracking: v=1; b=H4sIAPNDCGsC/23MQQ6CMBCF4auQWVvTVsDiynsYFlKGdhJhSKuNh
 vTuVtYu/5eXb4OIgTDCpdogYKJIvJTQhwqsvy8OBY2lQUvdSnNS4oELJxaOxXmo0dbDJO3YQPm
 vASd679atL+0pPjl8djqp3/pPSUoogV2jWzQGUXZX6wPP9JqPHBz0OecvWQpfj6UAAAA=
X-Change-ID: 20260831-lenovo-go-7b4ec4bf0cd5
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, Jiri Kosina <jikos@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

Lenovo Legion Go and Lenovo Legion Go S share some definitions. Merge them in
sysfs-driver-hid-lenovo-go to avoid this warning:

WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
[WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
[WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
[WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261

Cc: stable@vger.kernel.org
Fixes: 168c91839139 ("HID: Add documentation for Lenovo Legion Go drivers")
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Revert unrelated "built in" -> "built-in" typo change in os_mode description (Mark Pearson)
- Pick up Reviewed-by from Mark Pearson
- Add Jonathan Corbet and linux-doc@vger.kernel.org to Cc (Mark Pearson)
- Link to v1: https://lore.kernel.org/r/20260831-lenovo-go-v1-1-e9526e88ee09@chromium.org
---
 .../ABI/testing/sysfs-driver-hid-lenovo-go         |  9 +++---
 .../ABI/testing/sysfs-driver-hid-lenovo-go-s       | 35 ----------------------
 2 files changed, 5 insertions(+), 39 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
index c8221373ef76..07f3ea054383 100644
--- a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
+++ b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
@@ -365,10 +365,11 @@ What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-
 Date:		April 2026
 Contact:	linux-input@vger.kernel.org
 Description:	This controls the behavior of built in chord combinations.
+		For the Legion Go S, this controls the touchpad's operating mode.
 
 		Values are windows or linux.
 
-		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+		Applies to Lenovo Legion Go, Go 2, and Go S line of handheld devices.
 
 What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index
 Date:		April 2026
@@ -377,7 +378,7 @@ Description:	This displays the available options for the os_mode attribute.
 
 		Values are windows or linux.
 
-		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+		Applies to Lenovo Legion Go, Go 2, and Go S line of handheld devices.
 
 What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/product_version
 Date:		April 2026
@@ -640,7 +641,7 @@ Description:	This controls enabling or disabling the touchpad.
 
 		Values are true, false.
 
-		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+		Applies to Lenovo Legion Go, Go 2, and Go S line of handheld devices.
 
 What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index
 Date:		April 2026
@@ -649,7 +650,7 @@ Description:	This displays the available options for the touchpad/enabled attrib
 
 		Values are true, false.
 
-		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+		Applies to Lenovo Legion Go, Go 2, and Go S line of handheld devices.
 
 What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/vibration_enabled
 Date:		April 2026
diff --git a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
index 4d317074bb7e..218164cfe544 100644
--- a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
+++ b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
@@ -231,41 +231,6 @@ Description:	This displays the available options for the mouse/step attribute.
 
 		Applies to Lenovo Legion Go S line of handheld devices.
 
-What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode
-Date:		April 2026
-Contact:	linux-input@vger.kernel.org
-Description:	This controls which value is used for the touchpads operating mode.
-
-		Values are windows or linux.
-
-		Applies to Lenovo Legion Go S line of handheld devices.
-
-What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index
-Date:		April 2026
-Contact:	linux-input@vger.kernel.org
-Description:	This displays the available options for the os_mode attribute.
-
-		Values are windows or linux.
-
-		Applies to Lenovo Legion Go S line of handheld devices.
-
-What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled
-Date:		April 2026
-Contact:	linux-input@vger.kernel.org
-Description:	This controls enabling or disabling the built-in touchpad.
-
-		Values are true or false.
-
-		Applies to Lenovo Legion Go S line of handheld devices.
-
-What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index
-Date:		April 2026
-Contact:	linux-input@vger.kernel.org
-Description:	This displays the available options for the touchpad/enabled attribute.
-
-		Values are true or false.
-
-		Applies to Lenovo Legion Go S line of handheld devices.
 
 What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/linux_mode
 Date:		April 2026

---
base-commit: 25faec9ce61c01fb45abf812a222c5b43c3cd5c5
change-id: 20260831-lenovo-go-7b4ec4bf0cd5

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

