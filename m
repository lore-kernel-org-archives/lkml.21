Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771455;
	b=UH2dIHn8AidTVNKoJ+IufO6o0Z/GzDfvC8UmYMcpJGcpzJd+7TNK0WWwuPTZEM4Kha5A
	 oVTUlS3P5WVAIhMAVpirRQf9vnrGJ+ke85VdiQ4Se5ntAlNVZ4WT40OLmyeopekEBIRmE
	 GzgoN/L2iKwRycrM8KbUD1DHx+bw35wlZI7etA52QbR6hgtGam1b5gVulk7jkSIXyND36
	 fw/8yy1yZ8Z7iPekJsO8Yy3c7j3EyWPDSx0uNGuwFUTMcTEpC8m6G4T1uOKR+wf3N52UB
	 tcEZtswOdWCwAfE7w3UXVHj+51lOuE7lhCuuJ6sD46Jd77IjLqo2Fyzr2mLL0hIdfDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Cld24QN+1u4mT2MWMiCkwvVZkrkgbkV47el//g55Ho8=;
	b=LW83Tk8X6aWTLQ7nzjV5IRuf0Cf+OXEhyXY63fwFqfcAJKVraNuoT6PM82d+2wyzljcx
	 dlftWUP4em4rfPjnNBgxo7bupoo7APV7oU38TrFQibR19/IWKN09y7xbLaHsGxJP9UpxP
	 lvQl0gHxhnTwPdZydojDawR5SL9o1RCxX7WFHH2rOWyXN93RdXk8iI2lWCwHXgQKPBpp1
	 QJpyamOOyB4/SaERqs3duIf/LwT/NSEPk1e/DRVh8oGd6VyWu1xhTMOlffb76sWkczIJJ
	 rvtcMJqATclArNVOy2+cMEmuT0w8XQ8bP2PTKrgzsMlAHMKXTLmTtK6f3W/rvMNrYiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0VzaBXUD;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E535606A326
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E535606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0VzaBXUD
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cde4b4e936fso3780183a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771454; x=1796376254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cld24QN+1u4mT2MWMiCkwvVZkrkgbkV47el//g55Ho8=;
        b=0VzaBXUD8WB0iWlBy4v86adm/c6ahxfqJnsJ1AcqDkW+B0pBuBorrKGhCWVYa/6mFS
         9X2Rqzpx6BDaA398M0ntAYHDZtzMcxoRvm4pFwzaK+e92KmaUZrXLBZrl4yYep5/yUoH
         i5iVKxjzTb/2Dvl+hiUH4ATL9IJ0znnKzXeKoWylBs/GV2CCYP4Gdi58jbmVBfuOY42s
         yrRvGgPoKcV1Aq7N/Ci9pQwjhU2It/y91paqOgNLkNtXSjTg5D2IYfyeY64Qi6w98++T
         yj/qK8of2nBJL7RZVJ8ik4vYiIEqeVlUsSQ+rWtdBYJRTNHF+lGzWAKqFWobBeTA+Nnm
         I4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771454; x=1796376254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cld24QN+1u4mT2MWMiCkwvVZkrkgbkV47el//g55Ho8=;
        b=d1Niyo08aEPdLf9jsE3ui0aBNPzLNKCKfSoApNgP/SiYvsAPaatTvV42KgmDs48sTM
         9Bre2D29YYksL2x8pusRQyMOpCnb/sp3cxiC8Z6xz3idHtaMyDvKCtlDnRqZUMenMpsD
         EvIAvhefxm/If/bL/SA4Jb4XP85nvCo0v3z636UoKRpNqKcx2NK+VNi4nY1rjcQfukwy
         T/6i6nL+/2n/TXn69zpsQx3gU4jEbzMdfNoE9RpQ1wBfqnwPSg3OFRoXyETujSEWDAcz
         VfqFUAwZR81Sfy+N4Flit256j7LZdcFlpuFhkc0qE7fQ0E5rPdCyu7tc+vfR41Msrge6
         gAEg==
X-Forwarded-Encrypted: i=1; AL+hErEY1eYGMzRGOmk3ijbyiS29Kt/lRaXoZkXaKB1c0+/rh8phRwAX2xq3vC/hQ2ckxRUwSjdgnWeUyE/Bbl8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ixlcDpkA/EK3sog1CBkdxLowULJAttBzdKJPzrv3+B0Sc72QU
	rFJpxakonlHcBeV2h/sPHip4mM5+YZBIFRK+i9nogBZM3xmSq41JXoOL
X-Gm-Gg: AZFdTZfGz0ECdWo4sp4O6WudUsxyJ4K45VW94kGQapiMpGPzNJnTFrQYprCFc0XQ0Jl
	Zm+TbzZhueYJyWrV473c111HIPU3v7MQ2ftlRn/Q53Ap9XsFzPXYdY2XwgGkFbPU1KFplJ+/27S
	aSbLtCF9+G5luFCeTG9tJPxpZXoEpNyv48FI1ObcBjdJhOucOyPDR0BD5Qo/iL+v3187SWQpKwk
	SENSXX1dxpqt3kEpzVPsOv6f8FOBTEmxMvOmlVGet4NDebgzwW1sNatRE4KeJFgwm87nwG/VpLi
	NPJBb/YWOVmPfQLwzvZTKmu9i/miaXtAyiwOc+YoniSjHsf6khe19BBxrR60xRkU3HTtuc8owWk
	a/PhUYXAaFuGPahO9KBvb5mcnK+/MpN5bnv8kPX32II3B2RG2AZeym4JLHQq/exkpPr/TsD12qs
	BGnH3uO1uKypviXAXHb+jKJAm06TA2ThVti1/BdPHmqjFePZPfk7OxhIUDLN/CZE6buGQdyhzqh
	AX+ymtndcseLeZr377jYVVJWNCf19wJrPyeCxYNdYSrNDped/hcLRcLzb7Yi6eS0bFj3lddz6Ni
	OB3nzn8pg3cs41PVaczuKXiO5jCKr4bCron2VgjOb/Chwou4eylRSscNPPaRuJRku5qCXSJgRSb
	wJDdytrjXdV9SWRJpdX/0kYRJpXYi41fIY4ZNXEpCZIh8
X-Received: by 2002:a17:90b:5407:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b41c961ed9mr15001842a91.39.1795771454306;
        Fri, 27 Nov 2026 01:24:14 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm37942052a91.6.2026.11.27.01.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:24:14 -0800 (PST)
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
Subject: [PATCH 2/3] ASoC: stm32: spdifrx: Fix refcount on sync failure
Date: Fri, 27 Nov 2026 16:23:44 +0700
Message-ID: <20261127092345.12383-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127092345.12383-1-phucduc.bui@gmail.com>
References: <20261127092345.12383-1-phucduc.bui@gmail.com>
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

Roll back the refcount when starting synchronization fails.
Disable interrupts if no users remain.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_spdifrx.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 467c3c583a00..ba6c715750aa 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -358,9 +358,15 @@ static int stm32_spdifrx_start_sync(struct stm32_spdifrx_data *spdifrx)
 		cr_mask |= SPDIFRX_CR_SPDIFEN_MASK;
 		ret = regmap_update_bits(spdifrx->regmap, STM32_SPDIFRX_CR,
 					 cr_mask, cr);
-		if (ret < 0)
+		if (ret < 0) {
 			dev_err(&spdifrx->pdev->dev,
 				"Failed to start synchronization\n");
+			spdifrx->refcount--;
+			if (!spdifrx->refcount)
+				regmap_update_bits(spdifrx->regmap,
+						   STM32_SPDIFRX_IMR,
+						   SPDIFRX_XIMR_MASK, 0);
+		}
 	}
 
 	return ret;
-- 
2.43.0

