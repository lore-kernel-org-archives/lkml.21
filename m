Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007342;
	b=wOCCPbhRGzqpXnCz4l4N7AvzuzFVJ6pFv0FQgbLrzk+fPGjqmy1gGDBtTEHe07lq2zaF
	 sjb468e2bhWf46bZIZaNWdUCjO2t2TrzsAQNFog0NN/lX6QuN0f75L+kSZ5Gi9zmOSTJ6
	 syilQJQ/B1BIuPo9AHD13Q9KiOA4sXyrsdLJwNrbILTsCRyRGEJavlKRHRfIGWCRMjy/j
	 FWxLnbSK15/lkY9gZxytmw6h2kSmZBUCMKverjhIrYhSukWUHUtzfvk8if9QhzVfL1OaQ
	 ZuyU0KiB9VJD+T0fmqgydVyJs8fqanXX4Zizofw6BiSM2gFGG0bZRCtRU5otYttJ1+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007342;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2uypBfXz8UgmtHwzBAp3Qn7tdU0dST+3c5sXLO043nI=;
	b=EQBsVUS7wUAUPtwfjCKf+Fx8BBntCHSA+pggWQ/EkcO7/yGd3e5ni3zx5eTZc6jmUxay
	 OsS4GDoBbgKJ6Tal8sE7XH0GH+P24bRtamEml48kyQEDTDqArRRnKTYy96ZFNlND0kQ6W
	 nuPQJWIJMEXNayIftBoPiDUg/F5hNQ8alLXsbfM1EZM8MFH0LlF5wJgebauOqVWc/UOaC
	 WtdmRfMyqq+rh99vZa13dXeCTnPdLpJ84kd3ry3dAzJDN479Mwudk4C4f4Ollo0rnkHGn
	 OVDQdIcAJY2QU1NfY4mRdHXIc9/yDdNaiKhzdx014eloWtjefAi5+kMV/gdSuOBagJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T4VOQp4a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbadZuB2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8F3606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB8F3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T4VOQp4a;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbadZuB2
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICLEDK3769996
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2uypBfXz8UgmtHwzBAp3Qn7tdU0dST+3c5sXLO043nI=; b=T4VOQp4auuCF9d9K
	dBHRh2NPdzXmVqAAFD0hc2u62KM5OEl7D568svnolivrwWvMGWT4YAkLqRQKL3ys
	2ONpsT87RsvGWKuaMSSxGuCSVvyySbpvhFVJZQaw+M15oSC7M1jdg7/rdGLkVhdB
	r6ZwcAEKkdDARSpjU3xymD6vzpyeFcfjGJsWs6PVDfKkstEXieTD3yo22KeDKEpq
	B3Hjd0fdDwKy01K5vd1/AXNlfevRivlMG+/7stxrYdNKoxf1KP7i7HwXzy3wWPE2
	8Rg2caG//hOPQPoAxKTiGpawn5X8toF3PfsOVk8urDTKSgKZERlh0UNI39aM6fOO
	2wFb1g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9b39v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:09:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a0747175so175815a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795007340; x=1795612140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2uypBfXz8UgmtHwzBAp3Qn7tdU0dST+3c5sXLO043nI=;
        b=MbadZuB2rbSPtpaXPkSrm23cfxBXsuXw4g62LQOhYrYaOP54avt6g4xW9wvu7id2kI
         X7erCe5D17fb1vB5WjHUGF7ftlcPK6oVaaMuiGw7+4xRsb3bcPln6yIM4LwYTh/+qhdA
         C70R96oAzFNWKGfmqufcEfgGj27s7AvBHUCBMIZigVp1tD/0pxg4GdDp1YaXk0aGW5Bo
         yS3j/2xpttv2YBIL6Dt89Old8P4FPOzh+C1RIhZZUDizYl8Urj08Y6o61zdyGc+oB7uo
         vAS0hVOdflfzmDY/CY45M2tnWJJqoFa3R4Qc95xNCwTsDKUrbpYHwT0rqmvtoi0cFLNh
         ujZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007340; x=1795612140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2uypBfXz8UgmtHwzBAp3Qn7tdU0dST+3c5sXLO043nI=;
        b=cfsmNZkHN1qave/H3usEV1nKlcdEdTAyAcZ1ihoPz2mPfLBw+70brggSor3PepgHRJ
         ayWe41xNGVL+Wu0WR1/XtPo4+rljb0FUCB4waTXoO+J0VX6Ag9YuNXtd7ESrApBhwn7t
         i9eCOE7jfrs9eyv8/233pevL0xJg3RVhuu6Q6pJNlqVvNqiZgj6OsPYGyVortf+SnoSD
         GyzQK5UnDmI0WLBb9unI4svYRkbDhQLNFNZjuQl74VQLbY8PAIXmCpELP0+9gow169Pp
         I4WfdkpEsuqcCkuq1ABLjddt1mrY88gUfjzV08YIn/kEW8ajHbc9LzzFpLZy2lFdAC8Y
         zv+A==
X-Forwarded-Encrypted: i=1; AL+hErHzMcEcOfq9TtEEFk0fA9Nff0KRwY5yVAvEUdb5cnRiqw/4YXzb+PR+5dUxmb+yAT2/pOMcOurh5V1jkMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OyJDcz6tWH3io8smafmt/o8/kAK1xjllSqFsBDD4OlGowLbIl
	jpdifBw0nhQngvOlAcexdh8hQsznl2S7UwGs1vwSqtuVuYgODz3glS8EYqkI9EGN5+xu3u90yGE
	0VUY1atYu6rQiuXe+tFGHi/6kv2914L89sYq6iXHexQ62t7NeSWqow2LYmKo8xpDPTkM=
X-Gm-Gg: AZFdTZcakQWn0Tsj38lhdLG3D5Yf5KcOa2jEocsjZc9IUUvIM67XhZuy02I36AH9Put
	5dB7NFPeT/kBYpYTf7KcXeARArMPbTxByOkpg5a8ouMp2G5oKINe1FVhxkwGMspmYyGbLev2H2p
	tT8LGUsCPifhWQezkXotur5CT/HT1wLBV4qi1BJP+pOdtZ6inDIIX7GtaiYPWGrYsGYsu9vYJCp
	QPX7xoNXmSW1OGZxeg3I89nDUqvFS1N1DqY3H/kgHPIPYBq5bL3sp674X/uDpejNuEJHDf5Pytq
	RjZbZbvCVimRsYd+19IsIDbiJOcnrphXW4o7vhEh35KKC1JS7eB3hZm9jgTXwInrUCamZafkKMT
	XGV+2Rx21E0H650ddYd1krpkVtZWa11hfq3BIPSmEZImHgD1Agen4YtnbkN31SCuR1BtQYFE2+w
	1CPixW1Wk8
X-Received: by 2002:a17:90b:4acc:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3b3d07cf0e1mr4603055a91.4.1795007339494;
        Wed, 18 Nov 2026 05:08:59 -0800 (PST)
X-Received: by 2002:a17:90b:4acc:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3b3d07cf0e1mr4602998a91.4.1795007338997;
        Wed, 18 Nov 2026 05:08:58 -0800 (PST)
Received: from hu-pvgtejas-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187dc82sm4909533a91.6.2026.11.18.05.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:08:58 -0800 (PST)
From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 18:38:27 +0530
Subject: [PATCH 3/6] dt-bindings: display/msm: gpu: Document the CX SMMU
 aperture region
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
Message-Id: <20261118-adreno-scm-fallback-v1-3-e99cdbf3121d@oss.qualcomm.com>
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795007310; l=1153;
 i=puranam.tejaswi@oss.qualcomm.com; s=20261118; h=from:subject:message-id;
 bh=syT63WlPX5IX60Og46wRhxhDoNsMAf3uqJqj378LbFs=;
 b=AwXTBw49z4p7aFFLjQBcN1LRUTfdmns5P5yqUq3KJultc0/Mn8btNjKyQknvqqXpLMd/RFbYB
 QRYATkxT2w2CoLGoDSZtDBtxz0JBVYCOFRfjbzMfF/Oal9q7m7cP4tu
X-Developer-Key: i=puranam.tejaswi@oss.qualcomm.com; a=ed25519;
 pk=I7kFxZ7dcroo7ZWUatk8fR/J/KVbRzZq4ZBLhRRGpJo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX3/HyuyRz+FfG
 IBu9WoNbz7+9B7Dpjf6HaZqh0ZE7/5QXRGEt1S3EM02TmdgFC35eb17gGG68WvdCvTS2pDNOQl2
 uAAtz2fGyVFR1rBVJh8s3+tOiccAOVk=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afda36c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kkdt65S5UFh8r35K3toA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX/06KBe/dHl1D
 aGWFaKwqQ0gbYAxVaTie0X3RfX5DZ7yZcGHeDK0QQIE+kYf9K+Jv8qYZ2TatR8HjHxJ5OfRh5qV
 dRkBg1z7Z/IFzqHsC4n2qWCWu322e61WwCsidTzzlWiSrxPt7x1V3geaQcyKTtT8LXzJfhbVXqo
 1XzYZ819oD3PtuMZImmMOP9bTRmunZ6JWfqBQS6LO9s4J0tDpjguMOxU/fEbDOsnFdYaCRQ2Vbd
 to7tJEoFO5KhWTOF9VJ9kwiFvEtbd4lNIJyaCknesZr+DFkF9KswIPhbjYw94WNJEYr5paUNER0
 Sl5TON5CUMI/kUZm+JW2HjMyXOTqfM8MJS4lzjjnZIOXZXWFWPJMBV1f8gUOLZUN0nxtCvgdWCn
 8hTTxFvfhXqlYBQzpP9CrUvODPgTkrslfWFtWRoEXREKTswcIyoLvDSItbaezINBKp1xt048qE5
 IeEam4bPS4tfwICMObw==
X-Proofpoint-ORIG-GUID: HOXtNttUkUjbVxoZ0Jzbv8-dIlWA3WEq
X-Proofpoint-GUID: HOXtNttUkUjbVxoZ0Jzbv8-dIlWA3WEq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180052

The CX SMMU aperture is a register block in the GPU. It holds the
location of the GPU SMMU context banks that the CP uses for pagetable
switching.

On some GPUs the block lies outside the existing GPU register regions.
Add it as an optional aperture region, so the driver can program it on
platforms where the secure world does not.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 3c90a09febe7..5e4f3149839e 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -54,7 +54,7 @@ properties:
 
   reg:
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
   reg-names:
     minItems: 1
@@ -62,6 +62,7 @@ properties:
       - const: kgsl_3d0_reg_memory
       - const: cx_mem
       - const: cx_dbgc
+      - const: aperture
 
   interrupts:
     maxItems: 1

-- 
2.34.1

