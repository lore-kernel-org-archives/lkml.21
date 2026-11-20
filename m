Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182212;
	b=INmIOfO/wqkfu4SRV7J8P7bQfE4R6S93XxlgGTEL4MFi/bUrTuOmo0NJmKxtCUmFGCnS
	 kpS8ovWIQbH3IYoOE4sFO7RdhWK7YD0TYZ2F4kocoRhQ5IqhzNO9ms003rzaQtNPOkPFN
	 tykfQ5uCzyGti3o4ClHiiAWXMXknmf9Yq6eJry7DyeJs2a2DyXcy2XHCCdCs0uwR5UxEc
	 bOnPJGHC7c/Q8o7YsLS3/esaujC3q+UL18iH6xSw1fFfHC4H85jv0018pBie+6eMnBmQ4
	 7mW2TeAaf0VX6CW2ZG1JTj6h2vvLLXRrC2ZLgj3qgKW3oNho4YSxFxOgLnDftWNIMNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182212;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
	b=MQMdia+TqMBdZtzWeZqPU1dgGBz5akhwwHOoPT07KvkBDpybtHBn9WGyQQ8aaYlGLSTP
	 NyfXZLgd6WuTfkJG++BNRY1cf9FNDzdlv6+U99pWruzGBbG8R3mjq2mnqrtRKTfPrmBIG
	 OA9yTIu7PC2HT3BhFr1uh2WWtV/0+YgcFgZNbn/2fOyl4gby8Qu8GqayyGvjYHtG0SJmV
	 tx5uIDI3LsLXqPA1rbVSWWEH28I1X2jcIGDRZE3U1/3VqPc8gOJ3FTg4wAgOQcPUCkeZt
	 92wepnStfvcrf7S3/9ZzUGl+HxWrzRYcZaKaiWk3APJbLqpWqPCL4m83FC4H655zdTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iDX0SQ+C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c94x9+iO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6E2606A335
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB6E2606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iDX0SQ+C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c94x9+iO
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkQUh1017513
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=; b=iDX0SQ+Cr1ar4w2/
	/00qhlTElkSDRnEmUQlPi+xNC0A/bMK5ZEluq4xFreDF08sHnD7XlIDatmHuEbXL
	Cl14V2IIgHrxwOOZ5ftiGmRyt7AvupSMONsCgdNX7rhQa0QBAazPYgsx3GgenvxQ
	KotBHRuAbiL7u3y3L0QFuc5vEOhTDTmyskYlAScrl39mlucL+B+41vVCA0vJJ/0C
	LrrQEmZQjEsJT/gr3TJgVR6a3maErIxRiuiK6dZptPpxLSNgTv9rnS0vmIgWmNjA
	CQp6zALCNzC691rLA8UD6khSdDEYpBzfTkwCMAkswx/abSzJ/rtWR4w8qcLMUbh6
	gKvcTQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqst4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386177b0516so1468251eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182210; x=1795787010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
        b=c94x9+iO3GBb3LvevbTxliBZMCRvpzlpnCZDAikFN4IZvoImfsCGzPj1mZbflfkAcy
         7dA/hV6nLO8m+mLPDY6e9n24VSfOWFM7+aM2WLmfxrpdWHSeFcS/SbCfItRuA0QRnnoi
         y86zJscvcQluj4gUzBob1dQIGnDnZDIo0rOxg+gR6rvNQPno3ngI/JfzAqkhfGRCQoD/
         wFJeMopM1Pi2BCY8WXU3KSsgPwqHFRBxuWXzm0QpOCgn5MBpLXdzTZ5QA3kwhoLkIgRN
         DGQxhPgyYq7uuPC6Fwm40meYpQNBjhbkvlyfteiE60QXbnDYY0iE4Ap2tJ0yyugEAmlt
         m3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182210; x=1795787010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
        b=UESAuxr9HkcQ5KIGXg4VtEU1Z7jaNGkjtJR6SgjJOPQUDVtB8V1nCNli2uSE/F5X20
         p5G8NQ9gC53fcpp+Wh8Fv8s6P+bZjHOe7dHbszlQWjx25X0PiVldsA8/nXbEE3zzqSHv
         SwQSFeZYnDvZNyMCHM14DaQjBT7MkxJyHtYUqwR+pa6lRwd2M8L7hChSCj18/Wn0/JNs
         S9fGnXTWuNdnlKFeknWQWcDnbICpRCYffI3I94EeTNGHDXw5ybRZinflK8rJr1p99E/m
         PtT82l9VAg5mMIxlJeMMOANptfsAQNxaVc+hDWmZUa/kNUCZ/zwOYWpZ5rZgM1XLP0hV
         SH6Q==
X-Forwarded-Encrypted: i=1; AL+hErHxVL9dd9+HHFuKiRpNJSHNLsY0VL568q1vZvTmKEKCa+PrdnSUE0NPFMRF6Pu4aJz40jFxspm6FAUrAH4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8X+q0UOO1TsEQwUqtByNZk4CG9pXndwjaefE5fNC8fKV7f7ax1
	LbMwxwLhkeNl18vOQf7286Q7ky5kELzIMjRXc9OUUKn+9MtsNhafQualXR3YbFhEWmANysjCOT/
	c6r1KeZwAwfrlmBV7XGbME6ofapbLdaZwThdcmly1gc3ZXjw0yNYdzhEFAA7Beq2SrTA=
X-Gm-Gg: AZFdTZe/T02xTfVfcQcMYYtBGsNQjXoZze+XfMUL+7BliuVBZxtQK15eg8DyIlmLqT9
	4b7pl8ywh5buON/Df+WRZQUDwZ4VipKrlVpik0N8YysPOf1syoQ2Y2VnKncsoFhq1MI9FQ6FRYX
	6//d7qD43O0tCnMwdeZJY/oMGWJAeHm991DbFpe9i8OPLgU/uBjyt54GRZqGpcZKO5YZ3bTgIAB
	KlOkbFIiwiUcxPxwcrbUkj1ebvIgQhyhM4gZ6woqacpCAsQ7vM0PAJhudQDwVftcT14DeedDdaL
	lwYfI1mi9RHAdJ0x5bOiEnEHcPHbR6D1Vfh1UXzQO9Gwaf2ad+2rYe29c5lyelCpIz8p6gR1kiU
	mRR7/Uj4/R7VUR4IDGgIfSDG0H6u/dwv0XTsODPHGewAw6kBI3EtWHRTBUzoItkBZYos+Brr+Ng
	04ztY=
X-Received: by 2002:a05:7300:ce11:b0:385:774:fb23 with SMTP id 5a478bee46e88-3856e63b5cdmr2985142eec.6.1795182210335;
        Fri, 20 Nov 2026 05:43:30 -0800 (PST)
X-Received: by 2002:a05:7300:ce11:b0:385:774:fb23 with SMTP id 5a478bee46e88-3856e63b5cdmr2985097eec.6.1795182209587;
        Fri, 20 Nov 2026 05:43:29 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:29 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:43 +0530
Subject: [PATCH RESEND v4 12/20] arm64: dts: qcom: sm8450: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-12-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1046;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=XGSCDo+PAJtTWrK9Yli/KgTXld6tpUWo0Tp3e8IW/LM=;
 b=pw8cWvyKwent69F39bfc+dvHudt8wpagQHoCzw0hmqpwl4FfInvFtYZNwSN1sydn3qGmcjJ/b
 vgngXSRqSFgDW6kPfAk8Dm4svPRauiLxmUoEh69/6Or/Laf/oJ2Tzp4
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX/KoaLqHJCkJ4
 1arHG/rXfYJXhIlR6t7qZvRjNLjX/ZyerLZ5jG1g/mNTYBzHfbucg4lzOgNjpdDpi7bFUEs3C4Y
 tapz90i40jwm4JqQwOSNyMuQWkNN/PJUcrXChcxt6TVZg5KncqA0YCVeqXYNaSZ6o+xP4KICQr6
 aoULzlCTa6OiuA8F46M6RL8NXu9DbgMb2IH8pzRs+OQBKU9kLpF5YaOUvZgrFa/lQC2ZKAdN1eP
 yMquHh5nnw1vaSb+2fhByyDPlI2SEKmaChiA1joy4buASgTRvIXDzIlODXbqqlL52rfj4IriO5I
 hqmapzBPHN2xexMhmxh3VFoyti5KGkfTzhyoShwr4aVN+R7GK4FfFRQ9jP5YVO/Dh/DVimGzrnT
 jQs4acXxs1EZ8ihBilu+7418Gi45rethrzyFDzd74sTOGoQoxE5FN1GTFAH9IY/BbRICAO7xf8+
 DpaXp7bDRb+YxKVGuHw==
X-Proofpoint-GUID: Z3PBhccCHAGEsYl5BdqKYUK5GqF_p4ro
X-Proofpoint-ORIG-GUID: Z3PBhccCHAGEsYl5BdqKYUK5GqF_p4ro
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX5pwmwIJgLnsV
 rrtSXGeOY3/Pwps5v9FyNbVguIGDUXLw+Rj01ukyOb2XhB+GvxcrErwnPJfj91Gkhk5xiKKryj1
 Ktkrg1dnXMveeYBA/fojDphxIRdM/eE=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b004e83 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fzENmhSgVi5qTvzIpAsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On SM8450 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 8f84668169fd..f7dab346cc70 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2619,6 +2619,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		usb_1_hsphy: phy@88e3000 {

-- 
2.34.1

