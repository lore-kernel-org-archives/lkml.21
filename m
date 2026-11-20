Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172875;
	b=buEBDf669z3guIY/FES/MckQmFjBhJ6cG14La53wPlLFC1uEQXrgJtDbbnqtDb3XkRKz
	 RuWunO3HT+9ApZovGlyy/re10xFL0I+VnWBDk+wsG8hsgIAWIpE3iPmfnwQqPDgnrT/Du
	 k627g3BKix4ONeTK7wUkKZIs4JYZLkZurtQ7ujcJT6AKwsjw3BeLXghkaj07YuNxi1TRM
	 9M1X6eIy32lOtb5PWqBC0or6Jxoqmdiq7/69njNHABR0vkQDT80tPg69bzikjtoimqlb/
	 Z9CrpATPjLB/TrNmrIySpwWYRje0pVkVs4xw5T9I1P5/UbsM1wUeEzg+00XGHXxjKNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172875;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
	b=w4ayw1Q3mSfDmY9E/YJUh+wvp6eHQqZvH1DC+sMQ6BbLXV98gfAN5bE06CXxar3F0/WI
	 LRCbZ+uTmOpIozFP1ZpbmhXZtd0BmkXEN0b9KoO1E9j1OQIkTlQqj/7vXnbro1T1QPsHx
	 8aJMAp0EYtZf5eCVHGkUw+A2bMlDij3UdGF/ibLx1MEGgC60E7a6trF7esdKYmrgLzLzO
	 W+gy9QzFPxrv0v52pNPgH4zS+QEPGV1Wl3c9KZrU0nnoR/NNaXAcMQgP9ZjLJGNoFrhUB
	 wvm3ByApnqTemCEY2WMv18/ChILHIoTCiCLLZo36e4kmiTS6OR4OUWh+iC3FRoXg1cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=koskxqCn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XyqRLmY2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CD4606D875
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8CD4606D875
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=koskxqCn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XyqRLmY2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkg9f3107630
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=; b=koskxqCnq8MhVs/C
	CKwbThD06UaTkkfRTXXCUuz1i+bZzwHF0FcDd8BbxC/exytm6F6k0wa6AzLt3+HZ
	NY/SiCJ7yITHOeZg2qfJtHrfWWIxBHvSlvFtVTCDmANaO1RLAkLotiYHc+Ox8v8e
	av/Zer2K1JHA+rrda/7zA/CcxMUIs7MfkJlgQar3IyarKxWueOMIROmjooMqjM0x
	bfLWuQLR/K0SR7itT8qW/XgKVL2zr8uqRJ6lNL365dpr2Mj6F188YXVfwFnN0La/
	a8uBfhYvu8BtYMnvk/1S8meK7CzASWp7L7lc2dp0g7o0Fu4hFChq/51TMErRxWr/
	8oOB9Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3by6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383165e9b0fso847740eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172873; x=1795777673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
        b=XyqRLmY2732/cZaqegBmfRtwXrAIQz8lRdnRDKsb0sVYSqSCuPwcvxxYRSlgTHfLDj
         Dq43tEPsX8cg08M45CrtWq2jbgZFfIDFb21iXHSDcSXE+xyQXOH+o2/xmyXJtEGlP4sk
         Ji08ZCIiRfDKpgsCnw+W+fX2qRvgk+BCpjLZUmE9xgTwmbe891+VMdqDAyeivyl+0Apb
         buY612HEfbgFqQCJVk4KMPZ6zEdVTL8GvYx/+gmdtQsJ/9kslYkohU34bFgkTX6+C7Cf
         3lravH3SAhMRCrzaxWxE4YVfQctgr2vb6qAiWb1A2w11qhgklTluByD0n3KuXkasu8jk
         APEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172873; x=1795777673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
        b=R0zz0q7CTv5wKzllWRfuhbv60gFVc5HqyRKjreeBfa0tRPMgqBaJb/QH3JibMiaQNR
         rfLIu3zgpdq5O4ADZkVP+/4Q0ZloKjKChe9EClGYlSwKkyk3ET5E7XCv+vpJDIbcwUBo
         bRkWnWkK0BuqR7i7pE1yvB0AKCV7Z3WGSO/8a2b57LDYxGfYS1TnORotuQ4v6XxWP+wx
         NZfReh2mt4dIfKQ3th8F7fkGE3W2s1hxI0HkyXCk27+YLsB4DptboymApJMVV7kbmAxG
         QMHYfoUdIrTNzhdgjVJk8GWz+woJq/6buVHQXiG9279J096bB7/guGKIjOfpN47dB4P/
         S0XA==
X-Forwarded-Encrypted: i=1; AL+hErF4PeWDV1vQlw/F3+VAlngHVVbAZfabUmP/aRzsQJYqM9e/FRNoQZw6ITBnCUzy1gLEIL+zpfKUtQKSU/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LOLEAWlaGKauQ7Cv/f+hgmKrOnOoBwuKCF3u2zdxq6x3l9PH5
	43Puq+1SMW/bWM9n/M3BascIDIT3Z6QjT6somwgxRVW0U504u4jZM0nW7gNOxgN1oZhxoPmkSdl
	bRIi1dvWPB9TzffC45o2Gx4MH+KXo8+LhbDrRuBi29VI+93rkLbayZSYH8wptwkLQUtw=
X-Gm-Gg: AZFdTZdQkyj2ebnKQC2YMoE6VO+AHr3UafDLl9Gr0jPRwpAaxQHqJmAXLaQSHwlGilP
	UVE4Y+PYkjE7Wtk1AxgWLlcV9ur2z95CSua8dGmE24wxWBAmFYoO/WMe1BZE7FXq5uqKet/ONKr
	JBLNsro4kn4kLep6/I59eStfD2wTcqwgChdWpP82CaW/1qiobLAropvSUOaGNDucRwQAU74U/sw
	8KFtHZ3l2CX0FYLoV+fSnVuUvsV8E2Qx1wuroMJIhYI2jPff5eginybFtOt0KFRp6Mp3gN+EnQQ
	SWihc0xMs9qPG7sxNCd1VTz5uDRpFyAn8A+VmjkEQccBbA+BKR2lO8fnzeIVxZmPcCxMmqkMhiL
	0pD10wlSLzSmCTHxbma3JIECdS1Tdx/EjQFb1wHCrIfhAwwVD0HX3TeWA048jX+1lGm9ZIPrR5H
	QICy6B
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr2801665eec.14.1795172872594;
        Fri, 20 Nov 2026 03:07:52 -0800 (PST)
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr2801610eec.14.1795172871888;
        Fri, 20 Nov 2026 03:07:51 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:51 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:53 +0530
Subject: [PATCH v4 12/20] arm64: dts: qcom: sm8450: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-12-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1046;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=XGSCDo+PAJtTWrK9Yli/KgTXld6tpUWo0Tp3e8IW/LM=;
 b=9gz/rvKKgvNjj6uwIais3rFdCGo4IChAppqwi1Llk7+aKXWKIB4Wq+mZFHmQafF1TTafELH8Y
 idSDNiNfrnNDmSgmeMAPynBcUSsHZD0PwkqIfI31IXZryVAff+gET7+
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX9lu57mN6NsA6
 A9heh3fLn2lD/78DUSKKTqGmSn1j5luKghv+HUe3ms+9tX8bjXTwThlKFJENCqwpfTV279xFrYb
 Yg1Yysyizpc4uA2Es6rR7OBIrdpYNtLkMLIlBmMyyeUeORldN4F4mmS9KmTCUPuPNltpT6Zx7Mc
 sHdcWgHfoh/33LFcb1p22Fo3lSXWt5s0IDQeBL8IMYVjJKKCkpp02vmO+D6z0D3eIKHqvFBy2+X
 CR2DMlv/dGqPGtxpft7jrVUPwNz0vkkSpU+y2PTGQG6v/FPiheijlPmA5DxQ04VSaqYxT87jyCG
 Vw59DPzkHge11WHT5BpLgYp6PRcM68SEAx6dm1EU1F90hnggom1LBh0AgyEnKUmVCY206b4vYCD
 DMChxjCacRj3D4IYaXsrjIWRKQYkAalZPsEiNGcpWccNwwpZPAHl+0QgVErTQRDm/tHxfb7dW5M
 jvaoMncZs9buGuRLeBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX0jBL8icKuZ4b
 tQD+ralf6vk3iB9syeCi6i4Db76zS5KvZdzslv7P+fdL/td03JLgxSJ0nmSwQsAbNb12SRUDpQJ
 v2hovRkmtBYye7vex619OyYjIMbDazw=
X-Proofpoint-ORIG-GUID: koQP0lxelpcECkffPJnO4e8DFj41FN3i
X-Proofpoint-GUID: koQP0lxelpcECkffPJnO4e8DFj41FN3i
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b002a09 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fzENmhSgVi5qTvzIpAsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

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

