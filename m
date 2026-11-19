Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104070;
	b=GYyLtJRTbz+YmBFjBPVqJZ4GjELTXzpLa8eVhZxCbnxXMsV7FwFdG+hNshXB7S7Nw7pL
	 N2zOI9ZVbjxuIU6YjNv4AYyctka4lHPnJcdBUtukg2nYa+bnGxTt/H1BFwNmx3BKWWiwL
	 JOtVg1oYDkdFjB/g2VI4XO5FBsq0dXliy3It8Mb+gDRvUODwWP2Hjptb9k79W2Au5L5HA
	 630KUKLCxPSH8G1sT+vFO7A0t0ythp37lBGKNyCvqK+ePHQqqnKV//oOZEIz3L+GrDytF
	 4BMyrEXN5+0ETQX323BxCUPNwXxkBQZFGT39nx7UzdeW+rk9Z/xapfk5vRtFyxSbRHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=rxJXN0Nt7oYy+tJJbFLjVXtftovgM21mUjgHjNU5vMA=;
	b=UXS5DpgfvKOTTre2WIb01HCUMJU/7dUQjAe1i9G2FORB5DBfhOckDuAsgNSaQN4Qwp3b
	 BbE13xOhMM2u/Gmj3WVLPIGz/5RvoNR+guNxbHC+Dc+ifCGNSLKPuWKSecbrQ7rCfSrOx
	 P2SNXI2UoJMnzvkN6KC+F2dKmvurxYGG+sD+lGNByS3gtspJFN1hkNkA2T5YBu1p4AAdm
	 JS8zpwi94uGHnQUmFXcNvo+NoCWkR2MPWg6NZskVHJzvOfSGD2WE0YA0qNFWBzPqb0Oct
	 zrPjccmhuJF+0vMnFWl0Rz2aR6JCi3QKhZywU4C5cT/u0AzDQIlq/RhX93nSzYOia3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ItrzpJFM;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E49A60A2610
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E49A60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ItrzpJFM
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dee593f18so2419858f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104068; x=1795708868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxJXN0Nt7oYy+tJJbFLjVXtftovgM21mUjgHjNU5vMA=;
        b=ItrzpJFMER7TegNHmJwzpdFBFDSX066KTQfL0A0PwVi9Q0A5xOJndjwsqfLqwHV9MY
         Hrgl6sYP7tzmgX2FUkaw7oxQub18bMq+07YI18C7tiicy8sWSzLaE4CXSNod1ck1vdwx
         b5AJAchkIZw6Kka7su0YWddezeh7lbUCq8ra5qwXnM3hbIGtZQ/yeSw6x18s+CVLCa/s
         +YozvfS5aeqDfoUBNEqZmGRp78e3+Kyn/RcvnXBK/lXj6Tm/71XRSpnK5OwXZb3HAMG4
         t/P3V4VB8A2oIUHd2o8kEbsiHDyNQdDXzLYtTbm23jvQTYHPHuMxCt89xUfJMEc2KWCD
         kyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104068; x=1795708868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxJXN0Nt7oYy+tJJbFLjVXtftovgM21mUjgHjNU5vMA=;
        b=uw3wZ0bHcq+J7gbsVClmydnrOF5zEfwNT6zG/0B63JGxWyYXso2N7gl9K0fNRLjLIO
         YIj1jtPj09ZPxKFPNb5F6x5xiavFQxYMOmZicFRSKP40Q06mgNgvStUXHRW6BADJZFs6
         zHjHGF7hUvweoXAm9/7ZKvyMAR3iWlip929TllaU27L1LgOvAew/LbvRl8nSjSMCwO7s
         7FO5EQydC2aThd+gjAk9eTHYdnjmL455XlA9LUH3MTXbxBRriqsqEUyuatkb699rdoGU
         brWapfKPhFxvidXDk5YyDi0YeNeq99K6ETReNkASUYaHn424MFNaNbngttghEMywyLVH
         jquQ==
X-Forwarded-Encrypted: i=1; AL+hErEzInPCLinMlXJjXTRt61m/KDA4VnwT2kgIiQxatpZpk1LBD2tzOxqLbKFuG7ClfEGnBukJp+ChPA9Lygo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LCzRSVgK1lK3qdm1koSW0kSKKYeg+TXSzuJK99kpYjNlRdi0D
	WXPskB9FJ8OUhgTyGTvHMBED9h0ZcvCwJz+InbQh9wq4itdMoaVcWtA4
X-Gm-Gg: AZFdTZfnWr+m9RMvjT7RcT+ahF89udYOxUxYMOQf1nvYsc16AWEI4BLUo0RHKKM8XJy
	gHjmmxsJMWiZlfoSSSZqFWGMKgYecFTxmDtmSMX5avAUApaT8heRGgZFN8ozMxkb0Wa0jJRJatV
	2QkcP01UsttSrOiiOQzu0FmpPZ2XgRyB7HNm24IR1PkMDkjj14huzi+tV/cyL3t7Lr37MzbejlS
	wuPNdv6rz8AOW9CbvXeNNT04Uv979fMGDrjyJLkWTDBIOo9VYV8pHrfGXRLvOvxRFHKjTaMFwqA
	hf8ccUajG/LFsfh4/alcIbiZsKoZBJ3Y+rjGA0k2zR7P3bBAT8vKbzvKEr9818oiRqZ4yLyYOFm
	bKt89qq9sTqNqqLGE18mN9p//Cqsyl3G5lv0lrvHpt4WUWlCaDStLt751MXpnFkicMR4wwycHIU
	MAUzS8yHP8sIROH8gcyV8o2VydjBmCWPsiJQxs0N8ewtHk97hheX2AeSh1RIqqfvGuUptFgKcfW
	17Rhfa3Ws/CTxHgFMmOGdusM0LPEV8ADwxir3C+xYiUlFxEbDja+PfUNZb0GvhqRz16kYREGs5X
	bwawdNoP6P2tSrYEgtoMCUc5D0blQv0jtEZPJAqneALlhgf0yF/lc1Bi4/l2ZZ5s5miGmlDty5H
	bAkuagfYwKP/MNyCcWV1mLzNcCEq6TX6x6g+I7n2GUXfnYntnkk+ursY=
X-Received: by 2002:a05:6000:2403:b0:4a6:dfe3:fd93 with SMTP id ffacd0b85a97d-4a6dfe3fecemr11577697f8f.40.1795104068125;
        Thu, 19 Nov 2026 08:01:08 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm323784f8f.44.2026.11.19.08.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:07 -0800 (PST)
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
Subject: [PATCH v3 1/2] arm64: dts: freescale: imx93-var: Extract common Cortex-M33 configuration
Date: Thu, 19 Nov 2026 17:00:53 +0100
Message-ID: <deeb0fa8588673f063b14c34a7aa59efb1521b39.1795103362.git.stefano.r@variscite.com>
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

Move the DART-MX93 remoteproc and MU1 configuration into a common include
so it can be reused by the Variscite Cortex-M33 overlays.

Keep the common file included from imx93-var-dart.dtsi to preserve the
existing configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v3:
- Split the common configuration extraction into a separate patch,
  preserving the existing DART-MX93 configuration.

 .../dts/freescale/imx93-var-common-m33.dtsi   | 22 +++++++++++++++++++
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 15 +------------
 2 files changed, 23 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
new file mode 100644
index 000000000000..de0e56f322a2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
@@ -0,0 +1,22 @@
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
+	status = "okay";
+};
+
+&mu1 {
+	status = "okay";
+};
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
-- 
2.47.3

