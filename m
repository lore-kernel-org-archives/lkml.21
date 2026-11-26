Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705310;
	b=rwDf7wa0/UktefRQFQ8f84ozlusWS1RJeDZDByOLTCh+s/L1Lfxyt2CSEKqiPWWn/2+h
	 N1JtK1bSIb2UzLKOUkpl9TNYPc0vCZoZIov2TNj5RC9O0nNHpc66GJlodUi5//jtTSAXq
	 SegIQsghDZjGc1YDrzwdxXersmFfRKgYfF25krsSrWzbj7bvH6ZUi7bI60MIibuzsODZE
	 F1Me5ewnwd72vEfrbLbrXWmI9X+sNSTAXBlidmOrR6tcz/7kHMpR6gpqcM0gm7SjPEg1u
	 46rb39D1/6U5E9MmWzPVtj1Arc6+lY9hA2JWacssDRWRnM4LeQl6i47sDtUpB0hW53Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9pYcO5w1lWnU3LcG/lV8xW3siO5fUaDfkMFhAjIz8xI=;
	b=RpB7p5/EfbpTlI0Lbbn9MEUDJpWLqre3YEJ5KPptkGzx+c4CqFU2mjTN1hDJGha+dCaS
	 ik8zkD/SemVrX4ndUKxQ3C/jX+vwpbMqVzMiHwa+yRhhXr4QOTzlXVEDfsWMokpaUOCOu
	 bM7Q/rUzoST9ME+fM2j6kH3/fqL5id5NupnuILkBrFD+4APQVhTSow06JF83i8WKoJmRR
	 5TojZOC3ZZ2HUzuFro0RIbJ0SZaG26dlly+X8/1AWX9eXYtLTyyn5v1P2lWEFeBikIIuN
	 Z8emLEg0CX8v1zTuvDiDm5+s4HSJgHY87Jgcnm0mroA0h0mOulU1qLz8SlIN898tRDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mGdON0z5;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7075E606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7075E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mGdON0z5
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4395d31228so1212448566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795705309; x=1796310109; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9pYcO5w1lWnU3LcG/lV8xW3siO5fUaDfkMFhAjIz8xI=;
        b=mGdON0z5Hd2gUiYXS+tF/sU4H5tRqVTowVDdto0ksgy9JEQhONQYVH1Rt5nx8L4xnj
         ukoUh93VXrojd4IOz6idsh/09361GsT+h7sDiIWt1vQ7QTd9LamPcxkPIl8Stz3bQxck
         wTIvIhtJGHKGlvtNt71ValTst3GOG9fMLz6BCFzT7Ck+46i930sDGnRklTBTyZ0LBZCH
         jiTXzEBfUDgsTFjT0+Yh6uXQPKh8pRnbrmdgAPqUF8lCskQ06Nnm4QA0rsWdXo7YanGs
         zH5HUpl0PCr8jJnsrOcD1jPY4o7DzWgs644rj80UXaEo24gnzyTc44VTz3NJfOFkYEfm
         qOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705309; x=1796310109;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9pYcO5w1lWnU3LcG/lV8xW3siO5fUaDfkMFhAjIz8xI=;
        b=SJAg/wvFVqEkDin+CcoAf6wVP2CSLTkT8Sa4Hi/Wzo7klaFSdA5SSwYsEKlqlMx+ZO
         YZJ1eoxQieZMgbwH2W3D2wcUk0MZlF60NZN9ndFE4tEcTHTsf7WHi8UtbrcGEosXOdWX
         VaNYc/tOYoQXeH1aQ9mKyThLCjeWjnBm85DJ0WiGmbEiDCKCLPoVSO6U8nFaKO0ZjwXx
         mNFAaZDaDjsQSaTiF+ATpgtUVZYsoE3x/FwSJHlI+KWcYd9OQlMUeUYK+n1ypcvxYhJB
         v6CF061tzHsRRooG25VQOqD0lUCGZyd/Gt5jaFfvAI+dCS6GgXq4XVLQEzTZmrOWqjx5
         GnEg==
X-Forwarded-Encrypted: i=1; AL+hErERvtS6FhyT+MhG/q/m8ll5Sh7Ba075SqWGfvAzTpEf91+WbiaIqF0A4dsRV3D+l40T3S2I9ZZAF336Urw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UoXwJ9AGCu9RBuOvxgutob8ai08gRw+vDrcPzD39knUO59Bf3
	c9z5ZTzDL2Vxe60I4bYFfP6rBEhGdg2N5HqLK0lyk/J6hN5EzSQ84iGJUUwWnpwx1og=
X-Gm-Gg: AZFdTZcv3iVwKGmx4fTUXCRqRBnlwHROtES6eY55YvcAlRXuAjkKxnf1jiVyc0ohkMy
	mAb0OKz2dJaj05xQRghwqr7NDZdJTvA3cT4oiBu85C+vUpC5Vt2C0skxc2HyHJy/qyDrCnbgqCA
	fevW5We0y5I2pFLqZSZBYALiM8R2cUFPNWDGdTdwSSZGDjXmHn0PeyZ2RgZB9+gua5lqIiEsgrO
	7ystkqOQCcw38HE1mhcg7w73XvyCKOnos0z9HTUXWvnc/cv1reF1DOlbCL0gAJXJWTV4OFq3LNj
	GhqYkstbIs8QaCLBK+HUjl2+EBp7mSCkdNBt0BEa98bBzwMCu1ISBQSuYNxvJ+S2T0+0DrhpzNo
	w0oF7gvzufL1uTPRkyAKT/faGExiPWRZL5VRCu0Woyaw4vgkMJiOtftCre2KltH1gBxqShiWKiy
	fnOlV35lxho3UK5mcmsJXGqQo0PlJYgmJoReLDYGmcxau8vW9RDzq3BF3gizJXUpcJ9+vv3h2Ud
	uYJstodHR3YfOH6pAzbLYu/wb51TfcM28UD/YzXooFfEFLGJ83ds7ICCvbuSGucHUnHCWlmrcp7
	UUhoNQUyFc1LhOAdNlIfEJ3RIyEKWm1wNMEkiQ==
X-Received: by 2002:a17:906:d54d:b0:c51:cbde:cbd7 with SMTP id a640c23a62f3a-c51cbded0bbmr129708166b.17.1795705308647;
        Thu, 26 Nov 2026 07:01:48 -0800 (PST)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm47430756f8f.24.2026.11.26.07.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:01:48 -0800 (PST)
Message-ID: <e329ce21-5a24-4301-9328-917d0ae4fdb1@linaro.org>
Date: Thu, 26 Nov 2026 17:01:45 +0200
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
Subject: Re: [PATCHv3] thermal/drivers/samsung/acpm-tmu: Fix spurious CPU
 throttling
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Christian Loehle <christian.loehle@arm.com>
Cc: bzolnier@gmail.com, krzk@kernel.org, rafael@kernel.org,
 daniel.lezcano@kernel.org, lukasz.luba@arm.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Peter Griffin <peter.griffin@linaro.org>,
 Juan Yescas <jyescas@google.com>
References: <20261125173959.2198116-1-christian.loehle@arm.com>
 <CANgGJDp02H7-wLv6DoaPMeiy4UvDUC2nvSR=+mngEZ+Z4Hqgog@mail.gmail.com>
 <2162b02c-642a-446c-973e-ca80607da294@arm.com>
 <CANgGJDrnH7R9aTXhH-nj710OjwNcUTfpxE7eWGSP=9a3eoUnug@mail.gmail.com>
 <4adc1712-3608-4fd7-9eba-79b129c67b77@linaro.org>
 <DN586284T46G.271ABU0A683IZ@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DN586284T46G.271ABU0A683IZ@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/26/26 4:50 PM, Alexey Klimov wrote:
> On Thu Nov 26, 2026 at 2:43 PM GMT, Tudor Ambarus wrote:
>>
>>
>> On 11/26/26 1:51 PM, Alexey Klimov wrote:
>>> On Thu, 26 Nov 2026 at 10:50, Christian Loehle <christian.loehle@arm.com> wrote:
>>>>
>>>> On 11/26/26 09:16, Alexey Klimov wrote:
>>>>> Hi Christian, Tudor,
>>>>>
>>>>> On Wed, 25 Nov 2026 at 17:40, Christian Loehle <christian.loehle@arm.com> wrote:
>>>>>>
>>>>>> acpm_tmu_set_trips() supplies two thresholds, but the ACPM command writes
>>>>>> all eight slots, zero-filling the rest. On GS101, slot 7 limits CPU clocks
>>>>>> independently of its interrupt mask. Setting it to 0 C limits all three
>>>>>> clusters to about 200 MHz while cpufreq reports the requested frequencies.
>>>>>> This was found through trial and error while tracking EAS regressions.
>>>>>
>>>>> Cpufreq reports the requested frequencies — are these cached values
>>>>> being reported?
>>>>> Or is this what the kernel gets via the ACPM call?
>>>>
>>>> Requested frequencies are reported. The 200MHz I only deduced from PMU counters.
>>>
>>> Tudor, your thoughts?
>>> Is ACPM reporting an incorrect rate or are those cached values?
>>
>> Both. I checked with debug prints in cpufreq:
>>
>> - scaling_cur_freq returns the cached policy->cur.
>> - cpuinfo_cur_freq gets the freq via ACPM call. The value always matched
>>   policy->cur
>>
>> So ACPM reports the DVFS level it was asked to set, not the throttled
>> clock. With the hot trip lowered via sysfs so that the slot 7 throttle
>> engages, on the X1 (cpu6):
>>
>>       zone     cycles/s (perf)   scaling_cur_freq   cpuinfo_cur_freq
>>       68 C     0.85-1.21 GHz     2802000            2802000
>>
>> Without throttling, the three agree (e.g. 2.19 GHz measured, 2188000
>> reported).
>>
>> It would be good to specify in the commit message that the governors
>> don't see the throttle. Something like:
>>
>> Program slot 7 from the lowest hot trip. Above that temperature the
>> firmware throttles the CPU clusters on its own, without cpufreq or the
>> thermal governors noticing, so the hot trip must stay above the range
>> where the governors regulate. This matches the downstream setup.
> 
> Ain't that mean that ACPM ->dvfs.set_rate() call doesn't work?

No, set_rate() works. Without throttling, the measured frequency follows
every requested level (1.80/2.25/2.76 GHz at the cluster maxima, 2.19 GHz
for 2188000, and scaling_max_freq caps take effect). FREQ_GET returns the
level that was set; the throttle is applied by hardware below that level.

> I don't remember all the detauls but I think you mentioned that
> downstream doesn't execute set_rate() ACPM call and does the SFR
> (mmio) reads, basically what we have on Exynos850.
> 

Downstream sets CPU rates through ACPM as well: cal_dfs_set_rate() calls
exynos_acpm_set_rate() for ACPM vclks and caches the rate in vclk->vrate.
cal_dfs_get_rate() returns that cached value and only asks ACPM when
nothing is cached. So GS101 doesn't need the E850 approach, since its
firmware implements FREQ_GET.

> What about clocks and corresponding PLL clocks?
> 

Upstream has no CMU_CPUCLx driver. I'd expect a PLL readback to show the
DVFS level too.

Cheers,
ta
