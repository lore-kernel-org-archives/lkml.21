Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638109;
	b=NmbJ+8kju7od5FEEXtL0GdJNxbkznQYZPgVI6v9QpcoTROeWxeS5PuE+3m73qngWdDZd
	 A4ItjcHMAsCjy9G2c5ovoJzhV/yIcjTECnBMYyDYv43u3w0VDqPBFGVSgRnMWHD4EEiTY
	 95rz45VvrX6BaewRerQwtEhv/OO7ghaNjhbYTieXTvLQLM3/WPnzQdo2G4JCAHfExxKu3
	 dOGrmkosZhi0YfyfH2aq7aXo5KofDuvXp/QgOUf9qOCWhV/6QW1pog5aG61TM8055Yz6y
	 pcMuLI4GVG0t1/S6mtZnpksF1yxa3+ttlqxKwQkOaXLI8qmaHU9W4UQSHSTv8POem4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PpjsSnxg1AIeDz8NR7jpTi9G0n5lA83qCQvVaWbPR8g=;
	b=mN9IVQukPb6beokRC8bdlcxiHvJsQwwg7An6fYqfjZ15jBT86x5R/JyPv7D1Acxy2J1J
	 IVzzhiqB6rm7ZW9VNyy3lmzRKxwMSHbhbXSMg8VwoP7nf+ve/xGbcVccokqz+SJc1LShA
	 jtJxCgJTMTNoh+dZ47GZXtWg+jxv5kCgdqXCuwunYvjyc1HCsHHYZqJ3jwVTakgwIa/eX
	 pkQiHSJiytiEpMZJ8zUzJWmc2bzh9p4QWU9Zq1JRM+/v/7Jg2XIFKpb2IzcQ6TIUC3jEZ
	 dwotz+Tq5toWkkq19FAJMLRDjklGFuxOIZicu2jSEUjDDjVQCyP1IBxmGMn+EcbfOZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=A65WD2F+;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87085606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87085606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=A65WD2F+
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4b8587b395aso3652860fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795638107; x=1796242907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpjsSnxg1AIeDz8NR7jpTi9G0n5lA83qCQvVaWbPR8g=;
        b=A65WD2F+9AkDkxOhI+lzJ8+i2f6yeI4zUqbQ1QVI8DvGRaHTzJZ2ncnQNnk1vK5mb6
         +HINrbTk1y0ru8Sjx/Qh1vWU5VICdDFRURZC7U8lefYeLyrzgkWTDwCX59UwUWldt2ak
         gpoSY2llnJKuHQSv5b0QXx9AwMbQAApCKyvgQ3Z2QhXu4dXppwGP/KojS9xTvO62PMCi
         bqZAmXkzkPEmBf5q7gXE5NEoHEoc/OBudlIRj1ZiB3KjLz2OSIIw7WBUb3ils6TPp1gx
         IF0MyDrVI2kyYuLIUExUq0b0RwEq+DkcmDnALR/F5fga8GV2mKz7hskbTvLGlwlKzVlX
         k0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638107; x=1796242907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PpjsSnxg1AIeDz8NR7jpTi9G0n5lA83qCQvVaWbPR8g=;
        b=ZYIOJrX+Gs3lE+mGmux8DPxAyhaaP9U2ZDaKjVmVMVJxGA8heftzHHCpE4v3eOzfa5
         pR5k0nrJWNkKvj1pwehFO74BXqDRcLoaCORmagnmQvJOFp/VZCer1RjlVujjzzabjngg
         g7cHnxvmV+d6iUiQisQroDFkfQCE2NES2bd3K/R4XJ/8PfRgMVSHdXblwj/9a7ryC+sO
         vEQMycGSzGR7Rcm2N6DL68uk4hEuFA8vN93x/Da/x4+QMCga4NnhCWujSwGjjWfpP5Ea
         scyOixuClqA3X47XSyjRyuBvrXPO5WbmYFpkooJvVhvQDOOHzDB8ZFqahKQF00Yxh7Ee
         Gvyg==
X-Forwarded-Encrypted: i=1; AL+hErFodZFLSC7c25Bfq3+5PsqOREJBal0kMz3hSmcU3+1nW5nujdruHe/olm4I3UFwC5CXfzdtkFgZ7ITfNmk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TWzw9SRV62AoOcoNcm59Od/4AnkjaV36pEI5v0iSYY7xJnQdN
	YmP9xXhfuVg4gq9uTFg3y+x2V11a2JkRI/KrN1TSbILqPl9qI7oIpcfgl4j46GC63kY=
X-Gm-Gg: AZFdTZflPzCsRp8gQcKRfeKDAx5FO3OdWszajAKu3k2RThxJHtdLevNhKWQGGqLF4je
	veFsgz4yeTAMCkmN+bycYnJcL9Aa2SiMLZrPYdQBvvIsGmM3vxvZAEuSImL4vnQOGaMsp3MEbvr
	D5wif2KEeZ34cPLaEua/wpBcI9Lb8ZGxE+WIuyf/LxnIibrF4npeGvBIWlXhW1ZqoSc/YRrbTH6
	qVnw4TMFXE4vKsxaOEgro7+h5BxcbkWoCYWFo/RZ3V6ja+sW5GPFbEJ3y/AbiT9JesXrbFUMtQ9
	W34JyE4EZf/hClqrEh7W1tATzT77ntWPtAQ5SEcuC0rMLuBywt63GPowHU0dvTu0mz9TK/eZXgk
	CpWmqSAYJJF64Vj3N9/hL8oUHlevYHQkts/KIRCnB/bqmnT3TA/97K+a7hmGetYcsjaWnrw2t1P
	CewufVzgaJt326IJO67tTTRmi8g8GL+mcCmvyspp5UjzTqQDCWj6lFpGQ0ENXfI3VuAfUOpZQGP
	3J1Wm3SLHJenGCcXhkIXJ61Ajb5m/LA1CIvTeFzUzSNhWQWwt9OEaUFLF7pPBwjjt5zXGd1GFm8
	5CGb4CjWmQXmp2MZOnqRJnpEHBMVS6BxN8iq
X-Received: by 2002:a05:6871:7bc7:b0:4a7:2bbe:4601 with SMTP id 586e51a60fabf-4bc85af4396mr16373413fac.57.1795638107333;
        Wed, 25 Nov 2026 12:21:47 -0800 (PST)
Received: from zippy.localdomain ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5edc52aasm18900550fac.4.2026.11.25.12.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:21:47 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: toshiba: introduce toshiba,tc9564-clock.yaml
Date: Wed, 25 Nov 2026 14:21:39 -0600
Message-ID: <20261125202141.1288493-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125202141.1288493-1-elder@riscstar.com>
References: <20261125202141.1288493-1-elder@riscstar.com>
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

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Added Lorenzo's Reviewed-by
    - Changed to @kernel.org e-mails for Daniel and me
    - Only the gated clock IDs are now published in "toshiba,tc9564.h";
      the PLL and internal fixed clocks are implemented and accessed
      only within "clk-tc9564.c"

 .../bindings/clock/toshiba,tc9564-clock.yaml  | 73 +++++++++++++++++++
 MAINTAINERS                                   |  8 ++
 include/dt-bindings/clock/toshiba,tc9564.h    | 40 ++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h

diff --git a/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
new file mode 100644
index 0000000000000..026ed949f0f02
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
+  - Alex Elder <elder@kernel.org>
+  - Daniel Thompson <danielt@kernel.org>
+
+description:
+  The Toshiba TC9564 is an SoC accessed by a host system through the
+  upstream PCIe port on the PCIe switch it implements.  The chip includes
+  an embedded PCIe endpoint that provides access to various peripherals
+  within the SoC via its BARs.  These peripherals include a simple
+  controller to gate internal clocks, and a reset controller.
+
+  The TC9564 chip has a single input clock.  Internally that clock is
+  multiplied by a PLL, and the PLL signal is divided internally into
+  a set of fixed rate, always-on clocks.
+
+  The clock controller exposes a set of simple gated clocks, which are
+  controlled by two registers.  Each is derived from one of the internal
+  fixed-rate clocks.  A total of 21 gated clocks are implemented within
+  the chip, but support for enabling and disabling only a subset of them
+  is provided at this time.  Two clocks (I2C and PCIE) are marked critical
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
index 64f8b6153b870..36107e0790780 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28716,6 +28716,14 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
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
index 0000000000000..7de8c8165199a
--- /dev/null
+++ b/include/dt-bindings/clock/toshiba,tc9564.h
@@ -0,0 +1,40 @@
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
+#define CLOCK_I2C		0	/* critical */
+#define CLOCK_PCIE		1	/* critical */
+#define CLOCK_MSIGEN		2
+
+#define CLOCK_MAC0_TX		3
+#define CLOCK_MAC0_RX		4
+#define CLOCK_MAC0_125M		5
+#define CLOCK_MAC0_ALL		6
+
+#define CLOCK_MAC1_TX		7
+#define CLOCK_MAC1_RX		8
+#define CLOCK_MAC1_125M		9
+#define CLOCK_MAC1_ALL		10
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

