Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172885;
	b=vegK25U6NqFowJxK53b2smU9yjwWQiZTP0J+WK4+ytN9C26vRJBR7z0QkOLB1XeZ8tOh
	 5uFSOhG1GKFzxGYrRTCmBVYDfRQt8maJh9mVcS99P5J9G0YMPZc5xS0km0vg6tD9bEgyH
	 G2Krqwv71JOzDjQf8DwU8h8E1sqLzrBNJB/Rz68+bg+Xo9RT9DRr51rowLriJOpgQ16UA
	 AIkn7WcJWMTcCgmCRH46dnOTw350WEjFov+1WNKDYF3/5qV0nkMR9luRH7uw5AdHBTd38
	 RmzLszq0lMnZAjcGNxEApOhAT6GeCGiup9FBg4oj2NVHzCXoYxcZJc7gKpM5QKUxd6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172885;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=drpSu4HheKaqlFGXfa2FVpmGxrRLS+U8hS+KH99KJHU=;
	b=b9UTbJXJC6T0fndqIsL924Xp60pW9RCx3cyUc+NpQ+AzEuazsPZqPGjMpz8TXEhIs1p7
	 d42hZvSFFCTyY8cwp4TBPIdCPzIAYAy8q94JbBUU2rJTs8iT8akyQw1WtcXC0oZ7b8kU7
	 GrNE4PaVWrFF0V0hFc6Ns0xPVcFA6xVH/Flge6ynKOa3aXwRFSukWrkOW/aRmegcU/SWS
	 ItlwtnZw/5vd/+OWF05NxCQ9SEti4UBhGd7Kil/al9/cA4HaVPqWsWqu2/8mrexX2dtRB
	 KJPyagzQK9YafVpqWKXyU+xeF7oTPSw8EBkhxh7LvQbMBJoGbzBflXlXrDvWjpW22Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ggyc8/hy";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXYLEjsS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C63760A2613
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C63760A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ggyc8/hy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXYLEjsS
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkg9i3107630
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	drpSu4HheKaqlFGXfa2FVpmGxrRLS+U8hS+KH99KJHU=; b=ggyc8/hyxmlWS//p
	IvODsdges0NNEEIs43B2ATBJOjzvWfwHStiFyHfdclZtyYmrcTVan/UBSiHQPiBa
	pmXLOae1fWbk/32MeJlctcEPkuIMSxbMywnbCUSY+HmnoJjt3/kMtGJwmQg1GPi2
	LDFYYFBreFl3GDYzDzum3yJtPAEaRcU4u8COdKB7jjj/Wb5xGaAg2yX0CasB8QP4
	fDAxoXG+cC/xd75ozCAYeK/hIqrqHIggVHmH9iUqprcFZy1Pua9rTq9BloUsEvCi
	sMLxmlbxFsWJAUbIhPhe0fxgI1PXerT7PRRYYsLz/OxfZBcc3oR6yIJn6GYqAMEB
	5BtBBA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3c01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383435e46f9so605109eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172883; x=1795777683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drpSu4HheKaqlFGXfa2FVpmGxrRLS+U8hS+KH99KJHU=;
        b=DXYLEjsSr9wonQrekUy8TcpQ8VTQm7N9wCrXveLVTN2y8wlDSHhJKNJtvxCeV+1Scf
         xnT41CP5S7Speg2mznMIYp8iQoq7BCrxGzu6iVVNN2wfhXw1UAkP3kHfK85Y9WGYXv2+
         OZPWGfROA4yUBnUjVBHOoPja4mvk9mTuOYuVpKPqkFogT+hkaYLoJqbgU0qWwrwSnSGG
         HeqmOA+2i1XHwDkbfj1ubCvSdICGLH+Z4KHNF+RR1peGxd3EEqJupEWESZxKWSDja6O6
         MCOqYeOgiIRLbmzbwhNjNGU8ptsShEnFB/kEHo5lkFo7ROOGj4Hts3pTX4NcMCJJVOaM
         hIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172883; x=1795777683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drpSu4HheKaqlFGXfa2FVpmGxrRLS+U8hS+KH99KJHU=;
        b=2tDBMjYegQATZwZ+wMq7v7rneT+OWxKD+S83jqGJ07dXUfk3F8zWB4LHn2RsgtRF5T
         KVvjgCviVGWnhCqdOph2bQ5h08FszymTt2H9YrwGnxa+6L4jf+R+xmWcAYEqTWokApqn
         LoUhJfezRs73w/oNyCnl0QQeAkztmwQuluzDpxbsmhP2lgmtxvGbf252bvvswXL6BWYa
         ygeIYCkwFfVit2RvcvJrfO/L86/tE+mNX+9Vka/TtsTOl5QvhMzTTn4aS2PPjb3GqK8m
         YVluHyVvXi+qtN9Sidt0GIHSDgr/qCjxqlqAbdaCEvRpDjK+KEeqmOGIbPbKL853DSoO
         I3Rg==
X-Forwarded-Encrypted: i=1; AL+hErENSGtfxsdOLqog4PoiSqvaGWDZtVvWjd+kfc2xYtBPIZt9ded4h7JGNqs8wptQz3R+nd8tE8dKD1auaCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eNf7y0IzF81KgXHQY06M6Ic9s35cRJuWJdIv6/axA30mUGt2O
	NapCn1hgX/PZBuhq1sdZUNfPoN2WK1tATni/+sR+zK5GajoHrXApTeppNGYUZ0GnbVG9BhZamnI
	CEOfIZHEHGfXGyYXic895nGeJMkzH+pIopLogmWbPrw6sQyTd7nTNHofvTdUIgHBaC2U=
X-Gm-Gg: AZFdTZe1u2oNrTkPU3Viomxj0/DmQSea3Ukha8kcg+L3wwWtuQu77ddIsSTlhk5ziJA
	v907FFC9DUDSNBaMS6wFkEotj7lA9VW6krIkBx0/sxLisoV/CnFDvcZhpYAUC4xwyg2dmFYsfxL
	rSAThLrbx2tYv19xDLRnCPeWjTpON8TqERk2IHqbjZu8VWSKb4QypdRWG+SvpeV+CJAxSTD9Ill
	YxkgMzx8ON9vc3Ax27YzSZfy12W4BMpAO21fjiw6aGd055mmIJyS5sH8Bzl+aXYUb9HkycuGhl0
	QqO3dbUjPlUwNc2UgXKxLCUeWePUOnYjFAVyqSbA3NvuOI2LFh0roV4LpebQPcXywnPVGO4LML2
	QYxv063PpN/igDZuxL8IVwKyOZ/c/Ui5EmuYOGhWUhiGbQFmBQpIDpikkirqaBJQWZVYVSsT6JQ
	YQ5hAw
X-Received: by 2002:a05:7301:6182:20b0:381:fe77:7d31 with SMTP id 5a478bee46e88-3856f14707amr2344797eec.12.1795172883009;
        Fri, 20 Nov 2026 03:08:03 -0800 (PST)
X-Received: by 2002:a05:7301:6182:20b0:381:fe77:7d31 with SMTP id 5a478bee46e88-3856f14707amr2344752eec.12.1795172882285;
        Fri, 20 Nov 2026 03:08:02 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:01 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:55 +0530
Subject: [PATCH v4 14/20] arm64: dts: qcom: sm8650: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-14-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1282;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=nRKWODwhqsti/JCMKzfpHOUMvXfhBSP+GT/cARrj/+0=;
 b=c5WtPJ0sQu94WJMaTQu9JE5PzvJ7kuyQVvPNmn3/oAka+ojdMg0UnobB5jSbCZWOdUIE7w8Oj
 i7g0V7lmEc9BM4/rk317+KDNiQCg0iQXHuwtIRhaaPXA8Cy9CozEvTO
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX2mb8b/QnCgDF
 13ros6FXx+iMnkM9Mb6QM+6DX5fwivfd92I92Px+S/JIocVWOtpBN+4INj1x2iC8/ujePUMUzjM
 0IbEQJE1IHsLSRqU1ZMAmz5sQVgMiIePjyH/XvhFjy51FUrJiZWC8qY8WocDzsVsx0iWp7JSb97
 6FLgJJpHvRZ3rBxHWWIpQdt9LVHKVLGYTz+hM1QxorxOATNGXNY6rI3PztmOlkFf4nPRzfm4zgx
 JxYLrmkugz1XAJmQy+8Y1nuzk0KCLZWIWHFIJOVSgM8gcGTwSSxBECpsdm+BFNAekK2XxuTJnEG
 KXZIhLGPoAW08SczVhsKh6H2bx5hHCrmqD6QzKuLY1zKyDLGAHRMmm0CrhXDwTFtciJ60p47o24
 WBm8hLOAFXavC5s1k+CgKegia/SQm6XB73hY3zA/LdXqsktZWy9vwMtPZU9qc08fWzUGde5kIhA
 JOUtY44m8xJHvl+iiMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX3LVvoSjhOiC4
 vkaXSoEbQdbQlISI5FTul9LUO5drw8Ia2NmWRifo64+KGl26XzsJr/daDCFAMDgI3vMo5DSS7Ts
 HGzB2UXRFVSyI3JW4/iqCuLUbt+LQfk=
X-Proofpoint-ORIG-GUID: tyY3MjcYdL9IGYiaZhvPcYg4SsAZYyAP
X-Proofpoint-GUID: tyY3MjcYdL9IGYiaZhvPcYg4SsAZYyAP
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b002a14 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UZQlob4mJqq41ALSq9YA:9 a=QEXdDO2ut3YA:10
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

On SM8650 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 5a030f9646c8..86b3fa4cf05a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4214,7 +4214,6 @@ gpu: gpu@3d00000 {
 
 			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "gfx-mem";
 
 			status = "disabled";
 
@@ -4413,6 +4412,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1

