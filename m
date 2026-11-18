Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027489;
	b=us07p5EhTA6QZHxNWBtrWGjrDF20zwR3ZO+9zXaMldLe0koE+KmnLYeZbSo7Cl2/RG9X
	 tJgsK6gKBQBzgOVejoyDroo8GwJ7ag/m/2UxQJw++3fBv4n7A5AZ+1cLGE/2EsK8cnktz
	 KKlTG079ccMU0rRdebg/QvHEYvNy7k+UuhUKNAb7iDRua7/PciHy54M3F3MF6jdj3w4iw
	 LcSXSm1DI/IKXF5o3SGrUZmdyynArlC03Hwlo9CmAUt6kobXV9Um73Ub2yaINemYk9Qmz
	 tAl/XMqstKaWV7F1vZHACTr51lqLVT2VfS6Gehr/n/pXVKm7YHZXu/+K7YwVSvSIwvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027489;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a/1FJMohcTZY+9QiEVW33qHS2hIU0UKeXROf1tu+3XU=;
	b=DlkE1GmJ+VSxfT28EgmGEoVzJUHf0Ecp2RjrIV7o4WeTreSLajxq9bchzBLqTdya6Ip5
	 4rgp4a8Ew4buXPaRc67k9Jyn9vEsyFbCUbu7aYWcFGpMiC3iuVygWVDIcvLsQ8Gkzz268
	 Bn4BZaQ36DTrufBkc+byN7uI5ZXGjvj1x0VbIZQqV1GuO18SAC22fRNjtGu8JAHInEtav
	 AlJ2oua8GOQyOQnq7UAtkEKfFMOA9J9dW2aIR7DDP7wRHbF3oagqgtJLrXf87LDwLc16f
	 RJWiNBzsxvHGX3TopB1UZmT0Emt7LoN8AHBPB4RV+wLJppLOaevxgOuSzcUy9V6gbIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N10e3bat;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IWH6qJWr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE42860A2611
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE42860A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N10e3bat;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IWH6qJWr
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHHMm2895283
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a/1FJMohcTZY+9QiEVW33qHS2hIU0UKeXROf1tu+3XU=; b=N10e3batxmo44iLK
	e0ggGLrFGUVup8oItqLUH94w7nY6RAHtXIuHt9Unc2uY6AcvHHLBiPdFxWNULtPg
	j6Sc4+X/SyXwh7OlgxOem2VHCJRbZ6VxZy7hDxiSaMRRA4SpjTfNT/yk9hCRW5/s
	1wKHdF3HQEdHFh2vixpA1/iCP7JOKCLnAuE1nrKpJ5XBbJpzdqDF4YExSah1eLwl
	ke/XIvT82L7xdeTB31pxziL+/qvoAYbvilwRs9t43KVum3xyHgI6IGJXazuY24LP
	A8vD7V0pC4GZDlTfulL91iLC38KbVNCbcLV2Odpo0M1x7s3iwO7MBDzEUdJSGfLP
	M6HrBw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9p0d55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:44:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e95f8543c9so18699095ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027483; x=1795632283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/1FJMohcTZY+9QiEVW33qHS2hIU0UKeXROf1tu+3XU=;
        b=IWH6qJWrkwmHq2L2FKQ9cGiD33E5eF3VC6BRzsORepISu5GcHIykkXDwdfRA/wMWCP
         Yj2tiE16mpC4d7bH2bTWHmtafnH2ggmPXx+nxZRUSNTU42MPqs4UZVtLV3SVTHvb5RWm
         /OPS7Qf6RaW6zp5lwE14HoQ6nS7651X3BWmhqTMX8XyETYkKiRpSKYbOBt45T/9AW1O8
         SIzbK46kV9eX3KVc+UdG8MTBE5xZjpTJwNEOoEYjguJV7fxzLNRC9nooS/WrP1HAJ+2g
         9aoWoDBorenuTHe4xERZJu3yqPY428Z/1F1CDq/ZSuICGOupTVhnaTxzi78EP3XSHoTV
         DGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027483; x=1795632283;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/1FJMohcTZY+9QiEVW33qHS2hIU0UKeXROf1tu+3XU=;
        b=ffoKk8kslxi+rlrD7GLvCry71T4W3/mhQmWnEZYtRy04RqTQXH+fRvZLixYGz7PLwj
         PVocmQGS0WJSyaU1NcESwkw/FM1TPGnd4TbXOV1hNOn4WTVXO2jIMYvPl+wQ802UBISL
         6AwZB7n8ijUlqHC6a2ZfxuXQyFhwDlvEvUUR047dFRVSxudXIb6xf7NgyHq65FEdIi9M
         7/SHfQB6NsKJeEp5OgDnK4T5UE8TB6BvOWKyvmtABYxONxMd1Rz5tLUPDgzgWr5ZNv4t
         rIFkaeP8yBEhnGxkcebr80mpMm5jegHYJ2IqSTkn+eSok8Odgvbt+em17DoL+esntdcY
         evEg==
X-Forwarded-Encrypted: i=1; AL+hErH5i+FNKN+ctSFg6HVe18HYZOu7DvoQUlFFKgiiw2wej3D6OVxPK9TO0NtmgCaJm/inFUFBTPv7zCmZ2X0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hkAJ7K45SPnQpTKK0tQAiLSB2HBrRtcOCicr/4K82jM0z9idr
	YTOLwoea9mxTRqiEDZNDbb5c2mggjVopE+mXIqCod+7/kD9UOz/9Uf4tC6ET6nyl8/T1W8DxjZb
	PHNUMoV5vLk2FBtZvXk2pNYHejpkqb16FjIPYXGDlOJu6HA7dC1mA6ZvXlaZUAWGsre8=
X-Gm-Gg: AZFdTZfnHkqrGmjYQQs6nlXQ2Cq+4zy9USY/lBlwZNPv0SDvJXTGnMckCJb5/ldr2Eg
	D2cuio9wCvXXKKANTeamsaD6efJ4AXiiek/CokzOwyiF7lqChaxcvYrky1YfvJJNKVJRhs9BtUV
	GQrXrQYVE6uD6O3hip8B5rblteKTOoDeiSw7q5ca2L1Jjj96QUKv/udJwMuqAWgeNVOh/MDUE5S
	Re8lHxYoarnqBIRa2EU8qkheY0VJ9wUXe28eC+xSfkju6d03Cy+mOgDf32Rrkkb78wmIKUyiv3l
	r0YjJusUXUwGaSrr3aZoxAz6eBZ52MfB6Sz4qz7mhWMS/xPGgLcbPXzELEQZE9X6WOJ7JwatFFA
	zn2h6eg8t+R/SfaAFmcukEHJ0BVDaXOykrlwav4FejID0buYawtY7sPbMV1uPSSSMY1c6lbipsg
	==
X-Received: by 2002:a17:903:32c1:b0:2ed:1b26:2bf2 with SMTP id d9443c01a7336-2eff7100c7bmr32660395ad.3.1795027483406;
        Wed, 18 Nov 2026 10:44:43 -0800 (PST)
X-Received: by 2002:a17:903:32c1:b0:2ed:1b26:2bf2 with SMTP id d9443c01a7336-2eff7100c7bmr32660205ad.3.1795027482912;
        Wed, 18 Nov 2026 10:44:42 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6115f28sm18076975ad.19.2026.11.18.10.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:44:42 -0800 (PST)
Message-ID: <069c590a-7b30-4985-ab83-56150efc8009@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 00:14:34 +0530
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
Subject: Re: [PATCH 2/6] drm/msm/a6xx: Don't fail GMU resume if the GPU init
 regs SCM call is absent
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-2-e99cdbf3121d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-2-e99cdbf3121d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: l-tG-9-o2vPCMCIrIjOmDynl_XVP_OZ_
X-Authority-Analysis: v=2.4 cv=LooHWXdc c=1 sm=1 tr=0 ts=6afdf21c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=xDuVsFAvjFWeh2iC3aIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX8fA3NCJSss5Q
 NX/93TUrEg/hleAAf7Ftrnskb5FM/1FHwyZs8pKbp6LdkWIa1g01hwpNsICLQwdyUOr9rTph3FC
 oQv7YY5tcyTqpxMHwclIFYvWTLj3MKWysnc2Ejk6foYRpFr0iYrPOesGLf0HmKOH6dOrJqGGmt3
 EyZShG9g7pdLXRYuKOeN6Ey10yVRBhy3nyfPZ+O0LK5M2ve4l2z03qfW5Yh06mkpTknPE965IMR
 e0sdkcjlJgJ4WxP4q+fj135M79dRswkAxuFTNGez9oqSoYY6eSesguAqksdy5FNMVwNu5UcmbZt
 ppMk+UKqotO+KnHtqMvR6Rf8aE7U5/kPK60VV5O9XwZ1+t9hdXAVn8ssIWPqq8iDl3E047kL/kb
 EzuM+jnQ99NXAxths9Rd8a50BoFOIXXi/9yc2kC5y7LyHtFIo8wvwPOQ7gByXS8yV1Ot6okX7zI
 raa2Mp5UecPz8ZqFFzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfXwz+lxTxVpNTi
 RUyat7ugBt8LKmFZQFyke00qzEooQf/jcp5balBH7Suds9UiRDpLpRpQnp5/hfmC2meOmeYwnnd
 JstSXZlSMYrHcO9+tgVFq7FBv8HzF1g=
X-Proofpoint-GUID: l-tG-9-o2vPCMCIrIjOmDynl_XVP_OZ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180074



On 11/18/2026 6:38 PM, Puranam V G Tejaswi wrote:
> On A750, A753 and A8xx, a6xx_gmu_secure_init() asks the secure world to
> program CX_MISC_SW_FUSE_VALUE through qcom_scm_gpu_init_regs(), and
> aborts the GMU resume if that call fails.
> 
> Some platforms have a secure world that does not implement this call.
> The call fails every time and the GPU never powers up. The fuse
> register is still protected from the kernel, so the driver cannot
> program it directly either.
> 
> If the secure world does not support the call, skip it, but still read
> the fuse register back. An earlier boot stage may have programmed it,
> and the features it enables, such as raytracing, are then reported
> correctly. If nothing programmed it, they stay disabled. Log once when
> the call is skipped.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Maybe shorten the subject a bit. Say "Make gpu reg init SCM call optional".

Either way:

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil.
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 0fa2d2091f3e..95636dabee38 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1249,22 +1249,31 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
>  			goto done;
>  		}
>  
> -		u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ | QCOM_SCM_GPU_TSENSE_EN_REQ;
> +		/*
> +		 * Some secure world implementations do not provide this call.
> +		 * Skip it then. An earlier boot stage may still have
> +		 * programmed the fuse register, so read it back either way.
> +		 */
> +		if (qcom_scm_gpu_init_regs_is_available()) {
> +			u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ |
> +				      QCOM_SCM_GPU_TSENSE_EN_REQ;
>  
> -		if (adreno_gpu->info->a6xx->clx_tbl)
> -			gpu_req |= QCOM_SCM_GPU_CLX_EN_REQ;
> +			if (adreno_gpu->info->a6xx->clx_tbl)
> +				gpu_req |= QCOM_SCM_GPU_CLX_EN_REQ;
>  
> -		ret = qcom_scm_gpu_init_regs(gpu_req);
> -		if (ret) {
> -			dev_warn_once(gpu->dev->dev,
> -				"SCM call failed\n");
> -			return ret;
> +			ret = qcom_scm_gpu_init_regs(gpu_req);
> +			if (ret) {
> +				dev_warn_once(gpu->dev->dev, "SCM call failed\n");
> +				return ret;
> +			}
> +		} else {
> +			dev_info_once(gpu->dev->dev, "GPU init regs SCM call not available, skipping\n");
>  		}
>  
>  		/*
>  		 * On A7XX_GEN3 and newer, raytracing may be disabled by the
>  		 * firmware, find out whether that's the case. The scm call
> -		 * above sets the fuse register.
> +		 * above, or an earlier boot stage, sets the fuse register.
>  		 */
>  		fuse_val = a6xx_cx_misc_read(a6xx_gpu,
>  					 REG_A7XX_CX_MISC_SW_FUSE_VALUE);
> 

