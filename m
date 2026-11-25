Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795582444;
	b=Pp3AZ5TXVcr10Jmy1qC+o68eE/Gfo+YWowtOFA0lcRxuNWf/zY/oCfHIHtlfpzDWPpDk
	 HEzkX67UY0p0oXFJMnqbijNV+zYWE14anV7grsB91Au90cwFQT01YkGSYD1PYXiYkx27P
	 8XX8m2QmIAI0sZpiBw7akEX4+SkE+KBdAYTFhhYBUsFOfPML4H0G2jfZq1t5yUcbUq4py
	 aTmVs6Pv1xi72zYdQsfUXxlJbPW3QyU4ykDydhx7MrKhyWNhY/LPTb8fRtIvULXhjCSmb
	 k1kNUDRelBmdg9o9w3wPBlhOftrXpFvqSumux4MG82wlBa3QyEtqJh0tPRrEu0RnutA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795582444;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xR7RhWJqTr/aczzO3EIq1crgEudqfPhwaC9mSHTF0TU=;
	b=TCxu612/+Zk06lZZ9Bm6hgyDf/LsKzZQIYJdZqM4wAnpcOjE5unsCAz4DDQR+8QpGQGp
	 PFxFqE8Z68J1Ef3zSNflT3H9org5zB2LWkOAnuE0nfAc4Djol/0N4wFUpNK4oYBIqCvLw
	 KF4G4lMQdzAJV3rM3un7nxIYhp5OoCmPABDM1p7/OqubMBJjWQLcfZ2O8MRPnsPf0dAR8
	 r6mFPgTVV/SGhByA2Cz/mxAqzMQ4r/C1U4C/MLPMSqNxdGAKpPGhf+gNUSeWxuc98oPmu
	 Ul9fifh+ZriqHrLR7rxljlcnkfPga4ARYtgty5HJokoycBcankTcbYXcNhh97L4YfYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l4KQfzU9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CJFmXCZT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C9F606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51C9F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l4KQfzU9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CJFmXCZT
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2B6k32625886
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xR7RhWJqTr/aczzO3EIq1crgEudqfPhwaC9mSHTF0TU=; b=l4KQfzU9Rc99lK+V
	nzj0GpWMR9ZTrp+ng2TtKfpbVTLmMGKE/7Xq7JL3KIUBubUG0ACAJZPToxrlD+sQ
	3pu0vOv/lBWMNfHDGgTxkN8BfGVxREQMD0OuGmohCSHRoKMQTZuiAPq0gBmZhBq7
	HaqCbfXV7EE5oD2cuyNMP4ASZKI/yI2lKoGExHLw46voeEF6SD8pn4/BaXB1V+HC
	uhBUkk0IIflK8NedFUpB8LMPsI9fKiTlDRLZo3QdFV/FuT39GETZFrRu+BCSnnFl
	McRY2fZiqlknjN0ZviKBt1NVNPsj0B49N85i8UkpOtdO8I+l8aXGiCBWbTzIFzJ2
	OTi/aA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc28y71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:54:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960131befso790054285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795582442; x=1796187242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xR7RhWJqTr/aczzO3EIq1crgEudqfPhwaC9mSHTF0TU=;
        b=CJFmXCZTjsbQrVl0wz30WjqVWe2WcQ+8G+HouIqhcKPeRdXXw/rkzMHnjyLBRK1oi9
         5c+x/tUcIDdQS3cNrAbr48mD9QOycLw4ut11ywSq8Z64i4ecdoK3fyK34zWsaUCagBjA
         oqbMgilB6T8MIEDyxNKppfxAQlr1x2k0PVYWx0vl+CboQrqGg/l7R5IsAKOh9U2TTYv7
         7OcWVnWWMykCTQynrAE2rf4boPzl43BVnjvNuqoYvadBPfObbDJRKIKZdXjJXHT4rj1x
         +f2nTVkSNurReKKddPcUGYLdWMFlRB6iQ9b3/cGCjf7hf1iLxhbUroiA0JogGvlG6T0U
         cKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795582442; x=1796187242;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xR7RhWJqTr/aczzO3EIq1crgEudqfPhwaC9mSHTF0TU=;
        b=QCDuEdM5O1xX2FBSfxSqsUOAj1245PerIyIOS7RypvuufY6ooCOzwR0owvVWFH0D2K
         OAaq8Qia7JlKkyCobDJ6ghSCTRRLTbjgm07xtLb9eGJQwgDtM5kDsZyzobtbK6Q9Xx5Z
         wzCFXgD/eYDfjwy425RW1wppqnQ+RaBeDGNRdkfQL6PBB48lddaM8R4M9YEKmWdRYdNo
         QsOvW1dlmw7Gw2FVArFVsaNPoszhaAS/pEr25neZkI3n69k8VIe7uGWit0n9IGbrvlrm
         8PpG1qDPyK1QK67tOCg9T0bCWlW2ska5y3aHD4r8iup7TqLwiJyx9NiHq/5pwFqrI5Iu
         STaA==
X-Forwarded-Encrypted: i=1; AL+hErFAaSHL+nBiK4JDs/tbiFRTnJblF27sfw3q0tY3ahmvnvGvN/8tCndJfuGy++LNBY3rHB76BsuUr9ej5r8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kjfKmPdu9FB0Oa8CVRI25JkVnaREkcUkn5O2db6SP/kLB2ZTn
	hucgiWr4fiHR4Q+Iouc63Hdt7aFKtREhSHhtAreSnIDZTqhrXGHQntO7kfL6IfyYrHjdFHINWhe
	fp2T4HbD+G/ptwnTieF4W7rDJ/Z7ISdYae749p1gUbf2Yh+B0s9jDbhxU0+a7rCr9S5s=
X-Gm-Gg: AZFdTZdSarFp6y0RAi51Iq0RnqI2RZRPRqug0+ThL/Ajrs5XbJNLUxbquM/rnZeiynJ
	WXMjftRQBq2+8vEEsiyyapR2PTxPNqqAlntc411zLqc6hlVxkaJvJoOexpOwKYBkVW15prlCOAW
	ISiSJV/cwYMv7h88z9U0IN/nUj0IZgCnN+HN1Sa1n3hwcrpNnbI4oSXZtNc4AqrsBWO2plM+wN/
	fkg2INpKUtMdrDMtPsU5EVWWWb/baqnd6GzmTz0dDIjjmohIc7vBRPRN+GBb3fLkcFbajramnVf
	PzegjeLoZXyTbGbaINJ77SRaHiU4NvVPg0LPvYOOrfwkVz5Ax244ZfTrY407z9C2UlEHZsLtlHr
	yfs6nZ5Rs+vrTRjtoBjFkD+EH3dYcMQUMokWlTi972DdsLTGyMRoKtbTLQoUEdGWfxKlg8gL6Lu
	bDgYwARhX9Yj69XaUZbCYloC2tumFLXPXNAgkubC8FFUHpPhPTryeUuXZUhjaDzA==
X-Received: by 2002:a05:620a:a408:10b0:94a:889:5a41 with SMTP id af79cd13be357-94a08896148mr24607985a.71.1795582442582;
        Tue, 24 Nov 2026 20:54:02 -0800 (PST)
X-Received: by 2002:a05:620a:a408:10b0:94a:889:5a41 with SMTP id af79cd13be357-94a08896148mr24604185a.71.1795582442056;
        Tue, 24 Nov 2026 20:54:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff6e32sm4243023e87.17.2026.11.24.20.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:54:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
Subject: Re: [PATCH 0/8] drm: writeback: clean up writeback connector
 initialization
Message-Id: <179558244050.1572056.6952667613622271304.b4-ty@b4>
Date: Wed, 25 Nov 2026 06:54:00 +0200
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
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b0669eb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VUr37Z-sP6Vbzkouko0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: tbDmMtpBrNNOADxzX0-7zLgiySTJYN_U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxOSBTYWx0ZWRfX9E8TtjCkowm4
 rfKsru1AN9RmpusrDHC9YwXjw32qf1/Cr4Xx26N+7CVoHmCAdfcvTjanL6Wix+HeAMOZIZpWOaN
 VvrPpDTFaZ5aYj6Yak9UQrTo2R5k7e5muaQQVQyUvaTkFmQv1Ak3vkj04ZaObH2CkVzR9r28HmE
 tWkt4SurU83n1tNMVRJ7LqBu8H51XZrVin+7Dp+5a9CC7ZuqV1uWetxXRM4Y2Yw1DLcwjM12sPM
 JTn47fewbMqdOHrdQv8wGj3lKEuNzVjxFNQqRnDExfpuNy99lc9UA9n2GE755IvRNblGRpkDVtl
 3NrEg6WU+YA4aq3G1lJNu8SF1xipviPJhnwmOk6pm0fXN+TdirExnGiMAdzkeqddshwKGsm5Z5g
 PIPXTBNoLa14aWfLJgdSakK2guFUL8pufyT8lH/CpN/Z8AFu8ruxw/lmx8Qx+SfyzyY9FeGXV61
 aCwTbOWwwR/BqrOPwUQ==
X-Proofpoint-ORIG-GUID: tbDmMtpBrNNOADxzX0-7zLgiySTJYN_U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxOSBTYWx0ZWRfX/mcNTUaxOagO
 g/NeEZz8CgrcJGvWHebUgNkQIPc19IZKX2ScCuWf4XBRLspzxA/gA0Anp7jRSenQIJhG6MHkn9P
 a5GndN/VxGcfoFOEZ+eUUODAe8h3seA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250019

On Fri, 01 Aug 2025 16:51:08 +0300, Dmitry Baryshkov wrote:
> Drivers using drm_writeback_connector_init() / _with_encoder() don't
> perform cleanup in a manner similar to drmm_writeback_connector_init()
> (see drm_writeback_connector_cleanup()). Migrate all existing drivers
> to use drmm_writeback_connector_init(), drop
> drm_writeback_connector_init() and drm_writeback_connector::encoder
> (it's unused afterwards).
> 
> [...]

Applied to drm-misc-next, thanks!

[1/8] drm/amd/display: use drmm_writeback_connector_init()
      (no commit info)
[2/8] drm/komeda: use drmm_writeback_connector_init()
      (no commit info)
[3/8] drm/mali: use drmm_writeback_connector_init()
      (no commit info)
[4/8] drm/msm/dpu: use drmm_writeback_connector_init()
      (no commit info)
[5/8] drm/msm/dpu: use drmm_writeback_connector_init()
      (no commit info)
[6/8] drm/vc4: use drmm_writeback_connector_init()
      (no commit info)
[7/8] drm: writeback: drop excess connector initialization functions
      commit: 7bcb37603df095e56e87d6144201179fe911e4dd
[8/8] drm: writeback: rename drm_writeback_connector_init_with_encoder()
      commit: 81f61b4e0467ddab3695be58a94fc322c8bd559a

Best regards,
-- 
With best wishes
Dmitry


