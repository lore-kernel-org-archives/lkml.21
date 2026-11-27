Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808701;
	b=QXi90HMX+t9tB72Q/h0bVR8drhItyPHGd/e7oens+hkCfeK0Nz7ATvZdmmYAmxhfR/C6
	 xkU3F6vGrl5TEcnymRuL6UhyuTwjfggEcshk9waOPvSKX0PRtmLIOxhfG8cvgoXhDAV3X
	 RAX4Kr6cLmAZEYIri49L4zZRDXI8s+RRgTdYyamrpTewWZbZ/uGh1gz1V6LWdQNVR3Lqi
	 Cks4nw1hkmoai2VtZVeJN9KhEmGJtWqil2qlMEZrbU3RHtjHR6GlFc8ztHZgkl7qogDj0
	 gybcAG3sJS1Idp4O50v3aIUP2y2e7A0zhe1F1MkJ+gZr0OPj+kZYKi47iXLV+IZ/Yqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808701;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v90QvhkIgNCXcGu6Ga0Ig41/cN5GYuSQP4gP4y7SxzM=;
	b=RtEwABJUPmOpam765z4UlRlTy86Xo2TWV4D7bmLv1GIgleDoP8h3XAmYTNg0eTwrXt6O
	 RSnuJIYEwrrNgJ56ESGiUGmpLV89i8ezlOaxaJuNJHMmq4RGJsIoLf9VQlxulxI6I4deo
	 kHbzVJvAuWHH20g9EftANV4HFipcwpycsY1IANQhsYZlhe6Suny/wUEc4KmVds8SU8gCG
	 4vfEFevFeOytX5kTFNoiL1+FTO3fto24ND4H6xFAPoluy39KOryzb4hgjDsw7cb0SSBLD
	 3QObaWgXigMeMOjwihMAci2opjsnDGnxDXVRtp3iB0QyvEJz1hbvwWwzQFOxaFPKi5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QLa4LdzB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ybwd9QZC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520E1606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 520E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QLa4LdzB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ybwd9QZC
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJB3Xi3752913
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v90QvhkIgNCXcGu6Ga0Ig41/cN5GYuSQP4gP4y7SxzM=; b=QLa4LdzByzYmdRqr
	AVKBA2y89yHsCVutuNMIzR6SG75vrLExlMUHxD0iltmK1wNlw0ibZ5OX/rLgJ3O1
	YdCs+BWNu/E671RF1/fq3IijyJWvbfjELvqGtIItsbKApZiwEOqk0t5hu1eGDe1i
	h6KZJJxueKe+MjhnPS6JQaURo2Ze1z+8Fy1s6ruPe6w521sWprZF5IkHQxxdYPA6
	wLW2S+js2tk/wXmYOr7CuSMK9GP5540yZ5yEMTulqy+BasjN75Bco0EcTPSbOVy7
	Pb9G/e/RPHhi0T3x5LuPtCJ+bbljjeea07vt7dbAJCS3PZwPBxAsV9oMRLF6qeFi
	UfmnXw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74ghapkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:44:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so1368606285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808698; x=1796413498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v90QvhkIgNCXcGu6Ga0Ig41/cN5GYuSQP4gP4y7SxzM=;
        b=Ybwd9QZCIFejz0+yMBSJGmw6uZ0VfYm74Q6JUNqRKpdYPdFYXNQDZO29JQ3YC39hc+
         4KqctV0UugBHuR7DAZmWOtyC13fH+m+4oULgkDy+KaLm9psOr/2wFw3MKWFPpti7Twlf
         XHJWysoPJ5YlirSdP8uDtyArhuU2hi61QgN00+0WLTw6aZFKNHCzswScWA0+A/J+wBTR
         i0GiH4kvWNjYRY8UqEg4zu44M93s6310kxUAa+eqqFzsOgYp0JmmGmOuwRus0g0NXqbQ
         c/qZDW5onTuSsrJ74prJrHLj9ecLfW9rjRT+weuzsGBcv9MTREOF3UHEWb9dmXaxiIqG
         3NWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808698; x=1796413498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v90QvhkIgNCXcGu6Ga0Ig41/cN5GYuSQP4gP4y7SxzM=;
        b=m/bLlVYbJWK7TGKaqKON1cgeOOH0UtNPLHFMBo9TtCZs2i7asfEdiHEtFVZQvcHZey
         bG+J2rTxO5irwcr9Go6aruzOuB33gIyJ2xCRAW3VrWvIsiRyxSqwtqYCs1SmhcpTwTT9
         F2gKEo3QaS4JthzBk68mcgQQzX+jXz1qdM8fzd6aQWolSVCco15q1YX78arVYAoM26qY
         Q1EMak3rGISP+QrRN6DZ1R3JC2LbI2WrYyMqqzax5qvZHCkRlB+86UkVWx/ihMRsT6iu
         PbUH/lXyKP2VoW1HTLUkMZCxTmWbweuwDJjnGh/ZlRb8dewSPXB2nVyTnZcOVOjQ0/6n
         vYUg==
X-Forwarded-Encrypted: i=1; AL+hErHOrPEJBssG6/vplxdmv7/gDgg12YDxcwx2xUh5IB6eE/2jCzRJH60/yUbBMyAJ5eiYO5vVuSs9qyOhN2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cNsTpWrGyr+OtgWAVOrWsiyDfUQdThKfZEOjE+H2sbyHS7fPl
	9tECggg+9QuFZcLRIMDdNyxssrBLGZbzUR8XJqBsYVBeRMI7lmg8Lfv9g13jJxF0v2MiE0SchCb
	pCcSTbPRBUObE45XRjt1F8PBHV9Mi0kbce4alYug6NY688cR+TbtoCueTjLbwgPvomy0=
X-Gm-Gg: AZFdTZcidKXDnUqSSwCH/yEthmc5PjheTqf+Sf32IDQuakZtToh9J1qRCGX1gDf+cV8
	9HAZQygUXrYIpHLIrj+NBNj4+Oe6LHbfBULXVjLWNqCn3jiRIE97MikS76GIF48j1U3op5bADc7
	+KN+cmtKKgdfLgsDA3KTkRX6jCfitdGpVdnggxdBWXhJUflNFmX7UjQY3rM115WyD2NvDV59kk/
	o4ItewFor5KAzCFC1UFqpVGWImrYAdPa9Q3BvYO8xsDE/aGG0jDsk8/J5V/ed3ZFx7lLC4J9MLw
	hddqz/I/L1soUwbEL8Bn2irMZTMORxbeneVnnp1EYK7KgUydUzh3EFDNU6MWIYQHkr4VksycK44
	veiYZT6Qssr+VsdGey6SHm+/p3CdfqKWAhCn6CVqQKfavEPwxl8PpJMuqVJSS4TJEdiSZAwrQHg
	2VP6ZCOFujNmSfF5vVJXW6xj2sJd7FgIWaxaWarxz89yB0ycTebdoy7ZNjsevTJw==
X-Received: by 2002:a05:620a:40d:b0:949:f8bf:b6e9 with SMTP id af79cd13be357-949f8bfb90dmr1690144285a.25.1795808697860;
        Fri, 27 Nov 2026 11:44:57 -0800 (PST)
X-Received: by 2002:a05:620a:40d:b0:949:f8bf:b6e9 with SMTP id af79cd13be357-949f8bfb90dmr1690140485a.25.1795808697360;
        Fri, 27 Nov 2026 11:44:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:44:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 21:44:16 +0200
Subject: [PATCH v4 03/14] drm/msm: unwind msm_drm_kms_init() on failure
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
Message-Id: <20261127-msm-kms-destroy-fixes-v4-3-242b0a3f8e47@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5635;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=D7FE9O21+4uzqGcggiGh24L+2j3CuLP1bVL7YPFNAII=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2ZZUi1yMxzMGYeZS3t1SL5yrKR8jLb+gK+X
 PvyZZUnnOqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndmQAKCRCLPIo+Aiko
 1UAmB/9zEnXvb//f3se1mM5eYZs+0Cw02OYL/3nD78+RQhPPEQaMmT5+S0FDBMXF1DWn9LoAHO9
 m+fAsu8DUa7/osyV+4pdhMAPOotERNcGCqZKAZu2Jdu9XIAL0GjmaDBz5WwHbuW7qWZvXhKe47L
 vWlLyMZfYjcsNvN4O7GFTAXYYg7ksSohzCHkQMpjGFJ+JQR6kKNx8Plob9iXzaSx8g+eAb1JqON
 /y3kpq1MHPYrsmMThNPiAQR6pBuBxH9neg/yY5ECCZlKGMIlox7OUYQdjmx3cXWF9S07hS/KeaW
 UJV0f6KokszFSAG0/e9UEu5+dGRehq8Ot5X/N2/J0xcVMrdn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX84HtTIyBBdv3
 BNFw8ZiRviRShkLjzyTsnBaa2c231pP3PivX1OmIc1xFQ26Uf/iB1yHVNOXBYSoL0NMjfahKkxK
 k9rUyaWKLk3W5o51mfow5Wff+PbvTrE=
X-Proofpoint-GUID: mdRP3hzp-Ds2szFVYxxetf_bCn8QHTTh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX6U9T4r4lxSbU
 tmtNZkRcuFAcxmO9XJQaGb9btFOLlnqWOfmbnip85kIbFm1xi4Db1Bm64GkRwNYA1RHjWBt7zcM
 gD6lH1wr8RkwGlINOtB/hvoAs5LTVeWC4xY+33lAbOZaUTT3F44eGygmOjH/JycIVo14zpOSh3G
 aHkWpL1P1pc7qZWBs1r5VGrUxnEwwxIrai17UzK4ReJDuB80KXaW7JwIUZpnHW9tS8W7nnkoV8L
 MT7dFZABe8w70EK8WyFnNGqMX+bSTzuqY1ci4oKoO1NbtnETE+o5PhMHHgdBAFoIZzJhJ3gbMzP
 PVrFMhv0itbOladQM8X8S31eIyy57tFFv1ysGmXcFaZxFiHwZdgK2563+BIXzGxnNuwTwu5SS05
 WxBZ3QZ5+wWBz2fqgaH4qCAzzhemZ8cfsIu3pOuyd0m94JMDry89GKY0ZVUX3kWTotZmmxI8i+f
 dwuKqwQOYyzBldt2GYg==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09ddba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=_ChxW0iHWOZRcJAqfHkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: mdRP3hzp-Ds2szFVYxxetf_bCn8QHTTh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270078

msm_drm_kms_init() leaves behind whatever it has already set up when it
fails and lets the caller sort it out: msm_drm_init() jumps to
msm_drm_uninit(), which runs msm_drm_kms_uninit() for every device which
has a kms.  That is the teardown of a fully initialised KMS -- it flushes
kms->wq, calls ->irq_uninstall() and frees the IRQ, none of which exist
yet when the failure happened early.

The kms driver's own init is the first step which can fail, and since
commit a409b78fcdf7 ("drm/msm: move wq handling to KMS code") the
workqueue is created by msm_kms_init() rather than by msm_drm_init(), so a
failure there leaves a NULL kms->wq for flush_workqueue().

Undo the steps which have completed instead, and let msm_drm_init() unwind
its own error paths rather than calling the full teardown.

Fixes: a409b78fcdf7 ("drm/msm: move wq handling to KMS code")
Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 29 ++++++++++++++++++++---------
 drivers/gpu/drm/msm/msm_kms.c | 36 ++++++++++++++++++++++++------------
 2 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5e8f3ce26b32..1e89fdaf0eea 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -230,35 +230,46 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
 
 	ret = msm_gem_shrinker_init(ddev);
 	if (ret)
-		goto err_msm_uninit;
+		goto err_unbind;
 
 	msm_gem_thp_init(ddev);
 
 	if (priv->kms_init) {
 		ret = msm_drm_kms_init(dev, drv);
 		if (ret)
-			goto err_msm_uninit;
+			goto err_shrinker_cleanup;
 	}
 
 	ret = drm_dev_register(ddev, 0);
 	if (ret)
-		goto err_msm_uninit;
+		goto err_kms_uninit;
 
 	ret = msm_debugfs_late_init(ddev);
 	if (ret)
-		goto err_msm_uninit;
+		goto err_unregister;
 
 	if (priv->kms_init)
 		msm_drm_kms_post_init(dev);
 
 	return 0;
 
-err_msm_uninit:
-	msm_drm_uninit(dev, gpu_ops);
-
-	return ret;
-
+err_unregister:
+	drm_dev_unregister(ddev);
+	if (priv->kms_init)
+		msm_drm_kms_unregister(dev);
+	msm_rd_debugfs_cleanup(priv);
+err_kms_uninit:
+	if (priv->kms_init)
+		msm_drm_kms_uninit(dev);
+err_shrinker_cleanup:
+	msm_gem_shrinker_cleanup(ddev);
+err_unbind:
+	if (gpu_ops)
+		gpu_ops->unbind(dev, dev, NULL);
+	else
+		component_unbind_all(dev, ddev);
 err_put_dev:
+	ddev->dev_private = NULL;
 	drm_dev_put(ddev);
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e5d0ea629448..f3e39c3907a9 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -225,13 +225,23 @@ void msm_drm_kms_unregister(struct device *dev)
 	drm_atomic_helper_shutdown(ddev);
 }
 
+static void msm_drm_kms_destroy_event_threads(struct msm_kms *kms)
+{
+	int i;
+
+	for (i = 0; i < MAX_CRTCS; i++) {
+		if (kms->event_thread[i].worker)
+			kthread_destroy_worker(kms->event_thread[i].worker);
+		kms->event_thread[i].worker = NULL;
+	}
+}
+
 void msm_drm_kms_uninit(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct drm_device *ddev = priv->dev;
 	struct msm_kms *kms = priv->kms;
-	int i;
 
 	BUG_ON(!kms);
 
@@ -242,11 +252,7 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	flush_workqueue(kms->wq);
 
-	/* clean up event worker threads */
-	for (i = 0; i < MAX_CRTCS; i++) {
-		if (kms->event_thread[i].worker)
-			kthread_destroy_worker(kms->event_thread[i].worker);
-	}
+	msm_drm_kms_destroy_event_threads(kms);
 
 	drm_kms_helper_poll_fini(ddev);
 
@@ -282,7 +288,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = priv->kms_init(ddev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		goto err_msm_uninit;
+		goto err_destroy_kms;
 	}
 
 	/* Enable normalization of plane zpos */
@@ -295,7 +301,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = kms->funcs->hw_init(kms);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
-		goto err_msm_uninit;
+		goto err_destroy_kms;
 	}
 
 	drm_helper_move_panel_connectors_to_head(ddev);
@@ -311,7 +317,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 			ret = PTR_ERR(ev_thread->worker);
 			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
 			ev_thread->worker = NULL;
-			goto err_msm_uninit;
+			goto err_destroy_event_threads;
 		}
 
 		sched_set_fifo(ev_thread->worker->task);
@@ -320,7 +326,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = drm_vblank_init(ddev, ddev->mode_config.num_crtc);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "failed to initialize vblank\n");
-		goto err_msm_uninit;
+		goto err_destroy_event_threads;
 	}
 
 	pm_runtime_get_sync(dev);
@@ -328,14 +334,20 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	pm_runtime_put_sync(dev);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "failed to install IRQ handler\n");
-		goto err_msm_uninit;
+		goto err_destroy_event_threads;
 	}
 
 	drm_mode_config_reset(ddev);
 
 	return 0;
 
-err_msm_uninit:
+err_destroy_event_threads:
+	msm_drm_kms_destroy_event_threads(kms);
+err_destroy_kms:
+	msm_disp_snapshot_destroy(ddev);
+	if (kms->funcs)
+		kms->funcs->destroy(kms);
+
 	return ret;
 }
 

-- 
2.47.3

