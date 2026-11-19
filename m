Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084486;
	b=UbS47f/PUUV+H9bh1q/m6OSGfokZ5qRJY0L8RjhuKvU56PmbZh/ARqQyLBTgk8OChm0t
	 C0XSAywR0sv7fje67JRBRsGCDGgloa9Wrd/HzYEzbVSQGjwCbBIelRqYYeBcV4CMwu9F2
	 gUGnU65/USNB6nHU10qLnWhJSf+o5Yq+1XQbAb+Y9csboZDDrS2mM6/XTWh42TMCeTvxD
	 g6BLR0WTAIHxHjcLRJ9p4E/YqRp6DkcNdMNXmbxLixnT9S9eyZBkNvIlD+WPTiLI6cujs
	 TyG6EDGmJMK901oIZzWhL/dTrn5hthV2CZyBLzMqNt20OZk85SriZUmW00flk3irNzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xtXpCQXpPiOT+irqNFj2LIP62ii+qGz0h1uHq/y51ek=;
	b=FlfA9qut7kD0SJkZc6oqe95rLRNFOikZxa1LeDNp3BL4B3YIfFlUWWrScqsfV1AY7SQJ
	 qxAK1W1qAxvLYENaaeXTzMFECY4VGz26ccaMyTULxKQisQAEGNrNsQtLUM5zEzEXW681D
	 BDIuOoLtOovpcbaAHzdREsCUJNRrBNh/KgFlnAOBzKce+5thkqH3YVbjWueDy1kdOfm/x
	 l52IsmP7A2Xwqh/eWYVTkjPZ3NuNwdE5TXoWWq4i4v0lDB7ljAiBhchKf0sf8ae7R8laF
	 Fze1Q3TWRxfjjPOHlqqmYEHoumV1bTHs9umxO714TVJcUsXBFsCSv+Cal7rKi39VZpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ENC9pGUO;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710A660A2612
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 710A660A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ENC9pGUO
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9e53d011eso16779605ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084486; x=1795689286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtXpCQXpPiOT+irqNFj2LIP62ii+qGz0h1uHq/y51ek=;
        b=ENC9pGUOPzAAfJrBavhCHwIf5u770e91cAklDZyOyl8lwFe0cZo6nVPVrzC+eQgGtT
         Nvm4s9GmGQ8dncT5BU7aYZ40HtDf3jxyX1qu+9LKDkScvCzi3cCFdTyov26jDMh0CGkY
         lEEJT9NVc82EgbQPfASITAVosnedXfJAeLbxkXGqYHs5+X4emh4ZF/rPXM1kaavonVRt
         ttgUBRzNZw+jjyXdYOI8alZd4lXbstVgPDR4SR9YAUA+LsPgJIfVkaWT+qZGVZhtWC/L
         KCP1uRb5aLwZNFmN4AvPndEcVBzXAjx5oct313TmNDIG1Q0RLzwpcclr8NJ3bw4Wqwhz
         64jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084486; x=1795689286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtXpCQXpPiOT+irqNFj2LIP62ii+qGz0h1uHq/y51ek=;
        b=vVxDm9RJCsHNWw9LzOvDMpBwQnIYnnsqgqbAOrcIi5ChIXF4wnVdXcm/u0MqtgVCg6
         KGgpMP4Rw0rHmRwUoN4F2oTM6O7WKWUs0dCr3O45zReI18bTHPnayU9R3bbfdzlXhdtY
         3nzhde3To30LN9txT88OFm/1P0mEdu4y3+f8IZGYOqrqQkRhH+24tCOfsEI4nSaJuDc5
         UGRaORuK2NF+PzIQxbHwhDjq5UOVk3cCCYiofHlbkNxEsbuiBQPkL+7pG7/LIKoQNLmN
         8EBC21QkZY5Tu3Bp1NBVrtSNzMTuflB6TrsUgSQc9sIOUpwY+ZyoskZrGh/tCSEHfCdE
         7xiw==
X-Forwarded-Encrypted: i=1; AL+hErGyKzFlplWAvQ/gwrI0snvNR1/1sf+s4DIPxyrQj52+VKfgHOhixAHFu6fqjmwaheCNE3RwJZ3K7awdnW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bhXpcMV5g25/I/O5DGPJ2BU8OwQoFcSjiIXmlrcX/NgvFf+j8
	xLlXWkPJdV/LMAMhv6AWHiJ53OCqOn7I+HqmegHTWES1cEnxIsVqLpH5
X-Gm-Gg: AZFdTZeoadN96PE5h3JX3KcVywdTdOudJ6Y5m7gY+oC+3N2WUWNlHvFB22gAlX1tEt3
	Ou5aInCehk2KcVeVhCXrLUEsg+BiKMaaYn1o6ZxVPwphmDybXvaXBATS5S8MWtlm6ukDs7JrbZ+
	2pVJjnoNjWCgJvWthMW09ZVkclMpz9o1hUbS4KZLYDvQV+L8eq76F0yvnfd4jqUtlEp3g2ux9Ic
	gZyn8wy7o87tpdEXgBuRDuBWjLoNVybxC4x2JvWzUkEi6Rh85HWdtM+vywiQsnbweva6VeWE7/a
	ZUMarxQGoSzu6JZurCx2FL9GqRwE9qIZFZeqWV9ULNv0d49gjHM1GFTqeiCl10UtEr2QibgGXot
	hDl0DoZ3Ccio2xwfngQfglrqjG4do5LrBD3cYpBv2kEnizEtD9+rEIXHygqGymZzJo6WKVankIp
	bxy1bEQkXLpiRs2o5LFHJZ2IL3qJoP/R9xffHYqA+ph44MrEOyuYhE8/9CgCcoNPPPisN4NmDlk
	J7GHz/azp5NA/0/ucJLldfWFjOvUmJAzZioUtvwgvid27NyXZqd3tkzoVtjW4OR0Hku9Nk0oAfa
	XCwkpObTBBV/wcupkPr9gZ0r/Yk/ZKBDXx2gB54uZ09D5yxcf0DrPn/M/J0OpwPV0n9U6gKaRBS
	GTdz8qFpdb18Ld6fAblJKtfTophofy3KCsE1+SDt2DtK9RaeV+O0azOMXJwWkxTEEew==
X-Received: by 2002:a17:903:2406:b0:2ed:15af:d38c with SMTP id d9443c01a7336-2eff720e4ccmr54759955ad.4.1795084485616;
        Thu, 19 Nov 2026 02:34:45 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6116323sm28617325ad.23.2026.11.19.02.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:34:45 -0800 (PST)
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
Subject: [PATCH 3/4] ASoC: atmel: mchp-spdifrx: Move IRQ request after runtime PM setup
Date: Thu, 19 Nov 2026 17:34:12 +0700
Message-ID: <20261119103413.31729-4-phucduc.bui@gmail.com>
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

Move devm_request_irq() after runtime PM setup to ensure the IRQ is
released before the runtime suspend action runs during cleanup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 25122f6ef3c9..41c65e835765 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -1113,16 +1113,11 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	/* Request IRQ. */
+	/* Get IRQ. */
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
-	err = devm_request_irq(&pdev->dev, irq, mchp_spdif_interrupt, 0,
-			       dev_name(&pdev->dev), dev);
-	if (err)
-		return err;
-
 	/* Get the peripheral clock */
 	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
 	if (IS_ERR(dev->pclk))
@@ -1168,6 +1163,12 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* Request IRQ. */
+	err = devm_request_irq(&pdev->dev, irq, mchp_spdif_interrupt, 0,
+			       dev_name(&pdev->dev), dev);
+	if (err)
+		return err;
+
 	dev->capture.addr	= (dma_addr_t)mem->start + SPDIFRX_RHR;
 	dev->capture.maxburst	= 1;
 
-- 
2.43.0

