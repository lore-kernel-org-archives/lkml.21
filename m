Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166456;
	b=mSrlKUPQY9FW+KsG+7n5TCQGljSflTHDNcQJC6UJ7aTha9sfmLKwnIMASNzgU4ujZ6Su
	 V2g4dsy7gwlyJoSBDOFmUwA1jGAjpyHhDjtDzFBCUF1sZk7WjAbSmlZBU9N94HOhsJ+LM
	 NJhns+bFnTn68V6ZJi2DnMuizqJJ24RoRxSLUy8/dntghX2RRIKP4OvQkvsdTFjGGE5pP
	 4/KMXmCBT2kI1fipVH4K5TmTYMrkRTvBvWaqHa7byIb0DXxY1PwUuE2d95M+x+ML3hWu5
	 YV/agV5E0/nqpzGOLgLYXbi3fGY2n76dNC6YrsZlF7rbQy7At+y3g0Wvnb3T2dQ2Tlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166456;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iex+7DlCxfokNUjvAHxZkktzzR0JIxIsqe0F0xKUMZE=;
	b=oKtmP5O1/u0laVgVkf8iRUSlNApXxUEyZxffP4jF88+db2vOpvVROqUEusI/xE9jjXkY
	 VdE/dH0MMJNlhEJofO9PK05tS2Pgp67UwNFaUTy3Sa5xvWcmqbeQVLu8p3HFYYdupnRdk
	 vqqlcq3YaW4Q72eMefmLeMwYOOol0F/GSOO8AtUyPk4usACgAB/+nIX9w8bcTmQ9WVJ5R
	 PiP0eY5/7O7WIer2V7uzrHxkv+U01AmyQdtTPAoNkK3Mf2R+5EYMfF6RAVdwp0k4YgTxe
	 VHCt7fjkJTGTBOHP1g/0SNqtntacJ8lWZM1g9yv64Cmtx/b1Za8mPm3ClpuRq58BNZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gmstM3Lo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NPBaPM7+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857AD606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 857AD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gmstM3Lo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NPBaPM7+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7ewPr605986
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iex+7DlCxfokNUjvAHxZkktzzR0JIxIsqe0F0xKUMZE=; b=gmstM3LoZSHfV2dJ
	RxhiS3yH7+zvUjuisiI0wiiUUnhRzNorX7xavBW5WERpLyqXnEJDOW5/nB1gD020
	J1sSEF3PTENuZ3v0qr0yeekihpL2Ld9+leAuVYD1Uf68PzRfrG37HYp7iKnRtFoU
	m7rAaPKD1cknvkazujrQoIQWtc9Z9nZtA0z27cFIuOAP5z2Yfve/38J0b1615PiF
	MRc4RnLMQcWS7Vy4nJYdz3RC1aqkfZoLf2icfFPoDC7gxAt5jKiz+YydCf/q4AhN
	XL9xOytGNNe3jYrVX7VrguYQbgAVSzDXFqsv0lBYyd4tlgT9IxOI8ZS3o5zdZ3zH
	m//vOw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrt3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:20:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so707618b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795166455; x=1795771255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iex+7DlCxfokNUjvAHxZkktzzR0JIxIsqe0F0xKUMZE=;
        b=NPBaPM7+9qOBTiYCbdvXQ6+Id0ygje3QTGewasWOmqlWXxYrtUYINfpSHq0eQc4qEW
         QB8C6KXx5FdY+88TKvSLIwJYFIvcrYDsz7GK2Uaz9nUUjbydHFG/qh76Fj6r9cMCl03N
         /6PLzHeASx6UbDyskIkJz4SlDFFo4HuanFFjL8BDAHHMkpg27OMp3gxpwauFilc75ZiI
         ceOcHsvZqBfKHJmjigS1B11fcJr2cuL1l1Ks6K+3b7tO8vJFHx8IRKd9DEyBw9QDEzXd
         5+rKGibKHfUSS6hriTa4hENBw64edXeCzgC5H6DpmnD8uv+S+ADAGnfx6rs1VkIlkUWO
         BccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166455; x=1795771255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iex+7DlCxfokNUjvAHxZkktzzR0JIxIsqe0F0xKUMZE=;
        b=qMTAPtgmrk75NA+SzTMWlG4diT/XuUGcmg1aE9r0IQTcafhpQrtTKNXZDtDz3oO89+
         I/wJNZCteNfqDCreKg+Pt7cMYcbqKD7ae6fO1lrgIMRBEicr1wufBpxayrsJM04TfdZ6
         vt4MYDB7VfFvxH63+rkKHoxnmiPomy125FGa1dqpzs9qkOvs0KQTo/qiXKdV4pCFuNau
         aDL5p1G8seR3dvETwhLt7IIQSs1sVwfZofV7UA8FtaoA7Q8KrzamIwFEbkPO2GhCMVhH
         l9VKlJZl9VO2+kffKo/jv32ZYSWJZhya8O6gsc6UM3/3cFhrdRy9SrvJU1GUEn0+mdNI
         1gLA==
X-Forwarded-Encrypted: i=1; AL+hErH8CbQ208glmva3jTKh5uJvozBiQo+Ap3Pamwq2k1ACJN9Q9iTYiQtKZaVEvvQ/gvBQDZnMdZQilBhnewY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YXBcrDrTdQhnDhsPcJ9anafLVwmygMjARMCbjfnenUXRHmwLY
	FHk9qszdwFAhNKzNh+/JCA9kun4bgLi+FIi+yW+BKeDdC9oAiR9yJk8WQ7Up73hQIsa2ENT08j9
	L/+0OIJ2DzlHF43v8SILumwFJVdc3P+VlMEiCg2hxnW+UIlJBBpHqEM1Ps4OuWzkfuwg=
X-Gm-Gg: AZFdTZfJ93CTAx1I/LoUU5rdj4xXgvw9WcJ/aCupKO4oIwrDspfQKQ5+1K/hzGWvVQg
	kXnndrT6q0JFNpjRcLY3ebosyVh8sM3iUXsoW0vuEVWeyoZp8v/HqddqMY7dW4K2EWvXZ0tgebz
	CfUKphOasfio7lqbkrmn1ySsIgq9uDB82uoKq4jWkuu1VX/FkRcdSy2TL0srJmFfBODVEYUKEMP
	zbSk2zTQGu73amaSOtXns4r/kT8Qa7dNzNBH7C3/pcSdgKbKYXhRXIuRzMR/u974vAc3rDAcwrG
	2lMfAgpLMaBjluvMUMGhNa7hFtrZjqUuEM4fszO5e5Wf0ELfbYgohEmFmlJWfBtuAbkxrjuVURC
	pENQTnAkj+ooiuzjz6THmfvJkYm/QsA1iMBqYjU5XWidwpVkNga+/Xyqvv3Fanu5hOACW
X-Received: by 2002:a05:6a00:2888:b0:89e:89f5:18eb with SMTP id d2e1a72fcca58-8c87baca1a4mr2848586b3a.15.1795166455087;
        Fri, 20 Nov 2026 01:20:55 -0800 (PST)
X-Received: by 2002:a05:6a00:2888:b0:89e:89f5:18eb with SMTP id d2e1a72fcca58-8c87baca1a4mr2848552b3a.15.1795166454586;
        Fri, 20 Nov 2026 01:20:54 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cfa0sm1186994b3a.48.2026.11.20.01.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:20:54 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:49:45 +0530
Subject: [PATCH v2 5/7] iio: adc: qcom-spmi-adc5-gen3: Remove Gen3 virtual
 channel macros
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
Message-Id: <20261120-pmic5_gen4_adc-v2-5-94d0e1fd6847@oss.qualcomm.com>
References: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
In-Reply-To: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795166413; l=1334;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=I4p2EJOwVOFdhLV3d8fOV8mI8YFEYd6rXRgzQ+V6ybU=;
 b=rGlc5oobOonUPzUINfe0xZ01U9TskVZZ8B1j4gHL5EkU9puFHuIEXfLWsU0dm8BuRzoxIBRiF
 kDWSaLgE01ADQwp9CouyV4yLzDPMdMKAzrdmEGMgwp/UkEDQnpMbyAh
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfX4vElbXIIvj4X
 8+SRCdWkfavYhLqT9fsPxDzmB+b9Y6fyuB9TjdeTCrPMMP8AjjeQ8HEFiVGENW1O4RJLy+RXoYa
 qReEzdczJusm1/s+bhgcVg1E3BfjbCg4Cg0cKo68LmiWNgVwlAtXOt1umao/JcUmCxpiHiyHvHd
 NjKfAV1bimE1WfQuDGlDEhT9L4OOG+Yp+dTjrFfZFB2BvMVgF3F1EDFo1CavN6CLW2G+1+J1/ZF
 Cou9t0qCdzXDr5bePL+Mj/QemtEGjZ24dAf8ats2m9ooFcXO5zYn6LPfeLqbvCH+x6FBFG8uyQl
 OqHTehs6BnUB76fADvtuYFsFVEPbQj5XOpxV480nJ7Mj8U04oR7ZYM5SUh/73IX4vLNhRYXnJ9m
 6JeLZvBLNjpYwx0rf6lt0vOHw8rCxB7gYYMiEcsL1ItQwVR1qEjH9GmZ0gBxl1w6GHLB7EyNoN/
 rGQnnL0TWi6nVdMP6KQ==
X-Proofpoint-GUID: jMUmEo3d4eDNA6paX-5-mYIWgLRwDg0z
X-Proofpoint-ORIG-GUID: jMUmEo3d4eDNA6paX-5-mYIWgLRwDg0z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfX4KxdBas87Erf
 603nJT465t9WKLVGwo4L8cs8K5bJzXFMU4theq9hJ4mfdRtNo0YxAMLx6WNhWIeUG5iLDbMnUd7
 1uAGA0Xpx6NFkIHIPCXu189iDPDJ+M8=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0010f7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YNQv7Wq190UJ8kr6mkwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200037

Now that the Gen3 virtual channel macros have been replaced with Gen4
macros in both main IIO ADC driver and auxiliary ADC_TM driver, remove
the Gen3 macros as they are no longer used.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 include/linux/iio/adc/qcom-adc5-gen3-common.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/iio/adc/qcom-adc5-gen3-common.h b/include/linux/iio/adc/qcom-adc5-gen3-common.h
index fa7e08d67f26..105b0766a01f 100644
--- a/include/linux/iio/adc/qcom-adc5-gen3-common.h
+++ b/include/linux/iio/adc/qcom-adc5-gen3-common.h
@@ -40,7 +40,6 @@
 #define ADC5_GEN3_CONV_ERR_CLR_REQ		BIT(0)
 
 #define ADC5_GEN3_SID				0x4f
-#define ADC5_GEN3_SID_MASK			GENMASK(3, 0)
 #define ADC5_GEN4_SID_MASK			GENMASK(4, 0)
 #define ADC5_GEN4_BUS_INDEX_MASK		GENMASK(6, 5)
 
@@ -78,10 +77,6 @@
 #define ADC5_GEN3_CONV_REQ			0xe5
 #define ADC5_GEN3_CONV_REQ_REQ			BIT(0)
 
-#define ADC5_GEN3_VIRTUAL_SID_MASK		GENMASK(15, 8)
-#define ADC5_GEN3_CHANNEL_MASK			GENMASK(7, 0)
-#define ADC5_GEN3_V_CHAN(x)		\
-	(FIELD_PREP(ADC5_GEN3_VIRTUAL_SID_MASK, (x).sid) | (x).channel)
 #define ADC5_GEN4_V_CHAN_BUS_INDEX_MASK		GENMASK(14, 13)
 #define ADC5_GEN4_V_CHAN_SID_MASK		GENMASK(12, 8)
 #define ADC5_GEN4_V_CHAN_CHANNEL_MASK		GENMASK(7, 0)

-- 
2.43.0

