Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202656;
	b=3vj0ldKN6O3sElW9b3GjPSVXHXx7gqbSvL02hombcWKKHgtm7Oko1wvkdqCrUF2CDwe2
	 9pXd2JdsY2VZH60lv1dPJLHXtxyeYPPhI/3UUhf3YydvZymGaQ9ue/R4olq3NMYCm0veW
	 zn9NSUm1xiHdXxFhN7/+UHqfCfRoRqFIc4WgWUyxhPh79Hp0By2ihrljEGyGPBxT4tqOC
	 jWUqvGlltc1itxb1FH0bRBPUP4xieEUouiYFxgn+bIyMhdW7VJsCIgyclCzkTp3Slmu2j
	 y4vKRaQS6bdEJde437Kg78lOdWfmSnBEYfbC+j6vRMVcLA3V/Jz/opYUcYw4+7t8wXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=r1t6hXxpnEN8Y+0K+jURR9P4uCOXwlVnTuqlNkdIH4s=;
	b=JfIsI9e1JmfKxrBrMNVjxcL4GwKkxOBvoXXAjohDnbTj12YEo8LpIq4YHK3KeA/7QcIF
	 ecGl/RJ/V+g63h6ISCbQzGVnNju+LeT0R6Rvd6WZs5NnK3YkEMOH4Y8OWjRivbSCC2a6O
	 KJh1VJDsljiQRXwu517XaGkCk/T+9IMx5TBzSwtvDhMNdJgQ2+ikQHQtQ1gDYI7+Q379Z
	 IfUobVrRuTD0PMeM0fey3N6HOkndOPUFo8PEGVIWEYOXT0XvkVuAa1TpP84NOeYdCTd6a
	 Y2zRRPv7JOjoi2Rvs/NgmMmUwaFgsmNpPX9Di4e2inakh1NqCTtIdvFdr6c7Ip9/yTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ijEouGw2;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36284606A6E3
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36284606A6E3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ijEouGw2
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso2134080eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202648; x=1795807448; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1t6hXxpnEN8Y+0K+jURR9P4uCOXwlVnTuqlNkdIH4s=;
        b=ijEouGw2IxD5Af4o2WQbYNAHV9WMou2u58uhHfdGmwNN2HCyvJrxJTgmOLTU9HfcSD
         A0rEPKvQ+nxEF2B7qE6sEOs7rsyyQ1gF9mu2m8SRu56RGw8y3N1FAQTHkNDyOn5Vq1NS
         hvCYE3uoM4LbyYCa6Mf96RpVljb8R5RR9tH6kssM7SSg2tHLc3oIyL4XX/WmPKr3W23W
         sd78TWYjPaA/tyJc6aBDynFdwfEEPLJyQoAbYzQVrgIk8waAQsSpgNJJqY89egN56SYb
         S1DymwZIXX45UHGYr7Jc5pFt2yCBFOrhaAnijx+m+w3LcHkGJ+1BExM6hUw5yWvEgyXb
         M9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202648; x=1795807448;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1t6hXxpnEN8Y+0K+jURR9P4uCOXwlVnTuqlNkdIH4s=;
        b=otlzyZR1mmvMNeSz1jhP/j3Vz7hXRdmFhZxFjdN/zRoA1SKkVmdBac0J+ElzHXp5eh
         UDnYyUzk3XBeTir6VPcjJk8R2eLUtCIqsiJnp/0cTw2/R80GOBUedOr4uvNnuIv0ixl7
         VbpToScO0ldverpw+Y05gjuC9OVNqg2FXaEl7HjDsxQeVuwn3Ql4rdfIeULbJApV03Oo
         lvu60KWqgZVW8hsoJ9B//ua9Cw4n7eZIUbmc8FATudWaNspHMe8ZOpiZTO+9U96VMi/1
         K0Wk35RIN9Cunm22+cJNT64GiNa5QlL5ASV5JBJeX2wtyhYTUZZ8mUp0NZ0gKPJovfG2
         vB4w==
X-Forwarded-Encrypted: i=1; AL+hErFtZhwf1PGIhvdJ2z+bYS56+A6pciEfEqwn2XDGlzKnwGFZ9HbZ5grmV0Ucl/L/JyGEWIUJ25UqE9aeuK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1TybGvI8zl2fwgHdEIkryTKRL8Xi/9KrEj1KB1Gn+4CCr9+oH
	Fg8LtyTFlCQFYyFgSbm/IoLGGnD38Ov3TaD0zIsIo24ORQlXDKAMSD5Vwcfg58z3D2GsaYobgre
	/1g==
X-Received: from dybmf40.prod.google.com ([2002:a05:7301:928:b0:36c:9b55:8436])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:7188:b0:384:b800:2adf
 with SMTP id 5a478bee46e88-38571027b9dmr3890778eec.27.1795202647857; Fri, 20
 Nov 2026 11:24:07 -0800 (PST)
Date: Fri, 20 Nov 2026 19:22:37 +0000
In-Reply-To: <20261120192237.2870582-1-elkin@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120192237.2870582-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192237.2870582-3-elkin@google.com>
Subject: [PATCH 2/2] ASoC: mediatek: mt8189: clear afe->regmap on
 devm_regmap_init_mmio() error
From: Elkin Cruz <elkin@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

When devm_regmap_init_mmio() fails in mt8189_afe_pcm_dev_probe(),
afe->regmap holds an ERR_PTR() while unwinding through err_pm_put ->
pm_runtime_put_sync(), which invokes mt8189_afe_runtime_suspend().
Because mt8189_afe_runtime_suspend() only checks if (!afe->regmap), the
ERR_PTR() value is passed to regmap_write() and regcache_cache_only().

Clear afe->regmap to NULL before jumping to err_pm_put.

Fixes: 5404599c3292 ("ASoC: mediatek: mt8189: Fix probe resource cleanup")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index f39b01590f71..85b5be6d45ec 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2563,6 +2563,7 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 					    &mt8189_afe_regmap_config);
 	if (IS_ERR(afe->regmap)) {
 		ret = PTR_ERR(afe->regmap);
+		afe->regmap = NULL;
 		goto err_pm_put;
 	}
 
-- 
2.56.1.750.gf70dc682cf-goog

