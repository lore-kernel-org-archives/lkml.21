Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942972;
	b=KJCuEATJAmDRO0+7Be1n7ZH9WCMckg9v4+1fsOJo3ulry/9yCG+FxsPb26OmFbHdYE5b
	 +J591kCKvSd67UPczRE+Uw6uL6Qx8klDBwGPxHc7h3m4ncLI60Xt0IrkJbVExAq8UOc3D
	 wDkSeRH/HUKvpd8ZP2LQuBWq3Drwhg8EkSK2fDF0VCBQN7LFTxaOvB+7ziRgj1Kzpc19M
	 TmJhBearVowL49GbIVi3f09xoX1bq2xbbzOm9SRQ7WTwJ8K96XFve1qNcxqD8pjuGx6FB
	 obsKsq4rnYGWwMBqPhoq0PRh7bR5cMXcJpzLMcy5eASRLLfLr5O15/dm+Stdzy7KK2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=lSmLsRsGHKysWf9eIOoeDWnk3aBAslOlmRQvenWBQVw=;
	b=3TdVnTuX/HT1nyr04uBr/gKNbzYHKJsNwQqzuJ1fz/zHfxJ1Uuk8v+RSCJ9A6x/7lfMY
	 UhcUhjRCo39BGPKbUakzaxq/tSepF2wR8FgVTooZgBpW4cBL9ZCa2p1j8dI85rhj0auWu
	 oj02vtKDYC4HTvbKSboNgzHkIqdlU9P61MIO7nAbW+1sqqmvgUV/8wOytxESKO5n8vOcQ
	 A9pM9Puy3ruLLrZuQcLfc5NFBo+gTXn97Iz+hmEAOf40qTL4gfEoh1aJ0/qf7lWr5Utvi
	 EGSvYkdCRultHfxpXFNZbfI8gF+L8UMUIxzEQ2fx9YxQWg/B2KAZYZxhofFX0vUjAlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MQhSiGUi;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F075606A89B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F075606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MQhSiGUi
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso2057835e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794942971; x=1795547771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSmLsRsGHKysWf9eIOoeDWnk3aBAslOlmRQvenWBQVw=;
        b=MQhSiGUiKYUNjsxYbJpr2H2peA6r5L/6blxVL+o7hYSjwkW9K51Dgg8z87VH/nu6KU
         80618/BBuEQ2J91nD/FbYuADN3buxR3bYvtL2ydAsl29ILU8yYxz8J4TK5aVE4YiSZFP
         NZqTgCAklUOHG0GCZKYsI9Grxd+st2Sl9KPPwagq6sLCxpiwCfdpGavgOgN+4nkwjWX7
         olkjQKESHgYd1/or5dtLJDzahK5d9Dk4THXEg8bvZjviKMj2LwTFir9HumfUGfDN++ut
         2Nuk0hpUipZyRYZPkVRyfVWNmYO4vx7Sy3HZN0w/eclaOS8gB0JiTL17ImgkEcUTZFNy
         6s9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942971; x=1795547771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSmLsRsGHKysWf9eIOoeDWnk3aBAslOlmRQvenWBQVw=;
        b=UqcV6lJ/xxZ9D9atkWO8H4hwHYvrj3uIuN/kXmLBBmNyY+oFfoEAeuMPNgJ0PmneGI
         I7gsaAFUR83hVK4DQ1Ie+Zy94SmxJAMfIaKdFpLPH8yZBy/NMqHItWKsBp257gYVmKm+
         xEAIM+39FBy/PTHEnZ+ivqYEGua1A4gZCM59N2cQASId0faEztYxzFYfHQZuPkkSQBJd
         pG7alVn/jEFQekVeFxQbXQbMZA4rb2XanEpG8Ni5uXF8tZIh1T7o89z7VfqkIqWO3AOT
         S8hXqbcKeatAwnpTUup2QG6TbIIj7sDxzMvUjuI15Gf+XdYiimRgI4NH49efaY91Fr2T
         2g6w==
X-Forwarded-Encrypted: i=1; AL+hErFXQkT5vEXuQ6pdneThx+WT4OUjc3qc3Yb+R0AJVTQf6xXPs1fzmo+NYA0SZ6h+UNZGo8wkypson4dzLuw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q/DdOQAYAcJ9O0XzVXSXyrRnowacpBObBojvRDKyEgf4J8hrT
	wAUEVowCeIibIGxlHb7J7eqqYvqawg+Qw3m6ffb5GUzwnryBA5wwdYESqIiUM2HjelU=
X-Gm-Gg: AYBFou1Eg04nzneXlreVjyCnPiW8im7vuWivxMldCN0OYT63OMaf+qsWiT2DOley09C
	JEjfWllVxnomisXXtX01Tc3GEJHPy04kqZdlLJTdqg2nj6bOGS+1tBdyVkDjhAw2+cAoE6TFFoo
	1LOmNKY+kFwfvM3Z6WDWzQTnF16wlA+ah8Gs7XRVNfW869DD++pnRkWSO3PWUrIQwV11NlNkyUV
	yaSRIj56Tua9LU0lcdYQC2d7doVJWIUu7KQqjfEAg6n7Lv5lCGBKwomrB0nu+IET6i97ssVwKli
	Y72kA4q+HYD2grKQYTMeEO6LIG9qUo+E3YSyvIKXjT5BcwtgUdZCGF9PHl8DDklmjUMsLxnHH5u
	uOqbei6HlkYSkjdKwgFKUXykzYYjJ98ytlUqDES5nf/ddABvBdYV4vp9lmLiomSMiZhfX5i9CTn
	ht8HveFWnEFciORua846v6KOT/TKWcRs0DXl51csLJX/jBdbV9KCWR7RsIbZWghwImq4uFFNFpi
	tBk/ky+LnwCZboez47xvF9l96vI2smP+CKtygWFcG0B5yNJQGWMrGKDjsmrkG3kc+NpUxp0HSj8
	WyyAejkQ+3egovf7oTdrtG0Oyh9yvioW2JfUti3vUlojO5EHUexJCEpz
X-Received: by 2002:a05:600c:4fc6:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb7da26fc7mr2486695e9.20.1794942970661;
        Tue, 17 Nov 2026 11:16:10 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b8032sm5658625e9.10.2026.11.17.11.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:16:10 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Nov 2026 19:16:04 +0000
Subject: [PATCH 3/3] clk: mediatek: Add MT8196 PWM source muxes
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
Message-Id: <20261117-mt8196-pwm-clk-v1-3-d8725bcea9f4@baylibre.com>
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

The four MT8196 PWM channel clocks and X16W_BCLK each have a source
selector in pericfg_ao, choosing between clk32k, clk26m and the
topckgen pwm clock. The peri_ao driver models their gates as fixed
children of the topckgen pwm clock, so when a selector picks another
input, CCF reports the wrong rate. For the channel clocks, the PWM
driver then computes wrong period and duty counters.

Model the five selectors as muxes and parent the gates on them, so
CCF reports the rate of the selected input. The selection made at
boot is kept, and consumers can change it with assigned-clock-parents.
The selectors do not forward rate requests to the topckgen pwm clock,
which all five share.

Fixes: 212779900009 ("clk: mediatek: Add MT8196 peripheral clock support")
Co-developed-by: Chris Chen <chris-qj.chen@mediatek.com>
Signed-off-by: Chris Chen <chris-qj.chen@mediatek.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/mediatek/clk-mt8196-peri_ao.c | 38 +++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-peri_ao.c b/drivers/clk/mediatek/clk-mt8196-peri_ao.c
index f227a86c5d60..00873264c18e 100644
--- a/drivers/clk/mediatek/clk-mt8196-peri_ao.c
+++ b/drivers/clk/mediatek/clk-mt8196-peri_ao.c
@@ -85,11 +85,16 @@ static const struct mtk_gate peri_ao_clks[] = {
 	GATE_PERI_AO0(CLK_PERI_AO_UART4_BCLK, "peri_ao_uart4_bclk", "uart", 4),
 	GATE_PERI_AO0(CLK_PERI_AO_UART5_BCLK, "peri_ao_uart5_bclk", "uart", 5),
 	GATE_PERI_AO0(CLK_PERI_AO_PWM_X16W_HCLK, "peri_ao_pwm_x16w", "p_axi", 12),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_X16W_BCLK, "peri_ao_pwm_x16w_bclk", "pwm", 13),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK0, "peri_ao_pwm_pwm_bclk0", "pwm", 14),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK1, "peri_ao_pwm_pwm_bclk1", "pwm", 15),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK2, "peri_ao_pwm_pwm_bclk2", "pwm", 16),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK3, "peri_ao_pwm_pwm_bclk3", "pwm", 17),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_X16W_BCLK, "peri_ao_pwm_x16w_bclk",
+		      "peri_ao_pwm_x16w_bclk_sel", 13),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK0, "peri_ao_pwm_pwm_bclk0",
+		      "peri_ao_pwm_pwm_bclk0_sel", 14),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK1, "peri_ao_pwm_pwm_bclk1",
+		      "peri_ao_pwm_pwm_bclk1_sel", 15),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK2, "peri_ao_pwm_pwm_bclk2",
+		      "peri_ao_pwm_pwm_bclk2_sel", 16),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK3, "peri_ao_pwm_pwm_bclk3",
+		      "peri_ao_pwm_pwm_bclk3_sel", 17),
 	/* PERI_AO1 */
 	GATE_HWV_PERI_AO1(CLK_PERI_AO_SPI0_BCLK, "peri_ao_spi0_bclk", "spi0_b", 0),
 	GATE_HWV_PERI_AO1(CLK_PERI_AO_SPI1_BCLK, "peri_ao_spi1_bclk", "spi1_b", 2),
@@ -117,9 +122,32 @@ static const struct mtk_gate peri_ao_clks[] = {
 	GATE_PERI_AO2(CLK_PERI_AO_MSDC2_HCLK_WRAP, "peri_ao_msdc2_h_wrap", "peri_ao_msdc2", 13),
 };
 
+static const char * const pwm_src_sel_parents[] = {
+	"clk32k",
+	"clk26m",
+	"pwm",
+};
+
+static const u32 pwm_src_sel_table[] = { 0, 1, 3 };
+
+static const struct mtk_composite peri_ao_muxes[] = {
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_X16W_BCLK_SEL, "peri_ao_pwm_x16w_bclk_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 6, 2, 0),
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_PWM_BCLK0_SEL, "peri_ao_pwm_pwm_bclk0_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 8, 2, 0),
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_PWM_BCLK1_SEL, "peri_ao_pwm_pwm_bclk1_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 10, 2, 0),
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_PWM_BCLK2_SEL, "peri_ao_pwm_pwm_bclk2_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 12, 2, 0),
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_PWM_BCLK3_SEL, "peri_ao_pwm_pwm_bclk3_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 14, 2, 0),
+};
+
 static const struct mtk_clk_desc peri_ao_mcd = {
 	.clks = peri_ao_clks,
 	.num_clks = ARRAY_SIZE(peri_ao_clks),
+	.composite_clks = peri_ao_muxes,
+	.num_composite_clks = ARRAY_SIZE(peri_ao_muxes),
 };
 
 static const struct of_device_id of_match_clk_mt8196_peri_ao[] = {

-- 
2.43.0

