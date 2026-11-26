Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722528;
	b=y/kCVpxSefbFoF5qdRfp2cifzLfVCCDm0noOTYZfiAmRdbdxuOXXj49XATa1HDmhk+uh
	 4c5xwCgMezdw0KZvUzr3lKDhmjW0qF/60q0Wdy5dHlYWIgIXGs8LL0fsO7l2S7itktKcw
	 nS3Aq9PhuIeEMBDsB/Qif2pm7GJNxyTEnzeV1mGoLUGrrdldVug7kRqYmLRPvofnFY44B
	 ZH9GJFvVPRXSiZLsjqNh/s7xy6A1KHb7ucd89oaJX5wm6zvqJ1ghpdaCob66iNPHqEtfA
	 NXJD2alwT9FqeD2DmMC20WZa8Ll3SjjFP2v3KrZyp/GXbyhe4L4fX42FfK0nbIeyKiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722528;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cb4cbrx5kZY+Yme6rnhcpB882HS6oqTOJ86HCQTYrak=;
	b=JZMkug8gOPi+uTc+CyCqVv1juhaPHL93Rbu4yDFpmdAL/IAYW0hRResABMO4XuoW9Sjz
	 uU2e3nPcEsMEJDi23MOdqLKRjwjIHgEYBm/wrU3Ug4qg7kWTOOsgmmVE+lUM1H0qTSkYc
	 CPZsT35nBj3oGLv9/6mu6qEbtZblTIMZGOCK4cL1KlWQUho6gXEKPNtFoaqBMBlGJw4s2
	 U+LJamnKpS2QVkF68mfgGIzrEx938l4tMT3Hvhy5wBelM2ohh35QixoYptHw27XZxOLNU
	 3MiIyzDSV3xTIJh/1bNkLUdL1vc2vT9Ni6rn4W4IOMMHpv5wM4Y/+puC6dRBaiwPW8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YkzDBpou;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ebZ7ZVIe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0992C606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0992C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YkzDBpou;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ebZ7ZVIe
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJdnXW2536157
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cb4cbrx5kZY+Yme6rnhcpB882HS6oqTOJ86HCQTYrak=; b=YkzDBpouGmTgUZwV
	n3FFqPM8RqNM690b8Ns3q+tXhs2VHZxIKF5NaMs+H7tiElze7GGHZlPx8Ka0NhGd
	st7mMLPt3WaqxSOU4vbK8LIFqF0XNXzBrEz0sLEApjptSE4r1LNk9xv4Dr6FUkCZ
	5IBsVgWANUgvWUeyW7+ECfG1xdtkgLwuNXJJOwyDTs325a98MYBc5JOSMBj3lKFQ
	OnA6M20tkqB1HYXQbWkvTwGP89nmyLJ48557p51OQbQzUjnSSaZXTYt4T4AP7IO3
	j04qTFYWWFEPOP61ymxNHOlzgdhBvRbpR2U7Gj80AR2i4dkd4h/NG4k1f5UIiUXm
	t+89qg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4980nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:48:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-382af5cfc58so4017338eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795722527; x=1796327327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cb4cbrx5kZY+Yme6rnhcpB882HS6oqTOJ86HCQTYrak=;
        b=ebZ7ZVIepTLb62zudL/CKkdjnQO4H75HVpUX2kUNQrokyXiaRvW7z46G6GZTUnh5ky
         ecsC0RCG+XZNcaQPnwkjrckit19+fsV/otnbhplJ+y8gaa6KAvqE20NwRPCZVs04aSzi
         xBwfj2CcRJW5pygvtuZNKgDpv50uf/OsizZcYneQ/Ah7pjVHbW3zncVm4V7RGve6f5KA
         xIdqoqNOpRxq6LemNSfKJOwGGsG+VYFRzt82Gu3GP0NrwENmeVcf7Uo68JWlerLKPc5x
         rBOu/JtB2pJxbw5Bkp8mI2GRd1vhP4gWpFveX35crsBkYhFgrZM9jiDpmITIxCXukPYb
         JmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722527; x=1796327327;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cb4cbrx5kZY+Yme6rnhcpB882HS6oqTOJ86HCQTYrak=;
        b=FUmJbvOBvDg4SuPua9OsyYiV+wuGexk3LdW6Kdgz6FgzCm1OHlMt1IfOJCKTZpBRlQ
         2TOoh3KIeOOGvxoRhevdeSHdE6tKBLqGNMaDgwSb8lEOPdNxWCDqI1VVYAnIi6nGVU0p
         +i7kl9nEVTmm6ZaBS6Sm8swxhI9HWWRxw9yHLy6uDJ5nNJ4VnHe6jM6eLSjH3nPvY4Lp
         76Il9IeXvfbnaPs0Ssf0LhQIYkFdzoCs5HYRkBc+EUoDTOh9K/O44BJCk4r7WsFTN06L
         HhYMmkFBJo7SvOXJSPnhQ3ny0K8rE8RQqpXdxZ9Iyhd/1xVJr9w7KGph2iGC6pvXMZ/E
         Bv4w==
X-Forwarded-Encrypted: i=1; AL+hErGgU/sH448yYEMUV7drkxf+s9RuSPnSVB64DNkoQPw8wRwQ/1SaNoL3dCxi4BDXP7k4LAMcVtQCiy6yTVg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8S/sSx6sox4k4PVPS2O+mDMAqGVnWMrbmxV+RtihsFc7ecU7Q0
	jECQeAKPuwZ/l195ogCIedz4a07hCBvFGKwlQ1aOb4zArsi5XkCtbUo/JMARBdkf25yc07Im1DX
	1rBqENUGu1BhQbQZZ1limtofbMxKIdHENrm14GIuY35rl1NX/BlZKo0BoZiwhOWM/ypk=
X-Gm-Gg: AZFdTZcHPUjxzsJHsDRFo7YjrP4zMYA2aLIyMA/xM8gM7PzRj/PrelVvdTRzi6bFykP
	OCgoyNMwI3DL88gCV7aJliw1hpq+m6ZjZ/V839/b11Z699dGlF56yoo73+bUlN4SKP38iJL4VGS
	RGf2Sdhy2dSnQdZhpRF3+5Yn5oZ6QvBZLSreXc5GHANxMmjblC4j96gh/32l95NxNVaiLX3rkB8
	2lwe40PrBD1DSi9WiG0fj7S+4wFZfADdWX+8v8XLHD52+y7s4dnoWb0Ineggi1KuiMcA2vCe58V
	9q3b5taWM3WNCj3ETel/XpvJEaNYt2GKWP5yBFpO+e+gcx7Xeiq70UV6fEGfkDxRGHIkDdDnM3A
	L68RQIArJuyfH158fZ8lj4r6toHlL6q47+eAU3QPk/+C5HORQluxufOx8Ot7XCLqiTQ+GhTl47A
	==
X-Received: by 2002:a05:693c:414e:10b0:386:a1ae:6762 with SMTP id 5a478bee46e88-386a1ae6d5fmr19047973eec.36.1795722526654;
        Thu, 26 Nov 2026 11:48:46 -0800 (PST)
X-Received: by 2002:a05:693c:414e:10b0:386:a1ae:6762 with SMTP id 5a478bee46e88-386a1ae6d5fmr19047950eec.36.1795722526108;
        Thu, 26 Nov 2026 11:48:46 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm74349135eec.26.2026.11.26.11.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 11:48:45 -0800 (PST)
Message-ID: <b95594e1-fb17-4058-abaa-e889eb6e952c@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 01:18:40 +0530
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
Subject: Re: [PATCH] drm/msm/gpu: Unwind power and clocks on resume failure
To: Haoxiang Li <haoxiang_li2024@163.com>, robin.clark@oss.qualcomm.com,
        sean@poorly.run, konradybcio@kernel.org, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261119034718.2818183-1-haoxiang_li2024@163.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261119034718.2818183-1-haoxiang_li2024@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RlcMbR6MRkptV2rCQii-XhumK2CrlP5V
X-Proofpoint-ORIG-GUID: RlcMbR6MRkptV2rCQii-XhumK2CrlP5V
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NyBTYWx0ZWRfX5OWfVhrOTci0
 yDMuh7sD7NvZ3+QuT6+2Yaresoltm6GfTH/94H/Z3hdJILrIc58sAB1Yfi/f1sq1lbqrEuPw+wd
 2PsmHv6Kp19/tMkpGyOwbKbtyLNGfXk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NyBTYWx0ZWRfX7ugsB0f3DuAJ
 mk+wLODYLmne8Jwai75ksqVwKDxecWoUPZV/DSTW9LJIM5RUUuUgMvGEpt6QkHIQrummtGER53+
 1qVEpiWPVlsj1Coj2K+BpzhzQoe9sXdUjf+YzdAQvULDkEl8GXsTiPn4Msxc9P+GWcSJon0G0Xh
 sPazKUx6YGT+t2wK8vPzM0PU4n40cYD1mBuHCZpNKNXCPo6y3c0e9rOYjRYvlsPEoGoO1E7QmIZ
 HZBVCNhZjenzDPclxjImML6sNU7D+AOIjA2xEaZzux+ybdabIs4sfI4GBm+zLPmiF+Bm8/1B+wM
 stsUbsDtBz6ug+c3m2ux24tn3hz6s2HgI0s6nsDbjQ8NJGxlmy/K/ck5BHMNGESIVl0LsbXdwT/
 MQdowGc6Ed1tp8vF9i23IQwchVQGg08MXHCfYoGaSVbRIpMtWb/8DYEeDB0Zi86cipN8+ArXY/6
 LQUgqTN6X2WohCBQHgQ==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b088d1f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=9G38XQudUm-3WiMgdEYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260077



On 11/19/2026 9:17 AM, Haoxiang Li wrote:
> msm_gpu_pm_resume() returns without disabling the power rails when
> enabling the GPU clocks fails. If enabling the AXI clock fails, both
> the GPU clocks and power rails remain enabled. In addition,
> enable_pwrrail() leaves gpu_reg enabled if enabling gpu_cx fails.
> 
> Disable gpu_reg when enabling gpu_cx fails, and unwind the completed
> power and clock stages in reverse order when resume fails.
> 
> Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 8319119041eb..5480abe1aba2 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -40,6 +40,8 @@ static int enable_pwrrail(struct msm_gpu *gpu)
>  		ret = regulator_enable(gpu->gpu_cx);
>  		if (ret) {
>  			DRM_DEV_ERROR(dev->dev, "failed to enable 'gpu_cx': %d\n", ret);
> +			if (gpu->gpu_reg)
> +				regulator_disable(gpu->gpu_reg);
>  			return ret;
>  		}
>  	}
> @@ -110,17 +112,24 @@ int msm_gpu_pm_resume(struct msm_gpu *gpu)
>  
>  	ret = enable_clk(gpu);
>  	if (ret)
> -		return ret;
> +		goto err_disable_pwrrail;
>  
>  	ret = enable_axi(gpu);
>  	if (ret)
> -		return ret;
> +		goto err_disable_clk;
>  
>  	msm_devfreq_resume(gpu);
>  
>  	gpu->needs_hw_init = true;
>  
>  	return 0;
> +
> +err_disable_clk:
> +	disable_clk(gpu);
> +
> +err_disable_pwrrail:
> +	disable_pwrrail(gpu);
> +	return ret;
>  }
>  
>  int msm_gpu_pm_suspend(struct msm_gpu *gpu)

