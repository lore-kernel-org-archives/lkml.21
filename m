Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939893;
	b=xt+lQaYLKdBo6K9PdtlyDdbhxJstdoepawcenbwPqkJaD7h/NR4Bn/VXW9z6ZR0rQXIU
	 Y/nM8BfZT5ojpoIzveQ8ju/O6XfE7WOHiKgFpq7Hn6wzX2se308AtCi1jj2Zr5HQV7LY9
	 6ukEJTqQV4c/yZAXV+OTWxNqzONkNzy0v6I6YxwqdwqI5LgmMq1GXh1i66nxUqQLLn9JB
	 scc4Y2/qaNUqEvqb+ytFSU09voIWwDi1zm38CqbFLpdq8gh4ZqkageTQ63egPtTUhZvcM
	 Y68YYZ6Lq1fxFmExT8ydmiPhk42Ph8h6vKFtyjSlsNcZMknkndn+P5bsjLsP33oWerA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
	b=Y5d0cBEyPkdOKQ9+bFsjSpBEK51bCGPIfEodsyjbE2Jsf8lCkEo16edc4eej5NZsCmRH
	 1iGxQ4bsxmnY2FNWwuwMHMmIJMTfJqwK+Tu2KTbyHu1MPJrIvLCnxPOdcaJRA30lnXGCZ
	 6V4QHT7LgVn9Bv1r4kU2Wwyx8RIY8y7beHaRKq7+2W5wueCiamIlg4Kz+KmHCKbLrZcUd
	 BzeQecC4cAyLj9Deak5dfXnjpiAjstMb1R0VwQZND5gT//WuHddJTbH5/uxmUl/P4d9yT
	 6DnuK21a6cHG50eW2wi0yOLnPQCvHfz7QLCdVe5WE9piZkqN13bOjc1CE258qArV6eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AKGCZgfG;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A893606A339
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A893606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AKGCZgfG
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dee593f18so53552f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939892; x=1795544692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
        b=AKGCZgfGTz8EnswKU3d7bOW6q+rT8MZTnwi/z2EMkHQrUpYtrh0t+VmsqSl4hrJxQI
         bEhakojJk/JpVdRPE/ibm1qJtCWtBXSZ0yn5K2OpzGryuP4a6o2Xnnf/SR4z5EXvIsK6
         lGAziiL7E1lDIqmVV8qxx17tBMo0UmkZFThIH4HhasmmP5qrhuLopXuljfYeUq3I9hpd
         6dZPm979Kiw68jtYQOilIoIYMAMWkLmugicYQS1jxKo+ujtNTAGJTpFczkmFXxmpOxKe
         RFnn4vrAoMoeSNKYSilEaWsO5/0sx+WWPG+/tR0tFP0zJ5VD5XbiUAyADj3Ftlr7AYS3
         LY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939892; x=1795544692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
        b=iMywoOSS6onfC7GAW/5LIx+roBgKGpqmhqg/OA//MF/6oZjaLgl6gtT5aO6jIwSEBq
         g6Vfp/mXHKvKL4MayZskMGR0tgnRtYtyl7ie7PZ9RUWIrk1U59fkLT3o/oQFv2MvpZcK
         saGLN56Q2UvX+Ap+3J6d3JeDuibtbNdgmAW3QJ5DCDjrgIgqJuv+bnSyAIsY3mtk4pN+
         SuoVse4ccoEnGGOeyoz2a1A2wTAhmpLlYGxYqzVewMD7Ng2hCP7h+UZ5nsx1BgqmlhZ4
         3krsWDoVaioboGSjs1BqkkcaRH1IZbTMmnmhyX9OWtFL9UTMg2uR5xb1t4UKwkhlZah2
         QNyQ==
X-Forwarded-Encrypted: i=1; AL+hErGThITzi+nrFN40hD/LWlBgzIJeeOduAlFNjIjVdVdoRqEtLBqV6S8Yx5Lh3nwTOkFPF2LkvG2WaPkHiLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tbA8brPdIDUtGReDdvq6ahmnismk3weFhF1j19L4zJ6dNw+/f
	PBuARXxk7GSoW2PRsx0j0F+UD+Wl6cjMiQFM25pVCLOoFM0iJfLSY46K
X-Gm-Gg: AZFdTZd0FvLmnn3y+1KyGTBJDAyEExW9u0tbT5F8UCw8eCwHjMufOLOaIZdD1DXpjSN
	aWO3bY6F1mKIQ323ZjghVgFLNFFMjItCjZczuMl2yOeBqo0Q/08ckjs9CJzoU20xvJAoxser54j
	BXKOp3Ex1+HpUGqfTZYYsN8T/4cDWJ6ApFwfUgmYF4DWxK3EJwCwhb9O1cBVYb/cB42/yvFsTGL
	v7E5oyZJ8EYQdxtbQFelF0krieEdt/7X7tvflL3SrP/Z1XhfpADGYV5qDukn+pci0gi9XrFrgdf
	wqZ7fOJyLE2fxOgeh87dc1ut5CzO4TqiWKknXgweizgjBkGdSQejnyq8Nm2KKCvINpJBhXPZQET
	ZCCBC3JM6R4N/lV+YIGMIflxmpnIOhY6+kpzbjepj++XIMsyE+twXVfVU8p9r96grSKlJ0fgchG
	iXtlBgSSZfwzRMRH25UkurX7u4wdJa4M0EdfU2AtcQSAyuYS1g+pde++ndf3c8PjQfpkJKS4Oco
	q64LC8cTHrP98UCeabn+KraU9rVQV2b1mqf3FwelaDLDoM7JYk6ehWL5J5/R6VYnMQdTiyeEFF/
	9NI8W65RpU4r00yyB0wH/aBPZKkzDGgW26gxYEFKFfPWG7iWKw1Acgm+Is96S0hXPDOJmGveCj2
	XP15YNdjDBabhgwqkCPW1doBKrDIG+HSE+g==
X-Received: by 2002:a05:6000:15e4:b0:48e:69ff:ba36 with SMTP id ffacd0b85a97d-4a639d17154mr442798f8f.28.1794939891953;
        Tue, 17 Nov 2026 10:24:51 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a656933956sm134084f8f.44.2026.11.17.10.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:24:51 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v13 1/5] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Tue, 17 Nov 2026 19:24:39 +0100
Message-ID: <20261117182444.103123-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117182444.103123-1-ansuelsmth@gmail.com>
References: <20261117182444.103123-1-ansuelsmth@gmail.com>
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

Document support for Airoha AN7583 clock. This is based on the EN7523
clock schema with the new requirement of the "airoha,chip-scu".

The register for clock and reset for normal system and PCIe are scattered
between the "SCU" and "chip SCU" registers (they are 2 different register
block, the name is taken from the programming guide)

- Chip SCU provide register access to some clk gate and clk rate
- SCU provide register for reset, PCIe clock, other clock gate and PHY
  SERDES.

Upcoming and current airoha clock driver all follow this pattern of
declaring one of the 2 register and use a sysconf for the other as the 2
register block are tighlty coupled.

EN7581 internally handle the syscon with a direct reference by the use of
syscon_regmap_lookup_by_compatible while AN7583 wants to make this
explicit in DT with the new "airoha,chip-scu" phandle.

Similar to EN7581, also AN7583 permit the selection of the serdes line.

Add additional binding for additional clock and reset lines.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 25 +++++++
 include/dt-bindings/clock/en7523-clk.h        |  3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   | 65 +++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index fc37786ac7ed..05cd20ce3ab9 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -31,6 +31,7 @@ properties:
   compatible:
     items:
       - enum:
+          - airoha,an7583-scu
           - airoha,en7523-scu
           - airoha,en7581-scu
           - econet,en751221-scu
@@ -57,12 +58,36 @@ properties:
       available serdes port.
     const: 1
 
+  airoha,chip-scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the Chip SCU providing the registers required
+      for configuring the PCIe related clocks and resets.
+
 required:
   - compatible
   - reg
   - '#clock-cells'
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          const: airoha,an7583-scu
+
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+      required:
+        - airoha,chip-scu
+        - '#reset-cells'
+        - '#phy-cells'
+
+    else:
+      properties:
+        airoha,chip-scu: false
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
index edfa64045f52..0fbbcb7b1b25 100644
--- a/include/dt-bindings/clock/en7523-clk.h
+++ b/include/dt-bindings/clock/en7523-clk.h
@@ -14,4 +14,7 @@
 
 #define EN7581_CLK_EMMC		8
 
+#define AN7583_CLK_MDIO0	9
+#define AN7583_CLK_MDIO1	10
+
 #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
diff --git a/include/dt-bindings/reset/airoha,an7583-reset.h b/include/dt-bindings/reset/airoha,an7583-reset.h
new file mode 100644
index 000000000000..433a5c6180bf
--- /dev/null
+++ b/include/dt-bindings/reset/airoha,an7583-reset.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 AIROHA Inc
+ * Author: Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#ifndef __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_
+#define __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_
+
+/* RST_CTRL2 */
+#define AN7583_XPON_PHY_RST		 0
+#define AN7583_GPON_OLT_RST		 1
+#define AN7583_CPU_TIMER2_RST		 2
+#define AN7583_HSUART_RST		 3
+#define AN7583_UART4_RST		 4
+#define AN7583_UART5_RST		 5
+#define AN7583_I2C2_RST			 6
+#define AN7583_XSI_MAC_RST		 7
+#define AN7583_XSI_PHY_RST		 8
+#define AN7583_NPU_RST			 9
+#define AN7583_TRNG_MSTART_RST		10
+#define AN7583_DUAL_HSI0_RST		11
+#define AN7583_DUAL_HSI1_RST		12
+#define AN7583_DUAL_HSI0_MAC_RST	13
+#define AN7583_DUAL_HSI1_MAC_RST	14
+#define AN7583_XPON_XFI_RST		15
+#define AN7583_WDMA_RST			16
+#define AN7583_WOE0_RST			17
+#define AN7583_HSDMA_RST		18
+#define AN7583_TDMA_RST			19
+#define AN7583_EMMC_RST			20
+#define AN7583_SOE_RST			21
+#define AN7583_XFP_MAC_RST		22
+#define AN7583_MDIO0_RST		23
+#define AN7583_MDIO1_RST		24
+/* RST_CTRL1 */
+#define AN7583_PCM1_ZSI_ISI_RST		25
+#define AN7583_FE_PDMA_RST		26
+#define AN7583_FE_QDMA_RST		27
+#define AN7583_PCM_SPIWP_RST		28
+#define AN7583_CRYPTO_RST		29
+#define AN7583_TIMER_RST		30
+#define AN7583_PCM1_RST			31
+#define AN7583_UART_RST			32
+#define AN7583_GPIO_RST			33
+#define AN7583_GDMA_RST			34
+#define AN7583_I2C_MASTER_RST		35
+#define AN7583_PCM2_ZSI_ISI_RST		36
+#define AN7583_SFC_RST			37
+#define AN7583_UART2_RST		38
+#define AN7583_GDMP_RST			39
+#define AN7583_FE_RST			40
+#define AN7583_USB_HOST_P0_RST		41
+#define AN7583_GSW_RST			42
+#define AN7583_SFC2_PCM_RST		43
+#define AN7583_PCIE0_RST		44
+#define AN7583_PCIE1_RST		45
+#define AN7583_CPU_TIMER_RST		46
+#define AN7583_PCIE_HB_RST		47
+#define AN7583_XPON_MAC_RST		48
+/* RST_PCIC */
+#define AN7583_PCIC_PERSTOUT0_RST	49
+#define AN7583_PCIC_PERSTOUT1_RST	50
+
+#endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_ */
-- 
2.55.0

