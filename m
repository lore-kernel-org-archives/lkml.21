Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794937;
	b=bCgpuWbZ4kYfSRzkD+GV3xuhKMlrcgF5lC/mD5sNZiY9vlOBcndxE5CIkYL/kpPOj0uX
	 9e8/qgDTwg1lnYk3nc0pTSoLTBD47s2CetdjXSB1+BuLhVMq8VABBz13+5Z0ZyKr+dUzd
	 tynN7+MX87FG0UuhJFSZ1CiTbIXaMDth8Tn+D5GEc0TuOM8IFTs16yTk9LRGZhHmupOJs
	 s8AHLhQo1AKPXOuQs5Sh1kOLrs2t9lsqZCAul4WsdVjkDkdRzkTpAl6W2Y1Rf8UBHA70M
	 g0qgD8PM9SZTFhLC+PuxvTB3r5wlTcc7AK7HCgfU0j4wdza0L271Cx9ROY2J5bzFA2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794937;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ik5GCeWTPIzUVRrf+QprTbnVoLBztsQDcLvWZygkBIM=;
	b=F3B8ndhm+qqwceSpz+iCJqL2A062K/Bhp5UDzq6gHnQqUuwxh81MR6qQLZv5vusVd9bW
	 y6dapNwo3D+PVogrR4A5MAgiHEWvM06MduZWWRxyA+nKWOMQqcUCK/mO91s5XXiiC32ri
	 +AXLE273Jf6tTGzYCrgxjd5T4SkIqTGqZS1zJjZJ+PpwSoGqmKixpgJgo/LJN4DuvtIkJ
	 XCNeQhdN5wDboXfgF7gLATDsQ0uC2zTPAqiew5uQ/vNwPmd1VOjylBt0QqV9M1pWZalKx
	 dRGlYeABGN7500RJc56FJd58ujWPvxICB30AVkzVFC9kArTHZL/SGkesLi1MF6LFQLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+mkt44w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VabmTIx1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5633D606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5633D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+mkt44w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VabmTIx1
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpDA32925120
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ik5GCeWTPIz
	UVRrf+QprTbnVoLBztsQDcLvWZygkBIM=; b=D+mkt44wAtnZSgv1DpLQL1Igjz9
	Hfm9TnW2W7Nf4hW+plbI7E31rGweVGPfqhQm+CkJAYruFr26+znDPcM+o15+mNrp
	eg3UFfs80Xy9OS/f7JnfPp0F2cK6/wHAlHivODG5G2VvRjLW5kGOssJcQwB7v2EW
	u6Oazn4olHK0bJPAk1Kf4sm5BHGbtvqvlWMugPhAmZPjMbTJi2b5niyI6O60BiAq
	tyr6pY3SJbDOKBUIegfqcmT3OC2Fl2YfihO6uMmOPqp9WWqZoNzNFGeVB8FlpaD0
	+WmgEpjgj0HcSRwkf9KhXZzZYxbsdserOr4fDoSIzBs+UdUbbJPCWL57p5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhjba5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so1580683285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794936; x=1796399736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ik5GCeWTPIzUVRrf+QprTbnVoLBztsQDcLvWZygkBIM=;
        b=VabmTIx1B+kt+0mi0frZRviPUJeINw5ScM+8iq7tt7as6d7eKBSkJs9XGYWFg7O6t6
         6F2zEHY5tNGyDz/gmey9AbXa68AM8eWtEPeDdXEfN+d9lNnvuxssP6R4J+nLpJRnptUc
         cEZMzOUmQvZ1wTe+28ZJjbiSvySfUOwrQ+lRucuxa7hSwYkYL9T94XoMsw5ZA3KobagR
         YtQ3lJ/gBAEgTJZ4zNVLn5w77TxhddjJaqtgHWWaSO14TKSDssbAgyfeCjpobLXDn8D+
         PeD+ujRahbJeBoOUBeSrj8QOh9QlQeyvF8epul58V4t7C44ZLV+4aau+E4h2b/fcPp46
         g1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794936; x=1796399736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ik5GCeWTPIzUVRrf+QprTbnVoLBztsQDcLvWZygkBIM=;
        b=XaZVq0BDA9zx5mD6WWeJpMBfTQHIbAnRz0RMzglUIMxsq4fyNRMXt3PxWejsNgjKdR
         XTbp6mJE3QgzR6X1CoJrCTIT6tn/3nHOd+DbMbK0e5zZIQiP3MTkpLQDw2Ir5fLpINz1
         phRsOQy6AKkhgaPaP1H+CrMj1ZlPc9LY6udj+5tz+i1dJzIM9qIfO7OBWoP53+gyiJhX
         R5ueX22IhnR9J6KMwLB8oTYJmvORs+gfF3UAEYnl712dygpry3JoB3Ojdyw94OlLZsHN
         G3dRdUuETOmiBeMNHmKHYm2MMyphq9U8skj2jjBYIt1Ytq73THg50Ph/J6rYsRqk+OCG
         2YuQ==
X-Forwarded-Encrypted: i=1; AL+hErHDa7uewY/5fanaGeirwHJRtniLNevvT2tx3t8AMcXjGpMgb4DotKZSD8a8l90yXikmlGGd4zwrRZ9Ui9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+gPm3XyOyPdNb0DDLyF6QxOw9fRqxO70Q3zuhPxOy7ZOb3oCC
	ed1PZBAMkbszPUiB0M4YBO9yUHoTa3uXdgYdIgFwr/DzO/f+b92J3m1LueudMqkhALYY18fSrBk
	LHtr6KlAzR4S4ddU4bnxRCXJNmLj121hV2o5seKu3+aIQ+TSfSoF8v5EQvZALZccuHX7BySbu3A
	c=
X-Gm-Gg: AZFdTZeTiAvw/18+8Ba1wcJQKxgKcsSEj81B3CFYEOO5Omq7+vvcuXUFJ+KMqDMEwFd
	tB4p+HeJw5oK1G9VAjgYqB8RWe2GborM83Lip7SjQNtXeV5JWu601XPIPr1tB3QBaF3p2dw1UYy
	CTEhcob1YGF7XEo3I/GE+MPi/oZoJ8qsQ4yD4KcdTBt2YNGkbdcGtF3oFDswcNOdYeNYuT1kBer
	4O+M+Pu5UBiKqm21VHFo3uZMTjvoGrnhURbCZAPp9gDukunEmixke5pRchSOzromZEGq1V5kuZU
	jZ4w0JASZto/4Y4vaBqL/xSehPXUMT04P8CPP9uJxTUNZqOmifR1VRkBgYee76c5Pw8lIGqySvv
	Xgn2iDPAk4q4n+oVnQx06qI8Sh1VsOWi198eqxnyBmUjI5poCzYK6NLz/+gb8bom6
X-Received: by 2002:a05:620a:44c5:b0:949:a9b4:bd11 with SMTP id af79cd13be357-949bab4d986mr4472259585a.73.1795794935723;
        Fri, 27 Nov 2026 07:55:35 -0800 (PST)
X-Received: by 2002:a05:620a:44c5:b0:949:a9b4:bd11 with SMTP id af79cd13be357-949bab4d986mr4472253385a.73.1795794935156;
        Fri, 27 Nov 2026 07:55:35 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:34 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/7] arm64: dts: qcom: glymur: add LPASS macros and RX/TX SoundWire
Date: Fri, 27 Nov 2026 15:55:14 +0000
Message-ID: <20261127155520.358909-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfXwbzgh4wL1YfK
 ugfIpfRh4s7AbQIBOEE0LVcJ0kOGuNieAnyctFrfJCTRb96nLGsP78ACbXxqzuQBgOQhEWL5oXd
 H+cKTmITAilw2Hg0WbPX4NTk0mqES50=
X-Proofpoint-ORIG-GUID: jN0JUnn6VNvvhb9TNOYN7fxrtSN9gfQm
X-Proofpoint-GUID: jN0JUnn6VNvvhb9TNOYN7fxrtSN9gfQm
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09a7f8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Nhn4Pfy1faAZ1d8doxAA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfXwN3HAj9zVuH9
 bf5e1VKchC3SKv8fBlSAcfHrZXqF5fPVIL1jo8seISz/Kg1fqswpUm46cwCRS9HREQhXwELjDcn
 9tzQcYZzKrKvdcFSkPZc58nzWTMiv8cNJ6Bb1Q4kxhdmyYhoxYqpAU0esiCuEv4lzmsXkTSBPDo
 MLJCUx1MP+F6qMDh5xiqZqlZBaMAHvZEwTQX7e4gI0A7pOFoI+22OkclWs2Y8mDffruju5fBzbm
 S5efRlfW7aKwueLH3mBSD4esdPZF+stSt7hZoYdT8XsAEQW72ytXU3R/7cLLMhcZuICM1qv7fc4
 TwaO5tv1bSMrjSZ3OeM3oRQQ8ZkwWF9ahh0/TR6nY3A1WOKbz37MJGn93LS1e6MDfl5P5x0btjy
 FBOQchjpUPmYx1M9LiImngXqAxtpss/KiYou2hcUWfNBRrorwAF6Ze6FflMHnPXBuBqg8pK0X/g
 ox5dpThugJEL/bSwZmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Add the LPASS pieces needed to bring up analog audio on Glymur:
lpass_rxmacro and lpass_txmacro codec nodes, lpass_audiocc and
lpasscc clock controllers for the SoundWire RX/TX CGCR resets, and
the swr1 (RX) and swr2 (TX) SoundWire controllers (disabled by
default).  The swr2 port-shaping arrays describe the WCD9378 slave
topology shared by all Glymur-based laptops.  Boards enable swr1/swr2
and wire the WCD9378 codec on top.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 98 ++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 165dfa11f17f..9cb7506656fb 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4669,6 +4669,66 @@ q6prmcc: clock-controller {
 			};
 		};
 
+		lpass_rxmacro: codec@6a70000 {
+			compatible = "qcom,glymur-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
+			reg = <0 0x06a70000 0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		swr1: soundwire@6a80000 {
+			compatible = "qcom,soundwire-v3.1.0";
+			reg = <0 0x06a80000 0 0x10000>;
+			clocks = <&lpass_rxmacro>;
+			clock-names = "iface";
+			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			label = "RX";
+
+			pinctrl-0 = <&rx_swr_active>;
+			pinctrl-names = "default";
+
+			resets = <&lpass_audiocc 0>;
+			reset-names = "swr_audio_cgcr";
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		lpass_txmacro: codec@6a90000 {
+			compatible = "qcom,glymur-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
+			reg = <0 0x06a90000 0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_audiocc: clock-controller@6a94000 {
+			compatible = "qcom,glymur-lpassaudiocc";
+			reg = <0 0x06a94000 0 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		swr0: soundwire@6c80000 {
 			compatible = "qcom,soundwire-v3.1.0";
 			reg = <0x0 0x06c80000 0x0 0x10000>;
@@ -4772,6 +4832,37 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		swr2: soundwire@7630000 {
+			compatible = "qcom,soundwire-v3.1.0";
+			reg = <0 0x07630000 0 0x10000>;
+			interrupts = <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_txmacro>;
+			clock-names = "iface";
+			label = "TX";
+
+			resets = <&lpasscc 0>;
+			reset-names = "swr_audio_cgcr";
+
+			pinctrl-0 = <&tx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x00 0x01 0x03 0x03 0x00 0x03 0x1f 0x1f 0 0 0 0 0 0>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x01 0x02 0x00 0x00 0x00 0x00 0x0b 0 0 0 0 0 0>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00 0xff 0x00 0x00 0x0b 0 0 0 0 0 0>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x0f 0xff 0xff 0xff 0x0f 0x0f 0x0f 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0x01 0x07 0x04 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x01 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0x01 0x00 0x01 0xff 0x03 0x02 0x02 0xff 0xff 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
 		lpass_vamacro: codec@7660000 {
 			compatible = "qcom,glymur-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
 			reg = <0x0 0x07660000 0x0 0x2000>;
@@ -4787,6 +4878,13 @@ lpass_vamacro: codec@7660000 {
 			#sound-dai-cells = <1>;
 		};
 
+		lpasscc: clock-controller@7680000 {
+			compatible = "qcom,glymur-lpasscc";
+			reg = <0 0x07680000 0 0x10000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		lpass_tlmm: pinctrl@7760000 {
 			compatible = "qcom,glymur-lpass-lpi-pinctrl", "qcom,sm8650-lpass-lpi-pinctrl";
 			reg = <0x0 0x07760000 0x0 0x20000>;
-- 
2.53.0

