Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674715;
	b=fjisS//HFgTrpLjpHolbE2fNc0hKn/T04jM/2vKzGvzJozi8pcapGywEq12J/XpGAQv7
	 u55ew93vT/HNGyZKe3OXdyrxusxUxp4ujdkB4WU80nkbgwmGMFPsST3bmaCgyjiH73gdB
	 NvHVPsXjhIJqEfufK0j3S1+VVTY1RB2kTFe7MlQvACR75//FpGGFDAzJ0fwcSNl9WX0Ch
	 roOjklgGN+lzP0aV5Zr07jXMrAWJlMJioUTjdKbw+cKILn/DEdZZEa4ysQeOPZW+O4r4M
	 u67HOovCQg6GaQBKNTrdgYsCswIfBGNdaNblTmD7AOH0j3NDmmo+MGTOcNLsXAMWV9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674715;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=obwlnMkjoC3GVhuJ8eqS1mhshuqTDQ7x+oKEZyK4Nbw=;
	b=wf8RhePm4yENDTib3pYI1vp2nv/P4PFgbV/XnsO45K0waY9LMyOopYB7y+ideru0PA7m
	 B3xtUpR01YOcG/0TaFlHubsVrw+/ZsTcVxTJca7X/mQZj9F6JtAloXhmjQnyHcp26Ahau
	 cE1npVjj52Qx2zmHEYW3eVVbZqGnjUDs6rsX4jC2hXHSk9TOeQV8VvuxYZX5lHLhPH88L
	 x08x6XivZiZUAKyYKI+tz3fkb/INb1RVN7AiHPupo0NNAb2DO651Q8OgA2+OATUvkPTWY
	 /JylBuZI+QKivkcz5hU4VrjU3z7EtGNq5fDrsrj3qfWGYGv+1KReHLZCsF3vCfLuWDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l2BL9GBK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXZh3xYW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE629606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE629606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l2BL9GBK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXZh3xYW
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36MZk3022906
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	obwlnMkjoC3GVhuJ8eqS1mhshuqTDQ7x+oKEZyK4Nbw=; b=l2BL9GBKLXs887F2
	sLqje7Dq6r9V4WZ5Xnvv1YrGUb9S/WkxwzcCEQau3Uacff//5mVTuLHAtxBoA6n5
	El3q6WkqxpLGOjsUkIM4ZqMBvy0wWWk8DfWlQ9/HjYSD0M1uZzaxORxyHG90mDwL
	MfXx41rkB5N+CjNvefQYLiyZ+kOFhZSOIfDb5tGmZX5s7nICFRkA/4ITUFoSSyb4
	FzUt1xJFPg8w87az5Y8gy66E2i5GuMJ6QEeBCn6ALmkSKzrGK514d5XX28jZzRY/
	kBJjAkLanu5P7Ty0JdJhT1rCqrw5yRiZDxs/XHq3COxZ7/27q/f6YOQ8pqtsNSFX
	iQnJLA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vatknc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:31:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f0467a525eso50565335ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674713; x=1796279513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=obwlnMkjoC3GVhuJ8eqS1mhshuqTDQ7x+oKEZyK4Nbw=;
        b=AXZh3xYWvpotSMsqiKqzf/q4VrePNeO7i1gXziRCkbHkthUJF6JQ4anRKGFD3HDAn2
         kgcvCwgV9VZtODDvemtmFUBDVMY0G60jK2XNHTjvu5yxBC3g3/9WiM3xZJzSZJlJiGCI
         h2PZQ9AX8808QHWl7f/oIycC8ZQS2igWi9TCiuKvP8rfDrEHySUSSTXK3jJE8ojRwq75
         F5qYY5ot5WrOdg/KRTHqUV1BbvDe6/6kfJZj+ecPUYudMA+wAZdzwVkIZFI8BS+yzcny
         UaMkSjoolvSSqBP6MIYFn/Pm9xBuwPb1eusJNWkE4Ng5z2t4ac0TJ90xZM82BbWL4JWG
         lZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674713; x=1796279513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=obwlnMkjoC3GVhuJ8eqS1mhshuqTDQ7x+oKEZyK4Nbw=;
        b=QC82HE8KEODE6lseqWzDyvEjP0AeaIRrTSH96kef4XPhl+lE90XBxXESX3u7XJ0pQN
         bnDKtTRXyucV2GE4e2NemH6Qtno7tXmch1MlPiEw6lC0ZZbJdeZxGTrWMX+Eh3w3XeeL
         zSxinONmVfCVXa74M0scCFrCRbQ8PwQ07KGz3O91/2MBmTtUoYz+Tc06ySDRpxtQpbY+
         NUeB8fKlzfi1+o343cskuDo+muhhHrshM6/HUZKJoe8AtrDy4Eg0NuKXU0AdOHR84EGP
         3keKbxJ9wLOUmvm/KzBgTyqYXLgr2f5mx94dB8oh9XBFqF6b489sT7dPU9yYJ/5oHu4L
         LqtA==
X-Forwarded-Encrypted: i=1; AL+hErEbzX2ks7QkyDPRZ3r4LzRGk2p9V6l6RRwyUQQokhiolWc7sJrKrYYm4rOPpyQafHJRJrH6kKexwNExaLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+odk4Ioju4fNJx5RUN4wIuogjN6Ldcb1dskuJJl+qbbZkpSzb
	dvQJeGFa6yyj9iet44cygryVsCsEoblwj5SWDFHys4ZliOTwqPpnLU2J7IsC7SlcJokRDhXrv0r
	eTAnpZhNj0fn22Pyhg3EnnRUnFS2F31hEe5qG0OEhh91/UpCiraGh9Fw88QNoGvZE6p4=
X-Gm-Gg: AZFdTZeWqwShGrn/c2xMQnA6dkqYH2A7KiP4DzcRTx7qw2R4XJ2u9DcRaYkfKEiFUKr
	tLGQGHnzQmh6rl8L9w6KOZ59pe9SRfi8QfR9swf9HONw1cyVWfWW1L3UVofrQejEHpwvJIei6Jr
	73cpEQSuiGEejUI+kjAR0/Bnr+rqkX76587vFzpyC0ytOunX6yY+95yg7FEpqN0NeIqArxBKWpB
	2mmY2E+wC029qHTvFy166/I/VOG8h40Kr61gAiHfe8icIC7hSuMyDAhf7BKCN1nm+TXCTsmqnPc
	GoATkzDvkss1taH7rjEPcbwi5I1uYFNc/kl+0T/vDoUwMVeMx7iQIXsfWig0aj9i12wNy5Qv20q
	cp6XH9xnsUhPg0QxSt7IqMwx4+Z4i2TAlZMOa4snp4HaC8vHC5IyvD3pqUXEwzzfpx1x5JXcM62
	s3S60qC1Kr
X-Received: by 2002:a17:902:cec4:b0:2ef:f392:38b7 with SMTP id d9443c01a7336-2f03f1a1841mr216412205ad.24.1795674713082;
        Wed, 25 Nov 2026 22:31:53 -0800 (PST)
X-Received: by 2002:a17:902:cec4:b0:2ef:f392:38b7 with SMTP id d9443c01a7336-2f03f1a1841mr216411775ad.24.1795674712566;
        Wed, 25 Nov 2026 22:31:52 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:31:52 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:25 +0530
Subject: [PATCH v3 17/21] drm/msm: Export GPU component matching helper
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-17-f1e9d7505039@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=1633;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=+kHZ6OP8gcD8pNbmCuB0Bs0MumxiGgHxobreJFpOXLw=;
 b=3pGTZXEIQomPo58QAYimRvl0pzI/Q2Jyk4johiZeBLOcZi0M1YjrV3Vw/j14XFIzbrcxTGQhe
 bv/vtYoQfOGBxQWGelLfLKDlhbSG/r1lhDKz6ZbhAoi+3cZ6ozveD4j
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX+a3SSaf7fit5
 9zVKwu6IhDxRho8bxh0M6qwCB7tcpQ23PjKPQyvdCc2X9Xg0v7oU6T+grhWVbriK/uyX/HaF0kZ
 XxiWKMnsRIS6Cpmm92+uqMmX0qGE4rE=
X-Proofpoint-ORIG-GUID: VjVwe7xACkDfmFbcor_EP0CiEJEO89qq
X-Proofpoint-GUID: VjVwe7xACkDfmFbcor_EP0CiEJEO89qq
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07d25a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=a_sH-KrDn922EyEOKHQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX9sWr6FRIYUmF
 P8DiJaCP5RBXRbQ1Dh8kfdxAR6V98LUFcU/9VoOliXK9ZCMq16e6xjYwoISCCLnZtuWCtSwtBo1
 BGnczqQFxxQco6Njt+0xAu1DtczV2zpT2ghHplil07pg/jJ13QUC2WvkuHAZOpyA9zUNiK7pvdc
 FPumJOU3lYBOTShTQFGPYze7Dv0RnTXIMBliJFTz91TMzqs5R/tWc5V7eVhgB+0sSWlgLhf5alr
 UihJxgmMDy/oBnnMwLrjytRlsMl0Zc6qtXdmuge649bOO3PkyjzIcJa+UeLi+fehyOELLUHVlO2
 7ZySN7HWhLvI878a/9FMlbDmUMOAmX8gzoXLC4DVGlXl91kxgA9PtzKgGBVkQteO7nCXRj+etZT
 NvGceZbWy2FsYqfx1MVcqnq6MT4nKJXG9HSRWEoIKaTeCUJi5pmIyf2uXn1iBzNvPKLuNWngR5m
 /vsED5XKcmrAMB//+zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

The DCP DRM master needs to reuse MSM's GPU-component matching logic.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 6 +++---
 drivers/gpu/drm/msm/msm_drv.h | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3675df277f6a..bb383bb0fe8e 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1094,8 +1094,8 @@ static const struct of_device_id msm_gpu_match[] = {
 	{ },
 };
 
-static int add_gpu_components(struct device *dev,
-			      struct component_match **matchptr)
+int msm_add_gpu_components(struct device *dev,
+			   struct component_match **matchptr)
 {
 	struct device_node *np;
 
@@ -1154,7 +1154,7 @@ int msm_drv_probe(struct device *master_dev,
 	}
 
 	if (!msm_separate_gpu_kms_components()) {
-		ret = add_gpu_components(master_dev, &match);
+		ret = msm_add_gpu_components(master_dev, &match);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2840e8a5052d..aa5dfd82ac6f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -523,6 +523,8 @@ static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
 /* Driver helpers */
 
 extern const struct component_master_ops msm_drm_ops;
+int msm_add_gpu_components(struct device *dev,
+			   struct component_match **matchptr);
 
 int msm_kms_pm_prepare(struct device *dev);
 void msm_kms_pm_complete(struct device *dev);

-- 
2.43.0

