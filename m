Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706955;
	b=Glu1xlr8jUkppr3vSjj4+R7ydlMLgOiosor/qP6RpA5lIp0oj6r7APBJqX0ehuDg9sTx
	 YP02IPQNT1icEsztQkOGuuZzncts/hLP8vj+ftex0Hv3ez6cCjWq973Y3dPhxVbRx15Yl
	 ZhITSaRywST71uFFzHdNoItjvdR4GcpLNTKwUye8kkUVKL6apJMz+5fPnwvV2KbBgwo/c
	 RIq0BMCMvhakyt7AL+COD5+2NTOo85juAthc8+rQp1D3JMu5L4Rjt2ARIMEsSkEXMxn76
	 PX+esnz8mPYMY/ZkcM+hJWIRfMcmDONpNRnJfJ76n5MYogQb2XiA9PKVf/RAjMW6BZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4Avc+sTpAvITn8tvFDLpyq/WRXcoXa74D7F5mNDMS3I=;
	b=eqe88SUDD229xsobOPQ/RCYy7u8/JBgNCh09TfkXUkSYoP8Cuu5WxbYQ4jyPEaBsFPJO
	 L/Or0DhV9G2q1Cesj5RqCw95F6sQILBigVut6OddV6KW1+oozF64yshjv8H8p9YCPWPIm
	 nEw5w+Tb3bPILsouO5RKG4QDPCTGwq02K42lZN/0l8nX79R05sWZM4hjlgnCK+qQ9ksL2
	 t5OHL2a4uzJJU6ASx7i0KjMsRgiq3h3SJWEJFIXWBFCxlZLVcCoa9AzTvkU2+IInssnHk
	 4mHz2jvUqfs4ERi4iO6ClVUSlDw7u5X64uGj+DupZl00qdhyBtPG7S0oBJyCPuVSxpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqn0kUaS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="M/GUgSyl";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BCE606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47BCE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqn0kUaS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M/GUgSyl
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV91Z3863690
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Avc+sTpAvITn8tvFDLpyq/WRXcoXa74D7F5mNDMS3I=; b=dqn0kUaSSTo3y8pd
	o2AKQM9P8Ie52h+H8EoQescJqbHOWMLGQikInVhQLOoOhNa4+3N7ncCsaZOlZg4k
	7wUA3nrc6FVrxvf+i1m8+66lStpPC8CRFKR1JZBcml/F3VUS56A7f/11zwPSRWAY
	RQitCzMu37BgfoWn0/lWbdxKdRJkQP74qrYyJvsXzgqbzpB5O5ocoRagzbrDKyaf
	v4DY+DJ6lYWkajnB6GkDd0BDHNHLWGgDGZQHmYoYTiM5uPQZZ7XXdOpJLfPuHAmx
	71nibQIrw60kqn/AFbtGqfGTUUsGFcd8LWo1eOM7dOWGftcM0+3Xe1tc6ds7oVrr
	cJYcxg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rhyxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:29:14 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5edfa7703ffso325155e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795706953; x=1796311753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Avc+sTpAvITn8tvFDLpyq/WRXcoXa74D7F5mNDMS3I=;
        b=M/GUgSylRCWxD5mNp5G1i66XNGjIhbXUwCBrTh15lLw4RL/DwJ1K8Pj4oFYx5q8aNM
         lyG90mOBr05zvm4ZtkNdhIA5xnMVuPR5Hm14aQP3SG3jxKjFzf7yEAV/VZHLRZ4TDY59
         wQDgl/xCFcYiKFF7n7vfxYshrSZd3PVs7VaaR0XEd29U5sxYSNZo9RGa+5S2tr/65OLQ
         V55hDEnSqd0voK0JhN4LsYELqo+1FdFfPyI7atKvV8clDvdMQhrZClzTNjtc3ApVGoq+
         Sez+AoZmOri0emrw3K0BQCWKM44/0WUU5pv31qQd03dk4HgQizN4HotwKacFkoMtAb62
         IfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706953; x=1796311753;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Avc+sTpAvITn8tvFDLpyq/WRXcoXa74D7F5mNDMS3I=;
        b=NgiUP54b6mZxjlcdAQH3OHskBEwNoFPOmT8RmB78PDatXLXo+mnFU0Em3493qQy4Vl
         /knuS6XDydG9KybLcvZkJGn+ez8IzrA6TTEh8lSJmYWrOtK8Rwjcqb7wXK+Le+zEOvlF
         54I1/wyCJin6JzaRVazIJdVXjhNPTFlQa1fqeVrRmsr1wqn/TAYWqZ0PMio8EgyTtPV3
         uZSF3vDkUBKowTrlIapFjNdweSnJ53uzN9cpZtatzvTGNiE9XJY5pn/y0f5c/JGNDPed
         ie/RHKoeGYZqRIQYbWURWCKj0Py9XyNRtNC+EP+5FEynrKP7QGeLjY/i6FeZzxDjjc0Y
         8N9g==
X-Forwarded-Encrypted: i=1; AL+hErH9p5KFnhOvJKwdLqfhamNxjQRKo0DKEVbZUWv2GtivPfAsmL4FkWdPPQuUjSEN7rlpiSgGX0Xv3MZntMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kocrDndpsiDW5QyQeNAlaNOgP5wP42GpvfelT/mnKlpMccDys
	blGz2xds2cHugt6x155E/rZ3Sj9mw0JSPO2k80sJ7bTwkIL92RJcKsDhpkwPKVLlx9vWBfWUSyf
	Hp/mgPrRzHJLKb0fTio4hsv7xWsONbZiBE+YQgmm8RmkrMLbqGIh3R8KDoT2gO5Lgb5Q=
X-Gm-Gg: AZFdTZcBQmfjaeWfcBM1BSp37tzRtlKvsAr1qrk3hM7x9ni5hmUC00JjtcHac7XoAeA
	k7gchpkIDppc/Lg/Ip/mZNhOGelNHuAFUToNBbspc+j2p/P7IwvXNDZIN/IK+4oKPOCmH/JnO22
	WJjXbM2y6Xqe1tIG0RFXMhSoI5esR9WZRHV0O1YqtPEOvtbJVOe3LtZuIxwnWLCQIk2N3e5KLkr
	Mx1YxmuXZfYgJSP7m9aBriPjn2By2u+BjXTRCfyvGfGOXYXBYDwApZcad0gZOmgR7gi8MJhiabo
	yMGeOixPzblC2QyZekJbJmOxEUNnZKd/S9aVsrU34vqO/63AU7+X+MkCu4wnZXJ3deltlZBPcDu
	lxtSPLLrmwXw3Rx7QDBxA7uo43A3rUjDZvCV52cRHNPuFnmP4UKddn0WBTJq1wdvRlvdx06Q=
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr13671372e0c.0.1795706953482;
        Thu, 26 Nov 2026 07:29:13 -0800 (PST)
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr13671332e0c.0.1795706953035;
        Thu, 26 Nov 2026 07:29:13 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b01e242sm739907166b.82.2026.11.26.07.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:29:12 -0800 (PST)
Message-ID: <6962c4ef-ad14-4984-9df4-4624c4bb50ae@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:29:08 +0100
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
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <70651641-b264-43cc-a745-178ef2b02680@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MCBTYWx0ZWRfX7A3EDaeYLRMQ
 TL/Pr51NI2+DBKxJSM1XV+3p1CnpJqI8SEIafQpU+pE72dL8SLeicA3BUxVZNWVtA1BLr0Z3VTp
 P9GRebdxLDkakpkk35v4JjoTwAZJQAiMtcMi+0P6jmlF/E6bXpt17mo6+mVoleAlYe/AwnA8wGZ
 o8doBt5Qs9MGfDtQdxXwzBoPKIJQNcnLVcukV29lO0FfvSlFX3nTctmrxzT/LL2uYETMdwVWYG2
 nbf/anQ5m45kleQvBxG79PuShG3RKIGzBrYfMl5Z53N8khg2KZNDFHVwxBBKEzP6n/D2h/7ug27
 o9EdqON8xv2N9v0AYb+nCIXGVpW4W9N+88TFe69b4knZShtnyynp+x6j/QmqK15aEPrhCkefKLs
 a1BSNQM5SMuMNdUWWnjZuTc+l3RHYySYVukGRtRnZyRTj5qTIjJCg7N5CHhhy19wAQpf1kbeAUE
 XuayjwC0HPRPk6LA7oQ==
X-Proofpoint-GUID: gbzJxn8DVsSjj52qanLE73mlLIf7hrXE
X-Proofpoint-ORIG-GUID: gbzJxn8DVsSjj52qanLE73mlLIf7hrXE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MCBTYWx0ZWRfX/zZBRNSsyTCZ
 xK8xIRk6ZdmO88vQ8QD9PgiLXSwqZ3x0joWtRmkjJHILjmvBDuCtpUtwzmJ5gOVPT6Tu0U2wiGD
 9JCikmeLllSmx2Nuwl9SeVBHKGEV4IE=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b08504a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Ljcxbz6TTgZqL_1UImsA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260060

On 11/26/26 3:53 PM, Akhil P Oommen wrote:
> 
> 
> On 11/26/2026 8:17 PM, Konrad Dybcio wrote:
>> On 11/18/26 12:00 AM, Akhil P Oommen wrote:
>>> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
>>>
>>> Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
>>> the A7xx Gen3 family. It is derived from A750 and shares the same
>>> IP-level configuration: protected registers, pwrup/IFPC register lists,
>>> GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
>>> record size. The differences visible to the KMD are the chip id
>>> (0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
>>> firmware.
>>
>> [...]
>>
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -651,6 +651,9 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>>>  	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
>>>  		return;
>>>  
>>> +	if (adreno_is_a753(adreno_gpu))
>>> +		state = false;
>>
>> Is that intended?
> 
> yes. It is mentioned in the commit text.

Right, it says 'it's not working at the moment' - are we going to
have a moment where it works?

Konrad
