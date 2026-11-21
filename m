Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795236429;
	b=Epq9E0oYEAi7K+7S6O+3LjbpphZFxKNX5C7pIe4g59y8ZhnOt8zijG1YOPFXp/C7ddG4
	 u/sP6BHNxuxpHI+dwQ43DdiVwCbTCmyo48bUwKYRQRCsCK548/L19E+SErMVZmb0fZhYV
	 XucpSSJKtIVG0S25O+8HeepmimnMMnNhodBJiv1IWUKpgCuCRVUDyxYUJWPyo3YRnd71f
	 nntbAF/DrwkiksKLylrvVFvSobBykt9A6Kp+zLIQM46BXZiykA4+dSO8N4d7IVFFvVoJB
	 wkuV/2Ymw15WB8wA2CThc41B+V6Z/FK73iU7lDQrMHpKx5yXku/fCIHuTof/4AHKwRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795236429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Subject:To:Cc:References:From:Message-ID:Date:User-Agent:MIME-Version:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/CB9rx6q4lOQyZURMO9hFHlkxUMK+i+s+ovpJy5IDcE=;
	b=AM+pAPBsVNdCVlVD3ICW6tawUeEvb0dbolGf8FW5t8E6IvdW+5dAZc99L9CXv1da4Bmy
	 vbN0OQloWul13SXquG9ErCB+YwypCfnpucbzyzzmYqxN2GB72T8DrNdbroNIshGQ78ifJ
	 N5dIzc9mN2m5vSHZ6C4h0eR6wwXmDF3BfxMUblfUrHcv689dO9uUrP/s+vh1A2gUykZ7t
	 Hk/V9cZb+0fsL7gI4Qve/LFOx2Y1LsGjXtCmz3158+3M+bjGs5nQ8pVFT2cNqvyOQgb/c
	 qpoSJIQ9m8BFq6cQr8Qpfpfy6mLQ1HKWYB/x7Xk6FwUQi9Fr0YVtNd35S34se7fMnmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i9K36LQ5;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D05606A6AE
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36D05606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i9K36LQ5
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9214032a2fdso7373146d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795236420; x=1795841220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/CB9rx6q4lOQyZURMO9hFHlkxUMK+i+s+ovpJy5IDcE=;
        b=i9K36LQ5ciHWWwSCGPt+YuFZddoXX8yIBdGAkskkYPev32LtoMD6oC0fHogDY00NZF
         ehbz8TKRocNGkoX2F3Ogjrs6pUHejsbgR/hZ5sLuh7SPlPvPp1VOrYSyFZCpf0bKHwu7
         1zndkY2+wWnjFNUx8p6WVTEbHxeK5YwHhPhJaJltnL9Jy1J7yzN0HS721pZv30cPkwTj
         SPcOz+WZRhfwC7Plj3iUEIvGmnxsZOnpe75FUG2pLpiZEJeiebZWefc0J7y4ygPEcPsN
         4hB3Pu25bTFoVCsTCj9LBG3sVlxrd7hBGsE3Sac1vTTvveKs9s22yvGflPps5rXSzJTF
         aeuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795236420; x=1795841220;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CB9rx6q4lOQyZURMO9hFHlkxUMK+i+s+ovpJy5IDcE=;
        b=1PjVKtN5TDrFr3j8ACE8vguuVJlTszzUv2Xmh9YVqoXxyJnKYgvcQF4a7zf1Y8J6by
         bWGTWMzkwUc5j7+ZFHbuQtt1ObxbKOuUcL+2lGAixKpMM12UYYwuP+nfdYU/LCmnLn+1
         XjDL3YCdbVXhbTeJiVx3oy0APEYLAEFeAoaHeCfM0goaVN3rr2k8ujuFNiJwHPvdRAHa
         ZwUc0DA7dXW2xKZBzSL1GDfbiake/EIkDWpUFxapkA8FxKTSO26MHHFSzqf1NTpd1UA2
         KkOLYBqRQx/keF46pQUKsIgQiw+y8WN25AC8DtpKmRD/MFXrvg/67WbDINrqwkyhSTJy
         +yoA==
X-Forwarded-Encrypted: i=1; AL+hErEcUIY0vLA5Ld4JplbpnyMcCxMvmjjwcHXyw6D16+W3aUfXnoWcjT4CxzjeSiGvbRk+YpgWNQPc13jKqo4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p4QSLmzC8CJNzu6d7k/+rMGO9RjmZzSe6v3GR2nxBPjrb0hft
	TJA7xMSW0Aq7omu2T1q7pQDomTyQ8dNzFVXa/FaxARttUay8/rejGCFxZ7XMOSIe9g==
X-Gm-Gg: AZFdTZf9P68QvT6tHhI9jWEV893SVaqfK+2Nc0ksRwUtdqekmL8EwVMIHI6xkBn8YTt
	dTNWf/gHCFKg/pLr4QotdgWSTsNm//bRltZiKekVvF57eSzzDQoDWxvDvBzv3BuoeGqnzqqbx8X
	tfTRn7nFMY1s32Ea8swtM4o1/ZAcvMU3kdHRnGXS1Mrl+q7z5tB/3Bu0Mo2qc3qbpIhLiKxsM29
	lvIgCAHMgRQhFwktvogrmO8Mn2oiYRDe9G4mcmtcjbS5MH5ltKZqwtMNJIW/eTvEbs+bwzYXfiK
	EBxqmH5Cs5gfWgRLe5/2SYU4s8TmkZ02hmSJGtKQood40p57fRn2a69DtY1iSjAIXhmgyjko7jr
	MgSSf2I1ZqZUf7Ew0MqL1TpwePFjzrcEf3tZnzqobgLsWgdHAftiMHJqOFET93gCtx4KujHhM8y
	LCUpvOoK7q4ih1d6yfV1N+qkqlzqY9uxTu7v0IwZnC61R+YTmGsgPEDbWiLV1O2SrVUATtQkYXB
	ndTZHJ5PISgL5ljsTHpruvzWXoqLmCA5dA3Q7jhCIpE5gvSzA1k5soykn3tkPsxccjFXW516MF9
	PbWFVCwDLPDhXs+CVAu1xF4Mq5C0jMPMDrscmwgWCdwvQHSnEScA6M1MJvC++BOKXHXjJpTJNf8
	2OtlLTtLhGw==
X-Received: by 2002:a05:6214:5701:b0:91f:12f9:fc6e with SMTP id 6a1803df08f44-92134a9b97bmr100160196d6.31.1795236420154;
        Fri, 20 Nov 2026 20:47:00 -0800 (PST)
Received: from [120.7.1.23] (198-84-204-175.cpe.teksavvy.com. [198.84.204.175])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b0b10sm44711596d6.10.2026.11.20.20.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 20:46:59 -0800 (PST)
Subject: Re: [PATCH 5.10 0000/1811] 5.10.275-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261120054906.397973290@linuxfoundation.org>
From: Woody Suwalski <terraluna977@gmail.com>
Message-ID: <488235ed-c296-4d76-6d3f-430db7877922@gmail.com>
Date: Fri, 20 Nov 2026 23:47:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:140.0) Gecko/20100101
 Firefox/140.0 SeaMonkey/2.53.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261120054906.397973290@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.10.275 release.
> There are 1811 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
>
>
Built OK for i386, tested on a 32-bit EeePC.
No problems noticed.

Tested-by: Woody Suwalski <terraluna977@gmail.com>

