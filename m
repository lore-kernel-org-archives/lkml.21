Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773118;
	b=qB3w54tqfSekrIjgVDKjmJaFx9N+BunMhPhzcHVKj6Sj1yiRZpIwd0Oi/LV/4OPEIMLG
	 NKMYE61eY8vTaTPlPZDxtiSPdUBOtrbWSltIvVhEP1aLMOPtw5znrG6SG3Cs59o/jkkUU
	 0wYd2fDtQKmdfwYAGLvemKOwywTSx1uXSVWqf8Pe5qQlFksxxb2pOjDvJZfac1ryx0UgP
	 8i6XfKX8PKVCFSaUDhyjjee6Qrahr5lizO7lt2MIXQwvYGrwLj0QWBn/wRYl2s3ahB4HA
	 DcQUDPjXlATR1nIZsQA5czjDxH9ilu1hjT7fSXt7Hsvc5jRvtfQ07Fegc0LohxZB3MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iWPHJy9iFbePXvxdAN2Vzrm7k7bmXFBAq/ZLtmQXYUM=;
	b=J0OcQlCwYm8zHqZSwpcoxmikmO46JL5Sh7HxOkmJp18HWGJ68h2nGp9uQ7uIgEpIOLjI
	 QgP5xNnvu6MqZo2WFh0QenPphUi1uwqU9m4HadxGvFexf8v9n/Z02n7ZdbqQKatE8j+ik
	 Ogor7M6rh2EpxLQlVbhryXMVKOk0/pr0+Nerb5aHZyqKgZ29vnjx7+0Ml4eN1M7scnFrp
	 U7UABx5zo3d7BXe1jROC59HJ2z2YBDjC/V/Yx35H+dhRZ+93z8/x+ATo8XBYS3Gl7ExG9
	 GFSXsTG+DrP3SDUfSzNax7jZO2yv3OV+BPUXfhb6NK2+TlPdfzFoRGlPbhN9QrSu/cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzaZFBqv;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DF4606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3DF4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzaZFBqv
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b563e32936so3770834c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795773117; x=1796377917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iWPHJy9iFbePXvxdAN2Vzrm7k7bmXFBAq/ZLtmQXYUM=;
        b=kzaZFBqvVJ1n0WS3G172UXYxvJKiscfG4ZP6abKEXwtGDQ3XzuyUxz5VOG00PQGwte
         jo7S3tIjrM01nKxb90xf6i0eGB5uHzEzS2vbcS0ckp4W8Fh2KIGUXtZWlQa4MeBTUQdb
         Cw6UIkVR+BksWEifBD73LZI6ij2jBwbEP8UnG471LDR+u6v1n1OXvCGmGUmBG4DNwtIw
         5Fx3m3Dx1rRxcswObLEv3qJoPNcVP2bagkgUMeuBH2bbO8uEfgpXp2Blz+oNtHXSsjQy
         5lxS2l9E4URZwm5b9HUrAwr2guuPJSCgifvrW8pB8X+PmxmIedB7e+6TiToBx+FkEnD9
         6ubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773117; x=1796377917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWPHJy9iFbePXvxdAN2Vzrm7k7bmXFBAq/ZLtmQXYUM=;
        b=OK4ClFw87bfbBF5sFitQlPchgM9RKwEGjRQxVE9X4absuqgc94gM5JAKvhrMFkFYwN
         o6UTy3o+4w/L9zPDmfPLnNgoyhef8RNrF5gyI3wiuZXejqewqxi+Zt3L/A3MWI50+wvI
         HJqVOhROlfvKdtg6cT7h6XC+mpwNCOf9M5hMeSJHAMGO9Kt5J7YJRLKW3SYD08mV2iFc
         fDIJbQaFrE3NzH8CWjkto/PS9TjwpCJFs9xb4ckP5Cv9an29CPgO69K6thHuLWALiM5m
         V/IA7H7kn4nlSor2l75z3bwBGxSLbNrriRdUH/p0DghippBWKVockImXEb2O4Hk3gtv8
         wV0g==
X-Forwarded-Encrypted: i=1; AL+hErFo01IvTOkaNh/JsS33pS5tishgmcG7GCWT0cyUA1pLhwLHw0rvMtT/5scnHBc6Q0XZyfRId9yEK9OgLRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FMFGr45yucckdXaUe3ZS2BYPIc1nBMEi8QtbF31UDpOVEvkc9
	kuo4n3MAMDzN8VnhyY08serVY65vzX7an5R0iS/REpUkpNgsGY8bK6LV
X-Gm-Gg: AZFdTZd06LQ7olngz9iK7kOKF/qCZNGahnzUWnQBp2sErVUNBdWdMVtC3h5x5oUfEna
	Mbpu+quPrz9EwjXayG8jL8rOM6ZvYgKAjOIUuT5iyM0IhOu4e3XTCTR98YvwOHkaBfSo8CRVh3j
	yGsazDfMqvGYNutndEkz4j4Z7TJQfxTP4zmodb+7ZPsZ1z1lqA69xDcRgmaFQJQsOA1kQILQGUn
	NwrOykchB15FK2LuRcPHHP86xjFUwMzcIhip7kMQATOgNS34PjoUUAM6TH2H2Jw3s0Sf0FnaS1d
	P6EyCiXev1s1QcoyFXfemaXfu1DCLrD9Cd95vpc/XlEkW4F5KtgkNXtc3Z/I0DOcR7boomM/OXs
	LH+E4bJ3DKRApJ8aNb/NZ8tA7AJUZ0j6msdGankrlMRmauO8rKtgivOSW5g8lK+aZTcW9j48XKY
	4mpfpUACtvGUZCcNNNBleJiV36TIkVEhvWMTxOdqdFHKol3eBEiXJJB90d2GWVRzKbvgtLmVtIN
	mkt22MvlMtUqgp4Ii9HHKj4EBudkvEefHVWvTkbLc2eThooKqAQkDR0DlesLoZiG6Merrlia927
	+9AwoKrMaCWdcoxjBS3fe3ZWCgm0uJlXJUtio8LjK0dChcCIT9UlWXfjR1ITRrL/wPNmVps4lA=
	=
X-Received: by 2002:a05:701b:2901:b0:1b2:529c:5b6c with SMTP id a92af1059eb24-1b563e5cbafmr20921407c88.14.1795773116771;
        Fri, 27 Nov 2026 01:51:56 -0800 (PST)
Received: from localhost.localdomain ([103.177.252.209])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm63459721c88.6.2026.11.27.01.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:51:56 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	alexandre.belloni@bootlin.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: atmel: ac97c: fix reset GPIO error handling
Date: Fri, 27 Nov 2026 09:50:29 +0000
Message-ID: <20261127095029.3280-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The driver currently ignores errors returned by
devm_gpiod_get_index() and continues probing. This can cause problems
when the GPIO provider is not ready and the function returns
-EPROBE_DEFER.

Use devm_gpiod_get_index_optional() to handle the reset GPIO as
optional. If the GPIO is not available, the driver can continue using
the internal reset mechanism. If GPIO acquisition fails for another
reason, return the error using dev_err_probe().

Also, check the GPIO descriptor for NULL in atmel_ac97c_reset(),
because the optional GPIO API returns NULL when no GPIO is assigned.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/atmel/ac97c.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index 234549e17351..3ab6ddb3259f 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -670,7 +670,7 @@ static void atmel_ac97c_reset(struct atmel_ac97c *chip)
 	ac97c_writel(chip, CAMR, 0);
 	ac97c_writel(chip, COMR, 0);
 
-	if (!IS_ERR(chip->reset_pin)) {
+	if (chip->reset_pin) {
 		gpiod_set_value(chip->reset_pin, 0);
 		/* AC97 v2.2 specifications says minimum 1 us. */
 		udelay(2);
@@ -743,9 +743,13 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	chip->pdev = pdev;
 	chip->regs = regs;
 
-	chip->reset_pin = devm_gpiod_get_index(dev, "ac97", 2, GPIOD_OUT_HIGH);
+	chip->reset_pin = devm_gpiod_get_index_optional(dev,
+							"ac97", 2,
+							GPIOD_OUT_HIGH);
 	if (IS_ERR(chip->reset_pin))
-		dev_dbg(dev, "reset pin not available\n");
+		return dev_err_probe(dev,
+				     PTR_ERR(chip->reset_pin),
+				     "failed to get reset GPIO\n");
 
 	atmel_ac97c_reset(chip);
 
-- 
2.55.0

