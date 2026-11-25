Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612708;
	b=UiteiQW5b3MCx3NxB7wAkAruCjBwAL3mI9LqaqPCInQwwHLypP1DqLEzBcgaXxhnOPYL
	 CQd77IE1VhXqRfrBeQYrxY/76C7VFmcEzru10D7Dh7rLNqLVZ7xM7qRhpxGjIMlITSybt
	 n4cGskxBgwKdkcdpNeosoIYGpeoaqFrQfm6s3KeteABdoGjSHpOgMR92MgQ6la3udTmB/
	 dkjpDJUvX39wI0JoLZEQVBMa9/PK/eiDWONm6OCU1+l32Y+oLD1wOn+mY8/5o2PY4SLZz
	 10sNeWzLa122ZitANDceL+ri5ihhcWz+1lZ6XbndCTlJ998bUFw8xEEv9bzmXOrf+4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612708;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ad9w3TgkoIlbacQPNgPrBSZDlkh+EQgbPxPRDo3ExTs=;
	b=rHpb/ChTH6fqae9t1hJID6m5iAygrF6SOpz51peB8uFY4cnDG1fuAv4aERT7AW4pFddP
	 CEicELddZ872dgO3zxrl9FJcFiWuLJGXSzain57rpp/Ga1Rh0zGh96D4dDXGr1l41PBWr
	 1q0J9yoQQL4+hn+C/TQDi3LYxaJq1uywL2lDqDgjtu8cgOjuLLqVemvLuIOYs9Tr9eD7F
	 z+XSKuctRsYk6fwJ3KahN9U5QlWavCR8OkPAZlEAhHNbnQHE4ruqPGPWJBomgVovjyUXZ
	 NxkwP//5LZHY6wQKihctyk/5JZtbF6EHX4cCxmZfnROVNnRl9/TfXcNZQiSjCVh/zcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AoISGQwM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfHRnZqz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA0A606A695
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CA0A606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AoISGQwM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfHRnZqz
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mceh796791
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ad9w3TgkoIl
	bacQPNgPrBSZDlkh+EQgbPxPRDo3ExTs=; b=AoISGQwM+leo+9FKSlOQPI2mNhi
	Yi/0eM7RlEt+R0qAtHQrLrD9AOy2n3G+a+kecau2AuqYIsuMzovRISDAP2b/Lkwb
	ScuJjzOJzSY1rsN4Slx9Dtt3hQ+1iTdaTSxawyclV0gdWzAVwcregxt12u89lR/i
	DrQj/8XTVx2LpACft87JlrQNXVKihUWuoqMnCPNZLx+rQfIlE4C3PmduCNQ8WC/i
	O4pyxfrhHcHp+35c4YBv3CUrUb82OM058ix7Vr71TstYbDa+yojc5DvCit05IRFz
	C4H5+DuNVhkr27FVjpuidId0Hrz2snFyGSH4vJXMmnbubj8r5R3NQtmyl/A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rtueh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:18:26 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99e0b2d9ba4so4532048241.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612706; x=1796217506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ad9w3TgkoIlbacQPNgPrBSZDlkh+EQgbPxPRDo3ExTs=;
        b=VfHRnZqz4GT5hDSUTNEzDyYYB0PUaZeS+tmUCze4Zxx21c8YnKVCug2/8jYSqB7RWH
         qof9iinujf9Js688j+84VMqmmB0lxUzjPgLLfXkPreriSDod05TfYaAHP5dneD2jndGH
         R6yldT3Wr1XRyFzeYt5XOnBZ9BLznBqzNl7mG8vF7aM7ydWLlPNu8i1h7vqfGZppgPDV
         qx0lexmwsOKIy0265Df8E7ix5L4HCzuBfN2edocLQR4bQ0gq8JElDvEzhA4/+1ozebsY
         C617kx8PLEWBZ3sRK1QQf5Ef8H2jXejIw/2e6Qiz7OTrn5QNc7Dp1ZtVUufPoP6JWv+J
         D2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612706; x=1796217506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ad9w3TgkoIlbacQPNgPrBSZDlkh+EQgbPxPRDo3ExTs=;
        b=Trx12PINOgFeyVvBTefJNpambDekMu4NS15N0r4xG9YEzzRNuGhV34v/H3a71lnpQh
         It2Wj8zg7ZhRhyzsiCMvhsZdiKVaXp0uKebxGNycXzOO23oQL9smfMUYYr2YISgc9maW
         NT1ngvfnM4MUmBDWeytC3H9i73JSRXZ3lf7JXEInbamBzql0rRLCghtzqxBuOpYlvmzU
         fwnrrHjobY9KHRwtZCh1WS1j5KWnnmUzPURF1zIcPNttIBNVKQoo2iar/cblrEXrOMEI
         J0zjX2r46maLMkFqUgQ3fcZvYAsC8bNdobylr2aNE8UB/Zbu44PZfODzjzP+JoxLQka9
         NKpQ==
X-Forwarded-Encrypted: i=1; AL+hErHEc/HeOZaYXfB3jhJ3d+V//hiWL2iCHEhqnQNKT2g8GKeG0OixaUcQ+J0aGlO+hEA8Z9BJHluQc6MX+tw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LKRiqylyW6gVivWQzE25gEn8d04KVVLXnrWAtOcsm7f46Xqmt
	XVwQPc/Xp4fqjLoTJQHeAfZ8dqadnGQoXSLRuonOEAnT166hlcGcE+7uJn+Qe49+790rG1GjPZ8
	e8myLAqsIBX2j8skW/aCt8yE7BZlNHxe/FvxO+Oy4qojuqrPYpy+D5paBn0qQCcXYxYc=
X-Gm-Gg: AZFdTZdWJ8l0wCYHqAjKlNSfntrZTs5Fv1a6sVvRuF0hd0OToNbbRwnUINjDxN2R7o5
	2S7TJu06++WZD4yZI4gMx0QNJzFFKWIUfBo+NxTXHOo5KQqlNGdXaj9uXuYzBtiTTMfHYtYKzoU
	tS2CQdm+MRgrTW6QMDgMoiJJrgK8kzWbi0DCxSwCOQ1hyZnQgQela2sMbgMT8cHk13M141Gn4I6
	PGSjJmGxDcIbBASjB7xbf7wF2cTuDnHiZAgGkFckcVUTRhE2k4qzOYfKMdfAwBb+ifI/DNKTKFF
	sAVwJZwPbbvZkvtz4JN/drqzrgt22le57+8GR1K8D6rD52NoefcDx9kgdES/isZZVCZh9v+ppK1
	739y3P2qO0HhZYCiWcnTWzwU183Xb3fxFmKQ01I1n5iMXVh36doIs1jCivuF04lFI
X-Received: by 2002:a05:6122:e26d:b0:5ea:e175:b2f5 with SMTP id 71dfb90a1353d-5ee8adf330dmr10851440e0c.1.1795612705627;
        Wed, 25 Nov 2026 05:18:25 -0800 (PST)
X-Received: by 2002:a05:6122:e26d:b0:5ea:e175:b2f5 with SMTP id 71dfb90a1353d-5ee8adf330dmr10851392e0c.1.1795612705104;
        Wed, 25 Nov 2026 05:18:25 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm205035365e9.0.2026.11.25.05.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:18:24 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 4/4] clk: qcom: Add lpass clock controller driver for Glymur
Date: Wed, 25 Nov 2026 13:17:57 +0000
Message-ID: <20261125131757.1163466-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX6yQmfrGknvVM
 ExL5SXolF7p9rBQ8BCW7HbxUgU92nW4xuCaDZ3ijGaiBs2nA2or/NlRKnchmoWFDW5kWjXA3KSe
 WOHNjL0IP7K/l3c4GUeYginLDS5PhDhA659qZ9598ZGhHOheIsSXWQ8Rvb1wmBBol63UvYg2sDJ
 wTwh6HnIlf9NA/Ij3rWheyl8jayDFF1FyucjWcrD+o5qqTUv8qMaSn7sZlc+DbVUDx2jNEGf5w6
 d8UHJZNRNg3d9ra4N0CNoXjTWHL3AH6nlZAhSuTMxVqpkyyvwfllRuZuUjZX2uwWg9Y0z8Fkny+
 g+eD0EFd+m/fl6xjr7/vJkOce8XCZ25HW+QJklDgbOs6nlfUgVuY2sPg1kk7aKEqGMg5UkDtFr5
 0plCkaMsyRGgZZO/I7PPLuk93JbYtd45QCkZ1Rsg8S7frDaXaf9IlQZYmmzgCrhi1Pa0dRnGuy7
 wD7ENRjXGCaXDDKmR6A==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06e022 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=9d4qlcpUcIswrQQTxZ8A:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: J0JN-CentMW7T69vOjeDsBKMKByxyEKL
X-Proofpoint-ORIG-GUID: J0JN-CentMW7T69vOjeDsBKMKByxyEKL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfXxGD2Svk5nWNj
 VYY87g75332tD9eYfkiN/GODymQnxw46nnv17X3itN1ZEZ7p8bcOV5ZCsbHcw/3AV5MKfGUZ145
 42irdGepr6yDaBcvvF1FLMW1vwzZ7Gk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250052

Add support for the lpass clock controller found on Glymur based devices.
This would allow lpass peripheral loader drivers to control the clocks and
bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscc-glymur.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
index b7fdd76df2f5..742a88ed318a 100644
--- a/drivers/clk/qcom/lpasscc-glymur.c
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -37,10 +37,31 @@ static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
 	.num_resets = ARRAY_SIZE(lpass_audiocc_glymur_resets),
 };
 
+static const struct qcom_reset_map lpasscc_glymur_resets[] = {
+	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xa028, 1 },
+};
+
+static const struct regmap_config lpasscc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-tcsr",
+	.max_register = 0x12000,
+};
+
+static const struct qcom_cc_desc lpasscc_glymur_reset_desc = {
+	.config = &lpasscc_glymur_regmap_config,
+	.resets = lpasscc_glymur_resets,
+	.num_resets = ARRAY_SIZE(lpasscc_glymur_resets),
+};
+
 static const struct of_device_id lpasscc_glymur_match_table[] = {
 	{
 		.compatible = "qcom,glymur-lpassaudiocc",
 		.data = &lpass_audiocc_glymur_reset_desc,
+	}, {
+		.compatible = "qcom,glymur-lpasscc",
+		.data = &lpasscc_glymur_reset_desc,
 	},
 	{ }
 };
-- 
2.53.0

