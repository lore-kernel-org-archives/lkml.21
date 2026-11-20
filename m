Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172864;
	b=iT8Zb1/l5BP8GzITwEuqZJSyATgHz04ZR9BrL9VO/0MMFq8twPlGuFKBnH5tgz9czm3I
	 /xj1UxkV4ZgMtE7l0PHh0jUvZzOKwaYhRSTBAaRqsmWxoEXHNRqfW1ix+Pq/K9T5f6V7L
	 xSF4dxEG+6vLkLmhTxqrdjo1h+XKllNddBn7zrnJ+7GbLfGdaoimH7MdQ3SbXHAhjoQxm
	 I9LZ0aEM7By6Q0lez2npeqOTRP2StgxX6Gxosq/k4h+iod2Eru3Gjt8SlKI+JpwEYxNS8
	 cvLRmhF6CBBE7oateWwLDxd2FtfG7JNCFWyGDWSmkt+Ef83cXJGozey3GPZCHRJ2X/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a/39YU5MZYqo3QJs/gpCcGuqyuQd4Jmu1xV4WICEifQ=;
	b=XUakuMIc3uGk8YEVtKJTDa9JUIk+QYoEKXqp/8CVQSS3RaMHttGnbd3h4rFIYBU+4DOB
	 XpzcVzNuHr29cqUcmYK5ZHc9vlAPoRPxrhXDRfqrcZHEGr/BOHBQdZh8S9elZTA4jVgiy
	 7LnTyVFPZw502UnFtJ9O30Ts1MwSX/xMcxwXf8m0250+J/IgF0fVbDRFUhuhxLLsAWOLo
	 Opas1rCgi3EMuow2iYUscVTCoKCnF8neLGkh3EhdqSkJVLoJjzrsN0sC+6qnRCZH/6h+5
	 jGFEm7/6uKEjn8QVvX9LHKnmTBWukpg4GW72FofaVbjbtoDyzeYdKtJFeP1Ucz5MZRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eD9RHG7z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cWPjB48h;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7644F606D84C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7644F606D84C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eD9RHG7z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cWPjB48h
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkgH93107618
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a/39YU5MZYqo3QJs/gpCcGuqyuQd4Jmu1xV4WICEifQ=; b=eD9RHG7zNlekuLQO
	Umc9O8xT3sNIDqKFOpEJw2iDgZ3UfIvS+T35wGpJlX84qZGQC+eeIoUvJx/gnzIK
	Td8+A1/IePDCjvYYhmGwZ/a91lgNKSzXfm4B0oEksUvnsEjqmq9q/O81ui6T+2du
	ZfjLYl38qtj7dwtdRaXN2w48AVpxdhG1ig1/BwoN9eXvxdRXMuOCyS08baF3/LnM
	2wxO8Cm4QZr1cIpLNKHcW3cJzRP0mg/mSEzriD8CKv4oXCVw/GR27B1MxNDZZtZB
	2h+PMVP+NyI9oHIACyZJhGWKA/JPDCDXVuRTH1n2z3QZjJJEfhinBUVZKY25aNEM
	Ims5yg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3bx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so823048eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172862; x=1795777662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/39YU5MZYqo3QJs/gpCcGuqyuQd4Jmu1xV4WICEifQ=;
        b=cWPjB48hnKmYKu25mJWz8MZ93llQlUruAvcfYL6VfAlG65mBPwBNBZTnqOZ2bNBLXk
         qJSL7OiYtfiA9OK0MKfVQ/SJP/D8S7AgwbQpOf/t9WE4kBQ++l52D0CCjbM3av3sm9nC
         V3tCk2/KOuOSUM7gzuuzT2hnSQsZeZwGfMiVGScEvgTgtcurjZcFUsCy3jy6055BApoL
         Cdh6/v7eWXPX54zgwBub4GevXobP1RNBAIooz6bQyKYXpEzlhkeGJ/xLd7Vi03FUL+89
         LlMsFv3qn+edDBp9RaKZ9HrXw46Pv1O1WvGFQ2sesWa51j/rBUkWTELQjjf0Vzt2vwGD
         0ZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172862; x=1795777662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/39YU5MZYqo3QJs/gpCcGuqyuQd4Jmu1xV4WICEifQ=;
        b=wdx+s7WXX57viCxUlWyA6S9EzvH8LuCGjjhPeEumdadCdBqrr/cyPY1nK3QRRnFgVF
         BXRLQlCCYCDaa6or08iwJsmU+0VF8N9ICEjH0wmqGQI0mV7pT/2TAYpjTW17kSo+sLrb
         saHV769huLqvNdfyu72ezrO8TXY/sCg9eUmtV+ANW1RDLulvv70cUo+SuXPKmJb5GtVJ
         KelDJURpCzy3gGI9ApcbuzpRNgrMC2/T5yZTiLwCIOYKt9HNJEZzm6qMxTUmWc5aOZrd
         s5Jqjoj6vNx43eQexq2RVvtjHeLYA3qDCIxMHGD60uxmxxwYc9XKrb+/IBJxCpr5L9FZ
         RRaA==
X-Forwarded-Encrypted: i=1; AL+hErEKlZvb/J8e5EsdfUuC4b3syQYQvb74v5Sht1fICz6xu084IpB1P7QHxRKIp8Oa/WtV6cs7ws0D6ZiIljw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gcCr8o6PAdtkaYLDRmHDQmU18Yj7ElDBCip4yLuJgPz3BHhax
	o4evAic3YnB0nfla2RdYD36UeT8qBsmC9bFl8NbqAhZY1eZueQrz+6KS/hdu83XBOS5I+Rztn7q
	GRotX9mZN+CFld9VhnMjehhvjmagAyTanMiVN32xOPDrJJW1rmumftB6usjplNAPgHow=
X-Gm-Gg: AZFdTZdpj3CcT+762+j2NlsNjslSh+DCVEU4ciLps/X9a0wxYhrZZokeMKuA8jMZwzh
	1yYAE6YXAmJdKMA5DAn9quJDk0FE/+DoMXlQGO2XolcKRTbRJYhDAwJcj1vhPTASR60lc+qtwLy
	YyXlwOcWmP42axVVNTfFCoZHd5fH+5St75OmlXuuqtm63dhmYlee7yGVnyetnzT2YY6xbgX7mde
	iLEBdZEtkxIwmnTqlkjF1QL7M0vlKe+0FC8zUOngIBPZW2Q2ZgScTozN2hraMRCFWRhq6eXbPCe
	usin+F/dcuVusaOcZ585UrfnJn/S214OacmoXMIRwhZZ3bzluknSvhquPbobQ4iqEt+c4wjNOzl
	Oz/QmTUh+zROcvLxHPasjpWvAZYU61vEuZk136Lx8/GqgZDbs22PJ9lzEH+NYqQzM5Qey40w3eE
	it9eLe
X-Received: by 2002:a05:7300:f794:b0:381:c31c:bfbf with SMTP id 5a478bee46e88-384b496a36amr4160547eec.21.1795172862125;
        Fri, 20 Nov 2026 03:07:42 -0800 (PST)
X-Received: by 2002:a05:7300:f794:b0:381:c31c:bfbf with SMTP id 5a478bee46e88-384b496a36amr4160488eec.21.1795172861446;
        Fri, 20 Nov 2026 03:07:41 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:41 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:51 +0530
Subject: [PATCH v4 10/20] arm64: dts: qcom: sc8180x: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-10-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1335;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=BJI9Qa+ALwqIsUj0DfJo7B+SV6DPkM10cbLytxJMbcM=;
 b=iDWhFdAcUQz86qchqaGgo72B4dP/xA4xeHvIsaSCpx5fY419WT9WrzE1fBkWEtNJC2d3KiBmo
 LIRDLJ0PBAlAUyr9Gm5xL/jT1k3Sol2uGi8bvu3WZCc4c3ZmPDmZ741
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX/UI9OIv2s7Ts
 C2kKgNJzVc4kGkEsLWzoThDPhAY5/LjyQGxzci/iPgwFl3+skXfClkG+EUWg8iW5WqrbfRNuJXB
 sZTugJD7XmfZP8jCESSYIUGliCoZfhMP9j04mc1YIolTSAVLE4Gmv9mtB2dxfN7URN+VSMEb3bu
 HmXG8Z1eA7RSvTW2vW5wIs/zG6tqXovO9Zbp5fizjCEzkdcjhd4Et71VKPAZWEMzHTr2AjS9BFl
 tvPC4I1NfaDd3LO536TTvVypwDkv8VF6sH+xKm81uV5+eMKqKaM2dY5M1PYgTYhBv0TRi4OR+T/
 OaNYUr6PVCGwSy1qVP75hBXwO6PnwE9UdFRimDQUsBPWgFXeWh+TcgtM6BaLrbbc97HqeW/N8G8
 +VUbOHlA0m6lcVyyqEMGcWsegnl4M7sCsU3d6LaMXWcxPrBP7hgzGKKX/42/8refj2T/eMa3SLj
 UnhlcwR5UVUi7gXgpbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX+0WzKxeYTjdF
 IuDKpq2FOyonaYITT4Soq+uS3yL77rG4mWt5rwaCTnO3rzdTtxhDaznA0dL1i/oPyleBJAKZvrx
 I1Zz8LhPjpKz0zXfqq+AEdz1AqGiNaU=
X-Proofpoint-ORIG-GUID: phuNK-7PJxfY-RSTlwZZV7QCloAH2w_P
X-Proofpoint-GUID: phuNK-7PJxfY-RSTlwZZV7QCloAH2w_P
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b0029ff cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UZQlob4mJqq41ALSq9YA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On SC8180x the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index be79608b7161..88a39e5e8f07 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2280,7 +2280,6 @@ gpu: gpu@2c00000 {
 			operating-points-v2 = <&gpu_opp_table>;
 
 			interconnects = <&gem_noc MASTER_GRAPHICS_3D 0 &mc_virt SLAVE_EBI_CH0 0>;
-			interconnect-names = "gfx-mem";
 
 			qcom,gmu = <&gmu>;
 			#cooling-cells = <2>;
@@ -2410,6 +2409,8 @@ adreno_smmu: iommu@2ca0000 {
 			clock-names = "ahb", "bus", "iface";
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		tlmm: pinctrl@3100000 {

-- 
2.34.1

