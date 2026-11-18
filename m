Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794994375;
	b=rrq+0888KClNYd+mJUl6vaL8S/GJ+MSSY3/gxtwTIwrls550HKVKuH4+IwCvPhfd+Jz1
	 O+QUDzRyv/wSMg0hT9qTD9HueNR4+AR3sjl0WLeGEYanwJtqgkhJXyC48uvIP2FAM81me
	 ts55mpf3Aj9AOY14L18H8ejj39L6zZgBxLoQduBj/anJFieNu2VWH1NXytYFaj1641hB2
	 uKANMiYCjz2bsTGBChFqYRsVEyzinmJML3BjtHPunVuvNK4h9QDw8uPraHX3O4qvoL3Cp
	 trPhoyFHwg8xg0oE9NcCg8kImNw2S7GWAgQ0B8Pall0V/gwWG/CrYcrfttBMsNyGtKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1og26ai2g5/1tjoNZvFJW/L87BQlfRg2PfgGs0r2tR8=;
	b=hhlbr5T2gCENzOpjpq/7C2U5EOQ9kS4tq4AuxkzhJIQaXsHUBaUf0QK6JCGVBOsY7jTe
	 rWw822qC4fNTN0ijFlDB0pFrSp++XkWk2YWUllEWVfemPzQNVoILXPai1RNX/Gyzzb/mK
	 YMerqjS5OSdM0X+NM78P6JSuttZnBjv2E0RdfKuMr9lf21O18GqSUKDa+soJ64rHmqYSa
	 k0g6tqtt3q3n8oNwiRvbNwvf9CHX1XQ6G9+bN8pcY6g371pQC8llHk6QochP7u5BFXyp8
	 cAxy9M5l3qKw7rKWWgMlHKXIlvwjx4S+YaEBB4PMU+nQqVtI0tPogr6GtEn6ngy3fng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUyLLo7T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53225606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53225606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUyLLo7T
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso1016838a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:32:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794994374; cv=none;
        d=google.com; s=arc-20260327;
        b=nlNMc7ligWCmAit+8nHoPOhCQEMawMU60Ug2Hp60+a9uozKtUJr18RUE5rIDfwiHTo
         +/0YFnBFKT64I/ecO1/ldGR9Rf8XLST+AOwI8KgZfNZUxydDGY8IK11Rsw2iD5qkScd0
         tzB8DPxqGst6yIpglkYcajDUrKqUUBII9I7MhAuzWEq3oVMRTHBpljZlasv9QP2djWs1
         SRxySbMcCEgIwhjlJ5ly4ns5tg37dDWlMEEnvbgU0WHjj5jFl6ZPCJx4qF7STCobNT8S
         TeYJSqQWBu4CquOMOBHDcD6d6hmSRzDztvoASJS6JOrMOsWDxlAELTQS668rsubUxFR4
         +zAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1og26ai2g5/1tjoNZvFJW/L87BQlfRg2PfgGs0r2tR8=;
        fh=6O5oiLXUJHRMLJhZtf4rpzOjygVlJPmV1nuc5kUdW/4=;
        b=miHIBo/1mOZL5H4kveC1+xnkozlPB3yPekD8SANxotofNoxPqK0DNBuVOLLdKbpQEk
         jN1ghEoCykTerT9nA1n80h3dcbiaEG40MfRzpm7AiSfybcWaB3tHK+kxyI6eXopaz0LT
         KIhlDdDzBAjG0HiHiG9nHpyUsYqNnXhak3m8kDkDvD6zF1DibJqHP+tWKAevHhwi7bUV
         cxgZb1j0ZvmlMxTOhz7f+JXKxqcgLerxNluhjb7HoPyNdz/MmQzHGmERoq60dcRqYpEv
         D2U3urhdMStEPBQPnurRtF5Epa3ebsdmUcMZ4Wehg8xT+nJVYiY5OYrog39nFSXmwpwX
         BH0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994374; x=1795599174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1og26ai2g5/1tjoNZvFJW/L87BQlfRg2PfgGs0r2tR8=;
        b=NUyLLo7TKo8kd+pdxNJ17kzQAc3/3WX2/6eyLeImBX5Kz/SK2YTsHys+7s6myaUo6U
         yXzIgaDwHjCziE76JfjGHmZkGqrxAqkXIA//TA3OhZ9qnziAHm782Zs4aoctaNWiVmMw
         MsVXEZxYaGsnMWtiFAThQ2FOAKdlPbtuulnEblFM27VfaU10TRZ1e6yZ8pwcfTEniziS
         oAQs37tvkficajAKBkbRf2m0aH3rOk2B2S5FPx65C9hCbO/ikgHzQpuudT7f8FJk+SmZ
         3HS6YHMKVdpGhcYxtSkU9mdyW/lY1gLOjAlEjwozZBVZrHojThDYD2tvKqLwjqqdcIiz
         sSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994374; x=1795599174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1og26ai2g5/1tjoNZvFJW/L87BQlfRg2PfgGs0r2tR8=;
        b=F7lXogvpEI6d7SLePFm1hpdjUQb/VCOHbBucPOcrJqiFLYTwLvF6PYJX+sGnU6pfNR
         4alcHc4m3SIA9pooSrdWFjdT5zsFrBuwxudna0gt6eTNP0Xjx+x9ldiQwewpuptYghzu
         hQxKG4TDVySPoJVBMY65IvF5FLHhjrit5qJggzstUZ618YnELXan52OGE04byxexZTF/
         ah2LEcK4EvDvit7uItv1r8++XAJi6pu3wZJqU+SoEaaGEd0pLxiJviriDPVWfl43wmNh
         v0FBsd23rJgYtFK8Ayb8a6HpUz05oGqyw6ZQ3JUhaybRY4bIcpWrltBnElpjB9/1XmDw
         ceaA==
X-Forwarded-Encrypted: i=1; AL+hErHHhQZxwYko2Fcs6/EFuk8rlOKJ0cVXDJufyoOvptV9ZEial48e3JgT3cP0fqZqIvLZbJsgx3k/rklFuvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8io5g2FKz/w4rw23Q5Pj24t8myDGHpg2cDxyvgMBe1UIU9XSy
	/IbK3Vgd+19rzu7uyssSNdjNtUAFKXh9KWPY08cP6D33FcD3fqO47CBD0Kz1C4Jf7Ck7RVWATxJ
	ZMwRLoNzzBE40xHyVEkollR2ff73ahtk=
X-Gm-Gg: AYBFou1h5FhDAwbEJKH92pNACjEUZsnopY6uHHiuwQ2ruTj8UtxRn1ltyLx1DhTxylN
	go+Vdn3OtrCOVYYJ9sJGCJrHXrjdLWWARJI/ixf8GnOD2/b8AhmVEYEZVS/BWBlo8nh7E/+pIqt
	q73M2RXDUrcknEufyRvH2NY9KtsfgbovVbwpEerjjQx9rZwQYtWHGnFxHk6uWRj4KEzTm5m0gN2
	8WljQP+J2mSWXmolyq9CK/LNngzZbR32TGw1+Hrj9l5DH4lMUf2+IDYZDr6enLrprSWiIO5pfrS
	nMWhiBpIyN+/fElpI5IWP12ZX+5DZjNHP8iuq6831ePfnuliPNmWtlXFKA7C5WZAiDrEQ5G0o+5
	sWs8Lqetl5HzRudxNfC592pbmcwvQeIThE5BQMKH6MDbD88IKAZEo8hNRFZkOigeQ
X-Received: by 2002:a05:6402:c894:10b0:6b6:e8cb:642d with SMTP id
 4fb4d7f45d1cf-6b887eb24bcmr1021031a12.8.1794994373377; Wed, 18 Nov 2026
 01:32:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117205132.141964-1-vitorhg20080@gmail.com> <6fcf276b-8e06-45aa-a780-f91bcf478d8f@roeck-us.net>
In-Reply-To: <6fcf276b-8e06-45aa-a780-f91bcf478d8f@roeck-us.net>
From: =?UTF-8?B?VsOtdG9yIFNpbHZh?= <vitorhg20080@gmail.com>
Date: Wed, 18 Nov 2026 09:32:42 +0000
X-Gm-Features: AclHuK-NU1K_-Ddmc1vQBFnPhIET7kbdmrk1i1L9me54bFB5GXP_DNSaJgOvC60
Message-ID: <CAOhXrFcNqDCU6RC=EmL=NCPyf78rB+403mfdkbFLF5aCog==Jw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (ads7871) Add error handle from spi_setup()
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Guenter,

Thanks for the review. I've sent the v2 with suggested changes:
clarifying what happens
if the spi_setup() fails and using imperative mood.

Thanks,
V=C3=ADtor

Guenter Roeck <linux@roeck-us.net> escreveu (ter=C3=A7a, 17/11/2026 =C3=A0(=
s) 23:15):
>
> On 11/17/26 12:51, V=C3=ADtor Hugo Silva wrote:
> > The ads7871 probe() ignores the spi_setup() error return value
> > and it attempts to write on registers even if spi_setup() fails or not
> >
> or not what ?
>
> > This patch returns the setup error before accessing any registers.
> >
> s/This patch returns/Return/
>
> (imperative mood, see Documentation/process/submitting-patches.rst)
>
> Thanks,
> Guenter
>
> > AI was used for peer-review the patch.
> >
> > Fixes: e0c70b8078629 ("hwmon: add TI ads7871 a/d converter driver")
> >
> > Signed-off-by: V=C3=ADtor Hugo Silva <vitorhg20080@gmail.com>
> > ---
> >   drivers/hwmon/ads7871.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
> > index 36297bc6d047..a1ffc35d9272 100644
> > --- a/drivers/hwmon/ads7871.c
> > +++ b/drivers/hwmon/ads7871.c
> > @@ -187,7 +187,9 @@ static int ads7871_probe(struct spi_device *spi)
> >       /* Configure the SPI bus */
> >       spi->mode =3D (SPI_MODE_0);
> >       spi->bits_per_word =3D 8;
> > -     spi_setup(spi);
> > +     ret =3D spi_setup(spi);
> > +     if (ret)
> > +             return ret;
> >
> >       pdata =3D devm_kzalloc_obj(dev, *pdata);
> >       if (!pdata)
>
