Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601975;
	b=1KmvQWIOXczr6uPlYp4Uoejn3T/ibkOQzCp6WrJlRuKYBJu6rsp5VmNicq8HGK+o2ql3
	 eiP0kHUXXwHDjwsdARoSo44pxPpEtVgzfhXuFq6AON7THOvAxrc97bocxxupHHb2fzzIb
	 hUi7f6XUe8VNEayzc1A83Vif9oC3PQjVKkD6ycNASebYF2BCo5OwpnGq5nxLBDHp73aYw
	 +OgduWXJ76VbWfSF7I4Pd0TNXZqIsvLttZwcApKmTuA880emjK6RA50YmXlv02pdqFfb6
	 cAd6K1Xl03AEen44KY0sT0ev6U4ycGs3okH/imsBrgZea4SYRDnnBdBPHvayIbOL74w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601975;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=;
	b=jk5duMLawPhHjCZ6vWmKpleo3hm3VAZcEVsA4NVak3bZdwf3VZM2605F3sZqE7MzxRyA
	 6+iPShfXJm4RnW6tSSdd0Cu7SzJ+BUf1uxEoVLVCaPSAZDpLQ1hOmtF8ryS4KLzMUX9SX
	 XXSTQ66RgdePwHfZq7QFZop2nDkAf/Qh15UXaN687JUjaRXEAM2OkD9dckB2GoWJgRe+1
	 UDTBJRYdjZ8vEGO2MjcfCqlS/dCLUah8PsKKF+WjhTNw2+4ApbNDD/I3md8+Kt+wtcHc2
	 xIJ1SW9WCXGJhL9HXFcxCu5K3AiaULJFvHIZ5b1rfw/aKXOviPSFueHC/ZkAOEK7cYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5+OutYn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KxR7PlPT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7950C60A261F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7950C60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5+OutYn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KxR7PlPT
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mtSX799528
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=; b=A5+OutYn3mREg19i
	188MQxyT9blix3yDPiWVFT4yPYGPOj1PGg9Sdmn4jadzWD/4cS03dgvqEGdHZTGN
	svWn5VSzRvxuCeNHZfeUXB/EhrnGeT4up/1Q88vC5D0oRw6Nu2Ik+Ix1oGVX6Lmc
	Q1WtLxFclLQdeQygPE1y2wYjwR5A7FefLiIdOr0f8fwBUZ0gnppeBLNmp+k3J/0j
	OISnIxxt6tPCS5hmZStbC1NBfw5YJhzMt3ijJJ5RNuHfRigcctVhsmOgLK8IL1FQ
	mT5exVkwl2pQPGQzWzDEdxjj6nPImcXIE/AZxtZMbloVUBJBTsgnnHPV4GuxrADB
	JiqP7w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rt5gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9211d51dd37so120295086d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601974; x=1796206774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=;
        b=KxR7PlPTwvnJkbHBxes822mVeQq8ys0O72goTDet95CWHm/Zowc5HRsAB9p6CGakKK
         uxzZaBBVzDtzfrFt+B2bogTRxsMK/rEuhOhYVRid1SU2OqTQnCIerxinxXoAwb89T9aF
         iqVfPye8WDoGXpWKeYo4uqJYmuvJNCx7kq0DVFyAPjev5vKXBAcM4R7Iw6+WbeMKBaO/
         Ljwt94nTZ5tinXeRF4KRgGFllXc5CQxrlTp+EpAR9IEchPgktnWhg/0Fw3HeMSMr5rax
         ljmhI2TbhMAwzg1wkSL2FmwBYW4XndzM1OcNfDoi8g+5BrmqBUdRpDdv7NgQI++syXhs
         I9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601974; x=1796206774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=;
        b=c0jmqksogHRyqg0yjkANH6F5aObcJLpCcL1+qJ4139r5k4H/6afKxcWBlaKwvIybKZ
         3AxeVhVRRnh262b447Q5FWTmwpI2t4p06F6Wy8bf0tL693JGvRyK1jw/2PATNt5MG8w1
         teFeulellaKnybeLWR91y3BnJTlQqp5Mk+wiCQ3s+CWa+m7Jq/1U7Sg+goGwnVR6HWgO
         gwKxphl82fHhSpz0wQvtPmOEIz3fAAbm+el9c0ClXvterBjS7le4Nu32bd6QEiGj49wy
         sm27Q3TkYKPSI/8DT7JMS6ex2Unm/YA7p/9u5TuK5M+EG0w+JXEIcU9FYceoWyaivz8C
         lbzw==
X-Forwarded-Encrypted: i=1; AL+hErEz5MQ4nLKs1908yegHDjjcx5O9gXsE8mGG0CTH1gGRYmVUVocNZJv6fyuIAJw1nZhrPCjuI3hxSyQrkB8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/azWOSsJjdA3EFaUuIs9gbc+7RMey390Kr/CHFSgLA3WrBbWYw
	5t0RhkujVcrkZVTB9zlz1YUf88pITOyNxsfIJE0/0efa+E/xejXHIdYlyJ6hAZE5Nu4ScyH/dzK
	KQvRjzB0mXSZVF+MGNLYB/+XHmnMVzhvXl/ymihRXQiGoX4Gy/BzVHm6x9xuKW6OR1gpC82szIr
	L6tw==
X-Gm-Gg: AZFdTZfQTVb3E3qf4dJbTUC9uhPtZ7mto/gYy0RpgXaIobEYgRY3an7Iv//9T7NnmVf
	BKl+1LJGrj8T1cAhHm5vKTmEEcrPnKo4QERmjcyeJdE2JJgGWJELNOO1zbPFvJQg1xbGZib3cNp
	BqFBPQ1PPDgYyRWbCXoAtf6CsHtbsHfCPESaBH4lT6T1HrdOoF/rQoF7fTtlcnhvMszsVODc85F
	a5yJJw9wYXXrboaMKTI1QePapfTZvEYRZLGNmmqtX5Q8OSntKMEBzGqqsS9DASajPTp/QnhllRk
	LM6PdjkdevpruFSeDR7A2fcsnreyJKwi40UnnXeJ6PxOJo1lfRrjsZe/daXWyjFSuXaJjVqGPji
	3t5gDcTKFesT/6TZx6o8sDH7TlXfpgqtAVUNJD/QWYKprr/Q5lbhKDqMIXm5U1pOJCrtEsBU+hW
	kw3x0yv30BqM2op7tMDgDg/lijhISJ7GrRHQBYX1T7bGPxafRosSAp4rS5wCQlNbJavl/yP4MMM
	C/34lqOe3VcQqHu/cqoEoeeb46Z
X-Received: by 2002:a05:620a:198c:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-949ba8483e2mr3063300685a.3.1795601973724;
        Wed, 25 Nov 2026 02:19:33 -0800 (PST)
X-Received: by 2002:a05:620a:198c:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-949ba8483e2mr3063297785a.3.1795601973260;
        Wed, 25 Nov 2026 02:19:33 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm9342072f8f.54.2026.11.25.02.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:19:32 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:19:28 +0100
Subject: [PATCH v2 4/7] media: camss: Define timestamp registers for
 csid-gen2
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
Message-Id: <20261125-camss-hw-ts-v2-4-24c955e43d75@oss.qualcomm.com>
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
In-Reply-To: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX0LhxJ4/MwnY0
 r99vMlw0j7jQ3VsmbiI45luVEAzfCzY1Duv2VO4bIEg9ivNoZKrJgOvja8fBGo66rIqR1DWj6wa
 efRmyx7HsC9zI5I1n+2w6TaODCLu/flZ6dTvrWKKMNfUd22pOBLed6S8vUut3oro5Tonqadi0QA
 q9pZb/tRQmMqTQFnqL9o06oXXMg7nUFJopNLAvwYu3/cFS4/dsLb3Da/fU+xAJq9upKQOv7gxD2
 JTPPqIjDZTQ3V3epQdcyGBxflmTS1OD1S6UqjUSgY5wzFu5OqnEw/M6AwKqtL2HQ2Ln1RuMBv+z
 HYdNfKBu6mg0ZVPlfM7QKrDC3dGdLLTMX7Kh9NGXKUj20ypBlaoYAmP5LoFqqHWO05817jgb534
 IE5ffH1iK62KjGABN96jVVcNGmlhus3pjXzw6C6rQKQ1W6R2ThiBeymd7a6k3uRK3vFTH1KnK2C
 d7FGKgjhkwM0+Bx77dQ==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06b636 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=3Wk6MWIrbtHnLGL1blMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MUnE-pDAG5sEd2ToYqhZKPiwt-vbYoLe
X-Proofpoint-ORIG-GUID: MUnE-pDAG5sEd2ToYqhZKPiwt-vbYoLe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXw/nNsnxX5jmY
 g+5WTEN1/KA8Zmwh+Bf7zKJfRYFUxL01mO5RMWdKiprvqkVYnTcq4KVpUa6TAM2qmx15ujecH5w
 7/KzhnO8pt8O8vAaAL3rraoCd6hUqHc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Timestamp registers inside of the CSID block are available at different
offsets from the CSID base depending on whether the CSID is lite or not.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index a351ac4b91728b981fe80e030fcb5ebfdab138b2..85e9eaf78df75f95d5f44f83b45dc7a3633401d0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -121,6 +121,22 @@
 							+ 0x100 * (rdi))
 #define CSID_RDI_RPP_LINE_DROP_PERIOD(rdi)		((csid_is_lite(csid) ? 0x230 : 0x330)\
 							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR0_SOF(rdi)		((csid_is_lite(csid) ? 0x290 : 0x390)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR1_SOF(rdi)		((csid_is_lite(csid) ? 0x294 : 0x394)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV0_SOF(rdi)		((csid_is_lite(csid) ? 0x298 : 0x398)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV1_SOF(rdi)		((csid_is_lite(csid) ? 0x29C : 0x39C)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR0_EOF(rdi)		((csid_is_lite(csid) ? 0x2A0 : 0x3A0)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR1_EOF(rdi)		((csid_is_lite(csid) ? 0x2A4 : 0x3A4)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV0_EOF(rdi)		((csid_is_lite(csid) ? 0x2A8 : 0x3A8)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV1_EOF(rdi)		((csid_is_lite(csid) ? 0x2AC : 0x3AC)\
+							+ 0x100 * (rdi))
 
 #define CSID_TPG_CTRL		0x600
 #define		TPG_CTRL_TEST_EN		0

-- 
2.34.1

