Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808713;
	b=XPMnMLyT2JhFslQ4mSM8OToAvSoLSQk9PU32iG4pZheYXRv9VmGoP0nFVwvljgqpJ04S
	 RBYLWE3O7wOlJQoHV2WWq5nZ4Q93ksfsbCQmYyeOeyq4RTzUA+DNGxdT02m0iK8c83dMf
	 bGP5KJH0fi00ExfuR9zLKQcj9a0qmznz5mJoYipp3YhgeZGYTG/tbYxNxYp2dedCmMbAg
	 QKhsoQz18I7qW0CiAM3bpxGu12zpKWpO0sU0GcpmbFJ8nBJO/K2hllqfOo+czR47E3e7s
	 Q6nTnMUFwEhVfRPmq+1NpaoW8WbJggJpzf1EekFX3nrijjDa9C1zZ3xjsT4ibDlS9zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hwNG2bG+XTPWI3596iFZ/msYtqga2lGkUMVk/EaARXc=;
	b=ZTBKo6uptGsrJZY+Eh9PtQe+iGxkOT5LFikcW77gghTD6lx6GfpXRdj3Myy7XUiIiuF6
	 HwZw+0qnroVIJAfrXtHYaJ0SJc+EYGjQn60b55/gxQqRzeqeLJw58L3EDQwkek1RaTQDk
	 1W0BD70Bl0T62085xx8JQ/MW75uS4FamCv4ez+F53FOHtFWnD7GQBQP4ynowfEdK2fMyB
	 TCA1Xb5/8CL8ERFtOp0Hcsw/kfP8EvvC2e9XuzyLahc//dOcw5AQ6JeUYDKmu+M4+yiQl
	 IEMMHRI3RroQX3MOZPdQ66tcGjUm6ciCPAYhaciNT3mSOAYZjtGc6x3Vta1c+SRZz9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3dc27p2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z4VxJiSO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B68606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3B68606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3dc27p2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z4VxJiSO
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJRH342668919
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hwNG2bG+XTPWI3596iFZ/msYtqga2lGkUMVk/EaARXc=; b=U3dc27p2k4VVY2+2
	xMUAePyEVFBkJ/HC6Pyv1ZmJV69zKrong1Dh0D76out/4APji81IMTdOzHeHfiTj
	sleu5T6RgS/gU5kiIfb0jeH91Ql2s4CJdoIstfUwuCqUKWUIVaROcaNeOGBlpzlb
	sO6H0lpaLqXp7TdXjaJbhhJwckiYdswmhUO3KtxjakJHkJgq149zHaF0ccxoJG/e
	3MZV4zNWtOyM/7Oz86lZK2Ed3JsDiUVBcsWG/L0QpmleUlEFIb+Ka9Pt7SP9XGyF
	TAYOUCxiQ/poo9UomDj+Xb7NqUqCFIJSc07W2TPyB75dSfIpTj50PTJgypzSgZZ7
	7vDwzQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g1jg1da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9211d51dcefso151492866d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808711; x=1796413511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwNG2bG+XTPWI3596iFZ/msYtqga2lGkUMVk/EaARXc=;
        b=Z4VxJiSOnWiv4lwOTIs0kyJaLoV99KpB5hBRRC5XL5vCvcBjHh8hzJFLu4svl0rW67
         SPIuJCd4Mhjjja/EZMsVB1gdg9rZ+7I3aOSaYfOKjS6WvVbzFVrxi0SCpdV0xYDdeQBk
         q36jxxC2lEP+RdeeILs5KP78ZQg3TnJMt4bVtvDOHxAAImlppPu9j+GGv/TZc+jYWNYT
         zNVowyVU1fgyQSIoZcpb8A028mU/AjzLPEftplB2s6EjkSEJUU4uaG99SzpuYoGKVFOE
         QcHRD+Dbc9m5cqNzueO/nh+akqFEy3L5zXasmb0L3Ee2WlwCVte8ZP8rQiHfgA6k9zzB
         rmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808711; x=1796413511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hwNG2bG+XTPWI3596iFZ/msYtqga2lGkUMVk/EaARXc=;
        b=W11gFMjRACJE7xGLkLR34GZx7NcNf1bTi7R1AQ/8wRLZ9Id+RIhXGexX6t10Udy4UD
         ikxXhSt2nA0JeKLyB5RtYuFUX9nGsWJhNy8w8i17wQ0mxrj3zSiwRJVLGv0Htv4vXNH6
         w6O2ne7E5Rdpij7kDEjVN59cLBhU+IjXaLgjWIL/EmPIZ/PVSZosXmzewjENx562cFIB
         ZfTrNOVkScrA+rmib2RBLnmhPRj8mi1hDs2RoErrZ6DadSKD3kiWltAhrq3y7YUtx4QY
         O2/WIG9ChGpzQQRafxFk31V1IeanQxag0Nl262+HQBRqB4xkurFDHi/xEvP0o2hL4qR1
         AzKQ==
X-Forwarded-Encrypted: i=1; AL+hErHCkj5vjExry4WFC51QWUftViOMuybvXbxeC7i8vqRReXeAvEZ3CfIyvqC1dPU5lj7y6W3hXbfFhilDIhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f2SdLMDSG1UZkKDK0WoTD8RFI1c9HcN5hlRRDHjz6Xl6cDW4j
	GzinlFh8N7pF85KoackdIOQDVqJacRPfIpvrc4G5zbXsVRP8+TU2nLLaYMpWeTa7QzepqmmXThB
	6QVlHzK7J2IbHi8sqWGKzAKvWOwVQhup4tZ74Ar+jmXcSsG+owzdHBILXQBovkL509kE=
X-Gm-Gg: AZFdTZd3ggKNnaiTPHJ7nlPxlffsof4wpB9TdNp+ZzgIyJKyxzPmnollX+2HT4Mn4LX
	NKmK6kUl442aViHC8ybTS8bz7BCGP0kke1qoepY007GTpECYKs/gw0z02QAsh/qp+afepqzbWlU
	/nH4jeHQflIjItNOYV98Px9WKNIN1RvkCejw0n5X7H5AJGq8qXQi8Fm6Vc+nD5WySemzLXAoPIP
	8sE01lo3yjQP2Ybr7BkQc9N0PKX4mjd74JzFJWNeEb8Tfip02HsH4Bbjj4CBVGd9jU8oYh9u2gR
	K5gksu05cpWjZFprGckjtS4OIbvmAzSodxUjGsAeQL3G1YT7blOulRDhEY115PUaamXcbVGs/iK
	5cbG1l7Pcvh/VHM7fDx5ykIsXXQf1ZKN6FBljkbGRLVFeeHIHS5yADkq4tA0mMbLYNxrb3IlwxK
	tAd51YHEehE4IPr9P9ijquPtvpVIU4Hg0dlPg9nyeRoIDildcvX91oV1p+A4++/A==
X-Received: by 2002:a05:620a:40c2:b0:949:6768:fae8 with SMTP id af79cd13be357-949ba9e160bmr4631493885a.49.1795808710778;
        Fri, 27 Nov 2026 11:45:10 -0800 (PST)
X-Received: by 2002:a05:620a:40c2:b0:949:6768:fae8 with SMTP id af79cd13be357-949ba9e160bmr4631487785a.49.1795808710297;
        Fri, 27 Nov 2026 11:45:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:45:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 21:44:24 +0200
Subject: [PATCH v4 11/14] drm/msm/dpu: clean up the self-refresh helpers on
 teardown
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
Message-Id: <20261127-msm-kms-destroy-fixes-v4-11-242b0a3f8e47@oss.qualcomm.com>
References: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
In-Reply-To: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2200;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=D/uWkxcvDmXzNDWbOytGgnOpR8lFPnO6KIN97YblHnw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2pv7q3g4iU6+NyAMh9IDYZqTyzPL49qurKH
 qDOv7/cHGSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndqQAKCRCLPIo+Aiko
 1QqeB/94oTDnZNMGJ6YKAksRLJJdpbjeiRB956P/JWKiejc/Vv0hieQseh3gQhxFbGMtXR75sd4
 bURWLq8gHYa2CUpVvSR6Ak+rbVKdFMNP4q0mbAzcqNFnLwnMsJdjm7Qqm7srZh5TExp3umG8hpM
 yIC2hTx9mAzGn5h/TOAcr+Oo8oiX/TRhmAmgthAikS6NVKDE30ppFnq0U4IXAqXpxpt+TGf46YL
 I+gf3vZnC4TwOGNvuLrdwTuEZN3SDuj4Prbn5F/dpv3EvH1cns8o5+Ec4uejqYaMz9klK+rBzLB
 p4nhQITPDG870+P11onzAui0hzHUj6eku9iqLj0euXT/ZQqN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfXxmJCShWx1lpW
 g5WlE6hEiqW+LxekZMTXc/2wrz+liQXYrffyxVJra+wCXaM6IEvqho8h8QnDkUe9tdJ31SXMHGL
 Xz/VO5+mhtycbg5ruGK+U/2lav11yjOL2l934tFdeJguUX4hpox28bEv6mLEhxE0Y/9vQiKKKXQ
 IcroCPMbVg3O4PX27r9bh/CD0Tz7egVSH4t1RdXG+LZwQMVTAYUDI2SMNyD8tWjtmLkj96CGzVc
 4NnbE8FFAmxsP94fu7E4eB0kwllO7GVvziCK9DL9/hCPynHscBp1En9z/FfZ7lMmj9SMETeRaC1
 xIvOpTSOHsq/znrYd6G/SnYssyFNQxmVstEWpN1K4ugLAmmQvGNpQQzOUkjmOJnjfHyzX54jvZq
 YiReuckT1qEaf1cq0KUmSIJPWXUUyz69s3JFvv9zASTbV1124t4estlHoS0GhH2Dk9n4xNIp9k0
 eMaN36RcFidJDmqe5/Q==
X-Proofpoint-ORIG-GUID: S3jmNElFsOcH90fHw64k4eGR3Sw3LYf0
X-Authority-Analysis: v=2.4 cv=QpzLTlyd c=1 sm=1 tr=0 ts=6b09ddc7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=r-hXt3OJkovplFG2WMgA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: S3jmNElFsOcH90fHw64k4eGR3Sw3LYf0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX/uw3n/awX45M
 +QwdPYbvrU7d7tWTXjjGb9sQaLP55YUv6mLq+tSiV+CV5SZQn6WgDMBC436kRJkRqT+Fv5pbBJe
 8HHsEK+gMWTi0OD5NHbYTLrnpa5UuWc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270078

Unbinding the display driver on MSM8996 with DPU oopses about a second
later:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000870
  pc : drm_atomic_commit_alloc+0x10/0x9c
  lr : drm_self_refresh_helper_entry_work+0x5c/0x1dc

dpu_crtc_init() sets up the self-refresh helper for each CRTC, but
nothing ever calls drm_self_refresh_helper_cleanup(). Every modeset
commit, including the one which shuts the display down on unbind, queues
the delayed entry work of the helper, which then runs after the CRTC
and the DRM device have been freed, and its data is leaked.

Clean the helpers up when tearing down the DPU hardware, which cancels
the pending work while the KMS is still intact. Doing it from a managed
action instead would not be enough: the DRM device, and its managed
resources with it, outlives the unbind as long as userspace holds it
open.

Fixes: 1122697810e5 ("drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver")
Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 65ba8fa697e9..934ba47b2dae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -17,6 +17,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_self_refresh_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_writeback.h>
 
@@ -885,8 +886,18 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	return 0;
 }
 
+static void dpu_kms_self_refresh_cleanup(struct dpu_kms *dpu_kms)
+{
+	struct drm_crtc *crtc;
+
+	drm_for_each_crtc(crtc, dpu_kms->dev)
+		drm_self_refresh_helper_cleanup(crtc);
+}
+
 static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 {
+	dpu_kms_self_refresh_cleanup(dpu_kms);
+
 	dpu_kms->hw_intr = NULL;
 
 	/* safe to call these more than once during shutdown */

-- 
2.47.3

