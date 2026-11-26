Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722149;
	b=qeP1d6uvO8qeBVgkfmugcIoS5HKnvms47ruC2ox8NGImsjSWKo48ijuh0vFFfk0pse+6
	 gOwdFKebRST8LuDgwFLCKd7zv5xHfxBHLKAptaZChIKZ1s3wFC9FNo+Df0RINPgBfrEjk
	 xdXfH/A0yXC545/Vjd8XqGW6S5ZcDp+fQ+A1KrgO1aT0xDWSaMu5KcrDgb7HOsxxHqdm2
	 trn2FhvR4WUQaANuR8jbG5z9woTiogsHkRWum/w0VTMqcQd4FDenXxJCG3gFKV2mKTgbS
	 y5/+NpIrbqpHbLFpmdq39hzJ2a6GDlvSX/1lmJuuBjtz6ZWNgHRY4K0rhym3osjn52g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722149;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fhRNdMl5UxG3D78/zB54I3eapISFAykzMxNkOQtD+wI=;
	b=erjzzqFKsXlzG726vmm9roHdSlVFyRnGGQAH4gDxEAbz2vUm+F2+XBB2HDUBb3n7BB9o
	 pGBfL2dEGIj1/lgTMdUg6owi9jhr4+M1kZQW3JFGWU978XRwIQWfgmScS+UC/eRnJwcw8
	 I+z7n8LXWwak8KpmZD2Yzli3JZx8Vl3OiSRUUAU07PfzZkn1X6Y4c1LZG7i6ATH1WHBwG
	 1LEv/l8em5/WZJLGmVDC4en/DhTVdH6/dbKj1zxhggO2xVUSXBNmc2zMSjVyL/KNhIqwo
	 xaHtCPsNdVHT6kKJHDFL6QpFTvilVry5Y/B+AyzSzpL0JO8SbCHkrBYhkbBLR/peDiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CIcjMH7m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ER8rWWyn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2DE606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD2DE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CIcjMH7m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ER8rWWyn
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQGbxH5595613
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhRNdMl5UxG3D78/zB54I3eapISFAykzMxNkOQtD+wI=; b=CIcjMH7mZVk621ON
	XyRT18DTnvQMl/DV23mpSp4rW0J3q3RwCExsHi/HI8wXPP19OEYQ4ZXNl8Q75HJQ
	EHQ6fgcGYCnO3Z22DE52lm+HBIFIBH29WHALAaRRFFfmhGqpbQzYA39ZMWvUlZHr
	sZ3VXABeqGmyiENsdV4Q0ijhq9k/KWcGptVhGTRvUl9Ac98yHOQaTkyx9bFzGqo5
	hi1KfjKlqdJAnX031HKlgRd4GDHPJ/tqm75qSpD0DdNc4uwSTfcYGAdq62qp2oY2
	NQcJzZC2Q+7JF+SvqT7KCKEMkG9HbkuCKOMqJcFbicHzSIYsOWS/9rpspiDuKIHL
	8ZFHSw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf90gdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:42:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-382af5cfc58so4008617eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795722147; x=1796326947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhRNdMl5UxG3D78/zB54I3eapISFAykzMxNkOQtD+wI=;
        b=ER8rWWynrdVVtn9ICGyhsIcT6kbIhRM/YowdxcPWrEpVnYr0RdQenjRctHqlqCMfMw
         GLW8cqpZ79Lk9nog2iygpvqNcVk+0IwiQzU/rCw3NKIiGmbqfHFMGLnZ1d77t/jLzX8E
         rb3CuWVUyJYaht+uzP3ID9ilRcT8+hJd6xwTJTiXff7T3mGvYhQrdEbLqA9S2gVnUgVg
         9jJufvxN5QfznvUDQbI3jyfTk6yDUYbImdZVYNXMNfRs6BKEsayrGaPPD6XpK2zIDsPm
         H+jHij7zq2YAPS+Cnt3+oV00VaQUUqZvtKcZzF+R7Ug6Ivf2CwTCkFFFpuc1EEURuL54
         XEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722147; x=1796326947;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhRNdMl5UxG3D78/zB54I3eapISFAykzMxNkOQtD+wI=;
        b=lBr9pI3ahxgzsQf6LTW+O/QNhZx7AqeZpiY3FNUqrEbZeywDTjDIisjEQV1ynMW5A6
         wKLPxrWEiVHDKuNZTzoXtHU9HrF8a7AaOlcnatjmkp4FTvJuzByDTlClpAdS4xZuZWjL
         JAmeeOj+f5HGvpBzmdGYTEsAK4xzsVYdbcz7CedEIilQJDraG+eEIoGxtz+5QoeS4QE5
         4GAwqKvUkF+vjdwJjCS1s3IW2xalTwzq7JCi890GR+YtLqGY/onO6G5H2hbuUL3vSBBD
         7xOBXoI+h7Iu4aq7HpfjXscu/JniFdMYaTmVjXcRbTdJb+HLAoFuuVv4pgKmWi1Jzey6
         qNkQ==
X-Forwarded-Encrypted: i=1; AL+hErHNWOVP5mF+JZFJHmX2ocBRyhFztI7RJGmi4ymRCKYTxVL+RihengllR9rOcvHw3ceNb/qil2WqEWGEVTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QTh8/xmHyxT7K5/8Ud5TT2N4T1452aqu2+TLtfH077IGQ6Nhe
	SFBzEVe9Pt2fgX3xb8EKh6Oj6Vl1nfPD4rzl2caFCbF6NGgZml4Slx55OqXHpbkjbxq4Jt08gP5
	4WrppWvQnnmaDyz1pD11uHrB/c8kI+bK3pUPHeI8/HduJEa+5gvLIi/+I4heF+3tsf1Y=
X-Gm-Gg: AZFdTZfJDyPV5D7xfU8dt3wEUjyiEFeSy3vTzIdEcJxdPIjFMom91bcDnbJBnHMNqSm
	Bg54qOshEPvyNyacvJQDiaP/fa0MbroBIkblbNq0qWvRFqGfQkM6oubGtWpKjtw6IyvhTI/2hfJ
	TUuR8f+qyzVv7IvYZAFIpRDGHZ3qSbsGt8PNkFhkzqfoX20i3jRzcgrPg+lqLB+8ryNn1eBI5tx
	JtcOdkICK/J8qhMe+4rE/z2FxCsFjoynCyseF70GLgjzyutV3h280DvgY2bBxKa80pT43sfpOsT
	6osycOhjT89bMR8D9I8kk/s/uc9POrIbI+u9973oJCMZaJByqmKvlNDVIXqWGpfNNH8VhA40ZJo
	h9t3LCmT1x+znDK7fu0WDG7AXJ1WBNO/QDbsJNu6TrmonS5U5eHXzbgyNxGTCYksObIVaYdbztg
	==
X-Received: by 2002:a05:7300:fe4c:b0:386:9b1e:dcd2 with SMTP id 5a478bee46e88-3869b1edd57mr19615029eec.20.1795722147452;
        Thu, 26 Nov 2026 11:42:27 -0800 (PST)
X-Received: by 2002:a05:7300:fe4c:b0:386:9b1e:dcd2 with SMTP id 5a478bee46e88-3869b1edd57mr19614999eec.20.1795722146941;
        Thu, 26 Nov 2026 11:42:26 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm73795985eec.24.2026.11.26.11.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 11:42:26 -0800 (PST)
Message-ID: <86e748e7-1cde-41b9-a1d5-905e62a44d36@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 01:12:17 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 8/8] drm/msm/a6xx: Wire up IFPC on A615-family GPUs
To: Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261030-topic-a6xx_ifpc-v1-0-6992841a9a32@oss.qualcomm.com>
 <20261030-topic-a6xx_ifpc-v1-8-6992841a9a32@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261030-topic-a6xx_ifpc-v1-8-6992841a9a32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JKxjGN_ivuYevCYmsp_wiWwrDvPyJZPt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NyBTYWx0ZWRfX+IBduI2koWLh
 9p4u42EHvn2SnFt5Cp5gEccCej7pYxbPfbx6r3uA0EzhCib0W0TbEmPGDsDsjTwTtR7BJ9+qZH1
 IBx286i+7E0/MHx/fhlreVBxnNWkAtIeLNIn5Lke0K/9nPJqn9rcgse7Cq8RChvzcJGP7P9vKgG
 jVr+vyCKAx09yOTwEU2XVncpO+sQhPp9/3ccZeKK28bfiXK9ZUR40MQmzY4Re0bKBqAMDRAJKXb
 653ZL4bMFBEfTIcIXwix+jcFqLuZ0mFGPOW3PubCKmTcoNZgcrwbHeWa/Dsl37VcT/Mk/ft04HK
 K4X6pEULBj0NA/vqvP9z5hjZyASDVjLHaxQoIVlVSZbu/+wxZWP9PdDhngFmSdI6pKEHHdbQIZr
 VgDVp8eDLZVMNZ2/rooU3aGRTm54Q1LCnLVDZLcGoBaCbecvgGdcGxNGJaAK9KxNI0qI/8tSqAh
 pB9fMBX/EqhhFd1MGMg==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b088ba4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ZLclF_L0AI5UrEzEu98A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NyBTYWx0ZWRfXyk9lCiiZ8IgG
 eEOCZT03PHIHMXA0K/Xh4Y5thkhDkEFYymI5TF26h/g8uJjrE580ZJxoslQtreIUjFIVsW1elra
 rzjZvXZq2CqOgY0QAqd68nwub1yPtSI=
X-Proofpoint-GUID: JKxjGN_ivuYevCYmsp_wiWwrDvPyJZPt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260077



On 10/30/2026 3:34 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> They reuse the existing tables, so just wire them up.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 2d59f7735c90..257771d4eb4d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1012,7 +1012,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			[ADRENO_FW_GMU] = "a630_gmu.bin",
>  		},
>  		.gmem = SZ_512K,
> -		.quirks = ADRENO_QUIRK_4GB_VA,
> +		.quirks = ADRENO_QUIRK_4GB_VA |
> +			  ADRENO_QUIRK_IFPC,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.funcs = &a6xx_gpu_funcs,
>  		.zapfw = "a615_zap.mdt",
> @@ -1021,6 +1022,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.protect = &a630_protect,
>  			.gmu_cgc_mode = 0x00000222,
>  			.prim_fifo_threshold = 0x0018000,
> +			.ifpc_reglist = &a630_ifpc_reglist,
> +			.pwrup_reglist = &a640_pwrup_reglist,
>  		},
>  		.speedbins = ADRENO_SPEEDBINS(
>  			/*
> @@ -1044,7 +1047,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> -			  ADRENO_QUIRK_4GB_VA,
> +			  ADRENO_QUIRK_4GB_VA |
> +			  ADRENO_QUIRK_IFPC,
>  		.funcs = &a6xx_gpu_funcs,
>  		.zapfw = "a615_zap.mbn",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -1052,6 +1056,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.protect = &a630_protect,
>  			.gmu_cgc_mode = 0x00000222,
>  			.prim_fifo_threshold = 0x00180000,
> +			.ifpc_reglist = &a630_ifpc_reglist,
> +			.pwrup_reglist = &a640_pwrup_reglist,
>  		},
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0,   0 },
> @@ -1071,12 +1077,15 @@ static const struct adreno_info a6xx_gpus[] = {
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> -			  ADRENO_QUIRK_4GB_VA,
> +			  ADRENO_QUIRK_4GB_VA |
> +			  ADRENO_QUIRK_IFPC,
>  		.funcs = &a6xx_gpu_funcs,
>  		.a6xx = &(const struct a6xx_info) {
>  			.protect = &a630_protect,
>  			.gmu_cgc_mode = 0x00000222,
>  			.prim_fifo_threshold = 0x00180000,
> +			.ifpc_reglist = &a630_ifpc_reglist,
> +			.pwrup_reglist = &a640_pwrup_reglist,
>  		},
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0,   0 },
> @@ -1102,6 +1111,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.protect = &a630_protect,
>  			.gmu_cgc_mode = 0x00000222,
>  			.prim_fifo_threshold = 0x00018000,
> +			.ifpc_reglist = &a630_ifpc_reglist,
> +			.pwrup_reglist = &a640_pwrup_reglist,
>  		},
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0,   0 },
> @@ -1127,6 +1138,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.protect = &a630_protect,
>  			.gmu_cgc_mode = 0x00000222,
>  			.prim_fifo_threshold = 0x00018000,
> +			.ifpc_reglist = &a630_ifpc_reglist,
> +			.pwrup_reglist = &a640_pwrup_reglist,
>  		},
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0,   0 },
> @@ -1143,7 +1156,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> -			  ADRENO_QUIRK_4GB_VA,
> +			  ADRENO_QUIRK_4GB_VA |
> +			  ADRENO_QUIRK_IFPC,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.funcs = &a6xx_gpu_funcs,
>  		.zapfw = "a615_zap.mdt",
> @@ -1152,6 +1166,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.protect = &a630_protect,
>  			.gmu_cgc_mode = 0x00000222,
>  			.prim_fifo_threshold = 0x00018000,
> +			.ifpc_reglist = &a630_ifpc_reglist,
> +			.pwrup_reglist = &a640_pwrup_reglist,
>  		},
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0,   0 },
> 

