Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182223;
	b=tPVBAB6rKw9xzDfH0jcLcz6cK8dX/qeH9JqnY1MYCZirmLhx8fCaPDmVSB3H4alSUKOn
	 VIZdwWyrsJhRhHO975724V85kOwDB+CVOEouhS1CLACOf4tRt9x6rPsPUo2aDYZ3mHkTj
	 Y/9RHQlj2g+vN6WuQdrxAbBrhamZPuPCeypcrXXP0CfYRNf9FgVCabnRBZ51gNJbx9rld
	 Sy5t0a5PYtxddUTaOIu3jO1AXuU+b3Mi1f18plveoATMIXelZQYu3ynEZjvDJWPoTNnZT
	 +1JVaBYCGEJmohKKLf19Q4pcsEAH6rBM6JphYvRbMJgCWjJmtT9WqLI9DHcZMPqwOog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182223;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NVsllVIT9IyOIqvBc0flk4QJ6UG5czr429XkAIGHQoo=;
	b=mvR2lIU61IXu23De88uo4JxcmbtSmqpyx37HkVUnbC/f6Vm5TRUm+CUdQfJiHyZW4T4s
	 ihbRkskNzFDGpFuiasVDK7g9GQwkAHk8sasCvptaz5pSSZccUCD6uyxs16r+q80eIdn4O
	 ZackqnkLw/UdZlGvBRoBZbgJN3vEVCffgRkk7y3lxVQwtOzi3QptNkAj6wrAnOxjD2wp3
	 jaq7nsyBl1qmp1B5IBTOqvUT0bY3IBZDNbj48ULqTQoyYZdDVynOACZRSN0p4sNJc2BvK
	 zuNApoj520ka9U/VfFKF/XKFxfyxua9lNPvJ1OPrjwUaYukqm4vQdDCuPSDoGLTgp+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lIFuxn7P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eKppiwsj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5316860A3818
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5316860A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lIFuxn7P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eKppiwsj
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjrfd3731045
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NVsllVIT9IyOIqvBc0flk4QJ6UG5czr429XkAIGHQoo=; b=lIFuxn7P2imN2pAV
	Tme6IE7vbrfEh4VBG3ZmY+gFc5Yo3Cts/tO2ovzN0nb5ltc8BSnEVUbt0ooxN1KW
	Uk27FMs72PkvC0YSga7SHh+D+HaiFk9EukiEL6x1A5RLgJk8JZJwmTrUrpNiqZBG
	l/WorKmayiG2h/Tqofq7KpKQJ5jPbFyk1mtFCTlyduL5ifSbwiJ8knGeHg9Uv5uc
	+8n4P+4rVHuLpTI9TGZcChMKyc2msPPAUsfB+2PMXX3fF5aY2WkmdYJyWyF6MDFv
	Z+voFFBeVxuq0upyW5i6ni/nZbVo8uSu/dR2CPb2nFcn2rkWbhFWV/lO3EDsdDdM
	EOKUXQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4gnga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38355b03cb8so856059eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182221; x=1795787021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVsllVIT9IyOIqvBc0flk4QJ6UG5czr429XkAIGHQoo=;
        b=eKppiwsjSKIkWwZ7Sq9sdwXtPNbEcsrWh+0Ui9GY0DZIU7VpGQrVpcG4x3kAZ7Y+zJ
         uj2wMc54pMSiGRJySbB0foRGsRA7p7Py7nRzAxgjQqxS6E4hF8Y2vockiZRYMo2a8fin
         KAXITB2BniF+mwX8J9MsLxvqykIRHqWE83fC2RfMoE8GCoRqmLUdzILZgoaYPXlY/F6A
         rHfu4NwJFDojXexBdgP0Im817H0+rTo+MEQQfM+9Z7vLg7C8Jkll8nOSIZHm9waAlgf1
         5Zd2YigobvqGGczBzXkvPjth+e2R5zDBu7KAHf6tVDX3t+Eq5pyM2/cQIVZA9Cz3WDny
         qvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182221; x=1795787021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVsllVIT9IyOIqvBc0flk4QJ6UG5czr429XkAIGHQoo=;
        b=bC1hs6tv9emRFP7R2Expyv6T9YooGquTU2U2fr2iCgK5ClJdVFpmBcoCN4XwgLlJUS
         kW8qwKP+ZUZyB3ua72R7eM2kvMCsQOSZ9z0vG3ENYgZOd/DqgDRqFxNzUTytMFltPkcn
         utUQq+ZOFnSJBMWFKe6+ewcXtMxJX6sIlt85v/+an1vtI9Hyiw8Lpfw633R0OmzIdGOT
         08Ev7IV3vYEYSMGmOHTl4fRgfd0KnNh4/0irXN1m5mrb3N8SbPD0B/MHOGzg+650hOvf
         rda0sVrECPYuGco3r8R9GkJ5OoetVXODdPJP+3+3D5Zlc+iCwFW3bXFuSwJM4Pbi2rPV
         W3tg==
X-Forwarded-Encrypted: i=1; AL+hErFYJnYhX/DQoGoeNMOxbKHs0rokLJ6D6/jsyK3UP7cJhrJ035kgBsBp9Xrif6kSij43h1iPbwos2rV7oD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XNBUiI/zVzmhH9fIRuQQv50lJziVfYKv/+5/9uvlW473JZg7o
	6hEDVl4h+z+w+bMJlM9VAf2CjC7hxciVVvqj+vuIUqAEKxjfus/ic8r4vW9S7bq1jR4PMjgEDJZ
	XUP6B1Y9SWpoD+HRAKGXbUWL4njb6QehI2HBZJVNRR5wE967UeoDV2J+cMzYiAufzyGA=
X-Gm-Gg: AYBFou3fZk9832ieH/cYzeAHuUInh/gwj81L/f8UG9+P8rSIKnatJMfy4GIgVvYpNfd
	hJQ4WJ5MxrqRxpn5BGocsym4KC/LSPBxPVCQnmf6pAUigeIyq3yTk2Z8ykdhS9bkWweSfNOsqm+
	VwkCTYKJ8NjKoVBVpyPas37lEYFxv23jaJXlOVHrmsQypaUfoL1A0w1YZIsOoHf1Jz/7/wYk0aA
	4IK2UnsbnXmsD9RgmIo69CD1mwKQjrmWYTtYOL245tHgBrKydRTHWgnwVj/mVFx1kmZPZDLLVW6
	mnPzsDgc9RhfDKbLW36J4HidSsgNKmZXgUJaAld6hCoyJOxKeYpum5PgHK5M/fy6flB4sIEUGOP
	X281HXaFTF4ab5kjbBtZhZAzMhCnYsyqPHokJF5uDAdoYKqGs4tM5gv8OKLUq5Rj4NlISy+wYsW
	U80Yo=
X-Received: by 2002:a05:693c:8955:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3856c6ab8e7mr2866826eec.5.1795182221028;
        Fri, 20 Nov 2026 05:43:41 -0800 (PST)
X-Received: by 2002:a05:693c:8955:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3856c6ab8e7mr2866785eec.5.1795182220304;
        Fri, 20 Nov 2026 05:43:40 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:40 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:45 +0530
Subject: [PATCH RESEND v4 14/20] arm64: dts: qcom: sm8650: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-14-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1038;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=QynpQTC+tS9ewt8cTvKXC0ob9aCwyQ1VtG/dFxw7GR0=;
 b=FZbDUQLy5/rKPk183XwUoaQlvO2xvFMjsoX/3ofTAfk1NBf2M06oyjxOPBXj87iMxDLttr+ro
 Ic+UGssZrIJCSIIiqPnXLE/1eFDIukT1LoV5Yoo2qcSPsdGc//rTOlV
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: RP8INhYaOuWFIl_4z2S2xElRJRLhguWq
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b004e8e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=LWIT_UWqXYlThNCXQxwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX5SnA4w/lwB9R
 N8ablK9o1N01tjbmqW5//7Q0F29KVwwJuz3KSrfubMblFQg27Sc38Ovlybh8xotJzL2YSx1kDs9
 iSV+YQMw6CKf62UF+bFDkV+gZiIUWuw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX636OdJTOtj5N
 TJpBeEZ794K+gadbtM9RvPflTvFvpnww+VYIRfZKpNOx4C5is+CMWlGg+dML16fE5aUNGoMnOol
 9LSZJC+6dqwE47Xl4GLcSf7ePbtiMIhoQyLKsxTkdRCk9bKfUX+zc78OkgDFfCfNVQXYK/4E7D1
 ilOlgURSvF3IZo9apE1ObFV+Ih7fTCf8ssZs16RkuDlUYcqm0cUbf8ifnYOKCDueo08NjRfw2Sk
 CYcHt9Wr2yIhc5H0dQOTMYacQE/aK8l+gc5/PC0txBr/rcIfzDYzQrAzUdIkQVskuJwiYDfulVD
 dGr2hW0C3LsvLDbtrpB2HU36KVRBypuStfT23Zr4kyms86wJJSOJe+BHbjf6gt8qwUIflL4hE3W
 pBAvsdVXJtuS2xq+RduI7eDNn7FifJq5cEghfPYwWetoN6VgV7bx1JxXk/IA3sJbjNDq5c6wQML
 BPdM6IzOvvzUtER3nnQ==
X-Proofpoint-GUID: RP8INhYaOuWFIl_4z2S2xElRJRLhguWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On SM8650 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 5a030f9646c8..ecd051ecd680 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4413,6 +4413,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1

