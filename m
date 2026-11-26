Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674740;
	b=vUmlHxRwIunKtxgW0EG6ntxIVDV2UU3ndcacZZHDgifOgaxzvgbvie2ucE9Itjeh4wpl
	 7lCc+j3gw/Th+Xg6OV4jI34zJEOgrdVgN1Htfizda1FiheyR6EFvHp1+rZkveGiu9rMEj
	 NgUX8kGGUWCTi8UayTSczixmEOyggj69Tevg2KkhFH3/dsL144zZJgMoJ7UU5cDbKcwpO
	 J9Hs/L8kQWxaXpFJjqf8bZsoyG7LSRLo2hMa/0X+IrTK2gQ7tglYFeSfANW9SICJwjMFh
	 wUUxDNfQZeBguaB24y4G2aNgX6YvuPTvl3VH7lonrqGbPghXTvyBW2aIUNFugvAV05A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4AkcPh/1wch0GkquBRzujr3SqM+yDsjNnQ1ilgbyD90=;
	b=fR1vfeFjhzVG3OheD9VQwwZrhXypSqibg5vX4GIiT1XcWfoenZCixVB6zznRTP3iDG+h
	 ENmkP0vtgQ3O+lwyuNtNkp7dSBSZzSR/WCz9La0iVEY9goqBM0ItFRGeBYjSQf0Cjd1AX
	 GBAX/oA41qV4CdJ2aGMVrTrisEOhqGX9HohM/Mnxym/9xNfz2RDa0K5HFdUcQg5kwLNYx
	 /d+O9Afza0Lu9ps8kMF/b/4S6M7guXRv4DO4AItVpRa6tm+e6d2BMYtOJy7XyeL5hyFPU
	 9VuN5afnI85mWIWh4KznzVvzQEU+TgsW3UBRPCndkxMmUQckMLaFUGErP8gLGq7/vug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdTmBJzp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="W1x2E/qE";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13375606A68D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13375606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdTmBJzp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W1x2E/qE
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36NBY1812800
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AkcPh/1wch0GkquBRzujr3SqM+yDsjNnQ1ilgbyD90=; b=ZdTmBJzpsejhQ8Nb
	+TcwWFSNTj2fYAuNXt2Fac5+3/twa7YPJCacab9hyvr8QYfFmefKJnKxFnOH37O2
	fcHVJtUkrsDVIc0XgPQyPaeW0CsTQn3X3eihe9H6mPTbsJhjCD6gD+atcm+QiA0B
	PgM04MsCHdUudm/AO+rckGk5PFl/RdgF7FaTqqCfSk3jLkeogRAZ7nXeadwsA6gk
	DypoSQoT6dvoNhKo5FmOrwgCLou7P/J/B/DbWgzq34Oybc8PkAGjHQ+dzKGlnaYx
	ttPLSgE/QxIy9SH1kT6l1n/CQm9PqDcJv5JPVVYoanS/ho3rTmDylnmmOTgu3ZKc
	PIyMPg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak00xa4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:32:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f074b87307so39592555ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674738; x=1796279538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AkcPh/1wch0GkquBRzujr3SqM+yDsjNnQ1ilgbyD90=;
        b=W1x2E/qE8LLPjpaG6TcgFg8MiWwTPQzEBTJjuJr0hDvL3/b85+CymYDhsnBYPcor9E
         EDnWBCCXaltY16cmA1U81x0JFdzr3ej9ee0vXxGoCoQta9VNcV2S8npdAZG+EFAKtmC7
         KssiQn5GsSVJwLTIKQX4q65h5179h4Rjuy5Ssr2Dkn9ZzrSNWw1Dlaz8OwFJwFkFK0Az
         sUSRyp6EYJ3DBKk9Um3SYJ4UTxtlkOw3RGwjwWwAoTMEvbtk2JRkqdsjg+5TJBws9YAv
         c4F6U2CDz0a0nDbURAjcBJVlYErl1sb7egtlk21Uek82AY63ztFaEhVSDj0LB/UXuiFb
         lkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674738; x=1796279538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AkcPh/1wch0GkquBRzujr3SqM+yDsjNnQ1ilgbyD90=;
        b=k2pg3xmymtADDrk4WKy7KFd4onwdnwH7x4yfbvXuLbcEuFVXM4TtAQtXP74js4ZI25
         t7Mkqj+YJrOJMUorMSKRSLPKC9vJfXEqLELufhyzQwF7rWdM9Qu5zJQt4V85c/sxDGQc
         7CbU1jGk2/bjoY5GiEc7ZOI2GxdHh3/2zlN+WKsX9A3oiEYMKu7afyC7ULwzixq/ArYa
         t2XoiNFsX4qKOp/PY8FTewSWIyMwEtdHMNMPF93k4x5sIMf9+ncQ0xTAzUAjvhFfu41K
         e+vRXo8/tFzg3zZUD5DsgOHPrf7CtxHaaC54T9XFgJvU/FT2kDhYSd0q6B5hj4fSZClL
         0Hsg==
X-Forwarded-Encrypted: i=1; AL+hErGFwIhkE36OXe/Q3EV8XtSbHKUibU/RkP5LGdcovvbppJk47mV78V4hEhmoKM4HhIeQZL6keBNpL4iW0xQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nSruhLyCtAqBJVdVLSPAqYsKvfZ1PWkVCV5pnadDy/555f+kN
	u3+4K2Skv+KrVABjzsg4qMC+sZqcEVHV6wTCcyx6f/+Vujkuyv4093mE9yojaD8C0NKYCc+E7E7
	XGtt0KmDyc4IqXX+RC1PjtNCl5W40hanGOBEPba5J+t0NOwpUwbUCULTa2SGHFLhs3Oi/t9PsQI
	w=
X-Gm-Gg: AZFdTZfJEV1Gj6pWd1Nkso4nZ0UtXmcboYIyR7R4060OlgEcoU18JXVVwdVSxcOLVDx
	0h8sycyV2tDSExHsDMJnzY4ImUb3yuXMIdJQ93Frn0CzvVeQYL2YLhWYxDq59rvnOaLq0kcgv0J
	4rO6mQ3V86RmjctwAF5jnXUbPcLpxYdewDoHDADb3Ipqt18g4kEr0YeEhzvvMXobj2tNI45a24b
	bxryuE+2E7AkDD2mkOH4tW7lB+wOowfdMvh3vS2Uk1JDe38bV9GCbkpYJe6wXOZv/mQtUXnsVsu
	eU0xrRejSzLnmf6lidiyMUmHkgtClhthhj3zjb4+qpkHVi6z10Yhc701LsghLrEFN1DNQEZtf1P
	NnWS6S9gVQ74srmaZ6kyOXL0IlIXSWIgiMG7VpTOW0h+YbF5UwSrsjKkSTLMB+AWo8HufnYAHbn
	RCN4XOwp4q
X-Received: by 2002:a17:903:2406:b0:2f0:ea76:1a19 with SMTP id d9443c01a7336-2f0ea761b46mr18249195ad.54.1795674738133;
        Wed, 25 Nov 2026 22:32:18 -0800 (PST)
X-Received: by 2002:a17:903:2406:b0:2f0:ea76:1a19 with SMTP id d9443c01a7336-2f0ea761b46mr18248945ad.54.1795674737658;
        Wed, 25 Nov 2026 22:32:17 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:32:17 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:28 +0530
Subject: [PATCH v3 20/21] drm/msm: Register the DCP backend
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-20-f1e9d7505039@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=921;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=6PWxDVi4BsbO/741ftQsQBNSZTnRP3jHkckpMt40Eso=;
 b=Wl4BjgymT1IPugnivQbz8x6tsQhKaYhy1kx4zbGuLUWYteGkdm3HxalR5HeEUukju4cP5dIWN
 +kl35YXB7zYAwa3nkmZqDOH4Hq8/2VZ6AY2DQkmg7CXkeXse2A2DgET
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b07d273 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BMemq1xz1GlmVizxLk0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: XhVFazHAFGQoVcvBL7J3oVWYI5gFY3xa
X-Proofpoint-GUID: XhVFazHAFGQoVcvBL7J3oVWYI5gFY3xa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX+IcmkqOt9ODl
 XY0Rqfz3oqx5IxChuOVDl/Hc1R2Q9D6fcAhMhIwummQ/aVlozRONFfIOGYvUL5k24jdPysOZEZi
 0r1yGY1j/4PSUIYUbOSIU3A+HO3Dxy2kTSsbD3QVSXG/+vlfzqAET6fdnNFXZL2fsQYJAZuZd0W
 f006nSq0lCRtVtqvPXQKGBU0Rk4WE681vK55l5dKW0b5tyMyuSc52Ye1UUAW98GCUZt3dLCOPLn
 YRlbJf60i+kJYOnQAxv18S+I9qzp/0LoL8ysyZYxYdBZQ0DXjUlhSCV7FCBLIg45iWRsQ/G5QjM
 v46JXn+4Gz7ohSC7d7pb2B7P/jV6eNENoR8ydWEsgxhDr4xPnV5zuX1OqC55JYj6Q1xeZb3B2RY
 r5Pm/RhhcuAzwVKcEyfIO+pWc8JEzbD0yL1yS5OMHXZ+TiRilnZXfl7CNYdisS9UJHNKw5oe7T+
 z53Xe2E0kH0boiLL88g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX6J2By9W8LD2C
 rniU19t+2z4yH5by5NYDXNKVMO0F5VxmeO+jjmzC9TrRGR1Y6Wiac8XyBtPw309A56AID8QTKra
 b+gslHRCRCUx5tX/OOEhEpW/krTFI2U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

The DCP display device is discovered over VirtIO, so the MSM DRM core
must have the DCP backend registered for it to bind.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index bb383bb0fe8e..af95237ac872 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1209,6 +1209,7 @@ static int __init msm_drm_register(void)
 	DBG("init");
 	msm_mdp_register();
 	msm_dpu_register();
+	msm_dcp_register();
 	msm_dsi_register();
 	msm_hdmi_register();
 	msm_dp_register();
@@ -1230,6 +1231,7 @@ static void __exit msm_drm_unregister(void)
 	msm_dsi_unregister();
 	msm_mdp_unregister();
 	msm_dpu_unregister();
+	msm_dcp_unregister();
 }
 
 module_init(msm_drm_register);

-- 
2.43.0

