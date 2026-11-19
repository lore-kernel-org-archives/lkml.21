Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103497;
	b=HyfIJDMio116HwUJHnltLYC+BBN3kVzDL5GSP0wY21syZWAdRMqJFtS9fMI9iNiyUCmh
	 gBepN6IFRLbpVCaJEmFBqHLGqVYq2M1yyUnFXZYi/YMKGjptFfmh6z8VfyqKSttVK66P4
	 Sp+CM4T9om+Zp2bNwAwHfCcjOtB6fQu/1QH9n83slKjua3pZwvKfu7sNdO2NdQ0zQC2gs
	 SHAdSUIlu5Uq0hKSX+xQsuXLmavhk7H8vzNbZXLoq+UB9PEX53nx6lrPvrKWP9PqpR7pD
	 ClI64mUK8LvrsJvvd4+9+/7EY8LceDEoYJ3TM7vPtZyX0KHFLxPJi05Vju0+kK+zARg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pwFAcpg5sRyeKkdxr9R3kiTvutc3HKeMb0lAkM/rhbk=;
	b=NMSXtKEBFu/5JQny7t+cRr+pkhDgLGDVgXnIOCtuVEQfoLlIh+6CehHL9gOFYX9rA8rD
	 286vCuwr2Nzh0nirqiupY3SS1DhZ3INMdh8Wcpmg/jMAKlXC0lQnWNuJfLh/gJUrAV78+
	 +pUjcRvUnc1vlW8qO8ouviRRzn7KIH0eXPiECy3p3mo6YL2l4UsqDYYvqiaSh4b6iXyta
	 aStGB2yOStHnMdZtHM59r3TFVVvM1i1yuSXPTdupgylcxgOlg+liP7MFcgePF2JsV5Y1n
	 lh/DnXYvvtJ1RxZFJFw3GPtIszarCp8j5XURvUbhMWVFzmhXs5vZemJf3lufSFW6cuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Dobx2qgR;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C689606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C689606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Dobx2qgR
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-862b98b2e47so927769a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795103496; x=1795708296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwFAcpg5sRyeKkdxr9R3kiTvutc3HKeMb0lAkM/rhbk=;
        b=Dobx2qgRzUoXCH0+k4Qr8WbacApIKNsmoM+BT0OFnGm+XFWlgslaJzdH3lcZJI+GbD
         HSfmuGNW5AprH5y9OKX47jspcvAlggOpbLdnq572KJcrlAep6JedkzAZdNJiX4hso8Sc
         Qa9hAS9NW/jFMHcFwaAai6gm4wApHto4Yp7MI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795103496; x=1795708296;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwFAcpg5sRyeKkdxr9R3kiTvutc3HKeMb0lAkM/rhbk=;
        b=likk1IqxOpn8tBNa6Jd6Md1udmeonRR7zDk/Kfbv3fvIk3Uz0cjTQryXlrnfBWlyif
         P2APoHFJ2DIXcI64CbRctHNub5pZlM4EfRV6TkJleQ7YGmLKHWFuQT6u45h5bu8WY6SH
         Otlerj8m0lv1Sz6j0XTsHCfZ6/tjPgQH9U55nefJsx1PP/w5lf2/Kn7cHZdMqlSbe5EM
         GZC5gNFQvJYHWPlDOOdJyeOC2VKol5QqpWg4HfBcPJ62PUCgvsGy8SvV8MHo7wch2xfV
         hged0MyP5NL1XYWdnm+wV21vzxuo4X1tuEHE9MBmoHkPCR8O3wx5jwwUlDWHEmotrTEB
         WDSg==
X-Forwarded-Encrypted: i=1; AL+hErESbRY7zcag8BHk7a5Mq7Yie/MAutlV5fCE22XQryHU7D4/EYtSrK4nQ8KfNc6dWKo+c8PUT817UyVJJMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9484/upDbf8SGsxJh4SFLQutFI42+B/xNGslYtz0ubX2VEaLy2
	UH0DKAkHlTHFbS8oOqhCWZzvj9jxu1jWbLHLDWgfdeOwRg+HYskvZ6oZ3QLa5zfkBB0=
X-Gm-Gg: AYBFou1c/uqplK3bfW0iGb/s2h9MobUbv8OB1l5ne7n5e/tVsaKCaPlRgmkrFZqK8dm
	zTO7/lm9WFGShas/99JcUEtPk0rRWfPmkUcgXJ6256rBQAV6yFW4U2yYov9wOcMOVFlQKeAElQ9
	8Nloa0Gouc+dRlVipDdheKpYbbVa/lFpf4yg3LRRE9wfpl0VGtkqL2p/0eirUSFJ7/eIoIons1O
	g/CPuJlsYxqyaPXvTiZ7NvaecKUiOYthYBwVpVfZYFMUzDHJkoViZ1KMkbaZbDE93tOP6OBbc54
	IMCeXlM4eOA4lWbcSjkL1xj/8pQKKuZtn5zVMttksxq/8tJWM28yYT75Zf9+JL+nWyNOnVyRQ9j
	a+jh4zWPQcqFVxzfffAw3zbHfcOmwz4bfOgRZYodrli6qZ3Kf+JDlPklTFm4wNQkBAxgmDuFOrC
	U0oZFSDmjy2tpB2tKAhZeagMAITghiuB0AwJUvPnzXrbl+wgBaaP1byBUBG9Ayptr7kvo2+Y0jJ
	s96CX95g40SIsHlh1ezuwYzZLxWMwi5qSARASLPPC+GekIbkSrYdLdBsEQooNUn58vm8zKvZgKm
	rd25xkjYiJXUI1Ar6ekfhk09dMsvtIzEmSuKWA==
X-Received: by 2002:a05:6830:348e:b0:81e:abb6:749f with SMTP id 46e09a7af769-86315490d2emr351905a34.8.1795103496017;
        Thu, 19 Nov 2026 07:51:36 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01d492dsm4792444a34.6.2026.11.19.07.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 07:51:35 -0800 (PST)
Message-ID: <aaa60c66-1cf8-4cff-9ba2-1d490fbd6673@linuxfoundation.org>
Date: Thu, 19 Nov 2026 08:51:31 -0700
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
Subject: Re: [PATCH 5.15 0000/2214] 5.15.226-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261118150009.797899913@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261118150009.797899913@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 07:27, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.15.226 release.
> There are 2214 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 20 Nov 2026 14:55:35 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.226-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h
> 
Compiled and booted on my test system. No dmesg regressions.

Tested-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
