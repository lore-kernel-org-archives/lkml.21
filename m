Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454212;
	b=M03S0j7NRFnZDjWU2A2bLAYV5+9WtDOyQAKQIiPS5+aIr0kMLJXKteAqAmffrrdyv+M9
	 NogTLu0DecblYBNsrJH90YoezDaheM2CCiUpQCNlVClFwIhD/CEcNYw+RWhMWN1bHNAaW
	 k0o70DIBglIAMxjSNzeiGcDCGdMhz8Tv6jnoe4ajAcVi/5NzuQO31sWAVIvzi4oJQQghA
	 mwYMzWx40OLzggBMY3B5YFF+ykp9+g2mOkhDhEZBAGzmTTlQO8zLazMw590dsNzPiq+3G
	 +q7SSyEtmBTUYNtMzDRQe2kPd6BkDeMA3pZ+QwBwUrfwEwRk2EWH3t1eAuVH2r3aN8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454212;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tLR8dXf8lJo1xTN0YDjhYRyI1Bduab222wL0snOjzMA=;
	b=TxZ4622MIMSnIN0Kggx0HJJT050GlH+PCILvywpEvkcoLK/lE44W2UkdmayK0/EsLU99
	 Q7eGVkR7APK43SXCatFjCZHxElXEnAFuWxqapH1vM+SdRxW0owzw9RXJWnvi6GKBWAgAP
	 KV7YrDlkn0JJxa0FR05otRj4gCdSt9NeRyTw3kkDnk+m45KcGQ4vFTWhDV1/DDgfhQUz5
	 6/FWHU818ukP2piyx+WdFX6gOAYZSoepjxTHVJjzs4HPxzERFVnIVQgPUSaM9JUBeCzJW
	 yWDVT3SDAS98mMdmRvF6QrSwg+yJ+z6ibCVpPGUL/iZH2D+isDVaPHElKVBbVCX2dfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fbcXwr9h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CL4rHZlq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0E4606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F0E4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fbcXwr9h;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CL4rHZlq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGvs62844367
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tLR8dXf8lJo1xTN0YDjhYR
	yI1Bduab222wL0snOjzMA=; b=fbcXwr9hZHK7U6sdschgttKHSMM7TSQMORJVwH
	tnl0EYUmMRHy1a5ZpUgiZzFkI7GZ5PdeKFcJvsON7U6FAUNBr/P4C+naeNu5xhMW
	EY3jbLyoceEETPilKqP5V2z/38HpaQpSEgizzGWAP9OxevKKY9ok4akTFBGBzABU
	fSVKCTbUPOSryEwTJBdyGILr6MyRYRFvkY1lFdXioB8lCE/6P/NwbjRPiPIl23bv
	5SYFP3xVPY3jHwTH1eN+H7Ko8okajf0lmrt3krf+//x3b5KPmzqkLAhOp6ZyMSHz
	TqYEARgxmruv5EaV/T5s8PYMG/I2a7EkgST3nN3tl0WLrKRg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k2j4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:16:50 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ece5510b79so2530943e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454210; x=1796059010; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tLR8dXf8lJo1xTN0YDjhYRyI1Bduab222wL0snOjzMA=;
        b=CL4rHZlqYjbWXOSy2J5Ezt25RVL3mrzDuz+5nrn96yxJycMeS6Sfmu5xi/3I5XbxYD
         +uTPRGQuVCQDlJWvkqJ21dHSrKNcy3w7bfZk6QShzOk2772sRqiKwuPxjw3PPfTcrdqH
         hAPb95/k41snxAnTUdIHguiq0bCmMZUECxjTqS6ba7n6ASHvpu7f5jAxtS9xlGeSLFjO
         8bVQ7oTUxuV1FU3UZJrwMUevnIkKByGi5H3He7QypSLPNQOk1LtEk98aHzgi2m5Sfq0C
         xYkvbX/KO/Zmk/U/O0m7cC6UEveCJpveq3iwq2QsrDhG3wAIibdNUGEc8KPLWwQIJ+yQ
         t7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454210; x=1796059010;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tLR8dXf8lJo1xTN0YDjhYRyI1Bduab222wL0snOjzMA=;
        b=lbzbaF45ukPSnwB4Wbhemk/JdTzg4lEt2NAROinEuKPeXgyCspdbjyi7eg+qo4ZDKh
         lz/n6FcoGuehsCnJpm8MiXQlxK6g9ZBSJdu+SZVEQdBPYDijtVEWegX2SBINdPGEbrt6
         ZPdOM6WZtYPcSGFx9wYh7fFBgQjuWJuEcRr6RoYXqiqGJyTVfGT84jfnpsiHQ4d3FalE
         vlsVxzBaNhA6ySoMtmfmcdaLdXx9YVz8cg2v0/efKcHxiUYb//sl0iXzfVkyNshgkSFO
         l5pCZ50hPCUbz9xcOg4fhcta+xOf+8ujqDyPgicjnirD/xpSmQdj0xJsUcVNutabEeML
         aFrg==
X-Forwarded-Encrypted: i=1; AL+hErGiUR9Npwo2oWhliPEzUf5k0pSi1cf6OJBQFmu0Z0VexYzUHrGOGydZCuZ9/K9WQRai1P3d4I14uruWCLs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ta2GkfW4ItjQg7H550e2m8HOyU1mlXxK20dPohc8DIUzJGwwM
	UOW7NVVMAkAn8bfuSzzAAVCo0Po8OPH6N4LQ0KLWJBjhooXxdi+T+guOcfmQeA3SlDBbTov7jsW
	pH9kQWc7DGgGuQxQb493q42wOFHTjA1pewTS5ytEIYKQwmI4VPjJ3gQCeWclZN9SC2YM=
X-Gm-Gg: AZFdTZeOHfr6tLBrUODyFq4q85hnt53zarhvMjY8GxPwyjoy3aNPcBr5popVQ4KmuPR
	LaclhU0iutjdnMwbKEsvVBnPOBM55JbENGd4SbIHbe8dGXlHAGS5jlQ1aUn23xKDY+U268E62U1
	csGT7j+FIh7qCDexKZMxYh6FCjFNvKgvGuSMJYdAUSxzjo+y7xzem0l26jRGrOG5UzrD1MQ9D1g
	0f/6eNac5WUM1AOpS4qF2p8QtUfb4TjuIgPzntwKiSQIYjbD5iXYbbUfXVZYFkb03REdbQR3OvF
	3TmrQx6l5xdmnabXiYnAI2qhc+2wfpOUac4bMJsepjRN2mTUhsFe1L+gdLj7hO8IlPqM8TOuwY0
	3EXfGxLAyFhUeYey7movdOMgqT7x/DaPA20C+wS5X0cQg1M1zlYE6Qab1RtFDi92okRSWpcjZaE
	X2Xsp5ePbo0cdoLRv6GqumAx86CuY7V4QUy2ry7LgQQkP8GI45KZsZLFJF7Wj//G4/imgHAvpa3
	+dPhOvUMnxWjjNcEH2TSA4hYae1
X-Received: by 2002:a05:6122:32c8:b0:5eb:7686:48f5 with SMTP id 71dfb90a1353d-5ee8af0af4bmr6545176e0c.8.1795454209773;
        Mon, 23 Nov 2026 09:16:49 -0800 (PST)
X-Received: by 2002:a05:6122:32c8:b0:5eb:7686:48f5 with SMTP id 71dfb90a1353d-5ee8af0af4bmr6545118e0c.8.1795454209260;
        Mon, 23 Nov 2026 09:16:49 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm205168235e9.3.2026.11.23.09.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:16:48 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/6] media: qcom: camss: Report the hardware SOF timestamp
Date: Mon, 23 Nov 2026 18:16:46 +0100
Message-Id: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAP50BGsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyNj3eTE3OJi3Yxy3ZJi3VQDI0vzxJQkM8sUSyWgjoKi1LTMCrBp0bG
 1tQAQ9EZSXQAAAA==
X-Change-ID: 20261123-camss-hw-ts-e0297adb69d9
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX2RUfrRPHDXiY
 i7AIW7ZkdtltSxDaZ+Gu3OkvqSKx1nGsFlORr8dmz81Smk51ErYvJIwAK8lbyXoFZhcG8Dfdj/w
 lNQ63q21xk4tRdsl0f8H0QmwI9w5iKY=
X-Proofpoint-GUID: 4tUqmXMBR8_KzlLd8voS_miayyXXmbIu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX2UQNRJdfVUae
 yPUNPsnMxVpNcqOEu+yZkk7dDpyNRDnr/5ygudxhaRt4Ei2Jdon02DWkzXlQfWq9Vw2BA7Ka/1O
 1Pw/3sfO87Wgq51SvEzyTItyx72aeZiAwFDN+0L2cR5ErTXagd4x+Pq8/FQjlYwtnTyZyFmrdYf
 Wewb/3UPKGRDfCOC2VQ5KbDsFrNF8Jb1voTq0dSLmxdTIqY8E0l6+cKKjia4RuMqIe3wDeEVtkN
 VMV8dERB0R8ROB1ht5QZLK9GI2Jx1BpJdRRWi1utZwmUqZeUxaRuB/nxGIdWkbEcXAiv4VM+OuN
 +fUC2NNRJx7cZENTxMjMZ6rCpluR8gtH6UFklIWTf1TXFf1DmsHr2PYZrYCe6K9NWJZXLu2vjB7
 c0f68fJokDicfmVGGUhE1hcGc5Xq19rD71uvAVRWIIrcn8vsOVl+YCx1X3ymMdYodl9nHvIcPGo
 X1BrLt8W3R85EobgflQ==
X-Proofpoint-ORIG-GUID: 4tUqmXMBR8_KzlLd8voS_miayyXXmbIu
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b047502 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=HwQ_xm_euLMt8bhlPuMA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230068

The CAMSS CSID latches the ARM architected counter on every start of
frame. This series exposes that time to userspace, both through the
V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.

Until now both were taken when the interrupt was handled, or worse, when
the frame had finished being written out to memory, which is about a
frame period late. The hardware value is free of interrupt latency and
is directly comparable with CLOCK_MONOTONIC, so it can be correlated
with other timestamped data such as IMU samples.

Patch 1 lets a driver fill in the timestamp of a V4L2 event instead of
having the core take it. Patch 2 passes the SOF time down to the common
CSID event helper and adds the counter to CLOCK_MONOTONIC conversion.
Patches 3 to 5 read the registers on csid-340 and csid-gen2. Patch 6
uses the same time to stamp the captured buffers.

Patches 4 and 5 are picked from the timestamp support Bryan shared
earlier, with patch 5 adapted to use the conversion helper added in
patch 2 rather than its own.

Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Bryan O'Donoghue (2):
      media: camss: Define timestamp registers for csid-gen2
      media: camss: csid-gen2: Report the hardware SOF timestamp

Loic Poulain (4):
      media: v4l2-event: Allow drivers to provide the event timestamp
      media: qcom: camss: csid: Pass the SOF time to csid_sof_event()
      media: qcom: camss: csid-340: Report the hardware SOF timestamp
      media: qcom: camss: Timestamp buffers at start of frame

 drivers/media/platform/qcom/camss/camss-csid-340.c | 37 ++++++++--
 drivers/media/platform/qcom/camss/camss-csid-680.c |  2 +-
 .../media/platform/qcom/camss/camss-csid-gen2.c    | 32 ++++++++-
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  2 +-
 drivers/media/platform/qcom/camss/camss-csid.c     | 81 +++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid.h     | 25 ++++++-
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  7 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |  8 ++-
 drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
 drivers/media/v4l2-core/v4l2-event.c               | 20 +++++-
 include/media/v4l2-event.h                         |  9 ++-
 11 files changed, 205 insertions(+), 19 deletions(-)
---
base-commit: 2ad58ca589da80990b7afbcff018777851577f89
change-id: 20261123-camss-hw-ts-e0297adb69d9

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

