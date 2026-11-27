Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769388;
	b=TPStAsjs7ndd1R5231ulE2GWm3ckfZ1z6EyNyEcfAB1a0XwSApE7M6xqVfVtpigx0wD9
	 kkel2SpTgidZapp1ki3BJ+3VMAp19MoLF+03+V7383akytRG4ijGCz4AIBFtcAgCvuAZC
	 Id/hInt45nHcZa7IxXG1BV8SsfyT71RSzcX9A/+G8Zli1YA2a+5RycqTkAQrcothXfUiD
	 sZlYcX4iRZTOz36Qk0Siu749YktS1DbOfkmBl+37igD+qSkWRilSCKgeoo2X644kRatmI
	 2GFX2y0Vjpj0a7pKo1C9EkBXgXnAy5eTKIR0KMOVQlXh0veFFLIdjEFR83NxHht4HNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769388;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ETpoavU/etKeFx8+GQOxJ4MGBcCWacI3Dg1a6QFBM88=;
	b=zaGd9ZickLiwz4OxxSUxNiUocFarbWQH1DiakVxDwa7aT/qqS1zhfj3crA8CNaJa4sTC
	 RiDpgvelc3NXzGcgiuLCaCwk5YBN45Nzg4NJYMU+S8Cu5HDrkuQbhzxcBWC+aI4YO7Sel
	 Byv+PKmwt75NkZTiJ/OhYMhtxgJiZ3DstrETjbMDOm3gwO2gcdmhjmvKRA+Qg4eEs82qX
	 RALLSyH5ogyMmSrGMzin5X8Wvo8efVXZTGasxO64DcedY7ipFOYXrgU/GSq5xqU6s8u3O
	 WsIWo9fesoRNiHGf5UfTxzqdmMYdPWT048w022dbOJE4X1gBpbx8+sG1RP3WXJyORVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QO9LVXL8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PcQaJtIU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680F660A262B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 680F660A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QO9LVXL8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PcQaJtIU
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GgcP1475308
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETpoavU/etKeFx8+GQOxJ4MGBcCWacI3Dg1a6QFBM88=; b=QO9LVXL8lI2UO3KM
	S8vrRG+zfm7q7q+JngG0NUb3g5/s0LTM9G3AQb3amKtc+3v88nmHuTVB8Am6TkHr
	btFSmwFUGg8mrmCi2Gd9trnN4XuP3AVBCtDwqjyDUDmMAfivmFw6dEmCrSsRSMg6
	uxsW8GzspO/WRuR1iN9gunlXJyBL9mg4aMxK3/O7qBUbPZDIKdbCop5NKz4L+rpX
	wZ4zu43l8foYPbPUsJ93tnbEaHT8FI/UcqIUgNLGpaF4LmtT4Z32/+VLf3o+DQRq
	ga8PMs+qAAsa4Kh3kCbJEIuXDjAc68Vcr42bx+RQdnwqWMRCZHS9BZBahCESeSqd
	IXqTkw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4ht5b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:49:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc50d537cd7so272494a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769387; x=1796374187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETpoavU/etKeFx8+GQOxJ4MGBcCWacI3Dg1a6QFBM88=;
        b=PcQaJtIU+RXGsTH4YeB75suNDpdEzZ0pA9CWQBg3ORIQUENm67HkvYTn84bmTKTyU8
         bwg847nRKa27Tf0d6j3KWtUVu4wjUrUz9Jg5EaLImRSY24DwPUcmi8GEMwtHcBD9dAbi
         L0QNYpklOdnVNMZVBxC63ac3bFVjAld3Do7bKTxq5yiN4ejqFAi801C1IjoQA6ldqt6m
         C+SVjSP8KnvhOx6R05FX5JpBIbZLp5GIDgfVIPIt6J+y6CMF4IrwIj4+LfUIirgCn+r+
         QTYrjBkF+yti40NpJknYF1pEadilSjRWs0DapgU5SF5crNMt+GpAcQtB3H6t10ta+AUB
         23BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769387; x=1796374187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETpoavU/etKeFx8+GQOxJ4MGBcCWacI3Dg1a6QFBM88=;
        b=svWlzlXqfnUX9+dGr7VTiWYbaEBpplWjsjx8ZRZ3Lq6vBtBjWV5MU9uymRiayMcvQA
         es3Bo8WTSaLVvz+UyGlR5LcyY3BMfQTerCrRH8UcOmEMawg8eo00tJPcOQ5E23WHrHEJ
         FUL+qgpPQlag3fJs0YXddQABEkyY3bjTumWo6Xse8ei0ocaz3OAklbTO2l4BoysApQ4U
         jgxbBpSUNDe8MS6//QFbrSTYrrqTGIeL8Pw9SaigRlW92OvQnFTnrnZ/rNh3TMBYIoI+
         wdAWUjsleZyknUlOsF80gbEvh3qolCgybIXHqSpqfPsLB0z3iYNHU1voLdEG93TMJFId
         zDEQ==
X-Forwarded-Encrypted: i=1; AL+hErF3PYHTj9hkLI1rff1+sCBxJ3NhubalKuUSJILuN6nEIDQHzEi4hIQcw8A0SRmO38wqdRaKr7nXoWUEeGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fYDwca1sT7dpX9lx/vjxOLzjdMQbuv8xn5gS1VlhAaLIuQlry
	rvDm4K7PVibKsReR+xrprwYte42tbBXyx98zFpcxn3vSBS8dirSPn9Eb3vdkkNkw+TaAZHOEWT9
	qvzQou1XL5aIAaolkxXdkuY4bR4y87fJ+UQoKIt9kt8CHeCejl56NE66RWRD/JA3sV8w=
X-Gm-Gg: AZFdTZezv1uD7mhMmVXB3tV2cUjjoWRl/0HYje/z10KK0Outh7Nx+okqOlH5zMtwuka
	P1fWTYJ6TkwYTgv09Otw8rbVf0b7Xuf4OO3pIV/FKSaNSKi20AGBDvYp0u92K631H2vyBxY3vKi
	cPt6rSRoK8fWhvGiyf3M3VMLlqDlxv1i1TvH3f8BsoKBh1McQZbxfbsPGTFDkHvUBsPSXkRwvZA
	4/5oQZs3yttxxr/1gL2hTxYw84fsmdXDPvEn4YaucQm8osAk1nOJcF5mgIioylQPULS8o1FpUCT
	1TjxvSeG0IvlsqjE+0F3umAjv4dIUAHNcnPNCytWxLFcRxv+Ht9cCkuKLOavnPiAQH+sEFrAw5R
	E9RQvGuRKz77KezVjGiP+u5Ney8SJ1VHWOkwiwyPLYwHKwnps2kQS65nB/JaxxBAlCWTaDGLi2k
	w/Uv72vxml8JGaO8xib9lNunYWYVqvpxtbPNRZiuyszECRWUCNU59CKj83z68yIpX0zZsPi2urH
	xyYBp6B9+2tIYdDlisgxcdYEaZ+dg==
X-Received: by 2002:a17:902:ef45:b0:2ef:d8ce:83e6 with SMTP id d9443c01a7336-2f03edf6f5cmr369166365ad.0.1795769386807;
        Fri, 27 Nov 2026 00:49:46 -0800 (PST)
X-Received: by 2002:a17:902:ef45:b0:2ef:d8ce:83e6 with SMTP id d9443c01a7336-2f03edf6f5cmr369165895ad.0.1795769386371;
        Fri, 27 Nov 2026 00:49:46 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:46 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:24 +0530
Subject: [PATCH 2/7] arm64: dts: qcom: eliza-evk: Add DLC0697 DSI0 overlay
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
Message-Id: <20261127-eliza_disp_all-v1-2-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=3326;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=CzV2NA3Bg5CPsEbK0KJqhj/lR8zMyH4dHyWHv1oppsE=;
 b=DzAGilp1UoW6gYasb7Apa/INX2kErSd3QqawKYCFBfNn5AmPJg4oOISmgnCR+sJTNLpkXuA6H
 7VWQfOt99CdD5NyF85SjBo+VltbdntcZa/kUAvFEs2aeWuQIsRqRE92
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX+K42bzdZFgE1
 euz30WSmIR1EKpNyilR1rvCS7lPiaf4LwkuiRRN+IlBsGvyqy/m8px6GJokkgaUhgGXr715v0+m
 oGFkrE8yQYrloVcvy7j560HvNOoZuVg=
X-Proofpoint-GUID: -yQZDOUyjL9PcuTsV6gxuANlrnNzB_xe
X-Proofpoint-ORIG-GUID: -yQZDOUyjL9PcuTsV6gxuANlrnNzB_xe
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b09442b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XfV8FL5vlgqiq40GVOYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX+wI5DRUU5uY1
 xBu3VmTb559/BdpBelOHT5/FAcyGl4E/z3a0U6F6w2+DHbW6Ej8wTsS1EAogOcE9ZJJEtTRZdbu
 FYGPoQ3LynkePC4Tcw0RhBR6UYQnknZmvmkLUZSeSc6TlE6+QtFB8FhbxpqHjSpRf4P0OxBfY2v
 8mUf7cJFt0FAzymr+UoDdIoHuXF2RpzAZZoq8lfB8c7oV98+9hAZ1Rp/c8psgDsVdTamllEPMyR
 HrjDG28mcGS0GVmNSV0VVTfvSnHLClU2mByoohDIl7cpKwavpUoqQEO+q+yzt3N3y013exy0C+a
 POFMAbtBLUvNmNxdqE1FaGU0e/9C4YF14YiP9isYdolA5qT9xu89vz+ljNkScLg15gRpYqycBlA
 Wug4D9hRCXMs9sw2UioWCKB9jocSiSY2K1/RhC2IAHVrnriRCJRK4xf2JUYvhgWV6oU0CxsUCuB
 8kWSMr2jBvPyKExML8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

Add a DT overlay for Qualcomm Eliza EVK to enable the DLC0697 panel on
the DSI0 B2B connector.

The overlay disables the default HDMI bridge path and connects DSI0 to the
DLC panel. It also describes the panel reset, TE and backlight GPIOs and
uses the display bias and VDDIO supplies provided by the base board.

The DLC0697 DSI0 B2B connector path expects SW3.5 to be off.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../boot/dts/qcom/eliza-evk-dlc0697-dsi0.dtso      | 75 ++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..64c61aa9cd8c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,7 +14,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
+eliza-cqs-evk-emmc-dlc0697-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-dlc0697-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-dlc0697-dsi0.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-dlc0697-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-nothing-froggerpro.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk-dlc0697-dsi0.dtso b/arch/arm64/boot/dts/qcom/eliza-evk-dlc0697-dsi0.dtso
new file mode 100644
index 000000000000..a0a68d397663
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-evk-dlc0697-dsi0.dtso
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	backlight_dlc: backlight-dlc {
+		compatible = "gpio-backlight";
+		gpios = <&pm7550_gpios 2 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_0_connector {
+	status = "disabled";
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+		backlight = <&backlight_dlc>;
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+		avdd-supply = <&vreg_disp_3p3>;
+		avee-supply = <&vreg_disp_3p3>;
+		vddi-supply = <&vreg_l8b>;
+		pinctrl-0 = <&dlc_panel_rst_n>, <&dlc_panel_te_pin>;
+		pinctrl-1 = <&dlc_panel_rst_n_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in_dlc: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in_dlc>;
+};
+
+&tlmm {
+	dlc_panel_rst_n: dlc-panel-rst-n-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	dlc_panel_rst_n_suspend: dlc-panel-rst-n-suspend-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	dlc_panel_te_pin: dlc-panel-te-state {
+		pins = "gpio17";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.34.1

