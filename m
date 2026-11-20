Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182196;
	b=ezWKy06jeIjngcczfEb+4yHtoBzPNYwEsL4XrFPTEhrd/r52vTA/tgFu4QZnky9JD5rC
	 xJBGgi5qLaAZj9nYCLM95+fZtzUbdN0ynKw9GFAfjRI4N1Kz/LOdcXCjvrutG2GBDqayq
	 9uIRmzJ7x8+CXG8HKJnpp4RKn7XOi4iK/Fner1lT7gEchwaiVPiTc1CvZnbphYwh7fUp5
	 tpUWhvPfSRFCX103i58Mbv7ebUh/KS45V6IfAyCX5HRWYTtXp+8t3Pjf5N2X03hDczXqv
	 oJ/mfd67fkrYsFXS80ok1j19uKZPrEdj/700Z7IKsOIN71/WC14Wh3t8sgd9QPJWT1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182196;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
	b=RjJXVuoBWNeKk000Eb537k7kh1wHHV0RmZdZsQGGZchWufH7dfBcED9VRa6oCEpEkdHN
	 jcNQgxt+3QI8Uhq4KcG069PWl2lWRShzmJ5pG+ieZguWnKFT/SFhOtgJgqTUXpXEoOg9J
	 JZd5nnHEM3KuCxrnND+ohPDjaFIqciTDxRASBmAf0ZBLEfNhzZZ4zdwVuOGGXacae46lp
	 mGyuuZZ69otxqmF9MGVLX0mg2EmWEKVmteBmAXH7/NnJTFtjhmL9HPyLZb4UW2NDIMKQc
	 xc/ZoFklt5fpE92G5j3GTAd83xg/IRcLqUah32MqKGZMd7yxwP9oshKqSvikepTpRfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WFsZ1PCY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E8I4cOHo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D76606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9D76606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WFsZ1PCY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E8I4cOHo
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjqUp1681886
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=; b=WFsZ1PCYPHZwYXdX
	pxhYoFglf6/G/D2b3NNcvvzBLrRh5QxvC+BCLZMg9Vszi/5Eb7q7PEk58DZInPbC
	eyRUuDkYdMArQ38nEVLVcFLKZyItTbGKBvi5MuKF8gOn/OIYJAHGc4JiiRWkFHRS
	aM4gXpMCvmq/eny/ITWktSa/6eHTHwyzc6aAlps5g92HO8uLEzBXMcjdZJoXp+5K
	L6ngePj8ny/IdmwoenVRlrudlL2Pheq5IWqXBAWBChdmHg7E5TEhp1FX7fpFSZF6
	VbDiW8KGqt4PCeOoHRKCFFZdoLHWzMiRO51HZ5tQInjTu6x4wreHqZaUiHPwf8lD
	v9i7zQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1tqaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:15 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38355b03cb8so855431eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182194; x=1795786994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
        b=E8I4cOHo+ohh5Mpg+B5MIPhQBXCTjpcyiTgMjkxxh/mc8lOTbR5NFrMIcInFCISONa
         uGuz501lE0bd3qIJLs1JZXIUBqr6dAD1EaXtkcMujwjZ8CBw/7U3byHcZ6iCoMF0j9Rc
         SR7D3ufVmXJz7pOrji0HSWMlhxYP9AiVLAsV0XV9AwcEg444d+wcuRkvdTJ4dprN4i4T
         3W2amCOW/zWSApZyPGGtG83hwW1Wy2Wxmt7X8WKuyFJlS75v7lEqZiW0lchy2+WtFpyV
         S0zvVbgbLlVaj3ozTCT+SjlF4P2gCEioSKcGaVZ5CM3Ivkwd1EbgvuhH+0CnIr9gTuE8
         9+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182194; x=1795786994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
        b=JJ1UkKettcCj7e9vla9y2ahuRK/yPvmptmqIIf0SGjxS+4Okxs2vohn2oQf+QltFld
         VzM7nBqkgiHuPFH4TaE4WfAgnn1YdoZHECfExMmlEUcpFIAPLPZa5+GzfEXh5RfVvp+m
         S6Y3ZFHlpbMStDz2GtPgW0Wc4XqxOWMNVIhrRmu+Fcu7/s09R/zItnmuqcLnAJgaU3p1
         8KF9QzQcx3rOmWXKha8o3VVEcTxkaTV234Lghw2v7/ZZJm16FuWvehUYQBif+SfU914C
         yzDS26V8+5ICzTNMgCxcK/9N581/UQDXqtv3bVcuVWNKoNSS/KXGILrOHdbZ/BFn5ngg
         gAjg==
X-Forwarded-Encrypted: i=1; AL+hErFdELTc/hk8jpt090/Jfzbk1vFvRlADPGsqVuoFpBfGJomKNutL2sfmBCenDkMUlITNdLI9rnSH6RBdPqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AAKOzaMNcL7cCqyjfpg0NgXHWST19Ez6Lt2xrgOAVdD2LmOOs
	stpALXhv4L/hl8oE80InTlOW0HyLLbQso4o1pBuYM+elkeLx0bTQCmVxwNtSBzF4PAll+fMr4Gy
	g3sTpJCCSZt05AUZNnlHtL3a5W02buyECqxkxfnSx3Mb8RjjrGlBAoKdyeBZAxvkCFyc=
X-Gm-Gg: AYBFou3wzjPSx9FBRSTCwO9btWkINCgJkS2VcKzDI5ih2uh+Z/PBsG879N3tPaZoUzC
	VYOUXP8184GMCwTxuAnSksu5CZdhmlBb8cS+7MT2FmGNjW3wi8U59DiBdp6FsUv9t8ydtkkWmko
	KYkXH/ULuzbkgFGMSctHZrstaxdEEbftvIo9z8cbSTbIXla5OAX4gPTLr425d0fBhiD2ozJ8tXv
	NZxxh8c+R7PW1rAyT3NOxDwhThazAIOsZRjWT6+Ey7zTsyRHkaFOkLb6HvxNmeCKEKuN0ceX9mV
	3jZdWgXOuiAfiN8fTY4piP06I97VjY94jGhEEIfxVyi8PtiNdRLeIXNuNHABr4hyzBTAPPZVU8j
	dQOjKozw7M7ApjPMaB4z8vkFQng93YW5Be4Sop/rbLsTNyh+43/4lDr275+ydT21yD++bp3q9WN
	K7XVY=
X-Received: by 2002:a05:693c:8955:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3856c6ab8e7mr2865609eec.5.1795182194208;
        Fri, 20 Nov 2026 05:43:14 -0800 (PST)
X-Received: by 2002:a05:693c:8955:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3856c6ab8e7mr2865573eec.5.1795182193563;
        Fri, 20 Nov 2026 05:43:13 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:13 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:40 +0530
Subject: [PATCH RESEND v4 09/20] arm64: dts: qcom: sm8350: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-9-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1040;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=ifRBUNcG4S75b7wOEESAYY95LUktSUoyNzDBhGxm1EA=;
 b=Q8yu6sFl8SVM8dspFiUmMN5ffOmdMre6HaKrkUdqERV8yylmH+IBEB/LBKQmZQ2KgivVAqmFt
 gDOq6Ul9ShaBwk+4cp4/63XlFWnZijGOl+HjjqAQOCN+ti5Cre8mnYq
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b004e73 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=tc1TWAvYerzeY2VvnAsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: UZKYj5wiSHtI2qB5F7c3BV_YSS3nQpkB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX3/fGVCOZNzas
 bdMfatod3iAbXZEvtKPIIUgyCcAKODbpws6aAgc692YjWkR2J3k7S0pYlsMsQH0+YAl++fjKi+K
 4NeFNo+DXufiO4UNDCaulQ2vLnJgZTz9Zy1+1vXsDtqBcWHij/Uw+P/wU4G6aQKHpEou9YnyJoH
 5q5P1KchbJDQ5/Iu+21DLGGL8qGGi/F06Z8TOTdoFrleKEVYKK8PG3+bN3wao6MOAuVK6oN7sqs
 j/ognA13Lu5V9+dYrsXJ1jPKlPNq5PZ8GMwtb34tsuwlD2wisApYiMow5s8rPIIt7p7GQwLkMxG
 Tx2Eon9n1q7VBxKl9sF9CaxbZm/Dfn6qpMgRmM+x1qFD/xfhxkhisqWrowxrd6AtWLzazzxGFD9
 VyIv7HiEcS68nw0oQ5WwkETe5TwO2gaRjcPI9jTEpAmBwyyqesYh0zD33z19/Ft3FXrCIP2ubJ0
 cMCIGqiFeFlp/cISbmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX2DJUFzfV+69j
 FdXXZkNKFBqVMuvupKLMbI4Lnis7X1PbMy4zDXuXFfIb89hfZG6X9L1DHxjVepUijYKT+O+qMjK
 VefOVHkIPs6LWIKKvFhBKMJpiSvHCh8=
X-Proofpoint-ORIG-GUID: UZKYj5wiSHtI2qB5F7c3BV_YSS3nQpkB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On SM8350 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 7b9966e8fd4d..4edcb06dbae8 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2566,6 +2566,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		lpass_ag_noc: interconnect@3c40000 {

-- 
2.34.1

