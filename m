Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795411412;
	b=Qyby/jnbH3tJFChq3yiC9vK0eA0pry6AoNIui9aDPm/wq0tcuuLb5UOVk4KQwr7+71Yo
	 9KlLkX6mMiPt9QKX6NBfplquq3LvEeyLMISAbvenH1xOk8Ij6pUM9a/UKcD8bAmVoKJ3A
	 iBueUddpWyU8itmDzOPoYEEIFGbHrDm+LA9yzxRAO6jWAW7D5m/qVq2q+AIuOpMUt55S8
	 NqkuwRXjH+3SZWPzP8eOKuBxyoh0SvbholYvPdZxCYRbJSKmXd2Wlb6WKesdZU02fksNq
	 isk4IcCSRaR3ZDfdo1fhzRYghl/TVfbYD0xeAY66JPNk/h29YDVLWAVB9gIHMUSpfKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795411412;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9w0kS6xH+7QM2gGLDTZwoAlJkPaDu+LTByXnQi6L+R0=;
	b=GVeSo7iJQk+KrtjkNHhg059EbC6kKu/n6hnC/swtMqaZ/X5AYipmRyepppqKx6Uc+E23
	 Jz6UKLU9eWskc/z105UmOTkxfKYOlDhc+cUKQP6WuqM/aSgQWpFlZu87xu7p4uRL6xL1+
	 YC8WouWCRQ+d8HSjJEQDv1VaeSHwK1DOStZ5IHfD3Czq6ck4t3seGqTfKYZxI0QgW/lgA
	 ewEpd8Q7mGUnUxgrDyTqkOvCS7FOGjZDdk3cR17+N+zhknT0UQy4qgYpl+P7IzQI4sKaV
	 FBiSyS7Xp00YxuzW8I8DJYa/SOrNiJ1RUP6rbHouVj73AfmazYULvsv6qP5ciEwilbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YS40pk6U;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jtTDn0Y+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC0E606A320
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEC0E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YS40pk6U;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jtTDn0Y+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN515ap1333051
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9w0kS6xH+7QM2gGLDTZwoA
	lJkPaDu+LTByXnQi6L+R0=; b=YS40pk6Uh73JBHIBwFcjH05ybkb/IZVv2AuuIo
	KvrkqGb7CO+zqW16k68S6KZMg4nQ0RbUQ04+funhF/FyvYTzfP3zo3lssfe/sppO
	BWGqzf32ZiIBebcx45G8Gacdoht9JkLeQLFmZ9Z/wnBTunJOI+y2QiSM8V5m3SgX
	hQpwze3uhJlHfF0ivxdao/qiIzu38cD+UlaND25+c8jeDXK1SQdapH+LjpW2zHHO
	kuTXSe8HUjApk52t9RpO3SVh8Kr/raSwzDqx9UosK2dBXIhS/yYl9p3TgeKMtqxu
	zUlM4QWlPsVVHKUGk7npJiGJqEAlY2Tm/PaINybGb63YOpPA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu590n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:23:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so2843877a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795411410; x=1796016210; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9w0kS6xH+7QM2gGLDTZwoAlJkPaDu+LTByXnQi6L+R0=;
        b=jtTDn0Y+CgUh+L2u8lSIpKGYpHOxI2yWHg+wjyfqJRdX0CLMZvl3u3HMBD4fHyMUG2
         JY1UfznrROZOp/n8C45xeNAimRmQQhi1hJA/heAguNHwIa7UsTtFJoWxxGalumAVgskm
         9Iw3/xgkGI2VVHPQP3AZHtJXHoplkaaiWMjWZB4PFBTJRrJ/QcineuLQDaQKs5YRCdp/
         oXHKDFTpxah92Hxxke+DoMcF5SBy/2+8ge5EPSgbXkPScJJ11rBkkGTZeT05a/wUaQ9T
         fHcWSmCn8kCXxeYVsufPSWK+hZIkwWT+fMzwKNM+Hg3hiy6QGFP83HqAV1rhzZDIgTeI
         A+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411410; x=1796016210;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9w0kS6xH+7QM2gGLDTZwoAlJkPaDu+LTByXnQi6L+R0=;
        b=N2wY2CubaQ7yFRK1avKIYK+mNB+D3qoOPGdVy+qRxEG0qt04kLNJwSDeJv3SsyprfP
         w2uhdRFGk9L1+HrV9Ks6OFVaFN4VVDJZ0Kgat5V5RHrFWl/IMMx8Kh1mVVKKI7k2ripZ
         cjFEGhKrHFDKjMZLcAxA4wuDnqXT82ubHT3Y6BcS1+Wt1hIzunUtT9kpRbWEyeaax2ur
         VP7L7zzu3iI+0eL40RDpa8rHa35G9odXP6H3qw7f3opSNzv8bQoMlLYc0MYMov9h3jYC
         ooG4eAFCtRyIWJYxd6WplTxVwHYbi8tyGRM7fOBYUMzRhJ1GeHVkYRaP4HUOAh4iE6VK
         ClSw==
X-Forwarded-Encrypted: i=1; AL+hErGEwQkpOqNI8VCtsiHyXGpo6Q2ljQjnerJDxOBLJ0SSV0Uhs5zZcmF4Cp67Z9OBnwGnEpFcIbzBJUYXyUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4cnYt31wlpKCZn+ypnW9dISAstyEI/MGCPR5VnWH0eHnDgbEZ
	GH5MDvYr9ye6DM8FSMXq1qg/McBlWGFhxRyNl6rLJ5XL74Q3DjWGEddVJy8bzptHgStpT/OXLa5
	+a0cTmsVYd6cNwW+B9LP2uvwKUTWEut7OVHVG5mCitV+OlgbFHPbSJUDlyDxRbu5rsKM=
X-Gm-Gg: AZFdTZfIL2aQbTLc+dNRvMGghyA7xupsitDoopzWosfCFgzcMaGUlpnje1du5vTJOst
	z64ZituggqXoP38KkLnl5UEntG6YcRzq6H9A53bjXXkW4K9cVZG81hBqlkaufgPcC7yJVwnB9gP
	+elNVf3buXV5WEWTupqj6adAsSHXgPzLhEtdafI4dR1T9iWO2XoJX7h/AThex8e4psy6lS3GieU
	7wXAJteAtvEh8i3op2cJWH5+Uztv+QKdjMnMC8dbukOdrqf1J1VQRS57zagRv4LODVQQ3Vn5ay4
	8ImrjH/Vo/otXwzWtmy2Lto5ITCT/Hr1Lhmq/hcPtASrcj45X9X0vy9b0fYiEL/us2Fx3AOCFDC
	GBK/sB6C/XBbZrXXWopFu0PCKpCmMLs6PiR0ZFrQVVjD9JCzD4nwbqbX/NklHJ4nWuItb4i0dat
	slF0gVo+NldOQ=
X-Received: by 2002:a05:6372:a810:b0:3e0:c5c9:d55e with SMTP id adf61e73a8af0-4014e45acd4mr8410419637.63.1795411409611;
        Sun, 22 Nov 2026 21:23:29 -0800 (PST)
X-Received: by 2002:a05:6372:a810:b0:3e0:c5c9:d55e with SMTP id adf61e73a8af0-4014e45acd4mr8410411637.63.1795411409157;
        Sun, 22 Nov 2026 21:23:29 -0800 (PST)
Received: from hu-praspras-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0285c3sm4529722a12.20.2026.11.22.21.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:23:28 -0800 (PST)
From: Prashanth Reddy Baddam <prashanth.baddam@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:53:09 +0530
Subject: [PATCH v3] arm64: dts: qcom: monza: add Precision AD HAT overlay
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
Message-Id: <20261123-ventuno-q-precision-hat-v3-1-fb96fd6b7887@qti.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL3NA2sC/yWMSw6EIBAFr2J6bSciOn6uYmYB2KPtAhXQTGK8u
 6jLyntVB3hyTB7a5ABHO3uebQSZJmBGZQdC7iNDnuUfIUSNO9mw2RlXXByZ54+jCqgqoXVZFo2
 UBUQ7rj/+P+Xu+7Lf9EQm3Dk4zwsTf0ilewAAAA==
X-Change-ID: 20261118-ventuno-q-precision-hat-a71bb5549334
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prashanth Reddy Baddam <prashanth.baddam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795411405; l=2436;
 i=praspras@qti.qualcomm.com; h=from:subject:message-id;
 bh=kX5jXM8Wi8BGEcrpSf3GrKxJAMLU+T6byv8vV8CjzZc=;
 b=HS+Tx6C7ukcclAE8ELmUGgMa0uHqtIZgYfaO9sXEUELAoercDpCfQuQbIAvshAt8YCgMaQWjY
 /ogFhjO0gwLBhjW/FapfW3EhO/u6E/dcC2TcbJqF6EcF0SebuLllIFK
X-Developer-Key: i=praspras@qti.qualcomm.com; a=ed25519;
 pk=/ijBZ6n56uOR5csC/Wwn44VzFw78aZoHlepuCmrOY2g=
X-Proofpoint-GUID: NPqArF3djJxozmMWwTGps15Wc4opW7Cw
X-Proofpoint-ORIG-GUID: NPqArF3djJxozmMWwTGps15Wc4opW7Cw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMSBTYWx0ZWRfX975THAcCv9yU
 wU18iBxdFWYm18Pf9gFCztQkkkOmv+CzcPeFePT43A1f7dALea+dQT9OLHX9FEwvOWfWbNV09Pk
 BfQB9Unu36/TVLgpLSmNYlXXdZ8YIXmEN8p0ZfZRDJnJWHLDz96s6kT6Fci5U7x1oYy9ciBUMwz
 8r5fm2JEAckl3vjs/yEAD9wUcWCkbAOPUQ4Ua71ZV0niFZfJaR28dIUfjcw0Ob4G2x0wy9BdJhC
 0A0p4fQURYRCOXFQsAusiB4OmPc6I1n9qXWogVu7LjJ9jdsaU9kaJ4KltHN9iJsx48zES9HQ9hd
 W85B9EfabL+9E3uN4QjvIMnIGwr6fsJRYOoN13HctvyR/bcOMFolRPoyiLDjvLmXP0vyGXSeJL+
 DsdfWfhY3MFSyX1P1qTr1Nnj13Ve86ek1l03GSj5rAL+rBqjMmDH9v+2virIwBs0uxfZYhBFCq3
 jsFnDYrSPWSPQsC2diw==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b03cdd2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=txfNvoKIHXZbme2c1SsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMSBTYWx0ZWRfXxknUHvsEYLXg
 3UDyb9iJYE4KXJdhGLuhnHLgRpu0ch6/HkjKXw5hJkm4NcGXrvi5ltthJMOUnJ7yIkQ+IoE/CLI
 vlQ4FgEz0cBYjsp7zfxO8bIiMwq26VE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230021

Add a device tree overlay for the Waveshare High-Precision AD HAT,
based on the ADS1263, connected to the Monza 40-pin JHAT connector.

Configure SPI3 chip select 0 with TLMM GPIO90 as an active-low chip
select. Set the maximum SPI clock frequency to 8 MHz and select SPI
mode 1 for communication with the HAT through spidev.

Signed-off-by: Prashanth Reddy Baddam <prashanth.baddam@oss.qualcomm.com>
---
- Added overlay build entry and base DTB bundle in arch/arm64/boot/dts/qcom/Makefile.
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +++
 .../qcom/monaco-arduino-monza-precision-hat.dtso   | 24 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..bdc455cfb388 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -93,6 +93,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 
+monaco-arduino-monza-precision-hat-dtbs := monaco-arduino-monza.dtb monaco-arduino-monza-precision-hat.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-arduino-monza-precision-hat.dtb
+
 monaco-evk-camera-imx577-dtbs	:= monaco-evk.dtb monaco-evk-camera-imx577.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-camera-imx577.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-precision-hat.dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-precision-hat.dtso
new file mode 100644
index 000000000000..e50b0c956057
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-precision-hat.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Device tree overlay for the Waveshare High-Precision AD HAT (ADS1263)
+ * connected to the Monza 40-pin JHAT connector.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&spi3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cs-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+	spidev@0 {
+		compatible = "rohm,dh2228fv";
+		reg = <0>;
+		spi-max-frequency = <8000000>;
+		spi-cpha;
+	};
+};

---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-ventuno-q-precision-hat-a71bb5549334

Best regards,
--  
Prashanth Reddy Baddam <praspras@qti.qualcomm.com>

