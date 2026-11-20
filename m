Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182165;
	b=wfK8KUzIdYEa6OIgzEXsuer6PruPAKLfOFwDFbdSz1CFJsH1nBM1ckGGwv33gflpFvmL
	 AvQHuvcQMaypg8Q6tetXfDr22EJnQvSWns+JhYWR51z8UvReB3Mg/ocgnLNEosvIDC9x2
	 e0P68kDS7nCV/6Lm1zihkwzxGw8eZqACBGlSh7CFKNaiDWNPyDdsQRCHSE1zYYsaZlkGH
	 j1qOVwhDfomGJHzxydiU5ToK10NlITK+8A6peXzav+AsUcpzpf3+Lxl2Mo97exYRumucn
	 L9vB3ALO5+J4KcS5f9kglt7B4F1eVE3mnnXEZUHVSMCxVPDpUWcVA7+R/29E0hrFUBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
	b=rZEbV+Hnn/5axu/n8HTcjhVaVxC1vVlq6WN3gTDD3+qC5FEPOYwIlsnokzw22eYXfI6H
	 V4nv00W31qTqU/EKw5PJldlrGXwVyAE+/Qs53Dvt1DUuIQlAqIzAgaIc7WeWSb45e+GRN
	 wJ+zOZ5M3WFOD75p7jqiIJXnG+V5sxo9A+JgTB5qEd/2l1D14NVwfRiTOdp7BNqZ0MMRU
	 zpP7ls/dcfWZia5BJNz6tkQsZHBxuHZXuWqAymsytxsuzZDTB8fSYphJ7qahChsNTMzLq
	 gHqy/zDVfchIqyOTpYRS/iTxrJsFVrHut+hXlWF8b/AnCIsZZ9YwrWbO3QlnQ5K2B1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bYmi+T/L";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DNlO7aYP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7D3606A333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE7D3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bYmi+T/L;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DNlO7aYP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk6PE1528777
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=; b=bYmi+T/LRHoqTqTd
	94Gqlb50tfiow5+v8/rkXqpFl7NdkokObmijgUeDEaWR+e9s/xS1QFWZehImv8p3
	woqw0aXLr/+6XcP9nlay0j/n4MXOypBgrKYgpOQCejOcjtSk88FTAmz+/HeQ+WKQ
	ph6O4kS2r7YX4pwaKw1aexGUQ9H1/7MVBspLbtRIjy5mjPmk3UhxoiLx1tfDkET7
	Ln5tVYMIg7c7NgVikJrnrsBQ3KaFqefCMdkdmK5iDIpYEhKHaoxL3bRzuR+ppn01
	UO9Yu1cnzw1Nsk1+3OR3yNwgiPuiKyB+FML4DLskm4o1oi6JAvpWseKO44+PHcPa
	hLOCDA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtt2j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:42:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3854627c1c8so1301586eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182163; x=1795786963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
        b=DNlO7aYPR3BKDGo/Wvip/26ZBzIDnHhrNDOAhbwZcnBJmL7jL4QqgZ1H6Rud3dyx0M
         A2gvaGMv2QHPfxeSaXx8adXyIAzd6J6TqP03syHd6tMSDpc1dGLhf5Bl2PQ6r7V6C+vL
         Ow6H4uYP2HIQyIxxs6TV867c1441XfnUVXD3J1mIy2lzkThgXOq8S/46Hs5JcpjJ9Pqd
         w0twktk1Z9pRR6tXIwBCkkbPJZJU+KNXBojl5QuDl86vH01yU0CypYpZ3qZDLoVGgLUG
         Z7Dyw3CWKsq/BVQzsEIARk5vKpPEIcIYM/TlBdpo4MIQlQHfoXPtAu6DOisZD7YxzAtP
         KKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182163; x=1795786963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
        b=s+aHteBcsp72N4LinAyHMre7s8N/+BW/cTVD/VjN5cwRwiHGcQmUNvcK1gAqEPh5dC
         iJUoGgOP0oLASRO7gqLI6Sd4BpsHpcBHDbVCZd0HPDDzXHRblWioY0Jch/S5VgZ6x+9F
         PicmQj6nkbMMqaoKnwBzQ1ZYq/USe1YNdBHGkrDAr/zsTyUmtd149rVy9cuT52lUdlYG
         fy1BLKNVFC4CP7rpYAplc39xRoA7IkazTQizlcQRRcvIhyid86Ta4NhL1HJD7CbIws7q
         YVvWsgcPJYfvIeia7WgOgxjgUU/karRhC39DkkPIw2CsqEaVJhVyjd+gK686Mg5Z5J4g
         Eitw==
X-Forwarded-Encrypted: i=1; AL+hErEC9/E+QmQ/YYoDIcdXEz9KQVnhAzhOR4cuN9kPs3yqGFj/mluWMcNGsVQOiDFqZ63PS04oF0psm1KDNZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l8T+ZJz75GkuzzQ52XMN4JysEhHQpuhSR6wRo8IXx/UURiKvN
	enhggvt9c5Hsa0GbsSei0j3dHAivIqQVOtPi3dx77wo1hVDJxsC3hjCd+BNUSxXMsS2aM7Pr6TX
	eVY3GGoeymF6BlsfSjQEwK0U2R69rdfQiINB+/77MqBC8E6z2bQ2k0onrAZrMXLgddUg=
X-Gm-Gg: AZFdTZdm0zFLayt+MskO7bAmGrH8eb70F+mpMkKt/O2Y+WdKAPaAotAN10G77sBTdFG
	9SAjyhkFYqi/4DldEYsZBcIseqZSbEYs1xOfIiqR2aF9I0fqaomQqagEFP5wzxjDrI52ewNgOFE
	5FTcarbHXY0vctaKQLFgfCHuQ1BVdopy5z8CQRlCIOms3lrxLJhJX/TUk17tIHgoTXryOfKCKxp
	Gp7HpdF2bsDvllWMci+BVs/e+kNJikAhToZbZ5sW0H2AY2qbyNwlarmHvlMkzHy8sDUIKCBNR3s
	pSNirJqSS+G2GHb/zn36NrybdxbfmB08JK1nN0xTRkW7Uhz0v/2va4J+aCmiHcph6DtGD62ARuY
	z2HTLxICP06mAZ/SnPBx6dSH0a/415FtSLA4SJUJsJspXamMVbStJ/igJTcEZmunuE9xRj0Azce
	3wNpk=
X-Received: by 2002:a05:693c:68d3:b0:386:912f:c8dc with SMTP id 5a478bee46e88-386912fe5efmr275779eec.6.1795182162157;
        Fri, 20 Nov 2026 05:42:42 -0800 (PST)
X-Received: by 2002:a05:693c:68d3:b0:386:912f:c8dc with SMTP id 5a478bee46e88-386912fe5efmr275745eec.6.1795182161506;
        Fri, 20 Nov 2026 05:42:41 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:41 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:34 +0530
Subject: [PATCH RESEND v4 03/20] arm64: dts: qcom: kodiak: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-3-be30526391d9@oss.qualcomm.com>
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
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1065;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=nfp8+SD9J7PQP1TIlHLZz6YXOr5xoEhGVTCZWtBdhd4=;
 b=qTaOksY7gsG0/TAQ8p0w3sFjf/8jFeRmyK9JK9OfJYDfD45oWCkSu1bCDoibZtRSCsznkA/ZT
 w+97sfQhwAwD0LQcjnDqzk8oUA/ULDRgLgiINfsKeFTjv+24w8qpbBw
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: fIJoR9sin3o448FZg_w62yFOEoSLThGb
X-Proofpoint-GUID: fIJoR9sin3o448FZg_w62yFOEoSLThGb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX+afONlPgqU3q
 OXV8doNEWMxdx5lAWktK0Go4Q9BO9LPyh3JavqEmsoQ9QkI+kHbouRNg/LRGF9VaIoTkA75Pgio
 OUlMJggzcahjC8BVcBKMTDgqAqB2MMxFH16NRhhCG+sFylKdvqVpM/sCEYBsyACOYI/wAQsGaky
 uHezu6XWfIAh3Fp+RQOFHBJjJEhFjR+XiMWuSPmoKryh32BVGRDa6TO897AJwMlcWPlvw1kDi4+
 GBumnzq9sdHJfy1Csad5Hxj+kq8q9e2dpSdVDlwxuk8+6+BD8nBn+FrK4vThU93D6twWHjCIgEY
 9A95ZOSc3+TjZzOVBMUh7Ze+05WgeYq4lAnmjJzjEx6QsA9OoGQgCF+1yjvv4aohUrIl1Uf8XIy
 WobuW/VGB+WfWtMGe4G1TqT6nSCWYdc62kcwvS9EPvQi/YMjf4s+paqurSC2KTutym3HHgAevbb
 3pHOj2ASl4BGD3D7/nQ==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b004e53 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wmxX9RSyIuGEu2EnybwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX5pkLRrLRGvMs
 mVRlLvktnQafVBIyrVvXogjqPMHW7kxXSO41oLL8RkfI5DRC5XQ+bdeI/zPS9uKNz79cKU3RdzZ
 TUDu/b289DoTb5VlyIO/y1f8zKpQMBM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed6..c142c7cb509f 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3413,6 +3413,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		gfx_0_tbu: tbu@3dd9000 {

-- 
2.34.1

