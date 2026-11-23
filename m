Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454433;
	b=CudXobMiJqv+gxKgfcYrUVCtj6Uj8C+ptQ8CCCbbm2+yJOGoKq0udWcyrLS3TI/XaRQy
	 iS3Bkf+lyk6KRzdaHKTNtVK/er0OObn5NZgEtRHmJL6XBI706Ysf1NrmQfZBsH6Zsx6xd
	 sPt9Ao6P6psIkWATUILZeSbXDXBKB3vOg8IxmorLzjasGwXORTv9FuA8t6d8tLvp9B/ll
	 ZCW+MauHjnD5cFa5BKF/yLkuc812ZeX94/RXDGMqcUTTbHAOa7KQ6D2UqprKjGsMe5hdZ
	 fEq3znmU5L2cw1OcOnagrvJ2Uv7O8/X246eYDklv3QH8jS8bfhVegfQdsAXtwsLJj6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454433;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GhMv3tUfF0X0waf9LUoKmzlbGF572ZAv+KigzstD1XQ=;
	b=ymBAsdHgFm5f+o3uf3qSJGRiv4cVecQPSW57ABu6N70/azxmXB4Ta8uTJtvf1SX7LsQQ
	 U+2Si3Ume7QsYQYmuVMkhoRiMTyAuM4go8Q5zlOhBlQCyUtbpoRNJzAc0z8VkJ9NWxQk5
	 XHu2uTGpFhpPVrFr5SZVv+YPWUIsgTOV28wie01tR9/K6AXq24O5+UpcT7c2h700Pkfyx
	 jsPp8TFKMSl1AaF0uCKQvvq6Dj44NDnsshfwnSQFweR7JucU1tF4f6GiGCZHgJWvcwjPs
	 FXYWJ5a34YQysTpWrWs2rxwcbpK4aQIT1qKfzNY8UvEfoSu2X64BEi5Y0ZT6gsqxoxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PXmRdqzK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PV5mXOeS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529A7606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 529A7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PXmRdqzK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PV5mXOeS
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGHHS32845288
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GhMv3tUfF0X0waf9LUoKmzlbGF572ZAv+Ki
	gzstD1XQ=; b=PXmRdqzKV2K7IDecis6FOQVkzj+jWxMrlsvLrfp2aP6AKzH+0xM
	GXRNJ5Z/Ei4ogq6XF+V2FFseBcnaDFHSQmpa3ZpCwtLKtAPGKJ7pEpLPi1CjBWnT
	NhFHFyuiHLIED/PI5wEwF9s1dRQaB6v4fWhhxYVGi7wmQqXPhes1vhfFPi+mO4Pg
	lgxx7MOW8WOKa8p+x/tA99QHR0Ajg5nRQFAfRPUM/52bxoFYwIM/czwVzaX9ifcG
	hDoaxFE1z4VVXL5H2gddpSxeUWFLV0CnpTNo/skMMl32D1kcVNgmhTcZ0K6zZwhw
	Onc3LPf+dAaBLsApVsxU2S5lqdKInPtcQRQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k2jkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:20:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b41e8c1ac0so5266313a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454431; x=1796059231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GhMv3tUfF0X0waf9LUoKmzlbGF572ZAv+KigzstD1XQ=;
        b=PV5mXOeSpZx6jjS300MfW6kVo7QQ2dE99IDOInx5EBBhdP8mACVJkVzpjjSA/R7ULW
         VvCiSm7XQ90OGxjMu/tPTZ8pgRmf0VjA0wam03P2hZNUrjkdxvYK5RuicC13vSbBvtCq
         7FezGd3V6gpDpatfRycsIPNBy0pEcV0HdYDfNmW3ZJBgi2TIibrVn17o5WpWBtqRceMu
         Gh93rde/Tc789sXwzamWt1QNR2YLeO40yGPfodtQI0tbIK/fNALGEt6VnY0xHDfmFR76
         nW5IEZq2YQj8MVduaMCz9f0LgCh7unx+swdQeHAyqaxUpvBfHHq7riDyeZNEKoxDNMU5
         r36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454431; x=1796059231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GhMv3tUfF0X0waf9LUoKmzlbGF572ZAv+KigzstD1XQ=;
        b=sJpo53ekFhxON1cLL5ckLIlijNt4hJjn6lDBjFNNyKJ0P3MKnyPNIKQfAenx8BGlJB
         +dCjphcS4Z85/fVkDFmQu6xGv3rbdtMJ+aNM79fuEI81tS1GBkLPaj6ulRwwbfixw3d/
         UjHro2vxkNn4PULp3T7zqooOd4JH64/jH+h6LHA/XhxR2+zkZBNNtfWJ/GTOtg8NWH74
         kTE9aGaIKj4D3O16dk/gvNv9kT/x7qAiZqV6z2on7xZySF9EO47iIAXM0+mu9eYyeBKq
         /S8BxZ94S9BwQyiBy5pVrTvT5sakCZNQy8Bej0nISkg9qAj8CYGOHwM3cO+t+4z4Z7zs
         T0kA==
X-Forwarded-Encrypted: i=1; AL+hErH94OZRqNKIIZz0KhBA5Fig/oGN4yLC4nUL9fhBPniF15bSHkdqqBP9Wmef68gW8C6Jx/8Fl+YoMdwv8zM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q0YoIC5IOGRrSqFqvfEERIgTGCAyNKFc39wNjNc9flABnulEU
	sNcHlnZC2z8zxzWkbx13QLUoad2WBCwMJ4ZkThAjPjsV5H/ICMWz5MGaNCTp7pDOG0Tb36F+Ay8
	aOP5+yElNhyU3iUxQY3fXmKUnSx/qlC/b3Ws8gmNjaBvaSA6qkADnuvhuDM/geObFAg8=
X-Gm-Gg: AZFdTZcMihI72bttwnJDuarwjrCOAgX+VdcVNMogZcSIGdWuSVW+ra6gmM6jK7mNjEa
	E/faJncWMCEj8J77FxJ0o9OGIyUPgawGm4PaquyWUhWZVOxaHZlXJRjhwgn5Kd4ktagIlBz7hoK
	UJPMEBj8Ei66XsgARR8dhggOybhJJ0kAz1Iu8BDGUior3IMqazoFVai3IRVP0W5gors0RGgOeOx
	sjPmUkRO9E3pDNdQTwT9oaniqghjtkNBuzwq/+1xocfL5IdSvCUv5VSMo8q8ak1Ae+34LAV8kHM
	pO3voiPNr8zGu/ORuXevdX7/K3Uq9FDBonefmqYhMsEjiyh38APV3h9RNjjbxeSQx9Nbr8L/Hcy
	+Z9OulxXoPXZytW6heTP5H0XnH5TQnZ4dr4T8tDt8zu5aZG1AhhoLet4wk6ZQ74SfcgwmD0yUwH
	5Oy8RdD1KJTmO1I6S9M8jo4n9ezWg2iqZJO+aNORa27rdmsO4iPnfLIrqTVDdCgA==
X-Received: by 2002:a17:90b:3d4d:b0:3b4:402:b3f5 with SMTP id 98e67ed59e1d1-3b41c8fe48amr12378511a91.22.1795454431087;
        Mon, 23 Nov 2026 09:20:31 -0800 (PST)
X-Received: by 2002:a17:90b:3d4d:b0:3b4:402:b3f5 with SMTP id 98e67ed59e1d1-3b41c8fe48amr12378477a91.22.1795454430383;
        Mon, 23 Nov 2026 09:20:30 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b704cfesm6565632a91.1.2026.11.23.09.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:20:29 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a8xx: Add missing preempt_record_size
Date: Mon, 23 Nov 2026 09:20:24 -0800
Message-ID: <20261123172025.402295-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX/W1/tyZQy1rm
 nh6PbWX0vJ6K6LGU9lOCVh7jvSXkw8SBAs8IpJhcAU0HB0gaz6R+moDpc9YbR/D+xHlr6PzWU59
 i+hFljBSOzd514OD70YrtNMvhFu+mzU=
X-Proofpoint-GUID: _iKe0yDNhdz1nHqE62mxpltE6lZo3BvY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX2nJVrH9QB7fZ
 GQB5VDcZI0ahs7CrPbQeUYPiIK6gDGBzSo2jcfZ48tSVjeJB2OJTCWGF17f/cVfb39Vnk+BP5Ej
 /DjwOewEaq8kCMJqctRyy6hdOkJc3B2p8xfnsybIjlfFnLbDmIhFDh8TYOZVD4936FhsXJ03j14
 CCQfXIpW+eI9XIkBs4A0GTj+icNzxwPAiukHGlO8zvEdS6YExlH0Jiqv6hcnchWN98jjQ46y0tF
 yUvqayXQkVt4pUtRnRBoIPWiZqMZxNOqEa/js0M6z6S9f7qlZZz6VMzUAIxoJkThVe3MgkqfQDT
 YMXnDtox3cRpa4R6FNn5ZiB442/p6y5+HbwQJy0GLTJRC78seqeyXSq9q24e/kP5u82hG8aq8g4
 bUsk7QX2rG4qPEqvsT0Rh+z1djtRBi6zVmwGGDEqNjap2M7z/hJqwyBGS6JGQ+qBBNXCC2IYQgf
 A/SCIDhIo0AaaBfTEBA==
X-Proofpoint-ORIG-GUID: _iKe0yDNhdz1nHqE62mxpltE6lZo3BvY
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b0475e0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=2OSpH8Mq0sc3u4_c0_oA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230068

Somehow this got overlooked, and Glymur/Mahua were falling back to the
default 4MB.  Which is way too small for the amount of GMEM on these
devices, causing faults in cases where preemption needs to same GMEM
contents.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Fixes: 7fad33097e67 ("drm/msm/a6xx: Enable Preemption on X2-85")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index 0c6dde3cbea9..20fe93b83c0b 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -1337,6 +1337,7 @@ static const struct adreno_info a8xx_gpus[] = {
 				{ /* sentinel */ },
 			},
 		},
+		.preempt_record_size = 23088 * SZ_1K,
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
 			{ 388, 1 },
@@ -1469,6 +1470,7 @@ static const struct adreno_info a8xx_gpus[] = {
 				{ /* sentinel */ },
 			},
 		},
+		.preempt_record_size = 17712 * SZ_1K,
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
 			{ 388, 1 },
-- 
2.56.1

