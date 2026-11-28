Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795837338;
	b=5GEm5VQNRZCW84yqQQNSgXaTBvPE0Wx41HzmInxkSjBv5VOrSCEsYCnJfoZQTtjQwmf4
	 wYxgc0CHb3NdgO13yNSCQ6vrp5EUtXg/Kg1fLrQSn+Xa+iO2EUaAGPbsuMuO694sW2aU9
	 z7hRNgClKknNx002bM6vqW24y5KQ9gG6awP2IFkssHDXdbBDocKeWH2D7ZfL+1en58yCW
	 CW1751XUH6Tm9BCMR/LUUo8BqUl3x7ZC5D70K/E9mn8RumdStnY+92bmzO0/nByHZbM9x
	 NfHGnvebVY0iRsVscI1Gv9ZWFf6vjygjccr1iKm5SkaEKvzC2gk7e7erK1WxH7243Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795837338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kWwklMq2u8/SctGcEuICjrB5XV5JOccfY4onwd9F9NQ=;
	b=zTfujEPTB3uo0ENe+ZDCazgdj/0tykBrxEcmKRncdWaHFsPvOXg4yRPu0eyPAv4IzCVg
	 zGlsTdS6gzIZAbLl6vikScCVJSsWOlKaJfUp7LMXbum8dyBJzsYdt+eF+i8dqdya+0Nah
	 DooYB0TNYllSqSBhuzrqITWXUae++/5CsKaf8KIdp6JlC49chZd2AHIIwUMPkApHgE5ai
	 SyT7TmOooLzz7VoNJnZlgVNeIOKobfR6fyviSHJV8BkzM2Rk/kbJHHjt2RY2ot1n08IyU
	 8asiY3ylKYFJ7HxJ+/M3Cs1v4OgfGqq97MU8nuPOQoZNzVNE1GR2+KM2wTvLbEwFhzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bhFG9Eha;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA096606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA096606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bhFG9Eha
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso4365365a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795837337; x=1796442137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kWwklMq2u8/SctGcEuICjrB5XV5JOccfY4onwd9F9NQ=;
        b=bhFG9Ehao97BTtnkSupaQXbbI53kjo9550B81Yid0Oqtm8slxQfNUkvX6KdfP0vZ3T
         d+4twaWhyE2RWOQp4EbMimO6CVnt+bAukd3hseSrqy+nfrJrxgIBFAwTD/L52HEt+hJk
         TNL72OJ8AUb+v9oNVWECaICj0xeiHT7wCPuluJrIiWbpkpJdZUBsx5x3xl+oPlbQkC/i
         ALheGPnVRniIDmaZAEP2udiJ9LWSAbCnlO3Fcfq0vKJTmK3avKHFiVOnGNL+U5Qbi8jb
         UcaXIImpTwekOHzThz1rvnn7VDFX7w5T6x0l7M7hrRIe0n5fyhjABmLQ6/YHiEkE3J8m
         2fHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795837337; x=1796442137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kWwklMq2u8/SctGcEuICjrB5XV5JOccfY4onwd9F9NQ=;
        b=MJ470JpamOH4UMZ29vtBHFiVwtSue/jNAaN5tokHv9CMIMpMBCk1qMTQCHmg6m5188
         ogatnFoNKDpNERWvqluBSjHoMjV/MbS5vDQ0Q2pGQpkkpa2OXpCHT73YQtliNLLQfOEz
         j4iVSHREskFbTyr8QRfmopPlhw0ib+LoBw/8oJ5FTr1ORgvfA/mLzGfqGyPeT+k8Jl/S
         03/f0zOW5GK1EaPXmTVULPJJxgVC7bFjXzC2uQGQp5hdEjnL4pB+yyoSBmMgSJVKX9uf
         Df3lK65GNpXuqcP5bKBM0ndoVFoGucN01UULgtBbDUQCz9Ws5fotxVYyopJxgjRFy8RL
         N+UQ==
X-Forwarded-Encrypted: i=1; AL+hErGEyw0bAK/MNlwYp3gxztQzW0LX28WoglM30913P/R40jWJtj/aHh67S395O5QNTw6R0KDSi0AJnvwEeV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RvL0Ab4y5Hxq4oCy6DNb9zQajkqN2ctp9Pa8LKjvKv+DyrfPd
	2kxFWJ+Mbv9DFpHsVhCvNTiTEcbflSiaEsnDvQj6iHCvRvKRnTHn9bC8
X-Gm-Gg: AZFdTZd7NzIgHMx3njcrsuhre2ngY7c6Ve4WivpoFyOBmjhZYEhSmuSIwg26d/BE9nN
	NPLTRxPysep02rvM1TXdgChRUdHZ1833O/18PHXvEZkYsZxeoHqZv0z78PzzmXswo6QLNH8gO7l
	j5PlEQN72NRPW9rUrhHt7LfIfAPV/CePte1b4HeAKNPPcMdqCo4ozlTCFlLJfgntGzdMtFOnPoh
	hSKFi+VYLF1KG/DRdTdMz7nDFW8WKyZ/lxWaIjpfrQ/LeQcf9juMbiz/vVwv+BEB8nB7r3dl7L6
	Ly6u9atCwWOUr0RGFFphaESycA5tKuUyf2+2qSIa2VHKJagjn8aEIaJ0ORERAEBo3LO07UyOGlz
	NEYoMOBVGs9FUYRNMF+gyBfuDN5jBO91osWYsw4zWFq78VrHGYa0S8X8LhoPUcmllLpEkEI0gmQ
	Tr7brrXVzOMoJQaTdNtiYvCXitSNNyJWqdEqxwPfYSG3GUdOd0NEyxdvFhH+kphVC8TmC7837F6
	nyOEQmAwtLT6Ob40//yV30ROmKqzgk1uFVu+h5dBZLpEVikCnPw0YHthKl2WxN1QWkjgIF84emL
	LAfThgdK+gQ9bKPrtrp/c+TqNpY=
X-Received: by 2002:a17:90b:3810:b0:3b3:cb3b:1965 with SMTP id 98e67ed59e1d1-3b41c8fe1f8mr26427976a91.16.1795837337195;
        Fri, 27 Nov 2026 19:42:17 -0800 (PST)
Received: from debian.. ([192.227.246.212])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm19491352a91.3.2026.11.27.19.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:42:16 -0800 (PST)
From: Harry Bit <idleassetsd@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Daniel Drake <drake@endlessm.com>,
	Katsuhiro Suzuki <katsuhiro@katsuster.net>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harry Bit <idleassetsd@gmail.com>
Subject: [PATCH] ASoC: es8316: fix MCLK_DIV clearing and 20dB mic boost routing
Date: Sat, 28 Nov 2026 11:42:10 +0800
Message-ID: <20261128034210.746029-1-idleassetsd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Clear ES8316_CLKMGR_CLKSW_MCLK_DIV when switching from a halved MCLK
back to an unhalved MCLK rate, and wire the missing 20 dB microphone
boost Differential Mux DAPM routes for MIC1 and MIC2.

Fixes: b8b88b70875a ("ASoC: add es8316 codec driver")
Fixes: 869f30782cda ("ASoC: es8316: Enable support for MCLK div by 2")
Signed-off-by: Harry Bit <idleassetsd@gmail.com>
---
 sound/soc/codecs/es8316.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 334ac9119c..f329771bf9 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -305,6 +305,8 @@ static const struct snd_soc_dapm_route es8316_dapm_routes[] = {
 
 	{"Differential Mux", "lin1-rin1", "MIC1"},
 	{"Differential Mux", "lin2-rin2", "MIC2"},
+	{"Differential Mux", "lin1-rin1 with 20db Boost", "MIC1"},
+	{"Differential Mux", "lin2-rin2 with 20db Boost", "MIC2"},
 	{"Line input PGA", NULL, "Differential Mux"},
 
 	{"Mono ADC", NULL, "ADC Clock"},
@@ -514,11 +516,10 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
 		}
 	} while (!clk_valid);
 
-	if (clk != es8316->sysclk) {
-		snd_soc_component_update_bits(component, ES8316_CLKMGR_CLKSW,
-					      ES8316_CLKMGR_CLKSW_MCLK_DIV,
-					      ES8316_CLKMGR_CLKSW_MCLK_DIV);
-	}
+	snd_soc_component_update_bits(component, ES8316_CLKMGR_CLKSW,
+				      ES8316_CLKMGR_CLKSW_MCLK_DIV,
+				      clk != es8316->sysclk ?
+				      ES8316_CLKMGR_CLKSW_MCLK_DIV : 0);
 
 	lrck_divider = clk / params_rate(params);
 	bclk_divider = lrck_divider / 4;
-- 
2.47.3

