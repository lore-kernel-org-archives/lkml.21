Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166436;
	b=AeDppkVRSjETq5sAg/ElCcUnuFrtlqnNlCWpn1zZyBUyZ3CUUof9kSDFx0gk73tz7bXs
	 3RCsBJtvU28uTsFmB6I9rArDqxCVUuoHXDEg6CvK8Z9VY0P9QhNJsKgMvXgAMdzpVHIov
	 cVSBNbABBNUvl/79x0lXFb8PfDw7sn3mVnN0HsC/1YIhItOJZ6L5gdAZ39jhQ/DuHzB9f
	 mk6QuM0U6h/kC+BwVgvEWNg4wWBuEgaZfYbp/3Mu7H9lVsatqN4ZwWN4/uL76Oe50R+MK
	 BwHXku1cZ9tHnGmUHMBqh8IHFh5Q46VFev6CfXLKAMAs4RYy9Gv5cLubTYRlcv2JcGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166436;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wcw0ND+GzCK33jb32w8A00FDx0OWOEPXUg7F9W5QCHY=;
	b=c8AjBobR51TIhFKXXchT4722dgVsRiP8ZXZNDo05r7iXdYF4K3uztmQIyDhTmPU4B1th
	 Ze5NCtbsjwzw/s+bloN1aieKc5hurboSHH/qRzD7CKGiJ+oYSG8uQn9jRjDO/ArgRoeCG
	 os+grJrwwT8VZDx5cNh5GXl9F7KmFsdoDd/ZdNqLeM5+Tqw5SWbVy7As9yFj+GjpxHvJ2
	 CbuoZJqmcUMb53zBufSmij81m49c8ohKxegWdJYG/OArj0RPstA9jNaQE9xkLh7Woa01b
	 drD8CP6sDuW4LKLOqmmCpUmYwckTx9Ubc6W+EoWMKJzv1uqJcBDODIrGnwEPszh7L6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxzCL4+v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDA4mbaA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E97606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08E97606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxzCL4+v;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDA4mbaA
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7euet3575588
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wcw0ND+GzCK33jb32w8A00FDx0OWOEPXUg7F9W5QCHY=; b=WxzCL4+vHkMZN1nK
	IpHOYxmmWVnEJ1NemOahvFUnVyhLBkfZ7RWwbIyO+pif/cy8xVw/yRiwT7KRWJGs
	sbo9lkSjIeN7eEiypwN7f0wQHTjr4TIO0Ybv26FDvPaTx77f85m76x1L9o8eXD7n
	exX9RTZTTXxCyPpHhb0S6aftGtXK8uzJMUnICfvHJnjX4e97wREqI/0lWzFwTcZc
	kr7ZxE5R5dnlq8pOEkxUy87A29ueKsdFB4JufOunLfi1DUDWQpEe0KZMmKGbucDn
	Vj3ol8fV704BWLW9HW2fAH9pBFMaNA/rQujoiBbCQ6Qv1+PMa+fm9ifgztZ70s+7
	jobyFg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu80q3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:20:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so738470b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795166434; x=1795771234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wcw0ND+GzCK33jb32w8A00FDx0OWOEPXUg7F9W5QCHY=;
        b=NDA4mbaAHTplyBEbOeZF18QsQIGVplHyuDVN1ypPWi3+KJqJ6f+djltFAQwWy3DWoa
         bgVBubI/Uq8U6qzAntqDk1CyJRdAbKiYhnocpbl+Vws4Lm3WkaLvsqqJlMwuL6fC1YSX
         4qs2UqDT9Sr161RxQWnEWhpvGKWU0/hMLx2+BbyeKWBqkvqKa/W4YRv4L8KC9BN0s+qN
         nCI3iy4mQkKSDgqaxWvyC7N121RcWGdZp/7Ogt36LzSzAmdLamxpJt/O1MW4pvds/W0i
         gCZ/31i1rV5szC9ZZA8SuqaD7Y+UVOR2XWqxkmHW1ihobQU22i2CHXKkUishFSUuw/BD
         qfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166434; x=1795771234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wcw0ND+GzCK33jb32w8A00FDx0OWOEPXUg7F9W5QCHY=;
        b=V4a+e+xdtQQfaL2zFHFBGgo2U1Zb0/ETljaOK/c2Z9drnd7QycY0T93py3XeOnd5N6
         rPZp4c8Od2yes6Mo0TmQR4WGuKYtKPA1NzKnjrh3YxI79I58maYUFRQX18+WyreGHJgM
         cCHwK3Z3owZyFmcJaJA6sbRY1jh5IwYr2IVflVvKEXpdmGHgII5cShQ57p60aCXkyuje
         5ChaqP5UnWHIOHY6VO1CCU6O8bDZTpKmz8A+1dKkqYSw3my9TAozDtVbBr4bnDm2TXiU
         nyx+prP/yUOFuFVNvyd75Dj2m7mGLIoHhqNXA6SzG0Jf8sdXso4Ymgj2e9nGwR9r53G8
         +RsQ==
X-Forwarded-Encrypted: i=1; AL+hErH0x+6+/C6L8mLGocFAG97d4DDpvw5TsbWqG8lC60VAqfEFo6Glh+qaMMONoQW1HccB7DNDL6W/6vfINE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z83B+rFDKHjWuAIfFaSG5AbrVLGd00OJMLoaxCAKPoe5ljIZrqx
	+NEtfz52orwE/C1YRiGclo8wG3XUg5eCOTkNBCcAemY0N4v3bbANaXOqYam+/rXxrkGUslcrIBK
	Mt4b1bZiuIfOlppH2TLeSzAHoprhQfzPdX460PFEB5u1M+9JUf5T8nGj53uDZ2BSbiEg=
X-Gm-Gg: AZFdTZc8BhfbFwCfj+ucwDqaUoWy51B/NMNVZxiESV8WWNrA9ejHIxk3cCW9240rdcF
	MPWY/qcVcBCCKwRbkgovnW+5APt4Ltiz0ZF1/wTuN40LBFbYgi624w0Fk7g1W9VPshcSYxeoBMg
	F+GAuy1ofBnx6zBjJeIlLE6Qkw0AjSpSypv3NUvoUQxgeZkZ8SNv8Z9Huiu4VSssYChiyg1iXkv
	+vtGkENwsp4V+SspJXR78U0wWAD8+8/Visi+q//zHTAm5pEwKUOaql55BLjLrWc0QsNz21OnM5/
	FPmbxVJygCmWwHVAP4CUIVrXzL8vRGt+sKjvI+kZpLVDwxn+LpqFU8ebits14DAlDFrDGlu1CBx
	3VL5WiGAN7wqVyfzkeeghobyTY8v338JbiDJqf6UAMhllwtGtqITazq2I8mPbqvOx1rua
X-Received: by 2002:a05:6a00:b86:b0:874:705d:f63d with SMTP id d2e1a72fcca58-8c87c38b5ccmr2207870b3a.31.1795166434498;
        Fri, 20 Nov 2026 01:20:34 -0800 (PST)
X-Received: by 2002:a05:6a00:b86:b0:874:705d:f63d with SMTP id d2e1a72fcca58-8c87c38b5ccmr2207839b3a.31.1795166433996;
        Fri, 20 Nov 2026 01:20:33 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cfa0sm1186994b3a.48.2026.11.20.01.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:20:33 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:49:42 +0530
Subject: [PATCH v2 2/7] iio: adc: qcom-adc5-gen3: Explicitly assign enum
 values used in hardware
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
Message-Id: <20261120-pmic5_gen4_adc-v2-2-94d0e1fd6847@oss.qualcomm.com>
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
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795166413; l=1103;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=OeUK1LlAVHR+3dWtPipLhOdiDli8ETGZqQ9NaC67ymE=;
 b=UOC7miGD6bJJXRuGg4fOcSL+CHhXt7dJhjl2cezWjwXwuEqSS6IRwc0GFCp1Tj67Te/sgWv6F
 tZucRdomXcAA4AttWYp1wBRsrfzAzd9bE0L0BwpFtDjewNuqKZ39Eqy
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfX/EGmlMvldw1I
 lE/fBDZlz30V7u3G4iHr+VsZzuROo3BZZBuKtpV2MsATOudJvpuIpeZpQ6rv8li/makbvYf/UlA
 DnK8PbEnMQYzeBhRvbpg3QCkJEPqTxbKz7YlIIsCm3Vrzm9cI7HyRz3XRVCa8q89pJF+PZm79k8
 tpRlP0mRsXeFDroCAqf9haF5vCMyFBHQYUEU1tj74o+0d2QDRIEzgDfKUFQI5J9bSmatHuKCDVN
 jKrqvPCr9ca6RakL3JM10ZMf5FrDn7Ere/qSEAhxAqvO69vwWXvGSl7dLglQiiONWPHhYiJWTwu
 t3jmWrfPfNy3a1b0gvLjMt1NcCE9Yfe1Uk+uHy6V5GH7kT0ntfVp54akNcqoqef5Bp3IVHrr9GS
 M9hTYVIWQZV7Lp9RmTJTDg59NJ9SMGAU+CZtnki2TaFgkvIuSmnkCIK/8hy5WHgxlqf1fSoOM14
 tfnRIALlIESRaHKN/EQ==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b0010e3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=se6siFrRNr6BEeX4t94A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: RyETaewm60carjuaS1JtgV-m0WRZl6VJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfX/CpMwxml8/zx
 6E7lHvdObs8KfCiY0ZlQmY/clWi5tJP3mJU0S0k6Tzj1vyDhf1eMMkIW4Do+v1gvA2Ae8vyYs5l
 Gns+tlzS6X50QNbMJiCQ0jeiPadgZK8=
X-Proofpoint-GUID: RyETaewm60carjuaS1JtgV-m0WRZl6VJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200037

Give explicit assignments for enum values meant to be written into hardware
registers to avoid errors due to later additions in the middle of the
enums.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 include/linux/iio/adc/qcom-adc5-gen3-common.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/iio/adc/qcom-adc5-gen3-common.h b/include/linux/iio/adc/qcom-adc5-gen3-common.h
index b3e2c2f50e8f..ec7238e93396 100644
--- a/include/linux/iio/adc/qcom-adc5-gen3-common.h
+++ b/include/linux/iio/adc/qcom-adc5-gen3-common.h
@@ -104,16 +104,16 @@
 
 enum adc5_cal_method {
 	ADC5_NO_CAL = 0,
-	ADC5_RATIOMETRIC_CAL,
-	ADC5_ABSOLUTE_CAL,
+	ADC5_RATIOMETRIC_CAL = 1,
+	ADC5_ABSOLUTE_CAL = 2,
 };
 
 enum adc5_time_select {
 	MEAS_INT_DISABLE = 0,
-	MEAS_INT_IMMEDIATE,
-	MEAS_INT_50MS,
-	MEAS_INT_100MS,
-	MEAS_INT_1S,
+	MEAS_INT_IMMEDIATE = 1,
+	MEAS_INT_50MS = 2,
+	MEAS_INT_100MS = 3,
+	MEAS_INT_1S = 4,
 	MEAS_INT_NONE,
 };
 

-- 
2.43.0

