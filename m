Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605839;
	b=U/pUj8Cq8nuW1wKJER+VlHfHyhPNY0RfPTt3Fe9nqF4zwTpAlMG9qT4hRTCvPURBlyqO
	 2zIksG58iQw9NRRqAkfFqNHEN/1UQ7g+i78J+pg9Evpy2VJOcbxDGoyjdmdkEU5475LvW
	 0qcC8CvfSSv2tiRlD4ykzHwgjW33GUm1oevbpHd7z/S2Gz7mYb+7YgBY10+AhneWAkn2d
	 8QXWdvZ86+umdZ/EcqWWTy/dxCXMtpFWmkyhoHYv8/nKw0gN8/K1fS0uJfOYJ5705CV0r
	 V9TZGUODqBgZdfXSvkTvmpI69bKoJm3B1+7KrWvWjOfMqjOAysElUmJDl+m8DGd4RrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZqyE+XGTWOgC2A3mi7+hrJBzXMkQ44TzEigxTeE2xT8=;
	b=IHyRS9h1TMTG28v23JJCnjSciX9BmpWE4CcJ+2Q9M4ZmyYruKxL6C5NFMxr1ZC0RRFSb
	 3zNwaT7OvO2N60AaGvqKQqwTi1kqRc15dQyq7kk4jCZcooyripPpKik09OC6qvggcEzAZ
	 GUHdJMqffOoGMFIo/5QjWueuL7hJWWvmw+tjc29xoEVyOyCeVIc+7q1vh+Fl5YvX0vXQi
	 9ScKmOS0ycnKTUczokJEPrUeVWpG/5r8J2/s1FsAyhLj60ZyR9rKxDVeEDAnHhBCzpemS
	 DUBnSV0dUcoertg4Mth55c7FGXdPohFNU26YzMJ256N3Hz+2P39N925b2hi+BXom0PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nL4ewuhA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ia+BShyl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0F0606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC0F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nL4ewuhA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ia+BShyl
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mAU7115101
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZqyE+XGTWOgC2A3mi7+hrJBzXMkQ44TzEigxTeE2xT8=; b=nL4ewuhAv9oyScHu
	e+ClnbT2414Iwn52QoUbnT9u3D32UAd3+XVCe7sMMh3E9BzW+1yWdSu8tiDiLWmv
	uWG1EbsKKI8BR8XwdHpEXv7Jw5v//8kau8jr070/U8W2A7Y51dGPcg4ZuMVvfpxf
	j4r0mfzBhizlcq3EVt7ZgupJQxCwmORBLrvEDVBnI0PppaiFLcQgGQ4d6eX3VQN8
	1hTKMShfesk98FYX0kkpmQt8YEhW/Cx2ormbw6NjFHpGfWRVAy4rgDZRPp/bMiMV
	/I2HNIkL+EYjujndRxemOMqUajJZrdkWp/CUsYBlctWD6/1IamvhDsurGokb80JQ
	cFzugg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkcjt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:23:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb91e288d7so4432151a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795605837; x=1796210637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqyE+XGTWOgC2A3mi7+hrJBzXMkQ44TzEigxTeE2xT8=;
        b=ia+BShylIKbIPCrYOM1gtCiA7ht57v6tLSiguVvK21cFPrItLN6NulzPhovkB8RLu0
         D6PXlgze7CgGYsCyjjxuzAvMgBZAXnjcxtmU57q/Jlo7cO5ElY9QzIxXqn+zbuyTSqUz
         XLlLGjfmPTrOPTlm7sT4mNUWLCNAPNAbqyaBuFjNjKCKe5UqOa6EFiM9UBod6/CVUXeU
         ToYMcaa0QDZuC/uJIMkCGH+YAd89XP57mm3ZoaaKh6oGU9tcLUl3a7ZszKkO77Z0KU75
         1y17DuKnlWfiwwZvZjJv4j6t81VxEwhLJx1HXrasxrjZaaAjtrmymlF0EhypttiZsmdc
         VA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605837; x=1796210637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqyE+XGTWOgC2A3mi7+hrJBzXMkQ44TzEigxTeE2xT8=;
        b=w+XWjbZj5QJ24f/wXS9x0b/oJsOvUKzmO+3vypNWdMwE9otI+z4wQrfbeUQiCyc3AE
         UyhcHMNtUtc3UzkvyUD3ofoRLpDkEL0Q3WyJnZ+gw5tEiPXnW/SZvpNyVJ0SKIVzMwFQ
         CNMK7qtLvKVl6UDBV3bcAqwEmSUn27nPLFH/u00mPbbGM4CTZh+jgdf/QrUpSpLHQcXA
         5xrtRS4FzFRPX0UG/TClhPloHz4aLnKL+6y7O6nah1puYs0D7UhILxv3eEvEk8Q1Bo1J
         0YUq9lzzo8mN6zpUbUjaiNalJ0e27CbusxpG6TI9DazOrEM/9/d52ahf1JgN873EPev2
         +CMA==
X-Forwarded-Encrypted: i=1; AL+hErGOdOAR29SOqWXIo6LDXpOucTwCP6QfgaBUJqM2WtH+vJD8RhHIgRXSiWi2vt0/C0um7nRPHp1VhUV8wog=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aP2Gu+AORhcL1kN1VAQoVlHgrPlqEDk+xMbxsnGGttT0spV0l
	lDdapinDFFlRyqg6qDLu1QwgB/5B41NeE90oF3v5PlH5IsKWyrA6Di/MYYAmivKNukwkW5hXYAH
	tXVg0W0ToHxL2BYXP0pwz8EaeOHZY5ciC0fnPjTX0e5V7PLK42dizSc1rUhLiupHDM9I=
X-Gm-Gg: AZFdTZdtB99S3cuGUknOZ/yjhHDvFTdVoLPBPHUrQ2GrjqyMy50Jy22Cv7dIx2mNfNw
	0cHMZvL3wFgJjh3GfeVcgVHpZwO8rZWaULZYXVCSsSzKPZP8WR1t6gO+DJs9fi7wWzxc01Bj+zi
	kzc7WwYktFN25RANER3+SGg2TraKK0+yzb0EgI+zmYeg6FBTvey9UMSkveos6d3Ck4XnqzdaW6e
	/ifmeZ1yu1Y3cZD4l2iEKJI/b6NPnvjNShjX+VGAcTJoJegM5RF6LRcJka2u5aIa6dqUUV9LZuI
	IPlSi4f0gSJDqvQHc+m8kyAKGRxOvfE63AiYBBVsTkx2vs4oYmp1wH6HYiDsa9pzNTm0pa6LNcL
	zB1db6HfL13P9q+Mo0sD7jL98R+HyQocF91Q8PjF7+Bx58wjhz6Poa++/rl1JUxcGxbYwHmNey8
	vR/qJftQdwMDXUJr+zdh9aBeB/26Fe7W15sAVHag/X7aXDeet4nO4dcGHfFm7ZrgkM0w==
X-Received: by 2002:a17:90b:388c:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3b41c5585femr17326638a91.0.1795605837196;
        Wed, 25 Nov 2026 03:23:57 -0800 (PST)
X-Received: by 2002:a17:90b:388c:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3b41c5585femr17326617a91.0.1795605836738;
        Wed, 25 Nov 2026 03:23:56 -0800 (PST)
Received: from [10.79.116.36] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm26985027a91.3.2026.11.25.03.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:23:56 -0800 (PST)
Message-ID: <6493f02a-5880-4245-86f4-1e1bf00da017@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:53:50 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add qcom,remote-owned for
 ownership update
To: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Prasad Sodagudi <quic_psodagud@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
 <20261106-egpio_fix-v1-1-569d220a4748@oss.qualcomm.com>
 <20261110-modest-significant-ostrich-8dd408@quoll>
 <CAD++jLkpFWWSV55LkhAa4YfckDvzB6PrHWugX0Mth=cQRYkMDg@mail.gmail.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <CAD++jLkpFWWSV55LkhAa4YfckDvzB6PrHWugX0Mth=cQRYkMDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX/sdTgpgLXdY7
 SrB2DS7/rdwxyFjhzi6BIpen7pe3F9PK++m3JueeMdNrikTS90N/GlpLHv9Wj8IWy5/9Z1l4vuG
 XZLkBipuHLP9yd46En2H9U6LEy4KfJ7IjcaxcwctLK0IvZJyPfT7i2jAstBgLQITA+kPWX78ChX
 IlsPHda5hwz3qQEkeKQ4c37qN9s19psk9V1fb6gQo7WdE+3a0i17TaIeDuUjZWwZX8AQSs/whPE
 dfyZG2JLiM3Tpr0owTTMJeMaFdjVWkLNkHkNPeRkrKUPxj/8BaPnH7MJXeFIRpNZM197oKD362N
 Dm2Gw0ljcWHMh8gQg0fJh0hzPnUR441thABdExtYfFp9RqJW8pXyyWVCvetK0h9yq+FuXcpVQzf
 MMY0cW1w9G5vGnYuolG8culz6vH2ER4crKXss9620a5/58p2vrg4zNONgYLJ6jnrx/C2aEXE7SC
 SAZvxnK9SFwu1mukwiQ==
X-Proofpoint-GUID: bPlrTRqED_VKtYGwu4X0nftrfOm8r0AI
X-Proofpoint-ORIG-GUID: bPlrTRqED_VKtYGwu4X0nftrfOm8r0AI
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b06c54d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=oGwIKRxBBWau_mrDdCwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX2Q7q34fxwyAl
 EH3cP3t2l/ghqTRMmnbjP7Sxb4AWjvzZB1Te00nVi0zteAtuNbS6bsdfrcshaVFKE9Av60IJv3+
 04Hoj4e1VMri33r6Zj0lRymbgzdWg4Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250045

On 11/22/2026 2:16 AM, Linus Walleij wrote:
> On Tue, Nov 10, 2026 at 2:28 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Fri, Nov 06, 2026 at 01:29:41PM +0530, Pankaj Patil wrote:
> 
>>> Add "qcom,remote-owned" boolean flag for egpio capable pins since they can
>>> be owned by remote island io independently of the selected mux function
>>> even if function is non-egpio.
>>>
>>> Presently egpio is treated as a mux function level decision where as
>>> hardware programming guide(hpg) specifies it as pin conf level decision
>>> i.e setting egpio bit is independent of selected mux function, the
>>> driver/apps claims the ownership of the pin if it's egpio capable in
>>> case of mux function being specified as anything other than egpio.
>>
>> I don't understand this. If the pin is not owned by Linux, then simply
>> do not list it. What is the point of listing a pin configuration which
>> should be skipped?
> 
> We have instances of device trees which are maintained in Linux
> being used by e.g. secure world, U-Boot...
> So something else is using it perhaps?
> 
> But I don't think the device tree should decide system partitioning
> like that. I think the boot loader should set gpio-reserved-ranges = ...
> before passing the devicetree to Linux instead, then pass
> other reserved ranges to other operating systems in the
> same physical system etc.
> 
> Yours,
> Linus Walleij

It's being used by a downstream driver which cannot update the pin
muxing in any way and starts accessing the gpio's assuming the
configuration to be as expected and the property is set in the dt node
in overlay. More dt nodes will start using this property as the
upstreaming of those drivers begins.

TLMM is a reconfigurable block and the bootloader is common across
multiple soc's hence it can't be responsible for platform dependent
peripherals enabled in kernel device tree.

