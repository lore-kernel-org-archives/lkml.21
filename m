Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103015;
	b=SD4jXjK4iPnrksG4jkZCGwurLjZeU2JB+Lwa5narpIR84WLx/0q4tl98ZiC95LumxqS0
	 JMEZex/FiotHh3VN0DEXfFU1NIW9YFDWqVXy5ZeNiiuwbg9aboSoH2zlphNgihAHmvFvJ
	 StidIjo4TV8DyGMj2e9uPDlhDu/rTXQJstoxR4KAW23aoeNzc4I29XtPxSDWRLaHMIhJg
	 cW25heRt9VHtXXSa6k8/2yzku/oloLN5UX6ZNFKeVuD8YxSbR5JokJ6X7ho8vBopee5DR
	 F0a1hVHGnlHkhpIah77kskQ6EjzuxlkLWuxJZBT4OzhrhUn7VsjIgQFjACKU0HB2B9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=77kGzCaY5Zn+zy17jl8aBPxR11Z8jaWMp533IDrucQU=;
	b=JefvQRZnErSQzCpKUs4qfg/3TuzbGbKyBShT0CIcpADmkGS3JgXUw9YK+40hhvm9xZF+
	 Ojkl5pGwSb3yxFiAmNb8QyrcT7nYlUtkG/A6aqomTRnx2xYkRQQdE1nLAygH+uzb9Da2k
	 Swbf90j41Q1Y3lYUzmptFXdxudB+4RN4E+txdhVIm2SxW0SZc56QV2l1r9kmdffZSZVFK
	 xBxD17kQNYDcI50Yj470WuevzoRFGZ0a0OP5eVKZfIChHO+Fm/jIn4YwSEBUzQo8NNQFD
	 cPrgrMAeEzhVpQpzs6XvN7kZkv+YnEPqa4/8ZzUTLMRANu2fmuGgFgD5whV/0Hx34/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Wm58OX0F;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4B6606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF4B6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Wm58OX0F
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8629fc8ad64so1342445a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795103013; x=1795707813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77kGzCaY5Zn+zy17jl8aBPxR11Z8jaWMp533IDrucQU=;
        b=Wm58OX0FTqOz+qih5WuCaouA4q9BOUKC3i+nIQiu/2UubvQzx2Ax9TLng05RB3h7NM
         42RVCzPsKkdew5a86Ap9h2t/XDGrBdErrd4sc7JHYxCQhU8DxICP2dh65ELGt96Sn3gu
         jLh3zmEx7nPXXmZIvd03rLkT0P6dNDb/+/hRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795103013; x=1795707813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77kGzCaY5Zn+zy17jl8aBPxR11Z8jaWMp533IDrucQU=;
        b=KufTQOwOHbwd8XRLxux2f20YP2+xX1hBLWJnnZxPCdwFoRxlsIACCZgI1imYW1U0bR
         TdQzdnGqPZb5RX0SEf04G+AejpJIcbAE9KNAKpDAaV67Iy/bnFE2Br1Uh6IqhLxa7qEC
         USTFnpr0XK2RtR65MYrFCgGALs+Sl8Vs1nuEFbdLTFudFkhL7RSuYDz+nySeiLJlttIK
         Uu7IzeN41DK1YjbxtTBzBrIOApU1tatLyqZcMvFWsQnieCFbVixtUho/eQzMSm/1Es55
         VMCWXLMtTAFh8OZTjgW1xTQ/tQxy6EX6nbk/hy4Xh6IipJIt3PKuZ5bXi6S3+P2L8jmD
         249w==
X-Forwarded-Encrypted: i=1; AL+hErHFuu0LYFJfBx2DhRqeO8ojgcjYjdr12DJCfNZojXCpBqRluI6OeGRYe+k3kre6xBHkR4TFGYJBmcBqBCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YQojA3jTJMTOoMf6u28cPKwRXOoSDNrcwC4+biyGSftmuWq0j
	PGKH/QttcWTA7wgAjLVCrV78myk8tjMDZXYvgAzKZJwQ31zONWu00X51c7yIfZ06VA4=
X-Gm-Gg: AYBFou2D/JowambFulFf+t0XfgNuXcvwYOV5pIrI8IHAWkP9tspopMvvlY4/E7mxa//
	FVLPEPCEds3PBWrbEy4RIL3aQ7xTyKu2jo9rk2HkVLr3uQLxzuqFMT3LbMsbCkssB/4llZUqAcx
	Nvk9n3c5ghFFhf7ft8VuXnUY/aJUodBV/Kq8aqlITSXnWUEGj9quX08wJi0VL5ab+16h4TEm9Xs
	KraBXfWretasW8xIym6rBJ8nXWC1l55+rLFK6u/igF4j9Sw18nb1iL7egUDfy1qke8mO3kD8qGq
	Kxg+J4vmlWfS95E4TazbbpR2AkCmNJLBvzczPChl+n76wAUaConYt7HEsOaskqwgQ1IrpjiuJmM
	lWpq6/zH+ei3nkyj2Bo9l5PSdNc+1SjzXxxaxydDhITE8CqPt+kixnDz5OC3PNGLBknJeeWSGpN
	5reqNKYjV9rBPYdvg5W/72ozhNSnB71EUtGQUmWKPPzWvu69t/IXXF3Ol2R16rcqiYRStg+hLVK
	QELJu1ty5DFsFZ+wDAeck4bB8PFCD2s0byrPU9SIdCp2yL7rhcusrWOoQ1Ydv1vw4xtw7PsY0/r
	X2H9zQbe0A4AKM/0o9O5a2O8nQY9gOMqch6CJLU=
X-Received: by 2002:a05:6830:680f:b0:862:c9e8:5776 with SMTP id 46e09a7af769-8631549ef6dmr320170a34.9.1795103012660;
        Thu, 19 Nov 2026 07:43:32 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01d4737sm4557635a34.7.2026.11.19.07.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 07:43:32 -0800 (PST)
Message-ID: <4b1b2d2a-90f0-4384-8d91-cf843f9459c6@linuxfoundation.org>
Date: Thu, 19 Nov 2026 08:43:29 -0700
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
Subject: Re: [PATCH 6.18 0000/2151] 6.18.65-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261118150121.603863898@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261118150121.603863898@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 07:28, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.65 release.
> There are 2151 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 20 Nov 2026 14:55:45 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.65-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
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
