Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180899;
	b=QAr0f8a9Vb8jDbf5Xr2L/yChqzDopGwOgJg9HMhGslwesd3v4gnS1ipvtvI/xOpVNFyl
	 acorp0nRiLSqYdgJBZU0dOQrf7gAmfSro+hxTAxl66hOA/zw7+FaFqOpTBEkYSt5zwLZ8
	 iH8cnvrqqumWR2MXmGC6tfsDU2YtJTpp9xxP7OO6wHqdBdbzOit8SXBuHNPDiBd0tqRBd
	 hlHgimBuA/Uld1jj76l4Pkg7wbhFtgB0OlL9/g9qS0oqqHY69si6lx/BTivx4ZfR8KyFy
	 FeDY06r2z0zVLf5yBrC7zNuigVinLj98B+7zhMUh96ersy1iiRkQqFDtZ0Jq7AKNvUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180899;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
	b=WCLpsB+BFihPsr9kwj70M7aoQTWPFMOidNrRZKaCc0ZrAWkUs+NfGJDAer/TeKye8RUE
	 X9zPSTdi1nKJBfyNI2094RpaEs746EgJIbZ8KJXJaagk4DYAOL3nOJsSRPNMKzZADLepP
	 L4olchqd8nH7dkSs62UDqI4kv7OHgMm8sdWycQ7O7EJuoP+8G7RejIb9NJ9vB1rwj18vM
	 7ug0R7g7gcBAKrV1G1d1UqmqqVYIENzbwDaAQy1a6mEH+bbymwg2IlajQdWjIYPt0jYa5
	 rsH/shU96a0AdefZwBwf5SJVvlNyRpauIw/Ul73vFGdgrzutj0hsneWiqOmwmxXqYZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lfsTI96N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1HK4ojh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2561D606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2561D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lfsTI96N;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1HK4ojh
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk2Lp2433184
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=; b=lfsTI96NcRfym0qx
	Ewn7J8yRv5lN+EMvbcDSaMPlD79smUlb0JsvejSWU1cxZGYZQPkWo65wAkzIs1D1
	xKoVsjFE4le4RADHwA6KvZ9Zb/eGPtAel9CyvR1mwphr7PuY66NzKNVnDEwyrQ2S
	lEtSxeUyZpFvI/DtpzNWlhmEiSh0KfnOu//G1F/BLE/qvJR5muNFYssKvoFQ1d4+
	PXu7QiKN2so0hiNvMU385u/AXqfI5D/HkqRebioYUcHbZ70qxGSumvfyNMwfaJD0
	ZkiU8vh7xPRgagQLFyGWJB4MFcC2dydhwRvBJ7qCtq89EVlydFDuKAFblwbwKwlA
	tOk2gA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj9yes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:21:38 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so79883c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180898; x=1795785698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
        b=L1HK4ojhsg801SsbqEhFDzfKS8YiVJSqtLWWQfd4Yfyb/cGGsOfhOnozIdkPWg4xlo
         UKtMUPp+wmS91v2j6iPFTHbd2L4q+fIQposGAQAJSp65aXt6bxee3ufv8gxCzGsXwfn0
         p7iVdwDldkrLz484wrvXC0sBTZW8bLOoc1SZgYBY/4AydoqbXBQI7Hb0xwIDFGXnneJX
         Tb0MAGGjInfr2qZ8svzNTsEtWMbCD2qUwpR2vfL0BXtc39UHN1S9vyHBC9lwNhPiii1T
         idA4Pllh3OH28FhStqlK6yyiKUrrhGU3B5ovUCk2IGD6YGDjkrKHaMzVWNwlrOmGzfoB
         qlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180898; x=1795785698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
        b=LQNIeoIW4EqmbFLqip+was+aBAfHaMahVshN+l77fGlgsHzFeTmpwa7EcfZJaNHYeD
         wYwn4sC3dRnmZBJCxzD+yWsaVXEu6+O6AeLmmJz5mK4Nw0vYQes3L0Bh1X9+dgggOHRD
         9Jo26diq40V32Xrn1kwMRidbac5wLswYCDNjtsCU6xWSM9Iomb3twg/oqxMWWx+3a5SJ
         Q35m1Zo0r008nVZ/JZFsy+l2el7UpVOOU+5aJMKvEhRWTHwmgI7ydhYWW+B9EhVKS61k
         lsISSS+4Jxw54XSlzbVX3vqhHrdYe0Bl+df1r53qr1i1ZPRjsblHkTH3xvWwnw3IQ3b0
         BfBw==
X-Forwarded-Encrypted: i=1; AL+hErECj93cHovLthcNGjzLkwQHh0lDPvp1gsf/7yAYnNXHSp5GqpLHniHaOAKTz5BzvSQWxq1gfpAVcMjY1lk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3SJGbP5/8x6pMIwJdNOm0Wccy4CylEgtzCgeKh7nmQVv8Hz+M
	a9PIO6bHuVOmcoctJ11e50FegvIK3smw5S71KABFTN8DJxpT2PHFyFQZysjZVPVKCgJ0LkkjXNp
	mjjEY2P01qFuAI347sNN+NmiKNM5NSt9blFrNJOZQ5PQeg6YBPrKIcuYIjsN5cct/0MI=
X-Gm-Gg: AYBFou1J7OLOqcPw4vjFmSzOfwnj9wzzEByuL/gMFXjdSVt6uS4Y7Xkq3kPLUKM9A8E
	kiX+wgCWMsTTDiw79UGv2YQeCH0qPdow81VJOV1YZPyM2/PXqlYieRFfj/lezVyP6SL3b7EdQiF
	HYAq9CSH0cd0u3vnpXZz7ke9LTLoJLQvQKSw1DV6vzyPQQifnqx+zPgor5dohILPrOzZZL3Sad3
	Z5vKKFGTLQEiSBDj/CUhJw4jjpdTfC88TZH7k55V1embEBNmnI2intsx6AK14qjTuDnasR1iim2
	oFoOJ+21blwfU3P1W8JbMPWCz0boiZAWSgVW4domKXE0MMd0INpBpbjIqr35ESeOvGXy3Jybq14
	tEEdTOg2vYkQH7neWRC+nLaPWswxQVSFfB3POOFf24KlcQwg+pzLQdEc/wr0PgO8Y
X-Received: by 2002:a05:701b:4193:10b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b55689a0fcmr3009486c88.16.1795180897485;
        Fri, 20 Nov 2026 05:21:37 -0800 (PST)
X-Received: by 2002:a05:701b:4193:10b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b55689a0fcmr3009452c88.16.1795180896843;
        Fri, 20 Nov 2026 05:21:36 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm6929628c88.10.2026.11.20.05.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:21:36 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:50:50 +0530
Subject: [PATCH v7 2/5] dt-bindings: remoteproc: qcom,shikra-pas: Add
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
Message-Id: <20261120-shikra-el2-v7-2-9d9000eb50d4@oss.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
In-Reply-To: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795180879; l=1991;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=OnlGB0lHwx5DBBI0YdWS06WaZEWTOr+RBHGa82co62U=;
 b=mc1Vfk3i7aEY4zzE2pKuvjFl/03FLuO2BqaPMz5KkwZdee5r8qe58VxKx/y12U2T+2v5CtvSx
 Ztss9gKJkR7Ag+5kMMq3xwyHUxHgcALmfGpPFe8NCjeGlTL8ezMb9Ga
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b004962 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=BudFWd5Wdpf3J2bc0pcA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX3YC3p2fO+Fld
 67bEWBwRmHyXkKcxXN0j8PclnGQf057nAOXBw2tWOCBez6uMggJBa5w6YFbvMD+B4CHrUAtN5mR
 jhUo0f/iftvO63Z+p6cauWsnPLHX/HU=
X-Proofpoint-ORIG-GUID: U3TAGkN5VUp6H40RHz1NNsZ3RQLdYUcq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX8jNDFx/Gg2kD
 GHrDOVHuMW4fLsUpsaoGKbgoNsV1QkowIqaOVElpxFfXLcsuT9Dt3mS0wp0465QASrtZNEThB30
 svgZf34wz2FFl30VDcNdcAg6mFbdY1OckAu/d/gO4EvtFExCJ8u79ncCJqY5xbFqgwe/XhMq3xf
 bsRUPLa6cA1FYVc8ZC6lkjaSoVm9C5p027vsCqSZ+7YQoPHcS3olGaI6RsKudTctHtApZcASpCj
 KEO/QL00MzZEEi6mJU/H1rokSViA5tBY1xFVRUmxJsjXVhe5EY200l9auV3XlxQ15SNQPf52Fo7
 0nNzDoX7IPndMeu2zkR3nybF7u82M5WUjkGYG6jvX57OYHYafiAbJsHaD/LVJ5qcezzP0kmfwJn
 7HlGrfes8WcMXRb0JQBaCtjaObzeR4K6Bwdk9XgPhTPC+0rDkbKyNtjgtr+k9chgPjjPTGC/O98
 ZYyx/AA03SnGyGyAUGg==
X-Proofpoint-GUID: U3TAGkN5VUp6H40RHz1NNsZ3RQLdYUcq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200053

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

