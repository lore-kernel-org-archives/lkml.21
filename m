Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471626;
	b=C2igu09+v4NjMssW7BtD5sTC8lev2Yr9s/+AwaZAWeDg/VjlU9KbfKNi4vWlLTLaRnBg
	 bx2d0SJjV2xGow8EZD8INPDA90foU2zGAkdxjdW4bNnVN0kSIyEVLR/WGKKaYg/oMZVSv
	 PkPyELllSVjVL30+sj6heBnI/j+9kelPucnYlHfqNNMUi9tlpQ5QzFMo7UfjgJ7ufgP2d
	 kQWBtWS8dxt5B/ojDr7SpsI3cxmp8OMTAOf1c2e8Nruhd0VG67tFhHD38x32eZgwbryzw
	 OiU6yvljbJUH+K3rHj4C88BdiZKcaA8RUx2vKAjb34QEZ1Te+NMO0GY6WSH9yWk4zlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2A2uXjB+0bzchrY2vV2nfV3+nn4kAAzYbCNxqbBXeCI=;
	b=LwNblcWRWqJAf8S/mdUTmNlc7a3E3p8XIDs9mmKtd9gAIUgb3Ct1CgdXmAWf6x4dyZpA
	 /xSzJfntPZYUN37bGIANbmqMHSujkG3VT9076JwUMlc7lf2Jx08uaQtL8c/m538StogDQ
	 z7jjNjerZPG4OJ88gHVUw5fn/K3OjIraSp66kkK6AHEOOawOfSkdtXUJFZQHk+pd8NB4D
	 yu0Zn7ozoeZYqCO91YuCm+Ombil0h7UVSsrXSNRMKoEsBOX4TV6FtEGgFDAnIEk6Rg3gs
	 XNPdfE/jGrXCtaDZpfIeUMCcS8vkNQQvfm8dFtE1/wGVCrc6S3ROHpby8sDehve/xcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b8mVBdXh;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6BC606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED6BC606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b8mVBdXh
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so3054264e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795471624; x=1796076424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2A2uXjB+0bzchrY2vV2nfV3+nn4kAAzYbCNxqbBXeCI=;
        b=b8mVBdXhorwXtY/YNR5kRqgbjNIC/yQbC7/YJdXpv7HkUx1+QYbk1AhzkZhr2Gi115
         1OxV/ic+O/1R1TbyXNPFXBYVELF2Y0JB4x+4Cib0X1cym5U/S7v3QiB9ej0etFkMqDvt
         vCuqo6EsXzT1ckyul4S8f/XMdLuZxBoV2CFgxybLsIP8PAb5DSkv2kCDzCWO831fa7zH
         uZL7/lqKUT3vkIyWKZGUQI7tImrY7/eSMUjBvk/eXGEv95kBIKkuLJSNnshA2vS7JUcx
         ioNjnjAfTRD/TGsu/digRPdtrr6HTpQQ1pfhHwySjrv8dAmwug3g2Cej/CUN9FYUjxZM
         /wJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471624; x=1796076424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2A2uXjB+0bzchrY2vV2nfV3+nn4kAAzYbCNxqbBXeCI=;
        b=GVhiwyo07joKgrWd77AyAVv1GCiK90caOsuvv7VsCwyCBgZsEj1M5e7shQM9oZTMII
         yfNG6IodCAGECvMtzqvLrV4ukXy7hYqejpaZDlOUPuXWnVeeOLA4JG2gwOWVkL8BvxjC
         ZWaGzlZ+0XdCr6qx85fDJpc+3BkLkrjq+HQvv1XRPcNpFMN5Y2Dt38N7ZTfRnOM45dpx
         cN7Ed1/ZwK2KaDmhhQGd0TTpcSx2U99SF4bDAtiDHVIKJr7sgdr4tN1mqZ7pS/CxqKWN
         FxYZMTvMxm94IjycZyBRLcfHlI93YM5jQdXpbaQd2+rSdbSkZDWbhjXmIX4c9ft0jcY7
         B97A==
X-Forwarded-Encrypted: i=1; AL+hErHuByhV/Fc0Vg5JKBm5rUZAhSn3tYJFKY6JmoTugWiuBiZjY0hfmp1Bn+yoCsh+ntXZ/kMhnyAq0S1+a/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x13xf39KN0gBg4kJF47mzEh8vOCBz8wgUP5J9FvrpXPlQvVfV
	a5Yi9kS2fD8XXBr1rdxzdOwxofckgsPW1fyRb15cDRrgOoLAqydoqgDd
X-Gm-Gg: AZFdTZeGwr4GYp1/F1AvrEuV/IUwrOVF4HGF71oZAZj3kdQWHnDwJViCxwcwZ5igM0W
	hzM/ZWUfU6l4gnNsMxw/ZA+NxwQpVWwnMG2B3CbN8B7YeegsY6QVuJzOR3wk21uMW9ts47LR9AY
	VGOItsk/5buUF8rXRPLMOv6KtXCJNK2VbzNquQJ4gc+0l3UExcI5oivymGoafOBBrntcnajhu3H
	Xfdmq/5Rev4qg+rPhfFltqzfeMT1kLMF6lG5WJhOuBerCGtFIqOCkUjUp04xfcrQh60IdoEIgUg
	bHJV8qaNdRaJguQrYWVOK3hVGAiIci1jQk9Jl+2hTlkXcvWUY8Y10a9V43LM/gMxCWRUlaHocRt
	Q1PSbDDQ+ZaKyQ+76GOd9hqcRLdgciYInEbyGrNWGc6LzMfKFGg3SQ72HOZ/DqW5Nkxp2KVkwk2
	vyQLwo9jSaukol1mUtKRqf3ZF2En/lUjneOItzGPwbGswSft6XZhMYx82z8B4Zj0QubjthuedLt
	lfBhvhnxyUfmpZ8ajttDSIxRINa+ZwBwYhhn+OL5Nn5ROGLu6JQtGUVcKjSkkZ6U9X850r7WDJt
	FU2R5WSzISDponiBjLlrO7/yWBtYbClUEgf0CNKN0TEsWNUiWpYSshsN5b54eo++fzxwROPFw6b
	NQ8I1Tsxk2WbF5hluaF3au2cl0bz0KMvguGl2CpSQfOBjW6mj6GdwVt2U5zc=
X-Received: by 2002:a05:6512:114c:b0:5c1:4bb3:afbc with SMTP id 2adb3069b0e04-5c1b7c42d53mr3575738e87.26.1795471623995;
        Mon, 23 Nov 2026 14:07:03 -0800 (PST)
Received: from yantra.. (nekmmqsyyquzw1lm5eb-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:3cd2:d52a:a1ef:5dd3])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805215ccsm34272021fa.21.2026.11.23.14.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:07:02 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH 5/7] iio: pressure: dps310: use time unit macros for sleeps and timeouts
Date: Tue, 24 Nov 2026 00:06:47 +0200
Message-ID: <20261123220649.36887-6-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123220649.36887-1-zoone.rupert@gmail.com>
References: <20261123220649.36887-1-zoone.rupert@gmail.com>
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

Write the microsecond values as multiples of USEC_PER_MSEC, like the
poll timeout next to them already uses USEC_PER_SEC. Wait the 15 ms
after a reset with fsleep(), which allows less slack than the old
55 ms upper bound.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index e5a89dac1325..eb5715f75e9e 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -20,6 +20,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
+#include <linux/delay.h>
 #include <linux/devm-helpers.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -103,7 +104,7 @@
 #define DPS310_DRAIN_MAX_MS	(2 * MSEC_PER_SEC)
 
 /* Make sure sleep time is <= 30ms for usleep_range */
-#define DPS310_POLL_SLEEP_US(t)		min(30000, (t) / 8)
+#define DPS310_POLL_SLEEP_US(t)		min(30 * USEC_PER_MSEC, (t) / 8)
 /* A period plus a measurement time; silently handle error in rate value */
 #define DPS310_POLL_TIMEOUT_US(rc)	(2 * USEC_PER_SEC / max(rc, 1))
 
@@ -370,7 +371,8 @@ static int dps310_startup(struct dps310_data *data)
 	 * They are available 40ms after the device has started
 	 */
 	rc = regmap_read_poll_timeout(data->regmap, DPS310_MEAS_CFG, ready,
-				      ready & DPS310_COEF_RDY, 10000, 40000);
+				      ready & DPS310_COEF_RDY,
+				      10 * USEC_PER_MSEC, 40 * USEC_PER_MSEC);
 	if (rc)
 		return rc;
 
@@ -558,7 +560,7 @@ static int dps310_reset_wait(struct dps310_data *data)
 		return rc;
 
 	/* Wait for device chip access: 15ms in specification */
-	usleep_range(15000, 55000);
+	fsleep(15 * USEC_PER_MSEC);
 	return 0;
 }
 
-- 
2.43.0

