Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176103;
	b=PRHDWwWJP4kxpjXm20PLCSJ1ldzMm2hdMfLd1LBYEgkAO9O2gdgTfJUZeEqMxfP03xMX
	 KeXDslhRoLRXVgMM7boA1A4lFWTv0U/FJBuTpO5/OdKzTjUROjxoTSXZIz6yuLDBKHHuu
	 YUXO7CxJ1KmQWW4sc0C44ZxnfSpVMh2CwJZ5cU6qZcwtueZughhCWoMmpHsmk0hz5mkLQ
	 0RWMVKI6K+SBLu3nh9ox7tNzvV87X1o4XUzD7DDabUyOLR88ZkF6dzUJ588y9tHZaH3HV
	 5p8CoeND+6l66lmusUQTrXVS2WJcnp6hsAxTpG1ioNxnygwRiYMJLMcS4zxoy4lplJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MAU1alsnTI2aWDlPsrvvBfpXKOIn933Znnm/A0R9ZLc=;
	b=Dk53nRot8d33KzszkuI8JH0xZ0BMH1ye7gz4u7ISzUcEo0Cccj0ogH2EVhYHqqp/qyXW
	 YDvtivV/SgT4hjpqifgGc1OS38mRPuYE1Js7YfFGYGWQlxYaxWlzXeHsa+KgrGHd4lhey
	 N7mO78IBh2AmXuy4/n2tZl+x48Xm04AKUf2wox7dgrouwO3zMaapD65e4afODJKFreh+U
	 Pv3pB2LSDcCmHKxcvKQxHvlLRh0XRjA/RhI2O9hABNnVebvo2FyiW0lF5jX9nnDk0ZmO+
	 KpHH2NqJYENBnHkh3GdvX8ZjxKm+WMVmStIyA2YfSTdq3SmbwkYbUCKDOnJz+eJ9qVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BsVfFHBz;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5CF606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C5CF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BsVfFHBz
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3acef9307c7so6404381fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795176101; x=1795780901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MAU1alsnTI2aWDlPsrvvBfpXKOIn933Znnm/A0R9ZLc=;
        b=BsVfFHBzdir5k0WfQJg7M2TKjqOQlCznxkryG6RC+SXvakiGG3qoADnIipX3jLyW3k
         wYG+y/NBBdMX7kMd57swLmjdawwqSMGbYRqAe+IGN/evNX/aTFynUaG+PB34OtUMFiGG
         fI3PzFc8pGoQH+NgdxjfD1mkOKTPDCdddPvvdg9i3r6bTEs9TLK2BxJuEKY39pnYJn6C
         hSefyInd50J2VDe7NfW9nHWMRncvyeKq6xhMHdCbQEmoAib+YaU2jRy0suhdEUKel2dr
         h5GfuVwNBone6cywL7EKfYtsY62ftNf5C9ySC51aplwfsocKVSUaZKP3V7thbyINLeq9
         P8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795176101; x=1795780901;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MAU1alsnTI2aWDlPsrvvBfpXKOIn933Znnm/A0R9ZLc=;
        b=gilyHLZUsBLO66p0kKtzGR5V0/PqAk5dq5yheUpyk88qXuKSvDXrHYpPHPr/OhIGmm
         Wpuvn7ujYT97dwC6mqHaOdDY7QMrRqaOPL8Nsk6Ahmxh8/HORb5p7vw9DmkwRUJ+GrTm
         2/Wz9Ijne2PsAuVKRSsSPzGI3xp4MNnU115LgBJ5ICaGZl7lJN16nZnr7QwDzFzlhzse
         G6ILmqxv5AnsUPyRZborFHVzl5lYukmoy8IaJwH6HQ34xPva7PWPLU7PmA3Bg2dIzmNp
         NZaBtHvj1Dozne/UL8pE/BXWFwISkbwUoxQQ0CRX0XrvQXkTKQMYSclmFOWgQSUFiBDC
         0hlA==
X-Forwarded-Encrypted: i=1; AL+hErFU3UgC1jvM4orLfZXIHhYE28vFONclxeC/3xBbrUqjhuIuIse9lgWxkjUfXlREdfhZ8NXTQ5UkUUtNPb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tIFbZLwNrbWt3Af7LEQ48AFP/kJcutCBT+fJ/ym3ajlI3yK9v
	BAt0qPoEsgx087tj8XsRda9tgGrOw0lzYfi/qAd2M0D5CiMbdtBA1+Bf
X-Gm-Gg: AZFdTZcqsejPym7cZgZ/V/Z56UdffdkxVnB8Fat9W57l4eF6Dqj9VkHvI0LdkT/mgji
	o5xwobx6R8O53kVis8Zc9+tyf4oHjdUQ/nmE21X6tvgTjwUiISYHYMXxY3ilXzOUv5d0Hwi2erD
	uQbA9ORP3NBjH1klbysbBGseCaj9nYK01/PTB+ZHn5FLIX3ZbDg0MZNVbJY+sUj3k2AE+F+B89q
	zTVrNvb63W3Uwke7xs9c1QBEOH0+h6OD6MD+18uEwPqXVHW+aAurbJhe5JZB3fOsRxy0dqfqWom
	9CxYiXenRQHlbNnR8f9ZMmmBJje6CuD3vr2Iea6EM8YcytS/rZdATXNO/v7dDtX0Yc6yP1B1euh
	DtfExsD9LOWCZFkxfY+h6f7YrUYW0jwg+8UTBtxO7rpYZuXHbPLuVwwVveel5Qsz8FngQu4QQqF
	cjjZ8vNVKDhh6u2EzQQodTNK7xqOv0tyzsTSxQrhzTMNPKeAmFaFacKZGhdGbJJ6hDqxTxEcpJf
	+uxlevbNd+3f8AaB4PwnvcNwIo+BJDzPPWYSrQstrFzgM093HplQA6vUzR8rK/AL3+ieZU304Nc
	jutOB1uz19EKe+s2x7coinlz1zuWyjAYgM3bt3RFxpJLnTKtUQ4v+kpUkre0VTwrta+zW01IYj0
	31UHE1YUipUW6VVJn8HWRhBvjGjpm5Ck=
X-Received: by 2002:a2e:be8d:0:b0:3a6:6f81:1027 with SMTP id 38308e7fff4ca-3ae7fa94f03mr8379171fa.24.1795176099614;
        Fri, 20 Nov 2026 04:01:39 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8055cf80sm6924401fa.36.2026.11.20.04.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 04:01:37 -0800 (PST)
Message-ID: <bf0dd82b-e1a5-4ab9-9ab7-1641181d303f@gmail.com>
Date: Fri, 20 Nov 2026 14:01:36 +0200
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
Subject: Re: [PATCH 1/2] dt-bindings: iio: Support ROHM BD79111
To: Conor Dooley <conor@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Joshua Crofts <joshua.crofts1@gmail.com>, Radu Sabau
 <radu.sabau@analog.com>, Janani Sunil <janani.sunil@analog.com>,
 Salih Erim <salih.erim@amd.com>,
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Jakub Szczudlo <jakubszczudlo40@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1795009599.git.mazziesaccount@gmail.com>
 <f69b996cc07fad1712871fb8b0436c71abd435b9.1795009599.git.mazziesaccount@gmail.com>
 <20261118-ancient-ominous-4f2a4a37369b@spud>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261118-ancient-ominous-4f2a4a37369b@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2026 19:37, Conor Dooley wrote:
> On Wed, Nov 18, 2026 at 04:19:11PM +0200, Matti Vaittinen wrote:
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ROHM BD79111 is very similar to the BD79112. Both are ADC/GPIO devices,
>> where pins can be configured to be either used as GPIO or ADC inputs.
>> ADCs are 12-bit SAR ADCs and GPIOs support input/output but not being IRQ
>> sources.
>>
>> The main difference is amount of channels/GPIOs. The BD79112 has 32 pins
>> for this use, the BD79111 has 16. Furthermore, the BD79111 data-sheet
>> promises 0.5 MSPS sample rate with maximum of 10 MHz SPI clock,  whereas
>> the BD79112 data-sheet mentioned 1MSPS rate with maximum of 20 MHz SPI
>> clock.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>>
>> Note, I had to change the 'root-level' additionalProperties: false to
>> unevaluatedProperties: false in order to allow the properties in the new
>> allOf:
>>    - if:
>>       ...
>>
>> section. It seems to me this is what a few other bindings in IIO do, but
>> I suppose it makes this "less strict". Well, since I am terrible with
>> writing bindings, I'd better point this out and ask if it's ok, or if
>> there are better way(s) to handle this?
> 
> I don't think you should have to do that though, since the children are
> described in the same file.
> If you instead retained the pattern properties section, and lowered the
> restriction to channel@<any number> with reg with the max of 31 and in
> the conditional section constrained reg to a max of 16 does it work
> without the unevaluatedProperties change? We typically want properties
> defined at the top level and constrained in conditional sections anyway.

Gah. Either I don't know how to do this properly (which is likely), or 
there is a slight caveat. When I tried to do what you suggest, the 
binding allowed channel@X, where the <X> was is out of the range. Sure 
thing this was caught by 'reg' being out of the range, but it still 
allowed odd combination of

channel@X, reg = <Y>, if Y was in accepted range.

I suppose the 'X' and 'Y' in previous example are expected to always be 
the same, but I would still like to catch this type of an error.

I am about to spin v2 where I use the BD79112 limits (channels 0 to 31 
allowed) in the pattern properties, and then do:

"^channel@(1[6-9]|2[0-9]|3[01])$": false
to exclude 16 - 31 from the BD79111.

I am not super happy with it, but it seems to work and is still decently 
understandable even for someone yaml -illiterate like myself. :/ (At 
least for as long as we only have ICs which don't increase the amount of 
default channels. That might cause the exclusion regexp on other ICs to 
become ridiculously long or hard to read. Well, I don't have such ICs on 
sight for now.)

Well, let's see what people think of it :)

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
