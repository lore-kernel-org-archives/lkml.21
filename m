Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172843;
	b=wdNlIfkyNWkc0fxc4yrBQ2+2uWtdRVTVRCiKF62ih62gRIMXAaocooImlzNDK8ODsR5y
	 Sl1wb1pJFCXKOg4QJ/Vk64eMYFwiTx0OTq0FFUo9SPD5rO1jX44MGdIVNooIO8v3+O9NB
	 Dq2LhpZ2MssPOLxixGgw0pQjyDts+TRPQGa8wlxE1GstYUtv39iDkntDBnBOZG1qs3MST
	 nsnr/Xq4vvTAY9mb/nnc7Xb11KMiRQE0FCH4lihOdizwsnXgF/Ymej1/63FDMi7jFZmq2
	 /lXSMHhkOn/8fXxDfG87dRcCi80iCmY2yg0pItWJZNdNuPonMWmMBTPodmdMR73vH8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
	b=wXpfdc9z7BMx8Js8XZRhZIafnfETrGftetawYbSixuF8j5gFqaClbYs6TBSUnpLJz5jQ
	 0uD7wEs+tOqIc7I9amXiiLRsIVp2SoD4DRMpb37F5GqwW+bFbZFdPd4MesoNfXQZgovVG
	 MyBguFOIfxZ7nCWwNeeQULazSIV1ErW+R0jeCXsHNs+t3xG7nugZIZY4VXhQiJa9kN+ke
	 mmyfW+hEivqmCRd6rTKsrb32z8Ozfq1PMpQiGpR7CeSwnrH6L7GSCRqqNSR4v4q/mn1aK
	 cNAF1g+vqbtl1ug1WSdmHF3su0N2kwXsH0qWbl1SaySdtHtbFhw35gKM0dtXhkNYAIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W5ebzzsf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kPCeDkOL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDEA60A5BE2
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEDEA60A5BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W5ebzzsf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kPCeDkOL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjoJh1462889
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=; b=W5ebzzsf7VsPPxpM
	wgD3pCatpFUOUy5/p47/gHoVKI48WEwh5flF87JheCRDoMizBtVEJb/3Vc8cBZjc
	R3wHNPtoMCzW5v8tuePAIaEmFUeMLrJKC/8RCYCpNFpwP4asU0Nlb2PSP5zdLL+K
	Gae7xJR/4DtcGJcV5Gn7vy+JOins1QZAhOBMghIZn1Hb65JfFJGd3LPYi35KhlNM
	yE5izBJKJFmLS0qjl/BF7iws2Cpw3NRPaHhvVUjxz/wsMw1LIb6nmQte2FTyvkpC
	9V8F8KS5PfVuC4wUvm8AP/us1nIjBviuqwLOZl+3Q/E31xUjd3s5+36QVVQ68JEq
	nZdNBg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guah5qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso2460786eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172841; x=1795777641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
        b=kPCeDkOLEkZtsFMJL7l5svYNo202p4GDbSPnGHPFWo9s0mdq7Jt0doWQxQFrg8kNMY
         +L7ydD8SPjWLWGq5Bz5um165z1/y2NsEyHJO+wwEsE/qCdLnyxXOGSYaP2LkCKs15TfB
         /3o0H1XFuEe2kftxMEE4VfzeF/B0IuU8vyf/EXqEVw3cy1cpk0sxOkYepOj2iuUXmb2G
         MswoxtiQ9S7U5oT662HivuX8m16VkRlzJpLED0r4bT8noqgWGB9XNzi5diOhJzA/Dpgi
         wqd2he91JhCOC1wqxaDQtDMTMUFL+iUF28KgvUORxyImU/IH/vvmcm3sLCWjqwZuRWBG
         GBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172841; x=1795777641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
        b=fqhL2Cd9A+8sqOFQQwHEPnT6bnrAXOnXfGE4BYuIE6pp3bbOgfghVX7i4a8n6jxmJp
         UJEPC0zv3NIkKl7NIt6LBKEPL232k0wX3zgL1UMzb42Ps1VKD5RhcbvSJ1JF9UrH8nbw
         +UDYVBs/OhNa/xs71g5NyXMsw8AwtnIksjmDUrLfOyWOv2epjR8uqvHXXeUqUx0LrjEZ
         bosAoz2U8YjEa+QHv/iZE+d1602jpuD+whs4VDeWPLVAx9YE8c0jP+2EiIc7XvmVGass
         zPGJm/UjQj71MOBHLvttP7EF911WzSMGIhyfaOGBi8bP0Mc/T0kWDdOMcYsMfpjB5lpY
         9kJQ==
X-Forwarded-Encrypted: i=1; AL+hErETY7ye2x6jvpd1I8SgYZs52bqaN4zzhb9FebLqTTNBfmjEBWP4bS1EdNp9aN2RKVxALe/FNH1MTfnfPQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JEZs+7q1wigDOtu+gOrJf8BSXznLYosApHkTckJi0tNLWGP5a
	dprg/gcu5hHOFsRgjMPBPXBpqxA1XseADY2hpau8u26T1x5+P2Dn9dbR1lteoD39x8/la9549dn
	pRn7UBn4zo87CajtQamWKfl+yh+KUJtiujy12NAWlWt/gAL6aWcjg+iHwbydCCWqQRp4=
X-Gm-Gg: AZFdTZf5TQjqshOQtHT8iZxitJ7gERPsdgm1lNDBhPq+6MT4MnHCxdokt6MKOv/KEiA
	HiJUTND/jn/XPrqZEiPBh5LQqEx+iwv/tumFhMNTpF9o+gwK+ORotKDabaDFb4AAWf4EUwlGe3z
	Myb2CzftHU4fOOxGC0Kvurcu2igxGV+gc8+DMLyZ6z/h50xs+Rpuaz++ilFKXhKAgRiZHXj4OhE
	thz+6ScG6k9Od1rYlJhf2++npwTV0waRNZYNGx8r/iCMBe6v1BN4ydGMl/dX3qqtSQcJTRzMOIh
	PhMWvPVFywhQxvzmILmKnZujDgOycc1PKBiHpjnurdfM/A1wVj7p6bT7biYFKXGZlWHvkwtoyQz
	jS8Oev4h8wX39Yv1Lu1U3M92XUVScpFs1EnX+FpLokzqkAZKeSakUe5v+KuSsVpRoEKU8uteQhs
	cTbybJ
X-Received: by 2002:a05:693c:4142:20b0:381:7f3b:3c13 with SMTP id 5a478bee46e88-3856f4542e7mr2706105eec.23.1795172841329;
        Fri, 20 Nov 2026 03:07:21 -0800 (PST)
X-Received: by 2002:a05:693c:4142:20b0:381:7f3b:3c13 with SMTP id 5a478bee46e88-3856f4542e7mr2706055eec.23.1795172840688;
        Fri, 20 Nov 2026 03:07:20 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:20 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:47 +0530
Subject: [PATCH v4 06/20] arm64: dts: qcom: talos: Add GEM_NOC interconnect
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
Message-Id: <20261120-smmu_interconnect_addition-v4-6-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=992;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=7PKy0XlSNrGfUIky+MIq+A+DSi/A91nh6BKC8dJ00Ww=;
 b=66qF+/nWyNlaszLHI6kXBTrNfnf56mWk2gMlIf8O2jXgkbggFAh7NqKDs7jmCnHNac8yzPs+7
 GLQvX00gi3tAwC66SIoqPkgnkyAmuUiWflZTxDS/kYgtXzWwiKmG/EJ
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX8YqkLqlo79SP
 YIoJ/pNgFAhDLpkB/RrDngi0oxwo5k1rXwJhMIVCep068xDGDP3hoOGoFxD95FYlqjNbp9ZfGI1
 1ek0BMK6x5AsoATe4g1CCc9cs5ASZ/ZPFZfd2k+BF3lPOcvWn3IuB2kD4p7MTsw5VFsIuFqV8XH
 bTXp3dcVlBRbriKNAULvXk7PPR1Y22g6WHPhjY566r7VJTynaGFbTNQ2mJmbrOeFlUDEnIocbzw
 MRYJkFzEDcdYAck0H4zWgSEPpKBFRPNoCrsvRmjaVaY9NwKmWZyDTeP5aWOhc2fL/qsyqTSSJVb
 jK2OIVLZLoyw8nArFoPeJAjIcVuZIoCn9x0yqqfVJoC/LSMueru7GuJdNPrTXydEyu18bkVmdLd
 5Agcl48EHsrBYB7J5ZWf5U94JZ1mNieXwOkOWC4Ks8T/XQsN5ezr5S5ki+OJuUiDHXTG9rafF+N
 /aGB/LMliLdLwT1GRdA==
X-Proofpoint-ORIG-GUID: S_DoCwBibv7pR7YRazgDMmVbPOh-bxnp
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b0029ea cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rfUXoPsZI_F71NZxNB8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: S_DoCwBibv7pR7YRazgDMmVbPOh-bxnp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXz3YCfBcEiUxB
 tvOklrLAGzEyh1+s+4Px99a66gU3G76j9U5SQWKT+M22Mvyi8+ppnzOMM2ikwIIhHDYUDBFhm0C
 /kk9LL9VW0uKyFNFplL83bSEbzDNNQY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On Talos platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892..f022a44ae5c8 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2102,6 +2102,8 @@ adreno_smmu: iommu@50a0000 {
 				      "iface";
 			power-domains = <&gpucc CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		stm@6002000 {

-- 
2.34.1

