Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167364;
	b=ZtlM09U8JEh1Xj5H+zN6M6KnZqKNfyAi21WdwACcUjQE5/FFyUNB7EEVSeuqb5xoYxSn
	 1SOSCwmvxe1IUZdgnb5c/8yFrhJopgiM8aYkEz0r77ty6nBszl1VhuzCQ2iC2er5OP2gd
	 LoeuUd95+nihUHot+IQwLYMweZDCFpKAuwL/rkensiZflb6ywmS7oUXlFsRDdIFhsl5y8
	 DL/k12L+yj4CDUBtjzsGPoa0mGsbKvqitXOIe7WzfzJEgySjaHzF0hFpLdCAMWk9i35s1
	 gWvZbeUrObuHeQP6CpEW9IhrfXEoEGDHTC3nE6zmdn/KD0/dxaOf3pw6+qe4WlTJXCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/hW96zxuTk5ld/IlSdO1JUuxAcYc/tMjLiVGZKJqIFk=;
	b=yzAmt54r+cgk+LqvPZ3HB6Tb26f60wWhrlwpIYmmLsAGRta3Zd5uYnDsmC22A/53LH9V
	 yZSK9Fel7jfbW+CfmHeXnVL1PF3bacGXfjfYz2idwKmZUkgCHVsUwOS6x9UvIyWXBk9vD
	 pgxQbDG9MYQJrDX/CaxE57gdsD11B/jxsQtD0QNhruj0otbH9ufRYPOeTiLLB1iglC9Kp
	 mF7Ld6suiNmqPEmL2uWB/lIBL+f9c29cjip9JbmEJfHBrQB4mL3b0t6wIqHtY6fBZz/VD
	 8WWgSPYUanJ79l9Qm67PE9M0jFwq0jz41KiGmBTFSaZNnmAVPgiAbcejXb4wy7JWt6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8EoJIZF;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C38606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15C38606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8EoJIZF
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49d64a88222so1164058f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167361; x=1795772161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/hW96zxuTk5ld/IlSdO1JUuxAcYc/tMjLiVGZKJqIFk=;
        b=o8EoJIZFfNxWUcajM9GTvYDdGwpka09HiGu/uPZ9DKws2+OYs5vw3uyqvWMnB4ZcFm
         5sKFsqdBL9kmgyAuepxJMlAZxmfvSAWPEO6U8Mhz7uopmdX0Le2p3A+8g2eUeT+sXRCi
         +oxZAti8upFqxl5vBGHzpGfmaQjIEU+PLS5V1/xjnpTEYpT6RwKejj0l5vKCdvte/1kv
         jyejNnkxifNx9azamuZfvl4WZ4pN7jq3yROWPAAouQmNkGxSH/ANnAWhB2D/aw4aqEQy
         zMK3rZ/BnzgZuZQg92A2u1RsC9ZFtWQFGw1gxtr5NoN0qVEooQhrrlJ5TRALZa2A50XT
         mPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167361; x=1795772161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/hW96zxuTk5ld/IlSdO1JUuxAcYc/tMjLiVGZKJqIFk=;
        b=piJUKmpc94RhJUkbb2wc+oyRpE2cPNHLlwyWfHa8INidpTf35E6ygtI0mpIJQNQK62
         UcQ3ICvybZugKqypdRjO5rpZM/q0iaZDtifuQ+CWcTLkFANheQi5FYAlVJlaP5TTmUT2
         +ffTNRniSB7syoV/ar6f4ESV4CC16t8tbTip67GG/ekFBrOFw8s1/65qQgxHJ/Wvt2uh
         UCExvy0IdjkCLFFnLylHJ5bnhVD9GZmiGod7EYpkuoY5U2jRz3uNUqZ7K2Op9FvLL/eq
         p9nGIjJVazTHaLTJ66GCfniZ5EuIvJ8NpZtUUn9I6poFPxC49ow4i1zgFygioN3mUFFo
         /NnA==
X-Forwarded-Encrypted: i=1; AL+hErFkb3NBHu2rtmZkZH8M54a760kqGcvBb8jKSAuRY74RQVhT/WiyEuCU+eVvDaj3r3PSxGN7UDT1/z2a3/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7aOtV+6IO26fvqHC1oUU1pNvUFxnar4I43qbqDKEnjBZ/xOIk
	g9lKNMqEQgyKz9R6TivcKla5srxiY5BVWcZhQ9HVbX2EM9ynOHCtqDwi
X-Gm-Gg: AZFdTZcFY6pP1EAJ6+5ktZi/gFh0XvbRm0DcUV0kDnE5LCnPI4Eh2ar1mkHIhwK7rJ9
	s8CenfrgyWRBEFcJpOGWR8VUcCUbArkDL4VD0ktzwUndde/WAqQAiOZbaWKdcVPl7jUHq9RfhuN
	8y80Te3V5UjH4FWOwWr8i3EkYzSxl8gF/3V1OuNDCpuXwIQKcM2Rp/zLlPqgPrZC5i1u79a4Jfi
	f+fc2LgmSUKlx0j8CkuzyKYUY99Y/hrdfJiJYmT65HMSf/6NuxW9kXWirjzc3l042Nw8rmRjo5m
	XQIuRm2n10ftkyTMBILaZZFspJHIgGw877OXM0ln4bN4cvwC0KmpWVN36hBbw1XCQCekQuuJhQt
	YHXqswiVkKgAhsikvcX0Yk7aYk0anrNXFF8+GpP7WiJNZNCOBWPE1srDBknvZro1h98R/PDsgoa
	C38pn1ZVfmP0rvylpZuKC982rTcSk2yP6qJDUhasW0mFONXi+2fyFFaiWpSTaH82zn0vYGnFxs6
	EdBEX5tD7dw7/axgt0jWcjx5f4M6LsO6tyygOsGv3S8zI9TnSExsGna1JyzhrSxX9YLlJ+Arcuh
	Yd6+lYcKb5XbjYwjc0Oqz2LX3eRR9pZV67t1+woNPHYWKbaLOCF67IJ6A/Perqw72XGbzznK3iu
	4QKnWGxOIKkzNdV9N9i7iYPY7es+UUSuqhtDnTwVq7s7cMG0=
X-Received: by 2002:a05:6000:184b:b0:4a7:9630:7b36 with SMTP id ffacd0b85a97d-4abb3f15ddbmr5085151f8f.21.1795167361168;
        Fri, 20 Nov 2026 01:36:01 -0800 (PST)
Received: from GLaDOS.station ([193.207.34.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c43563esm4664645f8f.57.2026.11.20.01.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:36:00 -0800 (PST)
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
Subject: [PATCH v3 1/1] arm64: dts: imx8mm-var: Add Cortex-M4 support
Date: Fri, 20 Nov 2026 10:35:57 +0100
Message-ID: <20261120093557.4513-1-stefano.r@variscite.com>
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

Add Cortex-M4 configurations for DART-MX8M-MINI on Sonata and
VAR-SOM-MX8M-MINI on Symphony.

Share the reserved memory and remoteproc configuration through a common
include, and add overlays and combined -m4 DTBs for remoteproc and RPMsg
support.

Reserve ECSPI1, I2C4, PWM3 and UART3 for the Cortex-M4 firmware. On Sonata,
also disable the buttons and PCIe, which depend on GPIO expanders on
I2C4.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Change disabled status for peripherals reserved to m4

This patch depends on commit ebb21cc5d1c0
("dt-bindings: remoteproc: imx_rproc: Document memory-region-names to avoid implicit ABI")
for validation of the new memory-region-names property:
https://lore.kernel.org/r/20261023-memory-region-name-v9-1-ad597887dfe9@nxp.com

v1->v2:
 - Add memory-region-names as requested by Frank Li.
 - Convert the Sonata M4 configuration to an overlay, so both boards use
   the same approach and the overlays can be reused across board variants.

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx8mm-var-common-m4.dtsi   | 62 +++++++++++++++++++
 .../freescale/imx8mm-var-dart-sonata-m4.dtso  | 49 +++++++++++++++
 .../freescale/imx8mm-var-som-symphony-m4.dtso | 31 ++++++++++
 4 files changed, 151 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd548284358..c542613ed3ea 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -245,9 +245,18 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-prt8mm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-iv-306-d.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-mini-111.dtb
+
+imx8mm-var-dart-sonata-m4-dtbs := imx8mm-var-dart-sonata.dtb imx8mm-var-dart-sonata-m4.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata-m4.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata-m4.dtbo
+
+imx8mm-var-som-symphony-m4-dtbs := imx8mm-var-som-symphony.dtb imx8mm-var-som-symphony-m4.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-legacy.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-m4.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-m4.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw71xx-0x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw72xx-0x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw73xx-0x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
new file mode 100644
index 000000000000..ba2457d0ec91
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M4 configuration for Variscite i.MX8M Mini modules
+ *
+ * Link: https://www.variscite.com/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include <dt-bindings/clock/imx8mm-clock.h>
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
+		m4_reserved: m4@7e000000 {
+			reg = <0 0x7e000000 0 0x1000000>;
+			no-map;
+		};
+	};
+
+	imx8mm-cm4 {
+		compatible = "fsl,imx8mm-cm4";
+		clocks = <&clk IMX8MM_CLK_M4_CORE>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&m4_reserved>, <&rsc_table>;
+		memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+				      "m4-reserved-ddr", "rsc-table";
+		syscon = <&src>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso
new file mode 100644
index 000000000000..2f290c3ae467
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M4 support for Variscite DART-MX8M-MINI on Sonata-Board
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
+#include "imx8mm-var-common-m4.dtsi"
+
+/* The buttons use a GPIO expander on I2C4. */
+&{/gpio-keys} {
+	status = "disabled";
+};
+
+/* Reserve the peripherals used by the Cortex-M4 firmware. */
+&ecspi1 {
+	status = "reserved";
+};
+
+/*
+ * Keep the touchscreen enabled without its optional reset GPIO, since the
+ * GPIO expander on I2C4 is unavailable to Linux.
+ */
+&ft5x06_ts {
+	reset-gpios = <0>;
+};
+
+&i2c4 {
+	status = "reserved";
+};
+
+/* The PCIe reset uses a GPIO expander on I2C4. */
+&pcie0 {
+	status = "disabled";
+};
+
+&pwm3 {
+	status = "reserved";
+};
+
+&uart3 {
+	status = "reserved";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso
new file mode 100644
index 000000000000..ff5675cfc191
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M4 support for Variscite VAR-SOM-MX8M-MINI on Symphony-Board
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
+#include "imx8mm-var-common-m4.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M4 firmware. */
+&ecspi1 {
+	status = "reserved";
+};
+
+&i2c4 {
+	status = "reserved";
+};
+
+&pwm3 {
+	status = "reserved";
+};
+
+&uart3 {
+	status = "reserved";
+};
-- 
2.47.3

