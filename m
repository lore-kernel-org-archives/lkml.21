Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041007;
	b=o5K4tCpoj1Y0j1XTI2wbDyG5K3UamSZBTdAXCBnf8oosCx+MXb9j5/UXN1KHKRBDU9qp
	 GayV++UXZ+WjKAtpEsIPp1G2heC1d2YHuqVl0ddy/ukgij3Em3Zq0T7T/cdFfteyGQlAc
	 ccu6aJm0T0BcCbupNIHyALRbkb2Y/wUxuHHlcP9wt3jHQV91YcniEMdD4oRbd/cTboyX9
	 CCQplJQvl1ihudTLydUm2ibwp8wkN/QoUgFy2nXtZcWLVrIy4ip/yZ+xLu5L+XFLpV1r4
	 LAKFNxcLQmQFlSn/H4SpNoQ6pOk9hZ3LTvGoXM1yH27+wK1DIKb20fiCy5FVFEFEUeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mwG2VB2Wght2+kRDBqQxxN0X/372ypCy9eDDgyMvCTo=;
	b=1l3APBBWm0GURb1XOmbyn1ZEBqR8M+KRe2PpmMGhdSVxSN+tuXgjqkg0D4HugS6vXOEU
	 g6PE4v6nd8M2GUA062466ctvZhKDbS9tSfV5hWANedqxNoZm9XZEaac0bN4unTBlVKnTf
	 3/B1Qr0xfRaCgyNDtbuJXAk+GdKk/GJqhJ+n8/NJwVuHEr7Qp7G7xr+fquNsWi5CI/17c
	 cEnTg+sz32McrMgMyN8+WnMa4ThbhnIL7ThzoxdfE1uxPTAPWAzREhAW28/Q029jIninc
	 YbXX+BPUxMGjJHjAt0diCGeSBLnZ+DN5/T6dFxATHdHsL7hTo4hvzCpIjMIH6Mxvwgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfyK9ayF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etK5QvD2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EE5606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2EE5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfyK9ayF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etK5QvD2
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILDARK273862
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mwG2VB2Wght2+kRDBqQxxN0X/372ypCy9eDDgyMvCTo=; b=MfyK9ayFDB4tVk9F
	9aV70tTVs37YAqlLn/b9MWH2GPEFsbk4uPIlcM85RxFQbMSiUvlZsYwLdQNOOJ+C
	ZAhUie0BZqi8vFwgX6Aw/fsMNGCTI1DC5ZVN6j/mjIRX7fymvHXpwgqjfMwHkZOf
	r1OovTlzgZ/lnULD9RV3JFEAePu+RLOHUfYg4EJ8KpL81nLoI5aMDRj1vkMYjckH
	XENBMAATbeST5eu+UkvxoGTh8ow8zjYJDp6POjaFLMfzxNQNK+BeQXXbw6XjG9mp
	1H9d6+O8KyRZwvirndwIZJSrghHR6aKsRaeFFyD+XZ9QDd9Xr0Zrhdmldaq77ZCD
	LgtOLQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpca2gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:30:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1927182eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795041005; x=1795645805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwG2VB2Wght2+kRDBqQxxN0X/372ypCy9eDDgyMvCTo=;
        b=etK5QvD2ikQUkhNM9NX8Z3CtQ1MDWiTNqoo7Ht9+F5s2IW+SPIOWWabXXOilmhtD1l
         62SI1oWUldMWLVg3k9CFybeeRrjeoLa71rJX7Zp7LKvVwquSRzz7b0Whjw7bBs/lLZTi
         decTLdBzzQmxvwtFhgyOugVjmvol1LkWKNM4tXQTEIFvXnJZPQGl0Pa2gjidRKMSP69K
         2c+BHdNWmQyk6s/Wtik4rtV5E4cG/hnyZHcqxhWqNhlkWs4OrpBEZyk3RofUB5n9RpoQ
         Knuqbut0f0ISR2vQku4Fz1DOzII8vnkaBmzqsIjL2buaUhZK2pPxIAxLf4vdT06y8+sc
         2ZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041005; x=1795645805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwG2VB2Wght2+kRDBqQxxN0X/372ypCy9eDDgyMvCTo=;
        b=E/OvXUtNQk18CUBNzWiMTInaAEI2RaE0aPQiL6KOINQ3GUn3UI4stg5f4h0tLVf9OC
         QjxlYd4iucgbcwoe1bf+GtY9gc7/gXtNGoi/1R6dmbJm1Bv+7SAvyqo85MeHb0Gd7QdL
         kXt0QRPmD8kiqo1kfU3k6WVW0tqdNLpuPrOKDwvTJpMrsTpKm4aNT4YT8+Mo08qzRBYm
         D87WACgNoQIFicz/gW5jsazZNTMDS7AJPADoWe8bytszz+3VNM5JRsJfEsRERQSNeuYG
         rO4l9PXyDq8zgNQOJHEamNDdr5lHwgIe1uaVShJyrHkqIwZ3wBwVyNEqVz241lnqllo2
         yHfg==
X-Forwarded-Encrypted: i=1; AL+hErH5MFqQqXjKdtoYX2gK6GTwrbUcmyJYQhcEvjUVBlXL2EOspFgHHnO3MYwg0t38SAzjYfNLXCijcbSOigg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GVGDkLf5EdLneKCnrv28K3oqW1WXFm6dMiZREzV5S3+eLyOc1
	fZBlgEfCIUPvvISP2TzopH/Zzdr0Uzd3K50Vq6WI2aOt/ru4AjDTJgBEzm/QC3BhLlB4Tls7Hb+
	GX5FIGCiOHyamW5UmOVC2sexh7lFppxPWXsn62/cuHVygUzKepXj1ukGwAZfirvv50UU=
X-Gm-Gg: AZFdTZf05fCCXhqUJe2yknGDaMSRIUptaeJz9k2MGLTXFhdBpTCKdkIXRz4F6G5BmN0
	Fa+RwI0ZDysIyiaB8xg/pgQn87DAw075q8NFQj0rGC5taez2gHdLBWqdUNChojF4khoxuNs3BtQ
	VZEgmtponbXr71E4ajGztMliXdS8EEY43d8qPL5g7DSEXOKYDeB8Tf8uchV0+3QJs37JlpmOW/5
	u+BwkObuI6WrHnMJ0lFc4oi5r2ZA4anIVBO6iONbGnjvGGC4o9HAJY0UtlwYLylCfqWcYisq+so
	fr97xEUmkk5L11UrsxA4UWV/lUzoTR0+JaYh7S0nufdFBq3J3O9VIULS31VDmeiKWQKpc4lzYGO
	b1YQGfXs0/aOCZgd/Olx7tuJjMQtK9lRg6Gcp4vkA8u1zjFjAG4Yh0bCD6DosR1cJkwXlt7bV0h
	FElZNzHq3JMn44lPwn+4mU
X-Received: by 2002:a05:7300:824a:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-3827da13cdemr3842403eec.4.1795041005015;
        Wed, 18 Nov 2026 14:30:05 -0800 (PST)
X-Received: by 2002:a05:7300:824a:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-3827da13cdemr3842374eec.4.1795041004286;
        Wed, 18 Nov 2026 14:30:04 -0800 (PST)
Received: from [10.73.198.203] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm11315249eec.28.2026.11.18.14.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 14:30:03 -0800 (PST)
Message-ID: <82a57df7-a3c5-4986-a724-44f00b22a532@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 14:30:03 -0800
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
Subject: Re: [PATCH v6 0/4] Add larger page size support for USB audio offload
 path
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
 <a38e874c-4685-4892-81b4-a6aeeaaeddb4@oss.qualcomm.com>
 <54beec96-2221-4109-ab7a-74502969b369@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <54beec96-2221-4109-ab7a-74502969b369@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afe26ed cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=smeftMHU5e7__JqdOnoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA4MiBTYWx0ZWRfX2fEjUbKoEY2D
 cd9mzUx65pNFfq4cvwmQGixvT0GCIFH17m//3ki8JlKxUeuB91vf0qbfuDpehDiO8QgkhlrRiR3
 +9zz30khY8yeEt2S2aZsH+w/USlxKUfQSe8x2Xz5HEhtBxAV8gfoNoeTLrA2GlrNmFlpGQSKAtx
 ubomsU1l1AmBGYPsbVkq/STneg2VtAh5N4u5A6R9hIwI5lY85ryC+y1dwsXVLGyrC2sj1KW2Z3G
 WKNFfS6gzELtH95HQxbFaAH9cF6gtXRO5ded5zo3JHf85EhRz83nmPLidDp/ezHjdpT5QpBMUTt
 goSyFlvzV5p3FJ9mUql0zU48/M1a81Rx5vefeNdcjVnOBjQwRJwfktTI/aa+vNCk0XY+Mo0GMs7
 yNY4nOrQjL78Bf7NyTIsfS6iu8ol5RgaZBR4GTydWhvAe1MFLDHLzjSmxxiuijJZav10CbfF9si
 w1/U8HJNmwEKqnjmUtw==
X-Proofpoint-ORIG-GUID: pkcd-tL0TjuqmRYMhf0ljC1r6oGvF1iF
X-Proofpoint-GUID: pkcd-tL0TjuqmRYMhf0ljC1r6oGvF1iF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA4MiBTYWx0ZWRfX7IhmVF8FZani
 6WAsf7YKgk95GI66EMRPOe/dQ5rY92fI+nFzW++NhS5yOmUjxl7dDL20gHfi96P4acLt7ovvpH6
 dwtKvpDxhIrg47CFUsEYN6D/LlokKaA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180082



On 11/17/2026 1:59 AM, Mathias Nyman wrote:
> Hi
> 
>>>
>>
>> Hi Mathias,
>>
>> Was wondering if this design looked a bit more acceptable?  Was able to 
>> figure out a way to achieve what you had suggested earlier mitigating the 
>> dma free problem I mentioned in my previous email.  If there are any 
>> issues w/ this please let me know.
>>
>> Thanks
>> Wesley Cheng
> 
> Big picture looks good
> I got stuck on the "no_pool_rings[EP_CTX_PER_DEV]" solution in [PATCH v6 2/4].
> 
> It reveals and reminds me of how poorly designed existing xhci_free_dev() is.
> 
> I tried to quickly fix that fist by 'unlinking' vdev from xhci->devs[]
> inside the lock, preventing it from being dereferenced based on slot_id
> somewhere else, and then free it without the lock.
> 
> I ended up with a huge mess that rewrites vdev free/allocation,
> slot enable/disable, xhci_discover_or_reset_device() and xhci_resume().
> 
> Seems like best solution for now is to add "no_pool_rings[]" to support the
> larger page size, and then later rework the vdev allocation/free and
> slot enabling/disabling. I'll take a look at the details of the series.
> 
> I also have another sideband change attempting to fix the use-after-free
> stale vdev pointer in sideband. It basically swaps vdev to udev.
> I'll post it on the list. Let me know your thoughts on it.
> 
Sure, I assume you're talking about:
https://lore.kernel.org/all/20261118125109.1429538-1-mathias.nyman@linux.intel.com/

If so, let me look it over, pull it into my branch and test it out if it 
looks good.  I wasn't able to reliably reproduce the issue that Lianqin 
initially reported, so I'll see if I can figure out a way to exercise that 
call path.

Thanks
Wesley Cheng
