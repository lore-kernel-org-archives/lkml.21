Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808693;
	b=rEYYjN1xeO8r2FSmAR9BGnDA+gde50Q+JnnORXmBI7lRMEA1rHk9NnwsMiVa5S33My2o
	 dIRYlSvv0ZR1DemZbf0rmpKV6/3LDve0AOdQf0Lb4A6Ogyx+EqrD/70mE7ydrU7Xx++9W
	 J/tALBV3H3moJjOVcL46l3S2FrTXLH0EbS2fOuLMuUy8vGf904FU2DJSVskBdRctw3xAR
	 p8af+rYbjKUkjVusjhbxjsFCZlXgcQQAxxr8lNbSKI3sZpIHJGUaHoe0QEkT4faNdi6HX
	 0pB+osZuBXoyInY/AxKBtfLC/sOt5KdGVodICc/1a7wiV+sN1VT7pU0YIMptx5nj8KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808693;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zVbFrdZijJJ17Cd4PBjOYe7BHGSlYdmG1P+3qcPUEfs=;
	b=rGUbKqo27tmqBEFd6nS5+J/I7nxJwWb7PHnVryHF7HzPbA3gSJnoni2VagypYpptYgXs
	 baX3XLYH95UHtn9RLh21pXbxDNCIkZSUsjmtHsdn/zQ0TZf1DXX3G1ZTEEJd94PDTgBV5
	 MzlHVFmfOt8fY/utUdYm/KX9QajX8DsTwcxX7nWtThV3ftX6fP831cSvs5CKXaMA6QeWa
	 6/FO1U3HF0a8SlUePpzER94lLN+Y4Ob/tifgaaB94ZV73xyyxBDi4zSgQngu5fn4mdnw+
	 Yf+P9NXgZG3xwBrpELXB35KZGveRTPINVicJzpQZn7pAiPzdzweH1Kc4vAC+UvJEI+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fnz7BvFs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5pQlaoj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EEC606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48EEC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fnz7BvFs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5pQlaoj
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJB2RP3134392
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zVbFrdZijJJ17Cd4PBjOYe
	7BHGSlYdmG1P+3qcPUEfs=; b=fnz7BvFsGxAPE40ps7jpbPRQD2vLhzVMmdMFZ7
	WOXprvraAkxAHAeug0moTlmkCPKBZIkywUzvZI3V9gYvBFEjv/FBHylfDo5MMxFP
	WHSq6BJfSaX+7ALDyfDXc6Q68ry9nI6tKAO1i9tqOPO02qjRsLEsj0aGHj8nFBSv
	Ckvb+3V/0j2UG/v4/iCLRGkB0EJz/gNIAfmuRbcEa/NycAlN+Dy92LU+R1U86q6f
	2/mj7Rj5A2RChW2VE53b0CxAG5QzDP6uY7LllpzryXj784+OULJVCLc1SRCz1BYP
	/7HBoXsUTWVSyjcpLZtLAmgUJmF8r0NzajhNkC4yQavXKNgw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gatrsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:44:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94961511b61so1323264885a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808691; x=1796413491; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zVbFrdZijJJ17Cd4PBjOYe7BHGSlYdmG1P+3qcPUEfs=;
        b=C5pQlaojaUZqFSHAS+90bqSvfJ91YIRgyEs370ScWDSF4tsAM4AeMlsL1WAKzqYP6I
         CD+nNVzmzdKEHAbqYgNp3QEaXMAA4u8/ZsO50dV98y5yD6pb0Ifm9pEpRywplOU8mAA4
         B89oxrRTplGAdt4BCC9AxZYxlhuKobbFsgkz9QOXqOeZhQrYUqZ+V+aAQ8fBm4MoeAj2
         FrD5xLzr6xnsUMGL0MpMfAuQBLtRQE9zTNw8IG0w1z5jywrnz3W7tyihHWgDZeMmJh14
         94y6zFqqJwQi675eawcBxv1QfkMZ13toOIy5lZZRaRxhsUrccAxirwZmyX8P1n0QhnbF
         JX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808691; x=1796413491;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zVbFrdZijJJ17Cd4PBjOYe7BHGSlYdmG1P+3qcPUEfs=;
        b=JdtP7pYZxkTX/0N6aqzs2Y6h7FASdUxmrsqggd5GQO8VC7sJJeZSujvjivisEAJQu9
         H7rqWLRDFMHCg6YSlcArLhfTNdUKoBaCav0uOZkcKSTFADZYG4rL+HW3Lo3cAeh/JW9a
         Ia2q2cM+0lb5SITUnnIV892DjlTo/i82jKXdKQSM03DOZD7iZb9V01SN4TRysLI8NBKo
         epp11ygrPAGPPJhAVwrBap08hWEzMQQl13gYgrdihLTOYTIcTdIIADJraX/M5v3nGFQc
         ksIDhGam8r0qFilSw9RewSIRM6zfQ0hi/mZzkP3qt5kjklhJVc8SHfbxA6GbIJB4mZXr
         sgjw==
X-Forwarded-Encrypted: i=1; AL+hErGlu2nuG+BadN85PdqLe+Cf4YP6S+ST1Xtvid+juHMxv/nzbnMAM+tJVXuO8SFPhrepHTGmLtaaH9cwllE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nQ/i2M1cVPhAd7DGT1tSEaFntAHdRhiOsPqUvu+zJHpLRGbcS
	mlbhX8FkOvKdHGrVwtvxXnenCQCL1Rr5Q2WgkPpg5eLadbn+ac1VUi/6/5OEusp1ELBqcoZSboQ
	vcGv973xlWZU2gH9OSikL+DKXnMG5Bt8AMyjmb8hGg8ZK5zBMm29J0Yye0hGOUivaP4o=
X-Gm-Gg: AZFdTZc1O4pvARogvri6G5A8RWaizz9f8QxNYKyaM5JEVY4QuKcAlYDGKTP6P6cIG6Z
	ww51SUtgCXjKz4wrg0YUsIvj+9vGBOc2j9JEPZhmfGdhXKcOtgHFoYdEA9f0lnpkYuYt6U17eXE
	6bRti2VNVGzQeLf7TSF//hwcSzmFkDo9KZvlOeIHHmt3ojydGUx9L1jGRXAZPy+xZfxvAzI1ynI
	HlnpD/dIgO8UkPEhRXI4I6iFknDBLYvh0MRBiZztSAWtUd3DRVlUV3eUvCRMURnxuGu5E3/E8gv
	/WnSBng0rVjt99dSYCDzEI6Kj/qHx6vQEAxiLLGVROnnabrRnjpoAg1kJtam8STpC3FrxgRUvyG
	wjAsKKsOJ+ogVtaYKuqZFIrKugJ2Ghx1yMjKR1EfNCUDmARd5BsDqGbLI0TX3gfuojPexfWqxDF
	nTwnwRk4zpsgvA8vJIdOsjOMCK4G7dbjHDsih+yZBVIn5zORQQES4duI6/SIFeWA==
X-Received: by 2002:a05:620a:17ab:b0:949:7f50:29d7 with SMTP id af79cd13be357-949ba9555cdmr4524738385a.25.1795808691206;
        Fri, 27 Nov 2026 11:44:51 -0800 (PST)
X-Received: by 2002:a05:620a:17ab:b0:949:7f50:29d7 with SMTP id af79cd13be357-949ba9555cdmr4524731785a.25.1795808690647;
        Fri, 27 Nov 2026 11:44:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:44:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 00/14] drm/msm: fix the error handling of the KMS init
Date: Fri, 27 Nov 2026 21:44:13 +0200
Message-Id: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAI3dCWsC/3XNMQ7CMAwF0KugzAQ5TmmAiXsghrRxIUAIxKUCo
 d6dtCwMdLH0Zfv9t2BKnlhsZm+RqPPs4zWHYj4T9dFeDyS9y1kgYAlrDTJwkOfA0hG3Kb5k45/
 EEhooKuX0ulppkX9vicZFft3tv5kf1YnqdsCGi6PnNqbXWNyp4W7sUAB6oqNTEiRBiZVxloxpt
 pF5cX/YSx1DWOQhhqoOfzCcxDBjK23Q1ArRkZnA9C9WTGE6Y2VpNSgEuyT7B+v7/gO+geUFbQE
 AAA==
X-Change-ID: 20260930-msm-kms-destroy-fixes-0f04b1d39b83
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6722;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HQ6M5C+Vc65ymJthbzS2F9tF7DbwzzWqAh1l6pyd0bs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2R/ioR3yjiiZa7aqcgMfq1dnIMzoIo8VVwz
 9cn3LqYt0SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndkQAKCRCLPIo+Aiko
 1ZKdB/4g6h+nm/DHyyS66I52Br8hOQdazzkdNt4IG23U9f3snkrloUcl7kaf4fx/FxPwy1rY/Oi
 e/fgklu4CBSjRAwNkJmoq96oKIe6s1ikVqOGX5efON00FVBH0AWamXgteHcA7mDYQssPQTayslX
 REaBHU0DbJ+GJIcRodzNBCBTJSfTaOt/XwsfoiDMhSmPTy1+FrU+dgMgaLqB8e7TaZX1RykDEMm
 arG7Le0pglfL7im9/GUQDf0lVm7hn1laEeRulf4UDweAJdqgF7SniMUpGuRmJQC86VWb8oakhgT
 iL4FiwqWk/NGRLUH7pm2Kk8nCaL3Hxn53qtG1klgnGK8nmZC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: zU29820XrOmXY_37NcGsXcyw9Mb5FKxs
X-Proofpoint-GUID: zU29820XrOmXY_37NcGsXcyw9Mb5FKxs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX30Sz6mRMwYDF
 vVs1NrAUsyZUjwLRrwxbPpLDelO6EFZiewfWyDdJyrAY8ikY8LzhGC24DSSxyv2+ntn3Tt0EQYT
 u17pUMZWD00G4dY44a/rfBUotV3epjJj02lw4YIsiz0fTqI6M6/opJFKuMnZc5kxyZRpOQGU/0z
 RRl3bAhXcAbydEpOnkgSwKTZmk9Vj+47Nwsg5ihCEMsqRbbgxiKxno6jaT0WO5zCzwAqLAbi+Ad
 4b4mIIeeWuwRjhFlh5nNbrkDAmOfZ5hRN6xAlq43hc5noiloZyUMyC9ws09+bg33OJObjQxwpF8
 z5I7+6hqTbfscy9BASfwmoKCl5qFhGF9dBAqxtJEv1MkZozT0QT51h8i/QOCNtlFHceI/sO3qYu
 ZD4WAxnWCtME0jZXOHBnihjuXq9OjuVllo4evB2iFjO1YdkUSSAIQNWQWKO8CLgROpyhYfkO17r
 Z4WHchZF8sPQeaATdFg==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b09ddb3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8
 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8 a=e5mUnYsNAAAA:8 a=FoPEBnDcYiGibjaZs98A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX+V7QUZISvMk/
 kMuxeIa3WWpQ9BC+FlVe+W7lbALYIYJ/FFIgdDkjj5t5M8QAdCl7fRf6F83+Pv8uvpzW5wxESv0
 WyHWbC4jXYL2hnQKHbcDq0tGboA88XA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270078

When setting up the KMS fails, msm_drm_kms_init() cleans up by calling
the ->destroy() callback of the kms driver. That makes ->destroy()
responsible for tearing down a KMS in any state, from "not initialised at
all" to "fully initialised", and the drivers get it wrong in several
ways:

 - dpu_kms_hw_init() and mdp5_init() already clean up after their own
   failures, and ->destroy() then finalises the global state object a
   second time;

 - mdp4_destroy() dereferences mdp4_kms->dev, which isn't set yet when
   mdp_kms_init() fails;

 - msm_kms_init() leaves a NULL workqueue behind when it fails to
   allocate it, which msm_kms_destroy() passes to destroy_workqueue();

 - msm_drm_kms_init() hands a half initialised KMS to the full teardown
   of msm_drm_kms_uninit(), and the snapshot init ignores the failure to
   create its worker;

 - the IOMMU fault handler and the DPU interrupts can queue a display
   snapshot on its worker after it has been destroyed, or against a KMS
   which is still being set up;

 - the MDP5 driver appends its hardware blocks to the arrays in
   mdp5_kms on every bind and overflows them on the next bind;

 - the DPU never cleans up its self-refresh helpers, whose delayed work
   then commits to a KMS which has been torn down.

Most of these were pointed out by Sashiko while reviewing the "drm/msm:
fix SMMU fault dumps" series, which has been carrying the first fixes.
Rather than teaching ->destroy() about ever more partial states, this
series switches the KMS init to the usual kernel convention: every init
function undoes its own steps when it fails, and ->destroy() only ever
tears down a KMS which was initialised successfully. This reverses the
approach of commit 93c125e4ea98 ("drm/msm: don't tear down KMS twice when
KMS init fails"), which moved all of the cleanup into ->destroy().

To keep every step safe and bisectable, the drivers are converted one at
a time: a temporary flag tells msm_drm_kms_init() that a driver cleans up
its own failures, and both the flag and ->hw_init(), which gets folded
into the drivers' kms_init(), are removed once all the drivers have been
converted. The last patches fix the teardown of the DPU self-refresh
helpers and follow up on the new rules: they unwind the DPU hardware
setup step by step, disable the MDP4 vdd regulator on teardown, and drop
the runtime PM flags which ->destroy() no longer needs.

Tested on DB820c (MSM8996) with both the MDP5 and the DPU drivers, with
failures injected into the msm_kms_init(), the MDP5 kms_init(), the DPU
hardware setup and after a successful kms_init(): each of them now fails
the bind cleanly, without warnings, and a later bind attempt succeeds.
Unbinding and rebinding the driver works as well, except that with MDP5
the HDMI output does not come back after a rebind (its extp clock fails
to enable), which is not affected by this series. MDP4 is build-tested
only.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- snapshot init: don't double-destroy dump_mutex (Konrad)
- tear the snapshot worker down before the KMS on the init error path (Konrad)
- dropped Konrad's Ack on patch 10 (teardown reordered there)
- Link to v3: https://patch.msgid.link/20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com

Changes in v3:
- Rebased on msm/msm-next, fixing the conflict.
- Link to v2: https://patch.msgid.link/20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com

Changes in v2:
- Added patches which register the KMS fault handler late, reset the
  MDP5 hardware block counts and clean up the DPU self-refresh helpers
- The unwind of dpu_kms_hw_init() now clears the drmm-allocated hw block
  pointers, dpu_kms outlives them into the next bind (Sashiko)
- kms->vm, kms->wq and the timer workers are cleared on teardown too
- Moved the MDP5 counts fix to the front, merged the error exits of
  msm_drm_init(), clarified the fault handler and self-refresh commit
  messages
- Link to v1: https://patch.msgid.link/20261003-msm-kms-destroy-fixes-v1-0-e062b7dae77f@oss.qualcomm.com

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Archit Taneja <architt@codeaurora.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Kalyan Thota <quic_kalyant@quicinc.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

---
Dmitry Baryshkov (14):
      drm/msm: fail the snapshot init when its worker cannot be created
      drm/msm/mdp5: forget the hardware blocks of a previous bind
      drm/msm: unwind msm_drm_kms_init() on failure
      drm/msm: order the display snapshot sources around its worker
      drm/msm: clean up after a failed msm_kms_init()
      drm/msm: let the kms drivers clean up a failed kms_init()
      drm/msm/mdp5: unwind a failed mdp5_kms_init()
      drm/msm/mdp4: unwind a failed mdp4_kms_init()
      drm/msm/dpu: don't tear down a failed hw_init twice
      drm/msm: tear down only a successfully initialised KMS
      drm/msm/dpu: clean up the self-refresh helpers on teardown
      drm/msm/dpu: unwind a failed dpu_kms_hw_init() step by step
      drm/msm/mdp4: disable the vdd regulator on teardown
      drm/msm: drop the runtime PM flags from the KMS teardown

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c      | 73 ++++++++++++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h      |  1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c     | 68 ++++++++++++++++----------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h     |  2 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c     | 52 ++++++++++++--------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h     |  2 -
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c | 14 ++++--
 drivers/gpu/drm/msm/msm_atomic.c             |  1 +
 drivers/gpu/drm/msm/msm_drv.c                | 29 +++++++----
 drivers/gpu/drm/msm/msm_kms.c                | 59 ++++++++++++----------
 drivers/gpu/drm/msm/msm_kms.h                | 19 +++++---
 11 files changed, 193 insertions(+), 127 deletions(-)
---
base-commit: d024361c631b3f020a26c07d683e5103404b0fbf
change-id: 20260930-msm-kms-destroy-fixes-0f04b1d39b83

Best regards,
--  
With best wishes
Dmitry

