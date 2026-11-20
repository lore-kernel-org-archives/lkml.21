Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207204;
	b=N4MjsojhyH7LZZ6kMK6iau5JTs7eMgAQw2YEgUqlGaLA1SAR+JN183+CNa8mVcezv2Qt
	 rFOVQrEnXlCou1r+cLqxsskUxdkx2F3SPhQyWyeoZD64ndLMWaFzgtbmYUPtO9rs6zoIt
	 PpLhFtqruqS1A3YNq/BHNcInPZMFiaHbywdfG5l5ST8/42Cxk7enCmNYf9Iner13tdUiY
	 01UkIBxDt8w46xXJ0RGgfxxeuUBlJRlYb+YoojWQjET9Y+a2EI0+D+Sf0Vm+DsZ0vPmNU
	 yN8WmqDNmGwcmRjTQD4kJpQLcxmeFwF/CqW2RUXUGXxXj55bwjPJeQi1h/NxOhWvPGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=plXis2+j3KrzvWPo/wIbjtAol1ui8nmUlIWvCiL6mj8=;
	b=07ZBTbLPzuSKPLv4jxv+cgqTU4UmR5x5YD+FgQCEjLyC0wk61BNEq4TtyQ/HzKDD1AZD
	 fa9muvOCyKLYCGJIf1t+eGrGhKZLaZS1Bf7a9mxk8yfxBlTu7Xwe00+MhwpWVCUAiXE6O
	 +QGnnATudL1YE2Dx5u50A0Z+g91k9LLB5q/C2Ihvybd1xx8hCvt5y0s1gxl3feYbxo90e
	 xVq1XQQqJcEiAWR4N8EFX+1OKUU/PVT8bZSnjWLTNFqiSSKb0H/3udCvzA0BcjNAJTR8H
	 3yMXOG7HEYlV5wOJ2t8oZLC8Znicp6sSrBA1VcxiC0jbHpFAeKHLH1obi7Dx7tpygKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=KYT35hgz;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80540606A6F7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80540606A6F7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=KYT35hgz
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-86103aaac12so1461063a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795207201; x=1795812001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plXis2+j3KrzvWPo/wIbjtAol1ui8nmUlIWvCiL6mj8=;
        b=KYT35hgzB0DochTPRWROstEG4t95As8xU+kxij1UaDdw/iyzi16e6JJWSOsGBWM91p
         629IjMoFpo5YIjTy1tg6b+mA5qLUs9a3R16AZHEQrQZaE6Uh5VyRuOn4VSSUWah9NdTa
         gtxGhVJ+Biz5BRK791PY2FyAxvIzOPdMX8+6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207201; x=1795812001;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=plXis2+j3KrzvWPo/wIbjtAol1ui8nmUlIWvCiL6mj8=;
        b=pzNtShl8InnmBKx2pckYSTSErSSf0ehe5IwGYabG7ARSgmiQhwHzsIJutuQRYdJE0D
         gIb9NmOZToYPTzrlJOVEi2FD+ejRU03q5nh0W28FVlZ7bMa4S8h/ZuNZARN8/aywGtVx
         I+gUui3lEAlUfMTnPuKTvk6rRA1rI/V+1o9OcQsWDid90LltAWjCO8awft0etGdQ9xIQ
         j0wsNkOAMpyTgGKXDvbhymWouh/2U9bMYhuGw+97KepX1e3IgdW2OwZ6sdTARbZ3TzGj
         LUfqDCknjWP8PNRcUKXbOrrBtGLqILpKHQlIbnS9GSzAH0k5yZ2Yl9ZaH3icsDegZKj+
         Zd1g==
X-Forwarded-Encrypted: i=1; AL+hErHMkxi02QEitk2nCQatL/RNs5+HtMWrJo6kAMHn/lQFlwk7FitfM2sGg4bozcgCRaaSR5BDvI78dqA/VLc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/juJPwMxsJfNIVHEJxZKjp+otUdHKFTlTrftTZXrxlHKQU4q8C
	Q4/nURICnsoyIQrqkLyWg0TOiXXPvmIAQcAhDuQu5ci6dHzwDajW9GwCwLqOzYNxP7U=
X-Gm-Gg: AYBFou2NF4enj+VBLHJX776AvWYf9NTm8Ac+T8z9HQTfmwJJgo5lc7PACB4g2eX9tiL
	+IJePOpsM4E+vaot//33CN7joE5GlcwrGAtFYHlFn2q4ZI8JTNBuPCrec8bIfSrB4KonVFgT6E4
	6sSQ8Vw67yqyS6pwn7LgMc+fRKyieo2Zbd3GAfV0rcyYpLXWTWEHFb/g9nhvHdgzcvPSv3HcJDQ
	NzPQnbvA14RswigRk8UlLMj2dEV7JC2Imvazjb6DJL9iyymPMUwWcer53sGk30rXxbshCNi7V5R
	n9Gl1GR9fFGCBSL2IpdWKYJW+2FCRoRPnZz5fyDVbnKMNIJ159ZIwWXrZmwM29tyFtsKWXHpuux
	QOaIu+J6reyk7MMlXSKiVSpdtYH122pYMEdyETByJ6eeoVXqphb1gOCIXdbzUFQ87D7nZqfU6ql
	TUuVzwPg/tKhLJKbRmEJ9hegrjqbIG3VOQb0WMA8S18zDnVvLkXT2Yr1BAcSElYMFhn9F4NGMpJ
	WA8/5grGBfFcNhsDHUNe61YtcrCNQCJgw5fXJjLOBeDsvFqcXhityqINRoTmtKnvBMCRakDMzvI
	5Jz5MEX7Se8hnK4KxmPrrRzU1dqAE8Bjj7aHFOs=
X-Received: by 2002:a05:6830:4c0e:b0:862:b1cf:cdcd with SMTP id 46e09a7af769-8631594f21emr3927053a34.16.1795207201193;
        Fri, 20 Nov 2026 12:40:01 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6e7sm3195252a34.12.2026.11.20.12.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 12:40:00 -0800 (PST)
Message-ID: <28270951-748d-4717-bb42-1e73e4847f71@linuxfoundation.org>
Date: Fri, 20 Nov 2026 13:39:58 -0700
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
Subject: Re: [PATCH 0/2] usbip: stability changes
To: John Ernberg <john.ernberg@actia.se>,
 Michael Grzeschik <grzeschik@puzzle.ch>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
 <131283b8-0d92-4277-9dc7-eebfe30de5ae@linuxfoundation.org>
 <d9cbecc5-3130-48f1-adfd-4483c1bb4031@actia.se>
 <5ffddf60-7549-45a8-8b7d-496967a4e91a@linuxfoundation.org>
 <f2bca889-4554-4daa-be61-635fc193a276@actia.se>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <f2bca889-4554-4daa-be61-635fc193a276@actia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 05:33, John Ernberg wrote:
> Hi Shuah,
> 
> On 17/11/2026 00:16, Shuah Khan wrote:
>> On 11/13/26 04:34, John Ernberg wrote:
>>> Hi Shuah,
>>>
>>> On 12/11/2026 23:46, Shuah Khan wrote:
>>>> On 11/11/26 04:34, Michael Grzeschik wrote:
>>>>> While using usbip on kirkwood embedded machine, I came accross
>>>>> some stability issues. This series is addressing the reference counting
>>>>> on and usage of the event handler itself.
>>>>
>>>> Tell me more about the stability issues? What doesn't work
>>>> without these patches? Do you have reproducers for these
>>>> problems?
>>>>
>>>
>>> Since we also had the issue that 2/2 solves: The issue we have is that we see occasional CI failures with ghost USB devices remaining on the client side after our system (server side) had been suspended, even if the device was removed from the server.
>>>
>>> Applying a patch 2/2 (or our version of it sent earlier) solved the issue.
>>
>> Hi John,
>>
>> Can you send Tested-by for the 2/2 - did you also test patch 1/2?
> 
> I have not tested patch 1/2 because we have not seen that problem in our use cases so far, so we do not have a measurement of "good" for that fix. Michael will have to comment on that one.
> 
> Regarding patch 2/2, it seems Michael prefers our version [1].
> I can provide a tested-by if you rather want to pick this one.

Can you please resend your patch? I don't see it in my Inbox.

thanks,
-- Shuah
