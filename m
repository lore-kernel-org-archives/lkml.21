Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795228575;
	b=NsP1CQ4SGdhIR5qTeXmjzZEDeDAhP+plbzNofRF/TyBFV99w4Vl5vXGj6BCeKcZ2K7zq
	 StMR19PPO6rQ3I6u/huevT8l/4YZM68v/QfX7Kju1yDzD1Fo53Hjolw8GOwQoz3hIE1v1
	 ZLLFXGhwB6MG9bIB1ruZ9u8vFgzIOTHLWTd8Ko0sVfAGFGrY0SE0gt5PDTP9FpaJL/Y4R
	 oIxmqTlN/aY9a3En5Y2qP4OUBJxyLkelOWQmp031rZD2mIeo2771obNKEWbS6l0Ns0l5M
	 Rq7z2o+Aa5558RBiIa8R+7O3JAdDr4mKJD/Hg8I5U57e59Z2GtgtLQU5YiijSTn+dkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795228575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ytKdWC4PKOBa2qHZovVgrsdqwkaFMvswDEZlScEeocU=;
	b=Ms0HdeyyvxKZJnRmXkg4ECm+MMTUV6Amfkj3SYwYbgBq1S5368sKS46iexGnPe35L2VQ
	 7V5XycN4g36O+kYw8bKfe3DPNKMPO7f0lsNckU0Y3fdMae2Ra+cxXo8YT1CUMm+BtVtDl
	 EmrSo01WG2Pq9WIjyNlvJYD31dyIylC0pSZjVlErq/HgfvNFPpnFF5xG3PWPo0hxmprfc
	 /+DrjNslrUB8b7TxcUCkgi9Pb5SE00ObwdmZWtaDGL5KQgzdM6RfLURMWtFxTjiHw7/9Q
	 IMT9CQZPCQmXEgiZxvp3gU8F1rZBfOr9vkRoheKXxUjX0urP9/JoQ1NUWONBs8+fX7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=BpyINFST;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFC2606A6A6
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 02:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AFC2606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=BpyINFST
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so15455805e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795228573; x=1795833373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ytKdWC4PKOBa2qHZovVgrsdqwkaFMvswDEZlScEeocU=;
        b=BpyINFSTO7cEoxrmXDJd1l0wc8dtcZtXl0P9rUOO27H+8VbcgqunK+1rV6k4EkHgAw
         6ELwCFFSyR+8f8UIwpozBHV9ZkIOPgKdk90e8r6dq7N5ZZHuDigHOpdM6ew1ZIrfNeqx
         C/9kWV//0/Irb/xIG5QYuOfOSSFOv19wA4K4BKRnIK67Hr5tI+zXDPt5YtS+jyLU1Rpi
         mEWKj+8cN6BOrqEgc3KUeVnJmvnPyASKFlR0QH5FWubfK0SKdBt5Mf/gIRGkiIDE+XIs
         /oDDjQpF3wmqh5+9KP81fDHdXLiHCeo3w3ji9j+S8gZd3ZLuD73kSRL7T7gl/2tjlvbZ
         tDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795228573; x=1795833373;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ytKdWC4PKOBa2qHZovVgrsdqwkaFMvswDEZlScEeocU=;
        b=1XwMyT3VseWPPjj2rnQefZ93KHCdILToSI+ax2fxDE5DkCoGoq4tJIORM1FNRDz4Nx
         R7AAXHtN63mXnNVwuIAV+xLyRprU6w6/0B8ovSYIvS3SOd58cn9yTZqu795MRo0VO7rQ
         41AzUZ4X0K+vWm8Az7nWxlvytdH+d8nM+VJKjjcVEQnmfEUoeflSRzKYaw+SfsKLWtiX
         3jNHUW1nrDW5sZc6HnNnP4nWFzBpc5AQQokCCSeUy1w3OwVA30uM9DCZ+PDQgNYFFtHT
         glKEu7axYj4TS6Z5z1EptWYeyqL08C0/I18VzbDNNQXz7Vl+DI9w0x/Zp6uBan1rakgk
         OYhQ==
X-Forwarded-Encrypted: i=1; AL+hErEH4p8+aJDHKRfHBE1qJZeGJrAI8AJeAFXuSGh6Qqs2yeRBQKqiOjClOPZilWPDkm6A/tPp6KG2sOh61eM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2IxAm9ii+PGzEzoj4+OOsiM48Waj7yrOMO3mYMRIvV5z0cneg
	08itvY5FhTlxcsgvKUH/El9Cs1WzK4zOLp/U4D6jG4Xl647wSvdQwFE=
X-Gm-Gg: AYBFou0T82hmJcnwmhQeVkcUdrRK6gadp2gMzjkBUFaDsfTY02NUtuggT8L99UAYB+8
	Kq+tGf6gNG8YyYiA1FI59FqF7h7mgeNfzGVAY0mECoBqFZkUWh4yToubtOptFzJbF9t50iW1Efa
	R6ZajaYVhcQCYL8ncL/7ktqViYSCzDA32kGdXZ7ERDNRizXMZz5edVkfQ9Nj7SHDpL0hs1KjVPh
	Gm2+0uMi/gN5ikY9fkudLFscKhhPW3WAhbLDN7OFHBDxlHk3ca3A2NB/h8mzI/jiwrH3UFcVVWE
	CDYR1TZFccJcBRMfo+/7tjx4DrZlqoikqu458T2cOKAftCJa3yWIMmdbOXHWDUp0u61n1vT68vT
	Ky6MEK3v3p9e5RwAppF/3myM95hxh8l58E5lvLWBVcnPpvQ1Skjp6mJENgH/8Y8JYvzK/di7Ti0
	ROok67EAXSDtnA2ZkwbuCgKGLqtIxzw/WB/aAMBX34R9neEQTyzhp5fJKT6TOpKyvyujwmec9d7
	A4EMH8x7bmAVSUCB1tjFFMYFcOJVIqSKkJFDMQAW1IN/aWQuPWgIeroOGTgkMi7zRfbKBzQRpF7
	0/FeIYs7+hiwcwnG5SOFn9P/VjJuHSBMAZeVB0Fihu7bZBNxqGVNr/4rliQIdTRewZE5wfDiy4b
	1somThCFLp2LK10h+dUa2R3jtWw==
X-Received: by 2002:a05:600c:4515:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb88813b27mr117200775e9.12.1795228572531;
        Fri, 20 Nov 2026 18:36:12 -0800 (PST)
Received: from [192.168.1.3] (p5b2ac65d.dip0.t-ipconnect.de. [91.42.198.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm106722515e9.0.2026.11.20.18.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 18:36:12 -0800 (PST)
Message-ID: <ff148281-de3c-4ce1-8d8a-86a9299f73cf@googlemail.com>
Date: Sat, 21 Nov 2026 03:36:11 +0100
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
Subject: Re: [PATCH 6.6 0000/3308] 6.6.163-rc2 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261120055324.975889935@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261120055324.975889935@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 20.11.2026 um 06:57 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.6.163 release.
> There are 3308 patches in this series, all will be posted as a response
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
