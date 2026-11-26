Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687678;
	b=ZulPmV/DLKpkhNasnZp+qeQd6m6BE4klq9177EgCb4FsblrYZETsmEtdCSlQpNtr8ZBL
	 p0dFCu0Dpj6dmhIv12Kp3HF5AoSJ1DB8f1uJaPUR/MSYALrFTCiT5wtyn7XrNTc3+sjpC
	 UPsKEq3Dmb+/GSGot/vRA2WlHTjC5Mzd5uFGq/IS3vEdUIjRpMMKUIu6VeYj+HkTreNiT
	 3p7RsMb0TrprNKvMmrYTT0wa1hvd3RnearEppsjrKXDEw4QeMYvkc8fcBhb8OSPzQbAls
	 mun9gONO/aiW9txUgTqiZR8X5bkUt3IQTjINC+db+2DAPHsjmW/lReKtC4jTeahVxEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ArMJaHbGKbGUeWN7hQdiXN3NlwJTftX/zR/PjftffQQ=;
	b=fLNrIH6+72zfwEtSihs1hPaabvd1eqVUHA2vqKkAut4mkXJUt3UkVkg8o+KzxXxQoTEV
	 2ZeIXZXzl2HsHeGP+B3+agUXPV/CWnLR+i7/jN9uWbSGDzL9inLgCYPF2DVWzp0pRiMMS
	 p/FTp3JCmSJ0X0+p1MLJPu7iE6SgjU7OIHTfvu8MjnRdMSYqmqjB3Gk/l7HYTlbJl4md3
	 0asZIeIcC+CfurSHfiD9I9EZx8JQNTWTygtvXx3KbP3IioS0goYy7DuSiFrnZkStoFDF5
	 wwkDkoPSP/9j1/ZnpwLCRZSCDFzFDjOgdZH1CER15MuJF4l5//y/zkdcyHiDBSQ+dXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w46mzF5J;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98776606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98776606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w46mzF5J
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cde84cb8803so1781302a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795687677; x=1796292477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ArMJaHbGKbGUeWN7hQdiXN3NlwJTftX/zR/PjftffQQ=;
        b=w46mzF5J+Zb3vlWvyPSfXQBrGfJNedr2fndhCnZ5+RIxtlJODp1cYYmGnYRtQ/6NKN
         n6PTJJcC7yI6+wa/NUD8DqgA0c1qGLfqsZ9aHyMlEcTBv8qCQWJIpWxrzBo7bm3JUYOt
         KfJW7S3RbgJW65qqhzlvAwEVLMcDLUen/90e7csP4Q2yfLV+M+BxwvC5BYUWFCr70VZ1
         2qIRW7ZnW5IiQqwhhtcFVFFB00vB2ch8yp9X/7TfEoLgzhS+Uc57T87BAdc/tHE88R1O
         koApybaHMm4CEEVl23oaFCkp8wS++kfkkgj0QtucMMuK38ixWPGLDMYj7FQAjYzFSQ0h
         gSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687677; x=1796292477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArMJaHbGKbGUeWN7hQdiXN3NlwJTftX/zR/PjftffQQ=;
        b=Ih0RDha7ibXhKjmABQkALorxiXQSChAQD53/NrHrBwd2uKiVZh4riFzk1qcQUBvFr+
         qlET5E9M2B70jok5afq28etbV4s8zzsYP7bJHC3BAuSnEBoC5Z21qMqXpphbDJtlune1
         JqfQZRwGRGGW6gaCCSvJdPGVd1PokqmPXY6KPJbc56vC/Zt+PDqovlSCnuKvT5661w6z
         LsHSA23NlsF2panYc82cRHgpBbdqDtgZfYOgoSqmHGVlUArjPYpFt28esU2ipbe4uV1H
         VXljpu3vpNjit5NBs1Ad34fHk2Ry3iNBoGJluQUfjxV2izkJfQNkEy5coFwt7jAm+rOt
         aizQ==
X-Forwarded-Encrypted: i=1; AL+hErEir40yvmdeoDHENYU7UVxQDgrJBr8dRCsQwLnMIdD+LAkSMLEEzsuNa0d0mRWcuonN+CGafce8la9ruas=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1MNmIBXt65+4TAmt8QNcs/77X2wIX2soRHMq8O8bKa25pzOCn
	RprNhW/uQVc6XOTfDruoE3cXsqivjDVqoyzhxegbp9s04cLtJ1fTQ+/n
X-Gm-Gg: AZFdTZdYX9ikb+mbMNcbWkTU6FvJeMKgE2DiEqFY76OtOxtQUFqJP0TJKvBATOVgsp0
	5sgmq6y9cxmgm5X4glikQ+SYakdhWuNdvexjnjDksnZgbZzrL4TVYc60t3s8OdjhQM8kB5RVYov
	6dEM60c9now2hYr4HVoL6594enIFfFf7BFdEpGzkcMtsGmGLXQ3azgNwtp+QBMB6NOE5594yLEr
	cKCLF868jLLV0OQdiJUAWw32xDq5McnHdyw203ge6DktgYDvj5Phsqr+28LTU3xlOzOtib8iJQW
	Y2Pjk6Z55JLzdHCG0HQuadh71xMngzNCCl72YBFqs4dRrWTCMm6/hHcYe83dZQE5IW/P9Kg+6PE
	8GMwIopCWe8JX/Upvd3TU6U37VmNrSZR3Ghxm79pnPBqBkmLSFjyLK9y0DHTWhmGMczX/C+Xovt
	flwVXv6EMW8to0t8lUT/Wmpyzx353qcyzfkB2Bp9iO+KeTNw2YgwEAVywAclJ67Us9hxO8iX8J/
	hja+u1RPin8CyUwMX6kX369WxBHOVp4ERGynhiqFnDNOUmrodG+EelX9U+tjm7tyTL9mVbnQqJ+
	HteFaColLCvMCvazulKrDWTfzglAopE2XberruqLKN4VoF1NuLa8Sm1BwwRYvZVSLuQKO6ktp8/
	8T5ZAb5c8Z3rCMsa1jX5sqKAFr8j8noBaFbexfBkPEsbn
X-Received: by 2002:a17:90b:5109:b0:3ac:9c37:942e with SMTP id 98e67ed59e1d1-3b41c953f98mr21178436a91.49.1795687676930;
        Thu, 26 Nov 2026 02:07:56 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm15034992a91.3.2026.11.26.02.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:07:56 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: stm: stm32_adfsdm: Use devm helpers and drop remove callback
Date: Thu, 26 Nov 2026 17:07:30 +0700
Message-ID: <20261126100730.10594-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The components are registered with devm helpers, but the remove
callback unregisters them explicitly. Use devm_pm_runtime_enable()
and drop the remove callback.

Also get the IIO channels first and register the PCM component
before the DAI component.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Note: Compile-tested only.

 sound/soc/stm/stm32_adfsdm.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 083dc4c26274..cd54fd071b2b 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -336,12 +336,6 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, priv);
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &stm32_adfsdm_dai_component,
-					      &priv->dai_drv, 1);
-	if (ret < 0)
-		return ret;
-
 	/* Associate iio channel */
 	priv->iio_ch  = devm_iio_channel_get_all(&pdev->dev);
 	if (IS_ERR(priv->iio_ch))
@@ -357,19 +351,17 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = snd_soc_register_component(&pdev->dev, &stm32_adfsdm_soc_platform, NULL, 0);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = devm_snd_soc_register_component(&pdev->dev, &stm32_adfsdm_soc_platform, NULL, 0);
 	if (ret < 0)
 		return ret;
 
-	pm_runtime_enable(&pdev->dev);
-
-	return ret;
-}
-
-static void stm32_adfsdm_remove(struct platform_device *pdev)
-{
-	snd_soc_unregister_component(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
+	return devm_snd_soc_register_component(&pdev->dev,
+					       &stm32_adfsdm_dai_component,
+					       &priv->dai_drv, 1);
 }
 
 static struct platform_driver stm32_adfsdm_driver = {
@@ -378,7 +370,6 @@ static struct platform_driver stm32_adfsdm_driver = {
 		   .of_match_table = stm32_adfsdm_of_match,
 		   },
 	.probe = stm32_adfsdm_probe,
-	.remove = stm32_adfsdm_remove,
 };
 
 module_platform_driver(stm32_adfsdm_driver);
-- 
2.43.0

