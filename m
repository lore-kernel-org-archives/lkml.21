Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748023;
	b=CO5F/9UovtV1NJBGrQyPB46VLHClbM0MVxcHDNWDc03KlHlwKd+nR83pMmnio6Ni1gNb
	 IxGYDdo1O8oIzoy+mycA3JWEahT61HQ6P1I/8zP8xIEDSXe17ybKd62qV+LYuoBwUJ9JV
	 sXnyJtkT+It3293ej28oNwVc4Av0Wx1ALHg0JuyfESy+a6HBgZKCGS0MVVMXYEUDXZOjC
	 7cvB6CsKUD4oByvodFlmk69yZuZbCrNw6LV1L8vaakyIoeeuRK1lDaqadGJoqE4D+OaSE
	 /6VAzYM6eM/tRo+y9HS6eyTwRtk/74q67etS18A5x20udGsawpidKrMPqEa3qGSqAgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qgARupCYolbeA/n2nVCfsvFjJ5NI9vPuXE/b3WtWydY=;
	b=cK1ZSyoAgjxN9kVYV97FU2WFJ2tvQeyCD+y90jr+VDTm91WY3WEUM5lFmYqDZYU4XhUv
	 A0yXPUoquNnWbNnnoKEqrARWTc7PQExidokg6DRSmkYAWqwPnG/aBEuyk+we4O/WMZcmy
	 2qzw/GD1w/mKhxrcxZOSmddPwzMeDxQF/OSyGDVnibv3UC9RWQ1QBqoe9balaNbalPPIM
	 SG+zmuBog2NQZLg7gU4vEv/uWtKzYf/T9rTGXcc231y28FPFAdghWmZk2o/WZLTNrwQa+
	 CLleLumBG3XrYkCLnmhrmZC+6adPEer4fGMFikCi0VL08yvNTr585CoR49jghZgNNOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nhq530dV;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B0A606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23B0A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nhq530dV
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38190551625so14623235eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795748022; x=1796352822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgARupCYolbeA/n2nVCfsvFjJ5NI9vPuXE/b3WtWydY=;
        b=Nhq530dVI1F7uXRkrcEunCVpROjo75pgtE5HL2ywcqhfiwtYfEhVffNj+gq1O2I7K0
         VKo8aoFCb+7e+3GmsWX1VCuFozq0h0QSCpXFkboKKbcIIscERWBNUH5vvkS2W2sb9sy+
         8+6wN73+7fpKa30+GvwFYE0OM4Toa/cbZXPQq6gzvX2H4wrWfWMQWMsat3hYj54Qz8rj
         cedkmcLaXhogx9tye64TD67ELQVNhjw8Y64se3nbpGOjz2mCWp1rsS1yAJAvUTEMHU1o
         piDcUYA1ImlB/3pkYPflkE38UqQveeYB3jy2rnR5zFt2UNnTciVd7pK5tArp6vZVKxR3
         4Jlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748022; x=1796352822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qgARupCYolbeA/n2nVCfsvFjJ5NI9vPuXE/b3WtWydY=;
        b=mFoVT4sqMJdd8xNRIrm7gA2ZWjBaAw1VOYGHEdIUFXkyPxKN8VtxzA800dm1ZOfJLX
         QolmaEkMp4/mGtnVwM1p1ThJtCHs18uB1sPhfBc6BmDsxonyxGHBkUu2MZ0HTQMdw785
         HXI00pacLLpkCi+iZVHsZA18putfliY0zf/Ivk9xV9TfigCeSi6OCDtqWXBkw/tZUX9P
         WsZz9xwDKtx0lFdyLW0fhX+WR8bQ068UxTgHzDH9aCDs9BGRLWW7GzIWaKhr2rcXp2d9
         U6gpInDGcEOrMjHhgLYbnJiScQ0qQjFHVczOL56iLy/dOvrRHovEiAq/1eTA7C4ZidMN
         MFTQ==
X-Forwarded-Encrypted: i=1; AL+hErF1KZi/krerCiti0v0D2G/UI3OEO9GrInOIiTTdj27B2kdm5aWcIZvKIb86nenGnDx3pz/5JDYv7xfVJQA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SqrHJ1Fd6no6VavLJVHJZbrZkEhQVJ9M04tMfbTA2KQXlszEW
	w4d2w/SaiddZI0KiQyk3v2Ph2Ukh9TVhLCIRpJ05AcOQWtY5y5uMMFmu
X-Gm-Gg: AZFdTZf9Pg+AsBmQiUpY9yt/fDnkPw9mrMiJZ9mHwfU6JLgzcc9NCqVQuPkXbFzdexO
	JYcb1npDtuxltgbvgvGW4IItJ9zbljcYwBgv7A2TABYO1HIOsv+KBdwLXaFKCPZTqQRaa/lxIXh
	UKqHQoXb1FNk/sJlQTZnFZmPyh/TexiYzxA8BHXBBK8WMbzDLXJry3YbGHdwOiamxUAeOcLZZkk
	bCi/oyM0kHlFGoOXbG/dwuD29xG/I5RBx+Ou2pliEsK/IVLInLIzTAmzdPBx5N4Bq4BfQo/u2X6
	l8UMprqzv+oZO8EujenLGeHvsZpF2pjxxS9jxhpV8WsqMjL3TuE2ALFUNtHNnFGqRR9yP7R2Q+C
	dCGlwUuJLZY6zW7cL/GY6K650yfNEss3JFI+BsNTWkdZKnnhXVa3EILsZDBzjQyFdp/LXzVapX8
	K9wuZQiMPtd7EoszmpyCmK/cLKIx3V4g+NMu8DTth6EdkwvspwQpCaDfq1s4rfnvIJaURlVpvyS
	NVvwdYhFFwJoJnqWEmipfBpNV+86aRZmfgp4EBS7iy1SnM3m07IAEZlCZ6GXqn2bchv1hp7afDV
	WtCo4JN6u8SENphPAiSC7YVgZAgk+gLYOx1EiMd0fUFFYXVeCV4+WIHyZ+icxuTgg33tMqUoz9X
	ErNbrSQmcfb0WMNc1oKkcubI2x5c5fHEyik0Hj0LsKQYGhncbMHzZ0CvxHeQODQ0/Q3lYvT/VxT
	0PAyzLEHuL6lRF+hnoyPf5dwU=
X-Received: by 2002:a05:693c:895b:10b0:385:cf42:9b98 with SMTP id 5a478bee46e88-385cf429dcfmr22786449eec.34.1795748022207;
        Thu, 26 Nov 2026 18:53:42 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm75811610eec.24.2026.11.26.18.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:53:41 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] platform/x86: dell-laptop: Fix keyboard backlight timeout overflow
Date: Thu, 26 Nov 2026 18:53:36 -0800
Message-ID: <4a1ca9527265df78397d6df20a5bb53d06792eec.1795747885.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795747885.git.rosenp@gmail.com>
References: <cover.1795747885.git.rosenp@gmail.com>
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

Fixes: 6cff8d60aa0a ("platform: x86: dell-laptop: Add support for keyboard backlight")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
v4: Fixes: 6cff8d60aa0a instead of the reverted 02b2aaaa57ab
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

