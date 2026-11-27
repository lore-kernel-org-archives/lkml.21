Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808708;
	b=gInRqLxMTg4kEt3mjOElQl3ugk2RlEE0jCzSkeqsPvdx/PHBoK5sqvoVtfjWkr/pDbRA
	 VG4GF6We0Fw2e/gL2rB3quZYUt0IrKPJ3Fb3Eb4Q95tByq7xaJvRftCDrhAKvekhQ25ZX
	 HgAltBwu/V8RWnliVk9CDIJQpOF+Kd3CsotzHf0x3L7CvxOw0X+keZvnPh1TW3DFRkWEc
	 sXLYsqiJ++DxF9zzdS55CYnnMt6JDjk0Qv7PihIeXLUwrQ5ZqmAO+vEiXiHEOmI7l6Yar
	 6TRVH0IqGD8vaQxG49ozWxdzc+LW4E9tmeQ2BOYdl+7z67wCDHqHliv9Zz6gCAusi8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808708;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TiRcY3S9QKPQ7+xH5TOegkjcGBPIklke4QHyTc7bS8s=;
	b=MCNerAyTR3IWnf9fMbXYcIsMKGVIE3ARTrl9JjhPnSiQD6/XQDJg2cKOJ/O/quJ5Fv1X
	 7DGwN6AHsXCx83MnJNYaYxuPIjkK5QbueKML8kM9+OJDeOvgbPZn6NavnRxZ3r1GId9xx
	 hbTF2VGZUfSPUs4bde9lK2pcFrAQuj2uN7VNUGeYpzBcwy8vSPml0LC5hzzwNWrRYvVtr
	 HVtt73E5376dbdCaC3+ksFr/fbrTpaN2TheuuP6ZJCnQgyY/x7eIX1WyPs4M6IwrocipA
	 ZCxOHdSOedPRIglJUTo/Jqdsj7Ct/mtvxxs77PSAphK+pRXB19qbK9HdT55KRDmeoUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lT7I76Yk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UTgw06u5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6B4606A331
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D6B4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lT7I76Yk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UTgw06u5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJTWpk525192
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TiRcY3S9QKPQ7+xH5TOegkjcGBPIklke4QHyTc7bS8s=; b=lT7I76YkhtN4PFMw
	5qBOl0wMvUdD0TGRKAI9nCHvsV2EMhbwnpsNeDHo4hsXORAPlCv1E9kJwxE9fCIV
	2+e9RURAggSmdHjTlkeyNelxHOlBo4Vs3y2XAIlftOkwSTlwV1evQmdWrnJniHPK
	qRxXAbN0hNFV0H+9+1um3BmhqzLE2kwM+hPqqS3kKcuBKeQZxWxjoWNjMjkIiN5S
	MWr6Cvh1fjY38iKXWrOZfQkC2W5eixCbBTFAEX8UjBfy/JKQcVfwLZPCrsuSsKbj
	upsA823LpvVBq0LLbJLU0HgM2UIAmMmPMo7Csk89juqFhy5FIKZ2tJz4RItYU2sY
	0CHc9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g2dr13a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f2fafeaso912578385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808706; x=1796413506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TiRcY3S9QKPQ7+xH5TOegkjcGBPIklke4QHyTc7bS8s=;
        b=UTgw06u5Q/707H1Rcc8mRwS9xPbUYp5HRN9xgA2+fHeAd5mH/mc+7NIS4zmbX7KngK
         lR3+pk+DzwE8idGSHDfQkSkkxt/DzWjfmtjBQHdoNo2y9SFcl/qoFoUBPfE/5/PTgJ00
         sKinx2F4kKKPSOLYCtb49Wb6Y8BWuORfd4bZlMnmI1UUlfwa8BeEEYwQSY0Kpw3kjGtf
         Xcp5qucZordNwRDd510Pe1B12mHDu6M6kHTNVO3tOKUPAqPtg1Zeg1iCTTiT8bmdsqFm
         jgjD+iZOWRI0cwZ/n1Y/ChpYfcghnxOP2mLBIiX90aUNbCFVxdrNmD8InWKNfTEEYP67
         WAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808706; x=1796413506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TiRcY3S9QKPQ7+xH5TOegkjcGBPIklke4QHyTc7bS8s=;
        b=PQTCm/NNsW01Amhk2jJNH/3koVF93popmlu8oicsU7yiYvPvFj/VoY2B/2DEkTBOLU
         T7Yup79xnFhiX4qzY5o8rRpdJE77aytLitDio+I84inheTnpYsRoZYdbq6ImaTUVyNeW
         W0NqNlLLMxBwFLDpfPzhQIxLd3p9rhY9WVpQGclwhkzi9SeT+dh411MFidsEyVnHfhCm
         LvShdMZUA6ZcCb45uWrHJkFR0lojnpPufTLuy48x33kyJGjhAlopQvILtvHocIGWGj50
         KPXzwjS17GnchxVz61i8pMysugekZ58SQ1Vf+c5lj4l8Vl1O8tdwq8FyEcQqLmK2Ppqp
         22xg==
X-Forwarded-Encrypted: i=1; AL+hErGo5zen6CRWKnbIBBBJGAKuddANNWgjIpDYHkS1UkMCHL0UvMaye4n9TTRiYI2O17Gn2ogCRLDd6BkQhEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qWyOXsJKQtiEgyIiwJe1//2JYc3RcplalaDgp5YRiO9Zg6oYG
	6DkObgT9dIoL+/ye/CpYNGjfDX5xtP31I4OvPRKG2z9pJfR/eHnURbvqVxRRuTSmlwT9my9BEUe
	g20N37FMHPGMtJqK2iqANRvjqAFYRguNGWb+TiNrzr7ivOfpJ1UAx5446G22HTQ5rCt0=
X-Gm-Gg: AZFdTZeazGBvgrEajc43vSHGeDoAnlmxQX4l+GCCK7FE+zMbCNyuk/kOmwnFrgMqkJT
	pbhtSPE7PEOnZwKVG90e8ed5dN+f+cyPbezd9fNNGIG+uB2QSN1qRBopyFKXsxw+EAf+txywSgG
	yAP3cQ29W6xXwmMd7VW9jH2F8NR+2B141ZmBd91eWCB7oxmUInSpbwLKUYLOlKERpVVRaISeNJv
	mij+bXG0UOSf2fzCUv8PLQUvgRGYhigZXQe2hNve3ZZ9gMJnK9EgqQBp3P2szma5llRFps8BcZj
	uCCr8IH0tvnHR14LGa0drnbDx9G/jXZntioMpKFDUnS80cmbkfLgKBekjFPMHUe5tBVz/RCy88j
	mCuGVhxNod+Hom92yeqLcib+khDFYybOQiK4WOkzzHPhLg+HiFAVrLD8dAAcQdMWa8uVpRSGez6
	BMUNuxPXzTu0z4ln0vuQrWxOef48/LNsIlvYG/2sSI6rgsHfsR+zPvBdJmIHuQhA==
X-Received: by 2002:a05:620a:5394:10b0:949:bda2:194d with SMTP id af79cd13be357-949bda21c95mr3243170685a.83.1795808706175;
        Fri, 27 Nov 2026 11:45:06 -0800 (PST)
X-Received: by 2002:a05:620a:5394:10b0:949:bda2:194d with SMTP id af79cd13be357-949bda21c95mr3243165885a.83.1795808705662;
        Fri, 27 Nov 2026 11:45:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:45:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 21:44:21 +0200
Subject: [PATCH v4 08/14] drm/msm/mdp4: unwind a failed mdp4_kms_init()
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
Message-Id: <20261127-msm-kms-destroy-fixes-v4-8-242b0a3f8e47@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6028;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xcpZH/JchJVGlWrWDcBXjibsRjJg497QsmYpUE4TNpg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2jfkCaZnHFLyBVnOT/TOH2fQmbOy0Xm7jKe
 ZuP34BdLWqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndowAKCRCLPIo+Aiko
 1TMuB/99gAkJCsdqUs6LDWs705IAgry+J01ObO8FSwcAttbKjP0qlISAvOazaCXFTyiZ+RWMHii
 a5M/hHmQgq1R59kJCEGntlG90tY9/UTgC6xlCSr4m1BEWJmM4WCAdkIrHO41rahW2C+ocO9UAki
 qymH53ebepwj0nmNgeIA92IZgwO3oZglUKA88BEY2wuyepqE+SyS9M18Q9xpZ0FyMoYtMbu0EAx
 LA8wimH3K7GNpve8jlWRLO5OFXpe7F+AEmP7nue/9LJlti9Wrh++2Pr9S3FMxNPuFr5Hh3cEPmS
 mJpVpZaJRlii5T74/7bDmdf83cPM9mUGoDwCfSqRvyfF/PVl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX/MRuIQJfCY+h
 5N1F8YrDLTd1cynSf7vz1SQbGNa2GKdbIU1LhvzdYtfkxXD1e26r8XVvQKQlUskvLd4toj4d4QE
 1w9YC9XwN4ciPdVjamzZtY1fBosnNuK6ZlBho7aw67n76iwnRapMy4QFVrz47lJm3kNpL/umY/w
 ahOom8rYGf4JeP56yLRXGKqfTcHa6h/BIoXa5Jg3r0VaOzW1odNiFv2m/ua3yvlHm7lDYC+1KY6
 A923N+rSH1/Qd41pxvKNTCIUB26+tRrqMGsVI8vW5eiilkS2b4/JPpQ8wvRRCoETCqCirhSCvTX
 SwtbPz3L7SH1VkgMDOWb+YYW4ehn5lrpKkfU1bEtkgTs3l/alqwPr/RplPm+FCu+B5edoQN6Lre
 yXfkTpjFxcVeL1NnuSGN2u9cpx0ior7HV4PXRvOdDy8FWP5scO9pwNPr8SROw0Y4FCo8CNC4/+n
 hkHg7vpsBq204Zwwffw==
X-Proofpoint-GUID: GZZ1I3YPG8965JWj5sKCxValgJ0Fj3td
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX/OF6Jw7YDly3
 m06NldY96H+2pWxq2NT+3h+YoLKA92JSBX4XwzUiHfXgKDhmjPOhG0A4utmkpbjcmydMgdEieOp
 FSZw19rJit2L4cDf2D59iRtkIvDn9j8=
X-Authority-Analysis: v=2.4 cv=dJEzC+Zb c=1 sm=1 tr=0 ts=6b09ddc2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=j6QtfvlM2Oj41uVX788A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: GZZ1I3YPG8965JWj5sKCxValgJ0Fj3td
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270078

mdp4_kms_init() returns straight away when one of its steps fails and
lets the ->destroy() callback, which the caller runs afterwards, clean
up. mdp4_destroy() however dereferences mdp4_kms->dev, which is only set
after mdp_kms_init() has succeeded, so a failure there turns into a NULL
pointer dereference. It also leaves the vdd regulator enabled.

Set mdp4_kms->dev before anything can fail, undo the steps which have
completed, in the reverse order, and tell the caller not to run
->destroy() after a failed init. Fold the hardware setup, which can't
fail, into mdp4_kms_init().

Fixes: 93c125e4ea98 ("drm/msm: don't tear down KMS twice when KMS init fails")
Assisted-by: LLM
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 61 ++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index c299fef1a400..c2172e5f9e85 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -29,9 +29,8 @@ int msm_count_mdp4(void)
 	return count;
 }
 
-static int mdp4_hw_init(struct msm_kms *kms)
+static void mdp4_hw_init(struct mdp4_kms *mdp4_kms)
 {
-	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
 	struct drm_device *dev = mdp4_kms->dev;
 	u32 dmap_cfg, vg_cfg;
 	unsigned long clk;
@@ -84,8 +83,6 @@ static int mdp4_hw_init(struct msm_kms *kms)
 		mdp4_write(mdp4_kms, REG_MDP4_RESET_STATUS, 1);
 
 	pm_runtime_put_sync(dev->dev);
-
-	return 0;
 }
 
 static void mdp4_enable_commit(struct msm_kms *kms)
@@ -132,6 +129,15 @@ static long mdp4_round_pixclk(struct msm_kms *kms, unsigned long rate,
 	}
 }
 
+static void mdp4_destroy_vm(struct msm_kms *kms)
+{
+	struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
+
+	mmu->funcs->detach(mmu);
+	drm_gpuvm_put(kms->vm);
+	kms->vm = NULL;
+}
+
 static void mdp4_destroy(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
@@ -141,12 +147,7 @@ static void mdp4_destroy(struct msm_kms *kms)
 		msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
 	drm_gem_object_put(mdp4_kms->blank_cursor_bo);
 
-	if (kms->vm) {
-		struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
-
-		mmu->funcs->detach(mmu);
-		drm_gpuvm_put(kms->vm);
-	}
+	mdp4_destroy_vm(kms);
 
 	if (mdp4_kms->rpm_enabled)
 		pm_runtime_disable(dev);
@@ -156,7 +157,6 @@ static void mdp4_destroy(struct msm_kms *kms)
 
 static const struct mdp_kms_funcs kms_funcs = {
 	.base = {
-		.hw_init         = mdp4_hw_init,
 		.irq_preinstall  = mdp4_irq_preinstall,
 		.irq_postinstall = mdp4_irq_postinstall,
 		.irq_uninstall   = mdp4_irq_uninstall,
@@ -400,7 +400,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
-	struct msm_kms *kms = NULL;
+	struct msm_kms *kms = priv->kms;
 	struct drm_gpuvm *vm;
 	int ret;
 	u32 major, minor;
@@ -409,21 +409,20 @@ static int mdp4_kms_init(struct drm_device *dev)
 	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
 	max_clk = 266667000;
 
+	kms->init_unwinds = true;
+	mdp4_kms->dev = dev;
+
 	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to init kms\n");
 		return ret;
 	}
 
-	kms = priv->kms;
-
-	mdp4_kms->dev = dev;
-
 	if (mdp4_kms->vdd) {
 		ret = regulator_enable(mdp4_kms->vdd);
 		if (ret) {
 			DRM_DEV_ERROR(dev->dev, "failed to enable regulator vdd: %d\n", ret);
-			return ret;
+			goto err_kms_destroy;
 		}
 	}
 
@@ -435,7 +434,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		DRM_DEV_ERROR(dev->dev, "unexpected MDP version: v%d.%d\n",
 			      major, minor);
 		ret = -ENXIO;
-		return ret;
+		goto err_disable_vdd;
 	}
 
 	mdp4_kms->rev = minor;
@@ -444,7 +443,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		if (!mdp4_kms->lut_clk) {
 			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
 			ret = -ENODEV;
-			return ret;
+			goto err_disable_vdd;
 		}
 		clk_set_rate(mdp4_kms->lut_clk, max_clk);
 	}
@@ -466,7 +465,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	vm = msm_kms_init_vm(mdp4_kms->dev, NULL);
 	if (IS_ERR(vm)) {
 		ret = PTR_ERR(vm);
-		return ret;
+		goto err_disable_rpm;
 	}
 
 	kms->vm = vm;
@@ -474,7 +473,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	ret = modeset_init(mdp4_kms);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", ret);
-		return ret;
+		goto err_destroy_vm;
 	}
 
 	mdp4_kms->blank_cursor_bo = msm_gem_new(dev, SZ_16K, MSM_BO_WC | MSM_BO_SCANOUT, NULL);
@@ -482,14 +481,14 @@ static int mdp4_kms_init(struct drm_device *dev)
 		ret = PTR_ERR(mdp4_kms->blank_cursor_bo);
 		DRM_DEV_ERROR(dev->dev, "could not allocate blank-cursor bo: %d\n", ret);
 		mdp4_kms->blank_cursor_bo = NULL;
-		return ret;
+		goto err_destroy_vm;
 	}
 
 	ret = msm_gem_get_and_pin_iova(mdp4_kms->blank_cursor_bo, kms->vm,
 			&mdp4_kms->blank_cursor_iova);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "could not pin blank-cursor bo: %d\n", ret);
-		return ret;
+		goto err_put_cursor;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -497,7 +496,23 @@ static int mdp4_kms_init(struct drm_device *dev)
 	dev->mode_config.max_width = 2048;
 	dev->mode_config.max_height = 2048;
 
+	mdp4_hw_init(mdp4_kms);
+
 	return 0;
+
+err_put_cursor:
+	drm_gem_object_put(mdp4_kms->blank_cursor_bo);
+err_destroy_vm:
+	mdp4_destroy_vm(kms);
+err_disable_rpm:
+	pm_runtime_disable(dev->dev);
+err_disable_vdd:
+	if (mdp4_kms->vdd)
+		regulator_disable(mdp4_kms->vdd);
+err_kms_destroy:
+	mdp_kms_destroy(&mdp4_kms->base);
+
+	return ret;
 }
 
 static const struct dev_pm_ops mdp4_pm_ops = {

-- 
2.47.3

