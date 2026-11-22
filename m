Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364127;
	b=4e9VCS9ZVRg2zvu8/0Vri9e6Y7/s6mTmfunb442eppM1ksBt0kMrf1rndDw+BF0gT6iX
	 T4ZNPTXTl/yCAlZHxi8Hui0TeHbBPrIcOEDGiEFnxgd4o4zvdZPUCwBrMqRVlp+kg5vxP
	 cLX6F3WYJ1K+k9tFHhONYAT9hB1cuoYIKI0C+oNxFT2NOkEcYejvShRi8IyjLi04vqIRo
	 rs9EOeQjRkZJ+Ake2Xzj+RUXoetZybE4BI4j7WWjtfxiA40c9kNDdpU/obZUFzWvCPS6a
	 Wl25xOvus1FkfisMOr2VSZtC/DRHAUm3x3m/JX/7toL7k0UA0ZmlBkxkacPZgKKFI5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364127;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZXdUoqdbSRJd1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=;
	b=ZuTp4qFJLwRAGHJox5pfVHP4X/Y7Nqg1A4xmOlGz40AwvvEMlTmIOycafE6jTnQpeZRp
	 komeMATKAfM8ggmmjNP4tEFLoVkJQin3TRkS9/AKI6OS0Y/YoKzbKRCTQDRKHtzkop6iu
	 L0sK5dj3AgdCyCt3gTq75tPLdB9hX1JJgCqYN2i4o6Qw5EsRMzb13PuBW3xsCJZTowQdX
	 Ggsk0aI8ogcf/zhOJeNfUYCjBDLfaK9FgCnTJaHqQzlynL6GCzBM5ZIDrtIliKXFKYvuF
	 Zo/SsJhogGAJhmmntnWaHRnYAQi3auXhLVqexeFMRAz/WB4C82eXt289CnIqLFlZqrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7ZLBf13;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xn+R2jNS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D46C606DA31
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D46C606DA31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7ZLBf13;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xn+R2jNS
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQFjW3382271
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZXdUoqdbSRJ
	d1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=; b=F7ZLBf13BN2DpneKCSqjS/7EyJD
	A94WvUlT1emakZgFcG5URf5GhdyVec/7ZjBK/JrcWLPpfPH4Tx6g9cAsrbdbCu8m
	Ofjx88MNGFZCtZ4n12ulVJI+y4CJ+x0EmYTHrG8ejAQznNAuLZku7vknakQ07ADF
	naUV98Q0axFU/Nssjc8sBCflRrTNCs0kU6h8KUPa8p6R3GipmnEWZzKeYu+laIgI
	baKvoQHuG/mS4YzZbuembAjfi9IIbh+AVQTqGHrfaQsFY1ZFjGxvcWEz2zL9yiYN
	pSFiN8hB3y7Ky16HuJIWe64Vb52YsqXhi5YQZnMNvxRp6UXhahbkeQvHqNg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7upg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-921273a6cacso38781856d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364125; x=1795968925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXdUoqdbSRJd1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=;
        b=Xn+R2jNSxXixcqiAP2Ug8TqFY9Fog3Ba9w/J2Z4coeYFNmNen5hxB6tT//0aPiilTc
         +czWrd+WeHajdb1HkC5wfxVO7uANlPPOat7QKO0uM+aSdF1fnGQbKeUAzh+wiN6OtGtn
         l8wEbWtzUqfvUWlOGOdsSH88hg3Itay3UqcNX/TqpXLvFvXJMGcxcAegq67LdQ2iW+PP
         JyhONMWbIIpXSzG7cmR2iCbxoqhVG6NaV3udXNtNox+Af947WKCYBPD6aSWMiHV4lSGj
         Y0uPkLTO4UyH5Q0umH4AxeDUZi6BVBRiDvLk1x11TdQ5PmpMP5ZUPivR7YC0z3TI0ywJ
         45Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364125; x=1795968925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZXdUoqdbSRJd1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=;
        b=Y9IAM//oVn53c01BDyIEouH2+agM3sFfgagfPYWlKpij7S3yxkFNSCRsYhd+RvRLEP
         +PR0HjuSa8WB4eoaiQoQwzALOEEHPWiSLWnJryols2bdfPAeDyzdTBitHI5Gd0WE5gon
         J1jagDbZ6VEXd+okZM5LT3AegY7MhvEWgSWxB1qc/l0EOGR4lSi5D5OngH20LQoC72z0
         Jd1Vfqw2xWY4BeKPgeE0T3a8RaF4GYDlHl+tx0oDwTsZFcNgNLd1cpm/rCP2hq8Hj1/c
         8Z0ldaP/PSu5xmb57aLO0txPguT2y1vXt0qxEyXR+JMVcMAgLDODDll2lYm2NhPKO4Zy
         Ts6Q==
X-Forwarded-Encrypted: i=1; AL+hErEkP65jUHo9oVReXxQO8b6wm4FC5KMbggTRgvMKjLae9bBOMVtRQZ7q9KEbhPm4+/6BL7unNYNcTHLnvhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RzmkUrMToiTYoGY9HS00eKYHEmw5G4IqxlOZKh7LNOpF09dbN
	8AdFg0APRnnBkGhsGR8KpoPBeBPijMOVJmRN0ZjDW8oJdlT1vb7Iru7BOvmX92jVqaMrrQ/EISN
	xGCypQUWo31eZGonoOvu++k3VDslIt7oCg6yFRcyhA7QT9YtthL5nRLkG4379IVJCS4U=
X-Gm-Gg: AZFdTZd9hjVUmKmFQzfGR5Dp6Lj15JK/4Vn7CblQb/aJqvYgU/2QdQyZvVKunmKbYKM
	Her2QiqMxa98Y/Hgul7SPMnWKR+AylTN/26+uOXX99jBO+M/FZNdAc5hSyPjmqAEG8x+OiUeEaj
	SLRk3Aje8ObN8FxT89/Qr09x01zBUx6b2MlQthoN9fn3HjssZhvoEfqBwAsLDw+NJWrevoHQ0FZ
	rgUoghEBT9Hk+qsde0f4vG1Hl5YkLgfmko0TrA2e6cMJw2urcGUECEUYu6qH/ReDIYBAnyki8vv
	i8WlFKgfWmDS8JBmMw6fgcHjDkICIUnIt79kXbTUwwtOk8fs1t11LvpbDGEKlqUnfd+Ar+1hpXc
	n8YXjDz++FXK3kOz3tEDHlZdsBz8R/jvgL6JWjbnoM98z0zabSQTN4O508093b4YE
X-Received: by 2002:a05:620a:6491:b0:93f:565f:e46 with SMTP id af79cd13be357-949bab32659mr1278944785a.52.1795364124787;
        Sun, 22 Nov 2026 08:15:24 -0800 (PST)
X-Received: by 2002:a05:620a:6491:b0:93f:565f:e46 with SMTP id af79cd13be357-949bab32659mr1278937585a.52.1795364124226;
        Sun, 22 Nov 2026 08:15:24 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:23 -0800 (PST)
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
Subject: [PATCH v2 23/24] arm64: dts: qcom: mahua-t14s: add WSA speaker protection VI feedback
Date: Sun, 22 Nov 2026 16:14:36 +0000
Message-ID: <20261122161437.5994-24-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b03151d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=PlqI54VOmiubEWYg86QA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX2/2258gBnQW3
 f56GdGvrf2uajwmtFVokBwmpSQ7mge+4DB+mc5a/3nBKtw0MlyxJdCFEuaiYLpFfUl5ooSGNPgU
 Y5XDCTtZmVVPpip4OvC3v4ERHQfsN7g=
X-Proofpoint-GUID: D3H8TAQOduaZpJ29PHOfjvpsRy-XxJRr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX+/sM1yyIOlrA
 RfMBVQlu/AFZgmyy2sr6kNxievF98qgfYRfHTbvdvtlZP8sMxXmHkecweOEFpLdrLc0kIq6TT2C
 6mxeYyjAy2Y6YyREyckFDkZdIlb/gZoAThSCmCIHri/1LhK2bBQ4SzVHGbvRmMfp02wy4cla2h0
 QDDBUylFY1y9nYGzW+zrxLPvnybvw+QJ85AdBaGsBqNiggFiezTYY0/HCjaOhKJP4rbq8o/GpCA
 C9v/caUliI8E1/yMzTR/WwRe6MIbEzdp42LDJcteOW9We3EWQP8bs5j2qV9fUnAKZrZADVdp8mG
 Q3mexsVSSl2s1PevF6VTvITHfYyS6lf0uTOmRCKLGpohWbsl3hKIkU8i32n8KDhFF21kM/AFOZY
 H7FRe+QQyY8ouDshNdU7WgrPsXf8V2S9lBE2KV027NPUcBjMRBFm6O28gsPZ/cW+c/yUQzXw93e
 a7DjcWofNc+zg1FAPxw==
X-Proofpoint-ORIG-GUID: D3H8TAQOduaZpJ29PHOfjvpsRy-XxJRr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAI to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

The playback-side WSA SPKR codec DAIs sit next to the speaker-
protection VI capture-side DAIs on the same WSA Playback link. One
MM1 playback open brings up both chains via the machine driver's
multi_direction_codecs flag; the SP<->SP_VI control link in the
topology handles the DSP-side pairing.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts  | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index cc7ba3c21bdf..407a8490e6ec 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -273,8 +273,11 @@ cpu {
 			};
 
 			codec {
-				sound-dai = <&left_spkr>, <&right_spkr>,
-					    <&swr0 0>, <&lpass_wsamacro 0>;
+				sound-dai = <&left_spkr 0>, <&right_spkr 0>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&left_spkr 1>, <&right_spkr 1>,
+					    <&swr0 12>, <&swr0 13>,
+					    <&lpass_wsamacro 2>;
 			};
 
 			platform {
@@ -789,7 +792,7 @@ left_spkr: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
@@ -801,7 +804,7 @@ right_spkr: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
-- 
2.53.0

