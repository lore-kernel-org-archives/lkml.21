Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003764;
	b=NWk2AOegRiNQ8mNwiQzBPHWLNoMwVgwXtX0aF81vBl9R4hyXJ4iit5KxKT+o35JWG8dP
	 0ABMzpmzWuyO1z+vpCU5zmMWkmB0UZJt3HnY4VdATHli1xmrn4CHGm6kzFWAi+mlsqFm3
	 RFZ2JK6IMALEE7cdn1VddBmOj/3TX+14iAACiDjlKkEjV0pUDMtRz9KlqwMW8HqUt5dfk
	 Fj6LsRCHxEGHCf+UNT5OuvgO9Stkz0nYGiv0hCJidS+kYJiGqSo6ams/UatQCCY+kwEq8
	 CtblGnNOrEhqb1ppDGnkj1KlbcpJ4KxV9D9oddpXRdpD0VKF1rMQjeG7JCXYVXEIl2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003764;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fL4ijXnPOipnQQlloELZhTJsYgcVrNR+TVVQ5/sunBk=;
	b=ELMaWqF+yNW0RNVXDw5efl9GArduJVcWSXRFKaPShRkHDInBIzUHXDEsfPg9jDVX4rna
	 NFtFd0YZB1SZ1vkVEd2h7pU9hZoRJlNJbsGaZbaewOYAYOzocKQJ0ZefOcYZydp4Sgfa9
	 1xJx1TmcjPBofmOFXfNHs35DYpgMxwJkjwiwKK1YXiM3w/SPvaImOcVn8Vjhf5Z7y/0Pn
	 SgraCfX0QgT2zsI+xVVFlIhKnyP+ZJffo5MTv+w3nUt7al8ggeKBIsP9y/9Z+1uQrqJjn
	 nggY4EuqR5JVBJiArGaCVpDP0WZNAK1pYceATljmxzZU965LJxQOmKkdxO4+aP/jLww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PXWe90Yh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g6Cf1mMs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910DF606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 910DF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PXWe90Yh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g6Cf1mMs
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBkjLL3624497
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fL4ijXnPOipnQQlloELZhTJsYgcVrNR+TVVQ5/sunBk=; b=PXWe90YhBRCaXDkh
	T269VXdOqRgbO9IpXhunYqlQ8H9+L5nWJr3u3nG0ftsbFJl2HCj5hQhslXSgLF1y
	IeHpp1ZemyItj6c60oPEm4sC6dgb3aMpMn6bZiBYNA5XYqVoO97qQWSHszVpyRrB
	9KHpCD4S9y2C6pstw0vYEf2jtBlTK5tF4YJhgXG5zXCc5daf3ZSvEOuD/AbD+WoY
	biCXG5q7zDmDmSWoYmCZQDxmf3tl881/GqUmEHj8uN08wxX0f+90ARBN5yC0/Xsn
	BsLt51qqDAJt343zELgFcTrmopyB7FhH2kweYJUtMtGzNGQQO92EUdiexldTodq6
	KZhXQA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvatxp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:09:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so258572085a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795003762; x=1795608562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fL4ijXnPOipnQQlloELZhTJsYgcVrNR+TVVQ5/sunBk=;
        b=g6Cf1mMsEH/3BzNaLLzANb35oy7i5t6+VY2LTULVIOCrDmZCfEuxGLcP2PiIeddCe6
         UDRb/bysO7uhOOOFojx/mCUc6+J2J8nSZsLBQIKKhWIYX11tFFML4GyMbqAD1Av/j9pl
         r1tJTei5XWB5X2aNZ9lnb9lwUgsBIz6Jv3AjnnCrOh5XI8Q6YT7/KKvDR2hsOVLXaCBC
         OPy9S52DcTvFW/JMjS70Mka6RGDm3M+TY06F8g6x3I4RhtoEnrhibfsdvAM1o/rvjqPS
         pccvTDkcEv85zhB2NRqWwuqhKrqAlrWsgEeQmYdzkcogerQuOImJBkFwRFwsG5Xb0G4P
         6s+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003762; x=1795608562;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fL4ijXnPOipnQQlloELZhTJsYgcVrNR+TVVQ5/sunBk=;
        b=nXraf9kZ+FblpEB3PALoEs1dFoOM1jJqkuWjnbkPulLgxa8t6gMCv9w3+J0+ksT2Pn
         FDT+eB6UkUFsjTh2+1kSfnK1Iu3lnc5/nnfC6pZauASpFyMa7AVhoeaHcIHBr3H3s/56
         Om9nQYemRkeQ2mBCuyDyFQts1OTgxCvwILMp/EW6V4h8anmHWNvrRaT980NbthhGwXN2
         0cs6P5eplD/FFyt8iIJRVNYs/60VXPc2bojioCCol/NLS3ipk5UgLep5/Wn3gI3W6Dca
         ALhKi+a0vL1PRICucv5hipS/PPuVxrrytHtEv3YnzD62XgTiek7R/4T546g3X7g29EJl
         M0TQ==
X-Forwarded-Encrypted: i=1; AL+hErFlBxMUD2Ju0DpzFqmjEba+dP9cD55FJ5acCZhfBaUQJCzaWgTZZHcqNT2seSByyoaDH6thP7i9ciS0jWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nbeX01+QzsLktaeIFk+WQhS6VnMe5LPeUW7UqO6C198aHEZgr
	aJfrjJlO6gLlakx18xpbD8sh+PeGUqsvRT4ofCWyQ3kYGvh+K3SHVO1pbv6+05Q48XwU2QF8uTr
	FhUWrl3KgHdLL6phTVXzo2bPKxSIUZirAVivU9ez+Qd4hiexqLbrxVmwcXi7P3rS1eoE=
X-Gm-Gg: AYBFou2E/IJZRa1MGgIiU7cbsTejC8vKluS3U12LE7+N7y/+NK9CLNPtatDcNExEPks
	11HaJsF2pW98gxB0GmO8s0L6IoVq62IS5T9UaD4oiCz5WoYcZizuBuyZl9ripyeKg2QprUVzp9X
	/RLN6t5pUbkULMsoHjp/JQJcRTUE0QhmX00tOcOxGdwnTHsjttWyGp/4lj5RVYW5BHiEMeM2f+T
	uBKsbY0ZOy7yr8+3oTBuabRIamdYLTp1O120lvV6C3hzK6Bq8uHbZSqvsT+2ILf6bmUn8Wd0QU6
	u273o8901MxrimWF2ldPIwoeJfunm+66PGbueC7F5arOnj8mWKHOBxeCnMVlMCDHoKbIJoGuAh/
	aCEShQzrNLnBgcEgAh2nToWETm64yn8V02yzaRQWGgMGtcfJmEmYv0gtokFz2paw88up7A5g53h
	8=
X-Received: by 2002:a05:620a:4381:b0:949:7b2c:671f with SMTP id af79cd13be357-94999658ae7mr397171785a.82.1795003761626;
        Wed, 18 Nov 2026 04:09:21 -0800 (PST)
X-Received: by 2002:a05:620a:4381:b0:949:7b2c:671f with SMTP id af79cd13be357-94999658ae7mr397166285a.82.1795003761030;
        Wed, 18 Nov 2026 04:09:21 -0800 (PST)
Received: from [172.20.97.102] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d001a64sm63760025e9.0.2026.11.18.04.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:09:20 -0800 (PST)
Message-ID: <96e3cc39-d10b-4743-bd9a-d683a91fdf34@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:09:16 +0100
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
Subject: Re: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved
 aliases
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
 <3882ec4d-9f99-4419-8914-19c3a2a3cc46@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3882ec4d-9f99-4419-8914-19c3a2a3cc46@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd9572 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QXGhswp5__15x8Fhz6wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: JZMfK0-hJsmXNWeYiwiZYcq0OzAldHLe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfXy/BPYQsrLI5O
 /rUEJTTRxqMcriVZc9DuywyfwHMDjWJoiOMZIw+2lzt86ItZHmmefikSwF+X2ysFnMChpcMLVQX
 O9KfZmdbHgNwzkOz6nf0CXnw0Gku1QpFvBVeLS1fKkO0vcj/XcGqrzzwDfGvdRhdEcpo6z0ehId
 GG6oi6HPn1xBO2OVqHgrXZOPzxL6XBEQGcLlvZXIBY66lpf6gjNbKBkQKPjeaK/yqCs54yUJ35K
 ccidf3h+VMxmWWAVeOfxHdUnglYs3RocnTkZ7h7o7pANE6faExOThq1l2I+LA03UMpWuRGL2j1P
 Ejx0oz/wMvVppHb0IWJ/iG/PPCVG9UvGTUzJKhRRIqWjul7BCg3Et3bvPSnS5bFoC1YwL/IhE5e
 cZ0VDQHyzFJmPL8Ra3T7ELtiImalOwbgOmctxcuQs39ZmCe+AoW3uaJo2Xquh9ZGIHxTbeoWQIl
 1UilGbdMwor1yVCiJNQ==
X-Proofpoint-ORIG-GUID: JZMfK0-hJsmXNWeYiwiZYcq0OzAldHLe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfX3qmLpv7MZJRg
 T9UCh/iY8fBMe2SifVbRUB7lnbNtN/QanpwsSXTYJpexKU4r3och+Xa3ZCdzoNXmBl7FSg1nmaK
 rie2Fos6K7Y8mGwxm1WKg0vKHtBZ4Ig=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180048

On 17/11/2026 15:06, AngeloGioacchino Del Regno wrote:
> On 11/17/26 14:05, Krzysztof Kozlowski wrote:
>> The ovl, aal, color, dsi, gce, rdma, split and other aliases were never
>> approved by Devicetree maintainers, because they were never documented
>> as actual ABI.  Drop them, because no new custom aliases are allowed for
>> years now.
>>
>> This might break users of this undocumented ABI, so these should be
>> updated to use only documented and approved ABI.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> That'll just break everything.

True, almost everything. I suppose few aliases are not used, but rest are.

Well, it's a start of a discussion. :)

> 
> I do have a mediatek-drm restructuring series that is partially resolving this
> situation, at least for some SoCs it's getting 0 and 1 hw instance id dynamically
> recognized, but with some caveats that could be unacceptable (as in, if 0 is
> disabled and 1 is enabled, 1 becomes 0, so it's not actually resolving anything
> for real, it's just making it tick right when stars in the sky align in the
> right way, which for some SoCs is reliably possible without side effects).
> 
> In any case, all of the ones that have only instance 0 (and all of the instance
> 0s) can be removed even right now already (still needs some testing to make sure
> that there's no regression), but everything else can't, at least not until the
> whole restructuring thing is merged as that'd break things.
> 
> Worst part is we have two new SoCs (MT8196, MT8189) ready to be upstreamed here,
> which took almost a year of development... and it also does rely on the aliases.
> I was in the process of slowly cleaning up those (as I said, there's already a
> restructuring that makes things a little better in this regard), but at this point
> that'll need to be done with the highest possible priority.

That's unfortunate and still new DTS/DTSI should not come with these
aliases.

Best regards,
Krzysztof
