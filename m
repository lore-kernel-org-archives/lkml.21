Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185746;
	b=v4+OTPSHIYXJFP2q82IbeeoxmA5XMsQLd8in0GFGtGmkv8tpzkwJvpaTBEBTKvFsresf
	 cisKmhzhURX7X9lhhNdFWGt28dfscly+lHvtZMmZSj4L/VepswiP2JOgNrtHUytGSjnS9
	 ZuMtK5zrRcuzxU6u1FCHst68mQqffq0LkkGDwb95bwrpnbCr8/MSR0OZpOcAH82GI1htv
	 INSSgDknvKVIpHNL+fep/U20ssPkjKWMP9eqa+ghj6CaTwO4qp+nZd9cnlRek5Fy92Psg
	 EHd+XorHblGym1qNZw663Y23H3cRVI09E/eqNqStcMZ6QfhCzK8iOUrMNcwBAVP1pSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vUlQyjO+S1Bvb+8g1Ae/7d4LlLIZcUiABix0J0NIufc=;
	b=atNxBb5CaORgvS9bp9Sni3kpLoG2eVrtFnVJhoeepLbccPRrO3pVHrWj0cBZQFOCdBqS
	 KVrV7lCsvTeZRg9nP2q+6YkVBlMSosOUkWQ4+Wy1l/fvFWOr0KEQjIFdQjmZ8O6byH/HX
	 GgJoWePfzzxeRvZ7eGAiAatSHcn96NMJ7sZrl81x+SYZ9tOwjkVBMwRdZUPvNrJDx97yh
	 kmWDD+b/RUeS3WVlPZD7AxpSV3Qkde17sQR6F2Fhh4pVFZbXJ0mbDJoipvF2NxtEI3hyW
	 gCLaLZsO8fXuFe3AfYYQQz1YNajhWGEMypLTX5ul87uchJoXOJO8Y1o0rKXRMAGYxpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XN53hXGb;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69067606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69067606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XN53hXGb
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso563094a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185746; x=1795790546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUlQyjO+S1Bvb+8g1Ae/7d4LlLIZcUiABix0J0NIufc=;
        b=XN53hXGb74WaRLq1kF8RHZti2Bc64/RJ8lMSPet0uZ4CKd0AhsBtFeOUG8R4JKXqmS
         cM2nnvUvD9lcpDvR4digveTQnii3t8CnO7d35a/Vsx7BuJABaDwrAI3LTcFIToZ6o9Aj
         mOwDdSXe4wps2aCp80kubl+LEGqMSZNZ+KrXR3LIVxV5JZRr9iQ3tLTzg2VHt3zre+Dg
         9nAOGZCHGOfuZH17EWv+QVLS9QMryB5/tFmiDCsGQXEPKRRhzy2Sk4lLxLyx9k2vrbC3
         YYi9LKvue4avVyO0vrcwUDhPBWuwyzUL4BbGZVexDfwm6qrm2isnewcjEoI/zk1j8hhs
         nj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185746; x=1795790546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUlQyjO+S1Bvb+8g1Ae/7d4LlLIZcUiABix0J0NIufc=;
        b=onzSR6KfKpNWjfTZpCDjbeuP7RyqvFgpMzMYiZZinSZPwXzOVrvDXyEAsKEpysCnWY
         DFD9NL1Ca1ksKH6XuqYDMycLhZDGFFRxKSvRxG0qBQ0dQqwDGf4ExL9a+c1QE5IiHdNF
         cqlWDeqGz1c8ZYpxTsR/CeWlZuu/fNdnFm+wmHRAQefSLH9Xn1g73pK7O6jEcBYFpzie
         fTgsFqWpyc71G99lSrFD5krkhCnJtVE/jqX380Nxmy0IS8gnD3CNcKXxerNV32VwRjnk
         f8T68zCySxwp8j5yVJ8OI9bcvNQFVYX4hTd3jGionIbvVpVEuiekF5fGa1u2hvD1iud5
         5bGA==
X-Forwarded-Encrypted: i=1; AL+hErGJRq/ywquUQ9FDOrP353N4F/f5Lad+r5zdbhAOoNGxXuuyDEO6k5OymsSsv8Cw3mFXvVS4Wc2juCkkLJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oVl0yAuSdOajx4Pw/RyOPNkowyFs4OgS9Jgu/XO6suxazc8XG
	g3yWbZhvULiMkvtjnaajY2NhCljvVYXQCI+mPX9lPQYGGYbp2tA/R+SX
X-Gm-Gg: AZFdTZfD817HwnCTEN565lwtKTM2baW/SZ5+FUtXXsxKryLQOcqOeM/p42xX2jz3KNW
	JzMdAJIEW7v8wEM2EpMeSVuhT6mujfB3YLFH0kWnhzlAwWKS+gZjljjqcA4xT8BCOekv5ipC805
	ts+sNMx5FWSadqW4mThMwNv7xgn9d6OPJM980A2+65kkkOlZ+70F67AB3hFYJuptUMtdCfZNkZv
	4nD+SSehNwNu0ZNCLkYpuP9v1iZ4lyEmbPbFxI5JsSpwADTuKlvdc4l3+nqeYRbFGz+GKEZJrDS
	HcVYeNlu2YimUhAGMWyz5vmt/dvuBNu10var23E5Bj/xqWJrGnTh58jm3i5vIDD+Tjw4mplr0KL
	MhhYegUMuHu98EwOjlouAyPsF2hHxeEgcaKi8frG8fPNWRE380ngUkVsNZKzCD9i9ao0S+5OuTK
	Vf/BI70OnPVftuhUiMQ/t0t8neZH9Pd1UYRgfB4nRXoMazneL6xCm5rO/ZAbsU1m9FzLmeq1fQr
	Bnppq30iGwl/6v7KOFYRuzd/2DLiLLSm9Aqyhr/eGmmBJNkODlMSMyHR7cPYP0j5latVomeMQd1
	xaePUmtgUvbSAEJ4pH5WoXQtDwijzZMHYjYsjg==
X-Received: by 2002:a17:90b:1802:b0:3b0:c11a:9026 with SMTP id 98e67ed59e1d1-3b41c95fa0cmr3172758a91.55.1795185745681;
        Fri, 20 Nov 2026 06:42:25 -0800 (PST)
Received: from [10.98.15.223] ([2a09:bac1:6500::19b:170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm15346435ad.10.2026.11.20.06.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:42:25 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 20 Nov 2026 22:41:46 +0800
Subject: [PATCH v2 3/3] clk: mediatek: mt7629: add RTC clock selection
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
Message-Id: <20261120-b4-mt7629-rtc-v2-3-cd877cd496ae@gmail.com>
References: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
In-Reply-To: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

CLK_MODE bits 3:2 select the RTC clock source. Selector 0 uses the
40 MHz crystal divided by 1024, while selector 3 divides it by 1221
to provide approximately 32.76 kHz. The integrated Wi-Fi needs this
/1221 source.

Add the /1221 fixed-factor clock and the RTC mux so device trees can
select this source through assigned-clock-parents. Keep CLK_TOP_RTC
for the existing /1024 source.

Selector 1 is reserved. Selector 2 is documented as an approximately
25 kHz PMU bandgap clock, but its source and control are not sufficiently
described to model it here. Leave these entries unmodelled while
preserving the hardware selector values.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/clk/mediatek/clk-mt7629.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index 517c43b19f18..4843bc55dc7c 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -17,7 +17,7 @@
 
 #include <dt-bindings/clock/mt7629-clk.h>
 
-#define CLK_TOP_NR_CLK		108
+#define CLK_TOP_NR_CLK		110
 #define CLK_INFRA_NR_CLK		6
 #define CLK_PERI_NR_CLK		22
 #define CLK_APMIXED_NR_CLK		7
@@ -290,6 +290,10 @@ static const char * const infra_mux1_parents[] = {
 	"armpll"
 };
 
+static const char * const rtc_parents[] = {
+	"rtc", "clk_null", "clk_null", "rtc_32k"
+};
+
 static const struct mtk_gate_regs apmixed_cg_regs = {
 	.set_ofs = 0x8,
 	.clr_ofs = 0x8,
@@ -372,6 +376,7 @@ static const struct mtk_fixed_factor top_divs[] = {
 	FACTOR(CLK_TOP_ETH_500M, "eth_500m", "eth1pll", 1, 1),
 	FACTOR(CLK_TOP_TXCLK_SRC_PRE, "txclk_src_pre", "sgmiipll_d2", 1, 1),
 	FACTOR(CLK_TOP_RTC, "rtc", "clkxtal", 1, 1024),
+	FACTOR(CLK_TOP_RTC_32K, "rtc_32k", "clkxtal", 1, 1221),
 	FACTOR(CLK_TOP_PWM_QTR_26M, "pwm_qtr_26m", "clkxtal", 1, 1),
 	FACTOR(CLK_TOP_CPUM_TCK_IN, "cpum_tck_in", "cpum_tck", 1, 1),
 	FACTOR(CLK_TOP_TO_USB3_DA_TOP, "to_usb3_da_top", "clkxtal", 1, 1),
@@ -463,6 +468,8 @@ static struct mtk_composite infra_muxes[] = {
 };
 
 static struct mtk_composite top_muxes[] = {
+	/* CLK_MODE */
+	MUX(CLK_TOP_RTC_SEL, "rtc_sel", rtc_parents, 0x000, 2, 2),
 	/* CLK_CFG_0 */
 	MUX_GATE(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
 		 0x040, 0, 3, 7),

-- 
2.56.1

