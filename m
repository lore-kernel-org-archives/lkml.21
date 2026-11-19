Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084476;
	b=fnVPgqxHkvFESzYp7JD/2LKsEguTs19IuwTxVEF1LwdFYCaj9FECc7/PZvgVx8easXws
	 rpNO4mx6jNXC3W84s2iUBl9fbBVNkosx5rw78Ayl9WO1LO+s+4WDA6pSDCULcgCDyduoO
	 QmNTWxnXYHPtrNqEN5kyZQNs3N4X3PepDmBwLXYv3dmnoYqaXqyZuxKHtv1Gzx6101/cS
	 KjcbC1H06348K4BPuwzm5OLWk0LfJNseI8KjQ/JM0Ujn+B0j6O8QDxlnq36ES+pGIteEZ
	 j2PsOUBn907vvQMZqBkkBkFIkV+le3BvSsjJrJtXJSN1apLoD+H62g9gh2htcuImrKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MwBH+eIxP99lWtxI1I1+C/1djt449J2HrlK8pIk4vKY=;
	b=qHvH3sRjzMLvmTUhhogDWvPh049330RgQq/dDKHA/aD8x0fb2CC7BYVHdjQKvVeZDtIP
	 xm9ERLiwhAZXe8VipWZSH3zuLtcIQ6YvJfaMSzi1E4/9qWTqXwV7ZwiZzzu/P0C/oBXDz
	 03nKe8+cGiJLkhbjrENWlhfvY7Ds5nf0XZYTUtEi1gT58qLGHdrP8FxHu62HuhMK3Buve
	 IBEPk9cpFPcwEpU8+y65oKgBCTCJ4w7CSQvpbL2RE00OWfEyzy1aZSRPHLMMra/BxvFnd
	 WKjnRHLwSrtBmxKOLAbDKFlWYNS0YzhCqhMELYTqU0kkpTs7I7lqr+MexpTSUDN4/Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TkE9GyLt;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAFB606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECAFB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TkE9GyLt
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e98798cbddso10022995ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084475; x=1795689275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwBH+eIxP99lWtxI1I1+C/1djt449J2HrlK8pIk4vKY=;
        b=TkE9GyLtgJ+C8SsUjgQ1bqK4um9+oagFPJyqajdckc46PJwgNI/t4Y3EiaNAK1LpnS
         2VN89k3LFlSAGegXC3+ZuxINJ9tUZ3PrUYvd3tG5jP8VWLvPFPfdY/5cCfnPUX+XmVP2
         lbFqbaBvpCbYCgNsetyVHF6ohl7G+kN7zqixJ2R5A41vdCCnQrWEpYPyEojCCsXHeyzD
         erOFvzfNEWNecFEDovBhr1xgTTEOgN8zF6KwmW++FGC9MdeARRC1HmQOJR49brRITlnA
         uGn2V7SFtuE3n+OJqZM/RWEB96ep8uGJVAgOMr1RjrxFt0Mk/2D6Efm2GjgS8ovNC5Ip
         B03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084475; x=1795689275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwBH+eIxP99lWtxI1I1+C/1djt449J2HrlK8pIk4vKY=;
        b=WCUwaJYGNWEvzqvfZVPmfbolN0m4VKoqZz1HVdmyvrK8D2/cHkhyNjilXioplakPv9
         WQgci7VAeF43nK+60zvzATTAqntRC5sK4LVTcHh6475y5FbFGMO1G8VLqlinLephZsP+
         9fXZ69iDyP/h5k58invQ6YSdfwAD88UoMGaVieP0DQ3YlffeBSj+UkhiUKDYRXiDX4sR
         Ut7pKnSgU061FDRGB0xYBD8aDertNCHDw5KypcbfgJWBqYpVEaCbropEp2LU4kyNKyq1
         QjFI1BQfKLK6cuWNHAhE9oqukt1E65t3ofXzfVG9NitdjNYzPtF5GTlVO58n3PUZnh41
         y0Pg==
X-Forwarded-Encrypted: i=1; AL+hErHOZKJFUr3iLpNqkD3NwhlOO7HEUGlVNeR2tcUVPoVuXVtV/pqWUdFxonL+aeAjt0aREnm2Kkgb3foADew=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IrpDxXtiyZ3xj60p/wHspfnG9kPqIs9c4W+adwTsoV5NFREAP
	Oq8H5RneDkqvd1dbzypNhcj5Eq9sjuItU5KgN/YZNF0GxecESEI7zpRA
X-Gm-Gg: AZFdTZcfWtpetJR4LpTU4oMFsEJmD3/36KWnkMOck3L3/UF2sMF8kOJWbKnxF1eugJx
	FACqTSitIFmCc0T8d0tBJIs9T49/EjQO6GPp2BvSwv1pvjgHd6v9N0TWemro1joaJ4qqYyvDc2T
	Y/Vh6FI4QE+yZ49XeeJvWAb1SSlwOE5URNrL/RDGalzYZbuqICpcMp/pXOFfd9p6Xr+z6T5OW3V
	qO9gERMhvh6QTlD1quDi7vN1vPwzKcwe1+Hr+C4IV7qpXpc6Bhqz25VBmG23HakJYXtgbmwwR7d
	CqQ11HAbMzDTD4purjJfVGklZovO0rMFK6VGdpsj0YFG0qBla9pCPI0TPQIgfneOsj1NIKKueOs
	CFPWmjTSfSbiYV8mtfsLfoVy9BtXQt6sbICE2+cgb1ndtjuhnxHxj7z0fxrQpUj1n9GgFIUdQFN
	gs3MpPQEOiVdYLHexb3J337vhoDPPQOpbgj0g6RYgSS9/lHgzH8NBUJIT3xVCyA4hLLQUYHJsvj
	oHitgWFqqp7CYq8x505dKW6KTKTuWIMdI7iUWiFwX5yfDyLXEAIFx8VL9k2PBEYBXjvdG+acHmz
	mGhy0i9lbrDZFf84N+RPsuHNIarHnF3dq5ScmDhJVmJWllyFTExXE5iVf8Jhm6tZMABV+uNVZoN
	J/x7YaLQrq19QSwwPvgBhxdfJmDLXbvscW4qCxFQhUGdwk8ARCMgIz8rNQE2byDzZig==
X-Received: by 2002:a17:902:e94f:b0:2e9:5714:608b with SMTP id d9443c01a7336-2eff74230d4mr56015135ad.34.1795084475267;
        Thu, 19 Nov 2026 02:34:35 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6116323sm28617325ad.23.2026.11.19.02.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:34:35 -0800 (PST)
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
Subject: [PATCH 1/4] ASoC: atmel: mchp-spdifrx: Improve probe error handling
Date: Thu, 19 Nov 2026 17:34:10 +0700
Message-ID: <20261119103413.31729-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119103413.31729-1-phucduc.bui@gmail.com>
References: <20261119103413.31729-1-phucduc.bui@gmail.com>
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

Use dev_err_probe() when retrieving clocks to avoid logging errors
for deferred probes.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 63089ac3ebdc..7d80f35576cd 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -1116,21 +1116,15 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 
 	/* Get the peripheral clock */
 	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
-	if (IS_ERR(dev->pclk)) {
-		err = PTR_ERR(dev->pclk);
-		dev_err(&pdev->dev, "failed to get the peripheral clock: %d\n",
-			err);
-		return err;
-	}
+	if (IS_ERR(dev->pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
+				     "failed to get the peripheral clock\n");
 
 	/* Get the generated clock */
 	dev->gclk = devm_clk_get(&pdev->dev, "gclk");
-	if (IS_ERR(dev->gclk)) {
-		err = PTR_ERR(dev->gclk);
-		dev_err(&pdev->dev,
-			"failed to get the PMC generated clock: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(dev->gclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->gclk),
+				     "failed to get the PMC generated clock\n");
 
 	/*
 	 * Signal control need a valid rate on gclk. hw_params() configures
-- 
2.43.0

