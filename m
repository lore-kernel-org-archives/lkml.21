Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795261460;
	b=HEbOMX1qmOg7fKUxyZKQvll1rw8IabzThKvJE9C+woDAHsqqvoLpupEWVSpwq0AvRUVe
	 GJoPzzomaLGtUGWKvNPg9dSpPP3QrZxgkyA1ySvkZVqUE2hPTWp6mS/fNTUGVGIrnG7fI
	 JCvfWzhpCpueUo8PCZtnixY+637nagQ+3teK9qfDEzDpDOTAcApkVlNCXHYOJp1mbdsTl
	 ltk8jTMKasKrwlOKxFOZ9sjoDSfF4anl0vpPnDxOISPClMIrYvg+dZLlgouKNZzULkxO2
	 HsuTDsobHi7Ahy6RSNgERm2HADYsus/5kOf8XOoxaS7Bv4wt5dN9/RYh2cFOsuQSYaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uJZf52C5SVOmAsQhxDSvrQ6mi3k6OZCc4lBLimUZnLg=;
	b=zHB6HGa7A0nlOVfcNJqDtk2czkUW5o/2tpfiKJvkFlJwyoblQTNkpcE2heNGByz7b2qM
	 1tw/ZC69n66rdDuMIO+lHIF4raXCAc4UpE4NmYLlid7Tds9K7lWgoD2MC+c8pn1xJ6un/
	 6A+o5eHn+pSx7d9+TwoLeR243MbOs8Uvn9yPOnRwAfCa7LvHAkXyL23TWQkTX6lu1/T2s
	 p/f6Zvu8PxuLPAmI9Q0ahmMDgRg4KCwpYXAVTBW4b7LFof5CheSpqXyipyXsAfY9tu+HR
	 XwGAM0cEAfcmSldGAIa5C2DCGKRzH9n/HgbCWSteNCZrgV1Z2HPJ+YOluA5P3tsyzcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=pardini.net;
	spf=pass smtp.mailfrom=pardini.net;
	dkim=pass header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b=TIkLjNiz;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B89606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B89606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pardini.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b=TIkLjNiz
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b8784a3284so2577561a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1795261459; x=1795866259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJZf52C5SVOmAsQhxDSvrQ6mi3k6OZCc4lBLimUZnLg=;
        b=TIkLjNiz8BhSYYZxkIh9xCzy9zMvVA08mLs6ao/qcFZ3oU9ph/SXkt+ejnty1JfEoA
         myH9aRYhFDI8spBzsWj1t1pkJE4mAH4yjhiIrz4dWTEHyNunweJhT1NtEwkRxGTZ6tG7
         Yi5RjqpyvmQnr3grY6oNUcRXIzdzOupXjmHEvm2KD/usBt39+XFFrpFkQ+jivbaO/8Ji
         wOJEkezYyi5C+ZdRiOMpAGhIlQoaenqtNbWKAS0CPbSxLD7+Uugl17hY8zu5S/omOCo9
         90D/iQnTsIsLtpKtdfniuySVjQt7auoEzQp4p01+2mTEC+HHBW14XXxdFPL8GWOc1aFH
         z1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261459; x=1795866259;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJZf52C5SVOmAsQhxDSvrQ6mi3k6OZCc4lBLimUZnLg=;
        b=Mwv0SMp7bXjX1qZp51NF2N8ktxiIeAhiMLm7t9WHqNIfKAA+jhUKA/5/FrX2Hq6fuo
         1lSBp6NV7dYFBzSpVP5EUxIUk+sOCUK2jn84on3TGJQyx/c3zwccV7r7vUfJLSam6Th2
         vAsSeSnZm1F/tg+qjBdwPj86lIPJpuaM2e7TtllbbMqnR6PvOC/G0NQl6Ka7W7RTa28M
         yihNikvKmP1ZBqm/dc45eDN1zkGR+mysa+wZKSooAiCyQyi7LueyHRfi4q8QCbaBVfwF
         Tb4fNoZQaIgURoWIsXI5ZB636hL4z4yBLSscJzIjCtPeVn6/ISLCOygX3tmSsW2Ti50A
         JV/A==
X-Forwarded-Encrypted: i=1; AL+hErGxoyO+wYY5v3HMGlpwdMqp6vO1NCkEQ0+ioDs6jaMMC1BjLSL5vilBvRKXqpJfxLZoTcuTsp6O9bGatUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Tig602O+M7vYh7Nh0J5gRj8viBagrrStGER6xcXVeLEhINFOQ
	dUo6JDVC+JZuutoM8dIkO9YYLedMkuihMXDYxPdxVXl3QBBX/cFMRpYmw6tAIZjolA==
X-Gm-Gg: AZFdTZdxifu73hDGMKCsq2ieOgyzZ45l/8Vf+GTEJYlwi2dq0EzT+aPdpv+f+siIaKK
	3kZ8K0nQWdhR01UvcvAQte1Z0PZM1m/NHzFeX/Rhfsmy4wDk+wPHDVV2CCrM6W6Gi+v+ZlZ7bYr
	4i/hoUodYTsLYq3/gMVwca8wwFt86i85nJUn3BYVQ+Y0ggTy35MwDPK3L/4LUL3V+2h2ubkGn//
	YOm2j1S7fvpoAiK5RQjL/mIxHn8MeQIR3KBxH4IVgFpyRABy7rb8ENNbMhOyyp7T8WlAB/NguQT
	sO3sGJ4ryrLdQ4hrZxj+kBWelJ0KnWJtqijVLVXOfUqpQtcyouUS/q4DIp9DJA0njPZ9ZDi6mGX
	9VTCUxYFMiQOuys04PDsR4+0kB2Zay5WqMN1ARTwyj8d59TWsbaqt2UnpT5LGB6TF0HZlMECila
	OQV3/FpvRIZueWTOtD/9ZN3cPlKweb++DXhmRetXAHDb1Lmu9aBZTOUmr133XVp9MDZfH4NJCSj
	d8vncriivZ8cdC6b4tjOElIGxdDuCbSmM6xUCixf/BYnDW2GNdRFIEnSSIuaY8608hvGypPHnmZ
	0zLaYXG5PkbO0BSRFBbNodxYwnzZ+72K2/o7Mg0dqN8NfMs7FpxkCRQp9BrXi0wWaY7iRJDtUIM
	QACczS5tHh6rxegDqWcnDB9VXFhLtJ+QYatuhqryB60w2jP/8E6m6EA36vy61Lamm9OZcUZE1My
	GI
X-Received: by 2002:a05:6402:2105:b0:6ba:3738:aa76 with SMTP id 4fb4d7f45d1cf-6ba37ec713emr4645637a12.28.1795261458717;
        Sat, 21 Nov 2026 03:44:18 -0800 (PST)
Received: from ?IPV6:2a02:a466:4d7a:0:409e:13f1:8f3d:aa19? (2a02-a466-4d7a-0-409e-13f1-8f3d-aa19.fixed6.kpn.net. [2a02:a466:4d7a:0:409e:13f1:8f3d:aa19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8a4sm2294411a12.21.2026.11.21.03.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 03:44:17 -0800 (PST)
Message-ID: <acb17ca0-c814-4e41-91ba-10f28cdf9e00@pardini.net>
Date: Sat, 21 Nov 2026 12:44:16 +0100
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
Subject: Re: [PATCH 0/8] usb: typec: fusb302: cleanup device driver probe
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/11/2026 17:42, Sebastian Reichel wrote:
> Move fusb302 to be fully converted to device managed resources
> instead of having a mix risking leaks and clean up the interrupt
> setup.
[...]

Thanks for the series! Tested on a Mekotronics R58X-Pro (RK3588) on
v7.4-rc3; the FUSB302 drives a source-only Type-C port there.

Probe, attach/detach and flips in both orientations, PD to SRC_READY
and DP alt mode entry all work, with an RTL8156 2.5G USB NIC and an
Apple USB-C Digital AV Multiport adapter (A2119).

Tested-by: Ricardo Pardini <ricardo@pardini.net> # Mekotronics R58X-Pro 
(RK3588)

mvg,
Ricardo

