Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795069388;
	b=e29WYbTal12Dv2B8mq+GSyJqvgGTJ3z/8Ya16I8SIw9xTCg3ogolgwH39yivgcCK9Rrt
	 k31eMoaQYFAcUCPH6vxOuS/Y32PUWcW6VkcYNmBt40fcLQ0MK641IBs4ZUAMY4BiGfX1q
	 k5BSyaMKzgtl62wbA83+O5UwjwXuDarM9sMkxIygsL49aCmcYgjum94mq9+cH8OYld5Zn
	 JUvwTNwZAWzoyKfmVrwCU9jTNOytO7iqWC+1udLoCUA+JoUnNqw6pvb5rvin2UNhcWWoV
	 xp3FDQq0PQg2UpNABedSj3Yi09pI7eeKpfaMDrEq+Jn9Abeou7qZuiHjivg8Rl7nwWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795069388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vIyXTGC5+88ay5cdcjaG1P2/fm08Yk80tNUxmrQFq58=;
	b=lykdwRp+wIdqjEBsOhqvptBU+PsW9VelyT7Ytj5c2jAlgQlbgnughJBpeqaR03n42uTm
	 qR5TI+frhNOBvdyZ47vboA3LaLnDnXi8yTqOrByBSrmDL6RPyjEmYDnPXUINKSs3It8k0
	 pToHu7zxEbwLlNdruTsas/7P9NZdAeGuonDD1w2cpDPXZVnwqe45QSF4Y38fVBcUuPzDP
	 auEbLVvOUCNvpGa+LchB1Ni8yYWXD96Srm0nu/UETgoeKCihV4ma8kIVqG8S8pQ9+I/YU
	 qXMtPsClntlFNTwcNsRy3YCsMNvsrFeHzSlCkf8UJoFCiQ1nV69NrmzF03x5nY18JMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UyVLaBqk;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836A8606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 836A8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UyVLaBqk
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2eb18f4da15so8208165ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795069387; x=1795674187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIyXTGC5+88ay5cdcjaG1P2/fm08Yk80tNUxmrQFq58=;
        b=UyVLaBqkrV0X2/16uNN8x6WOswDS5t2rgnTki+/9On3Qck3Rs15i9NTQL3f3QcpaCr
         pGAOqpC8cQlxclpKz9r8bgvCyDz9j3skaovLtSjfnhtj3cIm9ocKWCtHSqW7Hi9uRcPm
         FAbWQqs6ey1BcKREJZd386R1YNgEOxpuktbkKBWsAU5RnGMuiPUQKf1w7jQ3jz7BWUE8
         FpjiyNIHb/vch4tQccmtP05urAj+9xAFCR63zXKicpLMR+aGCRja53SXZsl2VVYghtBM
         quPM/Uior9TZdk4asHeXcsuXebgUEoKEFMsWq+LBs61AA2tz+bY9BfZWUL5894T+yQhe
         eLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795069387; x=1795674187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIyXTGC5+88ay5cdcjaG1P2/fm08Yk80tNUxmrQFq58=;
        b=qxdIpsAgBTiO1HaSdF8uM6LY5K/DvvyG42ZPowyaWfRnMP5UDQNtH2BRBD9DtGv58L
         +tOvP29q6/BpmAM8tZMzBY6ezwVFfVVSHjdarVZR+npQMEha4HEZw34EYnhvo/s66o0I
         9Rs/lOT2TezOqx/iiHkuyPBuQLo6p4Veqx5hqtAyG8E4y8G+BOkrulCjd0m1/2eoInHB
         h/mIcmktTBmXtsVmhmwkcganHuBVZTUZ7hgyQnZgDAPvkQvx3KD2117xWuA8YGIRlvjJ
         kvj0Uii++e1ZV628RZHw+C2Rorx9rB2/IqofDkPlB2zMybP7tcsGxkMmh+NTNG1L6MFz
         WOlA==
X-Forwarded-Encrypted: i=1; AL+hErHohwZqMnVwXG5FPj6Fsy29qXxO5iMDykWH4leW0xtQS/qrzkuT8G2+B7+ViGeL72owSnLeK8BF/zNL3Fc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bH3xiyq+NEHo+KSL1HSkIAvj4cHlCl691psvcanZ7xmZWBI5V
	j3+gdSdjXjrhJ3XHAbUkozR1eEn1qowDcLx0B1J2kZO7YcO2PraY5vhlZ3HVMDsFkw==
X-Gm-Gg: AZFdTZep9l3kJIyYBBZxNldMs445l9ux4+69K6XY+EWBqlDXqu5sm5dQIRe0Cn4YS4e
	La2PCUu1BM0j7c93GoBCwStzhj53MlYGBkCHbR70A7Z84Xbt4+E1Tcblhhkcn/ATKoN6Nig33yo
	/qsbmKzG+a5k/t622HxhdH34Zq0G0lrnKJ3Du4Z7moSp3wKTolzSuKlgIJe6uK9qPxxGRpTzyev
	miFJ47eU2uiN+DesDriFJV/aQzGNbApka8tLPxuxh8/u7oGHS0QbgfX3geJZ2hxsCCUaxW3O9un
	E9pDOr0lZWdkbF0o+XowOX7CQyq0Z9h9RcukCPGptJ3F7//RuvVrE+EWCdtIm8p2Sx7tHSOhY7N
	C5vVszIe+2DOkWPpsKksTJ8b4bJRp76XDsZg+MES5EemKQj/IB1cKqs+R/QRqRdIO6D5whGoW9i
	9Pudnyl17tAsCEIvTvkii4vKjTadTcs4hCfZWOncdSfGsf3D6XmpITzaOZuWt8qSYGFnaYAL+xI
	R0nzUvpRpDTxY1EVhUYzicTVDMAsYAvy1Y8MK/nkXBV59GimWpSZbTnMjMbRdxPLuK9YcB6gvJ3
	EyU9NXF3I3H3RxkLiRpW00Ap38LZxfl2gRaVa5apgw720Hgw5EMZ6tdO64R7EN5XER1IhXRcHi2
	R4VrUWZLp8fgpAFTXxFWWv3B1ndRI6QflKi7wJA==
X-Received: by 2002:a17:902:d48e:b0:2f0:20cc:32fd with SMTP id d9443c01a7336-2f020cc33e9mr13953395ad.51.1795069386749;
        Wed, 18 Nov 2026 22:23:06 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff627f421sm24292605ad.57.2026.11.18.22.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 22:23:06 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mp-frdm: Add overlay for EQOS PTP event pins
Date: Thu, 19 Nov 2026 13:23:01 +0700
Message-ID: <20261119062301.1778558-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
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

On the FRDM-IMX8MPLUS, pins 13 and 28 of the J18 expansion header are
wired to the SoC pads GPIO1_IO08 and GPIO1_IO09. Very few boards
bring PTP event signals out to a header, so this is a valuable feature
for PTP work. Add an overlay that connects the two pads to PTP event
channel 0 of the EQOS Ethernet controller:

  J18 pin 13 (GPIO1_IO08): ENET_QOS_1588_EVENT0_AUX_IN, external
                           timestamp input
  J18 pin 28 (GPIO1_IO09): ENET_QOS_1588_EVENT0_OUT, periodic output

The input must be EVENT0_AUX_IN, not EVENT0_IN: the stmmac driver
timestamps external events with the auxiliary snapshot; with EVENT0_IN
no timestamps are captured.

Tested with pin 28 wired to pin 13: a 1 Hz periodic output on channel
0 was timestamped on external timestamp channel 0.

Signed-off-by: James Clark <jjc@jclark.com>
---
I used an LLM coding assistant to help prepare this patch.

 arch/arm64/boot/dts/freescale/Makefile        |  5 ++++
 .../dts/freescale/imx8mp-frdm-eqos-ptp.dtso   | 26 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-frdm-eqos-ptp.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd548284358..5cdad9dbda8c 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -633,6 +633,11 @@ imx8mp-evk-flexcan2-dtbs += imx8mp-evk.dtb imx8mp-evk-flexcan2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-flexcan2.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm.dtb
+
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm-eqos-ptp.dtbo
+imx8mp-frdm-eqos-ptp-dtbs += imx8mp-frdm.dtb imx8mp-frdm-eqos-ptp.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm-eqos-ptp.dtb
+
 DTC_FLAGS_imx8mp-hummingboard-iiot := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm-eqos-ptp.dtso b/arch/arm64/boot/dts/freescale/imx8mp-frdm-eqos-ptp.dtso
new file mode 100644
index 000000000000..15d0efc30243
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm-eqos-ptp.dtso
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Overlay for the NXP FRDM-IMX8MPLUS board: connect PTP event channel 0
+ * of the EQOS Ethernet controller to the J18 expansion header.
+ *
+ *   J18 pin 13 (GPIO1_IO08): external timestamp input (EXTTS 0)
+ *   J18 pin 28 (GPIO1_IO09): periodic output (PEROUT 0)
+ */
+
+#include "imx8mp-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+&eqos {
+	pinctrl-0 = <&pinctrl_eqos>, <&pinctrl_eqos_1588_event>;
+};
+
+&iomuxc {
+	pinctrl_eqos_1588_event: eqos1588eventgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO08__ENET_QOS_1588_EVENT0_AUX_IN	(MX8MP_PULL_ENABLE | MX8MP_HYS_SCHMITT)
+			MX8MP_IOMUXC_GPIO1_IO09__ENET_QOS_1588_EVENT0_OUT	(MX8MP_DSE_X6 | MX8MP_FSEL_FAST)
+		>;
+	};
+};
-- 
2.56.0

