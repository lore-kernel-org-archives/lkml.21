Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180290;
	b=WeGgolMvqncsA0g4ecARoPZU8EgBdOELmVizU/WPD5+/WdoYDyRftgxS4owrStRFt+vQ
	 pWCmcZbI7eUDVjjQg+b6G903KlnmVqMP2MAccEl5cN3MdLAPwKzvGKfWybqmypldDvMVV
	 FtK4EGAHzC6HSx9MQayXxoBGex2W3toquDx0iX2RA/9/+XNWLNjvALk3A1y3D8MhQKD2d
	 Nl4vXT7zn4msbexrEXWE/BZrz638vc8tstjDq3MNAYFDU2PACoUmf/A4uZXhEJ0MRXgh5
	 2NgImOVI2lKfvWkOdBksarxqt+b7mf8A9jnJPVPYnbeX76RiHc9jLKARbb+UQHfKzmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xIvCDJpa40Tl9Vn/MvN+Cru9DXKUNkGj3pSvXbgmumE=;
	b=LFu/dM+2Kwf7//TzVssjsWF2H7WYAyFp7oRnTiQx1MPyWLfHByuijzjYS9qEY3pjjd3a
	 +cRep2G3mZJzHcymZgd3qrRyd7zbALihrz0V0lUWUcOyWkO2IqipACDFvz+DGAIRqVPaU
	 r1CLPtgWXKfBdctNCTygjBIr2noWj95kmK4kIJFFvxRjGGN54/ADMsSmxkdakWVOguq9I
	 jreqRkvV1fgoABkeNr2oFfRlJ1ZlDpTI2fVAzD5M7x4wi/W+JNyH0XyhNp6SytJls3sCr
	 UNR9Ty+QEhp2BiNUCMzRWtVaOOB2umTyt9yaw8KB2e9s7ZONgDsNvFMt4/62V8tbUtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mY+f9A3T;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E021960A3834
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E021960A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mY+f9A3T
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so9998625e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795180288; x=1795785088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xIvCDJpa40Tl9Vn/MvN+Cru9DXKUNkGj3pSvXbgmumE=;
        b=mY+f9A3TKxj/WzAusDlIW/+s6W4JA3ZIHLo12KNu/QQm40xJvwPIM0NvYEJgGNCbDA
         XD6/9zB/rXsqskJWHtj8lN2SzsQcwd6MULfajknKrLNIIJRgFYobLtbrsAibCKAz300s
         htPwLA89dXOF97Cd8fc77k3lhJenl6CsnF8KJ71cJUl7+861SYH6U+DcmEu55SSLWOWJ
         akFhMt1yx82EwKOSTpNMKgQ0zVWg1Bi00pHI3l15kbHKUNBwEvs+UOdRJJQfQ/v/xqC8
         xPb756XZr9S5FeS9782nvGlHAeR4ygHNf7MBw49d+ytpIf8ejOLkrEwyEazZn+6c4NhF
         uUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180288; x=1795785088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIvCDJpa40Tl9Vn/MvN+Cru9DXKUNkGj3pSvXbgmumE=;
        b=uiKfdPIk4MY802vBa9ZXDmq8HoDwt1C3cZFaYJGsm33/DySDktQcLKQ0HRD04baLFj
         czghZAWrwZQrrZrH3FP4uW5aSiRxRyYVx63stQpOBmSfYbv6kgs5trlA6xOrWVRTh2+v
         mv71zJXEZjbx97XalyZhCazeRvV0VM6lybL9OxLtffJpll7kxuOytMo4RC3A/O4XIiU/
         16b3af0ywUNwwmPW7g53kHqirn0TdM5Hdo5644asTkQ0yewy7ZeKVIF3AYx25tCi9XiS
         DaTy7U8g2LS6QwI9LYv1SzP/ppoXSV6ncRnx45m1NolSuV6WXZyoI1NDnpB/+sjTUznn
         KXnw==
X-Forwarded-Encrypted: i=1; AL+hErE4gDzdYPmux3fxxVplAq7R1mnDdYXLlVEYcA8cciNUx7JVefZ9ZeHezUClZU7HzJIqNqyLJ7dMXaorTOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z90WOUiSmqevhUNmW8E7YHY7JKWWrPeC1FT45ayuFD2wz8elVAl
	TN5Quic172fQmYxhNdDdZKPgEGzEdBruLF5XjDRYkEd24b+HXT7Cv9Eb+auoEvKFAHw=
X-Gm-Gg: AYBFou0btHEvInFixTgx19+gLGaBvs+sNBqJgu8QCmQQQvf5tid419r8xNyKH76sHzu
	Auy1s3ItvgKVxwa7+TXDIGooTmtnOTuXJ7Au1eTmniukc1wcGGY7J2WSLcG48u/5yhF1gQnJgbM
	IzDGBlT8dpuUjsbwUYc1eQIgfnPcfc9gdtaTSrYgp3KWSzX9l2mw6XFILVJRo06sFW6hlsalDGS
	HoCf7ZvNuPvC8pbBBYYdy3j/X+D/s2XIJDRc+2TZLbmj7yIiH5xGo+vMMiyS7xmLjW+gWX/Myj8
	qfaW9d7d9AGxq8AjtIw4OrclW63ndJLW3OWPqolAedwAWYp5cfp3wRB+GKvmtQGgvw1qqZ8KPxg
	gUVk7IEXBFl92GJTAK4xa9G+0gTE/qlApVYMKQF1MJ2pI7+3HlolRYP6PCCAMSXRTnbDzXjCjGh
	UMuJADl5B+b2kykZ9HT8JV9/ZMee57Vyw/gVMZ0k47Ut+NU5K1uyDoldKLOgyIGLqkG5UNmKulr
	xoaVLU6ZH5c7Hdf4XCD85bWZ8vpyWOooNxkwJ6VcgJxHOIfB0rYd5ZbjvhYU248oZ/m5cSwCDH5
	FQqLQ0XdNi+0Qq62UhxZmEnsqkvTWqUtx/2XS1o+cATwwgaOHoV5f61s/2ChUDZ7ifbI45mg9it
	URbq1IXFDywECPuVD/VG0QdD+dR6cd+CP1N2F4ydkVhgsMw==
X-Received: by 2002:a05:600c:828e:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb88785898mr72814425e9.0.1795180288235;
        Fri, 20 Nov 2026 05:11:28 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960110fsm43497995e9.0.2026.11.20.05.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:11:27 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 20 Nov 2026 14:11:06 +0100
Subject: [PATCH v2 3/6] dt-bindings: clock: Add Amlogic S7 PLL clock
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
Message-Id: <20261120-upstream-s7-clk-v2-3-856cece3b9f2@baylibre.com>
References: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
In-Reply-To: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0

The S7 PLL controller supplies clock sources for the peripheral clock
tree and receives its reference clocks through firmware-controlled
oscillator gates.

Add the binding and clock identifiers needed to describe this
controller and its connections.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 .../bindings/clock/amlogic,s7-pll-clkc.yaml        | 71 ++++++++++++++++++++++
 include/dt-bindings/clock/amlogic,s7-pll-clkc.h    | 42 +++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml
new file mode 100644
index 000000000000..1984cd42fda9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2026 BayLibre, SAS.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,s7-pll-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic S7 Series PLL Clock Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Carlo Caione <ccaione@baylibre.com>
+
+properties:
+  compatible:
+    const: amlogic,s7-pll-clkc
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: input fixed pll
+      - description: input gp0 pll
+      - description: input hifi0 pll
+      - description: input hifi1 pll
+      - description: input hdmi pll
+
+  clock-names:
+    items:
+      - const: fix
+      - const: gp0
+      - const: hifi0
+      - const: hifi1
+      - const: hdmi
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@fe008000 {
+            compatible = "amlogic,s7-pll-clkc";
+            reg = <0x0 0xfe008000 0x0 0x1e8>;
+            #clock-cells = <1>;
+            clocks = <&scmi_clk 2>,
+                     <&scmi_clk 2>,
+                     <&scmi_clk 2>,
+                     <&scmi_clk 2>,
+                     <&scmi_clk 3>;
+            clock-names = "fix",
+                          "gp0",
+                          "hifi0",
+                          "hifi1",
+                          "hdmi";
+        };
+    };
diff --git a/include/dt-bindings/clock/amlogic,s7-pll-clkc.h b/include/dt-bindings/clock/amlogic,s7-pll-clkc.h
new file mode 100644
index 000000000000..6bea314deb31
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,s7-pll-clkc.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 BayLibre, SAS.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H
+#define _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H
+
+#define CLKID_FIXED_PLL_VCO			0
+#define CLKID_FIXED_PLL				1
+#define CLKID_FCLK_DIV2_DIV			2
+#define CLKID_FCLK_DIV2				3
+#define CLKID_FCLK_DIV3_DIV			4
+#define CLKID_FCLK_DIV3				5
+#define CLKID_FCLK_DIV4_DIV			6
+#define CLKID_FCLK_DIV4				7
+#define CLKID_FCLK_DIV5_DIV			8
+#define CLKID_FCLK_DIV5				9
+#define CLKID_FCLK_DIV7_DIV			10
+#define CLKID_FCLK_DIV7				11
+#define CLKID_FCLK_DIV2P5_DIV			12
+#define CLKID_FCLK_DIV2P5			13
+#define CLKID_GP0_PLL_VCO			14
+#define CLKID_GP0_PLL_DIV0P5			15
+#define CLKID_GP0_PLL				16
+#define CLKID_HIFI0_PLL_VCO			17
+#define CLKID_HIFI0_PLL_DIV0P5			18
+#define CLKID_HIFI0_PLL				19
+#define CLKID_HIFI1_PLL_VCO			20
+#define CLKID_HIFI1_PLL_DIV0P5			21
+#define CLKID_HIFI1_PLL				22
+#define CLKID_HDMI_PLL_VCO			23
+#define CLKID_HDMI_PLL_DIV0P5			24
+#define CLKID_HDMI_PLL_OD0			25
+#define CLKID_HDMI_PLL_OD1			26
+#define CLKID_HDMI_PLL				27
+#define CLKID_HDMI_PLL_PIX_DIV5			28
+#define CLKID_HDMI_PLL_PIX_DIV6P25		29
+#define CLKID_HDMI_PLL_PIX_DIV7P5		30
+#define CLKID_HDMI_PLL_PIX			31
+
+#endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H */

-- 
2.56.1

