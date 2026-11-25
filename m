Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590776;
	b=tDr7AYcb5LgrtewoIsIeX6Dmw9bIPq5aNs82/czj5m43fOyzSEs0J1MXzptEpesSfyd5
	 zkTtJen992C5jomjBlrQzNzQUiETKixeb3+NSqOtVAQ9x6yFf+CunuNELKMCmbGq7xIbC
	 K6Lc/gZXYZEFxrUUfl94vODPJkuLHsMXnMqZUX+XeScne5bW897Oq7a+8r0uf4xvS9z8d
	 FqCmnvWFqypnZzXAHL5f1PJxIPO8a/rnfhYBjiAd7hjA8/Ey14mHX0y6o/BxXNmPAtVfL
	 E0d++xF0vQir9mvOHEnJWglyMo+jRnBUQGzUV8Kdcbiyh43PvZHK2m0WUxTft/gBo3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KOuRmHqNmmjdF0MwsvvDwFwMYI6nn6VlaBNky8glyis=;
	b=N9n3OuBVqtbzs/eg70onmDTEOrIlz3F8gaAvx6NbR49u9ve4xtemxD6PV01cfDjQO/P9
	 1DtWIcCO7SqFv0v9ggoD5Hpf5tHHsUp5WMxidlCFL4FzFSklNib0B4Kb9W9A4Msumg3wq
	 BEoYNui0mKVFeCq8oIestZQlXTKp+DxB2YHHRxt3PlA1aQTAmWgo0fEHhZQhyQ+H/pJ4e
	 snvcRkUxEYPi4htbrBBJcizp7spcJz5wdcqDDw4ArEwSj9bXryImLPct3v/utPucFdeLb
	 FEUkwqOF4h8ykyvPykT6TF/l/ZXILWpGQqcDyFdlL5h0zHi823u+JZQx9tF9PIfWYuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BlClsJFj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="I5zSOI/U";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACBB606A693
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EACBB606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BlClsJFj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5zSOI/U
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68eVk3630275
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KOuRmHqNmmjdF0MwsvvDwFwMYI6nn6VlaBNky8glyis=; b=BlClsJFjB+bV6+xF
	AChiCcAiVqgnIN4K6l0emyGxkAfxCFXO3mKAE+afP0DujrN+EZz3ut6jpA2O1GIE
	L/a5n1lzvTx5i7W1f2M1fi/Zzag2kNPuKOztinb/Sxl7Bt1fRCFoNgZZeOyNaU8h
	zMg8rV7asXGnOAHWOOY1rPrKrFbFnRNTbn8uK+x1nP96mcOBxBU8iYiDRd/GmJh5
	hLo0UFVlib9bzhWb03xg6JtqHs6vkBgsFen6lysg6p9O+za3xXE4LsSN+vLhaJhh
	lwNLSPN/EVPxpWpNrkA97S0u9bOmm3DdHQR3g6L/GBjiek1m4LgZ0eshS3x93BZF
	kCqL6Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b8041rw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:12:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f0291cc0f2so68631365ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795590773; x=1796195573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOuRmHqNmmjdF0MwsvvDwFwMYI6nn6VlaBNky8glyis=;
        b=I5zSOI/USp8xsc1zeJcBBYYV/lkGdfWUl/919K1JSP5GYwDwv5+ZpBv/COwM+V015/
         4n+JMtOyYUJY92Vx6w1PY5ouSwtv8xw3ADZcR6hgQd0glEjEqhQxwzbSAxU6g2H0kD1N
         KZ2uSjxbg3NoW8MAnqy/kt/ELaaXo6kqtjZ5sw1iv4K5IjLX55On7p5RMviCXc/9ORVG
         PTNiw3N2LOzZai1zGf84T/G0PfkwQCcMX9WGnWmMYYpQ7wBMPGRj/K2xZfaqjI39f+U6
         0EzbQLHgtQBr5EqMUcJ6mHPpKEPiD5l4Us9F3RbUVCf0NKOK8R0b3DnkSUpMD3uRSQCc
         VN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590773; x=1796195573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KOuRmHqNmmjdF0MwsvvDwFwMYI6nn6VlaBNky8glyis=;
        b=tTfUlBceqlmMmbbFklQNSs6vPSqLfYH/fgWR+FUYnA44HHDq2PMdtXTwwB9cvHBsuc
         t/lV67SKkSk6KvCVaQ4YlAusCMqdc3jwfQwYqJ7v3dyvHG8cyZy4L8SodRArB8unwKJt
         vSnGxw0oU57jCeU8tkL+lqqZ+TaK+H0Mh0FStbDvdagias7bRcFFLkpP6Nst1ZBdPeUg
         9EIB45BLrRvA6jWMhSIToKm7/Xi7sMAf09m0b28gN9jS49/b19Tg9gryJjnxt9AsVmyN
         A8h4fdlE2xQi9IWSD9dmkTsxTKjHKPg5UU6jr4X0m3MH8NkMCO/kz9B8qUx7Vu9M+7nf
         +BKw==
X-Forwarded-Encrypted: i=1; AL+hErE0K1iN/X8/gDUIfqsTjUWXisVbBafmzutBtecDf7s9grkr7y0L3fm6ZIF2wfgr6cfkRhNWf6FZ68qfeoI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U0obnC5/LWoHgOylv8AAbcjtzedjWNmnmzmFRIKQLOwgr9iUN
	tqvopihjeU+twRR8JlyP85we46NVBGA74x/Yiw+cRF4cahi8vsVeUZr5dc/dz5yQEA5owdAkzPF
	hvw4U2FGkDEbaSzJ+0CGU8eCPLET74/4M7zrcL21BaJMkB/0QYGH0Bgr1CEpmODg+yleP4NI5Z6
	k=
X-Gm-Gg: AZFdTZevuCrODagpLlfY9P1Zs+vDeTZxxlp4UeGHk0xUQYKAIE0NsOAXIJWVgZBXHKL
	Kt/9eD1gaiOd1O4D6uSFWyFhR5U2FcUYuTckc/Qd7w617BB7m1afvJ+ia2GMvUriJLmOrR+K0hn
	si539XFNTQN7VdXPoAh2Z3o3+W2P+6h6OSmZc59IQ3KSb9jjAmBlFlTCkZGgPuvs2o1WdrviNEL
	jkObNr9/pt7drdFIklmqS9gSRPLESY6qN9+0aCQEhvkJdwuyT/UNoGeMt3L/MysiCCQXFdYF6S2
	qk9R7VNfiJtp1wGstWKHvEV1fpaw3N8KJU5OUd/3AzVtlPbTOyXsT/NX1ng+oci0vJnLIrhUOpx
	FunkrRVDS8j5OlWxtqksAiXn2kOAAoCQcUCZShCaaAZh95AHFJ1r1hRMbXjb+agOnv9YS028=
X-Received: by 2002:a17:90b:4983:b0:3b4:ba6:f712 with SMTP id 98e67ed59e1d1-3b41c9988f1mr18399575a91.60.1795590772847;
        Tue, 24 Nov 2026 23:12:52 -0800 (PST)
X-Received: by 2002:a17:90b:4983:b0:3b4:ba6:f712 with SMTP id 98e67ed59e1d1-3b41c9988f1mr18399550a91.60.1795590772381;
        Tue, 24 Nov 2026 23:12:52 -0800 (PST)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0575d9sm8224496a12.25.2026.11.24.23.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:12:52 -0800 (PST)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:42:41 +0530
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK board
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
Message-Id: <20261125-talos-lyra-evk-v2-v4-1-73d768714a5a@oss.qualcomm.com>
References: <20261125-talos-lyra-evk-v2-v4-0-73d768714a5a@oss.qualcomm.com>
In-Reply-To: <20261125-talos-lyra-evk-v2-v4-0-73d768714a5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyOCBTYWx0ZWRfXwQDC21ZUi96a
 pDulVgGpp0yGznTOKB9jdR3gZ4ZtWljLBSyLcgqGy/K1ZXr1OBCShod4+SyB3EHE+umwdRVvJ6N
 HbVuNx2PCYZ+lLWydG1eiLsp0smopApSvqruOGPRUscQuPW7ClTNqVlBNliP63rxfWIF0+e2hZI
 i+lR18ogbKr1aZFprMSCs/5YnHk48S7xJVQk5yHZeb0Sybxo0AHGKaYREUalQkO4ZZlkQDpdvul
 fUqjg2Aljn0YEdWDLblmWd4yu/jCE7HcEQ5An0GZG0MlFiyEZs6tDsjc9zEglamF8yxDNe2r5Xs
 zigeLZCXjmf3CdmP0h3HBj+IwT1qsPLiPh6OkFZwS0jrOk/Ya/etKoWWKisyR+XsP6T+c9V7bQw
 TgbDNcjYFYGw0LEmXA884OqF9cNmkKUNMhW/zdyVPaxclcVDCBM7YpU4trBDsJ2BNkY9tZPyiX9
 fzxMc+9RKec/eElYeSg==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b068a75 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pcj_qY4RVFpoKUdRnfIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 7LHdTl9YfS8E4KZ5pOAtHUYVoI_QzUjG
X-Proofpoint-GUID: 7LHdTl9YfS8E4KZ5pOAtHUYVoI_QzUjG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyOCBTYWx0ZWRfX/3iqKhmzMDrg
 nOb7dbe8/sQzASP3+mgBdNvselTPPRFDF9bOiYb7mB9S52gLHZBkMUGG2SXNDtSYGhnAzwVtXAP
 kz0gryvCCXT9/+MaUbekZuVfkbnpEEw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250028

From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
board. The Talos Lyra EVK pairs the Talos Lyra SoM with a carrier board.
The SoM uses the same QCS615/SM6150 SoC as the existing Talos EVK, so
qcom,talos-lyra-evk is grouped under the existing talos-evk block rather
than introducing a SoM-specific compatible.

Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..d0e30d6c1d4c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1089,6 +1089,7 @@ properties:
           - enum:
               - qcom,qcs615-ride
               - qcom,talos-evk
+              - qcom,talos-lyra-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 

-- 
2.43.0

