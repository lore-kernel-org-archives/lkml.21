Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172832;
	b=lH8wRzaphmZ34C/q0Sjwoe4vMeRfMV+xIaC4oKabHNxv4TrGPgjHdBha8EnVBulzQClO
	 Dbt7XLulDeiEpRnmyaJmoAT16fkWrUy2NnbLiXGkNkqHyXfX7HFb5QnCzIjrwbdANAeB3
	 QtPfAADKdpiOkGSTt74U03IYG1DSC0ursQCW4X36rgVp9TSqWKyTwzYF5H3SHIBQWHYAg
	 fBPPUEeg9gAO+B2ri506w5r88B1XM+znOgPNt+1DEK7gl0t2k4VcOThW8P9biGxkIFdn3
	 0/NMUJSnfge6jloyGNXu6MD0B0f5nScw3on61M6KbA8NFFWcGzQCgCKe/mN6E2j9zdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172832;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
	b=OjSsp/eeoFGdTa/es5+ay+eX+V9GE869KrmNA8CVjgh7YQsLMvvLGWOyMAxJfkyFiCSW
	 pec0FInK9i9JrmzZACoSdlnAxD/mySZMbwwhd0P3pRtseIfmlmm9Ri7ZBX4d4es8rU8he
	 VDa6a7UU9RNRLJUgzn8x8vfzo42kdFdUtRJ+eZWpiKwPVo4Tr5yI5y9V9jN8jZD0z7qJH
	 On1KYTJz+oYi/D3UGBoXgSAOENp3T68+8QJaz8vTLlIwdSwACBUCxrnoEIsS4SqT7ZewR
	 ZabmuSX/nMioPxxZFRQlThckZOu98s9dKqG9sxQsWkf1xCei9pzOyyrPup8EKxVa/8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QzZ29Kkb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ANEKq0j5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D8E606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63D8E606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QzZ29Kkb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ANEKq0j5
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjqC51681897
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=; b=QzZ29Kkb8jPUNzaL
	tD9uX3Jh4A0ugKkJgKV0cOt7CS6/HnNa3uJ5E+jyN9Dtxf8glUCo9FqtbCgZ1G8H
	tkGSfdvmi53szEDW+MUHncxhTmQ87jA3+jSV/oJrSsmtu7GobAK2epjTWWox3jSe
	YAeAPTcc9r/oGhmno4VqMycNoL42okck5BzwpnIY/Z6orYaU12MCMyp1PkDb/nRi
	MngcPQxZgIWnFMCQCbxcH/VLT25578C9TaZznRFPZhEiu6DwQU9r16K8YfNShLlo
	Tiaw+TyF5Rv6XTs8OomFaEsNjUCiO6VL2u5ocGR3mSGfyRzdLInBgqxhNMpqoiG5
	sFlgVw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1t3ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-382af5cfc58so2192782eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172831; x=1795777631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
        b=ANEKq0j5pyfqYLozx5vuFbm2y3QufakoTm3ZVN2KxFI7dMOHnaQJOfrX4dhjAKyWlP
         rn18HAG0qOIu6e8iaxhFHJARRFxLV9N1LrOPPlmDfrFNpDvmPqSkGAUTyvcn9W2Xf5g0
         8D2JVvJlkDfWNuNZ3/unxV8URCcF+J0MGT12p2ATJo/IddfTLBfnR0VJKN2y1kH9jN1Z
         BEmK88Fe3uEa1tjmOzQyX3Gw6gaJJFCYagCAI98BzJMOXSuMr8FYzPpZnq2XBqil784U
         EyW2AssjC4KbSbUsNHpnsJibT/UXo+2qXt9iToxy8/y9ewX1bDzsuuyVrrILpr2Zin/P
         JE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172831; x=1795777631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
        b=cUQPG9K7tfHB618/wojUUqfSBLMyjIP/k+Cm8QhEpD/7og7nqx6WAtKzJaq7WR17JY
         RmXT6QB4RUhSjRun7BWThf9cQ7lC4NFUBRvgdJzWn5pcturBtylLBJeH1wE53orSVtZd
         v9tsSQ96J+BgZvOjwLSxfuIaNObtia8JXoE6M/kwunkgCg7tgw+8Ygl0sy3SOtk/sypn
         qGH6ZSutuqk9C9RLnzLkKgOznOoMVwrrm7vQH67inmdugu8WrUPYF9JRQFKGs1TggUY4
         L6HT9w8YE6AtCybikCage23TICyVQAHZcWik1vJ//qhMCcpSdjTdIj1HY/YI6Qx9vUb5
         fIWg==
X-Forwarded-Encrypted: i=1; AL+hErEqD4ORcTT6GfbmmxFwzF3q329QTvl73gRqK1lkhrMNPktYM9vKO4n1S47H0WhC7C3sYzcJ5J3nXbroqoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EKJ9eAtoJAluQN8Tpn7ooi8ZDGPJDRuBfo05k2G4sJ6T0Xji0
	qVVg2ttlhC0mM5Rj73r/oi+KBvNGbXBxNmlIrdxnoIygn+npV3DoX/mLArcD3voVoTRV8OjJI7d
	eM9pf8rgO7R3Viift/GN781t/YDcdAhP3DWZ7t9M3kw7XiK8pFl6gdrjqMD7kAnFuPQQ=
X-Gm-Gg: AZFdTZe7PHZdm3HBRwjTpu+Z1pSDR9su1xsKKycUN+MKX6K9T2ObM5XJelbBe24d9Ei
	YYa8awzzgQCjy0AQx7BzBaZI7ld3VsXsdTdgrttvVzHAbhD806apPHzSE8HXn8rMrCqh1QFcS+D
	7KUvjtxNY/dAov32SFEDoMpQAGqDG8SKozI0HVyrUE+kDRs8zKlR8Dsjj87w0eJv/9oToKC73Xw
	zb06adskuJsJuI8l15pXpFI7+2JFlQlU4lME6/VOsboPcNZZUZfS2HzuP5vWwef0N+AlWdxTtor
	Gk9D6bJVeASWrwY1ihEMTFvRNWfk9p86EONxgp6FEuPcG0rEGoqSaN5Zwvc3fIM0jQqBWGTjBHI
	8eg4WHX70Z4TiGZeVD0V5A2cnS3Hyp2O0J2rrx79UaKxT6KTLtOU8yQDW5laXUnDVuDHOlaBMeS
	FqNMu+
X-Received: by 2002:a05:7300:8188:b0:382:61d0:f375 with SMTP id 5a478bee46e88-3856e63b050mr3380282eec.7.1795172830919;
        Fri, 20 Nov 2026 03:07:10 -0800 (PST)
X-Received: by 2002:a05:7300:8188:b0:382:61d0:f375 with SMTP id 5a478bee46e88-3856e63b050mr3380234eec.7.1795172830267;
        Fri, 20 Nov 2026 03:07:10 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:09 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:45 +0530
Subject: [PATCH v4 04/20] arm64: dts: qcom: lemans: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-4-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1069;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=J9MtDhNBRc3o2KPFtx8zuqYMoIVGqmO1gPFbpzrqgQo=;
 b=CxzlhjeUr8VvYUtjmp7JKW6HknNkVY9G9NNb994Oy2SYh/r7FFm1+OnmSzS9taDYET68xu9f6
 qG++w8LB6UOBPYBepaj5kOZ56dOvRRtQdRwSI+9scxEhST270OTcHXu
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b0029df cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JCeWlrImN8qIMoXkfH0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: DuG09BdHxUe3XanM7tblP2hnU8OQD0a2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX4z9r2cH+0Pil
 2tnRE5Hwb6DHBsae3G/+/VmvQOMFsL9Nz9Q9SI+N8GJDI+0rq8cvo6IIGvCEsmh1XrQdtLqJSR6
 b3wjITNz6+RuMwahESEcL7tssWhGqbfOTqYwGbR3I3yVHsN0G+39WBwYr0LPgEMmRcgN6IiGjGG
 9oPOSNcFQE7BMYJNSyPFAbbimg6/p5nmcxibbJ7v1mMAu8XcejjcZy1UEKTBgbIL1/Ol4GTPZTn
 9OlLsiHsGJn+9yUElMuWOKARz8LR8cfX4FLZf0buPZGmq/ZoKzLU3IkjYEEeCiByDV6g+LDzAik
 HsM72/yMOF1cIqx/u+wltsNJXiRk3qgrzUAhWs3vWsecvZCCktvgr1cK69R5J3cLTljh2d5suIP
 FOkAxGdQsNUknn3iCuvwGmxUz7PjXKTXHyv016o7sM2bwKOmsR26D+yoJERqNXLaS1MKBsVMKBi
 O3xE2T4fzRapesvRfXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX9q4ojNX93Yug
 9jN5n8v/pQ1d55pvZ6L2iT0s3kJvPthbVOlzkRUW/um6CS9oBGkplWztXQ7dRPz06UTLTrs/EmB
 ymptyRbtyvveldH/R1CEXEZwMIoGSeA=
X-Proofpoint-ORIG-GUID: DuG09BdHxUe3XanM7tblP2hnU8OQD0a2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On Lemans platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 20f329c0df75..be71eb30f997 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3127,6 +3127,8 @@ adreno_smmu: iommu@3da0000 {
 				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		llcc_bwmon: pmu@9091000 {

-- 
2.34.1

