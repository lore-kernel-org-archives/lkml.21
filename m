Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795237733;
	b=T7zbUlcOElz9vkDzHdYrUwd/P7rQUQs+TQtUfWkr4YtD8PvfoIZwnaok8YMwSQwyNzMp
	 xfvwiVEMq5WeacM1XaDQnPUNSZA/5Fp/yglxgJmOkycsPEhHFzGBrNL/QC6pRNIKOr88R
	 haTj44HImDqF+XIKRhvS85nweU3P4Hy+/EILMshVukRgtNkrqJFR/nENMgWlNkz1IH8ew
	 lpell1ZoZAmdQLAy7Jq+xb/3zOGiv0nKxCOmCcO6/nr/iyZyDzr7NYLRVKdOt1LuEbOL9
	 StM3/YE5fhydOjXths7Vg0i5felJfMoA4p3nDbrbVA+32nr7eVe13JI0HDPA6DkqyWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795237733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=zq35YXCPx2V3r1wIC+O3B5GGrUsSEAAKs34AuDkQiBE=;
	b=LfuRHKYuf8rICqpQ/ga6oRmaBhkCj7DP1hlblNbCoHa84onPmWlwKy26pMvH/2TMyYzP
	 pRgmT/ZYpRj07B7BFpKU2cBVkXNyTfi6LQVMbEzmJc4wEFxXB0b49NbcTeGgwgtkjaSbq
	 a+/SNIZdrRmfx6ecpuoL/LfWtqWfOkQBcQ1dvVl2mb3xLMjJX0ogb/XDO4QuJVKdS+vZ2
	 VkohLj1LZev+2EHE9UNPorG1942watX0rgGpP2JuzjY4jWJKH+SyG26JsDu+MD856Zopw
	 2ISyfA0BOoQfUq7XUJ/DQlmd4UZbTcASli9uWWn8LcBjYvQyOHnFpNcY+v7hqeJzPbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b="tZnt/4Y7";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695FC606A68A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 695FC606A68A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=tZnt/4Y7
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso14985125e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795237732; x=1795842532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zq35YXCPx2V3r1wIC+O3B5GGrUsSEAAKs34AuDkQiBE=;
        b=tZnt/4Y7RYchW/Xv/P+nub5RSq7O10Uz2tD8QGAgo4NiWxcY8xgsVNfH/37JZWuFaD
         xUiz2wRoOW4b0n36yr7cAhTbOuBnPedxhBwdaXgxSeDyL7RbmNzgv0H1MtrzQqbcUSwk
         xHFlluzBeM10rRkwdul+NCCEadwZY50g4MCOIdGaBQwI32P5gY5IX6WOzxrZhtNhCcPo
         JeQ/6C6AFaAEZswEAUISzl9WWYdYiF1x+qBH9pZYsh+ZiOyP7DI5nQl/qqWgiJaqTb9+
         IiGaVZ1cz4pJ2ILrirF1cnCldLrUqqAa1tv4kKrH4KhtDijozRSQLGAPkUHr7jsJZHjF
         LKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795237732; x=1795842532;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zq35YXCPx2V3r1wIC+O3B5GGrUsSEAAKs34AuDkQiBE=;
        b=qZ9hal1QhdZ+Dvjm9QyvM32ja4royVwu381vBZI3T707wMBu6s75HrrxanmcQf3Tmq
         xdpSO4lk5Du7AW9h9qp6jsMUeVUZ9/Yz67tbXLgKH3miJQRjnbVEp9KVIYbWW8uFGxCK
         iiBtDzMYl9kr7JmUf5605z+3KnjRQ1GSiJbrTl5lxeOYTYASjBTAHhgfbSlAAufl8hfQ
         b/iyI1ZniwwlvMe3LE2b7Q0akTVxj/UZpRPfoy51nxPHsPvpToDMqxWkp9LObBpSwYee
         qEC7/5ycuGA2tdanK2s43j6c6xJvOvZWkHXeMcYuU/deJYISgKdbgtS/s9vDA2xXgrq0
         qG6Q==
X-Forwarded-Encrypted: i=1; AL+hErHmXlsxcIlOCArUeEBIkIeeL02dKKrtop4etFg+6196npXZRXRKyc+e9ReUeHwtjXSfs6md2zcAxqT2CKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z84lydzFrCcmH2JRPhoSKKcgKPHnKNCjp6mIfMsR58LBYoqH1QB
	sQ3sgcK+qKaWfm1PMGSRETVTYZUAK53DhMGLK8glAGGM0wun3l34Uyg=
X-Gm-Gg: AZFdTZfDdartgVWULS17UnrUPQh95qkhBc8nAiDUwJ1LWqizsB2ajC+FUJHjI6cAtGw
	ThsYMjTwqaov3jZ3rNITDueu/q+8NVi/8ZqMZzh+YSP5Qkkkn5fvnEDWK94m9D0SzQgM88ONmow
	0yDLjoHL0IX+fisCOIwrIVWTWfZWnoPvQf9rvGOHqWhFFFcNTMuhyQpYHyM7ZwwEfVjpghGdeCV
	hiKnkjtWF2Jng7bWuy0bFsVOZGFiWZCunQlswID2vx8qQSdj0dcTSHGZ2Ip6GLRuDm00G8mG1Ha
	529w0SxO9aOIzNRJe0b/BwZXmWaN4cRuVFp8VTlnd5YOqgHeUIaAL7TOQl4vsWZhVMco9JXI+1M
	3mAc/zpfwoaPCex0DRPZC+U1HVFDdbkxN/Jexz/TbLAE8+c7xho099CGr3M6Ly6ER1GpT8M8iPU
	8/LsASkGlFZm4v+Jkv3H9m0YMcRd3pAomm81sKQ8vX6SJ7pKzMCHPPnG1545O6UNWs0T9HnRtEB
	aiIP9rOPJwPUl6zrsS3OMzmZiCuZUY6mioje1HN4yp+SotnsvUPdZooPKF7YhV1yRJFvK6cPN85
	BbEdsqukl601oMTL9dpSJobtIpvzfC0IgymGXcHhJQ3huyIK7EeOtTYD4e2clDMBATi8cSopqW+
	3ixfoZw==
X-Received: by 2002:a05:600c:34c9:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4bb88810d28mr123194735e9.18.1795237731809;
        Fri, 20 Nov 2026 21:08:51 -0800 (PST)
Received: from [192.168.1.3] (p5b2ac65d.dip0.t-ipconnect.de. [91.42.198.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm222372595e9.14.2026.11.20.21.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 21:08:51 -0800 (PST)
Message-ID: <4d8acddd-10ca-4630-95e2-ce2adb76c689@googlemail.com>
Date: Sat, 21 Nov 2026 06:08:50 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 7.3 0000/2642] 7.3.6-rc2 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261120055248.913352689@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261120055248.913352689@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 20.11.2026 um 06:58 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.3.6 release.
> There are 2642 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and works on my 2-socket Ivy Bridge Xeon E5-2697v2 server. No dmesg oddities or regressions found.

Tested-by: Peter Schneider <pschneider1968@googlemail.com>


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
