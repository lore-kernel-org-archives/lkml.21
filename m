Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088648;
	b=T/dmDeKaJjzlPE5ebpW91KPDU9+y9+TNOKk4j5yd6MvRVaollcX4Bviw1r1QtIPWO1CU
	 dUHHgJG0oPq6/GrTw8hGMRZ4HIT7a3dvj0QLHeT/gev7xcuMvYpC8n2fnDTo6nK5wU3+O
	 hqT01ptUhWvI/2ToUwcb9ft7c5p+30ptQJ27dIrVN2icfVp0/CwZ/wUlSUNygsWo1lSOm
	 Sl4TtCfS7weg0FjN4pVEU3o92hpWIynhNibY8vvubQRnMHy+WzyLEGISyTSEj0Tpo9beJ
	 F33lhbYTl27kYdfKwjFYaXpriCOxmE9kONCISj1NAmoBxvoHZ9eaJEfRdskqC0vlylw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088648;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
	b=Rptz/xJhXF/AFbt08OJyC6vQOHD3QdAUvliS1s8nQiQ4gsmYrLvAu51AJRkFd/JaRbIm
	 nd7id8TjD1uLv6JPb9PZ8avoRNwpylGpbWtT3WszgTm1EXrglpjY3ZeLvYoYclKLRgT+t
	 uDkQ4NncBw3PiqTDefOt4L7WFzZb9NV8wk0zFDVCNUJwbjLH3s+tNoIKQHyEq8ZF7fg/0
	 Vxj4BOu8wcoF62d8inO39JOuOXqoaBEpDqLU2Qw5ZfJH3JWkxlLqtgt8QuBsEufvwIBkV
	 +d6C8HufH6XE1ho3VPGg1LilCQad5DnJeDqf2JHF6Kab24GiYmh3R0n7XxlalqztpAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5sCYYsQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TLL82cif;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67975606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67975606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5sCYYsQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TLL82cif
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAvCJM2502188
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=; b=A5sCYYsQVb1DNqvV
	vFsx50HM1vd3ITwfbBxEsGwBAiOYFsCU2uvrEp+DdC6spOpMDidfYb86QtHKIHWZ
	r2LLl7ZDVocZA+C6rjeMge9YNRiBBeh+RroNOmURJKnU+8r5y/zC635pxImWYM+A
	4VOhM4lRol+B2efgLYj4aHnmS05lpRbjzQZH8AHHd1LkXFqzpO/OrJqv7xf8bJm9
	DkLXXwsDkVo9xlJTdunAlTCYuCt+kN5IgFo66fsH150Wk+xA20Qm50NvfiZLdIk9
	pkhv1U3f/iN+ZTnKtwWgOSbIbC2F63bLvgHpiFD7+lsfDLMrbpeNskow1yyuZv1n
	Wv+KKg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcv4ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:44:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso1225842a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088646; x=1795693446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
        b=TLL82cif6SOGxaUyXGoZAifpZwsy4mG4vAoldoH5msOjQUSZuoKIhrhtEqwaHhi1gA
         mMDidnPxkbwyF1/TA/vDMCrFxuE0dclTBeZMikNRg9kLYCpPn7K5epOtoI5yo+7pnE0F
         PASIOLF+vcNo61aC8RkQvILyEybQsYwr1myQTukOBIdedKJoxNg0EydcZJyRq80EfI2Y
         YY64vBCLfoaWnHMcJzPbEBw19ZcQ0l036Xf6KcnTTeOssHi1k2NdZSQssGOdgOlVC47o
         lE2TAPjiT9w5msrK8DdvLb3xUA6vUWtC1SpMdUB7C9o3dibY69yT94FdzELw21wXHTdu
         NV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088646; x=1795693446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
        b=UssyMFSe7t5Y89hdM8Uzae8OR+dEm2nKRTjJ/Kj+eZQW6ylhSrNW1+AaRlBJ/JfF71
         A+UbqKluP0NqKo4r2XeDkluV80tgkundkdH2OCnTN3l5XMskYjJfrZDiN6vUtn8ZRCSL
         233k87Ni3QHLtVUZYJOn+SpDCoymSmg304OTHDP92SpeIo9qjjBYz4au6hV3QbXpqeSi
         +DRt6gN99OOqEsqLTZpzI7zuOvvQzA2WM3MJamQpjfZkq3+Zb/n6HRqDkCvj+TLh6Gbt
         UOf4lZeijTmTzRKgz5J9wlXuTIvdFH+B28QoCgcXcDs5lAyj8vvA94K+Vgy2LOxl/l/u
         F+Cg==
X-Forwarded-Encrypted: i=1; AL+hErFG6Qu9P+eRdPQy6XHoaJ1o/YSqVh0hcIIgA5DTo1zl/JfgLgPzp/DB5gZgvgrvN1LRlUaJUL4xy6MgdDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EJ8oh50zJHyFasn80yKkPmKPqpt1KCi5sVONn6MxDMCrNsyks
	RDZfpnb9iyD52AMgNwl6pW+/5BnP0/aisnZg2GheGwCnHxkjDw2X4Ucu8ZRGTtol+zmgNwdA8uQ
	Z5lXqNZKXtK437v2gpen3moAuOg1FrMmJxdYBI7YTax02HKZcTNnMQKd+RbkW4RskvAQ92a5vyK
	Q=
X-Gm-Gg: AYBFou0hcZDwtMPBEY8pX7pCDhmnQ0Oi+nYV6tV4e5FxNywIUErkUdr/TEVlTv0Fufv
	RC6Gn5ijmcvVqlmkqY8xLm6ulgDruVWYTA1XyG4IxmPAcVEa1wqM6/ZXQZPLsnEhemQCicN43ah
	krtqQUd3WYY/lCftVR4uS/GdSVQzAGkEeOVTOaZ4zKFPQ7Im2xdoY20ml9Z6/Ar8NSqXs25qvFo
	4SMl/3ODezIgSIdliDWWOWraiOYEQM8T4hh+5O9DohsPaefR1Co77MZyvy4X5bctAfz0g1ehNVA
	2ivDCx+95+wAnaxduQoSJdkCcNcdqnF91SmfwoA/mOgTsWpcnWV0h+xPjb3ylpSdyinKWGGTH8v
	W2kRaEWXGfVJDz1DaKHrlp6X+dcV1+4822O9yYs3b6PdF4oUg6qdpeiCGmHz/jULg
X-Received: by 2002:a05:6a20:6a03:b0:3e2:b15d:56a8 with SMTP id adf61e73a8af0-3fe8acffe61mr6557835637.50.1795088645988;
        Thu, 19 Nov 2026 03:44:05 -0800 (PST)
X-Received: by 2002:a05:6a20:6a03:b0:3e2:b15d:56a8 with SMTP id adf61e73a8af0-3fe8acffe61mr6557815637.50.1795088645542;
        Thu, 19 Nov 2026 03:44:05 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534854b1sm1613960a12.12.2026.11.19.03.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:44:04 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:13:45 +0530
Subject: [PATCH v6 2/5] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
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
Message-Id: <20261119-shikra-el2-v6-2-0e91a1467e79@oss.qualcomm.com>
References: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
In-Reply-To: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088627; l=1991;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=OnlGB0lHwx5DBBI0YdWS06WaZEWTOr+RBHGa82co62U=;
 b=14GnXtGRy2K/813485mEdODWUgO6btuabwiyjWVGZg68p/AfpYrPmoHzijlBwUBrSg/0LYDRi
 7th0L9r9OEeCkxB2dZyIth8kKfd2HVMOCmNXcpJHGPCZmKVIyhTMmAc
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afee106 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=BudFWd5Wdpf3J2bc0pcA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: QOF181yipwZq9shPZB22_KE9CCH6sqon
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfXwx5XyXtgJoUo
 +g0/sMwABb8xKmpN8D3emwYSIbMBgXCl7wT5T9Q+TgPJrQXU2+pZ6aI21KiX22pHL6pKtVaDWf9
 iumWzn3p99NowDcAFNS2aagLxLLfk0jMHy/h/yXAxV6qXbKiv3e1kg/TvPYMFy96nuZ/C3K1U+B
 K6hrBcX08yRKbm9AmjcHHT0kb7/l3/uXeal+0RXstRPUjQbQgVtWBWZUityGnvXv4NCJXd5HVPB
 WDvHOPe0YioimmIVUpkpNtfCymOb0g5F9/Ptd2jlud43aBPbb+GDP21kiVOMYCcnRnGvHHDNVzC
 hiVYuP8HMYOvOVE6vJuqB/tPsi77f+yE2Sek7NS+ZDHzIvST/F4UathVvsydlZ2AjDqiPKCbdWu
 wwlUHVJaG7m6qMlz/Z5Rl5EqLEAc0pBR5V68oAWWj5iA8BfNP0/kLECnwWLHCs+J8TSWjVwfbiw
 H3/5T2OgINjVGgBIBBQ==
X-Proofpoint-GUID: QOF181yipwZq9shPZB22_KE9CCH6sqon
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfXyJAdytPSsgHs
 Knl3nl83S7Xf/tJ7f9YHocB6OaJk6FxO2nF/b+5+PWbArDBqSLOLMU+fAiKA4wxGerjRoVygDiS
 JohfoXwH9Nwinu+nJwckLN7t1RPoBuw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190046

The number of IOMMU streams used by a remote processor is not necessarily
limited to one. On Shikra, LPAICP uses three streams, while CDSP uses one
and MPSS does not use any. The existing single-entry limit therefore cannot
describe the LPAICP firmware streams.

Increase the maximum number of iommus entries to three and constrain it per
compatible: require three entries for qcom,shikra-lpaicp-pas, allow only
one for qcom,shikra-cdsp-pas, and disallow the property for
qcom,shikra-mpss-pas.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 24 +++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 74f83b7ce08d..3b827f2aadb4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -92,7 +92,8 @@ properties:
     description:
       IOMMU specifiers of the streams used by the remote processor
       firmware for its memory accesses.
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
 required:
   - compatible
@@ -125,6 +126,25 @@ allOf:
           items:
             - const: cx
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-mpss-pas
+    then:
+      properties:
+        iommus: false
+
   - if:
       properties:
         compatible:
@@ -140,6 +160,8 @@ allOf:
           minItems: 2
         firmware-name:
           minItems: 2
+        iommus:
+          minItems: 3
         power-domains: false
         power-domain-names: false
 

-- 
2.34.1

