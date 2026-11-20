Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199592;
	b=0mevWRwSoDxJTLT5AvArQOpNazBowKdMqvIuPDZC80znppxgSQK13Q0b3HXn3QGPXZKt
	 fUUWl77y8v/Egp+gS1GP+zRxCQbbJp5AVCyA+9AfHc/K7pSG+P4bJ0j3sEUbh9pCea5Sm
	 YRK06m4JpEcOlgAVJSax7hg65Xfd+hTRRGEfCE5Z4uBqTfZC1u9mZA5IGx4FXzaZ4UD87
	 QmzqjFF8uPVT/5J5pveYZKyxn8W9xc6qTgFKDiwj+CT05BcanQQ5OFdJFNWvaYLsyo3xq
	 L9+rutW/RroB5PEQk8OFPe28EVFYvkrjm2ijnr9ccJy7HCShkhAo5PawDn8fGiM82Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gQSQjSRJnKJyi/DyI9dUqIc7eXSvEGbjLptiauw7SSs=;
	b=HnY23Qc2L/OHuOBRpJeFvNoNzeG+lk4s/CLJnkGURNJQnwmtijLiuE5cE98EOs9ibvkN
	 sixmUavCi979/SmGb9Oa4WiiQjxxxIGIFASf7RyngT3IJPYwr1cklnWFykAA3VTJSdPLg
	 bfaz6EhJjEij7lN9csqo3iVo4zekmqf/3J/gffvJ3+fin2bYOnsHokytyDB/mJS8hACX7
	 669eY/t1PPqkUzi23yRdE0UHFEfOHpVwwmkUeMlUXahueIMltTF/GtZwB+U1iieNZ43go
	 qIS/O7excXGK4+vBeeA+3Jd/dQkI/umm/9ZWQ5qN4eCs71OnLLBWc43S+bzxzxn6lbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pTEUd5C/";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FC3606A338
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2FC3606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pTEUd5C/
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so11030255e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199590; x=1795804390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQSQjSRJnKJyi/DyI9dUqIc7eXSvEGbjLptiauw7SSs=;
        b=pTEUd5C/hIe7qQkEy2T1eATjszBjP4VbVP2WPRY7j2zaLAbW6vFyOiqGI0iOo12aFA
         8RH8449uqSe18ZaujUS12kVx5Vt6jp6UI45LqH9OnNRI15w1Dti8qwr03gTvlLLNeZRi
         y8yqBpBBdJQc0eDokPgMkzhtW8MZ6AvnTFuDgMRD41ZMP2E1dZYXtASMsSe0OfXtK82J
         yfe9meHSvMFyEJy7xzgWHPtmyt/ynuXwUPh1jekwgcmAHj1voZY4ukPCPtjwrC/chUpY
         sdfWEsihKmH68Z1I1+S3Noa4PIJNvxaJVQZxxjtRHKo4QSiZPciXyUiUYJLD5vF6eybm
         J0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199590; x=1795804390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gQSQjSRJnKJyi/DyI9dUqIc7eXSvEGbjLptiauw7SSs=;
        b=mm4COycGnA2jN8B0rTmoxfp+3UwjGO8HCvpCbHL1FemgJbMfiUtbEmsLcSWxrueQfr
         1lwiWKGsQyk+AcD873wRMlANXLAfAh9Gdx+lwwvy3tyIjKOYHoRmT7/KNLUCBV1a3lNx
         wjK6d+Q85cYssRB4mizy6rpPwHkqj7TTO+Ivyo60miLwLbBjb0TDkCpQCmewWCXlCvXK
         mBo07RMiCk63uyS/KkGr8Lf1gfpfFJEYvfLGOONy6SEWzxm+ARiJfL5z9+yGNvH83J0i
         mKzffDFtwt92bJ9idN9UvvuAS0kbiI4aasduzta/uhe6rkm1wsdWB65geXoNLxq9O1dm
         MbOA==
X-Forwarded-Encrypted: i=1; AL+hErF7Irs3Y4tMNCU5oUxi5nKh3WDSJKQ2xqGScz7+BTRuaEBzo+19SndTKD1my/UbXuF/X2tm0wFDcM6DR/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z86iD96dbTlHtcbsC7LMDpxWLgCVSHV7BQzqBFcb/z/AkaWK21C
	k8yfW2Ma6jU6CE1v/JTMJVgbRUZXSYXtXu8GvuYqTOp+AtNPXNo7efUU
X-Gm-Gg: AYBFou02wtyFvh8aHd1URqImfsJD2rBNxGFUIYAwAs5iRYwDzh6t3a5hf4fWPOSLMlM
	0qCSBUOHxMwEowP+//Z2jIKDC7za0WD7FRCDcpXdUTd5vzgqTRs8ZVmLPgfjoxdLhBXcsmZa3YO
	sjbDGl/07l8rI9P4f5AOeyxc/6iXgL2+t9KnM9qqnSbCMxBbANwaC1Kyzi3FVoCprJvbI1EJiyh
	x1vX6CQnWiGiHngkzvqpNVseMSC8z8sLNtCjWgUnPK+3yq+BUb7Gsk9Eg4J6aqfTLk6+vNLdVak
	4q+v1weU22U4lPMC/gMuY5Vf29yCVAcTeHCoVtnhq6FaEbhztYMelnTaENqBgYMSQlr2kn8e2eF
	UlStmldVa+PSEVVM5np1Jq8AMgcM43x5WhvN/Te+VXhvknic06EVw2k2WhpF+IJg5AmlOV60f2a
	l2WBw/GZbFJVP7KgSG8gejCgLidZawM4w5ZsKxw7Dri1ZTjlHZsS5uyK3CEBJc1FcAXhHQ1s3QM
	gNTAOk6GxYaK95FhJrxrbY5tk3kLShKFQbkclJ2acPNCDg4XlSsmHqLALYF7TZVtFHAxSqJYTBv
	N87Hf28Le5OKTrPpWapGF5urbC0yGCH4MM5u5IrSDdswwSEkiDcID6YDKCvS085sNBGCLVoP8KI
	2IRCSBWWGWUcR/lopgL7es+8CoVDWJ9OlGrohl5SM6ycsqLw=
X-Received: by 2002:a05:600d:18:b0:4bb:9001:1aa with SMTP id 5b1f17b1804b1-4bb900102b8mr10489545e9.10.1795199589928;
        Fri, 20 Nov 2026 10:33:09 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm7467718f8f.53.2026.11.20.10.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:33:08 -0800 (PST)
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
	Shawn Guo <shawnguo@kernel.org>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v4 3/3] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Fri, 20 Nov 2026 19:32:30 +0100
Message-ID: <947a7bcf39d89b4a162f296278ccaa3db6512983.1795197853.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795197853.git.stefano.r@variscite.com>
References: <cover.1795197853.git.stefano.r@variscite.com>
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
VAR-SOM-MX93 on Symphony.

Include the common configuration only from the overlays, so the M33
memory regions are reserved and remoteproc and MU1 are enabled only in
the M33 variants. Use the -m33 DTB when remoteproc support is needed.

Mark the peripherals used by the M33 firmware as reserved. Disable Wi-Fi,
Bluetooth and the devices depending on GPIO4. On Sonata, also disable USB
OTG1 because its USB-C role controller is unavailable.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v4:
- Move memory-region-names to the common configuration extraction patch.
- Remove the common include from both module DTSI files, so the M33
  memory regions are now reserved only in the M33 variants.

Changes in v3:
- Move the common configuration extraction to patch 1.
- Use "reserved" for peripherals assigned to the M33 firmware; keep
  "disabled" for dependent devices.

Changes in v2:
- Enable cm33 and MU1 only through the M33 overlay on DART-MX93.

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   |  2 +-
 .../boot/dts/freescale/imx93-var-dart.dtsi    |  1 -
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 +++++++++++++++++
 .../boot/dts/freescale/imx93-var-som.dtsi     |  1 -
 6 files changed, 115 insertions(+), 3 deletions(-)
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
index efd51f6364f3..57007f716f22 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -260,7 +260,7 @@ ft5x06_ts: touchscreen@38 {
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
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 46b739a147e3..b0ffcb534cb6 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -7,7 +7,6 @@
 /dts-v1/;
 
 #include "imx93.dtsi"
-#include "imx93-var-common-m33.dtsi"
 
 /{
 	model = "Variscite VAR-SOM-MX93 module";
-- 
2.47.3

