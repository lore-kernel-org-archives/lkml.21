Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425653;
	b=nX45dwlvqUevsB+xPvXWcgvpHFgejCY1ASx9T11aXd+cC8KblThI0r5pVdeVdrvWy6Vm
	 abXsEopkHvKi+V9RDf197VrareR4g9IEOgU3PyzAIW/s0OKwUVHfDdqXH7jur5M8ytFCc
	 SQox3CekEWJ+Fc+4P/ExpRQDcJ7qQJgm4CyCPO3Fww34zNszmrvNm+aknstGWAXaQEQ41
	 usUgy9kxpG6QMxnuMlmLkTBrw3GIj6eoHWAXnNugD+o2hJRNXkpmY0SRLMVrP75LYN3mu
	 JJejecd+NfQSSZqBagEyDbWTJQUrUItoqeCbcKpKXDfWOVtmWnsZbkT4K3DIIOlEIIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Ig8NpIwfuVm57PMXnS1/HkeHo8NBh9VYFSj4z2Q3cYI=;
	b=NS841QU1GRDjUIZWO7oSbWUs5th0+Wn2pEu5U8fwL/758S2gMd+YK1m3TgLpgxv8Cfmu
	 Hu4qVyuGhwi9allR/mkyZmcENeRms14BQ9FKDthYTNlWenSvNz29ZSV00fPbIZjLBTMsz
	 ntR2mHLSx0283gkffz035eIOVqIRoW4usvS3DbaG0sbL6fru0FftMajS7RKVjK47srINN
	 qTqjgHNEIbul/X/zgK2rjrqL8BxWwmwsVropp0uHdfOnpj9GcyqyKf/nCHjAtZVwHaaYt
	 lMuS86kb+prki+51LeZDKj/YlrVlpuoVO9hLTeveKQA0UzHecftoVSOcGp7FLuSE6eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XauEX3xg;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9986C606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9986C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XauEX3xg
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so37163545e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425651; x=1796030451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ig8NpIwfuVm57PMXnS1/HkeHo8NBh9VYFSj4z2Q3cYI=;
        b=XauEX3xgxlW+dEF3DNnSm27iF0+ozTlnPxRzOiMcl6S9/btAEDGTTCzsov+NVLufQq
         Je15fmg2xLDNCiUpYaqVvad69kFPJoM0HqinIrFHPQ/cfyKXAtbyCkmuy+6Z0Ic2N/3k
         gCjq83F+eE5lep5hR+Cw9ai40QRPX8uDpf0rbEau5DFj/P+QwWuNqyc3X5Ppc2eGqNjn
         vHsfmtzeVQNz7FUN4Kb68sZ48V/Rz2DOvA2qwfxQliRu0YlNJLqsTL1syx/H2JArAmck
         2N8wwa8aOcZnCAJX+E3sdpFk+om9ALJeiSmkCnuK8U9BMa+5KCmORdWspdkfV/uCeCZG
         eigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425651; x=1796030451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ig8NpIwfuVm57PMXnS1/HkeHo8NBh9VYFSj4z2Q3cYI=;
        b=PqNyi9U9JMxVK9oC73z65aI2vJSFtO6DePJopok2h0Y39pzkLdWHU6G/bpb23VofRl
         EAam0+oiT6jdYvuSx2SzcjFUc7uK6XINVgwFuAUS/NYD8CDZ5iUIviqjl17j+lWTDTex
         tSL78yWJIbktaWOX/u/4PAPEXG1reQMQYXWk/sYibjIDnkcDOE1f2hb9Obhx+y/Ds6yA
         DVTxNje5Ov42tS9v/uZ2G9ox8Nfu/+y2XP72t10M5KLW2uD0KC7n/Fvjb9S049dIytfh
         lg8IEoO5ZVHdXOlETSVkZvlxGbN6XqBALylqOzwRd1+Km3ZTD3xg8jXG//SP/xzF3QpS
         /oag==
X-Forwarded-Encrypted: i=1; AL+hErF8qfi+na/tgy/NW8Sw+6S2SK6tjqXSxwpX/IHtN/kuZHl3Zlv2drF3M0KytEQkff0zp2Giwq9YXf/EZWU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d41pAuQ+N7TKQkfCJwdUFnTtXMRK4C2FeoWt0yIkye4VjeBHS
	bJ9tai6ulU4jPxdL7OxytO9GejZfwIz2HpducPluGjFKz6HXrCw614A/aCGPmolsiUo=
X-Gm-Gg: AZFdTZdLzuE6tUyjw6srSt7mvHLAIoBNiMuwX6/w+Om70wLLnJ6wo4cyhvIcxLErw97
	o4J1w8UKVNhEeSRxPcNs6EJao6dO9cTWo0AD2ALl5IZYT32II83Y6k3ir45rUUKjg/y+hguOACt
	GuCz1PmuhC7UypWJAI2Ck12ryTzka/9MHxNadGbm3y8bDingUkNwIKAzSYDq+P+wZJjUsdMAWOv
	cuSO2K/vDttaKzgPIqEQUxnpNsxEcQe+r+3kGN00aeOYggBcezsFY/MBasfpVhiwpiQE/kBHw7M
	xTaRNEBQHZixQoJIaqHgQDJCEGKwiwd8dDf8alTxvqcyuX/tD8SWBOHJiO8egLifoLQfPzAQfmA
	a0aa85PKFbJCCN0geiUJ4wicM4k2NV8qojY4PFBVyEgOotGUagUb0RqDzZsc9QG29p7oFNOBg4i
	07RB+2D0XVTQOqVikYZ9d2xvUQLyIbAjstnjW2biSBIdb8S8K+2iFFUT9lj4OLTqNmLonc/treC
	Mdx05L7GYyi3KWg3aEF4ZR7ibz/udb/h9tpSOumX1tjlTyK7DIRFAsW/jyZLM3nH+I95kmtIUhZ
	8tRayFFz5vxpcbJQJAvc9CfkG65Y7Pgst7bnkBcy6Y/DjQ9Xw7t/hY4tbeE5DUvGgwi5MtMESQT
	FxxP/B1OABisbHQU4TqPT+stpNEJeDjISReOTqL5yUNulHg==
X-Received: by 2002:a05:600c:1548:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4bb88800020mr245433325e9.7.1795425651076;
        Mon, 23 Nov 2026 01:20:51 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm296458505e9.12.2026.11.23.01.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:20:50 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 23 Nov 2026 10:20:45 +0100
Subject: [PATCH 1/3] arm64: dts: amlogic: s7: add the SCMI firmware node
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
Message-Id: <20261123-upstream-s7-clk-dt-v1-1-95f46d67d8b4@baylibre.com>
References: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
In-Reply-To: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The firmware of the Amlogic S7 SoC family exposes the clocks it owns
over SCMI. Add the SCMI node, its shared memory and a header with the
SCMI clock IDs.

Acked-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7-scmi-clk.h | 27 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi       | 29 +++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7-scmi-clk.h b/arch/arm64/boot/dts/amlogic/amlogic-s7-scmi-clk.h
new file mode 100644
index 000000000000..71630bc94531
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7-scmi-clk.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 BayLibre, SAS.
+ */
+
+#ifndef __DTS_AMLOGIC_S7_SCMI_CLK_H
+#define __DTS_AMLOGIC_S7_SCMI_CLK_H
+
+#define CLKID_DDR_PHY_OSC			0
+#define CLKID_USB1_PLL_OSC			1
+#define CLKID_TOP_PLL_OSC			2
+#define CLKID_HDMI_PLL_OSC			3
+#define CLKID_USB0_PHY_PLL_OSC			4
+#define CLKID_USB1_PHY_PLL_OSC			5
+#define CLKID_USB0_PLL_OSC			6
+#define CLKID_ETH_PLL_OSC			7
+#define CLKID_ADC_PLL_OSC			8
+#define CLKID_CPU_CLK				9
+#define CLKID_DSU_CLK				10
+#define CLKID_GP1_PLL				11
+#define CLKID_ACLKM				12
+#define CLKID_PWM_G				13
+#define CLKID_PWM_H				14
+#define CLKID_PWM_I				15
+#define CLKID_PWM_J				16
+
+#endif /* __DTS_AMLOGIC_S7_SCMI_CLK_H */
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 64440df4f542..69dec312e7d6 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 #include <dt-bindings/power/amlogic,s7-pwrc.h>
+#include "amlogic-s7-scmi-clk.h"
 
 / {
 	cpus {
@@ -109,6 +110,34 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	sram@50f6000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0x050f6000 0x0 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x0 0x050f6000 0x100>;
+
+		scmi_shmem: sram@0 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0x100>;
+		};
+	};
+
+	firmware {
+		scmi: scmi {
+			compatible = "arm,scmi-smc";
+			arm,smc-id = <0x820000c1>;
+			shmem = <&scmi_shmem>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;

-- 
2.56.1

