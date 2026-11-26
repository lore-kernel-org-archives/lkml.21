Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721200;
	b=Cp6iZOXphebDL1fJ7GzxhUEpZFoBYlY2k8Biyr2KDEbxX1Cy2Adw4Cg1mfGOVAKqyXlr
	 51sTG29TrmtDa7obiEQROGqEcRZ2+zIzAqHIfQCAcmcJn6Z4Pmr/7DViNKRn3mQb94sKd
	 qiLYSVZawN/e9lik9VOKRieJt8MERtgi9VcdrNMETG1b9Hx95V0lRkp5C/pOyMHzby/2R
	 WoQiPUtktOTP5Fv9LpMKuBSov/l9blK7H90UfelwQS1A3zL/J5tkCtoV6RV5KNNsLnjqx
	 QMHmQA15C6xy0CLt8vKfnrvpepUrNph0rIty5bK2WyXBK3N8eTIhIrkE5vFRTzy6j4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RSbO/8C3j8RIVBHNdX+Dlhj+7Zj2tOE/srOubQ38wfA=;
	b=ybXCzV4TEB096AHM42Is9x5uokfGMJblcPm/FSljssCFBDlcxd08a9VDpyg/9E0CeHLr
	 f0yCzHecJlj2QCTgktPF/AEWKQKUrzw5Vkjkd0n6QJ9j6fETXJlSgAXtk2H7qSJHu5AY8
	 mdq9M2qU+UE6JI/Y32Q/2JbiAKwlZFF1NJQaNHGeej9SUdlq6HoeEqc0jYDpKNBaHy+19
	 8yQKvnlkgJhYHBgK9F58/7bdmdG7UUU3P+svuJtCMoLop8UKIUl93dwhIsMPXw1jFsctl
	 NXH0SWvf7QVpiZ7u5H9JbTyXr1ZafWJMnfQERNlCy5kdF788XO/uakRjus8NSVagZJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6vxztZ7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eO0Qr+/R";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B03606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26B03606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6vxztZ7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eO0Qr+/R
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu79H2835123
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RSbO/8C3j8RIVBHNdX+Dlhj+7Zj2tOE/srOubQ38wfA=; b=Y6vxztZ7S8v5heaq
	gLEDsIR0PNNktgZKZ+zUllJa3BnwCokbTyCKp35pawsJD7jUZLLCMflHewAhKqJS
	7BqPortcbmF9YLDvciYxtaqgpAHWcnSRq5DRVOfTQtmaNRR4fRR0Q5UKGz/Q7SmM
	5/wRD3IXwhdzsCJruxhIWegfLpDS/r/AAPsww0i6WTLTnYm6mRbHbE0LiQRtcCFr
	GDHMfZ0DfQkMD01mm2hmRHQObVww2sm4DEBmwNuH3d61LU2qBOIO1KE50Xdy6/aV
	SlT1DPOfnUdcv3VV6llZXD93nxzDYvizSLpaG6aMy2Nrkqi2//sHlhMrI3tf6/GC
	Vyt1Ew==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqgvtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:26:37 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so4276743c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795721197; x=1796325997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSbO/8C3j8RIVBHNdX+Dlhj+7Zj2tOE/srOubQ38wfA=;
        b=eO0Qr+/RaacgI2YzlWPMmhQaN42IU58jek8est1j/O23SR4QkplORHOJ+9gqqk1d0k
         uaon1OHT3aglu4Rp6Xrd7qlmzUpq7qqh/AoQdXJ+VduFpONkpDqin49t89K3pKGxdw23
         5HhWTw+mx3a85idfZ2WoSjO0OhtxkYVCGyi/QXDCHU9LgkM5BxAVoU7fDqY/5x1sSTgH
         dst0SzMXVjxIarBW8IMYkk7XlofEFsBwG8x3ecxk6JmJ2ezXYalmRuPH9gfm95iPGjfZ
         FU2abOoNsRKPwR/4Hqlm6NVQJvD0W5e1EZjXblCOzEsvV8dHwi4lyP8+FxIaxJF//lpU
         YTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721197; x=1796325997;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSbO/8C3j8RIVBHNdX+Dlhj+7Zj2tOE/srOubQ38wfA=;
        b=eqvZR7mdmAw0mmOENi5XmSM0ki4+2PL3yCuxsjdxo0MUCnWPItxBVwfbmvGxRI8Ceq
         lKPUmQJ+mygCylyYSm4dyUmYS3/AlwjSlrQsMr6S+ikXbTOEJezzGdkmB3OlTe1Z3pKh
         o1/OW3koCLFyDQYl2GebhzjnvlgHitAdcHL6QPDbdFgHrAAQrpMcXgAaPgKTqlhwRiR2
         ijXIk2OLooG5q8r+w4CgPNFbaZ7T8YtJi+wsyXbX1B6Q4BWAk0LeYZWsq2p6CVjdyxaq
         RABMQx5FNOBT+xSVPekCucDA5+zfuqdhyvNApmWdTWI+M9C+lWRvlamfTvJxndPULYPj
         9ZdA==
X-Forwarded-Encrypted: i=1; AL+hErGB/QFmF1C9CiWapWC5KU4qtprHVDYfEFp9G3xNEUn5IEToPcnYdAvIh3yKY6IssC1axKN/gAK4rHfiGtk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cHNhsJBRfs36sBNzL0DkoDgPjA9g08t2oAv74TX/+ZzfSuwx/
	QBtMTd7JPgLf5YZ3OMDR/t61cx8jw9ISyATAqVrfdbLTvqMXbCUP6sVa1LCXjLtqQYbVIwaP92u
	q9fdFmNEPXeU9kTZwjKqc7R+17VdIvJN5gCjqL3j0Fj68SzIUw8g4q95X4SM68qj0MC4=
X-Gm-Gg: AZFdTZeSv0zaAKSLkt64usTBn2ytqyeKs1B0MK31aXjGwG+c39sxTUabFF2KwFwHuhx
	E1ZcxergqYbkl6TfeXqXhZDgrfiDa59r/DxcgJmJ2cbBHWcMFyM03hNo9RfM+WH9uOm9Upe/pJM
	54jubLnQCACa4S374H5WiFnnHOctagRwxsIu4ShM5XfBoIBjNNGfDiOwp+hMgqlgCjEwo+XhFv2
	S727Gw+tQfg+aWl+b3uHofFK3YlgiHtuIyCFnhPeZTTYrBohJuGAn82tkjkP5BEUg11HWQIJRyI
	rIECyApwTE83bLzq2J5De7QZ4m7+URB/koAjZxD5s/VENlCNz4kUTS1qKC900xorfBJ6QkqPv8o
	pX8MXViZkRKiw3tzv8Fn2AK1I8lHZ1/E4C1oR1CEdw6GMyORiDRNOmWoJYpuIm8yYdSW1Mdf4BA
	==
X-Received: by 2002:a05:701b:2051:20b0:1b2:4998:a0df with SMTP id a92af1059eb24-1b5568fa273mr22224579c88.35.1795721197182;
        Thu, 26 Nov 2026 11:26:37 -0800 (PST)
X-Received: by 2002:a05:701b:2051:20b0:1b2:4998:a0df with SMTP id a92af1059eb24-1b5568fa273mr22224548c88.35.1795721196695;
        Thu, 26 Nov 2026 11:26:36 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm69877832eec.14.2026.11.26.11.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 11:26:36 -0800 (PST)
Message-ID: <83e49e4a-0e31-4802-bbcd-7e0c178b6ac0@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:56:31 +0530
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
Subject: Re: [PATCH 6/8] drm/msm/a6xx: Add IFPC tables for Adreno 640/680
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
 <20261030-topic-a6xx_ifpc-v1-6-6992841a9a32@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261030-topic-a6xx_ifpc-v1-6-6992841a9a32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kILbxz48iyMwy9bkqa21FzwQCPFAtNgA
X-Proofpoint-ORIG-GUID: kILbxz48iyMwy9bkqa21FzwQCPFAtNgA
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b0887ed cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=PhAf4g791m7IZrnnNEMA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NiBTYWx0ZWRfXzuObUp9NiTc4
 sG8FQmWBWRdFgEthKYWC2pI3uAovxw80/mHluXt7RLVPfPR7PWrovFZnPf7xp+YfjiycdCrXk4Q
 ctvDnuZ4oBbasZyINtCOxmdwQr3d9wo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NiBTYWx0ZWRfX5j1pOM49WV0G
 yc40UyRfU4vRPII54L1Jm/hVno7RoSzsk9e3fKoKdHo2J2Qiu210n1mFT6wX0coEmKYbJQj0mrl
 o3qe3pJu8N23eQDFykt3g/7Lc72cOwUq205qNE7P94JiPtvQwZgpZFhkGyUkZw1IVANILvdwBbr
 I+LiaAeyFpQa2BL7vKizc/e3BwSa6p0weEI46uLjjrWnL1/JvvdOWTkpIInuu1UYT91wjz0lMpi
 6Yqr0LrKL5tIxTWrdmn8h5POMbQ/7/7UH5Gp1tGee1WythSvVMOYqj3HHpc6Ex98cObXA+GPqAZ
 gciEjiaoXl4+UNV46qqO9zA0vsfsZKllg4BNqF6vbLUEMczIrnGkOWXCi+i4oDLPOwumUzqZ5N2
 6YB8YXNDqQ9fdsDoZ3Dvq0exrFKMeoLWU2EMye3fSQbQ0HE7zmu5vdcpXKPKfrVMgkoNSTM57mA
 hLjlWyj1m3zqYxatt1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260076



On 10/30/2026 3:34 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Fill out the register tables to enable IFPC on these SKUs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 47 +++++++++++++++++++++++++++++--
>  1 file changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 5e1d91a73a4e..89829fa8f4f4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -814,6 +814,43 @@ static const u32 a630_pwrup_reglist_regs[] = {
>  
>  DECLARE_ADRENO_REGLIST_LIST(a630_pwrup_reglist);
>  
> +static const u32 a640_pwrup_reglist_regs[] = {
> +	REG_A6XX_VSC_ADDR_MODE_CNTL,
> +	REG_A6XX_GRAS_ADDR_MODE_CNTL,
> +	REG_A6XX_RB_ADDR_MODE_CNTL,
> +	REG_A6XX_PC_ADDR_MODE_CNTL,
> +	REG_A6XX_HLSQ_ADDR_MODE_CNTL,
> +	REG_A6XX_VFD_ADDR_MODE_CNTL,
> +	REG_A6XX_VPC_ADDR_MODE_CNTL,
> +	REG_A6XX_UCHE_ADDR_MODE_CNTL,
> +	REG_A6XX_SP_ADDR_MODE_CNTL,
> +	REG_A6XX_TPL1_ADDR_MODE_CNTL,
> +	REG_A6XX_UCHE_WRITE_RANGE_MAX,
> +	REG_A6XX_UCHE_WRITE_RANGE_MAX + 1,
> +	REG_A6XX_UCHE_TRAP_BASE,
> +	REG_A6XX_UCHE_TRAP_BASE + 1,
> +	REG_A6XX_UCHE_WRITE_THRU_BASE,
> +	REG_A6XX_UCHE_WRITE_THRU_BASE + 1,
> +	REG_A6XX_UCHE_GMEM_RANGE_MIN,
> +	REG_A6XX_UCHE_GMEM_RANGE_MIN + 1,
> +	REG_A6XX_UCHE_GMEM_RANGE_MAX,
> +	REG_A6XX_UCHE_GMEM_RANGE_MAX + 1,
> +	REG_A6XX_UCHE_FILTER_CNTL,
> +	REG_A6XX_UCHE_CACHE_WAYS,
> +	REG_A6XX_UCHE_MODE_CNTL,
> +	REG_A6XX_RB_NC_MODE_CNTL,
> +	REG_A6XX_TPL1_NC_MODE_CNTL,
> +	REG_A6XX_SP_NC_MODE_CNTL,
> +	REG_A6XX_PC_DBG_ECO_CNTL,
> +	REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE,
> +	REG_A6XX_UCHE_GBIF_GX_CONFIG,
> +	REG_A6XX_UCHE_CLIENT_PF,
> +	REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL,
> +	REG_A6XX_RBBM_PERFCTR_CNTL,
> +};
> +
> +DECLARE_ADRENO_REGLIST_LIST(a640_pwrup_reglist);
> +
>  static const struct adreno_info a6xx_gpus[] = {
>  	{
>  		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
> @@ -1115,7 +1152,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_1M,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> -			  ADRENO_QUIRK_4GB_VA,
> +			  ADRENO_QUIRK_4GB_VA |
> +			  ADRENO_QUIRK_IFPC,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.funcs = &a6xx_gpu_funcs,
>  		.zapfw = "a640_zap.mdt",
> @@ -1124,6 +1162,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.protect = &a630_protect,
>  			.gmu_cgc_mode = 0x00020202,
>  			.prim_fifo_threshold = 0x00180000,
> +			.ifpc_reglist = &a630_ifpc_reglist,
> +			.pwrup_reglist = &a640_pwrup_reglist,
>  		},
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0, 0 },
> @@ -1238,7 +1278,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_2M,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> -			  ADRENO_QUIRK_4GB_VA,
> +			  ADRENO_QUIRK_4GB_VA |
> +			  ADRENO_QUIRK_IFPC,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.funcs = &a6xx_gpu_funcs,
>  		.zapfw = "a640_zap.mdt",
> @@ -1247,6 +1288,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.protect = &a630_protect,
>  			.gmu_cgc_mode = 0x00020202,
>  			.prim_fifo_threshold = 0x00200200,
> +			.ifpc_reglist = &a630_ifpc_reglist,
> +			.pwrup_reglist = &a640_pwrup_reglist,
>  		},
>  	}, {
>  		.chip_ids = ADRENO_CHIP_IDS(0x06090000),
> 

