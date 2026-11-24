Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514194;
	b=p1u5k3tE3tj6+d8+oY8ffAxzQNWLt7yH4SuS9MdbU6Z1g3rNmDNQ9EBzEV4R5S8DyAUF
	 j0V9zTXurxV2oOFTbM5mJ0CSi019w5W1vjsmbzRrHP6sU5/hHQzQFT7uSlVQdmhhtDxE1
	 4GA9CoW8CnESjg7kLaDZdGR+PU9E3tJ/khar01wmE9r5ys3LmWK1N5V9sZMnsu248NZ88
	 Ne7i6YsF55cmD+ANJspNnnm9dP6h9awldbfA5abTbwDziQanhjYeTrwEkzxlUpVilth/H
	 +nahLa14nq71AAdSEXI44ZmNzbbxiTdW6PyvbzD7GF+dFffcdA+AJJes5nUAr5bzF2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xmnB05OFBqRK5KT7n/FEDBwbB7ml+xB+YEvxP4wnFjw=;
	b=Dg8t42CZekmiVkLU1WV/eAdZUhdxjvjTSbJAm3lJLpcHQpunp4Aw6lvEl3y1+W8HT0o6
	 PAerWyfgmCV/vVQJFgwPxP/a/OCJe9LCK0ymIAbmWwuCvN5QjRXSihNt8MUOdeNqWVrg0
	 aZ2yJwYerYFh9yGF/CUSVXej7V1q5OJQYymJMdAbCIBR+Jv83E7P57r0edCMoYiMDzg8v
	 wJ24Y3jhxLxopOEC045LjS7MkWTbuOBUUmQWRI5dLQsp/g9Ym3GRjT1PLJCnr1UTobVGa
	 CyWWbZjDx9TgkOxz8m+O+jlSmT2a4BYbb1W/00vOvOdLM62sJj4nyLA5NZ/U9M/6v4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fHI+3cV/";
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6579606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6579606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fHI+3cV/
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a07078200fso2163880b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795514193; x=1796118993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xmnB05OFBqRK5KT7n/FEDBwbB7ml+xB+YEvxP4wnFjw=;
        b=fHI+3cV/a0MWUI5HgdFWOzmhhVmUTFbNwxJbUBcxZ4xzVit/U8y7tMl9Kf9FDe2UBT
         wBvrKWbRSCzpTYrls+E7NsW0CYX8ljva+T1cx+xahKywPS9oxC1Jm0lLgJuCZ2STQLOB
         Ni5DQEmmgM4pCjopIF1vQfJWy5N9jqWFGnDmvAfVSbxUSU0Vt7Tp18Y6x291e+JbVclN
         3M9OTFe73sluKCdmyEimeI80uXtkmizi9jgoOKcQ6vkpa2kfsAJFJ9gsTxbdv+SZ3gH/
         IZnpl2knzm7IAXs/PDutvtWpgtDvRdV1RbO8gEwIskpYPJqZhySePA8aJHJ8j6VulQ9z
         1x5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514193; x=1796118993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xmnB05OFBqRK5KT7n/FEDBwbB7ml+xB+YEvxP4wnFjw=;
        b=c9/F/E4WzPrYBEjld32D4GBE7c9gDp/A7GYnS6FSIWFhAkTNdMqbRnQUQnsa18Kt7b
         WP693u1CrpT3O7OKI+UvlbBhZhDe8o+uRXngVeqi/oMs3FyQtPRpWf5a6OZSUQ7yMrOA
         ZwW00uc8/48OOoYMj4FL6CUYj1t2oAesCU31acFCgTY4OKZpewn0Lysh6uKywQSWps4L
         qVC6FjsxgZ9ddnOy1MVp7kSdTyEHe3MAilFLgu8uekEAe7wTjVFTB9NafzoOWEeYAZal
         xX0FDiPYVuwbIJzv3ldjPeT+nCb23oB1APoTXVjcTLvBhff4++uk230QyYSBw7qLOPmV
         WovQ==
X-Forwarded-Encrypted: i=1; AL+hErGOyCIZKKoaGZtxG67vCs0uv8wwS5Y7HdI0bcMzXgtTjkT1RXzLvT5gcAgN69e6GKLP4oKny4ARwEAH5iA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QiarqrivX0wz/w9TpzVCQNNxdHkWgsJ6CUbV7kvCzqTbmuvYg
	b0bHrlsQEMkfW8kTFpfMj5lSHfVVuTiI88gxFGOHwyDNPdpdfnO0rRs=
X-Gm-Gg: AZFdTZeMUzQWwk59t5Bgjo8l6FpAEOFwUJbvL1spndZWMAZjq2bg3qJcovniKPX9ZRH
	xLmIq4aLVRfZuQHZJBitB9B2Ylss+QLw+Rk+4NZAAPWsxuIyvjW4IFCRAiDRXxqs8Jq9UYB4Kw1
	SU2zdCBu52ltRYEb6ufquxpX8PGpnv42ZMcRmAglOmXOmrfIr6ivmogwGv2lzmX6X9mOE/A3dUE
	Z9oSwynoayD3UbyVFkn/x8sPCMIUToZSN/baZQ4tVGPmAAjeezyioT8XD4bJtQ7PTscpM4FjR68
	8IUt9Ho0ogkNdYJBZEm+wLxY1ORHtANYPL1WUkHM/ax4hxyshArRsTss2ELZE7ByNHFZSMz8mPn
	CWDAXu28A61Bc06ADaUrJi8ehtAhgFzWFY9vq9v1CK0XJeiltcyWT8C9C9Fesz3FbrYdBjFmF3f
	PLAXKnC1Fq85m6pY3tRDsMNdkkifmOQs1GuA+yp7TOi/Y6x8adgRudkJCLHFNZUcc3ovdUMcFoo
	DnUbXjMPCoQEnNGQXRno2YdnGaq1zgMP3KBtE6FyjYfRbzLKcQFNojtW+o8tSxzdmIbg356u9UK
	+Ujq+PFmU4mtsQnNQ3AqtkFkSl3ujqWOovQcnJw9nPMMxnR2Z0AcpQQGK5tlWG6rC1t0
X-Received: by 2002:a05:6a00:4207:b0:886:77eb:38fb with SMTP id d2e1a72fcca58-8c87c480419mr11371810b3a.25.1795514193146;
        Tue, 24 Nov 2026 01:56:33 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:5da8:85f0:b5f6:2eae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c272sm7075747b3a.19.2026.11.24.01.56.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 01:56:32 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: samsung: snow: Fix private data and node cleanup on remove
Date: Tue, 24 Nov 2026 17:56:26 +0800
Message-ID: <confirmed-20261105-21-73b8787ecede@gmail.com>
X-Mailer: git-send-email 2.50.1
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

The ASoC core stores the snd_soc_card pointer in the platform device's
driver data. snow_remove() treats that pointer as a snow_priv instead,
so the accesses to the DAI link and clock use the wrong object. Obtain
the private data through snd_soc_card_get_drvdata(), as the other card
callbacks do.

Also remove the explicit put of link->codecs->of_node. After the modern
DAI-link conversion it is the same node that
snd_soc_of_put_dai_link_codecs() releases. Keeping both puts would cause
an extra reference drop once the private-data lookup is corrected. The
helper alone releases the codec references for both supported bindings.

Fixes: aff8d2bed9e5 ("ASoC: samsung: Add HDMI audio support for Snow")
Fixes: db1623faa432 ("ASoC: samsung: snow: use modern dai_link style")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
AI assistance was used for analysis and patch preparation.

Based on next-20261104 (8b7179210b22).
Compile-tested: arm64, GCC 14.2.0, W=1, sound/soc/samsung/snow.o;
baseline and patched objects built with no warnings.
Static source review; no hardware, boot, or KASAN test was performed.

 sound/soc/samsung/snow.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index 66ef49dff1ba37de3285cbaaf1293937d6bb0b77..64b3e2e41c2142117cb7d782b59302804d33dda7 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -220,11 +220,11 @@ static int snow_probe(struct platform_device *pdev)
 
 static void snow_remove(struct platform_device *pdev)
 {
-	struct snow_priv *priv = platform_get_drvdata(pdev);
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct snow_priv *priv = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link *link = &priv->dai_link;
 
 	of_node_put(link->cpus->of_node);
-	of_node_put(link->codecs->of_node);
 	snd_soc_of_put_dai_link_codecs(link);
 
 	clk_put(priv->clk_i2s_bus);

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
