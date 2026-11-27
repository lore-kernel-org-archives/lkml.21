Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761266;
	b=ejHWygTfgGj07FM14BsbqR55nCivf3MT1lMHgl1tMb6GF4s5gBa5Uqfjppb7H843QMSl
	 aJ4lD0SsA34XBqxevAsTOp3ADbe6kPwj7ryEWjAuqoC5eiYglCRkUXX7yzia+W5LOyaJf
	 FZkWIqQkxhv2AqY0aB2We2od4/dJFc/uIomxf9gdl1oB+lpqV9Iws41yvU7ujOMwvvHIi
	 3bUztSHZ/3RrSQmHBzG3Ka0faNV3g5lnjy0VnZ6qMydeoJF6qVfy049NB0yfj7yubdlxv
	 bUjqSNDPBApoocBmnJ15Uaalwi01orAK3tUr5zUtCScLXt7hYz8Mv6IlCipbiOQfq2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gUzNN5Vkw+FWG6ldm/CpYslMZUG/iWEMjDh+KHc0a9s=;
	b=XSsc44pEu+txms48HHVsiEm6f8K0DMNmLWNnMq/ht85Nx/KJ2LY6BzkIS3ARO0M0aVPk
	 hsSQPjOPTi7qtqkIMXbPvo5GvB4RVvrb41cnuKTVLi75IkX00qnjnScESncTvH5PSM/vs
	 0uvANHOUKThRtAWsL5pIGSYIF3OcPdCj59f0waa12Q6oh4IYPWWA7CEPm8IUlnDzrmA89
	 mpko5/D9lGRI9k+bCXLVubjvyVfS8RNQ8MyDaU8bRFafdmESoyclwQsI2SA+Dbwf2VZON
	 tvWYwMOJkGBxef5uLOpTt2V7O2YSnh3iD6hoywYgHNnfXGVaJb4OUgvAcCXh/JV04aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HP53Pcxz;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C20606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9C20606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HP53Pcxz
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c1479be604so5929432e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795761264; x=1796366064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUzNN5Vkw+FWG6ldm/CpYslMZUG/iWEMjDh+KHc0a9s=;
        b=HP53Pcxz6VK/d6Ax3MTyVnSdtArB+vXwV3IZ8ubtFb78o88Zb1uKFP/GOgE2eC3VUz
         zZ+PT6v2ILrKcaJaqFVU1QDdbdTVWxvfrevuYbQkj/BiufpDAchFNczsvGPEcgXYpqF9
         Quoc1a68aOcasr9mZ9qICWsu+RLRoPzyiFkally9q3S0sFHEvEcLwSUDRczNAsTV4xtx
         QzHJRjiyoUNFHnwFzxaok2gagjHNmMaxoOU58dR3HRe4jfJy3tqsRdxQVgU25j3ikOYj
         TyRi7NVI5VHDmKH4+Zcn6VQfo/pyjQNQJjMHNkHw/PcvhPxxvskDg0J4szE4F0H45FKK
         3uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761264; x=1796366064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUzNN5Vkw+FWG6ldm/CpYslMZUG/iWEMjDh+KHc0a9s=;
        b=j5NaGMW2Y70WKWvHDCBvobL5+QTeeO2JBwnED9i/mVtQ8BURodLzBFjdFGZeFVBtDn
         h7EU5RihxXcJ9Yq0t7cnh7fGzMByMojnHDOnGUXS2ZKKLjixQLW/ub7VhcHJdpdS/iSB
         R1ajWQ2tOm64K5EsYpmX4fJ55KAjVtz2eEuFEeVOCLbocsY3iJAsfPB2t8t3F1VaTfbo
         g65r8Fop2U1yF1xiNc/XAe+FuYw1YErD9pAkYCHr8QxxNxh5XIZr6ZkLuZ5ovQFFlEN9
         yqvKLaW1nhArLDph2fo9Iv8sqwAEsz6UZ9Z9JqrYuBG7tDlQUNhyBfp2588KomoRnSqc
         OmMQ==
X-Forwarded-Encrypted: i=1; AL+hErHS0JihbY+T9mY8TwO+KewPdiwYvqxkWE3KAtmejByxENGhf1Jjchb5MTYlj3jaxt1jv9KeDN3or/bYPyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z91ZWXnfISFa0jQkwiLBhT83OqWsQ/DT20HWx7n7Xr05SCAP2DR
	KJTsUEa5mgKWPYsY7vgf10ee+v/Srp8NaG0wtYiNIwkMSRt0tMkdFOp5
X-Gm-Gg: AZFdTZcHmnZDOMuSckzIeT6uoIU4GzzC7KSlYwp2+82nn/eJGyjfWflLmx5YCkYMCRf
	TCXHiefjITzcj+wf81gcmHGDhjqZAzb8j7sImirVV6aw2BxGvsLZTTfAdOaB1ZFQnm+q7mhU4vH
	452gKpfI/xifRvDP9x3LafY9gpI6l0AoQvA7GvzIN/syT9IRouoyoujZ9HbrrxsBxRWz1zrsp+a
	Tfcq0Le8humd7liblQCy/Kwh8BqWr/Ml2Uzx8Wmgr8aO/O/jvwGOZtiI5Dhxq7XWAgQ4X/BAfJC
	EHSmKZWBiX3+j7ZMcGxr0wupJyJVuCs7F5lEQVJkzbwYg58mLYGXcw8+OPkt9qt+UQmvHJlgpRT
	VdMhzZYr39bN4UhIM1HjZiPo2n8mnHEajNXg5aM9cE3YwN/Tk9TkC9qOR/442ShyDqV/3C7GJjH
	yjXI7lI7Rxq0wmHAEqkVd7mfQuXxR4YfCyizzg+MJr8JSE8xy+BwT2z+4Z4jrkXyuNt5MCiMuzY
	Hsvt5orQbU2/50FlSAUwYy3WJjRU/iXDIYQvKaGmrIfvd22dLVstV/TS7qW5Ypsw/KLT8sStEak
	arVQyWVA7SL8a9th9XSZUzXB5KujLHNEusJzbRtHgX+rMPv4ScrRxuOHDsXDz872nwtLbZLHOhL
	Y2xGCMtLBPg==
X-Received: by 2002:a05:6512:108a:b0:5bf:b93e:8854 with SMTP id 2adb3069b0e04-5c1bc88c6f5mr6895499e87.57.1795761263755;
        Thu, 26 Nov 2026 22:34:23 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd07a2a5sm5678566e87.78.2026.11.26.22.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 22:34:23 -0800 (PST)
Message-ID: <036d044a-67ef-4716-aa0a-cdf3108c12e4@gmail.com>
Date: Fri, 27 Nov 2026 08:34:22 +0200
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
To: Joshua Crofts <crofts@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <0723d51fa973f0204e1c436c08a784b7b1cca795.1795699121.git.mazziesaccount@gmail.com>
 <3ec029d6-d53d-4cd9-8582-a15cfd3eb4d1@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <3ec029d6-d53d-4cd9-8582-a15cfd3eb4d1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for the review Joshua. (I appreciate reviewing effort even though 
it may not sound like it.)

On 26/11/2026 15:31, Joshua Crofts wrote:
> On 26-Nov-26 14:23, Matti Vaittinen wrote:
> 
> ...
> 
>> diff --git a/drivers/iio/dac/rohm-bd79703.c b/drivers/iio/dac/rohm-bd79703.c
>> index 127ccc2c4a22..1d58bc1544a1 100644
>> --- a/drivers/iio/dac/rohm-bd79703.c
>> +++ b/drivers/iio/dac/rohm-bd79703.c
>> @@ -41,7 +41,9 @@ static const struct regmap_config bd79703_regmap_config = {
>>   /* Dynamic driver private data */
>>   struct bd79703_data {
>>   	struct regmap *regmap;
>> -	int vfs;
>> +	int vcc_mv;
> 
> _mV is the preferred style to denote SI unit variables.

I have discussed this before, and I disagree. Regular variables have 
been lower case since forever. Capitals have been used to scream "Note 
me, here is something unusal you need to pay attention for" (like 
macros). In my, admittably not always humble enough, opinion, the whole 
"denote SI units" is stupid. I haven't yet seen an engineer who wouldn't 
understand the meaning of vcc_mv in this context. And, to be very blunt, 
if I saw such an engineer, I would rather him stay away from the driver 
code. On the other hand, I have seen engineers who have spent long time 
with kernel code, stop reading to wonder "Hey, we have capitals here, 
what's special with this variable/member". So for me a change from 
vcc_mv to vcc_mV makes this worse.

>> +	int vfs_mv;
>> +	unsigned int num_vfs_chan;
>>   };
>>   
>>   /* Static, IC type specific data for different variants */
>> @@ -49,7 +51,11 @@ struct bd7970x_chip_data {
>>   	const char *name;
>>   	const struct iio_chan_spec *channels;
>>   	int num_channels;
>> -	bool has_vfs;
>> +	/*
>> +	 * Some ICs use VFS-pin for full-scale voltage for first N channels.
>> +	 * We need to know these channels to get correct scale
> 
> Small nit, but missing period at the end.

Thanks.

> 
>> +	 */
>> +	unsigned int num_vfs_chan;
>>   };
>>   
> 
> ...
> 
>>   static int bd79703_probe(struct spi_device *spi)
>> @@ -184,23 +206,26 @@ static int bd79703_probe(struct spi_device *spi)
>>   				     "Failed to initialize Regmap\n");
>>   
>>   	/*
>> -	 * BD79703 has a separate VFS pin, whereas the BD79700 and BD79701 use
>> -	 * VCC for their full-scale output voltage.
>> +	 * BD79702 and BD79703 have a separate VFS pin. On these ICs, the VFS
>> +	 * pin provides the full-scale output voltage for half of the channels,
>> +	 * and use VCC for the rest.
>> +	 * The BD79700 and BD79701 use VCC for their full-scale output voltage
>> +	 * for all of the channels.
>>   	 */
>> -	if (cd->has_vfs) {
>> -		ret = devm_regulator_get_enable(dev, "vcc");
>> -		if (ret)
>> -			return dev_err_probe(dev, ret, "Failed to enable VCC\n");
>> +	ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to enable VCC\n");
>> +
>> +	data->vcc_mv = ret / 1000;
> 
> Better to do ret / (MICRO / MILLI).

This is another thing I've discussed also in the past. If you genuinely 
stop to think this, why would MICRO / MILLI be better than 1000? Which 
one brings smaller cognitional load, huh? And assigning the result to 
variable vcc_mv makes units explicit in any case. And speaking of SI 
units and scientific accuracy, what actually is MICRO? What is MILLI?

...

Micro is 10^-6! Milli is 10^-3. So, this becomes "ret / (10^-6 / 
10^-3)", which is plain incorrect. So, instead of making things better, 
this obfuscates stuff even further. So please, let's not spread this 
madness any further. (So actually, this should be 1_PER_MICRO / 
1_PER_MILLI - and that'd be even more cognitive load. When did our goal 
changed from making easy-to-understand -code back to making 
fancy-looking code, which is harder to understand, while claiming it to 
be an improvement? That's what these discussions really look to me.)

I agree on using MEGA for 1000000 and even 10 * KILO. This makes sense 
as when the amount of zeroes increases, counting them becomes harder - 
especially with old eyes like mine. But using (MICRO / MILLI) instead of 
1000, that's, in my opinion, just plain stupid. Intentional obfuscation 
of a perfectly clear thing.

I am ready to discuss these points when I submit new features, and I've 
done this quite a lot in the past with Andy ;) But with a fix for a 
pretty severe bug potentially causing unexpected voltages being driven 
out of a device - which may cause a havoc to hardware. I'd rather get 
this fixed ASAP. Maybe you can send an improvement patch with suggested 
styling "fixes" if you feel really strongly about them, and we can 
continue discussion there? I am sure Andy will also join us ;)

Yours,
   -- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductor
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
