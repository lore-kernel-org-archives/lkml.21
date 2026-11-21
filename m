Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262090;
	b=Geu2hlpW1a0rwgz8nO0kP/TbaGIe7+DR/bThRCLGQDCW2HYmQhwjF3Uv3rvoc0z7zSpO
	 9V8gSq0CkpTrJsF4j72C2KuEIBP3pkEgUngJX79f5cuyw6PvMGOohMFIrcuSgXvPzNNh3
	 xDIvM7VvnP6dANAE+Y5AMg9FAjJl5Qs/dxOg1cmvNcE+I3lsfYyxqHxejvLJFAE1aZ6LO
	 GbN3Of/jfzGs8phoBm9/QMbOMLIhDsmPwNNaVnBD3pNt90LDz6/Msd5KfeX+dcndQYub5
	 ngHrK5QepzCpVkKqhPBQTGH05pRM7KjHj/scUwhyr1CKXSsXLZJEHCYfmcb0yZIhqIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=szGjatEGvzumenIGoDmUhGP3PBi4OJXA+JaILrJyq7Y=;
	b=hvSUiCZ7tn/kY3QMs78m8NfgGWzjKp0irA+bwCwIYXNpepklaE8iflIgchobZq+jWBR/
	 4PqZDiax+0d0uhDFNBl/ektfqiUqNrAsFT/JzaxqI/ZL+lxCmLmZKuJhAuZKA0UBOz6Wg
	 V4FmBOrCg2wJoi7zbIzsqiYV410MFQzKX6X2+wapva03k/HmD4p1iY3paEqS/C5lFwL68
	 KY7BE3/t09M5YEATAhH7raLzdWVAIige38eGqSmGhnekpX34oXfVheA69+5K+IbRDXNZQ
	 meuw3uJK7LgVWdUv+gyA8/dTZ7Zm4Po6kewIXe0alrzwaaMp3xKsrR/t/PfuJ76HCug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W6l+kx5d;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC99606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC99606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W6l+kx5d
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so13640315e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795262089; x=1795866889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szGjatEGvzumenIGoDmUhGP3PBi4OJXA+JaILrJyq7Y=;
        b=W6l+kx5dMX2mdJt7T6QMcJ0hI8ZEeVOKDih7eGXKn9qesUeVUO7ThUMVP1kKGuXcft
         VK7V+W6z5oRF9qG3c7Wjxb/2O6i0YdvIXxAaIz9bPP/J0V506KHJefwQgHgob+tHIwAF
         CiMiwsOGnYflWizEn8hD11X7/1dzTgSfKYa0shHOJaOclRQQOQDnsazObS2sNUv+Ab5v
         yg9vk2JQ8X19FlI0CraWD40SuQic4MS3t57KPYNuWhCfYbkJ+4W1zglAXSZQwx+xgxlm
         4fLPgZyDLm+UgTBpoKfSSkt9GZQ1sZHr11Bhyy6p328gfI9XPo1n8y6mn3y2zSLtdDkT
         03ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795262089; x=1795866889;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szGjatEGvzumenIGoDmUhGP3PBi4OJXA+JaILrJyq7Y=;
        b=lqn0vBWGt7BhsFEcCXpncePWh3SvupKK4xSgUHZES9t1G4Pm9Z6OlRW+PVI+QSL4Hd
         GC684KegnsDvLWB+jy8k6OgBzqR4MkedoR5HVd8G1RvrM42T3q59jFT/WkC2Mb/BybcZ
         ooirUOV4aEJty9domL8FyY7VtOHCAnfjhiLaNcQQmZfVVn9YmVcTAJ1K5HnWRrrcMf1c
         cohoVwnpH65p74Txt4CWLDpHDS+ttGTuwYD9yBLFTwFUBfBGTVeZcPLAA5ysCiXuGWUp
         5hzyPq3xOhoKQ01jNVVZT4r7ypcTbgjyF+i8KYTSfPth/iJw9/9u8BgHwYODVpxuCyby
         aFhQ==
X-Forwarded-Encrypted: i=1; AL+hErHsCAtemTi9IegDpOmPh3EDbB0SDRsRaDiknfJaFaiAQWu9MBgUzWAztT0zxPbY8Ka8fvQhz9yy4f14U3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OHwKgwfe1wEfNm41SnLCUZVZswbzUwv24jOmoSi1TDd67Yi1k
	kMt587/Tqm0zrD0Ahq1PMkMmdDh+xSxY70X4fY+lMLZgzGSEH4SOnT4F
X-Gm-Gg: AZFdTZfKYqCzaxu3Vwd2JxJrLk9ptNmfuqITLF6YOg3HKmU4VX+3SVo9g4+KyNK+ceP
	MqXdjW5NLarbC4fCUlUW5Zuc4l5qELbUkAX0D0+yhWuMU4lrr14RlPAIhx8maP3D+r4wLhdzEGj
	/GKPXMHPHJeIZcKJ6bqcN9al36bjzROG/N2lsGjM/zINA85I7J4u1MAvoOyJza4hbhKwjRpO3OB
	vCi3T0cn8QGkn6Kr8RFFe4EDfs2Sr1zQ3kJ9kYE7qnwUTngc51tw4uudm6nueheVRyI0LY3m8XX
	ADoDaebL/sIuZnKE/o52l+t2x0UrMaKA4sIWtHf2xMmec8GAVpVL1wwNo71dgzv2GXPuBlBAEIK
	whn+xQQc+pbGioYVl9sVGWeCKdH7fXL0XKDVgIYr7Wg1xllr3v9fRQWnXlUHoSDQIeKSyNEA6H3
	pdlxYgOll3HWs5iPRygFvRRfS6Pzr0dCmrOstGZ04qILjgQUsmx5ja7+1TM/6Wbxxlj7YZ1cyQ1
	z6VkOxoUPHSngAE0kXimPiQWGN1WOtAZ+HxCrTBid2ov30+aoNWfxIQj8skh9qP73HnttVLMNrY
	20bQQevfGPLaitaXR6hUOtSgFNryC0SjxKRlqpW6jJvTtlAWWEaPVy5ny6//TYTrFx3V
X-Received: by 2002:a05:600c:848d:b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4bb88811da9mr136119295e9.13.1795262088516;
        Sat, 21 Nov 2026 03:54:48 -0800 (PST)
Received: from [10.50.139.243] ([23.90.153.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9065744esm42471545e9.1.2026.11.21.03.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 03:54:47 -0800 (PST)
Message-ID: <7b96eb55-d357-4289-85ff-c0eaab53e8c5@gmail.com>
Date: Sat, 21 Nov 2026 12:54:46 +0100
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
Subject: Re: [PATCH v9 2/2] clk: Add gpio-enabled clock driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261015-feature-clock-guard-v9-0-c1c05a498d9a@bruker.com>
 <20261015-feature-clock-guard-v9-2-c1c05a498d9a@bruker.com>
 <179519084929.3795820.7180605641448271689.b4-review@b4>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <179519084929.3795820.7180605641448271689.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.11.2026 17:07, Jerome Brunet wrote:

> This comment has been carried since v5, where the reasoning was already
> answered: returning an error from .prepare()/.enable() when the clock isn't
> running is simply how a provider reports failure, not a workaround for the
> framework. The claim is also wrong: the framework does call .is_prepared()
> (clk_unprepare_unused_subtree(), clk_hw_is_prepared()). The rest describes return
> conventions. Something like this would be enough:
> 
> 	/* The clock cannot be turned on, only waited for. */
> 

Perhaps the claim is not clear enough then, the .is_prepared() is not 
called _before_ prepare. I didn't mean it's not called at all.

>> +static int clk_gpio_enabled_enable(struct clk_hw *hw)
>> +{
>> +	struct clk_gpio_enabled *clk = to_clk_gpio_enabled(hw);
>> +	int value = 0;
>> +
>> +	readx_poll_timeout_atomic(gpiod_get_value, clk->gpiod, value,
>> +			value != 0, 10, clk->timeout_us);
> 
> Same error handling as in the prepare variant above.
> 
> Also looking at it more closely, the binding allow 1ms max. It is lot of
> time holding a spinlock without IRQ. If you don't stricly need this variant
> please drop it for now.
> 
> 
>> +
>> +	device_property_read_u32(dev, "poll-timeout-us", &timeout_us);
>> +	if (timeout_us < GPIO_ENABLED_TIMEOUT_MIN ||
>> +	    timeout_us > GPIO_ENABLED_TIMEOUT_MAX)
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "poll-timeout-us is out of range [%u, %u]\n",
>> +				     GPIO_ENABLED_TIMEOUT_MIN,
>> +				     GPIO_ENABLED_TIMEOUT_MAX);
>> +	clk->timeout_us = timeout_us;
>> +
>> +	if (gpiod_cansleep(clk->gpiod))
>> +		ops = &clk_gpio_enabled_sleeping_ops;
>> +	else
>> +		ops = &clk_gpio_enabled_ops;
> 
> As I noted above, I prefer if you dropped the enabled variant that run with
> irq off, unless you scrictly need it. Return -ENOTSUPP if the gpio can't sleep.

I would rather keep only 1 variant in general, because my GPIO 
controller can't sleep, but gpiod_get_value_cansleep works for both type 
of controllers.

Slava
