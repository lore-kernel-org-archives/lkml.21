Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795231072;
	b=s0y3iAffcmGGUeOYMvD0jbO+NiRmLMQFDyEKZWDQrQAipPFUkgwJZXj8RWpfFIQnOQpg
	 tNr5cEOuwsIjmtbZqfrL6mLTrHki0hi7VmQrknX+n4BxhqTauYUMG2gIdSr0ugEtShJio
	 zacSplho9iYZ4vPSEhAvtWdtUQvZfXWI7BDTA1lGvAuXhdTF5+dlj8HiVYyo0tVL2R5KU
	 Hmf1OzMiik2+4zg91Zztv4RmTYdebAdf+M1FgmNOCzxdlCt12VQ8xSPTs986a1ds8TRVQ
	 z4BDl8CyM8R+XGNUuRRIqDJuP7/EY32bL4eowFgF6pvYoWnqI39C8VHZkeKeZXMBlcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795231072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ARUUOXphysUaIVQ+Q3NSspxOkVH0D/WM7AIA+6teiM8=;
	b=gg6iuyLHZx7aDWzO2FrvlITrHuiQOoP0bYfV14F5lQI/0R3d80KOo0lGD+1WC21rhvl5
	 D8kR6H5ZzmQog1mst2ZfSGmjmPmIlHh6wzV175vcIvSYMjZ2A/eDgbnFKhHrUgtUGB+sV
	 WEJt0K0Gyq/p9dhHvVHGlkyysydpTgaTy9MsW9Hml542lWZZEJmuKrMf9jowGzKxhLT+b
	 iU14of7ypeVToIOR7MZalrinZV4n14t6VTJl3uVAbmmTmpIIGn2+l6+sHMIQTZhoyzY1i
	 wXTztyZ9RFM10NKH10AJwwVcvJcqUED4Ykrk2mDCH+rkDUCtKDDUPSRlT7OnzLAefag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=C9qEfKwD;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F09E606A6BC
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F09E606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=C9qEfKwD
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so11031275e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795231067; x=1795835867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ARUUOXphysUaIVQ+Q3NSspxOkVH0D/WM7AIA+6teiM8=;
        b=C9qEfKwD4HVCc/5D/CQqSCvz+J9O+o6fTN0LnPGGh+iT/rtv/+vYjMLMCLT5iXpsDL
         LpuB13BnVJl1VHDdUoiGKm/iHTb/iH5lbEBGnI/4ChFArRxr5XFjR/zkCuOGJlk9TBEy
         2zLqJrEppt85m8VK5KHzEr9QTzaY6DTLzAMUaWKkVtTXlQPPi4KhE9sRfc+lVGth5Ch0
         pZMxhflbbAlrWy3Bjov2Zt7SFNEWwjszNG0hfROaB2SYXYLzX4t4tKk0T9zzWea+NnR7
         YDmwukKXLQvVfE9aKuXK0HTjtZqKwI4V/s7fvXC5UqOUSHfjvOvPnWxPNtAT5ojjKodM
         X37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795231067; x=1795835867;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARUUOXphysUaIVQ+Q3NSspxOkVH0D/WM7AIA+6teiM8=;
        b=Rm+7gaIdHnzn4a76MYeDrC1LjrabzZmh1o+Opsc1IJ1J0DuUz6cPZsB0+cjGMeIC68
         Sz1UO9//8bC/i4C5jVMCpXAVGbZc+XtqK0JGMQndFXlQQs1wp5w4wdEzsEPQBr1SQd0d
         YpYYbgVF0jQcdiUp31ovJHkIooyAl6Lg+oslXsJvWyWCzD/YpJJs9b44L4Uwb1/bjWp1
         8EW/66OGk5alBQDpyMw9HhqG7XuP0yIpz3iYvUPG2VTWYdRKH2sk7uMt5c2VT69GoRl7
         gSAcX+KOAYtxzmtx7S2YjSkL9mI9qSC9TtUQDlZXB6GJKcbMaxpFEanLCDjbis1Aj2Vt
         gkgg==
X-Forwarded-Encrypted: i=1; AL+hErHSag5EwwuVgZJmlXleOVo4lMw64zoz+tRWlSEr30ZxF+baBSPrF/OPxv8TYyX+THjadC7xAsUPn4a45+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9E6R4SsrkK03fwWt7DKKLl1W5654vYHEx59smhLDDKt04CeXw/
	sGs+zCkZHfcg0MBKPCBpNeFG07irQnDjUrZpTvu6RMyNGFAM5iYH0qM=
X-Gm-Gg: AZFdTZc8GbSkNY+FtCEpV97yQROpQjZg5KXjcNo4EJyEK58B8nOXQkfnEQQoni5Y0E8
	VdchoPX7r4vEHTqVrW6zz4lDhXL7wAaSFr2EgxOscJpViLVA0GNuykx3N0CGy8t9M5UPEHmlxsj
	zohIeAEmFtd738aVtoYVQkm8XknuKXbTZ0qe/vA7t6BMqEZs7GyNvOFQaUWwIcyl0xdxPfzudyI
	xY6eXgJ6aU3R1d0H/VjQGq3MB4rmliqVFV21sOJOoS4EHu8SYltL1tSy6Ms/4eY2HT6cDp5T1qE
	IINLk44U2moZqfPM/6n15uZ1wOZYDOljpQIWcYDhVNBM3mLp/hRoaRZV7gfSp7+j2z7ntRcuCYn
	dcW5ICAvgVlDRU7xSgghnv1UzXLEo7ZXc4hXy3neB1iLD8uMicvJ3btc/Cs3m6E4lqxo5hOwEg/
	cNBVHnWtZXowHNUMbt5qfFMh0kTEPOqWxIvfz+no4WOcgQXHTKdJF3oaznzFxBgsnQZYDHwhOMY
	jxiEW2jWugg42jKH1O5Y8XJJeIMo/roCR1Trqx9RofN3bNF9XvsB3L84Q8flUGwjJYaLdeMa9vb
	cZGWxMd5gPI3wgVQrkwpIcI77jKTQunoQMio3/2RV7iMsuteqX1ufgZRIejJYCcNxDupapCMA4T
	LWTY1prBS29NX05uue4OM9R4Rvw==
X-Received: by 2002:a05:600c:a08e:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4bb887e0682mr116990495e9.4.1795231066634;
        Fri, 20 Nov 2026 19:17:46 -0800 (PST)
Received: from [192.168.1.3] (p5b2ac65d.dip0.t-ipconnect.de. [91.42.198.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm143683365e9.2.2026.11.20.19.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 19:17:46 -0800 (PST)
Message-ID: <72361086-b932-4fbc-b9d3-eca7df52af82@googlemail.com>
Date: Sat, 21 Nov 2026 04:17:45 +0100
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
Subject: Re: [PATCH 6.12 0000/1736] 6.12.119-rc2 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261120054951.366579794@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261120054951.366579794@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 20.11.2026 um 06:57 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.12.119 release.
> There are 1736 patches in this series, all will be posted as a response
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
