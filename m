Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795234153;
	b=zeK+1sI0rekR1gvmR553dwh56v3/AKDBYKn/P0nzmFrzrCdLRQGeY1uFXk6/05lCNth+
	 ri+0vjdaWZvjL9xpY51if3xdf7lT19Z96CAuU2Jas7Rv1amIt6vNnarNdm/4iltBI3f0N
	 H0upL8qRwj6UmrsRU7IPp0TYYlBihgnWQiJ9i5eG42vZ1gptRGH05POAGWkswEtdr7idZ
	 kWAz3Z31VwmmssSB62jdRq0f2cgoMXOUR1VwIbgEQmwzpwVQ3WQghjqYiLEz5SeIJzsPI
	 OQQ1NcISYktsuH5kv5rB295UgCENCHRv6gLADUvaekn/y/LrT2judW+DGdrOEiY9HsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795234153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DU6QRI6/2rr3VH1bLHYHYKsx9+9ItmZMgLCzsJ11Jok=;
	b=l2/Yb1oEZWIZIhvc2E896MIlgv0ZHB0pdgJg5LrrdLm/4CoKpfTCXdreWn3Dy8LTJ0C5
	 Hwm4BrhDL+vJQeEr791FV5g2s+gRRba+30Ox0LSu/6h5NljliBh83xVohYYxoEbtvsPx4
	 uPIe2bfmZjlxQjEeBiSbwR3ikcesDqXMC2EpOpyX7OSFlHMcqKj9Vnv+5Z8GZHWwfFlPH
	 uDCqdkh/UnbglLKob16XjD6OM8n5/QvxpyWW3lEsPNqKlTtzqM3niDjpkZww62q1I9Q26
	 Y+7wuLbiDGoOa/JRBpx0E0vInxTHt45HZraIWXSCQnKWjT1pa3JcW7wRBY3tP/kQt3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Sb+VHum7;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A832606A689
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A832606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Sb+VHum7
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb606491faso8641385e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795234151; x=1795838951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DU6QRI6/2rr3VH1bLHYHYKsx9+9ItmZMgLCzsJ11Jok=;
        b=Sb+VHum7IR2VgBoWc83rqtqGedJ9zA8U0Oc0NoW2l9ttt3VS5mB0cGuVlWE1VYtuZb
         ZkV1sSnJ1SJZ+4LVDdqlZ4X8kS3MV7+Z5GdVKF+zy4aijKILNigtkJTC5w0w5Z7lL6+y
         S9DwIQ65K80vSSnHZtjSVeIRddMU+4FIk+YvPwlCkD82+KJAQtWdlgxoFU3IXS9AdVH+
         3W0sNCsmBiypLDeV5gPXbmw0XFUUhg170walv9AVC7vXxIS69AL7KfytH6DEWtbv0hfe
         Vuni0nEk/KGmf6WRdY05ROfK/bwZRO63/eAMbVuEpnTW3+ZnC/9UNL0O0C4VzgjlDbD2
         Wm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795234151; x=1795838951;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DU6QRI6/2rr3VH1bLHYHYKsx9+9ItmZMgLCzsJ11Jok=;
        b=rore6RLbooySgv4SzoZ6XTD7EucBKhp20YTfy+xacCB8B+K31kDfQqn+j3I8NtoRPx
         dpwf9ZBivVF97zShB2VTWs4aXvBre5s6iCu5MMFdY22Cg52PlwNP7PYSBy1PzqqT0ZQK
         pBcQxeSqARCTfsh4aDJFIjxKPo0Y4adhWNws2045tnekuL196nSw2BDkU1VWJrCexgyk
         Uh592h9lYlz38jzP8UhBejOHDNOOBSF36s5tbyOq1svwrKyuh4D1FTPoigVAw2pHAoJa
         YEyPSubF+j6nyV7AN1rv7ogjwfQzptazFx0fgO1b9mWMJyOCMWDJz0a8hSApWO3L1AOZ
         a/QA==
X-Forwarded-Encrypted: i=1; AL+hErGfHrZzjMBb1IF0ZjpGGIJS6OKcbptcMDqvYjA2fjhW8N8S48e2Y9t7QY3Mn2bB6YkQIJt1FlElgO1del4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V5x/lHzA8/O7Egaa5QdTv83Gd4fo9dQevhpWlNN7Y/Al/kO2B
	W25g4KE2EuSmUCqc4pffUaR6jYOKtdE3m3UBfSzd0XIN7gN1x6Js+Gc=
X-Gm-Gg: AZFdTZdQDvSOUgSjR4k66Xy3HNqA5pkplS4TsRasuaFNbix48b8V2RRkHpJ6NeUZyJ4
	n0KMIMXarxb6HA6kW0nPwa6UvjChtJwDm1LNwnH90S4vt5Kg4186A20fUPA/Vh5LHfRaxq32WKe
	BWjeVma+QPxVzDNyuAE0cH0UL2wxaUgfKqZGYfzmh4L7SmFXTQCbQSTvnUkGCI+Y7ey3LdZDxF3
	jywAZ4DIdxTKlpy0qtA66GGXp5or7mV8wXEw9nrL2KSTQRIUtPtSwZtqsTTobPsFxV7/x4oxlpt
	vz5ZBwBbGHM8TZRS+nlmoCwjxkpL9ffnHcyVWpGmgCtSCb7BopgdVpdcoN5Z2AbCMUkD9VmkZOC
	xKptF3NwRWEoIw/XlKylnaHJSDtB6zhVyv4zB5v/S1CNivn2ls/nh3bO/ekLkqN8wg0J6iqgqt+
	ARJP14tdk1TQPQiA+ltXgDYk2DOCUDBzEFG1gKsKi+CDaemmqSPl5oJMtIF9n2i9JSm0/5WWvW8
	qkYXo7F92IDqz9ROs75ugzk8gQTt5eGxfVJErWFmXvZSAcPqAuL5h47Gx/sPR0lHHL0rEoBdCsn
	nz4VwJownMej2uEJ3Pxfqrqp+UGVvlx4jgItEC9EDT7Q4qO7cgOltcYiZqvBQ3dcflybHLdnMjj
	WelzR9Sw/cSCFGtXB93WjCJ2rtg==
X-Received: by 2002:a05:600c:674b:b0:4bb:6847:791f with SMTP id 5b1f17b1804b1-4bb8880f267mr111709805e9.7.1795234151518;
        Fri, 20 Nov 2026 20:09:11 -0800 (PST)
Received: from [192.168.1.3] (p5b2ac65d.dip0.t-ipconnect.de. [91.42.198.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm143043445e9.3.2026.11.20.20.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 20:09:11 -0800 (PST)
Message-ID: <c1f584db-61e6-4dc7-b84a-6d3c630c0023@googlemail.com>
Date: Sat, 21 Nov 2026 05:09:10 +0100
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
Subject: Re: [PATCH 6.18 0000/2144] 6.18.65-rc2 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261120055114.182757740@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261120055114.182757740@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 20.11.2026 um 06:58 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.18.65 release.
> There are 2144 patches in this series, all will be posted as a response
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
