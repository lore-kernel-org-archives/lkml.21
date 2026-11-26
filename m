Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706374;
	b=J0OQvVHfkqppLLO/YZVD4+Rn3rVlNrCux7WdBDUgspZytPqPWyWoV7RRYafQAiBSo1z+
	 x8bwfBbYumM0BXVaGUeg4eQfQDDRAJ/25/53q413aSMkzO2x3iqZuAcqr64v66F7olqTO
	 8XVUR46o5lQzof9dGtHzq/uwty0moNDkwtrwRRqf+oB3kE2Kvc26ZOn/uiqy+L8bC656F
	 PX7g9qp+Ch2MfAWhGETv3nZct0WGxD6HiVoQ4sCNPoUdwqHOFu7bP56TfQ3fb+vk/oYfH
	 3pvnwsftZwn3l0JiM2XvSYKWWDBvc+i78Gi7+XGalfjDEGatcNDtOVBK+PXXreNMK4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kbwgfhGpD/SnhZAxCCyXFJ8JiP4cUz8bLW1LvUKOW/4=;
	b=dfzG7RXZ/lklkrIY3wyC1ereA6JrptmEmauFWyFhmABJsGZ9VJWsxhtDv95ERHeN1smG
	 Zt8BVB65a6adbo7WHSkQdCUP7mGG2cS1CC2rExYopz+pqqevmEf8SOlLJ/oSsMHV9ZL08
	 q5Tai3tLRHLOVfnvXsAz6GtqGz+PdFiRydJNv7OTG/gAVBnp9A/n5j7RpMC7nvG74736T
	 gxx5qOdjzlrIRE7WPD6DVkpDTv+VsPsGRwAk0OCUuviiyFcCRheJHglkVMSviSMY/p7M0
	 3zOhFpQSbEOS+FjxdmY0nGKjcIprB4ScM+51ECq9uhOOLvLiJuDJi+EcW0wWWWvJjlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CrbbYeYW;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9D9606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E9D9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CrbbYeYW
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f0213202fdso37756465ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706374; x=1796311174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbwgfhGpD/SnhZAxCCyXFJ8JiP4cUz8bLW1LvUKOW/4=;
        b=CrbbYeYW7YZVgHercljukVu0b6JUMTJydB1LSJYAif4Z0fixzzCK03EWR/r37zd3Mr
         D0LO+Zga2qR1DP/qDPD4yyFYP0lzvabXVzmET6fDXDCC/If+2BgSHj5nIlaLFMjDy0iJ
         Mt32b2xqkgR9CnaHnBWEy4WnzxApp3Hy5lw0ry5Eg9UYILoAXBJIgOiy1Ts5ZJ1GzEKL
         T2RLvAvLFCJ2Q6q04CLlsDeLU0wfyhGEiG7yGcOqpDeQhGy2/AKLje+obkISeSfmV0WS
         +j7R+lIvzq3u/TijnwL/K8zWogjL4jmO9BZuzlCyHlWjsc/IEh5RjqW4XtZgZLytyLp1
         H5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706374; x=1796311174;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbwgfhGpD/SnhZAxCCyXFJ8JiP4cUz8bLW1LvUKOW/4=;
        b=Al9GvTHJP0i1XVYEu8ZFtzvzXamvc26sr7+GylmLayB+EE2pu4AuDMP0de4yNRwdLo
         mnWiuJSoUkVjylsHEqukIRjRhGL0zkdLJe55r7dK9WQ6gAWsyaofj2XeArMeoIEPU9jg
         08AGkpyx+Y7gUvVknw7eXFeGiA+Hi5NSjWwYrRRqzRA3LJ3UPEHUOmH/Z/N/uBscxm+0
         JLASaigZRexRL7ex8jEFSqjA9vvzYPFt/7AmHSL+UAGpNu/OTif11rf3Q6ByyHGMGIOs
         v/gg9th7LeIgBdDHgAA7PaAD5gArrrw0FOSJg0eyhpmqFEvSH3CQrOsCO9VM3gMVW93H
         eh5w==
X-Forwarded-Encrypted: i=1; AL+hErG1ANSHkmr24wVn+Zd2pwgdkPOI+eCUIZuT5u4HrZCrF9R2fnGDqLeP2eDmcEe5l5WB/6hLIuYSVS1g2z0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jF7+Qv8kNgAvc7VTQWxtM11iLRQ0uN+wTdCcm8rxWY9OQ6VXA
	0dPJh8yed04BRXkLhLhKsGI3Q0aGEk7kB9+K6AaIw9n/eBqeVwQamtvu
X-Gm-Gg: AZFdTZeoidzqxrA8JYINRaE9hOygU2C5kFxUU/Fzo60fDezHHznYppScs8e+I0RTBVG
	M18na5EO294HhvlhdRXilJcUyBDV8rVSoBvFDZXZ1teE3rBvmIsMFyIm6Ds03hzq+Cx/jJErmJ0
	er1e+3fMZ+k0PI1eGTGCLejZzh/ZEk5tEOislVUtLruRxsVcRCU+5FxDukTo65U0IUcQ5qU5du3
	botdZSMpqNKe8sNx6Df/qbJ13/fbrUv2KxTgV7CrYwbmT1lImQudehM6w2RNs0hE9y9HFJv12Aa
	3evwr/sF2C8TYTaYUXNrKgfRyPvhz2wlWvTTe0BlMSFm0mOSi32wVsDalstm2egq57wIRXk9tlX
	tHshsMGesLhU+9/LHLSDI1UrQKJbkCtEY8cSjX3zIQQqzydMT6yk/Vtmb/Dpa/wBESm6kTgQLNf
	YzyQNI46yBm9QW6+tqL0qd0ORz6FpTym+SKqSvwEmGzTnANMIWv4uFhiEEH4YaLa604mGdfLrQB
	at3MlZNokd7K6lLwz0X3966gCGFWIBji0j3On2zWz22bTSZPXeCEUt7Z24NQJj/1FvbHcq+wF0F
	mOv9LaqQ5zPEcdU9+Qa/gjFq4Oom6orBoZfWVHXJFYTWFnRs3ioHVCMvTq6wnzCs9+LJaKRAbg0
	sGeeenPjcuQKroU1LsNrC1yBeINTIQtrBcCY3ucGdyp+CJAxN/i3leaFx9rGqBE1ULBOd5H9935
	PbvRnx4HZd8kub+WgN5N4V944=
X-Received: by 2002:a17:903:b0e:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2f03f1e0d4amr214437245ad.54.1795706373704;
        Thu, 26 Nov 2026 07:19:33 -0800 (PST)
Received: from ?IPV6:2402:a00:163:2ce9:4e7:3fe7:3a21:f3c0? ([2402:a00:163:2ce9:4e7:3fe7:3a21:f3c0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm11015263a12.19.2026.11.26.07.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:19:33 -0800 (PST)
Message-ID: <2fbeab27-f57c-40f6-8f7d-671cd8a2604a@gmail.com>
Date: Thu, 26 Nov 2026 20:49:26 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add
 ext_mclk1_c
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261115174237.48908-1-surajsonawane0215@gmail.com>
 <20261115174237.48908-2-surajsonawane0215@gmail.com>
 <20261116-nondescript-buffalo-of-whirlwind-6a5008@quoll>
 <9997e6c6-2e5e-4314-88b2-a8547ab035f2@gmail.com>
 <3682be02-3e2a-4e01-8066-15b51215854a@kernel.org>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <3682be02-3e2a-4e01-8066-15b51215854a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/11/26 22:09, Krzysztof Kozlowski wrote:
> On 22/11/2026 18:22, Suraj Sonawane wrote:
>>
>>
>> On 16/11/26 18:10, Krzysztof Kozlowski wrote:
>>> On Sun, Nov 15, 2026 at 11:12:36PM +0530, Suraj Sonawane wrote:
>>>> LPASS LPI gpio5 can mux EXT_MCLK1_C. The SC7280 driver names that
>>>> function ext_mclk1_c, matching SC8280XP, but the binding enum does
>>>
>>> I do not see it in the driver, so are you sure you used correct reason
>>> for the patch? Mentioning driver means you document existing ABI being
>>> used.
>> You are correct, thank you. In mainline, gpio5 in
>> drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c is currently:
>>
>>     LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),
>>
>> so ext_mclk1_c is not implemented for SC7280 yet. I described it
>> wrongly as existing ABI.
> 
> Did you just paste LLM output?
> 
> Best regards,
> Krzysztof

Hi, the wording is mine, but I refined it with an LLM to make it more clear.

Thanks,
Suraj

