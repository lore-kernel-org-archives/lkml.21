Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795058563;
	b=tWgEibbdsSHyFNVGN6D0/EF99HK6sLQbBM12987Nyr3UngmY9iTo2ism+vIr22nV0Yu4
	 Qb3chbF7yaX9IMCi3E1iJUjkQD1MODgvkJczLoMmNZvCE4HVvcDXP5qysB568aWMx4VaA
	 Av1jyheaoKEGaanEslny/FVBBfKQDY5XImCcj2ARpn1LZ8JOELuydJQ8qifphikujQCxq
	 /pzcSXtZeG6AWkHrQeWkkNDqmDRyZQgGZ8KX+AIYv8MHWiG5aUeZqNlc+IEUhWlS6M9a1
	 GluY+Vcv61AqEhmRzymztsQBRh2Exbb4VQfPZkraO9sHIhS+wWQZjcoTYCQz66o/qjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795058563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=AKmYgMCE5Gwxj78QU1v/OC/KdP6R4MGCQSDb6SIyFlE=;
	b=JRJ8tvcNXiKm3EivL7wO6RyLRQiap1Iqh3Cpq+a33jz6OuhWKOWTVMgr0r9/PHfYds4+
	 20Mji+ytrvNFwHFSOdKxDyFc2jrw/bBxxrnDtZGbbGTwv+3v1BLNMXfHn5VpiI7Umzpqn
	 Zu9yMUEXnhnM93w6pwtQYWJ62Adqv5An+Wb4VgsjZenD/VH/LZiDYIr4wbb3BDyC5UkHH
	 EU1eQZQ1dnTR9MnIQb4vaKdtZwJwHkp28/luhCOcdoyG1/Um/KzD39du65Qp/BizWRRUc
	 +fV1UkpETUkN60+BTjjjHvHBHfH0zb9nQcPunS50Z2InDo/gS1dGptwPuC06uZNJo2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+p0QnGY;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C461B60A2606
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C461B60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+p0QnGY
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so18451195e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795058561; x=1795663361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AKmYgMCE5Gwxj78QU1v/OC/KdP6R4MGCQSDb6SIyFlE=;
        b=Y+p0QnGYHN3hsp58OCbYS4t+5voIG5O+BkmXU2V4bUstIbYoKzU2dw2341PyKZY3Tr
         tVkJ5Rwpn1Y8rb0FVShqIExaaRbEjyRgDJP1/8CRkY3PnWpousIoP0QVqsR4aaSoP0VD
         aUBK/zTGYoJow7SjVg6VFMSoJmpjr8w3VdRL9fTIy+8gDpvEMCnKZbZ7RCXRInmkrCkz
         NwikxOTqox1sMwv5WOQi6rEP3OdaWo04Pex+lCtXx9kaQYREgemBzDhyx4gEE0+Kfw0q
         YsGEkxsbABtFJ+/nS9SWv+SceFkdodLi+6C1x2nIOIZPrWHkruW1fgAToIJux6ib0Kuw
         yjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795058561; x=1795663361;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKmYgMCE5Gwxj78QU1v/OC/KdP6R4MGCQSDb6SIyFlE=;
        b=jbDRxZ2+lwBb4Urt99Ikm8QGGUQbMwoMpR5sQt+WrQizzvrVl5Z9hkBIIA3YdwCFZN
         XAbRbbu7KAWFTLFsyo2vbsw9uecbie1M498azywg0VHv2TFyUNkJ+iSeLYIsxwCxdYC2
         2XTj+971Zs5CQig5rd3UwhxcwrY0Hz0hqhTbfQwuZYOQAGV4tycKGjYT9KacleuhFmDn
         KN+ztwIoWUESgJ7F7tA0WdtmplaS+EPAJoKNxVR+7OHuDBMTyG9B+S1r1xTB/AcoXdxD
         CQ6zzppbst29GOOSifhcXUbC+DtGiFCe2jDcB3yv0yDXwHOyaGc+nFzpcTk6+SrFPQDQ
         o90g==
X-Forwarded-Encrypted: i=1; AL+hErED53qtSEi1zm936vpzIeKm6d3vd0vubf3iN4PB/YLzgd/gTNGeFz4IOGzi4LzFUiTzVZdSFJaDywPE/Co=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cpuN2wjoJMdu97hjiVpbwAYSJRVXZJHata5pU7cp/UgqLvOSx
	3sYjRE/fnBwdsLNtX2MFneiI3IDv9zXZvJVlbtaSY4AbWcHe24LMgGw=
X-Gm-Gg: AYBFou1SI3mA9uMAafR4/zlATUGjvSS8ZMCAICeQJ3stT/ezBSaQZTr1CHWOKDn/otl
	x1zkFvqSBlvRBey0Et95/kffQ6TQhDb8RaVP4lHM1Zv0ER3p0qGQXKczbglKcKP0r9ziRwqtt17
	SEz2zruCakDaVPvpT5c9LaF5H91JWXcyvWP7dl5OuLjUNmbsI7oAI2epof438TkPuVwo7Xb+A9O
	7CSOPxSxJxkLsWsmoYBaIKSR/f8NNJe9w57g/4Ne052Ab4xsTKgMf0HNAqcis2PSa/zjIdlFNMc
	5A1cP8KbhXY4vAUZBsyr73zLSxQFpJ9lxPsXQC11Doc2+JB9BpRGwdaiZKK3wk+gJcEbZAiduA0
	44VZZ8LgHvhjpJwXgaIusN6kexouSX3T9GPRagSQC83LDGkBoWePzWBhpr0w8lHLBWDPdu9NesL
	oA0pBgSjbkcXvJSk92BpZ4Qc8KTuz5+KHUe9LjvxBY/rmhB7PHIPJaOOJQpv1wYes2bLmy67Fkg
	CaSxxWWrN+VZFhzxIgfi2Cmtd7yN7zwnzRuDKP5sqBKddgY6b5Mm9pHuY6qFJorJA7SaSB0dDbC
	LRFZbRaxg9+5EPH1TxYSQelqeJg5gGn8Zni8hLTyWYLe2tiUdiyPfUU02FejQFYCPa7dDTm+TTy
	iv1ddrw==
X-Received: by 2002:a05:600c:348f:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb7da4784bmr85514715e9.34.1795058560948;
        Wed, 18 Nov 2026 19:22:40 -0800 (PST)
Received: from [192.168.1.3] (p5b057d66.dip0.t-ipconnect.de. [91.5.125.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm5941125e9.0.2026.11.18.19.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 19:22:40 -0800 (PST)
Message-ID: <eaa1f85b-44e3-4f95-84e9-3500327be809@googlemail.com>
Date: Thu, 19 Nov 2026 04:22:39 +0100
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
Subject: Re: [PATCH 6.18 0000/2151] 6.18.65-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261118150121.603863898@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261118150121.603863898@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 18.11.2026 um 15:28 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.18.65 release.
> There are 2151 patches in this series, all will be posted as a response
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
