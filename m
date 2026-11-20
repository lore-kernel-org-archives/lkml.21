Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172896;
	b=JdsHN1baTpXoKe8VEFNAy8DKwFH5yy0DazxNIKTAgLFxiwpRa0hoQV4AhZCN6g9CvS+7
	 9RcLlwYyTXBL+Uyino8hlgy8chIVaTtyrUQIVL2/TMeWyxSwMXtE7gc36j59VfRLMmJIg
	 KNBh5ywGIeCzhvZY69tScg4U827lI2YBmd3J56fPU9bVsiaM13D0gGDETKOU/ZM7Q2yyA
	 4jgAClCgSiuwWu534TSAf9Y9+N8UfcYEYUj8Dct27D1WsCqDZz3QuJ4ys6aVTRWvdg2Fw
	 OAXb8RtenY0LK+WOeXZtArYag/46ofZ1mPLTJaxlu1qNAolHFLOL63ueUSzviTUG6Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
	b=jAZyYevL8pdfTY1CD8SudkXW/vZR79R+1n39jiVFvEM+RBzYpQFEB1Hjk5HQDJ1dl/xR
	 OPKCFenhCM9UxyHC6chCsROFlQNQG10oSUNw8s4OtaRUOnKXTi2DbYhviJjxiMWD1m1Om
	 BsvYs5KNfRMjHOFuOED3xUu9q8x1rFMqd7dgTb0E6injMUZBj19sULSGdX8DsD/8tCZhL
	 fblXB20sTRpDYA4/6/FjQmsmBghc+qqvrjnuJ7s+fidzGfN5WqDU2zVTkDAjG0VY/3Dg7
	 3aNBIi63ckH5lhjxg8Ed4luGby9RBDXZkn7dPiBoJl73re1pJYxGoa1YjLbL1a5Br0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Znk8sWI/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gR6otSh4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A427460A3811
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A427460A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Znk8sWI/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gR6otSh4
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjunC1168930
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=; b=Znk8sWI/Dw/wTngZ
	niNrsQsD7OA3RaAn7WIYdaEwsJv+qgi60YoGMTHMJnAAJyDcSIn7L1oquNF5ObtO
	DXt8BKUE7MRQKhVukiMOxKocV3dYhEaRFMhpfPl23d8JQ2eRe+Eaf6bDTfL/v2HT
	4c7hrHGbH9WXAm2r3urJ7wrhnYJYOOrfpLEfVdr02H+09ebcROjlGBxLI2DCMjVi
	4cFcZINqIMLLC1I1DDILX9K6LsrsoDsY50Qsmcf+MILF0lgUuIa12lkW8Ojd1mbD
	19243BK777MlIdjNJzLRWqL7u+/muGXsVa36TNudyE32aGu/K9hTlykz/PiLicZs
	RTzLPA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5ucye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so823474eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172894; x=1795777694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
        b=gR6otSh4qgBqVmGH1cs1XUEMocPzJbIgtL4FrjfO3Hsw8Zd1H1hzwSqgQGFZYJC+X9
         PRAviKZvnY9OlqFts2GehozotgvyDwBBrXJN9rH7Nt591tNOVQa3+CnFb/vceBBd56Lg
         /cXZinad/HuAvkC0vBfTi9tcdS72ZuhiBW15sPLdvSKLMwlp3/EZFKwU7Q9+k+hQT3v5
         DyjFQXwOMIYuOrp6dYa/SRp9mIidAZI08xzCCqIHG7L3oKezsmuijsxYOG6SIAO0dNRE
         YtzUtqH/wJNfSXK8z8ftn5z9Des6yw6aXL8ydxFzCSuET8bdvs2c5Tslm2CDTPGrHnsW
         HuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172894; x=1795777694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
        b=VfZAECPcIwlzdCsLXLUP2/MCm2GP3wCrcWGXuAr75UNMn87IfAXLU8XRTGGoQbJa8G
         feU0B3Qzh9gptrNqS2nKSXATyqVRYhUmo+4PjVZ4hvMFqQoLp15sKhyDKUxqduOj2O8T
         Qco1p/QCbc79ayihStYro+cCApohCoRT+wlEfmz5zp/kLZJ/Kc3+1wAwbPm2+7kGicDR
         kcGSLWYSvITKRnWmXDHiK4FMtQI3Y5oiwNN/YVpiYQz1bN9btptap7WPuHhZDI+keBZe
         y8B6ixHKEHwk/K83XGYq9J25dX9tNlzv6+HvZ5cdZIwBtSp+MRuZTGr/iNPvcWslaCRr
         1/Ig==
X-Forwarded-Encrypted: i=1; AL+hErHH5nx1SLXdL1i094vp4CthPO0rQMHDnSPolkUlR8Xg6iPvLlriFRgXyBSPW+jZaUs4+JwKvTcDWu0EYdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8DRc2+NghpmGuyMAULBgS5QB4DXM8H2zlZorV7ScDftNp1RFZ
	3sg+78W3j7JFLWdiNPMt9c2x6kKZkPKkucakYpNkx+4dLfnAYARSeBxzyNS5SsfcQ3+ZOfTjxIJ
	kFFmZaiCiH5MqXwHGDJyuSF2VCdrUa+topY3L5AZXwEYAnBpoSOxaKh+eViuRefwmEFk=
X-Gm-Gg: AZFdTZc46+A/6vDCUSEh2NgxwoHPElku8ztbSC+yURweNijgEhWr4Tdhke6o/g6C3U/
	tTOQpyq9AJhkzLEH3C7GNHpSKY0U+7XWvrV8Yy62jP3WoM52QdWiJjBluZMPoWTPGiqEzb/M64E
	MJIF9W6dgHvjL0Cw2mltBHGypEjAMoP8BNVKuPzy9nWf1wdgLNhj9ThYdyy2xRVOIX7l1GIWFnx
	tNOtP5xGbV/ph6itJB/WW9AIBCylb4uv4GYyHt0jCfGNS4WucMktuxtFZTww8EUGWsOGtdCS5I/
	Ljq0/EafhwnRfGsbuWzqN/U6JvTqO/ktLb1EZfQBTjUHwvUE4WEiIKL1dr+smN4djtbGC03do4D
	SXRhBbm0z6Z9MgXMMroMX9TnPzn9Ta4oOCCaEL5D70mlF2FDCbOuppuinvrwgF6bUu5+NNrLdoY
	9zJ8Oh
X-Received: by 2002:a05:693c:20ce:10b0:385:ab26:f3ad with SMTP id 5a478bee46e88-385ab26f492mr1852855eec.0.1795172893402;
        Fri, 20 Nov 2026 03:08:13 -0800 (PST)
X-Received: by 2002:a05:693c:20ce:10b0:385:ab26:f3ad with SMTP id 5a478bee46e88-385ab26f492mr1852806eec.0.1795172892688;
        Fri, 20 Nov 2026 03:08:12 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:12 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:57 +0530
Subject: [PATCH v4 16/20] arm64: dts: qcom: kaanapali: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-16-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1086;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=VBW+lAkn36GDWfLSpCvNbA+g18nHUbQQFlmvho8wcKk=;
 b=3u5aWyWWqvX72lbjGg4IOeHiJFq52q50gfyaLIyAg+4JVQf3SFaLJL0WxkzSJ3PimsuLOiRnL
 cT0t8ho6a2oCiyszc8in30bpVfEtvHfZ6d2fNZiaDAJIgqRMW0zW3a3
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX2AYD5Q8l09+G
 ScCh+1Sl3crUpZQxdPJZ6/MBLo5ptWdeLIu2EvwD9gktEURTZZezxPE0bsJYMDaO3I3ekjUjTl1
 wL4FZlpx0QvxcwHIwrgGo/syFKMiOeI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXxPXjDcjMhNPg
 If7j2kis5HqZf9Pg953kDDOlh93ixaJyD1LkOUwRifNzlhArB6B4gHzkCv+KnHkTN654KwzHHLo
 GmbxRkm+OmXZsnfbFLX24KJQ0XQAdhCPSTv0AGd/BTHrJaw8Ro2U2OvryEPtG2xvp7YXlCNpwFX
 chptgIr0kR5hwt7CdFWa6MUw+LAza72W/9T+1/rU6WSTnW+9s7lUWHsFqXEJ0asSUtHjxRNq3et
 IA6tOzdEXR1d2Qtuuou+gqf3xV3r7HDDM76aJjgDnbi4OVR6XLSJehy08qquWjOBOHAV4Y4khjk
 QIGi7X1hZMbNxVsBNagufNr4O7b+cfGe3NPvqQDDWIRAkHlouDVoVHRdOqOmFFnOxlvf+uhNV/i
 TwSrcAF/02NA8pSyV5FhJbxoOMoPxSIJHCFCLQsp0UUu7tAtjnv36BgvwU0yAhCtw4eEeWL1Z4r
 +fzJeQgSysnB+PQSlOQ==
X-Proofpoint-GUID: D32LH0cI3D2SIKe-6cD-HHbAGAGW0wr5
X-Proofpoint-ORIG-GUID: D32LH0cI3D2SIKe-6cD-HHbAGAGW0wr5
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b002a1e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iVAGZxyPhfMzDMBdamgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On Kaanapali the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 9f04a5ad75f2..eccd5451e875 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2997,6 +2997,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		remoteproc_adsp: remoteproc@6800000 {

-- 
2.34.1

