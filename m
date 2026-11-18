Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007357;
	b=xyeJX92vFLwb0urh/N5DamffD4fmIHkmlVuCIK1Ewervbwq7nHK4SjK4wmIt6l7yZ1an
	 7Yw+a9bC00UsGWcjH7WT+mmQCta/uxtEVGXt9jabITVo98+dclO4dT8Gd9b6/rJyT5Q6i
	 UE3lX37AWFfvjSsV8iBlHpwDULUzqUcp9MxDuD0SFybbgq4CPfy8YqjesbMhjkNOlb/cg
	 KViPMF5swVhTEO123ZGN1DTFbxxbO5sPflsgtHBPkTjgMnvVxKDTliIMcYHi5vaPzKXDB
	 7wdyE/uOEa7SDT8Nigy5yu1Dy6eInE0yr0+lhfzjuPgFn1T8Kb36KgeTjbjJAQzOQkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007357;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hGRlOCITxGrJlyMVtqXraDekEyGY6Do3g1FwaEQjkKE=;
	b=I8h5blxRBWiUA5RIuc82PGg4ejp5YuLtK9mXIIr1LQLgMsiZagZM/u1EOapJlce3byob
	 sjPn2KgmofECkIvCHgObt3/VG9CWVbe3apk4jaagdExqLza8G2boKDsmYITFmlO9KG7xK
	 vQOihrfclI9kNayUaGbP8zvzS/FJRuo6ayOJmEq3zbqEgep3Z8mqI6gB7vC4BYH6mACMk
	 gsI+y/Ay29a5kAzA9PAc5jMby0gzNTo6MpCJAg4ZTHUpP7tebqFKwurw5zapG1Ym8Mq+y
	 aTMTLEBEIN9QtfFf2pGZvGzw1Ln1otkVvubFsR/eelXMVJf6Y6Ts3S5wk5Q/Lg4kVIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=emTk5UXQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8BqyfOt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E128606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E128606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=emTk5UXQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8BqyfOt
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICLFoe236005
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hGRlOCITxGrJlyMVtqXraDekEyGY6Do3g1FwaEQjkKE=; b=emTk5UXQE3v2LVIL
	PL71S2IRUG5Upp4XtTueqDaRhiPSOmfP2VfR3K/gWTmVMxm1CAXEP6ZuwDv4WtiX
	T4ud2ylNobOBIQX5E9LP2F97jGW+p2iUDTOOlOaA1611yHOW6Ome98GqU3/s5m8d
	5eagLpQLD9e4atW42ZmPBRM2hhz5tS0YiiFcxFencU8co4qIOE7n4x6itNlzRoQJ
	5R5QiPJpNTwbgnQ9CA1zgTO9jDvujbzMQeDw7KxHvsxZKdrX7hZvTP8l8XJyKaiQ
	MU5GGG2sciHUj9nygHX7IcGidY5NVKU2F/+VDX37MNYLUQasigN1Zj91RjewFsbm
	9FuYSw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9k2qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:09:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8bd9c977081so60854b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795007354; x=1795612154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGRlOCITxGrJlyMVtqXraDekEyGY6Do3g1FwaEQjkKE=;
        b=g8BqyfOttYw96Rfsm3eGWVJ7dWHo0fVtFYfZw/baCySlYjVr8745bDDjieIgBXP3Zo
         X9eCsGf+m59b382CgsVjnNKZqZ9ed/+dLeqSHxqyPp/Av/MewWMu223nAp/OchvSEBmx
         YjxBbYY0O3htLrI4tNc4Gn+2QcemysBym3MqRO3RcCgjinDKqmWwQ19JMaSrwH7HaTvA
         /8Bq/ZBHFmLYTDzaDBc8X9YQT3MLBnmiaUaOhOkxlteQSxLN84vK2o1GyR7zT32USphC
         IP39Sl0tVba4cb2ABIdjLe6nIxnD4BjxA/sDfJXhY1naGxW1woRvKWcuKSVXa4Z7i4ED
         iR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007354; x=1795612154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGRlOCITxGrJlyMVtqXraDekEyGY6Do3g1FwaEQjkKE=;
        b=MunhPRvMUDl5imWYkmDJC/2gBk5UHgZ7o9Us5uVxnsHOdSXQ3EU+W6K8yxkUXwzkZA
         pvvqZ5f10ZRRo/ukl0cts8mWZl8iI/Dud5k0O3wjX+GyP40qU7kEXwfR8OjgAsW0bJdu
         6jIm/0yk2K7OkHo6FboUubbhtuRwA1UBp9s/+EaxrzgpfIbpXNdlxgTDnm6l0c9mJWUQ
         b9hY+Ro7W4AeJNYPPGSxmuyUAhCCXEQmF0zeddYWdT0fhS5Xq8R7vh/zgeE8klp1KrFh
         XT3hGgR38xq2QtlwRfumkBGz2xqI5spJd7cvzH5TPe3+SA3Q7HhsUp4I1KD2LxGNhdI1
         0/OA==
X-Forwarded-Encrypted: i=1; AL+hErHfpkDgan1nk1v8e5CRYZ0v2MRS+SJQCFmelGCVTPoaKKpIopXgFsN73BW4SkO0CTPLpDdQzSz3cSe+IWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MI+wZKPzkUUZSBySuRg0hL210qPyCGEIopbdv6ij3QkSzrfi2
	6urXx07mGnHckcF5azWjN1B3WVOp1axl/etL3ypJHYsxrh7nwOV7rgToS3tiNuZG7qTcU2EMzdB
	H4BKvn8iha2oJfbE/ANZ7XUtenQYWK5syfu0aLMiPYrExqsLQ0xQFn2VGZZvqhutX58o=
X-Gm-Gg: AZFdTZcuJBwE2eoYRSBGGvLS/eVz//uKqpy6mT7BgvX2Lf4sFTVVsk7dSd5lVYs2IAS
	WaSDRwqOnr6zdthL8jP1rHCsfevqND3BuDHU/90mKtuOeXMmbfZVTJav99HtdPWxgK5riM/TXMr
	WjHbWd51OuS2OHzXWiTsL2K0riQHNtEEUBDIWrY2ps/RInOCjnjAlS2oB9vNPlZZeUn97aGFkSu
	XABNOL5MeIRxgK2lBYDbMnQVe2Uhe6AEdSVDt+l1jzmcEoUTwRSEIAo9hjcuLsI+I6wtv1J3L8p
	W2KIuuWGquv234ZHbsQkree2tKGgu6Y8U4dbk+iaxerV0Es6pUhEPgYD68ftZKjXaPDk28Wbt9Z
	/DhBefVo8u+6iH5L2A0K3f7ip/BCuvMIxFhIhwUe7TPy8/d+e6Jrw32YFpTwxHuTRjUBbfuJo/+
	3bp5VtHVBx
X-Received: by 2002:a17:90a:d2d0:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3b3d064623cmr4717330a91.1.1795007354039;
        Wed, 18 Nov 2026 05:09:14 -0800 (PST)
X-Received: by 2002:a17:90a:d2d0:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3b3d064623cmr4717270a91.1.1795007353575;
        Wed, 18 Nov 2026 05:09:13 -0800 (PST)
Received: from hu-pvgtejas-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187dc82sm4909533a91.6.2026.11.18.05.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:09:13 -0800 (PST)
From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 18:38:29 +0530
Subject: [PATCH 5/6] arm64: dts: qcom: nord: Describe the GPU CX SMMU
 aperture
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
Message-Id: <20261118-adreno-scm-fallback-v1-5-e99cdbf3121d@oss.qualcomm.com>
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795007310; l=953;
 i=puranam.tejaswi@oss.qualcomm.com; s=20261118; h=from:subject:message-id;
 bh=X3BYyKqxKWnNq/2Ee/BaF5+6CSmMGjwe4nL62q2A2QM=;
 b=UkUP+L/Nz2kMolwrh3okH1PQP7XCpSODyv6+97tzssW3NKCY6eYnOj9m2p5B1domMEQKvaQWz
 SeiOJQK1+mgA29JPDjhLLxzxFan9XU8VJyen2q0dOtkyuDeuxgOwtLU
X-Developer-Key: i=puranam.tejaswi@oss.qualcomm.com; a=ed25519;
 pk=I7kFxZ7dcroo7ZWUatk8fR/J/KVbRzZq4ZBLhRRGpJo=
X-Proofpoint-GUID: 4Rwl6PpOShKeiTLgHkzPtkcrHX-haElm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX0RZujasvbb/t
 YvVETYutEDzAH4PPBa24niN5qWe4XPgNYWK+B0YftCfDKCfmOzycjbNli/MuL+nYTbyGCWX6xRr
 0sx+MterG/F61kgbwkI/Xhzgb0nnYkI=
X-Proofpoint-ORIG-GUID: 4Rwl6PpOShKeiTLgHkzPtkcrHX-haElm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX6YDvg1EwY5Yx
 Z1VtDLppVCHPyDBVGoqYQn1M+1JbCk2Gd0tNUusA8tk91wZluFkodu53lA0V0MyIzLpX0QR71jL
 5YLao+zVOjDTxHDy2Wph7vGHA+7HqxYjkkI1T4ipKlu3z2UiN/kYOuxxufn7oUilQkdriu4KmMt
 3lX6BYbg1I8j7v6lkwSJfXSh1T90tSPdMN/MWM5SXrx0ebeEcmY6lq2UoxSQIqvbXnUi0gLTme4
 8obZ7U8MoQgjb3JoyytbX9COT9WXucrbd1WPJu6g69WRvc0trlI9JKZJBgaQ/a2c6wjp1Lz17Tg
 YNTYSrQf/Go0NU2lW9OnHHEPuzBCU22NHK7B13SeiBD7thmXasqwP6bhPS/nWzzXqk9OBCKMeiw
 cmlxoxMhlkDKQy+dDdgIZs3mqE3YPG5+SZGpwbnqf6XIn8g77/w1njc9G1Jt6f3HT6SIpBUMncE
 oK3b9IcMtmKAEmMUzFQ==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afda37b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=LT-FgXCurgc86i5H5_MA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180052

Add the CX SMMU aperture register region to the A753 GPU node.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 3e29c43ca9ad..cb5ee6b68779 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1717,10 +1717,12 @@ gpu_0: gpu@3d00000 {
 			compatible = "qcom,adreno-43051701", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,
 			      <0x0 0x03d9e000 0x0 0x2000>,
-			      <0x0 0x03d61000 0x0 0x800>;
+			      <0x0 0x03d61000 0x0 0x800>,
+			      <0x0 0x03d60000 0x0 0x1000>;
 			reg-names = "kgsl_3d0_reg_memory",
 				    "cx_mem",
-				    "cx_dbgc";
+				    "cx_dbgc",
+				    "aperture";
 
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
 

-- 
2.34.1

