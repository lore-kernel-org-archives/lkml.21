Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718304;
	b=hnAthSnDfCTSn0tQr18EaQym48PbWaZ4nhd/yTjCRvqSNCLsFn4jOnRK55BE6WBrvKhS
	 Kzx+SAEdmm6P895fnaacKXGUIAdIRcexOMeaV/zNzaLgX1tZwGVgf76fx40aOOG9uT0HQ
	 w/S9O/iojbvMayBEuedzBB9sgDtOcXlDWoH7wzp6v89LqbvELin3UquoW0YQMKEwfBVDE
	 veyYtABD9epiDy8glGqR2Xwpa910VnzbJHtvOgz5ZFyPkMJYzkXnJUo8unBSBWTPOmh7S
	 JMa7iv9nzTSlIDav3x9IXYS6K7UNipSSBWCrQzukHu8jA+XsCskHBlc7+6KQDO6l0Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718304;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5RyW/8S38on4s8FH5B3EhnUMU8XwOhqAS4tkeTqtcdo=;
	b=342XJrdr7UTdIzBB1kg+tLmyegLwb+ukdzKOBj+XHSXJw8hKNgnrWYpMyK8QUSOLwZ3u
	 +CVOMOW5p8DJWv2QCa3Hi9PxzPD9jpcnoHABoK/GlT6Olr+ljo0cHsK3kwmrBLwzcB1gi
	 V7FCcUntQrqZGQWsLNRcdUfsgpI7FW6WpsuSAecxVcpo/x+56W37jpEiTpotRT1R5fVZN
	 KcqhoGB40ejY+HndWj85I0L1CO7DDcKRocLkmxEoPDL0EEYtv9X+606oWjukhkvV7/XGG
	 U6cdR3VPsObYjB5mi+JsBvli+zwngXkpTygpR5wiIHQtHFODnrPx+1UYgS3RebIGqdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIfvNx4l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LQuliMDr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A64606A684
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92A64606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIfvNx4l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LQuliMDr
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFudGh3751157
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5RyW/8S38on
	4s8FH5B3EhnUMU8XwOhqAS4tkeTqtcdo=; b=YIfvNx4lK+UuMsi6wyjFGRiOB9c
	Pulv5JqoLlJ1zdHkPG0hZ4MpQbNptT/GJPb/P35rZBvgocFZ7qLLr7A56wvy+6M0
	gvC0IF4GO/rDwAlXpJYBU5y8EYFbq5mtJw5zRMVNVIoRzjEGTKGMiYARCK8T1QdL
	I6fVrGK3WmHOusN2FFeCvpQoc2KeA2uSNhKljZSuSCCGLuXieldYF9z9gG11gDJ8
	Zo4WGdmLHXD2K67GUbno2PDHhc7/ML+kGzJTxCD3qAdCdW/alzz4WL9uQ8xWhtPx
	PvUz7Z0SizPuW8ntVHePgj+773qC2T+wufQL/W8pfV69SjQ6z+T+yqaTJww==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662scaed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:38:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9210bbc04abso135849306d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718302; x=1796323102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5RyW/8S38on4s8FH5B3EhnUMU8XwOhqAS4tkeTqtcdo=;
        b=LQuliMDrCSJu0b/5lqQg1O3Iw5Jc4YtybORf3975OTDtnp3qca3kJErqIZ2IqVikN8
         IDownp+7UibrzDECmjNz1QuwRxxbQbICgoAodXWakeOyLksF1PPKPv9AJCd0fgj7J2Y5
         5hRhfVmHfLEXZJv4JlIjZJLj+s6XCmEiYj/Xh9Y45udRyY9wxqq2ad904K9lkCHP5q3L
         09DT5H78F92j8eilaKhbiAgqyAiF4DMzEkNsWM2yLaVJgYSydKSpXNSCxzVrztgYbUmG
         bzi1BKXJnw5+qGIQYnxqTnDGh4hjx3+ZmzAcTW94CPx9fVXgqy3aE4Lpf8GTiX78ST+d
         MqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718302; x=1796323102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5RyW/8S38on4s8FH5B3EhnUMU8XwOhqAS4tkeTqtcdo=;
        b=CAuKY9gkWy8HRaz7bh+dre+P2NsTOhw3Ucj+8u089djuK2y2UV3lnE82COrOi17Mr+
         9phyylnePvIZjCCDqTLBzzGa7BRjK4BnSj0qSw3zUmCKR936ZJXdqaEOICsyOSGoYuE6
         wpMe8VQhfAa1OLL4ZOsIbktbtNtDIC+nSqQ6KB1qn9xPRMYRk0lIEaI/oRcmEdBDJ0K6
         dEopk7yloI2sOsigcOTnjec7Z8Rwp4Cy5ICvdUvrzGhcCfb/doJspsnlo6jZBhhMtq1r
         5sSsZPses31uUNhUNY73xvAuoaEyASqU0tKIZe0FFMYrHRx9rGAZ4u1z+F/VKDgeBI4/
         kM+g==
X-Forwarded-Encrypted: i=1; AL+hErG1KMhFzzVNgdmrkrk48pCG0PLgDrnL0mfE1Zx0/ke8Q5XA/ZTxSCPgFUsXM3lK9HPMsN5ZeoUyCSnJyoE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cXLibp7nyixaLOsShJl0ZfpQJPgZhVNNES3E2KBZBLISmHZDV
	dqdpQawusZ4vq7AOsLdRbfwuOSmVMAdr1aOZTAnazcV5uAtgir561IEwWUM/kHqaJ5gGvvhT55+
	MfcJERsz+GJGBJeq/wUtU7q20qaVvFprSaN+cMdJZWkK07rcZJUuaBVGjR4IPzl5Zquw=
X-Gm-Gg: AZFdTZdinOOVi3NF+IV1C2xjGFs8MOQ2TpAXbt1JiHhFR99AR8OPXd1NXJKzCCkc+eG
	75qb5GGudiCa9iF5CpcOFdUc865JaUiyzwiLJLzvhJO2Uyz5vCdYs82y3KKRZxfNrfi16+d/3sF
	0HCDw0R2euNINvvFnYbDGR901zXN4kXom5UrYAtq6pLB9wtcZfH8EC6mXEifB9PS/ayj1Cl878Q
	oSsYKmO7o6+LbOVfhIye5hz1wZIl3yz1hdmYDp/T+DwJfj49l35G7Cy0Q5DPIA29STixbkIO0ui
	wff+EMa6mTQclMn0Jd1dv0+GGRg1YpCWDqO7ON+1bAJzq8HPIy2pVkLixkxeAVDett/cHF2Pkyu
	vCeNnpw8QvReViOJ0gOXIAjtKRo8b5YKw2xau7lOcN7uepU1vmMu1ZfcpnxJOY4Lz
X-Received: by 2002:a05:620a:1713:b0:93c:6534:d04d with SMTP id af79cd13be357-949baa0d7admr3927436285a.35.1795718301978;
        Thu, 26 Nov 2026 10:38:21 -0800 (PST)
X-Received: by 2002:a05:620a:1713:b0:93c:6534:d04d with SMTP id af79cd13be357-949baa0d7admr3927432285a.35.1795718301512;
        Thu, 26 Nov 2026 10:38:21 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:20 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/7] arm64: dts: qcom: glymur-crd: enable WCD9378 headset codec
Date: Thu, 26 Nov 2026 18:38:01 +0000
Message-ID: <20261126183806.172485-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b087c9f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=imSGFiSTgn8yRhLT7isA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: M9DD-to1feBRasiXlqp6FTqTTN1zQ9FX
X-Proofpoint-ORIG-GUID: M9DD-to1feBRasiXlqp6FTqTTN1zQ9FX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfXwXP06v2Vz2Xh
 wQBpAr3gzQAxnGrvKFZV3IxU+zAliREz7v+6GuAQnI2ycLVnmAefGpoz1CGOJbJq/Gj4jdq/wSw
 pLVdztAoHQuEkqHWbHQ0RaUbd3zHf3bk6wy0UnV3W5ahCmVwbdVynk18IM9ZLa/63AgGmBreuvL
 HmdWSpJUJKVkT01mEF2U5q96nZQdBv83iTphOCWknoxblu/Men/oSX2xO7HkQOXI5BxB5gU3Rg8
 CDj4mhlXiZHEoIJEngOLoRUHwCC/707kw0ou+gIqBzqwPkwqujTlnZejYFvkdN23njw6sqz4+s4
 V4LqRYxikoawU68WARU1+4uXwfT2OZM08U6DDYXO6HazsJ40n58TmmGU9CIS1tUSXsRkip7AnJh
 CIRGzQ3aawdH+gAfYiiiFEzYOiEKPK5HtpNU1Dlg+LR+/56gLoV7piGZ8i2icUAka5N87OzRA/O
 qaAxdwtBIYfm6X4uTEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfXx3hJZsSQb5j7
 F1+4NnD9BBUCnSVtAbcF1ynpIH5AIf4uEzNK/XT3Adqo8B3FyXbXtaEQb3372yUl+8DIHfp10Y2
 zInqqTFUKOE6cJsIcKoIMrLNUbd8JU0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Enable the WCD9378 SDCA-compliant headset codec on SoundWire.  swr2
is the SDCA primary and swr1 is a DATA-only multi-master dependent
(lanes 2/3); the WCD Playback and WCD Capture DAI links run through
the LPASS RX/TX macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 83 +++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 3a9cd5f3ec2b..be0a2cf10f54 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -242,7 +242,10 @@ sound {
 				"VA DMIC2", "vdd-micb",
 				"VA DMIC3", "vdd-micb",
 				"VA DMIC4", "vdd-micb",
-				"VA DMIC5", "vdd-micb";
+				"VA DMIC5", "vdd-micb",
+				"IT 41 Playback", "HPHL_OUT",
+				"IT 41 Playback", "HPHR_OUT",
+				"TX SWR_INPUT1", "OT 36 Capture";
 
 		wsa-dai-link {
 			link-name = "WSA Playback";
@@ -263,6 +266,38 @@ platform {
 			};
 		};
 
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&wcd9378c 0>, <&swr2 0>, <&lpass_rxmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			codec {
+				sound-dai = <&wcd9378c 18>, <&swr2 1>, <&lpass_txmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		va-dai-link {
 			link-name = "VA Capture";
 
@@ -791,6 +826,44 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+/* WCD9378 multi-master: swr2 primary + swr1 dependent (DATA lanes 2/3). */
+&swr1 {
+	qcom,multi-master-mode = "dependent";
+	qcom,multi-master-peer = <&swr2 0>;
+	num-lanes = <2>;
+
+	status = "okay";
+};
+
+&swr2 {
+	qcom,multi-master-mode = "primary";
+	qcom,multi-master-peer = <&swr1 5>;
+	num-lanes = <2>;
+
+	status = "okay";
+
+	wcd9378c: codec@3,0 {
+		compatible = "sdw20217011000";
+		reg = <0 3>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wcd_default>;
+
+		qcom,sdca-compliant;
+
+		qcom,port-mapping = <2 2 3 4 5 6 7 8>;
+
+		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b0>;
+		vdd-rxtx-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
+		vdd-mic-bias-supply = <&vreg_bob1_e0>;
+
+		#sound-dai-cells = <1>;
+	};
+};
+
 &remoteproc_soccp {
 	firmware-name = "qcom/glymur/soccp.mbn",
 			"qcom/glymur/soccp_dtb.mbn";
@@ -961,6 +1034,14 @@ wcn_wlan_bt_en: wcn-wlan-bt-en-state {
 		bias-disable;
 	};
 
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
 	wcn_sw_en: wcn-sw-en-state {
 		pins = "gpio94";
 		function = "gpio";
-- 
2.53.0

