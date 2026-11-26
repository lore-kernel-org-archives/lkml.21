Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704809;
	b=CLK2FWSg2e7IOlKnW4YUPVOG6xKoN6HRqaAu5vDDgqmEoDKyIgT8VNEX6sNTF2cMi79d
	 FCUg1YXRDpxLmbx30oEDAPn8bUjX5Udt0v/76UujT/0J/2P8IlCV2pICdG2wMPppokePI
	 Mqq12PX8o5y7I9vVJmQbAsaJEHsb/zexz+Bgh0EXBpYd4RvMgeZ5nFhmWjX+B1YNzZy/E
	 g2eZdxc0XogR9zr/WxAxy3a9oZQRUPIsteUY8Py3geXv2WoP+hSJLJWcsbyo4f4NIF6O6
	 /1Y0STHNofx5FF0pRJVwRacUOLYrZnjCqmLDIb4MVgQLH36VbNHScSxjrnahyx+ktRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704809;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XQNAN6Vy4siPlthRoQH9jet8l2I4+/EnJVydI4yjk1s=;
	b=n4QaIcTkyY+1WzpE67437+9CSS7dw6Z45/MHMQ6vJznbgEKCY/QMcNLH9cYTXrlTb0bU
	 PUCAHEG0M8fREnTyVPMM3/MeHrQdsw8RQTh/QoSeZ0blo988O0UYVEU5TeGa4fgYBLSwP
	 omKYuVa7eGZxiiYF6jPtx6Mc4DlwSWBNkqm70QSZvUWM97DSPYl55tpc1LHfJVyc4qpFq
	 lcsZ5N2l+a2L0CjKt/VZMerzCAAa0k5kApmBAwAvd/a9rujfOOoOkKx3lCeICzv0Gck9p
	 gTDQKD552KNthhSrSy4a493UQ8iEjDab2A9zaeBEvMc5PUo7iv+j+ED52xLDQ3ZXjCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eur+LAM4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Adqj5ofJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D095E606A692
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D095E606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eur+LAM4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Adqj5ofJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEUmTq2649306
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQNAN6Vy4siPlthRoQH9jet8l2I4+/EnJVydI4yjk1s=; b=eur+LAM4pFbOfhIo
	2uB6AtdRkfgb4csfaXkpGOzp1a1TwKFNiM39Swed5FkWWMFuonAI4JqPsHNhALHo
	wWiOWniIQnfsCzkKggHON/1+EEl5ZX/55r/uE8BnosJhV9e8ZNsY2sxGGwMrk3O9
	aWBnM0Iu28wXw/mHvi8d/on3ezXuOpVXLwY4W5bhXQYhjAgt8peG48y3RO3BEv+r
	h21oEV6PXs9YFK21TR1sm2rp/s4LHVaNLJYTN7jMOvpoOdg8wPO1zQN6Gh2zasMY
	8ppY8rWEchIoDbvZ2hfbRKRtNXYGSWZnaJzxtlf3w4v3I4BIJGGK43QjjKIUe9JY
	ES6nFg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqg34s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:53:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3854627c1c8so9675916eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704807; x=1796309607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQNAN6Vy4siPlthRoQH9jet8l2I4+/EnJVydI4yjk1s=;
        b=Adqj5ofJ3pYVkJYRH3fVXXiB1VYmwIYxcozwCGw48Yew08Xz8N2KaWNqO407I3f/pb
         0mLoFQkVrv6z/V2bS5/1HKLerhSnW6Zu7bx/rkoE1pf2NQDWsr8x1znvUSEcnvquVyPa
         8q+IikalaKa1R8Pb2vURCOpXs+pIMCEawQCIDuUuK/konpFwwuqhr89PSzL6qgVSI2h5
         W5OzAUfpZWy2EF7WEXmcCpZmdjLtRnie1AnDpYAgE3wP5G+Qm2OYU866wah9UwXWReZC
         r6g/VAK8Mvk8O6QkCS4NGg9JdNnG615wSl2BMGBzPlFtcJftkyBTDP9Eg2VEU2cxsX8w
         +Wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704807; x=1796309607;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XQNAN6Vy4siPlthRoQH9jet8l2I4+/EnJVydI4yjk1s=;
        b=HwUS2CqtTqa1kdsfAben/Qvg1H3npg5nBRjT0/85WrxxsZIA36NllOzX8016bVk6RX
         Ru2AwqQyjw+nIdwL2C9sw74pO3qdg4ZvdsBL4sBk1vEDxF0udI5kN7u95d0H4Koqog9c
         zOJKpFuHEAIUvNdu1LhmHUiBezrJx7WBW4kshP1vWrMFtCTnIcCpwjQp6/sunO2VKaMp
         fGFcHlWYLhwwyXt824Z4Yrb5HO2L4l7eRTDQETclc1qzn5UrC7j513VkKB3mNhEanEQ0
         i6Cv4rUFms+8PiYM4/+hj5LTg3sgGGbBgKhDVvv7Wkv25GUzDpS+CI5WkLqDqXLraiMB
         1Tcg==
X-Forwarded-Encrypted: i=1; AL+hErFVkFP3zNtpEOeVyQYhT8iADLGJO2h59Rok75iRldqwwmJ1B+eLG1Zs1skFB/T6wMxjFqAY90gNg6MGgNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KHy38CHZdEnJx5HSxbqEd6F6K5fiOHyNOLMWbNu5LGM5QL8vq
	DYOelUqKurtrDXw19cTQ+9N4Nc5eH7FVi9lVHZFR9fvfdnlkPCT0kf1bA3+AF+Ox0yD7TJ0kDEy
	Tj5ydYLa/cVdwNbUXA4v2mQ1BpqbHB/HwYFBs0S7tvnsoa45So1bOScfbBkpNu6m7HEY=
X-Gm-Gg: AZFdTZd1VNKT5lcKkwBQinRYPcMe2Go1yu1T0rHc15zkYZC6m3xlOwsMDE9c5MXQRRG
	wNiesMd3nNOVThFXwqHgAvEXq2KHmhKRJivZU0GGSXvBx4HoSF8lW7WRwlegQ5NXO+Gk4KHO057
	U+kXOFGwcByg93ev4wChTzPBdT2Z1eiAcbwuEuq1oEVJ6rLgfWtYFaJHEra2fAKrvmyo14DgYob
	BRtBRK/huOOK4Edjqpy+JmOVrsKj7FCMt0D+nGgmnr4rAkEMGJYJnRFPGV+HnmxI5EXJzun2cJd
	P7Nk883dhQB2fadmAqRhU0g17LG7/05lXHhzjtSPNPYYAuqwWIgidd9w97Rh5/lSvUTVzDXhKi8
	DQUCy7W7BkWa3YHMM2I0lAV1gWrKvBfWbQIfLLOjFaMZ4YPvjNowpzj2SWtno+mcgEiPllzpQcw
	==
X-Received: by 2002:a05:7022:906:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1b556904c50mr27737696c88.29.1795704807315;
        Thu, 26 Nov 2026 06:53:27 -0800 (PST)
X-Received: by 2002:a05:7022:906:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1b556904c50mr27737651c88.29.1795704806659;
        Thu, 26 Nov 2026 06:53:26 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm82132907c88.9.2026.11.26.06.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:53:26 -0800 (PST)
Message-ID: <70651641-b264-43cc-a745-178ef2b02680@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 20:23:18 +0530
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
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <a005f8a1-76a2-46ce-b328-2063bc307758@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DP8-ON3aLOGufSXYZVVglgU8_RdMOdFL
X-Proofpoint-ORIG-GUID: DP8-ON3aLOGufSXYZVVglgU8_RdMOdFL
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b0847e8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GMqeiC-AThkal4myrkQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX5nSIEaIAANfV
 xOTor9Y3GyXKT3VruBGrpr2OTf4cJNcc4s9xCMxz210m6jw6EMl+5RQhF/CY4evdOaej+BU8wH0
 nyWGvh7GpfDDa1PLotFEXhC8cjMQbTo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfXytYsAmOmcNAe
 jDWBVyhI+DPTQBLKnCn6nzJEWY/gHsrZqxSwk9obYi6P0n0xR2l9ph11eps8te4pAq+7jecrowO
 FdKZQNMI5qTq4mQGLWaVWp/kob7+uUbk/4N1m3XGNoNMyj3QyHBc+hTRR55Puw4S5l9UMYj87lP
 oKXzRgdyZCmR/y0b0vlPOESiX3BlaBAZlKvSGCTZ1G3OAqQ7DTTHv3wO0JuPl/SsrmkXFXMyOzQ
 l3oXkbUYJhU7e/RdqCvNml2FvVPLRzvQBcinzv7caN24YaJADMs1Exk9LHezfeYW7RZTZ8C094q
 wQqsBc7V/GpiyiecGnlv0DShL2dNaxTv5IHTlMggwQpAGwPNcsUlgbynWJHPSARMzxTXBpvjVid
 wPLHFIn4hV7Ni73VpO8xPP5IohOZkvNkeLNFtHP1EKklLY578JLS2BLw4NqLFyt5GEZNpkYSGmm
 Rnm8YO1CNvBpAhqRWQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058



On 11/26/2026 8:17 PM, Konrad Dybcio wrote:
> On 11/18/26 12:00 AM, Akhil P Oommen wrote:
>> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
>>
>> Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
>> the A7xx Gen3 family. It is derived from A750 and shares the same
>> IP-level configuration: protected registers, pwrup/IFPC register lists,
>> GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
>> record size. The differences visible to the KMD are the chip id
>> (0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
>> firmware.
> 
> [...]
> 
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -651,6 +651,9 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>>  	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
>>  		return;
>>  
>> +	if (adreno_is_a753(adreno_gpu))
>> +		state = false;
> 
> Is that intended?

yes. It is mentioned in the commit text.

-Akhil.

> 
> Konrad

