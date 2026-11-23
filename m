Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469966;
	b=VhFdZuyNHUeG6bfxvcwqNJQ4ixi0fV42iEqC0oM+CMssqVthn5h2u6PRjLBL9H19V4pX
	 H65AHDQjfDgihQrrtS43HruVHUNjGj6kWUMxaVoUePMw40G+lmKO45tAUiTLRAqe9IItb
	 LO5NurgwvkBvW09x5IUpddpvZzFjACnvNVFO7tjiTcQ+2KRNPVwWK5AgFZh61xZASB9PT
	 AbvhvFItIxafDNu2/N94N4estcuxmM4sL7zOU0knHyJG5ru6xzZtKf/PPCs7DlerWSfHC
	 s7JhwDz1OHj0EHoQVR2eOvIN2e9bXLJKJu+q5m+LrN/NqJwgpy30vBozY8gCX+UclQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469966;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5eN+uAzBwgDgS7ksun4UE/qn3Qm3xyff5PhqmXd2xcQ=;
	b=CxFH4fsojVWiLGITLdoPzxmlu1UPnSMLmYWKX3tI8/S7ZRs11n12NqMV0bLq8r0Qk3OP
	 SpQghQ5pyVQemP32CX74no96Mk6JDO4eRkm9JYS49mET4qsWHKX+TpxOQTRSb85ez4gR1
	 kKCcktYk6EkIfl6P/2VVXTGtJO6R+ODImXzWdTcZJW8Is6HveoF7HNwL9uCirVlNwkPir
	 Peh5wjZ+uX1sehIVU8+3qpKmbDDe1Ej/5JmcuHKc1iCaDSBLs4NouTe6pvnMuaHKoExMr
	 xwohV7Tizjy2sKo6Q4jNCSpRyBpLbI1ZjU8ZqQjVQACcgVV8vjJ1OG/mBVnigHICLhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ennYUH5R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WU1roOux;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25022606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25022606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ennYUH5R;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WU1roOux
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJu7Ap3513810
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5eN+uAzBwgDgS7ksun4UE/qn3Qm3xyff5PhqmXd2xcQ=; b=ennYUH5RgxtQLvCC
	9aIQW0JsVuJ9awN6zp/wLVjINNwben8d1a/sNxZk5QarJ33qluJ7hSV7ADJwVAKD
	vtht8YHS68f5kRxOHdZDjGhfsWwf1c7mRE6zoCEDKPhQOW0k6bhAfHwfcfGtlnyR
	kJxbqnpIGkVmiNNB7qTV+odRbYXZTWkBmpSE3gxWTFoBdFgOomuuY3yhpsY1YtG/
	wRv9d2lzZ/mDHAXaE508glP9OTYZjSckvVmhkfSXRYMd4GaXSGaxsD8y/7yExmo4
	Bbw5WhOP9pPJw5vJHwoxS1dql0bTBYQnDKjO6ia7wk73aDSDqUhqWjIQeFMP1EdC
	lqVzPw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukr8g0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:39:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3854627c1c8so5616202eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795469965; x=1796074765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5eN+uAzBwgDgS7ksun4UE/qn3Qm3xyff5PhqmXd2xcQ=;
        b=WU1roOuxQj1o9wSocebp3zl5zWFYEicAOEQIGkk5gvne3RRb7T7aStIP5TDqCNBEtC
         TWHVI05aXn6H0cjcexgsJUtDxKuzchalVJte6SKCLfXu9qCufyQDfoVDyARc6Qa6QLnZ
         WH4Z3BNNiq3k09b4akHyD+9k9d/2/BvxNYkauG7D9w7bFaOf68ln5CCkXCJYEICmcVA9
         d/hZYnGGZX2T+VC8ObYSlPx2NyTP9q4932d7h7kTFSgP+2UVcS6jW/8HUtk8DzCRKVoc
         ABWefKJg8UZoASTze4mPb7UuxdxX8BHaEPthHWG5psLPnX1EVTu5J83Pqgy8PgpR30aC
         zDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795469965; x=1796074765;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5eN+uAzBwgDgS7ksun4UE/qn3Qm3xyff5PhqmXd2xcQ=;
        b=iKMzZpZuw/4OZfmWargJPMQ37ww1j2hCt9Qxz62WQXJDIHp/SdPmJB3ncG1PIA42Zj
         Tj+A2kSr5uB+uBHJWPyj+RHygUjyQI9xqDI0ESCI8v9CS+ijeGi0RnD1hNc1Kl9ZrnTX
         TO9Y/pu8aqMJ4lcnw4OQHw1UdjyIv+B2NXhP6ZDq+Yz9hioOoRSbsrj2JoxvwPIohswc
         Ol5ixEn5/wl65/dnnTjSYCUzg7N6y55XI9JFKOc8bZTnj/zThHXUDTkyDgG+EgOVhett
         gtu/C+vCSyKK0UomVpFY+NUmuko8ebNpF/xO64/EH7Q2wGCNFfO0qtx7FhUsDoa39zxF
         8ljA==
X-Forwarded-Encrypted: i=1; AL+hErFhLsLzaXaj4XexnXoPxD3jJGitzed1gaBgW/v3fMKcdalJ8tnqGdr1Ree+5av7VQzrS81J+0S4BfgHhpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TH/qi9A49JPRw9/wYQIgtOhKbgkV5zg3L0fYpxsB8QbRZjJmt
	UZV/Sl4AAmkY1WAilu4Ykq8f5i9WzRgl3Ery2vrZglUXVLRukXz5XQ8xeEgcJluBy5FNt1liiCY
	h+inqHt0mE6lOFrllkKY17sv8EjxwGIrbsM1TbS0EPEgeh8bof9Ofo1ZmiVI5S6pMhMQ=
X-Gm-Gg: AZFdTZcYB65CimayOMowTwhYhechPNl1Y2Im12B/eCSq1Hf89zHYOKLuTiY97PuXMVR
	FbMHKq+dGmquLtoH/njY9kcINrw4Q3/VQAaVQY7xqq+gLnxLxnbAIko/gBqjTF2E3L5KeXyo4/u
	a+7ir8+GApp88nW3ztmXhfMkRmxoVoS0tD1sv06LRpoQVzsTUZ9i+45xTgaRTKVPoimuoJklHQq
	Mc2emiV+6z2hjOTZgn3CKweuOaPyOU6g8BMVcyS/8bduMswweLca8PGNiNiXTYKk3DhDVq1YBNH
	ZjwRXsJgM8gGmU73IaskzqmxzvBTX3rqAzZUU/9iHz5O1uT3HhfbGCPH6WpjFq+zsTsPN8P80r/
	jf7MANQ4Mf4gzWJ7KsCKuzHmme/ejBFAIhQvoPL5IVAlDuflNicDhXFV6ybKHQzI1Ik3lj7o=
X-Received: by 2002:a05:693c:68d3:b0:386:912f:c8dc with SMTP id 5a478bee46e88-386912fe5efmr10344168eec.6.1795469964581;
        Mon, 23 Nov 2026 13:39:24 -0800 (PST)
X-Received: by 2002:a05:693c:68d3:b0:386:912f:c8dc with SMTP id 5a478bee46e88-386912fe5efmr10344150eec.6.1795469964115;
        Mon, 23 Nov 2026 13:39:24 -0800 (PST)
Received: from [192.168.1.9] ([106.222.230.69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm41004355eec.22.2026.11.23.13.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:39:23 -0800 (PST)
Message-ID: <4d06325b-e1e9-4e82-82fa-a81c5e2d6134@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 03:09:18 +0530
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
Subject: Re: [PATCH 1/8] drm/msm/a6xx: Polish up the IFPC counter enable
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
 <20261030-topic-a6xx_ifpc-v1-1-6992841a9a32@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261030-topic-a6xx_ifpc-v1-1-6992841a9a32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfXxfOvscGQhhn1
 ApURtJKmKu0p3ThcOEtLRfnDObaExG1DSzHdhASL4HKX9ROeqpBWkBXZra5OySmzCGvlXbSTJ3D
 U/NDn7TNH750AtmxmAPoh5qTFdGJLKk=
X-Proofpoint-ORIG-GUID: PxyLzDPSwap13gLwWNQwzL4sC0iIy3y-
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b04b28d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=6/OokicQZQM7IRI9QMJePA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=t7XnImjxOyE5UpSjZyAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX2s60bj4tDn5X
 HiPXTFYfaGBmm7DFhaaXWzCE4uB3BsZRO32yutAoNDxB4GeaVg8ofxNWCrknQQy9CmZLvVCNURf
 i8RiaJxfhY1QSiHtf2Pj1eoYajKhMRP8v0XUcAs1NN4DT4WNy4z5YtM0TSCqmDS7GOfqO84BlBK
 CZJosJ00giGMyHkvsnYPIWCm5NpGUxFLctQnOEZaO+tJpnlLvWvZPUJ1/g1nkfLO0ncT1rja0N8
 RsblLf1b5e0B1NXpFMMhrqgdhPkNCFkWqMDuhum73pd1vX49nfzdORs2fHe7dBs8wKUiv3C68Lf
 cIRwn/PhMGt1uItJPmMV097y1BYgV1a7iDX0HrOb8dF7VULNNefGTjfuo5zF1f3D4Wu/R7jhI3p
 i/DrqgXoc3iecuHaao7OQfmIXr+7+VXiQbGX8Ujd5TQUxV3OCs7EXaM8NBHdTMpLeqqd15RKR2F
 PCTFS3fIXji/NO+3k8g==
X-Proofpoint-GUID: PxyLzDPSwap13gLwWNQwzL4sC0iIy3y-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230086



On 10/30/2026 3:33 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Extend it to all targets with a real GMU and use a rmw instead of a
> full write to preserve other things within that register.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 6 +++---
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 1 +
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 92e8c8abb86d..48d3ee4d55d9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1332,10 +1332,10 @@ static int hw_init(struct msm_gpu *gpu)
>  	/* Turn on performance counters */
>  	gpu_write(gpu, REG_A6XX_RBBM_PERFCTR_CNTL, 0x1);
>  
> -	if (adreno_is_a7xx(adreno_gpu)) {
> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
>  		/* Turn on the IFPC counter (countable 4 on XOCLK4) */
> -		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_SELECT_1,
> -			  FIELD_PREP(GENMASK(7, 0), 0x4));
> +		gmu_rmw(&a6xx_gpu->gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_SELECT_1,
> +			GENMASK(7, 0), 0x4);
>  	}
>  
>  	/* Select CP0 to always count cycles */
> diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> index b3082738c99d..4f934c194f73 100644
> --- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> @@ -83,6 +83,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>  	<reg32 offset="0x1f84a" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_3_L"/>
>  	<reg32 offset="0x1f84b" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_3_H"/>
>  	<reg32 offset="0x1f84c" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_4_L"/>
> +	<reg32 offset="0x1fca8" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_4_L" variants="A8XX-"/>

nit: this is unused in this commit.

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil
>  	<reg32 offset="0x1f84d" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_4_H"/>
>  	<reg32 offset="0x1f84e" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_5_L"/>
>  	<reg32 offset="0x1f84f" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_5_H"/>
> 

