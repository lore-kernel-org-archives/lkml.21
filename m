Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590791;
	b=XtZvo5bh2tEa0Bf1q5HbPvC5k06LwR7WHuHM1fJR93TYkgDF4nqA8wJ0HDOuGGqaFJZM
	 cPiZwrDHGLpEP4Ukf1OhuvYSNzVkrYyCM/e+9KfTWS6kIchOJpVshtSeam4CaLWQF3QeJ
	 CaXeEE56rQMBayg8WOMNjlRfAGsXqLXMJWsfqhcAkSnV/3sRnQDQOwtAjjJLvzTDZRnCJ
	 0VI9I/Kla510bXY7Djr9Z7Hpj+8k5zrHoeOkDdvSPalIuk3qeWmQmEmkETvyd/dxLqg8T
	 C/35lDmf4tdMoTiZaPmCN4DbouLUktpJ7AMBFWDi5R++1XcWl2/REYdElGoklPHX2kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590791;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=z187NNFVs++duTwL2d9zlzyyvZbXrRdA0stePHS1Wb4=;
	b=nOoGdKccQelJssj4t9SYQqExoYUR75kRvOhatMd+8VrQ9bzIIGGSm1bDUkvBDHp+1xD6
	 QhZEdHm8Bgm2Mcu9vAbkaH3wT8cYN0Xt3kdD8cIB5btIHTsnMq3bP7lCypVAM/FGlMSPA
	 mN1zxFk/O1L25Qqy3/MtCgpm/HHHDGLTieRYe4Zww9Dw2rWBlx0StNiRz7TXO9K2R6Rg+
	 cgEErelsX/iKEHc7mlo+dDby53PRhdiTO+W8HJIdxcZKPDhFbV9wCFueDGENys4O+081y
	 lvNDHZplXg0seURy/lzkN5HTyB9AJsgf7vNJ3HPWFtMLptauezPM6rdmMB+Ww+l9tZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PztFO77K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zh4LbYWp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA5A606A6BD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EA5A606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PztFO77K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zh4LbYWp
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP69taN1006355
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z187NNFVs++duTwL2d9zlzyyvZbXrRdA0stePHS1Wb4=; b=PztFO77K9tDUsde0
	rwlFKkoHdvhYL8Mad+G5RB0JDvuLva6fYqOcgnUOOnCuJAwCh52LHFtVHRziD4mw
	cpCqWOAc+AsWakXkcL0crMaClkCiGEwTe8eS1xHCmDsrPetfBIdpaNdQ6Bd6LgYy
	KQrPzy41iSO4fbUp2mgvI79BTv23hyXR5P75tfq3w2E7mhjjtEfXk8SZNjOehuZs
	6Galr/xximmPfQ0c8Hd/6ZD1+5RreNMZ900oXBBkzIw4txs9S8AWf6qErjGVgA9p
	8NeGQEucbR+qa+GAsPU/2GvyPbe2u/Ym0Bu+wZ0tpLauAeLt88xtKHO0hOKDEbNN
	R+M1sg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa28u6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:13:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b44bcdb096so3835605a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795590783; x=1796195583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z187NNFVs++duTwL2d9zlzyyvZbXrRdA0stePHS1Wb4=;
        b=Zh4LbYWp/1I7F3YgNHsJVLiWjLGpMolb1MMyozibwpVnac0RMy/kUwMGuPzSMDsxHn
         AsF0jWngBqsCqh8XglhC/fdTqYVSFQVb6V4R2h408y2heYBDLSmUEPRMyFMeHsQD91bD
         d6k/NzCWq1ftrGbpbzYLPiQu2TfPeWu0ulfhHwQNtXEoJ+otH15HZ8egbDWVGJUI3VC8
         0/z17tGdOPtgZjdeZvDfXMrzwGB1JjhEOJDATJWTOayZ7uxNiPUwAnSsFSYSL/7tL4ZU
         CoiuCrOcgXuQBjsoHNjxS9APte743mTSqbEzWqaTfgsfF+Lb2fYYgWlJUXNnQQI4kjNc
         E6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590783; x=1796195583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z187NNFVs++duTwL2d9zlzyyvZbXrRdA0stePHS1Wb4=;
        b=Z440E2yhNRvg7MZWg7E5DKznbSN2JYx6XXJdBxkGOlRX6yqTyiEU1aALtQTdxwXGew
         m4s4Pju7JP6ur4JFYQlfSSM2F7yG5RtJNuB/2TzWjnH3kwWSIzxX8fTH/U04ad2Chupz
         1z2E3uADDdzCNhpHEYn+kAoVYP5mhMbjJFQ8pev5mUUjv0SJZbX6C3YbXWPCeHbqCIT5
         B5QLnjonOISuDAQf4lhhw7UKtgxbhR6QE6arqkz6HSPZ8XrtJXDk7+awJgMfVoqNb/gm
         r9ui8fSV+NdpsjYipcrBp1vX4lDcjJe6/UYNV2Y4KOjt3JOkBGTjEkUCUrduDfW6ePP8
         XJSA==
X-Forwarded-Encrypted: i=1; AL+hErGT4LBBnbNlVuybzr8HxZUOKeldBGUVD4UuMBNBbvR8gU44jIYFk/7BHC78JP18EmHEl0YrUiMokvm+in0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PIkCdYxeb81kVgarGZAON/xce4kpDE70IUjP9hlCTcBLZYI4B
	6/TcaU83EMH+UbOMtkHzG1PHIW6pDHDdXNNsj81GkE3tXxvfRTemhWXtA654ZjLLrgCz2BzeMx0
	G6RNolR8LHTilrEmx/dJ6GsvlfOfSkNM9RGYjK9olos0cYYwhQY1GVIGJJlcu/2nxru67pZLqxY
	U=
X-Gm-Gg: AZFdTZf9KIQWYrK9ImFNU0ZDSlGUfiA15bBXFgfxOI+AXl+XM4hkL36wfPgg+KHIDLf
	eBNkXYF4uZf05bsYzqpxo8ETIfGV3GphN7S5IvyBCnUBN+9sIMhfCWAHdogJr3YoKaF0Y7vhb+u
	qh19Gxl/M9i5g1YlHEXwpwxxZkl2sj1V7/TXDwFl5C/ZItPC14PXqyHW1+tYpRKYazkYYAOq/Pa
	iY5Wj98vOSyVtVTrapKXnMsKcWjwPBvl13bjXnZLapQmxnovni9mDERi9xurDEScZ//WAOOCs0n
	jnnEqMyeX0QrTd91p225/V2kpMACEW+s+Sc7UCQOkgUVZgSPAvoat/5Z2gb1RL1uGkl3PRCYMQI
	2+1SbadNzNSC5ICOkefV5TR2LezxfWLAkkhReGZah/aYd5F3fCxf7z9sa2oRVbd8crxWF9Xg=
X-Received: by 2002:a17:90b:4a48:b0:3b4:1884:984c with SMTP id 98e67ed59e1d1-3b41c7b573amr15976525a91.6.1795590783359;
        Tue, 24 Nov 2026 23:13:03 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b4:1884:984c with SMTP id 98e67ed59e1d1-3b41c7b573amr15976488a91.6.1795590782804;
        Tue, 24 Nov 2026 23:13:02 -0800 (PST)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0575d9sm8224496a12.25.2026.11.24.23.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:13:02 -0800 (PST)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:42:43 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: talos: Add Talos Lyra EVK board
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
Message-Id: <20261125-talos-lyra-evk-v2-v4-3-73d768714a5a@oss.qualcomm.com>
References: <20261125-talos-lyra-evk-v2-v4-0-73d768714a5a@oss.qualcomm.com>
In-Reply-To: <20261125-talos-lyra-evk-v2-v4-0-73d768714a5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: pJnp23JoRcB4icP0H7nD1sMpNihXpWEj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyOCBTYWx0ZWRfX8VGqHUdfHogq
 PLgQiw5W73uRZa3K7KohtLrGJjJmrssF3HqwFpwHY96NxFyEE9M/EQQP+ZW3f+dTxJ20VRCs41G
 XCXPYQ6Z2T0GsM9teWBRfGNVLCGJ0LQ=
X-Proofpoint-GUID: pJnp23JoRcB4icP0H7nD1sMpNihXpWEj
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b068a80 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=X4tYYTE4NjiRS8MdoAwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyOCBTYWx0ZWRfX5lFc/DYytrAK
 bCfgb2ZTD6IjB4hxReUYLgWe26aLJCjPuDT8x9XHz2uWWOsF/RyAWUixS1iK+yWGP/7r8Ck2MdX
 FkGm8aEON5Uoiv7boX03lKXO+4wV/LekCyVmW9Rk7feMnwpKWuQ3QWZUZmd31VOBxCGtRfogFAD
 1T35TY9roqTNJajBs5FGMmEx/E72Bba8yAxG04SchF0GiWYgL049r+ARgQWCLnJeSNAWVdWaxrH
 GTKvuEZVURRScCuU8DGlHY/LoTgZuMUOYPDSsLiHmds6QhtlzdCw7gCMvux9UbJGJ+U8xgchAyo
 sgRWqni+SwVoWbx3B5t9RClPr09DAD81np+mlGHssYa20XGwJEmkIE+j5bNfd7TsgFhePYjr458
 jJaWPeQOkrCpulfQNF+SYluAz32gCqro4v2THPH0BnHDuvQMqr6dNJ5reLHUsMY16iGl6gdooR0
 sI2rdlWyX4/auoUl7LA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250028

From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Add the device tree for the Talos Lyra EVK platform which combines
the Talos Lyra EVK SoM and Lyra carrier board.

This device tree adds board-specific peripheral configuration on top
of the SoM, including:

- Native DisplayPort output
- GPIO expanders on i2c5
- SPI-attached TPM (ST33)
- USB host and peripheral controllers
- Power and reset keys

Also adds a talos-lyra-evk-el2 composite DTB combining
talos-lyra-evk.dtb with the talos-el2 overlay for hypervisor-enabled
configurations.

Co-developed-by: Akash Kumar <akakum@qti.qualcomm.com>
Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Co-developed-by: Vishnu Saini <vishsain@qti.qualcomm.com>
Signed-off-by: Vishnu Saini <vishsain@qti.qualcomm.com>
Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |   5 ++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 111 ++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..243231692866 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -471,6 +471,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
 talos-evk-rpi-display-2-5in-dtbs	:= \
 	talos-evk.dtb talos-evk-rpi-display-2-5in.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-5in.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
+
+talos-lyra-evk-el2-dtbs	:= talos-lyra-evk.dtb talos-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk-el2.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
new file mode 100644
index 000000000000..bd9980b9259b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+
+#include "talos-lyra-evk-som.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. QCS615 Talos Lyra EVK";
+	compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
+	chassis-type = "embedded";
+
+	dp0-connector {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "full-size";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss_dp0_out>;
+			};
+		};
+	};
+};
+
+&i2c5 {
+	expander0: gpio@20 {
+		compatible = "kinetic,kts1622", "ti,tcal6416";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: gpio@21 {
+		compatible = "kinetic,kts1622", "ti,tcal6416";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: gpio@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: gpio@3c {
+		compatible = "ti,tca9538";
+		reg = <0x3c>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	pinctrl-0 = <&dp_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&spi6 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&tlmm {
+	dp_hot_plug_det: dp-hot-plug-det-state {
+		pins = "gpio104";
+		function = "dp_hot";
+		bias-disable;
+	};
+};
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "host";
+
+	status = "okay";
+};

-- 
2.43.0

