Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003654;
	b=zKzJu4snPZ52MCnX00M5SMjYTalRHLmwMxZMYxN7lYYybQkGbiXjpKcknlCt/1rEGOiZ
	 0dhXFgT+7SIo6E9drLUChytuo4rBfjFb6nt/nFbLLrW912nGZK5SRng4TnVq5Z3FkADFP
	 K0wGCZn8XNYrOsCY2foaYg6HbpWojEedxpQqfg2swY7Dfm34JtfwRNKIrimRXFa3cYfIU
	 I3/QduEsN2Roy/pZIuKL5OUpdtmorW6HWPD6kkVqk77L6bGsgKL74nkcTYGV0I7iu1oqK
	 8bhjON36OClkXQWSI1I55r7SCkAmffWj2C8J+hr9ysFBREkBh+x2t/5GH/C261ich+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PGo0AutLiiy0hLAKmKu1B2JYnOQu7NjGJUl6O0s5Glk=;
	b=FMQFOzpJb4YZZ4+2c9SybrPQ97RNGf2eYQxkYG+WCKRDAQCsPCB0E5Gm7i9EfsmqxxoD
	 G2rXJ/HtDm0bdfrPK7+59G2iSPNulYcKpDJe5m+g4iuunPKh1aNz6H6FwImG15GDrK04G
	 C8UCHngfnH6M3KBwYRF7cICQL7TZiprPiR3i8y9eF+dbi11+ICQAzm9xYGhDe84MXVml5
	 SNc469RHJO28mV/ysyYim4X8fTLG3ipkwbhMg6aE0L/WkyxdYwLKIahgvyGU4aUogGUau
	 UYLzJh/ERqwJ+HgnL4Yoo/rzxds5oi0a/oSJwwpWEKK9LpXeXKb3IH0d9LBCQ6q4Mug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="m58+Jm/s";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vyyb8pc4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB127606C3B0
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB127606C3B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m58+Jm/s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vyyb8pc4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBkjoQ156812
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PGo0AutLiiy0hLAKmKu1B2JYnOQu7NjGJUl6O0s5Glk=; b=m58+Jm/s2vJ3gqKq
	VaIH92ZTzASJ8eohtgzW4HaXPbcN4/uG5hzGXLarxQPmRO/bzpvmqyjUIrp4kfjr
	hKXH33GInbgViG+pEmT72S9Lp30a/zFDeJRk2IKV+e+qqzp95GZ9Ulns1tixorkw
	hkPS52oR7qvebFIexEgTea9dL/4n4h8h299CPEL3JUda3yWx7bDpBrYFPYtWN/cX
	MXQcnKiHhnjLpSx0AWDdcX3D9dl4YiTbR48sNKFHwkvGGK+8A/kG7rR+E/7Q3H8c
	uVxBfrJnsaAlNGD6acv5biTuOwrXR0kV+HXmQ+MZ5/dDgnjeZ4j6lvmGZJmBzA+F
	bWHALg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9jvfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:07:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495c71055bso200052385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795003652; x=1795608452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGo0AutLiiy0hLAKmKu1B2JYnOQu7NjGJUl6O0s5Glk=;
        b=Vyyb8pc4Ftng+mzKMnYSOuPdNdrfMvLK1KZhQUmwXJOBzVvDVb2DTRaITs7UNrUTKO
         fojJUwFplWZUhIrkDnMHQjb/7XLTs3/q2Pw6CsVDufChAEB+fD5oqgXVmWCORA/YEiFe
         m4DDSWAsYcKa27ifTQdPhKhtdTYidGhWlGyWKtEjHepIeqqgQrC7DaA2L40XFrH6OCnr
         /mTRfHAmBIUBPkyXKgftwdBAdd39gNP5+JUCjkTjYammNHIJ8U+LrJ2yqCGJBCpObgNW
         sUHVamInHgKt9puGRmkqsCpvVs6GwwfAhhjZTMasMFbhBSJ2iHf4/YeixZnFN4AoMGsg
         COSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003652; x=1795608452;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PGo0AutLiiy0hLAKmKu1B2JYnOQu7NjGJUl6O0s5Glk=;
        b=DPog6zrX7xDJ1wnc6BQSbqdiihsG7nMNj6cEqgvqcQxsNksHc0w86q9FLaihqenxk4
         gV5HWRa/8EtXKAbfTRKHvkYU5mja4iviodWe72zTV4AQH9/D9FwPtnjvOA6pTlvK0g6+
         Y/k4O5YSYqvbXcvyJwr40hLoJ9zC82qqZzIhuKShkaR8rX8Pf+0VKA98Dg+YOaL3+1fm
         /IwnmwFWZM5GB8R9sL2zT12Ddr3gGKvnsG+60JXU1daIrxanzJBUJZiZZtCMfOzSbdXB
         kIAIbR6sOJJ5N2pZufQOkI61GrsrZ9OSRYABIDE0PPm4mcy6f1bVNwKnwIsa0CK8X3hh
         mm/g==
X-Forwarded-Encrypted: i=1; AL+hErGQHrhlQAGJQgc8fyAjsv4wqR8Fmf+ttRDKEzrJ7A+eUucQz3+3ljcCx8H9jWbCRmoSmuAeZy9LV3O/kYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SK3KHZaUBpItlzmYi7i1qKHNOyOrovkS+roFiGUNetTF478S8
	2n/Nvy6y/tnPEuxnoCRWVMgVDEqL+xdReZqypu52o13Ctj9jYzgfTyx9Qf75E9jssYwtbSg8eFr
	pMf8ylAqUtxRrkjEYzEb83jPfkOqBr7P1jB53oagqHTpcYumGs33fFIamW/3yDcXCDW4=
X-Gm-Gg: AYBFou0uvNYQbIqwHrpwJiCNGpkxNv8TviMjszGa2WBkWGW66Fd/8WnK4bdoAhTrUCq
	Bzt+AzNmMyuDNX9M6G/kEOpYMA9jcNCcT80CZ0xQNszcNJbx/pupwFgrw+ftBEgV6h64tHqMMky
	es43z5P84eXpS0yis4sMgat/tlm4pZ2Et7srx9Ok+7AkGSBQlT9GyDc/bDvweyNXkYriDXIS5u1
	4I6FXr8ddygrFLiJW9RmZEYJ10qDgG2O5hnvlP2i8GIkXJDcOxMSGbEirMy9Pvk0M18+DY5c8/I
	xRbTouQOdsjGjFsHMlTFxwOX32BarHOwaXQhxYXiXZ0szy4adPLpIQGMqtXkf9H0akDz9Q4GjxN
	Rv0RRySlBQAIgdjdfW31f7avyvzxUStvBSF4cQSX+B381dhaI5dCKskuBnFLYn7uztDhWD4vOA2
	E=
X-Received: by 2002:a05:620a:1a07:b0:93e:60e8:c9ad with SMTP id af79cd13be357-949995f6f18mr450725685a.12.1795003652066;
        Wed, 18 Nov 2026 04:07:32 -0800 (PST)
X-Received: by 2002:a05:620a:1a07:b0:93e:60e8:c9ad with SMTP id af79cd13be357-949995f6f18mr450720985a.12.1795003651629;
        Wed, 18 Nov 2026 04:07:31 -0800 (PST)
Received: from [172.20.97.102] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm3923461f8f.12.2026.11.18.04.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:07:30 -0800 (PST)
Message-ID: <8d0810f5-e90e-4a70-be9d-89215d02b74c@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:07:25 +0100
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
Subject: Re: [PATCH] arm64: dts: st: stm32mp2xxx: Remove undocumented,
 unapproved eeprom0wl alias
To: Marek Vasut <marex@nabladev.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@dh-electronics.com,
        linux-kernel@vger.kernel.org
References: <20261117133747.244933-2-krzysztof.kozlowski@oss.qualcomm.com>
 <ac1a1214-98dd-48da-b8e1-bc8ef9f09316@nabladev.com>
 <93acb3fb-98ae-4dba-a3de-fcf1772239eb@oss.qualcomm.com>
 <e9bfca58-666c-45d8-bd5d-9405b068bd08@nabladev.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e9bfca58-666c-45d8-bd5d-9405b068bd08@nabladev.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pDMOXBVrIdeV89z4UYH3hFkF7K_qOpA6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfXysoVZvk2kPSx
 jxIS2fkWu0wws5Bo+9W8AFnDRacbrgC72VQInBKHQvog0boZ6MCLLpgdTKHrfSG7T+Pi8TgR2uj
 stW641BV0By5WmQuDU2Vi8JSSPQF23Y=
X-Proofpoint-ORIG-GUID: pDMOXBVrIdeV89z4UYH3hFkF7K_qOpA6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfX9/PkGDJP9Kpa
 1RvJHBN3LYPygEprAj5PWnODGFXXhTt9HgbJ9YQ8RvgnvZQxmUj19RmyNcSUVa/gehDbEwfZelT
 9E8pzQE/pdLFCNQ+eymDTQaG/awQmWw5A2phtjqRYqeCtxfCYtw7nG7DlUZTB/2Dr0V1Ajkxi66
 /7Q1gJdB/NBeN5u/uaAmd1HQav2tQ9O26EMcBQyoh5N6V4hjXoH76CPiOgRoxh6zGbLIOCY4edv
 1ClHDzoHmQ06+0nnIZuBAcgIMbx3FlCwmEznBdVcq5nNfGn4ayr+N9FR3p3DUkLrUOqRRx1JsZU
 atZy3Ea5ygpqmjBPbFnVCCJQsG9p8vLjM25CFXpPkroAmjORC61M4CRwWt5KWZDzLEm4bwDr8xp
 EDhE9eCgnwOeQETZdWkbSlnlh8njT8szRd7cwswpPsbPrK++AZxf7xGqtO9jN4Dz6bn4Eul4Doo
 Bh5sQxstB9oafyMpflA==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd9504 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=tsTWcAnlPx0FCvilErIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180048

On 17/11/2026 17:24, Marek Vasut wrote:
> On 11/17/26 4:13 PM, Krzysztof Kozlowski wrote:
>> On 17/11/2026 14:41, Marek Vasut wrote:
>>> On 11/17/26 2:37 PM, Krzysztof Kozlowski wrote:
>>>> The eeprom0wl alias was never approved by Devicetree maintainers,
>>>> because it was never documented as actual ABI.  There is no in-kernel
>>>> user of it, although there might be U-Boot.  External DTS users cannot
>>>> rely on undocumented ABI, thus these are pretty safe to drop.
>>>>
>>>> No new custom aliases are allowed for years now.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 1 -
>>>>    1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>>> index bcf63e2ea989..5795b352fccf 100644
>>>> --- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>>> +++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>>> @@ -10,7 +10,6 @@ aliases {
>>>>    		serial0 = &usart6;
>>>>    		serial1 = &uart8;
>>>>    		eeprom0 = &eeprom0;
>>>> -		eeprom0wl = &eeprom0wl;
>>>>    		rtc0 = &rv3032;
>>>>    		rtc1 = &rtc;
>>>>    	};
>>>
>>> U-Boot depends on the alias, so please don't drop this one.
>>
>> As explained, U-Boot CANNOT depend on undocumented ABI. U-Boot is not a
>> user as understood in Linux kernel policy "we do not break users".
>> Especially that U-Boot does not even consume that DTS! We do not break
>> U-Boot as long as it is about documented ABI.
>>
>> Here U-Boot won't be really affected, because updating DTB in the
>> kernel, does not update the one in bootloader. It does not go that way.
>> It could go opposite, so from bootloader -> kernel, but not the other
>> way around.
> U-Boot does consume Linux DTs via its CONFIG_OF_UPSTREAM .

Cannot, otherwise it would have document that ABI. That is the
requirement of using OF_UPSTREAM - you also use upstream ABI. You cannot
use upstream DTS with downstream ABI.


Best regards,
Krzysztof
