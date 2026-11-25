Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627131;
	b=YZSfP58IpbQmJQkW2CbPIoXRm/TvZUopRl9gvLBa4ePkfY8RaMCmiLK6h5GpzBkAFs5P
	 D8L2Q+FkBsPZuhYg24EQWz/H8Ww7DK+kWXTOR/MOzAJQr3ls5A4BYvpHGhOPpNTK/KrVq
	 l160L5KMtl3YykIc42etVe9Wgyb1AOYZp4Y8vQfeyACH+C7CoX8wwdM/3bWA4OGvOO5Mu
	 9n3euNbPklDLFWQKdO+HU7zqJn+mnYmwWF7XJo2SGWaVJo8pIv9p+54z+fxcA7XhGmBk/
	 +GWFeXW5aZyoteJeXVWEK+Nc3iBiSZ9Sy+W5y/ABPB+7qsn6qT8HH4l6JiFVynRDFig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627131;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kI6WO7B1bFoCDY489fGVqBNmwCW+vKG4+l+43lYDWrg=;
	b=R2F1hQqO7u715JePF6Wxo793TyQkPODGA5SqMkp9WdT1KC1n8QXBjLJZHZfm+MUq8yj8
	 M9WgC+m1EbUl2ehBWnDRv7DkC/vgn9WVi/ZfGdSJdXjhIxmOAXu0WuxIibP2gWc7S+s94
	 87/0cpkyOjup71uH16xTLmGSFB5zXxyyP+hGRyr9qiE0I/rgVUqMKT9D2bNNAHa5kAl9J
	 OflMRU9VZ5GAvW3NR2q7EdcmkZzq5Hyr/I7LZJ4AxyPHPFinyhIFBplypG1o3N0cRyGjQ
	 ABWH+pUa5MYe2jBJGt567aAcJP94CHw61ZZ1MVJ8gmwb6p/zbKgSz7DvHJ5wbyp6r1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G1iJMuxO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Uve/tlz+";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6C0606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F6C0606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G1iJMuxO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uve/tlz+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQ3Dx291018
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kI6WO7B1bFo
	CDY489fGVqBNmwCW+vKG4+l+43lYDWrg=; b=G1iJMuxOVFwU03Cd0CtyNTtNVIH
	GTRSRWyKNl7IuxT2OK5K5n+6jgXAwFvdP9RT9duVZzFY7YFprSmMftEhjxWl1D0e
	bHK3RorB64CYeKdbV/d78QfLQcwMbwveuniTzA/5V2k2qHrjX4WJLmGKvtRBUpTK
	VCDliT2afRvLZdutIO+pqY20p0gZ4H/vG9sPagFmBWMZo6hOT8RFXp0ukcHUcVOE
	xXshzDI9Tvxg0RCS+HS5o04rSskTiHwyv5wgI+D9fRv4lgZEjK26KBYiAFWGqn/U
	1KYkRS9pTFbNfZLVWRInA1NEjZRKUsl9w6pXeUIP1/WQ3d1fx75Jd8Pz6MA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahrr83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:18:50 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b4dca1ef03so73618957b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795627129; x=1796231929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kI6WO7B1bFoCDY489fGVqBNmwCW+vKG4+l+43lYDWrg=;
        b=Uve/tlz+e7/Akj6PafDIkIHMQMKEIvPJhbU8onSy7EXqgLO5cSRMDA1LT3jutHFVZB
         VwyakCw7D+cq/UzIciz8xEb644HEZ4h6b2HMgwffitTHq3USpdzejhc/5fQsleRH93Of
         qiaZHboixACMtuOi/Kq4r2ux6ND9uoBRc9Pj3A/mK+m4O24+zzcCcT3Fb8x8ZkUqNdbd
         wqXpOyX/zm0yTcGntOwk8BBveEAy0CABIht01DvdKCr3nWTtvDZfKszza8UYFWif4Jd9
         OUiwF5Asg6HFsUkrA94Ste2O84eSClrQ9bJNKX4VlJi7xLa/+ScFYZ2l8UzbKA+6Mxos
         pI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627129; x=1796231929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kI6WO7B1bFoCDY489fGVqBNmwCW+vKG4+l+43lYDWrg=;
        b=ZgZ9HE4Sli5Sv//FriVyI2i6hmUKeh2XutxRVr1vgq1BL1G5j/0WSLQbfz7qPoTrTp
         mfiUEqPpMxTzloMAfyFaa0hSAhVFvyHgrqQ8Z8/q2DzRMuoMmewX7dIQPBQnguAsTBtF
         DrAM0cZsuPhhtlKRUX1l50i/zh+nv3YGx8UwbI2oNleI4763gnKaSvADY1f73hXrZR7g
         PbDk1d7vrpEVEQ/aW3IUztZ/Z99AosQMgvw5H9PBv/POovTdqA+VgUOVQHz1AcNtuOYk
         /vn+F7BgvIK632HzSrO+Wk1s4GzjSx5s5zbWOznD/gsUISynjLQSBvdzlaiHrP3siA1T
         6JHw==
X-Forwarded-Encrypted: i=1; AL+hErHJ7fvyT8NIGz4DGsnN+2/J/AZ7Mbi6pzVO+lnvm2zO/o7yuQJCot1zQlbHK3InT0Sbs6Ufb3vH6gfdw7I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B57QUkAh/Pzh5FgPW7SH0q1qXmLPDzfUpQa+1nZnCfJDUNSHm
	wVCQOMQmO/zWHoDh2EdA40FMmZw0RmTs1p4JIUCOj3M5eUL3+bpS1hqjttof/au/AkNMz1c3he9
	rw0v+8Wucsk9qO0p89sFvZTwG8ltOJNC+p1a0bVpbqzNj2bKeFUKkwTG2jqXj3eWzNrg=
X-Gm-Gg: AZFdTZdMw8LjMQuPlujI3DNplmoYjBiQvA+p9O5fd3AKOrBLvukq7b25p7k1mb4PA4Z
	/Pt9fT79XwJozIwfazgePfW9Yg0uq87p9b4DslQkLWHXTzcncFeowOGnjyw7/Rdda9cDUDSkJcB
	USHMN5+FdKT7jTkpSfN0+WttACqvKPy+TkpVJSe764xWs1i5nQC2PjGXhDql1GCyh52eVPIa42h
	CvM/I54mtZ3c6UDh3kWyJ/WvSx6r/9RJLmfQrx33TZ+AqXjFwD7Q3o4vHP8KencT3IlEcmytxJB
	yykMIWZ2VkQe8dcQ2hjpXsA5L08LJJwYbzquWgqyCPkr+GYJ1fe8g2HOH+i8fChFU5RYO11pP6W
	ztztN+tMZCThS/zFoqq+sZgFSgDu+Q+GYPvtnfMDAI+Hs8aTbSw1imvq2TfddhJqq
X-Received: by 2002:a05:690c:4d47:b0:8b3:22c:b420 with SMTP id 00721157ae682-8b520329516mr80939027b3.5.1795627129588;
        Wed, 25 Nov 2026 09:18:49 -0800 (PST)
X-Received: by 2002:a05:690c:4d47:b0:8b3:22c:b420 with SMTP id 00721157ae682-8b520329516mr80938827b3.5.1795627129010;
        Wed, 25 Nov 2026 09:18:49 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm42096548f8f.21.2026.11.25.09.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:18:47 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/2] ASoC: dt-bindings: qcom: Add Glymur LPASS macro codecs
Date: Wed, 25 Nov 2026 17:18:31 +0000
Message-ID: <20261125171831.1458954-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gefL1kRs9R6RHaFkztPU_6m8e_omygmI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfXxYMAxHBZNBdL
 c9k6SvrQKMn0oi3Auf1ybLrQJF6golWd2vbh/tHsnNMZNJZtNVfyvICSUsnN2kDEmeHIHzn8dfY
 vvN6QPuJHLcbQQ0zdpgRiGeu861ucLw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfX5OoPaf49wxAB
 qGhgmaCEdhtA4iwSxbRKxQFv6HgK60TIxX71qU+HFWrCBgneDxGMOjbyX3YyqWi6BXXL0ixRPQj
 LLMriw7zg/UPn6RZ7VgT4IdJxqK6rOq3/5QDRjPlVn7Q4ZtpDll0rkrQV3Zs4fpKSmA3ZFPZy04
 O8Xlup0rln/2oPYwI64ufelRDys6hGIL5dZZ+IOKBU1Gm2i7lF6al2XnBWZbUOd51UNKpqgyDLx
 XaLbVG1jjIe9BpTGGyAUim7/+GeIYkm3Dl7rqlCfFcuEvlBgmASdIWPaFClISQXkw2li5+SBBo5
 E8lGzeesbg7h40i8lpL65ahjuC4cL80KMHLQ5rz2MQXzqKZuC18iAw8c3y/5RwJcJLELpiw+s0A
 riFL6r54QMb5As/sIwPZDVaop3G5PxiIxZMMplNVzKYXtSBavmiXlC0zEg7doElF84/VQgXeLLa
 vEK2iZW6nadCkGZnXdw==
X-Proofpoint-ORIG-GUID: gefL1kRs9R6RHaFkztPU_6m8e_omygmI
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07187a cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=FrxuNgF20hPgSuSYAXgA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250068

Add qcom,glymur-lpass-rx-macro and qcom,glymur-lpass-tx-macro to the
compatible enums for lpass-rx-macro and lpass-tx-macro bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 67a4a9536d06..5e1940fc3e9f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-lpass-rx-macro
+              - qcom,glymur-lpass-rx-macro
               - qcom,kaanapali-lpass-rx-macro
               - qcom,sm8650-lpass-rx-macro
               - qcom,sm8750-lpass-rx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index f9702a11ef82..6f5648a973cd 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-lpass-tx-macro
+              - qcom,glymur-lpass-tx-macro
               - qcom,kaanapali-lpass-tx-macro
               - qcom,sm8650-lpass-tx-macro
               - qcom,sm8750-lpass-tx-macro
-- 
2.53.0

