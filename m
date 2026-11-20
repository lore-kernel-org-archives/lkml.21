Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182175;
	b=eXmBliMswadpTfXfjLS/bO5BUk0We2bxzN9JUrQR+1i+pJF0/aTLtT1Doy6Zfg1Z4QXn
	 v36XXBA7/oMqiDn9PIO/PBmxuYqbI0q7pxWAAcZJ4dmmdmXR6i1bF0eRb2Zkb9J87Ws0V
	 qwUcUj4rZy3W/3nOJLXaHSXKR9CdkWA083VLCBX0wenoCrqn4ZPG3l9CspMo/JHsr06dV
	 q256BNja4nKlKFThyRlrEf97UXyBEsntU07SR6IHMrU1EUjhpg9y6OTTHmXglodCXNEyd
	 ObhvEArYabMfm+QBzYR23JAMqlvl3++z6mMZLlYjxUVS/NvGAXr18lSnXoDc+aDiX6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=;
	b=iESXSpSgc76SFWmR0v4kgBEkFMFFl2fEbI8HsRVU7SrWY61AQalYoCqrTB6h6079cxNS
	 v1Odcq+Tc0uze28Q+uxwP4W4pBCEvG4lSULgZ+EduUA0KX1PXvZk7piwEThJs5CYERcSk
	 fBxjDr6Zmau5RGfLLjFH0cJp7bii1gufosA2GnSVEnoh+tXPLuMMeG7iwvI/aqPAQqxRs
	 +CS0WzDLX2q1w7wkcnPgx/IuEHsk1H4RLH+dG1ScOXKFBATcp2A1HMXgSfV/JbAluDowQ
	 Kbp9GcaqS9zgnoecFiqJkWlcsukD/XPb+qIg6+29sfbBhNSah/u3EIGTD9KM8oVKCmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CAUYNwmD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L+lLWnxc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6C3606A333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B6C3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CAUYNwmD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L+lLWnxc
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjwSq1528606
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=; b=CAUYNwmDCpzBPdlm
	MyKbSiLl1f2o1knTbSC9nBMYV4a/fq8yGsVUuE8CFNlQln/+pNv3bU7gXKPDK+l5
	E6mRJiiDzGU1kNTyQPytCjoIu0290cpZ61ztxLqHPzh+tMALv2OCB+PPNc7Sr1Oa
	iM7e5+6ppMAvc10SEt6O5IOI4RbiH0sq+BFw/j6DxNwYq6OcSnOm2Upv78dpccdk
	25IhQSyb41vRNA/SWWTM8V7xf2QZWeDBVWxKRPcvBm3iIVYkqcQkGH2OW2usdcXn
	aM64fYKUfxmFjbd18C9ZULu51nNA6GtFuzVniwrz3nL4hwkEDgT7DS+T2DUVt94Z
	CjK7iQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtt2jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:42:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3724667bc16so712909eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182173; x=1795786973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=;
        b=L+lLWnxc2rsi6XGzfLO94COz6upI4/gUJgsuX5fsCAoKX9qw5GDMdAa7yFjNYYqVqZ
         PQ3PIeXT52KyEQQ4YYmUBcTD36rhgZVtXSQUpgN6kQDtI0+Hz+3X+VxNPJn3zw7U1hfh
         zwo80VEFsh7flPSIN5ASOtcpep1IYUlX8Lka+JLsiviDDPnksaIf3/fDBfuiTuHCrgBm
         NEbNBTBTl//yAh6E9Mq0EazX11CkWKCUJ8hhTJywFaeAZ1lxf7t8g54gWir044h68UR/
         +56bVq0P/pR4iAtm/h6cLY2OCa46bUWzJYGD6uT3TJlHV+oVgBKgQKk3i3SRktPRRHnv
         N+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182173; x=1795786973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=;
        b=Hd3sokwglh+jvEtaewovjlHvPEKkBSMWMRIUaIW+oiTio/LScVzebhKs02zQmEJXZH
         W/K7/bFNUNRMK7PmcUEune42+thmQiOvaWUrHbyset1TKamYowTBJz9Kyki2HQHf5JOC
         VQUpWwlO/52heCKDN/l2BEDva0OmdXv0ewSgRN4eKZmgMYny/qhHlzjvuxnQ/ooezspV
         Atgyv3VXM7kf8oAZpTVeG1F7clogyvc9NdFfqeS87/RcWapSQ4sbIdOeWfb0zpcoD0ty
         gUUuhsr+qjZcx+5FnGPy2Sn2cRrxwWixB2k2fB90ni6HOnfzGaT0oDe2j5SkH909sZBe
         0zoA==
X-Forwarded-Encrypted: i=1; AL+hErFq1jEY3OYDHleahs2+zu87GTwOJA78lWPKk4FBjRhGUUIjZu8TW6gTZUrMclNhqSvjqL8b3I1L8nIRA74=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DUYfKbDOHO1HWSZZ8Vg3U5XUZLzmDGWkVETvxdSctUVvm4Kyo
	GORc5JF+MOCZ5d3xpZcs53iniGT7tpsZy1BagugM0gHKIXb0xLDMaacbhJTVRCNz9IiDbiwc5Sk
	mzds1ad7PW3YY9KZ4vEz+Zb7vJCkdlB+f1Y8a4zI8hMNCQmFcPE5VTFPcIsTjd34uSHU=
X-Gm-Gg: AZFdTZfeTxPm2MoEa8Zq24ogUY4NNUmsiosOBpf/Qpc3hdBlPh7egr1FkH+fTD4a6Cq
	TFvbweJJBCtVtOTKDm129ys3crHM7e3FSmhjuhAKKDdToHPKPUH0rxbDOSGxYUbhbTf6fXrpk+W
	KC3WupEiUpznSSd03gVtA9Zuo4Ouwpg2XBElIvta5Fr7h6Fo6SA15JAHGMl/EER5Td7YZl6c+7S
	Bz369v25EjgCHxGOAqzYF9jIobaj5/8l3CwokehpXBqWiIwMNeQJmEag7t4nYCmIuejk+2hi3uT
	gI1kurrWjDFdimWCyCBWMqMmMgguy+N4vXGiZgZcaDJ+M8yCmnYIsE2JUU/cGP3++PYDCoyUW7S
	TNQZZuDUaQ4MfFVChQc0PncExXxTr0379K2CBZfytELcvjfO7ikEbTB0nQvylZc1G2i9VQ6FoWE
	sklJs=
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr4218398eec.7.1795182172846;
        Fri, 20 Nov 2026 05:42:52 -0800 (PST)
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr4218365eec.7.1795182172191;
        Fri, 20 Nov 2026 05:42:52 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:51 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:36 +0530
Subject: [PATCH RESEND v4 05/20] arm64: dts: qcom: monaco: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-5-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1018;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=1lPh+lGGWLKglbX1purFejDWg8n5fwBJBYl3rhWzR6U=;
 b=oUfXjkp08+mArsrZiKnkDBUGoVmuJ2eZr5NDLzeoQIP9UyDpL2QqdSa5M5lOtFa9uE0FtdArq
 WMGUW2T+o9/CdUf/Y5BNFEnVKbWTupmAIgS5HZe+BEAMk4mE8b6FF/0
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: JDSJe9iPpSyGGIRLSuQMlDrSQ9bM0HVS
X-Proofpoint-GUID: JDSJe9iPpSyGGIRLSuQMlDrSQ9bM0HVS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX3bvspYOKv7Yu
 2d+FMB3WXUgXCSlweYILJZdcCxsqZqIbzTvegX7MEoOUYf6SenqLzsv/U4Q8WM8u21Fl+4iYdio
 tdKpZCzNEVe9k5vxoMkOQ0X3Na/alPn5ZkQVStozwEh00n1wcRahyvTBDFmepbWol0zbU3Lp5R2
 rzBtZ4d/LzNZi1Y2K37fQQ041RkB3YEr7mk/lj+++NvBOKA9vOtoaroDitihuIh7NzChTyyoIne
 vW3dzs43Bw/5BUfGUPi4Mrmp+N0NVEIzdD3mPiyc6LYQ1l5SoIzAi9NhWWnK+5b50Uu64+6aCfo
 5c6UBA+JpBNWjm7qwHhiBHFrZosY0xB4slCp5OtuP9CCfEI27t228V7SY0nlrDFfIPrc196P451
 oBtWmapy4JKWRBh0ZxWX6ARBX/U8ADQVxVu7DyssFzlj0EkIqozsQxj0WB9svJ4qmJA7yAxBdaY
 X+42RkrJTstQ+T1KRtw==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b004e5d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Jjng17ChVe8r-G2aFk8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX1gJE1lrbwrZN
 dASGeA/LlvBnJqTXZyDLooNMIN83pAqX/fpra8V0ft9DIfFqxW5WqO7FfwoLWV7XTvGBylkLFXr
 8pGy+3sOG9/YPthW/yBxrMvy/dlpfmE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On Monaco platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 3541313a79bf..13214aa77279 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5113,6 +5113,8 @@ adreno_smmu: iommu@3da0000 {
 				      "gpu_cc_hub_aon_clk";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		pmu@9091000 {

-- 
2.34.1

