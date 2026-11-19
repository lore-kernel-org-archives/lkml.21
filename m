Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072303;
	b=FKBqPAynIKbEcezNRMSd847cAJPvPKydusOQX1vqiA4UuSg6ZjMtmwRALUPaSxF+wtYD
	 w1+c1O9eM7tFyLxlnMsRMZDk2U+JA2RT2Q67RL7FKP7oW3ILE/pAHZ1fNytMnfUx4gF2B
	 chBV9ZUl9wXrpVVakwKSBreOR9KyvmmLCXsFx2bCKz3X9/il9cXssTgjvlRrlHPTuCmKg
	 LDCixdjJ9YmjxZeaAVhlW8IDWq+bEJWtLBrgrBgv53w9EZybRJgnSpJ8L8EnGpphxt7mL
	 GjvqsRi3arr51dCHi9L51xPo4buDHr+WdyUvobziEorVfK08Pj4V/i2GLTT7MIE93ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=56K4FbTqN9iuqeBa4x5ePXVEpS5MDyK7GetIQvheO7c=;
	b=WX+27fvfAz7ni196ZuFAYdVUqA0vTCMlZn9ffcCDxDlMJu1fbWTRuHMlgsK7Cjg9WJIC
	 yZneZKQSeK1OzhAg/u0DMPorXEA9vATz6pQoVxPLdAMHLRpeCvxiNYQSTf0ZrsHQpBaZ4
	 /s/CMcWs8JSQ1zYkoVY1iuEhQOp4lrK61dMtIb2TMfv+VO/sj8QrKq6m6uyqZzNNZTJBk
	 JD7pqStkCdM2pht0ypdNk5ppzvRaAcKIeAq6SMgie7m4DlAr4tX56N1yaEQHyO0/7S2gK
	 6c4EC/KrPIgTyURgGq40JlWVeRLFCZdnspGS75rBMZIafTR+WuKGN85jKvqv6aLHojA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dp2jz6sl;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4968606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4968606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dp2jz6sl
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1205397a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795072302; x=1795677102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56K4FbTqN9iuqeBa4x5ePXVEpS5MDyK7GetIQvheO7c=;
        b=Dp2jz6slsa2nPA1ODcfYoYVFZ8fVvJy6eA9FuBu2d4k5NVYVdmhp5yOXVYQEwJtNH2
         zbXbU1hyNloT8Cn9/XX1Fu5Hjpyz8o5Hhvh8f939/QQTZ3WrNtO+FYSZOkySzqzRLZDP
         EzUXcmsebAvM79a8wqhaBXa74UwdrTTC9bL4nZIWYDPMXPjVUH3lpoSTvz9BbxKeg1zZ
         NXQE3tpd+Hsfhk/OMvAosDVsVoiSWNncBZn8RXrGnwID1uep42kebuVPJJ+3H3NH9P5h
         2bq/OYKpauyHaMHbCQLrD+paPL4qR7CM0NY+UtNJyhLjKSjueVOy4adFafLb4XwoCAQU
         w7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072302; x=1795677102;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56K4FbTqN9iuqeBa4x5ePXVEpS5MDyK7GetIQvheO7c=;
        b=cqOMUbOUi1n3hRtYnsAcpfpEGFgIyNXPTqzy0Ir9l49LaJAnHcFTi/xSCUKbVLELgd
         QADAJA/9n0vD4XYICPr0T/s06j6UbhAGaSWjUh9QM7wlHWhxGmOJVTm+/5/GS1KzHyJR
         aU3r0ixoFEx8tmj99M5xzmI+E3Bs/lbxab4iNNvUNaG/koy4hPPSO8WvUyq2kfMbcaPA
         UUC/SWBUKLE6YAPufOXEAa9XcYYh18kbJUJqLXWBmhv0mi0c9UTG3lgZKeWLJRSw/1wC
         c9Y7FfRMzSucEBjEfY4gGR3xY4YHWy3RvmuTNtyLfrFZfDgZrwtG6pu5wloDVNV0c5ZZ
         mhUQ==
X-Forwarded-Encrypted: i=1; AL+hErEl0mlLPoCX6NxxEFA02vvJa7GcQxg6r/gaSJeu+8fVz1QycIO6cDsCVDkaCdoHqEodB7W+DHmtrQHxM8k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5ZEFVexe7gtc2Cx9WARbKSc+oqbzg+T7S5Cy2PPYldtpQ1kvX
	v9hDKlupIvWH+SKjan8TclO1dQkRGW3bTivv0mClfgh/b/NPLLAaAYIS
X-Gm-Gg: AZFdTZcqMxlWOH/2ykD0MSKvhn/J+izMjSWNmitjTIY0fvzoPaY9Wz55fVzPYgA77R6
	X8p1XE01GqTBtJmmkbnrURPUvGOePdydNRZNnqaPE+5fCEwn2n6o32EDnRIlL5rbeb4EenTo9Iv
	ekrG+abI0ONkK9JwbHJhPwEVwXtAquaQ5t6WYAWGLDgFDBTP1kem/Vr/yiSiLCrfUVwOSAEJinD
	ffromrIVG8YnU87iUzwKGZTqd3q5uZ2rvdt2NwayI+tN0+ErVxlJTQ14ol24K7VqD71I7H5Hem9
	VhxyyiczgZj0VUfM9YjvS5BkHIz2412xd2CudiM6PIAhyF5azDGke1hVVdlPuRUaNdn1PcAJ0/I
	4jEaQTFGsDCD60RphLKis8ZJZ+M+UZ8KNs8T0FIqeF4rnXLtiGOMoZnw/048V/6XWMrwsDPHEUp
	01xrWgeREe9xSkjSqzWgG+g5cuc0EYecMkPYEhNm4KUVda/Av66UQEHSljSoGeOMDPBOezxt5pw
	ChhPFNNW2eYAb1b02Hl5nEPzDerXdbszpUEZeYpQnaQcON+48dnVUESCSoIbgXNsdTcibFEMdWu
	aqKhfK8cIGw6uB8+5yR8nDl4vwJP4w==
X-Received: by 2002:a17:90a:d886:b0:3b3:b36e:8c40 with SMTP id 98e67ed59e1d1-3b3d07cd39dmr4957649a91.62.1795072302037;
        Wed, 18 Nov 2026 23:11:42 -0800 (PST)
Received: from [10.222.0.188] ([59.20.222.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm1183692a91.16.2026.11.18.23.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:11:41 -0800 (PST)
Message-ID: <69c61b39-1b78-4c9c-8289-8ab40cd13c96@gmail.com>
Date: Thu, 19 Nov 2026 16:11:37 +0900
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
Subject: Re: [PATCH 7.3 0000/2651] 7.3.6-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261118150247.972732815@linuxfoundation.org>
Content-Language: en-US
From: Joungmin Lee <leejm516@gmail.com>
In-Reply-To: <20261118150247.972732815@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/18/26 11:20 PM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.3.6 release.
> There are 2651 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 20 Nov 2026 14:55:47 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.6-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.3.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

Hi, Greg:

I see the same rust build error as that reported by Thorsten.
That error was not observed with 6.18.65-rc1.

Distribution: Gentoo Linux
Architecture: x86_64 (ASUS Zenbook UM3504DA)
CPU: AMD Ryzen 7 7735U
iGPU: AMD Radeon 680M

Tested-by: Joungmin Lee <leejm516@gmail.com>

Best,
Joungmin
