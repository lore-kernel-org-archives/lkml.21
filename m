Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794947659;
	b=2KntqBgHiBD3fTAholeGx6Hvltg3RxjggrNJ5jraJrTcRI427XwDxPGKHw/4nvKA3duR
	 lxMvZbRJ2cMg6VeeLvDpuX75TtXcEdJiG0wRKWrRn3cEtknm87AllqPjh/IL9J9AE1UrT
	 cF7HaCMXb7RMRreJX+3BrKEs/MBmD4COE0NKg4/4vYpeK+qxg4SCHWiYNe5LT0dI+dF5T
	 KJW+hlTd3OIHF+nierw5Friq0dcv9ISDLPjFvPvha9W6GPzG0cswNbDIRvPdkLkF1eIyz
	 yeFDdAsKeHBcVc6IdPjcZkDjher7lxtEQ+9EbapMmxwsQfvLwIjP0E41slTISzuFkoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/ZMhcm/JCcD+M3t4azWcucL31huBZZJYoXQAph0Cu/Q=;
	b=vu/Mk026de/MFINn2Fw2YhKX+yQB0cvW5CNXky++2peZR4O0DzIK+Utqbk43FQGmSl0X
	 HS5BHsF9HWh1MctRDQMnmpQHOQkFkaLY4IDIXpuYHgrOeZAt7MPL7O6Ggyqi66D1AHLDG
	 44TPgC3LHfGADki8JIyBjGh9pMwmG5Ut08YAZconvrBIs2D7NJ4vNLNzqZoCr+8hLOoHh
	 llc8ivDaSNQX46CNXk0U6CVSHNSqTdd/IA0he/IxMzvXL8/lX9rYqtvq7vzgQLfwgyscA
	 lpFZVuy/vubbLbB2DQLZ0A5ncEMmLY0PM2D9/nyQ6QJDyCrjRmvGjpW6IeloFy0vrAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=GS8p0iFE;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E51606A885
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85E51606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=GS8p0iFE
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53644ab1f7bso2004341cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794947658; x=1795552458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ZMhcm/JCcD+M3t4azWcucL31huBZZJYoXQAph0Cu/Q=;
        b=GS8p0iFEUF/En0yzlT+JcuCpLdO2j8huJwWM9K1FLGiMQrTQ4OKuEnYY7jh34BNQHz
         Y4JUGy80u1H7sIxiUEgWPoUrNvkqgm2wtp5Tz1Slc5r11ygXc27JiVS3gBazpRwbam7g
         5LoK9Z1PU88QvaMAyD4AkS/9tbw8YYH27s/RWFW6pGc3jxIzOQjkvgXElvfHBrWkXBok
         yHZ53avyhHLSXtdZYUi9T4YYYgMrPW/YXKkxI8Lg8BT4foCHmPFLw4SMXPY3jMSxKsVS
         WxnZD7Gr0kItymyPk9aX7ZDMXsNg94Q3+reBGHl3F165VA+74YLCFsizb4mHQfGD6+tG
         gA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947658; x=1795552458;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZMhcm/JCcD+M3t4azWcucL31huBZZJYoXQAph0Cu/Q=;
        b=cmSKpf4yq9xPtWXNtT6H980oEcKD2IJypmuJSKlJwUN2loAehMU/cga2LwfVSC4Ueo
         omtL4qFQdLmX9DbDEmCupAuzVV1Re4TokCH6fsSw66UIdIl2kMa/gzoOsPIKar4wEv2C
         NHYDzV6I0i+uW1ge6bvg5xsMRbQQrtUf8g6aL90dK3rqmaJ++U2poKQMkuVGnUovrnSu
         WalpMjOMoz3z4Nq4gcpZS4WZQkPhxf6e1uXvagMBkJcbzvLLIeWHyw+ADKXtma3Y9Ilb
         EdKYQgYouzkhoKxhfG0O8tRXKvihO+IF3XrhptpPTDOigeakffKHdxoWmDQYVoyd6sbm
         Wdjw==
X-Forwarded-Encrypted: i=1; AL+hErFSOjpcJ0YQZodDWFogM0vVN4TaaYCfiqsRcpSNfcIWTdY9ptHJBq/WchwSIBNA8RWLo70rZbBt3PyAOFo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vzu7gTRM5MJ7g3YCVRsr/bQtIhY/1VYWG2HCGTzve/qOjrvfM
	U6uI2pD/6P6qOhqP7SliCpVFbNUS08SlLy6tY/OEhSxLShDYIKjEMo8+E0iOM7JIWg==
X-Gm-Gg: AYBFou2ld5htQ+y+i3U6spCxSxPK4GTTMxjhBQb+nZLmxyVeZjbwCyliufJWPkctn0q
	hPi8pgII2JVpsHNsmAh61RVyAuij0VWCpPRROLvyinXsXiOjHhENwKp2gMDyx07t6bZx6u4ALLi
	6r745mle+7NqW5xz+GtHc4T4HgQgzmp7mbpJG75zP8MfWT5UNcQka37PqX4dIqkiVhYVQHlMzwA
	M4lUbFLlvaBQaybvq+SI5z4Klgl9N8pppZ25d9esU/Rxy8f1YvNo+tBhTjyFs4L4Tp7lcClCmF0
	xoJkIH143Jjc7OcOyxfKiYNGMFtGGZxhVWgq/qxbk8bx3Xyw6JTFrxY372aiG52SiJCC8MiqjnT
	cKT0/5ERNDm4fvyhv4NndncXzXNGjYF7lrIGNyq0Qd1zpNh/UQVkeAwR/YEIt5HQVoQBRrk/vyZ
	nq41fdJFtkoAzlZBhijVHvrKA0w8asqxllRuJ5+fUTDAmzb/AU52bI5A8EOhfzYlHjALc048KOw
	v8TgCnwzmNvWy3ZaRR4UDEKT+wjUGbwFj+0RvRSDQOTuvMRuXkxLXUEUd2x/z5JGEQMbD66321D
	o/gtZR3EcI09995XIIL6Piesf1A3/g==
X-Received: by 2002:a05:622a:230b:b0:535:8509:3138 with SMTP id d75a77b69052e-55d5a308334mr8458151cf.11.1794947658309;
        Tue, 17 Nov 2026 12:34:18 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d5909ec98sm5319881cf.22.2026.11.17.12.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:34:17 -0800 (PST)
Date: Tue, 17 Nov 2026 15:34:14 -0500
From: 'Alan Stern' <stern@rowland.harvard.edu>
To: gichoon.han@samsung.com
Cc: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>,
	'Takashi Iwai' <tiwai@suse.de>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-sched: Don't let a bogus siTD remaining
 length underflow
Message-ID: <852edee1-229c-4685-a124-497ed2ed85a1@rowland.harvard.edu>
References: <CGME20261116052855epcas1p403c518b90d70d98752ad0ca2d9ac05e9@epcas1p4.samsung.com>
 <20261116052851.2272125-1-gichoon.han@samsung.com>
 <5ed0f4b7-beb3-4059-9e12-b9738af65d91@rowland.harvard.edu>
 <000001dd762a$1b15f230$5141d690$@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000001dd762a$1b15f230$5141d690$@samsung.com>

On Tue, Nov 17, 2026 at 09:25:10AM +0900, gichoon.han@samsung.com wrote:
> On Mon, Nov 16, 2026 at ..., Alan Stern wrote:
> > The type of CPU doesn't matter as much as the type of EHCI controller,
> > since you're talking about a controller hardware bug.
> 
> Fair point.  It is the on-chip EHCI controller of a Novatek TV SoC
> (DT compatible "nvt,NT72668-ehci"), driven by ehci-hcd through a
> vendor platform glue that is not in mainline.
> 
> > Actually the bug lies in the host controller hardware.  Not the driver.
> 
> Agreed, I'll fix the wording.
> 
> > So you have no way of knowing whether this patch really fixes the
> > problem?
> 
> Not directly, no.  I don't have the siTD contents from the failing
> device,

Why not?

>  so the claim that the controller wrote a remaining count
> larger than the programmed length is an inference: the faulting
> memcpy() still had about 122 KB left to copy out of a full-speed
> packet, which can be at most 1023 bytes, and this subtraction is the
> only place in the path that can produce a value that large.

You make a good case, but I'd still like to see more definitive proof if 
at all possible.

> What the patch does guarantee is narrower: whatever the controller
> writes into the siTD, ehci-hcd never hands a class driver an
> actual_length larger than the requested length.  The crash itself is
> already prevented on the ALSA side.
> 
> If you think that is not enough to justify the change without
> hardware confirmation, I'm fine with dropping it.  Otherwise I'll
> send a v2 with the controller identified and the wording fixed.

Go ahead and send v2; I'll probably okay it.  And do try to get a real 
smoking gun on the failing device.

Alan Stern
