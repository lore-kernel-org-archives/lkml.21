Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198703;
	b=O6Fi0L1ds039GuETGGAQrtW6wRRBtzOKqL8zs6xQ8xMOAg0HoFx+r1VTTfzkna/emYHP
	 2IC7+edwGi8TKMT+lp8BVEYH+B/uhfzBC121alrOo4K6SpWSOiPWKrdf2P8ody11YCLq6
	 aaQjca6ok46/AuEGjFYlR98zyPM5pKqUMvW7c1AA76E3A2t30TYdYMBtyw6rfsUPVgw0N
	 c4yZybc+yguLxulPjkd3/GHvLcKYE/Iyt4jMkgsh5s/p/hQri/QFPjqIeHMl9YxszcdgL
	 e2gESq0PqDhhgJYNj3j3dng1GYBw2EG7OQmlao6RrnMjmFlVRhPzjRa+UNKDzKMOxYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F+kfwwjCYMQqRtD6fmxwn5boEWQH1gRaWvH/BgGTxxw=;
	b=S8ttlxNos3e962QgvgC5Dg5OA6IyTK8BmIdlMjZc+aOdl1h91eASbL7KdxZw8UQqh1Aa
	 4m+YryXNoFLCmpPuiIIe3Lh5Kdr/zEKDwDwxYeUMDEFLCECKnw7FhYvFYxytNNrQD/Uew
	 UhsaSL2FC6jogjj9ZTL9qNoZlXiYv3sV4Z8Iw1KZHzvO8aIsI7C1IYzQnsQZJe7TBRYAd
	 q6M6LS0kBkD3piuQFiCZJQmUDuEQIcqHUWyy+yC1aKwMt0ortMxQF8zRqW5epdVPi+8sk
	 RkHF1CXzK2/8cPRESk0U1qR1Yd+sh+dN2eM7UsJPLdIM4p2oVvA+NUKYK0VmALmscMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TzBVnh3R;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF29606B9B1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AF29606B9B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TzBVnh3R
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso11486525e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795198702; x=1795803502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+kfwwjCYMQqRtD6fmxwn5boEWQH1gRaWvH/BgGTxxw=;
        b=TzBVnh3RUQiRQGeTLDd1hc3xkppDZkzBbJhETCF3BYEaYC0G/JIcXXJwcg7ZQ6u3pN
         DhJJQmpNMcKGnxR1efw40notwL390xuwa3hYe2qdJIcys9LvNr8bQBTBr5EtiRZPSKrY
         NyYl3hESJYGbRHi9BNwV5vDLBRscNEhhIacIH8n9KcP5hOxCH3qCwWo37jWw3zvse+43
         yoYlBSfLI0LyVFZGRKnt+UZMXbBbL755VX0xhSVmR4AxfzR3WFy4BZ/RLg8QhGBnZb22
         m9IQ8L7t8wtpFNyBm0VD+r2pe3QVHCHzA0Fvcu/mTgmoO+9UOzEjsEuSk1jasqLZ1+vJ
         qRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795198702; x=1795803502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+kfwwjCYMQqRtD6fmxwn5boEWQH1gRaWvH/BgGTxxw=;
        b=emNrtAO92AcqRY8wtMTP/YnoCvwDQxh0cjg5mvAvZYbfrmCIWM9BNltEbhSudV4dQW
         kRwcQDEEO6VysboSRZdu/utCLcV6Zpvwx5GiNIAS/60la97r9R31eJf88ifM2pjm1wsh
         MLitRDHIBLAFgqyLUFem1TiRxCHDDaY1zWFge/BYWvh890WM1ARRloPYRR3i16PaPrTb
         4IuwJlP3RbNsWrmQeSIbGIi7bQAYzs+9BKFT5+9b6kiv8IwcIa4p1Rf4yL0Zd978MW8K
         n5MuqN/k/KYLoRs4yI94rtRGgxB+wdYCT3bBhpLUrBnLafY3qJj8dQgunyAExPNgCLof
         56mg==
X-Forwarded-Encrypted: i=1; AL+hErECgjpXQ8txmTeu4P0TeCZ9OA1JrAIxHfKy5Ba4G5yVrliXn+WJY6xQdiAqdWadTyOwP+xAp3m66FFTKZo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zy2BewElqoxCqUjjwKy6/y6oiALjaT1p3/AbDP+1VGMddXdWo
	PIM95W2vU42uGt90MJvzv+qYmcvLIc8s29Tr9VSWCfdnO+fWsdqPC2mF
X-Gm-Gg: AYBFou2nQ6bn5hsXim8z5FjHUgV0bZiibzVTS3IKvwWzTs8diE2LLPTx6KLLRbL8hQz
	dLqizbmVH4D5CX6jJ7TSozaDLUKZW2uC2fVHf3kjRPfpdvryIg77jd15YLh7G89arAXvoq5Pmta
	4Igq7rPJInvMQVFaxeg2az0ee/hnZUai4D56o2c1NtDP41rhRcOzU6Z844y/ctiAtah4T+V1rB0
	bRQjANB5tsuJ+FiwzWJszGFaFzG/CQQh2LuMo7gNSSgBZxF48QA0M9PtWhU8cg3PkzXK1XLYyTt
	IlHE4Kr3dtzdixNO8dBpbaF41Jz9UVElD6BRTX5xhgQXtnTu8yAvZED7DJukP1O1aWYc4Qq9w+O
	s4ZPYS9JzE7c3RWifQp6nZ0Wf7cOtn4sDAWnrzFQXDR0fOskTvHJUOkE/LGW9GIlnGXUSZ1CMnx
	ljryeCZ1Z5x93tZGM9gK0Q8VuHFVVWDkocWo6WHw8S+g16bk3CyJ4/o55oOGGdxBiqMOSs9bv6Z
	DlRrpfSPBvAKCGF+egblJZeMH7F8niHr7CByBF5eGNim+e2yfjQIICJTHqe9vKomcubC3WmheHu
	C6AQf7VPcKsVqgU/Bd7bHlDyJ9AlbU85dk4lE3YouO8EY2k/m47ZdkvEJIdTRLnoBQJOgbIJ3Qp
	svO8VxcVkYWOUYbS7r+5fsJDbQOi0Dhsn1pcaTCHkirKfoyw8WvxJpb5ROIZl6UruG0d9
X-Received: by 2002:a05:600c:1548:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4bb88800020mr98021205e9.7.1795198701398;
        Fri, 20 Nov 2026 10:18:21 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895eec06sm34756025e9.2.2026.11.20.10.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:18:20 -0800 (PST)
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
Subject: [PATCH v4 1/1] arm64: dts: imx8mm-var: Add Cortex-M4 support
Date: Fri, 20 Nov 2026 19:18:16 +0100
Message-ID: <20261120181816.33455-1-stefano.r@variscite.com>
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
v3->v4:
 - Use common node names for memory regions

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
index 000000000000..e2f369e2ef26
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
+		m4_reserved: memory@7e000000 {
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

