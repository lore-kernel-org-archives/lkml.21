Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169078;
	b=Qwr7Om6ZZTxteRxeaigDfg7LSzvoAYviCBuHo6FLbNvoxqcKwQF6hXKIdqWSbed9cPlt
	 KI3OtQNr3ZVQ/oAxTK81ZQpwdlWR4Ja5kVzfYl+lG+x4e99z7UJc/f1fB/laXcpeqC9s3
	 wgXHrk9pph4NyLfOR/Kq9FTr7pRC9SscTBXegl52fTbhKuSKkriHPm7jg3Zvs52uKJ7Ml
	 sbkNzXp+IKFhxGLrl9PC9d3tysNOCd6IXQZd4QmOHxgxPA7GLjaVfQLDvOTr9QVp1llG6
	 DP7XMCsjk3cu3DpEmnKoZMnigrMZwBidwuQZ5FuveUrhKNWeZP/Sf0kH+s8kuU59Tuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QC4bnZ1tQZl6KGsRAWiVXm/uq/sAiQWncP6h7OdUnSU=;
	b=q6gxPhT4joZJBRZeqKkZm5BrmnIfvjm3TtPoFHNiklb66xdfGuXVXKbQly0YorNiGRZy
	 tUOReQUeqMeGQXrbbrFcRE2qF1GajIAemtqYzljdx/UzPBxGo47yy26WOGVZyMA+Sj3La
	 l/2QNU/1f3hTOuRc1Ozb76GGY9ZJIfNIsq0RG9/gXOUH54kvGtzNhljdHHzWkTfsphvyX
	 TQ/msNCJSRjZoCbTnnmjxtrA+xIy4I3zgX4L66aDwZU0fU75bKllG3H+TFai37qFY9Ogu
	 oqHbWbVbLy8QbPxGS7Yy/m8cLlubIh+WJ4oeLmW+TCUgQCXNbBck89OyL+0XSGj3VDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4f6e3Dg;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C038C606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C038C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4f6e3Dg
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f020d0169eso3574745ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795169077; x=1795773877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QC4bnZ1tQZl6KGsRAWiVXm/uq/sAiQWncP6h7OdUnSU=;
        b=r4f6e3DguwOnbIFmjG3DRQgbSCBe6oJG3OpULr5o82khUo58FPCFwFfVU02SNHKJsA
         Qu4TxiCiwXWZKY74TXe1RKEdW2DjofUYYNRsZH1GAyJ0TKQId+Dzk7igkZTkC/H0mJVZ
         mPj7cwJJfIMJeCqHcziPO88OGHiS00gJmSvCZMAbt5xuzNharTd9kaqywEP6fAlTLVHO
         /cs6tCg5pdNUCIVX47pfjwcBRfScFjwYTVb/c9l0ghcmiVEESV/TeWW1wZRIahVBmeKf
         GjN/tZyOsM8gA2bDuI5HIrhQZdNIFs6l1cvLLrX6kHjQzIyxXBCNnOHSs9B+ZK0Q/Wny
         2UxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169077; x=1795773877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QC4bnZ1tQZl6KGsRAWiVXm/uq/sAiQWncP6h7OdUnSU=;
        b=z5aMQydhTQTWLn1R7Fr/2GHmwjijYQZlMcvxSLGYnMPqELNJ6gHsXvwdD5u/AiE4DZ
         rlGQf0+dAMKN5Lj+4YrZrMHh8DyJftLYVV86Cmj7oXf4p0wxpzOdzYRsbQh6P1su4Mao
         LiTeMpNSLrcaQHTJTLnWHIzEm/fMT0YMQazA5RS2ZOrNN1WU+q9BAp+Cy2bDxaVOejZk
         14j6GyNGPVJXy7cBfux/XR6npxPaPja/dxQZie3YplER518i1ybj+bo3CtcXV6v+vO4a
         5EdoNoLYIdUuAEDq+8GUG8TZPOVF3MkRaYTRIK0UTZrPlB0cC8rKIyBZLC0hSlHMCX0C
         iuxQ==
X-Forwarded-Encrypted: i=1; AL+hErGJoHQSfh+J6QEKl/jYIo/KtQ3+I9rKUeuETqNvj4nqZSbKjndai4RtfpTui2ri80okSqqSgYrDsD5er+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zuvHlFX1W6wGAqZLe8OAYYb+Zq5jF/4TCr2YtBqgmzHbUiKYD
	9xG2SyxqI4y+0XAGeco99/mwpBQwN29mQqgywmQvgECtfj63LxsGVaeE
X-Gm-Gg: AZFdTZfC/j3rFdoQzgg/f3DiZkoU/nq9HKdQOj/LRY+iuARxZo66G3n85+scHL0P+oC
	po0bKcF8+JYa91IAMOfB6HIF/pWOA/BUI3FTRGtltLUI8Lb273w029vBc6vt8zLuyxwhqZAOzxU
	YkH06fu0Z0smMQShlX5KRL3j3Bf4Avps5pElqxG5XO1Ux4OvOBqyL3416pSD16woPMf20Q/96T2
	MI19yWrUcBnUXP9ZGMb1dh5T5VLKbVpwM+4XvQsoeYBWJIbcR2roSCsYLiNQSY2fzY72ZIKFPue
	O3YQPLyhQdey7ksnaaNNOvAfAX/izmcUOkR49y6dbwdUDWWIoduuOMoG/9n3B9yPkk6DL+zSQP4
	/aUvS4EN9Q8WaeygSODZbcWjwdMlqNbY11AavNu8zws1QWD2Cun+tZCWdE5FHtoyK13ZmiznLEi
	n6+q10JWrcvfOiEG0fp3M3rf4MLwr1mDPD/gN7QuTRpXsBbF1oWEu72PIm6ZoM91LjxKIFv0jNQ
	7Ixp/giyv1499Qj2gJqqe4894tE8F0tmBI5Pb41UE5v4OpIMuhCdg1GneaqUuby1lR9H0iom4xA
	B77lTB4REzNAMQhPVmHwegZkqXnolyqE9Ac40cELHLPj90wGa1zMYjOXEkdt79YsZvS+Pe4fzqy
	uNa7EAjAiw5sj1UuDcFAl+FPft4U8IyslfEZk+Uvx32aAeTgz364Ppb+l74OJpY1aia0=
X-Received: by 2002:a17:903:2c50:b0:2ef:e20f:3edf with SMTP id d9443c01a7336-2f03f17d2b4mr25759775ad.13.1795169077039;
        Fri, 20 Nov 2026 02:04:37 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a69sm11797365ad.18.2026.11.20.02.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:04:36 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: atmel: mchp-spdiftx: Mark interrupt registers as volatile
Date: Fri, 20 Nov 2026 17:04:08 +0700
Message-ID: <20261120100408.8053-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120100408.8053-1-phucduc.bui@gmail.com>
References: <20261120100408.8053-1-phucduc.bui@gmail.com>
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

The interrupt handler reads ISR and IMR to determine which interrupts
are pending. Neither register is marked as volatile, causing regmap
to return cached values instead of reading the hardware.

Add a volatile_reg callback marking IMR and ISR as volatile.

Fixes: 06ca24e98e6b ("ASoC: mchp-spdiftx: add driver for S/PDIF TX Controller")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index 658ff667439c..0406a11caf7d 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -165,6 +165,17 @@ static bool mchp_spdiftx_precious_reg(struct device *dev, unsigned int reg)
 	}
 }
 
+static bool mchp_spdiftx_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SPDIFTX_IMR:
+	case SPDIFTX_ISR:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static const struct regmap_config mchp_spdiftx_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -173,6 +184,7 @@ static const struct regmap_config mchp_spdiftx_regmap_config = {
 	.readable_reg = mchp_spdiftx_readable_reg,
 	.writeable_reg = mchp_spdiftx_writeable_reg,
 	.precious_reg = mchp_spdiftx_precious_reg,
+	.volatile_reg = mchp_spdiftx_volatile_reg,
 	.cache_type = REGCACHE_FLAT,
 };
 
-- 
2.43.0

