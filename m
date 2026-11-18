Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027356;
	b=jxj9c9dVbqE97gb9AkSmg2KBBXtzALoyQCHTU1faWUHfkuvnYSdaK7qbvOM/kDZt+JkE
	 h4OpMmJ6mJRul+9sGDQFdbyvf/m9VbUuKHMk0G1NZBhmrnW25bC9JcjenOMh7XZ/Z2ZzD
	 8XqEYOkwub+x1pWPFVSJ5f5JzocqLqx9gm4nAL2g7PnEHw/KqMwnH4TwMvOhz/svjaOtU
	 TUuLwfSNUqq8zlvYZVyRd6ealf+QCC/d6i79yi43r7V0i8Sf8XpMQTlQd/MgIsYuNe/oW
	 RechiGt1dLUFfWYkhHpM2vxJ5eucJ747L5DJGwoNjtRgAAERVcAd/JmVtZ7PppsKabw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027356;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=supjWQ/8tiiTSWvb0f0hWdaRNkjBdKu9iua1cYtSbOQ=;
	b=GWaNYrxgcUYEp5qK6kgd69LJs8UgAMSTK1mHcubqKMEixe7fRpRgUql/fNTgifvYHo0+
	 +vrogrIOvgmL41L71AgvIBJQGGksDi30vXNgkXlTUH0GLMR2wsXYiMA1sIXSwd30ylWke
	 WswnFgQoqe5d7/6EhdXZQCf2NgTOOQ/HOOnr+x0SAopL2r6gLYT+9nfpojfENMZ79J9Ui
	 yH27KEYIqtad1oLJFhgiOZTPZrcLakkCjqULrEo3pSPe9y3P04piJSDhz3zE6FyZrWtjy
	 xTaBHiXUBBYA7qrytReQTRee6snqKWSbD+OFr1SXqjR958oJ32PYH+N7k8OrtMIsV+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PF2vfpno;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Js+2KPre;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66A760A2616
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E66A760A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PF2vfpno;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Js+2KPre
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AII1PAI275485
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	supjWQ/8tiiTSWvb0f0hWdaRNkjBdKu9iua1cYtSbOQ=; b=PF2vfpno+jJczsL7
	gwxDfvPL6Vg5B+YBB+0F8c2Bzhw5hn2MV/goPaWvnBvL/EO20ThimukhQa8uD0B8
	WbSpY+rS8p1w90k8IZ1ChKYCMBe2kFk3cq/w0KRS2KxF85S3IU+7yzIC7bWy40PN
	VbcokZlfhyCcJloc/q5Z1QOdrYufuCIw5l/wHZwRaqon1y+LbO2kw3a2ZIuO4o7v
	xxT/20q3ma+12yYBTIfra6byFhzv8qeMv4dzBu0p7+P2aBvDEH7jlsY8uy9hpOjG
	B95Af4lBLF9opvLnE4r3CteQAwrA9gaajG2rjWQGN4ArzN71y6csCD8dl9T2B48p
	q9EYwA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcr69f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:42:31 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2ec691518so106519137.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027351; x=1795632151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=supjWQ/8tiiTSWvb0f0hWdaRNkjBdKu9iua1cYtSbOQ=;
        b=Js+2KPrehhz0cJUNHtKg1I0ioTZhBt8tCtSEsq53IpeZxafQM52UvrW7yU9tQKcGcH
         QbZAvcUgheHM5XqbRSCLR6/qnFFQ9H/1aDGYrN+iqWjc7Nkc803FxhY5ybIazqmQzyGb
         J3SORHQ0fghBaJrg83FDjjLNwApAKZWKXVDFxfk+wk+3IWTPsNl+mU3Z/fo4sTbw/7fn
         nyg2/4x6LNnhSvA3TKPQPmoHLx7/sNQWeogdc7RCbvsWsQmt0VJsAD0oOGb0/Bip8Ftk
         N1OhApzpIaOjnlxF+tbezanUFyDRSLCdnCAK3Oeh0XQNVkLiY7YaSMruN+Y95gjpIfto
         MG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027351; x=1795632151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=supjWQ/8tiiTSWvb0f0hWdaRNkjBdKu9iua1cYtSbOQ=;
        b=mGauF2nwO6VJs6k0CIY7rOjWwCY24C1reuoceA1dhP7yhNymYsodCfUy0PYnN+wNsA
         lmjoH0SP988gaxQZnqekBFxKhJUnV0RJ+LvuNLyepfQ0a4w4L+Yn2JoTueJFqy2Byxoo
         F+whW6TfIPAm1r1OUhFYAmZmrhsPdl+X3hQ0Jq6+4E7J5B8Jl5ff/+h7ksU0/sZeywMO
         gtOH7Vsr8zCy+OevMAiGeDvEXo7uFUg6q2iY/uFnMwf24szgls/bpDjGTp1Gv/FrBHkb
         yhotD2/0h2J3LPG1SkrIYI9Plgknc8DhvDCXauJgr0lZT9bcCnJmXmRT2ZbWZOme73KL
         EpyQ==
X-Forwarded-Encrypted: i=1; AL+hErFukAKPQZmsQ12MV1W83AcCtrdoedjUZLLqXtzxXyf/mfGdSAeDzzJeS87rwGajFADH3vywJ8Z2vVtOrjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nyXA7si9yhJLE/0Sy3QZfAVnwvI/u9ugXuK6pgbO1CLtYxH5b
	JfFu2ScjPAd3EpVXe7dOyPR0dhR5jv5zku6rL/nxZT5SPxryU/hScvxNI1qM5PA+/Wnr++QKGJu
	1x0G9ayrsEbzBzaeWGu31lD5+aLXgjpb72KoNIkBkn4Jwnq//dnmtf0jbVQWUSudCk5Q=
X-Gm-Gg: AYBFou3lKe8p8F0ETGl3o9K3bGDExNIJUBCfN4iHSqtq/10M0MD/Ue/DzDlYC6zrZ8O
	IBxfcT/9n7aBd3wGXnPy1MI9kBqWlAsnHELMjMvmFVObdqIlTLiRuoorzB6Al/z+lwjawawxTi5
	FnI5WAN+/0omhp2bbGxNZNjJOKdZHwj35ToOTJ15AyStPIpU39ArPXxUGg0nwDOGm7yl1f/WgZz
	rTAsB+W9pZqjXVauj6GtiEuEyDVU8PgCzShDqksmF/yp+1Qt/eoFK6O0g9DFmxB2wvQ+zdaRsdz
	3t+2CMPTaazUnCLnxdLd8Pjo1NHKqL5lBHC64HYgGtpYpwiYDM188C0nolw+WmPSV28ffCR3lSF
	DU+JGTjx17u6EK/BHllucN7lBg2cmEyNdHCrNKCVBTVfXUhmsfdfllFo6x/KrQMpfuzqCCXRqHg
	==
X-Received: by 2002:a05:6102:442a:b0:7d2:d799:d7c2 with SMTP id ada2fe7eead31-7d6cb430827mr150828137.2.1795027350951;
        Wed, 18 Nov 2026 10:42:30 -0800 (PST)
X-Received: by 2002:a05:6102:442a:b0:7d2:d799:d7c2 with SMTP id ada2fe7eead31-7d6cb430827mr150801137.2.1795027350370;
        Wed, 18 Nov 2026 10:42:30 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b91e87f4sm2532457137.7.2026.11.18.10.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:42:29 -0800 (PST)
Message-ID: <4d16306b-31c1-4406-a1f4-858abd3f44ff@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 00:12:18 +0530
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
Subject: Re: [PATCH 1/6] firmware: qcom: scm: Add
 qcom_scm_gpu_init_regs_is_available()
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
 <20261118-adreno-scm-fallback-v1-1-e99cdbf3121d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-1-e99cdbf3121d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afdf197 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=L50M_nCPciy2geT04tYA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 2hsc34b0kcIM5LwHRxMWZVpGK2IMYRwO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX/O4v9eOq9yQF
 zfBUcEZaQ30Vs6SOiX87/81MQPo6wc32JUhZ7yofNkDE/QbERSeYqWhQPga17n7pEkLfgCVKNCN
 S/nolrfgRQ8MYLSVjW98d4xulYa/7oil5kFK+dOH72uBfQmlwjfm7xgmTzw61p7OsOR91dGDkOy
 v9qaTleIOtkSTHhulgkFCXKoP4WGrtrSZNK135vlV4rDD74O+Tw5cSKKOzLKjhfbS1WdiMmYCow
 9hNBLIDbrTIpoainy9778ayaCFZ2uQdi3FNinVfopqS+tafrrzSkcqHNINa1ADfk4sY9EROuyU8
 2KIOm9eT5fqYEpF+fjQiwYYKeSpUScB8Kwav+abpeqpAa7bciBTNYBgviiw/GG5Ava0ImsDo7jz
 AxrIwQdkZbhLh+8lyODYBh+1umRPIbD21a9WgQQK+U6duHBXKOoUZ+ZRH/BKV3MNqM0OOJXHiWl
 IXbiTox1dMJZvLHbYmA==
X-Proofpoint-GUID: 2hsc34b0kcIM5LwHRxMWZVpGK2IMYRwO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX+SlcPkHpTjyj
 ZHYJbvxBTT+rek73KK2ZmZ19mX3IX8su36fvPeWoFx/BtJhc2FFe9U4+MFqKRoZ5q1aWU02yTs1
 B9hDYXmkhwqxoebXZ9wKxUNdcWgWm6M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180074



On 11/18/2026 6:38 PM, Puranam V G Tejaswi wrote:
> The Adreno driver asks the secure world to initialize some GPU registers
> through qcom_scm_gpu_init_regs(), and fails to power up the GPU if this
> call fails.
> 
> Not every secure world implements this call. When it is missing, the
> call fails in the same way as a real error, so the driver cannot tell
> the two cases apart.
> 
> Add qcom_scm_gpu_init_regs_is_available(), similar to
> qcom_scm_set_gpu_smmu_aperture_is_available(), so that the driver can
> check whether the secure world supports the call before making it.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil> ---
>  drivers/firmware/qcom/qcom_scm.c       | 7 +++++++
>  include/linux/firmware/qcom/qcom_scm.h | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 030e4ba90812..f4f34b7dd0b2 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1941,6 +1941,13 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh);
>  
> +bool qcom_scm_gpu_init_regs_is_available(void)
> +{
> +	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_GPU,
> +					    QCOM_SCM_SVC_GPU_INIT_REGS);
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_gpu_init_regs_is_available);
> +
>  int qcom_scm_gpu_init_regs(u32 gpu_req)
>  {
>  	struct qcom_scm_desc desc = {
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index a0a6bc0229c4..c9e88b2904e3 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -131,6 +131,7 @@ bool qcom_scm_lmh_dcvsh_available(void);
>   */
>  #define QCOM_SCM_GPU_TSENSE_EN_REQ BIT(3)
>  
> +bool qcom_scm_gpu_init_regs_is_available(void);
>  int qcom_scm_gpu_init_regs(u32 gpu_req);
>  
>  int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
> 

