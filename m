Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103362;
	b=aS9NBRFalwkLMEuMZCKus1r7ZWf3R5Vkuqpt+/vpEAOJSrTkHTMN7VdHtJerVzCKGOWX
	 t03aOB3Pw2i5OvC34Grg3ww49eEiSVEzYM7XfLdzTfNooN/BcpqMRPVLjLe9DGuvVEoJk
	 e8kT9DxxE02mFHyIs8CJFBqd/fMPjl0IxmmtU0eLgMRkjGP6Nmz7YEoaRNw3tlx+CMhj6
	 q2WuoGcC8Q7H64wjSFT7il6D5uF5NeKjFX59Bg2B41WkneODeUmPzw/YYi9aqAhkq7UYU
	 /CXj1MGeoLiDBZmNWI3aGXR/ExpDYqri0s1pWK6m/X49iOAzTHY0ZdYjs6kffsJ798Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Hk2c+8OJP384F/Pb0yBXsyfMijwUYkaY/vzOTmpbXDc=;
	b=ByDHN9PYZhO1VPoNq9Dfk1ezqpZLaIpfnNdmY7NC+9yvhtncPEcHGCD20Ed/llRaoomC
	 0BB7Yxw/VFWfAWRb1kf62GeidQfm9SghKRgtXBKYvuk5AThqRZ3OJdWXgAvhm760CACnK
	 Pulm4wvI2kjJiRptnNbOr3RGHeiTMn2aGCRcL9NEkCH9ptabxE25XgMuuNXS4hrCiFS1c
	 XOHrrAPVvb+UxM4M0BQm25BsqZwi5JsgBZchyD2bPPvx8OtlGesWQKKW7fwZvBZ1qWsTD
	 UwbsxLUPsUIOjXMg4OEwSJctB+QHSwiDfwDcI9R2b4uG3iyu5181s6omJ41JYNWdy8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=ZUe0VrC6;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A353606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A353606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=ZUe0VrC6
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4d7034a99a9so1214552b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795103360; x=1795708160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hk2c+8OJP384F/Pb0yBXsyfMijwUYkaY/vzOTmpbXDc=;
        b=ZUe0VrC6hiGYdi3lQJwT0/Tzv3RAG1g5hO6VKrGsYTjzygbGIYW2qKWQLBvjZEko2N
         rY7B0/ETmwth6elzWp0zFe2lXWxgGu5KHMuEuuq7AO/6IfoY8w1NZpl919nYx3xNyw0x
         PWgoTTdpohB8BZE4x2Gs1sCB7Q9ewXVpWpCmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795103360; x=1795708160;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hk2c+8OJP384F/Pb0yBXsyfMijwUYkaY/vzOTmpbXDc=;
        b=gwkOS75VAeJC71xKUV88GZK7hbbnOEIFcBNUX4mXWXtevLMUobzhuPTGGrcgoMKLjH
         SRY1Lc+E0x22K7ukcX0r+ChLKhrTf57aV92SXVp08ZGpxJ/enIDo3qekfZrg6UzxpDMG
         qUCdq/329Q+WvbSuzpbR/GTM926lnr4mb5bWCPP2mP7aKYio7Yk5ZTyqCwuA/kJ0mYeW
         hJ/p+cMrBd2ejDhhX1B8jHE0VlQumK1Dn8UwGrzzlBPAzO2BfWyqn2Uo67AIA8zAczh1
         mgs0vgHtvD91qLKtM+39t4h+IWHffm7yn3KCz14cRPyAeTNG6ju0ws6QYI4QAqLzPMIx
         WOAQ==
X-Forwarded-Encrypted: i=1; AL+hErHz8Chio4TihmwyYDdwoLi0fSnLBkCxLXUiYCKX+KMLZWgkSCjAuxDOCSdnXM/A9yK8o/VNsrolj1rkjf4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Lc4a9ImMa6DAlPC9Cya+yjHCu2oAggJujpbeivvioZbUhdVLd
	ERCaOhC6HuBovnbINWTaWkQm2wh0pbkuB3bqH/M8VwXvGdcL4RkiFOxTZ+gx4ldv96I=
X-Gm-Gg: AYBFou0bI6I+xP0QKxaSA/P7PWmJH7s6JE3DxGt+LRjiDS1rI55HYpNZMNLTk2OKiQF
	x9uNep1oCwh7rPTMWsc/OGAJll9Pjxa97++PoYe06cu3H0MddBPuVz6MvCZIryxqdViXELFLz9S
	WwyNoA7TiWIOJ3fjkCjrLKkiYOOCsxawFdv9KZs9Jgom6Zbwhl3daSrveZ58yytNQzFDpWVvFnJ
	9LsLKO4I7svIrAYIPisS7YpgzbvEQ1/O/JAjNQ8OV7IXt+aCeJfshQ5/6y0na6PAtEhr4O2z2zS
	JqeSwGFCdvnMjiYSBUBZsTK7zSHSSN+1z8lrToc0oYkQkrzW/nuzox13X184YIj0ojQrcFhLa1e
	BWRhdWXMjRyG9UK8aMlw1guSj2SrcCj1J6vLDlykRhVNI3bHI4yBt1siJD9WPe9U1DdAuwBOZU7
	7+6pQnz6Ojk6477+8ciQ5p2JnK7uQlp2jTw9ifeNqcEvdDSL2VuAEw9vJWBOsvpXq+d1jeJNWoq
	U5OIFlI3c2zKJMdcjvNyNcn5zywaMIGCvaQvozB9hq0iQ0cTtn9WTR5EkojuUoPoBDRkLPLibat
	UeReA2qf6/7j7fO6naoVuhsyXe8IgwGhaEavkrdNMqR0RVGEKmZkuq+AlB4=
X-Received: by 2002:a05:6808:c3d2:b0:53b:87e5:8c9a with SMTP id 5614622812f47-57a09c0fa5dmr312083b6e.17.1795103360052;
        Thu, 19 Nov 2026 07:49:20 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777a8a5b65sm4386296b6e.8.2026.11.19.07.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 07:49:19 -0800 (PST)
Message-ID: <2fc421df-33b5-4a8f-9de6-4504ac4d73ff@linuxfoundation.org>
Date: Thu, 19 Nov 2026 08:49:16 -0700
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
Subject: Re: [PATCH 6.1 0000/2857] 6.1.193-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261118150201.293410965@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261118150201.293410965@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 07:17, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.193 release.
> There are 2857 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 20 Nov 2026 14:55:40 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.193-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.1.y
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
