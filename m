Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164311;
	b=Yi7BovR5FvYC8eElzwpZUd58p+C1/JlGC7o8rxy0h9E5yErh/i+BDEg3mX9Ol5mVYXBC
	 Mh9Okp8sEwys2cxOuu7SO+6YRb+y9HerSJPCwytA8fodLKMS94sPn+RSEjQRFue0qT5dh
	 orHhk+TwLNNf2jjcf62870J2d4mCfHvAlrP6Sa+UTpbbR9bbaXPZldaFDDoYMEpGVHUE6
	 NHjMlqIJ609kiLQTKuV5R1lbUR2jZQiqbxa2/iqe4qH2YVQ0tzMfMuKkmkeRYp3h/4xwR
	 aP90llryi69CrX4wL3nZxR/ooqY+xOANz6afWswGGvGo+DhRb+67qoFYepeun5WeKYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sCqnY8v5CI6MdsdAysAACdNLL0d1psytcPbpLVmifrw=;
	b=dZSkl7QlFQEI4/8GuXqm6hKbmTKdybprjclUwGksBlJ5FZPeXKnGWxs6QwpVoLJPdbZT
	 wa88yZLt29vuY7A3Rt7Zc90VUHx34KoibHIe/X3qFaHSqjfHyFLNpqUTDlmGzTpOrHa4L
	 PiuNDN7vNpIxva1vrSnfnoT1IVQVXIp9x6CTRTRgKxYGLavii1PB1s2vru61RBxbkPgiN
	 wgZGqx/jN07nFrJRYwCWyVC/2WfZTDrTED7cDvKdDCbiKyLSERriCUPKKgN0WimyqnVt1
	 jXHZ5s8wlMlSyuEyP7GAYU5Ea2V5JpvO2x2mn/rF2XJtIztaa/a3zMP7tQSHQ1vVKdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qWoNqd4f;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2BE606A884
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB2BE606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qWoNqd4f
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b405d8f1cfso347229a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164310; x=1795769110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCqnY8v5CI6MdsdAysAACdNLL0d1psytcPbpLVmifrw=;
        b=qWoNqd4fJn9RSajGzyE7A2zlx6ns2ZY/bJeicScAsDGEBtuNXIEf5LAKiaypWUCwmM
         /fICDf1m9LIGUvxDIzqXMg4XoJV3IrYTSDNLANJ21Trti0hnxK/fEo/Yy/tFhHI7M6E8
         9/yIVInbJ7RMp2K6B/DN302WqPTivLDbI+MFOrhxzp32VOSgU8dlGONCMSzXnwm1vUDy
         tXGwVQdtobkFZRMqZHvZkIiFtGzk68isP1CBgLPv3jD39euDqU/pdsWyIYkUCXEm1cIt
         58KEnOHX+vwBvx9X33RFTstyHC4k4Aqan0TaXGXA7DLjDqWtglGcspxJn0u50TKFXplw
         PSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164310; x=1795769110;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCqnY8v5CI6MdsdAysAACdNLL0d1psytcPbpLVmifrw=;
        b=Dc0IGf9+ykdWmLUPA4emfcWy1djcM04ITsyJcuv0PUcOjgEDgVOaR6fiEUpVYnB072
         5SNvDsnz10M4XAt+4DB1Mr7nDaKdmZkojhwSOi1l98vSOGjby+60+uMLVrNQNKEpzxc5
         HsScbxT7gMkoRZU3HF/vXCVR3DBMZUeFtwvBosCeDx4JrWOjFUDYIfdQFCDjXKldz+rZ
         ss37n3LTTocNl+1xjmixQW/UsnG21YszRD+jOwYWH4diYz38JU01QXN3dLRYt17gIuB3
         08qv6jUN/LxVYfVHeE+suefcVl/G9tOd0JnORbe1kuEcqEDT4usaxciMWjChPtuv5Q3z
         MB3g==
X-Forwarded-Encrypted: i=1; AL+hErGKV/ucgzYeoehbSe08WZm1A3rM+G5/i/yhqjKaH1KgaekX+ckyB7P9Nl6gtC/5dv6yshmT7my8SGg1EXY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xb2LXe79/WjspzkjaaE0Wd46B+bOXQTKi+DuKK4yIFqtKeATX
	/E05YqfH43AJe7/TdrKSQJBXgT43EFbmyHsX3lcUKoXJoqfuty2IMU3y
X-Gm-Gg: AZFdTZcxT+UqlXiJgXqvTa8YieQzUYYDNDkePHjr37R9n4lkZMv8Nb6H/GQ+Vlh0ACM
	YAZoIDd6CWyZHDSo1NH15tJROINNwCdkKJjsyiH3vQPi12JIrdwkGNX5/orCWKQeFgjGplLNEce
	zu6LU3BDt3Nm0lGHytcEoVAn3O50Lzy43AOtxhMEQ8wTNrjwyRQ9tT6gDvg9en92h9M+0cfvYvE
	eIlpi3Y+AUJsWCNgC6YrMjSggqGGhUIyKKhrtxmJqdDHeT9EKlkD6u5Maa9J3Lchd44UQ5LPLjG
	RBoehHZKcbRSgmxCExy0Ery/7KWeQXwsaAqwvhOelYxy4g0+MZJWquY40WIoUttitEd7GX1pooB
	+JnR7HV87jszRXvm1mrPxPYOKbAs/2p0HyOoP3kajM9QIUtzWHksqnyK2CF13dWo8mOXxjW+aE+
	Rh4yRLAtzC8M0ZxsqY2NtFRx9NXS6zi9/DwEcgfdwFZd88uhOQv9BZ3kSUmmu41FSVBuen4sdwC
	rirqo4gAJSe0temo+4Rcky8fWsUGqb5+rNUwhvgslDERL4BsjeBfQbfAp4R7kme2cxHSwzDgafJ
	wVK1VstLr1UD4gXMe+rkcQ9V2u1usA==
X-Received: by 2002:a17:90a:e705:b0:3ab:1b1c:8a70 with SMTP id 98e67ed59e1d1-3b41c938d83mr1968763a91.38.1795164310099;
        Fri, 20 Nov 2026 00:45:10 -0800 (PST)
Received: from [10.222.1.82] ([59.20.222.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm3376049a91.13.2026.11.20.00.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 00:45:09 -0800 (PST)
Message-ID: <e0df1ec0-d6cc-4c5c-868f-cd490d252e9a@gmail.com>
Date: Fri, 20 Nov 2026 17:45:05 +0900
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
Subject: Re: [PATCH 7.3 0000/2642] 7.3.6-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261120055248.913352689@linuxfoundation.org>
Content-Language: en-US
From: Joungmin Lee <leejm516@gmail.com>
In-Reply-To: <20261120055248.913352689@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/26 2:58 PM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.3.6 release.
> There are 2642 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 22 Nov 2026 05:44:39 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.6-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.3.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

Hi, Greg:

7.3.6-rc2 successfully built and booted in my system without any notable
regressions.

Distribution: Gentoo Linux
Architecture: x86_64 (ASUS Zenbook UM3504DA)
CPU: AMD Ryzen 7 7735U
iGPU: AMD Radeon 680M

[    0.000000] Linux version 7.3.6-rc2-myllvm (user1@gentoo-zenbook)
(clang version 23.1.6, LLD 23.1.6) #1 SMP PREEMPT_DYNAMIC Fri Nov 20
17:29:11 KST 2026

Tested-by: Joungmin Lee <leejm516@gmail.com>

Best,
Joungmin
