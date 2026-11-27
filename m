Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808714;
	b=W+vInjSXdKyyAT4WWrdwJAAbareN/oSGH319tZL8BPO+nkNozZVlaHyTge1aBAHvF1jY
	 kIE76/yl8gMXnOIKqBHKYDYJMSdPO5woi0yeXndB4Qx9no8cATdAU3feF3X6KtwYdaK2/
	 N8z/+gJ/hQIzDASoIADsBw78jCthgNq6jAnuzB9fDNlgz8/BMniz++dq51peyvQgDRTK5
	 d3drs6yGUiTdIbDONMSxkOVwBPcpBFu7kdJwuCv7Z0s7LBy56nMpPt3kkQXQgnddXGYnN
	 lYXhBLw1LaSfkwfXWRHiJ3vdYWqN4jAd72fKvwwmSX2BOV9fHsSdJhXjBQyMK2pRbBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rg5rgatsYgAUjn0TV/JmsO52huJMs9qOXDw8b3uaAGk=;
	b=YaPkzGXBhqxwYgzROQec9BgIqHshaON0sNfcypUt2MUSOy4wHs4QC+mIWC1tG4I7ox5D
	 v0JCm6/bTPU/C9m1dqS0yie7T92syh3iK5mCSwOrbrufJFqW5jJy5d805LKaK7oBLp4wm
	 tkPCR9jFZlNMoV9rM6Bgol22joTvJpk46FlyZtmbiG+2ocLVOzDVElPV4lUU+5Sq+aBUf
	 CYembRdMb7ZbenlK9GECPsGa74xzUQOX6VT5knen2JpJzq2kPEnqzKh07B4l5dmKmX37l
	 KwL+nvlshuFvAaJFAAjg31ZgUdl0vNuATyMnxJUzhY3foxF25eOEI6vOv1gVFeG0K/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJwoH8pE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c3ifj1nG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FCF606A68B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25FCF606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJwoH8pE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c3ifj1nG
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJBMEh3753210
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rg5rgatsYgAUjn0TV/JmsO52huJMs9qOXDw8b3uaAGk=; b=BJwoH8pEeWIyG797
	Qo6bvaOVdTNdEUoA5w1vfGDImV1fdrPLjumpJQSujBWkWHQ8etPDk880sjmEg2TN
	lUmn/ah0rMFV7ZwB748yqXCBJt6lMfV1MDj0i2l3cj3ZszgpFRPuZP8KKvfqTCgw
	XPmB8/9SjmGbJ+tCddw523+FhuUjZTt5iFPr6X0TCgJeHawRcdtdW+1XIaMDjCkN
	j8za9cyXNeDAMvOgcBJGmPTg4a1TDXCH1NvZZdniw4w7Mr27GBAQGcZcTUhz6JzW
	YcybEiZE8G/aMzVNYHMNLas6myrYFG5DLn9tE0Osq5RgGeHH7XtKBClniq5vQpQf
	eHFkUQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74ghapnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961ed97d6so1382370685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808712; x=1796413512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rg5rgatsYgAUjn0TV/JmsO52huJMs9qOXDw8b3uaAGk=;
        b=c3ifj1nG6TZIw2SwiEhpkzmV41xfAELnU8CC+X0ZV+Dw50lbXlgC2w8hyDYsbyFNl6
         dqgSEyI+nqIHu+qPkrX5gwywgds9Qinte9cJrepL+n2dxyi8jFE8lPC4wUd0y9IsCoz3
         t5+DG1Uz2lXtEh4SElIUWGg73KDWcOtbCMjwfoBFUvjr8zv/XlLcg/7oyxhK40PU+Qmr
         1OWV3W3laHxltWwhSLcBS1d0Z7//vOFZToEOJxD105/AH5e8n2Gl6OIdUHGQYJZTO/+6
         i0fd2Ld2h9fu2PYrQNdfMSNPKz/wumt8y+YQCz7S0kMfDisvwEhL+d291mzqNovbLU5q
         FQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808712; x=1796413512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rg5rgatsYgAUjn0TV/JmsO52huJMs9qOXDw8b3uaAGk=;
        b=vpjSwOSl/5MiGhbqtYKG3x7Bg7Bmjg2o5/Z8/kK3VzX13BmAMiklMZvkQXE1igxtps
         80enPe7UC2gosUas6EfeguiCA3v5Vl4kViAg+tNODFJJnPPNGrYslPWMZUcmtPB62IY+
         dO4EeH0UUfWFrRyRTLS7ySA0gm4g+bjoFImpRnnGUdsKMe0RqTCqjvvIZypm8iZR6zmL
         rzf5r4hDXRUgApMtq/6gxpHs4Sxr/RDgFU5soqOG7oe5XR50cx0vjJXGim6B5xPJo+QJ
         ZApeEpVMWl2IPJiYntDGKagevf7cMMfAGZbvGtNutXMOhCn55t+rSp3XxISNLq7RTUc8
         0nZw==
X-Forwarded-Encrypted: i=1; AL+hErHy6yBr7nOJjV1Ip8gdrJijF4dK2jD3rnVPB5jBeXHjthErIhp300ZO/wWH7Lw/k86A+5JZPpX91nVibvg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rA9WYqsfm9VHOZehq46WChKdlP2tPugVDe2O4o2gM0lKS9Nsg
	pOUh1QF89lV50pZSMDMdVsfKzPqskq0IIFszXeHldOrZDCAB0rIzDPLGsApFjTqJ8zGkE3IPdan
	OdnEnH20vcSQOULrBc71dcNc4J99MKdszo7syVW4ehmU1QPLFl6My306eJWmDit3I2vMq1/14Yv
	k16T7l
X-Gm-Gg: AZFdTZcc34oqyTLhwQqRKUdNdiHSuWv51maCck5Z9NOZGIm6n4gwLM5KH5c1xaEA2vD
	A9ESmraaWOVYfIw+t1g6fsdV9KtQ2jHOlmXNehuN3bK7S6Dxxb/J753xk2i76PPGKa9qg+Ju9Xv
	XCJZZoQhbo2k8hNGAFlFFI99R88/bGIcZJ6mBulpy/YUkb0LWNCaBhSY80pxsz7oMODXMrEU6JU
	R6fdG2r+OlzgsWtd34A6gOwE0gMDVGYHjJeXYVl+NspBnzRXcMJqs7hff7Pzkf6lr5Szg0VsB+9
	yoQO6TWngnHhIZLg8HXk2zbuLFZDqQjXgOaV8E0t5CFL29BvYylUQ4ZhaqVrw/mIf2/W+7sdTWC
	D0O61/EuuStaqEhpsw/fp+6WfnwaP+ufEpzTsPL9k5+PcdXu9aZmvXI9n13EwZgVMOcTEfznkRD
	/2nhG/ggsUvioDs6gQ22vu1yzdGcSEmIZFgomkOaGO3LxOjLhlESL3jsY16015KQ==
X-Received: by 2002:a05:620a:838e:b0:949:2fca:4a82 with SMTP id af79cd13be357-949b3618329mr4506008385a.32.1795808712342;
        Fri, 27 Nov 2026 11:45:12 -0800 (PST)
X-Received: by 2002:a05:620a:838e:b0:949:2fca:4a82 with SMTP id af79cd13be357-949b3618329mr4505999985a.32.1795808711810;
        Fri, 27 Nov 2026 11:45:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:45:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 21:44:25 +0200
Subject: [PATCH v4 12/14] drm/msm/dpu: unwind a failed dpu_kms_hw_init()
 step by step
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
Message-Id: <20261127-msm-kms-destroy-fixes-v4-12-242b0a3f8e47@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3913;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=92eHwzGqthl7H8hl7x99iYr8YLFLfDgzG+O0y7VogAQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2rnOSvLkoi8SnbEwQZ0yVVu3jx6n1WfIXJi
 5zBUwSTbGaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndqwAKCRCLPIo+Aiko
 1ahUCACVwwHomX5/rpzyyFGZj6ynWzRU20p23FIbvc7HILrXOXzbxIedkVWKt/Z5LFOsWprJ7nR
 aAF5fPf4MuKjxOR7zuhhI99Rbi+TFzWzo43hqZugAdfo6bbZ5pgR9QEsRoASEMtjODHpnWzqMAm
 dq2IF3Qv+ad40QSriIk1L+Gp7qN16BmxdLP5K+2vKXxiOUTsUkkouWus6w7xuOVwk8WYt6CMuO0
 3IkjBKUP2oU3dy1nNHdHrjaRi5HKlNQU1g+3vm6NsYijUnq12UNZaQ4uGUqNw9tAgBa7HlVAMD4
 o7ioiPzPUk0pDsdsUfS3vLf7YdUsziCuZA1N72dlVziAI22v
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX0tJWQzEnKJEe
 u7lkfe0MAHFxnYZQDQr4Qu9s8A/atICorEzORAZTnGa1xUPGZfafpccZHxkON3fWitMPWzSPxmm
 qKuPdx+4j1AGi1LQyre4M53fYNvpfg4=
X-Proofpoint-GUID: ZqHOimxSfvab10QS6LgpzGMEJg7kUVI6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfXwi3ocNGmI0eg
 V3NM+w8JXNMpQQT6Vs5IzJWB2Dp3tXmc3hDMa4wwJ+uqHPNHORURCfHVtbPDNFsJCkbDGLwImDh
 LdrA2M1C6r1aI2VV8L+QP1CDTRDtmaR3DkAK2XpnD8BZFIAmas1k3+c/qH70KXVuieZ07jgF9X9
 /oRYuIFAtDzTKPFAqI05aOUGO88G3T/KhOR+jEEEUwJL2Vc0cRIPb1q0g/T8OSOAvc6PplRsfl3
 a+7PgZcsztLCqY5Q9KaPYWSW9+HcMmPrnAB/ZYTOJRdp531wPWB7kTdicG/EfZ0fHuehwMoJ2tb
 KxCx9snGX1xM7e5yPBrhlZmCsdtx0RZB2kKuub47DO7ShMVy1S0Nmu1sXOootaWh3tV3ZnZsruY
 Ur0iN38cTCDt68BwxXz038jFIM0WtqBIWV97u62ty5cy7Ctu/eYBeeepVq2JdvBsyaC4l+EKGkS
 5YIibdEm0thlwVcOr2w==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09ddc9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=mqmjYGUTO374PHIbFJAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ZqHOimxSfvab10QS6LgpzGMEJg7kUVI6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270078

When dpu_kms_hw_init() fails it calls _dpu_kms_hw_destroy(), the teardown
of a fully initialised KMS, whatever step it failed at.

Undo only the steps which have completed, in the reverse order, as the
kernel convention wants.

The hw_mdp, hw_vbif and hw_intr blocks are allocated with drmm and go
away with the DRM device, while dpu_kms stays around for the next bind
attempt, so clear the pointers to them as _dpu_kms_hw_destroy() did.
Otherwise dpu_runtime_resume() of the next bind attempt passes the stale
hw_vbif to dpu_vbif_init_memtypes() before dpu_kms_hw_init() sets it.

Assisted-by: LLM
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 934ba47b2dae..3546efacba3c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1161,7 +1161,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 
 	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
 	if (rc < 0)
-		goto error;
+		goto err_global_obj_fini;
 
 	core_rev = readl_relaxed(dpu_kms->mmio + 0x0);
 
@@ -1188,19 +1188,19 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	if (IS_ERR(dpu_kms->mdss)) {
 		rc = PTR_ERR(dpu_kms->mdss);
 		DPU_ERROR("failed to get UBWC config data: %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	if (!dpu_kms->mdss) {
 		rc = -EINVAL;
 		DPU_ERROR("NULL MDSS data\n");
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	rc = dpu_rm_init(dev, &dpu_kms->rm, dpu_kms->catalog, dpu_kms->mdss, dpu_kms->mmio);
 	if (rc) {
 		DPU_ERROR("rm init failed: %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dev,
@@ -1210,8 +1210,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	if (IS_ERR(dpu_kms->hw_mdp)) {
 		rc = PTR_ERR(dpu_kms->hw_mdp);
 		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
-		dpu_kms->hw_mdp = NULL;
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	struct dpu_hw_vbif *hw;
@@ -1221,7 +1220,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	if (IS_ERR(hw)) {
 		rc = PTR_ERR(hw);
 		DPU_ERROR("failed to init vbif: %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	dpu_kms->hw_vbif = hw;
@@ -1236,7 +1235,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, max_core_clk_rate);
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	/*
@@ -1253,8 +1252,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
-		dpu_kms->hw_intr = NULL;
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -1274,7 +1272,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	rc = _dpu_kms_drm_obj_init(dpu_kms);
 	if (rc) {
 		DPU_ERROR("modeset init failed: %d\n", rc);
-		goto err_pm_put;
+		goto err_self_refresh_cleanup;
 	}
 
 	dpu_vbif_init_memtypes(dpu_kms);
@@ -1283,10 +1281,17 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 
 	return 0;
 
+err_self_refresh_cleanup:
+	dpu_kms_self_refresh_cleanup(dpu_kms);
+err_mmu_destroy:
+	dpu_kms->hw_intr = NULL;
+	dpu_kms->hw_vbif = NULL;
+	dpu_kms->hw_mdp = NULL;
+	_dpu_kms_mmu_destroy(dpu_kms);
 err_pm_put:
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
-error:
-	_dpu_kms_hw_destroy(dpu_kms);
+err_global_obj_fini:
+	dpu_kms_global_obj_fini(dpu_kms);
 
 	return rc;
 }

-- 
2.47.3

