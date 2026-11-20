Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219024;
	b=nf+BMyweECaKeH2fB3enmYfXUamoEKfnkWMT53ZstGGTp7NvpDHxALCZCjX0SrNRLEaX
	 YhktbXt82R8/T0GzRrk2COq0WQMdAis3vqSg03yTsKt+VRaLqg5oOZbdr8aPOUnQaZiS3
	 eQcwk0yxaGzOi74o5Ed9gQbEhzrXInQ0+vNXPDj7gRBpICdDUj9iEns2r+jpzwEJ0cDrE
	 sbIKz9He/kSSoOK5m3EOoxzucMfVb1avqTg5NLpyKldz0UBKrb4Mx1JgbQRuwppBm3u3E
	 laXKoJgrj37kCfCQjUejcrrgqZL4Oge8bbJ79omIgsusRvexFJNw2jynFJYe9EiE/1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kVgYuwZfK6/XOH25sVcw/XaxSILhNtXWSKbZSzmcIJo=;
	b=iMxXOUpVZYW8Q2fBr2z5GPWW1AztUKKTPjEzP5jlQXUwJEmb6IFvJXNUkADuYW+TP1ye
	 oatiLlVFiFal4k1FmnJsO8h++qiIgJkQ1QQncW/kCnSEeDzRkuxIcDX4rr04nNTLYuLa9
	 //1D8LDSNVtA4OhBtoEfylTRIY7rF40PToLbtl9bqDnJ2xd9pi8UakVcsVjaeiqeO6631
	 +lsX3ID0B1n1E8jnRU+hOB1ZlFkY3/76YA3Ym3kx8zSF38SFS9ghR9pnNK9iT33Hv68AB
	 Pz6Ykfa4MJOf3uWwWcPeDAjyzQBAYjE9sGqo3hwLS0438/UpJQug6rQ/WJe38aaJS0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iyiVdIbB;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D113A606A6BA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D113A606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iyiVdIbB
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-55d2dcbb905so7629221cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795219017; x=1795823817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVgYuwZfK6/XOH25sVcw/XaxSILhNtXWSKbZSzmcIJo=;
        b=iyiVdIbBJScr0uHl2CQqYIrz2MuH/xjWhEzXjma2JGWT6Db/ZRCQUSwiY5aPIpLP4R
         7hEUXeBBhzf3k/r6Vm66nztnJmVhot2/zAcsdnEN4716/uzrqGpUn11P2o55gGtn8F4C
         4sJ43zIzyWChPNJJyAUQCeolFKSReqIUd42/iCcVfa82alUjLpOLGrOP0LwE6OcrnJli
         ymkGRP0afLpzEwJC1RF8OkUn8sHpA5S1wO5+e5fAdT5XNLOEKVSteJRBarNRdrZH85Er
         UyES5j2EzW1FRdzQweKIgAG/IxOX+bD98ynB4q70fapDjK/QoHJmCieVdu2gdTjmrXyU
         O6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219017; x=1795823817;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVgYuwZfK6/XOH25sVcw/XaxSILhNtXWSKbZSzmcIJo=;
        b=MBzTY7MRlzlas/dwUvYRjL7TbD1S1ho7ctJhCYfFIz8TUAhhAUYlALiyU5VwxI+Rw/
         TkJDe1ZuRc1x0OB8/8w+C4PfZ1RqeXRy6xpOPi8+V+0JYy+lG7qSG+XUfcCgcA0O1yQr
         HlAcUPk24FcGMhY2OZdKf7pi9cKsSxuAKdfMjaOSAa3D1c23E0wYKXjqtHKyImAV/fCq
         vBKy7rqZtqb5inUqj2vrxxzo3jJZTNtrmyfjI2ZlZh1xFusURjAtTurD6X/LgjETXM3j
         EVlpSgcxDVme71h2DHr0Nql1Cw/z7RYlVYcVlWYGQ8Qaz3FL3jM1RZfXo/h2X8rXFPyy
         1UKg==
X-Forwarded-Encrypted: i=1; AL+hErGqBrt9hFIkZU2EsCPm+Hwbh5EffCmQK3G9TSNWfElitz2AVoups0GRj4On+JJxbA7RBxPivTJGI9yF+0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZvnTBe0/GmHwz51tlF1KyW61/vvkphVTfzvuwA5zlzvmZsXU+
	IISUpr+Blajio/AZzYl2wOsKiXAAk8sZyQ4TYlDlJpX9FNeHnbmVAAASTGc/kQ==
X-Gm-Gg: AYBFou2JXAvZQgHAtpCGf3G9iBcc0JYJ8Hhyzqc7vPGTiTpwDHczxOWWcluFbyVigBG
	PWqeqQrLAEx+kSWVPVPNHbationT4RfJyfrCF2orwYe9cf66ZCFsSCzYqHMw5Vr5q+zAIzWE7en
	fX+W68+xmWeSkoluQncC4x7dJTEnY0sDpsdoUHyoCuBxuSC8MFFaWo9Jb7VndNpycIi+Pas2hrN
	ofi4coh9vDZQ60UIyjxQArTSwdqrqMrytOP/kPyp5Bc3lBod2wVIzKjJl5RSrNpFhfkgcRwNek7
	OaEoAv13SePrvB6Uhfz9ZcXmXADOtTRQ+DmXA8gHGV9IzFA65HcKGo1Rr0ncOCoMXQOaFLLcLmy
	2TmLbuRIz8hLD4v3byBgfCqgmuHf2+W/Br75ERTTWj3g0+QFQB5B5wDrSw5Tiy+O/be3sTBEzgL
	8kgK3EeMQSyfsEsigmDbQLf7G/6rwbvTLFiN0SCuHp+uq+MQ7ZGoJdbXbQfxAVUaAse0Bn7nQ1s
	0gLIWJXVfRuT+nVT04KiC+CjUIHHGetlveDE6fIOkAzcCU6OWG1AKbppPwoBTw7FpzXJa2/Fd1t
	vq6gR7mNaLFpowsqIvEyknGw81x/3STQ2RdpY1p3EYHTUD0wNzrWcDfXkIxMGP1CS44Ddb2LmZI
	u1bs=
X-Received: by 2002:a05:622a:5590:b0:536:3a49:f76 with SMTP id d75a77b69052e-55d76a1f01dmr81789071cf.27.1795219016833;
        Fri, 20 Nov 2026 15:56:56 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a16754sm39125006d6.39.2026.11.20.15.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 15:56:56 -0800 (PST)
Message-ID: <e3d03f4c-0c66-46d1-8fbe-554642eebe34@gmail.com>
Date: Fri, 20 Nov 2026 15:56:53 -0800
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
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261120055248.913352689@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261120055248.913352689@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 21:58, Greg Kroah-Hartman wrote:
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

On ARCH_BRCMSTB using 32-bit and 64-bit ARM kernels, build tested on 
BMIPS_GENERIC:

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
