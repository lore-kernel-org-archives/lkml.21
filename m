Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717971;
	b=rMOcq3EEflUwKUSi6Q1c3nIJJz7spH/XTgnIXa5pXIKNo2yrRMZHi8bOEKcv0UlzZjyk
	 DghMo/qtOJli++7rUV9KWGwE+5BBbjLbGwWI7DYJmDQn24LJDv9S3b+kCwxoLvSXepmo3
	 4zMsdP0N7wQOUsRlFkHWstw6jSTGt6QJv7I/fTRDv1EKBqXyPLwgla6xrF+kI3snE0kdd
	 pHB7JS/HfakVXJHDkktLaPaD2jJc0ilsISPJMALtAx4lSFGO/XjSCLY+jgl0vNSfklpkb
	 qWlITg6P9iPBozwZRGzFFxllyUq5a84XbOTijFo06LYUivGRZL+8MjpkszVtck/53Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717971;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/AAbzqN6gL/Sx0YtNRBarMK5mPpXPZmH0nkOki+mzQo=;
	b=MvqWV4nPZRRPLe2kZI4DqjmO1Qav0YFV3WKmxxTHFrDpDEfrc5pCf7rYjVnYETBNvjuh
	 kcjfOWdIt2NoVF3dDxvgd2Pn3oN5D+3s4OEJYNLJnkTa6u0iQP158GaUlQ22n+B3+C7pd
	 c0HnbFTNN+QAaShMDGFA8hb+b2F0AhKNOD5Lk7G1ZFqvqg1l0TNbJUCJuz6lJY4ZawAnQ
	 PUv5Yu6WYCdlZEeNGxwkoHxgXbq7FS7WC1p0g/bfxNqElRaZxTLvmuRlBCbtkWkFLxk+a
	 Y9n3XXGS3rMaXfu+3toDilJoQWyP9fDHJ9u6mU6RuS2MEzFjnnqJMSqEzgTV9zvbRng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bFGxra/0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=COPiPtAq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B210606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B210606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bFGxra/0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=COPiPtAq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuNPW3750286
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/AAbzqN6gL/Sx0YtNRBarMK5mPpXPZmH0nkOki+mzQo=; b=bFGxra/0eJHHWFJu
	0RIQ9y64G1jGfSfrswDn599e6gfUxhCB1vdVAqNwN+hTh0vSvGkAaHMQQemA3pnM
	2wMvlAYeqZO2Zm5ySUZkX6XKS+EkyvgALeb7EL/coJsPdVcHiK7WoYefnVhsNAti
	ZTOODe2FapSksKkYbyhcyTF0EYNMBqGni95LkfE7w+lSL1hkntzTYnDLC/RsTYVd
	A8pZCc4N+hYZXxgatrUZlc1eZNQgY5fabHEqmHEDiGIvYZDBtUtEUVRATniJE3is
	G3A7Lk+qZ+WpZZXbnwYFC5s41V2Zd5yk0NTFaF9BWG7/RZWqGjtT5N5alG/W5+xF
	jojcpQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sca38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:32:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3846d5f54c1so8205079eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795717969; x=1796322769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AAbzqN6gL/Sx0YtNRBarMK5mPpXPZmH0nkOki+mzQo=;
        b=COPiPtAq5/rz6TPdhWg+FssP/VqnV6HCxUoBd2itKojxl+dbNG+Mc2qWvcQhssXQfL
         p017xnqCi1SED+UhHrtjEkmqHcCrQHfXt0CFXbE+ZHbvse6g7GI4ep2Ndyb8wME9JMqg
         oCEGKFc8a7yI+KJaw7t2DaJ/tlm/UqRWC7UlHHU1bnAt5s6/vUHsaqRL+tunZC9QMtL7
         gUY1BXn+yFNudPaxuz7Xdy4adj9Ouxw14XbOTYNaejUlPULcfrysw2hWpzV3/95/tPWy
         ViGqj9TOGXGrD8mnm1aW7ei8dohFSrjGmSDEtUfFIpAiEn1qgoNGfALyqYGUDmREofQV
         fzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717969; x=1796322769;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AAbzqN6gL/Sx0YtNRBarMK5mPpXPZmH0nkOki+mzQo=;
        b=eIOyVmbfbkGDtRi5qRfklxBAO11EjEbqAczTwtpi+kRseE7InAmklPFHVTA7sS1Lbq
         rBfu9Mr4MsNtyU1dL/soLsGMuVj0E7JEkmSAnprx2FKiwZgGd+geD44rtdCEMkapQQ7l
         g1vfDbxATEPG87thfG/FvW/CjwxRaPfxS62SN14bZMEa3C6rdRPr24rbK3OaTCdwoWox
         FcmuxZ6hTHqVx3zvsBs3Co1Lvmot6ceIdQtm1zPR6VKd8eSefHdGnAdqjvML26gOVohR
         cXUJGBX3Eu3uyGVf0KXq/7sjeT08JFK6P4DIPIJl/7V4VxH1Rn9CX/DvjBpfEPz5MGpH
         fpyA==
X-Forwarded-Encrypted: i=1; AL+hErFpSBgD3Mntk29K8mGalzddZvNwlTYkTc8ZTRJVbFsDDtiV4c1//fTq2VLlpKta9G7dhaN7Yek/Xd6B7qg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+exR0KayjA4MRa6mUdiNQY0HirXrTFFZP9TZeuCydVBU18H1y+
	FPzvbquScf/zq4Z/1jpMy5zwv7UDTMl9maJmxc1LOvoHHDwXVK1PNN31cHNHhQfgSH3ONCmqMTn
	orACf4hpfDN42sfo5ASrYexC5zyotR+J9MULoqN0Scom47h+9dGwmiUTfF4y4+bVckQA=
X-Gm-Gg: AZFdTZdqfWPJ5bFaiMF7QCGkh4IFd4bsnEWs1TA5uS+QYDbXCrWpdeBQCSznAIx4N9/
	MYzzRRE4IgpviVaflmIOcnVyDt1+bS6Wbr5f0NNIncF2plZlVRLwSqfAj2MK2F1fZ1xWthCUB0e
	vP1iqlV6ZPMrSmxzsdHsVBm954B7WTKirNrD50rpUabWP3EZNOm/HwNHVEDZ5jRQIVD9/rUK+aG
	3DYzY77eXrQfOe563iv17rcHu6cc6uF4Sq5dLbR1FT1AdabbF7QY9vQbGAc2TmXEFKZydJIdv5h
	M9oujQd8F041O29Q544k9zwTEDmICQcD1M8jKDjun+PQmwtPJyPLg8nLy6Vr2hqXBbbVmnHMFD6
	6LyeOTjsf5cFFACmRM4cA2fe2wYwdHaeEvCTxMagYz7D1FHzxcXXwwZNcTFvER6BfGj9uOhWv9A
	==
X-Received: by 2002:a05:7300:dd46:b0:385:7762:e1a3 with SMTP id 5a478bee46e88-3857762e729mr21207571eec.24.1795717968879;
        Thu, 26 Nov 2026 10:32:48 -0800 (PST)
X-Received: by 2002:a05:7300:dd46:b0:385:7762:e1a3 with SMTP id 5a478bee46e88-3857762e729mr21207541eec.24.1795717968385;
        Thu, 26 Nov 2026 10:32:48 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm60895320eec.13.2026.11.26.10.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 10:32:48 -0800 (PST)
Message-ID: <5ade8269-bc76-40e1-b0bb-559d3f211fd2@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:02:39 +0530
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
Subject: Re: [PATCH v2 1/5] drm/msm/a6xx: Add Adreno 753 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
 <20261118-nord-gpu1-v2-1-8d6d9908b7c5@oss.qualcomm.com>
 <a005f8a1-76a2-46ce-b328-2063bc307758@oss.qualcomm.com>
 <70651641-b264-43cc-a745-178ef2b02680@oss.qualcomm.com>
 <6962c4ef-ad14-4984-9df4-4624c4bb50ae@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <6962c4ef-ad14-4984-9df4-4624c4bb50ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b087b52 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4rBPJfw8ZRJ0ovG7S4kA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: wMKSIvyNAd2nIak2JY_XtKIn6B0yzAym
X-Proofpoint-ORIG-GUID: wMKSIvyNAd2nIak2JY_XtKIn6B0yzAym
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MiBTYWx0ZWRfX3QHLjKZF23vw
 ocmOoMhJzkA9rcrgeRUP2qIjUB0ACaYIoE2+ziaG4i6Oc9EH9Eo/Okapafy+WwNADjgh+/qMDqA
 m9VQqOHIpJ8jVM0dZrq2txxh8TTzbtKZhpMCWmauGkFEKr7oZEBiy7skMWYZmyQng5xjvLdnAB2
 wM3g2qwUQCXl+0p5MRmEbpkUPQqsBQSa8grDu7x1p9rg9bDeWKTWuSZf8gCwVFqFxIgFnoTn+uP
 +v2VzQrHMJIoe5dFwIMalarAoGmWlEhaA8rCcfhM76jjKNYx+m2V5EE9xlAZzgDcJUobFe/AsPJ
 bMuWrbXsGcfAn1tgG5+e07BGfoeyXoFutuMFZpaLDQ1HmGxDZD47kqnGyU6oxf0zxh/p4W2SC4D
 JNgd9e0Vn6AL50L6YxiDKVYjZsOKDxtnGOlXXpeBHVttLu864ljdkMw8ivnmD/3h47RuZBjl4Hc
 k0cbKut0ULyUyxpbq7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MiBTYWx0ZWRfX/awPSEcs10yz
 gYrcP08xPelVC/f31p40NTXI53293F9YKVOnCff3dUvfERg1JMrhVNZTBTGd14bL2STjKd3k+xw
 gE9PXKPHjXCkyShV/xvnrr1W0zztKt8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260072



On 11/26/2026 8:59 PM, Konrad Dybcio wrote:
> On 11/26/26 3:53 PM, Akhil P Oommen wrote:
>>
>>
>> On 11/26/2026 8:17 PM, Konrad Dybcio wrote:
>>> On 11/18/26 12:00 AM, Akhil P Oommen wrote:
>>>> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
>>>>
>>>> Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
>>>> the A7xx Gen3 family. It is derived from A750 and shares the same
>>>> IP-level configuration: protected registers, pwrup/IFPC register lists,
>>>> GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
>>>> record size. The differences visible to the KMD are the chip id
>>>> (0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
>>>> firmware.
>>>
>>> [...]
>>>
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -651,6 +651,9 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>>>>  	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
>>>>  		return;
>>>>  
>>>> +	if (adreno_is_a753(adreno_gpu))
>>>> +		state = false;
>>>
>>> Is that intended?
>>
>> yes. It is mentioned in the commit text.
> 
> Right, it says 'it's not working at the moment' - are we going to

Well, that clarifies that it is intended. :)
> have a moment where it works?

Yeah. Hoping to enable it in a separate patch later. It is under investigation.

-Akhil.

> 
> Konrad

