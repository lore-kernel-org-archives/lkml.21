Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795213879;
	b=IUBLwdp9IoO3I3oUy5DITNunkvWlAvrrY7kGaT9FBkbmAR7tZyjqnf9jlCB0PX4R/v4B
	 DeiVNisY0JWtL0MJiknNrc1+d9PL+wNoasJRwZQaWEea5jamrqulyvWI8P8yLOHCiTghJ
	 X59tbxzwakMzEpaMvelGBSk0SbpYMIlDAZlFzoWhSOaOxoky3eZydMOSnoFt8+86L2tiW
	 13C5ABr5+TaiTeRG7Y76KTEQDWKfV8N2q07DnSU6rDMH/PJ6PuFGvIrORj1+JnS8iyUMW
	 rIyMKUoIir8DBqAFNN44MMCbBJaJNa3BfBuv7sIYMoSO2KrkQHhOLfOohq5bnh//i6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795213879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UK3B3lWP4def/hq2HHCr0r2FkWoPUs+SuSypRY007Ic=;
	b=SV9v6hfqvXdE0pi5H1kH3lNRp8pYREngypcqjYDHlVqHuiZX5qPaSio/U13JqYWeai/j
	 /KCu7eVTlOVwUQr8rhbEfq2Qe6UXkPkn8Vgi0ZRLbyVii42XJZ7IvbbfvjtpGDgUBC/ad
	 TjFzFmPyfC/+Nk8TDmCKEAv0zCYC1Hw0k348ABIk0fWe23A56WjNuLYRnkA+fFE1eJjqX
	 7hUc+y/M7WDBZFXeUVH2IfpiPqrhtxCKW+c8ImyOWhK1QwLHJknfEy1+kXIT7rkz5OSVn
	 SD8fL5BkcHWH0O3BF0/wSDLKEobXet3I2G2wHcH2Z8F3gd9+5pZdScLttwvZJ2xS/8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KHtzWbPQ;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1618606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1618606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KHtzWbPQ
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-382f4710a17so2317308eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795213874; x=1795818674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UK3B3lWP4def/hq2HHCr0r2FkWoPUs+SuSypRY007Ic=;
        b=KHtzWbPQca8q+BknspyuGJ7jM6NKIc0Af5imMDPXF3pryKcEUTqoslZghbkq7Hijf6
         5gEuBXj+d4/baA86ARD1ArNWE7bA9XqqoaviOThzmzfv/NT/sVfBh7EAukSFclBqrPx+
         l6hW+yCEEY79f3QChBeJoRaXSTIEb1DcxrHZWA0hcMPrnbjyYBEP/neTXeNY2rc3S12g
         q7tBy7MkNKQBrcnCxvyS/L9mqT1BOraVf33pxiNFSiKhC4l2DJfkRcEGdVbHjB1ILMGF
         ik2N7nwfJywXqsHrf+z3++9jHPA0IIcHF1D7AJ4vhwNyXMZZeh+bRIVyGsUPW8WFi5xL
         p0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795213874; x=1795818674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UK3B3lWP4def/hq2HHCr0r2FkWoPUs+SuSypRY007Ic=;
        b=2ybZGksGbKjWBErHvwcdXAwD7v/Yhsac5caNukBAA8vyYBiyEWLF/P0iUNT0tL2q0t
         XwfyHWFQPv8r4Oa41poUZSgmD5jb5kGSwJev4oE7k0Bo75K30z87r8XBHnn0gNdoTXAu
         ka/mAdyzZEXZVaKRZjmLXCKd2kAGnopEwwGImERJ8Apt+e47TPqGm4xdlNbfH/tVMiNS
         DERbCxTu6mLJdV9ECLyMFwng55ZbzUgSkNxfz4BRt72Dd9BaUtu8RFdF0aYA3wPYnjnl
         uDC2Qq5LuB0tvqQsFa+tQ5tTO5ry980rrFj8mfsyAC5ZOO3b6eRgZXlgGiOFTxrIHBfU
         AS0g==
X-Forwarded-Encrypted: i=1; AL+hErF228CB6mVhbg01NuSaWOrsEhjK1YSBOMeuo8HWUy+lPJuLTCF7+S839J3lO2RZlpO0juf3EEJxG9OfgD8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G/4yuhfrakRibAnxMLs5eU4kGeL1qNYuRtRlUFPvcyDjds4ln
	+MRyWAB4tOc+v8uiwZmJ1ptMZmsQj+YhENYVYOkOyT07sMecsgCKe75v
X-Gm-Gg: AZFdTZcCGzjaoW0vLsSea+MZ5IE6HbGl9LDW2FdAvNoHtAYZBvsA7OTx/9KmPK9tT+a
	+0PQfncPvo1KKALS/eeh/539/YabQLJYF0+Vp4x/xFMReXf8cv/RqtSVQenM5+YuF98/8/r2KVz
	xfsOFNTofQjxedv8zoQl3H7GfsWjZEynDaX8dmS0vIhwBzOyc2yg4wq+B6qQw9Ncs3SIGwAGBn2
	qHlJGra4/NCwnv++RKRYnQcbnuGbryHIegeeuMySRitHUa6gMWuDvQ5tZJm+KypvfHO0DrTVIwF
	odLQuOsdoIncWNQ+Jg20uD7+YKbGPzRkw9ky1ToCtd7SPuoj9dQL/XoWNNDOWFxptrThh0AMqCd
	DIyFe1fxzjDZQKBrTHLDUktFs06bYg5MlmqpfhkSgPlGrV/q7EuKBGViKBPMeDOKHSU0TFYkZCs
	fnSngpXuGxBnQtbjIR3mu+EuBxCB2FArTwpRPiyApsYkFjkqZiSXGwrQ1OM3UUrJpBeatf8DxR3
	ef5YjIsHS8OgAwXrlidksgQzV4Uh+u5DJ7+sI4Z0ZIWTRMvZUI3AOps3/Ifv9k+ISjS+jNJJaba
	ozH+R8sVIT66KXD9O45/EfzFUsQ+bJqKSIFGqeItQ+R/lwEq4PHMcPIp
X-Received: by 2002:a05:7301:6908:b0:381:1926:dba3 with SMTP id 5a478bee46e88-3856983c0ccmr3823683eec.0.1795213873842;
        Fri, 20 Nov 2026 14:31:13 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3856456e6c6sm10229177eec.2.2026.11.20.14.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 14:31:13 -0800 (PST)
Message-ID: <a7c43521-79cd-46d2-a82e-01f784cfc596@gmail.com>
Date: Fri, 20 Nov 2026 14:31:10 -0800
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
Subject: Re: [PATCH 6.12 0000/1736] 6.12.119-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261120054951.366579794@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261120054951.366579794@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 21:57, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.119 release.
> There are 1736 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 22 Nov 2026 05:44:39 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.119-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
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
