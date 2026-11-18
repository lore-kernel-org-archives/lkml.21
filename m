Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018684;
	b=RyQRbKB2h+je4aeTK1JUkvMXyTKF+T/p/uPzFI8ZF0rfpCLBgEUIqUo77h2FxYCj29r+
	 graB7RMh5RUtg+RtRG8vddRSxazGkZ3+hhcrueqtj/RzD7bl2NA+TX++F759nHv3ukA0g
	 RXQGpXQ9bO8M2RyIrSgmYf8OgBoGoh2W367XKLInQz6XwLluuAwF0VOOTJ3MhnFOAVP6A
	 qXBCrJparqYOkv89YbwG+5wVVxcETKgd0DwONcvZKS3NguOZkwG49dGGjm+pNmkorFWqA
	 e8CJDDU/9Ix/MjfXzqX4jB4ltCv6lpjOx6ypBI5yXLpdilDonfuuwrQNUGMLFOanfCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xD6Dy3y4d1wnxROTLCHN7ijMhBMBe0bu6u+PB8rbtjg=;
	b=Wf68z0hwnIMBu/P0wdWiUKCC737dxrFHuRPyFRNolBOay0sB1P4+T3Zw17eYpFNkw1Mc
	 Oy/aZ27ZeJVp/yNbur4eZaOET/QYgal/CF5Nn+wnNY2OEYu3e62SzY21cOK/u5vjWaWNA
	 QCuYsNY+buLxjlCMM6emgP2THFDxhS4/Xsok1Hw8jEKa2/Uo1K+OTqXNWhA2EwF8RwR2X
	 GKjHTmsJeD8SlSPp4w5vhV2xPpQ7UU7SxummWiWtC2ryhy+2QLAegHv8TByWEgPFv59tr
	 W8V9B+ppdInNZC5moJ7JQ08OaO+wyg785JlQwMWdX1PcnLAu6FHdj2sdKYlz+lCDFrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INhYelj1;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D84606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39D84606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INhYelj1
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so1022324f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018682; x=1795623482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xD6Dy3y4d1wnxROTLCHN7ijMhBMBe0bu6u+PB8rbtjg=;
        b=INhYelj1LEYaqGoBDCuvrrveeso60ukOgq2hTL9neUaVi+4X4/dVhfcMu0L3u8Ddwf
         pyExioSsOWNW8wX9PQIejlbwVoqC3NpuG1IwH8HYCwXcZVv+6GSKyxSHnUESrRowaS55
         QUDF+me8xb7sOQqEUPqTG/jH6doQ+HnmcvGOG2sXKCP8ThuHHVIe9L47H6hiM93o2Nws
         3Vkc0XjJQQdDYefMY17+oyAgf4hrCbqFX0iWVzHFHJwYzHl5kX5lK63dGBkkmwpmzHyX
         EsCCoPR0F0+Jhl1Fd887rNbWcaOkQtrHc/VuKaL+nGiwG4ylx5aEQIcFJk4EyCo+7gWK
         mD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018682; x=1795623482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xD6Dy3y4d1wnxROTLCHN7ijMhBMBe0bu6u+PB8rbtjg=;
        b=gzgLEebFxQFvs5p4odN8cyrdPN6gGUEe/Zv6K2ip2GxC34bC+qKytLpQfBeGccW5nE
         /2F0VVSHvWKghtr5AZrGZJ4HRnY3wvMUjggrXdm4hc5DsK072x1M9cZkhjbQ2UqsUZeQ
         04RI38qUQp9FpSxqQ9FOsX3RZj5xmgR4ylkHWx/EnkyJ3tpAtKsijLLF8vdsnViE1PZO
         xn3oNH5cq8/CLCdyANHe0bXvXBF8j2ydSkYEk2wGeV5qDLVizJ2n9BBi0F1JyjwhZCjk
         d9o6EhL9Slm0om/eP4PN3E8viq2UKkEHdFtJWKR+L9ZW+n7pj97uQAq57Fqpncv4AbJv
         gY6Q==
X-Forwarded-Encrypted: i=1; AL+hErHvo2B+wnMuFZUjZZDec9tKNLV5bXimgFwGxvPODt2GIdqT0jXao28yXQ5sCs62u0Tr4+vb75RI9raXzQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WQFvVH58iZEGM9qS6yTnlw3D+soHfarTrdZalBN+hCsI/w/1d
	YMMVY3/hpfg+JieOR8DDk2cjq5l/y06YAl7pasjTjLdQbTnklpaKi6gQ
X-Gm-Gg: AZFdTZdqtSjMdZBek4l7sEVL9jOD6MKvC+MyJmi3sjQ4AagesNtgT7M9bPli9rIDi4T
	iNPrZMuKYMcbf09pp8iAeOBEJJ4YllCre1RO+HNS7+bC1mIdNeZytZc1eE1DBfVtMJXVf1QM3vN
	eue9bPE4urGITZrErTLJgN+jOMdRHMhd7rUy1Umlo6gJT8a+8JKUgk9vkDuLGsgGf0M9Xi99LFb
	v3i8Sqj5SckWY56zp7Rojad+gy12zEtumzBhZ5DGuct9BVeR+Janb9uezPTmxXSR2vNpW5qrr8x
	Hem/HgSbyWDIC3/hHOaR+lmv2hOzYJVkQ0PvS7EUahW6iS8ig0Whyi58rvrJFkV9JPwx6D4njbv
	/W2OCqAN9C/VAKRal9nWCrx4sS7MKgcs7LAJix7Jtm8mmPRu367uB9uy4uIW7AkELY/i4EEeSZC
	Q2lmSFNGHH1gxezSCf/Ze/I98GN9dC1q9l6oUbOk43zmykLWLyzb1jcQmOqOaTLgRwSmphTXiBc
	kga1be+JRKuwgPVVHdJUsHnbHaWlI8cMNVYzgXGZMHbPilRAPsLFX3Vh3GKasTLMbRBmg6xF5+u
	KBQp11zHKpexxcR8IezaE+vYPmIphrvcLY5j7MIy5e35fxhtyzbi6CLYIPtzrF3U91eT4KxtBps
	nA9Fg4FOq6V4Lf3DBrsVSRCOHd3hAAczp6A==
X-Received: by 2002:a05:6000:29c8:b0:4a3:c963:c1c3 with SMTP id ffacd0b85a97d-4a63937fce8mr4376849f8f.15.1795018682433;
        Wed, 18 Nov 2026 08:18:02 -0800 (PST)
Received: from [10.161.246.232] (host-164-37-100-34.net.onlyservers.com. [164.37.100.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65100bf42sm5329699f8f.1.2026.11.18.08.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:18:02 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Wed, 18 Nov 2026 19:17:36 +0300
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: mediatek: Document MT6895 pin
 controller
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
Message-Id: <20261118-pinctrl-mt6895-v2-1-0728c4eddcac@gmail.com>
References: <20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.com>
In-Reply-To: <20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add device tree bindings for the pin controller found in the MediaTek
Dimensity 8000/8100 (MT6895) SoC.

The controller has 227 GPIOs spread over a GPIO base and 13 IOCFG
blocks, and an EINT controller made of five blocks (W, E, S, N, C).

Pins with PUPD/R1/R0 or RSEL pull-ups take the raw MTK_PUPD_SET_R1R0_*
and MTK_PULL_SET_RSEL_* values in bias-pull-up and bias-pull-down.
There is no public table of the RSEL resistances for this SoC, so the
binding does not offer the ohm-based values used on MT8188 and MT8195.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 .../bindings/pinctrl/mediatek,mt6895-pinctrl.yaml  | 228 +++++++++++++++++++++
 1 file changed, 228 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6895-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6895-pinctrl.yaml
new file mode 100644
index 000000000000..e3ecfffc084e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6895-pinctrl.yaml
@@ -0,0 +1,228 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6895-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6895 Pin Controller
+
+maintainers:
+  - Alexander Letuchiy <asalde.le1@gmail.com>
+
+description:
+  The MediaTek MT6895 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt6895-pinctrl
+
+  reg:
+    items:
+      - description: pin controller base
+      - description: rm group IO
+      - description: rt group IO
+      - description: rmm group IO
+      - description: bl group IO
+      - description: bm group IO
+      - description: br group IO
+      - description: brr group IO
+      - description: lb group IO
+      - description: lm group IO
+      - description: rtt group IO
+      - description: tr group IO
+      - description: tl group IO
+      - description: lt group IO
+      - description: EINT controller W block
+      - description: EINT controller E block
+      - description: EINT controller S block
+      - description: EINT controller N block
+      - description: EINT controller C block
+
+  reg-names:
+    items:
+      - const: base
+      - const: rm
+      - const: rt
+      - const: rmm
+      - const: bl
+      - const: bm
+      - const: br
+      - const: brr
+      - const: lb
+      - const: lm
+      - const: rtt
+      - const: tr
+      - const: tl
+      - const: lt
+      - const: eint-w
+      - const: eint-e
+      - const: eint-s
+      - const: eint-n
+      - const: eint-c
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description:
+      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
+      the amount of cells must be specified as 2. See the below mentioned gpio
+      binding representation for description of particular cells.
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-line-names:
+    maxItems: 247
+
+  interrupts:
+    description: EINT controller interrupt
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+# PIN CONFIGURATION NODES
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '^pins':
+        type: object
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+        description:
+          A pinctrl node should contain at least one subnodes representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, drive strength, input enable/disable and input
+          schmitt.
+
+        properties:
+          pinmux:
+            description:
+              Integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux are defined as macros in
+              arch/arm64/boot/dts/mediatek/mt6895-pinfunc.h for this SoC.
+
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
+          drive-strength-microamp:
+            enum: [125, 250, 500, 1000]
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+                description: normal pull down.
+              - enum: [100, 101, 102, 103]
+                description: PUPD/R1/R0 pull down type. See MTK_PUPD_SET_R1R0_
+                  defines in dt-bindings/pinctrl/mt65xx.h.
+              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
+                description: RSEL pull down type. See MTK_PULL_SET_RSEL_ defines
+                  in dt-bindings/pinctrl/mt65xx.h.
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+                description: normal pull up.
+              - enum: [100, 101, 102, 103]
+                description: PUPD/R1/R0 pull up type. See MTK_PUPD_SET_R1R0_
+                  defines in dt-bindings/pinctrl/mt65xx.h.
+              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
+                description: RSEL pull up type. See MTK_PULL_SET_RSEL_ defines
+                  in dt-bindings/pinctrl/mt65xx.h.
+
+          bias-disable: true
+
+          output-high: true
+
+          output-low: true
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+        required:
+          - pinmux
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/mt65xx.h>
+    #define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
+    #define PINMUX_GPIO6__FUNC_SCL0 (MTK_PIN_NO(6) | 1)
+    #define PINMUX_GPIO7__FUNC_SDA0 (MTK_PIN_NO(7) | 1)
+
+    pio: pinctrl@10005000 {
+        compatible = "mediatek,mt6895-pinctrl";
+        reg = <0x10005000 0x1000>,
+              <0x11c20000 0x1000>,
+              <0x11c30000 0x1000>,
+              <0x11c40000 0x1000>,
+              <0x11d10000 0x1000>,
+              <0x11d30000 0x1000>,
+              <0x11d40000 0x1000>,
+              <0x11d50000 0x1000>,
+              <0x11d60000 0x1000>,
+              <0x11e10000 0x1000>,
+              <0x11ea0000 0x1000>,
+              <0x11eb0000 0x1000>,
+              <0x11f20000 0x1000>,
+              <0x11f30000 0x1000>,
+              <0x11e50000 0x1000>,
+              <0x11ce0000 0x1000>,
+              <0x11de0000 0x1000>,
+              <0x11fe0000 0x1000>,
+              <0x1c01e000 0x1000>;
+        reg-names = "base", "rm", "rt", "rmm", "bl", "bm", "br",
+                    "brr", "lb", "lm", "rtt", "tr", "tl", "lt",
+                    "eint-w", "eint-e", "eint-s", "eint-n", "eint-c";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 0 227>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH 0>;
+        #interrupt-cells = <2>;
+
+        gpio-pins {
+            pins {
+                pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
+                bias-pull-up;
+                drive-strength = <6>;
+            };
+        };
+
+        i2c0-pins {
+            pins-bus {
+                pinmux = <PINMUX_GPIO6__FUNC_SCL0>,
+                         <PINMUX_GPIO7__FUNC_SDA0>;
+                bias-pull-up = <MTK_PULL_SET_RSEL_111>;
+                drive-strength-microamp = <1000>;
+            };
+        };
+    };

-- 
2.56.0

