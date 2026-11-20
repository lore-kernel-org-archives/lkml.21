Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182191;
	b=BwpbrhK1qZ1XNJGef6yjmvdXSOE5NnaeV1P0NK8q7jw4RL3PifDN6DPgMRoCH2b6GhZF
	 F81hbCPWDHjl+l0kDWtT/Ld4M1pJKAnJqe3wF5M2GiCteCqqzaa7FEiE9g084pUR3ez6C
	 4AP9Cz+u/jDtO92mgS4R8zhgNVCFcJqbEyPhK72EvrHVY6pw1z17K8qGgSpiDU5RCkzHP
	 nVLVZvuUUchnRebGnImRT+vti7ZkAKboNvKUhhOY+8MsmMtd5/saX7SOu0bFDckyggQEJ
	 IqZBUG7NA1Y1Tvp28tTzR42Am5C2wDmmFKA+kr29X6E6vmeBpXN3oiWgvV+7tCBJ9PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182191;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
	b=Ye2ElioH3BIxLPbmB5U9ItkTM6ybuiZAux3DGK4X9WPPeZ/yWv2E/DJ6er71zSZBcABz
	 tpTqO60WIUd8ksPOFrFty4okUyknKWQnzygMBxgtQ6yoM4SKSNdl25PQnbiIujal4g8GG
	 jn6fK+aRd3J+wLdM6MhxJpDTQwJhNHkdglpzqSv+BWHKkAEKJ8AjjquKxW3spuMRJYDeS
	 4M4OvNYdTBfg1086baQjt0OJzvV9rihvGuCH432HPALOARKt0wf2q+8/+5gWogvFs2/AP
	 cjo5M0W47/c7jraZ5T4XWD2XdtEaMdV5YrTllAJ3CeO9JOBGfW4sNTtc/RT5/WwDjMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lV2OMf+A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hk+DaFyp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3754860A2602
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3754860A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lV2OMf+A;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hk+DaFyp
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjxGU1168955
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=; b=lV2OMf+AO/WIMczd
	5TY9H/Sm6NbzH9KrP/cYGNhJ81qogUKwQTc7Meeq+vgjWerGjMpfPO/MjrSjjpST
	jJ3NZSsDfUVYzUzbarDsHW8szqr+yN3H9aIugcOY1QYd4qRo1MmdzfnSx/uZMn9l
	rjhKsDiQuJJwhdRMuwEHQx3510yA5eQMeSZpIRzAqWxgadkbSAA4POKqFyYAD8Cx
	6hU1uHB+Xu99vJFaEOmYvmnLP3XxDdRnA9s0QprTp+J3CZxUMXj2vC/08UdO2Uhv
	Ubr4aRfxO5Xw4qipLuA/zBwfG20E9msp1kYB024jfyw7Xfum1fFBbSyaHsK7XsNi
	84Mngg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5uy79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so1373027eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182189; x=1795786989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
        b=Hk+DaFyp0xuBNzwQjaFquROeas+z/UbRqnGBImj+9FutfrNQ6p52X026Q+StuA+QUW
         cnWMYYtQhHnMoRfNLpND/M4eFRKLQtAxAsrDd3XLr8xhbb8k+lohUpfMem2FzDGYYoHf
         5uYMbJO+0mML3E0fN3/zQURJhBGEwEnLCNykmpEsoN2EqQY8b80o2riJOCUQNCiLFqW+
         Jr8mKiW2hZ2YPzDx5aZgpGLzq+TDa7k6vNjeUaXMNLv7KfjUxhviIJaIs50D086KW+yd
         C7ELeybSPSkTqrldQJ08jNfd7yNM71t9c17XyBKt72aR9C6495R1gq9hpZ2+0s5ep1q3
         LoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182189; x=1795786989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
        b=ACvMG2rQgK4YvDYFu42E+ThQ8uKqQQVLYOmsPrJH23s/cr6Vti1n+uxAIkawjZOs2I
         P9at13xx41nzkldw3PXYCnVCUmbrnjfjdpzvS03FKD/oW6tF+j77o/Iw6L/NTwTIYdoO
         2G0k6uiWLJsasG2UNkOrCvN5CUQemSt4n8V9XBKMHZkqERSyTuvBm1xmsEt8yMJZ+Bk2
         V1eP/7kktAiugx53VXkYFFVFuVpTP9cpGSDlEkkc1B6tFrqyhvf8i3XlWVdEOEAiBEI1
         LlgUNl0s2aC9btg5C15140JmUkRGZ7ugVorb0DCpwE3v3nrO1Pi0KOwF2x+ig6Lg7qvb
         0ffw==
X-Forwarded-Encrypted: i=1; AL+hErGL5ZMjie/W3H2uDW3bB68MOZ1Gu46ff9KSjJ10kwbd+yJf7jW658+8iM8n+OsNy5DifJ8lcNv7fPxhHnc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sYQcbLG9ZR2grebOCkLd+WTYtxtVpuGbrmvkCO3oKG0RFrFml
	AicKhWD4WCfBDdf195hioioEdyKsrs0iZtNrmZ7V+uWGpNFcgqdpxeB0pMFF+974+TK0gj65p26
	gixCvG0264oh4ow+wv6bLMWeUiSm0x0/iqup5vdGGwOooC4EQibR6UAvl2YL+FJWf3i0=
X-Gm-Gg: AYBFou2AFnqS1OzX2uxUev+cpnl7jmMmNMCQ080nFkjsl2XAGNWrr5khFS0WbOaRCl6
	XUsNuNAcFODQFxlLouaOOl9ORbQJOze9xGznsE5mSQd/dz18GrstQfegV8f5fJbC4iBJPIJPkAj
	o2AojsjklrLSangrASzpiw4blNptWd/LjJ2A1pBDR9kQ/1Kx5C9SSxWHQcd7srXVLUrzKhwNkX8
	SXrdMUrhNUdSEzOt7CbG7x7c03e4NGLwOo804rqKZMEej4b2YA0NTXJskOmYQVsE+Sw+HhQr5Zz
	5aIzuGvquViF7/Bv3DG6Xw2NYBMcS9x7/5/pGCWPcOEMCl+kx+6ruaON5SjK6ObOKC9f6W0iP13
	I/uCm4O6QcKNGM4lsfaPVWCCgU7dmNUFNi10sisn78aS31F4kF8C0we+gOUSEirFFq6NliRpYJF
	hl2Os=
X-Received: by 2002:a05:7300:601e:b0:376:6aea:ab with SMTP id 5a478bee46e88-3856c5b58e2mr2940782eec.3.1795182188830;
        Fri, 20 Nov 2026 05:43:08 -0800 (PST)
X-Received: by 2002:a05:7300:601e:b0:376:6aea:ab with SMTP id 5a478bee46e88-3856c5b58e2mr2940732eec.3.1795182188122;
        Fri, 20 Nov 2026 05:43:08 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:07 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:39 +0530
Subject: [PATCH RESEND v4 08/20] arm64: dts: qcom: sm8250: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-8-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1033;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=W3R0vadqLaDaPerwJqu9PSx+OZnsGkbm84YuXP3uSZ0=;
 b=UXjvyPjVSFUzv8MWkI6PHpXR9uFIip+8s4FKDI3V7v5De6PmcMG77hWXmqGhPzGsaIAqRjl5e
 dXXkYAE7cPcDTXRoKoXj3qGk19IsmRItdN1AB2V6qAWzSjL23J+XvLO
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX1mSeyQrtAetQ
 hTQ7PpsmhezOk5w4Fa/yxMk45N6ZjVUutvA+jQ6drafzBUTmqHdv/8tWA1E4ew7PoXpIR19BKje
 5FHKgqICX0zuMM7NZENs2HllA0ThYmI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXzIEnoW27HA8S
 hP1klFb1pbSZlJtuTFLix+eW1PQBEGkiVyfg+4m3Q5b0g5V+5XUsEMU1NnSbUQiu800CH9PYoCq
 TnPFT5t0HO8InQImWUMMjvTSrRKhGqE3ZjjaKXKO2mLKIj3fQdAvf/xf5ALjotPPvIKn1bMIiI9
 OGD3HrPtENzubBOY7nRd7T6PGSK0GN1IxpWuvWyzd2Gd9ubzEiVEiHX/O5fALut1loQcZqarpnp
 RBjGZ5pRxhQCaUXdGxWVcRedNu+76pUzyTquwUkvBwO83lHDJH6Pc02XR6kIbYwmJj/6jbVxB1M
 GQ3p3kcp6ZhGu1HzLC2fVJvWcEqGmC5fldzWtk/JcTW+0dI9q9yR73Fnzb+nEOd/S8SeJPVoIxh
 Jm3Q1WI5vhVBacDpuLsmxPqI8ch9GWr4Frf1rVOcMDbfVzUYr2zMfZiWL45reLlkAOT97Nz3Ajg
 XWNkpizzRbwQ/Jwbnzw==
X-Proofpoint-GUID: hMCX80lYaqg3fIT1ONtkMp6nxfb46a-g
X-Proofpoint-ORIG-GUID: hMCX80lYaqg3fIT1ONtkMp6nxfb46a-g
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b004e6e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IeQ55TmpMpvzCWFLjAoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On SM8250 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 992284e64d38..3a368ef7c22a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3089,6 +3089,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		slpi: remoteproc@5c00000 {

-- 
2.34.1

