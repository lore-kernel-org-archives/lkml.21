Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165193;
	b=FfXAHwLVX/cp1mXmEAPoFKzMGfk0ITh1ZEajYweL6eEzvrMEEaCHgic573skJtEg5L1N
	 E79zG8boznpc84GsLWaCgj908Sr7O24B5usOu7ZPk5AmD2dZJ0TC2ZgwXqVs7bZzcHKLo
	 RCW9jJTlcjaB5SUyVaLVNCz7CVBpo7kENKcBsN1ZKbmSg0s/y7pj8HkIW9VFNooxNwxyt
	 503tcAsxuMQ0sNKFH7ojuj+VIkuw7xz5e+QN6sS59mzzpzsmP5NTdc/kEaPXqCYkyX0Y+
	 a39K2jga+kOVblkXwpoJ2UdfLcLhuHmvmsLrERuOzDyv2U/ZfbAJZyf20GgeDYyeg0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165193;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wReHZRtWUrdDFn6j6HvHYF34UCFScLEPNm2Z1PFlI0c=;
	b=yiWKxM3kc0SJxdRRVcMw7VjvgHN/XqGTP+UDN7JvzA1QqVTd4pkJ1a4TOOvdPsOmNFkF
	 PrX1hgQp0UYESCPf8yVE5HYdwadrpBOBLXvyYhq4gLv1O2m2ny3xGpjbtN6PRVEu1iK4f
	 1DZ07mDuuAQ8gi87lUDRWf9kz4486LWPoct45JAW8Z18HNYJqPVPJ6ae4u0jmQqzCl+EV
	 G7oRMAfjIn3ImuV1AKgDNwjS2uA27yqdlqvMOEy4FVxV8blmbvYlAV/bcTJvXH1h7+Hag
	 oZgSs+X4pUtEHxZv6U1zgx/jVXHbL6k6OSNkLLc0d0HITzE2oYSoI+JoaSz5mQPCdCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lW+cLoCm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SAQQwn1v;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB9C606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB9C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lW+cLoCm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SAQQwn1v
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fEvA758283
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wReHZRtWUrdDFn6j6HvHYF34UCFScLEPNm2Z1PFlI0c=; b=lW+cLoCmYqAM/Ff6
	2mB3yCZOTS5YqR9OgjhfCuSku86QJ6If9DTNKtLQs9iCC7SaIP3Zcv1+7cetnjew
	EspIb4xqwCgaVm1CCLgVubTE5fPnZvqxc+FUV8IhfhXnMPNEceYQTRNIjEOv9khB
	di8QYRFezmYd148Y22gdnF6L7tKEkFpt4z2vMV76oNqpUHcRNZOr1H/UfEa6qxRh
	nZJGms5zVX4WKmaL0KZ1lxqH+eZkqHrBJspc1XuT007OvEMWwA+5dy2386CdDcP8
	xZ5uvgjnNgaHjkWyvmaC5KcmJ6Sv7v7t7ZYDGOrqYrueseeJUzEMeUlVclRGgvyy
	XK+NdQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5tv8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:59:39 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b45597c7so1578125c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795165179; x=1795769979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wReHZRtWUrdDFn6j6HvHYF34UCFScLEPNm2Z1PFlI0c=;
        b=SAQQwn1vS8NsbjQbfVuiE2/ScYRvAcDoFwbm4UDATsYKY/J17zBmAMDp8BXAv4fXNE
         4Qb3Kg5aASpEqUdpxreY6wKRDNcv7OOY9p66RV0ycHzmUSZJU+KXWzPLp2IpbXwTpUxm
         RS8QCRIT7MkqLMtlKoyRwxLF8Iti4I+afgln3QBc/d56yKreaKsIegXgbo8owlFxPg/4
         SHV/n0mCK1cvuDjoWBGHq24EXl0342YtWUB+QCXobI52sd5uEbB17DGJmzjKjtkEkfJ3
         x3T09l29cY27zEW1QWgurBFEkESW8V8ExdMqZsYlt4YOMlDqcoe+yHLlHdQgQ/RpDtbf
         wAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165179; x=1795769979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wReHZRtWUrdDFn6j6HvHYF34UCFScLEPNm2Z1PFlI0c=;
        b=U4BuhSYmk7b7CshovuLuHoSoyC7CjupSVsLi2kTKA4bxWvhYmTPg633KdJir7w+ntW
         9k7ZRlzb+zDhnaj5wYj1vKqokpoztbUTkSLaNb5bcFWz7bPtLWqoAk9J5FPJM6IqphYV
         nZEBuKth6Fragy3Z4rHOoD46PK11I5BgbUS0XXhuUpZpFN2rtBV1sNQ2cr2fjM6FSjsQ
         VzOlu/rOAwO/1Nz0KdvS+5rJTnw48ydeX0JWRw290fBXzMeAl5mPaEPCnh0Q6P6yHJtJ
         HI2BmFIGx+SDXmNQML/1ILBQ/tbdFN8uuWxSpRDL6PQCH/y0VyEK22A4DdlzHrnwmcB6
         3rKA==
X-Forwarded-Encrypted: i=1; AL+hErH1j6/mcIO4oc8WgrN20rR89bZO9BCd6EvigzSdTRrGWz/Ww9Ri2OvuKW2tpydaR0yOqJPFW7NTxArUDmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9v4E2X/Fb6FvVShwYMPn5DB/FcVwDkF7QCjwqa4IAVdIiquupG
	l9osdbxz4BrtFA/R6oEi0nAdTQtZPG9S5G5h2YKbZBA/hxJEeZAgMU6LXL0/qGFHQYOhwA3mmyt
	fkCuqXlRdVec+RXWCPbZpNtSb5Z683/FUOSI76FYYE0ugz+FGf55WzPFRZ1E0d+LQ7So=
X-Gm-Gg: AYBFou3u7wR7nn2tu2YMjgbuNld9D7/dXdLEtLSQXJnDDWbmi4Z7CLnt20JM7b0Ifyw
	Slih25nfwfbKPZANNn1zzQ77uw3b7rKRiHgU6rGv5B4ngaeLO7M++SadNh6D6CvtOfppz5ZPTRs
	Nqq82b8o/Os3wugTgtWq1aL3VjsQpALQNfOjJxYBUKiN8oAnT0fQBqbNgtlXYfnRBK0xLpWFsYr
	aR7hP8tyPxFOM7BnvPGzpYdIV9QdTWtl0MBMdpb2zKA87tCzMRz3OgwwGVj6xzL+LKi0snz1C1+
	pVZobj53FeD61akdquOeZ+tB5DpgM4VeOnV5dzx9BuYmmjMYQy3bSL5bCvhzDUCuqh7utZe4t0y
	g0EdyCvWtStQWmDTu7CKniTRZHe58O0nPXf0/WnAg4JLoUq1RMXaSvxdgnJOk7K9XyjyxbSGCyo
	LP1ksA1GVpm96LmS6xG1KCXiDF/haHSqqqXpeEQQJzgPSDPxeV9vD3+535kfmftM4RBgpRYChgg
	GE3upok4ws=
X-Received: by 2002:a05:701b:4204:10b0:1b5:4cbd:ac02 with SMTP id a92af1059eb24-1b556895b10mr2515438c88.15.1795165178472;
        Fri, 20 Nov 2026 00:59:38 -0800 (PST)
X-Received: by 2002:a05:701b:4204:10b0:1b5:4cbd:ac02 with SMTP id a92af1059eb24-1b556895b10mr2515415c88.15.1795165177908;
        Fri, 20 Nov 2026 00:59:37 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm9490658c88.9.2026.11.20.00.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:59:37 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:29:08 +0530
Subject: [PATCH 3/4] arm64: dts: qcom: ipq9650: add and enable various
 device nodes
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
Message-Id: <20261120-ipq9650_various_devices-v1-3-14f53b84c42c@oss.qualcomm.com>
References: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
In-Reply-To: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfX3m7caQhqemcz
 eiaZGhIFuowP/ctbyEiEI0oFYXW0mJGw9QCYlPAt+RMvaN8uvZ67Ani2pckCgCCb9ozPJNFPVHf
 lIks/7JJdhhjUo6mFR6uQL8N42BxdIs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfX+0daR5wfPYM6
 NkEkGQP+3dZiKphq6+eecLVaApEz9I3QhymOaum5TDsuGqjgqUKFnVb1l8S3hjK05RrE22W1e+t
 K00Mhm1kYtm3c5GiFeOjiCuJpofDuDXNjNVTAR8lyNwUb+h6jHyWuXRIqWY1ZGl3t+A4fY3gHOg
 FZvPBulndRsY1GBcZaO6VqGF4GGAA0OISO/ZlL90P9x+rfLz4ULlRFo4AvmL3TioJRfl6zZewJe
 BkHhrJrbXZ1l8S4w3Q0Lw3a87/tFyufecAPhD7FieX9s5NJYoFOGLhbFaaCOvTIF+ZtDuYO/9ks
 RzvjvttQA9wFp+YLaKLKLUo7Lvel2TgBpxFhvkqQ0DUPCjTcwvPqbGvMqVVGLJFn5fU62xAbux+
 hG9zUUWpifhmCvfb0ety6AutzgHfZVBKck34Lu/l78k7kweDeNcnmZeTgunFF68LLc6EZhGri26
 DpYhcW4XMwwIoyuKZbQ==
X-Proofpoint-GUID: FDwqFVxOu3KMelnB5MXYNG3vfTnxlQOe
X-Proofpoint-ORIG-GUID: FDwqFVxOu3KMelnB5MXYNG3vfTnxlQOe
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b000bfb cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=sIq7ZPbkZYZUp4ket0UA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200035

 Add the device tree nodes required to support:
  - QUPv3 nodes for SPI and I2C
  - Download mode support
  - QSPI NAND and BAM
  - CPU Idle States
  - USB2 and USB3
  - DSU PMU
  - LLCC
  - SMMU
  - eMMC ICE

Enable SPI, WPS button, I2C, eMMC ICE USB2 and USB3 on the RDP488, and add
the required USB regulators.

Co-developed-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi | 186 ++++++++++
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts        |   4 +
 arch/arm64/boot/dts/qcom/ipq9650.dtsi              | 409 ++++++++++++++++++++-
 3 files changed, 598 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi
index e51d75bb9576..bc2caf42faf5 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "ipq9650.dtsi"
 
 / {
@@ -14,6 +15,69 @@ aliases {
 	chosen {
 		stdout-path = "serial0";
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_keys_default_state>;
+		pinctrl-names = "default";
+
+		button-wps {
+			label = "wps";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&tlmm 19 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+
+	vreg_misc_3p3: regulator-usb-3p3 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "usb_hs_vdda_3p3";
+	};
+
+	vreg_misc_1p8: regulator-usb-1p8 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "vdda_1p8_usb";
+	};
+
+	vreg_misc_0p875: regulator-usb-0p875 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <875000>;
+		regulator-max-microvolt = <875000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "vdd_core_usb";
+	};
+};
+
+&qusb_phy_0 {
+	vdda-pll-supply = <&vreg_misc_0p875>;
+	vdda18-supply = <&vreg_misc_1p8>;
+	vdda33-supply = <&vreg_misc_3p3>;
+
+	status = "okay";
+};
+
+&qusb_phy_1 {
+	vdda-pll-supply = <&vreg_misc_0p875>;
+	vdda18-supply = <&vreg_misc_1p8>;
+	vdda33-supply = <&vreg_misc_3p3>;
+
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-0 = <&qup_i2c2_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
 };
 
 &pcie1 {
@@ -64,6 +128,23 @@ &pcie3_port0 {
 	wake-gpios = <&tlmm 42 GPIO_ACTIVE_LOW>;
 };
 
+&qpic_nand {
+	pinctrl-0 = <&qpic_snand_default_state>;
+	pinctrl-names = "default";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nand-ecc-engine = <&qpic_nand>;
+		nand-ecc-strength = <8>;
+		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+	};
+};
+
 &sdhc {
 	max-frequency = <192000000>;
 	bus-width = <4>;
@@ -73,11 +154,44 @@ &sdhc {
 	pinctrl-names = "default";
 };
 
+&sdhc_ice {
+	status = "okay";
+};
+
+&spi0 {
+	pinctrl-0 = <&spi0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "micron,n25q128a11", "jedec,spi-nor";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <50000000>;
+	};
+};
+
 &sleep_clk {
 	clock-frequency = <32000>;
 };
 
+&ssphy_0 {
+	vdda-pll-supply = <&vreg_misc_0p875>;
+	vdda-phy-supply = <&vreg_misc_0p875>;
+
+	status = "okay";
+};
+
 &tlmm {
+	gpio_keys_default_state: gpio-keys-default-state {
+		pins = "gpio19";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
 	pcie1_default_state: pcie1-default-state {
 		clkreq-n-pins {
 			pins = "gpio27";
@@ -147,6 +261,36 @@ wake-n-pins {
 		};
 	};
 
+	qpic_snand_default_state: qpic-snand-default-state {
+		clk-pins {
+			pins = "gpio5";
+			function = "qspi_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio4";
+			function = "qspi_cs_n";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "qspi_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
+	qup_i2c2_default_state: qup-i2c2-default-state {
+		pins = "gpio16", "gpio17";
+		function = "qup_se3";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
 	qup_uart1_default_state: qup-uart1-default-state {
 		pins = "gpio43", "gpio44";
 		function = "qup_se6";
@@ -176,6 +320,48 @@ data-pins {
 			bias-pull-up;
 		};
 	};
+
+	spi0_default_state: spi0-default-state {
+		clk-pins {
+			pins = "gpio6";
+			function = "qup_se0";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		cs-pins {
+			pins = "gpio7";
+			function = "qup_se0";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		miso-pins {
+			pins = "gpio8";
+			function = "qup_se0";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		mosi-pins {
+			pins = "gpio9";
+			function = "qup_se0";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+	};
+};
+
+&usb2 {
+	dr_mode = "otg";
+
+	status = "okay";
+};
+
+&usb3 {
+	dr_mode = "otg";
+
+	status = "okay";
 };
 
 &uart1 {
diff --git a/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
index 1ec4c5b91780..69ce4ccaa3f6 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
@@ -15,3 +15,7 @@ / {
 &sdhc {
 	status = "okay";
 };
+
+&sdhc_ice {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
index 94269c9c8d6f..a4091fd0c1ea 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -35,6 +35,7 @@ cpu0: cpu@0 {
 			reg = <0x0>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
+			cpu-idle-states = <&little_cpu_sleep_0>;
 
 			l2_0: l2-cache {
 				compatible = "cache";
@@ -56,6 +57,7 @@ cpu1: cpu@100 {
 			reg = <0x100>;
 			enable-method = "psci";
 			next-level-cache = <&l2_100>;
+			cpu-idle-states = <&little_cpu_sleep_0>;
 
 			l2_100: l2-cache {
 				compatible = "cache";
@@ -70,6 +72,7 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			reg = <0x200>;
 			enable-method = "psci";
+			cpu-idle-states = <&little_cpu_sleep_0>;
 
 			l2_200: l2-cache {
 				compatible = "cache";
@@ -84,6 +87,7 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a55";
 			reg = <0x300>;
 			enable-method = "psci";
+			cpu-idle-states = <&little_cpu_sleep_0>;
 
 			l2_300: l2-cache {
 				compatible = "cache";
@@ -99,6 +103,7 @@ cpu4: cpu@400 {
 			reg = <0x400>;
 			enable-method = "psci";
 			next-level-cache = <&l2_400>;
+			cpu-idle-states = <&big_cpu_sleep_0>;
 
 			l2_400: l2-cache {
 				compatible = "cache";
@@ -131,6 +136,30 @@ core4 {
 				};
 			};
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			little_cpu_sleep_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <549>;
+				exit-latency-us = <901>;
+				min-residency-us = <1774>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_0: cpu-sleep-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <523>;
+				exit-latency-us = <1244>;
+				min-residency-us = <2207>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	firmware {
@@ -141,6 +170,7 @@ optee {
 
 		scm {
 			compatible = "qcom,scm-ipq9650", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x24100>;
 		};
 	};
 
@@ -160,6 +190,12 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster1>;
 	};
 
+	pmu-dsu {
+		compatible = "arm,dsu-pmu";
+		interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING 0>;
+		cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>, <&cpu4>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -194,6 +230,30 @@ optee@8a680000 {
 		};
 	};
 
+	i2c_opp_table_32mhz: opp-table-i2c32mhz {
+		compatible = "operating-points-v2";
+
+		opp-32000000 {
+			opp-hz = /bits/ 64 <32000000>;
+		};
+	};
+
+	sdhc_opp_table_300mhz: opp-table-300mhz {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+		};
+	};
+
+	spi_opp_table_50mhz: opp-table-spi50mhz {
+		compatible = "operating-points-v2";
+
+		opp-50000000 {
+			opp-hz = /bits/ 64 <50000000>;
+		};
+	};
+
 	soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -210,6 +270,61 @@ refgen_pcie: regulator@6c000 {
 				      "hclk";
 		};
 
+		qusb_phy_1: phy@71000 {
+			compatible = "qcom,ipq9650-usb-hs-phy";
+			reg = <0x0 0x00071000 0x0 0x114>;
+			#phy-cells = <0>;
+
+			clocks = <&xo_board>;
+			clock-names = "ref";
+
+			qcom,pre-emphasis-amplitude-bp = <10000>;
+
+			resets = <&gcc GCC_QUSB2_1_PHY_BCR>;
+
+			status = "disabled";
+		};
+
+		qusb_phy_0: phy@7b000 {
+			compatible = "qcom,ipq9650-usb-hs-phy";
+			reg = <0x0 0x0007b000 0x0 0x114>;
+			#phy-cells = <0>;
+
+			clocks = <&xo_board>;
+			clock-names = "ref";
+
+			qcom,pre-emphasis-amplitude-bp = <10000>;
+
+			resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
+
+			status = "disabled";
+		};
+
+		ssphy_0: phy@7d000 {
+			compatible = "qcom,ipq9650-qmp-usb3-phy";
+			reg = <0x0 0x0007d000 0x0 0xa00>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_USB0_AUX_CLK>,
+				 <&xo_board>,
+				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB0_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+
+			resets = <&gcc GCC_USB0_PHY_BCR>,
+				 <&gcc GCC_USB3PHY_0_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
+
+			#clock-cells = <0>;
+			clock-output-names = "usb0_pipe_clk";
+
+			status = "disabled";
+		};
+
 		pcie0_phy: phy@84000 {
 			compatible = "qcom,ipq9650-qmp-gen3x1-pcie-phy";
 			reg = <0x0 0x00084000 0x0 0x1000>;
@@ -376,7 +491,7 @@ gcc: clock-controller@1800000 {
 				 <&pcie2_phy>,
 				 <&pcie3_phy>,
 				 <&pcie4_phy>,
-				 <0>,
+				 <&ssphy_0>,
 				 <0>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -389,6 +504,11 @@ tcsr_mutex: hwlock@1917000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: syscon@1938000 {
+			compatible = "qcom,tcsr-ipq9650", "syscon";
+			reg = <0x0 0x01938000 0x0 0x36000>;
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;
@@ -399,6 +519,84 @@ qupv3: geniqup@1ac0000 {
 			#size-cells = <2>;
 			ranges;
 
+			spi0: spi@1a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a80000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH 0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
+				operating-points-v2 = <&spi_opp_table_50mhz>;
+
+				status = "disabled";
+			};
+
+			i2c0: i2c@1a84000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a84000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE1_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH 0>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE1_CLK>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+
+				status = "disabled";
+			};
+
+			i2c1: i2c@1a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a88000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE2_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE2_CLK>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+
+				status = "disabled";
+			};
+
+			i2c2: i2c@1a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a8c000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE3_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH 0>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE3_CLK>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+
+				status = "disabled";
+			};
+
+			i2c3: i2c@1a90000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a90000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH 0>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+
+				status = "disabled";
+			};
+
+			spi1: spi@1a94000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a94000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH 0>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
+				operating-points-v2 = <&spi_opp_table_50mhz>;
+
+				status = "disabled";
+			};
+
 			uart1: serial@1a98000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0x0 0x01a98000 0x0 0x4000>;
@@ -408,6 +606,75 @@ uart1: serial@1a98000 {
 
 				status = "disabled";
 			};
+
+			i2c4: i2c@1a9c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a9c000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE7_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE7_CLK>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+
+				status = "disabled";
+			};
+		};
+
+		system-cache-controller@4000000 {
+			compatible = "qcom,ipq9650-llcc";
+			reg = <0x0 0x04000000 0x0 0x200000>;
+			reg-names = "llcc0_base";
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
+		usb2: usb@1e00000 {
+			compatible = "qcom,ipq9650-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x01e00000 0x0 0x200000>;
+
+			clocks = <&gcc GCC_SNOC_USB_CLK>,
+				 <&gcc GCC_USB1_MASTER_CLK>,
+				 <&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB1_SLEEP_CLK>,
+				 <&gcc GCC_USB1_MOCK_UTMI_CLK>;
+
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB1_MASTER_CLK>,
+					  <&gcc GCC_USB1_MOCK_UTMI_CLK>;
+			assigned-clock-rates = <200000000>,
+					       <24000000>;
+
+			interrupts-extended = <&intc GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+
+			phys = <&qusb_phy_1>;
+			phy-names = "usb2-phy";
+
+			resets = <&gcc GCC_USB1_BCR>;
+
+			qcom,select-utmi-as-pipe-clk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,is-utmi-l1-suspend;
+			tx-fifo-resize;
+
+			maximum-speed = "high-speed";
+
+			status = "disabled";
 		};
 
 		sdhc: mmc@7804000 {
@@ -429,6 +696,102 @@ sdhc: mmc@7804000 {
 				      "core",
 				      "xo";
 			non-removable;
+			qcom,ice = <&sdhc_ice>;
+			operating-points-v2 = <&sdhc_opp_table_300mhz>;
+			supports-cqe;
+
+			status = "disabled";
+		};
+
+		sdhc_ice: crypto@7808000 {
+			compatible = "qcom,ipq9650-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x07808000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+
+			status = "disabled";
+		};
+
+		qpic_bam: dma-controller@7984000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x0 0x7984000 0x0 0x1c000>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&gcc GCC_QPIC_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+		};
+
+		qpic_nand: spi@79b0000 {
+			compatible = "qcom,ipq9650-snand", "qcom,ipq9574-snand";
+			reg = <0x0 0x79b0000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&gcc GCC_QPIC_CLK>,
+				 <&gcc GCC_QPIC_AHB_CLK>,
+				 <&gcc GCC_QPIC_IO_MACRO_CLK>;
+			clock-names = "core",
+				      "aon",
+				      "iom";
+
+			dmas = <&qpic_bam 0>,
+			       <&qpic_bam 1>,
+			       <&qpic_bam 2>;
+			dma-names = "tx",
+				    "rx",
+				    "cmd";
+
+			status = "disabled";
+		};
+
+		usb3: usb@8a00000 {
+			compatible = "qcom,ipq9650-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x08a00000 0x0 0x200000>;
+
+			clocks = <&gcc GCC_SNOC_USB_CLK>,
+				 <&gcc GCC_USB0_MASTER_CLK>,
+				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB0_SLEEP_CLK>,
+				 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
+
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB0_MASTER_CLK>,
+					  <&gcc GCC_USB0_MOCK_UTMI_CLK>;
+			assigned-clock-rates = <200000000>,
+					       <24000000>;
+
+			interrupts-extended = <&intc GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+
+			phys = <&qusb_phy_0>,
+			       <&ssphy_0>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+
+			resets = <&gcc GCC_USB_BCR>;
+
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,is-utmi-l1-suspend;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			tx-fifo-resize;
 
 			status = "disabled";
 		};
@@ -528,6 +891,50 @@ frame@f42d000 {
 			};
 		};
 
+		iommu@15000000 {
+			compatible = "qcom,ipq9650-smmu-500",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
+			reg = <0x0 0x15000000 0x0 0x40000>;
+
+			interrupts = <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 541 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 542 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 545 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 547 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 548 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 549 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 552 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 553 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 554 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 555 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 556 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 557 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 558 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 559 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 560 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 561 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+		};
+
 		pcie3: pcie@30000000 {
 			compatible = "qcom,pcie-ipq9650", "qcom,pcie-ipq9574";
 			reg = <0x0 0x30000000 0x0 0xf1d>,

-- 
2.34.1

