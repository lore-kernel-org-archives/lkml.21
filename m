Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147201;
	b=t2NIkk/FswmuhVXxtc5lJSgS10cAMcmea94Dmx7qAk3HnUlgQOdHTYg6DUMng9ktO7DE
	 VUy6bad0GutgZLwGHR2avhB7UCrejp1tIXShyLGbil9O/DRiPzAXJPhHmP7y/6qyEgPtc
	 cC4+/4URAZHZvAOXc0ZiZ/rtz2PE95OMQUKlIbN0Tt7P0vJxFI/p8pK/6NfOKMx1yqqAo
	 8e7dxr5Mg3mUAFqnLMIzTA2/CusUgRhstkjEsMSp5UETSioB3IpTKwsZcHx6Ph2j6Pd34
	 oHxUqGBpeS6ZV4jF7jKuGgMdVQZUbpRjB+ow7UePAhzCvz4FVZw2xowKwt5P952zhnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CpA5O4wyUxbqGe+dCFjBVccndMPCv3b8o+hsoVqh4pM=;
	b=NvR/8G+WjMasenIfqm74Nf6xny8Cb23mWRiakTVa+xe4h1YCAMaSaHGJirFiVICDCLvS
	 XqoOPfONrwdZkGxipJC85Kn+NZaGWBkZUGfL9oy7tkOF4xXxX18bLl4N/Ymh/OGZ9FHcM
	 Me2C/Rm+YZYTQ6PG5IX8XWMCnbt6Rq/CYjzh7SE8nBFnbQYt1zU59uaOfeWnm/cDDPkjv
	 tFka41qwb7uicrhaJzg63D4CYtL043v18n/KJCCmPJvOkNou/nz7tCDqC/TRcLl8nb9Rz
	 1mJEck9stwo1q6zGL9qEh8pkEn3mTHmbHviFgiIk/ra1vIFQwD9DckSTGrXbFb5U1VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pv9tEZFT;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EEA606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05EEA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pv9tEZFT
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f045b921caso872835ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147199; x=1795751999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CpA5O4wyUxbqGe+dCFjBVccndMPCv3b8o+hsoVqh4pM=;
        b=Pv9tEZFTlOfAj6PbvGp6C32fm5LFFqJO/T6RHjukvgU86yMpRPRomGOyjxNHHEA/m3
         4/5y2hMUew54Vvk+lyRATXii4GLdpAmhjIMt/pis0HHU7aMbGiaA4Bmxk3nHn8ro5cQb
         D0Tff6ZDs0jG+RUwuXQOWChPlgNqEBSdWV70drN4a0KOgoejiwxwctXytEsLIa9Gzv6u
         0tl2hd0A/wAku1xfmdsGRzoani1xTexThyDrCzmuLoCYM7YVFdXdeF1/hcLJnVFuE75W
         EPKM2kQ6qyz7b6IxHJvyi2QpMmatMNcxt/9XeLfItTYrFxyA3ho+EQ50FuMGq9TRFhHv
         1zGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147199; x=1795751999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CpA5O4wyUxbqGe+dCFjBVccndMPCv3b8o+hsoVqh4pM=;
        b=Waka/WgBw0jDvb2NkF9oRLqMMGczsJV+Kd1cRHffKChPozrB6HlIiTNV+mz+TExf+5
         /7Ww3F/UK0R5iENekoSXOX9sHhyO4fnJ3M/yC80wCV/oyXcyBRfNnt9gov4sfnqcSGpP
         xn4opC0foo47wSZKDMG6UYwpZ/m0BsAFMelahlfLLSPGcVQCQD9U5BDRodSN89QYLsoJ
         DGQAfu0tzmEzR7Q0WfO3bOT2XmCnyRr2i4FrUqIoOMAbsN3FxAMIaHcLexc9WT2WMoCa
         mL1H+rGyvLwsGCjgY3vLOlpwNp0WPb9UYTQCAU+oQoccjz3D1eVaCY1GkkMa+i+AP2YS
         CVNw==
X-Forwarded-Encrypted: i=1; AL+hErF8HSYKHLghe/j+1nK4gWCXKdM3r3q1O+Y72SKFn1lUiTGb3nFDt3eh1ouzLfG1BHOxWx2heb3lhVLsSFY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j1aow8teg252stuP/hyrsQLvHXLoVPhCHRKb3tX3IBqZFJHZP
	fDeNYGtyhj5X1Lk3cz+lkx9qyni24pD8Pz6BlrktYE5C0i9o84QvBMi/
X-Gm-Gg: AZFdTZeKwDw3fBvr+x9c30MfpYK3K41W3asT3wKueMHJi5oCIdXrHs6o2hxhCg2M00B
	DjyzFj3/M1VFH/oiEDKs3stR/mZzHsCj6F1o1fUOc4/g1xkoIVqml29hnKdCX62eGCU+UL/nGQP
	UsCfndMROduAazmJ4v6T48cv/Oars8nAyZjX2XHk6av8TTRRL2sEV8GE4mwsL7lIvnbL64StGfd
	4aUfWsL7q+zaYn7xOKXGrrxY4P5V5ku9mgOOVscvuCQYaE+OXktWxwAiyHXl+F5BZdhT40rxVAr
	FL6hAJjhSDNwtwTHhetaRaBuFUrIQfOlqbZwUmSWlWcrUjxtv/2a0debc3/cSW8jDFJv9yz5OB/
	xR3S6pTv6q3dsJRcFZd3fU3ciBSgdTpYqjrRhFYfGFDdz0gQIsHBwoOVrDZ1+GRDAx087U3l2v4
	jaTxhhJQ3vCmF8t93w0XwId6PodKUc00M9hy4L+dx5Hlm4PaLqr0sWgKJws5dfL28vfZk5+PfOR
	HeiGCtcKgWVtZNzBgqo2s0dw4nIK1CcYkQHe+1d/5L/+ZfyZpe6yLrMEHCtbAFJa4SnQUFUj646
	QgKcxEywD/41YAibN9tyqlrCooC3lzAZQ+Tplj7GTQdgFNQG1wWeVzvP4EYUwu5t/Lyo1zSjfvn
	O/Gpr+8ZgUy13KJz1NLN6zCOtryrtfa2q4bPaNvVcy1MR
X-Received: by 2002:a17:903:19cb:b0:2ed:2afa:9221 with SMTP id d9443c01a7336-2f03f1707f5mr19772845ad.27.1795147199236;
        Thu, 19 Nov 2026 19:59:59 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm7801115ad.63.2026.11.19.19.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:59:58 -0800 (PST)
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
Subject: [RFC PATCH 1/2] ASoC: atmel: mchp-spdifrx: Fix 16-bit big-endian format check
Date: Fri, 20 Nov 2026 10:59:38 +0700
Message-ID: <20261120035939.12774-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120035939.12774-1-phucduc.bui@gmail.com>
References: <20261120035939.12774-1-phucduc.bui@gmail.com>
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

MCHP_SPDIF_FORMATS advertises SNDRV_PCM_FMTBIT_U16_BE as a
supported format, but mchp_spdifrx_hw_params() checks for
SNDRV_PCM_FORMAT_S16_BE instead.

Replace SNDRV_PCM_FORMAT_S16_BE with SNDRV_PCM_FORMAT_U16_BE
to make the format check consistent with the advertised
supported formats.

Fixes: ef265c55c1ac ("ASoC: mchp-spdifrx: add driver for SPDIF RX")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Note: 
The SAMA7G5 datasheet does not explicitly document support for
16-bit and 20-bit big-endian samples. This change only makes
the format check consistent with MCHP_SPDIF_FORMATS.
Hardware testing on SAMA7G5 is needed to confirm whether these
formats are actually supported.

 sound/soc/atmel/mchp-spdifrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 632da8d7bc81..06a2a5a90a63 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -455,7 +455,7 @@ static int mchp_spdifrx_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_S16_BE:
+	case SNDRV_PCM_FORMAT_U16_BE:
 	case SNDRV_PCM_FORMAT_S20_3BE:
 	case SNDRV_PCM_FORMAT_S24_3BE:
 	case SNDRV_PCM_FORMAT_S24_BE:
-- 
2.43.0

