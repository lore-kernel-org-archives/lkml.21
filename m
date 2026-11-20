Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172827;
	b=EBUaw6wV2+pu45IwviVQISgiMRJLZ6pwbBxTH66/WYv+SZcj+GCWpyrgybjzIK14qFrM
	 0Jy5c5vfa0/RpCP9dZpdc8/V6+T3igchQCU1CSwXZ0faOCb7xo7a39oV7ZSMjsx2c7B3O
	 LZ+Qh/0vYfp+mA6g/gXmlJh9cPqtopUB2GYL/8RXLNEflQYR+Uuz6R0OWy0UtFCyLuLmo
	 uroVBGQ5ESQnN7AMa6YOnGOXXmXis1szeaaYTSsdhQRu33B/7Y5gmwLisT3OmbLo2jS2p
	 mgn3cVMV6oim3+g467BLcbNwaDOTurHZo0K4toI0kc9Bq3txvnxRcHtjJNi956PHlJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172827;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
	b=J4nsFMxCeS5BxIDc+iLL0XPMMZiEHB66pJXfeh7pjTX+HX0uaFW+SarGKCcztKzmguUy
	 +9zC/47AHocHjMJe4ihHKwiBz+NlBK5sZAerCQ7Um1RHdzqmE45fXcariNrRgMErwd8tN
	 /+g8gtwN/dx2cMpXWW9gORk3mR4gcAotH2zjjBUiyXdWGTb98CBw3vmzUeJ034J/Xd/4+
	 m4gtBGMzwlyp5RTF6cBcQs8ksvRdME9PLcVBgkYR+zu15VolTrpZ/PVEEOrPClApxnU5W
	 hElvw504zcakk4Ax2PThZ/XVgGf1RP9d3EMo2MUjx0Oci0RnPgg36X9sIf7MFG6U2wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Blpj9S3j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VgeuW6J+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEAC60A2600
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FEAC60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Blpj9S3j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VgeuW6J+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjtod1681957
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=; b=Blpj9S3jBEpimAqR
	kcnxRQbtKRqltk8V1M9qtQpYbyVMXPlKJNXCkEk4qw6pHhw3kOBmuiHQorn6HDfi
	stMDbLOtYugmbrzXfUN7ks5CaHgJFmia9ruy5rydRPVgKmZ/ujFWUwQXwOQ4vcBr
	MJ5F3/7/Jh/xiwAdKF8J1tcu7YfgggUB6om0hBMGWvXd+wQNWY1xYzY0by7QKZpE
	b/IXdF2sSKg7lSq5Kdo7G4qRGGgkYd4GiTGz+rm9u7NWo7/OkuGFbx+3+a7yTXwi
	uzv/bbd+qZK92CSrYPZ7TLYAW6EwtMuZwh19jFHDuvbZnbWuoVVsAZcmMkSWiaEa
	3Go6aw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1t3tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so822492eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172826; x=1795777626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
        b=VgeuW6J+EpSR2zAUlJWkLgweV6C0zFVl/6Yd8fym1MmZwVSUt5Uij3FRoU9zrYGuje
         JKZsnZIlhRb0UELh7tjEm46FKZW+zLsXMHGZnet9lj9ZT6mkYoeo678O8nNPLdmjlq7t
         y8eIZb1QH+rtJXfFnqjJQlFkgHgVmB5yVEWgt8xM11gcwKOaoWeQPUFecIrx+Dx0ox3R
         8xGe3BHd6fsBpSbyNZXjoyx50vyMkVlCWNekMHPhyPtq+wTsCyUIxX8MrHUTRMMTFI3t
         mrRSp+JOJFEgg9plKePZYv3IuF+nhDBrYg84IvL1C6zN/9lJ0LHq1w7bMlhtlFJsH6O3
         i0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172826; x=1795777626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
        b=PbePfJJQlQy+Woq7RFUAqnodT6VTTUf1RYW/MApMPVl/8/GN1MAE8eivOtExoO5fvl
         XMVbLSRKg6Pm6pm8dNaz7gIaY3PllxIzsSMSfUVLedBrsjVbbthjYnzTRejEQphlJYll
         7AM1du+A3DA4ZlFQbF+gB8WdqlpZvX5KT9b/KyqVMb8PAJwHU7dD6+V2oTpSBJMcacuV
         PSuuFLYMoniwM+3KGRAKKtmOtlvDmYLRwPbdORLh+oKPn1WAErLdZDZSe3ycmaKTJ1Gh
         4nE4ybOYmm/Nb06SHGY9sOYbufVnpyA3LWz+HgN8qeArtJY0Y1YUIxkwgGStT/Fds3Gc
         blcQ==
X-Forwarded-Encrypted: i=1; AL+hErGXFVgAZ7bkGcez1Uzq8AHnEzRUxYoN+UwxvCEh6L0NqnZWmXr1KLn/VJGSC6BK6KODTRLrFMIob4s3k6k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lfVBTaMFybFnQSWueWHHz76CvVekOh9CmIBkhArtCKoMvq2pL
	0ki8Pxey83fd9hMxgGduHMYDI/7krndebBBmB0jdfqhib/JmMAnOGPZPRvWMX2pHbOlnlPZCkKh
	OCIiyfmV26uveg3As500Wo/oD4l+IVJikgh+eKXl3qP61hRnMJ6w074nI/bS0+lbPPhc=
X-Gm-Gg: AZFdTZcv6NQd/+QmgaHfbCy4bG9tVcO5kCXgoYD9UjN0mN+4oI9J7Ue6Hyh+iOptIsU
	4h+qgqSEiXQ6LLW4p64lQOIOcr3uO/rs327vA9cvRe3MrCQi+e6vLG48OdTaSEosSRXDPblqWwy
	phDo4K0IsZ/JGF7bNPuSbGRUkH5DSUPuSZoZ4bgsCsAkyDTxGjuzcRf+Vv1JT58CeFwFVuXx68M
	c+Y+2rZZB2b4+2lWMYLqJlJNSfPFYDN3sS8eRif37HJ4z0/p88R6oEHAUaqeLdXXWfK0CCgeUTV
	V/486P4JJRsyPxmcofAnGxx1YxKom0vnrZqb6CJ2HoGzioRZw+vx9EmBbEu+Eq0yYEDSx52DcR1
	CL8MR8rPetqi0BC/v2vIjUilYSNMyB/c9jRW7/uobHTIiHUIw/HTzedQnd1cGVVrbj8APNhibkZ
	xBfNT2
X-Received: by 2002:a05:7300:e9c4:20b0:383:6f73:eb34 with SMTP id 5a478bee46e88-3856c6b00fdmr2845764eec.2.1795172825823;
        Fri, 20 Nov 2026 03:07:05 -0800 (PST)
X-Received: by 2002:a05:7300:e9c4:20b0:383:6f73:eb34 with SMTP id 5a478bee46e88-3856c6b00fdmr2845713eec.2.1795172825017;
        Fri, 20 Nov 2026 03:07:05 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:04 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:44 +0530
Subject: [PATCH v4 03/20] arm64: dts: qcom: kodiak: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-3-cab8ee8be0b3@oss.qualcomm.com>
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
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1065;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=nfp8+SD9J7PQP1TIlHLZz6YXOr5xoEhGVTCZWtBdhd4=;
 b=9enQAwhrtiAROoFA0A0yXkaYWGcoYyy6fPoNMJULacdk9ULbL9BFKhSfPzmdlWfAc50CSpTuM
 BXgU2EZNUdlAiuErjAsMTVcYGtW9zxqDvZf9rLcNWXZVHqRoHeGmXEN
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b0029da cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wmxX9RSyIuGEu2EnybwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: l3wXzQyPEjSgwEGBgUlhrRtBv68ZU9Cu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX29BhS9aEhiwv
 RXWfT08d2yS66xi6n+3l6F6SPHHAnH0EHVIOabIBH57b/H+javdAEjDll/nUIVcHNz4xuhdSSET
 oF777Eexgs0dy0w8FIJyM/MH41R0pB+bm3AQCRK7c1MD7pTn1AzBSagdToloE7T0tz5D1NF/Ltz
 PD7og3VKOCBVJkmeOcoyMaPUVwbaWSv78Wa+VoLstRQ0Je4ABOjL801ljg0a419DWu77B7H8EIb
 KJOTSC1c+lkEsXcOxGl+jY1xbN2UGKhbl1BTdw0YNSX8W0JsLkzNhp3E5vJTu5KiWG52pHB6TGd
 oDOXF6M2VabCGECJWSCEnxAtN0UYlBN1fZ87znDUKCa+RsS8BlMZDdCgrMZvAwCbna8Zd7oxJUo
 tYzHXCY3ajEYi/rCj6j1CZn3+7Czf9fMxBhfqi3g9Kfwc/aAamh4gZXl2XpRawZEzGN5hpaHV7b
 Oalb1dfZlExA5B4qUWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXwr+lZRp6FlNk
 f1PFUFVSHROiMOGLGPwB7E67IhuIsy6IJenzmoDzkKKgA1WEJ+t4sG1ENSDbjxWwjiknXL1v6rs
 T3S4nf6U1TTJOtW2jzPCoPLQSNkU8Ng=
X-Proofpoint-ORIG-GUID: l3wXzQyPEjSgwEGBgUlhrRtBv68ZU9Cu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

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

