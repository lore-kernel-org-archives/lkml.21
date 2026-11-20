Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185168;
	b=VHhdjkjX+4X7QzVPVNQjLyLuSQIxN0cZV8hbqSwovvkxguZTJYaYk+N1Qav9y1IgEZrL
	 a3Y3fou5Y5KJ1Q1odP8NuDReMyYElA2LfTjrnN6yO4/FYfsCzrT/5GanFoOv2ug0BnlMF
	 V1WWdxXNDOTz7sCVb4rjFaDqS0P3zn1WLpsItyi40IHRW/vnmUt3AjFrRLDP+rfJdM1wV
	 +uxdM/5brGoU52J8/tp4jQ/YytobwRa9YAf5ea71Vq6VIZRkXdoVbn1N7rFIEv/2+PvJO
	 tZI7/9UdEuA2cKa3TMAX+5oSyciwdo2uiYIT3QlOJQB9PyknRGTIrLnyWyXYV86QJ6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cimqzB4bCIhynChpt7iVluTD5pnTnQawyp+LKN/vPns=;
	b=U1Q0VE3UzzShMVzsGJ9Ks7EE/4RaUzjK72NA6ULqC+Xg21xGEE9s8nUz3jykkjaEQ7Z7
	 YIia0RmM/XXEOqSyIDOQN9F9QrinqvzHx15tz6IyMgI9h6YpDzIUEr/FlHf+1mi3f8wTL
	 s9aJzx02WcW9+VdcbGmjS4PDbpjpFE81H5eVhsDvHh76jjwDfW4fx970BBonIMYofjgoZ
	 EBsmeTm1KgJEuRVwNyFTJRwIuKu3QOmp01c2XX9yp0C84NbRlHzFuGSYG9NCDAWaV6gA1
	 kk2BXv4E6Gw0Mt8V/6DiCA7fxXtQOuANlpCm0mQk880/XtJup4ZUssIHdnyvXwzJZ4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jUHtFhSD;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419EF606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 419EF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jUHtFhSD
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb61185057so6638015e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185165; x=1795789965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cimqzB4bCIhynChpt7iVluTD5pnTnQawyp+LKN/vPns=;
        b=jUHtFhSDBnbqBMyhJvyDfCTxz50/DKdaprUBQCLoo+W/0p+loIqw95F4H3m/N1RyrL
         etUndpapCO8VqIvzg+0JSA29fYm/GWY4xRzVyhpsOJ//KSUVCuWvUXSnk0PYE6atw20l
         CCwI11N5GZWnvt+fzS8SESwg4YY2kuhfT+A4HzWuXAfSFqvxHm+unSPxw0TT3IUzkyyP
         IoiGDNF7O2YvOvtznD/kV7CTWoL0N0BpXvIdkpx0s6yqqMWKynnBDA10Dizjgu0pLdzb
         sAEdaTEcwEV1nJ/h6bwByovzVUhxjDMaLX/DJXJYP9c3zZA2iKM0A/gcEJZfiCvQoqOx
         XCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185165; x=1795789965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cimqzB4bCIhynChpt7iVluTD5pnTnQawyp+LKN/vPns=;
        b=BlklYUkxCrX9RMMpwbB0E3yrxOEZm8TylxURL1pb127PHSCl+DB6sARSYlPgxS7NjF
         rYjjNjET3QAlrVjiS8lVpoR8mhUZc2M+LrgvCVF0IUg/R8PEpkQnK5SbYuMR9U+1pSCP
         Nv6svHVYErdlLxZtV3BBN58Ow7sGK5GaCxNRnX8Y9odKzkLt/1V96lab/GFlDj5w+ca5
         6+ZMEFhVPuKjv1PJJe2R647ZA9Uxon/lf7IMIpD6qAJLtU/WX3UTQ3a9wO2g5rL+UdEe
         06ynhbTN/6PEDefuwweqVe4WLxxNCRApXa6btP03psEWzCTh6ZzrgSasSDLerUFW5fTt
         9rPA==
X-Forwarded-Encrypted: i=1; AL+hErGr3GcAojrPs+DpE9BeOut7a7ArslZw5nNvSfc9pV/V05mwZo9iI/+SPu/6WOBo6jNvmR8jN1qYf+RIbv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q9EAEHLCnYbLKv8w3q2Vg7XB5RuKBGQMkJ+Gntmlc9o6koCoN
	uV3Ax1N7gg7TWcC49ZirB7MM0Gk6lCn9+zBI6o4Q3igDBdHD0PflsdBShFonAw==
X-Gm-Gg: AYBFou3RSITO88dpezOwoWlhDdwUAx0HEX3IQnEUkYBkoAeGR3kmxwrUMH7yoEPAcyG
	qykYrbxisWLoh1ORzFrDpk68WY+weQf3k1RXakvAkGNxHHHmdFzGeevDXKSSsnfNmgQUXkdw03U
	/maCGobyS5hU3uKsmQCfYRK9CIzVbZCyhyo/NqCn3PU7gbpHWE+h4Td4x6X+WNLQNLLpvWDfgbE
	S5D1ygtZoZLhNiQdi9E4ueEUldjnJt3EqNQpbDcHnj1XVfFDpunFcgSrPH3onKfeTXVrzliBT2R
	uT7X8q1NpkdKK6BwxsC8lV3y/bGFRzYz0kF1/I6R3eNSM24XksDlMdHe8fvl7GgEpq/Gh5Rk1cN
	hkwQZ3+ZNTg57keiTDyGousDeq7t61T8YKm057A6OyXuwXXbNSwGhZCAv2jbebYo5749c0Guycg
	L26D7+aQWndrqAuZXi5IK9eFE8tKyt2jg3ArxAEO1FTV3WxN6xLwPO3ctZs7nXJxTvHBvqu6k0j
	Qt8eEFD7ExXGHykcXTLbPgGtHAG53zhasmiRx5Dt/j8G5VJ5CeSeP82We+jrafR++WkHrRRqto8
	7O2ljTcfbbPnoTu/kHispcdQXpCapZCZwtrwuHvWhO/lbVe0XZLrh/wZ4FrnBhwIc79C+zBTzhx
	d5ChN3AAarG7xP+jFMwIVpJrwZSXm2I0/+/nvt7l+IN928ns=
X-Received: by 2002:a05:600c:8b5c:b0:4bb:741d:ea0 with SMTP id 5b1f17b1804b1-4bb8880f621mr78246415e9.17.1795185165293;
        Fri, 20 Nov 2026 06:32:45 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61e53asm6378286f8f.59.2026.11.20.06.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:32:44 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx8mp-var: Add Cortex-M7 support
Date: Fri, 20 Nov 2026 15:32:41 +0100
Message-ID: <20261120143241.17297-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add Cortex-M7 configurations for DART-MX8M-PLUS on Sonata,
VAR-SOM-MX8M-PLUS on Symphony and VAR-SMARC-MX8M-PLUS on Echo.

Share the reserved memory and remoteproc configuration through a common
include, and add board overlays and combined -m7 DTBs for remoteproc and
RPMsg support.

Mark the UART, I2C, SPI and CAN controllers used by the Cortex-M7 firmware
with "reserved" status. Disable PCIe on Symphony and USB-C on Echo,
since their reset and role controllers depend on the I2C buses reserved
for the M7.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/Makefile        | 13 ++++
 .../dts/freescale/imx8mp-var-common-m7.dtsi   | 68 +++++++++++++++++++
 .../freescale/imx8mp-var-dart-sonata-m7.dtso  | 31 +++++++++
 .../freescale/imx8mp-var-smarc-echo-m7.dtso   | 36 ++++++++++
 .../freescale/imx8mp-var-som-symphony-m7.dtso | 36 ++++++++++
 5 files changed, 184 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata-m7.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo-m7.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony-m7.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index ae28e6b02a5c..3745688a5b4a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -723,9 +723,22 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-ultra-mach-sbc.dtb
+
+imx8mp-var-dart-sonata-m7-dtbs := imx8mp-var-dart-sonata.dtb imx8mp-var-dart-sonata-m7.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-sonata-m7.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-sonata-m7.dtbo
+
+imx8mp-var-smarc-echo-m7-dtbs := imx8mp-var-smarc-echo.dtb imx8mp-var-smarc-echo-m7.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-smarc-echo.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-smarc-echo-m7.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-smarc-echo-m7.dtbo
+
+imx8mp-var-som-symphony-m7-dtbs := imx8mp-var-som-symphony.dtb imx8mp-var-som-symphony-m7.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony-m7.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony-m7.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw72xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi
new file mode 100644
index 000000000000..9d554a175fbf
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Common Cortex-M7 configuration for Variscite i.MX8M Plus modules
+ *
+ * Link: https://www.variscite.com/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+&{/} {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		vdev0vring0: vdev0vring0@40000000 {
+			reg = <0 0x40000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@40008000 {
+			reg = <0 0x40008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@400ff000 {
+			reg = <0 0x400ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@40400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x40400000 0 0x100000>;
+			no-map;
+		};
+
+		/*
+		 * Keep this region aligned with the Cortex-M7 DDR region in the
+		 * boot firmware's RDC configuration.
+		 *
+		 * RDC DDR addresses are encoded as:
+		 * (physical address - 0x40000000) >> 1.
+		 */
+		m7_reserved: m7@7b000000 {
+			reg = <0 0x7b000000 0 0x1000000>;
+			no-map;
+		};
+	};
+
+	cm7: imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+		clocks = <&clk IMX8MP_CLK_M7_CORE>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&m7_reserved>, <&rsc_table>;
+		memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+				      "m7-reserved-ddr", "rsc-table";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata-m7.dtso b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata-m7.dtso
new file mode 100644
index 000000000000..c5cc032fb4be
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata-m7.dtso
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M7 support for Variscite DART-MX8M-PLUS on Sonata-Board
+ *
+ * Link: https://variscite.com/carrier-boards/sonata-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-var-common-m7.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M7 firmware. */
+&ecspi1 {
+	status = "reserved";
+};
+
+&flexcan1 {
+	status = "reserved";
+};
+
+&i2c3 {
+	status = "reserved";
+};
+
+&uart3 {
+	status = "reserved";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo-m7.dtso b/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo-m7.dtso
new file mode 100644
index 000000000000..2b91511084f4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo-m7.dtso
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M7 support for Variscite VAR-SMARC-MX8M-PLUS on Echo-Board
+ *
+ * Link: https://variscite.com/carrier-boards/echo-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-var-common-m7.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M7 firmware. */
+&ecspi2 {
+	status = "reserved";
+};
+
+&flexcan1 {
+	status = "reserved";
+};
+
+&i2c2 {
+	status = "reserved";
+};
+
+&uart4 {
+	status = "reserved";
+};
+
+/* The USB-C role controller is on I2C2. */
+&usb_dwc3_0 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony-m7.dtso b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony-m7.dtso
new file mode 100644
index 000000000000..710ddff2fb11
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony-m7.dtso
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M7 support for Variscite VAR-SOM-MX8M-PLUS on Symphony-Board
+ *
+ * Link: https://variscite.com/carrier-boards/symphony-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-var-common-m7.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M7 firmware. */
+&ecspi2 {
+	status = "reserved";
+};
+
+&flexcan2 {
+	status = "reserved";
+};
+
+&i2c4 {
+	status = "reserved";
+};
+
+/* The PCIe reset GPIO is provided by the expander on I2C4. */
+&pcie {
+	status = "disabled";
+};
+
+&uart4 {
+	status = "reserved";
+};
-- 
2.47.3

