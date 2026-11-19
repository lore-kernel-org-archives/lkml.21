Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112046;
	b=EzhqyQV3zUsK6OJjR6j3qjPfCdgt9pd5Lpx8uuH9666TvMPLtagMBfL5ztfN8FfPeaDE
	 mtRh53fGnR7F0h1DgXEnLuzyJFC87xY+jLP7ZOXQj70vJGrPb2QINixqybQJw+2ZSNHot
	 i0o8crmJboVj2JrizWdkkBAVndScEr9RmLsY6G4YhinCYRS8F0UR2XRMCNkk9+7gsgbUe
	 sSbVhAEeoIoRYGyp+ooC9MgclVjp7FLzFwKIb/kfkGT2s4IeuBEN6H8L9LbFnbsFJTITT
	 Pn8CxWeUFb3dWRdBVIv19ZIcvLJotQoqfQlFN45Y8fQanTtZO9927h1c8wLcrKfKC5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RDf5fdxVFMmXXR9kDYGrHbNYwMq/wZELirJuHE5RruE=;
	b=cmX45OaLXZRwWi7yEGkgj8/VZnnFCZmewjS3W8HyXuspxd/J4I4XNC/1ByyaJ0AifhcP
	 W82ACM+vj5vyJ2n9dw8sFbin7jRaMxkM3AH8yAYDaIidGLMG5l1RUAarOnivdKPnYfviQ
	 FvSrGQS8dLiKkxjtsVaMIu6+jrmqHhlJqztuZ0N2yHLSyE6v1A/ivlH4NfsChJ7MkHgEt
	 Mg9nBB4XG9O7Zg9CYPhiJxivlFrTuFEGl47AEk1vyIdhqU7EIkKXCvnKD9QOKqaehtOB/
	 o/H1Isn9keszMvpS02Zgpz3l0NZ+WhStRi3wZOskmRwpBy6evRUgzwgW4wez/47X1ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YhV7AfcL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kPU7jrc2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E22606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95E22606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YhV7AfcL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kPU7jrc2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJI0ZBm3054481
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RDf5fdxVFMm
	XXR9kDYGrHbNYwMq/wZELirJuHE5RruE=; b=YhV7AfcLvYe7MNffEXW+q448bAt
	ac3SkrsEGtk/t/0njuriT1rm0QqqpoxD2XRHwPv2jaZJQS76VmrvGNvWE4YfdAvW
	sOlMnd3jdbn0kEUdGeMSsdWNVnwjw6ylG+V6+Ga8VyvK3G5AGc10RDHhFdLOg2KU
	6KE62pYgM/EOlyvC+UBRaZbPAB3jM0VzebP3YU+x9HuO6dbnRbfG1iLGgi+pNu2n
	WB9Zgp2X5UabEC9wucXLJsCdz3jcCL+Z8lyVoYTJKTBkP/TM8VhuSogdB/rnfD0N
	4kV6yOJiWweudav/vjZE784N0icrrigpqfjNWHKeex3qtsF1GEJnR9qQtRA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uuxb796-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:14:04 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b29df78132so30183c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795112043; x=1795716843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RDf5fdxVFMmXXR9kDYGrHbNYwMq/wZELirJuHE5RruE=;
        b=kPU7jrc2wtaDqt+GchX68YU0LpdiOtjh6B1I5DzbVgd+zwGf+2P07ieo8MiFpK9B9G
         w5R9W/0PkCvEAm62n3SAGv150pOkfagxWzr8aG47fFKbxK7Kly3/rRg9OKo8JjxVWqpB
         4M8ZaI//qnIIPF8iDvc6efgNe/mVAEWDcQKW1pLf4qi8C58r6vnd+I5fOq2LR8o757Rx
         v9MXHSAr11hLv9fUNgA5wafjwf+vGdVl6iNYn66BXR8jrrEzPpZBlAxNlET8IsbKTTSJ
         01IcbOA+JHPtXM4cILHKl9LtGQ+87k05sP+X78NhxryXBbZNdClld7dARfwVu1eHQH5E
         XH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795112043; x=1795716843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RDf5fdxVFMmXXR9kDYGrHbNYwMq/wZELirJuHE5RruE=;
        b=WK8TqehBtElm+ssL1OD7OL7cA8/JMoKt0SlxpSARliJ2RrefZ9chldtmjLupfx3+ml
         Sx1JcI/qMnmTM5pdsix/loCe+4cDTLETBELMTFQjm3cRFrq+V+XfCvwsoqZMC6JuNFcv
         ttVJ61laHsQiQemQdCTFo9w4H2d7ADT8FWKhvx+8W3rygx0jCfvi1JrhvEDlK/Y4LmwU
         Py3RfKeA/IAzSWI3Vt6WmzRSQHeENrWbj7DhuKg0RW6xrxCVSljHmcHmIpcxkzC2QGwt
         cmvSxaU7M3Qiaw/ZLcwBxHYz4WvaSSyidJPf9PDnTfIsi/ZMZoXIHy1dMo7ODa+4ablv
         Nxyw==
X-Gm-Message-State: APuU4Z/qHq2UY4k6BL8b/xazrILWV2/cBNNfiCupZv2cU7+OeRsFr5sI
	GgwUzT0sfL9Ce9OhrKdL6fR1bq2AT7gy5k7bfAiFvI53JNVBjU9+Qrkzi+pgP0U97wkR3zIxCVB
	x2fEMRfzfXzfOFN9AgAJOvGckS+ZCqaoPq8nOW06ba7wR2DHee5OGXSa+36vAgkFa3/o=
X-Gm-Gg: AYBFou3AeA27Yebzt0912+isSk4ESubL4QMan0YllUX9g5yyGro5ELCHq5iCcNdx66P
	Ln1D9U8H1T/oS6rdBVVQrqFruM7DbH8wB7ijXjnT/FgLxLTsXIru0ehYK+4rBRrq9Cr8RFNHSOL
	1BIM7jYJbI8PW6n1NFxj4lX+eUKw60z8lzNubFbBm58+9ZNkcNZzyWrsx6mOHVTYWeZLnpSQYbx
	wpjGxi8SXfsSjXBFctq9CJmDnGwHNVBAD7QdZ/AUqIi4b11ndYL+0PmNb+LNVPccgN82Ep8j9qQ
	1FHOuzB0+8zZowtwaijhYFa6vkG+NlJmoIpkY5o0sY46+mThVPnJ2oNA5dx7vRWmlHs651LHK9e
	OhGUow+FJX6J94GZHCuoAm2g6tB/W86w3fDCFgjsoAtZhv+HhHZfjRBDUk/2/y4VtKJ9aan6Z3u
	LABw==
X-Received: by 2002:a05:7022:3f07:b0:1a9:cad6:5b58 with SMTP id a92af1059eb24-1b55693c483mr353329c88.39.1795112043303;
        Thu, 19 Nov 2026 10:14:03 -0800 (PST)
X-Received: by 2002:a05:7022:3f07:b0:1a9:cad6:5b58 with SMTP id a92af1059eb24-1b55693c483mr353313c88.39.1795112042713;
        Thu, 19 Nov 2026 10:14:02 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm793548c88.3.2026.11.19.10.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:14:02 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: lemans-draco-evk: Wire up CYPD6129 USB Type-C ports
Date: Thu, 19 Nov 2026 23:43:49 +0530
Message-ID: <20261119181349.2017404-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119181349.2017404-1-akash.kumar@oss.qualcomm.com>
References: <20261119181349.2017404-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: PYD21vm5mY1TiPN7KwAcn6T3xha_QOpL
X-Proofpoint-GUID: PYD21vm5mY1TiPN7KwAcn6T3xha_QOpL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA3MiBTYWx0ZWRfX1zn4Tr53vsKP
 NLWhzrCxzeytDlHEqPhwWMAcfng5z4gjZt3H153NrtpmwX5vyRQoWCXJcQLDyUfM8ueSDU8xuKc
 CCv5Bd0vA6PcWJLDWX00h18gVHv3jrY=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6aff3c6c cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=N0a5BPbhDuVZEP_7cpEA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA3MiBTYWx0ZWRfX3KXQayKzkt7G
 wouY2gA0Q2y59sJo5gljQbTgwtDG0KfLk2gg4P5rMdAs7b7mg87loWZxOi+TIyi0okxUnT4r7pL
 w105JftjTnzzEyY9UTnthJQ1hHpg6gKMwPB9fuNMW9iatAxfUZuRxTVayjQFg6aFJyNRESk7FIB
 wvtVxqZoy8BDK0KhwDCliA5StlaEPls6KiTdPePfk10fUlCXUb7FJr/TBqE7mSX1y+GTgN81Zj6
 prZCUYPxCzTvwQSodq5pChDyTPz8H4FWxaBrhpZhgjtitC0ofpApgaaMrYL94/xUcEYnAeodPmL
 aMhjWbXdivYcSLpAtc0nfOqApcMZNwtOTKNkf/uEAjB2zJD5lfYxBllYys3ylnl5tUJ/EgK9sEX
 jMcQa/nJ0570OuHUl5SbSQnYCpwqZV+nlN6hyL5f6riOKWopSLIwOztnm3iu2hy+1Vdqd3z09f2
 85QGQTI/gz905LbvxCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190072

Add the CYPD6129 UCSI PD controller, reached through a PCA9546 I2C
mux on i2c11, for the two USB Type-C connectors on the Draco EVK
carrier board. Hook up its OF graph connectors to the usb_1 HS/SS
endpoints to drive Type-C role switching and SuperSpeed/HS muxing.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
index 7ac3a867d29a..fe7c676b8035 100644
--- a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
@@ -4,6 +4,7 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pwm/pwm.h>
 #include "lemans-draco-som.dtsi"
 
@@ -351,6 +352,89 @@ queue3 {
 	};
 };
 
+&i2c11 {
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			typec@40 {
+				compatible = "cypress,cypd6229", "cypress,cypd6129";
+				reg = <0x40>;
+				interrupts-extended = <&pmm8654au_2_gpios 5 IRQ_TYPE_LEVEL_LOW>;
+				pinctrl-0 = <&usb0_intr_state>;
+				pinctrl-names = "default";
+				wakeup-source;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				connector@0 {
+					compatible = "usb-c-connector";
+					reg = <0>;
+					label = "USB0-Type-C";
+					data-role = "dual";
+					power-role = "dual";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+							ucsi_ccg_port0_hs: endpoint {
+								remote-endpoint = <&usb_0_dwc3_hs>;
+							};
+						};
+
+						port@1 {
+							reg = <1>;
+							ucsi_ccg_port0_ss: endpoint {
+								remote-endpoint = <&usb_0_dwc3_ss>;
+							};
+						};
+					};
+				};
+
+				connector@1 {
+					compatible = "usb-c-connector";
+					reg = <1>;
+					label = "USB1-Type-C";
+					data-role = "dual";
+					power-role = "dual";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+							ucsi_ccg_port1_hs: endpoint {
+								remote-endpoint = <&usb_1_dwc3_hs>;
+							};
+						};
+
+						port@1 {
+							reg = <1>;
+							ucsi_ccg_port1_ss: endpoint {
+								remote-endpoint = <&usb_1_dwc3_ss>;
+							};
+						};
+					};
+				};
+			};
+		};
+	};
+};
+
 &i2c18 {
 	status = "okay";
 
@@ -636,6 +720,16 @@ pcie@0,1 {
 	};
 };
 
+&pmm8654au_2_gpios {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio5";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
 &qup_i2c4_default {
 	drive-strength = <6>;
 	bias-pull-up;
@@ -776,3 +870,19 @@ uart17_ep: endpoint {
 		};
 	};
 };
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port0_hs>;
+};
+
+&usb_0_dwc3_ss {
+	remote-endpoint = <&ucsi_ccg_port0_ss>;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port1_hs>;
+};
+
+&usb_1_dwc3_ss {
+	remote-endpoint = <&ucsi_ccg_port1_ss>;
+};
-- 
2.43.0

