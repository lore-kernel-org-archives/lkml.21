Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779976;
	b=JvpcEvGpL0HIjvsJ/V7O8Us2+AFCFQw3sY5xCl6FnxqKO+q6HBtJZlePcCkI1sRHPdan
	 cEEL4cU5DuK0dOfChrlEXBWJG0ybrPWYjRPFfuGxeKUhLCb2sNaoZgls3Tg3V8ZNIsINc
	 c03vC5FP6OmfwH/alZF9k46U2f/sgmUSkZZdmEEVpQlmrmq/YBP0XFtLyakcRBAEhD+hD
	 8i71BxAG3uhnYiuIZmC4KfLbK7ojfWEkMRGJvppPN0YBP6zb2MxI1Su/EkoLIQ+nCmCX5
	 Wrp34/86fxVWm+PkTQHvxWgMlAWK0WQQd9rDyUdS/YXAXeC/x5YWNN1IO0qlVICeHtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZxMoV0clQ2armNCSyoPGDqOYSNYRsISnPiQcB5JAR4w=;
	b=BZZ3/Mt5Eo3VzhOf5TRX7R3I/nBKNBtPOrvFlnNnJJWtHX5kjISxIqgEAMAMLkL9x/gu
	 x6SN70Z/Nrga9pLC/FJsnzi6v2NoGS26SLZyr2xCuKJfK/ESeFll5VZfxCEJFijoeYkxa
	 exa6hPQWw6G5tSiMYQzGI4jbLARuO3a617Uvu7uQ94Jz7ybXmEaYXAQuwRTh6lPmz1y02
	 Wo97PIWJedGDeEetvffUmG31KdZF4TKzZzls/pz//xFc1z196rxB6xDlHn5h4N5obPac8
	 UsSLXSJBEKZf4RrzayQC3nL+N4NlCDKtA2qEMqXzzbzY7dtvjv9KolGfGeof3aJBDbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ACqF6EUx;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8F8606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B8F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ACqF6EUx
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4395d31228so1366401366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795779975; x=1796384775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZxMoV0clQ2armNCSyoPGDqOYSNYRsISnPiQcB5JAR4w=;
        b=ACqF6EUxfxi3LaXvh9zqneVKZk2Rih+JpedAEasVpOEE3gBMdr4W7QydtKAMmOJm8r
         mdu8nBvnrrHyaR4HD+STVYTr3Cj3aXeCkVpQkiSUMNu5ouEK+XtbQY57qhUe9Z66/+uk
         KSS+uSwk+R/RP2UHgXJVpIIKHM622ieBJvIK6xa2iP054qav13WqwyH1sM2R31tD2i2x
         fRDKLmzMm2yPyFabnmQl7j/hjIxxdfO8DAKm3fJSNqtzh6e1g36D+e5J5j9iFjLdxNED
         ZJx7KjQ7XYV2n388hNMuKaTdIrOKkalpsPlO6Zu8F1samoq3bcziYGfPyVbrRvFoYk4r
         bs+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779975; x=1796384775;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZxMoV0clQ2armNCSyoPGDqOYSNYRsISnPiQcB5JAR4w=;
        b=LZTzo7a+6KMa9qO7BH88cgg/7O+9DjFDeZYYzpbW0ILCyMUMdlql6Ln2CHh4B2obeK
         Z3iJa5bga3YFoWElALDJQFIzG7YbsWDO3M1wK6f5C0033a0ibmrla05xDgsAVRfsrrEP
         8uAzowI1pfFbORHVsV4I++5JPNCahSa/O6hbsAUTiW8TtUux8rDzb4ZUBqjDRIYZjJvU
         +sfpXwDcQiFeDHu7l1pGpiVfcpCaPEWCAMWl6rtXR8oeczw88ZOi+ojk4lFSaKVegG5F
         dNiX145ma5f2C8n6Yda4rmpoVitgIbbr1kioSK3LdeMvaWkMslIZm+oaLR8z2TiVtQ0R
         JO7Q==
X-Forwarded-Encrypted: i=1; AL+hErEN9GgY9+AWYFyN8HwInQJV4chX6dKnD7OJuzrvkPPjLlCn7X5JnlONUAvpUfJdFDsstBkMAFys71S+aEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WEdoOMjl8Pp613V9yLGB/6AliZ0HNmu5FKpaU7X957zZB5G7y
	GMFfa459gyx01cehtRUZLVwlo/vGpIjuXhtE4QO2B1sAi4TSLz/fnBNEmn2GXlMk
X-Gm-Gg: AZFdTZdN5eMnDL0tt+0QFZ3O0hbjdjSH3bP9kKNDlDFXFABsjXv9aUYkc3ckaudbG0o
	Iay/p0mS0Rkj/ABFERGuK/pQu1tJVTZ9kw1ifWF+Js0XIwjPqe0WAT6yqHYy0GLo5RfqmGkXGTV
	ddQZohKg66jdozZspE+G0uUIDiJip6Yb6K+SuYv/0Pm5uTDlV20s32OYyDal9we+/2TYyhXxKTd
	EY7nvwPM6yR2QgIhbf+btQqWiyBf7FvppAom9r5zQYcxrKul42/xJbmrN9ORMEZozquYT2v3d0Y
	NpMqscQoqXSltClmpSM+RjQZdNq2IUxi5GrvfKCQIva2/mfDHa3dXlZPmUuFBBHh0hu8TsEdaGQ
	qqtzu4MyMWBQ0/vwoVSUA1uHVwJDuAaNRK3InxAD0DB1faqPRfNwx4qbUwkF4OyA9N7tJRjiIln
	BXxbl+XZTB68XTFszLhjOIJezMIErzeFpXjDRMtd/VCFHF1A1FYvLEZFU+6OT4q5qysURfGBe0v
	Zxozw0KLXRvlAjnSu7iJ4nIkbfeEVLmZ7kCyiztr/o2/FAUwxZBSeq3p80S7pnAz66FVFhxv5i9
	vQqpNsOn8fDtlwvYoUDxBkkCHARJorz9vpBVxQ==
X-Received: by 2002:a17:907:a88f:b0:c46:d493:501a with SMTP id a640c23a62f3a-c513a8410d9mr2141087566b.22.1795779974463;
        Fri, 27 Nov 2026 03:46:14 -0800 (PST)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6872asm836997766b.13.2026.11.27.03.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:46:13 -0800 (PST)
Message-ID: <9291049f-987e-4402-b32c-12c33c7aaa33@gmail.com>
Date: Fri, 27 Nov 2026 13:46:12 +0200
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
Subject: Re: [PATCH] iio: dac: rohm-bd79703: Fix full-scale voltages
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Joshua Crofts <crofts@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <0723d51fa973f0204e1c436c08a784b7b1cca795.1795699121.git.mazziesaccount@gmail.com>
 <3ec029d6-d53d-4cd9-8582-a15cfd3eb4d1@kernel.org>
 <036d044a-67ef-4716-aa0a-cdf3108c12e4@gmail.com>
 <awljZLpARRVUFqbI@ashevche-desk.local>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <awljZLpARRVUFqbI@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/11/2026 13:03, Andy Shevchenko wrote:
> On Fri, Nov 27, 2026 at 08:34:22AM +0200, Matti Vaittinen wrote:
>> On 26/11/2026 15:31, Joshua Crofts wrote:
>>> On 26-Nov-26 14:23, Matti Vaittinen wrote:
> 
> ...
> 
>>>> +	int vcc_mv;
>>>
>>> _mV is the preferred style to denote SI unit variables.
>>
>> I have discussed this before, and I disagree. Regular variables have been
>> lower case since forever. Capitals have been used to scream "Note me, here
>> is something unusal you need to pay attention for" (like macros). In my,
>> admittably not always humble enough, opinion, the whole "denote SI units" is
>> stupid. I haven't yet seen an engineer who wouldn't understand the meaning
>> of vcc_mv in this context. And, to be very blunt, if I saw such an engineer,
>> I would rather him stay away from the driver code. On the other hand, I have
>> seen engineers who have spent long time with kernel code, stop reading to
>> wonder "Hey, we have capitals here, what's special with this
>> variable/member". So for me a change from vcc_mv to vcc_mV makes this worse.
> 
> And I disagree with your argumentation because the scope of discussion here is
> more than just millivolts. We have (in practice!) already a problem with mHz
> versus MHz. Yes, in real life.

I see no mHz or MHz here.

> So, that's why it's better to follow SI for all
> SI registered units and stop messing with the multipliers.

No. There is zero reason to use capitals in variable/member names when 
intent is clear. It only hurts reading with zero real benefits.
>>>> +	int vfs_mv;
> 
> ...
> 
>>>> +	data->vcc_mv = ret / 1000;
>>>
>>> Better to do ret / (MICRO / MILLI).
>>
>> This is another thing I've discussed also in the past. If you genuinely stop
>> to think this, why would MICRO / MILLI be better than 1000? Which one brings
>> smaller cognitional load, huh? And assigning the result to variable vcc_mv
>> makes units explicit in any case. And speaking of SI units and scientific
>> accuracy, what actually is MICRO? What is MILLI?
> 
> Then what prevents you from adding a new multiplier to units.h?
> 
> ...
> 
>> Micro is 10^-6! Milli is 10^-3. So, this becomes "ret / (10^-6 / 10^-3)",
>> which is plain incorrect. So, instead of making things better, this
>> obfuscates stuff even further. So please, let's not spread this madness any
>> further.
> 
> Because kernel does not work in float, it works in integer space.

This does not mean Milli is same as Kilo. You were the one who ask for 
accuracy above (even though it really just breaks the known convention), 
and here you demand obfuscation.

> We don't
> have fractions without keeping a multiplier in mind. I do not consider this
> a madness.

swapping 1000 to (MICRO / MILLI) - where micro and milli arent what they 
are supposed to be - is madeness to me.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductor
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
