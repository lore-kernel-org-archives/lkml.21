Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172848;
	b=0oaq5L0hq7+m0r7Lx0/dajt10aXSL6vTd/8JbWHxlNepEiKvibfu5Mf1hakc+94Xd0u1
	 TJBHX7XTfqCQ2TxSnAGHsNvO+qETI1l+lYO9FkNOu0fYaY2MTayUKiGf9VJk4Mi+v5PUJ
	 ot1cwVZnGFUkD2s4fEnmzqvnCCvSMOKws6T7GEHIueqBXPtBQ7nDRWNECdbK60dJCEwNL
	 SwVIx19+quP/G2va3rxZas5+eNRaRmS8+0IEB7ZoG/0yutAzwSb4qDcOQ8QjfVbl5n4Id
	 IAh5P/bldD1bUNJarlPHzNugij7yTbu9sMAcKML5MsMXVN2onHH5OpvVboTiDR7SXUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172848;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=;
	b=VGmxleAWw+tQ+KusDqSaDbEaQf2BTjo5HVHSAq0SMb/xM/7zDQyaAA5KNUpqdnueWwQo
	 xkJErTvsx1idS02dCIrM5A8PoKRPuG/GKmZU5YAHphzeAxFrlF2HGDXRzFtBkP/H3GeTa
	 hZ61MhCHrdKllrZciv9Cw3aG0Yb5eu4GhWnYuAyQ6RLpHV0+93Jw2gimYzCUtpXWqcEbr
	 +1xhJyzokJpcDAEtELANRWWuuHYf1BcHMJdyebYaf8NLKII9KtroMMlfTjAorLpsRSLpX
	 OajzRd/5+vJPZ23Sd/v2Dby4/L7lWkmEC9Wow2n29m3uLsMr+1RfeDSEa0HTeO2v6Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nn7w0tce;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="R/uYeFtT";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF65A606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF65A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nn7w0tce;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/uYeFtT
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk03l556476
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=; b=nn7w0tcezkDvJ+TY
	YjfSksKFS0SWd13TFzlra4358qzIdfzFHpyCV/vMizicEBW6nYs03wF5hYszYvEs
	5ZPhZLoXnfqhdEKfXn0yNdi6u0iG1qxcomJmCi89w3JOY41K/MmGGkKTQSuF8DK0
	n1aR8iZQB7C/WFHXw5NUgB3gFbm8JNTi0AnBWppd2QxS8oDk25qmUMcdVCxM15x2
	8KNTpfDLCGWsemvkJO6PVVtCreXtDZ6MxoJbi/ExBAPU/kF84EF0oJfcCDbDNdrX
	ZIInop1LiA9xtiWdFXANogVzEb07z+13yGvg+6bqd7YmbzGHy4afdu1kDHMYb3nO
	6g8Dng==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbhe0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38355b03cb8so709940eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172847; x=1795777647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=;
        b=R/uYeFtTweUY1CQ22GeU2D4pNu/ZktofAdLF9zW05BDG1w8ww4g/vnUeJmuulWDuLS
         40bPvG5Jnw515yzQIhdBxhtqRBBFkbPgmFTo9AXtdKU45+uKrDL2b44VxLXQ2UkN5yxC
         EUe9MoHVpw0fyif1KB4eUYayMjZdzO0TujbGLmkWRgcND3yzcTT0XAFTCD8fcMRe/R1J
         jtyMbNDyN3WGUGfxygQpAzbMu2ngISIX6VKx6Adzq9l6QOMCr87wdloVBbeaVXReXRXt
         N8d2Y6Zm2qJD7CZ++I9P9Kv9sAibR8uJyB0UmA/+QDxQULI3yYFKVtx8I8elHmLhUyIx
         05HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172847; x=1795777647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=;
        b=ESIwK2Y8GA1kjF1DRnFN1zLUXbPDIh8djBqxHtdJPu+Mn1zv9LKB172kzLN4Zjg8NU
         Fd5adY60fYBl17cE445Lvl7poF2C/IV/+fkeAOVn83BqrJ43FscVCNbibvr/FfQh38+d
         gWMML1rVNJmDggwsrTjxl/bKwd6W50QxHexddvy0mmh9Rne7KZt8L64ulw2kFyEQm2+L
         Sbdc5eMXqp8N/JYC3gHjk34LgdR4HRdcp3AzVGZ/WavoE5AQOYrv4SUfeJSTUsFPliVS
         IpknKJrMqHKeE+7jvP5LoZ7JvWFs3MBb+U9Aqs2EGXTDhSFjAKVvlsgg+ynqQMeaRktR
         5Phw==
X-Forwarded-Encrypted: i=1; AL+hErGvoWVlnFE/5azeszowcMoYcv8kW00d8/vrYteQEsN9TnCoUSmzRb9vx3kf/Zfuj2qNi71JsTN7I2iHW7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vFGggSB+CIQ3Zp8d4pYg+yv0aNtxaP16MNF4bJpOQooK8Ktt0
	XonC1uAKH66G17/FV+WOPAn31I/3Sh6Bb6vo7tmR5OdbiPnI9Ift8kADbMFb8Q2a1ddohV3oodH
	f2r3EyVOT8sut8ECc02jhf8Pdk3FgQJW+lFfJojhyY7ggapkAarD6097IFWR5ZpTfHqU=
X-Gm-Gg: AZFdTZfH6Jza2l2yV6RQTgCNnbExsnAt96pdomI/HEnAdWo0nFAiNxs0t+9OgXG4uRw
	v/YuE8DHcj4tJwqLKtyyYfjC3FCG62elQfY0IsBtjFgD1y5iJzieuDl5XboNVFiADUb9tQGW5s0
	O9IBNgQ6tnl18G/Wycj36rVsZxNmbWZlJ849BCujfbwV2aM3GfGXz5BeMu3FJt8lU3y7M247wU3
	zqlYzFwys2r0UecNTCEjoNT9HD3sV93uGYoL9TyEjsx/IqntwKXWr5gObjaD3k481r78Fk/8Jt7
	+NdFrI/99sOAAlpIqsrmzBCnioQPA1Lz+oXZgRcvDHTAc/d04xuw95aLZIPZ59phxFthnZS3D8H
	uV5bMOPzV8vQJGpFXiBGSzcqbDtdcLeBEQ5mLSGDVo8aUE49ssEOp7L9iGeBP4nWCEVh0LGbfck
	G+kwn1
X-Received: by 2002:a05:693c:42d7:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3856f84fea7mr2428864eec.16.1795172846494;
        Fri, 20 Nov 2026 03:07:26 -0800 (PST)
X-Received: by 2002:a05:693c:42d7:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3856f84fea7mr2428825eec.16.1795172845799;
        Fri, 20 Nov 2026 03:07:25 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:25 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:48 +0530
Subject: [PATCH v4 07/20] arm64: dts: qcom: sm8150: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-7-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1053;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=9j6IWx76cjPCAQZYybv4iXqHVebU//kZAlxNICMxwEI=;
 b=Y/oksJyJN6vOeMPpNN+xuZE9wT6hWllCqRyWsZ3CEZE7TaASQPRSC4ChsqkoGOgosYBHuX5FY
 UxlVzoJUcvDBx0MHv4SU3wTUjNViJjEt0woasGqy7g2RY7FnPEEWu4j
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX2MAvAsa/NiR/
 1avnomLssehVmvygU0bC/p/fCUf8anmlnqgNgcptjzZjB0xvcpezk+3sbkgIKz0mjg7mWz8YT6s
 vsEXv45Pnw5pYImY17K9IUzSViQBM7bGxTEhgC5DUV4KVi2mbgodM/DL4w7bifRa8hiZH/uJAfF
 lJEyCUcxJ/ifrbBHvwKAvKp3QIP9LYxDeTwcIBH5xYG+ZxuGFlWB2ioRRpSZG0u+4T975BEU+bH
 l8ivyXylVTlTuBUToJcgS3vE77dxp1KgbWRmU6jYSfA0Qxgep6Lrz/E5vUVNaje8UKvYGubbHfx
 oF1tYvJxl2etVNG+YtZUfcNeCqSweWDZmLfG/+WeXejgRpTXoVudo4x5zWyf/7b38fPhg75pmzu
 WfBzZbJHOMf8sCI2UZl3yhWRJsvMytqvwWjGgGq6DeolhxvzE45/TVBQkZMhTs9NYN1nGskhvml
 WQQSTGIws8P9J5zBnJw==
X-Proofpoint-GUID: anprDS08darcOM0iHNR8xPQ4LSSFeQ5_
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b0029ef cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2mEde68aHbpXMYUSS8oA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: anprDS08darcOM0iHNR8xPQ4LSSFeQ5_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXxUtw6XwZXucO
 9+fs4lI1aH6E2vh8nUhpjW5giTkx0p7kvZfFOFusUiqloTsZftkRFkFTlRnpOua6suRw8wa42Aq
 VIYsJld+tUEiyQ088nld6XwjwxvaaaY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On SM8150 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index b9846b424a93..4b2ff316db72 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2396,6 +2396,8 @@ adreno_smmu: iommu@2ca0000 {
 			clock-names = "ahb", "bus", "iface";
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		tlmm: pinctrl@3100000 {

-- 
2.34.1

