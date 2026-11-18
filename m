Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021046;
	b=D8qaEMRYWyA6aKSLwdF3Cgukscizx7ZiQ45s9O99bBboSVIkwmuzWIgu9+MXYHOTwjLt
	 wh9lrDEzYLxaE9uJRp0mnBzoCNx9D9yW4uaXR3W8QDvqVRjvpWQ6yaZTuDpHt/ls4evZe
	 P8BGKLtw/8cTr72z3hyVwS/4O6hJ90Zj0mIQLwB5DIvxKncUHMBsfRVuVgZdv3ePL9GsP
	 rrBETMGwCVQCl2lpUhXi0DbdTGFvgOzwgzRJx/LM/H0+c5mYCltYur5Fy9RpKMp+cCqBb
	 mk2PvC2VQ3reKPJq78WelXQB20c1jqi410PbipcPJja2NL5vtXlgfajIcvU0HrNPpZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l3wnV7FKjR+kltfF/8FAvuWedzvvOsE0ympUYTB2Ew8=;
	b=xw1YP7JIfspTrQFmKf+1SSpNzZB1rRW47jvCN6kaenNT+cUDLXXx+vnfzFYdXT1JAxL1
	 Flwx/7e4L/t82fPrMnGvvGHjUZHPeR02s42OsriT9JEAbpweVxrWgwjLwyHc8ygbbxDCY
	 t/r+a7fx4tOydlLU7gtbYUZja16UYQ07Sglkrp0onYsJE/BNUoafa0PmAnmQgtDnfz+pF
	 Ccu46Rs7Uqu/1vzfO4DPp1dME/7pI5ZO1P+dmtGlgxWzAT2ayiezv5L8P0B/snLx+I7Z8
	 teRJYqai8MWNogJ4dye+rO8AZeY3eH7jtUOpSnWSNJ/1OX65p07vw7Zi9O31VFjqu3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJ41ztM1;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641D7606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 641D7606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJ41ztM1
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so13369785e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795021045; x=1795625845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l3wnV7FKjR+kltfF/8FAvuWedzvvOsE0ympUYTB2Ew8=;
        b=JJ41ztM1mY9VCV4msi7MOiAx6Gik/YGm+RNC61MfOINdX4h9UUYvQv7f4o62AjhG26
         eX5BgxVgHzaWlKRQ1HY7Ks+rzhIK0C5bmVsMAl1pNKCx0r1I2cgdkbda2EAK0UFhMP/8
         mmIeaz2ljftoRGdGqLMj89jWR0HYzL0bX5OBjo+F79h8rpZDPs7oi3S6Dnd1LS74DcOH
         QNovrIM5rkZiLf8FElLDea7tUukfBPbBNSWvlFym9+pv43tDodvndsgkeYY5Q2TferHG
         Dx6WDyRrClHutTDCyEdnqtHisxIhaQa/oPQyCL/Sb63kEXHRSXMVKw4LHkisahDB6TM/
         NtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021045; x=1795625845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3wnV7FKjR+kltfF/8FAvuWedzvvOsE0ympUYTB2Ew8=;
        b=qHIi9FZK0R0oozBERu1TrVFxyN8qTBBhK+/yKpa/IHkxCnpGK8ULamrKyC9CwAB6uO
         Th/jxIPustsvccPyMZZkHq5ExspbYpTOUbCkKTODb3FhpQhUNXroXiicJzt73GigzSIX
         +QK/3ZbK+YZj8/5wpbB/Myurhwp1/u7jZFZwpdWp92jxW7k4JWU0pIIn+goZaspWeFu1
         /2nVY1G13LbmXsVQB7umzm4ekbbl/qYO+GrbtP6mpclEY2qRPtNmLH9m6ZXPwkEr7g7k
         OOMbb4mJrBy4fYSHHKW2j0WjrUwtNe5VUg9nyI/6cMewnc/qAEBLc4bAU8CjVDm4LvhV
         CHHA==
X-Forwarded-Encrypted: i=1; AL+hErFnoHmyMhzF+2VOL642D0NXw55mEeU3CJEtQkuFJssbfKule36IzuL37BgTVx/1+AuBtY3kIEYi+jH5ZRg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AdN7aA/SgeA7uA/isne1L7KfcP+rPK0b7jvCSBojKV+hitvSD
	N/pCTyuTayjy3oRJaNmGJr6B+W8KBfideVX9Zc3ik8CYBTxQ/0feqgfERTJpvw==
X-Gm-Gg: AZFdTZdkYYk4sSAXOU6jt4Mgin78j/t0C0hLdmB/1vPjNBuaBWq+/zYBuD4bu3fLYV+
	IUpd5QzGQ2HSTd6/sez8Gh4jxvDrKU4x4Cu02p0BHfpzKJ6hstw/J/hIOM9WO11HQKEKGBHM83O
	Pcf12ZG0hxDUK15yfY/hzB0No9BZ2PtqC5cgemOwxOuSK9HEfLpjmyyEQaK3gXl+hhWZwJ+Ci42
	Y4M4+nz9qSPpdimYTeolCJOk+TiOfSttQIkh5JD8faDjUq+zcP9avdWoR62WgkrKiAm1wTzEt+t
	IIvHVrKC4XhIakndrxzF2i0ytb/HghGMR2SoRy7PjddnPvWE4nWedm84AzjUFc+SHFHGZuiIl2O
	CwPdRI0IoMuJXyP+XiXZkKArSyN+TKvnt/vGNuW88UnJILXX3J+UaV52ETwutf1qT+dNK1Si7rO
	TiVipFofw/OXQbMNark+HAXMbGu23necX8FGq2BFh+dtMwPd50nVgdB5dIUQ/thufhqzOvkw351
	R8PNmdDQfHDN1FdWBJPtcZdpptL25WYEnIkisQgvcURegLv97Pr9vOooDDwbhDRq1AumKr6Fa8C
	TW03HFcra9+tQamo/r6ZsDYLHRhMZKFZxNf+IdkHfEHPO4nXPukGLg1ui4JgrYcQ1serrA5mwb/
	280sc5b+RNYw/k3UFqWKUxr5a7JVv9yoBAyR99kTChV00hcNnFgMAoTySmEUD6+GGRChNTkEf7i
	6zCg==
X-Received: by 2002:a05:6000:4b17:b0:4a7:f82a:7f6d with SMTP id ffacd0b85a97d-4a7f82a8286mr3406352f8f.6.1795021044441;
        Wed, 18 Nov 2026 08:57:24 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2f682sm5603591f8f.6.2026.11.18.08.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:57:23 -0800 (PST)
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
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Wed, 18 Nov 2026 17:57:19 +0100
Message-ID: <20261118165719.46297-1-stefano.r@variscite.com>
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

Add Cortex-M33 overlays and combined DTBs for DART-MX93 on Sonata and
VAR-SOM-MX93 on Symphony.

Share the remoteproc and mailbox configuration through a common include.
Reuse the reserved memory from each carrier DTS, preserving the different
resource table addresses.

Reserve the peripherals used by the M33 firmware and disable Wi-Fi,
Bluetooth and the devices depending on GPIO4. On Sonata, also disable USB
OTG1 because its USB-C role controller is unavailable.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
This patch uses the memory-region-names binding and driver support from
the following commits, both already in linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

For dtbs_check on older trees, commit cebd1c0961d8 ("dt-bindings: gpio:
vf610: fix clock requirements per SoC"), also in linux-next, fixes the
pre-existing GPIO clock validation errors.

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx93-var-common-m33.dtsi   | 24 ++++++++
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   |  2 +-
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 +++++++++++++++++
 5 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
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
new file mode 100644
index 000000000000..51b4cfe143d4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M33 configuration for Variscite i.MX93 modules
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/* Use the reserved memory and resource table address from the carrier DTS. */
+&cm33 {
+	mbox-names = "tx", "rx", "rxdb";
+	mboxes = <&mu1 0 1
+		  &mu1 1 1
+		  &mu1 3 1>;
+	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+			      "vdev1vring0", "vdev1vring1", "rsc-table";
+	status = "okay";
+};
+
+&mu1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
new file mode 100644
index 000000000000..d97da9916ef4
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
+	status = "disabled";
+};
+
+&gpio4 {
+	status = "disabled";
+};
+
+&lpspi5 {
+	status = "disabled";
+};
+
+/* Disable Bluetooth along with Wi-Fi and release the JTAG pins. */
+&lpuart5 {
+	status = "disabled";
+};
+
+&lpuart7 {
+	status = "disabled";
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
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso
new file mode 100644
index 000000000000..96860a2dbf7c
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
+	status = "disabled";
+};
+
+&gpio4 {
+	status = "disabled";
+};
+
+&lpspi6 {
+	status = "disabled";
+};
+
+/* Disable Bluetooth along with Wi-Fi and release the JTAG pins. */
+&lpuart5 {
+	status = "disabled";
+};
+
+&lpuart7 {
+	status = "disabled";
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

