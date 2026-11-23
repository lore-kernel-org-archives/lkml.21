Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457601;
	b=X82hjvbqgkygIN3R+f/9tk0qjFavuZ4adIYPpWHCvDCHjo6jV5MXw/2oK+P77BfLh1P5
	 9AOhq3cafGITCJZksrbhmEF3l+wEI3pavM7jFSltzTEvuUqYTT9qeX5fYvGpoMHj7YFNO
	 ubIfCKu8NqjDOA7O2NN6qUxv6dyyAm7VahpSLECMOvT8aGjaB/fRCLEYHCRvgRW4yCtbd
	 KT49wWWP0jy8Fm3wda0oNg4ZmF3j4kpov9Z/GVqQHBg0xL1uwjt0JSu2WHlXyEygL/ZCo
	 ppYDgEEKW0pCdZmHCwyHi9QGdweTgWtxGUOeolMIvvyaPr+oB/89YH5Hpg98j7wZDCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457601;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z1amoST655iGgyCxzXVgPyjK+ap9dKFBCk3BVwBzWnA=;
	b=JTc8ovuOdIE9wWET0SrxQhAIzMc0JOwjGtxZjq28Y3nQTvOGLbLSLwJsdItVlYg5lWMN
	 4jMZ3ZG8UCX9L0vGjIAE5ti3lOsuZObbq4IcmAMpZXPduob4ow+cZAh6Aq4n1Lr3zkfCv
	 UuZ6eJyI3W3mVDuvst56kHFGKcfvkeM39tsbl8ZDASrsf0Gr0VNqsDUJGhNzGNeBvRbmk
	 WpM4hwKZGMkEEPcnits88J5O1LEr+uQBDKqJ+/1j2yNR0BZWAUjB2XabSYXVMbiu1Dtx+
	 mizqn0bWnrS+nKw2zib19b+jmC2OJ/gtL5Tl8nYKcdV2hA3Z5qRp/S+84el+V41n1Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JQyKKKnl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZOFUbwPt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E75606A332
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89E75606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JQyKKKnl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZOFUbwPt
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGHv69236065
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Z1amoST655iGgyCxzXVgPyjK+ap9dKFBCk3
	BVwBzWnA=; b=JQyKKKnlGAUM4zzAwMuOoUQgg7/AT4+JYUKlz71miX6Q13GB/3t
	rS4oYltre0uYeIn18ocKhFVUzI9uirxwzHyIXjITAs1tXkoRODkessIIYxMDIdO2
	xSam1fhbvSk2iyJFna+3CEUCu7w1nICz4Q0o+5cIxz+2EuEFPNyFvdv1GKHR+Kib
	NAhpOIz1tUu/CYKBcP2taFwKVyCEvqPk3DyvW1MASBSaDAEHg47T4EAkgVdUVntq
	62vl3dfBkjevh6TG+YcDmLylUoqAziLw3tXsl8wSj7bW2SMosqncHgARkJZxmws1
	QLXc+JDk9gBrZT6v2/5SRCSjpK/QSd8/6iw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsjxvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:13:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so4625642a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795457593; x=1796062393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1amoST655iGgyCxzXVgPyjK+ap9dKFBCk3BVwBzWnA=;
        b=ZOFUbwPtZe166hoAMD0sXBlw6ylozKnWvDF/HnV8ICksmVkAaRE2Hh+zWjnQZaobf/
         wwOOMEsi/TdlgBOl1V0j9YgpKJ+d1ouNjGZscxK+opIxnfUTlrOle3jmPlEcRhEqjbnF
         7RpurGm8ozL1hrBAn3JYHlkPdX8RWDSw/ZBAgCE2eTvr/JVanyZ7ClReGXxA4+nvf43I
         QAaXgsGQfuLoWfd32OvXvs6MXjnvYB7Qv3lLtkVxQ+8Pwga5PLATTXix2i3BnscJImVb
         4+K/f9YW5w1F75mVHHADnVtVYp5sZUG6ijEzgMI/LAWESRt9QPSLzTYJW0KaJ0Vyk7Q6
         u5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457593; x=1796062393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1amoST655iGgyCxzXVgPyjK+ap9dKFBCk3BVwBzWnA=;
        b=BQRZHMkEVGNnvK3vY+FqQwIuD9FRDxsV040z9bRRq6DNZOImpAW0aFaX9EPcpcpCe0
         pPePXb1e7Z77am6dcxQEg/C/6OsA+fi5rvZbpysKvoUsuRWqcK9yrjey26ypjmP3YRik
         T6/lJTkYkFww8WTJ9YqkoiMC4UI4BaVL3Hq8Q6X4syO6mGNnLryYpICqy8r1Memt0CUq
         iTABQYr/Iquox0faHDABMiLWUHqsfwQqhsekYJOB1QMYrFWLRM1pkXlKuAjXfEWjju96
         h/PzHnseAjCO7FuqB8jPAP2H7mIKwvTM+NVSgSApwk4RyQq7WMHSet0LLb0SrmYXknbt
         8RBA==
X-Forwarded-Encrypted: i=1; AL+hErHoQjaWGsEmYvMP3PhxbrWaPAbaow31hUf5mqQz7fxjop+NSyRROdwavdpBHUk1efOt242FVHlMRGSHP3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9JBOmydAHXx9K71zD2hDl4RqsyV4beJkPhOCJZXhNFfi7C4vx
	U2RZe3y685sy8DzgsX/MZNGFELOEMybnJeqQPFPEOTnP/PzkEnnS6qzKBV32NJPGyn8YJDrTnyQ
	Lj6eiy1hKQVQE/0bZu9r/Y9ykMRvbE8dXCIFPxzpoc7d7rbrikXqtqTwTMPaK3fyUAGU=
X-Gm-Gg: AZFdTZc2jq63VnQ1hLIMTfzT67j4wzL0dftD1lXKvINzKKUNQk/03AG17VoMrE23e0G
	pe8y60/04Dp7Z5XnVYxziVx4ukGurZegFTXCf2AQ8X1/sB5bRdS7DF1/inY4/LfYH+vdRu5ctm9
	AyPr1EKAVjDU4JFvUpMtOZMxnLgwzr7fNs4IEEOgtUJNjFrNruhZQBB8USDts3kubmJ7tV3fFk/
	st8r3ed/65dTkxt+oM8902VnM/pZJFQKHVvNZ96TkOsv7dp9din3Ftc4Nhsb1tVCc3iHF+XgwbJ
	IISgGp3UonoLj1VwSDwGIXW+fGVHcra02XOMBOGu72nhoJ/htZz9P93f68eBvm0XqlNxBBLbb+O
	3IK8EYVqlyRtRCzeqW77x/q8Mu8G1HDppKtl28yynSnlNw5e2VltFTkv5NJwiSBSpcEHEdmCKFo
	Dgu50h2ZPSFTm14sC/2s6HM6qsxtDT5MN9a+7ZlCo2tA6R+jLoq0/QPMqgEX5v2g==
X-Received: by 2002:a17:90b:2e4b:b0:3b3:886d:621 with SMTP id 98e67ed59e1d1-3b41c9e52bamr10846018a91.34.1795457593390;
        Mon, 23 Nov 2026 10:13:13 -0800 (PST)
X-Received: by 2002:a17:90b:2e4b:b0:3b3:886d:621 with SMTP id 98e67ed59e1d1-3b41c9e52bamr10845988a91.34.1795457592912;
        Mon, 23 Nov 2026 10:13:12 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7a8c64sm7779412a91.3.2026.11.23.10.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:13:12 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm/a8xx: Add missing preempt_record_size
Date: Mon, 23 Nov 2026 10:13:05 -0800
Message-ID: <20261123181306.420017-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b04823f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=2OSpH8Mq0sc3u4_c0_oA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: eeryv7s4ztLoNsx_920neZlXWZDnM4Y3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MiBTYWx0ZWRfXyoqDuBYCgzh9
 9JJLXgzPd8aRRR1Y0hEoM7vA0dlY5FyC/Sq/DKsJT2Cujfm1S4zB9mRhdJG+hz+hPQc2VM0tp8R
 0Q8g5h8zv3KB6NFmO2vcqmbwJQcXWmBAeyM/U4kt6SXQzVC04ZwiAR35jvJb4BgtSWtIBDLhLlS
 q+FjU6qBEFFgRrYQ8bV57Jg4vbaXZFYUx9DMENjSLPUr21y37fddQHvjbWynZg8V/7Pe1p8jUD+
 EUajXgBJTsKh/T166mLq3CIieKqo9Mzd4FvMONk7m9gdpxRbiQxbLy5BHrO9Ot2Y7VndkBFeTy9
 K8sBoKkpIl6ksIcevwvnbjjNKD/fHlIyeKKZllK24kpQR1EeJwuA0yzjLJBRD+Vd1Rh5TchzJmf
 dptJ4HifHfEtK1A1dBeUAdnqmiEfkOdbKe6UIVD912iQHsmsspFDRxtcVuWztub+2lb/cJsNpIo
 kntShkXO40jFDnuVHQA==
X-Proofpoint-GUID: eeryv7s4ztLoNsx_920neZlXWZDnM4Y3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MiBTYWx0ZWRfX3ketdysFbXEM
 QT7IUM4eVtLHNtpJkEPxT4CRfUzI0op12n4+5EtiD1HjOEAaoqVnYIMafHyDwfBOPceJ1sKkQZ0
 v1HLOYysvzunXgiXNGnHq5h2NLrZhKc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230072

Somehow this got overlooked, and Glymur/Mahua were falling back to the
default 4MB.  Which is way too small for the amount of GMEM on these
devices, causing faults in cases where preemption needs to save GMEM
contents.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Fixes: 7fad33097e67 ("drm/msm/a6xx: Enable Preemption on X2-85")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
v2: Fix typo in commit msg

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

