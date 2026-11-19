Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076754;
	b=Mbz4fAtp3sQTYkrJLelVIy4K5WbLtYAPmHlX0YHb73gtbemaJ+IUQQJka6QcoyVdvLSC
	 qTgXbB6FItoUsVW+JzNlK7Suds2tJhwbGQAv51+6J6cFbFxnzkjjyEiZZdsyvxqzR+u5J
	 pN5MGvrcYnvecNe07hVVxHIfcUzstgbckWQLMh6KIt4ZqIaT9FxF0Q+f32q95hmgBDMFf
	 aRja5aoTql3Dm9Vvnj0JDhWMek0SzqvCV4oIiF47zIdeu7WD9j/wtScl3nlCysvMRCWp8
	 goztDyh83/AQsjf9c2VLnDpvMHJZCISlsvM9pgiX6FE/DDwl6LE/GmIqRD6Wy1OU6Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076754;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j4YaO0ZYpT/FRxBM0qcc+7tzTgK+KPS5LT6PmLgtxE8=;
	b=xYxyllNevS4X4urNoEFIg6gNDUSdGpx/f99hcdmZWEz2aorjRLSkV2ukluUlo4KUWK7l
	 fAW7Wht97ktITUQrnOrB5hnOVaeVzRKjoAyTzfyHAZnEo8/FBDXiyzHp4H4ABTUwLDEqP
	 wbJdsOF5sh/zxqcxJNgGXl2DCVPfb5ZV9avlzpB+nnfaQVQIBraTBMDjmHd1rfx7zMa4i
	 tfZJA58Pc5lRQUw0m802TLHwFIuRcJBwp5RLHYYCuilzLj0vsprSBN66tffk0AuCxvsmz
	 Tk5LZoPVrqihDAPgiqhmaptFpYGDC/R+2EYwjTis6FJ0USyl46XgDujAWkARmiu4l6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrqMU72R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ilpclyp6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CE6606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58CE6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrqMU72R;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ilpclyp6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6wNek1535194
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j4YaO0ZYpT/FRxBM0qcc+7tzTgK+KPS5LT6PmLgtxE8=; b=mrqMU72RwCR8e/Bw
	hpq45S/bOuJOy8zZRHAXsklXiSyFQZLOIkfvloaiiy1NpPFyZV/nOQKK2x2/8t/p
	BFv3fJpYBs+WnEM3s8lNeCMOPLDcaDwlKTQUoZauqs6Zae+DTBz23uwKP+XhRjcf
	KtqNeG4FXe8J+0V8ZHJZgi+GXkp/5VV6iQUJfeIWGXpN/qn5SgsY3BBgATZqcsGt
	IS2xamnHnYILjowomeWqHl3Om7ufMcC9OhnHoK2Kln/g9ivd15jmoF7ZfX0X3D3V
	cC5GiyQ8k16aEQBtHJxlVLs5RohhIlgwTmtCeyUlpm6OMZkOMg0kkyvM5DBX56LL
	qUmN+A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpcc5r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so420868685a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076752; x=1795681552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4YaO0ZYpT/FRxBM0qcc+7tzTgK+KPS5LT6PmLgtxE8=;
        b=ilpclyp6M67XbX1sJ+/CR7vkuZ/VY1SIrLPR/MVESTUyie9z0SCC+3s8X4QsSRAB3f
         5VvvuPIChIm65u/GWaHFpSBNJe34ioHpWnMlgfYJJ7IcPV7Z0v38HKDOKRy5Ojq4t1Gb
         bAuTUaqaK611bJn49aCp6xt2/Rx5041O0KNwHBRdNigwd7qsSXB96j8q11qvKE3p2prF
         nx+i2EDPlWFy/DXVdUOSrZXT2nWKEQ9Lzt5yY/bfQd7A9F8ErL/FpySijk1IyRM2X4WH
         vYUHR0Hs6AXmlszsHrTA0Pm4FIxOljWMSwuDevaH3l3VYcod/wDLghfsZ8urD/YUWlds
         EIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076752; x=1795681552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4YaO0ZYpT/FRxBM0qcc+7tzTgK+KPS5LT6PmLgtxE8=;
        b=KaX6BfIDOxdT5wcEQRW812+LhVjrWFEhdRlAdVzEJGWRcc7Zz7PBsA9FvThf7fvUgl
         wL/LtZhIZGwT3TlbvsaNYPVryet3KY+pIFUYLDTRSqI0ePHlV1PAjvYrWLF3puLw2mIm
         oUULyGh/yO3iiUnEYPDNLQU35ANbORJfB0PYRwlFD2nZ3vK6YME1L868lV7HnqLSXRkW
         RBjp6ID95YEa5isqxjJOLEPORq8axYERcprvGUtl6zECGY5fn2edj+r7OhLg9dN7xvj7
         oZboOpOgaLtKgOSGjUTKoLxJNaSYEyLyukAS5WHikMu1dsGJMKHrO/J8s9HSIJSnmmso
         fFqw==
X-Forwarded-Encrypted: i=1; AL+hErHTs8tzPP2I/aWfD8JBw8uVIABYqO6dvwq0U7apnrvssHtQAvv+nwQ//aTE0Anu8H5rat7TNFC/fGeiqk4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oZ+nmhUiGJjMO2kBdHI1oYQENU2elkeLdnzGNs8nzaoWHCUMl
	vpAsiNL45Ud/HKGXGh+EVBI95QYWj4C7S/JX1+D9OnRZ7zYU3Fd+RErh603xjWFJw7dohxWx+Xe
	rXZkilU0muErjfqo6BeAPaEduOlxyMjPQ7DEZg12qPiIYzLKEBSqP/gqwF2KUhDFvegE=
X-Gm-Gg: AYBFou1fzY9aPwRsEa7mqZBSu1pAAXCjV/t4EwCl2B8xuIcQPnqL2Ms4VgElpnB6Rfw
	Qb+nZhjGm+sSyq6JhXlRpZ2B8+xfo/00jC+6rhQXlLkn9gD/OwBbBT+3V6KCRDb5XAfY1bRENvN
	lg5U/UZxBKQr8N65hcPuPWPCYVn8imhWhpYMqZjJHU9cXDm1iAZaoTvY+CxfUWqN9JWJn5PhQRw
	L5F1jP1Q2wkCTKO9P+HpnK9yQaWAayBR5IKFKJGxrJDlvu+zakT3Zav37LXmKO4E4b5xmJF0dAG
	c6HnFsZoUiY5TkpaKRCQzUJPvPDKie7Jnmaue65IM/Xm+nmhaf9alFsQqhxp0fx3uTlUJQdFnAn
	lnMxuvCfJ0Sxvjku4bSzM0d/288ir79Ww+sDuIA9vbDY5ap849rqFL4wezSCTbH14IEMuVRAkzA
	fXW3uyZdiki0qk8BkxmpK+Sn6W+/Kh38scYEkK
X-Received: by 2002:a05:620a:19a4:b0:949:7656:ca0a with SMTP id af79cd13be357-949995b3446mr967705785a.35.1795076752434;
        Thu, 19 Nov 2026 00:25:52 -0800 (PST)
X-Received: by 2002:a05:620a:19a4:b0:949:7656:ca0a with SMTP id af79cd13be357-949995b3446mr967703085a.35.1795076751880;
        Thu, 19 Nov 2026 00:25:51 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:25:51 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:18 +0800
Subject: [PATCH v9 16/29] drm/msm/dpu: add per-stream MST encoders
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
Message-Id: <20261119-msm-dp-mst-v9-16-ca61be4edfc3@oss.qualcomm.com>
References: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
In-Reply-To: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=5908;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=y5jRzeNla1e8Iwt1s5LRc06RYsVeZV4O7u84IZgL2qk=;
 b=YXb7dK2Y0C8iU3tKJ19krcBiKXjTJ99U7QeYpJcArJZQn2kMsv4+pys1oNx8gRqzWQ/VJK9UJ
 81EeLLxFd3+Ak2uIgdhANCJ0+p3imfZlKXhz7ZxJANYeFgQtTaIQwJ/
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afeb291 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=aoVTMipVTiCx4Xnk7jUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX2ONtUZYvdoyT
 JX/oDw5WE0eN9VS+HUB1Ug35spSI8FEE2fJE+Nzz1sQOjf6Sl/vmmQhibtAd2Du0FMfuLAL7uBF
 2NQBmByj1YY4trRi9lzh+hFTaE7tzMO8GiawahBN+l6nsexOs9to8mO3SiSXJGfqZyoTAk94uR/
 hWG/oTRLptDUcCMH4AaFPuDMkPdLnJ6OXJ1G5/nn6SyF5ifalgI0JxP1/XGTahEz4socgYCPQ49
 biTjDJpSWquUlLrQqQYp//KSDl2kcjL2l3nlKKukagYS4KpOrIOs+BOo7tEhqgHgnrZhPSoSwWz
 2sROsGQD/X2N/KmGa9aNBURx4Tl4KckNlBBJjGt09g6GY3dnxJuEF2crBzeaAv8g9OyswB3kW8p
 wgYUMN1Dg2oizoj9+heJB1k5uWijF2k0m1lfOb0yID15WByuUnkc+sz33vfzLXbd6VfKzUOokrf
 3J+4/TpKB+WD+aQ/icQ==
X-Proofpoint-ORIG-GUID: 9_fKbA7nZhyNCcDksE89MQY-WNjXrkNw
X-Proofpoint-GUID: 9_fKbA7nZhyNCcDksE89MQY-WNjXrkNw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX7AY/Grbod1p8
 t048yZ9bBmsrQ2Bkq02COJYUrHI1VH9IqkhoeieoGmDThawnBk41Y3a7liCnxrUULo1NZrqtnFF
 vBDYH/JgunLbyhDkln2AWE4hwichXFs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190033

Unlike SST, where a DP controller is represented by a single encoder,
MST requires an encoder instance for each stream.

Create one DRM encoder per MST stream, associate it with a stream ID,
and initialize it with MST-specific encoder helper callbacks.

This establishes the per-stream encoder infrastructure required for DP
MST support.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 23 ++++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 15 +++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.c         | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h         |  2 ++
 drivers/gpu/drm/msm/msm_drv.h               |  9 +++++++++
 5 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index a8dcc8c684eb..802cb62fc010 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2742,6 +2742,24 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 	.atomic_enable = dpu_encoder_virt_atomic_enable,
 };
 
+static void dpu_encoder_mst_atomic_enable(struct drm_encoder *enc,
+				      struct drm_atomic_commit *state)
+{
+	dpu_encoder_virt_atomic_enable(enc, state);
+}
+
+static void dpu_encoder_mst_atomic_disable(struct drm_encoder *enc,
+				       struct drm_atomic_commit *state)
+{
+	dpu_encoder_virt_atomic_disable(enc, state);
+}
+
+static const struct drm_encoder_helper_funcs dpu_mst_encoder_helper_funcs = {
+	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
+	.atomic_enable   = dpu_encoder_mst_atomic_enable,
+	.atomic_disable  = dpu_encoder_mst_atomic_disable,
+};
+
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
 	.debugfs_init = dpu_encoder_debugfs_init,
 };
@@ -2767,7 +2785,10 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 	if (IS_ERR(dpu_enc))
 		return ERR_CAST(dpu_enc);
 
-	drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
+	if (drm_enc_mode == DRM_MODE_ENCODER_DPMST)
+		drm_encoder_helper_add(&dpu_enc->base, &dpu_mst_encoder_helper_funcs);
+	else
+		drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
 
 	spin_lock_init(&dpu_enc->enc_spinlock);
 	dpu_enc->enabled = false;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 3c3203ca32c7..92691d39dcb2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -688,6 +688,21 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 				return rc;
 			}
 		}
+
+		for (int stream_id = 0; stream_cnt > 1 && stream_id < stream_cnt; stream_id++) {
+			info.stream_id = stream_id;
+			encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
+			if (IS_ERR(encoder)) {
+				DPU_ERROR("encoder init failed for dp mst display\n");
+				return PTR_ERR(encoder);
+			}
+
+			rc = msm_dp_mst_attach_encoder(priv->kms->dp[i], stream_id, encoder);
+			if (rc) {
+				DPU_ERROR("dp_mst attach_encoder failed, rc = %d\n", rc);
+				return rc;
+			}
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index a2900ff3b0ab..ef5fb70863b8 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -147,6 +147,26 @@ static int msm_dp_mst_encoder_stream_id(struct msm_dp_mst *mst,
 	return -1;
 }
 
+int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
+			      struct drm_encoder *encoder)
+{
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	struct msm_dp_panel *dp_panel;
+
+	dp_panel = msm_dp_display_get_panel(dp_display, stream_id);
+	if (!dp_panel) {
+		drm_err(dp_display->drm_dev,
+			"[MST] failed to allocate panel for stream %d\n", stream_id);
+		return -ENOMEM;
+	}
+
+	mst->mst_encoders[stream_id].enc = encoder;
+	mst->mst_encoders[stream_id].stream_id = stream_id;
+	mst->mst_encoders[stream_id].dp_panel = dp_panel;
+
+	return 0;
+}
+
 static struct drm_encoder *
 msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_commit *state)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 7f35e7524cfd..3cbd2a674675 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -9,5 +9,7 @@
 
 int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
 void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display);
+int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
+			      struct drm_encoder *encoder);
 
 #endif /* _DP_MST_DRM_H_ */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 31ab50f620bc..cc665888ce7f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -360,6 +360,8 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
 int msm_dp_mst_register(struct msm_dp *dp_display);
 void msm_dp_mst_unregister(struct msm_dp *dp_display);
+int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
+			      struct drm_encoder *encoder);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -406,6 +408,13 @@ static inline void msm_dp_mst_unregister(struct msm_dp *dp_display)
 {
 }
 
+static inline int msm_dp_mst_attach_encoder(struct msm_dp *dp_display,
+					    unsigned int stream_id,
+					    struct drm_encoder *encoder)
+{
+	return -EINVAL;
+}
+
 #endif
 
 #ifdef CONFIG_DRM_MSM_MDP4

-- 
2.43.0

