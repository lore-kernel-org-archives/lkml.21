Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198657;
	b=4n9nLJpwR9/TcTDmdrTwRF1guU237c4/mB4QIAamG3rTAiR4JSViKihfF+JujhTAvjS9
	 yBnGUwKilyfXSgQTltYNxX6/glN/hoyujRRCgl9ZvkGH/SBDiKoHX9/EK5l771MnQvPHU
	 Y8NSVuVyopMjoJSsPpYKF00vnObVcgnDw/ytQ1wyYf8gujxIWwczLTjZowQxNCRkZ3RaA
	 r9XjrLo9TdmTrI7PFa+vimaJVPL9Vkf79g7DJZPI8nKvwscXrKLZiMVcGW77k35IM3U4B
	 1ERUeKo4n4dizIXCPR+XSiiwFJLNOwpbnVNIsFxx7u6plj8dvkEoaT25sGnXLR6UarA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ao45PZIc57K7i00r/ydgLRv43mzObnJdlxREPBvg2co=;
	b=lqpccEzA0cnfheFJ5XKnxJCzUEEYACzHGe9H49h9ZrAYVyRJ2NDCs1GASh9V3gekX+o3
	 2WVFH9r3gEzNpy9qUTR3NCqzzLHfV629PhaNaknQFrTsoqrmClKxVQeMGj8pvpV0XRffK
	 q5y7UPFcP5eokEIC4MOeFcACm7sozlAQfwkwrGWiS5DCZpecH2ijtw0ElLf8S+eOcmdtg
	 noJzfuTQMV/42OFWlvIQ+fyFvW9vLTumVkHkhx0aZsL20FCffribiSeUqimwKU4dcEGzT
	 Erj9n+Q8RQCF9R1R9YQWOrB3v+bVvG1inMmqfTmNihu1mVNbFQgWtWCpoID6sVdATlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KcWI9kak;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497B8607635B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 497B8607635B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KcWI9kak
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb606491faso6769775e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795198655; x=1795803455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ao45PZIc57K7i00r/ydgLRv43mzObnJdlxREPBvg2co=;
        b=KcWI9kakku2rGPg0hLmcq+UNgzD9XBaUIiSOCIDyNMYyBLAA+YLyvr2Tn7CgkIZvcQ
         N88XMAiorKmAKPIZIhr2mSsJhgH8f12PRuCB8/iS9RwA3sPSWo0dqmY4jdHsOdYTpcRn
         JD9eAHI1SHmB83D/qxBS38a02opPZmDtBX0Ec62BEf+YEcvYFbnfNIzjMTvp//89CC8C
         hE/HkNaEYjL+qbdTya1QtEtioBSLh0/OfVi6WgVzt8W+P08AoVq+STVDhb6L/7xHDg0t
         HeWTHYnJIzIj+BbAvi1H/oz9jSlOqfGvG971zSQO+brzNPqrmIA5hQ0q4l1lgJLk5q6h
         wYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795198655; x=1795803455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ao45PZIc57K7i00r/ydgLRv43mzObnJdlxREPBvg2co=;
        b=bSPDzXr2vh7ML1ZcaEjhp30Qq7sROx5Ufs/+GmzdwVpFpTfYyr57t4gQgSkloD82c4
         GgTUIWRvQvJLKT6bvTDhWP8xk1qlka0FrDLRb3DKjyeUeDC5B9uRKe6OVjK0U56W6C0c
         p7bbVyNiaGOlC3D1NX9h1gsL496jplC5HZlV8RcqUe02P78sN7KX/wVJF3LdGlawA9w4
         /x5F/0QlElzMmt8eQ6TQA8LaU7gAtYksISFrGSLN7NuT2G0UG/ZXjruOaHnMIdflHmX0
         8KLslET5RKOQ8gAvdrRYrGVSZvGZYtnCFLUGslnYPa/BOmg/BC/IUJNvcSKq9ek8wyyE
         UOTQ==
X-Forwarded-Encrypted: i=1; AL+hErFbWRxIx5MHWARpWq+l2P6e1yO8G/uuSHvomNa5h+O+WzDStzIc9CNVKXDGKGWkseCqG2SR09AJHPVmc2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zBjZ0qcu3eRAmtpjLth17pKwwNzUWBlSKy01V7woOLdzOhKwf
	vLGVx8lbYiouGai3O3cNQmBmaASIQo96fQHpojp6QZGtK5+UCSVlEtUx
X-Gm-Gg: AYBFou23V0FXUYDtdPrxZez+ejUcQkFwqczIac+rG0wv3cO0NG2zGbmRpygBNxSlMFn
	Sa3+YWseAYSR64Lx4PtgpiAk8MiIq9WPjHRuMN1LGTYpl0scyGOiI/15Ni7ncDwYfMZiHKjEV+2
	EyRwtuKsSxJcVp9usM+sPoB3zLUHJWj+RZO1EwazWQ/QjpRF4TxENjpmIEOkIaY7oGECGQr3Hbz
	WAvHXTiSptXiWldlfim01r8jSyKwXZLFaT5Xli75vJQY0ydIIBJlbi0ZMlv5SrWTjv7hB7I8wUM
	22rG/d8wOFWUO32lMJbORdbKkhkL1CbHGEEldIywdDDVqhijoqptIZ1tbqPskV8K6/qXzrJuMOD
	eKT3yqcWrKF5PlRiqv7X7sfJXhnmtcBKi0MSV8ToSfIV8SyWfj3Bxas/Xax7MjyNqjrxvAj/x6u
	VPzVDwbIn7Wuo9dvS8eoTykme9zmbF6OA8Qwv3oTJ1CJsPtO1buxofxvGUnlyxzZ92fAEf5NnTH
	lZ82KECOWWzVWX/P3ZXOMQ0KA7VPhwIg5+GtiQOaIPccnBzuDjd8H57EDhwLv1/Xn0EScMWnY0H
	HP47uegs3o/OgSYRJvkruVwRb5c4H9wBevRzDFRY+dXRwSL6pFyDDMVs06ZV47rwEQmmcNIKeHJ
	zIwB9U+L0jpJ7J7AdurvjwIL4jliiH7ymFjzIq/Md1UJ7rgCR
X-Received: by 2002:a05:600c:828e:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb8878702emr102579795e9.0.1795198654474;
        Fri, 20 Nov 2026 10:17:34 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm131698035e9.5.2026.11.20.10.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:17:33 -0800 (PST)
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
Subject: [PATCH v2 1/1] arm64: dts: freescale: imx8mp-var: Add Cortex-M7 support
Date: Fri, 20 Nov 2026 19:17:27 +0100
Message-ID: <20261120181727.33321-1-stefano.r@variscite.com>
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
v1->v2:
 - Use common node names for memory regions

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
index 000000000000..486b924e202d
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
+		vdev0vring0: memory@40000000 {
+			reg = <0 0x40000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@40008000 {
+			reg = <0 0x40008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: memory@400ff000 {
+			reg = <0 0x400ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: memory@40400000 {
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
+		m7_reserved: memory@7b000000 {
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

