Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167866;
	b=m0IKFRqFCjGwdCea3lIHg1FNwazi8uYLIOW03zptqDjMHPh6BqyElW+xCB8sM0J2xDgv
	 lCS6bIzCSiuGSDSYh2vClFMyc9tfis2y4bcYjvQhyHF5cBGfz4bjATXlkAWB6yRahooNn
	 t3SoMQVQ2zYElR4GiXZku9QafuJ4LkrtyGEk5b3IHhC+wfNxd/8os35vR6OxD4CqLurFS
	 qjdU8qo6tSEAbXK1ror+RRs7EYVcUJ99Q/2L06HKsiDCtZedER1h+eCfGevfzrJfHyWy4
	 iX3SGicEhZ/N17JN8vvuTcij69JvHWfnPdeOcnF3nc6h2PuAvgO4TGASjJfZBK3KmxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3cCgqwbNvrgOhuXLkkf/Vlhr66lfaezWECzWianZik4=;
	b=BlF/YDHA0XpA+YLHWZRJo2QMs2rNc65UHtA7dUWikFG92mtFIllA9YDXAXe7VqID9fSH
	 j/+zfrtim2ZEE9WliN1tTc22LcEgc1WyRXN4Wzxz9Xjf01ZyUYIcVYlWJtHnF0C0avLu3
	 8zXiNe8SWUMs8SF07t6itTianQR8Oa7hpCxHPn5MybzaggIPS7omcYM/lhTgBXWrmtkQ2
	 RjAs3EYezSwpcsqlCtrg2Kga9tbFmQPOTB8AJcbFbwAu3UqF2qrvYi9o+beznsnysHfAx
	 UWtRidmshmc1CKL52VHw8T/wkhU4UC3C+TOboCDZYivQt/LoGmKmKAyaLFrHzGwhQfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ddcU1O7z;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40746606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40746606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ddcU1O7z
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a315ed211so740586eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167865; x=1795772665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3cCgqwbNvrgOhuXLkkf/Vlhr66lfaezWECzWianZik4=;
        b=ddcU1O7zDzzRsmAjkyUl3JiKnqOVKUs14aQ4k3kKTX7rgQGYVCmBzrAoowQbwhdc5l
         QMts06I2dY5a53fGAwPWlag7qO/IJOa9QEeKnvRKogh8V6qAUq5Ic1Qwjq16g3Fp/mdF
         e62n0ld8os8ErmUEBXMbuTQtzG9WVyM2dCDIRnRIN/A6kbC//ijmE1mnH4hLG0yKFyRu
         OalIMB5dmB/4MOGNADS42QGb2/THUAY5ASo8Rldtz06d+S6mRwkUEdVu1FLxN7sTaAOv
         fgAA/0mjpAvkngYV+V6yXuAS+bFPLvVPCXw3Aal4Xo9xUNhR9XpmHRGXx/oFdTeUlUP4
         QVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167865; x=1795772665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3cCgqwbNvrgOhuXLkkf/Vlhr66lfaezWECzWianZik4=;
        b=A/KBLzmW0OJ8yaFJHNXXNm2wOBMqgb8kYBTIcVQJZN0rvLnNTO33yaso95I63Si7xj
         dOqeo+mhw0LWULo+NWbhXo8rOgAr2X0H5ba5azTHrflWBI7hgZ5TWImgTm2c5GwP0B8F
         zx2PCxqQPLYvHNBXS7k6P9tcEAZBzJBMQyMHM+R+BDjV9b1+9p2NX/zlSlJdToCqGPtq
         gVLnvKnVDS8w1419zI8rrSxV6rEarHIpLEdqhFiT0B+LOM3ORDGm2Mr2FhA+z/7JWToH
         u3JBhuf7MX8iiQAdqjvVWrvrxpYLpW5zrBJwKfZrpo2Ai64IwuMeeXKe8NLxzRy1WasP
         gITQ==
X-Forwarded-Encrypted: i=1; AL+hErFI9NvS0O9O6NPjzE8hfZk55QvoHuCBlq21lyG1aQ3Krr1zycbJ2DSWhlYwy+bd/Q/Lae0d6zEfcZoacbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9R/UiTpamVDyEesnVXJQKpvRP5pSVmAjeUe4prX++5vVrriRDZ
	r2AYnWVA+axlB8Bn6oNOgBg1HbIUGX2OGb5r4k+P1FapgQgZHDWT12rA
X-Gm-Gg: AYBFou04NEGtBnKZSqAVJAP2fMAOP/rRIabdjG/lDKa6vCRYJtEsDGWVkXaMYV3+HHW
	pbtVutyPy5fJEvTKQGhDejHQURaVgf3aI5hXq79OCUHVqPvcUU1NA77h8Fr2pjBp0WG8mRsE/FY
	T+4AlDCH5qyYkKnWoEyOi2XI6JqQfnHY6k9Z7cTFxgr74eN8il4/n0qc5yksry7053ycWK5VhQY
	ATBAmOCdU5tIreUgjlw96ssyXC3MSLk8+mwVfYIfaEUlKLnY2pzAv0CY5fbCcsqwOvDBr/b9o+c
	GsFxGug12G2pzAC6EZAsuNpbcomqO20LgRt8rRDHowfDg/ixn9ovdL5irKl1IyBX6eIAnY6A72z
	e06GWBdrDVFMO0M3pqq8IH8mnNZb/z+TRZTu72VIu3Dhpoq+8f2WU6YxKS0Foq60pHWEw09coe9
	Om+huMGaANztXcRHAHE5EFgPMa7+zkHLYdfZaoREATrOtxFRB2OAwAZRjBp6yzKYngj5edWXV1g
	6DV/6jKQHHCeGxn/B8fHfeItgGKQnxcpNropfTluuowb2/mqxx3gNCEhwsHG79IHKuvnuQn2/3l
	zFYHKnLGTymHajE4MKaJvXL8K1E/GKQ5gPVhZueSZiupUMb6gKdqNgrZa1ayS56lXZxQKqohiMj
	E6TOeiwtF7j9F+Wi+RfYOPyAThBzN4KB9n3qW3hQdaefuGWzN/ZoVV3C3YJZ/hmgNLA==
X-Received: by 2002:a05:7301:dd8e:b0:386:6c8e:b4f7 with SMTP id 5a478bee46e88-3866c8ebd4bmr51424eec.12.1795167865186;
        Fri, 20 Nov 2026 01:44:25 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm3982974eec.13.2026.11.20.01.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:44:24 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] ASoC: atmel: mchp-spdiftx: Use devm helpers for runtime PM
Date: Fri, 20 Nov 2026 16:43:53 +0700
Message-ID: <20261120094354.6814-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120094354.6814-1-phucduc.bui@gmail.com>
References: <20261120094354.6814-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Use devm_pm_runtime_enable() and a devm action to handle runtime PM
cleanup automatically.

This removes the manual runtime PM cleanup from the probe error
paths and the remove callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 46 ++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index 6ab32f0b8b8e..b034bd46cd5a 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -778,6 +778,15 @@ static const struct dev_pm_ops mchp_spdiftx_pm_ops = {
 		       NULL)
 };
 
+/* Runtime suspend the device on cleanup if necessary */
+static void mchp_spdiftx_runtime_suspend_action(void *data)
+{
+	struct device *dev = data;
+
+	if (!pm_runtime_status_suspended(dev))
+		mchp_spdiftx_runtime_suspend(dev);
+}
+
 static int mchp_spdiftx_probe(struct platform_device *pdev)
 {
 	struct mchp_spdiftx_dev *dev;
@@ -836,11 +845,22 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
 
-	pm_runtime_enable(dev->dev);
+	err = devm_add_action(dev->dev, mchp_spdiftx_runtime_suspend_action,
+			      dev->dev);
+	if (err)
+		return err;
+
+	err = devm_pm_runtime_enable(dev->dev);
+	if (err)
+		return err;
 	if (!pm_runtime_enabled(dev->dev)) {
 		err = mchp_spdiftx_runtime_resume(dev->dev);
-		if (err)
+		if (err) {
+			devm_remove_action(dev->dev,
+					   mchp_spdiftx_runtime_suspend_action,
+					   dev->dev);
 			return err;
+		}
 	}
 
 	dev->playback.addr = (dma_addr_t)mem->start + SPDIFTX_CDR;
@@ -849,7 +869,7 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 	err = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (err) {
 		dev_err(&pdev->dev, "failed to register PMC: %d\n", err);
-		goto pm_runtime_suspend;
+		return err;
 	}
 
 	err = devm_snd_soc_register_component(&pdev->dev,
@@ -857,32 +877,14 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 					      &mchp_spdiftx_dai, 1);
 	if (err) {
 		dev_err(&pdev->dev, "failed to register component: %d\n", err);
-		goto pm_runtime_suspend;
+		return err;
 	}
 
 	return 0;
-
-pm_runtime_suspend:
-	if (!pm_runtime_status_suspended(dev->dev))
-		mchp_spdiftx_runtime_suspend(dev->dev);
-	pm_runtime_disable(dev->dev);
-
-	return err;
-}
-
-static void mchp_spdiftx_remove(struct platform_device *pdev)
-{
-	struct mchp_spdiftx_dev *dev = platform_get_drvdata(pdev);
-
-	if (!pm_runtime_status_suspended(dev->dev))
-		mchp_spdiftx_runtime_suspend(dev->dev);
-
-	pm_runtime_disable(dev->dev);
 }
 
 static struct platform_driver mchp_spdiftx_driver = {
 	.probe	= mchp_spdiftx_probe,
-	.remove = mchp_spdiftx_remove,
 	.driver	= {
 		.name	= "mchp_spdiftx",
 		.of_match_table = mchp_spdiftx_dt_ids,
-- 
2.43.0

