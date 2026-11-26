Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721075;
	b=dDN1QHV1w0qbGM9U9eSGtxJU89O92y+7Gd5xnll9iB+ft1uEk7qnE+T4mkpq+MU1f2OB
	 VjVjJL61Mwbiu/ofQAqWIxjLyjunvYtHfgLUMkclNkNkulPKwus55PYnjcHqdN+SMKxIA
	 Cdx3Pub7klgeqMioO2nMQNyGGr2nsK9qqBvoNoPpkRKte/0jI8IFACGikajf6R3KA85GP
	 Mg883NMUyT8O5j9bRfoYOySvoAnMpsl3RKcDeBRx36+Sy7dg86tvT9W532Qib6Xb20RtJ
	 JbJU96hw1tmdyVmCP9fxr2KbxQobsOasNZe0JDVrEBZpBx8DDQXSWenfmehbYV6eVSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721075;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RHIdko6UqJLukIVhvr7EZRmIk/JiLrr5A6iBSZS9uqQ=;
	b=m8dO72zaOhmNQ040A7vIY2AX6D4NaJVofN5YpvvZdMf9mP8mertfwKyczs+6So3CFeEY
	 zyj1wGLzHz36256U9Y2iLvEcTqdqZpDYRKg+Z+/XQ8bXxom0walLIVLMIr2o5j2u63PKi
	 xl3cdrk0zaH2zGJE1/0VvzRJQXxK7HoQq8R033wrFflSUVkVG0celwfD5L141ilwUcnx6
	 HZ/eQ06R4xsYzPTx2AWlJfWRfN6RsgejZULGYzzKmRkB8I0uoMV8mxSIcRH/LTKIqJ46B
	 CbY/R46b8T7kv58x0CCJwVb3yL94zfNUzWK+JooEed0D/rYzPgCJuITD7x1KxDUCj+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JdIkNUPJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BnUzsRvj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D573606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D573606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JdIkNUPJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BnUzsRvj
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFv3FA1208009
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RHIdko6UqJLukIVhvr7EZRmIk/JiLrr5A6iBSZS9uqQ=; b=JdIkNUPJc+iv9cFZ
	LtTLbvg1WYIP0DrSyMCectpLuAyUYLTXnn6cZxnVrR1S+ie31X3AcA4Eefkalu94
	2CDNNQa0YhK+hOiGagJGVGMW8Z1b+vk3GcjPKHjm1Ydd3exeG/rk3MHU2/T1ve1l
	iKwS1YSpwfy754mstchdOHHXR+jOH2UhGv4lHjKnuVKfhOZ8jytD7D56Rf0FOWkm
	pne0fwccSdpAPSkSoyeJFwPGkEkAhHDOJLFuuIUSlyCpvFpb9gbbmZ5BJQk9dkHM
	kKhgDm09jA0ooJga0yvrthCUIy4AVDygZbiVNA0B3kHuvPw/xE4/9Cmz+jjnCiyL
	UBB/WQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne2atw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:24:33 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so3122527c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795721072; x=1796325872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHIdko6UqJLukIVhvr7EZRmIk/JiLrr5A6iBSZS9uqQ=;
        b=BnUzsRvj9za2igwQE1GQ2yZ1XgaXYIdwoMA2pQc/0AAk23VoyNMWaTwpMZmAsObIoF
         qeevFatskf2w0WRnwLz/W+RNsXpmAmtpmUa5XXan0vBRiqeMwjhqqzbGg/oYVLZnHFkR
         JRa9nbNyyRLwZY8/oNhnfAlLBkOxUtTKK5BMmfHDKpaXqHtw961S4Rcss5kgSCG6ECrs
         0fdCFVnPqgQALYcXW1Ssnl2NaHhiJB+E3mS6M5Px1/i0e9H8wFu3v0e1ctokTpnXB6JY
         MAEbPugqucPbwtbF+3ZKFLnVoiTZYa40P4vmYsOS0QbG2b2OK7XZBVt11WYGKhrChl8p
         ezGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721072; x=1796325872;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RHIdko6UqJLukIVhvr7EZRmIk/JiLrr5A6iBSZS9uqQ=;
        b=UUSEfKIS1YlLMxFVyCbp2PQNahzMaJks920kDyxmdfliJH9sFrVu2d35RxagxGTatc
         Ye//b7m/XVBxToMaQ5EFAhqqC++TR6NGeei9ZthTHkEYoo4ogA5UF2p3AtgO236J6n3J
         p947Agf7pE6Wm3hVgxWMmynGaAkGS88m41CEEfpJX2J0T1PZLqd6w2YtZidbwkhBP1Kt
         J0IaDHtI3PTA+NpYJSFOfU0ISS4dlAUwng/d+fqBfIkbGhbKiE8GLnQP6Q5NYkcy1fmX
         tMfk/ew6TArdgd26jL8s2hCdaikhjwOrv/VZncnAQ0yRDAYP6fu/AJTgTIfp36uzqqbq
         0Pcg==
X-Forwarded-Encrypted: i=1; AL+hErEyqHOkmDBHVtoi5XGMXF/uQHyI1rsSG74M23nmzVKrulWp963cJFIKxawaocEfwnIBC5FulV+CtrJSDd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ShEr4ancclGBH9lGF4PQWXge1koc2iDomGe5WPcHraBP2WZab
	U0Y9RZrwhrezDK50OZvt8xYJ+SmLfqn3IZv98Y3lrUNJZM/km3jgMpo/OfvlEPYLiHgZu5ekJJV
	Iu8ZDSRpKsQt7I5AZoYPCXgv+fU77LKVT1OQUDO057ZNRihuEOd76adJ2QDzfge2tZnQAEtHxx+
	4=
X-Gm-Gg: AZFdTZdFnuIbS4iMFdAz/5rRADFAQ3IZaIq7NN+JcFOuXDUiky/FnfzhRlh+uzq9SRC
	cjQupB0UJ3If/0sDPav9A65rkA7dxD4lHZ5XuNiIcyB+1byYa5FrfYsXjCgPXmgoV2OCIyaWTeB
	RGIc8XKrRmxSXtu9za3jve7RxMTS5+Y8EdGhICDWXFObhh6tlzD7ocsTNmdnWBUyPF2HyOFwyzh
	ZlRN9tzA7uX4ygWEdH+ZxR5c6BfwG3hcNN22p7N39JV3oWqxAti/DD4pQhqeZQM5CUSoM/sPekP
	KOKcMoW8oBFjlu2DAbSL0aRXbynkbepCk8ivOrfz+iISPY2TTigLGSgkJANt2G4RaT1OkCEGfZE
	66L/OPfJ+N+eWpYcrKR7YDf/A+KkjStt9gr8jyUEp68diuHoaWYrFIIU0VbxmlgDoBju1PfhjjQ
	==
X-Received: by 2002:a05:7022:92a:b0:143:26eb:18e9 with SMTP id a92af1059eb24-1b5568eb4dfmr30545721c88.28.1795721072067;
        Thu, 26 Nov 2026 11:24:32 -0800 (PST)
X-Received: by 2002:a05:7022:92a:b0:143:26eb:18e9 with SMTP id a92af1059eb24-1b5568eb4dfmr30545670c88.28.1795721071532;
        Thu, 26 Nov 2026 11:24:31 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm77073667c88.14.2026.11.26.11.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 11:24:31 -0800 (PST)
Message-ID: <59e69b2a-2780-49fd-93a2-e4107bbb64aa@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:54:26 +0530
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
Subject: Re: [PATCH 5/8] drm/msm/a6xx: Add IFPC tables for Adreno 630
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
 <20261030-topic-a6xx_ifpc-v1-5-6992841a9a32@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261030-topic-a6xx_ifpc-v1-5-6992841a9a32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b088771 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GaZQqOmmu1Wz2YppMPkA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NiBTYWx0ZWRfX5yNw/hCWpWIn
 01nPgaEryKKSdzecM1bG0Dl/ki1/qiJniTKrXM/Dd4wadL9XImkgxm+sO70Jtz43vvXubEA50CP
 kQievnNixK9x6++Q6SSMHuFq5HREM7awTsXy9Pdj9bvE1FZY3xgHDwZAaS/L4bj30YLWtaCqS3l
 v+lNdW70K48uMYyxccHB6SrFk+Jf2GdPvuOGSQ073/VOIcD/Z4u2JICXdu4b2Zdb8YFS9wQVnfC
 ubZtxZxsoMIH0f6BFfUCCRPIonWVExrQvGVPthH3eCIaF/9dqsgfglTyMfNNdeX5ChsphuanFNK
 kFvpputpzR5JNzsACpOyuaW4rUBNFCwRAurMT+Ya38ci19W+9/2noQyt1Z3AZsN/QLsDwbeJlWA
 MTqbTTssQ/gKJ6BueSUNmE0nqjVH2PcD2axIbCI7IuPWBwnJ+AiPaYWRog2NvMBf2NaeQiHc9zm
 U9+V3MrB/zblO7hLMCA==
X-Proofpoint-GUID: S1fEykBHehdDWUOx6O_mnJD8_pYhjAsJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NiBTYWx0ZWRfX7Rd1ARlWDMCH
 CaQv0y8ZCIEQSaeSGBO2n5PCQB3zs4zDCrviOlb40DS1k2UAigRir0K+i00TV1DRIRodX/4fbn1
 4pTOxNMzfkgkDmZ1FjK8TSvERkG9G7Q=
X-Proofpoint-ORIG-GUID: S1fEykBHehdDWUOx6O_mnJD8_pYhjAsJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260076



On 10/30/2026 3:34 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Fill out the register tables to enable IFPC on this SKU.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 83 ++++++++++++++++++++++++++++++-
>  1 file changed, 82 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 4ef2bd6e7ad2..5e1d91a73a4e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -736,6 +736,84 @@ static const struct adreno_reglist a702_hwcg[] = {
>  	{}
>  };
>  
> +static const u32 a630_ifpc_reglist_regs[] = {
> +	REG_A6XX_CP_CHICKEN_DBG,
> +	REG_A6XX_CP_DBG_ECO_CNTL,
> +	REG_A6XX_CP_PROTECT_CNTL,
> +	REG_A6XX_CP_PROTECT(0),
> +	REG_A6XX_CP_PROTECT(1),
> +	REG_A6XX_CP_PROTECT(2),
> +	REG_A6XX_CP_PROTECT(3),
> +	REG_A6XX_CP_PROTECT(4),
> +	REG_A6XX_CP_PROTECT(5),
> +	REG_A6XX_CP_PROTECT(6),
> +	REG_A6XX_CP_PROTECT(7),
> +	REG_A6XX_CP_PROTECT(8),
> +	REG_A6XX_CP_PROTECT(9),
> +	REG_A6XX_CP_PROTECT(10),
> +	REG_A6XX_CP_PROTECT(11),
> +	REG_A6XX_CP_PROTECT(12),
> +	REG_A6XX_CP_PROTECT(13),
> +	REG_A6XX_CP_PROTECT(14),
> +	REG_A6XX_CP_PROTECT(15),
> +	REG_A6XX_CP_PROTECT(16),
> +	REG_A6XX_CP_PROTECT(17),
> +	REG_A6XX_CP_PROTECT(18),
> +	REG_A6XX_CP_PROTECT(19),
> +	REG_A6XX_CP_PROTECT(20),
> +	REG_A6XX_CP_PROTECT(21),
> +	REG_A6XX_CP_PROTECT(22),
> +	REG_A6XX_CP_PROTECT(23),
> +	REG_A6XX_CP_PROTECT(24),
> +	REG_A6XX_CP_PROTECT(25),
> +	REG_A6XX_CP_PROTECT(26),
> +	REG_A6XX_CP_PROTECT(27),
> +	REG_A6XX_CP_PROTECT(28),
> +	REG_A6XX_CP_PROTECT(29),
> +	REG_A6XX_CP_PROTECT(30),
> +	REG_A6XX_CP_PROTECT(31),
> +	REG_A6XX_CP_AHB_CNTL,
> +};
> +
> +DECLARE_ADRENO_REGLIST_LIST(a630_ifpc_reglist);
> +
> +static const u32 a630_pwrup_reglist_regs[] = {
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
> +	REG_A6XX_RBBM_VBIF_CLIENT_QOS_CNTL,
> +	REG_A6XX_RBBM_PERFCTR_CNTL,
> +};
> +
> +DECLARE_ADRENO_REGLIST_LIST(a630_pwrup_reglist);
> +
>  static const struct adreno_info a6xx_gpus[] = {
>  	{
>  		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
> @@ -1014,7 +1092,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_1M,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> -			  ADRENO_QUIRK_4GB_VA,
> +			  ADRENO_QUIRK_4GB_VA |
> +			  ADRENO_QUIRK_IFPC,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.funcs = &a6xx_gpu_funcs,
>  		.zapfw = "a630_zap.mdt",
> @@ -1023,6 +1102,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.protect = &a630_protect,
>  			.gmu_cgc_mode = 0x00020202,
>  			.prim_fifo_threshold = 0x00180000,
> +			.ifpc_reglist = &a630_ifpc_reglist,
> +			.pwrup_reglist = &a630_pwrup_reglist,
>  		},
>  	}, {
>  		.chip_ids = ADRENO_CHIP_IDS(0x06040001),
> 

