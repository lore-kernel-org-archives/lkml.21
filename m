Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454218;
	b=N1qqkTXDTnIVnU5KlKNK3gSRb5YaGmL9Iq+c9qJpIYpf5XgPrXBLfw+3P7vMmXokvCiG
	 0B4bOTlVox1dKht2A5DedcqGpjUQIfSkYLK6lXH2PPZycXN1IEoDb3kxlJytEZZ/VDqJy
	 H62sYYzD9ujf32Gz6oEgqUWz+XQoGK6kj6dap6mDpxZYMVVJM4qcFt1siUGrN2r95LvJO
	 ltljROuI2H8wKeK4+fPEu0ewlStZKVNv5k3L4CjwJXULlBjrmwlqCpu2sZq25qy6N11SF
	 eYrHH9Wyq4D+kZ/3ZwvCfpGOAO6GRcMg0ZgwFuSLQV9507Sx4AEZ1WCCx5LjXXflZ6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8w9TqA+d7eLPnWNB5c/fpf04V+L7eVMyAMcjLo2ncbM=;
	b=sFZpy6ryUjsqRrf0fdlepufnR5WvJ/Vghsb2lSQMzkfrIcyTt+kU+DHbx3pMc8pEGUMR
	 QFey81kXWd/Gr+bzKEaiY0BGg4WakC/7gibQS1UMMNJprU7u36rhKDX/yQ3cwzAdRrPHX
	 BVexlcg/3RC8FAkBXSoqAtZ3FU7+9Mvh0LunP/9CIJ0LPry8bpJgyNWHVlGPFO+MQ0orj
	 Neo1rqvJ2ipMjEbmDJgB9RlCy2U7NlgZ7guweCXd6fF++X5s7ttkSe6e2SSBNH4VXZDdW
	 KvxIFFOHOKu2dVH0MKv9N4QRvqKnfZ8Km7Cyw+k1brU7i5PMstW9MUReYDxQ7gOd5Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1UZspcA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Htg1kg/9";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40558606A6B9
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40558606A6B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1UZspcA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Htg1kg/9
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH8Pc2769576
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8w9TqA+d7eLPnWNB5c/fpf04V+L7eVMyAMcjLo2ncbM=; b=Q1UZspcArDdeTUrb
	fhS9bbV/smsZy07uxfcgo5RgdDFDMhLin8FCeQY3b3uO1aXMyY8VvQH5u3A4fTIC
	dol2hRGsRD2UlfuZZJENUMNz3D/cPD3YRgXsqy9/fdEsUPPo7c8cEvLvXygdGHKl
	d9PYwFmXZcL6j5gj6vMDmaNJanE4yzfhMMOEW65ULlNvnoFDBirOMWX2EzEvFWs6
	6kLMzPQPajentGBrUDZNwhKqJ3WRIwkNCWXoVDVJoE+ygAg9SMxId8PkDzcpaONh
	C+9LCROVRKFVLPzIAtjAfenLgMzRLin6ESDkNGIuBrj0s1v/wQPH+aWAn4bbPuU/
	nDJtwg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pagxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:16:56 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5edf86a8c00so999698e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454215; x=1796059015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8w9TqA+d7eLPnWNB5c/fpf04V+L7eVMyAMcjLo2ncbM=;
        b=Htg1kg/98zLV3Guz7jIs8+QV27FCJIVAom4Sbr6FuOmku+qo9V7p9SZ806Vay9pdJ3
         aoEDxTP9Q1R5YFx9yWVrSinhvyo6+NzpkQZeSUPFV2z20Te1GUFpGrgG6nP5Ub+GX5Dl
         vf47xXiIpb7lmNR9FdYaBDgZucoKP3R3FFZKhyZET/W3h8YYp8bHyskk+0XuL+in80Ds
         R+/2XO+DQBmFQ2WWEPkWYC1MZkEOaIm4iePg/tO/gyVIvYJjjuIhalJMos/P2oZvotFk
         Hk2oiCRZkrTovkLs78iGaiVLcHd7q7w59Ss8IHRewog3OQpxrSUlcyU//eDjZfYDWigd
         2rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454215; x=1796059015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8w9TqA+d7eLPnWNB5c/fpf04V+L7eVMyAMcjLo2ncbM=;
        b=uDgLtA7Qn1ZUIe/cGl3l34gcEcYSoh2Cm4ywZrkhpx5uHQHEtLMpZEOOjCuydIqhbm
         s731awwej7VnCLNgdmbV7PPpPPfsZClRXyFsfWfnW9kNRkUr6EB6twp7Xda26OgeN1jS
         pxnwIw5wIPF0n4bBj1d2PXvcJ7aOJYfFD1KU8kMLON74GfGRNaqfDmGjcghkRv3i494M
         eFBXP5eLOac891YA4Xz7Z78uFGLPfRHubuMSopjfHL6NZrjHaRSd4mvQeAhrr7KyGwWr
         ctrxhG3ZvFdj1CsOwFNzlRtGVuFX7264rfjbDKC4krymkGdkriLpHVpGTxjlquFbdD8h
         UCPA==
X-Forwarded-Encrypted: i=1; AL+hErEjaczUlOc5yyjmRzNLL9Yq8OCuD/pFsdxD5cnE8XXfoweJ/RSrIHNZlW8E0vl8PTUTZml27AIpAcV5wDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v4/5ge8XjN8Yye0Fs0vmoGi8WgoGSoC2m1EHvinP4yvmjVSof
	3glkx4FEpNbRUVIHh0JZRGUhS4R91/9YBAWnzZWafY1WKP6l8kqkjhHgxUrtAlc8MEYjidTpeX0
	xp7nhjpyHrxHtBIzOn/UKBxMU9PqiM1n0G1BZKSxQFTIwEYoYiLNaj6suNwlNuLj8jEk=
X-Gm-Gg: AZFdTZe38Tc30BjtK18/UQbC1Ueke2dkRxUVaCvWBvLpBhmNihxesnXYSwfy8stmh2b
	uvrt9Rx8PQMfWdGPL9kuMvFqEIKEiojAQS+vXf1pDzIix2eVAcWJf2XsW+4DLSu8WrilOCZh+1h
	2216Pm8bR2Hyt5gKAew9JoxoHw90tJ+PI040HzFw3sc9syWatT0jTNFnVMsXqDqeohMclQ7i7iT
	cM7vbpl8ry84VAoay22tj3LDtBGu+BfgeE/A3iIKjh5jHg4ANU/mtO8WvvqoVxZf5qBOyz0Kxfl
	ec6qbTBhG04j2REQFAxcBX7dVciIASG1QKHjXKezLuVU6nJgeMdzDqR33ibyYOyveQPhDPW0NRN
	b470uV8SnBbfqMdkzWbmndNOH86dmNCAR87T99ycfvEo3/zpArvA29wyrson4wMr13t1gC1fOFz
	3NWDO5iiSwLAgztg5aJQ3ZD92B/bhT9rsVF221cCOzwMQXQ7E0rEZPSxKswzCEXb80cjekuzJfz
	vVbAMfvFaNDKBNxyC/KsOISACf5
X-Received: by 2002:a05:6122:21a5:b0:5db:4749:1737 with SMTP id 71dfb90a1353d-5ee8aea74aamr6082453e0c.4.1795454215440;
        Mon, 23 Nov 2026 09:16:55 -0800 (PST)
X-Received: by 2002:a05:6122:21a5:b0:5db:4749:1737 with SMTP id 71dfb90a1353d-5ee8aea74aamr6082167e0c.4.1795454214663;
        Mon, 23 Nov 2026 09:16:54 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm205168235e9.3.2026.11.23.09.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:16:53 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:16:50 +0100
Subject: [PATCH 4/6] media: camss: Define timestamp registers for csid-gen2
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
Message-Id: <20261123-camss-hw-ts-v1-4-7b62dda6d7a9@oss.qualcomm.com>
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
In-Reply-To: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX+dzUtPLIoDul
 qOa7IbNN4QQbHMSrpIsgOLk4ZgK+VzhmDpImaLW2EqAAehg52DgbLVYrnJLUgaDQz8Ywt1kScU1
 mc4ZHIkybeMiKXCEE/CPbmKsU/VfxQHHBpllpV4KH9XWqO/R/KhbAlnawg46qUiC58tDQXi0TsX
 53R2Nh5iS2CTtKKytDVeQJcPQjNn+6diVXdwy5/QOBbdy/QAW+q6jtRkhDApMVt7GyvPyaBjfDp
 rpW8FXvyRhtAPiyOjeRveKmef0VWsn/hNE4ZiadDFieBoS87Ix1FzT9Py1F6KwetTAUiBqRCuEp
 qrd7VQu4+RiJXrhOI5bxiN9DgHBVMaFakbCxIEnZOmr2FKwIm/VUYiFxNtNwbTIi59TbhQponPD
 F7iEOdvYkY1kMVUJm/8jt6pb+Ch04gLczCGH6tMUoiRrgGYgH16tS7s8xVjMSEHWCi9xTrqFBcx
 WHM5rWKQF+lKi3NDynA==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b047508 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=3Wk6MWIrbtHnLGL1blMA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eJvYmjnVO6usQSeFBgBb-YJW2XY7pyH0
X-Proofpoint-ORIG-GUID: eJvYmjnVO6usQSeFBgBb-YJW2XY7pyH0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX8RTlqw/tX2jC
 vaJRhPpzIvSidkG1JTK9q+ECAoQ+g36Isrq1YCZ1IgRIffpKRcUtCcUYS7l50DG8Ywj916vd1oi
 Ha1sW+ThOS9Jw5P4GLbSO2xlsMY5qEA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230068

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Timestamp registers inside of the CSID block are available at different
offsets from the CSID base depending on whether the CSID is lite or not.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 72f329c2bb1ddeec96f33c21198104157c14a73c..ac085ede704653a532aa1ab77b2845471d1e6900 100644
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

