Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182181;
	b=CK7jzOEiMy+J1xwXSN5Bo3L932G35PRewAnau2FPww+x9+4D9O5oo4D1nx7ZqO7pJfRM
	 y4LYNfZZiBVaulhS+IYAvRO3IKn0sbWie9QY/iunRz0falk2aEIhdHptK6NZ6TCPEiTr5
	 xdiTf765y6eFMEks/t/ZSiAwbocNFAf7DFU+2tnjIM/cW+UKsFU+SLjePXPBODazE3q96
	 0ig7LQu3CmDiIfpzxaMt3SL1IvOFXMdvkKZVt6L3pyQew8C/yHzuIf1RZzyaASw27+cM1
	 vQFiVolA8Sj7hOD9cgtx0d8SXR98n9NN9bOGycL9LFSaW8twydVYOqh9bgzSrUPjXwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182181;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
	b=ZBAqPZg9TVA0OWa7gwRmy2LUaJiSMyNOqpuXZSyU9Nvy3IBvKq6ZCgzToYle9jJ1hN+K
	 qnFX8xgq4XqgCQipZaH1tDA60Oi5ue0CSNEW+SqGr4Tc66GRb/4gh4ilyMSybcPMgZd1t
	 XDN26BdGoYmFJBlTZVM0/igseSvvAvV0VMKmBPvz+Qzqiw3T1YAFVp5BvINqnIspWCyrr
	 6NRfy5EYAnFxOERyheFsRKiObtCqcsxxD+kfPlYzXxXXww9DCuXIcInBM+J+fkCRUAYWE
	 Q5uu2pNe6v72T37Nx9xapTjj8B8R5rkzE4nrNjedO0YfRHu12mf/VgrPzEfeWer7heA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="A6ZiGQf/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MBWNt3C5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0617606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0617606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6ZiGQf/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MBWNt3C5
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk6PH1528777
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=; b=A6ZiGQf/QVWHmv7o
	LgLmcMQ6R3knvmGb13jNkA37r0ZEeWaan8DNF+zQ+gJ4rNPLDpE9I+aQxGawgK3V
	f1cd10G1EFFqtepllVHGXB69EQp/bSDCJFG2RyameJ2Zu1vk7wB5uu6Jz6at8vnd
	gE2PATx+RF7oV8PILaO2iDD4TIzdRfbd12OtzGs3JnyexMuOHQsWS2XBqwaiewgN
	FOUCLyf7a+LvaNV60LXsRxt5HW2Ps7uDijnszZqwMYHy6C6XPJhUuX+Hpyjcwg0n
	HrSC2BDo/QU3fNneX+LutL6URlmZoHVKSbiQRUxXZIbiPYypkm+7pUjV2YCDt9ls
	SU1rMw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtt2k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:42:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so1150512eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182178; x=1795786978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
        b=MBWNt3C5k0OiR2r3PKZVIe+YHPUqrS9d9TO4AiQ+Dsd3khiz6hXxnLjukSy8w5Xo/o
         17a4Pj+HOmxO4GT7TDFlqEd7vmlg/+kY5fH0VF9eDvD7gkQSLjotKWNOmmeFDQn2bFKn
         o1j3dwbDqNUjLM9tT+vDLxn9+9dNiVGWGmhLrramK/7i4mTVO+QI3ApA0FPxN7YMxCGB
         AHN1M51GzUw3Oz2ZQf+UXuUeY9fRK37lJUSeKi9eMkK7jLYHDHW4WLcVzhWW6utOtVBw
         Hq+g0yjg0LqztnEHspYmDMO8vVuZmoW/5T8NVlPTVmTo299n220ramN+D6mUrJ56Tpl5
         lpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182178; x=1795786978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
        b=vS42PoM1Lp+mWcLX3ZZ4BzorT/fOWRIrVHKXMQiguf8BUbMyNEHzg7nly5nMmySCiw
         6hA7fYg6mSoxR52bxgB0A/ovVm6ZRrJYyr3hlwqjzThhseWiHuHZtS5Pk/e/CVpw+1jv
         srBYFYK66NCeQ0UKC5JjS4iHj0BfiBHg/h782NsHuRX/YVK4zPaXlUWEn8DBfAf1gp+G
         55xtZfs7LOP6jvPJrJQ8o6+WI7+/42ij/cswo85Do2Uv/ljLhbVVuu6rnImgRMsqpHxj
         dxChTRooi/CWmELm5ofoqBo+6Xym4ezc0LN80YZg0kS0R0IR1vEtkVM0IVsT1ywU4OWl
         vuOw==
X-Forwarded-Encrypted: i=1; AL+hErGkkOnVr5Hatw+XkOy8A6htZBS31d+pc6VswPwVogvYCoL6qSEo8hk23SoMt1mgKGtac6VxA7PnjV3tXYo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lTsIL4WdSV8BENZww1rxF7RYXNBEST/tPzaJMnVVU7qJQxNCh
	PTquerGqOa9KxUcWbxf7OMDszIEekdGCxZqYGTISL2yzOj93UrlYUv771mplecLLXTTZbEPeKlM
	WM11DPBv4gyogWCkRJfrC0uLSFlQ2GdjDptyFZh4ecdNrZpXcoXJKlGouvZf1POPyk6A=
X-Gm-Gg: AZFdTZdNggvj38zER44i8dCAOZNmiOnFNrfyTc101I7osIsTK20t+NUH+1IT2nl8BQ4
	v0lHPxkacBZtn+icbpeXgMBQWt3dozxfg9u0I2COklvBLt6qdpFKw/Uvom7njEBsSjhZHAasrMv
	Fr8qgDL3aif2MoUD03jAqvnXWATkH/NeqEMgDECjOgiqkwKs2J1So9Y70HkA/xZLfspLESwXu0c
	ZlknKImElgkVPU/qB6B1b0DuXHFf8vExcGFU7cFjXzKIz6Q9p+7MWn1yBTCPBZd+SOIq7AJ5ewj
	r2IP4qOglZZ88aOzgHOGQp9+chmIxCmelhWOpuc5q0WDkm9i2XTqoLFVCzQM3gWXtlhc6ejJaOb
	cjHfknQziQ5+GW//EkoTv8PuLiuxksDoL/KdHpnbNZBHPzOHA6+SNBF99864gUL/BOlFp/qPkan
	XKt5M=
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr4024451eec.38.1795182178141;
        Fri, 20 Nov 2026 05:42:58 -0800 (PST)
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr4024409eec.38.1795182177476;
        Fri, 20 Nov 2026 05:42:57 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:57 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:37 +0530
Subject: [PATCH RESEND v4 06/20] arm64: dts: qcom: talos: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-6-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=992;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=7PKy0XlSNrGfUIky+MIq+A+DSi/A91nh6BKC8dJ00Ww=;
 b=Wadu/4wuZPZ1RMqU647U3aYS4S7L9vnM9xaouvrfnAAIXIZwIt/SZos6s1LhBZwMDeZqVucST
 7xgxfkv7LgTCl7Wr2EN1tW/hAh1HfiYl14p8mUp5extAyIym+swkb5c
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: Ze-ub86ysGc_NDwZGDqY1rX6LB4bphAB
X-Proofpoint-GUID: Ze-ub86ysGc_NDwZGDqY1rX6LB4bphAB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX97rQJ6THQwTU
 rYnMO3BeA0ttCKSlEl2ZIEu0HZvTPGX4sl61gp7ZGlyfQ/RTWX9hfZo62XGbeMbD7aC3bEkI/sT
 fGH9/dd8cF0Txlb6XvTYykSYF0g5fAVZPJcb8z1axSA4VXbL3Blx8GDZ5bMfRQkkjdnA0ZZ8uUh
 7xTqgKobdPRwVdG415i5Ig9FBftZVxMTikB3NPVaYGQRCxQwAMJ4g/HBASSLYe60kgP8t7FDSkY
 BUCaQgxTaJ+895dzrZJFSVoFHh9uRV3FduR8nlp68rv0oQ32gHAB7/QdbO/Or+ig5tsQrYTpppz
 rqfSDJQNxruVLZ8kEDR0Y60OojUStlPLWYv1OM8tRhU3+nnlO3ruOse1UtTe4XKNfUNM8yFE6rH
 wZlalU9bpNy7O10Njl3VsZE/Qca/D8JVfhn7C8E4YKHtUVZIlWWx6sagUb+oS7VHvLs+A5ecAHj
 rzoQqTYVVXf9/7uTaBw==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b004e63 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=rfUXoPsZI_F71NZxNB8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX5wBqTSLv0VoD
 E/76oAT/yMRnaAhlvuwlBkrkS+x038QiE7SpQVSxE8n11ejVx2by04PdrnC9SgFElPBTAh+zYz/
 Ywp4iWMQSyLEBGMRnXWVsSj+sX3JQRE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On Talos platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892..f022a44ae5c8 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2102,6 +2102,8 @@ adreno_smmu: iommu@50a0000 {
 				      "iface";
 			power-domains = <&gpucc CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		stm@6002000 {

-- 
2.34.1

