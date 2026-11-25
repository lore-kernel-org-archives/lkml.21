Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594889;
	b=BNURASUiYc2VT/qP0pFHyW73wCnD6bhpyDAyL2h5N1rggiv62sECCcwPMZ1kUgn7xOg8
	 rpCBQShOJ+zjALeFkX0uXMUtdf+pUVBu0Rjbpzfh6a8TVu/tMSKElZ5NdtN5Kb2/0Z0eA
	 6h7eMPumvRlZ2VxsPH7RHKr3BIFjdPxE3gkoNgWgvprE/cIL3aToxlOdwC+kdNA+r8x26
	 quwTDYtnEKTNyhHz7l/NtE02Y4HN6W8WAOTUT89/LhZQOZl38KT1W3WzlA0BCzlW41t80
	 Pfau05uzTVYVCgUiI9Qd/vmv5DLU4MWmXiwZOElHaKBOCqOKbburtBoJAPtyf/pFW/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=F9dBCzJvyPGLsTApMbu3cmu6bIp573jhUz5HJOob/M0=;
	b=Nm+2RkeMJN4IqkZ7iOqdOkvPmbMwnXuVOU1BJIcQvrPpLIg0K5YGUTPJgyXLI8XODrxM
	 cDhzslKOGhguEkCHTpiU78wJMGPwfsoubLxxrnINaym6V3zuFhpmA/C8oaYT53D7oqHC8
	 76xssgzFVP5f1HysvBmErDN6w4Mbe47yo+mM+lES4Da94EPkkupFLMFy4jPB0hfCgXCDg
	 KDrt4070Z2dbhyDhynyw0EkP+bRZwUSJFK0UxsVs4YoloPXAympJcSNW96H15+DokR9xU
	 yLCGkwuYsm98Nyecg0YEaIlxENLUxzGJ/OuoxgEGnq1XN+FrRZoNfl0veJStlt5wIag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NTu57Urq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNO0hmHs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B81606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42B81606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NTu57Urq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNO0hmHs
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP7c6rD4006979
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F9dBCzJvyPG
	LsTApMbu3cmu6bIp573jhUz5HJOob/M0=; b=NTu57UrqioZE9Ktf3PkaXVqn3QL
	E0YfKrvkb1p9x2uySICRHQ+daWNSqeBAvKcLFpKEkuVzb7pX/hAUyAZSDooCjhi+
	bLPhuBJrZE16Kq9GFNzy/HUGwFvrUnBaGpu0N6eFsaike+B7ojWjoOeSL5DYg/zI
	N5yBbgaq/3FUPunJqQWIV2TqvjCpu28avOapMXajRgJX6A0NDKB4odqvjQmP8OkK
	FNFbugWcQF3F1q39ybwGhHFgvOl7PrY+Irb9clnKEWNeRKRIOwxJPLUBmRsEZlre
	2O+JLi84QBlwNwBwIzSQayRoBNds0aywzZ654YoK1ZAqKIHtDG+TRtJ/YAw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkbqjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:21:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so43845795ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795594888; x=1796199688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F9dBCzJvyPGLsTApMbu3cmu6bIp573jhUz5HJOob/M0=;
        b=QNO0hmHsP2IixSGHKoP0t05o1LTib0/h7vkxgTzkO+CriJExBg3m78donT5Nf2MEg7
         zTbjCgB5C2c7P/8gPd+Sqf/CNYMfcTtlmTrRECBa7AVl+A49UmdO6eMSq2buIz1df1Rv
         pKYucRPrKeEx4OXazJSE7WwsjYkq9DReUg2qRAUvtqdRChCjfjqyMK1admfBqQAbZB5p
         5M76E5YwkW8WkVry8z6GIKDZigZlIUC7+FexNeZ7AI8a5hZlHmKf6o2n1gSHUE6EwjWe
         vWkyCsuBA6RZWYhoBryOh2TRA5kGvbba2A4fnQjZ2YF0r3KfjkF7tiCXoTp2/ptDvCWW
         X0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594888; x=1796199688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F9dBCzJvyPGLsTApMbu3cmu6bIp573jhUz5HJOob/M0=;
        b=L5NEyVPrUzTEYYiQxJmhShZ0pGUrP3BUssLKXbmFBuJG9gQpy8uZXCBvgvbIpjESzG
         77kpscCDmR58syaLL5K+CqLUDyypRZVT+Wm8h8EisxNdWjoiHzsPMB7OiwtNbBMRvwnM
         1m13V6egfMBnScH6Qhy4sV+M79NDwYjyJ+Z7k3nOQYrfODPxB78lBxSI9yU4yJNFfMnq
         SG4T470lXetw4kK3SYKsEXfU+RzLkBvlhR5TjvNBrG3XlNDpIS0heFk6HOb+RGpljiJS
         11GNHg/R8wi85KL4QNS0hIbHkJfsg0LwMyqujjrA59Ar32P4m1rqfEZdbbBah2C2cu94
         ZG6Q==
X-Forwarded-Encrypted: i=1; AL+hErHnSDECEmx9TU8IKSTmBHy8lDz4MwG0unOnQIspf7sbyVdUMK8ps/zxSyAA/B8gKcvXbJJcGMW/bgwzhJw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WmFjj/IO++kgKMEp2om7WLO0XvgmjHb5d/YnaTBUHnUljyIE0
	heN0hhhJHjokKrY4Iti+9lgfIcbIzTUhnjMCYtViDiSTmfHNQVhGSVKxaALg7IQ9TAVLAjIIhs3
	H50REcvI7Quo9n2AQotxpDTsnWr5XStodEYYLr62a8fS83FKTU2qWMMvwjul4Ocg2agw=
X-Gm-Gg: AZFdTZcdHXSVZyMu9AdgXkt+2mE6+0BJEik6Oor1E2Vw35EXbTuFBtD6/u4NN3oBCb8
	oIYddHjGaObPHnW7ONhIPLF9TYCv3/uHEXr6ewfGiRJSK1BPiMHzBx18LlXlvhAHYr6Rtp8zc+4
	DGlpBbZYeQUiM0yWmV5C66PSnIUn9mTiKtv6+8CuLqokWHlKCcqZoNoaWXHJxW+4pQibcPX71JU
	gC0RrVgJJIOmkjfuqX5M6Cla1TGawhkEG8tS0UyxHs7DmBxVStn8Kts/dnUsR5FIOAzdF0CFhi1
	UCi5iZ6IleiUmfWaltNrXdZQOhQe6ZemhYnHAttNBKlDIPJrKlHp+2knv1R/WxONrAh/dAaMivX
	ZL512CUQLUJIjGmPzRk95+TNSdt7JoVfUY1FM9d5z2RtpsZSDJlcCoHY9A7mmGzJnb03nQqjait
	U2fhoL9kJa
X-Received: by 2002:a17:902:dacc:b0:2ed:3f47:9691 with SMTP id d9443c01a7336-2f03f18c744mr164634605ad.42.1795594887584;
        Wed, 25 Nov 2026 00:21:27 -0800 (PST)
X-Received: by 2002:a17:902:dacc:b0:2ed:3f47:9691 with SMTP id d9443c01a7336-2f03f18c744mr164634405ad.42.1795594887117;
        Wed, 25 Nov 2026 00:21:27 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm73135825ad.39.2026.11.25.00.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:21:26 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: [PATCH V2 3/3] arm64: dts: qcom: lemans-evk: Add SDHCI support for eMMC via overlay
Date: Wed, 25 Nov 2026 13:50:55 +0530
Message-Id: <20261125082055.488583-4-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
References: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX2x6/758ji+V1
 cjFmHWIgW/KOG0uHthawMBy2Gv39+gDRQyTELMpVNjsmxOXooxIKOaY6edVHZm8pVmqpxTkOCdZ
 EH4pEsprADJTG+CjwJJLDEAOKtR2WZViDX9gyb/fbNGvubI40QEJnr6+1lFEy6izfCAq3XG1FLl
 oz6VHWAs6VxETAjT9Q8QZSwzSCoEXhbdRmgut4Ls4NP6osaixKPQoc8/5moUEGILXpUjPgC2Yul
 9uJzpfJVrhoauxHHIassZ+zRAIT9qsO8yrwTV0zc03W9AERq1wnbah0m26IUnp0omPmXzQUMKq0
 DdKPtJaQraWWlYEj3MxrTlJXnK8UD5blHCmZH9aqljp9IO8zLsaADIUio0wBzeUgOyS0XtsqHn7
 QQ2K+bcL84AoGi0OR7ud3sTUElvh4YxaSkhkeBllprQMQrVPXRfhF7kwsx3xIWv37v3Cp4Zvphs
 zRQRy3T3V3YjrsKNglQ==
X-Proofpoint-GUID: mUPSb2ZYJ1vHjDuEvdrkWiaPuO9we-h5
X-Proofpoint-ORIG-GUID: mUPSb2ZYJ1vHjDuEvdrkWiaPuO9we-h5
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b069a88 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=MHOxcNdArT3Ept4j03UA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfXyt9gFcMQxbY9
 deOzElg0kdKWPRQ8aCBmd7X8o3n6C6yT6ZghPe26oOmEm+lelZB8RHlObVcIlCh1Pua0tqyKqxE
 yNvtfkWT5pc5QjGaHGjcwp8jZih/RoI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250033

Enable the SDHCI controller for eMMC functionality on the lemans EVK
using a device tree overlay. Configure the corresponding addresse space
and resources for eMMC.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  3 +
 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso | 64 +++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index fb894ff002c6..25dae330d74e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -67,6 +67,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-xiaomi-nezha-cn.dtb kaanapali-xiaomi-nezha-
 dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
+lemans-evk-emmc-dtbs := lemans-evk.dtb lemans-evk-emmc.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-emmc.dtb
+
 lemans-evk-sd-card-dtbs := lemans-evk.dtb lemans-evk-sd-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-sd-card.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
new file mode 100644
index 000000000000..52739d39a1ff
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+
+/ {
+	vmmc_sdc1: regulator-l8c {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg-sdc1";
+
+		regulator-min-microvolt = <2960000>;
+		regulator-max-microvolt = <2960000>;
+	};
+
+	vqmmc_sdc1: regulator-s4a {
+		compatible = "regulator-fixed";
+		regulator-name = "vqmmc-sdc1";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+};
+
+&sdhc {
+	vmmc-supply = <&vmmc_sdc1>;
+	vqmmc-supply = <&vqmmc_sdc1>;
+
+	pinctrl-0 = <&sdc_default>, <&sdc_rclk>;
+	pinctrl-1 = <&sdc_sleep>, <&sdc_rclk_sleep>;
+
+	pinctrl-names = "default", "sleep";
+
+	supports-cqe;
+	non-removable;
+
+	qcom,dll-config = <0x000F64EC>;
+	max-frequency = <50000000>;
+
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
+
+&tlmm {
+        sdc_rclk: sdc1-rclk-state {
+                pins = "sdc1_rclk";
+                bias-pull-down;
+        };
+
+        sdc_rclk_sleep: sdc1-rclk-sleep-state {
+                pins = "sdc1_rclk";
+                drive-strength = <2>;
+                bias-bus-hold;
+        };
+};
-- 
2.34.1

