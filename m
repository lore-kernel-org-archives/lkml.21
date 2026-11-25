Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648892;
	b=opn2abPjaLnrYhzTgMgYr3fOhyNEo8IFVcICr+ud23FiFQoi31hpnI5UI2LeYe1omsrl
	 m01y7kRFfUukC5Nuoh2ShCZHA7ya9qUWdHxnvQIfoYh7J1KFnPtjtk64Ffj9oseW/BaeB
	 HokkdffmoHdRJXQTxDOvkNf3YCccZfGA6g7kE7QXg4ZVpS/Upt/jNmD4TMESTKWg4PoWb
	 YvDpexYrwTbR4wp0fpdjifyniOO0n42QjEv8BUshGNrUlReuD6EGp70Y0ZyuOK37941ad
	 6J25Xbyln1Po00RpD69wC1Atp0oGD8lvl5uj+eTObdJc6E07JhMg8S4T790N60LibJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7zsnKipnJh9s48hmQ2kvGabQuUQpb5jeBqmSJWtFtAo=;
	b=2X6EKOM8C7vH2xQOlvVi7t4xUXuTXx7UalJs1lhFaNAEyXA4PrBJ2i6Jj2DVBppplWwD
	 3z5Pr5SDWgpqYC1YmoyQzqOzmjEeA1ZXBEsEjF3UBn5RPFGJJU2D8x3vKpnGMWNnk2Pu2
	 g+K8uFaongfBTAEGT6ETiW2wiMPuYYDfi3s4IeAcHh+1dGYNomzWpRKy8ZVwCdo0m3GpD
	 eXZKlQqf9IH9PiWFLroER+cOVyKp5hQJULaMMGbmZ4O/0ucavORWhPFWSexLwNdK+BQmU
	 gDj1J60OIMYzpnZZihzO0TgfY8q9EGXk/or8oNF5/iVUWNtgcYGiKyUQEmh91VLz+Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=veDg2IQd;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47160606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47160606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=veDg2IQd
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so2243761b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648892; x=1796253692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7zsnKipnJh9s48hmQ2kvGabQuUQpb5jeBqmSJWtFtAo=;
        b=veDg2IQd9XsRibDxnD9/AoHGjFrb9VHIu3Wco9LrhVP4LI0sn/Qml87K7LcXo8U/bG
         nDaOaOV3DtoJhSSM3V4MMHS/bAKVIor0D5OOWtzfwrVD9SlMLhpZVCgU07G6lBV7+ee9
         +v+N43I2yWwfovrcCpoxRwSVm4Wu5lfZYcs7H9dQjXtxYJ78xAdRBgDqZgxneOrSNWtg
         cciwe9UgzvPyUfBZ0rCSA4w6H9mmH7jl5Vd831RH17E1K+NppKIdO8T4Z4MsKX207RRP
         akCJzjRJTfOJM0s1Oe1A870kfeEh4+23RMAOa5jPsRyAwV5qcJxBsXuhf5FPOvE4O01a
         4iMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648892; x=1796253692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7zsnKipnJh9s48hmQ2kvGabQuUQpb5jeBqmSJWtFtAo=;
        b=t1/QFa8Z6QTYwZVDQzwB+tsKiS2unBjaEWaLWEqXFfJNwOqs2MUJaxfz7gY82P3NKr
         2prZYzuqBCOL/h4imQ7zTgFjxB581cvqVHODG2WHbp58QNN1Zq+PEIBfHwiKdYK0n6DU
         RKyXgM95Xit7K/qZe+G+xETi05d+LtEX7iPfledHDAw67baKqMJbKm7VourC3kaQvf9A
         AGNeQo/QS102sUGANUlCLu2ska/KU48ZoNwTh/BuQT4FCqcsZSOIOTjZY/lNA4azHYQN
         c6qZbGnBd/PdvgwbVZsJ1Bwqmdxq6N40blb9EiMaH9L1iu0x6efmizafxfga3JBZsawv
         Dq8g==
X-Forwarded-Encrypted: i=1; AL+hErGCW8/FY5zvsE+TGJ8IGoQX9y7sBWNP5JolFKei9Tcz0F5z5UzBUnImoComkb26JZFV8cX/vq6XqZhqEZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o205gxYm19M9gtvOhSin5ejMwiol75KJqOn0TCHlA4pztR8fi
	YDU76hT5bjV25XHyrTEn9WMCUAZYK8EX6b77L7CtpbpqmHv74Ck15Ukv
X-Gm-Gg: AZFdTZc3TebN1ROly2ITr6yUnB9ofx9yENCVMOUbjcEQc+e14xJ4R9piZvag18UT+1a
	y0iK2+oDGUtDx0g3ji+cpORXZcADgZv2w8TyYJOhBo10qVvFjZoEBahAezC2wdZ1kzWgQtEp/o9
	REMU6icyNHmEpd4aRY//Lt9yDbXgKsJGGJzwLNDHuRO5DmhKN1YlQv0gt8HnOXc6h/BBP0DCNpf
	KovmC65TDyyKZP1opS02MGqs/s001Gn7o9leLYZjY3tV0o8R2dZVwLRlG0QF5Y1LQjJ8snhzauU
	qJUbNHMbaIKhlkcokLVW1Qp1cx47Iqueg6EJb5dJs5RPyDQX9Ch02/FlauvKwACywThsgJHb1qR
	aC1hDSGE3gEirv1VvJ6TThBV/3GMo6tlEciuczObSZAbN8OVcQjWQC6TEFuFW365dzwWfQjioJ6
	t3PQhcrLZgWEaTKMzj/V1Gc2qPzPKJsrOPNNWAC3XmStcZmFTKy2mSX1z1cm+hEHVY2eCDD3RAf
	oeElmERHLv+TTpnmRmYwFQ3yKLKtinMvnVo38/DjHTnTErmqpkwyRQLCpXbICzM/INQZsdWDcBr
	p9kczZmx9gCIFQcFKVh/S34O5uD9OurAw8VAAuox1bfrPUh1y0DNLc+ZIndyerA5YN6eGnAWLen
	ZDezC20h+gWkToDg10XcB3shgfv9oZh7St0CR49h4V/C+AyRxgZmprG+XpDj5rJm+OXsi8HvMVO
	kusQ==
X-Received: by 2002:a05:6a00:21c8:b0:89d:f19f:5dd1 with SMTP id d2e1a72fcca58-8c87c862aadmr17370053b3a.33.1795648891642;
        Wed, 25 Nov 2026 15:21:31 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b25bfasm9864471b3a.46.2026.11.25.15.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:21:31 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] platform/x86: dell-laptop: Fix keyboard backlight timeout overflow
Date: Wed, 25 Nov 2026 15:21:07 -0800
Message-ID: <ee9e976209ac07dd390676c4cf9d0643719ff2af.1795648586.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795648586.git.rosenp@gmail.com>
References: <cover.1795648586.git.rosenp@gmail.com>
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
v3: unchanged
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

