Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585458;
	b=DXH+RSxy5CQDe2HlXTjTwbc7K5+mGrJwklmctJQm3uLMkkfDaom4b5SqIDk79FNNC5K9
	 tOatCqdZyBYkv83m7Mqet3y1MAHxWCSSB/oxCG45Q9T/5Tp/Gw1RxE3kiHZ55qFduX+2t
	 2jm56jWcUYzNFbZp5zTxeZ1AIackBcB/4APmvEeXc5oYMJzNPIaTTl4pzQ46Dxl1KZkCj
	 pT/T0hHLi7ycFV1fC1PSvUCA2FjCOgjTA/71KfWphAHwi9KyDIX97EFevlOFC/eDDeKvc
	 NlEKlQka69m6mUcBvTEGQliUyfc8cGQbS8NkV0O7xDg8UD1GUGFugZHqADh2546JmVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585458;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=d50YBDexfWNXkmWBY2bUEk+sxddsIUsz8wpZa3CLErI=;
	b=CKSTTFrDW85i+9soKPeNtX17Wjp4P1XanQWDqYoxv955qTsREuWRjLxXdvG8JUneSnVx
	 SYqUMqZ4n0W9jtGwApjzuwdvuM4kXpmY3N5cQeO0nwGGVDtBd2fYXhJaOx5Asq5RwzH12
	 RAR0miRJB+mgvd8Ne4wqyFCWXJXLY9U2oZXycSSUimGX+Nq8/ICjGV66uesant/A+LjnL
	 P+YDcJIbHZIFpOsxlJWsFET3DdaxQfjXvz8u9223m1RSeQ/z4iQ2aTSJy2E8bqbpPCoaB
	 HP23S1vOb6pt8JP5mhGi7rv1lu6jaMTH6qn2lR3JHKYZzLr4iZgE7/kXL+TXkkBLaag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TYFxG5n6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QW7eDNoD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADF4606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BADF4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TYFxG5n6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QW7eDNoD
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2B3q83287326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d50YBDexfWNXkmWBY2bUEk+sxddsIUsz8wpZa3CLErI=; b=TYFxG5n6btKCtIl0
	lpOvG1TxFDPYMj4mxSJv6HQ09C1KNUQLcliOz+c4czOxR9UJ0SIWlt+th5w/+QRQ
	FAQcoq/jg05+nVlhkaxJxj8qhp9JCtrOulqVboYqEAk0Y30fR+92tAos9RXl4DQs
	u6UOH00BxelCD32ViaSShOyOPQoD0qJPZcVieOc4LJMMAToNDLYS5Zoy5hEbXl1G
	PiIjmsP1DUHXebc/eAQiq6jcYmne/SnTB5r7zVF/7DPN+AtFxLSX7AlCqXE1zgLa
	qz0Q8FqHK2xyn+LN0xdTLgsDSb96BkYuJ/3Han4ZkhTpYcA4xtweMGlzFr3QgJTm
	ZGS3nw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkb3na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:44:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b41e8c1ac0so7845753a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795585456; x=1796190256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d50YBDexfWNXkmWBY2bUEk+sxddsIUsz8wpZa3CLErI=;
        b=QW7eDNoDlQ+yKCSAnA8XWM5FEXnvjRYiQPj1mbapMP7huU1ej7h7nMC2gdysw6i2rs
         KRYBPN19c/YKLAJXcHNZ/WyKeJ9Ou/qZ85dAFoaAIJZzcqa1YFnConU5Xp369TKqOPGv
         QfIfbLhpBJu2fIJuIA+AG305aM60hZ3Qoy/jLOmwjtEtk+1SNUuTlZycbk5vezyJaj1h
         jrzE4UQY53mBDypwejFh6TxPVsZJG836WqV5Ot2kyhyxzr9zGPigs4epFSl8uUOn/cM8
         wyEOTJekkMeBBHcwL6Nu6/40KkQRK1je3qleAdlyiy09T0QIhzW0O+LE2+bBBj/6L1Z2
         8FVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585456; x=1796190256;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d50YBDexfWNXkmWBY2bUEk+sxddsIUsz8wpZa3CLErI=;
        b=0EuwuJSE8X19qnUtSWsMdtRrBdou3TREqmRBLzgJ1jir2ssE8MceCMJiumhRkIoDiY
         pYwJromDovIslnblSUwKr9j053pM2J3UvnoP054yohLGXSKdn4jcoVbJ0szjFEa3FFiT
         3R79O/nP4Mp+D0eLXIVH2DYSyDnKxdcTaAmbhLI8LzcoWUsNw/JbLMVq5Cs2Xddr0LSf
         Ju4poh8WDhXi6loy5O/zT/c+5952aT5C4aDw/LnYZSxM5bYjVn3tud5uiDJCvETpN0RF
         9EhpIFkVqZ+4pGvpdCKTNJYMhD0DqM2+hwmuAZKD70v+v+JqxbU6fyVvT02MRfaPBOy2
         ylZQ==
X-Forwarded-Encrypted: i=1; AL+hErGBziSwYruwif8XVCR1TNUpNpUIPoxQBZp09dA71lP1v7QhihUj1AzFpL5Od9iVN6oRUCraXETjrJbmKjw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zsk+AxL1BtjnqVVYU/TXM9bW1BkE3owcTWk93TkpX+5BGqndK
	Z/7bPMgwk0D1UVgb0hOqrczcU2H/Sti0fRzefJ8cR7hOZ/aKx7q2KK/skhD7LDJ80wn28OJO8BE
	ieKxjo8INRgJ/il3Jg6GRuZshJtOBokgqHg2c/PqvrwmrlZEuWB2Kt94La9AMDhvBF+s=
X-Gm-Gg: AZFdTZcW5fy8wv4ptUWJgGcmWxeZOGoPbjm2eAOzpnAKvh2ro6SEjbUzNtaZhJFTXFn
	R9SVO+3sGZ6E3/Drf2313uACUT3h7Vma2bjom//3nidsz5L3gPaHGaeq+qUhL2C3SmzxLFr3GV6
	FzB2dCwhN1++DLlSWnokwfO5CvtGZfHPFVL/fmhYjE5ZHU/Pme+IuBp+QW6KlS3i+ZS3KdePqA6
	+NlfEbNmXZadWI3aDEl/AXTGFoMq6SudJ3TiQFwGDR88fGdSihhCieaqYx0WFm+RmYZf9SMJjcI
	kl/3PB8eHK6IOfYhE7iIbs2CFOQCUJST+zfOX6ukuwYQSOvQrec1J8zqlfaxTOTWv0AlhrruLEZ
	MZ1tCiny5Z6UBtDS6zfeb6CVd5Lfn1ym8afXer/3FVaQB2JCTL/fkzZ3am+IKDDtP+BBfkACmCG
	g4
X-Received: by 2002:a17:90b:2f8f:b0:3ac:9f24:44be with SMTP id 98e67ed59e1d1-3b41c92a3dbmr16789512a91.29.1795585456078;
        Tue, 24 Nov 2026 21:44:16 -0800 (PST)
X-Received: by 2002:a17:90b:2f8f:b0:3ac:9f24:44be with SMTP id 98e67ed59e1d1-3b41c92a3dbmr16789490a91.29.1795585455568;
        Tue, 24 Nov 2026 21:44:15 -0800 (PST)
Received: from [10.206.96.212] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm24869843a91.7.2026.11.24.21.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 21:44:15 -0800 (PST)
Message-ID: <956d1f06-d13a-4f5f-a7cf-cabefbafca99@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:14:08 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add optional wled-supply
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        devicetree@vger.kernel.org, rajeevny@qti.qualcomm.com
References: <20260929-wled-supply-series-v1-0-75d0a83b4b00@oss.qualcomm.com>
 <20260929-wled-supply-series-v1-1-75d0a83b4b00@oss.qualcomm.com>
 <20261001-private-wooden-chachalaca-51aa57@quoll>
 <997cefa0-384c-466f-b318-077939946768@kernel.org>
 <cebrka4ya7u32ntiya42yx4txa3uryf5k2di234zm4enz3a6vy@xhily6qqmevo>
 <1cd249d8-0a26-45e4-8263-dd4a120fc89e@oss.qualcomm.com>
 <54da53e6-66db-4357-a00d-da27fb936117@linaro.org>
 <a3f1a0da-039f-43be-89a3-ecb5df28bc1d@oss.qualcomm.com>
 <494411c7-cf0f-4c43-9716-14fa5dc42a8a@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <494411c7-cf0f-4c43-9716-14fa5dc42a8a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyMiBTYWx0ZWRfXwSQ1/DhJkeO4
 xFzD7bt3DW/80alT4Jnsx0K1SzCpy+KEU4zBVejoB/MlvKmcg9OQeRqoCwQkGqGn+EnfjLYPW1t
 eDtnv5GcO7ATXDHaNgnShamWwChofKHfGAQPGUSjkZaxfVR/Ru9QvYhUuquorD0/BxmGUc4H3lN
 t1v1CfZ7Z/JqZ/r1WWU15LZCSdARLkqLEY9DLpgML/7IziTJH9PCPua6/TfIiVMZUmUSxPfbofY
 FMWf2cjhKYF4r2G6yjZlUrmzj/6PiOtP25LPiV3UxT5s8k2ZTnYyWJemIG74Sxf9UluiYZxadL+
 C0j6GI7+LU+DZKb+uYsOjKrIH8bVFNXTY9mQMwaTgLzJndHSfN4w2jTCHrT/NtTSw5MJ8/fviGN
 VH0e8iEifzoELW6Ip2BPuMiBuJHvAE/u9lwFIF9ir6eL6zbJJO5jroXZPxWfILFGwBsORTAiIgJ
 8893RANV25uldErlkZw==
X-Proofpoint-GUID: ZCJi2F9lqII9ha9_GtIGPWgQNGBoKD2F
X-Proofpoint-ORIG-GUID: ZCJi2F9lqII9ha9_GtIGPWgQNGBoKD2F
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b0675b0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=5_7aImml_y_2oAff7DkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyMiBTYWx0ZWRfXwudYdsdcjLBw
 gAe7kywBXb7+r10Z9gsFSL1RtLO7XD5mwT0WbBsyhwlhZ65dFFJDrOm7zt3luCsg2Q4EQhDk/uk
 HlA42sMytN+KrC6DVJJzOe1fcH5qbyo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250022



On 10/17/2026 11:57 PM, Arpit Saini wrote:
> 
> 
> On 10/6/2026 7:52 PM, Arpit Saini wrote:
>>
>>
>> On 10/2/2026 1:52 PM, Neil Armstrong wrote:
>>> On 10/1/26 20:09, Arpit Saini wrote:
>>>>
>>>>
>>>> On 10/1/2026 3:25 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Oct 01, 2026 at 08:57:52AM +0200, Krzysztof Kozlowski wrote:
>>>>>> On 01/10/2026 08:55, Krzysztof Kozlowski wrote:
>>>>>>> On Tue, Sep 29, 2026 at 06:42:20PM +0530, Arpit Saini wrote:
>>>>>>>> Some boards drive the ILI7807S panel's backlight from an external
>>>>>>>> WLED driver whose enable input is wired to a GPIO, typically modeled
>>>>>>>> as a fixed regulator (e.g. vreg_wled).
>>>>>>>
>>>>>>> You describe something else. What's fixed regulator should not matter
>>>>>>> here. Which pin is it in ILI7807S?
>>>>>>>
>>>>>>> It seems you just want to represent GPIO with a regulator. This is just
>>>>>>> confusing and typical downstream workaround.
>>>>>>
>>>>>> What's more, you basically REVERT the review YOU RECEIVED in v1. Really,
>>>>>> just sneak the same stuff 3 months after like the review never happened.
>>>>>>
>>>>>> NAK
>>>>>
>>>>> After discussing this offline with Krzysztof. It's not a supply (my
>>>>> fault), it's an LCD driver. So, the best way to handle your displaycard
>>>>> seems to add a gpio-backlight, reference it from the panel and then in
>>>>> the driver check for the backlight's max_brightness level. If it's 1,
>>>>> then you have to send extra DCS commands to control PWM. If it's
>>>>> higher, use normal backlight class controls.
>>>>>
>>>>
>>>> Hi Dmitry, Krzysztof
>>>>
>>>> I have a few clarifying questions regarding the proposed approach. Please let me know if I've misunderstood anything.
>>>>      panel_backlight: backlight {
>>>>        compatible = "gpio-backlight";
>>>>        gpios = <&tlmm 91 GPIO_ACTIVE_HIGH>;
>>>>        default-on;
>>>>    };
>>>>
>>>> 1) Adding gpio-backlight and check for max_brightness level if its 1,
>>>>
>>>>     If we model LCD_BKLT_EN using gpio-backlight, the backlight device effectively exposes only on/off control (max_brightness = 1),
>>>>     we can't support the full range of brightness i.e 0 to 16383 (0x3FFF)
>>>>
>>>> 2) Adding gpio-backlight and based upon max_brightness level of 1 , are you suggesting to register another
>>>>     backlight device that can actually drive DCS brightness. In that case we can actually have the MIPI DCS controlled brightness
>>>>
>>>>     If so, wouldn't that result in two backlight devices associated with the same panel:
>>>>
>>>>      gpio-backlight device for enable/disable
>>>>      panel backlight device for DCS brightness control
>>>>       Is that the expected design?
>>>
>>> It's a great question because there's a large variety of how backlight is
>>> implemented, and some panels can drive a PWM to an actually backlight controller
>>> which uses external pwm. In this case we should model the backlight IC as
>>> backlight driver with only 1 or 0 capability and use the DCS to program
>>> the PWM.
>>>
>>> So it leads exactly to your issue. So perhaps one way would be to either:
>>> - call into the gpio-backlight from the DCS callback, we may need to fix some locking issues
>>> - add way to "link" backlight devices so the backlight value can be propagated
>>>
>>>
>>> In any case the problem remains that both backlight devices will be exposed
>>> to userspace, which we don't want. So additional changes will be needed.
>>>
>>>>
>>>> 3) I previously tried modeling LCD_BKLT_EN using pinctrl states (panel_bl_en / panel_bl_suspend)
>>>>     for the enable GPIO itself. However, Dmitry suggested modeling it as a regulator instead:
>>>>
>>>>     Link : https://lore.kernel.org/all/qkhgg5x67sijiialucvzac275zhpjrtt47a4udjpyzmgvilut5@dcrslq3ai7mc/
>>>>
>>>> 4) Modeled optional regulator wled-supply: a regulator that only gates the external backlight driver chip's power/enable,
>>>>     with DCS remaining the sole brightness path in this current patch , the panel-himax-hx83121a.c does exactly the same.
>>>>         Would this can be the preferred modeling for such panels?
>>
>> Hi Neil,
>>
>> Could you please help me understand why we cannot model the external WLED enable path similarly to panel-himax-hx83121a.c using an optional bl_supply?
>>
>> In our case, this supply would only enable or disable the external WLED driver through LCD_BKLT_EN/GPIO91,
>> while the panel’s existing MIPI DCS backlight would continue to control the brightness.
>>
>> This approach would also avoid exposing a second backlight device to userspace. Would this be an acceptable way to model the ILI7807S panel?
>>
>> Thanks,
>> Arpit
> 
> Hi Dmitry, Krzysztof, Neil,
> 
> Could you please clarify why we cannot model the ILI7807S backlight similarly to the approach used in panel-himax-hx83121a.c?
> 
> Reference:
> https://lore.kernel.org/all/20260608162622.403713-3-zhengxingda@iscas.ac.cn/
> 
> Our hardware has a similar split-control arrangement:
> 
> - The panel driver controls brightness through MIPI DCS commands.
> - An external WLED driver powers the panel backlight LEDs.
> - LCD_BKLT_EN / GPIO91 only enables or disables the external WLED driver.
> - No separate backlight device is required for brightness control.
> 
> Therefore, could LCD_BKLT_EN be modeled as an optional bl-supply, 
> with the panel driver enabling or disabling it while continuing to use DCS for brightness?
> 
> This would also avoid exposing a second backlight device to userspace. 
> 
> If this approach is not suitable, could you please clarify what differs from the accepted panel-himax-hx83121a.c model,
> and advise on the preferred way to represent it ?
> 
> Thanks,
> Arpit

Hi Dmitry, Krzysztof, Neil,

A gentle follow-up on the backlight modeling discussion below. 

I understand the concern that using a separate gpio-backlight could expose a second backlight device,
and that additional changes might be needed to avoid that.

Could you help me understand why the external WLED enable path here cannot be modeled similarly to panel-himax-hx83121a.c, 
using an optional bl-supply? 

In this design, the supply would only enable or disable the external WLED driver through LCD_BKLT_EN/GPIO91; 
brightness would remain controlled through MIPI DCS, with no separate backlight device for brightness.

If that approach is not suitable, could you please advise what differs from the panel-himax-hx83121a.c case and 
what model you would recommend? I’m happy to revise the series based on your guidance.

Thanks,
Arpit

