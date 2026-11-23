Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438195;
	b=gmqQqmmTzsb7D5qU4kZ/cHhb7zgvjfTJNZfDZ0pOZp4KTdgZf6sXTiOUZqSLnvvssHCQ
	 Rmw/fl+vfsSNLHQTlw9kAbyK8KzDaNCZcaEqjZ7MNVL946VC1Qklb18Dg6Zj794yUmtY7
	 yPDsWDpPB78iWu373emRJkEFYE/VKoO30Rw6ojc7kww6JJTVNSA6diAxOawd4KjFiNx0r
	 XFSWRotMIJWk7ObnSF+f8EpiTBoukd75cJCV7Vb1Rj4bLcb0q9HZAZPn5e9lYow+K08JR
	 V008oaT0WY9kxQA3QCKJkomY+yUTrgGhBRHJcS2ejRra2srF7jWw7jI8bqkFMlJ5oQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9m1xm47iTHmLbcZlMUBpwxPOmBYRH1wRG2JSqMQ6DpY=;
	b=wOsdmmqnTZ7pH48xOqBROf1VaFK4wgC2ciMZCaLMwrVFftX3inTxNu2LXWAIdqUtByhP
	 7eu3oMy0h5JB+2tD9MKLH5O5VfV8eOoIaFjAsHDO+ehTcaNUpfWAug9kVTMagsxWcXOlB
	 e+tNGQtGcFy5xSMOYhgvwPcvbKVi4J7LUv5HuZQNym7q/6BX3yuzmiy5geDzN7LmjF8hM
	 Ee0uqI73MgAgMVVQBwqzsjpCuexpnaa+6WSu0IthEhQsd7zwoF2m7HGyykFh/Ej1WodSH
	 1cDpZi5umf2TMLgp2DdatT/JQmEU7iPUnPoX6sn0hQG0jmC3LN2I2D7KaHUmkG8kLpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uNDbMNB5;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C845D606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C845D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uNDbMNB5
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1507202f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438193; x=1796042993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9m1xm47iTHmLbcZlMUBpwxPOmBYRH1wRG2JSqMQ6DpY=;
        b=uNDbMNB5P/UXcDjqxTqtjv2IUNx7qr2x1JzALoIwVM1MdIVCfHtUqv7YHRSQYGznmi
         v3F8rvG/Eq3QyqNd9tEkTK9Vw/CyseGpDpgLIJmMFLWfmY4Z9UDcAVLnjc9SJkoNFWi1
         AMtHhWAFRfdCTdL6UTsE13i6LsLaZC0JiK7R63SQklxci/qAC1/Ex3KQTd9VnDfQj83U
         3JYY1a0cdc0bdERaRKRxDSvOfRGOGPLtZzBBQ1So1jrqy4/psumOeiNp14kkheKAq24Z
         qhi4MKnL3HGxZ1MX0Ib3nk2NAue6+IPV1DIkYLaOG2rtDpood6aBKqBgTCpzft4oh32Y
         lQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438193; x=1796042993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9m1xm47iTHmLbcZlMUBpwxPOmBYRH1wRG2JSqMQ6DpY=;
        b=FmiPpMGTEsLN7ZrL/F0EAO+ZQVKflC9OhtaPflzQTzndcFwxjcsPoErwcy3NOeUPZW
         0BSzH7hREJuj9vKUrPsdShpb5jf8CSFIOdHr42HVhnDvBKP33fyCVR4sI8VWZ4k28BCH
         uGBNjucPzhg17OJ1g2l9m2Idu8GUBKDFw8h5TQjKM2IdDPuDTBCmyQYOM8P5gBXb3T4y
         /C6HRRIsIt9Iz+TCbbotOyPAeuxgHmZ3lHLqtLGckQclWGzerDCRBT+Yb0Q036i+T9ER
         bRWfmc17xd1Kh0stJcr2LNbGFPbCg1kGYQmiRoalPHE1xhO2tSl78pOVGS0IbORu0p1v
         opXA==
X-Forwarded-Encrypted: i=1; AL+hErGCdFl3r7cZX//ug2Vme5LFidFCmVHzjm789bCCXmH4x30IOP7pjzGM2u9WtWZ6Ss8Si5LKEir7kPflnBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qKm/gFausc1KaDzqY4T6ffpS20U4ZdAmuQjhXkZNV3yca0046
	2b0oKpKWyZeGHABeUMNW/bsQvUXQKbFeAVd6JC3nBMAF8+/i4GSAy6Qi
X-Gm-Gg: AZFdTZfGluzlggRGGjQTs2G6bP2dG+O4AMWxfVdSoW130mhwiL/DNsKo23GIG/1miSo
	j59EhIbxH+h6kLfbnm47XZtEjo3LzNqPPyh/6U/7nphKqH++GV0x5lMB6yvb/++1/8DrzWk/Kse
	oFL6hMLtufR36J+O3neBYHcKkCvEn1zi+w+09C3HVxbB3BieK8IIAXM/FdDQNM8JmGHb9A5jhPx
	WYl6XpzoBtxpfrvaklV23H9l3xBjc0R56VVI1Tloqq+T5vXiU85UI8F2posOsqd+TuINni+wIy0
	3cW0YNEXicTt1ApcFxtuW8HiR3Qpc1iivaHZwUN9NfQHNf6fiBrZYnzvG6tI9Q3Mq5WJqmJqu+t
	AgRBBPAlxCTgrE8kGzWg2DiYgeXH5MWyB8nlXC4LhZgL7FUbRMHF1Fnu/hRfRUP0zc89lNUxY+k
	o47W+e7nIHLm/GLYGccZZ8nxMZUlBsxhKZr4GX+3vE3qatLFSnSNTjt4Lb6EfpC+N6hcJqVJcpZ
	FTLtwc7wZ3tgO+nN1lIeK+Te+K86pFOCb3WmeSK8KLhSRYIQ0v+qv2zn6XHmJVbhSK0OblgporI
	Y9XSS1bnf+IU8GmtOeCvHaQxmeL17mW3IPrxnbupfFiamat9qZIIxAWhyx91S2o9QC/oULbCOtH
	2iCm/3g7G8ZjMXBtEApRUQ1J9WyLPtnGSTWyoQhqA2n52vhXYhg==
X-Received: by 2002:a05:6000:29d2:b0:499:1c0d:4568 with SMTP id ffacd0b85a97d-4abb400ba02mr15984169f8f.48.1795438192874;
        Mon, 23 Nov 2026 04:49:52 -0800 (PST)
Received: from GLaDOS.station ([187.13.213.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm24902638f8f.24.2026.11.23.04.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:49:52 -0800 (PST)
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
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx95-var: Add Cortex-M7 support
Date: Mon, 23 Nov 2026 13:49:46 +0100
Message-ID: <20261123124946.13887-1-stefano.r@variscite.com>
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

Add a Cortex-M7 configuration for DART-MX95 on Sonata.

Place the reserved memory, remoteproc and MU7 configuration in a common
include so other carrier boards using Variscite i.MX95 modules can add
M7 variants by reusing this configuration and providing their own
peripheral assignments in a board overlay.

Add a Sonata overlay and a combined -m7 DTB for remoteproc and RPMsg
support, enabling MU7 only in the M7 configuration.

Reserve eDMA1, eDMA2, FlexCAN1, LPI2C4, LPUART3 and LPUART8 for the remote
firmware. Use PIO for the remaining active I2C, SPI and UART controllers,
and disable SAI3 and its sound card because eDMA2 is unavailable to Linux.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
This patch depends on both of the following commits, which are already
present in linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

 arch/arm64/boot/dts/freescale/Makefile        |  5 ++
 .../dts/freescale/imx95-var-common-m7.dtsi    | 72 +++++++++++++++++++
 .../freescale/imx95-var-dart-sonata-m7.dtso   | 69 ++++++++++++++++++
 .../boot/dts/freescale/imx95-var-dart.dtsi    |  4 --
 4 files changed, 146 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-common-m7.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata-m7.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4b2081a3290b..aa78f02fdef7 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -989,7 +989,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev-ser0-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
+
+imx95-var-dart-sonata-m7-dtbs := imx95-var-dart-sonata.dtb imx95-var-dart-sonata-m7.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata-m7.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata-m7.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-ivy.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-common-m7.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-common-m7.dtsi
new file mode 100644
index 000000000000..21e89092de9e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-var-common-m7.dtsi
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M7 configuration for Variscite i.MX95 modules
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
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
+		m7_reserved: memory@80000000 {
+			reg = <0 0x80000000 0 0x1000000>;
+			no-map;
+		};
+
+		vdev0vring0: memory@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: memory@88010000 {
+			reg = <0 0x88010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: memory@88018000 {
+			reg = <0 0x88018000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0buffer: memory@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
+
+		rsc_table: memory@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
+	};
+
+	remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu7 0 1
+			  &mu7 1 1
+			  &mu7 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>,
+				<&m7_reserved>;
+		memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+				      "vdev1vring0", "vdev1vring1", "rsc-table",
+				      "m7-reserved-ddr";
+	};
+};
+
+&mu7 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata-m7.dtso b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata-m7.dtso
new file mode 100644
index 000000000000..5e63f8169a08
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata-m7.dtso
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M7 support for Variscite DART-MX95 on Sonata-Board
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
+#include "imx95-var-common-m7.dtsi"
+
+/* SAI3 requires eDMA2, which is reserved for the Cortex-M7. */
+&{/sound-wm8904} {
+	status = "disabled";
+};
+
+/* Reserve the peripherals used by the Cortex-M7 firmware. */
+&edma1 {
+	status = "reserved";
+};
+
+&edma2 {
+	status = "reserved";
+};
+
+&flexcan1 {
+	status = "reserved";
+};
+
+/* Keep Linux I2C, SPI and UART controllers running in PIO mode. */
+&lpi2c3 {
+	dmas = <0>, <0>;
+};
+
+&lpi2c4 {
+	status = "reserved";
+};
+
+&lpi2c8 {
+	dmas = <0>, <0>;
+};
+
+&lpspi7 {
+	dmas = <0>, <0>;
+};
+
+&lpuart1 {
+	dmas = <0>, <0>;
+};
+
+&lpuart3 {
+	status = "reserved";
+};
+
+&lpuart5 {
+	dmas = <0>, <0>;
+};
+
+&lpuart8 {
+	status = "reserved";
+};
+
+&sai3 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
index 92ff09fe64a7..76145652b295 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
@@ -173,10 +173,6 @@ bluetooth {
 	};
 };
 
-&mu7 {
-	status = "okay";
-};
-
 &netc_blk_ctrl {
 	status = "okay";
 };
base-commit: 21d2357d5c1ebd2bd7726717e95765d031b55546
-- 
2.47.3

