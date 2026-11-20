Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182170;
	b=reWyZJQMotrGqs82Ms+ZNXEVpzYZK2wzFPcDEhxMnGNuctpDte07yXyN4n6mIZhxUJFD
	 5TTpwkYT3mfMv7VyJiEWykPTgYgrfnL/hYpBNfSijZO3qfAdPcPZQZBneuJxWzIwrr4vs
	 wbmGUVwznoY+6VaSYIHi2w3wAANGbSCLkj7rCUlvkBpQlA+2Q2OQSgXjnmxKqs9g/h5nC
	 M1ANzkYW6dGzA5LT0TKM/xQeZqfPsmse6sIJjmAB9C3Z33h3uwDKPFjE1KrHjhxP2xy3d
	 a0jwEU6o7V5a+ZtQ03iNn1zUTU2ZDFRiZXaOddSh+OyTyRxbuq9y2wJlIVDpvtrOTpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182170;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
	b=QQJWGC3kSR/OZuAl7pYGo42hK2XsUiHmzCsZ4A+pV1DNTicvGQYoU4zUCwbl9zhu9grh
	 tqeO29BoQTrMbq8fZBcpobuGG5aZv2dWYST0VKFpmxLo6NXqcLTl7BxN/FkjyXjFtWR3s
	 AssCS47o7/TQxzlNiOzN0yayqjmvVxUvNyl/1qFMAsUOFLvKRM9Nbuco443CiaVnLCJa9
	 gy5Yw/3vgupf6HdjbSNgxURWmOpX/eHIetgGBRvGoozGJzNu/6qCawnfMIaKYcg6pZWT/
	 yO+OPCh45uA9AMie+UsWGsVEbIKlqjMXJ/ZbL1k2HkIXBPbqDnR7822YbCZcQjfbZFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O4brvdgV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=crhBRk2L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB81A606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB81A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O4brvdgV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=crhBRk2L
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkLNE1170033
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=; b=O4brvdgVbiXuTMc9
	LN62Jg1q5tbIRntaWRcl3gHKiwH/ChVhSvmetIuALcoqkh2eEgyuRKknvmJ7fNPV
	AUvlfaWXST3o4P/Tivqu/+rWteNLV5YIxg6oQVDmXM2dFp9JP3P/fSFSmEcZhkQL
	ZKwVapbDXEvrHmL8Fo5Tkl4ahOYZEltCgO21hN+AA2zDCqtRZz1pPlVpClBldPoE
	7hiUZwYrItU49V/3zOMkWRL31X8Egy3EM5fO+JDlhFsYUa52ok3gYZJ97cn9cicH
	FO7Je6M/A7ryMgyt6Z448yXcLQ4TQK5bbbX2lVMEDZTo0qhXWrEDY/luGO3evel+
	spNcsQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5uy5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:42:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386177b0516so1465659eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182168; x=1795786968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
        b=crhBRk2LINSaQrjNVeq/9cHEFUi49r3+A3PUG5PL1Z9XtgNDarpRQcoyerF7ugKIzZ
         F7okoJeY1HS0fOdC+fgCrms7O+1pmhy+S5Sc/BBMdONz3wAr/DGSR2FoohpDWfCE0Ktk
         zpLfUDdIsS6MhouMFFG/VX9XUQHRv7pgYUSIBLePH9sNS9hfFiTW0iqEYRRo6kgUgSNk
         J1A+QkAWR8G4/q6+MKYcoh8DhDRmMLKKtcpPw97XGFXwYPAOMJ5s/toNuGbHMdagzpGa
         UIj8GcjmTxOBmcS4U7KuDDiNEsXSZc24ENQZUamNRq1gF5oE+mGYDGq34Wy0l0iH461y
         zXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182168; x=1795786968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
        b=zWtJPl0Qp95DR8b9XTEFnyjCitRz9+y0NrIpvEwchFEcDqiSm91z/yAbXBwSQDAzPL
         lsXQkFkaHdeahSNbPEO3bwCtEdxsSQJEvOrKf0t8uL6VEDmUdktXEmPQ8wqcGO1TuMmO
         2CS7TPbLZPS8kNbxrmgcOrus/ZI+pLzEr9zYFS5JOTKIb62gKd9ivKlimCSpvlkYslLe
         t29LK0nAB6P+JfRP9CNOMfI26fnvch5DgP2i1FG1yEmTmJgD6uDO1i1mk5C3ys8W+oKs
         Jn6LKOHdwb/wkxVAoc2soFfWQtvHAdoD3/o5Kt6tImg0HO5sNI5o1QQ45sMmB2mGU17i
         W20g==
X-Forwarded-Encrypted: i=1; AL+hErGghEbnyz4sQkIwalqa8g1ACBZkxUJTcbwuypMdrcJDShK+citWgkiH7lGzwON8RPFH8687CEA8dZHOaRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Yg7yYV+E477SjmZHw538/DA1wQFO54aK7RW5CUkSYCSVR76LZ
	t2ntkAuLpd2TrxJjBy5p6v2msUs1okaNZzrdOgjxkadEXFcesZ66DSGWXnIT29Q+H3uohlVEZ4P
	GnshL/Ta3ul/iEdR71wpyeTDzVJoqFhD5SJRs2eX4lY+pJfjb7s73/PVSFbB00CPLLnY=
X-Gm-Gg: AZFdTZcDe42pOj/dkygKDTxFAYkd1QocIGPqz5BBO5HKnA3p796GR3XcVQLcA9sexye
	TqzyPRHW2xzirY6MBHJKrPQ1qBz5RX5OlZfJJQQRx5xb7hbrhhqwKVwDASQ1cROH9xr5JX3tkYK
	169hIKpasIrnD5R84NWIWZ8WYR7jp/f6pUJ9EJBHjG1WxgiSdV0uAsxBMjGbx5EfsZkRYm5nQ4g
	vE7tBKy8JiKwhGYOFVxV8jd9ghJaQln987cXq4acEm9PgzoRc6ZE4b59HogGO8sZo7f3xbhMvLQ
	4ADEWcQ+VVkfKmAfbRvV+6Iom1hHXHjdJxbrCq8Al1JLCOAIJuTo+1io54T1uLr7x7GKDGrOYpl
	jy1Y3vd0rnC7i+aROkLRholAyOSEsKIBg6S+op8zhwiGRdjkkxa0oO8rnR3eupZF94fhtlN4IM9
	X8EC8=
X-Received: by 2002:a05:7300:7a21:b0:384:b001:4350 with SMTP id 5a478bee46e88-3856f04b191mr3187791eec.24.1795182167461;
        Fri, 20 Nov 2026 05:42:47 -0800 (PST)
X-Received: by 2002:a05:7300:7a21:b0:384:b001:4350 with SMTP id 5a478bee46e88-3856f04b191mr3187750eec.24.1795182166834;
        Fri, 20 Nov 2026 05:42:46 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:46 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:35 +0530
Subject: [PATCH RESEND v4 04/20] arm64: dts: qcom: lemans: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-4-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1069;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=J9MtDhNBRc3o2KPFtx8zuqYMoIVGqmO1gPFbpzrqgQo=;
 b=GunXIg6kgvtDV3uM/J82EzQCVo6lYY/weJi14MRG4ovrA4l4K3ivsa2Ji0ZDR/1rr+ACTwOJb
 JKuZYPMYWySD+fnfBCErjgyWMClxa6InplJWk3v7QoUiLidllSJzi8A
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX2yapOLTiGaWg
 9N+gxddPeKMChEBw/Dvwykufy1bqGWODFtJbL3DZ7VfVKrjv5mK8gshpCgs23NnKx8MlfZecjDa
 iRi1pFLYHP6vFnYOxOIyJZyYZiIyn+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXzlojXNOlF0vV
 /jt65cOfshDw6ygKjegiitDk3kPos6nbI3NDnxwvhbB6snkLaWOkAAoP7Dgfvdmc9+II24dwuye
 yAzPDPuoLXn2m1qtjJOEeaEGO0YWMA2o7o0NcPOvnUlSjJVTyvn6sN7zyDd2n5lYnotsp4oNBXt
 qHNtOjD5uBo05+CoaVOXSWSuR9e/GGd8ScJD43fP+Tku9lB3yH3G5uKs3VOY+AtDEAhHBHaYcRv
 TMaRGP5m766e9I/A8zkR1hXm4PV7reqJGZmyRfkn+aKew6GxLtgyfcAi+bsKtue4hGqhhGsD/Ne
 XlrHAOXR9TPRd1J6yzbK7Lo898ozriSpRecF+jZNyTaKrUfsFA/XGwHjRSDjDp/YG+D5u7TJnqZ
 RAJ4P6PUmUzTDDuStAowDiAUCFmr+V5sGq5YcLDAm6VPsCWO0emoBuhUgSrDuqRhMIDJ+XMDdEA
 b+GWUq1HnHU0pXuSRsw==
X-Proofpoint-GUID: Y1pSo517ZhN2do0tOf8BSxaYQWIW4VgO
X-Proofpoint-ORIG-GUID: Y1pSo517ZhN2do0tOf8BSxaYQWIW4VgO
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b004e58 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JCeWlrImN8qIMoXkfH0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On Lemans platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 20f329c0df75..be71eb30f997 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3127,6 +3127,8 @@ adreno_smmu: iommu@3da0000 {
 				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		llcc_bwmon: pmu@9091000 {

-- 
2.34.1

