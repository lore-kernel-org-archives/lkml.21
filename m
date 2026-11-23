Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437285;
	b=2EVEGO/x83Nx8MM5OhRnuCqlyrziwGDLxcpq5YjvJYYcHb/hmtfC8KFOOVMeKcULPfM6
	 KqRzahD4Hcp0awTMovAogYyK+a2EDBa7BrbUei17AOq2xK8SA2SpdHVvYxvmMd21z9Ij1
	 ExCfor2rrWVyOfEGruiQZwNcGVqaP4EcLUQZuDfuKnkb1sfdgt3I8pPeW8YPbEd9RaeNk
	 Jag8C5QTXXljJXQ8XdXe+y6AeISLZ5a48l6Ij4WueAEmXF+JNAd9zHIxV8Xk1adxfbQSA
	 yCLFMe3Gov0o9DzgkADWYLLKZHFtDyJ9e58k3xRktnn3I/wUQKjYqiF36gKLtXSd91Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pLuT8GLe4HwTCpvjQP/m+EwaJaKw1kg2kVuZ2QUXpM0=;
	b=nogHZ0K417567bhx4Cd9dWSbg1lTLnSIcvzsYhN3LS+4JQt4+01WoEBfPf7HP1eyGTO7
	 d+J0R0DI0Vr5K8A/R5Xy+1ywxVxIGnlOEK2OdtTZjxVd6d3iBuzclHyh7/7VqG6rWCvwv
	 LZzmjOQEyQtl8bTG7bzmU9X5Ea/v1pCcKShYDX8EOvfatTs1mnm/9aPIMC40Um673a5Aw
	 KuKoh+2NnBKVtHw0S2LFO8iJLUE4POTPKKv5kE+FaQSaSKKCcA2gkG9unJC51mfzk2D06
	 HymsHuWMNYqftV7l0ILEsQgG2CS8FHt8JwnF/VPKEcOuXWivVT5b538rFm1hnN3fDNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eAlWEAIt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvYIAkT6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF69606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEF69606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eAlWEAIt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvYIAkT6
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANCFwpi301633
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLuT8GLe4HwTCpvjQP/m+EwaJaKw1kg2kVuZ2QUXpM0=; b=eAlWEAItlWqboMBz
	ciU3eY1E/tLoITK5Te7/rhaxnoqWgCcZjMOp7WX82wKy7MBaPcgxEmujxuAVNEMo
	nPUFTP5zeEkMwZb0z96CfZjgvWpjrq8CZUROIvviR8b3jdS5o8+xqNHv/92bTb4Z
	Ieeh9bp/p+Mobxs4G5duNUn8oBNjFv7wJYMzgvLHnZZc30YNioaXnmVaW/Ryhoz9
	U8GEIDX8/smIoUa9xwM5ACaKGUl5QzDevUAtsSsXDgAWC/2ypMvkJC4j3xgw2+3A
	rxnFTAO1U8CAJ+J6vOZ+JNgmBnDUHDNWv67ZstdjJ/ivR7k5z1YqPw4lyiW6xKGf
	XMjcfA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g741ceg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:34:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94960bd17b5so548281285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795437283; x=1796042083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLuT8GLe4HwTCpvjQP/m+EwaJaKw1kg2kVuZ2QUXpM0=;
        b=AvYIAkT6EmvKa84bvblmRoqN2zEXnr5evixmbno3916dFKkFtnZFuECgsbcnpbQGuw
         Wm4IwMIHWiTxZgeCCB7NM2fNakAjRlnALskG0pZgfDNmHqk2YdyskB1oQ7H3PfmxIKKE
         S/RCjLqhv0UvG+TgLNv7MPFc2sADFJjXZVlRgEt90Lx6uo4D4Z37Bs1+i0+mYXPc/ZnE
         YSrnLcNkM/BoHefdmRLVd6EFgS7uiHpi3KpQdpAleLu99qQ1yMbaKhl+SlGkLJ3KFGVI
         pHlj8KT0GIQFqP4PyzpebchhIXyWOajysiVqAVJSHkSl4c0lQRPe+TbgJfzznO334Sa9
         AcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437283; x=1796042083;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLuT8GLe4HwTCpvjQP/m+EwaJaKw1kg2kVuZ2QUXpM0=;
        b=oXcXVxQJtmzcv+Vs+m+3trXyY7tIHQuZJlrT04OmOeFdZ9aZ4lsaMqNXzTmnzpvKsU
         ww+LH0YxrJIMmgCOlJi5jJ7sAHWz0t4pBh4OXGRTME+KzuuKzKETsUsZcv7q6t8vts0C
         kl1x5fliuN4/9Kna/HetafWwZ0GfJD+PN4H3FxkZF44mYDmMxGG1fJHKynuqfWRHKfak
         H9PP3uDbV8MDsiBFsG8H6J82j2a4eG6fy9TX3XR6Xz4dgAay1W2FteRxt3WHbe/NFW7j
         UqMRK7I5moMI0dnOt49o729XHVvLRKVfl1SSEkb3fglxAM6I2mYM0XHaW/nLBZyrmUgN
         jGvA==
X-Forwarded-Encrypted: i=1; AL+hErGfJJy9JutGp5lKunlYEpPu94wOFekRIrZAjnP1QOVXSGp7jcrvHQfT2wS9GVR9q39h5zEolGVY8ZA3/r0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FwuguZjFFXPqz7ipSFYN5FxT6KjCrbggbVLqbc4XB+1NA6Xxh
	+jI/qoXSU5x1LsJIA/XGDeJl0HvhNxokIbEBFjcW+wgeeknML4uWQgDLmokLPS5rOhHuxThMUNH
	72pj1mkHpNy4JON7UBvnvDOEOK9owZPdr+Bf7OOOerqxZIDnlbf9Aqky3nNixSj90ueE=
X-Gm-Gg: AZFdTZfi5PeAnq8CdFgGvDYl/KqG1i6tHA4H6qUjT3rCec7/skMvxzWN8ZM4RqjWdTF
	A0NnzIvBYa079Ni45F/rLMKt4CIA7R6Zdw88O21vzzVEPTOwiA3Ql45JvuqJEcLza84g2E/h9Rg
	PVsSa8KmXM/Rfzziqbs+M3sBJ7PcAaWVEfitoG1FXeOw1n9lJgjU87dCt1k/oOotiMc5X9ZdU1j
	M3xrH9bgBvmUsIDkNLyzUuEyaH8KMw+pm9qKaL32Sn0JC1IGXrzqIZyAf8jtikcLcBHKq8o//vm
	H/cVz0OEXR+sy+Roo/chRVXdg2Tl53u38ebNKSIpt19QV1Bn8PIr4R0ghIQoA7iuhZbamyvR8FK
	I2EQkaZMt8DfXxZ1xqXLHtHHwIruOxxAQpoBPQ3P2TYxkivmRfMJE6ObYWJ+F006WdCCXeCjdV7
	ZA/w==
X-Received: by 2002:a05:620a:6493:b0:940:e34a:aead with SMTP id af79cd13be357-949ba80fa2fmr1754287285a.5.1795437283028;
        Mon, 23 Nov 2026 04:34:43 -0800 (PST)
X-Received: by 2002:a05:620a:6493:b0:940:e34a:aead with SMTP id af79cd13be357-949ba80fa2fmr1754280885a.5.1795437282514;
        Mon, 23 Nov 2026 04:34:42 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm542505485e9.14.2026.11.23.04.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:34:41 -0800 (PST)
Message-ID: <2ce99966-6813-47a6-8d0d-11f3f6f2f2f6@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 12:34:40 +0000
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
Subject: Re: [PATCH v2 2/3] soundwire: qcom: add multi-master support
To: Vinod Koul <vkoul@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, prasad.kumpatla@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261001093806.634862-3-srinivas.kandagatla@oss.qualcomm.com>
 <0ca6ee6a-020a-4705-8323-d524a813d3b5@linux.dev>
 <586046f1-8439-4353-b60d-dab6356de3ba@oss.qualcomm.com>
 <asCxoMbtsSfVcX_9@parshuram>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <asCxoMbtsSfVcX_9@parshuram>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dcexefyp3gB41En6uCKIzBnp672XR062
X-Proofpoint-ORIG-GUID: dcexefyp3gB41En6uCKIzBnp672XR062
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0OSBTYWx0ZWRfX9/dPFpnqzNSL
 8kh6aCsiAEH3a8SXQGIiBWHSX2LOqJvo7qea+30xC/1lqzoqE/PQB9Ps0YpQ3FiCxyjvI74/1i5
 Fo8+UIhBr0jUh+S86V2v9YZhhEfLG1Y=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b0432e3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=TNgizOjfnv4wsRTjD10A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0OSBTYWx0ZWRfX+40pKq6t/DVl
 xylKmCpVrzuM2kym5z/KB9PgLOAKvAQHodcZ9DJDE+IPBHaT6W455xRDcNY2krdFI24DcMjyYYg
 OM/1tlxfRlEOp6vQfvPXFeZsmvK9GoNE2XEHwsO8fIfzEotCT82Io97XwHSz79S/XCNct0J9ax5
 9mLnftJ0Ajm6+x8tzPpZnVeZFUCHNkRQ+QB5sulexESFyyeU4NNpCpj98WAtIZqRtceXtqUyfN9
 s8JZiBivwXaPzVbSaNQdVnimMxxpejfPIHNjqDplvay0WghQ54OYw01BwzM/1g1UCZznXNc4ZJP
 krh1XmqWsWMg/sqb75Fww1kZIXX6z+vJ7+0ltEfS7t3WOsEzLZAHR+0YpyAC6JEflzrHluUJSZJ
 /gJievEWv7xoRH6pZSKpTLPasKjclqoNWz8vl3yuqHdm0Mp1lxZBigG+mFCrswexFXEeCPBB6g6
 tAe8vRdI9+JqX7vUESQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230049

On 10/3/26 8:41 AM, Vinod Koul wrote:
> On 01-10-26, 12:06, Srinivas Kandagatla wrote:
>>
>>
>> On 10/1/26 11:53 AM, Pierre-Louis Bossart wrote:
>>>
>>>> @@ -192,6 +194,13 @@ struct qcom_swrm_ctrl {
>>>>  	const unsigned int *reg_layout;
>>>>  	void __iomem *mmio;
>>>>  	struct reset_control *audio_cgcr;
>>>> +	u8 num_lanes;
>>>> +	bool is_dependent;
>>>> +	struct qcom_swrm_ctrl *peer_ctrl;
>>>> +	u8 peer_first_lane;
>>>> +	u8 num_peer_lanes;
>>>> +	bool is_primary;
>>>> +	u32 peer_dpn_offset;
>>>
>>> nit-pick: do you need both is_dependent and is_primary? One would think
>>> that a single variable would be enough, no?
>> I did try to do that which made the code bit confusing to read.
> 
> I am viewing it that both should be set always for this mode. Do you
> have a case where it wont be the case..?
these are mutually exclusive, will add an enum with in v3 along with
role member.

> 
>>> also without context it's hard to understand if lanes are independent in
>>> terms of transport or not, not sure what 'peer' means in a multi-master
>>> setup with a primary controller and N dependent ones? Code like this
>> For now its one, but Yes, technically we could have more dependent ones,
>> I wanted to keep the patchset simple and right now the only have one
>> peer and i dont know if we have other setups with more dependent
>> controrllers.
> 
> Lets add the logic when we have such scenarios and keep now for one peer.
> Does Qualcomm roadmap envision more controllers?

There is only one dependent per master that is supported as part of this
series, there is no platform that i am aware of would allow me to test
or support the multiple dependents.

I can add a defensive check to not support multiple dependents if that
helps.

We can always extend this as an when we have that usecase which can be
tested.

--srini
> 
