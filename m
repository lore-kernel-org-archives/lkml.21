Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199538;
	b=Ze6YjOa9F0BqPUtzGaUoRODOs21St47YfJqcH3YAj9wl2umL+PqWbzsgOE/4RePgqIwa
	 9WS4sUGU+KKK0139yfYI46dyWYpDslrocZ++CUWi6wNCRWMtzo14Xmnjj3b9Wap9DFuwy
	 8Na7drntQauvCwdkjsptK9+GWaJddyWVwNLqs9XgfyW0Fzm8h++ItP7CAK2UdKaB3OYtS
	 wUCJroXhY0Tce8c9aWkSDVqSd+ZIrNINtd1Y2jX/OiJQunNh1STU0m9T4gNtDdKOVNUeD
	 BLtnBPZeGuev7aUd0qxT3XWVAPnESy/RmcOJfUNf+YiC5PPDZ6wPo31nfQPPe8eWLOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AhstR5zaWRo7fxUINZngvFrRufcXZaKUCs2shSnAptE=;
	b=Q4DqmYmXx+un1PFhB6cij/JkZ9RuSZPIb5++n7Ptm1g1J/xd3OVxUacvrN2KUvchp9f7
	 qdZGiXmxl5qdEPKNqtDU4UM8w5v181WXYKR3KqOsbw6T8oI06jFbrCRi+cYKmyXAJiIvG
	 KxD8RMMN+b//ACdIwWQmXUUrYzKsUEcKEGu8rN5jNqgpjbfj4yz7c/8WXhsu4tBYYiAnC
	 lQ+/OCpoMahqL3Uv9ZiOk5lQqAtAYaZcQoCAGRHdA85eg1oMXN8yjVq/5/CBAptLNMdmT
	 Um1oaXidZyMu3x/0sISVlStDToKtznOLcFMCaZJ4gpgFHSJ6Vezk2G3m4AQ7a3GKYlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=uWougswX;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C65606A336
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57C65606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=uWougswX
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-53ec2cc397aso830789b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795199537; x=1795804337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhstR5zaWRo7fxUINZngvFrRufcXZaKUCs2shSnAptE=;
        b=uWougswXbNllfy9rgTlLTvvRLJc1rJ1au2kV0NF9pIXfi7xfp5bJ/vbj39Nb3+Icb3
         R5asG58QIOTZXPjzVc5DMPiETlsKb9EelY6Exu0+NxIQfpPLCPMQzk81irBV/xXFuOuR
         cWQHe3ECzwg6wYG0x01OK8z1fQXCHikwCy27gmWnSWTaq8TslrqcvikIMQn/zb0LpKsW
         +cKMH0RxViExozMzQcb878OPijplZg+ApfVPecX9m2CU+0zhXePJn+SW3PF6A0ayicHB
         B9fxcc27WqSTC4tetdpW7uqtI01edBQj8SKTh673zwtGil2HG4oKX7gk5zIlkXLw2Ofo
         TIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199537; x=1795804337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AhstR5zaWRo7fxUINZngvFrRufcXZaKUCs2shSnAptE=;
        b=z9ie6GoQ0HeKKu8KmuhHpiYyaYgApJGCP48QWCDL7P2qNWzYgf7woDUauTqnjYAfdA
         sVQJxV6Hnu+Ho9m9K3ajBVeVvEbrnwlRojuEdN9HEhOuXZ+D/8qUfRhmiMo/te/h594p
         ie3Ilhhz6gCjFBIN0LoBp/hPGP4MLtolWBt+MX34rF2LNIA6XEEJbStEG+iV2y0s4SLK
         ojF9fVf5qW39802XJA4DkrwufwqOpMmSlpOyTtHNguwRVL/cy4pXInc+FjsCUnTUI/eO
         EW1XJ8nI9vbPMel07bLiTL6+oIVnnF9mlR34qRcaeyul9f9n5PfpLBbe2QAgLcFhXlwi
         ycug==
X-Forwarded-Encrypted: i=1; AL+hErEH/OENq6vpK8gbln2C+rt1+g4+rHgbOnmCsYmZpAlO2i5StZ/pQi/avj2W8o/OY01VICWqyE0QqmPh9ac=@vger.kernel.org
X-Gm-Message-State: APuU4Z9t2VA9Tgw6fZwHd0adv/IFBbtNz471aCBSBd3KP5HDIAXcs5Xn
	VFcXCWQ7eytJwsNbUrrcBPfRFifogyuWXTUuW3NgUCHqiUNJuLXl4zkpE9UwjOnXp6w=
X-Gm-Gg: AYBFou28E4rkMWpoDYByyJa02ittHP9wY9zpuzx5H9S5QfRYgSPIJe6nHt0rWxmNSyF
	3YNr/j/qN8yDFygQmgye7Jk/i6+tKsfb/JCbS8xjM8Hbhn3DS64IBfBjBokp3+ST8TidnOaIeS7
	le7e1rY3Dc/6UGb0WktU4RMv8bIlv1bwg58XGL9uNOm7V1uRcI9qnGyfJOrUYHoEExZUXh29SBN
	dxmaUxm+XXpMNilquqhL5HzvnLGnzRwuv9JZyMDPqvvDqzqc2P+fYpMw7o6x6UH8gAS3mBS07Qh
	7XPByhX3Gd9qkDZwQKvm+BX9v56y3Qe3l0WlCyBaT3yJ2JR9Y/Zd7+iCEEWVDWxdaYrAtovxxKY
	vJPOuq/Xb76fZANw7QEM70IRBInUB/PMHwhwo1qLZOMKLxXzAW/IAr1gmUGVjEbW3oryvnTO8UY
	2qHSSoYMEvIDxNfW/E7j5pHx05E9Q4XuRGyCDXSN4py9ZNR/MdvfOmkS5Kv33pzWAElWplwOn0X
	RR1T5yD5Mfdi4K2FYArXXY3ijfaxrSOW8tsFLhgQ9LFjJrSqYsRuSjXEKbuoS6Jxk5MZh7KnTQb
	oloImxbxSccfJFBbphNu6o/DPMdOTsdsogQb
X-Received: by 2002:a05:6808:50ac:b0:53b:f634:83b2 with SMTP id 5614622812f47-57a025f405emr4260415b6e.0.1795199537206;
        Fri, 20 Nov 2026 10:32:17 -0800 (PST)
Received: from zippy.localdomain ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35055486sm2619940b6e.12.2026.11.20.10.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:32:16 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: toshiba: introduce toshiba,tc9564-clock.yaml
Date: Fri, 20 Nov 2026 12:32:10 -0600
Message-ID: <20261120183212.1264522-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120183212.1264522-1-elder@riscstar.com>
References: <20261120183212.1264522-1-elder@riscstar.com>
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

Define the binding for the clock and reset controller that present in
the Toshiba TC9564 SoC.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - New binding that combines clock and reset under the clock node

 .../bindings/clock/toshiba,tc9564-clock.yaml  | 73 +++++++++++++++++++
 MAINTAINERS                                   |  8 ++
 include/dt-bindings/clock/toshiba,tc9564.h    | 50 +++++++++++++
 3 files changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h

diff --git a/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
new file mode 100644
index 0000000000000..e789ce8c6a3ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/toshiba,tc9564-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9564 Clock and Reset Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description:
+  The Toshiba TC9564 is an SoC accessed by a host system through the
+  upstream PCIe port on the PCIe switch it implements.  The chip includes
+  an embedded PCIe endpoint that provides access to various peripherals
+  within the SoC via its BARs.  These peripherals include a simple
+  controller to gate internal clocks, and a reset controller.
+
+  The TC9564 chip has a single input clock.  Internally that clock is
+  multiplied by a PLL, and the PLL signal is divided into a set of
+  fixed rate, always-on clocks.
+
+  The clock controller uses two registers to control a set of simple
+  gated clocks, each derived from one of the internal fixed-rate
+  clocks.  A total of 21 gated clocks are implemented within the chip,
+  but support for enabling and disabling only a subset of them is
+  provided at this time.  Two clocks (I2C and PCIE) are marked critical
+  to make it clear that they should never be disabled.
+
+  The reset controller uses two other registers to control a set of 13
+  resets that can be asserted or deasserted.  Here too, only a subset
+  of the resets can currently be managed, and the I2C and PCIE resets
+  are treated as critical.
+
+  Clock and reset IDs are defined <dt-bindings/clock/toshiba,tc9564.h>.
+
+properties:
+  compatible:
+    items:
+      - const: toshiba,tc9564-clock
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@1004 {
+        compatible = "toshiba,tc9564-clock";
+        reg = <0x1004 0x10>;
+        clocks = <&tc9564_xo_board>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c00d3612c9acf..af088e1092e63 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28683,6 +28683,14 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA TC9564 CLOCK/RESET CONTROLLER DRIVER
+M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
+F:	include/dt-bindings/clock/toshiba,tc9564.h
+
 TOSHIBA TC9564 PCI DRIVER
 M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
diff --git a/include/dt-bindings/clock/toshiba,tc9564.h b/include/dt-bindings/clock/toshiba,tc9564.h
new file mode 100644
index 0000000000000..a0325b10b6c36
--- /dev/null
+++ b/include/dt-bindings/clock/toshiba,tc9564.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#ifndef __CLOCK_TOSHIBA_TC9564_H__
+#define __CLOCK_TOSHIBA_TC9564_H__
+
+/* Clock IDs */
+
+#define CLOCK_PLL		0
+
+#define CLOCK_62_5M		1
+#define CLOCK_100M		2
+#define CLOCK_125M		3
+#define CLOCK_250M		4
+#define CLOCK_312_5M		5
+
+#define CLOCK_I2C		6	/* critical */
+#define CLOCK_PCIE		7	/* critical */
+#define CLOCK_MSIGEN		8
+
+#define CLOCK_MAC0_TX		9
+#define CLOCK_MAC0_RX		10
+#define CLOCK_MAC0_125M		11
+#define CLOCK_MAC0_312_5M	12
+#define CLOCK_MAC0_ALL		13
+
+#define CLOCK_MAC1_TX		14
+#define CLOCK_MAC1_RX		15
+#define CLOCK_MAC1_125M		16
+#define CLOCK_MAC1_312_5M	17
+#define CLOCK_MAC1_ALL		18
+
+/* Reset IDs */
+
+#define RESET_I2C		0	/* critical */
+#define RESET_PCIE		1	/* critical */
+#define RESET_MSIGEN		2
+
+#define RESET_MAC0_MAC		3
+#define RESET_MAC0_PMA		4
+#define RESET_MAC0_XPCS		5
+
+#define RESET_MAC1_MAC		6
+#define RESET_MAC1_PMA		7
+#define RESET_MAC1_XPCS		8
+
+#endif /* __CLOCK_TOSHIBA_TC9564_H__*/
-- 
2.53.0

