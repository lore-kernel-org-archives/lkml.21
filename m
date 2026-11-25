Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611297;
	b=l1+EgcXAxXuzkh/a9fBryhOlB2w5NmNobOZmQsFIw8JMgslsknxZnhb8CyofZkRDRRRv
	 RTsk4T+T2wwfVjrqYGCe89eNsYO18VgOc0JKHqUsm3bNU58+yfR8S8cwQHjgcwb1aYgHy
	 +OJ/GFumjsxXSoQugr5g7l58CwVs1blw6ZVRQbLmJ5fwwV/mNkXcRry6AoGAZP0I78pcI
	 6nLYR0MdvQBVyeWktTf7ozTiMPop9YYQGcjUKmSHTCqeum8jSgDM8/s8rKTwDv1WhqHC2
	 3B9GdHrF7GfdO3b0SNzY5ogAYit7wsVlVOCV6uDbMApxSlGN6cXRX84Ue6L7vECjHFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611297;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OIT3LY/NnA77L/6DRiyEURyM+xFwCg00LGKNqW3Vx/k=;
	b=2g9NJKcxovnIh4u+7m4dYM+ViOk4jqcMikSz2FOXjG/7L7MW9fGQWixEnx8pT4rLoavx
	 YliyvC8oAFFIe2O1O5fjTN8DIg2k9kS6urTSWHgoqZQUaozJL0+FbWMFIPJsfWcErM8ur
	 //8HmvZJKCiK7NzsU0sJz7nMFugNT4ACCPwWqS2f7/+V9eNc3fl1dxNRsa09i7w5sTPkf
	 Y4mkP7p0WeKTgMfsI+ciKoJVxga7LVz6OR/603X5OIXGK2DKfRMKh+0ZlG1NlU1jBmvfZ
	 lrH2rpqJRgW8yx5JGuk6n3gNoes/7vEDXEZf4J+B1Mra/baqKqlTZz8VxVM1ZqHbTcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHEwGN+i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ijf6gUMK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9246D606A335
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9246D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHEwGN+i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ijf6gUMK
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mT6m2356729
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIT3LY/NnA77L/6DRiyEURyM+xFwCg00LGKNqW3Vx/k=; b=jHEwGN+imaVLuIM7
	RTyc7knKXnMGosalgXSIcs6sABQ6f+v8JqLqjxsWe2VaPujdmV6F2IQuTPfDvQma
	zhALd1ZCDuRCUJ4bTxbDBini0EDYPTSt47UuLYAzMubFBpd/89Jayy7X7E0Og+xz
	DQnqIRplI2jhfReki0E9fSn9UkBFze20gv2phZLfwFgX33bedtbHkrtn1M//GBI4
	FnB9sAnb0oTWo75mZry6+qgB743qbDMrZNUqVrzDsnkCr7o/WJ7fOC3O6eNrEb3R
	EfO8ZfxgLES89sIw1UGMgJdR8b94BGYtx6CxbaufhJGHb4oInTQY1oFTttnkhw6e
	OzVlrQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6akn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:54:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f01caa8ab9so6289405ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795611295; x=1796216095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OIT3LY/NnA77L/6DRiyEURyM+xFwCg00LGKNqW3Vx/k=;
        b=ijf6gUMKWDUZxQt79XUV2U2Nshn18jJvu09lm1hnBUFBAzT/c0O0FBYQ+h81TlUq8A
         3jCx9IMjykmg/ju7P9+isDPc/FAFz6DGj9T9WcOguhNd2jMEiYuEgMJmAvDA22Lfe8eE
         azt8UJkBsq8X7isDcssh9/EzAD0+bzOy7dV1Q9MOqk6+L2z4GUmRkc5qChHMrsLWfieo
         caolKpufIIK1LHKslywjBOH8jOHop66lwB2+Rn5hSwTuVZJ1jpjqPioiCP+AeNLyB/P0
         Be6Zlnx3IgbbCLZwCKg+jZJ7KxBJJqxHeFv0HrnhV57n1QJLcYHA352gdTb6VI3+T7Ng
         Vxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611295; x=1796216095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OIT3LY/NnA77L/6DRiyEURyM+xFwCg00LGKNqW3Vx/k=;
        b=KfjABjJ9QBj3nKun75Kq0ojIn+2xx6xVF8C7AjTVCrthxe1kXXd2Cjngdb8XWEe6Ag
         9DyKg6q3ImOJMAh1Y4VM5gBVc7WkkVfZc+86s/0lBJ/otfpy4g6338Tw5UiB3pIEHEqD
         CqRCLlv+TbnTZtNRJcK1vQ0A6SotvqGEi5SrlyWrPaPvAaUP9Q7FE18TGFNOPT4uv3tJ
         V9R9JJoZFeux4/J0747He5NRwbdSVkzd1PlGAhNXB/OmwqJVnOiNF1iUP6GE/8K2AAAP
         yaZgqHXRWcX2OPTF0QjoskksIKLV48rKbutSywEQl4+mVN7nckhDPxYUZn+QPJs5fgX6
         uAJg==
X-Forwarded-Encrypted: i=1; AL+hErGn3X/DKO5Tf0DbhQDsRGRURcX1IX10d+KGwmDbluvUtKcxg2peXvE2jLMfxEsLzADNBccfvqzXEaj7ITA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q93BxMaXXbaTYZutjMI2BPeJDSPkjO3ceVJmZZi4HPNB40CTP
	uBLqy/UqNW2FL8boJgZk7bu2ve+pYg1e66aqX7LNibt6Ak1VRARzqE7tIOHujtnjfuBekHdFV0V
	WbhdMSeD+HsuMq3dNf8aGNOXs589crLyz8uEw9y0Y4Ngi8hUUw9tjUrwC64bUtPXzW7ksUVVuCT
	I=
X-Gm-Gg: AZFdTZehQUirTBWwAawhKD9HXK0G/ay/2xXGZviY5FHQY/WOWJ+Bkc8TplQdKPR7vyU
	GILzSGWnIOn2HyUWS6RVxcRMLXfuJEB7jQFJ52qmNrREeHRlbX5v1kELubSZueRXKXdnOqzuPCp
	9vxc6g8d/Dzornhyhcgp5bIcR/Z+yi3BiY3FjvC3XiGzjjC8CuYzNgUmo9xNqH2Z2WfY7iHgiwe
	YikjU4OZQ/GEMrOXvpB/Dt4CPjelmk7gEIpl+KR5u5e+8ZvYx1xzF7PGGf6VfnB1YmhnUgTydjj
	Xb0mxWSlPqc6mH7p9FEP+865Cbbj2ZEuwloHSqKrU+v1ALTBZXPjcdiluSEGu15hcT42/e3FeRY
	Qt8Cs8dbmcxX/LWMLWHc4fQ0dNF9P51wCmBOLm97R65qVNTr6k+Vv/H+61DWBXZjCgjBeX7TrJd
	exQLh8ITWoWi+BEY/rOT2sBtogB6//3rX0PS9BCEVnA4Fc90Q2SYOrSdI5QPi9BYtp/pWFRB7vK
	UxIcehG0tyTbhmhlPsgD6f0jWUw
X-Received: by 2002:a17:903:b4f:b0:2dd:b95a:e1db with SMTP id d9443c01a7336-2f03f1c9cd7mr295131125ad.3.1795611295085;
        Wed, 25 Nov 2026 04:54:55 -0800 (PST)
X-Received: by 2002:a17:903:b4f:b0:2dd:b95a:e1db with SMTP id d9443c01a7336-2f03f1c9cd7mr295130595ad.3.1795611294448;
        Wed, 25 Nov 2026 04:54:54 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm31940575ad.45.2026.11.25.04.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:54:54 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:24:27 +0530
Subject: [PATCH 3/5] arm64: dts: qcom: monaco-draco-evk: Add Raspberry Pi
 7" DSI panel overlay
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
Message-Id: <20261125-monaco_display_intf-v1-3-8a27d60b0d94@oss.qualcomm.com>
References: <20261125-monaco_display_intf-v1-0-8a27d60b0d94@oss.qualcomm.com>
In-Reply-To: <20261125-monaco_display_intf-v1-0-8a27d60b0d94@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795611273; l=4084;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=NS+G7kuPoI5kpwYy8h9e04dPJOgLcttGfinqWG0uVlQ=;
 b=hvKx2XYbFNQClyDVj0S1dgMpa5wdjrHTv43YL+DMilg+Rt+JGeMS/0BCPkfwMNv6MSEG3N4EW
 hxRJ+hKYqCrBnGjnr3keTyCJQvU3rvFo78zsEIYIalOB5SeyUIJ/I1P
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: st_Dm8-ABPMc5y_1WpO5Q5lxDokZLrx6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfXwozEFPn72KoZ
 iJnX33VQ5WhrsBgecajI1T9DrujLI3qWUBtvlIm3FIgNAfd0+hEtLPm+hmKKsYuEtR1rKFhbDeo
 Z1l+As+i3KMYESVDtt63jTyl3cUpbxg=
X-Proofpoint-GUID: st_Dm8-ABPMc5y_1WpO5Q5lxDokZLrx6
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06da9f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fr-BqTdB3QoRZjYE0SAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX5K8jKH5ItFAI
 1LrXgTD8NffM4ip6AjWwG7s/gmkabGeCXMkUFoSrNlHtw3FAif/qZBEOUXa3ejqPlcj4y4ScK+d
 fjUIQiE4eWIJquqImmqgcUDRdz5omaqjVJ0jIjkA4Nn+91iWWSsixqq8ny7CV1RbalgfpiM1UPu
 It05MjjOQw7q70ovfERZtOf2ljx+zIXyCKk8FwpCqQhLDLFEUdI/MrbA7cvLJ6XL8JMLONyyFmh
 u0/M9ocmEidp94ToD/28bLlHsK/2IZCp5uO5ZEANP4mXFGbsrEzC/crQgXVzytqg6UvwUIX0AaU
 XGvuzo0EZFSUeK9obA29/G98flJW02UPOKGdVD+HwBUGGoZI1ZqUnxkEnwJSSxJl4p3A9evFAi4
 sHW63OpR0gq02/tkwp/HHDuf+99QhWLA2yT83kpz73tKiECG7RFV7oSGM+bW3wDI0jvgLfK+51d
 rHCoZvwgtdf8Tm1EX/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250051

Add a DT overlay to enable the Raspberry Pi 7" DSI panel connected to
DSI0 on the Monaco Draco EVK, with two DSI lanes. The panel is behind
the Raspberry Pi touchscreen regulator on channel 0 of the I2C mux,
which provides the panel reset GPIO and the PWM backlight. Also add the
Goodix GT911 touch controller on the same channel, with its supply
gated by a GPIO of the touchscreen regulator.

DSI0 is shared with the LT9611UXD HDMI bridge on the base board, so
disable the default HDMI bridge and connector in favour of the
Raspberry Pi 7" panel.

DIPSW2.4 needs to be OFF on the board for this configuration.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../monaco-draco-evk-raspberrypi-dsi-7inch.dtso    | 97 ++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 348ab62ddece..d677d1677f24 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -96,6 +96,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk.dtb
 monaco-draco-evk-dlc0697-dsi-dtbs := monaco-draco-evk.dtb monaco-draco-evk-dlc0697-dsi.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-dlc0697-dsi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-dlc0697-dsi.dtbo
+monaco-draco-evk-raspberrypi-dsi-7inch-dtbs := monaco-draco-evk.dtb monaco-draco-evk-raspberrypi-dsi-7inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-raspberrypi-dsi-7inch.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-raspberrypi-dsi-7inch.dtbo
 
 monaco-draco-evk-el2-dtbs := monaco-draco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/monaco-draco-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..bb646714fe28
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,97 @@
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
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_dsi_panel>;
+		pwms = <&reg_backlight 0 255 0>;
+	};
+
+	reg_dsi_panel: regulator-dsi-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-dsi-panel";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_dsi_touch: regulator-dsi-touch {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&reg_backlight 1 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <50000>;
+		enable-active-high;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c_mux {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	i2c@0 {
+		reg = <0>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reg_backlight: regulator@45 {
+			compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+			reg = <0x45>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#pwm-cells = <3>;
+		};
+
+		touchscreen@5d {
+			compatible = "goodix,gt911";
+			reg = <0x5d>;
+			AVDD28-supply = <&reg_dsi_touch>;
+			touchscreen-size-x = <720>;
+			touchscreen-size-y = <1280>;
+		};
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+		reg = <0>;
+
+		backlight = <&display_bl>;
+		power-supply = <&reg_dsi_panel>;
+		reset-gpios = <&reg_backlight 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&panel0_in>;
+};

-- 
2.34.1

