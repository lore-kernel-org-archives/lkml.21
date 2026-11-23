Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795403144;
	b=cjw66/PdYf7y3Hwy9/44gWrsRtm3uXpabfYHwJNFz9nlyHxbEp5Et5ATFmtBSucNJB0u
	 8uhlsEV7gO0+uuF+rZrue1wvyiL4rHPdao7cfg61JClm0R04JTEffyybZcEmCRgBKCZf4
	 xhtAUB3YciXNAw+FI2iw1XBnKevhQrSvONhSl0f9D1Bs2FnnzI7MuuNslvi/pgekzN7d4
	 rdpKlgNtRqg1/IlowLyO0zKEFZAY34brH9Me2QsTYzvgWeHdbRYJ8miSXYO4vvuxTmh/Y
	 OcAeB0qtqwGeGRat61nhD6/KC1dmolU6fRi/XXrT1JHX4qzO3LpyAE9fzQkrDGuNOLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=l4WfC5so2c0ERD8Cj1neti4LY1ZPflt9y5hW8KEnfJ0=;
	b=eO0HtSWE2AO9mrReCpvl90yDwHuiuJ/w8PA/DqLwaNyJ3Qh0HiudkjnqYBhUMHIon6vm
	 GT1f/1SUMs/LMVEe96QqMlXPr99eBg3LiBBNzKAC3DhIo+LosjkYSw+k0paXoDqSHfWTp
	 8VYOxZProqkVkYeiDw1qlTsJnKv7sD7/gFt/wOV/Y3/lbKYh3mB4ufazg4UqEpQlAEvwN
	 jcZxeXIk+LiaGtnSDUUBMIskxNGKfyhULelkqMJuaAJTZ5VfBmAan8ol5T9xZ08BdeKke
	 lfgkndKvghr4y4tNC9FgatccfscEScrY6dVCLjtnRyjcIBrjziUrmC30wGg4BtzKBEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="j1DHvM/c";
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0050606A320
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0050606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j1DHvM/c
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f020d0169eso12514895ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795403143; x=1796007943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l4WfC5so2c0ERD8Cj1neti4LY1ZPflt9y5hW8KEnfJ0=;
        b=j1DHvM/cKN7auogSaM9Z1qm2aw94ihfGR6qgPk94pLRHDPU0aedYTz9bTLr65Ds6oe
         VaF5q8cCUI2v7ctS+w/USh3XR7bpgMHr/B2z09/XDQQR85Pqq3EiIV7kRWUq26NDDlY+
         TzMGXGziPtxT9SkGxJDdmSF9M746atRKzt8w6B477GrYC9l2B6RfJdy2qs610XgA9YcP
         SS3Lqty7cAogiCk23nz/7xndRmfQb0Tarz4/IAjdOKw7Zg4WZSNDJcANglVYGPkAhhXR
         Lg6YsMz5e7yfLAIPwOmUFlBbjPLYSFShA/EtPjEV/2RygVeYZ0Zrtj9EE4UDrt5BIynq
         uE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795403143; x=1796007943;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4WfC5so2c0ERD8Cj1neti4LY1ZPflt9y5hW8KEnfJ0=;
        b=2TPnyhwvYv1s3m4noUrH2JjaknXR6nkl+gWVY7BWmSgtbtWtqTrhwWNNrDWoYS7kAt
         tJgXvTH8SyKY7xKPFy6rwfhVu2EfWlVS/iFckAtJS2vIdMRE4lWd66CNQWfjJqWTogUf
         DxdGkOg311FK9xx8BcscJvbCBmR7swZgxnksYxTD/mACm4IAMM+xea9qO+jXhMIGyhBv
         VmaS2Zx2JX4tYXE7iQnN2hY+yygz+mwnHgfsvnM64nPAs3kVl31qv5QiYwNizM/GUO2v
         ipC4gZZwTiIiyuBRBij9HGZtjc5vWlqP+lDmYLrsood+0CRMIYyDG1cQVhF4q25q3XU7
         /N+A==
X-Forwarded-Encrypted: i=1; AL+hErFZCac/rg2Eq+zdDQXKg6tx3kLV3TGCMSc1ai2NTnLpzv9Vhz3X93TEYwSkqbn8Won1Y+9l+XwOVZc+vmg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q6x1eOIU60T9PgWKtTuJjlblHFaN7mQzs8eFNvIF8YHL+CWWq
	RJ9LDJ6TQhCXZw3225Dj3epfm3QKtmFpNkHddb3uPWjOObJrZFTfdAUg
X-Gm-Gg: AZFdTZdURxIkbDC6qnNTs7dYSKsnCFOE0X1pDkWnDbI/J5y86aSKn9V7WO0P9Vy4cm6
	xeA2zTF6oO5WNI81sLbf7cLTVLYFMBS7kIGSyg7bB9GiO/7i4NobfmcrSOm98+fjLtcaERP3Btc
	q7Pgoebeu/b+E6JBCRRsMJ5niGVJVq25VthgsX1ETHN5N1xJ88mvxWjXtwxJ2yZFykHDXdtYMQu
	AdEVc59u0sOcz72iLH81rWaJbRvnvxwm7eixWYYGQ9eazpxPokzizmwOLjdSUTTVh+l0i++Nzbf
	FTL2dzsLAqXO4jzgYLS9aAjn9Qqlrze2NJrXAf5EUEQdrv6hDD0wWuc2CzImGKEn4963lNoK9X5
	+GEclRn70E9pt5kd1f9TAGmjol6lSvfad0SySJU0MsAg3ksWQP4s0TSnG+3On1fDmElLlcXFUXI
	vgVgqrQZJXfov20sWYNs6dy6y68nUiLTqKfeHQh/A0ge/STc5OKO4L9uAUQjYeQwSJhNrrzg+Os
	LktuA1Uc+m2WKVYKVXkmq/kprzkI0+cQAgvcPh4WyiD4BH5iAKN8rhSdfol0Tj86I4EZuO4QYka
	i6DMA//9DKI4wXlwaO8YN6C6SyKXWUnMSa83lq6D5Kg=
X-Received: by 2002:a17:90b:3d4d:b0:3b1:7329:a121 with SMTP id 98e67ed59e1d1-3b41c8d49abmr10049654a91.12.1795403143088;
        Sun, 22 Nov 2026 19:05:43 -0800 (PST)
Received: from ?IPV6:2601:600:a482:7d70::b4f9? ([2601:600:a482:7d70::b4f9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm4178705a91.9.2026.11.22.19.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 19:05:42 -0800 (PST)
Message-ID: <813dc217-9753-4f9a-bf1d-1d8878dc9012@gmail.com>
Date: Sun, 22 Nov 2026 19:05:40 -0800
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
Subject: Re: [PATCH net] net: wwan: iosm: always send the host sleep message
 on suspend
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 netdev@vger.kernel.org, johannes@sipsolutions.net, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, m.chetan.kumar@linux.intel.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261122050039.861287-1-davidlwesten@gmail.com>
 <925a4f3f-95bb-496e-be19-abf96af34d89@maciej.szmigiero.name>
Content-Language: en-US
From: David Westen <davidlwesten@gmail.com>
Autocrypt: addr=davidlwesten@gmail.com; keydata=
 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
In-Reply-To: <925a4f3f-95bb-496e-be19-abf96af34d89@maciej.szmigiero.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maciej,

Thanks for taking a look!

On 11/22/26 12:01 PM, Maciej S. Szmigiero wrote:
> On 22.11.2026 06:00, David Westen wrote:
>> This ignores the BIOS RTD3 setting for system suspend. The setting
>> only selects the sleep protocol; the PCI core chooses the power state
>> without it, and here chooses D3hot, which the doorbell protocol
>> doesn't survive. Honoring D0L12 literally would mean keeping the
>> device in D0, as commit f4dd5174e273 ("net: wwan: iosm: Keep device
>> at D0 for s2idle case") did. That was reverted, D3 being the expected
>> state.
>
> I have mixed feelings about this.
>
> Your platform specifies D0L1.2 as the target state so I presume that
> is the state that the platform expects the modem to be put into?

It turns out it doesn't specify anything: the WWAN _DSM function 3
returns no result here (BIOS 1.56 and the latest 1.68), so D0L12 is
only the driver's default.

> The reverted commit f4dd5174e273 on the other hand always put the modem
> into D0, which was incorrect in a different way - as, for example, my
> platform explicitly requests D3.

Agreed. How does yours request it, through the _DSM returning 3?

> Could you try the reverted commit to see if D0 actually works for your
> platform?

I tried f4dd5174e273 on 7.2.15. With it, the modem is no longer put
into D3hot, but it still crashes during suspend-to-idle: when the
resume callback runs, the modem already reports CD_READY, the same as
without the commit. So it seems it's the FORCE_SLEEP doorbell that the
modem doesn't survive, whether it stays in D0 or goes to D3hot.

David
