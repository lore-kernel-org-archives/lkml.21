Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942969;
	b=R927vI7jWcl1U11Lyspg6By5qAvdnTi4Z9JuBER0zBl4vwNX78wHGVoSd5ux7Nfv98P6
	 GazB8RgXhbc7O6IbiipWkCqNhdgcGOPNo5f9fAc+f4+dxUcQfWN9GSAPg2hU1ZpOUae4t
	 nuKCnFEeOt7xRKhpENPaEMgTKJ9BcrKnryUgg7JlX0DKSnMsq4pDftjBLcyqQHNirDvXZ
	 U5B4I/dc+rMuaFwg86io8sSpYwQv12t3lwG/kIpfU5mTEJ7ZhDaV8JQTvUYBlIsY4fDR1
	 zHiOW67qBFJKambFyMJY7cEW+qP3YUFI3DFRhayGgbUkdxiAqtjZGQbPPh1VQCsWTYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=saTeE4vmtn0WPySBkxUfsYGBUMOtngMCE/Ho+pVY+9E=;
	b=AjUEfy3eh4NsggMqGB1Rv1XcnXNy2rm8+DPNJPBfNWgzL8oyYHVaS+qZEINbleMeHXsA
	 l+mt6t5+t7GKWFATqGqTjmdceqDt8QNGRMQf3O07ofGxv3HNchjciltytn1oyDgzs0DZC
	 NoV2YqRVz/rNv+B9i0ldPyBTN0HvqbkJjKQpraptcHOrCxzgNGIeNDzA5GRPe7t7PROft
	 V1+DBfSquZVEZdhKN7iMoKyUCF0RwQN/5YKHs29P9XYhJag7qNm37nJGj8UmYVRfTOBRE
	 hoGDzpWNDMAA+3go8iosjBZyLujXzgE8JAi/iqwsILW4MeTt0+FQumSJdK9EN8bvRaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mz0pJHTw;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB88606A338
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AB88606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mz0pJHTw
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso2359685e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794942967; x=1795547767; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=saTeE4vmtn0WPySBkxUfsYGBUMOtngMCE/Ho+pVY+9E=;
        b=mz0pJHTw+7QpxzzAKLuXN6/+s2NFA3soOVmbRbVNrqy9Yj66hIqODj7kB2i0gD/Fjd
         iHhZPAIaVP7va9Du8/DCsHiUqAUUCwhCp6jI5UoBoPvJZoLHekheEgx2eaZ3HonuPAI3
         nm/B6dxOsR8RI9uwg3qZfol5spcmO6U0IIgTgDIc+tKJoN6hx7r/uN1nafOG3tmzR0PP
         UGmAKbm6lkptFPo8lYDQVR/DDO1IB0C8P1qoOpMNPCr2ld+kJWrW3qjbH3P9lXxq4cWh
         /C7ct7q39AQdLdz6GMaZvcRJyzAPt44Q3qSCdpiwVNl7i7ZrTMKOlJwfL4o6YpiRT/KX
         Vi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942967; x=1795547767;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=saTeE4vmtn0WPySBkxUfsYGBUMOtngMCE/Ho+pVY+9E=;
        b=fazDlbq5QbxueHmi2d6Z25m0J7lot029flh3KGa74twTQGNan5m3sPj420xbotYa5r
         KBew1Qj+JvSQZWeegIGR8WLIvlGH+yEndt28JcVQQA9EI9IJvR2+af9sKFOoZS1aRRsN
         EkNZPX5Uknu92BfF5bDg306td73ScXEHzjrwgdJ6H+ywate90AnOcVQAlF68OmJpHTUM
         E9ywyD4umpIZDNRoS0Q8MSQOOQF3xKsvxDokFdlJFUvby7H5OQjLnLd/YJA/+gWMBpDw
         V+kkcbLHznd20tl1qs+oph/NJ0i67zxE4pNUlPaKsuSr0gNqDohCDzvuhkCoLkGnH0TS
         c1Rg==
X-Forwarded-Encrypted: i=1; AL+hErG8Wierm6v3BPmGT9gnwAMT6ctX4H/AHapLIMi1ZTWmzMvId7yfdu09Aj8SRMPRrDphotUAOykjSGt5tSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9nvgSL748e6cu/T6AIC+o+scwiRwK3CLIgGozzGjnwkELQUci
	V4720lCoF9M2kAxmwmCerVypWkOC+KM1ghSWP5tyV2J+i9GtJgDmfIHtEoUkMod6POo=
X-Gm-Gg: AYBFou2jmI4p6/Z5SGkeicchJJ0Ia9gQJWJnl++hhRuxgqXF//vxEYudkdfsFyYqniN
	yd91g/BwOqMnv7bONDxYcE1e1OOO5hmKNyBpzsdYtQmHuCCPwlTv3KJioXxMoKa7lBfDzgl32E1
	RKnNyIgEnUsYAHyOCAwv1VAHMpPq9gEOcfbW6pHs5PfHNK2xW21T7vDQ8LJh+oj8YJ4tTtkjbRw
	ql++L20ABt5MmPvQOftQYSafInf6hMDLt3o5k1xaI91cr2oqOZ2b6Uc90UWXRkDtngWV4eO9Mxb
	EwqcSRHzslPouiUCw3wGVHvF2eVOaU2HXU57tkJv9sy+eYilZGtVtqMGgHuv6H2RGZ8y3q6ajxh
	iDfkI+EOunyYkFTL4kwqpsK8Iy2s/bvL2NrcH7lkJmn6r7VgBOZ3LmJhAlaaDm25AwQBSUvtikq
	XIYlbWrSNxcTbtNoyImBakBRPhS4FbPSqEWQvaGCefoSehqlPGBEujUQcPTMzkaLJpRM+8pWfcE
	KlYh0tJMB326k+rLiQCGKvsJG/pgh63LgrzxYjtN2ETFEt5IIHB/esqydsKbk5UcAOgbbs5drk/
	ieaaQobkLzbA19gcfIKmNUjrP5vnisokA/0jv67xBf5czKmNLSB3oUBi
X-Received: by 2002:a05:600c:8b8a:b0:4bb:52bd:a3c7 with SMTP id 5b1f17b1804b1-4bb7da2240amr3295515e9.6.1794942966666;
        Tue, 17 Nov 2026 11:16:06 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b8032sm5658625e9.10.2026.11.17.11.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:16:06 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 0/3] clk: mediatek: Model MT8196 PWM source selectors
Date: Tue, 17 Nov 2026 19:16:01 +0000
Message-Id: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPGn/GoC/y2Nyw7CIBQFf6VhLQkgD/FXTBc8LopKW4GqSdN/F
 63LSebMWVCBHKGgY7egDM9Y4jg0oLsOuYsZzoCjb4wYYZJSqnCqB6olnl4Ju/sNk0AFN4aAYgS
 10ZQhxPcveOo3LrO9gqvfyt/I8JjbU900ZE0B7MaUYj12QUoutdeaCLvXnjkmiaHCKy+95YIE7
 q1UjqJ+XT8P9MwYvgAAAA==
X-Change-ID: 20261117-mt8196-pwm-clk-0f154aa0e720
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Laura Nao <laura.nao@collabora.com>
Cc: Chris Chen <chris-qj.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0

On MT8196, a PWM channel can run at the wrong period: on the test
board, a 10 ms request on PWM1 gives a period of about 8 s. The
clock driver does not model the selector that picks the input of
each PWM channel clock, so the PWM driver can compute its counters
for the wrong rate.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (2):
      clk: mediatek: clk-mtk: Add composite mux tables
      clk: mediatek: Add MT8196 PWM source muxes

Chris Chen (1):
      dt-bindings: clock: mediatek: Add MT8196 PWM muxes

 drivers/clk/mediatek/clk-mt8196-peri_ao.c         | 38 ++++++++++++++++++++---
 drivers/clk/mediatek/clk-mtk.c                    |  1 +
 drivers/clk/mediatek/clk-mtk.h                    | 16 ++++++++++
 include/dt-bindings/clock/mediatek,mt8196-clock.h |  5 +++
 4 files changed, 55 insertions(+), 5 deletions(-)
---
base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
change-id: 20261117-mt8196-pwm-clk-0f154aa0e720

Best regards,
--  
Alexandre Mergnat <amergnat@baylibre.com>

