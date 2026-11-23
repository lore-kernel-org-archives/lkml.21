Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452190;
	b=AW4qY8gQCEJSkglQPhZ7Hf0R+Tu5S9Pc2LXzumcdgG5BmuSWBwv8bkNLSayvTVqrJ4Mx
	 21yNmbvRUbLAkZh6RTKKDmTFKZ66agHWAp3rXv8w5b7+MSxw43ZYPYVbDJvKl5rY6SpCy
	 NbyQSRa162fnHfFL1DDmQs6pNSGpl4Ivi94HrXFOsu16irQEV86zPjKj+LFQHiPto/J/S
	 LZeheaqWKOOAU9KzFUMb2exF0GcEQA2FS0YkfyNlYkX2XOC0akyeMVXRbNR2ateE1DybH
	 YNpXd6Moo60croOXVEEVVhqssRcqPp2EBnZHwNbFB7vJ3HQDtrcVnP3T5v1IcrdqkiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PgY77DQATPslxFPlvaaQ1+Q5yfm9UY3HeeBoTnYXC4E=;
	b=XJwre7dNfea5L8prGC0gLYoJSJHjicuuLERKHqKi79PH6qMNhAwg6NWSUOeHiQp458zM
	 TKJYGutL6hLUgADRqXbbyhVv0FyK/GG3VsHNz4RT/tkNsrdBHfvsgOo+LIOhfhtLxS84p
	 ofTrUvBws0+6mYHPDy5lu7IJIpNcTamaxXZ+UP/WB6B4xyKhwCH/7GUCV5ePA/xL77wWo
	 DEzFdtCnDiuDtNP2eEOF3mxp9gdinhROB3Y6WEEpxH25MNX/gme28CaKigcopsImt/1GF
	 wc4lNE5Gya1+yH9Tw6ta655ABIFA/GtxnKzAhOeXShkm2HL2E5XCC0tIeyJfHSpewEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ez+CYzI/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qr1cLOQa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2D1606A68C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF2D1606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ez+CYzI/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qr1cLOQa
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGlnq3025298
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PgY77DQATPslxFPlvaaQ1+Q5yfm9UY3HeeBoTnYXC4E=; b=Ez+CYzI/AUVa4MJu
	y/N7F9NT+XsRTH0kSoS8+h5QK821aBadbEBGWlRawp6Bk45sbGMe9DPnagRw9CKe
	XR568NtA5Qtjgc3QofGiriwHfOS4AeGXVHZLVEhjmW2iP9lRQS6Um+noIY4gwAVQ
	wH5TmFKT/CXq6dbmUC4QMT+e+kImzZqVw1b5ueKm7T655IgkVGRJdkN7dnhidJWJ
	Op7iQI1J9NgCa2PjgShKS01BoY509R+s7q+NTafMHx4rveVHQb0uSZih9OnyxTlD
	xVmTXhrlFGpOaPddUh8dS+yMaBfj+EFLIjxlU/ILw/CT31mX8XMon3RpCjn2sXgm
	yPufXQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pae4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:43:08 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eac41ff334so2918834e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452188; x=1796056988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgY77DQATPslxFPlvaaQ1+Q5yfm9UY3HeeBoTnYXC4E=;
        b=Qr1cLOQagWRRghXoXdukbKBnL0X8gDYMLIaKfcjoa/FyRlE2F2aUlbIOx5rZR0PQ/8
         oPo+ryT/sZd2wNpT8Lhjfxp5MfCALb+93SUgswLveurkWqr4EQ6bbYd6+J+ccdrHWl0m
         k/6LnhLMcaYI0QjqM29xViRgH36lrKPEBNeLcAGpLudniCuyg2Z9aSOvm6ymPMjzHHIB
         T6kn96d/eBl5jueBvqphw16VEHYvDhSXh2fchW3z5qFaGYQ+Ws0ExBbxkeS1IZnoro8W
         zZtqyq220IadLbCNPucgwNHVNzEure5XhO5Hf3CkZcuBpaf041D5CnnqB3is2FcaxNd+
         ZvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452188; x=1796056988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PgY77DQATPslxFPlvaaQ1+Q5yfm9UY3HeeBoTnYXC4E=;
        b=yKJKgN02I4y07he3/JplGc4s0SqelI2B/3Tdl+NBYAoG4E9MAyDCWfpLKFFBahjZ5H
         arSHMvEEhj8EEesB6ACGPynUl0gilSO5ltg9IbYLU8N1L46HuIdt6AsIj2YDFqQ/SuK7
         OxbiMrEnfCs4Iu8u9mGMiEiydtgzuKl22awoO9wKPmXoJY9HwNBEioVzizzZSs3s3NA4
         MZ/Wtd3PiVxGoFyzZthTWGKQcXqnaYBrjcCG245CoTtWIEdU0cnjTM1kD1D30btnM81c
         noROwCVA4i4qeRJ3CZA16JGgSknJosDqebfVFIsQTJ7QzDTxDluCEfdwE/br1sRtdzVV
         OYVw==
X-Forwarded-Encrypted: i=1; AL+hErEjeQadcc88qP7cPVNEe+fhJkgdTMZERR2xQz87ntfq2DzIca3ejeaKPHbyJmUozEAw/Ekp1mYOsCroMKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z884xnPVL5aNy8o0ON1ISfO4EJFyxUHunziRw1VKZVe6w5C10H6
	Ua3F1sUZaS2QVYq5rLmjaFo8WB8TZBWHhCH/2y6gdfPZF8Ct6eZ9E6IlzIHx6yK24kR6lGmPPwg
	ijDXhzHP1p53BWmDDTrshKPMHLG/q56oTWONEmliG2H1EwCr8VrGp2HgckCWb4OO6/bU=
X-Gm-Gg: AZFdTZdfe5+3C82QO2onPJeAvci9Ea0aId8ySJacQIsWj+vfxBwODoMKLRuj8djYADX
	v2FbItV0ssc3ZeEGF9ksJUOsNWiwm70p5U9SkijFFjjw51NFH2zg5A0joqvQpXM3iNdfyNUgeHg
	UdAp/jjN2BlOz/zSbk7DtWLK3a0zfdY/Pis8OMoLamWUGT8iNu2k9tHaAUzae5h46ED8tdnYTOD
	M1oXbyI5aDnkiROHM+6foWbVIh71kGQwA/0uMF1FaVQbXHDFPv8dFFliuIxPgVWBohH3YiOPVdX
	7Gje0Si5e2yg2XKIJ9Edodf9ODpYbw0KcVPnEhPsNzFcfeP87zgnBYXKr/3tP4CTxxix/uk/d3n
	1YcT/8KnMaxMy9HMe2VfkhIRRtVIke/fk+Q1hACXDms+N5Jl4Lfu7fZ4GFutPcUqoAU7bj+ixWD
	fw7Xfz19TlJBkj
X-Received: by 2002:a05:6123:6:b0:5ee:9000:106b with SMTP id 71dfb90a1353d-5ee90001d62mr3741349e0c.18.1795452187884;
        Mon, 23 Nov 2026 08:43:07 -0800 (PST)
X-Received: by 2002:a05:6123:6:b0:5ee:9000:106b with SMTP id 71dfb90a1353d-5ee90001d62mr3741307e0c.18.1795452187438;
        Mon, 23 Nov 2026 08:43:07 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:06 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:42:57 +0100
Subject: [PATCH v2 2/5] dt-bindings: soc: qcom: eud: add the QCM2290 EUD
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
Message-Id: <20261123-qcm2290-eud-v2-2-9bfc432dee07@oss.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
In-Reply-To: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: H4PyrufWhFQCQPaSgBdIx4lSgPT_KjTu
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b046d1d cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GBRnKKbz5W7R9ATGUUsA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX6d9IPaw3Q7HD
 MuReUgY0o+DefQm8Hz0RXURbfiTAh4Hc+uhRMVryepE4vri6uQfed4zhw6Anczo1vBJDGBM+LiE
 GqPUTBLZ+XYvBARHuEUyGXqEwoOftWU=
X-Proofpoint-ORIG-GUID: H4PyrufWhFQCQPaSgBdIx4lSgPT_KjTu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX+R8SMsSEQQHW
 LX90OWdXYvuE5QYl4P6JwPYEUL6tqLmyF6Cojv3Tthp06AwcBTel3A6P3XIhB2S6glZIfDZM1rw
 SML1kKOkOjGmiAU9WhK6DKyiPaz6+9NzJh0xrM3yM8m4EGaCFuzqvWBV7TXOd9dY4IQj6AFIUSg
 EN0Wcw1cVPaZ29QVeuqDHOZR1Dxru4qp3gwjTCwyVYyoyMUMJAgX9gdJrP0srzbQ/e0Ai8WYVSd
 XrpxsdLim3H8RuLdKeSXvc+NvbYc+q31VZXv//vpYR0MQLamnvY7YOmQJyg53lgUr7APPT2HOST
 4ahvSxUIOuXjYPLnrxIO3nr6uFb/Pai5XP05wRnttiowbRb0BrVtvz77kdzfNZ9q7PlkfmLLFVI
 AlULMZtZ9166h3oda3a9C9WZnkQ96oYx/yk0wHQsESpW+ZPdQS/6jLXebsMJq+NtAFH4gvhDI4e
 qzM6Pi2J3e0t/bD1k6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230066

The QCM2290 has the same Embedded USB Debugger as the SC7280: the EUD
CSRs and the mode manager register that the secure world writes on
behalf of the driver.

On QCM2290 the mode manager additionally ignores the enable unless the
TCSR register TCSR_APSS_SPARE_REG1 is set first. The boot firmware does
the same before it enables the EUD, and the register is written through
the same secure IO service.

Add the compatible and a "qcom,tcsr-reg" property that points to that
register in the TCSR syscon. It is required on QCM2290 and not allowed
on the other EUDs.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,eud.yaml     | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..bea03468a499 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcm2290-eud
           - qcom,sc7280-eud
       - const: qcom,eud
 
@@ -29,6 +30,17 @@ properties:
     description: EUD interrupt
     maxItems: 1
 
+  qcom,tcsr-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the TCSR syscon
+          - description: offset of the register that has to be set before
+              the mode manager accepts the enable
+    description:
+      TCSR register that gates the EUD enable. It is written through the
+      secure world, like the mode manager register.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description:
@@ -50,6 +62,19 @@ required:
   - reg
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,qcm2290-eud
+    then:
+      required:
+        - qcom,tcsr-reg
+    else:
+      properties:
+        qcom,tcsr-reg: false
+
 additionalProperties: false
 
 examples:

-- 
2.53.0

