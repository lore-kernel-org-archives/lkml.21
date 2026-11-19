Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103214;
	b=5rFs+J00naRQef/biybJLX2gjh38NiP5MF3/pTf9RFshecjJf86n5PnKi3rL5S0XkDHm
	 7JdbWqcdoL4PX6y2y5gr4LzxWjkIa9Rdff83Mea5N2L3/CFFuR5UAVP/tdlpkwxxGPPiL
	 Y2D1lqEjPlzkweJeDJfuyObJuvwIE+GoUYnW6I7OSTm6hH9fid16Rc9BZTolE4mOs+5o8
	 xruhPoTVsQ+Xc5G5nHN5+N6181Gp0kOel/o4WCUg1RHYwN7UCWiph7nLzGliJraVftP62
	 NM7SUEc49sVwxcJxWBecBTFz3YcRvfFM9tZY4iSiPXhnAcf57bus9JvWqYsyZZPKpxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=EI6AD+cTGv9AwoAU/9fE+a06GaJxs25LC5gaQkSzbV0=;
	b=3J9jb6YeSd5Ll3lVd1Kcd0JDHyZiE9ZVKb8jfvl6726IEhC17Pu6OnNA1rntLiiN6C9u
	 p3Mn2vmouDnwu1Vk4a9Di3ACZBaa18r+midukgwXaBS+Rh4JUpZDm3kn7hJmqGN2kr5ls
	 pGZcEjkPf0Y7heLw4gNSopH4BuCyszKz9j3w5bM/SGwvHjlPUa3NRx4mjD+y7EVVGqM/x
	 00Pf3iDlxHJW0kzwgEO4MtfpQzbW32f5GPqpQi+VRWOOJ9mKRvlLSr9Oq3MGkic5H/dWJ
	 gwuK8TZNRLNekori8qmmzu//ICskF+A+ZlRV+fsoltPyro84TU7GQU/s4SU5cEQpJsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=QhMRcIfN;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E82606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35E82606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=QhMRcIfN
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-862b98b2e47so925157a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795103212; x=1795708012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EI6AD+cTGv9AwoAU/9fE+a06GaJxs25LC5gaQkSzbV0=;
        b=QhMRcIfN71Uuts9P6BAtbMUQ3AynRUNnBFCiQI9h+yHaMhra+WZNjpGZYp8wXz90uq
         jgKhHIKWTFhwaBMPVe9zMkEH6+XvebqGcBoC48UIcWaBPKN59tl/fgpjLriAyBd60GiX
         GlORa1Cga6uwza04VGIR204LAbvvZuhk9yG9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795103212; x=1795708012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EI6AD+cTGv9AwoAU/9fE+a06GaJxs25LC5gaQkSzbV0=;
        b=pLWaKWwDTBGhBdcWxEEVleHsRrtB7NSL8mpZa1wjQhR0KZLqa8u8pS6yh48o8Ogd+i
         vUKVbTqYi/83AjDCerxLT1Lbq6OEuJTDB+3lqVRV9VT/jjUqk8EPfpdj43CUSOkBvcBR
         i2PnUBWAVPaCKKDNtpUFB72JmY3VkDf3BtU2yXOJJv753diD4HWZrIQX9/gcD3wSk068
         uBdgEf4TNN8U7BgLncJqxwbCUYJQ+xAnfWqwI1sw7c7Cy1pCgL9pnFnsyBK/XVFwCBO9
         OcslEhtLu3JyrE/A1Ep/CeGpTM5BprLfnCU6q2m6OXnZs0apk0fGzujvBog6qubJz76Y
         Sn5A==
X-Forwarded-Encrypted: i=1; AL+hErEGGI9K9ayrvOsdbpK4IHyz0eLl+3Q5aYx64SBoHr6+yi10vYLU4cgGFPoJzr1PyqBEq+xx+tYqvh8JVI0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Gq4G8yK9noa/AkZBpb3GLRyGcUDFGuZhGwtPb0MuCNhxh6T84
	BheuA85ktOvClgvfjPYkrOtK/ihcme4CZlz5WGzHUWgq+FOBpqPKg2oWzjZHSBySjcg=
X-Gm-Gg: AYBFou0CVu4XAQw1MAqn7A7ld9n3Lk6Bvh6ooNYHaxneKFYvm7vQrbxQ3gK39CkmAjD
	Pno1KpwXFVXOMqYCSVCXGsERINog0jepk1MZeJPTZn8aRQQo+aaHQVVKzRDTjdQCpxuZkTFmzrO
	Fdvr2v4F+dDDqK6UuO5hjoVObdHJTupGkbYxYEXcSwJUsN4xP4laVRr30bWYNvNNyCQXcQr7NnR
	Pkhi9vRmFuiIQOmuWsKr5nmo4KY+y83Ayp30PYwfU4XTVXTC9bV6kLtV/N86db8yvfLdYjz8cS3
	rCx1SDiJLA1rlpTiwT6sRubMbMuf/1FmBEmDilKNvEkbnmQ5NHGJuTgB3fCsnhGTKGUXTAF3jz0
	rywOiskCfppVkX9l6bG4kZ9WxKqIbfLli0lgWSGMcGIILuWI2/fy2YmgwXG1N2aMGFE8t3y5ITy
	ZV1F0ZycOyPE0Fpx0Iu92/eTyMyDZAlYIghLXOgEVaHPn7BssPsJWiaOGfr3l2rgj0aTcjDriR1
	4TBNzMb66xQ4O9h67WGMvLx/kjzUWI1jO+ffc55wW+gVeHOj97JWm6KiQUScx89z3RwC6JLM5hr
	oLkhoUSruIrBHUnpcCYTfqKYkle+nOn3GrmkWA==
X-Received: by 2002:a05:6830:448d:b0:85f:1601:d3 with SMTP id 46e09a7af769-863157af868mr264649a34.23.1795103211993;
        Thu, 19 Nov 2026 07:46:51 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f023760asm5047157a34.19.2026.11.19.07.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 07:46:51 -0800 (PST)
Message-ID: <9f67da18-8dcd-4f2e-8599-c41779b5eaf0@linuxfoundation.org>
Date: Thu, 19 Nov 2026 08:46:45 -0700
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
Subject: Re: [PATCH 6.6 0000/3318] 6.6.163-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261118150313.527275416@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261118150313.527275416@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 07:10, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.163 release.
> There are 3318 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 20 Nov 2026 14:55:42 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.163-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
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
