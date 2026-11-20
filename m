Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165192;
	b=GgY4q9VNC4M9nT9rLXk1Aez38FbV4nIpQmxwIg1O1gNZ9t/pbrBYUEiflsy1tkBpfzI2
	 9OBYjff9duDJQI3WlpgAe6newVrHSVjP3ew5A2WnvVdfL0pL+y7svccHweYo+YE1fNC3R
	 X5bLFLJAfPNadYG1CTQAFBgU/m1RgM3tO4WX4mofhYeZq1/qU83IoP7VpZw/FWEuP/g66
	 mK7IunMRyCjaoigcjnqC/j5eHvW1GbzAPqIGhK3T5Ku4sAiYEoyheIBJYxY/co8Wz8Bio
	 pm8cFlcTH6EeYgmqdPBk1w9sAtdq2/Njr1VvS1WGHffCPdXCTHsAEkCjl7i5GL/PnYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165192;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ax09deECwGRX4LEojS16L2+vzlGqOOmaPwTOIojdcJk=;
	b=5Q+b1LdS0xS9PKTyNAaDwUzRrpWGdvDh0X6DtaXiEMv3no24tdQsHg6IDZJTHQmWhkQG
	 STbOr8c/r+vSr8eJMbICqJzUQMmHrgqzScwrry6iNWf4t1xx14HtQZYsDiQ8HzTUIbEOe
	 U3Z0JtKf60bE45DVaBxrwA5E+iMj8kfAg/g0mAke/+sbc3F3YrOkUNfUTDdTLAsK/wvzQ
	 JPQ2Xm1DYHbmSukdKlpSIxcTAiijsfBamKd6jzQ39J3b5PFR/J2r9uQnXZbcd5zTxT8iN
	 AuumBDG0eqCvUWGOoGWzIFGnMls309hgXGza/eWTYJ9+d9YQO2+tJeYAwqn02XzZrzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Mx1/h9ZW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESiwEdb4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110F160A3816
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 110F160A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mx1/h9ZW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESiwEdb4
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f2GK1112298
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ax09deECwGRX4LEojS16L2+vzlGqOOmaPwTOIojdcJk=; b=Mx1/h9ZWLe2XfjWf
	xfKdJj8YwiZbBc0W6qfOZe0q0ez5WDTvwbHHglOaAlRoerPVnLVz3F1Thd+wPhrJ
	PTzBY0Bb5C9ncOm5ZCx7bX3JvoRFB17p9h25oqiaNSLCWBtGZ3dNihgfowmPBrBx
	yiOMA1jeC2zKsbBT373AzW2a2Fq9ITeplauBWWKKitG98IV81AWhTrc4p1hUly6l
	dIbQvLw7wFfKtUIr6BBCw4ddfMy/CcekTXf5pQsimG0UxBEoZ2S7qJuLsMPZvKFh
	Xn2L5qNqYQDH+bbf8wtB0fL8yjo0CX925qp9BZrzcjzKdMDSM/8Fd41It0jO/ZgC
	QNuDmQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtry07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:59:35 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b45597c7so1578004c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795165174; x=1795769974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ax09deECwGRX4LEojS16L2+vzlGqOOmaPwTOIojdcJk=;
        b=ESiwEdb44iytkewt3rgTyCeRIdxSnSb84NaSnNH2y+b3umQunV7qsNU2cX/hIlorSy
         N3lVtHMYVFSFIsEUwSm7pweecVHoIlsK5drQGONEX7dBM8XTMJx0wCQRxrjU06wNDCwN
         7gTYlrZOsh7tz85/fTKts+ywCCpI2uNsIYUy9R/VxgxOSCEMQEmlnbbFNcDtljRolblo
         Uokhc+7G/N4owXXNaz5P+EwJma8e5wCcXsKed1tqPI3aWyc8gIWNukh7t4lKA19pbJGJ
         KpB/SlPwVUthodKpdCB5qlzPsEe7Q0ehW/qUVZhx1Auo2Pws3xZO5Dhkzvc60TjWVp3N
         9Waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165174; x=1795769974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ax09deECwGRX4LEojS16L2+vzlGqOOmaPwTOIojdcJk=;
        b=QnUj173xEnWiXMmUKdy1rVaCYlbBsW3vydb/funOo34b9nM388dHZOHGOrGDsKCRBi
         Ix4lbUfGNq1d0lyzmvw8r5bZly+6IYwmrdG8mcn6saf+C5AIgCe1ckU+bKIqa6zATSUg
         3zXAu3csRdnvuEISo0hQpkxw3axhy9OsBdqagXxeM1G3coQvnsNNx924cEfiljzhS82L
         JkbfS77pMkzPSmH2E19b2zKgzjsvoiDdeMM6Je/BDvC/5UKBSaSZix9bsHb8CrhaM0Op
         sUpKCQ/K/YPS6b/kzmzJDk7Tqoar2yJulsvJ6vhxKkOEy5dLzKrvU7fgfDeICRlkEpdZ
         ZKAg==
X-Forwarded-Encrypted: i=1; AL+hErGkdnxU8XrkiP30mWQh/tp2nY6TsNg80RiEQalAWGNQxqWwKIJOACrVA8RGXeFdkDBT9edbF93iOZo59ac=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FY/+hS+/SzlWXQZuHInO+Vp3iySB3vV3yi/t1GW6kyZlRfzVX
	3X8cWhcH3/AqvlZaXYYqK2EVRZkiUF8VT2FjEd+bv9TlJ1bg4GUxWhAO/Hcvky6QiajS9WjPm30
	7eNCq/9yXliY0f94ZX1uptLSq4HsLuXwjRiQObDF7ESXAkLikMTiBxdqSM4w1tDmo6zo=
X-Gm-Gg: AYBFou1HrVIx8xclTkNj8WbnomS5mxgrGpuv+kBvK6ErBG3Samj494cIK61/c1gY6Na
	7K7qtpEJXT/gS+NBtCUMIKzIxZoC+ecOSYQz+sSgnwVAe5vFjZJGsIt//0mN44P51gaAodtFhIk
	BFLo1S0YcMmeAlZFHpnmw5eHZqK1QEXR4MG+nt6bESOitJ3Lzz2pd0CiKonWcuz31eW5Q8EbaMr
	Ax4NAdfWk3XZ2yZFjOnQ0n6JBGJT6dobwyNpqsh9SZlEwzoKPEK1j+p4OVlp3bgjNyqUpkYanlK
	ZUt01NH1Ym7/4OdqaFoubc3gsFJhCfI6kkIELni2gKAQk4tEUftwAG0Wm7vWBIT0loGMi3TfKON
	mnN7ZbUN0Jn+OuQdxoO6yYFqRDlNHtK5Oi+H9p3/S6ojm6SuBd3nKCthCDAA/2kE90HI0GM2ks0
	33Pn/lMt2iRILiDlWnrduJtR7E6QSeh8XI2r9E5zoaZ0ssvE7XH+xqaUddBnWIh6J0qKIwiyonX
	SEC2WNkHZw=
X-Received: by 2002:a05:7023:a41:b0:184:5f2e:aa52 with SMTP id a92af1059eb24-1b556894f1fmr2412820c88.16.1795165174161;
        Fri, 20 Nov 2026 00:59:34 -0800 (PST)
X-Received: by 2002:a05:7023:a41:b0:184:5f2e:aa52 with SMTP id a92af1059eb24-1b556894f1fmr2412798c88.16.1795165173655;
        Fri, 20 Nov 2026 00:59:33 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm9490658c88.9.2026.11.20.00.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:59:33 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:29:07 +0530
Subject: [PATCH 2/4] arm64: dts: qcom: ipq9650: add RDP488 common DT file
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-ipq9650_various_devices-v1-2-14f53b84c42c@oss.qualcomm.com>
References: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
In-Reply-To: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: f7bmagiQuFTzeSqlKX7VMwZFKw5GuTgq
X-Proofpoint-GUID: f7bmagiQuFTzeSqlKX7VMwZFKw5GuTgq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfX99k2+KEGqsc1
 ku+A5KWtK9MnlP+T6ytwP6BHkE4Pxkbcms54myAe26dVOJlKAE5KX/rcWSZziWPTgqDAjE393sU
 egAquTFR+H3QTAiZqO3iGrIRc0LPSK6xSto9yz6vU0OUI77XflA+CD6XORSMGUNJ1nJIW4P5iYf
 jIX+aW0cNEUAKyEvyh8cWGRy0mh2f51oezDLecR4BC2Dp/AiYrQYAFtUqGSXkUCVcLRXXBnsECf
 mobjrLYetpAdqZ+fPhDfxLDpe9Ap7c/v1SRftMk/m2sHdEZbfRM28o03vlW9wu3epyVeHTjNhLQ
 GXHxAEcNBBNEKx+ALb58wJOAf/oADV4AqYVoopq/ZgpDTVVUweREWv5VAIV5JIVv5OnKV8KwcaT
 WrbzfD5PA5uIp3RPUE3FyaUutOfyDc5RDuZEbFTSo6gHAOMh420YSN28ZFoYSkDn6pfYIupz3g/
 OrQVTMLH46N8VuOSvoA==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b000bf7 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0v5-D9jr3w84b_CrZXgA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfX8kzQnyEK6/Xw
 2fN6PhHgQr7m5CAww6Z56d4ydt5s5gU13VIJJQ9gWfRXFi+B8VSt3C97Vw2mwmnEM4aNsUPpAim
 wdhDoHFTc31K2lySopZ3MYxuiV623b8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200035

Add a common DT file for RDP488 to share the common definitions
between the eMMC and NAND boards.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi | 190 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts        | 185 +-------------------
 2 files changed, 192 insertions(+), 183 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi
new file mode 100644
index 000000000000..e51d75bb9576
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "ipq9650.dtsi"
+
+/ {
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+};
+
+&pcie1 {
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 28 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	pinctrl-0 = <&pcie2_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie2_phy {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 52 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	pinctrl-0 = <&pcie3_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie3_phy {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 41 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 42 GPIO_ACTIVE_LOW>;
+};
+
+&sdhc {
+	max-frequency = <192000000>;
+	bus-width = <4>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	pinctrl-0 = <&sdhc_default_state>;
+	pinctrl-names = "default";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&tlmm {
+	pcie1_default_state: pcie1-default-state {
+		clkreq-n-pins {
+			pins = "gpio27";
+			function = "pcie1_clk_req_n";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio28";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio29";
+			function = "pcie1_wake";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
+	pcie2_default_state: pcie2-default-state {
+		clkreq-n-pins {
+			pins = "gpio51";
+			function = "pcie2_clk_req_n";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio52";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio53";
+			function = "pcie2_wake";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
+	pcie3_default_state: pcie3-default-state {
+		clkreq-n-pins {
+			pins = "gpio40";
+			function = "pcie3_clk_req_n";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio41";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio42";
+			function = "pcie3_wake";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
+	qup_uart1_default_state: qup-uart1-default-state {
+		pins = "gpio43", "gpio44";
+		function = "qup_se6";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
+	sdhc_default_state: sdhc-default-state {
+		clk-pins {
+			pins = "gpio5";
+			function = "sdc_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "gpio4";
+			function = "sdc_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "sdc_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+};
+
+&uart1 {
+	pinctrl-0 = <&qup_uart1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
index f6411a55c81e..1ec4c5b91780 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
@@ -5,194 +5,13 @@
 
 /dts-v1/;
 
-#include <dt-bindings/gpio/gpio.h>
-
-#include "ipq9650.dtsi"
+#include "ipq9650-rdp488-common.dtsi"
 
 / {
-	model = "Qualcomm Technologies, Inc. IPQ9650 RDP488";
+	model = "Qualcomm Technologies, Inc. IPQ9650 RDP488 (eMMC)";
 	compatible = "qcom,ipq9650-rdp488", "qcom,ipq9650";
-
-	aliases {
-		serial0 = &uart1;
-	};
-
-	chosen {
-		stdout-path = "serial0";
-	};
-};
-
-&pcie1 {
-	pinctrl-0 = <&pcie1_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie1_phy {
-	status = "okay";
-};
-
-&pcie1_port0 {
-	reset-gpios = <&tlmm 28 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
-};
-
-&pcie2 {
-	pinctrl-0 = <&pcie2_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie2_phy {
-	status = "okay";
-};
-
-&pcie2_port0 {
-	reset-gpios = <&tlmm 52 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
-};
-
-&pcie3 {
-	pinctrl-0 = <&pcie3_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie3_phy {
-	status = "okay";
-};
-
-&pcie3_port0 {
-	reset-gpios = <&tlmm 41 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 42 GPIO_ACTIVE_LOW>;
 };
 
 &sdhc {
-	max-frequency = <192000000>;
-	bus-width = <4>;
-	mmc-ddr-1_8v;
-	mmc-hs200-1_8v;
-	pinctrl-0 = <&sdhc_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&sleep_clk {
-	clock-frequency = <32000>;
-};
-
-&tlmm {
-	pcie1_default_state: pcie1-default-state {
-		clkreq-n-pins {
-			pins = "gpio27";
-			function = "pcie1_clk_req_n";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio28";
-			function = "gpio";
-			drive-strength = <8>;
-			bias-pull-down;
-		};
-
-		wake-n-pins {
-			pins = "gpio29";
-			function = "pcie1_wake";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-
-	pcie2_default_state: pcie2-default-state {
-		clkreq-n-pins {
-			pins = "gpio51";
-			function = "pcie2_clk_req_n";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio52";
-			function = "gpio";
-			drive-strength = <8>;
-			bias-pull-down;
-		};
-
-		wake-n-pins {
-			pins = "gpio53";
-			function = "pcie2_wake";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-
-	pcie3_default_state: pcie3-default-state {
-		clkreq-n-pins {
-			pins = "gpio40";
-			function = "pcie3_clk_req_n";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio41";
-			function = "gpio";
-			drive-strength = <8>;
-			bias-pull-down;
-		};
-
-		wake-n-pins {
-			pins = "gpio42";
-			function = "pcie3_wake";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-
-	qup_uart1_default_state: qup-uart1-default-state {
-		pins = "gpio43", "gpio44";
-		function = "qup_se6";
-		drive-strength = <8>;
-		bias-pull-down;
-	};
-
-	sdhc_default_state: sdhc-default-state {
-		clk-pins {
-			pins = "gpio5";
-			function = "sdc_clk";
-			drive-strength = <8>;
-			bias-disable;
-		};
-
-		cmd-pins {
-			pins = "gpio4";
-			function = "sdc_cmd";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		data-pins {
-			pins = "gpio0", "gpio1", "gpio2", "gpio3";
-			function = "sdc_data";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-};
-
-&uart1 {
-	pinctrl-0 = <&qup_uart1_default_state>;
-	pinctrl-names = "default";
-
 	status = "okay";
 };
-
-&xo_board {
-	clock-frequency = <24000000>;
-};

-- 
2.34.1

