Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608523;
	b=1nDr7ay72IE+kFfv/YTNFWI0inYJtph7rDE/pzhPxYBNQtcD5g0AVw0skkexq757KzKS
	 dTlwXA6OH1dut5k70atPPmsNFDPc2gwU9MypBB5p+H7dAWG6kCXP7raZmNSyKOnpvBTcB
	 +ENBCJkw690T9A+QrPuR2bB6YJGwO2jD16ecxqxF3FzFHf7wrvCUbu03BG3lQE1Wu2MIl
	 h43gNGK+0BSoFUXISkLaFTaFvJjdIMhpjSXtWeX6fWVs4RqWTBHXMvrCQHAc4j5O97huf
	 T0eP95UXvSVKgmErwqcrTNez8VMbonL7jUj/M303cpetY8FCeV9O2tcspvkqDzzHyuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608523;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:
	 Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=A52KNemyd1lh3piMmkcLWrwLaiXp9XsA8b/MHTMptd4=;
	b=oUJtArnBMqJvmq1FUl7gVToZ5vXH5oxGAqaDu7Huh3dM2c5MT6xkITVK1mL6YZTCAVNT
	 o63e35tRRYgJ5jCmUJO99nyP2OwQ3abpozyApw1fQIhXH+xNtvpb/z1q8eb/Mx0wLVY1x
	 tiVm1w5Ic24K0H/GCCIFsMz4gLF4E3DkZXTXeXPNAyW6PX46MZgDiLMUUmxmWHGSSDp8O
	 gPuM9cTkbv9SMuph8IbYhWPqpHL9wl6zioSK6iUar9BUqmW5GFRL2Dgi9FNzL9t8ZTLdz
	 zCg/i12F+5xhbhgx51SMvhdFWCzTYr8n0mgS9sc6Qq2Y++zShqTUGmeP02J1lqYO1eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ivfm1BHV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f9fvM2rA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F104E606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F104E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ivfm1BHV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f9fvM2rA
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mlKT3611427
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A52KNemyd1lh3piMmkcLWrwLaiXp9XsA8b/MHTMptd4=; b=Ivfm1BHVPxURJ6yV
	Orc5orEenCkxgRcTQcovJR3CPHAujhR+fg5bRYSrk5NgPFw+fhoUN+ZHlSiaGUeV
	PbGqgQG9CacghHgQ3AY2HAx4jS2sFs/o3/NRnn8AU4+l8bx99T0O9l+yYvE8Ltka
	c3k7Nun3bxfcCbP4lq8Ycly/Yd86R6L++NcYjphAfZG+eXUTKPQAvHirrAw2WktJ
	ByKG5ViYXYzxp3j4h6bVSQ8VQDjUXiikOCGyf07M+a1LfRGcdYFu24K8l9WYy4jJ
	OfIc2cYsS1WRLCKW2dzt1DBFTZBDp9gUrnEcT6bFObMUXr17ss9oP9gB0pT45h0S
	8vxELA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsbhfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:08:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d2c5f10ddso117158101cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795608520; x=1796213320; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A52KNemyd1lh3piMmkcLWrwLaiXp9XsA8b/MHTMptd4=;
        b=f9fvM2rAnLoZ+46ClVHVvVaBA7UEdiZnpDdVDL8EJe8RLlOAmu8GW9Oq8GZd6/2ZM6
         PkhpvT0Kie/uMErUdGHv80NPYd1T8G9h5wSSiGT5utKMRD7kVoBx1QwHcE8k12zqgucx
         T9ho7YvYRcxRwI1njc0qDB2c1A355MpQw/0UvMecTYuy+qrbJ24UqJeZyXNW8mU4tsWC
         EJ4blWIM8acFX5wL8daoj6wN5GAr4TYHCGn8UsizcHaqd/qfyEk4bqiHUUF6QrFC7giM
         BrHMLlsnYHfkqUwrj0AcS39f4jMNaBBSdTdDq7JSxCDS8BqR12+7L2Q+BR4HHMlwpVR4
         TaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608520; x=1796213320;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A52KNemyd1lh3piMmkcLWrwLaiXp9XsA8b/MHTMptd4=;
        b=H88pjabMJFUxWca7ttF7F/BqaI6oLCvlEYddh8agAQXIVaEV9IcPl6e8ETrbtKhHNa
         JVIOLdlIvTu4kzUyuuF2b7yesEaLuyBYEI0cqzPQh/fiVmEzNW6dJkDpd3mjP3LfzmBd
         ayL60owHIEllXp9PCaXfKCRo5U/caYx8efMl1UNt2OlJSNw1x/Oa6nsp/O3/1Jj9jxQV
         93WD+5qj+LdJXPH/i7F0DjvvTX69r3cHrvsB2Xghrkc54vxWxlUlB++BkRDPiCXwrNoQ
         0fjlvH1XyFuXVxMQkFOQheX55Zc3+rj08a8gcgGQwf8//f8rHXrtAwKfb/Yrrm/iyzVj
         j+rw==
X-Forwarded-Encrypted: i=1; AL+hErGeEmvn0l482t5FK/CPUkWAJcHTdWX5bCtDynv6dpRtRHSCtHy+FIpoK1nEMXo3MPou44/9gSLiAhUw8gk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k71yGDzj+gHoLQQisql44uPEJwQrEOSOPvLlvit81afxwZ53h
	pwwxWFOXC2LA5uCKCPxIa9DFYEB/FKp1yZpbhHM5hzzMnHvW2L9A2WloMgBMm18ShI2NKn/GuQ3
	sYqghTVLP9Me9hJbXlci+PKDfwHqAMxAfz9drNzbDYR/KUa1Hu5y8VLvFOaH1hewueefKJ5noKM
	nzQaAz
X-Gm-Gg: AZFdTZcx1zezlT5J1sbgRzZxVX3NtPDNRKYKlaiGJ9gZeI0u2Sb03uVHng4czlc0927
	oAq8p1TIoI7uc1+WEykTyz/51doIywk9QuB2g9TbNAUeK0zM1/pY1R/Mf9rCJul4xWpL2sAzqb1
	0/F1/yoZKNb7QqEQ7e3IEhqE9NyjexlLqhZGRNdYA+x7WvUjFxBqXhd7DfUW0+AwUtAQO+YD07J
	nM16D6MyNkHCdYoPKjH3rEuP8zzT+LihWD3ce4165cpLpOIjs3V8XYajthxQI9JnYz+vVAlpsCz
	B3ubBcUY0AkYJhTsy5RZfqCji033r3F7dvF+maNJSPRVV8pdkAEa3BuhkZXltPOP2C6mX2Lp0JK
	G8T0Fys2u76NCtpY/Lp3mcUsL8yrDhGe1Hkegm4ugGWaIui1iAE91k0ZTwmRA25snobcuFWEKxK
	x7xT6J/FHD1w==
X-Received: by 2002:a05:622a:4cf:b0:55b:90c0:6a07 with SMTP id d75a77b69052e-55d76ae87ddmr298681331cf.74.1795608520355;
        Wed, 25 Nov 2026 04:08:40 -0800 (PST)
X-Received: by 2002:a05:690c:4d02:b0:8b0:97f5:a858 with SMTP id 00721157ae682-8b520500410mr60653907b3.59.1795608072387;
        Wed, 25 Nov 2026 04:01:12 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52030df7bsm72480227b3.31.2026.11.25.04.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:01:12 -0800 (PST)
Date: Wed, 25 Nov 2026 07:01:06 -0500
Message-ID: <0daf9fd673e2e4e148a8205c752763c0.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Ian Rogers <irogers@google.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
Subject: Re: [PATCH] drm/msm/dp: Return MODE_BAD instead of -EINVAL from
 mode_valid callbacks
In-Reply-To: <20261119171046.1536673-1-irogers@google.com>
References: <20261119171046.1536673-1-irogers@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Proofpoint-GUID: o4xm19cOZaoGGKQicaW0jVcHt0uOzb3y
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06cfc9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=r1R2P697X4eI0gH+iewh9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=1XWaLZrsAAAA:8 a=Grc5UNRC2ANbGX2BYm4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0OCBTYWx0ZWRfX4l6N2MYI0jki
 J29mjRkFnUXdj74ntTurThuRaTLJInM/9ru2LGUBr2M2Io0qeYMVidfBgjqmeLgNNNikzdI7znN
 evGolkVY5mI2Xp/xlzf2B5ESrX2X8Gg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0OCBTYWx0ZWRfX/F291fwKoQEY
 1rP8amL+gLAD8sd30oOGBHUGscR+VuWGs9wrLc7Qyq30Jf3sajyKSaGfJMGggq6j0ZquhLIXGaW
 uh/lUN9EtcLEzsLaCT/no/5XH0/pZ2oGDEYGqUAsu+EeRyUtnZLM+FREYFF0WXUhiabXN6IpUIG
 EdlcTWfNBG7eG8CQ3Ck4u3c9HnRQ+bzxSU/ULmo7LalgVk0s+7pqFZaUvWX4v6xn0s2Q9LLgwyU
 SiJuevb2Zy/FL8Kd4WwQwAXOjOdEnJRBcpGO3PF9Bb5CvPhFWezv6TzKfZvyO5qjbcOtGEsuzX7
 LR2nYDvmRFBz7pMMWzdsxb2v630XQmxJMoAciQTKdHyK4KDTB4/4v9oxgwYfwFdsH8gBiw5FBlA
 ZUsMhNBF4kKvJykTQi53h0dvgRHl0S2famNJ3LRcXmTNmrBifALgroa4NtoeYUV1qMXsIS3Vs3t
 MSeqxSpLQRHIu1qhCbA==
X-Proofpoint-ORIG-GUID: o4xm19cOZaoGGKQicaW0jVcHt0uOzb3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250048

Hi Ian,

On Thu, 19 Nov 2026 09:10:46 -0800, Ian Rogers wrote:
> msm_dp_display_mode_valid() and msm_edp_bridge_mode_valid() have
> return type enum drm_mode_status, but return -EINVAL (-22) when dp,
> dp->connector, or mode->clock is zero/NULL. If a mode with zero pixel
> clock is validated and pruned, passing -22 to
> drm_get_mode_status_name() computes a negative array index and fires
> WARN_ON().

Thanks for the patch. At this moment, both checks are dead code:
drm_mode_validate_basic() rejects clock == 0 before any bridge
.mode_valid() runs, and dp and dp->connector are set up before a
mode can be validated.

>
> Return MODE_BAD instead of -EINVAL in both callbacks.
>
> Found via Clang -Wassign-enum on an x86_64 allyesconfig build.
> Verified by building drivers/gpu/drm/msm/dp/dp_display.o and dp_drm.o
> with LLVM=1 W=1 (-Werror) and -Wassign-enum; not runtime-tested on
> Qualcomm Snapdragon DP/eDP hardware.
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Fixes: 05d001352733 ("drm/msm/dp: use the eDP bridge ops to validate eDP modes")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c0c150e2c575..51649b584573 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -759,7 +759,7 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
>
>  	if (!dp || !mode_pclk_khz || !dp->connector) {

msm_dp_display_mode_valid() is a helper shared across files. None of
the three conditions can be true today, but it may get more callers
in the future, so keeping the check there looks fine to me.

>  		DRM_ERROR("invalid params\n");
> -		return -EINVAL;
> +		return MODE_BAD;

Why not MODE_ERROR? It matches "invalid params" better.

>  	}
>
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index c1e4147bfef1..dd4e8426cfe0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -251,7 +251,7 @@ static enum drm_mode_status msm_edp_bridge_mode_valid(struct drm_bridge *bridge,

This one is a static bridge callback.

>
>  	if (!dp || !mode_pclk_khz || !dp->connector) {

As explained above, none of the three conditions can be true here.
It is dead code.

>  		DRM_ERROR("invalid params\n");
> -		return -EINVAL;
> +		return MODE_BAD;
>  	}

My suggestion is to drop the entire if() check block.

BR,
Guodong

>
>  	if (msm_dp_wide_bus_available(dp))
> -- 
> 2.56.1.708.g77570a6a1d-goog
