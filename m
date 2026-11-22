Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364128;
	b=A0yOnRZE0zxbOhdDLUIy/uQTrCS7IKOVynzySUevjRFmK2vkZVt8DxVbdJFPj1HNdooP
	 ElLJ+3QhKkWLPnD/4XawpAlKZDarj04LD3o7WDa6V/gOGI9TPd8Xc8gOe23yi8xq11MFZ
	 qtgK8xxq4e794CxDvUKcSkD2tp895mrVnSMfGlxUgpSCUsNCea+mYpI4Mv+Ii0f7iCugO
	 sKplsabPFgKdSJrCTalch6898o+qAqPlXsX86F64PmWL+bB3T0v05cwRHA4+Hg9PG6ThC
	 9Edt5beaA9dZ9WtLowm+uK2XBp1p7NNY9WMNKJXHg2MeOlZwc9GPTyTenUVgLSJaeUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364128;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j6uKzRJ8kCYGlP/+QGRq3eRVGcpdCYk0Sxg2glGxdVU=;
	b=5pDvwQ68Oqjm0p5RqpAD4kDtn+cQSEYXEbS3OLsN2Pdmu75xEYEJtxxSI7VipN6TBMEM
	 lJEmlzw+eL+HZ12TMgb+2W+AHUBj3QhlfDPv+z3xAa3SlcCFIiXHXWqk8HhjEOM2m+IG1
	 6MoV7zGAgkv1VZsg760X8M/PAlYYThSVJAc3BqozH4jC/kCTms6hn4YAF8N5C7EBuBq/4
	 tkEXStX6LxhQXqF+kRkrPWccGR5y2dHi5PyyM+IholjSCzzqHm6X/Mqb9XdfS01NpgBzx
	 QYSaXLks+bB+Ivx+j66aHISWmM/JfiTiNN7bh2r35TZ/3njUvnptkbm8YQEqpZ1LI8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PL0+5ech;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="S1TrmRQ/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2808606DA2D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2808606DA2D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PL0+5ech;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S1TrmRQ/
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQS7o3853066
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j6uKzRJ8kCY
	GlP/+QGRq3eRVGcpdCYk0Sxg2glGxdVU=; b=PL0+5echE2wMGsS+yaH0I00U4xS
	JYtrWDJWmnzwKiDnzrn1X5YNiNvu7mUSO2w5bD/CSHyN+cxtUVnTzsHdRAhL+1hn
	z0BVMhKZi6Ww3JyknGztcrzJxp2yJLpoBf8u3b4UKBBteK/TjlPEg5Im2h5XoV33
	/V5s1NRrkbb52yIZSLm9QoInh+EJ+6orMBwToHq7wXLptv5dGt9vqe4Fhea8zeul
	ciZwq6J/65Y4fm9cWbBesPR0aFbpX07p6mn5klv4Jnpzg3bu5+3lwPdtIuMOx8kT
	5ozOI5Lf9mDJIXzXhN6RQkR5YEEgh/l85dnpiVpdmdab/drEGnWGDmBFWWQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu3r43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f20addba1so427772985a.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364126; x=1795968926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6uKzRJ8kCYGlP/+QGRq3eRVGcpdCYk0Sxg2glGxdVU=;
        b=S1TrmRQ/9GxMj/PovrcY8LwG9Q5yHW5V83enfCX4DiKUeck9a1alHnziylSCXRpuZV
         lqL7IEWU4UsPHdz+KRnIUkqP4L5NlrXghPBtRspv375Kl0hwkjj4GQ7sUTWJkqqclHoW
         4AGIwHxjoKqW0gqCc7eWaxikPtSL63cTf6huoa4T0TX8N454WhXSeOQ4X009jsnTOttG
         9UdhXB0UkM7Tr5OHgaB0CExPJlJtBJUOJxYbR9Cgm+TxcnY9gzhtCptGEnr0DHRfwL3+
         69rIClkeZI4RwgA7+zXURVw6wXh1wPEp43mYjEo65tO8rFePAVyTaCGsTpcMJK6Uyih9
         HKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364126; x=1795968926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6uKzRJ8kCYGlP/+QGRq3eRVGcpdCYk0Sxg2glGxdVU=;
        b=PH7coyi/Cfb0TDafz0XLTefnOvrcRxhGCPBBYu2LD8aU1yVeTSX8AHA1GGqaHBUCbV
         EVTKuzn8tHdnkGKHvDWPJwD7ci+mHOscSeF5BMDiOktBKm3/R67uJOmcfUeSTcrbHDRZ
         eD7+kd3HLVfN1u3jWnGZFE9JifWkiBew4FEcA3VUEIWegP69UmoqZFkXiuJ/Z6owXSmf
         2tzVaiMcSGIEP6RgYbqj8zOjzbn+fn+mf1IEPmHOZ7RxSPY0rNWr7PsVYtKYtVbw9r3P
         cx05JO1E2Zw8WKDmXGlbOTTf5FwJ6oeXzYGvF1ctiz+T5j36g7A3Vo/6QSTtZLS17PF0
         IMNg==
X-Forwarded-Encrypted: i=1; AL+hErH1UztqVbZImEfJE3EJVoKZ3SfZwL/56MVUD5uxIB+MEQAcDp1R1M1SNZlDlJt99f1dM+UFbabOHO+BU0Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PLgpLIefs0HYLknpVv+892D0Mu4axyNj4wVqvb3PXJinQG46p
	rQGpTUs3JYg9zY78lT0Rfd7jyJWKUntqTvr2Nn6wYrKZ8FloptQqtMP8ssi9OnQcPEBW17ybCk5
	rFSoagIt/GXQ0mxik1Ym6l599KPOmtVFeWYmZxSE4w4m6ILWbkJ68vLOTCcjVSm/Indg=
X-Gm-Gg: AZFdTZfpMjsIinWOFozvoaNTC5IKWIiMZW+tCegU0fm/kCUQKKdpFbeo9kkEZ384C2L
	BwW9N2nEce7RJRH7tM8sn0kg2+Zv0BzEN2mtmYrnvXeHhodItO0CQY6GHrmlInkx7dbcG7/s9JL
	BRuofQcdBHt3InmGh//U6Myq29p97sa7/7UqFMa1tQMk0tqaHL5O/KrdbrzFvnep0vYGTRF4rsl
	vpLXq3Z0FIS9Fgoi1mzJMTANRTs4vy0kc7BCtZQUhTRdDz2f0KSxVDoRSgH5tXioHgK9EkmvUzM
	nHHeeJPftI4Flhf0jcNf2CjPb2gbaHpIjX2eRERr1/vcHVCnU8eTog/lB2UFv6P6q6uDBVGs/2+
	NcDlFL4uZBJahomPf9HXy4C8xaat+Ix2rokp31ZFJl/O/DvJ/TnqAy2o9a19QeGXN
X-Received: by 2002:a05:620a:130f:b0:93f:365b:42bc with SMTP id af79cd13be357-949ba9dade9mr1496073085a.52.1795364126141;
        Sun, 22 Nov 2026 08:15:26 -0800 (PST)
X-Received: by 2002:a05:620a:130f:b0:93f:365b:42bc with SMTP id af79cd13be357-949ba9dade9mr1496068785a.52.1795364125757;
        Sun, 22 Nov 2026 08:15:25 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:25 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 24/24] arm64: dts: qcom: x1e78100-t14s: add WSA speaker protection VI feedback
Date: Sun, 22 Nov 2026 16:14:37 +0000
Message-ID: <20261122161437.5994-25-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: Qbzyw0m7VRRIeDowwM652nE0e4rNP1Ph
X-Proofpoint-ORIG-GUID: Qbzyw0m7VRRIeDowwM652nE0e4rNP1Ph
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX9cuNwdt1GKg6
 J4DU7U1l/Zoo0hkgJiET21PS9hr/sblRpvBPqC1K222WkhGL30u43a/DIPNwnogGLtstb/gBfrf
 OxLSlhpNYXmf1WnaVIwm2n2DdgC6yR0IMckfwdhVLLt6S10I6TV9y6wxDKjBpFWexoihtGMPq0v
 inD79w6W9oHZrjGTAxbAQemBgXtS5XCLR2mWwT+LJSLi/zGn8sq5YSqT5LnXihwOXPScykrbEHz
 wB2n1afJ55pj5XulK8+o9NmniXVYXfZd3HawwxJ2l4n3NiXfMDLBhEXbQcL0kDaDYTHxE4vNlpF
 FPrTDXLeMAAnGzzXRSxFUgxn9uomv2HXyH4QF/J9rufnDnAN5Xja4+hZ6pdRCFeVproCQP4VN8Z
 tr5fj/M+rPT8bguRrjJj1KozlXPcTVpdddHubCZoHEK3k53qvRe7C1mdvngpEIhKOHZtaDNo/aF
 pTj2e/iYEvPZUYOTXXA==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b03151e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=07M9w8tHMIt6-5hUJIIA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXyie4GYrFboYd
 HRuBdLYR6l15fOxwDN8h10h9C2Tt4DmvvpNX9vrOcaXoWUhZGrV1t6HLcFKc58tLmoVtwNm/CF4
 RcD5cbvF5qhTxBUEq0zea2E2XgxYHCM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAI to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

The VI sense master ports (10 and 11) are picked up from the VISENSE
slot of the per-speaker qcom,port-mapping, which differs from the
mahua-t14s Gen 7 layout (12/13).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 1536ad8d4793..2c7166e15097 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -477,8 +477,20 @@ cpu {
 				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
 			};
 
+			/*
+			 * WSA SPKR playback-side codec DAIs plus the WSA
+			 * speaker-protection VI capture-side DAIs. One MM1
+			 * playback open brings up both chains via the
+			 * machine driver's multi_direction_codecs flag;
+			 * the SP<->SP_VI control link in the tplg handles
+			 * the DSP-side pairing.
+			 */
 			codec {
-				sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&lpass_wsamacro 0>;
+				sound-dai = <&left_spkr 0>, <&right_spkr 0>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&left_spkr 1>, <&right_spkr 1>,
+					    <&swr0 10>, <&swr0 11>,
+					    <&lpass_wsamacro 2>;
 			};
 
 			platform {
@@ -1452,7 +1464,7 @@ left_spkr: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
@@ -1464,7 +1476,7 @@ right_spkr: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
-- 
2.53.0

