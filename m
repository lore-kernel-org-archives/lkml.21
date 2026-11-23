Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471137;
	b=RthuRa6cb1kylqZkjyShoQ/xTp2fKgGI4jCUX2WiXxvlYZ2iJtz6kR5xJFZGXUv0pKqe
	 xmZKEfKNImeq9ke0L++3kgE/zzs95wHR8WWJE7ADZQcj/j0gBE6X7uMOkI9A3C57VCb75
	 Q4c3q+igPrPaCaw7cTeB/EGZtsEFOq98q2jY6pszulooKB9x8EAJZQ9rMm7C+uYDAFpMs
	 Bb2M9e9mlN8REvOKKJ4lEEUSmT/Mxj07nVA2qRehvN9yC8d5Q4jZqSi5oSjQUSnHwz83d
	 7AJLuzHljnYrkI85IINAFOhmPu8UHJPtxOX0j4i4QIzcwHLzd9/uO2mYlmwQBxLVFhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZhJLNJcKZbLsY0YDb+VkHdgB3v5oyd24NiRj9juvaS4=;
	b=u0JGKdhK8VUXIRe0C+VId9fYkb3dDtFjCG9ge9RvJJ87IgVzlySlB1oUTjyqE6tHRvJA
	 K0t/i3iXYsov8dqOYO5pwj/3yRxN3ixNS9vdfmbwawdXX1m9qd2x4km6rjLO7R5StlVVY
	 HzfCAja2bRtca0j7Tkn1aBnlayHMMXLqwkvrcLFsppdw+vXAyEfjEhI4BW7zGfyBAO9Qy
	 nt8/M5l7fHkf6fPXmp5UlRIYDlM+VWO0uDdXGiqNZLzQrAUAGooeEdVavzMz6l2adlixQ
	 oY+/9WdFclOpPGqNsBwSQN1LC+sG3WEwTV6z3kKXME52nXCgP2NulgmTzmf6YrCn6Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=psuYqVBR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JaoC32Fi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C181606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C181606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=psuYqVBR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JaoC32Fi
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuT9L1332599
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZhJLNJcKZbLsY0YDb+VkHdgB3v5oyd24NiR
	j9juvaS4=; b=psuYqVBR1Le/k7GjYo+7UDgGpgVo68ddmtTiiEzhIPNF7FccNAQ
	bX+fLHICxApqlQl1RBqBTR+4eEqRUKBE3Un9CkdwAU5HqHPgIgw8SCM4+fncF7S6
	iB+8P/xJqMOjCdIFfnVEiCHkoHu8UGn0mPdNkuLbPWBhpBNQyfPMhCNLNgb75NeA
	CMNGUG/E7cusRxJ6hmL2azPxOzJ4qjY4zTzdhM5QZBDKfhuumS0yJNM+P66xLnxW
	SeAeX2UjhvXRropOYCxMvNBLS6h8eFlBKWi50kmXxtsIg9A8qhGHSW5gLZSwLdnf
	jY/QQ44I7+21N6H0mwpBTIf0/8sh/x8iGXg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g743ngm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:58:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-948d83322f6so95511585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795471130; x=1796075930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZhJLNJcKZbLsY0YDb+VkHdgB3v5oyd24NiRj9juvaS4=;
        b=JaoC32FiuYQaWMAz6FufKNRNWNVrR/YM03bMA4w/Ds/6kAeTkMUb2aXMKaPHhEyYXB
         fb1SGibHkwf7jSEYFuQfBxpbI2ncMyOgi0T3SD122Qx8rantsXibnwxW7jd9MswOd6G4
         vHJmCaKRNPiQ6DTQQlHICMyu/LmttFxgk2XqiovtslDhbxhqwtjXfoUXSdgzcGyT4S4J
         LnD9JxFHWiU6gZZJ6A2nSJWzD2/yaZoM8ZOfMERcWQPr3ygcAWKj5PjaxGSHggfQHZ+V
         VAYNrBR+BAStFGdTuMQb7jlPBcWPaeY5lXxidq7rKFJnQPhiqbnAFp8NGvBYj+t/z10H
         7C2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471130; x=1796075930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhJLNJcKZbLsY0YDb+VkHdgB3v5oyd24NiRj9juvaS4=;
        b=tFLezxdQ00Psbf0v4IfQkbr6LAadGLIvCI6WZwx6vbDKHil8BWZTuS5VNNm5/wghQP
         /AG5V0dF4Ft1nVmYU3i1XkydbwflIQAR4ZvfqmxLaUIv1XNt0mkicJlOSD9tyFdbxYLj
         zVnkuZ/8wbiMgbcQKQLHqch/NQHY2iQA/CfOHC6c1Iv6ptNK0/GS/L5N5eBdKFcCdyFj
         70kiPV76R1La9jhhWM9MyEskPpRCEJn6gZdFvXWGzTXeRnGNo/n2P8hhAPhs9nQ9H73A
         lR+Z8GynUun5Mj0yDt+m45niSxfNu8q6cH9kHPyXZD3GkNlYYMuEgDh9ESf4pmBHDEnL
         scYQ==
X-Gm-Message-State: APuU4Z98xsYDVIOJhfISVs48w5ejyl/vZrsKj7j0D+pRm9ahNT9L/tI4
	8bfy0otfLvfFHXRELPeEsZkaYyNzmrwY/DrchH85cOzLsIodosZb+/5jANYBiZPiMhgeqHVKbkZ
	SqiTacaVYnZMyd9l4TSpoKNHQeYUOMNxbtKgEdCq8ANgzwL8nA8sEWmmJNqUu8sieuoI=
X-Gm-Gg: AZFdTZe0L3ZqbvL13c2g/aKzzUQkL6jjJ0VaDIQctCGebAfAHt3EjTPpW8KB+uA1kB4
	nwBvGkxDOs7ASkm8spaAKeQsGXakDN5vrInlCEQIzAbCh7BGniQKzVIxs/DDPN2PLFzv6WKwi6G
	wOj6qw6S78LyknfWVKCoB1jnc63SvERAs4Kf1nvz5SRyBxBCfJ8Bzy/ZduPa+tZyTJnkekDSkdR
	zqbGaqvSps2DarYcieNvF8rqXdAbTWR/p7TKgH8ULUHaOXTifRyU0KJz6XBnLcrBjAfCfzcCW3F
	NC3vx9OG6AGEmNpGwgJ0yQT7qmZJ96vAdlNi6Svk1sgluFAfG2zB9KkySlQQa7XfyWhQB7oWkUa
	RSxthBbLchmVPTUxIP6lKqy1I4TItWAZXxh3ljMFjJiuS4on4Kf1l4NNIA/X1PQ==
X-Received: by 2002:a05:620a:2945:b0:949:6f9a:c049 with SMTP id af79cd13be357-949ba9e3599mr2252987585a.32.1795471130462;
        Mon, 23 Nov 2026 13:58:50 -0800 (PST)
X-Received: by 2002:a05:620a:2945:b0:949:6f9a:c049 with SMTP id af79cd13be357-949ba9e3599mr2252985785a.32.1795471130003;
        Mon, 23 Nov 2026 13:58:50 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm429427965e9.10.2026.11.23.13.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:58:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: apss-ipq5424: Drop unused qcom,ids.h include
Date: Mon, 23 Nov 2026 22:58:43 +0100
Message-ID: <20261123215842.21088-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=724; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ToRKlZq1pk9x4im0ALS1DipycJrxyesaHb+41j1K1NA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrBLcSMCvKFt8TdaQGFobh+duQ2nZMApKUVShJQ
 hvMrMi2DoGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawS3EgAKCRDBN2bmhouD
 1xqGD/9JOEyvFuni7akDb5dt1QXTR0np6H57ncZBagII21D7rcXRzD4+TIPNPmpxr3Y0PAzFVIW
 M2QJhdw6urv32mukZ7JlRyoKudF12/0pVOJohf7QUF/XEJ9QTkiWlU8iDSIPoIoQpvKghCkUgcS
 MB2Z9NGtevmHySoTConHe21t5EY8nff9nM2Ck/3H71jKGMdTiGuRmb4LU0AE43LFygcj0juYk07
 O9mcNim7izdYrVIWctleLqSjwlxyfzkKrWQZ0uqIDff8UYlbfjBCQGGisiQnA1ANzNe4XYUprMi
 /vr96/SqVH5eheB2uivofX0/pQF0BPSxRclRLIBXM5j7YU9+4mxstvlWimK8bQLO6pzdMa4lvjb
 a2Sq7VZETBYHGPtf+xH4WOiMyfSRVEKvs9iK04BS+0djvrvvDwuPBm/0+aEa3LLCNniUx1m6Fc8
 qBdOpnauMygZnniW/A7yYE4mXb7Gmij4YJTEHighPW3U5SE1QujDotFy1iuqlQkT1vvkGVQ5XSx
 tJJF67YVNP+6UCjgcrdmOoBHyt7kso1vTt8Wy3wXcFoxLuCD/a0DmKd/e5rxffQBSPa712f1o18
 fV/xOU1lzxXrB4Vsu0ECIMEzwhkA6sepwZJV4a5ncZAWCavUErLeL7oChEgF8G7g5tpz5fH7R6P 6lR7au6RYzNbICQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EMUKhBSOA11_zqeHN-5nn4hClEhwnSrV
X-Proofpoint-ORIG-GUID: EMUKhBSOA11_zqeHN-5nn4hClEhwnSrV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfX4jFl/vNApTNh
 d+ScjOom4NFhfOTiELcroMxMqB1s7Jygal9Kqyl/atpEQx/wJzYqt3zUscKeWr5aTW5oo2M+4RA
 GUSh8XKCsVRqb404r7NhZtsiHnY8bSk=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b04b71c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=eshxwDXe2nWDVXl-4hwA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfXxwAQlMJcYTKP
 0n6FeXZSDIRmxaFRZ1GF0+ZeRNEMBD0/+ztxDHG2fEVORLDGZKoTWH1TiSX+lYFPxDcWnYZ+FxO
 iBHCGT7XhzoAtqwem3DfWvyBnJUIMX6F/UuMk/6xExwECf4HVnhB9WpdWEN1QY4vCf7FEd8LMPq
 Yptmiy8I5wLn4HsHUoC7xpQDvd9BMsHI5IoHa8cg4XLZdc/H3svl+AqpAQm9/cBkbIeU2hVVZui
 Qcs4yWkUHiaoGTgoIuJibd5u+DRPS1/indb5oNwn79tP0QS6wSjBkrg1AuoUdv0tetb2CN/+Z5l
 njUHvNHyDFBtTZdgXv6ha2NpH9sungfuScU+YACojpkRXQwCnBvxuYn1fj6mUQwl8hZKhEoM+1P
 t+liWxu2QrG/kWmj+x1j1ufn7inqbVM2Efh6KFkAiHYqFSRqmsBco40n7Fma/+2NjXKhonMFtSE
 np7hqvDtD/4dLCYKkIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230087

Driver does not use any Devicetree binding from qcom,ids.h header.

Suggested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/apss-ipq5424.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/apss-ipq5424.c b/drivers/clk/qcom/apss-ipq5424.c
index 1662c83058bc..efc9e08614b3 100644
--- a/drivers/clk/qcom/apss-ipq5424.c
+++ b/drivers/clk/qcom/apss-ipq5424.c
@@ -13,7 +13,6 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/clock/qcom,apss-ipq.h>
 #include <dt-bindings/interconnect/qcom,ipq5424.h>
 
-- 
2.53.0

