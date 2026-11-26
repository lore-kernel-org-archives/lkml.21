Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704100;
	b=hJ3ZDp1G3WCblJvJUOGR9fdDd3dljN2EEn/v4oQ9UtXKupZtSwX22E78L+XVx/CYc9e8
	 1MUgSUxvN/8szwf1T05DjK+xDhz0+5sg+mvZZRDtY6/QZcx7Fazi2mJPY23Nt7t2eRZqC
	 UIWgBMIc+0KCoi/c5yGgD9qhq7kDE6gp9LIwbuNxMRagU7mEq4wLgPVS7eZJ5ni0zU4RV
	 ve8byNwGvBniGNcOhP4Na0g1lmkdQdOgTQgUxL4EJ94HuGQhZu2U1tXJJRrp+1Jg9MQti
	 EWn2iHuH7OSBdlzNNe75TGAmeCs/Ywo9nqaTgG0/JLGJpyCEqm+VTruWdmrvZ+FgBEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LpdDH3GEwcUlVHPK2yBSFsZGWkbH52RFZRnAmaJgBf8=;
	b=BBmduwT+57f0haJ0mTAH1PYkSOL/6WBtqXw5tOCabOGkRfb8Wyyelici1vFiXfYIFmyo
	 9NE4F2onvZUwR4lKN5XbdEplrkZbP46vufKropii5rA0HJVxOH9tN+s7qC+LFWNW8KviA
	 yEoSZnI489kwo1MCOQxeQo3p7jgjbcdK9clRUxiMHxghOcVestDKFHll9WUrF0gVvjRe/
	 JMhydB3/3pSxmN+Bwfbowzl7BeqaQaV6KKN2sDJ0KIzPN7sT9od/p/vj2fyU+P5jEWPPR
	 m3AePIAGPxEaQn9fiEdX+RZDNDQT4FAyIpGyV+6qABHlAKbSFe4uxTwco6lIl40Eomw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gL4LUGC2;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DFF606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1DFF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gL4LUGC2
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f045b921caso41139955ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795704099; x=1796308899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpdDH3GEwcUlVHPK2yBSFsZGWkbH52RFZRnAmaJgBf8=;
        b=gL4LUGC2lPmHO+C+7Y2OB3wZsZdBRH4/iXzpDVUXZEdKrY5hv+Enka1lcT7Msk221d
         siYQKI1hM4GZiZc3yxACoinn6yc7kXd4mWwhoF1ATOZU3XP90WcInKvpobtZXgGjzXiT
         XSfeFpnB1ycd7V2L6e9erfoLjTUv0Jav3TcXFXOqpiq7Wx8kXZhuDGfrbVFe7d6pZ+np
         G9CgMVsOq6UsHLtqkAqrEV2rcCzpX3y+SdkiKNski+CYq66UT6bO/eaS0JT54Vj2Bb5i
         ET9l2uFaN5mLU6hpN9iLJJWKKIMbuOJt59iBWF/SzNjVXZZOPUyJQhFny28kGeCDSKcL
         1wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704099; x=1796308899;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpdDH3GEwcUlVHPK2yBSFsZGWkbH52RFZRnAmaJgBf8=;
        b=GRdY8BedW8nSzozNMtkPZKV0iL2sSnPEDxfM4kXvWk+giVMNsRjeIJN1Hd2JkdHfvi
         7HTOp3uXoxglbqDzHCeUOQJwybiWmuS+AFAg3OQqVgJQ6tf03kKhC1uOC8+ofdccYC1p
         qcYHnRYDJHIBpZujfbehVKSGgNvZbjFoiC+CeCflpFpdXsVctOG1n27aAEt061fl1L39
         s1MUaLcQgzGardrMPT2guJeVz+VFiujRCFnpcxk5bm0BWwzttCliVEXQdkMSztsOJQJp
         2ERiZETA8/+AbiVKRZ+GTwOzVKPxJHlcOIACElQ8FRFQHqBE33OGpmFoq1bz+eBuQmVT
         UsDA==
X-Forwarded-Encrypted: i=1; AL+hErFjU1mYiVQ9LQlE9nRono8uAdrbiAW7fcSLOfhdDetw+OQhI9iEcfkYVjxjRrdq3isdbRtpEoFE/VK8ELg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U8N3dvjA54bSoJGMI1NTJ1zvNqvxAb0ODcZKZ8rBfyfHbc57w
	FerYXpHO0mam4Bmo2fCDB8NfG+d2b4hUTI19Gbv6JSubaa947IhGGEQH
X-Gm-Gg: AZFdTZcEpr0nEHEMp1h/NGvHsDhw/ZKxD8B5K3K2RR9H228ENAOGP57moBJ56V6psor
	1NTiQSudZuG4Psn7vH1/6aAmP43hjnrNncEvFG6C61hsXyB981S/zpuMmQCakzY1FmzVdHcsG6Q
	FWrg6/oRDdLalUMTEBfE8B65esn1W6RbDb8XkSIr0rb6w118GLLDsrPITjQ6x+3kpwLWdIRllB8
	FSjcilN8KBaL6U624bFhO/xvt1RTBGqaUgwhY52rSr4HYlXhi3LQkNiDxZ3/28BHHX2PDbsy9Eh
	wup4BM/cVLK/T4f2Lffnwp5ljWSEDPznps5tty6btkVGQ34twbF/WgsE4yk41jASImf8jes/s5M
	90Ez5QUxQUf8ClY9aSBl2A9kqAPocIAS52loDn796fEgf5pdSR89waV2ekNI3ECw3PBWe9WVEw2
	Vc3+Cp3N+HB8bFAXd8EVns3ZRf2FxLkmmFYIrNdej/Fh2P93PCFei6aRAetbL6+VA4BWBQViwc8
	QnzcEX5dA91LMTX2kVc56X64tOnHpiOL16lddTOnalpfFmBsX5U+ZXr5/nZcKDzCnxmdVF/t2bN
	zNLWkCATIpUnq9fCs0i119SnBbxSh0KCdw==
X-Received: by 2002:a17:903:1a0e:b0:2ed:38c0:332d with SMTP id d9443c01a7336-2f03f16eabamr208027145ad.23.1795704098961;
        Thu, 26 Nov 2026 06:41:38 -0800 (PST)
Received: from [192.168.100.6] ([121.144.254.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10e67csm104457755ad.53.2026.11.26.06.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:41:38 -0800 (PST)
Message-ID: <b8ed68cd-4d8b-486d-b933-b1e093a403cf@gmail.com>
Date: Thu, 26 Nov 2026 23:41:33 +0900
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
Subject: Re: [PATCH 7.3 0000/1002] 7.3.7-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261126105729.110697432@linuxfoundation.org>
Content-Language: en-US
From: Joungmin Lee <leejm516@gmail.com>
In-Reply-To: <20261126105729.110697432@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26. 11. 26. 19:58, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.3.7 release.
> There are 1002 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 28 Nov 2026 10:55:59 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.7-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.3.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h


Hi, Greg:

7.3.7-rc2 built and booted successfully on my system with no regressions
observed when compared to 7.3.6.

Note that the kernel was marked as dirty due to two
distribution-specific patches, which are required to build with
OpenMandriva's modified LLVM toolchain.
https://github.com/OpenMandrivaAssociation/kernel/blob/master/linux-6.18-clang.patch
https://github.com/OpenMandrivaAssociation/kernel/blob/master/linux-6.19-acpi-clang.patch

Distribution: OpenMandriva Lx Rome
Architecture: x86_64 (ASUS Zenbook UM3504DA)
CPU: AMD Ryzen 7 7735U
iGPU: AMD Radeon 680M

[    0.000000] Linux version 7.3.7-rc2-myllvm-gce73b94700e6-dirty
(user1@omv-zenbook) (OpenMandriva 23.1.5-1 clang version 23.1.5
(/builddir/build/BUILD/llvm-23.1.5-build/llvm-project-llvmorg-23.1.5/clang
0b5f47964323614ae2dc227f0b267ba43892bf06), OpenMandriva 23.1.5-1 LLD
23.1.5
(/builddir/build/BUILD/llvm-23.1.5-build/llvm-project-llvmorg-23.1.5/llvm
0b5f47964323614ae2dc227f0b267ba43892bf06)) #1 SMP PREEMPT_DYNAMIC Thu
Nov 26 23:29:00 KST 2026

Tested-by: Joungmin Lee <leejm516@gmail.com>

Best,
Joungmin

