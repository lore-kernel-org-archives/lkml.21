Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084491;
	b=GZTKTuZ+vmnmNFgPmXP3ozFT4dV/tRCKkM4+Ia/ir71hndlZS6UPqR94+kIPak7jJFMV
	 kBzxS4HDDyH3xbmm8cogzY1hxOc1e7zUHOvz9ySVWjyS0akV60mTqR3T+2Z9J5Y1NfXlI
	 mqkEfmpyBK4cEvw6kGqftRsjarHDPkPWqTZYURvKLBLMrUlkrM4dxr7bqWQtJeDAy4S1V
	 dd5YbY30HlZJsKhAR7RpWD3lSigDXrDA8Hiq1x2gxlLuJON2X9Eir4kCKiv9F8pfvjocE
	 ZCspWB2yJNpxmNnV1aUr7FLpi8nWxx6Zkk9ACUOPqda7E5lw+BuqzLRLDDfiP8GAzcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/a4yTiu8jgj78aGQImmGD3g9KOfP61dhUZVTXL8q2gw=;
	b=LR2/8tvhUx4J6sI0CycCPJS5yoqyLxJ3/VdOuLQ0a7xYlk+U42eX3/iihma8MiTLwOxg
	 E57p7k+SBFOaGuKiDyCA6Tw5J8uA5JKYy7sgUeU/qwX4syFuc3rJdabF7GTyS1G2ISxJr
	 d+zMVT2AsUCmd0zH48arHYGBUpHGuWDNKO06Jj8H3l0jLirYOiFMtk0T/kBVw3TK9PeYG
	 dcEp9E5HBunSffzZYFLDwoxWMBzi22oyLHN4FEbsfd7sXnAVz4gCKjG10ZZO4FOEWJQUQ
	 TuVDH3FVKzhIMsZhM3xLNS+ypK7uW/ISra701QV3LqNSTBVgIfpJlVFfmxiPiA9Tr0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezDGbPt3;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B518606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B518606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezDGbPt3
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2eb18f4da15so9011185ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084491; x=1795689291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/a4yTiu8jgj78aGQImmGD3g9KOfP61dhUZVTXL8q2gw=;
        b=ezDGbPt3F48Jsq88Y15FalGyVLHURywDMhaWjvm5dL/FmLMEYEugoJ14q79//3U8nF
         2iMCvZRuGDQXzGVdwUHsJ6AcA8ZSxFBqvBgRh2r4UmcQOek/sKEA8elnxjfLRASETnA4
         u+cu3sR0URwi2jKqXk6nPACRyhgHQ772TEwIatOe4N9tpWZkaLAiT8T43gvGn3z518WP
         pfYO8E2hnsZprvumR6I3D242vtmYQu67bhtCTXU+0wqBF2CkbGhiO6Ri3qTkAx4mbHih
         aADZnWqRfAqlJHEFSs4bs4I3QhHDoz5ClXWIIQHOu8CB6M/7ZuBjM3BN0Wee8jkpBMl4
         Oe7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084491; x=1795689291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/a4yTiu8jgj78aGQImmGD3g9KOfP61dhUZVTXL8q2gw=;
        b=L4lwZQhgS7ko37FSb1WohcIYX/3SjTv/YjhrCXyn6GNztJeZEaHazqq+/aYU7a89mf
         TnG48sXknuDtX4XuSQkxeAAmmSK9zTcnT77BJeClwD7AasrvArk/CxNzyFtIbFc+5U0e
         p/5P1dCulBSJgBHQwwhXvRhdBxY7eBI2M3i/16D4lOOWr8oCckwMcYqDNqbARTajHKDq
         qO7Hti1zU+95MFNv7aqBY4hL65cq0m/Feo22zvjLm2V2bKfiR6vp58a95bALh8NPnVEj
         vpExapd1k+769sbnb0/9XBQZeqkrKc690m31PMDk9TeqeUbzyOv4MDBijF5Ua+aqizAE
         A6Mw==
X-Forwarded-Encrypted: i=1; AL+hErEIMOhDCykivGdgPo+1f+t3RU2s4C41XMogwn4yRa2YpxkcKdGhcw4nUav+ik99v8XFQaDTPWqH6Y2W+6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6gehoVXbC5zKwgmvlUbN0gfDRauydXvQu0VfrMSLLa3onE1Qj
	XaVFoOKEMLPSv0N6/xOowmZuttxW6R/Ylpp9RspHeLjhEmXfsqGl2Ypz
X-Gm-Gg: AZFdTZclesr7veo0/tnph5U7R2TngxNtO2A2oieJCmZtwe54OuBnxpwSsm14ho0rmF2
	l8OZ1Dc4wWP/1XlkDf+l7qoNITiR3kCzqUbP5PL0cKQ5VgT5WrVudVQqdv72tZuWGADomfXkwyS
	LDScv4jsxWL/VoMUuHTFoLcmzWJJRarkreXwi+4JMgIr7k7dL5BEsEZ0py+VLDM6Ludwn31APTT
	lcCpF6FDln5CPpxEww1+1OjcknKlbWzZeFHN4DCfTTLpz1ykQmxTozICev+jhHcQbJELVz9RRLf
	WNDbEt78r6p9fQSfFhCstVZJZH3WDn8vEa5xtosmlSCFrh5GT9NDsuYqCS09ypUbQnJ0tfAoUT2
	bAUI1zwlx4yNmjegqzSL8uwq01NFu+RI/c/9gSusbr99gEwo3tKUPzClULY0rq4VRZJw9edAon3
	NeVpJGvhXnFVtiEtxudL8YkxsE7+BGXPso32MIwdAKohoSQ1MjsuxwphdFB0vlpogw87iuFSC1K
	kiePBNVMokZ2Y1iCSAnqaGlQur41FddG5E9CEoEG10aIoKKJ+J/E+ppFbLEP89QhPo2YOayN2LB
	aM8vYI+xwxYfW954lDncgT2GEAvSTKyvOWUxntATNTIr1AQE6+esGzI5jWge2zPTUN7K8NVcQjC
	ZFi7eib3p6XT9wNzIf1j7vI7cdV/COAgdeQL1VhxrpjfV
X-Received: by 2002:a17:903:3d0f:b0:2ed:379:1592 with SMTP id d9443c01a7336-2eff740b594mr54610445ad.26.1795084490872;
        Thu, 19 Nov 2026 02:34:50 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6116323sm28617325ad.23.2026.11.19.02.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:34:50 -0800 (PST)
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
Subject: [PATCH 4/4] ASoC: atmel: mchp-spdifrx: Propagate runtime PM errors in ulock get
Date: Thu, 19 Nov 2026 17:34:13 +0700
Message-ID: <20261119103413.31729-5-phucduc.bui@gmail.com>
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

Return the result of pm_runtime_resume_and_get() instead of
comparing the old and current ulock values.

This ensures runtime PM errors are propagated to the caller.

Fixes: c7db2a594389 ("ASoC: mchp-spdifrx: add runtime pm support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 41c65e835765..632da8d7bc81 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -709,7 +709,6 @@ static int mchp_spdifrx_ulock_get(struct snd_kcontrol *kcontrol,
 	struct mchp_spdifrx_mixer_control *ctrl = &dev->control;
 	u32 val;
 	int ret;
-	bool ulock_old = ctrl->ulock;
 
 	mutex_lock(&dev->mlock);
 
@@ -735,7 +734,7 @@ static int mchp_spdifrx_ulock_get(struct snd_kcontrol *kcontrol,
 unlock:
 	mutex_unlock(&dev->mlock);
 
-	return ulock_old != ctrl->ulock;
+	return ret;
 }
 
 static int mchp_spdifrx_badf_get(struct snd_kcontrol *kcontrol,
-- 
2.43.0

