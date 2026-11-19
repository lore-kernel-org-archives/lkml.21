Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079352;
	b=mPP/Q+jnBKfyHqIu9/ye8XzA9G8l8E2yyn21e1UVpD1fvLudxmGuSQN3QG9dZjQrdk8O
	 PifbAsTvB5Fzsqz05FqEokFYCpYe2PQrq478DZkdMlICzuOdI6EJ2xL530O7/K2XOY2NB
	 5Q9oyhwEPMwnkaN4MjYlFPcL2Xhruw8XXs2gejgrBt7d7cxBx4Ay+GSgexvw6L1Ap+ym8
	 RZnUl7BgZjdJyju3HvpjSg0ATUrabM5ZIuQckBaOKXST4/WMLTo/WkSs4auQvC0lKrItp
	 IKE/VMDgS6sNZi7OMt9T7TzI5IothspJsfAXkDOVg0EqRIHQcBvMwrKdLEuV2CnIt3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9oi8lNsBr5w3e44Y3FX22JF9crP76D+3fgnNVixtEfY=;
	b=1TrO9AbcsdtGj9WbKKuAPRT80cg0Y2AzAKTYlaa9TqusOQB0B76VkxrdHxYI0X+lIlJv
	 cYSIgYcazirWL+hAJde7ianT8nL/nNIb/VfYgu31HElZ56FknKlhJ8fzyy9Ym2BTVaUyn
	 ZcQBNJHGqhrJwJpZATyOwnh50rKvrRwk+sW4Y0fnkgpdbenlRc8eh/o7a7hqnq/SDO4vg
	 6ZUGpO55I5wd5ekxBc6RsDz1iaejEe2uzv/H+Gy3E0LYHMxqEU4taaJSQ8xy2V7Rh8tzc
	 gYB4HLc+9SQ7zOlBdUy2OsUIaBD4FzQT7Z8ftw90omyJMNr6BvP/sNAS2++/FZ8qv2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qLEFgXRu;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E999606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E999606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qLEFgXRu
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3acd523a802so18583371fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795079350; x=1795684150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oi8lNsBr5w3e44Y3FX22JF9crP76D+3fgnNVixtEfY=;
        b=qLEFgXRutmjegEMdb/rjrXD2DXMP0SkYUr1b/AQWFWcZt7dIG4GT0/oWqbAdRady9t
         fWFIujqixptaRvueI2+opdC+bvZcyX+8Ur/0y395gXalLTRNy6XCEHvOE4W9VHB/CATf
         aECzfu1zUQNggQAz8vFhP3/O2rbIBqtucs9fQ4DXYrMHS7TgC+mqm8GXkn0b4NtWBJNM
         Ru7jJLUHe9KIb8zrdxbRSGwZtQg3wD0O5/zsNeG42+Bu75r43tCylfS5F2apKubYqtCO
         cx+QXE3BKSBZPlSkMs1X6Rt+ym5gnRKQf11JtyiFOIv3aLB0dQGWNVNdyM+C4T3OutL9
         1BlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079350; x=1795684150;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9oi8lNsBr5w3e44Y3FX22JF9crP76D+3fgnNVixtEfY=;
        b=Q7CZUulLuCKntbFf6COeE2A6+uEW2jQDNE9ye+GAP1U1t1w03z/vb8qba+c3vuge7i
         gvUH/ZQPy59Nb4PmfM87uOTfaeGtwfLipes9+OCzcy8C3csgjUQxPzbljAqWVGhZBfn6
         xFdzH/P0T+9ZlN+0fKiCPEW+gr7wW8oGJ6JHk/N/e8yY8i28ONkjzoyKRg0Vrzw/PIlz
         Mo0Lm3LdVMn/JSVtD3OZBH18oH86eVelDRfIa30TvLGVKdVe8r063trk7E8Vf2l9SKHg
         zzQMCqatp/IJ+v2uwqUcwR1zqkOlBQv0jZ4oHHGQhP/dOG62elRhaRzgMKLf2iS2BDal
         qfxA==
X-Forwarded-Encrypted: i=1; AL+hErHE76TpwhELOse0iy4s0ne6fJSfh4UXi3CzmaZgT29dF3OH5KF7cEBEXLgMHjvfS+Ilcp4EPg6IiJV0CcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GCW8DW8+PwehWDBeBpOp9gC1ZblpSJy3qtBXDmf3NR7vIPfpw
	7XZZXce9wK3CWanDqKoc8+F5YTflkTCiMdzsPHIHsx0I0q0rGyORSC6kl5CYBCn9
X-Gm-Gg: AYBFou01S3H5sAFY/V4pXW7+/s/hIpFWT8KUJxi2cDIkDWdO5Bad/Shhz/aEi7+KTbs
	dfJkvxsUWnIIH9uCI+Q2yzptaEiLQHztzbTU+JHKAyYqhyx08f8lmikqEAB3Q8PSTCXxshUIR2M
	xOJjaIJomsuBQZnBUgZkyahBMLmw7U73PvBEmMHprTkpa9BHMobq6fPyPYj1hlfwZiSzla+gjQN
	HUeml38fXHUcsU77htAfruE0tsvoU4bQX28NM0lbA9asr3lqHDSe5ligCqnyX7lxSBF9PPO2Klq
	rwDxxdoHAgOwszDUanEFZYIyrmtiv9ZhISa1P84WRH4i0FTu12NOqJL7LFyOqRqQVjq6WHJVuAi
	kIQ/wKGKToCFW3X69VDol2jviHbtf8cmSVMMIB2qJ7VgcEKNPttAN1ssMZYgGcMHow7wyz0R8K8
	LybU9Yf22dZF1JomlrOGCLcdIKBsC4y2aYGLkkldDzCl3g98UEpk80UKiKZKs788Y7VZCXanSgR
	/GJfQ6xXyPUaUDIRnvYlxrPIuiwOCT+mtjlgpFbZ3ik3DVI59VVX80Ms2JIj9l//80Poz9YkhBG
	7RDcvrb5c98nybyiKUNPMvkJREXie9NUi8e402YSEY+NwPuCCzIxFTi2UuPmorTeAN2nt9GEQbv
	ouQ4vivEVRQ==
X-Received: by 2002:a05:651c:41c9:b0:3ac:e25f:3082 with SMTP id 38308e7fff4ca-3ae673108e3mr18231351fa.23.1795079350134;
        Thu, 19 Nov 2026 01:09:10 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae6ebf3296sm8012721fa.38.2026.11.19.01.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 01:09:09 -0800 (PST)
Message-ID: <30520c58-9ac9-45ad-ba2e-9626b8b95350@gmail.com>
Date: Thu, 19 Nov 2026 11:09:08 +0200
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
Subject: Re: [PATCH 2/2] iio: adc: rohm-bd79112: Support ROHM BD79111
To: Andy Shevchenko <andriy.shevchenko@intel.com>
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
 <ab74e547e892ccabb763a06e8231e8ed44f4fefb.1795009599.git.mazziesaccount@gmail.com>
 <av66oui-2Pk1XOIi@ashevche-desk.local>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <av66oui-2Pk1XOIi@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2026 11:00, Andy Shevchenko wrote:
> On Wed, Nov 18, 2026 at 04:19:35PM +0200, Matti Vaittinen wrote:
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
>> NOTE: In order to achieve those speeds one needs to use more optimized
>> protocol compared to the one implemented in this driver. This driver
>> retrieves samples using two 16-bit SPI transactions. The first
>> transaction writes the channel to be sampled, and ignores data on MISO.
>> Then the next 16-bit transaction carries the data.
>>
>> Achieving maximum sample-rate would require the driver to interpret the
>> MISO data of each 16-bit transaction so, that when the
>> channel-to-be-sampled was sent in transaction N, the data is read at
>> transaction N+1 - which also already configures the channel to be
>> sampled for transaction N+2. Supporting this would require the
>> channel-to-be-read for the future read to be known when the current
>> channel data is retrieved. For raw-reads this is not possible and for
>> buffered reads it would make things a bit hairy.
>>
>> So, here we aim for simplicity instead of the peak performance.
> 
> ...
> 
>>   config ROHM_BD79112
>> -	tristate "Rohm BD79112 ADC driver"
>> +	tristate "ROHM BD79112 and BD79111 ADC/GPIO driver"
> 
> So, as Jonathan mentioned this should be rather relaxed, so we don't update it
> each time the new HW is got supported. Also in a new style we want a bit of an
> order by having this, text in top comment, and MODULE_DESCRIPTION() to be the
> same (or very similar, like with or without word 'driver').
> 
>>   	depends on SPI && GPIOLIB
>>   	select REGMAP_SPI
>>   	select IIO_ADC_HELPER
>>   	help
>> -	  Say yes here to build support for the ROHM BD79112 ADC. The
>> -	  ROHM BD79112 is a 12-bit, 32-channel, SAR ADC. Analog inputs
>> -	  can also be used for GPIO.
>> +	  Say yes here to build support for the ROHM BD79112 and BD79111
>> +	  ADCs. Both of the ICs are 12-bit SAR ADCs. The ROHM BD79112 has
>> +	  32-channels, the BD79111 has 16. Analog inputs can also be used
>> +	  for GPIO.
> 
> Yeah, and here the style is to have something like a list
> 
> 	  Say yes here to build support for the following ROHM SAR ADCs:
> 	  - BD7911 (12-bit, 16 channels)
> 	  - BD7912 (12-bit, 32 channels)
> 
> 	  Analog inputs can also be used for GPIO.
> 
> (feel free to amend, it's just an example).

//snip

Thanks for the examples ...

... and also for the other comments Andy. I'll create v2.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
