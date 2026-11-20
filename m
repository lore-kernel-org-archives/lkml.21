Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199590;
	b=sW51gTUx05R7cZyP4YZJihtVlqVz4H7Ax8JRhqikq5MdErnswoKAsUJmJkkE68HzqWEa
	 W06yFbDrVJTbUYlsRRNHCsZg1+oj4KYaPAOzyuWoXRUDT3aeWh9LGDCh5mGiYiLQwF3Ml
	 /xWFajnB0xIVu0bt/h8wMuoOUzIAxxe6zyFTrcC195kJyPzQDYZwNMDMgxzDIRlpzrlDb
	 oSWcQyKig1ObyfRiJzlgosRw/vLVl6nMUl3nCE1dpk4OPl8w58w605mC2LAWLxk+bu9h+
	 +W5PspUcVzSce3dD+hGqxH3mlKiepm758qV85Bwn3dMk8xrfIQ6lmUqlhQrkzvkm0dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=VelTmERfpnFtTZC+wB5krB/CsanpetBmD1N19wuVuo4=;
	b=pJgG14104LRi5zpWdgivXdQWPYo2ndQT/IF2hZG/mulvRgUJyrsMFpOFRjxDNSjZYInj
	 B5UrpZQmq15g9eYC2aeAULyHW9igf2zJYEPlxc+phWwDb5sMr00wpnNmDabSLY5Y+fwnm
	 gMgGLjf8BwqrAKLz74Il6njbmw19K/YLqoh+aG54USwweHj3CDTNwip83wrFDUWjYPgUv
	 O3Kok7GzpEX+h4LtlfrOqXjuZwmYv8TAUrHZ120THHWhBi1RKyZAHDIO0jdkoaH7hmK+g
	 L4OxX2MjPOGUoRI6c7oq73Qmn71ezRJR2GpywaOc2dnWWl3GzbaXEqeQUadY90PWeBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e/vUfSGK";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386FC60A261B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 386FC60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e/vUfSGK
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so11974845e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199588; x=1795804388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VelTmERfpnFtTZC+wB5krB/CsanpetBmD1N19wuVuo4=;
        b=e/vUfSGK2nLDCmR+2h0b4xZOOYcXLebcbdhm8F/MNUP5srJNffvjBpTTM5JCNO14gH
         s/dslp+bm8bcT+NhmUT2zY5aPqGLSgzzqiK7N6bWd/LHgv/0PmdbYsDCK39FSZbt9OMn
         mEFCtFjRFr2yVZ9k2Q7x/CYY6toJkcKXiGUhwOz4QttmWVVwe4jbf032H89MdwvR/vWS
         vXGbiZfn3A8RemrRjo2e7yZ/Cy8WbMzTCKng6Crc2+TmiPey2y51znW1lRgE1dftsRS2
         qii7mTE7Ej6kx0i4NXnf+QOUmofP1RIL2tPwgR5ffJk3EnPBWYIUxSi5pabIE/ha4dLT
         buUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199588; x=1795804388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VelTmERfpnFtTZC+wB5krB/CsanpetBmD1N19wuVuo4=;
        b=mVJCVDnWjLCW22VSstEDZz9VAD0GVGHKUUbED+ozSJk/2dZLTbOAvQkkH5jNg8h5Ff
         7QiPu9mkKUygxyWiIp5uqBigD8sV+BlPd1tfR0PjGYdwlOpDleyeDQtAbFgvZBi6lfSM
         pCEzUJwD/ZxfaBIz13BeXajPYpykUdUtpxSdAq9fazMYwefuSCc6+zO6UKn1pP2zJRn3
         S/7ekmNR3jKkxR9STMCVHwdDAz2Pp9jxpm4JP94a/rgviq/0fbyZhcBId+QuR6Z6bGDP
         99zfP8bn/lO7IUJfM+o/q/1SNTRWy0aB5coHnRLjoyMSdn66Ha2QSM0KMiYbYxBJjeHj
         WGJw==
X-Forwarded-Encrypted: i=1; AL+hErFKXyZBTtDU+siN2K5E63MaOoPvq/kFoJ/gTzbH8jSvm6JSIU3c3PvMLR44hDojk9RFyAmdbq+DSx2WsR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/87xWtGPZhoTlmoME92bhUB8HvexLpLo2RpUYLsRDQJo8pmhVN
	ejeLfX8eNMXtVdA2jpSS0I8itg0uIL2jl6UZLEaPI5osaItTva40PllE2siDIg==
X-Gm-Gg: AYBFou1CfUu5YL3mRauOy3jbZ7+PuxOTZvm8XOY8Dbviz/dnVpFaVEObSKIgmZ4jEc7
	jFsmlyxdzMGyQQTyHdPRkjZ3QxEJ20FeuQH4oayCJCKQKP43Ipd1Og/b/XSwMMx8poJn9YhZf7m
	KPP2IyUAM/Uy1ve4e+qmPGZtxDnzgN8VppZSHXgK5ePtPDGVPYLfwti4/dY+PIbfzh1AjlpO4PO
	jP5sp1LQavxxKrhjGXdpyPK1Hpwdiq7oxWo6HdywZ2kgj165z2bCK8J1CJlPI7svVn/BkzFyJLQ
	7rjctYXzEl1KAt6QWLIdVKK9uAzk3BMd2OgFzxalu7Dzk96jNa8Q1jzTYL717f2ldclpN6BjvAK
	ePXe0cubCzNGlhOUpiCqxTwyjP+vXo587pTYWhccLFs4WhgajXH0h7cI/THxVK3sioxDm1WyhRo
	6DwnPOqZCefYpPC7TRVxBvZJ6+32rcoV/YWEZK7QJ7oUjrLq03n8hqRtBJSK9fDhPkrOvhLP+mz
	3/eOxGpbOr2k/F0IjgJklz0o3DSTiR9v7dF0iJFUyXC8lTZ/bKt7dni2p4lqeRmcVvyufA92+Ah
	K9vUFLdbKRcH6/OTQlHOldc2Q71iEHiSIFO9B7SRSY4r7Xfw4pMH9q6A+8d9aA9+UdOWO9WvTeX
	nab41uVx5zrZdBocXyWlTKFXV45xvhhWx8rnm6UbW0ObxM8fCTFDoi36fM2VfaZXF0ZYb
X-Received: by 2002:a05:600c:a087:b0:4bb:5c92:ce22 with SMTP id 5b1f17b1804b1-4bb887fe887mr89696315e9.8.1795199587508;
        Fri, 20 Nov 2026 10:33:07 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm7467718f8f.53.2026.11.20.10.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:33:07 -0800 (PST)
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
Subject: [PATCH v4 2/3] arm64: dts: freescale: imx93-var: Extract common Cortex-M33 configuration
Date: Fri, 20 Nov 2026 19:32:29 +0100
Message-ID: <6ab5925c4f1346cd801c58fd88ec624419ad0ce8.1795197853.git.stefano.r@variscite.com>
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

Move the Cortex-M33 reserved memory and remoteproc configuration into a
common include shared by DART-MX93 and VAR-SOM-MX93.

Include the common file from both module DTSI files.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v4:
- Move the resource table, RPMsg vrings and shared buffer from both
  carrier DTS files into the common include.
- Use generic memory@ node names and move memory-region-names from the
  overlay patch into this patch.
- Include the common configuration from both module DTSI files.

Changes in v3:
- Split the common configuration extraction into a separate patch,
  preserving the existing DART-MX93 configuration.

This patch uses the following binding and driver commits, already in
linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

 .../dts/freescale/imx93-var-common-m33.dtsi   | 65 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   | 31 ---------
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 15 +----
 .../dts/freescale/imx93-var-som-symphony.dts  | 31 ---------
 .../boot/dts/freescale/imx93-var-som.dtsi     |  1 +
 5 files changed, 67 insertions(+), 76 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
new file mode 100644
index 000000000000..72b47ba99cb9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M33 configuration for Variscite i.MX93 modules
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
+		rsc_table: memory@2021e000 {
+			reg = <0 0x2021e000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0vring0: memory@87ee0000 {
+			reg = <0 0x87ee0000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@87ee8000 {
+			reg = <0 0x87ee8000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: memory@87ef0000 {
+			reg = <0 0x87ef0000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: memory@87ef8000 {
+			reg = <0 0x87ef8000 0 0x8000>;
+			no-map;
+		};
+
+		vdevbuffer: memory@87f00000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x87f00000 0 0x100000>;
+			no-map;
+		};
+	};
+};
+
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
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
index 1ca3ec8330d0..efd51f6364f3 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -137,37 +137,6 @@ ethosu_mem: ethosu-region@88000000 {
 			reg = <0x0 0x88000000 0x0 0x8000000>;
 		};
 
-		vdev0vring0: vdev0vring0@87ee0000 {
-			reg = <0 0x87ee0000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: vdev0vring1@87ee8000 {
-			reg = <0 0x87ee8000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring0: vdev1vring0@87ef0000 {
-			reg = <0 0x87ef0000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring1: vdev1vring1@87ef8000 {
-			reg = <0 0x87ef8000 0 0x8000>;
-			no-map;
-		};
-
-		rsc_table: rsc-table@2021e000 {
-			reg = <0 0x2021e000 0 0x1000>;
-			no-map;
-		};
-
-		vdevbuffer: vdevbuffer@87f00000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x87f00000 0 0x100000>;
-			no-map;
-		};
-
 		ele_reserved: ele-reserved@87de0000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x87de0000 0 0x100000>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
index 69495bb7fc9f..4ee4d74cadea 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
@@ -12,6 +12,7 @@
 
 #include <dt-bindings/usb/pd.h>
 #include "imx93.dtsi"
+#include "imx93-var-common-m33.dtsi"
 
 / {
 	model = "Variscite DART-MX93 Module";
@@ -54,16 +55,6 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
-&cm33 {
-	mbox-names = "tx", "rx", "rxdb";
-	mboxes = <&mu1 0 1>,
-		 <&mu1 1 1>,
-		 <&mu1 3 1>;
-	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
-			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
-	status = "okay";
-};
-
 &eqos {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_eqos>;
@@ -221,10 +212,6 @@ bluetooth {
 	};
 };
 
-&mu1 {
-	status = "okay";
-};
-
 &mu2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 78b19d8918b7..c3e880025a06 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -87,37 +87,6 @@ ethosu_mem: ethosu-region@88000000 {
 			reg = <0x0 0x88000000 0x0 0x8000000>;
 		};
 
-		vdev0vring0: vdev0vring0@87ee0000 {
-			reg = <0 0x87ee0000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: vdev0vring1@87ee8000 {
-			reg = <0 0x87ee8000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring0: vdev1vring0@87ef0000 {
-			reg = <0 0x87ef0000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring1: vdev1vring1@87ef8000 {
-			reg = <0 0x87ef8000 0 0x8000>;
-			no-map;
-		};
-
-		rsc_table: rsc-table@2021e000 {
-			reg = <0 0x2021e000 0 0x1000>;
-			no-map;
-		};
-
-		vdevbuffer: vdevbuffer@87f00000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x87f00000 0 0x100000>;
-			no-map;
-		};
-
 		ele_reserved: ele-reserved@87de0000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x87de0000 0 0x100000>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index b0ffcb534cb6..46b739a147e3 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "imx93.dtsi"
+#include "imx93-var-common-m33.dtsi"
 
 /{
 	model = "Variscite VAR-SOM-MX93 module";
-- 
2.47.3

