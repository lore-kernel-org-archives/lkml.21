Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795474878;
	b=DiEfX7ZhCnbj606MyzjlFtUvkwrrmlF7YSiFqo4NZSbZTKiLHVdDLY28ltzjbvxZ2+sm
	 G8gMNZYwMJp5My93jg4zJBovfbCHHeV5jNKCQiP8j0hxBl3+D+rT/7mfPUhEHVpy0D/Zj
	 w+GQxE75XkG5XCo9zGWMVwoPrpi/VJXIzrAyYV0QSdinyd59jWugs5SqsH1liB4Jo/765
	 zCXUORY8jJjwqbDGfpQ07lhLnd8y8qA6RVIA0w5X9PpI3+cMaIBNP7gEdLTTSkFep/ibz
	 QKAkAQifzFqQdxMsYtG/7MDfEvDDP9TGL7z4OD/VAcvzjRjHq9QEOzj0iNeUmUvYZnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795474878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fhqNj5xrThDOL0uCWjCUGvkw8GyT0Wc2ZFXSoJZgs0s=;
	b=ZcA3csIbn81WmpFtsPc0g/uE3iPQ1gOc97xaR5ffWeIPdDantSNC93jcHwYZg+MX7NjR
	 OeIoKT4YQxO5pAjg2MJp68TXe6CdMNoWFKXFOSard9+QchG/jyM/Z3HsZz+FXWjm34O7B
	 hF3Rm2vELrnHFPRP4FBcidspWn/ihBaMmVUiFZ+A4b/W4p6gKnlZ8HMANQbd4z2Gxstzs
	 c3JtmdLoMMfGURw9I1fxNrNeAqaZbufA0oZjihEXByU5Q3Dry7eSAnwObHuartEFU+p0K
	 ooJSqyP8UEnd8yPrV7aDbpfagJ7KZdUI/bizIPcmYvV94/NnfLBGrOgiu6a4KLe/CyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xYQ4Btq9;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69423606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69423606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xYQ4Btq9
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38190551625so7939629eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795474878; x=1796079678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhqNj5xrThDOL0uCWjCUGvkw8GyT0Wc2ZFXSoJZgs0s=;
        b=xYQ4Btq9kSKp2mJmY5JQzel+/qNkm5/FxBfK+fuxwzVMuAvISh8qniZk0GYnBTSGDY
         iepmZESq0yf9pkcc0b4cNigziP3fBZhqCYDYxUI7jLT0D4w3sGaVLSlvvwCHknmbJYgf
         9QRjUEQOUugDhXR/LK6mNctn6h46gikyAL1ddACimIz/6w/F2DL268nwSZJbNgtyr/JL
         GSEeGtwbonWx3K5NiWksxQ5WXgTHdtPlFvvjrRcdFKjeX4kES5R1ynQCHePRWD/mIK5U
         +kisHB493odXjszQHoXwb28SVCEQiZ1KFAXgU9DArAaEN8kJ3Dl0yEhy3nQ/69ZubLMz
         YKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795474878; x=1796079678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhqNj5xrThDOL0uCWjCUGvkw8GyT0Wc2ZFXSoJZgs0s=;
        b=VBYVh2QM1mnkYOcdszn0yGcOMwGv13MtpmlQd62Ou3sGpDSp45zQs0tdpilBKfhlBl
         /ypspNYOz1Vt2KygmEs2ia8CW3dr9z6NbuKzarLBEf+L1WELyDiNww8cVfPrZCXWCk1B
         aSuNS0YKvLQgsIvWc/T9Lvqt+5/bj/cue1jZbHtGYfw3XDZvhEMtN7c5A2Bmf0EuaFOg
         AJzVUdLB7/Xt6L+54EVKuOgVwK4e4FGrABmKSC7VmhsA/YWiBfC4Q/fUTfO9cQw/XJi2
         3GhtoYVj19NbGrtfc0vy+7ddpqE/NX8w+GVlfR6SIUSGkR7TDVWUEtzMqvvbbBqTEyzt
         JdeA==
X-Forwarded-Encrypted: i=1; AL+hErGKwM/8zcuL/o0Rlexv3VdeytUlZIj1oviQvGBEJ5mMumIvPE2t9ZBp45ImFtxVlbZjff60wA33CTpz9EE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3gAfCtn1e+xAxfiQg8jnxdc2fXXTP/btSTh/1qzRPnRFqCu5d
	GdXcGk+MC1TOtHjseE/fnpFsGsjeWutV7IMlaKB1RNUxDC098lyKAPZs
X-Gm-Gg: AZFdTZeY8L5XDNozqWSn7kRK7yOIlwUQCT8CmTLXXOzJZPR3MoELMq/iT3J247pDH7L
	97zaT/hjW0RuhMHGkM0zeqEOqWgWaZs8ZOe/kILx9uJw64Rv4Xf3H1tqNGGcY7IaTl1FETn03F1
	DLd64PgpJRL1ugdecfc6BS6uThl/7oxh9PEDBlKNYAPFcVCMV6xSqQocwEIyrOaFtqT3B2BhJfz
	IuSG+k6C0VwBolCgHECSVlT5yWi+iWyuV83Slvy3hZ96fOwEJasdTGjl5nIykt4H4lr0QRAQWlF
	wHTYXVtRDbtDfHQDHJNfTc86zAV137K1hIWQo2nzGYtjvkSovD5nrR1wZ9V8ph+uItXzlwgDsFl
	UgmELdkaxEdkLf1vcnnwEoFKw8fOSC011ZeJvGGz+0NZtOBhE1/QU9+GAVYYGtbhNTLDCFCkCGk
	nm8ZR7l9wszgwND3thwY43XlsvFtA5Lm30mOCn7fZY2soKNR5QQx4D7wi0DEL9CNyEIQpYdr0fv
	s33MEeL6CyybkztBtuXlWg1fJQQdTYOtyTvZCmLzgIkfHT11ZhT7FgrZon1KfloDwIrOPJ/XKi/
	Y3pDRJ+Ht1NQLex9WMCeCkfEpJQhuH/TKBml1yNWK9i/MZ/uLk+WA0av2D6wUAoX33XO8eDWKbi
	f5O640Vtfzl3yb6dXIQ==
X-Received: by 2002:a05:693c:808b:b0:386:3535:1dd with SMTP id 5a478bee46e88-3863535052amr11576876eec.12.1795474876743;
        Mon, 23 Nov 2026 15:01:16 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm41359262eec.22.2026.11.23.15.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:01:15 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 23 Nov 2026 15:00:57 -0800
Subject: [PATCH v2 4/4] ASoC: arizona: clean up coding style and formatting
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
Message-Id: <20261123-arizona-asoc-v2-4-6323d3c0961a@gmail.com>
References: <20261123-arizona-asoc-v2-0-6323d3c0961a@gmail.com>
In-Reply-To: <20261123-arizona-asoc-v2-0-6323d3c0961a@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.17-dev-dd645

Clean up minor coding style issues in the Arizona jack detection
driver, removing redundant parentheses and fixing argument continuation
alignment.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/arizona-jack.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index 5650a7f47ede..6f2286eb7cbe 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -423,7 +423,7 @@ static int arizona_hpdet_read(struct arizona_priv *info)
 
 		/* Skip up a range, or report? */
 		if (range < ARRAY_SIZE(arizona_hpdet_c_ranges) - 1 &&
-		    (val >= arizona_hpdet_c_ranges[range].max)) {
+		    val >= arizona_hpdet_c_ranges[range].max) {
 			range++;
 			dev_dbg(arizona->dev, "Moving to HPDET range %d-%d\n",
 				arizona_hpdet_c_ranges[range].min,
@@ -436,7 +436,7 @@ static int arizona_hpdet_read(struct arizona_priv *info)
 			return -EAGAIN;
 		}
 
-		if (range && (val < arizona_hpdet_c_ranges[range].min)) {
+		if (range && val < arizona_hpdet_c_ranges[range].min) {
 			dev_dbg(arizona->dev, "Reporting range boundary %d\n",
 				arizona_hpdet_c_ranges[range].min);
 			val = arizona_hpdet_c_ranges[range].min;
@@ -833,8 +833,7 @@ static int arizona_hpdet_wait(struct arizona_priv *info)
 	int i, ret;
 
 	for (i = 0; i < ARIZONA_HPDET_WAIT_COUNT; i++) {
-		ret = regmap_read(arizona->regmap, ARIZONA_HEADPHONE_DETECT_2,
-				&val);
+		ret = regmap_read(arizona->regmap, ARIZONA_HEADPHONE_DETECT_2, &val);
 		if (ret) {
 			dev_err(arizona->dev, "Failed to read HPDET state: %d\n", ret);
 			return ret;
@@ -1143,7 +1142,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 
 	if (arizona->pdata.gpsw > 0)
 		regmap_update_bits(arizona->regmap, ARIZONA_GP_SWITCH_1,
-				ARIZONA_SW1_MODE_MASK, arizona->pdata.gpsw);
+				   ARIZONA_SW1_MODE_MASK, arizona->pdata.gpsw);
 
 	if (info->micd_modes[0].gpio)
 		mode = GPIOD_OUT_HIGH;
@@ -1155,9 +1154,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 	 * will reside, but if we devm against that the GPIO
 	 * will not be freed if the extcon driver is unloaded.
 	 */
-	info->micd_pol_gpio = gpiod_get_optional(arizona->dev,
-						 "wlf,micd-pol",
-						 mode);
+	info->micd_pol_gpio = gpiod_get_optional(arizona->dev, "wlf,micd-pol", mode);
 	if (IS_ERR(info->micd_pol_gpio)) {
 		ret = PTR_ERR(info->micd_pol_gpio);
 		dev_err_probe(arizona->dev, ret, "getting microphone polarity GPIO\n");
@@ -1189,13 +1186,13 @@ static int arizona_jack_enable_jack_detect(struct arizona_priv *info,
 		regmap_update_bits(arizona->regmap, ARIZONA_MIC_DETECT_1,
 				   ARIZONA_MICD_BIAS_STARTTIME_MASK,
 				   arizona->pdata.micd_bias_start_time
-				   << ARIZONA_MICD_BIAS_STARTTIME_SHIFT);
+					<< ARIZONA_MICD_BIAS_STARTTIME_SHIFT);
 
 	if (arizona->pdata.micd_rate)
 		regmap_update_bits(arizona->regmap, ARIZONA_MIC_DETECT_1,
 				   ARIZONA_MICD_RATE_MASK,
 				   arizona->pdata.micd_rate
-				   << ARIZONA_MICD_RATE_SHIFT);
+					<< ARIZONA_MICD_RATE_SHIFT);
 
 	switch (arizona->pdata.micd_dbtime) {
 	case MICD_DBTIME_FOUR_READINGS:

-- 
2.56.1.809.ga0b61035b5-goog

