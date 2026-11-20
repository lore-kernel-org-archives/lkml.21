Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172881;
	b=tLHHG0WM7i4GIqtN9Vz2zdJcXY3XRZNSQpkJBhu0j/66aCrvRqfZQCaHd5se+nRQiH3e
	 0YXmyY47ijds3EO3vKaaNWldG6NKrjdULUtTKVXukB4pTUJkwA6YbHBfZJ1yiZ8lgeyLe
	 xTfEnS+1fcbkDqJQon7szyNfeaiC/37iZE63ngKznKl7bGczwpt+KCkUX71ljgXk5dx51
	 HggNZjVmKoQ6l2/sYw2JWMG2+By727Qogewt8IxdxtXQv9hO+hLhc/XlXMJQEwYzASwQW
	 x8GIp+yAGpm1AXE6fWbnT2bJt8UkcOMdO2AiVtehvT6BNdwk1OJAzLOzDxPE1NR7bcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SDP+V0k/153kXf8kggh4dD+QBvViaqb1sIHAp9EgEOA=;
	b=L6VBSU8HjBLPCFlflG/DUf5Wcpt4NM3XQr5Cp7rM66hpeXh8T2jdcINUutf49NeCmaiT
	 WNqf+Ul6bNFHHV/u+rAs8RT2ramIjhs60H92eo8Wn+4d6ImjmWs8lW5C6WdlrC+1BZWB4
	 iDwP9rExSCuDbPbNL5VfwLXarVTZLR7nqxTG6Dt6U/Emf8nGwGAQawsUa3LZ9Swa8UogI
	 2NrSpFoRbllf1sO6TL8j8eRPPRSahWE1jLjl3ZOc5QDyhkkwkrLwCAFW/SNYuXoj9kh2h
	 +wuPji2S1kVhH7iWHrxTfTBfQOV1+kH4vyxFg7thZjhaS9PZtvVdwQBlm+YGxYJwTqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eMz1aTBh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F0TIg5Lr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D627B60A2630
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D627B60A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eMz1aTBh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F0TIg5Lr
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjuTZ1168927
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SDP+V0k/153kXf8kggh4dD+QBvViaqb1sIHAp9EgEOA=; b=eMz1aTBho6i3pBSq
	Hi4uHg5OUvEpQoA3uxCsDvmA8GWfmflH+qkW8t+GZuMTZVPOUwNPHvbL7GF7+LgH
	idr0PtpVEoxoOFtKnrULAq9YderDyZ3IjY/qWcfHNsOHDA+ZfP98iKAd/oYrqMIB
	OY7pVwGF1jCW1myF7AxN4Fl64C3AmYzF9+tFvjqqQ3xAnZTsUSxz7n5yYs76n0ti
	DUYM9GR3p3ueUyf3lHkxn+CTymm51yWxx19hkX3ZGprikP9Ipg20PWukDGo1HM1v
	UpL5YNbZEqTXNgs/9qWTTvPE+ZtK8D5Q4lSfyQcGpf7aoo+IBXzGnr+f1vpSvXtw
	TvrNvA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5ucwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:59 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso964838eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172879; x=1795777679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDP+V0k/153kXf8kggh4dD+QBvViaqb1sIHAp9EgEOA=;
        b=F0TIg5LrnmKFIOMAxRBNbJmHwwjYjKwSXc7W3Uoxuhmbm09jlDaWSEsBiAyfToL/t8
         PtFnBKiyLATIppSEoJ2VvnylzIME4JAbUKG0wVKSLHi/vtMfsxf6pLgNIt8rmq/3X2cy
         Sly1vGQhujy8Z3LY+y7iNBI5rok5bB6BP/IQNlZSvW40/HEVAmPP8M/X4GBwmYvYZbaB
         sZADreIuxVZQpfl9DMFEK6D3y73lz51BCSyW8BxN3TafGPZH6kPO/oLh9xkMf9mNJHLY
         OcNrqkzCNM6jdQ7JK9jgNr9WRT9JmfEmtsZxUgRPbWKixujLa5gtG4yiCut1v3ZcHPVK
         OSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172879; x=1795777679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SDP+V0k/153kXf8kggh4dD+QBvViaqb1sIHAp9EgEOA=;
        b=jwgtH+/xaU5rd5+06+0BOj4wxDwMs+p6/RfB9DgxY/odKFh4K+El/lzvVDmJ5NwLnL
         vNPIFfxDZNKcsxkqsPdIfTx/c1UK1fgZ/QOyG6RL70Z3zduq+S47nDNEwrYbx5GV1BJh
         5EC0z1y/KriitxMb9Kwhbfhq8PjwqNDDMgo3T2JOoUAqI/wXqpHWs+LRrmFUKguWigjg
         YDypqPVo8Vt5aD07inc9Nyo5WyrA5LFycIvVPXgUZkZqsJiG30l4kmWBJxXPyfuEFOQz
         MXt6dD9k3veLyVGpk4t2NvGNU806JtCRH7zj/N+XkVHE2IBonBAASqyjCTEpVtHPSktS
         ZjCQ==
X-Forwarded-Encrypted: i=1; AL+hErGvao2LQRrmQTVSPRK2POX3q2oz96q/1bJ1K2TiUvQIvyly/8xyuN73I2dJBSWZydk6XwIqKosteM7X1ig=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+lF3HVqSPzG0GWjrGK9/FwDUc+9TQWAUPskaE7rPQTFRD4LmW
	j4d86GPIG6w8VjmuWTp+nwUADWqENBdRYvaLyfKgS05gab0x3bqNuwWJQNpQw5OivYQpXfewF8q
	2AZZp8q4Bq1/LQqui0iawWwaUUuXnzLyga2lptOQr/pyvG2+qIZKqs6R1nu1DX64YZR0=
X-Gm-Gg: AZFdTZeD7ROVUvzc6IUAOow+fYnXCQFYd4NmTcL0gACsaYnXC54dhj0uL0T9+N7uhm2
	nzsubdM9r5vBBPKPLVzxvVkwt8bvD+A68PM5vgs87FFrXs5sOWV+kacVKlf1k3W/ZcHvD6MsYPz
	Gv0lYH9VD/KEJXy6t5z3dp+kZf2wACBppPAmW6qSz5TFMtWjyE6C8UNSlI/FXOHRGMkWL/g+vxj
	x9pJ2+7bCaZfqUwa/fx+hP5AI8bKca0Ep9bckVaaJdh8/mnr7tkFc2Fw1uHDKrZ+oFJ47gspkEo
	bILRcjD1jgv67tRYlhEIsAiikwQDT3lohHsarxdq04TtakGzQKH1608HxCr/SIDACG5w7cLiYBH
	fgGvGVcZlOr7ZnY00A2N9oeDvuZYfzMkM7bi//u4CB2HUYHOgEMNrrRT0nPBH8nYuniQjFi7UDr
	tKxQ5M
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7ab3 with SMTP id 5a478bee46e88-3860bd88965mr1185249eec.29.1795172878590;
        Fri, 20 Nov 2026 03:07:58 -0800 (PST)
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7ab3 with SMTP id 5a478bee46e88-3860bd88965mr1185151eec.29.1795172877051;
        Fri, 20 Nov 2026 03:07:57 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:56 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:54 +0530
Subject: [PATCH v4 13/20] arm64: dts: qcom: sm8550: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-13-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1285;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=ldSuaHHBroDhtrYJz9kdhWBAKmQCNWPZ+kaSFsE2iJs=;
 b=1DhQPxDH5zxc63A6kUvXa+BgTYVKQcYTsBdn0VFledIHU8tPlkxAnaLMfB4c5tnQce7U5alow
 YYZNkpb7ofpBfaW7Umu0jWjraHGjx/Sm/DEEBpt/T4QaLy1jvaqnOWp
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXztgE9YvbYvft
 jneHBKWvUcrEBpw8Hi7rd8lm5m+S0joX5W3XX3524Ti/wlFWPmBzxoKZTWSDJqC6lf6KCmRqAj+
 1avnH31hWSGtEpVfAlAlNoJyqtcsx74=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX94BBVSWxJuOf
 +evnhBEib2zalVbAlIt1673sBl02aO+W6aqTJiYGt0qJlTFFpQc/N290dxn1Itn1++D/NWZHsju
 QbPuJlGy+v6BmwB1BYO898E57Z9kf/lewkWwzQnj4C3ozTXuScmCb3rRCOSK/Nhkz6jC9QGhKZV
 Ub7ha37+gUeh7p6zzGeciDDttc5R3sc2lKRJo+6cpj3zZFqGPGE3B8YtelFedXh/GC2fCPfCfpL
 85lRGe1wjIBr8HiB50MSt2nPqeAIjDerDkc2dkKpEEj6NEXjbrK4oaTrtEn2REWy8g/m3qwnD3H
 dQWFPKsPyRx83yX6sbzMYmrNvHCukypyMTPKipiQ7jVs0O6EEXGqAnXbxQtkpC8G608yNcoqina
 YFU2anUd5aVGgqQnk37mD8jO+wxD5ynabTPnAQGJyefy51OQrjOYXLa8MwbMgGqmpILR+LG5eqY
 FuP9qyVYsqrW9At2KEA==
X-Proofpoint-GUID: R0xrpQhsairqOEcIh0RbZ4awhcAu2Wb1
X-Proofpoint-ORIG-GUID: R0xrpQhsairqOEcIh0RbZ4awhcAu2Wb1
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b002a0f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UZQlob4mJqq41ALSq9YA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On SM8550 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index cf7d67faef92..d11691a7ba36 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2898,7 +2898,6 @@ gpu: gpu@3d00000 {
 
 			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "gfx-mem";
 
 			status = "disabled";
 
@@ -3073,6 +3072,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1

