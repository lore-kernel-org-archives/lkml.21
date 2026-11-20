Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204888;
	b=ZrlE+/y1dkrYdQmPcB5X+6Bp5w5AijH98DAN/nl7Ulf+FiwQegRWQ0TKp+YJbmV7D+mN
	 fyjxF5XTi+YqWqKd8H3loFYMbTNkoXOYj2/J/C19JTnXlB1kgF8kb/yMPXvhBWe4Q22j0
	 2XFbqaFcQexWQRHDpbTXSglareR/EPfUHZOlJaSnbbAzna746LWPijkEKq9jsN9usx5QN
	 mu6w+YFySAZBvowa1c7QvGnRxwCRNdp9M61/syLhnFv6lO014bGOSZddMSxJxGPVh9mpN
	 MpyEEuCfGR4NjMgOvNz0VctV3BFDfCYVz2avlTWYUHo7r6btMrgl9Zt9G41jCHRG8QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=iSGO4LNksZXfBpmglfcOy2L8jlCLunM6n2azCj2uMuQ=;
	b=rjBKwiMYDI+Ir9FH5fdMszfokb+FJ7YWam/QgjPWMEIVfXDohBuNy2Y+jjGd6MjkhqD7
	 q8mxu50HCsggn3PnJxAHHhmrmOhwZbjDJVJ+WMsKaSk9oHg3NuwyI8tyUSOruI0F6HoZo
	 +/aY/UDmjCUuv0D0oIrl74YsnY69zqzHw4PB0sETZxp8nD1LingACTB0FxHnEikvpoMiL
	 D3A3mS7bk0DV865lwtyARnfxI8y7SQqleeJ7ymZpKmgzHOrBOGB7OT1qBKVWEXroUl9k0
	 7MnKHiDlvBjXVEsqQpEgyw3+NwlPnHafaEAr3TK2Gs5V6gWPE687URHrddm4IypD1mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=fDBnhl7y;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84D8606A6E2
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D84D8606A6E2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=fDBnhl7y
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-717080a2d50so1198080eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795204886; x=1795809686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iSGO4LNksZXfBpmglfcOy2L8jlCLunM6n2azCj2uMuQ=;
        b=fDBnhl7y/DbSsOMl/RAnyGdtT6LuKWjdhBOA8/KRPGLuAlMzxz2vJ0MyTzF9vZR1XB
         l+yhPV5RlzKajGdl3BTOJpVuDiDfjd+dTpl1F2+7g4GllslwpYw2w6DvjLMe0IYgmSB+
         HClgl3YAPX+e+82/dscEH2F0dngNex9YhHcrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204886; x=1795809686;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSGO4LNksZXfBpmglfcOy2L8jlCLunM6n2azCj2uMuQ=;
        b=SD8HGYHZxUzqug/i4PWTCVPljjB3iGXpQDzp7u2+e2BwfFNPWgczTimwW78m8XCM4t
         seOuhNiqg+jCRtnr7nX/YvFlrOcS/BsUXc2EofRPLsuoHedMwQTm1zN2rpdJe6ZVgtuS
         Ht/2kb4oZuLBANi9xCwWozD/f2CxVZ69qrdkqQ2qPkvfwREegFprdMAlGtUYQjnDHs+e
         GbL6xT+mion+oCgXS7R1G/aFCdtz28qo1qIA7TyB4aupNSdJ8uBFOyR0umLqoyVuSVgx
         wb+XqnSHnPSfuADMmhf9ujrRH8UuoNOw9a3F1T6j+ATQbBPM7GzGxdfioPGNt82/Xri8
         NwXQ==
X-Forwarded-Encrypted: i=1; AL+hErFAdyeoHdBKoG6Gk8f33VnE90Py5GzRQM3SVB9g9VKlrD5JA75iTAyRjUHWbWf0l8ZKldhR8K2E37zCZP0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t8mbMyh0P76WU1kaXHsj6G7WdtII76Lq6hOQrvgu/337kI2yC
	wh49m2HB9NrZzDO00VNvb0/4yz8XbgP00OosU10h/p9uIuvlrDD7u940TPXqv9muu0c=
X-Gm-Gg: AYBFou2Hqbb2RT3wKO5MEM5HumVfyUXsqUtGOup22Ynoax3NNpRWPvVGRQR9FVPDKlD
	ykPpxb0m4Xd6lzuSFKqkAFRFsqSAYVCud9YJFAOTP/Gf0m+lN/EC1dXLWJ8X9A2uLlwUQnpfTFv
	/cwzchusXlv2FcE0bVHRGN8AvGSUP/NerceQOkiIX5icn92JzOqVD4rrSOEDMRRDnfdEyUzZsno
	SJD7HkUa10R4pnYOdKCD8hqO6OiHDov+Qw3IEv0Vr6y2k6+O7wmNj9dnefml2XORsQ681oJCE9v
	k82WRgnmF+cdjkxW3GtU5EG+JLS3QF7dcwJLqo+4P0ajO6BSB3VeyRO4JPfMM4O14ZFtZ5RoSYR
	ivj/ROS+U94Lepiwo52zKgaji7INl10T47UPJX1BWe9DMmCyxeqNDRlhCcRfSygjlyO0g+oBsYl
	GnlfnQpFGx7cT1rUGLibVYc+Bm/k7rYcg1NpLTzXSrNR9vc1sZUFN5GtoWx8weMF0RtaO52t1gn
	QSKuFvC+j8qLrp3M65cFS8MMx64+JPSGW2vfMXcITGrc2R+mieXHLxnH9dbuSJE5kN+KP4qlaSX
	gjleNscykSnIbOOuyjG1L5op+IXDB4AMJj5bYwFzoo2O0+HTlFkLjX2osP7p
X-Received: by 2002:a05:6820:a511:10b0:6d7:d91d:d77d with SMTP id 006d021491bc7-71b395172a7mr2502103eaf.58.1795204885592;
        Fri, 20 Nov 2026 12:01:25 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631670c44dsm2751259a34.0.2026.11.20.12.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 12:01:24 -0800 (PST)
Message-ID: <f3bdc42c-8c28-4b5c-bfa0-41ac31b37a43@linuxfoundation.org>
Date: Fri, 20 Nov 2026 13:01:21 -0700
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
Subject: Re: [PATCH 1/3] selftests: use local variables consistently in
 runner.sh
To: Jori Koolstra <jkoolstra@xs4all.nl>, Shuah Khan <shuah@kernel.org>,
 David Ahern <dsahern@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Hangbin Liu <hangbin.liu@linux.dev>,
 =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <ricardo@marliere.net>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl>
 <20261118-kselftest-run-timer-v1-1-53a838b2d62b@xs4all.nl>
 <8a436334-d306-4a34-bb7b-efc713aed0f8@linuxfoundation.org>
 <1254980601.2097872.1795173276553@kpc.webmail.kpnmail.nl>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <1254980601.2097872.1795173276553@kpc.webmail.kpnmail.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 04:14, Jori Koolstra wrote:
> 
>> Op 18-11-2026 11:13 EST schreef Shuah Khan <skhan@linuxfoundation.org>:
>>
>>   
>> On 11/18/26 06:40, Jori Koolstra (CIQ) wrote:
>>> run_one() and run_many() assign their working variables without
>>> declaring them local, so they leak into the global namespace of
>>> whichever shell sources runner.sh, i.e. run_kselftest.sh or the
>>> RUN_TESTS recipe in lib.mk.
>>>
>>
>> Hmm. so if a timeout value of say 60 seconds comes from a test
>> settings file, does it persist? Can you see that if you run a
>> few tests using TARGETS variable?
>>
> 
> No, because it is doing
> 
> 	export kselftest_timeout="$kselftest_default_timeout"
> 
> at the start of run_once(). I was just trying to get it to be a bit more
> consistent and less bug-prone. We could also add readonly, which is in
> POSIX. But that seemed too much.
> 
>>> Declare these variables local so that local is used consistently
>>> throughout the file and the sourcing shell's namespace is not polluted.
>>> This does not add a new requirement on the shell: local is already used
>>> in run_many(), in_netns() and run_in_netns().
>>
>> Makes sense.
>>
>>>
>>> Also, obey the convention to use upper case names for variables that are
>>> constant once assigned.
>>
>> Can you elaborate on this convention?
>>
> 
> It seems to be what was used for runner.sh, local variables set once are in
> uppercase.

Drop the change. There is no need to add churn to fix something
that doesn't need to be fixed. There is no strict convention here.

> 
>> I don't want to see these changes combined. We don't combine
>> cleanup and convention changes with real changes.
>>
> 
> I'll separate it out.

Send just the real change patch.

thanks,
-- Shuah
