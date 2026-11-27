Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794939;
	b=wyBnqmvx+LVTsSBijgnfEfbJ68zhH5hPAIiPu7tWN8dWT5xwh6+STMGJRTb58UX7/Jn/
	 YaV4GayLqLZ0t8WkNnoJyeL5W13bK4gypY9F48OJkVRG3y55APJT7A4EDZVnbNp3VP8mm
	 yPh6pf+pPLBZ//zaixVZ6JaBZ/kfRKQGH81DmClCC69i+t4paALYQ7yYFHaZwS/yj/+iW
	 PQwBA8JmwQvSqfYeccpVrVWma+KvaSOHFt2OA0J47xBkmqPaww9ploRPOaOVXlro+kYHC
	 xFsvYR6CooG+7caXfckWQ1n8PE1d74iOENLHKJmkAKaqUcWdGwzAkHjQ6SsfQIjLr8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794939;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dZvmTbygxl/XClFljr1KmcHrdVRr51qfi7CDWubHxqs=;
	b=5Yz96gbVd1zZL8z9OrzQSeINK8+wSXv2pnk5y0iaq39wxtFvQIXpNLkmRJQDsXh/qzFS
	 g9PC3Sv16yySRqyR+3UPiB0D47Uw5EVdv1MJIEb8CocvbclQtV1IV+nT1TwIqx3AMTXZB
	 LossM4SuDI6fU3MvZ5cW8Ni5JoEk90tw6CgBERxAZNDzAGFDknNFBTDh89g+9Z9A7ZnYn
	 y79WOhTgO7hECyIUilMw3gwoIZ5r6MmxqAb37Ih82YHs1z5Baj0T2SyNsG7RH6rGYglqp
	 UKqWbuGsWMpcZVRFr5gIL3TxE21xaeSbtt6VJasiiPGHhhbEN6AbhZuRx9ZOlTVoFOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLFbTXj4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iQyGesAr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCAA606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFCAA606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLFbTXj4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iQyGesAr
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpPHR065479
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dZvmTbygxl/
	XClFljr1KmcHrdVRr51qfi7CDWubHxqs=; b=DLFbTXj48d+iUKP8MXY1V6LJ7c/
	B5zTgkap38t4G7/IkaS+Fldgw5YmxoZmneh7zmU4HfNM8AE7505B30YK7VnhhOw0
	3yqNCnsZsk5q4siT3zmYCLcCMgwE+oWmCH2oTcqnv7kNU1yt16kHW4TpVwYgRIMd
	0Ul6xNnNYzcJ08o1lQ5Dh/dUMpAPSZxACipq4YFPoDREcQkSRyi/xSBmaQqJ0Zyv
	t/KfREBLp/hbEjM2DThaK1kdV6ZZ+rOILuZlPGD8QouRVSXvSBDvCcvqLAwUsVUf
	NogBmCWdfTqGdQUORppRp96UHkSLvoByQjRi9xvgx833jR/SoaVYonS+TYw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dhac2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9213659143bso89364426d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794937; x=1796399737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZvmTbygxl/XClFljr1KmcHrdVRr51qfi7CDWubHxqs=;
        b=iQyGesArv3JICEV2GW5sQcBTospM8v4985n1HgyLkb/STM5iEo4UhdYbuTbkSryfcZ
         eUBT95gxDK4SvRri86nAeJH6Xl+5/u7YW2fkuutLLeMk+8zr21GFOoB/ZuWcIc67Bag/
         my03uMeAKXL50IHk9qVLrswPyi7N/Zqbk2cXxhrrJHt37tIFLp5DFJfxfoq2FbteUQST
         ZGEILQ3uqWbcezEziKkizJhCeYCW1+wny3RCvhgFBTeLbs0b2mr+G/vLaPwWAJzPg7jM
         GQpGeiDA7dQBVy8D3YkE74HoB60zXseBwf53J+TqshTduw6jKCtbbFCBrOcnlTizL95a
         d6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794937; x=1796399737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZvmTbygxl/XClFljr1KmcHrdVRr51qfi7CDWubHxqs=;
        b=cFzLhgedkGFRCA+o6/VrIaTukfI0bkcaLz3N4/aNSkERJd2D5tD7WCivbz5sfpfuOr
         fPbxuPtRWb9VzAKRo5DAljOi6g9R+iW+P/FbwJ4kD3UF2oJAL+db5wxJuaUWZ1soipp+
         h5UFDcnNt449fGKwqA90IqvbOZhS7ZPSjqO/qOp0CWfWlcl87yn5FZczzHZxX6Tes7Ya
         DMCQmqPysDTyb8poriuaal81Fa3lPxn/lIk8O41peoBpJUU+dTT6v1tT5X2DMMwqxMYT
         /DdWVLXKyQIDAzjk8zQQnlDdTSstxnmfsPMtQD4qiUJs98ovqWL5XfuHDU/VDiX9wWid
         VRxQ==
X-Forwarded-Encrypted: i=1; AL+hErHrHf2IsTcVymhydQk1ibTT0WCzRA9fQi2f5qObpMnVLbEpIGz2bG+113tY4WKkF8kIk6hsbfPkT3U8Cj0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NlbBzFEiftuTfx7xKrI2GCHCpEYuQgfuPn7knD+n4XJW2W60d
	FA7nC2u1T0EsLnH8CcKXkXiFRpU5gTxrco1mo0df04W9Eg7ODCu7LiBgzFTwPqFy2SxzmPIEma4
	fjofyPpGVeGbUj3ekQHbiJ7xHWBhA3tvh1xJLMFIhXYxg1Bp9usWOvHtZzwFyJ5yL2Us=
X-Gm-Gg: AZFdTZcrh25xjkU3gF7Z8MggulsikZ/zaxaiioPAij1ZVkOluhy49Pp9ELnQ0Y4xnMc
	D3zdCSsI674z8LdJ2jCrSdmvccaoQL8RZbhEl9H9dlAgD2Ipc0f1vYrl4s0jOIjBElgjMKcDV8+
	Arpgued/GXxBrUKyImrNnZJQmLn3dORQ/NAtQSz79J4uBKUEbyhXMpcv2mECpMPUuQj382wLITu
	pmQus9PEsSpXI3BExzByY1Zs1ayrelKg5cb/czntkemudA+WmNGuY8tuKhg8NZ7Q8D1siECRHIa
	K+mO12SvzIPSitfXtUdn9gUSg6wMhAeJqhCHK7BqCIrj7CxAj+sjHUnu4fJ42LEoIXw628q7LBg
	3GJdclyRyZtlu8j8MFDesnicO2P8W57bE3DsDsbPS2DcgQuIdNnZNxT2pT+WrPBpn
X-Received: by 2002:a05:620a:468e:b0:949:6027:7580 with SMTP id af79cd13be357-949bab7df00mr4612603785a.83.1795794936968;
        Fri, 27 Nov 2026 07:55:36 -0800 (PST)
X-Received: by 2002:a05:620a:468e:b0:949:6027:7580 with SMTP id af79cd13be357-949bab7df00mr4612595985a.83.1795794936461;
        Fri, 27 Nov 2026 07:55:36 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:35 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/7] arm64: dts: qcom: glymur-crd: enable WCD9378 headset codec
Date: Fri, 27 Nov 2026 15:55:15 +0000
Message-ID: <20261127155520.358909-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX2jkMRPGFM5il
 U2PyWG8pl5UKmz9OwiD0AF58VU6hQLDrpjFI3wUF5zHObEHR7QWuTRAMm+CsQCEmIhGRv95jsrU
 tO5UDoeooHKQWlWXK7N6KKzGay0HP82/JBxGJwdG9q8U8bviVoYVitUG84fUWE1MUBrBBDFN1jd
 LPObn2kIOHYurHjCN/lgORSZj/wgaPxb5gis6yiG7taNrEBzqVIjYoJ0TbVFqi52/aloExbgx7F
 QAgGfmZvNrhUwFBvUdsgU9bZSQE1TLFZhgsiI+nPLQ0Mh5HIDAn57MWUxOFLm19L+2Z3HhDkQbs
 zc80ihh0QiiGo56/5PfXsgJUjcwatVL7SS3Pb6zro49IELFmsEgZBQ3ecLgoUNxl2jflhmNGkW1
 jtntZoQf8GTocVI/Ic7jYmU7d2U9OyerK++DjeFybZ0LwXEoCWMAmlNjI21PEFmboKyu3bs6TaF
 jSFlh3o8rVY5p/trh3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX9+aX+GUkTdPa
 Ee5/ROObrQRMqNPPuUS2JMXIb69rv48OB8Vys7tAZBc5HwX+8TOzqD7qzuy46kC4w1QAC6NMWDp
 uheMRBKxF0GihYEPIlBVa9PV+U7E0nM=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b09a7f9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=imSGFiSTgn8yRhLT7isA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: BATjgl74jpdLwbgGLrddT5srGh6nVTEu
X-Proofpoint-ORIG-GUID: BATjgl74jpdLwbgGLrddT5srGh6nVTEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270063

Enable the WCD9378 SDCA-compliant headset codec on SoundWire.  swr2
is the SDCA primary and swr1 is a DATA-only multi-master dependent
(lanes 2/3); the WCD Playback and WCD Capture DAI links run through
the LPASS RX/TX macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 84 +++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 3a9cd5f3ec2b..8e0dd2956882 100644
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
 
@@ -791,6 +826,45 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+/* WCD9378 multi-master: swr2 primary + swr1 dependent (DATA lanes 2/3). */
+&swr1 {
+	num-lanes = <2>;
+
+	qcom,multi-master-mode = "dependent";
+	qcom,multi-master-peer = <&swr2 0>;
+
+	status = "okay";
+};
+
+&swr2 {
+	num-lanes = <2>;
+
+	qcom,multi-master-mode = "primary";
+	qcom,multi-master-peer = <&swr1 5>;
+
+	status = "okay";
+
+	wcd9378c: codec@0,3 {
+		compatible = "sdw20217011000";
+		reg = <0 3>;
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b0>;
+		vdd-rxtx-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
+		vdd-mic-bias-supply = <&vreg_bob1_e0>;
+
+		#sound-dai-cells = <1>;
+
+		qcom,sdca-compliant;
+		qcom,port-mapping = <2 2 3 4 5 6 7 8>;
+	};
+};
+
 &remoteproc_soccp {
 	firmware-name = "qcom/glymur/soccp.mbn",
 			"qcom/glymur/soccp_dtb.mbn";
@@ -961,6 +1035,14 @@ wcn_wlan_bt_en: wcn-wlan-bt-en-state {
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

