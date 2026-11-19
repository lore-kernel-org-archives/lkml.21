Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072420;
	b=wibAKJRJ2ecYXtHTVG1EURFpscFK2ompjm72uww1aeveZf5DEWAQ0hHAW0G7EbF3XE5d
	 ULrwy8cBSXBR42pPiN5Enae7hAUf2EBFpDoxjhiqnwpTtZNiQ2yK/OVDxM/9KS7W7GXQg
	 ikt+jo7s6JZaq8f1i0dFJNYK6CSIZOmKlwNmDfrBuFjtABnMabUx3RexulGg5nKma5GPW
	 4bcKB48TviGvXxyPexRBs4u5tPZYrVCY2bFC1hym+z7ithxDQxyeaKhvxIlTmZKyxe476
	 g/Hux8q5UlhbczbdNIrE3mDEvof9TeTsPhc2o3Fzs3nt19fMJtu7T1gY+JOcvUG4uqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GAhJHnaYFc85HnFpE0nbnvNHLyTmKKfUCRaZ6x2kTUg=;
	b=J2HFWG6LCXOCz9hSNYpoL4YRZ6RKIV/OAcQA4CoeoDmM4zmEm9hxxALPqBuh2f11F+Z4
	 MJwxbuIVcgGztiklxsrA1PcbebSHa3qSJse3xPTzT/hvON7ZKg017Yl64aqMXwEXxUasr
	 lwHl53oQ/UcfnVlGgtyRUg7MpMvfgfwe8W8HjGaUwB5wv+uDe8HtxcqEHKYGldKg8YOA9
	 F804/LmrFUhNnjSbVPkrRxdn+SiAQbuP4h2TzKvpU7+uccMoUhl0rQsjpLZGzObFvoSE+
	 5Zgobw0Qtp+8CCGJrl0oQ4/80Dgv3nMLISuj3cnEXFh1gyUVBWviPvbfOrrT4mhsTGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XxDBMax9;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E24F606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E24F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XxDBMax9
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3adfc004920so19403151fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795072418; x=1795677218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAhJHnaYFc85HnFpE0nbnvNHLyTmKKfUCRaZ6x2kTUg=;
        b=XxDBMax9D3eru7rJzSMZjZcfwjzq2hKxgpGlNZQ/B+Z+5jX86mK9c1az1b0NTQMFXP
         gcJj+0AsihwUZAT66sR+cu/e8sD+fpiuHzJvFKQYbUa9NClzka2sBdfJT8/gnUqvhtDo
         K/hOfBrb9d2TDEdKXc6P/IUMuFlMkh2+g+iciaUJMSLa6XCTWwbSvfDy9Yzzu7hiFOuI
         a9fjaV/7Y19LaiigPPkPbje7J6JxCUA/4dQSja00EyVgnqFzzF1rE4jRs9ot7llcfoL9
         UU8MDFJ80IqpA0PasojFf44fwIlMa3MY1GQYO/ReVBeTNObiyP/qf25bqe9pbhvDj5Q6
         +8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072418; x=1795677218;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GAhJHnaYFc85HnFpE0nbnvNHLyTmKKfUCRaZ6x2kTUg=;
        b=iCKsYKJ3Yak3Qz4NSqdiGdAX4ijiy12NclzEsv/ufr87Hl3XRp7Lgn/O1pIKcghUPE
         YtA4bqdcpPfUmZHWhS9c5XK5edbWyOhhX4Kcz8kN8RXsdq+VehYt5gUj2Gaaz98Ke8N9
         0qdDMCuFLzTWqNyjvA990tSMSWAgAS6y+y1zLcwHQ+LlCl++itQX0FA1zokXg6x4YNVt
         5OWjDRBP/2JwsHs3b4hTMapFRCIaCZmCm9NSa5Edh+nMq7/RteH7TXfvj2b6/Kt+ys+f
         jvFodAczjAQMcFog7g6taPqTzh5+VjYvPJfUkofJiFY/eokDLCRLlXtCRBFsThn9j1NG
         b86w==
X-Forwarded-Encrypted: i=1; AL+hErEvlxmpukOC1XEk2NrHKFy3vlal4cx9KwiYN64FHnRsUnN4AKtCEOeS+RI1phEH+kKgR7fNKheX6OCvs2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NC2riNqnHpTd72RZ7MPW0OGxfYvuakuwTskuKB6B/ScveSO40
	n3MhBwGND1+6kvirAGt/LPuZqYx9frifWdI1y/nAK9Gt8VXfgjkQMTGn
X-Gm-Gg: AYBFou3x+ca2Y2TVSwc+tNoL70Ne0eiquPOKM1hfXoD567EMd0EN3UgfYtWDGhKyBFU
	q3uTg1bBw/tQyGBnZPRLU7EOMaEAgm473YNoreI41X/m138+8bNfIOyZUDBYKQuf1dt+PG4Kolz
	RK2/W6P4W6cfKcKFgcV92MZ/1Jzj0PHujKijXSaY2o8sYw09ygg2hnVF8wOktUkgs/pRQDvOSgx
	IqHka3LGAj7kJ2pEKoHH309kqmKXogv25L5ea+52mLpiK7Ia86tDBViX2Nb3tdfJcjOSFxOZgSf
	Z8Fkmh3o5KSEwe/hjXZ+taXH+j7GpdOPsbpP68bEAthgNcuAvs+BnWPWESSFuPKFRVn3G1MU/NX
	f2kKsDr5bsXeH8FKp2BfCfeevsi5lpZ1yCfne4hHZxcEPgLp5yISC2XWLyHqVixJjfRD2i3bSHd
	SH6XmvD78ksjzFtKeQmPz5trWLQYrg/hzjZeE2dgLPTppsfiWlRWLCojUFxdZvG8PLmtUs2YCZ6
	nfY4P9/iwD/D7bZXCn7aBkI5SN6cwNqpeQVPvHeCTmiG6ePbsc/lmuBzEpOlsuRp4qHKYqyAotA
	PQv2wm6kdnac0c7OsPxwOFiED1/Jx8zqHm4VMZDksc7d+tfHqg09ddslmaZ/MbyEQaZXxjD86LO
	1LtUJwpodKA==
X-Received: by 2002:a05:651c:e18:b0:3ac:f164:4449 with SMTP id 38308e7fff4ca-3ae671f7d8bmr15497191fa.29.1795072417877;
        Wed, 18 Nov 2026 23:13:37 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae6ebc2fd7sm7269571fa.24.2026.11.18.23.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:13:37 -0800 (PST)
Message-ID: <4dccb83b-a612-4c93-a625-f5881b63410c@gmail.com>
Date: Thu, 19 Nov 2026 09:13:36 +0200
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
To: Jonathan Cameron <jic23@kernel.org>,
 Matti Vaittinen <matti.vaittinen@linux.dev>,
 Jakub Szczudlo <jakubszczudlo40@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Joshua Crofts <joshua.crofts1@gmail.com>, Radu Sabau
 <radu.sabau@analog.com>, Janani Sunil <janani.sunil@analog.com>,
 Salih Erim <salih.erim@amd.com>, Antoniu Miclaus
 <antoniu.miclaus@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1795009599.git.mazziesaccount@gmail.com>
 <ab74e547e892ccabb763a06e8231e8ed44f4fefb.1795009599.git.mazziesaccount@gmail.com>
 <20261119025137.6bfc27c2@jic23-hlaptop>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261119025137.6bfc27c2@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi & Thanks Jonathan!

On 19/11/2026 04:51, Jonathan Cameron wrote:
> On Wed, 18 Nov 2026 16:19:35 +0200
> Matti Vaittinen <matti.vaittinen@linux.dev> wrote:
> 
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
> 
> FWIW there are quite a few drivers implementing that scheme for
> buffered capture.  Look for drivers that preprepare an SPI transfer.
> Absolutely fine to not support that optimization!
> 
> This seems like text that probably applies to both parts rather than

Yes. This applies to both of these ADCs. And thanks for the pointer! 
Once again, I really appreciate your help. I will definitely take a look 
at how this is done by other ADCs. These two aren't the only (ROHM) ICs 
using this type of mechanism, so spending some time is well justified :)

> being directly relevant to what is added here?  If you did add that
> support it would be in a different patch.

Sure.

>  I'd cut most of that info
> to keep the commit message focused.

I kind of agree - while I also believe that noting the performance 
limitation coming from the driver itself makes sense. It does not need 
to be this verbose though. Besides, the verbosity already worked as it 
made you to drop me the above info ;)
//snip

>>   static const struct gpio_chip bd79112_gpio_chip = {
>> -	.label			= "bd79112-gpio",
>>   	.get_direction		= bd79112_gpio_dir_get,
>>   	.direction_input	= bd79112_gpio_input,
>>   	.direction_output	= bd79112_gpio_output,
>> @@ -378,20 +387,20 @@ static const struct gpio_chip bd79112_gpio_chip = {
>>   	.set_multiple		= bd79112_gpio_set_multiple,
>>   	.init_valid_mask	= bd79112_gpio_init_valid_mask,
>>   	.can_sleep		= true,
>> -	.ngpio			= 32,
>>   	.base			= -1,
>>   };
> 
> There are only two parts, maybe it is simpler to have dual gpio_chip
> instances pointed to by your chip_data? Keep the full state of each in
> one place?  I don't mind much either way on this.

I didn't even evaluate such option. I'll try it out and see how it looks 
like.

I agree with all other comments - even though declaring the indexer 
variable in a for-loop requires a bit of learning ;) (Which doesn't mean 
limiting the scope didn't make sense when index is not used outside the 
loop).

Thanks!



-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
