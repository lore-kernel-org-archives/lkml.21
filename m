Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795030561;
	b=ilv9ElZZB8oKGx0B0KiCUbZARFmDTcnj0XVWeIvhmCixtncaoQ7VI8IfpRB2k5BO+1Wc
	 AWVN0f8U5XE9waYE+SHyKwJlJx13eKK8PXXg2n9eNfy4Zx/67TrUtF2z6Oqm2LTxFHZob
	 mNqSG/k8i4ntGUTNpKe/hDIPELieFZaRyUPZEhCi5EbH1MKpcB0T5bX1D2QP6/YVXHwRU
	 hlEQXHnoA/bBPIfM83+hKgHDUcGcD1+GcAn6y1Fs/pY8Ts/qGwMQOFLbhTtWr17JXIDB1
	 ZIO7gTDoXpoVDQ0KD2dm1bEHG4ElzeI1XTgXci6H8DflCLKfW/mvr3G/jZcZClWwMfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795030561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FaD+0SeebjIC4CSZLUfCZ0AvJts8laW/iFN7jyexdUM=;
	b=B31xNi84ee8cT4mRwl9EVVR9Jx3Oc7EdNqK3Ammsfc0sOUxZ32OgOflPUxPa8STif9st
	 lwbtAeLqkKs04APxWHJORQAUYhcLNeIM7Sx8+rOS9sfPkhYskO9sT6tkRoDioPmq+EjEb
	 oOJQoz/511RWXa6rVZLpvyif99cCF48QN3oh6e2jPyI+TUkwnvp2fanM8Tlas0b6L52w3
	 lUQB07IgMG/smOOlXUemXH16o1is6Ob8X5a+ljX8iKnyzcILtddLTvjsSfh+EXn/efDHj
	 Es/fMmaCTNAr15B3OTxE0BZ1m5swplE9fQ1UoKUOQ+udcBsL7lvRlJhiKt41nI4wMMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kYPXnquU;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F38606D37B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18F38606D37B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kYPXnquU
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2efd993e9d6so961115ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795030560; x=1795635360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FaD+0SeebjIC4CSZLUfCZ0AvJts8laW/iFN7jyexdUM=;
        b=kYPXnquUCmratLJzwuFZAJLfDgSmUPOTLC44bUIBwapTOSBlxTz5Fk1ydYuppv1rV4
         r3dyBRF0B0g0KFWyZ4uPmC/n8kERdQcCDnvS3gtxs+/hnCKBpdzZLPZDOwPkn5KBmb3D
         Bz/Y3YuBWgTtc+OqeESnOo0m4lm8sqn2fSMQoPAvpNVySaVE8ywqcxJLxZLWnnVAJpJY
         0W5S5h+ga0+oncpxAYTRxuP07gHHdkENpphWzrXzy7j0NTDWUorooDpzMjj8m6c7V5mE
         qVSMo4gIg/1RxCVzQelq/suUH1hmlnxf3UrX8g9Va+fLPZXJvxWhiQ+ZMXf6GszyagNL
         6wTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795030560; x=1795635360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FaD+0SeebjIC4CSZLUfCZ0AvJts8laW/iFN7jyexdUM=;
        b=M97Y6zyubgAoBeCp+vFZmIJtMwutgQBELmAJ+hleSnL2k8qqq3osKNvLPr0sOTlXaP
         XJ/O0g2IAby5qZUtml2XPNy0GKDWq6TzLuoR+/x8TVwPUOK7rZodpFvw2xyHmNgscwjO
         8LcakuWVHWURz6aDH1Moz1X/GBdcMCI75pirYN8IBaGNoSOjE9vHsUBH4vSKA6SSEFLZ
         ujovMVCAXn1RlzoIoOEF/L3BR0DUHOmK+SsLQcNvdVngtskHXEziLea3Sl3Mk/oCHf8X
         gzMmKtGJx+I1sY/zB0PkgLA7UK4XBSQ5jhQXRkHvDajmQICsRqcNNA5TjwlZ51S5fww8
         QC/A==
X-Forwarded-Encrypted: i=1; AL+hErH7WHwdGryaYrWWHgMFnA/y+eQuklLrvKFb4kp5m8e1gId+wTCeAKT2J++g+PaEG7I7TWFvMMnWxJAbpG0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/m8oSsb40bSVpfpsluPOSBxAGySSVnaho9f/ExJ++Q9ns0uOHm
	8JkTHilV2hspG9LvsTnR4Hbhyqzb1Ruy4elCLL1NHu0FF1+Pk7GRKr9S
X-Gm-Gg: AZFdTZeIpkC2hwEpAtZ6GxCvJEyV7OOYHDa9wRdmb5voIiDOM3O0EtMp5J3hUU+yZOj
	13pYr81b1Q22NrXYkToM302eOKfGTupqNImEusJxzMSYwpVTX124jmYCBjdvL4sv/GvN6VKYSFg
	edg6evMT/99uJ+EavqVSQdnb6OF+LSMAU9hMEfh6AaRaoFl8IPwXRcqOSYBtG8XHqFH72JX0jGc
	QOuVTS3vfzFxpct+63N0YDfVGm7aQ37qfM1EpnDiBBRvSOr6UIuO9jdkUB6vUjm3L2wy3PHpDWm
	0yd9Mj1ofa6ALHfl3RvpuVaPPC6jR+glHXylH5t/KhxnR6YBoSsw7KiRocgO4iffLeBqcLa4rd2
	ASuqZPy8V9kRlhZyyXgAu/b9y5TX2XoaIgtd63xHjUzIRAw8h26EuQ82zvTXgUJWOAXabtYp209
	u2/+xLoELaXESGC9Kx6g0UpS0WA5mNRKNW1unMR2i2+XeF5CxtBYKSwxMoS1CaMZCMuI849hgBW
	g8onFNopat/8hcVcz/O4lqtFU2iFJh09lh1cSqFmrCC51W6W2+pCzyCqmwIhuI4sBhxJyD8m5Nq
	gnpGU9nzj7bccl0RqXc34tP7QBPH+69pd3i7zmH/s/Mm/+bqBZAxTmN8
X-Received: by 2002:a17:902:d584:b0:2ef:fb60:ca47 with SMTP id d9443c01a7336-2f019883e9emr2883795ad.35.1795030560257;
        Wed, 18 Nov 2026 11:36:00 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61162dcsm18553935ad.18.2026.11.18.11.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 11:35:59 -0800 (PST)
Message-ID: <abf15e9d-6317-41a1-b43a-188905ff3888@gmail.com>
Date: Wed, 18 Nov 2026 11:35:58 -0800
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
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261118150201.293410965@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261118150201.293410965@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 06:17, Greg Kroah-Hartman wrote:
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

perf fails to build the same way the 5.15 kernel does:

/local/users/fainelli/buildroot/output/arm/host/bin/arm-linux-ld: 
warning: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/arch/perf-in.o: 
requires executable stack (because the .note.GNU-stack section is 
executable)
   LD 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/libbpf/staticobjs/libbpf-in.o
   LINK 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/libbpf/libbpf.a
   LINK 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/perf
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/perf-in.o: 
in function `test_truncated_branch_stack':
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/tests/sample-parsing.c:397: 
undefined reference to `__evsel__parse_sample'
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/tests/sample-parsing.c:399: 
undefined reference to `perf_sample__exit'
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/tests/sample-parsing.c:400: 
undefined reference to `evsel__put'
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/perf-in.o: 
in function `test_truncated_swapped_raw':
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/tests/sample-parsing.c:445: 
undefined reference to `__evsel__parse_sample'
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/tests/sample-parsing.c:447: 
undefined reference to `perf_sample__exit'
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/tests/sample-parsing.c:448: 
undefined reference to `evsel__put'
collect2: error: ld returned 1 exit status
make[4]: *** [Makefile.perf:675: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/perf] 
Error 1
make[3]: *** [Makefile.perf:240: sub-make] Error 2
make[2]: *** [Makefile:70: all] Error 2
make[1]: *** [package/pkg-generic.mk:286: 
/local/users/fainelli/buildroot/output/arm/build/linux-tools/.stamp_built] 
Error 2
make: *** [Makefile:29: _all] Error 2
ERROR: Build failed for 6.1-rc on arm with code 2

-- 
Florian
