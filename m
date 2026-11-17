Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956442;
	b=Gc28xGTi5ZtD/U4TFvcKQ4l4uIDqCMInReccclSyams4JwZHO9Rg1pni+gHewv/SCRIG
	 sI9YGjzgmhO/v+hqYlRh3UNJ7TtsgjMO+ljvvwOQdJUViwd7hqT5pki5SlUko2/DxoSil
	 72lxfOzDgOMUBeChor7BgC7G4l913QsbwT9t+Ph18DYiC4gPpO5RooxoPYmMXWul/Qajt
	 hEG/TFFPtLL3mpG3WYEH8rAKDHg2UwJFyP2QGW8JYoNiK3TrAGXOQMHQ+LCCjKW3RtCs8
	 hPUaFX29uQ2bZrFIjR157jN2skiMO0ZBUBNk7t/sKRQS2hOMjSxP+7w8tX3LGcCElIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956442;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wyYVsbnjSgxZrolaAwdyDnBFwjgdkdQVgoD2DRLJVBo=;
	b=eUR2mkguWEVhxoLc7DC7EYbgl2HMZKOx+6pqziZe6XpaTyJ1lf0a2mR331sD2Ss0XNXW
	 56hiXzPorydGS3WYXdCVcK3xua1bq1Dnl4wYXjwBevOxrGXTbe0mdQlZqd8iiy1YAt23f
	 EC3hj167mdj9YXwQkSMkQsR1YhqIDWPqED3J08K6GMGChabu1oYXh6mZxsAg/hXtBD7o1
	 wCtwwdnS7lZjrFaNKNb7NXwS5hbZFdp6A10ZOgVr53UQpa+2TIL+d9xspvhCVsMYoAKGM
	 rw+eUznifUgGcdp+jhH7pXpEB7YL6OL7pWadjXWkl1rA1oxGO7jsB4isrzEtKc9nkNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HXmjkkCX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y8uhyioB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB0B606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CB0B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HXmjkkCX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y8uhyioB
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMf7rK4172282
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wyYVsbnjSgxZrolaAwdyDnBFwjgdkdQVgoD2DRLJVBo=; b=HXmjkkCXMmQ07/pQ
	dK5tApiuY6ApddYlMeBxpHYCJ/DEz+OHOuaPrSZrvGsA89m/mdBeD2jTh4wtGbr+
	IbkrH5YUH19dbAx2t/R/NIrNySHYr1zAomTssvUFwCVXLmeSizj7XtGULAc6nTpN
	Iix5wD9BGVcL5uoP7ZrujhV6xeM4x4kstm6VoxjPGkY4sQPDfpvQunyNkPsCFcsy
	5c1GcpOOkbTSWfE9fArk3GxXSR+p6gizcYRzXAEu4HqHy0l70gEqV1rN0cEtbjLn
	cthjbRGuZmBEDj7APlm0p7+hAfmy3gKh+IpxbGWCHSUnm372TW6ieBnCrh9Vz2bp
	6bYs9w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv882q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:00:40 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b53bfc9534so192765c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794956439; x=1795561239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wyYVsbnjSgxZrolaAwdyDnBFwjgdkdQVgoD2DRLJVBo=;
        b=Y8uhyioBgjamV1DI0NdYUsJHzFQvkYI+4QKtG8iwT6jXGibVvKS/9qNb141maEupGU
         ftzwNynjLZ/ffs3mwHcO8wijoDjp3jtjCm58xmODy27uA/MGSoB4pE/XwtdE/Z7oYdZI
         kJZTNHzZ3q4B1jSx8qZ3F+0Vucl7O5TOfLa33MYs1+LJP5VKGwgbR4dgQ5RxTmf5cYqJ
         dc6ZFWgJKectrFJa0un38hqpKFKb3TyME5eJ6HyVMkL6woyuBjrMeuZrDk6Zw+LHkW+4
         M6ix0M2R9aHvmSwtbb/M0AvZlA267OxpnicNKUUbFoA4vjl20jcv+2xhIaX3RzDoNjer
         VxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956439; x=1795561239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wyYVsbnjSgxZrolaAwdyDnBFwjgdkdQVgoD2DRLJVBo=;
        b=yQGPBYmxtlsB9Bxac+W3roCC9DJV9aJce2GCClLIU/KsZQ4NZ48Qteu/HMZitkJAwh
         7QlMdU96IEeEfBajP88hFBYt8PGN6JKSLbm+qHlHK5waM+hbBdlAnqjpQaAIqkKf3sWR
         5OtlrZbo9md1ZFCTP5uPYlvQ3MJ6P7GIHb7IJKhoArPoCITSBjUiAcu+bIeTn3t/+xoT
         /ybOKiGXQBxrUBR/ScKnoLlS+NzB5LopFoRuVQs45gqAFBg2rWWquNnYeR1hfgLBCtbo
         4K4pbTKIw0hz5iIRAtbQqQph37a9IyWkZtbZ4BpPGSbAx6XLQfzkP5T8u1ugs8PYtGO9
         THyA==
X-Forwarded-Encrypted: i=1; AL+hErEKp3P0uftqEjCiX6SZBHU7YRBP7m6nDFQWfJEsymIjK0D/MYKXuWrV1x95gPWG+D9epSGBrzUvueef9vI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V4emqCs+N2r+in3qG//LxvLrmmtLm/u22pFbEyGqsfqyLOg+b
	b97auy5KF6AX2jCuLT0YOejj9G1m9sNwP5pgDM1Lm/27mXNh/yZy4+CP6kOw68hpViWNiFXosom
	Gez1FyPen1Kc+xJPKmHVBRMgljH5iACJfKdURPSKBqqH660y0mfthuTbJj0DuWzRjYYw=
X-Gm-Gg: AYBFou1YXsovifGCy5Xq2bAlzD1CU0W7D1Q1vivuAC7iuT5inNM0ZROCcAINdguFRDE
	rHIHBTdyLjqbWvhJ46mwEHx9elDv82BmXaVhMUopv7VX/ahBrY1hxw2DWa9zmV1fj7jjrmhEPyn
	5voK+65lkRiTIoDtADxmHNW8bPbJ5q3UPwonOmLYcBQa9uWkv2wTh7zlx6SBn5JeD/CMjJUmNOW
	3CxwKgVf7pTAhMETClUdSkeqv1xSL1YdanD+CF4sJ0XCWy1Gl0AFUj/xC6eI8Qe1TucWHKAIKDw
	bqRcVrdnDqEqRXidfqK0JsaZo0gVZiloDkXpdeCCd065beue98oj/V+lE1Rsc1ArBUs6DCD1lCN
	33Kvz9WjWc+/vb3Sa8mau+/2cIQ93PM22T/uCZzpqfETaYlJiBjiWFbMv1qairgY8IKXJHhmurQ
	==
X-Received: by 2002:a05:701a:cc82:10b0:1b5:22fb:848d with SMTP id a92af1059eb24-1b543cb3e8fmr889032c88.16.1794956439051;
        Tue, 17 Nov 2026 15:00:39 -0800 (PST)
X-Received: by 2002:a05:701a:cc82:10b0:1b5:22fb:848d with SMTP id a92af1059eb24-1b543cb3e8fmr888979c88.16.1794956438333;
        Tue, 17 Nov 2026 15:00:38 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm1380839c88.0.2026.11.17.15.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:00:37 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 04:30:04 +0530
Subject: [PATCH v2 1/5] drm/msm/a6xx: Add Adreno 753 support
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
Message-Id: <20261118-nord-gpu1-v2-1-8d6d9908b7c5@oss.qualcomm.com>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
In-Reply-To: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794956423; l=5375;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=XPMx9YeTMn3NW5my/QSibulL4PbEkf63zt5e+XGribE=;
 b=iQMioyMW+Gvwiy55j00nRWZ/pCqgAtJMxr8lzXpjw5zjYAooUHT6Dqslag4VAiHXESG2z8yWL
 1tgkT/OatFMCZ8oeyQfQI9bi+jZcFuHBIs8pCcOtktDzRS2DaS0MSEJ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: TUM2G6O4r_WRLnfLeIq727q4PybTy0rS
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afcdc98 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hH_-AztgxIDa4u2WOLkA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX/EFLsge2JMdM
 v0EdO0k/IsTuSxBPZzzBHelWtZ+WKt/6/racYeq2IdtZ6ERufmO6DVm6EvR0Ob8b3jEg0mRI5Uh
 wBLjqOfZjHrWrEtgpVhY3vk69Xb+MVgG9jVOlOmxAqanGfFJDZPoN4LClaKxc9QE8OS93uBdQPm
 mly4nxZGOHnAw8RTSlIR0Z2rh8iMKuWuJilvEyamyueAx0H+xBIk1vceoGk5be/5bcroK3ZxEpQ
 lfOsguXsRNeWdb2ztwKuTHi8hLRkgt9ifckvC2naC5mZdZzm4GkZ3L9yZqibueF/9zHIEOyRzJA
 zeIWZnom1SiNdrChY1/aahes5qzzg8CVicCnc6d/tZQ3oIHCRUZqHqeDkF0lrPTOaU7R1o0vJ/J
 O3Wlkd7OqLV/3cqJiBfov48Df6Q8zp7UiyuRX9yk3CDI5+1cMeY0+Q7xfFq/+G6kr4pAfBwCLTT
 wREv6L+9fROjPSTA0ig==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX1EwiRrUURfN6
 EPFdrqA8QmS7BarSriM4/wSrtZWo/Mj2tGBKHP0fNz03WyE8tUsRm+atne9Szf6KsLOlxMf/cqf
 iXF5GPkBlUFwSgCCOM3OVsPc1BZqbRI=
X-Proofpoint-GUID: TUM2G6O4r_WRLnfLeIq727q4PybTy0rS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170091

From: Shivam Rawat <shivrawa@qti.qualcomm.com>

Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
the A7xx Gen3 family. It is derived from A750 and shares the same
IP-level configuration: protected registers, pwrup/IFPC register lists,
GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
record size. The differences visible to the KMD are the chip id
(0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
firmware.

The Nord primary GPU is the same as A750 but has a different chip id,
so it needs its own catalog entry. Add a new catalog entry for this
GPU and an adreno_is_a753() helper. HW clock gating is not working at
the moment, so it is kept disabled for now.

Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  6 ++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  5 ++++-
 drivers/gpu/drm/msm/adreno/a7xx_catalog.c | 35 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  5 +++++
 4 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index a1561ca41a5b..0fa2d2091f3e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1051,7 +1051,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	for (int i = 0; (gbif_cx && gbif_cx[i].offset); i++)
 		gpu_write(gpu, gbif_cx[i].offset, gbif_cx[i].value);
 
-	if (adreno_is_a8xx(adreno_gpu)) {
+	if (adreno_is_a8xx(adreno_gpu) || adreno_is_a753(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_GBIF_CX_CONFIG, 0x20023000);
 		gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
 	} else if (adreno_is_a722(adreno_gpu))
@@ -1227,7 +1227,9 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
 	if (test_bit(GMU_STATUS_SECURE_INIT, &gmu->status))
 		return 0;
 
-	if (adreno_is_a750(adreno_gpu) || adreno_is_a8xx(adreno_gpu)) {
+	if (adreno_is_a750(adreno_gpu) ||
+	    adreno_is_a753(adreno_gpu) ||
+	    adreno_is_a8xx(adreno_gpu)) {
 		/*
 		 * Assume that if qcom scm isn't available, that whatever
 		 * replacement allows writing the fuse register ourselves.
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3e4afaa5345f..ee885c663ac1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -651,6 +651,9 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
 		return;
 
+	if (adreno_is_a753(adreno_gpu))
+		state = false;
+
 	if (adreno_is_a630(adreno_gpu))
 		clock_cntl_on = 0x8aa8aa02;
 	else if (adreno_is_a610(adreno_gpu) || adreno_is_a612(adreno_gpu))
@@ -1421,7 +1424,7 @@ static int hw_init(struct msm_gpu *gpu)
 				  BIT(6) | BIT(5) | BIT(3) | BIT(2) | BIT(1));
 	}
 
-	if (adreno_is_a750(adreno_gpu)) {
+	if (adreno_is_a750(adreno_gpu) || adreno_is_a753(adreno_gpu)) {
 		/* Disable ubwc merged UFC request feature */
 		gpu_rmw(gpu, REG_A6XX_RB_CMP_DBG_ECO_CNTL, BIT(19), BIT(19));
 
diff --git a/drivers/gpu/drm/msm/adreno/a7xx_catalog.c b/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
index 6f704898cea6..9465ffa3dd12 100644
--- a/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
@@ -451,6 +451,41 @@ static const struct adreno_info a7xx_gpus[] = {
 			},
 		},
 		.preempt_record_size = 3572 * SZ_1K,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x43051701), /* "C523v2" */
+		.family = ADRENO_7XX_GEN3,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen71300_sqe.fw",
+			[ADRENO_FW_GMU] = "gen71300_gmu.bin",
+		},
+		.gmem = 3 * SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION |
+			  ADRENO_QUIRK_IFPC,
+		.funcs = &a7xx_gpu_funcs,
+		.a6xx = &(const struct a6xx_info) {
+			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.dyn_pwrup_reglist = &a7xx_dyn_pwrup_reglist,
+			.ifpc_reglist = &a750_ifpc_reglist,
+			.gbif_cx = a640_gbif,
+			.gmu_chipid = 0x70d0000,
+			.gmu_cgc_mode = 0x00020202,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 10687500,
+				},
+				{ /* sentinel */ },
+			},
+		},
+		.preempt_record_size = 3572 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43030c00),
 		.family = ADRENO_7XX_GEN2,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 4b2156825bdf..2911d440ab17 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -559,6 +559,11 @@ static inline int adreno_is_a750(struct adreno_gpu *gpu)
 	return gpu->info->chip_ids[0] == 0x43051401;
 }
 
+static inline int adreno_is_a753(struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x43051701;
+}
+
 static inline int adreno_is_x185(struct adreno_gpu *gpu)
 {
 	return gpu->info->chip_ids[0] == 0x43050c01;

-- 
2.55.0

