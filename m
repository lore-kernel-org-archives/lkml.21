Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182217;
	b=1WrTiVt/dFAIg52JpWgPI31ZnlUNv85xyYnpoWljHUib2LZzH2V1F07OP4Vc9aXWeoSI
	 w8gGImZbgY42YO5obr4B2mQnptjJz1bmUVHReFI4D0VJtr6C9MiVtWVLeDWnLLjSdfDL1
	 GmGTlnR/AAvWLIZd6c3/aC+3lu55f/1L/n5JanZXgyiv0aLtPUX+2dcRlXh6qXbhNXNxZ
	 kHk/akjXBX/K5Xs+kqFyESYfmb12FqDN85sa+aj/c0f46qjrjgPFy9F6tRYrOC3tZZov8
	 j2+aVR4xrqm4OGlvV6Zlgk4jc8UA34G10TPyySbBciHI4fr645jVFBd5u9snQNKgaEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8tfQIoAmhbhI9PfFkSH+gD38a+UHNrkbahcyNoUO4os=;
	b=ZMMRADQKy7Zjo7NumBW1QksVzahaWY7DmTOBc/+OhUSMmKV+MJGtUxNQd0750c0v8Nf9
	 RCP3U1euHqbv1zaro6s3jzyDYPHCQESm80G3FhUmF8QlBXahnd13KHUJ1jRQ7HTXLP7oN
	 FI9cz05Fx6c3SFU+5lq1gRBFYoZplqUZ2uRNwObruW+XCu0cWtsxdWHm964jE9L/71ruv
	 IlF/fddqO1vVol4SDA6mLIaSyzK7ZReRlawkX5ZoQjTzKvXQQV6Aio6C+4TqRDv5tTro+
	 g3P67hCsUmbQIcFiCtLZ3zPAMkSAYKg7+C7BslX+U+2oUTTjRaF7WCBSg5rN+0aRd5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EXt6C3VQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IN4u26fe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6788560A2608
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6788560A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EXt6C3VQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IN4u26fe
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkCSM1017053
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8tfQIoAmhbhI9PfFkSH+gD38a+UHNrkbahcyNoUO4os=; b=EXt6C3VQ2JcShR7T
	GVvfexU5Hiyo2njDSWXR6umb14gkkqVudyIg/z7liTj39vlPur6P673EpvYgfbLA
	LWTynnvFsGDvqiaRUUpCjyetduEDpW5XG9L/hqPOnUcJxpEMWSQCnq3yALzxGkPO
	8vTxI5nz2WdAMFybi03wUULzRClJLaUUeZpFSwVQ+lvWLfdfBxcucJi/giTunp6g
	Nb0iI++HuTV4+ZAMKJLE/xOFqiO3SEH0gLJUzNtsfDQDWX2MWzll4GDONQEt3sYf
	bfMJDqVehLWDoPkidDIDwg8LT5TXJ91fhQ0ZrzVT3Wgv2xqaquTYU1ff8aK0tafb
	SoLK6Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqst5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3724667bc16so713421eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182216; x=1795787016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8tfQIoAmhbhI9PfFkSH+gD38a+UHNrkbahcyNoUO4os=;
        b=IN4u26feLl12W2KkAR65NB7AaLjV5PdbGLD91mGgo+vp9+QDlZTq4+g6NJFhk5rA41
         FJ5D3FFvEN0C1Qu95sb2pwYnItxIxlGONa//825Rx/EO3Sady6uurTznm6LFk12MsYCw
         8zTvvgENJYisvU3T5Ww3+H/ZymG8HAzVzqjHWeuS5GjAld/cOTT0PvHw1qcktLOQeoRW
         +jce6eDdLKbWJHkQExcSTg2CweptetPM4NnTz67Y24xDDaujnF/RWajTCkk1fKGy/K8c
         pwKtLvnBRk1wRu+KuXHwRnn0OfdTEtdFZ5uADF7/eyrwQHT6rULmPiOUA7kN1Y5w/xz/
         WyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182216; x=1795787016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8tfQIoAmhbhI9PfFkSH+gD38a+UHNrkbahcyNoUO4os=;
        b=buGL8UfAL61JAmFFsJsKG8MZdzPe2v4Nv6ywMTLNymtPldCs5V5XG5TCsf/LE/hQSc
         RGm5L9IrKQqpxvoqhTSxANFKqdcl3EVml2wz5ZTsqgKs+Cj9kjx736ugV6u9GwnjwvDJ
         tylNskpzFm4MIgaSQJi8d5zCixTZ/uATQG8fdO9oI4CkJgwIVT4Ro1FYx6fbwjD7v2PP
         4a6ybcI+F+maN5fv0zmIHSvJ016lDyqCI0F6ar63bi0L1qujl6CKSR4ggl5Eh/eYahD9
         l29qVlNSlZpNu6KL2j8rtqG1W0jI63+D49gMUv+ZysuJ5ca191cqvNlixvHJGr7Qdbqc
         5kfA==
X-Forwarded-Encrypted: i=1; AL+hErErzWK5AAz14wbuYG16s9Tp+RV1LFeD5d+XVVf7TrikC2H8kjNgb6sZZMKefniB5hH+BDsNa5MxjQiTDxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bnGWMVvuNzXtKXv+tnT3DaqulyKb/yA+JFgsYdq0GVzYg6IzI
	r95UN7zPPymfV4lND8VQIiuejMzhHNl6iJRXvJpIX+Vlvvpr14YWW3lb3GNgbo0o/mFQ+jbt4xx
	yKgl808g/CR/g4kc0UWa6AMQkxPbz3cjxDhRrF2AQ0FsB7CdBEEicqj8+FCulx8vtLPI=
X-Gm-Gg: AZFdTZeXGp9gN0PE77D7Czpx6Aib7i+ibFTkZseV9PVuHl/eMxKvV9gIOo8mz8Z2ViN
	LLUwIsrrkmOp9LSm00p3kNKWuMU41nOVRC0toRyXMaoGB1X+i8Nat3LXcDi9yVofX5IWC0pj1bn
	XxzvHq6Vu5EhimQ9KVW7gpymwDCvRHc/hLwJ0aNxyAISt5dUnt+pbRdWgsPjr1FcTuhAzMH+C+J
	286UQUoy57a7osiktk7q/mzyErQNc/cae1JaRIrEAVerkZbGTwak/rAgIYF5JiqP+sWOaK3YYMV
	rIxS8WvN7WOn/sj65PAbLlUXPN2v9mXGLxS4gAy8k5vnAiRrFT0RQf6GtLEsIsmZ2rhF+7Kj1/i
	IitvFNH48ktXNiXlskOctk8gisiHeZwKKOb1SakRQc9w+RoK5u2nHhlQP4sFZb8wcHHnYwJ+Bap
	uiJfg=
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7abb with SMTP id 5a478bee46e88-3860bd889c6mr1578886eec.11.1795182215830;
        Fri, 20 Nov 2026 05:43:35 -0800 (PST)
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7abb with SMTP id 5a478bee46e88-3860bd889c6mr1578832eec.11.1795182214992;
        Fri, 20 Nov 2026 05:43:34 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:34 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:44 +0530
Subject: [PATCH RESEND v4 13/20] arm64: dts: qcom: sm8550: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-13-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1041;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=n4/9ykaP1GAiqJF0FkMOaaqLHTN1pKjv/oqRYjt++ng=;
 b=726DhEZpUXUvkLPxl67ZyaCjxVgALzXfrEUAVeS40RGbSp26vuIM9fAEcFJifZWD60gu4TCqB
 n9AYxnZOgJaA2zhyZOUOVTdcErENn2P3TCPi4ghxJuXbnRzIXYESNkX
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX1Ekzuzb2BM8x
 6zcGqEpruvh4w6srWufYhBHVXiyEfjSUq3/NJI3U8aWsj0pDCYGPMAcrsWuLBHgGLnqtIvSZ7em
 5HhyeYtsVIwAJw6o3/ifKsz1wj5RB1xsiiNPV/qT8HA81Xx1YcFuznV4c2MIhrkgi6kcSw/fTes
 ublR9D/T8wrMjokQXmeQyQnqThSejO//bqC35iK79YPLkcuQOLFCgtT26JbZAZfD08mYfAUjzjV
 llFsSXb0s01usR95czEYxre/F0xGHNRZVa+WtTXoIzELNf+3yaSWezngne5w7w47QyrrBJ5aoDb
 KEMlvKCVzvm2BIkEmB7W35tTCL8qxy5fMEJsM3JHSADSBJDupWX1K7WRA5a5FKNwH+aYA5WiHEG
 CkgQbuVhALZ+g9G3aEwjXqj8mJBgXciQ6wNSQRbs2ZBRLvEArZR9mXBtiYctDRA+2+KXB4R8ECs
 b2smyDpJcjLQ/j8kjjA==
X-Proofpoint-GUID: PCNpd_U-29-KTPhlutSa2xGQm6302TpL
X-Proofpoint-ORIG-GUID: PCNpd_U-29-KTPhlutSa2xGQm6302TpL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX96jVxiJYySLo
 E2aadoFnrqaSUC6zEQm7ucPSjqF0dqt4sfrtZ8RTMf6/PBrisNx8ZVq+KsIjSw/o/jfAvkwZow7
 2AJ34f2X6Dt4VYl8KIZemXml9x6JIzU=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b004e88 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JoDS-ckYLr40ggPBIxEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On SM8550 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index cf7d67faef92..1604d590d7f5 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3073,6 +3073,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1

