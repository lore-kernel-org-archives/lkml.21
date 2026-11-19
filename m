Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048322;
	b=lGLhD52INrpf/qJnhG+Rzfqw3ndH2a8QHO60zqrtAI4Mak4zHKIHETUeI6xAiUGz8KDV
	 mCD4l3t/m9ee62JOj89OyafBDBhWjoaA9qIOYdz2Io4WkJCQhCXeRFCi7pz/USiQsIjoW
	 +jJjAXDBUti6GMhCJRqGJV9Vv2s8pMO/6u9Fo5VBio4pw/2o64RlLP04n5yjPPp8vpayj
	 kf6XpnfufgnQP3ijCUmX4Zt6kMnSk3lGW3JZsIQ6s2+kiqXC9F6qiPN8XK/sWPcEnHCrO
	 5WGCRFGJanAyxBWN7pOU9jWyNvRA4fiZeAvwVNUJEZP5ltvEmAkjJxG6mxnHd1sTDRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=EmJ9n+7z7H7Pdfstw1q7EPzAbXgdZ2VMyW5XMf764DE=;
	b=icvYvNUixO7G3QeBNIZLiP9kDyU7NFEuSnegzppIXHBl9DVPdemFtrTFAZnLh1da+zjO
	 VfHKNnzspWADhXbXpx52JoSoD0YQjE5XCcXkfagRWq6uf9WCJj9W+p6Kk0pqka5+kOC+7
	 LvoyjQ+DyGIyscq9FhoKUiecButp+TJq4zs6ve/3lUU/imckW2kYEi6VDkj42HeAAbzj1
	 sxkJ1tZSq/QryLGtcz6fHIgIwXByR5Iv6smGr+TAmWuyq0LRZUFhiyYG1OcEuy/552NHg
	 y3JSCyooQ4FR9523/wV9oGXz73pIzXKVR2zH3vhtUjcPsnMHoG/SbS7cATfdy42xg4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=LyUjzDkg;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7D6606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F7D6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=LyUjzDkg
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so845135f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795048320; x=1795653120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EmJ9n+7z7H7Pdfstw1q7EPzAbXgdZ2VMyW5XMf764DE=;
        b=LyUjzDkgjpwY2fqh8cRQj1z6c1X1PUz2whV1WJU84ENXoWJ6X3QpVxiUOGchTFKyqF
         VWjvAt/zIr1sA+FOfWNYG8fj0AcuZolKce6EumJuHIOBeKzm91x1QW+P2hpzja8L0Ei1
         krFzD/ivvNOmsgfYdZZkVVcijajcLGDzH4+LrPYmkig7nUKOsOlePJd3bO001SjsRKOj
         FXlg1K0i33QALaum+QOVL28G5y9w3fVK1akHp1kV6HvcRC9Qnhacnrff5nbyUPYSi5Wf
         aGxJQupN+C7Ca0rVam7emy0sfsQKSoz85ZH3Zbd2CCljAOJer6e7Azr0SJ+Svj//3P6U
         b8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048320; x=1795653120;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EmJ9n+7z7H7Pdfstw1q7EPzAbXgdZ2VMyW5XMf764DE=;
        b=1Mazen9/cS7/9k7IaYyj/FiCY1V8y/JKwrvMm0o0e/32zeEdJRf7QBs6WPHEuABnZx
         Jzs3VFgN2LcBZzuRGy7MAFyEKbNFNoY56mInrWjB26iu7lvRDWrWEHhnDB54JJY4ae/B
         3eQPCr9MpXO487aWTmSZd+LplK8Q7+dExbTsDCWIoRrbJPjE7KZD6HkFN03EGCWWctnp
         f/d38MA/eRKhiK5CWUIvHpaC0r7xia2c7BelR4RA+uzOkm7ZrwTkJjn93UfnuC5d4EmW
         oG3t1vuAeX1R03TyCo0MsaGHC3dOrr4o6ue4TTf80HCwMVgi1PeuI/1mxYkVBNZClP8u
         EVVw==
X-Forwarded-Encrypted: i=1; AL+hErFl9L4s+YrQe3f5cWbDdXfQVvtXT7BVM3ErCNGDRqhj+SdYd/RLtZee8ZpFZ6CgD/9eoN0Hdsk7pIq1Mxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AnO4ZSJ2+KypuRRCkLg0XKtOBsH7X1S1js4Zdg1/PrLY7iajo
	Rw/Wc1AkMXb+MyMFh5T7M+yrwSQOyp2lpY5G4A/L/+BF9VHvpHbTQcQ=
X-Gm-Gg: AYBFou2e66N5kFdyU/8s0miPO5tQBWfp82WrbJzigwl3EFV4GweYmnYp2WA/DFZniIt
	cNbLBVpPfEo4yXhVh1KmZsbgOI7ZysJJqUMvOQwof8+Wx7yTe9US9dnVBW41qRO/CY2fjgw5L5r
	qOAsDLJ7awo9vZ9TRtqNpFtnfg9mMZkBkRFF4K/GYIr0Omrz9yYDv+f3d9eebyL8oiZb/UfYAXo
	2sjDWc/XsPs6GMhYHwUNRkFNvVEXeK2H7GaIZ0M0b8uwNV+b14GMgfkdPxXpn0eBEIoWx0DL1ze
	AUv+xS2mTOq/wB9Q0PorFTyDyrlP49fkrPh1w6n+nRbHmiexZyF7542+iFSatYHCOpX2MDcy/Z0
	WAhUSjjLZzCJZHOQjGnV82FGaLx0SIYeDflfoWCdvyXSePpXg9T5G/wtimow8e3vLxhu0ou4m7h
	UyOKKoLweVi1Ak3WjbH4lSLnum4t9o7Eg36YHh9lQES1xVwq9/N+c3siydc8UmjcitIJLPujdjX
	vth22OHeLIOPTdAHZheL/2fqL6Za7C8dSGvs0BfHb9oD+ZVExLnOJICB+liJA9L6ME8sTfXkGGb
	ur5zbZxmGEzQOx5+2/BtR7vOfBe2zluwm6pZ8lBl1UPCufkc22wUbZ+t7HS4cL2mUtzdceuP85X
	yBxjnUUZ6bCiOtZdrVcXy4RdIESA=
X-Received: by 2002:a05:600c:8b05:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4bb7da26eacmr82453255e9.29.1795048320249;
        Wed, 18 Nov 2026 16:32:00 -0800 (PST)
Received: from [192.168.1.3] (p5b2acb64.dip0.t-ipconnect.de. [91.42.203.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb845095dfsm13761465e9.5.2026.11.18.16.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 16:32:00 -0800 (PST)
Message-ID: <62c31ebf-0752-4208-afd7-57baae9fd73c@googlemail.com>
Date: Thu, 19 Nov 2026 01:31:59 +0100
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
Subject: Re: [PATCH 6.6 0000/3318] 6.6.163-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261118150313.527275416@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261118150313.527275416@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 18.11.2026 um 15:10 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.6.163 release.
> There are 3318 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

It's really a bit scary that the "new normal" these days seems to be that these RCs are so massive, 3318 patches, WOW!

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
