Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376479;
	b=HP2hFj1l/1vdOaTvuMJEXMimRnjQQ8W+lLCogTUndl050WFRwAa4xVvp+j8MI+o/1L0e
	 o/WCzIcsnFVWvmskJK1qD4DkM395PdXn76DMeovjDyd3nueWldfbHiggsjCutpauyQIk5
	 LW5ouLXhXakhTcANhPszU9hEGVqIJnGFrNeIbpKfioBnUSUiHhfaU+xAjdSNLE66q+7uK
	 cHUFpGuqpYwLN8cmaVC3CcG55dzPRQ5nzcwxr5/JiKOhXEXmG4MQxLwqyFUp6yz2l/JTS
	 PPlK0e8Wx4cl6lfzWTu8hdIm86B9/LkuNyYVJ1FCkM22vvd9Qp1uFpc529oMmaIEViw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376479;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2NMfiLBWHBraD6d5t03iOIotkczUU94EzQsw9iHhouU=;
	b=w2LZypTPHm7T/55FRmX7DrhSPfEPPsENLL4OBHPyxPxDhsG/JjwrVyX6bG1pj9HNy79z
	 Xfq29fytJR6Cds59GGUa9W305XYZmmNKhByyVi4+RtOkp3sXFVt+847FTCzLpnbfKNiGv
	 U9iIykcx/qUhrnVz+nqWbzXx+G1VdBPeyVxqG4aZqFSlpTrKLeA+OiDQ9NBQwQ4AlQIs9
	 J+aSHaddRKWRfnXMRSPYwSG/q6t8dOhfZqLK5hAEp/6z4BPJcX7H+aTRH/rb7y/b/C3Hr
	 cQTcZlDV0uqZbmyY/x+crKtvGie2Tk7qmpUoslI4nP2NtSPx+cdt6SSj4WosCQ/v+/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lhofdDvJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jx7tbmtf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544E0606A335
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 544E0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lhofdDvJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jx7tbmtf
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUtkR3514869
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2NMfiLBWHBraD6d5t03iOIotkczUU94EzQsw9iHhouU=; b=lhofdDvJJsGoeE/J
	TNoqL0yLff60i3ImR2vC6qn+Vk0CXbSbp87MWwBCTjXwN3fM//v22JsqkRXn39u9
	sDhOOF9gryeqnuz3txpcRi65p0EU/shiJk6gyeS+yM4AxftcjdqeBVZZJ3JfBgBt
	UDwaukIufNFNAxtD5VfTZDKKMZOGUV7TJReDEmCRdd/HvsS8s1rb4CkzUPdm4vhf
	eiN1ZzX6jUfrYmoH/87khKhOAfPvgXUngzbiZfR1+L4s1vNszq4gEOOjSeJrwETJ
	PAy+nbigdhOwLAgm+9/Lugyk1KMcww7S3qfcNfrergap3vAVuncYNiA9uv8E1bR6
	RSDWTg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7v29v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:41:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so3048797eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376476; x=1795981276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2NMfiLBWHBraD6d5t03iOIotkczUU94EzQsw9iHhouU=;
        b=jx7tbmtfUL/t6r++4iVR3GBQeYdNEME2xZnMrbpqIR77GSzoDaE73Sh6xnCph4M2So
         rMl2L1EjbvvSd01WikD3jjPA4bT85Ma8bBEWUyx9Mw1GmzlyQXfJ5P6v8ZLALynsICfk
         Hs2nGoF4xAZrVLlbOJ3Ky/V06DJh4W6wi4/kW1YyewmYItmRw1QXt40KIhY/WaJNcXbw
         IBKqsahUtviemY3K5/okX9zE4ctuew6zfo0m8UYNEJ6m06yhS7Ng6inM2kyXUQL1EdEh
         2SZsVXjyVYQEuSbSLxypUWBQVLxZvXoJJwkZNcrV8rQ5TLZ+4kGiClGchpdYNgOWBU/G
         p83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376476; x=1795981276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NMfiLBWHBraD6d5t03iOIotkczUU94EzQsw9iHhouU=;
        b=B4R2qib9PKQFTcsu9/pxgXGf+QEoG6yDWREgZNNfZhWrVYYAiCLwtYfXFqQRqiXhw2
         zad12hVXvzfYFZr751RPCpu/9pXO5yfBCLrXolBJQekoutW/Wn1BXyomazxpO3ZFTtpy
         yLP1oWwd3Y85kLGOil0xhdmClRucT3YhI363qaDJRxHj2uAuUK66l3YRVl13L/731iez
         WoXoTDkHJc0AubvxPq5QJ0P/Ht8EuEkMu1sqtwyCyp7aePVLPntgWLSWklbkxQxCx2K1
         z5ZnBQJ7WscqKmP5VrqQzk0G2rGZCWJD6O2TmJ/Esh0JHDgxhzU+xCR/myR/cSLLvWPB
         Hrqg==
X-Forwarded-Encrypted: i=1; AL+hErEnh9Jt5cgrxqOoHuSMHMuoNpQPLpydyJLFTyXTBZTbDi3SBxyJAI6luFHkbVOhP3bwYgTBp5U+MHn3f7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r3B7WH6OFYda8rPJKWQJSqMhIOqN0ubzxGBMVMlI2Yd9v/ImX
	MXbisaVQglLHUqfcuT6aaeRRd3WgMUbM4qPTDBVWMQOo150U1wIlwUZDJ+sux2gPQf2h0Lz4PiB
	o/NCRDrGuDDLMY+Pny+zjUl5X8RUgn7U7R2s4YPRYEY/7JImIMMfnswviYg7Q9CKT1w0=
X-Gm-Gg: AZFdTZd5LoVsO+KTcWcSBzvlxYZTMyIJxItd5o7bfz0L0/+WPEyolz/vlNohm6QBHiK
	bngaGK8Y2wPCI3oI05TqW/1Wy6vVVq8q2Qmomtg7ThgiFG56709NeD9Oshq8gwSF+c9kjsN6Ip0
	6/BPcmoeeHzH/aZ8yoqRuR9SfTHtVGmg+kN4sDxblnPtqXTm+Vn1yvjIVlq+T9I2gq/sobfVItR
	NH5SGe/HTKYDXqC3Cv98MhmwCEeHAjAC6K+abPsNTYR6AHbnk9fuwzG77gkQCOpOGgMS6jfzyvI
	9Z26J1vcD+L3Ay55iszsbTxNSbyfgyi5dWVBxVqKhWuqJW/Xe9e/IRjnskdxTZ3kNMIYTsEBJpt
	Bei8mRDegrbNl+nBTUAVa+wHiLwN3oEABxomHmPiVCC7k3vhw+ZA5tK9I7rWN9zVN/TvqaQhPPM
	8kleQ8EpR2Xw==
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr12134318eec.6.1795376476083;
        Sun, 22 Nov 2026 11:41:16 -0800 (PST)
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr12134288eec.6.1795376475563;
        Sun, 22 Nov 2026 11:41:15 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm28348711eec.15.2026.11.22.11.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:41:15 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 01:10:46 +0530
Subject: [PATCH v3 1/5] ASoC: dt-bindings: qcom,sm8250: add Shikra sound
 card compatibles
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
Message-Id: <20261123-shikra-machine-v3-1-e5d074264428@oss.qualcomm.com>
References: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
In-Reply-To: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795376465; l=1514;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=KSrSXEahZQMd224943c8LnPie0khXp4nfj+R+BunIW0=;
 b=JZsIIoriXs60xtNNmWjttyoCFZAbwH7sBoOZDULZNYIdA6MaeevJPPUL5B4qrpXwlJRPDL/Ug
 DTJMVUA/DcYBDbGxTfLsSQYAKkWCKiXSlld/4wjVV+qzPElohfBNQS7
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b03455d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IO9S6bmGf6N6HOI-BKEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX1Op6IrrNU5JW
 KohCg28ubng21az4KtSfhTRKUcQcujlZeyjA3vfzmi2FMdwCKNiJnLXw/LP3z/2a7XnnpOlDi8E
 4QTM/0eufBI8XidVeqQA3mAS2jD0EiA=
X-Proofpoint-GUID: va9MTUF-YA0BYNnUaRIN02FiKGRZt7Lu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX0v/gJxGBmTl6
 XCboYIZZX1IJ70u43N8YCjigWs2qiaDdNFLHe0k9CzEWqI5qEwo2bA5vJVWQvr0+W4ijtO6rm2p
 zmM4nVK0agaY4DGJlUioY9242Z+FFsSuc7GWeqOe3fsPPVeUtR+ZWy4HMA1lpVs6WMmD4eUMorm
 dTLBrJWuJwCMyqhp8Uo54ki/3F4OV5h+5cqf4SqP4AHYjpM3MJizLVruawpEJHoJ+3XGng8jQa6
 uV7tEGhfqgNKWIUUcdqO2Bfgn3wS7Fe6Z34AXGbyw0OM9VCo7VozqUjNbSsgHUISrpd50+5blBS
 acBmKikf+JWGnpzY4wEfH4bBG8GZNNFJ6jXJ0sJH+kUHhpE/GQudlNm7sk1Dm1ng5JQvplCGEKO
 9OLucpfNEDqq5ff0KqLW5e5X63Jmk0f0+x4ppZCudStsX8Z1SmAcq/zRk8f/la8xHEnAjOui6Fr
 atruieGic1moGFjTb4g==
X-Proofpoint-ORIG-GUID: va9MTUF-YA0BYNnUaRIN02FiKGRZt7Lu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220078

From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Add Shikra sound-card compatible strings to the Qualcomm sound card
binding so DT can describe board-specific audio topologies:

- qcom,shikra-cqm-sndcard
- qcom,shikra-cqs-sndcard
- qcom,shikra-iqs-sndcard

Shikra EVK variants use different codec/interface combinations and DSP
processing paths. Describing these variants explicitly in DT allows the
machine driver to select the correct DAPM routes, controls, and clocking
behavior for each board.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index a890fa288a76..1dc164e2c73c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -57,6 +57,9 @@ properties:
           - qcom,sc8280xp-sndcard
           - qcom,sdm660-sndcard
           - qcom,sdm845-sndcard
+          - qcom,shikra-cqm-sndcard
+          - qcom,shikra-cqs-sndcard
+          - qcom,shikra-iqs-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
           - qcom,x1e80100-sndcard

-- 
2.34.1

