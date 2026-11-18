Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011966;
	b=LlesMmsRBPkt8ly0wbmevWeNEwjPErae2MH50GXlWdFyNlVA4doNM05ieO2QNnhjGu1L
	 nop7Jh22ipbY/mgQosnNuzwFFqNHd2d7ZPyZMky58z8akXc9LIIbj29pec+SU6JNnGWYm
	 BLCCM102kOQXeWrjYaGus3773kQIU7aOT3o++OvuFkm/ped2HN28Hbcp47G9C3qOwh8zU
	 yt62haodB0LkxbUjd2iUxDjGeB8v9/2IxqwnTyYhCQPaF7OMQBZTjE7mgrQFnkhCn4rmC
	 DZ74JjEszvcTrsSC4texItMy/vLSYtktiXbUvGRbMjAGZKPcDSe5GNyF6JT9daqA9GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011966;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+owigatxjGNCKv0xhFAp0gByhwCLe8rROdSD+hd5aus=;
	b=nc02TDDwyc9hWeYuRDifCXyjgFtgvby7h6woU8f7e8fNXDcb3iWCH9ZgV5GJXisHU0P9
	 eRkRnNFGSp66Aa2ZQJdi0UrHankysVh7Y9b36gAnWN23cwhuVXAdMRo5QuwsuXARyq3UU
	 j3F2w5LaGUiXi/oA/WdhHVSOD1vYj++l8jWwhg9/rrMerOXXn1JHKe2kQSEQp0NECuE+0
	 Hray6Shz1w5rXROqYTRzIaGjIXtdlPsvZ5ZwTqmVh+HdNlvwukwC09r5v2vtGj3vh2DNE
	 zr7LrJv4pNjA6yWxDLO/Tt1p/r1T/vK3NOe8s5xEbyrvXh2lsVrXlWVk6m03QQnudbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KTsfrBBh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hCL6Vtxx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DA360A260D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20DA360A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KTsfrBBh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hCL6Vtxx
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQBFB376582
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+owigatxjGNCKv0xhFAp0gByhwCLe8rROdSD+hd5aus=; b=KTsfrBBhNe3D2vp9
	anrHC2MV7K319UyswAh1wq2WjROTNjPzB2OjJR8IIKbQHnyDNri74CwMThL22IIS
	3P/k0MnKIN4G3D2AVMG+V1KfnuH1Ij37wzjoAMtC4ODs+KUtRAsu9HFepUn1Gs+O
	cT1Khx/HBt8HEmC+fZAxwGpqsFHxYiHDRttNKlceXWYjglJurucZSB3sZzuzxlly
	92u9Q/2xnQb6RYOfS/fPCyxkd4BLvux2pXpIZtEfW+6jg4yVtQVdF9huUarRcR48
	yMxHTxRg5bYcqCKlMGqA46sD4KCn4OAR6sL6LnZ9nlMslxl+aywr5LAaVH3yWEyT
	f9lOCw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9kbmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:26:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efdc35736bso15000005ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795011964; x=1795616764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+owigatxjGNCKv0xhFAp0gByhwCLe8rROdSD+hd5aus=;
        b=hCL6VtxxqflRuPrUDtCLdy8ie0BpqGgNRRx/y6m2qr5jANC1BleeduDOv1BWqSef2G
         pD86M89hWvuhN7ijrKBIHMujXAz2o0wG+c/YKAN8Ulv6qQ+CcJbAPaPmrcIoz1zOPAeI
         l6sc8uC6iE2QFhdxahea78j4xNAP0lEmA1/RdeSKx9iRgI4k7JTmAVGl0BJjXcLC9wgM
         0mD+Y1bmobxn9nKSCxsoFjSJ+1SF5yhMhB8qRp0vgl4t2P1UzssGoCkt7sKGbf0OO4s+
         Njp4GD1X61ZI6go2grpQFBPHAzB9pBWrJkJgOEnM/HIdZhnOwV2QzPjamvuZdn3tq4pQ
         48Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011964; x=1795616764;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+owigatxjGNCKv0xhFAp0gByhwCLe8rROdSD+hd5aus=;
        b=kN/Aptx41mzgw3+nXDzGedIoCnAW0QLPqgW5PTnM2AIaa9oZDLVvivlcQ3l9YE4jhN
         4Tbzv7/b4GCKK/ll+vfuJUHvYnBZG8KfWMUDh9tCzNT9UqVBch8jOg18Q4hFqOI1H5fR
         4z4+JIlpRtbnEq6qd3BaFQXdcSZAAJ7GUVJ94HJs4V20bka5qXbqIwzFO72BcE1g95aw
         TlrJQQnSi5lQFTkt87Ej5LWskraBMmLOAU4gp1f9lUhFl1MUbhOF735lTt60xqQIaAEP
         Q1DwkLw91qSIffntPLMjazUR5vBIMyr6N2jaFAkfY3Z2hmI+oRwMwDhEMoH1T+A7573O
         YgwQ==
X-Forwarded-Encrypted: i=1; AL+hErH7ROKAtp2jneye19o8nKh+6po/nm2p7jZfjqi744Y63p7/iZNFEWmBZQD9leG77tUPcvdYfCzG6ctYM0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rPlqfX9F8zYS9/YnM/vCHFn79dfSiJvS125P5gBtEeZCceJMS
	N7CidicAIm7Hpg1pG2RY8mhNuXftCYpU1kjs5qPg7864LwiSdWdX/h/0wC1+N0/y8iyVKEXTf6/
	3LSh4w+laQqZe++Q8QcUXUqgF/0tIJv+as8zKCZjisuto0nV3g4GtjjvxyuD+zQlzXQ==
X-Gm-Gg: AZFdTZf+opvkf48jf7n7nuJcp+B4EpSWDES4ezS4ZqaoVEThP9ZATiOkh6Xy4VkjV43
	7eBNrbx2csFGJyW2SrRU+Y0d+zHnw2nEnmFBHf663viqecv6nC1cBn9742qddmEyXkgf2DLIlxs
	wjrdzWiOP05wBIfljxEpcwIMZgRaCXSEN+YZQVyYB+coz++hWMUx/l3n6f5808ti1sDv3vsA1Oc
	JgGTRKx4BDZ/uW7NAizFRAaGM7JhuoodQgoEgiTmO3inufoWQ9+j6WHs7k6XSiWT/cLMzaHvWFr
	DFG0yi6SajNfw5SKeRkhnBVFJtUFGskGcCHzCkJg/GCwOsYr2MVHMNdCzoFagnWNmIHn9+zGxvj
	S6YKboNk9LFq0bIiczfZcrcoTjUmPyxBliM45IdBo3BmVJVxpYQSJT9O0U/kE3O0Y1gC9PmNwzd
	4zfjTR
X-Received: by 2002:a17:90b:1b02:b0:3b0:cc6f:1046 with SMTP id 98e67ed59e1d1-3b3d085245dmr2789004a91.67.1795011963729;
        Wed, 18 Nov 2026 06:26:03 -0800 (PST)
X-Received: by 2002:a17:90b:1b02:b0:3b0:cc6f:1046 with SMTP id 98e67ed59e1d1-3b3d085245dmr2788980a91.67.1795011963060;
        Wed, 18 Nov 2026 06:26:03 -0800 (PST)
Received: from [192.168.0.104] ([49.206.14.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d5570208sm1967171a91.0.2026.11.18.06.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:26:02 -0800 (PST)
Message-ID: <b1e3e26b-ce14-45f1-888a-39297a5c2016@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 19:55:59 +0530
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
Subject: Re: [PATCH wireless-next v4 14/21] wifi: mac80211: add driver_op for
 SMD substate changes
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-14-62e39487f51a@oss.qualcomm.com>
 <9016700a02b45e18e06525b338fcce52a1e341e3.camel@sipsolutions.net>
 <a743c654-14f8-435f-9b83-bccdf2865615@oss.qualcomm.com>
 <13d0d8d00897f425ace949084cc0644d52a0e504.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <13d0d8d00897f425ace949084cc0644d52a0e504.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yBtAFdNjyNiVZXFRtdEqqfG_dPQ1-994
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NyBTYWx0ZWRfXwIPVEn/H/4B0
 WMNO1H0A5wWG8WunIqSg6+Di3SS+NRJaHhMwlh0AJZMppCvhBVuwt3aJaa8dWji9Hpz9RvKdYLi
 kZ+GAAE9J4elkQE+N6cflEDfBfMHC18=
X-Proofpoint-ORIG-GUID: yBtAFdNjyNiVZXFRtdEqqfG_dPQ1-994
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NyBTYWx0ZWRfX8hFFTeyw07tv
 MaAL5FLJf1pEGGB2n/t2hVvMK6ZyrXg60nCmrrp2iJvDmPt7U+3O8WQxzU2M6YwSCIoj94r3jwy
 ND8TNWoPFAiaEwb3BkevNS4BXoEMVqBsdPlOlUsjo3Hk/IjPB7MtbszVN4swHxF2B7LuHDloSgQ
 zFPlh5I8U4d0s3oQixY5aQhrehRStPAc4fkM2kewdgsZ8wXVdW7hyigEiL0n5VSrIRcq8qLVePG
 Kfgv/m/xZ1azFvHdL6Ua+k4MCDXMxTUlQffQ6c2uABHkdIHMwVP53kRMDRj+XRVrKwNWcLHQo2c
 vVtdNTWJ2YRMIHufawYlPMrFefKX4vFbZxTJynvx89bATjvRE0ODfL4jqG/RWqi+leE95FLS4WU
 lUesRYZkyUKwCWNvpcfnGzHwVCCySsyG/TAp01CqNd9VSiFb9IS0euqByVO/AORaNEM4JNAYgT2
 vDVsvkFfe4jsRfB25Ew==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afdb57c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=S4TnAKnbd+bQPtf57r7XhQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gP2kQiXdmwLUjKOqSZQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180057



On 11/16/2026 05:02 pm, Johannes Berg wrote:
> On Sat, 2026-11-14 at 00:50 +0530, Pooventhiran G wrote:
>>
>>>> +void sta_info_reset_smd_state(struct sta_info *sta, bool notify)
>>>> +{
>>>> +	if (sta->smd_state == IEEE80211_STA_SMD_NONE)
>>>> +		return;
>>>> +
>>>> +	/* DRAIN -> NONE, EXEC -> NONE or PREP -> NONE */
>>>> +	WARN_ON_ONCE(sta_info_move_smd_state(sta, IEEE80211_STA_SMD_NONE,
>>>> +					     notify));
>>>
>>> How is that even useful? If we're talking about a sub-state while in
>>> state 4, then surely moving out of state 4 simply invalidates that, why
>>> bother?
>>>
>>
>> True, thought I could clean up the roam states before that exact invalidation
>> happens. I will remove it from state 4->3 transition.
>>
>>>> +	clear_sta_flag(sta, WLAN_STA_SMD_PREP_TARGET);
>>>> +	clear_sta_flag(sta, WLAN_STA_SMD_EXEC_CURRENT);
>>>> +	clear_sta_flag(sta, WLAN_STA_SMD_DL_DRAIN);
>>>
>>> Understand that you need to clear the stale flags, but for the driver
>>> that just seems strange?
>>>
>>
>> So, this is also called from state 4->3 transition so clearing the stale flags
>> seems necessary. For the drv_sta_smd_state op as well, if we don't clear the
>> state in mac80211, there will be inconsistency between driver and mac80211.
> 
> Wait, which way is it then? Anyway I'm not sure I see a lot of value in
> moving the driver down when the whole state 4 is left later?
> 
>>>> +	case IEEE80211_STA_SMD_EXEC:
>>>> +	case IEEE80211_STA_SMD_DRAIN:
>>>> +		err = drv_sta_smd_state(local, sta->sdata, &sta->sta,
>>>> +					IEEE80211_STA_SMD_NONE,
>>>> +					IEEE80211_STA_SMD_EXEC);
>>>> +		if (err)
>>>> +			goto rollback;
>>>> +
>>>> +		if (new_ss == IEEE80211_STA_SMD_DRAIN)
>>>> +			err = drv_sta_smd_state(local, sta->sdata, &sta->sta,
>>>> +						IEEE80211_STA_SMD_EXEC,
>>>> +						IEEE80211_STA_SMD_DRAIN);
>>>> +		break;
>>>
>>> you do realize "fallthrough" exists?
>>>
>>
>> I am afraid I am not able to understand how fallthrough helps here. 
> 
> My bad, sorry! I mixed up the order of operations.
> 

Ah, okay :)

>>>> +	/* if EXEC -> DRAIN failed in the driver, notify EXEC -> NONE */
>>>> +	WARN_ON_ONCE(drv_sta_smd_state(local, sta->sdata, &sta->sta,
>>>> +				       IEEE80211_STA_SMD_EXEC,
>>>> +				       IEEE80211_STA_SMD_NONE));
>>>
>>> I'm not a fan of sticking whole blocks of code into a WARN, but I'm also
>>> not sure this whole "model what should be a one-way sub-state based on
>>> sta_state" was a good idea in this patch.
>>>
>> Could you please kindly clarify "model what should be a one-way sub-state
>> based on sta_state"? Would you prefer if the driver was able to directly
>> update the state as well?
> 
> Ah, no, I was just mostly thinking about the above discussion, and also
> the whole substates.
> 
> For station _state_ I think it makes sense (mostly) to go have the
> "ladder" of states (notexist <-> none <-> auth <-> assoc <-> authorized)
> and clearly modelled it based on that.
> 
> But does that makes sense here? Why even go 4 -> 4b -> 4c as a substate
> etc. Wouldn't it be a lot simpler to just say "this is the new substate"
> deal with it? There's not a lot of "ladder" going on, the substates
> don't really depend on each other as fundamentally. In fact, for 4a vs.
> b/c they're not even a ladder anyway since that's completely different
> use cases.
> 

Got it. Instead of a "transition", I will change this to just a substate
notification.

> johannes

