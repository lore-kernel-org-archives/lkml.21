Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050809;
	b=MhFH2mBajiDlQeZTRvhlnYUWt4K8TNYaGelC+gsU5dXj5H281RR7eRms6U4Fh5g+o1k/
	 KOVmsFfrSYtNEBwfhM3JHiHTaONeY4NFrDWoO/bq3Ud0rt5qC7IpWxESq3B6dbDWQMrHL
	 bprjXNXCJZ5j2zpSr5k9yVrVpsO+0B2OVuvV//NIdbY3FU9BBQW+sKXKJ12FbJxgi8YdY
	 KFXws6Ve3ODUri3BEmUqqBw1NBkWdAXvvG8paqg2xHGMl1OW++5hMpPofszuic5mFyMhC
	 btZB1WdmoA/aVcPDtn5+2N9YP+cLzsWDOFtBdJTQHNcy3kFfgWV8jffEvnu+yEkivlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=g4dAtIGbR20X1kAl/FU925LvRkvwCNieoeAJRhJ82cE=;
	b=t0UemyNIzmrMm8EGCGoJ1FGBvUzy9RJ/JxnHLTPc78eRwl6KCyZY4nulWAjQ56BDt5S9
	 NWZ+ZnXo5pq1kNnA1uMYBkgCaWdZknSGAy07bnULIyD8VObsr1BC05jQt7YjNBGZ+AG6Y
	 +MmbPDAvJZnwgYVIRmceUxQ7fL007bgf1GrC3BsF9GSK1zPr6ovJdddgbefMNOvz5UleU
	 objvr79oPGlyi88nHR5sjFDJgRL/etg6K1556h1zXvlzHolOr9Z1/d/7GUnI24jsIgLGG
	 JvzjTJKlFvXRS2q1Q7maxz+Llg7l4pL5vBaXm+n73Zv1gKldzxklBDesag6SFg0c9uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SzgskFNG;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60405606A337
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60405606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SzgskFNG
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91f30ff609eso14337546d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795050808; x=1795655608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4dAtIGbR20X1kAl/FU925LvRkvwCNieoeAJRhJ82cE=;
        b=SzgskFNGhl/Mk4avrSlgfyIDuBw3t8ZX2sNTzsYCD8HGyN3RfVJRp3Q0rumL74ear2
         83GS6iFAvpj6xQFLZfOwHwq2/Mt49793yW+ogOL0JoGMNVy6v7ov4VxbE8AizrReJtWJ
         rReLEAqYSZfCkGvaYFNCSZIq6AzIzNdFD1mFJWe8eZtYycBnVV7G+gnQ41Mcl389nYSM
         RwVfQiYf1PjsXh/XNyQJxSGsx6iQPiQpScxlnYVa2NpXJckonqEq1v3JsfEnHtJV+hH7
         EcztSXhe6yJgGCMEAmbsZR0bz+ZyM6GoNaed5IWisXy2vJH4RJN38dDBEdPVa21gcLp9
         exCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795050808; x=1795655608;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g4dAtIGbR20X1kAl/FU925LvRkvwCNieoeAJRhJ82cE=;
        b=KLfL9uM4a6HcmZ0dcQk3m0a+WaRXHuNxjbZDnO84iGRQj+Xc1hXlSA4vp+e1EVGYjf
         +jIi4ozqY3q17PrKK4w2xw0yns5qy1xWhiQ8I+DbzkoYIB7GMTJSpekOBcC6mbwTD+1u
         y6JRoVDEW7qxT9uTN88D923jHUYrf1nxkoQDVTsE4aKxz+z1mV0XPo80PjhlXvxRsZis
         Oje8b6yMC9whBIek5lEUS1H1J2DR0aJtrODYbV6KKqYRtmYSe01H1l3mIJmcO744alhi
         T19C2c712WM09FkOAG3uUQVEIDVgmaJh/H5rs146D3AUjmmPD3gEsgxEyPwzOIEih1Ud
         hszw==
X-Forwarded-Encrypted: i=1; AL+hErHJXdFKCeKdrXJRryc0JkhvnoyXlzmzZpLXbnFMIIJime9GU59f8pulEGRXxrFH4yewSCkUXdgpuKs9q+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Hy8BIUHAwOrjTO0wyocG0vflze0nqpUxOxIA07TKJ5AipiNKm
	BzrVm7BiAmNg48XbVkGPP1CsfHOs7xzTO86vuQP0/8Kih10z/JNgK+vDP3w7wg==
X-Gm-Gg: AZFdTZfbP84yGXCAhX7KQBZMxiWtTn+fxX/j5lMhiYrvDQP3I2PyQ6MQhgoJzWg5MOS
	UZDY+V7zoRLEfLHA+d2s5/ZHQ2RfCn4zPfnjNeI3zRLgykNoU3wBhlgqg2FL6/XJUzpM+rrZV5b
	wa4dTjbKt2Q6Qrf4HxgJvdcDTGxtTEZ1MOjCiAVzfRYLvixoYWXisdfracKEJlCz0M4WDvQ5vGy
	Tx+dK3lmVUcWtOvHuF+MkznJED+uGRhE/jZ/jPMUp+gaPr1ngVSsVPBPU1t2dU0yWE9DQah7ePB
	QdjNjFFqpa3vY8Lw1wBc2gNqkzAHhVSzrwN/Ykjiow8WmtTGk2QAAJZnzFFrNsbmZJchdfTwozP
	TiqyqMzlIJdVNpCM+fOx1cmd9yn+JfMG9Av0z90lysF1mr9mjb8glVv36zqPpkdVbB7A0kSKur2
	UhPvRbbLQOm6/JKZydSNsxYQ4VdI9xU6hwCo8nqj566hGhucmZQLfoA42eKfC9T+OxzjToT176k
	jqKv69bzosQOgWOq3DJI69qtPEi97pKdn9urIgWjKVUOcQWiMYrU1j9/ySr/yp1fCYSSptf4305
	vTgpnV2B2poBOkwpWMwjxG+qA8SavodbBn4iutOTQR7by4owEQ7MNWGV
X-Received: by 2002:a05:6214:623:b0:921:162:ce9f with SMTP id 6a1803df08f44-92114f2b51bmr72529536d6.39.1795050808274;
        Wed, 18 Nov 2026 17:13:28 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d10f89sm36108536d6.13.2026.11.18.17.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:13:27 -0800 (PST)
Message-ID: <b6546264-4c51-45e4-9728-a433527fb355@gmail.com>
Date: Wed, 18 Nov 2026 17:13:26 -0800
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
Subject: Re: [PATCH v2] MIPS: SiByte: Fix missing function prototypes
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 open list <linux-kernel@vger.kernel.org>
References: <20261113191933.477395-1-f.fainelli@gmail.com>
 <alpine.DEB.2.21.2611180154490.54328@angie.orcam.me.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2611180154490.54328@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 17:57, Maciej W. Rozycki wrote:
> On Fri, 13 Nov 2026, Florian Fainelli wrote:
> 
>> The SB1250 SWARM build reports missing prototypes for platform time
>> initialization, SoC setup, IRQ and SMP helpers, and both RTC backends.
> 
>   Thank you for doing this.  I've meant to for a long time, but have been
> distracted with higher priority stuff.
> 
>>   static inline int __maybe_unused bcm1250_m3_war(void)
>>   {
>> -	if (IS_ENABLED(CONFIG_SB1_PASS_2_WORKAROUNDS))
>> -		return sb1250_m3_workaround_needed();
>> +#ifdef CONFIG_SB1_PASS_2_WORKAROUNDS
>> +	return sb1250_m3_workaround_needed();
>> +#else
>>   	return 0;
>> +#endif
>>   }
> 
>   It seems a style regression, why is this change needed?

The declaration is wrapped under #ifdef CONFIG_SB1_PASS_2_WORKAROUNDS, 
which would hide the prototype when the option was disabled. The if 
(IS_ENABLED() would not compile in that case since we would have lacked 
a visible declaration. We could keep this and just make the prototype 
unconditionally visible instead.

Thomas, I can send a v3 as an incremental fixup or complete replacement?
-- 
Florian
