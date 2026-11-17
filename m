Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942969;
	b=VROu7Nr8CqYOwOEgx0vpdK2AM2ja/pnvAI3YnImOWy1ILTRhaiTtP37uHRpLEGZlLUdC
	 CoWbQFqANAFmIlNtzLzv9ZcpMJgf5xx2NgdKu4zJTo7RgdamTY1DTOkF2dbI3HluKAHQ1
	 fPZUZN9ZqbF5Bx719bxYotWCWmaZjRelec+BiipdbFklcNR0itYM+S957hHgHhB0pf7vt
	 WQrZRJasXK4BZ1GolT/yZRdW7bNUiw3QOuABLv9hXJcQ/u8igJixTwjjXDXUgmR51+BiR
	 1LqAl+5iQt9KGXQPlMstYrsPrsRRSUWojdJhENHeGY9c0EHDEoq1bKsDCleRBPQ8xcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4skSwwjgJ+QuhFrRzKzpNL0Sq3twAwTkr7WjFcD+3dw=;
	b=X8rhmZ/M0IbkpouEsyW68sPNiaGtNrdhOYCweYAvI8OrkBS2XYUJEaWidC+nUc5vA+ST
	 n7eYNOf4pqrUNvAvmkFDzuz8qYz7mXo9TFTGtoMD6fRsDKEo1zFtwIRsRZbCQUt7bRN8w
	 qrIz3IcCvcl3i4tTjiJHTRXYDfBvBNJ59d8cecXIDthhvrL6Bfj13RSeLQtrxopDvj3w1
	 geaqb8BTIPoA0dmvQ5X+HzB47Z8u2v5zct7ytebPood4CP27seoBWD5u/z2A/Ng4ri71n
	 npfXJ4C9Aj0CXlqoSbsnG1VF4lZSxVJOoasCvmIn0zHoXZxpq8de5kEHPkXyL+yrfvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=X5H2WDaB;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F49606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87F49606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=X5H2WDaB
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso2057515e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794942968; x=1795547768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4skSwwjgJ+QuhFrRzKzpNL0Sq3twAwTkr7WjFcD+3dw=;
        b=X5H2WDaBLf1/hp+ykf52OANmdNHeqPeAyMLtayjxq5QX1nmrphBnes4VKPPkFCrHI9
         1SDoss7Zk0PLk9qnjfh/2nVVRBz9FBcDmRshmggPBYUhWKmp9kvN+3NiZ/Ofnhf++Lg/
         F1AqQDRw5bfotsGccqFDKFGMlJFZmxTpsjCUaBL0ZUagR1Tk+lrhweaKQjA0eDRpvXVt
         k1OxXcEKFPVc+PBypetO56RMTXq6lpYmhHCBOkqtN7NXq6hNBD2KdqPiWnBR5jT7JtV1
         u6w8cDUa5jaDxMlv1/Hb27d4petCoWRdTn1EkYZeEmk39dZXAWVhlSdvKe4zuaXdHhtf
         XRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942968; x=1795547768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4skSwwjgJ+QuhFrRzKzpNL0Sq3twAwTkr7WjFcD+3dw=;
        b=a5tdNeevfSuqvGiIH/kwJQRtTyw+jaGMyIgVKcrz0SzBdqaUXtopUeIbbZRmZ7iCZn
         xdlaW1NSZs/Y6h+hjtsD24gpqoEsEkiBjChM/q66dxBv5Jm0CK2Be3RN8iU8I310lXq9
         n900wQAhHMD+kvHFRkzOXMXm26NJ3mzOUQ4ybsfglL5aPnsYWcT7gvxq3V9fXf590VAi
         7KONR6FnW2Qrw5k1zOLyuaobQE8nk9QBEMLSYpl6x8KwCSwDzuupUzVAKv9MtXFxn3gJ
         dKhEUc0l8Bn4cVJD1faSUsArvhH5ETFgjX1+BVXyquZwCage/EpzFU69iQz1IMFh1KqM
         2pmA==
X-Forwarded-Encrypted: i=1; AL+hErG5BJw5a/i7ianngG6TmiSW3+ICodyvhmUlYuGtPYXWkat9t/KlTT7xZpl6xhkre4UrK6MCkukLhoLQ8l0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jtdDSe42Nntkh+DzyV1jqr9Zz/U4rFtCtp9KwbJxokaglZRPJ
	XpxlCWVYWnLLyaPXj5VCxS8pTmiSQTtRGceFTy18r7wElEFvq7hqN7o+hwAc1hzkKas=
X-Gm-Gg: AYBFou2V/QBoynpOsOzKDgjTnLAW3HYJJXhC3AUcVbzrfbrG+1UXjQQ8ByiMDgpUR7B
	3r8uwL/+e2l5ixHL8rOFVc0Mb+TL1WX0COWkdetO+T3lAAYRbvEcQWgLdasYjGHwxzgrsH1zSUj
	UYuNONN2fT/oJF0TdlVbTFEp/KnkKrzblOV8g9fk9N81N1aBS3Ci3wpj9oo69VSvzI33pkjf4tO
	tDX5XtCLZYyhOTIcAh397gOQA1r5ZEfwzM7O0orq9ssEIx0IWYaA+WtSdJHAp6eOLWNM/Rg+w1C
	v4JSv+OELzIqTrTv8L+78MelVCFDJuJquEROLx41YCdRvmXgnBo6IV1gHZKvKim/UpWDADD+nuZ
	S8ZYmvmKG2ehaQIptGtHRq/JcooJTegMmDr+pYwccdUfWFuir1L5buJbP9g0JyPejM7G5E7AmaA
	FUU92+qWNmadLFoovs0sjcpg5pyhr6/noe68JMQiVQXq3bDiHiLQjfFoLqWXq79arcpsVgcbQYR
	T+shfpIV/usepiz1R/CU1XrrthlOMHGIGazqyfWBL/kEeXM6Y1PkHjNi8aKcsMTVPckznY9fFMK
	ASVH3fcWKyN11veOwdLO1I0Z0hCmHGLCqZsuduDu3mMebvgHDWvCO7UhykfwDjp0HUtHtM21wxl
	IoQ==
X-Received: by 2002:a05:600c:3509:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb7d5d66efmr3616445e9.4.1794942968020;
        Tue, 17 Nov 2026 11:16:08 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b8032sm5658625e9.10.2026.11.17.11.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:16:07 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Nov 2026 19:16:02 +0000
Subject: [PATCH 1/3] dt-bindings: clock: mediatek: Add MT8196 PWM muxes
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
Message-Id: <20261117-mt8196-pwm-clk-v1-1-d8725bcea9f4@baylibre.com>
References: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
In-Reply-To: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
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

From: Chris Chen <chris-qj.chen@mediatek.com>

Add clock IDs for the MT8196 PWM source selectors, so that the peri_ao
clock driver can register them and devicetrees can select a PWM clock
source with assigned-clock-parents.

Signed-off-by: Chris Chen <chris-qj.chen@mediatek.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 include/dt-bindings/clock/mediatek,mt8196-clock.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/mediatek,mt8196-clock.h b/include/dt-bindings/clock/mediatek,mt8196-clock.h
index ae0946ab7621..a8008fbf1713 100644
--- a/include/dt-bindings/clock/mediatek,mt8196-clock.h
+++ b/include/dt-bindings/clock/mediatek,mt8196-clock.h
@@ -290,6 +290,11 @@
 #define CLK_PERI_AO_FLASHIF_DRAM			31
 #define CLK_PERI_AO_FLASHIF_AXI				32
 #define CLK_PERI_AO_FLASHIF_BCLK			33
+#define CLK_PERI_AO_PWM_X16W_BCLK_SEL			34
+#define CLK_PERI_AO_PWM_PWM_BCLK0_SEL			35
+#define CLK_PERI_AO_PWM_PWM_BCLK1_SEL			36
+#define CLK_PERI_AO_PWM_PWM_BCLK2_SEL			37
+#define CLK_PERI_AO_PWM_PWM_BCLK3_SEL			38
 
 /* UFSCFG_AO */
 #define CLK_UFSAO_UNIPRO_TX_SYM				0

-- 
2.43.0

