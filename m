Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364125;
	b=g1PSBqsBaM5b7SmzmJdEKFptRJKKuPVhTRvfuoWOkhzuqyG1QC7/XBDOPOplTH7fYG6T
	 U/Yq+mD/PKnxm5K7UO744JbQsxIYp4AM0jnR7LcwylCL8kHJ71rWio06SB5x6NGh7WvqM
	 O1IehCAkY6JFDm6MTw4pPlt7vBU9wSd+fTcD/9bvBmvViYcPyjyhjiZPW8hRDQDm6g5cy
	 NRBreN1iFyQ3/zNPM04J170uvTAjT6pGbwDq0lXmEEYz7UTArFgdwZ1Rzj2BdHDMkcx8O
	 1oW4jxUQvqywehfUmQMDOx+DWbbjlsYWM63p8HkQ4TQJz5Qjm/wsmG1NMV74FQtn8IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364125;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f/9te2ernEKY868Q2tTfh0N9+4p6tvTufZbWIWjMoLM=;
	b=jVpVnphz0lG00aZaviSCfxOORKW/emNm5n71dwhy1LYD/gaQnzT47OR5ZBVOrQFza69D
	 EHYDbiWqrTmj/4GUtMjlmVd1mNytsJuRKrigqKrU8BWG+XGhvl5pOrqw2EpNQX7MuU/Ip
	 dSF9eTtw3Knj9gukmdQPyvKFemdQzgEjFczgjYhDBWGHVy2kYzCbnrKH6+9Ll26KvSjnh
	 pLl9Uo6jqru4Ms6DIM6XmxV2H3PIKHK+rssNWUia+O0X8B0wwqQwwOU+4B8WLmp8cRtPi
	 nqnIsmvF9Jr0gu6uwjL5I7gAGFNT3SF/lR3a1OcW1eeQJ1Og+yjk+uhxbV/VwjnktiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jO3EZBvx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dWfZUc+e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35800606DA14
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35800606DA14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jO3EZBvx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dWfZUc+e
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQ9Bw1854229
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f/9te2ernEK
	Y868Q2tTfh0N9+4p6tvTufZbWIWjMoLM=; b=jO3EZBvxNduyQF/0DVWdB3CQZRQ
	yXlRKwyauMiID4XuOdDM84yhNBjGwFu67kDUS69srylYHE5LHLP7W5WT0XEQzGnH
	Mq9DfjRD8yv3RkSV2ZTB9ddmvveUskDnRIcafXMtsGM/jVnOwUlCColR86gJgn0i
	RAIvBxbWhpEcSCPdtEX+J/9KZOaUuuy8SFhouwbLnFVhMdxBqrXXfkZaNQoovKq5
	YA1EyMDsybFh9KVs+j+/vpitYQUxVe/5LSBFBBUnwROrGUdAq24VI280WZIRJYTA
	esdQcQ8glmJbNhZZTPd2iTz1+Eo5xEoM4kiabbVqRN2amgM/IglygGQ5POg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnv42p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495dd0f07eso502737485a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364123; x=1795968923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/9te2ernEKY868Q2tTfh0N9+4p6tvTufZbWIWjMoLM=;
        b=dWfZUc+epyMijC7jBl2cT8l+2Gu4dLS86FdcKA39aYSk0hRBhDEg4qRqGr58Uet+DB
         F/IYp2QPhdVs8NeY/E09BnLKAFJfz2o/eaF8rTDST9Ku1nTNw0ctIAPyZ68+YFijVDxk
         PGsSPgVDOX2BINExxgSxS3BDAI43KHJEagUJJpqu2rgW0pmYWeZZLmMc//ZzW2RPtMbV
         bOqG7+q6KAtQiD08LlgTY23q7MTsY5mg9nkakci9SYQN7WtMZxq3piQSv98Jr49pzt6S
         7zbOftlrMRRuTlUIc5a4/t/2Y8e96AY4DDm/ZEJQB/zH0NMpXvg/1l/h+WzoZvssqURq
         I8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364123; x=1795968923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f/9te2ernEKY868Q2tTfh0N9+4p6tvTufZbWIWjMoLM=;
        b=kD75H+if9mWhCs4LGla5DTRV2rOliisydxhXdumZbWNvgVFJ6nsZkHtD37mo2BjYft
         vxI2f+OEtVpLnNxqsVQRJa+ZvFAAVoL75FyrWJXUyGIX05YIdMoJM4gdlj+j4YKMFMWl
         pLkrj+FHivpba4TUvWcY6/HfAMtdgeyWy3FqBsTteAMW1lbdnBR4uwo8/Sg64oh/QL01
         bj21qVUfdUQyurW1KKPkA2rnsJ1OkQ+T2Hcorie84l991J9GY1XRp7lfij3FGQxNBZDl
         j3gtcNTApZ8pYN44aDkicBZDoLLo7vyNHUHN7w6i8ZUdoFCgWBe1/mvix95I66otDSsX
         gOXw==
X-Forwarded-Encrypted: i=1; AL+hErG6m2fJ7L7aujY2nL2c/SYOfKbJpPBb+clZx3iLDdRTS8WqiaDLVGVCjASA/g4CiKoiUmBGcWtLhWohs9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ivmCaDB1uB0/JjiDqGPCHdBFVFBhbXHXJ1GaPwXli7vm0w+pH
	15wyst9X6UGRPbS37/lUMaQs/S4yVIUeh14jMcNdbrum8uqJjMYvvD4Csy4DV42AU14Efbl6qVl
	HP2yWxbA2w1RuQtoS0KpyC3ySHOEAm+jm7F5hZRTqcVybHjcP4EOOm6NMeGFC8zCAewA=
X-Gm-Gg: AZFdTZeWDO12rA06ble+ncsvN2mijEZ2qQ/34Ih1uYobeHFIedmQ7piT7/NKULZL/s6
	JmozmA1OsUVREXDzhHPl7AFp+TqRwKVw3zED1IKHX7y1kedy5PilhmpSLDDiInWWxKAfM/NBZTQ
	LORT0fgItD8siSEXovKoEJPYfRgxuVEomVlvDli50Q7P0RsXdBtg3reNnN0XkCaOh3tbC67fOKH
	TE8DgwYs/p9ZCJWnxKIROkmdGBOmqasoXr2rklX3SgduokURJejvHE8pjSNg1iN91baLbsqKmM1
	Ghf5oQDGAf+kcJrRR8f1Bl5YNoF5qaWSLx4ntBzeJzFcF2+ygqDvz3DipSx/rysdeEbuTAPRNht
	Pj70QsriDKkm1VZ6wYF2I+P4y6zctylKIfoLsYJKfBp4yfBmzMzdmPrsJflbHQixe
X-Received: by 2002:a05:620a:2548:b0:93e:c12c:fbb7 with SMTP id af79cd13be357-949bab3ca86mr1519072285a.68.1795364123309;
        Sun, 22 Nov 2026 08:15:23 -0800 (PST)
X-Received: by 2002:a05:620a:2548:b0:93e:c12c:fbb7 with SMTP id af79cd13be357-949bab3ca86mr1519065585a.68.1795364122858;
        Sun, 22 Nov 2026 08:15:22 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:22 -0800 (PST)
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
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 22/24] arm64: dts: qcom: glymur-crd: add WSA speaker protection VI feedback
Date: Sun, 22 Nov 2026 16:14:35 +0000
Message-ID: <20261122161437.5994-23-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX7ErkzHDvnwd1
 RJjOdM2UsZ6W/ZTvL8oQcZBN15nnlvY0LbLtj5w8fUbhhrze4hi+RW887woewg8Knop9CK8N24o
 LJQ+cJ8ReEI6Q3h9gDHkus3+oc12aO8GvWgnFClZgJJQMyvDEjryROCzFz6HdcsKJhOAnjVVXma
 BBlncmX5HNnVc8UUX71l+VC3YYeBNNczyQ384sB7hslNvXTLkXYdBb3sSIqQHDWJkFBj4dMnK+9
 6Yvc6bHPoi1TrtjF5F4hoEcyytFfmML48F0WAQ+hQSyQjhXDNu7S4C+glbnkTbvT4HHJfSWsxnT
 kHmQt0uDE5hIV3iVp5MxykUaYP5HNWj1UJLAt+wY5W/WWcoggpCVUwo7pk4WvLQvnGbgPFtndB6
 BqfELXeB54j5sOkjYMmGzvuFlGBj4bmP4waaJzz0lLjF3gYpTgGQrUWOuOhH1HkNuv07hSDj3nk
 FjYI3PwCgKsQpXkEIiQ==
X-Proofpoint-ORIG-GUID: NOwT3DOWU2CiTDHn8tT942DE21RCGITh
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b03151c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Iq1yyRatR_DTk_j4oukA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX39OCSidiMmwZ
 xzYbDLVxevx+WNnEH6k0PAz0MqYNRXp6o3PiDIxlOlLr5aI6OtRyoSITa22L1j54Otsh0PEYcEO
 zri+VGdVYv6ABMdC3ok0ONu//V/Waos=
X-Proofpoint-GUID: NOwT3DOWU2CiTDHn8tT942DE21RCGITh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAIs to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

The playback-side WSA SPKR codec DAIs sit next to the speaker-
protection VI capture-side DAIs on both WSA (left) and WSA2 (right)
buses on the same WSA Playback link. One MM1 playback open brings up
both chains via the machine driver's multi_direction_codecs flag; the
SP<->SP_VI control link in the topology handles the DSP-side pairing.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 9562a432dca7..2ddbb4dc526b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -262,10 +262,16 @@ cpu {
 			};
 
 			codec {
-				sound-dai = <&left_woofer>, <&left_tweeter>,
+				sound-dai = <&left_woofer 0>, <&left_tweeter 0>,
 					    <&swr0 0>, <&lpass_wsamacro 0>,
-					    <&right_woofer>, <&right_tweeter>,
-					    <&swr3 0>, <&lpass_wsa2macro 0>;
+					    <&left_woofer 1>, <&left_tweeter 1>,
+					    <&swr0 12>, <&swr0 13>,
+					    <&lpass_wsamacro 2>,
+					    <&right_woofer 0>, <&right_tweeter 0>,
+					    <&swr3 0>, <&lpass_wsa2macro 0>,
+					    <&right_woofer 1>, <&right_tweeter 1>,
+					    <&swr3 12>, <&swr3 13>,
+					    <&lpass_wsa2macro 2>;
 			};
 
 			platform {
@@ -792,7 +798,7 @@ left_woofer: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "WooferLeft";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
@@ -804,7 +810,7 @@ left_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "TweeterLeft";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
@@ -896,7 +902,7 @@ right_woofer: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "WooferRight";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
@@ -908,7 +914,7 @@ right_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "TweeterRight";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
-- 
2.53.0

