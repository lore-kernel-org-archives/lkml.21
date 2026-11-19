Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104072;
	b=t2ugT/FklsJeMakR59F4rUl1sNETs4VBExR6uii5Ldg/DeuKq5In8DlgA1/13TKJmBCz
	 4GeMbA1b+fbu0FikP80uyAA8PQ+NiGa1LrzdDUrBMKKmJItutnhi0KqGyhDjSyuWxjxF3
	 nzIbmr7rLF5pB0OJP8s2U2bRff72bakxBhJxSDgUPQerfGB1BHHT3Vp9x512ilEVcTgZk
	 rDGie9Q4P1y5Kh5pp3mo1+/UaZfTJhrOoIeBwS2mE0cUcGEa1cSPeP3Vuk70qK1P6Gq67
	 AZPCH34CwYf3Ke62RHc1tB7nFaI8bap4rKe0tws/J9BVkUFhtBikXY5PZVCmwAEO7tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=kguNqPOSlh7fe1C453DDiUzdHElyaO7Alv2xhzvgL+o=;
	b=Y0pc+K5zYqqPkMX8VxS0/MQPAjpOSoFCEbhLVNHA1bvNKMPTGA21O954dAWhWTxPfswK
	 kdtUDFGKG/+N++kox69FfxtgpVAZZZfCI5mUa7iPFgdDiROEdoEZQI1szgPINCyu4/OuA
	 d7abfws20uWI2jr3KyHUHre3zjIwiCJTEVKtCHWMIJyqHd8juAL9Gw+U/cHVMEcac84Hn
	 WfzdWBwrcP0/MG6XVNzelDv+fPcr29nYHV+PzWTch7a8zSUvNuO/ZVj7lIZHFs3m7et56
	 KYzGw1cG8v2wcieKQnegqRSwCmZqZmNG1hvcWGtO4zsCSicBeCtHtZOsZVperRhy5KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PManqnll;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D28760A261F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D28760A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PManqnll
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4cdc606b47so414206666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104070; x=1795708870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kguNqPOSlh7fe1C453DDiUzdHElyaO7Alv2xhzvgL+o=;
        b=PManqnllVK0xOEkGqCE76wegtiJG0Z2TXIp2HESL6BcCyUP3+PVwE15QmQ9Y/w4B66
         mnmAVr0khh3Y4Q5jsX1i0gsDukrB/45HkVSjDVCdxEDRZ3gKBGfYSF5YLZoQMUh8rkBy
         GPtz3NJVyq1HpI4bPlG3nzCW4CcsdADA6+/EhY4SR1rYMJNXfXFK8OdSqiEl+MK6IRu1
         y1KBLKPicnEpJaVZA3dpU9b3rH3rQ8u/7tTjzvz8biA/kFCMBw4Uv2M7GohOMSPDzRch
         LzAaDqCdXJCl95q61S0VTpUOeI/8tCYYrxiQqU4losxa044/FCq+bgczN+rvHcliG3NZ
         mAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104070; x=1795708870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kguNqPOSlh7fe1C453DDiUzdHElyaO7Alv2xhzvgL+o=;
        b=EDrK8pQJH3fzJWwDVw8iAwRspns4FSduGDTTAVHkqIGQYHefu+gvizT+NkV48U9COK
         Upfs9rHPsrMLb5RM6RYlF2+UARzcIuoIGNhOvS95YuFwlB0Wr+M1SiG/Ewi0ymVVMwMN
         I5fXuA6MjmBDfro1ZHRL3J2CX1wQ4+U29HgB0TI8GpawNo37VnDsVrqUHipEECGW4MH7
         kJLYyWRUd+UbH/ksj3CanXzn89Jo2PeOf0xyPwEpBNjXCluXE2nufeGDhxscPD0p5LiL
         Mb7PUEjSVeQZKlnS5vl8b66iVyFwknTy3IqB2Tk0NPz1z00IU5dw4svGKRFHyyWfVw9E
         sM6Q==
X-Forwarded-Encrypted: i=1; AL+hErGw0r8raxJe4Hj9fZdjtOFxRk1ZiDPJ5FusjpK4UeyiVI7oMQUIaOQPS7GawxadDB8nSEEWpgP60vcJD3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pO0gI/JfmVlkdOU9GoVT+ZGkO5gET9jc930l3no++quOA0Nbz
	cHQZ4fjYbZkLKP3IPgzefIVct03sJ7AUt9q30+ZJbJtomW3XgNF6MAw2
X-Gm-Gg: AYBFou2TawB4ecYWyahMMSs4kckA/Bos63uVUOaKHZJ1d9ueTWUK7J2lWgHufFi+xqm
	St6H2yQU/fCRZZCi01eR1GbpnUeFKLmn5C4zOiaejak0VcKvrDiVnm4VD4Pai4PmyIWhquT2Hcx
	SRz9ojflQKKNaUwQpQhyRdKJQ1xcC33WA+cyqTWGNG1IHDYD104o6UmZL7to4aS+vS4ecqw+7x5
	8u9yHVeA6b1boxsPqqqmbRnXMLwgIcoM4Had7m5j5YkhPVhfktrOHYYPtw/lZN5DBRm1hVKr7Ea
	ThxlOxirPe8fTJh617T9UkXOUJhoEI+AkbtmIj/pNw6I7y3ENmqOPJnPg7bupD9YRV07yaGkGou
	ivIn/d3uhTgUB+3xKA+dL2ULSTWfD5y2/IZb+vDieH0c/e5XAtZKcwgaXtMAxfeXHGf2ehMakIu
	Z8e6M3uLop50c9iUkJHaoJ8EbiYUX5GL18U2pt/ACs4ZFXCR5kPsw2BEWBTViijKL90e2wlqSoF
	0mMVL4GCPIFuXZfRMxG8DbkNN79cdRDMQ7gtbVkdbso2xuVO4jn9sLKVkNmWj78J/vL+CYKJbPd
	pHrr5JLbmowCXqxelLGwJHFbee+uxwx3tsU1ngnkzDXFXw7Q+NPB+d7DgLNrHnf8BdllUAmN9Ol
	bSC/v68om1pOx9xIhjJQdW0G8qA+fm52QZbnW6N9Mv92ZXWkwskgzh/s=
X-Received: by 2002:a17:907:3e15:b0:c51:249f:7331 with SMTP id a640c23a62f3a-c513a3aacc8mr39598366b.1.1795104069371;
        Thu, 19 Nov 2026 08:01:09 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm323784f8f.44.2026.11.19.08.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:08 -0800 (PST)
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
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 2/2] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Thu, 19 Nov 2026 17:00:54 +0100
Message-ID: <f52268cdb748fc4fcca95f8de1384054da8d7964.1795103362.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795103362.git.stefano.r@variscite.com>
References: <cover.1795103362.git.stefano.r@variscite.com>
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

Add Cortex-M33 overlays and combined DTBs for DART-MX93 on Sonata and
VAR-SOM-MX93 on Symphony. Use the common remoteproc configuration and
identify the existing reserved memory with memory-region-names.

Include the common configuration only from the overlays, so remoteproc
and MU1 are enabled only in the M33 variants. Use the -m33 DTB when
remoteproc support is needed.

Mark the peripherals used by the M33 firmware as reserved. Disable Wi-Fi,
Bluetooth and the devices depending on GPIO4. On Sonata, also disable USB
OTG1 because its USB-C role controller is unavailable.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v3:
- Move the common configuration extraction to patch 1.
- Use "reserved" for peripherals assigned to the M33 firmware; keep
  "disabled" for dependent devices.

Changes in v2:
- Enable cm33 and MU1 only through the M33 overlay on DART-MX93.

This patch uses the following binding and driver commits, already in
linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx93-var-common-m33.dtsi   |  2 +
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   |  2 +-
 .../boot/dts/freescale/imx93-var-dart.dtsi    |  1 -
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 +++++++++++++++++
 6 files changed, 117 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd548284358..05a7556e9de9 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -956,8 +956,17 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb
+
+imx93-var-dart-sonata-m33-dtbs := imx93-var-dart-sonata.dtb imx93-var-dart-sonata-m33.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata-m33.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata-m33.dtbo
+
+imx93-var-som-symphony-m33-dtbs := imx93-var-som-symphony.dtb imx93-var-som-symphony-m33.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony-m33.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony-m33.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93w-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
index de0e56f322a2..51b4cfe143d4 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
@@ -14,6 +14,8 @@ &mu1 1 1
 		  &mu1 3 1>;
 	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
 			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+			      "vdev1vring0", "vdev1vring1", "rsc-table";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
new file mode 100644
index 000000000000..51ec0beea7c9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M33 support for Variscite DART-MX93 on Sonata-Board
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
+#include "imx93-var-common-m33.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M33 firmware. */
+&flexcan1 {
+	status = "reserved";
+};
+
+&gpio4 {
+	status = "reserved";
+};
+
+&lpspi5 {
+	status = "reserved";
+};
+
+/* Disable Bluetooth along with Wi-Fi and release the JTAG pins. */
+&lpuart5 {
+	status = "disabled";
+};
+
+&lpuart7 {
+	status = "reserved";
+};
+
+/* The USB-C role controller uses an interrupt on GPIO4. */
+&ptn5150 {
+	status = "disabled";
+};
+
+/* The USB-C role controller is unavailable. */
+&usbotg1 {
+	status = "disabled";
+};
+
+/* Wi-Fi reset is connected to GPIO4. */
+&usdhc3 {
+	status = "disabled";
+};
+
+&wifi_pwrseq {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
index 1ca3ec8330d0..e3afd0efe5c7 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -291,7 +291,7 @@ ft5x06_ts: touchscreen@38 {
 	};
 
 	/* USB Type-C Controller */
-	typec@3d {
+	ptn5150: typec@3d {
 		compatible = "nxp,ptn5150";
 		reg = <0x3d>;
 		interrupt-parent = <&gpio4>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
index 4ee4d74cadea..6c596d61bd21 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
@@ -12,7 +12,6 @@
 
 #include <dt-bindings/usb/pd.h>
 #include "imx93.dtsi"
-#include "imx93-var-common-m33.dtsi"
 
 / {
 	model = "Variscite DART-MX93 Module";
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso
new file mode 100644
index 000000000000..8df03ed3c004
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M33 support for Variscite VAR-SOM-MX93 on Symphony-Board
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
+#include "imx93-var-common-m33.dtsi"
+
+/* The resistive touchscreen uses GPIO4. */
+&ads7846 {
+	status = "disabled";
+};
+
+/* Reserve the peripherals used by the Cortex-M33 firmware. */
+&flexcan1 {
+	status = "reserved";
+};
+
+&gpio4 {
+	status = "reserved";
+};
+
+&lpspi6 {
+	status = "reserved";
+};
+
+/* Disable Bluetooth along with Wi-Fi and release the JTAG pins. */
+&lpuart5 {
+	status = "disabled";
+};
+
+&lpuart7 {
+	status = "reserved";
+};
+
+/* Wi-Fi reset is connected to GPIO4. */
+&usdhc3 {
+	status = "disabled";
+};
+
+&usdhc3_pwrseq {
+	status = "disabled";
+};
-- 
2.47.3

