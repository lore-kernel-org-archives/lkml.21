Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996471;
	b=NXdzTDIVDEBjPWPbWKKokEKtvcr2/Nvpb/Wy8eDkDWtD+bg/HIhnw0UNqe6af/pEW8yk
	 Jq/GBPJJfce/oOvKKJ0U6FgLs88nTwkwwp6Q6oBIPfNh16tN1h34kb2WR5ng8CbTL6EHW
	 hqvANtfwkPbq51TGiNL++BKeEMSkb/7toM14Vef9P6EP/OG7BXvRA+XBtgxF/SoaDziUW
	 MBV/G1m0+K49EjdrW5gJi9FXNxS2u+LnkhxsrGhr+Ws7EWSbWnH/7Sa84YN8qH12hi4op
	 6wA9NHbfiMX527BToYGQ5Gm22Qg0E+jxzpqTmXKGajC8GSZEH7BKzsgrrOe5pjeb5Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T5MWPlFjQcs/AXGmMiLfNtV+jA2eKvI6Y07n7HW2V7A=;
	b=qWCV3YUIbNOcwDiZtVoDqkbFjpF/yiaUF8AV659IyXnDe2aZM603BklLIKwqCTUGQ+cq
	 JRZcjVxS4Sf7rhlak9jVk2OB6/lOZdJFK0XTf2X39l8u/23w1SdUCKhmhjYmEXV0m5g1l
	 T3RRrkfplH6NLhGIB/mdW45kttRUsh/eLDxhLFVDYNH+pbpEA0hKAFHqatTEvhY2Nr33O
	 dFO4GhHGlqykouTAt31n8AOcxQNFErymp/5hSVpC2Bx93+jfNXp9MduHXgYBbT5B0ITu9
	 lkG//5mweYCi0ZmdWSbwlMPz6PJRur049Pncc0YbBpdfNVP0XWp0wgL4k6weOoYms7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xNjoaYdZ;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C67606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C67606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xNjoaYdZ
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2efd993e9d6so3457035ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996470; x=1795601270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5MWPlFjQcs/AXGmMiLfNtV+jA2eKvI6Y07n7HW2V7A=;
        b=xNjoaYdZ3fp+JBZdfRLf/gsEcdz8cUOZq99paV2bM6rn9OAHbrpCaR9CQTojsBwA9U
         HTP+rZ1Q5RHwF9wuhl4Spf611fvNSIybZGOFL3Olx2RjUhoUV5Bzrh0ZQMz+CqlNvoAw
         ZWqsBXjmlSHKWmLfzrvd3lfIaftaZ52T6S9J/ZWf91aA53lL0nYrMm0TOcCHW2wv+7TT
         Euc7pgpO50u+K1I6+u676NL8b6gbwlv3DdMDqZsVfaGf8wDwJux5Z8UngbPP3FQj8eAE
         D792mTM9FAOJvTrfgsxN4v2m61YB82ghg0W/w4SwyHisZY2EfZpo6GK3s0m3DZ8XCj/z
         Ub4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996470; x=1795601270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T5MWPlFjQcs/AXGmMiLfNtV+jA2eKvI6Y07n7HW2V7A=;
        b=NhLHziJR6ouQ4a3f+obljKzWvXJzPR/4R0zS68zg+3jJX8MQYH316nzZAmfuAoYS+u
         Gb90RYi2Rw3RRj3ySwiDa1hePz4k41mcfSklErKCvpe9xFg7IiOSKygN6YHpxGpanFFh
         narNdUpD9BhSvulYWZB5D/hRgWmpvxkxAmT+gsJsDRmqcn/++VjjtvPVXchFmdv6aLka
         Ss+1K/LLi1W1Q7asVcnRC/TMRFmD8LSqjdigiCVAvWyO6IVuzTeyznKut/Qu9UYWSHdl
         TNjSr7ZBraHgG2z6s6WIt39Oid4Y9TpSBpsDvVb9xmMwdt8F09FOX5F7V7YYqs/BsUtf
         dz9A==
X-Forwarded-Encrypted: i=1; AL+hErE8Q2jRv4Y13k4JfTNfUCc4DVcRSJxf7s7kWSasDWJN1liI14XwvXU83RvWGNlI5GA07Ce2rLfgAklD1H4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JPZ9yJu2v6zEVx0N4hYAYoD6KJ4SeyvjgsJMPCFIeCsWEd03v
	vIbFz6tUE/ay+/9MYnKTfPQfd+xA77ELGTkWvCCy71TjT0rnKO6WlYl9
X-Gm-Gg: AZFdTZdV1Q9EQAnonQUY1r0Z6s9GnV5KmYczrDUK/9uPHXXZRIJCDzkqT3eC1ttkfFF
	3FVEH3nr+g4glfwsnGQed5wTKNFirDag3kXqLIx19QgqI88vgX3v5IpjPlBo3/GhsEQ5YzhZLbx
	EO3ysVkd9wNvoHwPW4JV4VcJ+eI5dUEA501lXmWNC91/YJDAhnPc4QGu4zdFqvIUgNtI/YGsRjG
	SY5Xr6JHngZQOmKBfMU30sVyXvG6lQOctw3/y9atEi9ypb8Z1tqi6o6F2tI3JIWqGqNIcWm+qaZ
	NOz1+AqaJe0WVfdZUTAaJOT1eWSDiZ54TtJ1PrlHA5WONrOQ1BMxswopKbYydmd/inebATgK38L
	T+BZkdcjGhdNaEyRFsQw2aux9sLSizcSyvA09aKoBtVAran+YsdhsSmb/5YxmFaVmKxk1nKuAId
	Ms3YNXyG1g03w39AI6oX6DXBy4BGIWiRBRqhXfVc4t+DYhKC29VbyKfH1mACwoptZ1/JbKNUvVI
	ZU1PG9etB/EAsr/8MzQHiPssGX6B8wFCZ4CZd9KejDVjAG/wsQV4PpZHxYQVq73Md59NWuJszJk
	Ondr4eMzRq521Us+PaMuuKl47kN/BGoU3YOHPTaOs+RlNyiSDQ4d0HJ+htQdZL8lwXJ0+pJRQBw
	Epjcb1thOjJbWkRwyLocB3ZVPtCalikjL7V5G6Ssj7mBm
X-Received: by 2002:a17:903:1a8d:b0:2dd:c053:b9cb with SMTP id d9443c01a7336-2eff753ebc6mr15920055ad.28.1794996470442;
        Wed, 18 Nov 2026 02:07:50 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6215025sm10634145ad.46.2026.11.18.02.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:07:50 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	jonathan.downing@nautel.com,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: fsl: lpc3xxx-i2s: Simplify error handling
Date: Wed, 18 Nov 2026 17:06:30 +0700
Message-ID: <20261118100631.26658-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118100631.26658-1-phucduc.bui@gmail.com>
References: <20261118100631.26658-1-phucduc.bui@gmail.com>
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

Return -EBUSY directly when the I2S channel is already in use.

Also remove the redundant error pointer from the regmap initialization
error message, as dev_err_probe() already reports the error.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/lpc3xxx-i2s.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/lpc3xxx-i2s.c b/sound/soc/fsl/lpc3xxx-i2s.c
index 757e0619d368..75bd148c1432 100644
--- a/sound/soc/fsl/lpc3xxx-i2s.c
+++ b/sound/soc/fsl/lpc3xxx-i2s.c
@@ -82,8 +82,7 @@ static int lpc3xxx_i2s_startup(struct snd_pcm_substream *substream, struct snd_s
 
 	if (flag & i2s_info_p->streams_in_use) {
 		dev_warn(dev, "I2S channel is busy\n");
-		ret = -EBUSY;
-		return ret;
+		return -EBUSY;
 	}
 
 	if (i2s_info_p->streams_in_use == 0) {
@@ -320,7 +319,7 @@ static int lpc32xx_i2s_probe(struct platform_device *pdev)
 	i2s_info_p->regs = devm_regmap_init_mmio(dev, iomem, &lpc32xx_i2s_regconfig);
 	if (IS_ERR(i2s_info_p->regs))
 		return dev_err_probe(dev, PTR_ERR(i2s_info_p->regs),
-				     "failed to init register map: %pe\n", i2s_info_p->regs);
+				     "failed to init register map\n");
 
 	i2s_info_p->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(i2s_info_p->clk))
-- 
2.43.0

