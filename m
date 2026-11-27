Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768168;
	b=StqodHF4loXdWctTNiCJDog+XG9HK/+hQetCOQ0XLyEDwYwu7vIQyn3Z8VY5eFUoM9S8
	 Gw5fSf52EheeucEUZR004mmm9uOkVpjo1FcxRUCxa0qvjlFGPA3IDy6tUxGSUph4OSO+M
	 FDcJ7S9lKRSVB+fyLnKIEmV7a+wV7lYA0qJlca0ARXHquJ5+LoDoW5aZVZvbbzAkFaoCt
	 5ankiz0sR2qmbar4eXNL/fwTfZQDh1Mfkbab4H3xUOXGZN3ooEjnzmIGrs1icJFEuwpoF
	 b3ELiLjHpx2WJUbnYtbjqy2qOupk/Lpifiyl2yWTqmtwsNCZosk3u4etMVlY36JQwMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768168;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X1MryZQPPIOWhtdOUPODeTtX1ZYwlHKoUiFMMs4CXxA=;
	b=tjSs9q8D2d580Mn8O6tMi9FVcgXgaF2dwzjfo3HBI66Tz7S8FP+hdimY+A0cRRDP7mQP
	 ijzJ8g18BSmeI5u+kK/Kot8nBy3uA9ePW1O75CniYTItVIEiWQlqJwpMmLXMOE6WVN6On
	 TrHM+HvZF5R0SVCVee16barArHncoJ9sZW20+DFA9wxaXjWv2K73Un5b51EWJlPeMY5gy
	 1m6zrlccZCyWZ2vfjwmZBpdzwUW2BiCARZqVOSRP/a6BOadlUYSqQ/F+6ZlupGeZAbcwd
	 DILPFrbRkEDFrkko7B9djmcjLa/jyofv2e298k3yxj4NP9pa16OErl41VGYLtETfQug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=enEv4e2G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ImLFtHPl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3525606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3525606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=enEv4e2G;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ImLFtHPl
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GcIo1564733
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X1MryZQPPIOWhtdOUPODeT
	tX1ZYwlHKoUiFMMs4CXxA=; b=enEv4e2GH26Inw4Q57RPSNYnJserxPzJbzHODZ
	DfMXzb2TLIWxuseUGuQtpYr0q6oDbXaJR0xdkusKpc7nj1Vlk2le0Rk94gdJs0sX
	7dCwxMf5hmP53RDrPX4qVeW7a8Jc/5dHBML1NFrdDEqdMH8MqeKDra4V60qv8PPv
	DqjNzIAr3BxexYh2jsetI5k53nJOPP1frtgkaIYZN9jv3QjvAlVkoDyOvWhImWaw
	7OL8z30Y6obpXGW6huaS0i3ey5y+ltrzlGUXFgzGihHouc42617LYhIbCFsogCNr
	vj2m/R5JtCHmGAPx29Qm7wvmVbunqRPlU7cB6VlHF6dVKqXg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74garfuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:29:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5383c05fb2fso65374191cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795768166; x=1796372966; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X1MryZQPPIOWhtdOUPODeTtX1ZYwlHKoUiFMMs4CXxA=;
        b=ImLFtHPlBuEt4ob96qosia+ksMEMnCeQ6kQKRewoYHLZIWKJi131s0oqKoAdrK41Kr
         9W50wxOB1JaEcxU50iIk+ua6tZsK7wrycaAJ3AAFu2VgonvcZf9CdgGcQo05RsFSR2oc
         ibwalMnxk3Nd7Cfetzo6yL4kQGaFojWvo3UWna30u9WoGkNg2bEom3PtCgiJ8Ma8Fpp4
         PlGK216K4ly7hOHUkP8jGWA8SV1eHMyCF8diLngAtoMHA82JS2mcS4/UkL4+yVbOnZvc
         qz1ibIYILVAp1LBKWGvjGW5SWywNQdKc3+I0zazle47DFuUZ2kK48eIjJ6XjT8jT8SMV
         L5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768166; x=1796372966;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=X1MryZQPPIOWhtdOUPODeTtX1ZYwlHKoUiFMMs4CXxA=;
        b=GP1NoEzr+nBIGzvYRlHQM1MvA+rInkohsa7QsyAonfXs6jpEQ959ylN65yFVKXl2lg
         WfJ+7LjQ5NBNwuct6p/PHB1/VvmSWgClr/os9VL0OubrARN+huC7k50uskEklvTKwIt2
         HRIlAP2GDW4xPE/lyrVIiC/QbEiIWb5ZDaId44QvBMgC6zsHx26d4eb9sqUAdKYmd7j3
         FepbOiKnY+G9joxEDkNpCeZjAUi1kQjKYBIPpGJ5YSAbBk/YOXgKHByR6lZh/mjVPTDN
         Xuy9O089qcxYGOS4Ut3ffyhavIKCGSJTaIAK+MCa+Hg5Xc2apQ+nworBJYl/e6DVIFxu
         Kk1Q==
X-Forwarded-Encrypted: i=1; AL+hErHy9i0XP5QmX3td4FhRTvg/oSIZ3AugpHC5nMtzF2uBgztNfDIbJVUua8F/eidrcpTnwGIsnyJgDsqk+ok=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hjo7xpPGPMitHgbtTgEdtjtCylDZblt8Q5JVm0bjws2hmwS29
	8s1a6AMDwhaDaTNwapc3qB9W3QChjxL+Q1UXO1FVXZy+li9jPwDmUDWL9/rlXy1vg6HJxInIeyL
	IBQ5EtJK4FNYsEVXdYBFk5TFEEM7+ZdYUUFEz3xk3pEKmza719rcnAMbzL9eu4mcDi9k=
X-Gm-Gg: AZFdTZcu3Snf6xVODZoiIFxB8vJb2XD7ppUJ9Xz+26tV5uu1ZuK0kbF0F1MZ8r96Saw
	PFW5vFTnks2qhjNJbcw1vKfhodzFzLFn/tj3nVoVota2+56PtpLDvIP+9uN+Z7qIa7EnkkOWtLq
	gQxF/r+GcE+SvOu0UbMMHni3RokODZJcl71xU1u/8clHNzloBPuFsORPgadW1ubsnyq26tCZV4w
	BMdrYlSAyDgU26Gn27ngHKbiNyWpFDX4Z3D9cp3kJJHjg7oYEU65I3uYyX3ODLY8l74rkqpHYax
	I1Ky1+3gjn2/JUrGB5leNxMtAIrxm61MPh3OQXDUHSmVdjIuqFka3ym8GS9yOrWpvuTG/2SbmYR
	MHsqM5E1keNqJ12EPCRpSd2AaOFI1ilhsIFXnQJSReSkTHLbEtlJQqRDF0hape/xdBjUszDyhMu
	3BFV0agAu2tCnRNUpV32voEvthjucFAKJl+8c=
X-Received: by 2002:a05:622a:4c0f:b0:55d:876:8691 with SMTP id d75a77b69052e-55d768a3241mr438792101cf.4.1795768166056;
        Fri, 27 Nov 2026 00:29:26 -0800 (PST)
X-Received: by 2002:a05:622a:4c0f:b0:55d:876:8691 with SMTP id d75a77b69052e-55d768a3241mr438791881cf.4.1795768165674;
        Fri, 27 Nov 2026 00:29:25 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92181384803sm52101256d6.43.2026.11.27.00.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:29:25 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 16:29:14 +0800
Subject: [PATCH] arm64: dts: qcom: talos-evk: Add RPi Touch Display 2
 7-inch overlay
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
Message-Id: <20261127-talos-evk-dsi-7inch-v1-1-2b271186b5d6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFk/CWsC/yWNQQ6DIBBFr2JmXRIcQLRXaVwADnXSqi1Y08R49
 5K6fC/57++QKTFluFY7JNo48zIXqC8VhNHNdxI8FAaU2NQ1WrG655IFbQ8xZBaW5zAK5WvboQ5
 GaoSyfCWK/P1Xb/3Jid6fEl9PCd5lEmGZJl6vVaeVlbrpjPIYvfLRGK8a06I2klw5tkNs0Vnoj
 +MHZ4FA5LEAAAA=
X-Change-ID: 20261127-talos-evk-dsi-7inch-3b17924c5042
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795768162; l=4411;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=x/UmiaqcDwSsrnkS/tNgpYQpoRd1sVPhYyn2o9u0F3s=;
 b=BerOusUmutWiu9tiD2TlyQ+W0JKxVVXV9bwgOLR5MqgkVZhYBFcEmDWSETyQNCPMRWR9pu8UI
 kVYsLnFgBtDApEEZharGPRW/HUu4czz3guM2AXLY5IhhTI6qaSJw5mH
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: tugN1yTee3N2P7EyRsyNpOGtlUz-5n2x
X-Proofpoint-GUID: tugN1yTee3N2P7EyRsyNpOGtlUz-5n2x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzMyBTYWx0ZWRfXwtI55xwHlbdd
 BT5Ue0DhXBjW5EHSLaNJlVS8eSK8Wlo4wj7x0BQeI1mbELnkQ3ovthubWi+3cvAL6RTW/R1kEx2
 sw3BL9LJI4Nl8yhzVJ/IvukwI03zhKbRfl9vn/NoVvQ1yCRb4DjaXnn74g31B7J/T186TlINHB1
 6VyonidI7yX9v+Ml1W/2Ylu+QGFlbSVcsvRT1bby6GdKMJ2uy26GxKY2coaFE9+R15r2MHUOeKR
 XzqheYEWgqsHtrabkEToC6UQHdGj1sVQmWOtF0wg+YTdoNJtmI4IfVwA2ALHA3LldkoqmXwFZJ1
 f049yW0g3cH6pOb5UBCvZJA5q+/bZyACnTlriZPqivDkZg4uDwDawdw6WPaOulzVDdrrtpCL+LT
 CjtOaxrxuwkXvmGu2K9kmOwkmU1Z+wg6vXTAljFqqWAobhvymQeGMnWwyeardef24B84Ecnxr7N
 52C85PcPjXpkK0FNWGA==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b093f66 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=t19j-lEuRoXkQUzpf8MA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzMyBTYWx0ZWRfX2ZfceMD68e/1
 WHPz6JNpYJdnv7hv10cDotzuKT1DWUPxxO3jlnkYwB15lMYL8vJEVbJkK4bXt1wAWH33CHPvQKp
 X6RbATa3GZiOxTv3c6zYsIJLQyo4jX0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270033

Add a DT overlay to connect the Raspberry Pi Touch Display 2 7-inch
(720x1280) panel to DSI0 on the Qualcomm IQ615/QCS615 EVK. It mirrors
the existing 5-inch overlay; only the panel compatible differs.

DSI0 from the SoC is routed through a MIPI DSI switch that must be
selected with carrier-board switch SW7 ON to enable the 22-pin
connector.

The panel is an Ilitek ILI9881C handled by the in-tree
panel-ilitek-ili9881c driver ("raspberrypi,dsi-7inch"). Its power,
reset and backlight are controlled by the MCU on the display board at
i2c1/0x45 through the in-tree "raspberrypi,touchscreen-panel-regulator-v2"
driver. The Goodix GT911 touch controller on the same board shares the
i2c1 bus at 0x5d, with its supply gated by a GPIO on the MCU.

The ADV7535 HDMI bridge is disabled since DSI0 has a single output and
cannot drive both the bridge and the panel.

Tested on the IQ615 EVK: the panel probes and attaches to DSI, the DRM
device is registered, modetest reports the 720x1280 mode as connected,
and display, backlight and touch work.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../boot/dts/qcom/talos-evk-rpi-display-2-7in.dtso | 88 ++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..48b7d604d4d7 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -517,6 +517,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
 talos-evk-rpi-display-2-5in-dtbs	:= \
 	talos-evk.dtb talos-evk-rpi-display-2-5in.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-5in.dtb
+talos-evk-rpi-display-2-7in-dtbs	:= \
+	talos-evk.dtb talos-evk-rpi-display-2-7in.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-7in.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-rpi-display-2-7in.dtso b/arch/arm64/boot/dts/qcom/talos-evk-rpi-display-2-7in.dtso
new file mode 100644
index 000000000000..6e8cae02702d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-rpi-display-2-7in.dtso
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&mcu 0 255 0>;
+	};
+
+	reg_display: regulator-display {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-display";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_dsi_touch: regulator-dsi-touch {
+		compatible = "regulator-fixed";
+		gpio = <&mcu 1 GPIO_ACTIVE_HIGH>;
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <50000>;
+		enable-active-high;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	mcu: gpio@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		AVDD28-supply = <&reg_dsi_touch>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	panel: panel@0 {
+		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+		reg = <0>;
+
+		backlight = <&display_bl>;
+		power-supply = <&reg_display>;
+		reset-gpios = <&mcu 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1>;
+};

---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20261127-talos-evk-dsi-7inch-3b17924c5042

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>

