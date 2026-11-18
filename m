Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023970;
	b=xlsQNYe5baM4d3X5BZ6fhuGC385wFqIIHPRsi3yLYbDsCl/vNgj3cTgKqmcRSqaj0QtZ
	 eQ7KW78nlhR5EX0rOQUgqJImCYIAWnq7P1C8MCcVzqRcUgXsHWyedl5z8Ov5U/wxWkKGS
	 SQm+yITnPb1BjqW4ahwK3gssUM0Jbpc8YPjO4tJYk4PR8/fe15WVuOPgDA072XTgQ+Wkp
	 G11tWVo9+3DWjAdpJXV0qrN5VvaJtKbt1t5tc+w95C9kPZIQMnnji1Il3ngynkgp3WkLx
	 2O1K77+RsMm527sYE6HBNOq8LGdZtvgVTMWuY5mHs+2HeWCuBhZJkjqnb/gERE3iIuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=L2XfYf4aRDhCK0D/8nP9CcpLQj+vmYB3RvSR5Daz0kU=;
	b=CCqVM8VLGkjDOO3GmqWCEQ0MAPGkf/pNNY0IEsMjFENDzuiLXqT5Oh971lWuaWdxirMH
	 BuDXNvzD5zd+bNpuwC1+/eR6CqoDT3YnxhdqsaD8bhEuiDTD6oCFv+zXEQ5yZAyJzGVgm
	 OMUguMxlUbNocsmtzTEs2xzBgDWtHEvZdFl8xG51jZNzIRYFgDEDEM1iDX5YdLv+PX24r
	 z/Gk73k+xnNiNrn4w/HYLN+tsw4HNWmx7MItUGrGqX66swVQIE4pV2V85Vvgzctjl6PcI
	 8jGc/R+Yo6mh+KHz0s73Oeg6iUjCupMweTVXagWDH7UQuyI4aiRh3rGMTBzzHszyQhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RR5r8KXh;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2C8606A338
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C2C8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RR5r8KXh
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c1479a959aso962721e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795023968; x=1795628768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2XfYf4aRDhCK0D/8nP9CcpLQj+vmYB3RvSR5Daz0kU=;
        b=RR5r8KXhSE2XnaTGcZnPEWVBdHkc57GSBO5iTEsChMbbGlpfjF/WLPYBeVqQvaqqJw
         O1WdmlS3E96rF0JNVegFLsHZGhdGfsOb+Mlbq7rlnLyfpvcHfxOIkwDYKbhW6dvPraMw
         8c/epJ7vKKAZMKs+1BjJLl7VXb2SRFpDov72E1MpGxICeQbwvqMEMZH7JA3BHWgpep5E
         RGbQYO3BG8TtbCT1BuVK0BHweGGiEATVJXzOz+4VsGgKQDV3RvMg+WqNTT6StMtmsDKL
         9hH0mv9yTVKQBD+uxWcsHdsSt8g189vyX97EmgYX8r9EM80faeIkk0ZwpP+YBQJ+djOW
         AZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023968; x=1795628768;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2XfYf4aRDhCK0D/8nP9CcpLQj+vmYB3RvSR5Daz0kU=;
        b=HHnAFwvDIwedCD0Q9a66eXwqwjGkvBdxg3rU6j1trQp1ZSgTFe+ZPjPyrvhmXApxqb
         79jF0KEt9n4KVPA6hsOWFwtntybaM6+Cp6YshrnepQyp32XeABzcoWA1X6gbJKBF2w4k
         agzADD4nVBIN9Rt5iAHmL+U4xWj4SzQqpYCQA7nTPNVhE/+8mAlc4iLZvTcGdgo+RASL
         3tyIi1qKXVNEWzlhvFZDYuvIMTjbh+JZFE9VEecj50HUozU+s7BHSnbrPy1JvLJ8JeZB
         hQDsCKltHCTA+P5O5l1moqE0dXT8s1gQFif9hT+evm0wh93qjKaDHdqFVv9axMInt31m
         ScQQ==
X-Forwarded-Encrypted: i=1; AL+hErHfRX4ndlO5KfqZbEwKhNZpRA73x4GF/vMsO0UOnNuldo7Z/2roEZ5LrVfiaTT24YQuVbnDbQ9gBniAvWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jFSODe8MKKQ5bbUFlP1QRV4g/G8XEMFaaln3M9lYmUY+xztI+
	FYBTiofAmxm0w5q4CEthvC6tWYGj8+naOq9mHC3GC1OSM5PK2sqyYuCv
X-Gm-Gg: AYBFou3vsg/p6RGF3+sIBrl16oe2360G+AV11anbaWbUh6ImZ6NbW57jzTctX+9YMsz
	lepYlv5HKnBBl8Qph893NttSO6X7NWHSV+KVOCxrd3NzFpQ9LWvA2oYKeqyF4Ex12HAZo9NQP7R
	EccOct9QEvqdO/6da4wFTUoHIFFCHyno7YTdWv9T33oOS5nchbIszJZwYZt//8rrR/n07ED30ZR
	Rh3ii+8VIlDQNwkmfETZz9YyaUBoIQt6JH9t/hcshg6PqQrqjL/pKSUilOUE/6ktBjoTCUpPvTi
	f5BQvUBja4s+fsObV0wUZxsZl4IsGsP71VoNQiO4hWJYcglzzNvZ7NyhsX+d5zS1nfkUC53R37c
	reAF1RDtn8cDVijC7Kzi13pbbGusIW27SaFKgI6pLXrq1h4jV42qNQQdx1+/dNzE6ZjDb41rG10
	n4EoESjdbCCXEyI47eQ1hNY0DOnW4jxTUBhG0OyGyWToVhYMikOwqTjKIDOFciEEgAP+HY3Jm9r
	w28jYiXx2hPK59+on4qGM1oVhxFJz8SToIVGsk3QNw8q2rrqB/we58FfolV1EJJNGXBu4qZm9xn
	mWYxvcRQDFxTKiGgYhOk5gDNDYGH/zyrdGu09LCUu+9hbkGAh65+vw1JctqLCyuWCngOGdO8oQE
	3CWeRoWHV7w==
X-Received: by 2002:a05:6512:132a:b0:5c1:57d3:90f6 with SMTP id 2adb3069b0e04-5c1aa080adamr1181252e87.24.1795023968247;
        Wed, 18 Nov 2026 09:46:08 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa78257csm707878e87.51.2026.11.18.09.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 09:46:07 -0800 (PST)
Message-ID: <c6a7e6a8-42d5-4470-9206-1f8d4f1a3013@gmail.com>
Date: Wed, 18 Nov 2026 19:46:06 +0200
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

Ah. I think it will, thanks for the help! I'll do that in v2. I'll just 
wait for a while to see what other comments I may collect :)

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
