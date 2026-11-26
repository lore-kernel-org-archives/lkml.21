Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674681;
	b=z7ajWLVnGWe8uQWLAEvdoTqsXEVNskiYi+HWvlQUzvKrkznBeCdUYLRx7TkvcgxAIjFK
	 ekZYksUje/BCsbnWo35MvL5+HjF94LjdhJ4S410tSKv5Nx8u4Lh/LpOuEkb+nZ0xrF7ax
	 VvqP1ZM3VTTaGGN8SzUYXRK3o9PsFTlxV1V//MtBrLhCYu0zU74TWeA1IgHnatJVuyHYo
	 xgGmfkpZr3ad1prO5PhAIqhdUpLxJmSpQXJ1mU15LzkXalD36cNhzdGoMfoTJVZYfjgHj
	 kyqVNNZJ0OWHkL5dek7lkmRwMjOfzCbbKQ/Ho1yOk2uv8XLXdfRsZTad7Lcak3/E/Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674681;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TRPs9xTWWhDxmrjGF62QzR1B12YtZbs2NVjgVgUhkyY=;
	b=zDevDbYkeXHMAOGCF36uLS3+LZYZF+v0PBAJ/5++69y25rrDYNNa2iR/Oi/jZNssX5qP
	 q8QSyB9cqOo31NJ1Gb1xSKXtA5UF1kAe3rowGcj8/pypniIpe2qTfonFrgJjVRelM6N61
	 epQLv+DDPvmOe2TZTPi5wniAdU770vhSy+nstGJENJww41VD2/OmKkeTI7t/EhVTnWUEz
	 NFbQ5E+1kaWtFP6BjQpxj9DVQc5CIBD1beOSAQ0gASRaLxtA/3o7u4HePQ6lQe2xzn32p
	 Ornvqe05bYSpSbpsg9W9dANeHo91XsMoakJ3nicPnzXJK3fif2JDZKvc3zHctjvBUVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dyxZAyeL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jRVuhtEe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAAD606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEAAD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dyxZAyeL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jRVuhtEe
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36h4o170335
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRPs9xTWWhDxmrjGF62QzR1B12YtZbs2NVjgVgUhkyY=; b=dyxZAyeLoXziSVdw
	iC+yD/BhrmXWs2Mz2znH4Q01zluMofdlXIxR8MV4t018xpMrfk29vykrKGoBUbjU
	f2KKzPVfy1YMtD/4lI3s7W/3GKUckaDZl+Dsiw5IW/mHCgBUoWbCeXknA9G1vFC9
	HWk9OgkSU+uIOwInOx1JlnNfUAB7gyVKZudqR/kLVUvgnCThtMKyyuAEp1W6ayR4
	9s/3owaeohBfYuXEKomSpIGxrA8Y7UQX7IU3sB+jcmVZ1MIVA4cAFFGEjoCB/0N1
	SM6aqc8pMmSfGNsTaCSKm77cAXs9ZobXeo9LGi6jSyf1hFV9NX2Li8C15GU5TGtM
	yBSlDQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukv9e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:31:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f04053e460so55074265ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674679; x=1796279479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRPs9xTWWhDxmrjGF62QzR1B12YtZbs2NVjgVgUhkyY=;
        b=jRVuhtEewchBlGFwxGsGSfrPG1EfDyfgZ+9Qy5hkL62a2nyUFJUA0++aacHqw+iBPb
         e+h0xwhqe1s/DRYtfxVcn2Kns6qQf74ECfyR+zYrjU3mm3SUD/lkfud5ua9a9tZdz+sX
         vuwW+DcXUcsszvxom+uTmqaa2xW3QvSeLvt0gc0An5zZDQne985TcXzDdHkAS+if9X/6
         yD/ptyr35ZQrHTp0dR0dLNDTSXyrng+cvFprxl4gstW1UcpiSFT1NvGZyluUe9q30V/b
         T2YNwFjtY7CqkfrFERpIPjqn1bvxdmONncY5ktGbosX8SMzql09PxwAlfS8BPPGqzUnb
         HDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674679; x=1796279479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRPs9xTWWhDxmrjGF62QzR1B12YtZbs2NVjgVgUhkyY=;
        b=izrFk6D5hHr1QTS4TaXA5ZdfuWqPy93yzk+x8ho4ONj0OQ9NigtMZLPA7l5VRTBpAf
         GLzEV0CVepFuszgxiCWP6TG2ijgU8A/714f6VAVQ60cO5Zgiiix8s5Hi6j0ttRUQWpMl
         VydVyVTR157ZupGZJ4XdhbkKkUZCo8zpYAegLg0YWc5PNpZyY3qu4bRK0CEtHMOEKbBO
         PzCiwvLAy4mPOU+KSejB2x75PErDSolQjVFPka1CMQAO+Uq3B0ySJDlw35s0gQ2QaFcS
         ZEXeWv45L/ffluAq+kSmHZRagNJ46BMJmqdVR6zmD2o1NzUa8MoGPzed4mFJ/OGTh4GA
         BMOg==
X-Forwarded-Encrypted: i=1; AL+hErFnf8XP+hs5saBzhmIiVRSuSJPMTIqpPV31Jq4KvU9eCBZAhiMiEOYbWgH/489M86EXiyIyVsLOBtCWP7I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DbviUzBVF7fcmFG7lYOFIOxtQkho7I2ljl5yYw5yvkytv0nSK
	veoTvKZduV8hitkszbkoYBvKD1HB3dMymyi0ru0nEP+6rkexBVB9AV0GF9yBVKn5EgyMByXEOdQ
	yW5YIVFq0/jAnuIOQRY1IMlTuu2ar+Qsdw7cKWqEsXK4A0f5HRGcm2F7gX/a39FpFhpA=
X-Gm-Gg: AZFdTZfn0Fzx6MLdTPUykKuBXtC5Lx4SQ/5K4BJB7BqqNSI3P8t/jHTw7KAZYoopYAn
	3P0rui4JubULYo1kPTna6HDeL7alpzgsqfOHV1/veBnmp0K3aoPYPraDFriosVfqsihDTMdNHB/
	qCQKw0bWNJoSF0+UEjCB+EUaWfl9loI+Jv2cMc0vSihmI1JGVdAetKK9uZycouhnbxqxPTRglrJ
	ApdGSldQNu8GwHAq7aIH6Bf8WJ1lh+y6995UtlVqg+scPCkB02JKY1xG7ODM29BiZ9cG/cXllHp
	MQKm+jw4BCQRaghW9WATWY61HS1dWQzeRaH3ItR7enwV+VCBVcDz3Grx8qSoC7sLII4YdvNT2ic
	kvGYsutkR/8kdB4x4PBc5+VzjBhkNUCmIl/QI4pG2S/F8EYRxZKR1sAgBnU7//RcOKd8rSobi0D
	DDc2H+WFpF
X-Received: by 2002:a17:903:2f87:b0:2e4:a360:fcc6 with SMTP id d9443c01a7336-2f03f1b6f35mr208059665ad.35.1795674678916;
        Wed, 25 Nov 2026 22:31:18 -0800 (PST)
X-Received: by 2002:a17:903:2f87:b0:2e4:a360:fcc6 with SMTP id d9443c01a7336-2f03f1b6f35mr208059285ad.35.1795674678428;
        Wed, 25 Nov 2026 22:31:18 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:31:18 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:21 +0530
Subject: [PATCH v3 13/21] drm/msm/dcp: Add DCP encoder
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-13-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=2743;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=PpQi3TK+4EMt9gGh4o3vbPSYlayx+DPAkJNGb6fSOT4=;
 b=rHX9dvqcJ5W/eFlpMpuncVY8cgdFvTmHcaNskFjZ1eUytMoYcapCuNhf2aQIK4txbmq7pybgW
 S5L86OZ/fOgCrflKIlH4nYxM8RLbY9i8OdHBkuuUSBl4OU4ccmJC+7Z
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b07d237 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qqiwZq75wgHyRPlt0ZYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: _6_lqPuc2rTUSkf1fheyvfygOGaR1wi2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX/heDHP4ARuFV
 RRQVm1mDiWKh45gCvxSILO0qsFdBi2F+aHsRiu77EQ9kUQbJkjDbfaChREiVEiRittKad5uXsRT
 XDZWlMOuRSAFYvC+6XoeCMsd88k4SII=
X-Proofpoint-GUID: _6_lqPuc2rTUSkf1fheyvfygOGaR1wi2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX1r0Y6v0a5Srv
 Ap2+T0zGjG6mdoCE0/d7S1S6HoCCrcFPgMkk5NgZnO3aw2ObZndaYlkEZ6o5jmJpzDWeczlBU6F
 v2nKwK9uHGW6LxSMxSAn1Em2XbS6quRM0PWszlJWcBYQUzDiNCV4ls+Lbg99DvgeHz0rpxYm7dE
 AxzVEIZfQDVOqROpGqJ6GG7WEjGPfBONMbkNVRVeX5nHFr/6KeGPZmizsYIDzJwNryYhMblcj9A
 WMnLVClH6JQ6LdXHoRmJB/bXAfYpNoWY1kfmFvWZ5qqvmEjaBDteT2Q2yPwMC/x7W7DJHGBuprS
 jdgpMwkw8+s5/lFwDKk/z5udCGOb7cl+M9Qu58HSFd74EpR4Qh3cvRB2b+DLfBAVjUOlI0aPSoX
 0fLbMT3bq6JuBI4lWJxPZ1LPypUdjkfws04G3EYxVehLmpzfy9b1dE4+rZbleZkTx/aN+F9ZTTG
 N/jwbt1AVixpu5Z2kXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

Create the DRM encoder required to connect a DCP CRTC to its
firmware-backed output bridge. The encoder must fit the existing MSM
DRM object model while remaining independent of bridge discovery and
KMS registration.

Implement the DCP encoder wrapper, allocation, and DRM object
initialization.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile          |  1 +
 drivers/gpu/drm/msm/dcp/dcp_encoder.c | 29 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_encoder.h | 16 ++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index d0fbd8bdd49a..7fc4861d19df 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -82,6 +82,7 @@ msm-display-$(CONFIG_DRM_MSM_DCP) += \
 	dcp/dcp_hfi_encoder.o \
 	dcp/dcp_hfi_kms.o \
 	dcp/dcp_hfi_plane.o \
+	dcp/dcp_encoder.o \
 	dcp/hfi/hfi_packer.o \
 	dcp/hfi/hfi_unpacker.o \
 	dcp/hfi/hfi_utils.o
diff --git a/drivers/gpu/drm/msm/dcp/dcp_encoder.c b/drivers/gpu/drm/msm/dcp/dcp_encoder.c
new file mode 100644
index 000000000000..e7a64c960bdc
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_encoder.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * DCP encoder wrapper for the CRTC-to-bridge connection.
+ * Hardware programming and mode sequencing are handled by the bridge and HFI.
+ */
+
+#include <drm/drm_encoder.h>
+#include <drm/drm_managed.h>
+
+#include "dcp_encoder.h"
+
+struct drm_encoder *dcp_encoder_init(struct drm_device *dev, int enc_type)
+{
+	struct drm_encoder *encoder;
+	int ret;
+
+	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
+	if (!encoder)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drmm_encoder_init(dev, encoder, NULL, enc_type, "encoder%d",
+				dev->mode_config.num_encoder);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return encoder;
+}
diff --git a/drivers/gpu/drm/msm/dcp/dcp_encoder.h b/drivers/gpu/drm/msm/dcp/dcp_encoder.h
new file mode 100644
index 000000000000..de40c9bca4bb
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_encoder.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * DCP encoder interface between the CRTC and bridge chain.
+ * Hardware programming is delegated to DCP firmware.
+ */
+
+#ifndef __DCP_ENCODER_H__
+#define __DCP_ENCODER_H__
+
+#include <drm/drm_encoder.h>
+
+struct drm_encoder *dcp_encoder_init(struct drm_device *dev, int enc_type);
+
+#endif /* __DCP_ENCODER_H__ */

-- 
2.43.0

