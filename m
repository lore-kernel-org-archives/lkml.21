Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212219;
	b=E58w9SHKXoijIa+0zjmYL8aTfjQ1xGb/fPf/BwOP90uZDXVhW4BcV6rHL9Wmr/69Ypa0
	 SpeECKNL0rjZR7E9OtkxU1auy+QGYscFQ7Q13V9VThdWa+VtpNzhuMWxyIEhNK7966dqg
	 GAQBUuEus244MjRZiBwwJWpk4IzvcVZ0eIgA9PWGhC43hMfiwxRxactBJJ2CqJUWr4IVa
	 t5FkVlb+YhT04lVlIg90IKqd8ggMA/mUdHIQhOhwoW9gMpfjxf6cloVYpVyNRM60Uj6go
	 qdhhqaQPJCt1CpWrTa4CJ/Rtbt1XyXeKeRmDLHez0S8LS9g7a47COSjTWJLIWE9fcCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q3/2lSAbQcvG4mJse5Si002aVPhuVugxPukuQMe/+Oc=;
	b=LFxhKRZRmceDWpEMy52jrZOGUqrf0xDBOCchIoO9da7hDnYuJ9itq5OAziqw2or6jNcB
	 1fR8/126Rmh+NFWW4owCajfiehSPUCTdBdVpZ0MKGJ604yet8EGiEYTsE6SaoYNlxonzD
	 NO9v7+0Y+INgaYMGEAEcFwxkAQ/HljLo4sEMpXqVk3/ntv02x4AvbWSLeK61Po18/z6k/
	 BuWI6qPINL01xJsB5OOVMavcIOW/94P0+SCmQJO3DN7JROJmap+1nS4KxCqZUiyDjtnKn
	 6QqcPGiTetGGkMRXRm9n/2CW44jL/t5W/VLoybNXQYa/27gtAMfIyMQS8KIKIvNgOIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WYPwo0eo;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A62606A6AE
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A62606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WYPwo0eo
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55c35262674so11153311cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795212217; x=1795817017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q3/2lSAbQcvG4mJse5Si002aVPhuVugxPukuQMe/+Oc=;
        b=WYPwo0eox2Pc0+b6FZQ+O5Lnl6PggMtlewkqzCmj1hl8vKRs53yWR6z7QMxREOA7It
         M4SMVfOMKWmGquFBsSJ0DMONhYbKIGgZ3X814rYEO0Zu0AhUj7bKnhliPQpQf68n/e0m
         Kh1FoDT6PH4sp2D3dYZxIHJP2WIu9JnDKl8aLDP7M+czXLLNNBqpc2/qHJLjAmR+megK
         p59h3oPh/O83JuyLjFyZWsAbjAGDoprLbWoavKciCxb/Q/w1t0IbROmE9CRiUDYDp244
         wxl8PS+wg4joMTIub6BmZsdK0jUb3spxlJHvsq5U2n4zWqoj7Hx4NISxUTvo6FjlApse
         sPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212217; x=1795817017;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q3/2lSAbQcvG4mJse5Si002aVPhuVugxPukuQMe/+Oc=;
        b=RXIHmQM2miQxKy55sTgPB5vXZi6A7ptorvqBS40nvbKPVfr+OdwjV+poxoQaDFo0tg
         L/wLv/MIiWIv+kzifwqiw4NXv9yBU/5ocGTXh1Qcn3zKP4SYahhye/jjxtf4nb9k46xr
         AttKbeiMmijMp+3lUPvqiY1MIWxrSnpogAF04A1FH2AFffwRdegM2yfVdL2bMsJeJC7v
         SJ6W8Spd+AnKWWTZgJIvkjAURTs/wYf99hkoCBZ9VW7af889OJ1tES98htcDX7CVgxvQ
         7JWQyI2QBovrrB5NLwm/IXFbLHaEusyVLvSwA6crW9AhF7nOy+WrkLgzU0Vxt7IkPbE1
         U7Pw==
X-Forwarded-Encrypted: i=1; AL+hErHcgiTnjiBHR0lnHUFgNFJHi2DmZqLpYr0yCF2FeLO2QeqKR1ewY3F2LxZYHBXOqPPuwT0MldGf4dKCuQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cLnNjD7scmtjxiw3JDtH/JbT6uXbGPkNI46PlgOJ2lTrp94Yz
	GjpNIg0OccFXB5A4craizO0UtW8YS49u0r1N4LmEWgzO7bzv3tp2UyL8
X-Gm-Gg: AYBFou19/FtUSVghPc0la0S7TXFYkymsJSHgigknlDB2ji0AxHsTh0zG3pbPAOyUHOb
	/K6IkSK3f5b4e3y5bMzc2oBd4l8Moyh5JyIFbVz4VuRwFDb64eGVkICC/61lZ8O7EfS3bbRZdh8
	Xja06bjDigZIpijXWj8PvHdRy99f28/abvAjkwj1dGQ64GLvUzOTN3I58o0zFiEJ9ev49IqHhBu
	u2kYNXp4wcV7VclvM1TH67XEGLJrBpeC7LtIObZhz+o6kXoCdIgv08U2Zz+Rxb4OQ9DyBw/XYXv
	0T8Yp9t16dFQJZyR3FB8nhfSKEQcADCAbqnCUwXAL1N1cxr1sw8RdHZt0crG2S3mjMwdrk7/07v
	qIk8B43deom2y4CMWIsctHvD8ouaUjHGueQ2lqLEMTJR2FfE4XC8rTwf3N5wOPdOMWHXk9jpWBU
	zuAM4K8yCLnQd3qMQ+xrydcHGhkkLb8MZyDbalPZr/GCafA7AB8UqGiuiwns3SBZpqs19Et7Spa
	uZiLlGQeglxqMfW5DndjPAu5O3pluxHfHn5s/k/lmHe7siRaBpzx/imoB7i9eqrjXiuRPrCEvIV
	4d9jEMZuDIn1+p+V1qu20FPHwI+gth/hSYSezkaCcna1v08LDeuAaREWPngfQCX1r54hOas+KdX
	U9Q==
X-Received: by 2002:a05:622a:2447:b0:535:ed1:cdbb with SMTP id d75a77b69052e-55d7688e8cbmr78888001cf.1.1795212217393;
        Fri, 20 Nov 2026 14:03:37 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889ea4csm34049871cf.26.2026.11.20.14.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 14:03:36 -0800 (PST)
Message-ID: <785f0296-6603-4972-bb60-80a75ed9b869@gmail.com>
Date: Fri, 20 Nov 2026 14:03:34 -0800
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
Subject: Re: [PATCH 6.6 0000/3308] 6.6.163-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261120055324.975889935@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261120055324.975889935@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 21:57, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.163 release.
> There are 3308 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 22 Nov 2026 05:44:39 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.163-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

On ARCH_BRCMSTB using 32-bit and 64-bit ARM kernels, build tested on 
BMIPS_GENERIC:

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
