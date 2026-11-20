Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182187;
	b=Y7aXGi0SHnB+jJQOzUpue+15k02Kga8xQxB+gQJ/gjM1SU2pCp2RtLHvG7sBTudQQBEz
	 cLJC0eSyfYCzi3Kwpq0w90ASWuZkGwXPp1tw6kvjYjbaMaiKolFBRuvr0RkPN/eEPgXMo
	 h9DbWGuxKlkNtcl3bSiWdeuVoVmtLMetq5fU9PCLaQ9Tj+Ws/m9oXgC3/eBbh413ple7y
	 8LDRG0fPRCFVFZloTrBBs2ajXq2h0zeryn91ZrUhDbfChZ3RZYtzQmiCNjXY9/AZpUYH8
	 5pTeohDwZsjBEJ2Eo4f1t1qx3spcedwAR4pAem9TDk9yq6DfR1fv3eWIVHuYiQLK5tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=;
	b=L8W/k8d2ajbzEkj4aZzJmc0z2Cgm4G2o8ZH1mZMrMx41pa0FjTNgFmlogSr/0vM3q28y
	 TuY5r18GB1vU5qeBm32w0nIN9j07bS1nBMC7VGPyIMrdx0dviVoGpXyOwGPmgXsTrhR+i
	 poBZFY/2gydqSU5xQioxP3KIXozKmqhm0uLiaRUHIN0G9Fey0zS0IlH7oSANGf/XVPwSS
	 zfbSbOXEl9hsn1nbh2JePyHZcYlzQRhwTRgv1kPaIoSvj0tYnTRsvoy4G/+F7o2tSIHao
	 moigKtzzIl4Rf6qCbbTUWIr9xSEuxlz2raaz4RHJLEZ+Pxp3pbPU9wh0WQgCDERrMkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ghWQDbGm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N2ueehAa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933B760A2615
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 933B760A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ghWQDbGm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N2ueehAa
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjs9Q3731129
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=; b=ghWQDbGm/RfEzbMb
	9mYr4PyVHHfjH6865baF+WOueDP8HHspGjuacGVEWATd5rru1puooKpX3QbLS1Py
	BzdFjH6XXUE6YeF/yXJvjP9ibnmLX9MRyNf9ZfJxLcDsIHHvcg4x5Xff26tzCgER
	N26d06GwT7Hav+H1/g/t2ycw/cPuBOb0nAtK0fMtOA9skk6tOzs2jj3sMBrAHrnM
	zaZvoKKqWHkZ2G636TI8Tah5pZxfpfLMhDa0VheZF/naDI7mwNEoqNk8u+3s9oE+
	7e4z25Sem+AJnOtVy6oUYbWgI5QIv9qb+ZWE7wBMf30ZQxPNi/axKKqEXu2s7XQc
	IJu0uw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4gndn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383165e9b0fso1015103eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182184; x=1795786984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=;
        b=N2ueehAaT/hJZu7Ga7iCO6z+N0Xyjj4JZ+Ohz5QI6V0mU+jxie7rkmo7ywsbbVXVjb
         t4LtdbDLLZmHSK4kQP+v4U3vxd2H/xF9dI5r01lLij0+Vs06bZESAuAf2vdY9sZltybF
         2ZiL7yZMp3ANbk24t+tLiBgoixMeudvbvOz97Lizai4RwclQRUy6YfEwwdKoETLo8KDM
         yT0ZcrOVHsAqNDvyeqWHVADZK8ElA14Wb3+yTlLNj+eHveaFU/h+MsoZCIi1qkdw9fKE
         UjIsEhVauWrAZnvEYyEXj6f25R5IDulULsglwifdjooR06/KpTlEZjo9vDBXXjB4ekkq
         qtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182184; x=1795786984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=;
        b=ZwwlE+muvGI9HQincTHOl1VBrpefB3q51Rh/g6qndkhlh++q4uXqH0qRYo3DFkcEUK
         kT54Mf3qL4iWJ+9NUq0YlkJfPwb1kOH1hMdPhAAYyliIPsy8XGWfRgLsm0o0K2zRg/lR
         f7/OskkWqYhD6/vWCvqauQHDwERbAYogg7H+Gw1wQ7d7pIBnaD1LTnUwuu4CyuVykL3Y
         z7oYROSljudRsITxomD+2dzTyWA+WEwoj5vzR+B+bhHtV0FCsOj7PD+62717zFtUkrpu
         U+ERmcw3b02gRcV/LGod7T3GSg7PBOtZtDc0fkghzyF+bk6eC7Z41DK0jkOcWtIEg9xS
         McRw==
X-Forwarded-Encrypted: i=1; AL+hErGQreFp3e7hEDQtceMIAS47FINaBp/dNcQrFX3LSRE8n/K2zPM3qpa2gC2ysm+XqNWTRlG7arAZPrvVTMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FLKmyr8IWYENe/xQ29egzB9hSKYQxakP7zMyHteIBXzPcDF2t
	yb7q0wp6X9+5VRnSkvPugHyr5xnxCdLbCSEABOhh5zLfBmkf6hjpHsZZjoG5hchMsGYyxMCf23z
	1BmcSeIyaRG5JtLmGU/QANEi3ljbSsQ7bsSFvyKKig6G98QrNVlU4I5+h72nswm24cZA=
X-Gm-Gg: AZFdTZd9OGjznTMy9M6lxq+8KkTvUwfKP70YnfC7/ZRUfTV0HAAVGOf7XBmT9o3/Zu6
	FBvYa3sinYnS4BAk3TcVVrSDJtI8WfroajpLh02WrQnvV8TlppdYZc+58Brb2P17xsyYLNHlpSF
	fUIMJIbT0EbXa21xyoiYdbdXIdWCkiqevtpNcoLuI7Ai2D+bbWVCOSghOaWgI7Yd3w1ZsmCEren
	GSOCdxq76h4+P7QZsiZQn0YV4FcFlz40+EsVZYCFpiV0btOIg6wCxZaQArcpNxNzjNbe5CxQS8F
	Afl72FfF81NnzuaPiRvRvkMU6d5v8owq3ByU1zCjt3ayBHFf6E6p74jcYDy4Ir7aEhmlzlpVKGu
	rw+FFcrJElVChUeDFtTg96cHx7xcu8nmO+SWC9U5QaHomAtKLkIgLoV9bN6uaxeDkkaywFlH5vD
	zhhSU=
X-Received: by 2002:a05:7301:182c:b0:376:e950:873e with SMTP id 5a478bee46e88-3856f659994mr3192414eec.12.1795182183454;
        Fri, 20 Nov 2026 05:43:03 -0800 (PST)
X-Received: by 2002:a05:7301:182c:b0:376:e950:873e with SMTP id 5a478bee46e88-3856f659994mr3192369eec.12.1795182182790;
        Fri, 20 Nov 2026 05:43:02 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:02 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:38 +0530
Subject: [PATCH RESEND v4 07/20] arm64: dts: qcom: sm8150: Add GEM_NOC
 interconnect for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-7-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1053;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=9j6IWx76cjPCAQZYybv4iXqHVebU//kZAlxNICMxwEI=;
 b=Q5lXe6lJujeOj00C7B5u5JWgPIuSH3J9emwvnAUTAiwf7hbY2q8uNHI/0TWnEjU25aY5pCK8+
 qR0GG8stZHICFvs4wha1pqrJMlaprkX+Iyva1ZcsqdjrOm4ImQnvkfF
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: Y0-2zm52kn0K_c8UFqiXsGZoRNirHxUS
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b004e68 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2mEde68aHbpXMYUSS8oA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXyJXzQnjphuul
 LB1k328xBh/pcBRBxHWBECYqnPYdpxxCIInj7UxAXoFG1bReuX632tidSI40S6q1bTw46s52y2/
 JokTFzWavCai2HiRS0ypaPdv3SENFpQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXzqisXiTUch65
 2+W8U+GyUgf2l4CT6/kqWjK7jesk4Kj79Ju8dN5p37IooQIRS31+ooyJrgNsr6ZC5bDw/x9saN/
 pDzKQHUDTdWVNgWFeEe3pKnc8hWfXA8fHPzjiwd+jB89q219KLktDNDicIxTP71wIjUvt/6wdbw
 S3ML7/eot/+6XXhtpQ4odzPrYpSbalWvTbWTKNpfYSrIkBdLplzOG6FUa6S8TPkNej1Mb+nj1E9
 pJed8Pwd/MsNx6ZEl69Fx1DrbM+xbM1QSjzflz66elAxCg6prYzIYikYeVLDR8Korn+4YQSSn5z
 4ZE+8TN+ltZ9i/VA9yp+aRNwHu/WVX3tng0aZ3m+KNRx8iNPasUnSPGvp8oJTOUylE2F9Rr+bpH
 24ZENqnvzfCOMXR36XTVsPe9O7j5VPogrtU6WQcT1ASIcPlvTMSSrjxkhyCHnoRlS/xtDkj+OqJ
 t2QIzPbgJn0Oo7Uuv0A==
X-Proofpoint-GUID: Y0-2zm52kn0K_c8UFqiXsGZoRNirHxUS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On SM8150 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index b9846b424a93..4b2ff316db72 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2396,6 +2396,8 @@ adreno_smmu: iommu@2ca0000 {
 			clock-names = "ahb", "bus", "iface";
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		tlmm: pinctrl@3100000 {

-- 
2.34.1

