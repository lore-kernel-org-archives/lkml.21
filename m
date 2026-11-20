Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215277;
	b=ECp7WsLLOl0hUk6xTiXpKuZ42qmRo9MFN2y/sWBUKOMkI7vETeDbNurihdEEZXXJKRNQ
	 VijUihGHLFGu7hQ/L3a2daqP+SH0OmT+znRM/ugLFmp/3MwU3d12PfrXqn4aCI9InqOYw
	 bY7d5/0Klr2ODZB4GT9fhY9E86p/xGaDHgAj15IYJI3qQbFKHr6OYs/91h3aAd8ypWpE8
	 7F0nLiu8DeI7n1nrLhEJ6tTAoc9dzgRspk4a1m2WBzGMJ5S4dhyrnJt2LWvMGCo0N2kBh
	 /dQ0mdsS4gfikCPViYkGByJESPECU2XQs2v0QWQ0aTLaj6yFMLRByWlHhsKpPHnQXfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7skHt+YrMSf45fvtAQB9ncjgz8a/0hFVmjlyc9Hg1bM=;
	b=ylsqd834y3hoYzhX97Hwhf/ZBri2/W0rXMS54qHt+zfp3DPvnEWqHo7wt9y6UvV9Bew6
	 qtLKE21I/tu4doRJf7hvOOZ+4HBEcJIAchxf4zKfFHmIb1MShdOGgVtjhnvx1bis+yAG5
	 U/krgI8FKH1qZT/52t0Pe5Z9Enmq/pxTrmwx45kCqjvRZ7vUg9U2p0KbQYur3yfBBwAgB
	 qsRUTmT2GABusOPU2PsEWFA5ADcLabJ3LobENVXKLlCkM9uMzT9aouZxEZ9D42u2q/iNe
	 qSzLMkb7iPqr3IrKBfzqYT4rheC4EuO4aCZ3e2PiY3uyRJOzu/CtphX0INEwt6+PaxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQfEQYAV;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47993606A696
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47993606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQfEQYAV
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-930c0f9c1b1so154260085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795215271; x=1795820071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7skHt+YrMSf45fvtAQB9ncjgz8a/0hFVmjlyc9Hg1bM=;
        b=pQfEQYAVizHq3JvKb9DB8VWw9uSH/fANEH1KW/m3A3LIoyu1onBDLSOD4wztMhuuRe
         etFjwA1hdWIvOBG17qD2E6fjBPhesxkNHr3h579SF0fTk3wLhZFZiIEGqcj8U9YIA5/h
         JzKz2/Lv3BthjXYCU9riurHLx92UvP9glA1/PzKtNCdigW+FEynj40YnAmMYidlitaD6
         BYVgLb7I+YwS3BxUWrPZl/5ruHRtjOu/pjy+0U2H4O30ri3tfAvx9Mf5QQYhVf9Ie3mM
         jNKlZw0VamZL8+syi83esvG9eqPa9J06z8BoIU8F3az5Z0WrxvzlS5kXwnAmGkYX2ovU
         kPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795215271; x=1795820071;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7skHt+YrMSf45fvtAQB9ncjgz8a/0hFVmjlyc9Hg1bM=;
        b=rH57/RO88li+9wTIedPVIV6RVhi2PY5EzLL0dQzFurW/vXYVSCX2L7C7IflDLqGkJK
         2ZqU0stBz794RxaflobJmSocjLotbBfC7PrdlyScvXccsbvQitZNo+U1tO5Bhrs8R7ur
         fHQMhHhqgm87YFpVPXdjM8ZlU8YuBKWrBZQMW2NDPW4g01lSbh8X8PU2buMTSscZe3xR
         wfkNJshU05+gbniBthnJj76/6RVoA2dxBm5sCBCe5UPCBcrQyVc3EFSMxRkZnEpi1IjI
         NAkLOLcEfULUloaP7MrJi99azVWrGB28rDKJAQgFFlCzd5xUw8W/Pgadc3BPWJW7I3Lp
         qaeA==
X-Forwarded-Encrypted: i=1; AL+hErFUYR+3VkLMmOyBkcQpkp9LVpEbpFfOCKLSBnCcZ56E2D15iykpXSSLJUB13SXIWTnrxWwTYgzGHERCmNU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JQ8MI5rgJVYg2kIN8M3KZadOFcNmfZXYLtqbxVOIcOtLO3rTV
	skr/gOVuUS2jLvgmn6yEZ6JGVXptu92LDVaYE1gHCOQmilNLxhPPs8zP
X-Gm-Gg: AYBFou19k6aK2kK37sdVI8kHLAt4F8imTQNbyt9cF+E2ZwJMs+jjGTMuM2P5uiBAvKb
	6UIj3VpRH4/vb4FdoqH1zJu68KWvHsmZTlj0JITCdlrpxet+mXzmlmOf4RVAVcEcBYcETVfR9QJ
	d4MG4T2UKl/OR9snQMIDewQp9+slc520KHRatnj5y9hI67M+3wdnrKBjQxZ6+QsnBwJT1yZ2417
	6jhS5qZ5hMuOM4iz26bTaxbRQPOyQlGrVUquW3aJO9T3bSv9I95lUcHFxbWm4YunFjnCQF7+9yI
	EWdx4pEuYEY8ASB1w2S6LYxjqXHFnO/c7ewd+GTyi77iG0flo69pfOBopPIZX9TA+0TwkbBaT4K
	bzNuAlDMBXycorOCUOEK1JSIlkVgteIy7KBx4iHKYqA7zMBMOVYShybjujs65Ma/531g+MOFGfz
	zYbkoz3oWYWxDXyVqAvkRwy8vipusd3Wozk2WFP46N8pdY2WTljuuY+7Re8gulrQcS6v25jOwJG
	J6J3LZ6pCsSf7TGJJjoikF329anGXUSw4yyYBTibg+qdfm/AsSMm8YxnTP7Ag3vBH5uD0VBXdFq
	6ZaeR97B93QUkgX3q5TmMgGc9YG/XXpXfOKOLa3IrHvLkXzDI34cr5Wg
X-Received: by 2002:a05:620a:4627:b0:93e:90e0:d2e3 with SMTP id af79cd13be357-949bab0aba7mr751067285a.39.1795215270952;
        Fri, 20 Nov 2026 14:54:30 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f1ee7sm295566385a.28.2026.11.20.14.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 14:54:30 -0800 (PST)
Message-ID: <f47e9c53-c479-44c9-b5c1-b118873f8399@gmail.com>
Date: Fri, 20 Nov 2026 14:54:27 -0800
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
Subject: Re: [PATCH 6.18 0000/2144] 6.18.65-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261120055114.182757740@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261120055114.182757740@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 21:58, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.65 release.
> There are 2144 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 22 Nov 2026 05:44:39 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.65-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
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
