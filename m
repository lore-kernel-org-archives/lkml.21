Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678283;
	b=HkKJWecndWkmgmz43M62gloIxb8jrFOqpzzt7CVkAnRISVX75Rj5SJn9mHT4yicJlJtU
	 Z8NGXXozD7OZi9/MAbXiOlGsgOHv2nQNQUmsPW4l/dnZZn5lz0mfRo+lTyIjyZObxSw33
	 0LpLmYQWaYnii40vvO+wRP66E8LZ6MpQnp7xfZLrS31DJ46ERvvDJBkdILQF7x+VYca0z
	 +2oyPAvo0qEAko/MFx3CVL57pnfuqNiOi/t1frZT2WybKdJOt+AoTATDhVfYXZ22u0HSb
	 Z2f0PUc89oe7ov0Utoqvos1XJ3d/1WvzxleoLMK7nzypnRYUmn/fHMN03/T1Ik6s1cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rBNTBr+H6EwcDVHNor08ba397xyvQ+ksvy1NJd+AEPI=;
	b=WLmWOIMi55ncgr6+GqLinqGdFKml6WNcGeYY/pwR91wg9KxBiVm7E7w1ThKxgqx8nkXf
	 52kC6iri7KRIv7huDMLtL0FDtPYw1q6ubvKlXMS9kNpftpiSqjIgfPkXqV3o6Wjhox3Yy
	 5cquFCC0ZNd0Nrjjm5WunPlrgEaUXcBsIHQ5kCEboEt5jr0cEj9zwc5vsU61wca0ERbbL
	 HYIdbE55lwwBMP/6C6uRLaIcLjbmAHvWQ6maqx0oLZ3tDfBFwEFcMkFX0BjMZuv58kOJD
	 Zve91qTZsxGRdhZS5ETGskIhcgNWxZNfhKDFjEdAVkwZO3jVJ5sOCgjNWgY59badKHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QLjrXMFw;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3744606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3744606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QLjrXMFw
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a594d313a3so4462063b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795678282; x=1796283082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBNTBr+H6EwcDVHNor08ba397xyvQ+ksvy1NJd+AEPI=;
        b=QLjrXMFwkQ+vB9OgMQLlVDY1Xs3OisRoWkndU/haWDzvn5r8MQ87rSPbClZ89MTZm4
         hHc3TlXdGVEJVcAi4i85fpJ6ifSQd6lnazNU3LZdHXsWWRXbsGhPRg9CwTLzDykoF5MQ
         RNosFZMfo3HnZ5xbvxY2hHsaK/dBz5DoNHSQO2qroFj02iRyiTWa9gTt28rYbY1lDClg
         /MC5zj+5WagWD3TDqdKqJsSUPQZ8KS3i1DLSzRCIziqn7bB1AnURP3d9zYOeRM4HBJHE
         +4YFaTSnkQwJ+BUlTMHXQdA3HcJNOBkCVEw7WZSWeU2qlIklgozOrNtdVbQuEWHU8gua
         Mmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678282; x=1796283082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBNTBr+H6EwcDVHNor08ba397xyvQ+ksvy1NJd+AEPI=;
        b=tp8VLEFAWFtm7gvfb41ogrL03Fzs9DAKJq74xFG205vnD5uUmUDpEXsh5CKGUjgbCf
         +yHx6sC1BY6NHj0twuiEmq/Nc5HROuUm2rQ9BiTu3XEG3gFHezG+dGo60aOVZ/fN3vjd
         x18Ftwt9rDiV/5FnDjYAKJAjcvrLdVkxifeykrWShu0zHWAamvAD71h2Gh3Z5/W5+ib4
         9wZTBeRXd2SbRiupktb+LyXQ15RvwKbHMEio268W8eurupwbKOFn31NgJFv5hejJ2BD8
         xYMXSZBBNZjjSGo08xTxS3joHqi+cot4SavZELE0ulsMNJiol2u/JlY5Dn10wg5aWITB
         HneQ==
X-Forwarded-Encrypted: i=1; AL+hErG50DBWezsiWGsPfXY7rIrYq/VC9Ck7TaU/lLZJbN8h270qiFCEmlP7+UPpXDVsAo5/HW7Ll3kllRjYiHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NIONtL8lF/+Juu1rh6kokVU8cVRWQkxHhuAJHfrvrilxliFHg
	mRwcoCtbdUbai8GFznXL2dd67dDo6VMxJ4W76YsY1ylTTKXyv4vZsDoJ
X-Gm-Gg: AZFdTZc773MC3oB5CBxaIqdWDgEnr0VD+7mAKhx7VrTIMje9qia2fE40HeR5wNeHogn
	8PzHbYGEoTNyIAjakQpslTz++z9XyxMTJbj5uAglR4TlAuLfM/sHR4liVZV3DThkKyimWbVjKYI
	7Jst/0XEUjlUJBepufcVGdjJATtek8BH+3MDUYG8OsWu2/Xf7dU1wr2xDvA24KgqEHSkxHc0hC7
	i/CNvSnL0pbodmDgwFHIRG07WWlSfgHtw3vIj2i/g53VfTmPj3ZWm5Wr6EzrMSgQH3J0PGUO02O
	7ylNHy1TS4DfN/RlJ6v2JeCV59rQ5BZCRoj2lrocgPmuZ+Dc73UhhexgXTQ+ge+1Kiox0YS9Iz1
	RJM/ewv4GlGPR0Z01o4ZrKr4TD+tV0pDU1YjwHDaX7nRKl+oI1qvKD50nH9Vkh6TyKfbeDgCxFs
	6JCW81magagrJFtM0iiMk2xlOflFN/FqBRIMj6IApb4mdpZHtBW5jNU31gKjWIQ1F+SeQt+cEa9
	MnMW/dFO2i5dRIABPoal03D9E6R51Ey+zd7RdI+RszALox03bZchH3DayLqgdvGvnhMwQnzKps8
	p787Pcw7Q9n5h8YQsQRsmCsBSVxil5BXcVqf3v0fA83cWVMMWAMvPizzBkcdgcQuBhbOTRwjvQz
	dik/ou9zdCtutwa/f9XGs37T0ZwCH19q4cs+1k+CHisWm/rmIDyTR/SNco3RIYJdAijFS9gxHZQ
	pJ4fR+ze0ODDzst0Rvq3ebrCo=
X-Received: by 2002:a05:6a00:420e:b0:899:9267:3abc with SMTP id d2e1a72fcca58-8c87ce3299dmr18009522b3a.41.1795678281937;
        Wed, 25 Nov 2026 23:31:21 -0800 (PST)
Received: from kapoor ([149.40.62.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bff6sm10269088b3a.3.2026.11.25.23.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:31:21 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Ike Panhc <ikepanhc@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] platform/x86: ideapad-laptop: don't warn about keyboard backlight type 0
Date: Thu, 26 Nov 2026 13:01:06 +0530
Message-ID: <20261126073107.765676-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

On the Lenovo V14 G2 ITL (82KA), which has no keyboard backlight, every
boot logs:

  ideapad_acpi VPC2004:00: Unknown keyboard type: 0

followed by "Keyboard backlight control not available". The KBLC type
query (Arg0 == 1) in this machine's DSDT reads KBGC from the EC but
always returns Zero, and KBLC also returns Zero whenever the EC is not
available or LFCM cannot be acquired. So 0 is not an unknown backlight
type but the value for "no KBLC keyboard backlight", which the driver
already handles by leaving features.kbd_bl unset.

Only warn for non-zero values, and add the missing newline to the
message.

Fixes: ecaa1867b524 ("platform/x86: ideapad-laptop: Add support for keyboard backlights using KBLC ACPI symbol")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Tested on a V14 G2 ITL (BIOS GGCN55WW) with the 7.0.14-based
kernel: reloading the stock ideapad-laptop logs the warning, the same
module with this patch applied doesn't, and the rest of the probe output
and the sysfs state (platform profiles, fn_lock, camera_power,
usb_charging, charge_types) are unchanged. Build-tested (W=1) on pdx86
for-next.

 drivers/platform/x86/lenovo/ideapad-laptop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index d2344dcd6945..d5679ff2e8ab 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -2627,9 +2627,9 @@ static int ideapad_check_features(struct ideapad_private *priv)
 			} else if (val == KBD_BL_TRISTATE_AUTO_TYPE) {
 				priv->features.kbd_bl = true;
 				priv->kbd_bl.type = KBD_BL_TRISTATE_AUTO;
-			} else {
+			} else if (val) {
 				dev_warn(&priv->platform_device->dev,
-					 "Unknown keyboard type: %lu",
+					 "Unknown keyboard type: %lu\n",
 					 val);
 			}
 		}

base-commit: 61c0dac952b9308884936d05cce97565a5c89af4
-- 
2.53.0

