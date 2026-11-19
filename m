Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100679;
	b=aHiG0gJPvh7SU8/Krz2nI3D5QpMG3itlPnvI6gLocfa3mwtEEiMkJ/nonaSz8OR6aITW
	 ZylnFygOwFoVOLHjwedtbQEuKO+cotrnVUJorANHBG4Ev4TALB78VRE+X7oPTo2R+qolV
	 E9AHbRG8cXki1AkvkJfd3uTSbQZjMCgjJhpV2xGHDALtoZH1NYXgbEpbhogTTKccp1gwG
	 dL1FQ6gID0kxXOwFRntBVtjOvsZFnr7w5XSiWsDInCNlJYyj2gYWp/6LOschr/vHBRsGr
	 XQmMRnZPEfmEUTXs19nZsQOyHaTuDMyQSHq/fhGhIMmx7vGUloytET34h6blShIoIHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100679;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9dDFOypbGSRXFMjpmv7vaHRjmeUkie/hrxavVTVI9H8=;
	b=pHZtzu/S1xQnHxlasbRSngdnGmmUeonXwArphMW9Vwtx7vB+s11JHjdZNyBWinBHrFXF
	 aduRDKZn72/QL6EjYzL+h/xsQbKPIj2azenuR2mOtbQrl53W+p6Dn7NRf67rvpMw2zt4u
	 /7fIbiavQJc9hDHZGG/GLiVdy4GkBgeifU7yNkmD4ZpC7DUV/lKufIbz2KzJo78biXc/3
	 3tsNQ1dVVXOjYn3yYaOcRZ4CYSWSuE2JWfn/W22UUb7M3bxUYEc0KtXe9IkbTurYQZXcP
	 wA8b1ebUOOwNom9zxAd0fQdpixIk1oFYr4zeGl6jtLZ+V+//XBUtyHQy2qa0xUprITQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kq0ZjYZF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nkp325zl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317D8606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 317D8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kq0ZjYZF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nkp325zl
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBjvas2609177
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9dDFOypbGSRXFMjpmv7vaHRjmeUkie/hrxavVTVI9H8=; b=kq0ZjYZF8IEclIc8
	XnkCK/LXhmlXpTCHO9Mql2pWopVYvo6t+Iq1esu7ql/uYOHPULalAzGsXBUkHb0V
	GZ2WhMfUUQQm4hRZBXjMWuWwM/AO7hxEEU92I0LVyjhKJ34qvKqHTjkeYUdbTf7t
	9xJFv2vM12RiJOffYbk5teRA+fhVSMloIAaoDdblqJTCkxpwI7r9kEN0DJfz1Et3
	oApL2ohz4iQY5xbH4RUB241h/7ozrFLHP8ELgAVp11HLrKKwx/N7Ctf19TD+M5OZ
	xlXPZz1LBqZsC5sBVwBzP64s+wA36NWoDcoNWjE6xXeQTuA22Br6jQv92gJ+CJ6N
	M9toGA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcvwse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:04:38 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-679b648598bso3406864d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795100678; x=1795705478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9dDFOypbGSRXFMjpmv7vaHRjmeUkie/hrxavVTVI9H8=;
        b=Nkp325zlA2EwOzrHQeXaf0QdCsooDFtdC9yHeTdBOMIpeKpfUZHEmY+d/am2RBZEaa
         thnI+oGgAqlHYGCSNSGMfkYWwetDmNaEzcKM7TSxFJNa61+1vAV6+V4V56aKQabAbmBr
         SmoRrFU4c+6oIkCL4VmFCKcasfafCscvHhDXFDouX48zYYERGtPWqqIgcQ7fRl8S1VOG
         rprnF0TZzPpK3EU8vAMhNYKaOL/SmqXRgPv18Qkd1A5/oU8f5U0TBk85U6df8lUcKDic
         ro3V05fD2qu8XWy/kqVrzsNPLzDGS95ExuuOJo7L3RxEXfDYpOpIsQ0fpriaXUZ2kLi5
         QzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100678; x=1795705478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9dDFOypbGSRXFMjpmv7vaHRjmeUkie/hrxavVTVI9H8=;
        b=VJfHv3UaZRioC9jT7Nzhup2Ic4ehoB6a7oI6aHrYrg2lDfTqR3eESqJ72k62i9SWXI
         ezYwvcQNtFdIRCG63DEaOPrCCIPqRVAqtJn8JtlW0fb0QCPRn2WM+YJnz4HkV0aNVU/d
         gtKJYEwkJ2OyFg9EWGuBSbxuPNz4JujB3UccfW/TfzjTxw/QLmqAMX4oWGZW8v7jWtKM
         GArnlMnL/syRpOwEC/NnUSSpPcU2EbGdbmifZ+IAcjFL+oAtZDR9bhxQtl9pQVX6lWM+
         0QWxKTGar1L3ezgi1FuMZSa2dnTDlloK/HONxBTha0RqdFKP73poysI4FTBKuBGvDmu9
         j6Lw==
X-Forwarded-Encrypted: i=1; AL+hErGrTbLYRLFQ5S7AsaVJqfGNCU1K94z62E9sx3I4D41FT2XyJFrs7dH1+yx7N0BQDGW9Bt7qLQa47AZl6/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9px6zAt0LWOQ0UvBTLdMK3u4i8iaiX8YkNT8zyJJmip8vvSFMe
	1qCwQsVVC6N0h2895XsGDQAqYZClCKUKClaDCriVm9BZJbaiziyGwTlb6bNVbira9OAQ1G2t3qg
	HW5QpS6l67l/gPkgmg2OeFqT07+1KpyCPkBWfhJORL6v1hT/f1uoExyn4JFg6t9SGxIQ=
X-Gm-Gg: AZFdTZegwjJfyN1go709wYZtwMykyGxCLWw/YNVLydHardYCLjow1ZOOj4R4VQaA7T2
	KFKj4uwc8B0mSZ8fVdSSbrhtyePuha0zIA9vAF0j//0pG5UCGombNBMAF28O1j+XkheLYPNUPYg
	rnIsQJcvGZXDiwnCx1YmmGYoV1oNeWO6h8aYzGd9egyb7UZ64LjHh+7pQ6uoUDDIopcX//hXESR
	mFLknvwIPlFSjf/syVbl1F3j+9uD7uLmtRvRvAfmEuR88Y2m83CiWXwyd2SsbUb48Y4CfZD9PQh
	QDmADlFn23dhDDZ0zs/gw2ue49R5ZmNcBlO3Co+7rY9Yg0bIUwZTtUb1LV3WE1Rvmfio65Lq9Jk
	nDfO/xPXNlNAfRf+kK31VaW5QWYX4qoDG2t/BEanGBXdYx+PAn2P8Isa+9OUdCvmLFX0hED+v1s
	qEbRDB
X-Received: by 2002:a05:690e:168a:b0:67c:2421:f2b2 with SMTP id 956f58d0204a3-67dd3cf9f12mr2735265d50.6.1795100677525;
        Thu, 19 Nov 2026 07:04:37 -0800 (PST)
X-Received: by 2002:a05:690e:168a:b0:67c:2421:f2b2 with SMTP id 956f58d0204a3-67dd3cf9f12mr2735212d50.6.1795100676977;
        Thu, 19 Nov 2026 07:04:36 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33d64a0sm79790d50.22.2026.11.19.07.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:04:36 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 20:34:22 +0530
Subject: [PATCH v3 1/2] dt-bindings: media: qcom,glymur-camss: Use linear
 CSI ports
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
Message-Id: <20261119-glymur_camss-v3-1-71ab966c41c9@oss.qualcomm.com>
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
In-Reply-To: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795100665; l=1615;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=3SVM2RsbonCgsgSoLY2zONHaCQGkDqvlTsplAN4cbGY=;
 b=rjokAHLP7v4iGEBnNQxOz+He8NglBkMudWEz8bESTeFaAWase/oibnkG8M8RJCfPg2ezzAVLQ
 QgbGp54zepaCb5SoeH64O12mh/ybNdtHTBQDwujcLkCUXRi2H94ZQtI
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6aff1006 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bf6BjHq6SqOzxvFPJRcA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-ORIG-GUID: xvd7cv60ArejT00EzlQ4H7-hoo1eVE4J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1OSBTYWx0ZWRfX73CgxjhDF7R5
 sIOHhcYx45NEUbHnXLV83g6TgIGiPcgmHOgh1sq5wwZJB3fooSOLnTTinbd234gEf0ARMvZMszu
 nkomTTRu31OEr0bYI8LcT4Ub5rZJ7QXRqqOoQA+74+mFgFXUNq7nE8IvUbVnn+p74U6ghPTqf7U
 AQVsj/ODeGB5AmFBjbKE9Zi1iANq4Fv8dfAhW84i9jN4c3DHYdt2+ko9LL/58OmM63TPOEntJJX
 DJFBzZyc9myS/8ksVKeYLDYFWy4SUb5xc6k4kpPTM6/NtHB4niFS8aEC+jbAsh6zXUxIILHyJGU
 PR8DKDPmvlyXyP6nSM1bvomhUmbejnfjcrtCuuSgxNZu8bfemt6XEhsptZyeNuB0XE76FHeFykj
 lOhl9/tKBsvR5l2rHizUNaxEmgeb6TwYnueli1E4/doqf5juXtP+o5OR9BQawnzccZbUFBWWilp
 Lmg3xFPDCELjlpikHQg==
X-Proofpoint-GUID: xvd7cv60ArejT00EzlQ4H7-hoo1eVE4J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1OSBTYWx0ZWRfX8t+RH6h3+v3s
 DT/Z3LcSfiNBbsk6Ghr4GUhtLOSNayBAAqxzolqudy9+T3V5uRl5dzFX5HYP3v5w9y4GWbXdzVq
 z1QW+eGGP764LKenibisIqhFAOn0xBA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190059

Glymur has three CSI2 PHY connections: CSIPHY0, CSIPHY1 and CSIPHY4.
The existing ABI used port@3 for CSIPHY4 because the driver reused the
X1E80100 CSIPHY table, where entry 3 maps to hardware PHY id 4.

Use linear graph ports 0-2 by replacing port@3 with port@2 for the third
CSI2 PHY connection. The matching Glymur driver data maps port@2 to
hardware PHY id 4, and there are no in-tree users of the old port@3 ABI
yet.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
index a0b77edc212319fad69113f3d55ca24f184d4b23..18a38fc4f9025f6b927780f55ed4fab194091c02 100644
--- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
@@ -109,7 +109,7 @@ properties:
       CSI input ports.
 
     patternProperties:
-      "^port@[0-3]$":
+      "^port@[0-2]$":
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
 
@@ -288,8 +288,8 @@ examples:
                     };
                 };
 
-                port@3 {
-                    reg = <3>;
+                port@2 {
+                    reg = <2>;
                     camss_csiphy4_ep: endpoint {
                         data-lanes = <1 2 3 4>;
                         remote-endpoint = <&csiphy4_out>;

-- 
2.34.1

