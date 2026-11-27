Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808697;
	b=KC62DfW1PELae1ghUjtOoQdXXgpwDKUoOzYST/cp62H5MpDcPq+nOmU75eN/q021LUAI
	 PYx4onk4iMCbz+YACMMhbz7/ADfKA+1qBbMt/X1VKtZX+v/WTwk0uqCM5Dh//F9eKo6Qs
	 1PrJkkPisZWAkgLt4mTKjCVcgvAvtrpj+eZ1EGWuX+veGtsKzzN2FIFlFIN0rXn+1BHCC
	 86lO3/SVh9zQPa1EQjlKg7p3SD9YBY+ZdlWLl7V+EdUQyTqgJCYhg1FzSEK+vhjYLA2JU
	 MSuMEmIFm3J/anrh6pQkjanhKZOY+5w16sZzlzBMR58/gpgciL4hUFSqi2jX9vh2z6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808697;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FGme04KE8YTGTv4q91+XAorU6TR68+yXxNUbdjuMex4=;
	b=cXVNjldVkUNLuhZNtB1ZuietOhtLq/O6h/XzXxXmxtCGAIrlElgUbXUeO3hd76eUPLns
	 HLd2bc6NmxynwdyMl4f0Vn97Yx7XxkTQOUZtnfBFuqSlSuH7L3eqFedLLH8Du1KG0e03u
	 g16W+LCgy/khiscSyoGsq4/KoC3ssr70uMlriYUSC+W2RbsrfrxuT2hmwsjRdGcWR8qM7
	 n5Up68Jl4V/WC4YlFvnnb2InNQOCU2M9+BSqXkULB++32oXffwqZlaBwmbogmCntVuko3
	 lBySZFosM0sFcDYQSaieVNKxMvX/6rnbozKv6QzftAVlqw241qynXAVYLT4Z5Hf0JmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GqWo8qaZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DicMy8Cq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEF2606A330
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECEF2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GqWo8qaZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DicMy8Cq
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJTWpf525192
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FGme04KE8YTGTv4q91+XAorU6TR68+yXxNUbdjuMex4=; b=GqWo8qaZYfn4yRQA
	0SGjzcI3zqE5FZRaIi9toF/tPFki3DTmO0n9y2R9mdUJdIN+/DqK/5i+pbC0bpt1
	aiYdJC2pHzgvjLn4Ujt9xWiuf5BFtUy0BwO/J9gLKYG00E8secfmx7qXN2ZnFbPh
	syj1WHCTw7hHlWWAIShpt4X6UmVU09TV6FULTeId8qMzMIG3O0QV8hWJJVcTUzb+
	A/fxKLTeOHxxtA+fGQu9zovUjCTQ/1vZp0asLlamNPMHl/kd5nsjabrdeJ0pUP9c
	dnLRCLQ8p1Smkzl4zDbyK6g6FPJLZRU0yc8MpaKG/76vSjt5lRQnHzwvE7C1Et2D
	e7LllQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g2dr11e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:44:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92104826f9bso150761776d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808695; x=1796413495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGme04KE8YTGTv4q91+XAorU6TR68+yXxNUbdjuMex4=;
        b=DicMy8CqB9+rA15w9vAS3+ggFx5RSDuuSV514kWl80HDFTU86IKfR2zZZEJeuGztv2
         X+dg5kJJkyjx38LOU9e6VR56ikU1SpZFmEpQGpcZAaQP4nWs6FsR3xe7hh0gDXFVq4jx
         ASspwNXRaJCgOJI/0Dq6G937RpIl96SYZMWdB/PDAR1JrkYe+uCweh0mhAcJmAi7YOp8
         qldc2o5t4w4NxbSv4Jy1RHKJTaQ+adj/iNs23oo3G8XZGICYz/6bJfNbuzM2AYDdk5XX
         f/ITuFbfvdrz111F6RMNmgTzG61DYfoRH1pZ6C+7TQquwiC8klImmPejWV190hDSChQv
         dc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808695; x=1796413495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGme04KE8YTGTv4q91+XAorU6TR68+yXxNUbdjuMex4=;
        b=tRoB/SofitLmAcWMu93xuArogBNXrD/THrLm0hXERGrvIYT7FOHdLY6E4/dAwtw69O
         1v9YmIizlf/+azoUD12Jod4UcCj2k8LowUJ5BY+Ah3aMkCjuCe7WTua8v2kGPa3+DNMf
         VCYdTKkP9ATu6voXZxbT3bqLd759FcA6HMfowJB74yGYTDUDpnG1xQBoxaRSDwlzxSdA
         c2kaxnGjh45+x4O7J8pR2meWCEqmOqGwj/qeJLklnxXFnpyA5yC1K6rCvYtK3sys7oKx
         F0zXuIdXp/WRjf+JytmAoCd/FtVM/TQnUJ7IQlqRUf6DCwQxyocLH82LO69ArA+TYC6H
         p+FQ==
X-Forwarded-Encrypted: i=1; AL+hErHjwvHnG2iFWqosDefMThfHG/K01G9fmVCWkR3XkJ3HWPPD1LPhHFxklODq2G6JB4SaKThz24WWVnu3nO4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YbwrNEfIYkjOTaqh3oP1sitTN/4z/Ad2EHfjd5Lu24VZFFgks
	s6rim2dw2pwKL+PLnqFaJynzwdB8zvWr8IrF4pclvd8nsDI+J2RQ7pm8tpczrkGsI0y+sF6/CcX
	M/+caxEOYBn1xrvMEpihCNuPI4XTTihajv4fcFF7/fPhVhoXP220p89RrS5UyvYN43No=
X-Gm-Gg: AZFdTZcPO9Y2pcrrmRr6cC7UEASNZu5Lbg4rQuFtNssW6LNYmjm6VhFbl7pyJjGYac3
	VApO65JgG4u0tmjxxA7BAWrBmAiLXvB1dtD1EM8jCEjAFbsf1H93+XHDzsqQjhqWE154R+MRu9N
	YCyDbQlCJYKvwCk6JtHUp9/LBm8B+w/swbhvRpXoDzuz79g/mkEOrfDD9JD+eAtWLudm6GUOEt/
	Of3KHkZfoyZXKA1r3DpYmWxBMzdLA4bNMcZ+KRsO6Jm3XbCpFtfsqR9lBkpgesg1RfOvQo9PJ8Z
	r03vXngmSRPndKrXWAsbYVuiDhkOJLZ/09MGGoJ7C+4Ea5EQN1qRCD/4W6gCXJy3SilqX6H+TJb
	clH5otxogcU6UPcMaWVlGmL2Z4eVeXY9o61ml4W5pYZ4XiGvSjNhLCWkTV6qKMbVD5UVlv6CDol
	ePukWX/Mvz7DlPpCPtXns760TKaXzLl+U6QksCcMEn8bzIethTTLOXNcRLHhvHuw==
X-Received: by 2002:a05:6214:b61:b0:921:84c5:8faf with SMTP id 6a1803df08f44-92184c59c32mr147407076d6.12.1795808695150;
        Fri, 27 Nov 2026 11:44:55 -0800 (PST)
X-Received: by 2002:a05:6214:b61:b0:921:84c5:8faf with SMTP id 6a1803df08f44-92184c59c32mr147406666d6.12.1795808694624;
        Fri, 27 Nov 2026 11:44:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:44:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 21:44:15 +0200
Subject: [PATCH v4 02/14] drm/msm/mdp5: forget the hardware blocks of a
 previous bind
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
Message-Id: <20261127-msm-kms-destroy-fixes-v4-2-242b0a3f8e47@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1748;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zt/mVP+EEls9bu9ax6mLMV+QrjhwVDSTay40Fi0xlRU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2Y+qlOF2bzSiezhCw069vw/eQH7bU0nBtXb
 AWxGWeVFz+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndmAAKCRCLPIo+Aiko
 1b9UCACQSy/DTtE548PmRXUW+SXe3vPi2keoae+ZS4SBpoX0+8poK9Clb28LyQzXIJar2a4B3uH
 82h77UBdOwSvfxROtGqpfdknQ7K9OrpIE4lbaucTHfViwQiUbw3IrYHADdWN/OLxGyYLK4GwjgB
 VylpcyrCWHJ059utiHpLgwPbIeH4SC/KDqCZKiw5yiC7rzXFNFcrEP2XcuhLQt5RJO6M7aTp/0z
 JCcLIXc1Wb20zcSUaQ9OmI7192M9HvcsbuVTVixd9RBSTEbEd/K72ASYbYpezLtEGuoX+AL2g3K
 D53zUDWmXrrMulkvfkV7u6/WQPggz75QGa3c/rOvyD9DmkQC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX5/RrMPyMVMLt
 hCNi0R+d16Rwo4dOJ3djqsjd5aMkmX6IB+iwi6Ig4BeAALCyeBozK/f5ckv7OrxsCWd8RUhcgs2
 WgMS8L2mXXeu4YnRxbxxoAZo6fEtXTDOKrwZeqvx3bnGmU5SNqtDV1wldZdheVHZjhzA/4Q3lhx
 DvNAUT03f+3J9WG30+BDhmFjXrjAPlZZEtOYDqzJ90SG1o7ETsShKrrt8fGjZXwtS94FlNiEQij
 sQTyxIgVXIuP3Z51fyI8+kflPZUkUxi00Ar3XazsX/2gfOY541HFawwjF6eaK/cToHrGdtlvpkl
 WIy8WpWWM/XF+AUMFxJJu5EcKMMay/eoxSZTYk5JkCvn+SQGEE2XBbremKN0VEOwnXwSAs/5YUa
 VItteaWbSxu67s9W61PRQfSJ0VDTGSFBfELPUQNS6UwedaFfIkp8P92rPvz72Asf9Iirscx/jCY
 TE4U7/tHXyJ7GDGyTig==
X-Proofpoint-GUID: vN-oHU7HQD-C46jqBoZR7iWpvXdUN_y9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX/fNGKMUCnBrD
 xk2EFL+scu6aHehEctNgo1mkBozwmri7Q1vBaOk5jZOyy5HRLManqTerphyya8jJDsoAwZKX6nt
 H6ZLphDjz2FOhtPS/LqZmZQ7TRH7Y1I=
X-Authority-Analysis: v=2.4 cv=dJEzC+Zb c=1 sm=1 tr=0 ts=6b09ddb7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=X8-H6Saci9yJdrauny8A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: vN-oHU7HQD-C46jqBoZR7iWpvXdUN_y9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270078

Binding the MDP5 driver again, after an unbind or after a failed bind,
corrupts struct mdp5_kms. On DB820c, binding it after a failed bind
oopses in hwmixer_init():

  Unable to handle kernel paging request at virtual address ffff0004d411f9d8
  pc : mdp5_kms_init+0x264/0x7f8

Since mdp5_kms is allocated in mdp5_dev_probe(), it outlives the bind,
but hwpipe_init(), hwmixer_init() and interface_init() still run on
each bind and append to the hwpipes[], hwmixers[] and intfs[] arrays
without resetting their counts. The second bind writes past the end of
hwpipes[] into the fields which follow it.

Reset the counts when the hardware blocks are torn down. The blocks
themselves are devm-allocated on the MDP5 device on each bind and are
only freed when it is unbound; that leak is left for a separate change.

Fixes: 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation to the _probe function")
Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3934cd060b27..085c23820f46 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -570,6 +570,10 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 		pm_runtime_disable(&mdp5_kms->pdev->dev);
 
 	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
+
+	mdp5_kms->num_hwpipes = 0;
+	mdp5_kms->num_hwmixers = 0;
+	mdp5_kms->num_intfs = 0;
 }
 
 static int construct_pipes(struct mdp5_kms *mdp5_kms, int cnt,

-- 
2.47.3

