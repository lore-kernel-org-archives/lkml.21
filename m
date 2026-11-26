Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718305;
	b=XySFHzcjGgondy/8hu44jm5BDeG7aotSivWWa0Z7a34GpbeCElijQ5vHMfuv+XV/F1p7
	 LHZnhk7kKMs6bk0TjPDKnUNLFWl5Dc/CT2sVD2yKSN/9TNvocZtaSowwp28+JabqPC0/b
	 UBFT9Bm7vjFXh2zGL7mzkmfvMQ7d3rLmgT1wr/SY1B0ljRTjxDrs3E6Q+osXyGZT+AcdQ
	 RVi5wf63tR/XcMslUlmy9cen5FfUu9t3ECS+7MTkmqxRFdFpKTUUJx1ceBzIsI+KDEqMW
	 beYeYcM6U4CcGkgoW7b8W9ggU9hGrjmmRFM1wppG2lI6ibvZAwCfmSQhA6G3yw2uAeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718305;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BfVcGVrBRqJ7zIMdhtS1zygXckuAwk4N3NK9IAnInWE=;
	b=FneFeR2CbbmLcxtvioMpCma35oUzVZJHzFAxeCiWfNWcpAF672coWUpPx4hXeS3XwW08
	 jz2oU7g0UCtLl/mwYyPcRn8vM5l69Yqck9FsDp+Q93wNBCBOBvu50kxauV16HZbxkosFk
	 AAOoJ9sjR+ZDEJ0YTBRwQHuVb5Zgzh4VkGecJKZDDm/5OCBk8+TqBmgFlOPFI8Kwn2ckE
	 g3HSLfUN+WwAMBHgYT+CF5nX89h3+xg96WV4RB9YEtCPY75QwBvqLwr3iH3DeGgAESTul
	 el0y0SrOgBTIDNzLRyCVL3f1kuScA+FIiNIolvLOEa3Vypv0yDpR/Cd2/0AAsT3IKjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iUycXkHi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M6DVRbv6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC201606A692
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC201606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iUycXkHi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M6DVRbv6
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu7XA2068323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BfVcGVrBRqJ
	7zIMdhtS1zygXckuAwk4N3NK9IAnInWE=; b=iUycXkHiF84UIPqvgnjW2Lq5L7+
	bpqHRWR9MYTgLVVTXbo6pzYLBi25Y6rYyGloCPQ1LhtteRUQoN7ZBKvDULG5j2w4
	SDVzI7pjcmdfovfAyOrrofivFVj5BIZe79R0PT8oYO1byR4npkaSECLaMAW4xTpJ
	3sHHVZEwzloOb14lBooXk5DUEOQdMyvNDwh5E+HGchxqU7lv1+ONR1t/9jjAUoe2
	dT0yZlsAi8iyPgj6JJtMrn4eVrBSaOnxuAyg2ERxz4EZEvTZ4K+JAHHfv1wYBHWb
	iQssYxMZ26u2aOvBmEQ62WNmQ87fzzwkfQASjCEvr3qHMSqVYZN1PVqhvbg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y486j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:38:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so341565785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718303; x=1796323103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfVcGVrBRqJ7zIMdhtS1zygXckuAwk4N3NK9IAnInWE=;
        b=M6DVRbv6ECDiKiz66wAAhP8RfF5QPDNku3xsfNysoTHqlmD5SNIVuBGSvYTZthGEbs
         4T+SZdnjy6fR9vTBIEJ5rIJyGnTYoSKb3ZTRwEW8PW3ll8RLhtf30puolPMZm55eoyMA
         0EIzYPZ0xQqKxMfPFZqf9t2lJIkcRMDnCgGAtmIBlRDnzATG1xlAMEj/LNkFaAinoUEh
         zcQ68x5v19DGFd417dNef4LnKd6+4voy/DqnmLpWN7FjEUCgUHtjmlJzau8IzMiiHf9X
         /kVpQbNZxI/T8cMrI4hDDBMWSQc4FGk0FqO9aGY+t0iwfl9Skz9YKbYumKidMdlVk9mw
         thRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718303; x=1796323103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfVcGVrBRqJ7zIMdhtS1zygXckuAwk4N3NK9IAnInWE=;
        b=GyiieZOH4vwsNkixrfYMZRhryjR8NXAhbdb3yivfyibqgcSs2G/s4Gt5QRLM0x03u6
         faheLbA86wv+KjgUhIa8hDI61XKbUBP6mXiNSS+m/Zc0Ae4nsfdHZA2OHtlghhY2oG2L
         NQUapsKV+bYgASSB4RnClXZLzwkWTfTe+1fKHdIZalMmdLGqcKVl5S0necnh0hW/yPwM
         IDcTeGo9R61EPwAHUuhhibFkcsUV9wCVZTjprbDh5si7yFwB9xvn7FLHHLNBzZTkdYLh
         aXLYJx+6A89N8pRtY+CUCuKDiZzf6aK/LvWbZ46Q4+MbuBxJfJP21+eNHVHiX6GSMU/E
         URvQ==
X-Forwarded-Encrypted: i=1; AL+hErHrhO4q9AnDm8i8Xuz99c8gMbHPlc9bvA8M01SluAUELLkbx5KTM037HPJZP9AeluHinVB4643ijHviqjU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4GL0aqxArcOwyQxT++ME7ps7F66mftdVFStyPPtwrUHWodojh
	QqYtd3P6nrFb5N0Jd9LFFINpUNjHV2+UOG6MDg3wDZgSExE3au1Pf/lZ5oOUQm8+Ek7nGFAuYSi
	B1EAOXP1/1EW1URjnGUMs5XF9LiXDdBpMRD0r2cRXRwakU0ts8wuR72Ye7RIjH9J4GIg=
X-Gm-Gg: AZFdTZdjPKDZZ06rhS+UWafGGTyOdFv6iDbinxTWKUdx+hqerCopKEArmA6F/GbpLKx
	y/CnISoBxTcDe/8ta+N0sgvt2491QaIWPsBqDHSmRAOWJtNQoQPDc9VveZQHR1NsONRHbK9rvHL
	qOAUEJ4HxQX5SoWaioBfxmAcxiSGOANq5ttHEuO6tH3xTz31Y/2vgYwcZCgGbNl5SfSyggCSuBk
	LCWSKvgjkwIzRm0hz4c1rnIvYh4ze1IGG9L9tKBVYHqTspNmea/QNFsoqxBemUWts74Kwj0LNVw
	OnHLm8xOkS1KLaP2CI+B4m+4lf1lU2h9eq6cVzfnJb5ELdThx9zYdEMTLpPMQlU1BwUU3yXtutG
	TQJb1eIPh5JQzm5XdeALiDe3UjhdG/9O3CNWfkNBvptToXI15ZT/xjBCbTl+5UZHX
X-Received: by 2002:a05:620a:19a3:b0:949:7acd:3c37 with SMTP id af79cd13be357-949bab678bemr3935502485a.66.1795718303203;
        Thu, 26 Nov 2026 10:38:23 -0800 (PST)
X-Received: by 2002:a05:620a:19a3:b0:949:7acd:3c37 with SMTP id af79cd13be357-949bab678bemr3935499885a.66.1795718302848;
        Thu, 26 Nov 2026 10:38:22 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:22 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/7] arm64: dts: qcom: mahua-t14s: enable WCD9378 headset codec
Date: Thu, 26 Nov 2026 18:38:02 +0000
Message-ID: <20261126183806.172485-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX/SQueLyre9eV
 MVSTJutohVPNnVJJDlL+mGOjmCzt6HWuFVZxuqQcCu9fjh3lJRjlGEhE5fn5blsh4PeAVA+y2Xk
 RwEhWWP2jUDUrm6uH9aRBUjWL9dMKyASal5aCNakfkLj93koEVaPwNULG4MfEO9u8jhprqhOnvW
 2dOOEnANpkzMYsRNIF/6e0ZTHNzwe5AMOTN9M97lz+Yy/Ytrndy3+yBN8trTyDpgm60PIYO6+lp
 waIdq1CibU8L63bRdNopKq0Zx6Yi/9r9v5B5mOHnydgoV1kglLFC6P49nOIi4yCX9tcU5yNWZUn
 EJss92ViEpuVlBUYY5Xt8Q0C0lV4hDto4LVEqQeHQ2EPjTQz3PDZPqwX/+lcYKLgYO/eKi9b0lP
 8cKWtERRSFct7/a0d9ptg4taCigYf1yUR97P5MziYk4hREFeC6nHilcf/SNk4rhqr71V9AYofRI
 kzs39FaT+oHPHuZRnNg==
X-Proofpoint-GUID: z4E-zeuWEy50E5k_uJwD7v8s2T3S6FEp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX588idvHpnjRp
 VmmMVt+pGO7SYH/WEhX7eyPQzuag8FSdx5Ebb6rwyn78+PVC+zDcROS1tZeaF2SHomUm3RYqeOw
 nmFM72mmBS6ZdLXJJZd25jRoTN5SLnY=
X-Proofpoint-ORIG-GUID: z4E-zeuWEy50E5k_uJwD7v8s2T3S6FEp
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b087ca0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=M8yDIIM4nUrurVDekmcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Enable the WCD9378 SDCA-compliant headset codec on SoundWire,
matching the Glymur CRD wiring.  swr2 is the SDCA primary and swr1
is a DATA-only multi-master dependent (lanes 2/3); the WCD Playback
and WCD Capture DAI links run through the LPASS RX/TX macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 83 ++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index bad49ba5443f..84be12c07f6b 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -254,7 +254,10 @@ sound {
 		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
 				"SpkrRight IN", "WSA WSA_SPK2 OUT",
 				"VA DMIC0", "vdd-micb",
-				"VA DMIC1", "vdd-micb";
+				"VA DMIC1", "vdd-micb",
+				"IT 41 Playback", "HPHL_OUT",
+				"IT 41 Playback", "HPHR_OUT",
+				"TX SWR_INPUT1", "OT 36 Capture";
 
 		wsa-dai-link {
 			link-name = "WSA Playback";
@@ -273,6 +276,38 @@ platform {
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
 
@@ -760,6 +795,44 @@ right_spkr: speaker@0,1 {
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
 &tlmm {
 	gpio-reserved-ranges = <4 4>,   /* EC TZ Secure I3C */
 			       <10 2>,  /* OOB UART */
@@ -881,6 +954,14 @@ tpad_default: tpad-default-state {
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
 	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
 		pins = "gpio116", "gpio117";
 		function = "gpio";
-- 
2.53.0

