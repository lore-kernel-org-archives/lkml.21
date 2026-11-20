Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172905;
	b=usbWc4rdzYsEqhOHy8QZyZbNAMmCZYmCBijvrgoPr5thWDJ9Zbpu2j90lY41hHxcJcux
	 HLXn8OHYn4qAx0jDNl+iYjlGc1scCHEgVkmZa3+IhL0ODZo83yw0AjOz7VUahaB7KQids
	 MpqQMXMISs46Dtq/JTBvtUHaiP5xu1AVp2JUHLYT6kKQAGnaIIpM3R3SZ4ED4EMDugj4b
	 1ItBxCOaVbT97+4gEETZkzZZ3FyXMzzgpM9TOSAUyy2CoFpe5lgZdDae72mKi/hqQh7rn
	 uccB3qXKCEvRKSAM+e1pcIFx4lIGW/LF/Nq3O6KVrslSgJtr8xIdihFK5pMTCMbwFgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
	b=TYvNmsNQOEXRVxNzE87TcJ7CIJxzpqK121C5/AS+WHuNNH2X40skThn5cTYuRcsOfn4b
	 p2GgMak0dqKuCoLr3hWdWAGY/IuWL9H3uxueVwZEKr4UGEXnR1YXLUP1JLM8jJckFST2U
	 gLJ1dUBR+u3MtwRiDO4MKWV19pK+PA+HwXPo0lkcCf6hXUUsLlp7MsZ0lYfDB+QK94tnR
	 U7CNLxPoTjj4CbgD02w+8nNlwdawpQRf+5feYrLUrE6ihXK0FJu2CV5J8vUkE2Z3Qhs6F
	 +fz2PtLGy8kJZuQCfmMAbUw/yuzx5FJw6SRg5ASqfRFnk7VRbreUfh5y5r61sVTVboQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kFgqblB1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCeFH0R8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319AD60A381F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 319AD60A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kFgqblB1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCeFH0R8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjrhI1681908
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=; b=kFgqblB1KyOqBzjl
	SI8BRPIVJCHt/dZOvNY/RF9Var1F1JFJYPJwoH5d/m3NEMAs7RoNmUPSAKp0G9Ct
	nwveGZltxWkQSbrPADXZgyrtI26A5FofYrfhOWmexCgsziC7nmQlvlzOQiVn/aly
	BGaa+hQeQ1Ir9dYdKfXJMJ67wRO/lfYjaddOKVUW39B2Mm48ybfT4ZJLT4bJ7/ad
	xbgENLiwFp59D0b2uIPRf5qotAdPhwzfGEGtQshjtO6iof7pfVR4TyGWnglOImsT
	qwITw4fRx1y6399xeihkKRCDamzcClB1DBo4LaOPrKuBga2gfWkZVvNAuAjfVp+Z
	mRmZ4w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1t425-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38131260a5dso1973131eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172904; x=1795777704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
        b=aCeFH0R8Fj/QVtvCuZmc3QYz5D8+NsM33oOlYtUxxoeulhzzN7/fIxRWwEEcWMr4lP
         ioYQKhYjrSYblZWLGIgKGhPsfLjmRleHTqffSv9OJERuSWuojdDnxx8/ZW49wHhb61XK
         s1Sw/PVW4hoH5sg17vLw596nBamh2R0XWTx3imdmF/GIs2tXSutnabG65xy+6/wyYqnD
         4a4XZnm1d92T2bQ6qB+QjtsTofL3Y2DY1Vr8YyTL86rZBm/S0zqeJ43hWb1Hc/P+fcF/
         vl/tC9wBkQhaJ1LeMjnyhf1FYCczJ1VC1VOUfm7/hc1LXKzkPausFrlLeoM5E/Sz1y2V
         lg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172904; x=1795777704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
        b=BbhBfLalWs+S0A+wueWzQOOwUOR5nIfu9WEL0NQaF9Z+NU6CGBisRVmA0x8b1KFbar
         /PxhEUpND3mwodnvg5+MbItLVCJiMofHsbmXW/HyUvT2L6p81TZmjGBS2Iv6SlovBLDX
         o/unu270PhaBAQNs4qy1K6C/jJ45TDRvxmexaVGiwrudf2x1VGpqlgkVR/SHTCqEbU07
         xHdWBNdthi8ytxV8EDdvgjieaamvT9ZOpHXGTAAriiAFfgbvn/RkeI2izqEqk+MPZUGj
         StfMwCqctEPhhwb+JxQd/ZqRQNpKeWniv6+tHbP5pbEIpwhr8YaBcLQNJvORIHmD73Gl
         UT9Q==
X-Forwarded-Encrypted: i=1; AL+hErGOayZ460nfOMX4MfCrryUWwsOyHYJubuOWB4SduH4jJerRxK1JunrwRCu4HVG7HHyEkAnQe+csWj7OAps=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PNdghEi8tPdyvkha2VY/PPM1zUZ3HCmNN1jhdB+wm3B45e5f6
	lHP7fE2RnO0Nrbar7K59bAkMC6F/mTKd6YoViGp8+snHfTw5Egf9H7ji+8eEgwS04cK58xxqNrw
	cPb+uphv5Abuj5zXv/j7E7O7f6lacJeksHSMJWk9ebK76TD7pXyUtRXeYBFmyV9q5+k8=
X-Gm-Gg: AZFdTZdU/tUczTtgW1K/WogZJW3YqbcimvjCloH/6Zn8O7bGiWKFqhtZ+KtqKX/9GxC
	+OwDrWyfw8Q4f63qrClyBLKcurG3CPkDf9ciLJ70D3KNahJoRyRyveaQmhO47Qc2AzwCaNSQMD4
	rxLRHAhD3Zvf5NP2ixxo5n1PUML1/3BJ+69GygVKirdt6iAzsgBMLAGBIrTvqCXGqPnS201bZ8I
	Rgo0Aiqu1j/6wlEzEivWSJrzHJV+zecWuNmh7XTeMwALVqQS+/Ot4bZ8o+2yt2vaejpg7KcscSA
	42lpvmTBN1BT6wjP9V2pvd3drt1gSbOX2d7Bpe9FDJ2iUAR2/+WmVaWdy67xRh/ZVVhcJc9HXto
	GONP2BVBRB29UvmTqLlzOEcQ7hsPTuxkk469yZwbyppnmTPZTfWKXmOXkfO5RUBufEDCbLqRSOm
	7NznkA
X-Received: by 2002:a05:7301:619b:20b0:36a:1d6f:917c with SMTP id 5a478bee46e88-3856f45057dmr2756088eec.22.1795172903786;
        Fri, 20 Nov 2026 03:08:23 -0800 (PST)
X-Received: by 2002:a05:7301:619b:20b0:36a:1d6f:917c with SMTP id 5a478bee46e88-3856f45057dmr2756040eec.22.1795172903140;
        Fri, 20 Nov 2026 03:08:23 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:22 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:59 +0530
Subject: [PATCH v4 18/20] arm64: dts: qcom: milos: Add GEM_NOC interconnect
 for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-18-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1035;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=uW8nrRF4SJLtr5/e82lnBVVXICez3ZPhzw4syEcDxKA=;
 b=UVzRHXN0oJO9hdlh7U4rxJrqxQy1l3cZ5Rlb2hk0YTnyggdfF/MY0VgoShryhbLhtW6NCInlJ
 H0MBMdEyI19B4ktai3TXrSA7fgr24uRXz7FNw2lNnZDAoaeKB6/8rsU
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b002a28 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iSr-qRAn3DWi8jR0IaQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: o0nRFTWlGIS0hGZS5ILBNQoS2lGaTLB9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX+2t6mszzgcRL
 eidJxD7YUcoQetEPEmnhQvzdzZT5xTrjUdb/mvpEyt+TfZxJ6n7oTaKrv5lwVubZPQvXk70pnPI
 MEiW+nKZZ6Sxv0EJ1m3tG3y5yD1RSuu/S6un+P09EurPemEcXLyx4415X+waBi2p+xfWVydKSvZ
 fhrgXJ6kLfQR2now8IWW9Rzs5/VnkguplM1O1IJ6DZz/gZT1wfg+gnprN8wK+KTdVWtpXQfycCB
 SqAjAQvXQRzeAXKRLpc5eLobYEwUUyJ1OhO0PIQ1CLaI/4LWVwqRPjeaJLuVeKII2cbdkiiT3RJ
 /eyB+0PZBh1LNDIJEjvTrvE9O5cfeFGLMfVH3QcrpZq8LelKz6ti4ZtsvDChLBXNcoY08wFq+5V
 ZaiG8x7sE4HgkC+IKmaw8xhHvWTN8MizzWiWEpI8M2+cPhlKihUeP2vQQzTBRH+lFFKewZUpTw6
 w8IKS7Bk8qJuV50dfew==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXy9THr4Zqoecg
 gtXPcZFptxpKAaTqTOsoeOs4mEqLEyjsFYDrj/UsIeIB4epNg6iBxfXota9xyrDqVKt4HLdTRM0
 j0MMb0TQtQHmGIBt//9tOWmP17ciCws=
X-Proofpoint-ORIG-GUID: o0nRFTWlGIS0hGZS5ILBNQoS2lGaTLB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On Milos the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 9cae93b6a610..49ea0a8759f3 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1988,6 +1988,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1

