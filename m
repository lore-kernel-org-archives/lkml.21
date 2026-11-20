Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172817;
	b=hDz4WesPvi4cQ+zoCcpd/3ZNzHkYDVNjEhrXWv8foHDMCaLuTPqvtOVVqxqhLd6rc123
	 qkd4ujnwN/rcnjY+yyzhtvoadFHcXfhusrP8qoP8FJu28JOPKHQCWAeDJyWs8jhW22u89
	 Fc1Z34iq9Zjz5rsf7MUbl59hBOdrfgvwPMxRCpeLQCQVDlylf0Fe5rgccv0+a2TRddjPg
	 CQ8jYNs1mTFQNbc/JduHl8tJHISBKGBBXLpaCr4NI44amTHX2K4bybpahzXJajOQJsHM6
	 9uZ0FWLc+liqRBzQg8YH7bQa2r2G0YlyncFB2LAw8b0EIUq7VIywxXPcKtXFcIbgfMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172817;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=;
	b=d6boyRtKi1gnBgpGs8nzhQ5mslU5nfJJsZf1SXH1yrjO+TWdJzTJelEDmFSRAqTkFymQ
	 fnLcAAe1pS1zEhFnHsGpWV39SCfRW0CYXUpB6Z4Yqq05oB7B4egYDXqAA8nZ4TA18yAWt
	 /9LRL/2b6oLJQKKxvwJVyGVQwkqXg+06HdvnOmidn769G/Mq4j68ENOY0AIE2/AUgnS6z
	 btg664PbLWltPfckRUFleYBmM0IQWE0lmBHZ7EVWx6b5zOly6FRXkRhUrf+bYdxf0PWKD
	 xreyHTH2cBAo8EoWzH9fECP53Lx5/3Bmx0UhTVaOffDs47FG0J0uErd5EWr/NVlZPjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="OLE/ah2/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WRsGW+/I";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB0A60A2623
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB0A60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OLE/ah2/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRsGW+/I
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkgZS3107627
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=; b=OLE/ah2/EA/YApVL
	YDox7iNZKWVUiawjm/9KI34WLgg5QEIn0CJ5Xtj/tGcSNsBpjo8yuF5sLbGg4Ajr
	vhabz062Akceh+Xwm0SzRkpldVZOEMWeXCpGVBq7IK/fzgNzezHFiuA+w3qH18Tm
	dp3QWFIgoP7yJikeVctlZQO2suD3mHboa0Pd2LdktHuy2prEU1gfUVQBMxMCL2x0
	BmuWYWLFW+mgFvMqWEKREvnhOu6VK+V+XWJiI5/dkEnPlZ609NfHX/zX3JJCnS+c
	Z1CZU3tjMwmLdCpAEkXRy+5bhMWsAPVO9gOxL0RHxyBTQYaa5Cn8/rMUvEg+0WkY
	djwa8w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3btw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:06:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so822309eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172815; x=1795777615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=;
        b=WRsGW+/IlvIGZRj7xUeVO6UYyZvKz40bPU7qWE+Nh7Qhq+9GJkQsR+NnjYWWpmbsRB
         NIqLU9xfJW/s4ckYPd3ptSo3l5Y2rPfcZ1/RTcbFJkDDZTap45S76M8PVarteLzlsn7g
         QEwxrai6kAQQ7bmBa3fNbRnsasmWnfpi02tz7+LoU+fJCsumUAMw/3BqOVgUTlBSdIco
         TFU1HYpILmW2zEMuESzRDU0pAw/SRHN2Sftgvr/2vwJ5hmLyyxg13tor5un+qK2qjMWu
         L3b/8UkWpkMGjdGEBUHoaH5X4R+TCi5Xtp7yud69BiwPrv1/xdFio/WCPq7szfvMypYF
         GFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172815; x=1795777615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=;
        b=VlOCydG6SggUf5YOcv1sfs9lgBlTBff2NpNN5u8x6IUNb+YyQoI0oUcRouaFKTibo1
         gtiq3Sj3ZKItDvVK+vJ552PuKR7MPTMXG/6fLPCwv/Ej5jrc8Gc1x8Ao/6MdFWKvKP2w
         +zpu/PiFrLB8KcJQIRwH80ThFKhqvszgqTf6vZixE+tblbzhTf7QkUog3w6V6xLexhXa
         MvUKOV6UY4nVVZqn4OF1bhbvVGm+REQvje1jBm+8u4JjuZn7ucJzXEOBzQlwMKw8DcUx
         UqjjHdWpGXlZzVLV0++DW4VKJ9XUPlfNMbwU61ryPxFyfQCuJphuU3z8ucuLmsAl8c3F
         DQ5A==
X-Forwarded-Encrypted: i=1; AL+hErHdJjzd4WMhcg0qoMm1Z1Wmimd4pGfLO3r6PM2u3vpEAE1x2cL3k5VEbbDQWX37M52JSWHpKR5ZKmGhM4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/w8ycQSSwZMr9VkeT6E4L27JuZoO6UfUR+dQABOl/ZrNQHk2gO
	fnr9widLJ8Q16Pfx6kjDMtO7tBiMdEX6bqD8KcK6b0A2c2lYCuayvctVX6RtW5mEMmwfE7cDjAj
	ZTM566ME/SDGP+Ru+9iKV/CsrQ0QRf0q+oA0WecAtnM3jPDccw8Lfu3X3g+pC25rIyXk=
X-Gm-Gg: AZFdTZeHM4Tze3bmE+OPMu6upc6oIPEi95hmJOmmXOkTmuUdSAQwSC+W9kIa/5jvv69
	jnMvDF1fyaHfcl3Y09gfue/G+NCLoBzRCb02f3cRPtXMDW8YEb2nLjCbg4JWRo9f0koYwsLxCY5
	/elGDJzyiGqKm22c1WF7+LFu36cnuWNnh7pgF3w4R0xrzCHWxVC6LB2+3XzYauKPzn+LIRkHA9V
	rFzoSItbnF4GM6xji8fNGdzex8ptbfBE4yDGgiTqxlZ1jiqfAKWU/PrBbu+3oElwsU68gAP7EyP
	HdbOt8f2AMJRyurcEi6L+DYpr1yQYYB19vloRAc+3IqxXabYj8sqhsCjNnp0XUsU6FQYQ0D4e1k
	neMInit0hLxTRSRp1i+hQ8A7WdDSHF1P9hMSp4mxDQnsMIaq5V2Y/AqLtoJAOxhm+Hn5DsQBjRL
	tEZmEF
X-Received: by 2002:a05:693c:41cb:20b0:384:4fb:510 with SMTP id 5a478bee46e88-384b4e7510dmr3920918eec.27.1795172814797;
        Fri, 20 Nov 2026 03:06:54 -0800 (PST)
X-Received: by 2002:a05:693c:41cb:20b0:384:4fb:510 with SMTP id 5a478bee46e88-384b4e7510dmr3920883eec.27.1795172814150;
        Fri, 20 Nov 2026 03:06:54 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:06:53 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:42 +0530
Subject: [PATCH v4 01/20] dt-bindings: iommu: arm,smmu: Document
 interconnects property
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
Message-Id: <20261120-smmu_interconnect_addition-v4-1-cab8ee8be0b3@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=2417;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=L9ZDNV193MgcYYJuTHrN/Rk+LSdrA3XbSL8eIPKsLAM=;
 b=wdg5TvZTBzYicERdTGjHlneO8uNo7gn2OPeJEAerjHG3UyVz5Pfkn/6J0N4Bhc0D+p0HdagtQ
 2sciI9FlJ7GDWUDJ5zSVep6gADyCUDd2XYfiX8Wc3WXC3zK6xtK0mkb
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXxePYZenb+NqS
 +396VtMJAxLK1cE9blDbx8zx53yESuVPj3QJ6TQUoqhar0wLyrs2BkdlSGUswWbqaQT1lD7QLBd
 38LIv5tBcQ2WdqcxrRiq8IwtfATGm50SP8S+5aOTPRQjSBmp67XJmyCqfxsYSpmGJFXQJehmgSd
 mlJZIfZDZJUdEw+Gpq8LOIikaFvSmxxrE/0mov8MhxtV4tg+TUPlbjyHihz00vkGW3+LNSsSEpr
 iGOrkhLa/0R+O26T3K7mpIRP1cIYy/piPMkzn0upc0QYb7PagM02vMg2McDpHhMS5XplQcrtRkz
 aAm5S9/KaZZ12yxIJLDU0TYuJWkmZzc2YLAvuxNWlQbEiLjAaCkStnpsmw2W6Z9wkRulosQHy6h
 OWw1oTDyuc5WwJ1UdYJOCQmSd1zG0T7NyadfZmcWFx4H2InRo1gQqNb3TbgVeeN6gZhTjW9GvMx
 lUxH09tuiGo75P6wGjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX+57rxjqNt4rs
 pmcIWflL++WWlrprrwS3TYF2N968Q/7d+asR4snzft8Gp6c7Oe+T3A+c+4eLTxYwL1ZA2/PtR9G
 Tm0YtW43bQx+98kGp06160il97enZvk=
X-Proofpoint-ORIG-GUID: Ynb750vFcmUbpCKfEOHtJDbT9puBwAbf
X-Proofpoint-GUID: Ynb750vFcmUbpCKfEOHtJDbT9puBwAbf
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b0029cf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LIGS1bie0qojq0S7pNEA:9 a=QEXdDO2ut3YA:10
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

On Qualcomm platforms using the ARM MMU-500 (qcom,smmu-500) as the
adreno SMMU, starting from SM8150 (Snapdragon 855), an active
bandwidth vote is required on the interconnect path before the SMMU
register space is accessible.

On these platforms the GPU TCU is a separate hardware block with its
own AXI master port (alm_gpu_tcu) on GEM_NOC, independent of the GPU
rendering data ports. This means the TCU can be active during wakeup
while the GPU data path is idle, leaving GEM_NOC without any other
voter and causing intermittent SMMU register access failures.

On earlier platforms using QSMMU (SMMU-v2) the TCU is integrated
inside the SMMU block and shares the GPU data AXI port, so no
independent vote is required.

Add the optional 'interconnects' property and allow it for all
qcom,smmu-500 + qcom,adreno-smmu combinations.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml        | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7812..ec0fc5f7d4fd 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -252,6 +252,13 @@ properties:
     minItems: 1
     maxItems: 3
 
+  interconnects:
+    maxItems: 1
+    description:
+      Interconnect path to the SMMU register space. Required on SoCs
+      where the SMMU registers are only accessible after a bandwidth
+      vote has been placed on the interconnect fabric.
+
   nvidia,memory-controller:
     description: |
       A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
@@ -656,6 +663,24 @@ allOf:
         clock-names: false
         clocks: false
 
+  - if:
+      allOf:
+        - properties:
+            compatible:
+              contains:
+                const: qcom,smmu-500
+        - properties:
+            compatible:
+              contains:
+                const: qcom,adreno-smmu
+    then:
+      properties:
+        interconnects:
+          maxItems: 1
+    else:
+      properties:
+        interconnects: false
+
   - if:
       properties:
         compatible:

-- 
2.34.1

