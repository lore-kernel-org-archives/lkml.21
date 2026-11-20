Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172911;
	b=vEnWGhYYIUs3H55re3r70xJI+8MAAxhkPRVCgrR7yUOg0su/w7ObmDvkCjGnA6tUWI3y
	 GFKCmzsKjI2bqV37Xx0SVT6jiF64Ie8VzGPkgtA1ZolXBuwYWOaHVh/DtTpC2hZ67OumC
	 tySyN9PkgSedBTBtRNxlWiE+UTHpA9ABUdOZhR5sw4e/6xxZ4S2tdUrtasvI/iCN/Is0l
	 +lD8KQeCCue0UOffcRNqVO4LGz9kWmIWZbi/+o43gxtQj6Y3DFRDCNwflCAMw1ToqUgLr
	 IrZaTiV4tu9j2VMKGwzr51u23BAWSA0A/AbhIhcYESipxNGAKUJWuMqyyqntzQ6Ra/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172911;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
	b=rcYWNrIHbdqpZybi+DU9sbxJpp+uzRypC4uzlo1dUeQGO7O/LperdtanBKk7UhZeF6oK
	 YuYjUxpS6Ng9SwUUBOAe3nKIZ6FczzCjoLOrZ2eAlB39fadd0wGlcB0GD71uBX6quvhGi
	 hq9U3IoR7IB+Y9D6nPoxasodyNOHRnfqkIrvtFR247Vc/iMYZl+yfTQ+7uBn8fgMYrAeJ
	 ehEEONzy16IrAO0pyjJBTGNEE4bD1MJigHdFbTXxmIWrdQzWtjSrxoDJWhV0xQLBuAh3D
	 45n90rcXJhmo128tIWittc5ORg19aIUkth+7zQaR2DXqWJ79E0U6V6QHPFNJ7OXvguQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PpGetJGQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XtnMhW0v;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A607C606AA05
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A607C606AA05
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PpGetJGQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XtnMhW0v
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjpLc1462905
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=; b=PpGetJGQ7pBoK2Dv
	V2W5Gw0cdxOoP1ZJ4IwxWGSC1dqg5+8NDZ2ba8egXMhLsthVoHZFC9RfMXQiuAF5
	gBR4XyAeyHp+ueZgRRzVj4kFHvK1/O77TW9MAiEq9fiOdF/LEdXyudnNQRpedwUu
	tsgyvP6Tn+vHlA3uH7pwnizO5Kfmlr36hZNohqvK7iMgaC6u8DPKNNjNvsoag+AV
	Z9aFk2pYt7bue2Wm3eRtj12Z8z+9DDCGSzr2CnkJ+U0UROzb3VMeu1cUFK9HoF6T
	4NHBraoGBIaWon0bwvQpjiAb1if90/U36LzxRg+VAGGjn2InlLHzM2Sky8Jqz5Zh
	avi0Qg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guah5wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-370230d93efso2463407eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172909; x=1795777709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
        b=XtnMhW0vdP4/lqY52wkXUYOAQeUpWMjQ/jwjoikqejchOXDLWZ4xc1PRU4qo8RVZRq
         UOJgLQB+qohCF1G/L44CYdsmL35/UMZvHrhGON8ZE62JFG92m6t+8iU/WAtWMyya3/BV
         jSip6QEsRDLxUqT8b6hP9bRmvaYXoJMgNkJBJ2TkDM+hbCqH3VcY0z++8DFINhJoDGuo
         Rhx/4AH3FrUldBB7Y1TZqyRtdqb90ILoxfYMV/BHNWjh9fPaqW8SKKr2m08sHJXmXU/F
         DCxd3T6ARRpGI6fUVkWzAIHbBBziF12CZAFzQMGRY5nOpF0ZAkAfr/fu96WZ2xHIv5Ap
         VQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172909; x=1795777709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
        b=NDFMTzQi1fzmDJIF0IXwhC9CwLjtLaaY+rAT4Ss5mCpdRB+1N5FiPKDLfNvRDBcDUE
         +k2zBlyejSOnkEvpkAaJkeAl5SWzS4+XSoUwfZZ+EBXZ8OewJ+V0pKjVL/3yWDxv9oTK
         bNW6GR/Q+jDFEyt47SPGNq7O7OzDe6LFMXpOgqdSFdjKcz8Bpf5nzJ3G/3rifZkVeDZB
         w26Sfbxn5ANnh2xv0mNwNJHybc8TSrTo4iCFigIOmefbi0UN4huZfwEh1FuW7kEDS47L
         FMn/8viZAFJ31QduhZzy3f71bPHoOgAjdfgB5+A9olinv8FRoEW0Wq2moCTCyGSifEY/
         CB2g==
X-Forwarded-Encrypted: i=1; AL+hErGYQGMTwg5s97dCLacIo6/o/UQx7WSDqSA21DkOsbqVZgDKpsSoMWHlYCmJI6zcJsPq5E8YjWRUC5zhuik=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+Z29Wfw+7D3cee3+3rwlOCnpsZQPrnRrsuRrz3gK1CyqKWXRt
	0FfCjl5XASrUtW9Uv0sEUypXmuyoqEHp8CrPcE6m1sYefeONqBtNzEXflKJEXBq04n8NednzzE6
	EWFWm10kdwU64z3oTNr6PRjb2F90vz7aacx3i+BS6n7q5uSrVc482j26WM48Nul32Kpc=
X-Gm-Gg: AZFdTZfr148uGo3IY9SYrxMn7uSJyjTZAzxSkaTlVJ/beoc0kY6OvECYFWP2dBf2hnd
	gWh3ZcjF/EA4TMxX+BSxKiZtp+H89heyEHl90R272H8BlF77Nzcziqlx1FOWXUj9OmU24NIhCFT
	4tABz1SMSsU7Qms7vKOougR3WjheZB2CiUmZ3eObyNe2DBdhqQEufcb1xJin60wB5Mdxaa61ykt
	pn6aeqfoc6wpqP41jv21ngsNfPNbtBVCJx1/FYTjuwrKRTvOZJ5VnS4/uPkvTRtgGBijXPEiOI2
	VcOg106k0E/+N0TAX5tkMbigg2GmnWB3VGFRiCpN3W9JKmK6Ijsz4ZsPuxHNAba0PVymmSePuPr
	o7UlsrBFv/ciarktDYMc1W1cbTqKLoi/+kpGhL6kJyXT5l3XwmDszZ6jr/o9wdoeLw+L4/wHIEp
	cwr3NZ
X-Received: by 2002:a05:7301:9a82:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-3856ef45385mr2548333eec.14.1795172908906;
        Fri, 20 Nov 2026 03:08:28 -0800 (PST)
X-Received: by 2002:a05:7301:9a82:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-3856ef45385mr2548284eec.14.1795172908315;
        Fri, 20 Nov 2026 03:08:28 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:27 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:36:00 +0530
Subject: [PATCH v4 19/20] arm64: dts: qcom: hawi: Add GEM_NOC interconnect
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
Message-Id: <20261120-smmu_interconnect_addition-v4-19-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1056;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=aYGbyD3vlcsShV5PIBfgPkIOIPXgEFvWy/UpvGRwvdI=;
 b=PmL/7/OIAhKe6+7Ml8hww8O3m8ab/UwFs5/yUv6UukBwizaGo3hlxGIlCcYx3COfKyuE5mfYT
 POM6ORiOASJBu3Embpz97TTwUKRZxIR3vDX5gO3izhLjXm5xK1bvqGt
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXxbiL84ROHT3P
 nKMQpzeeaPV56i/dVDACU0CuSo2OyhNcu38O106y/86rYuYep5UMV94ARxnY28FmQLLz5LrYepi
 e7XIcDd8UJyFQ3YqUxC4Nor0KX1g73Q4qiyWJMRWBcVT7Rnk4YqDrB2ykTpEfdoGW+M2+JIZ546
 b2kjmjSW3qMT4IAnia/6dNdPg4T46H0kvVkU06EqBeQOjzPWQhYN0wHf46erRNIE/SefrPB5paM
 f+iJJVMJaELg+ulUIxUMu33D/rB5Ju6egtcKSUjP9cSciBHHrPy2U96mepjCO4n3oC6q/sHRWdK
 D9f4oD2tWjs4xEaSHd/TltOvmtoV5oSStZg3iF+jpaZVr1zr93E+LeGrUE8uxLfAstu5wW73Kpc
 XEyhzCsxNta/OjgWc09wkrimH3yXSwYKYk5gWDddiypSAfqThr/VW/lj3n1wV8QFoJLW8sxs4Nx
 YlJ3RftLp9v8bPm8d9Q==
X-Proofpoint-ORIG-GUID: JlRmgqJeRBlk1IgEWlPrOjNwU8nifp2c
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b002a2e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-u0lSa1b7RXV9CCC13MA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: JlRmgqJeRBlk1IgEWlPrOjNwU8nifp2c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX1aIaV0QJ8FQa
 Ylv/si83aadWrWFQUgUYxbXYhpSMvLNADhFSGeXJWgp9EzWNu4UsNSnQq6UXAua03zXx4y4gxIl
 /IIoc81U5DqB4XHYeWh7fP2brOZCfV4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On Hawi the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 77d704fa6cf7..bb60ed9384c6 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -3685,6 +3685,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		remoteproc_mpss: remoteproc@4000000 {

-- 
2.34.1

