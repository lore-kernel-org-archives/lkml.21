Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172858;
	b=capaEoZxBSCqG1oZXTt9kpxev5uvRgG84npve/Qt/ifD83kcaSxawMjF+feCTB2/58Ek
	 UUC5g6oBOdXMT7M7gDNWSLetfa89aXjK7vx4vfDzR9ttC2p8+krtqi0A+EmOC0PjUwNSW
	 s7MHzPOeQiP6pZD/MdQIdU+uOSztoAvm6/c6dUVlAC6ebq2sp1NfNG55fW76Vtrfee/bs
	 5EuYyYBS80N0DIHtd4rGvIL66bDVBOTreC8b0Wb/zlQ4aSKBemGzMJ1sFC4MX4kGrFpQr
	 ObrIp/c1ie7Y8IQEjlfCty4JszMPcjvPieCCV4RTE6RwZ+J5R3z2/FAww19ztj5nh+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
	b=5X3kAn7uimt9kpGQnOLiong4DYo120eKo9/lCIdxA93Ddm5wwP4r2sODgbpmh5Uka+Nk
	 59ylFC0LHweAzfNOQ6yw40Jmvi+PSAfNEZ3rD7SEpsVYuYM6YCVV6DMLjUcIfhYytQEjl
	 Qcnj2VbliaRxvw0cjZdEvsHKf/nV+m1rO2iPmku1m8jN0om2bM4JdFqO/cpYcreT9nAo9
	 ICQ0srpANqjatO/yAc5hLzr0yrhVMISJ76uHBoJWUGyXiHhDc9ZD4bv/HDM9lHxz/xgfc
	 UZXp1PETkOd9xgLjbu6V0nDObgPeBc7NKhA2/7izY7lVOWRkoOJI0+Hmxpf2vMyli0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="GTksC/Y0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cgTeMHV5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBFB606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EBFB606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GTksC/Y0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cgTeMHV5
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjoP91462862
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=; b=GTksC/Y0bKEnnPw9
	KWJMW/0LYKMseO9DPrOptuVo0CoIc1uzdDo/pGQvMUvP1Rvp9itBe4lxfI3YMrct
	hNlUsrpyWDkLVM2AharxTeVzkRw2n9VB/DT4wadGuvHh9b+NKRCRxql7pH7v2UhZ
	mZqqLkNFSwVCnkJYQ6l8xhsR0o3nVGXsD3cWmPJPdqWEiU2pL/iofmYDa+RErjze
	zIL/ZkJld/6+cX3JmMILKva6+SUTpEUn37O/cx2tHijkn57y5K4Vh1GkIqNzw/gV
	9xhyY7hbI1jHiKlk+CMPcKlAgvmcpMCyomuwfUhrzj4E/euJmn6bzVJ0PBKLPI4y
	D6Il1A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guah5rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so1078695eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172857; x=1795777657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
        b=cgTeMHV5uXmGkb3t05ajSI9lp6sTHFBEVAnoz17x57ol+B697LyK5pmS4/x0Sy1K4k
         kMcgpZhxylEgNT5hCjabkN3oREPhbLONawMN4WVYWperhoGPgyhEGSEAp0262jH+S2Sr
         QKia+9xVYQTxZI/2wkGbJbo8BQ6z5CNHdc89P+USgH9eVbpq2QuMb89Yck3u7TayUgts
         HGeePLLOqllL9RYGWuIkt1c8wJgQEz5Hl+/AJlEbOALYkhzau+MtLKIVJYI5OoHwns2y
         1cIHoM8Rrm4Nn1iEKKxC84YBtoNlreOGARxjwVOuAPbt2HIx1kCLas6cTC8axXAmVzdh
         2B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172857; x=1795777657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
        b=Ndzv78WjnRBIglgQslhtY0DfIOx1hzrqWwMmY+GatIZbMb1mFjbCG5F/9d0y51A3Lh
         UXjoAJF1s/WEW5ojS3CXTtJT7Xnk9GcND22mZmAFLUoyzMC65M9rL2OAR4elMNjVMWTc
         Nb9S/N8OMRM3bSwPouVw5Zi2BL3YjnKE2x1M8zQXPTuQ347gcZwBqtLFMS4MHXkc6/ab
         /EhoV80Vr2QpPMvwnc8f2Ei9Fu5r1a+zXjPD65MqRFO8Kl/qh+QxlnGRTfnOuSYs3qTE
         cRalkX1vktVsrNE4289M/mX6R3SMGqgJxe7EHFzjAG+4t1uoaeHPWuCUjnaNwi/Lzbtk
         kC8w==
X-Forwarded-Encrypted: i=1; AL+hErGhLOBBFeuXJ3k7G1oDoU8RJ8jYVn0CcB8dRo2W7A0UaqrdEg86YxLiszsCIaGhLxQd1cUsR0zWXwO4mFs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pXgcw0kHuochiSPlVaX36v1sqtDyYTE0DU8IrAZTl6M9/XhE7
	FbEisXsQnHpFVNJsRvoWMCdexo0wN27Tn0+SiCgvdvY6vsHwcHYYkNwt3+6xwASb4AjBH0Xd3RH
	V1yd18k2r1Xm3BD6N9eCgqj91LPSHLPA6yb9JaHWHFgZZYnEWtFr91DZA0KrZgcuZawk=
X-Gm-Gg: AZFdTZclhRTVEeXfulF64p/Ap2BuCaRd5w6ffYu5ttwWk15kbaxGETzYGSPTbQHrRhv
	mRETt4axueUWngXhrG9wTpjEUuaN2n+k6qTd+6BB6u/BLTWzToW8HEZLe2syvRheQLfUS5OQ0R+
	8NFrfGM+EbBHEICeQV8R4AMNhw6vaffVsf2d4C85OvxnAozxmD+KGCHai7ZtSwA8wCfuNQWlhSf
	smsEmKVoNyn8kQayn1M+YmxW95MNkZz38kSUB9TyMT92hX8F+H89DNJqj+bVr3wTt20vzscBpgG
	KIQTmarACXRO/675u8Vau/hNP+pjv9LfTStUWtgJJ7UvFpTuLgVtBJH5hONH/6dRkMREBWMDUO0
	yDWEYaiqhHkjph1kQZWhcswjxw8hNOSuaF2zl6kzGTYqZeXvVKp2Y95JT2f7r7wdF57wFAs7klF
	fFEdcb
X-Received: by 2002:a05:7301:18aa:b0:384:eec:aba0 with SMTP id 5a478bee46e88-3857073eebamr2356049eec.36.1795172856938;
        Fri, 20 Nov 2026 03:07:36 -0800 (PST)
X-Received: by 2002:a05:7301:18aa:b0:384:eec:aba0 with SMTP id 5a478bee46e88-3857073eebamr2356002eec.36.1795172856199;
        Fri, 20 Nov 2026 03:07:36 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:35 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:50 +0530
Subject: [PATCH v4 09/20] arm64: dts: qcom: sm8350: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-9-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1040;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=ifRBUNcG4S75b7wOEESAYY95LUktSUoyNzDBhGxm1EA=;
 b=KzrRMDQ38ir/SxKkvx+iCgru1CcWgzgR7RMiwJB8A/IB8fNZyYJbRgu2266qsmg84BVFLa9od
 DKvONyqaL8uDPLBnrRXftBGgOY2FyIAJWqfqhcL2OUH4V1i97q6YVJG
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXyvxsBZNoPOwr
 0laGz+IkrjuzO38ac7SX8qJot0QNoTkW5SjKN+tk+daRTRyIOpdC00vGV4iGfp55zBx/XzBgoFj
 jQ2z8opVmC2OOWtTmGXHBUEK6FhMETIz6KVK+0UIJw4rVjoZ59kL2FgIGLD2EYZad6Z+CUuc900
 9SAMnBt+7HsYs4Jp7zMy4+OToM80tBGPGgaXtL28HY6pt0qicXJRA9j2k0kw8hEVR4t8q+P57hp
 cbCnI9rJ/+mHADOZiHG78B/dABaN8/190r5e5U6HRhVhFOrYZuxT2eYUdaRm/gX7ahwb+0PNuaZ
 srZoio/2BgjySx+WiH/tkNwo8dU4oqFbVOcWFJeJ6OWKwLi5SDTkIfvWETP1leW3MfD2DLJcQC1
 fwG5anBFsMPYu/bJ24eOPh2wCEEyCW3DxV3hVKib5N4gKFw3AZg/G/aSHENa8mO04OYESS3adGz
 ub3NBIfFsVZYVGxE2ew==
X-Proofpoint-ORIG-GUID: HuPwhEjZRVBefne3LPK-Wmbnr8AQKyQD
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b0029f9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tc1TWAvYerzeY2VvnAsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: HuPwhEjZRVBefne3LPK-Wmbnr8AQKyQD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXzoTN8Yzzaqft
 7LSYfZTS2FlPpWvQ0PzWE4WA/pIF2qSw9mm6XJL85K0AqqbyPMSfKO/pCwkwl8opJunynevqKRQ
 K1CgS2xSxK1+0OSiGW93p7pCXbVaDzA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

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

