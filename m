Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810553;
	b=HmYkWWRCvMl/YaAIPVWjGqARMFv1hk3ssHXFtdWOFdr0swg4BhGHFBhG7O4Z9nHCokHS
	 ypehb846pbOLv8Zu6ZEi9FLY688drZJdX6eA52Kricw/BXDP2ykalcGVCc8rxYMhB0Iit
	 S7SQ2YEmj3z6Znrji++k5gGCFZrh+tURhao4AQFEhcfP42Wj6Gq4T18Km8iF1Xo9aLSp3
	 +a8Nf3LKf6vcVUvKuW3zSvhSc23XirRYmn3kfXO3e6aE4Rbp7Gr6uA8QE7CvykkhcWWTS
	 UgyvB8Itv/AifwMi66ofRWLLXp+uOmyVffWmZd5bCtKemWnBZHvy5WcwH2MOGcSLXMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810553;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=98qDoH92azSwLouRMH+8XP3dKSJaHgdwXUq+g/TmSHg=;
	b=rREy2OXjzbrYqHdejn8LJKpqIXnurieDwS/ae9WJKYMKKI4qjuzPq9lj2VK8UUWcsbw/
	 IvXu9c/agmIeR72qUQSZUsWpxJgcweHONDDoze+cDWISCvfyVajuUuRCTEZji+nm5DP+j
	 YDz2jJ+6y+9Bb/Yfc7Ortswidtbrjg70PfxrCqfi+8k3uPRmuTgRwruCNXEMLudVck9dB
	 R4iOx0l2Fq+ZcaUeE51EtO+om4gaqV2CoerPwqKNF2k/o2GYQNWOjAfaudaxGMbVGNf51
	 XrP8h0GQ9Yw2Ngf8xfOirB6UFVVbZPF1t3laSzWZbOV9QVFOf5F659OUZ+u9IYO2AzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VLU/0Kny";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cR38sX9F;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDAD606A335
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BDAD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VLU/0Kny;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cR38sX9F
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJR8iQ2668628
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	98qDoH92azSwLouRMH+8XP3dKSJaHgdwXUq+g/TmSHg=; b=VLU/0KnyuUJMZQdO
	rBEocEKSzuWWiP5IfVwqLXMCIiwHJVHuegFQp+Y/29wQB89z+281D+srlm0HHAl4
	6XJ94xeoKQL7N0CW1DfrSfwuu4z3n8wPgYHRyS/bjRZ51w9lQEOP65ZIR4EVkQ8n
	CaHg58cL0ia0ZNgYCZlcf4/0Dq3RhPllklUib/8mUqqeSk4d2S7/bQs4k4TkDxMg
	s+bVtGrdARWnX8bnmLRM7bkidX9iS3M/dKlCHgJknOTV5q5aHCR4ryIFZA+wfm8d
	ZUWezr9vkzsOuXazLvleMPTo9ovj/vgn08nzh0LbSSVGXplBzj2U6MqCKmeHpRbS
	+vmRtQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g1jg3mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:15:51 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ec3e192929so1918544e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795810551; x=1796415351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98qDoH92azSwLouRMH+8XP3dKSJaHgdwXUq+g/TmSHg=;
        b=cR38sX9F91Wbr9vxkioBN8V56HD4PCZRxctc9g9KH9wnPH+X9nMJg9KZDKX4SJfrbQ
         4fA4Dj8oLwCXJEIxMl3iOofrKY74GtUjq1viTg0OhVvZGs8Hwueg44HDKnGex4KL27SG
         HCK00bzrhzcxKzKJZBfXsmT8VSZinM6SRV7S9ru6lYWFSnRKaOnZnzD/xc+SFclzX+mM
         o6NY/NwVwGJUFGwbGZUODGt2iXdmJAEUiKKKpDKoxjdQ6kkDw+Rk85t4IzW+U/cmFsmv
         P8fm5BUYWO9N6TKm+aFVSRoy0Mgzdw8PkGq0w9rwDJvwLOOlKkBcU5p0eBKiFGPWRU8L
         u7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810551; x=1796415351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98qDoH92azSwLouRMH+8XP3dKSJaHgdwXUq+g/TmSHg=;
        b=MElX0egEdosJEuJoSbo1mtDTXxaXnpytsNN8mPI/ui/LaL/8Go37JGPAHfLZTu2Jws
         adA/dVfPtLpGPv19UXynVgTDEaZrxX1XjWHdfVOKyWle5aVYDOAyqZHlXf1VT3chVAJ9
         cTiHMWsq2a63SXe29UcVTK3JfTdcTRH4+IpupXV+ZXM2sIYHiKk5ZCRdhO3yw0BdCbtp
         E+UsBM28dmyz/mOiqjL5+ZJOf5e0/dvBqfj0nXgn1bsGKsoWyHaNjHI15a3dqvyyqDPH
         lS29rJSi3DZ+GYpOk1rcJufjV/fAwfD+Yeacxb63u3+RTOrUkkuYO0YpBx2peYqs3t5H
         iFqw==
X-Forwarded-Encrypted: i=1; AL+hErG0qIjo+MGW+c9QkLoPFyl9TLZViFz/d5plH8OmEjmZisMoUK3quXb9MpT72Ll+oJ4uiQEzT85rrH+Y7CQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GsZahiV3ZOi39PdxByQtfHvcTUIO/Jr1SoVVc40zsND7tfxg/
	3L2qgzu3N9zqw1zQlv66dl6rXMhoND/oRP9YG4Qb/lE4TAxJfK4ZDyfDHbIx+USARcVnF3ipRh+
	NAB78uuFdDtYnSwZ3GzCxd4Cafjr4jF0GABDREhS4iCyF5+WvAwBQuDjjMzGCqvCCXOk=
X-Gm-Gg: AZFdTZcfaexFtVOU9SggC3jAJhHGTHqCTPStgVpCrkjSSborWRk6qaOUfQlXbJDT85z
	tIJ0WwGad2HrMn60RCr/RVPU9ABec1AeOCR4JhW+FfFEhSaX+P5f2cSuvnk8nJZ6ArnDnL52tY4
	VD34BDMpBiv+9wm707xGhpgIVAnx24BWl3SP2lqm3dkw0Tah++SBCFXoXmDqd/dm15uu0EXvnUy
	pk0m7kWdCdTRF78mb/Mmd+cyVYGRQMAZG0xhdLE/lzS4JaSoys83nJ7Xj8hZSiQ0qdClUV8yfWH
	/yoSBYjDRQ5nMybp1WjcJJl1iFuCr2voZ0Z60g9SptNZfy1D5ffKI9XSGLq1+gUqadjEf9GyHSW
	vPfA6+9QqXIbj0hJu1yQJtdqJZYbIrUyZ6DvWgkSEj077a0OsP5yaVLTmw+KHOTVESWHvgvG6Jp
	uXNojY5koEr/Jt1Ui1KJzqkmRE/p10QRRqOU9SiDdXJFdKJD8/N/eb/zi+kjm0SQ==
X-Received: by 2002:a05:6123:a8:b0:5ec:3e18:a912 with SMTP id 71dfb90a1353d-5ee8af230a5mr14375557e0c.14.1795810550806;
        Fri, 27 Nov 2026 12:15:50 -0800 (PST)
X-Received: by 2002:a05:6123:a8:b0:5ec:3e18:a912 with SMTP id 71dfb90a1353d-5ee8af230a5mr14375526e0c.14.1795810550153;
        Fri, 27 Nov 2026 12:15:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8050fddfsm64591511fa.16.2026.11.27.12.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:15:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 22:15:27 +0200
Subject: [PATCH v2 3/3] drm/msm/a3xx: update the CP_ME_INIT data to
 msm-3.10
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
Message-Id: <20261127-a3xx-fix-me-v2-3-839408d293ed@oss.qualcomm.com>
References: <20261127-a3xx-fix-me-v2-0-839408d293ed@oss.qualcomm.com>
In-Reply-To: <20261127-a3xx-fix-me-v2-0-839408d293ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=894;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lso6GGjxnW0xHLP2ZKgFEvmFfqpbP27jCKyKzBg+AJw=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGsJ5O2heZmgfdQPfBuaJhQqnhwbxZMb5CFc2yvFrdQ8zioZU
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJrCeTtAAoJEIs8ij4CKSjVmosIAJPL
 Q8lzjYTDLtfWLAR1zrvO/YFv4g2WYPDaBT/f81v8IG7R7cgVDeEjvOcj9tq2TDJjnqL59TJxq5j
 wtM0f4ufpkis94gCU+iLEgJh7L+AiDpvzR2pXNIpaqU5PbmWUdaO0a1qz7D0DJXqiFNd+B0LT6M
 L0TqrUS1sk9YNyylDbcwdLtXFz1LbJho3Kzif5oI7BYyH7hjr1jzsOOaSes6fKdMWY5fE+r/y+Q
 L2L+bR/nYrkfBkjECWzIFcKOtJ6UnOunIkPx4dMFST2g0fqkDS/EZfnPsyqRGfkI4YeUVO6bAFn
 EHNdZVo1hmxS9SotV2tq1sCqdGB8gqyO7nJ0jTI=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfX+fM0f9JEB/Nv
 c+G9Jr2SIDZhNJqNdGfOLQ1lBD/dXv8TymhbJLHdjuqpFtyiGEDEVqv00Lj3WG4oa2LdOTzEljR
 3k2cusQsYKViQ7lQUTQz0S276DGjyRzRjk0FtQk2WVp+DWFURPG3Q9gFlqSlzqkbmn9Ll4KYeGs
 FGPVoSDEt4AokzjUOmIg0onVow4qppKgSDTYhzx8sDFm6Skq3h93rJtUwAHpVGkwqhGDgoMQV5s
 QTSzbHFUVKHz1A/TFJuux2vouLhAa8Sc++bWRZbK3MIrWMrw1pceAiqRhbwrBZUjZ5ctElLGqzq
 GZzpTb9bvMBMVzCpMW6W7vDV2JXzdKLJF2iN6e+p8yW3tbbY+YvEgbrWsmJPT8Wjs3iLcYekuoA
 au2IuEX4GCan0Sk/y8ansi6OhePzNIHbbi1H6xvdYCvzE8MkXJQ/VfpWWdPDPf4NzgR1b/7qBU2
 /fMr4Hb/hbNL99t++Ww==
X-Proofpoint-ORIG-GUID: Gki9KxIjRNE-9F9nYA3mVEiEG1jNngnI
X-Authority-Analysis: v=2.4 cv=QpzLTlyd c=1 sm=1 tr=0 ts=6b09e4f7 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ypG0q2TZ0WS5u_ylJzIA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: Gki9KxIjRNE-9F9nYA3mVEiEG1jNngnI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfXzuOkfkIAgZUK
 n5wxzgWuvuaKNSGaI4ET2nwUnXpVI3uzCEGVeVY1+N4IzqCpAnJ2bFkIjsEb6qrLM4q0PufkfM0
 fI1IpGc7zssLDbKf8PiGVe57Kx/7q9I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270080

Update the CP_ME_INIT payload to the values used by the msm-3.10 kgsl
driver.

Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 6a9e0e87a8d9..8bcd65f52496 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -103,7 +103,7 @@ static bool a3xx_me_init(struct msm_gpu *gpu)
 	OUT_RING(ring, 0x00000001);
 	OUT_RING(ring, 0x00000000);
 	OUT_RING(ring, 0x00000000);
-	OUT_RING(ring, 0x00000000);
+	OUT_RING(ring, 0x20000000);
 	OUT_RING(ring, 0x00000000);
 	OUT_RING(ring, 0x00000000);
 

-- 
2.47.3

