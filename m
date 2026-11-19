Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070986;
	b=u+S0jyluPO8FW6uYhvtYjYyb3Q4YdzYeD1WUefRsTvYjN6Bl3sMCmNZ2zwNyIKV7c0YR
	 imEq3seDkITj3/xiCaHa2a3YmWO+YezR2WSOjhuIIO50xvWZ4s/C+SpUR9EzN8YNCmgSc
	 Fbc75RzpTNjO6KFx+ZjFT4yqgIjeHAtQyORlzO5VSUh86v2ccLerUJP8Z+xKDLqZm3xhE
	 cRKoAGs3ZqO3DrIApMx2jnZMoO3+3S3qWmOxOO5+uGMKTi14cyeXDQX1ZXEQkxowQoaMx
	 ROu5f71/HNO4vlG5EQv7s63LCeXBcokndjzohPyBhHcZwqEFtJIDBbfEVIc3UaD+NmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=myuh5cci3C/VnU4rAsT0YjOgSwGITK6f3ixSFCZ5/S8=;
	b=P+S8vdsQQLsn0WoANbL1P56VeO5uPqg9VEJvKBRqtVbaxYGjV9Z4wt6hNpxWCW1L1rSt
	 FfMk52fTUP1XIC7szk+azQnzGFfH9/Bbulzr1PRf5PILwBl/DQnc6VsMfNWh1RPSucees
	 p/eshajQXl/JJzr/9IjV93fMtsbY7ENezFgtfy7A22ipkH+6gz735+qIoojlv7TnP0DGK
	 dx4BZFA7jEtgVACUCw2oZX8Vrbw+W6ORjbmE3HgZmmJH5y6cG3xFIbcxUa1I1aF+yby8J
	 0LxqcdNW3Gy2Wtu2apFLutpPdNb4M0azZZgr1OdC4wOKcsgWBuO1L3rPDw0r6fJzCqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hl7qK9dK;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67D2606A335
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B67D2606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hl7qK9dK
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cddee4abc57so616683a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795070985; x=1795675785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myuh5cci3C/VnU4rAsT0YjOgSwGITK6f3ixSFCZ5/S8=;
        b=hl7qK9dKHotq4tAlWwWgZB1Fwu+qYg5tWV099ciWP/Q4Q+su73qdejMSuTY3NL40rD
         VrIQ0IaG32qBFd1weS++CvKwxe2uWpHBJCP6Xr2skDBR6esIMzTO/JtxLTpK9waR/S6I
         hnlBEwDXHkq5ZvM/JwyB9FiyhuBlnpClxCImm5OtgQ7Nmzx0b7JYReDZ9QP1NU8HNPeL
         4JiCgqkl2xF5GM16Hp3tgVjySFMAwhoE8tF1SBvc1KB4dcjOwOYDWbHZEevQJh56qCs3
         /sdJNRyxPuBu3z/J1Ala1eEUCcCT+UDknGd0DxLz2iUXXXyv/uigke8BQmhOiV7Wn0D+
         N9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795070985; x=1795675785;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=myuh5cci3C/VnU4rAsT0YjOgSwGITK6f3ixSFCZ5/S8=;
        b=gGDW2vpXGfwSi9QIOPvyElIvoRtHZEa3wWcfkw+iKps5mNYL/wqkqJKENn3qKT2KXQ
         JfDl6AgrvirCADLgaAMieFDYVCVBgJIwyISyGmIwYd+hdjvxrvtp+44Ny8wNkLGe9atF
         wa99IWCk4JcEdvW4CnvjsA4MegO2nHvnSGFiwL834f0JleRZWeaUIpOouSzbuRSikEBt
         ILbl15STaUC85U5+hNgrEDYdXLwHM1DK+PWdhlRRJZpYJOSoxD0POBofV8COvk+EOs6b
         i4ZTvYTtwrVjkPVqExh+j4z1dbEf5X9IGGq5WC3v+A8hXO2ORG5fcsTgmy4HyLJNOqBh
         EZ5w==
X-Forwarded-Encrypted: i=1; AL+hErF3oA+Y3iCeRirjrwh6v5DDwxIhYvN7/7MAeWCrflXnNZCNf9v0ptPccRSV56n1uCeyi9bvqvV5z5hxfFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t3ibm2unr0XTNtoT0NmQEdV3spw2U3NTgt0PrSz6VTQUQ+dkH
	cuN3vAyP5F2FtE/+Ku+9XK9UPmCzkkG33ttnH5LgxdvoZdft0VPnL6uw
X-Gm-Gg: AZFdTZeqNvp0O6odmFkRYlU+Xys7oBlRvLUwvVGa/B6Ug2TCofHm7UNypHFYMny/G9q
	khG5Vx/QMdC6hdoWdUeCydWmNDcogDaofnIYrkRB5OXELepXWjud/0ySxn+a43cRR00pbfLn9kH
	Mhbb1EKUC7WhokWxuDvEhLpPyfyGgAa/fpI1uJmRRTZ1Rctlqpne4kS/hNi1NAKmsYUcT6LRQUG
	R5HKpG+NWMHMtRhS90UUQEZjSvFIMGGWpeEi9Atbe0NvzBQuXyGVPGi+TDdBqDJm76LWNI1gSJJ
	7lwXU/FWOWz1NO5zX/hylx/LZeg4HVh8nqbVBKSCuH0RS03hUBB1dsr4j5C82yE1H75nlvAEEnq
	3vd1Evyc/Tz3oTLlP8FJOD6jjnM7Z7ZYsbLTZJE9nvzN0XbtgB6mfR36+Qc3gfK7kgtaO+Oxrrd
	d3OFQY2PXqOJsk3aityNFjuXfEKu+AtcjknZfyDz8Kvk9v1InxhJwCvFHirryNYYZ/ptNYlzRZf
	d6FfOmD/oWcD3x/iLZ3FrfK0CQGaZLUKyRvztE6lHKTgdnvM7tAlhkZ10wEIYshNJeCwwp/BXwU
	T0sz7m8gY3w1ci0/nV7DAJmvqpL07KM=
X-Received: by 2002:a17:90b:4fc6:b0:3ac:b867:81df with SMTP id 98e67ed59e1d1-3b3d07a38f8mr5227675a91.39.1795070985048;
        Wed, 18 Nov 2026 22:49:45 -0800 (PST)
Received: from [10.222.0.188] ([59.20.222.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40543eda7sm1159723a91.0.2026.11.18.22.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 22:49:44 -0800 (PST)
Message-ID: <088f8590-0ee5-41e8-9a2c-48566d6ced82@gmail.com>
Date: Thu, 19 Nov 2026 15:49:39 +0900
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
 achill@achill.org, sr@sladewatkins.com
References: <20261118150121.603863898@linuxfoundation.org>
Content-Language: en-US
From: Joungmin Lee <leejm516@gmail.com>
In-Reply-To: <20261118150121.603863898@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/18/26 11:28 PM, Greg Kroah-Hartman wrote:
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

Hi, Greg:


6.18.65-rc1 successfully built and booted in my system but a dmesg
regression was found that was not observed in 6.18.64-rc1.

[    0.000000] Linux version 6.18.65-rc1-900-myllvm+
(user1@gentoo-zenbook) (clang version 23.1.6, LLD 23.1.6) #1 SMP
PREEMPT_DYNAMIC Thu Nov 19 15:35:28 KST 2026
[    3.060808] genirq: Setting trigger mode 3 for irq 87 failed
(amd_gpio_irq_set_type+0x0/0x180)

Distribution: Gentoo Linux
Architecture: x86_64 (ASUS Zenbook UM3504DA)
CPU: AMD Ryzen 7 7735U
iGPU: AMD Radeon 680M

Tested-by: Joungmin Lee <leejm516@gmail.com>

Best,
Joungmin
