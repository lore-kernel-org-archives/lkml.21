Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701773;
	b=wLGA0thf9a5FKN1kafHkE82g0ttkhpmo0HuSi1Ho4Y3zkpa9uDBozZWQW/yfexOoEnRF
	 jn1YOOkOzaRW9sUkG0YywG16ULISfkdoUAlR+HtwRwQ8e9CwRWdQ/Aew8e6T+LS5On+7q
	 XQ30efiOxJFVZpWS64qq9oFFICsPtHZOvmTPalAOS9Hcyj9VASvqSQmkRs5iedE4imfQA
	 TAlw6mOzpfYgYO4rZTTj135mhza5QueMPFWsELK7JirUHbPAR/kyWE50ffZXFP+oisvcB
	 kOHnpCpKec8efex54TZ6U95Tykc5IxzHUY6iB377rBWIQaiQRPr8J8OIIB9tq3AeQlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lHTP7tK3RH+sk4NPGUbDTRffLgmU1INyF5ZWw/2WVfQ=;
	b=UnE1WW98vRzY0Smb15S8NxSLl1nl55llR1VTR0LBE9Gbf9R5vlPxJEA3DGpddMj8fHTr
	 +5xZ3H362jWmk4feSKbFm9wBQ298EFyENILrz6de+x2TwA0sW0AVOc8LZOOuBWdoHgF4z
	 WhR1iAMOOy2sDNz9iEm5f7xL/QLswbrhqHu2xI8hwxM/8OwsTYRye6VqdSf0VV3YxHEII
	 GmrKqjJ5OZGgEQ3pjZIqDmbzHuH6QiNgNymMdpsCdg/QLLYHAI0vPoSB+yFKmu9GSnNx/
	 W1fPW57+zEcjOyMw5vgLcQM+KvnMX1UcqZlm//zIGzdWUFWdKKcplRo5PLVnYNFJJUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAO41omo;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19E5606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F19E5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAO41omo
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f07a960666so48583235ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795701772; x=1796306572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lHTP7tK3RH+sk4NPGUbDTRffLgmU1INyF5ZWw/2WVfQ=;
        b=yAO41omoyo06t9dQGvNRC8pLfFXIG1IAKVbkTCexoFwgzS9VLXSTszeobeX872pvhx
         8WLRgttgW4uVHXiUxgL+2tOVE+g5TGm1PEZxVuRvZlhpulwgSI2NDBNYCYgXrtym9v5n
         BB7cdgWF9l2VU1XjjkykyD+7/e5vm643T5INWil73a6srRfcjKzK4ZdMDeRQMy1Lia8G
         RyPEYPskRN3iYi0Rs8IsZ6nzuymr16n++XtgLOYqMu4Q6Cj+hMbArmFtpS9n+xn+AZiZ
         KDP9tla/Pzrd5D7EGcpukOlobGRd42f2Gahb2zk0SWf4ZzwqfU9U0vkvTm8oix4/8FUm
         +Hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795701772; x=1796306572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lHTP7tK3RH+sk4NPGUbDTRffLgmU1INyF5ZWw/2WVfQ=;
        b=EDZniC06Nu5XAkz4E9k2vPwrLRNw4950hJ77j2HXrzR94np/FqKAtqFpKPjCEefeiK
         f/5jcZ0qPFnUkKtg9y6/qQBcdfciQdwlwe4wAyfDoXzcXQm8MnbQeL9P/3ZJuYZ7HCYU
         YWaG6JgwPalaRwvgoZwQ2bZIfZuEoq0yMFBee/r27Pe+6rGGYf3D0mLhXUDXI8xn3Gxw
         AUNkuCzHNfq/P2xnvwUyDxEaCBzlZ1chzZtbhMSiA5etE5VBrmg/V8kc671nMTcqmiXw
         GFtAdvirEPn7cfccKlL0GMTO+FmaNxY6RYDp39ZNwcQSmnQFZSV0O+jN9NGI9okYSb1T
         /06w==
X-Forwarded-Encrypted: i=1; AL+hErGvJQXeCEhXHOoLEyWUNOdFfOsXILs7pxnkm+wIQ0AyeumRYBC+lAo1/I3vGZHwtpv8Lzt9xETVin2XGH4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9eytB+CQ93oK2gZMbXIF83tXn/xGjZ71zkwIvhGnMxcbLjxyk
	y378VyOGUhZ8JOM+uPx5Y+EWBA76vnc7Y7JEkoc6EBXrSixOJtWgNn+rJPrjfmPsQE8=
X-Gm-Gg: AZFdTZcC5ZuZFYd6UWPVK86d1jnbl5EhYKNeZrLhspWAF2XZmqFbMkZEXR9Dej63g5L
	YdrdukGrllST0kVr8y/svGzl4il5/NJe+1SB6A0yhYcOmutPlf533TRa1t3H/mye+eEgnm51ozc
	3bqU2Lwofj+FIcWJIWBQjPWzwofnC3cha8g0De87zwHPdUXWRru+o/ZFGEojn8lp7gHh5kxl4kR
	ylyAe55Ha5JWhOT3pUqoPECMvUZIL/chyP4fmF1QEtg0pzXej+1Daiejb/M6EQ3DYZA7Ifw5izw
	T+6LZcwOMa/5sejY5rdIdy+pQhpj4j0LO7rEIOp1fHvKdr4WzNW0hs7172hGveYkxPXxUNPd/qR
	nNGsaTiSPBJ6VLLkK2d5TsPRnT+eOwAdy6LK/vNN1BVc/rzJ6AjQR7y5PDEvjGKFKsipily1GTK
	bmG0mHPcxiRO2rpdOekL3ll+9c9V9WlDO97JPocDGeaXOqx6YwLahT/Dx2fUL7cgxLLr+LsIlpx
	oEmEI+zg8J+5vMA+p3BFVCgeKP/3RDXRic/aYdpU3zPbdG1IdJhW5ZNAMjR7jIpA1kuRTbCmHyB
	/Bfid2Io9FxtLZ5Lk/eAJLgtcKs+f1BQb38=
X-Received: by 2002:a17:902:ea0a:b0:2f0:7ba2:e9ed with SMTP id d9443c01a7336-2f07ba2ea9fmr155052575ad.44.1795701772176;
        Thu, 26 Nov 2026 06:02:52 -0800 (PST)
Received: from [192.168.100.6] ([121.144.254.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120282sm103130015ad.59.2026.11.26.06.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:02:51 -0800 (PST)
Message-ID: <e0cf6325-d280-46cc-a3ac-a44a8b5b1ce2@gmail.com>
Date: Thu, 26 Nov 2026 23:02:47 +0900
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
Subject: Re: [PATCH 6.18 000/990] 6.18.66-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261126105725.767748294@linuxfoundation.org>
Content-Language: en-US
From: Joungmin Lee <leejm516@gmail.com>
In-Reply-To: <20261126105725.767748294@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/26/26 19:58, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.66 release.
> There are 990 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 28 Nov 2026 10:55:59 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.66-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h


Hi, Greg:

6.18.66-rc2 built and booted successfully on my system with no
regressions observed when compared to 6.18.65.

Note that the kernel was marked as dirty due to two
distribution-specific patches, which are required to build with
OpenMandriva's modified LLVM toolchain.
https://github.com/OpenMandrivaAssociation/kernel/blob/master/linux-6.18-clang.patch
https://github.com/OpenMandrivaAssociation/kernel/blob/master/linux-6.19-acpi-clang.patch

Distribution: OpenMandriva Lx Rome
Architecture: x86_64 (ASUS Zenbook UM3504DA)
CPU: AMD Ryzen 7 7735U
iGPU: AMD Radeon 680M

[    0.000000] Linux version 6.18.66-rc2-myllvm-gcdbd1b15b2ec-dirty
(user1@omv-zenbook) (OpenMandriva 23.1.5-1 clang version 23.1.5
(/builddir/build/BUILD/llvm-23.1.5-build/llvm-project-llvmorg-23.1.5/clang
0b5f47964323614ae2dc227f0b267ba43892bf06), OpenMandriva 23.1.5-1 LLD
23.1.5
(/builddir/build/BUILD/llvm-23.1.5-build/llvm-project-llvmorg-23.1.5/llvm
0b5f47964323614ae2dc227f0b267ba43892bf06)) #1 SMP PREEMPT_DYNAMIC Thu
Nov 26 22:31:08 KST 2026

Tested-by: Joungmin Lee <leejm516@gmail.com>

Best,
Joungmin


