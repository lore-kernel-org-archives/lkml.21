Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515528;
	b=v+rwuO6q3fm7GtU/3TDXnOHvIhXsTCABYrmoPEQcmto+24LfJp7Kr8DzjnSFX1prRMQw
	 2KlytDxwillfRV+vTqnpl94ZKRJrOABKbR+a6/xEIFS+WUGOsXaAQuBma2J3p5zfhzT15
	 GG66LYjrQb4oqovShnA/Dgy0S76SGB+tOfJiyb2NS5UtjImLhkmfdGp1w3EocZoNkytoH
	 rTD0BAtWs4S7czSUiAthwZ6YRvvhC6BFcaRb24CR2tEzpPJlwONFEV/idsU8FaHa88yyW
	 rRcmn8qBEwlz56KAJaXuPy5zfpt/4MfhIBX0U80++LCDM7kuDHaZq2z8NFz4WZLVPVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CUO4ExU02cQGrmPrcJ49fSWnHPQqWJxdiEswQmxThgM=;
	b=jDbNraqjVn5scATLPKfeGL4G5tdRXJJthx1kNvzOY40oIsQ1YYAzLdDIFwSh4uZSPxAb
	 Vcz8QuOnf4aveB8RY1xMeTt3fD0zHIytk98PyHbP/wF8NEcdPBQLtuMcQ7ckDprX/5aiN
	 epgDIaZ73g4OEMatQo0qaRiFOdAjxVQJ/CcJNIdvW2b3dLJRpEfVoeQ/Wy/Jfevsv6xse
	 0oBxEAMLvENsUw2Nu6d6SjVuh2xLnCGQWyctvMGPj8yuBXdvy7vvARqY7AosGg6OdIYrr
	 8UQ9xvYe9XVLAXBhK7p2VCJTm2I/KTwCnTmgSFFy9qBLKQgEzq/r7qdeYfi5CDIvPZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7Bw9TsG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04560606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04560606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7Bw9TsG
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2961248f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:18:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795515526; cv=none;
        d=google.com; s=arc-20260327;
        b=MTnLQC9pp6CrsISmhLjH/HuEHP/KpZBJHEvu7qyDgYrxtjdj3SPBennkevw9rEqMR4
         XeLM8SSbxvvPEyVH4Zox9GPqpOJe3qv4OjaWWaTZLh2Z+0C/Zqb4u6y0H7zAd8XHgmcz
         V/UrXoKwwAfbM/HlDBN2JrI729VVk4Q+p8PBqU+/HoSA47TFjSOR8mM1gYnRHpk8DSwQ
         PBdgV6VDnCrMOhOLv9flBsu7XPI3rRDQU8aJ53PHWmKeRtjho+c9KygaZvLcuC9sXkb/
         5k/FxAx0omZpJAj+pptNsVv52Dffk2Ee9zkzobHfsOF0oHsztkj9ty4FtMLbZTSIULH0
         AbXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CUO4ExU02cQGrmPrcJ49fSWnHPQqWJxdiEswQmxThgM=;
        fh=1V4aSrScKJKd9CSJe//aJxtqY7/0Z1OCPeQwfDgkqdM=;
        b=SyJcmEXl/QqvAP0MkkHO7pVT+SOwWTGswpPxcAg7zWIVEqf04ws2tGqvOkUDZfYXuv
         N/Bilr7Lt5nnIx96nh+5LnaxnXCeEYFB2xMqfGBFNdpfeavV1ZTb13Z4PKJrTMuWYLa1
         +Jg8F+jhbiCehIlq91gdYKTddJAB8lMGytUtcrpkm0k1jOMUGZnGMAhfFkBD0sa3q+wz
         nmbVKLjCsmi6nJG1gWgRZhU51/CMW31NKIqCMP96ERJxADpqbKe1dpb4zpC25ErC1xqG
         XX2K7aUeXk5miwNIJfwS7W7xvE83Uogovpgyzf8LM47HN95rhQFmrgistaRJDDRoR1Ry
         TQrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795515526; x=1796120326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CUO4ExU02cQGrmPrcJ49fSWnHPQqWJxdiEswQmxThgM=;
        b=z7Bw9TsG4OANK41aSJfx8Lx42vGTu6EfpD/A4/S+62rlzAAld2aM9T2rndBLbwNGfi
         VUHNrmDzd3bP4sGgqonXQ459tcvQCh/Ig5ieK4Xc5H+doyalKkY1OqGh5SoD/k1TXgEa
         PGd/f4alC4T31elB5DPYDkglEDecs8ZXeQS/9LQN1VAm/35Ji2ROfikeupQ7VnUCkwaV
         M31aWODSRCgaLXE0pwQc62QMIIn6BYiG0u2S1WBnxaCg71d8Ennal7FnMmGQChvVhZKN
         +/Xn/f+DeOr1Trd+RdoPoPfaa6xRLxMo4hJSxblVSb2EP2zuffaJmnU+UOlj676YIYV9
         h4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515526; x=1796120326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUO4ExU02cQGrmPrcJ49fSWnHPQqWJxdiEswQmxThgM=;
        b=1mreJj9nVPUK1wuNbrq2SR5cVaqMKKcBTYtKZw6GmoGqaR+SjIVmeR95zv+1gtcdP/
         SpFVlA8DmDTVl+LkqnkmWWO2lIxTMAiOF5zUt2UvYgnhEa7n4C6rK6E18M5mUC263CQG
         q1EgK3nAEwPVns3OHr9PX3WJD6juFZaITwI2iNtlYgxJ5W8gH7NTV758e6zwJtbuBTJL
         C/xZzocxyat07x0F+k463Yq/urFvCJVrHT1dNA+lBj0x1txDD6e4pZ8dGdv9NpB8nl8x
         3npvzuHh0dUebvDDj0aMy61RpvjUizrX5of52B7R7DMTa5U0flwsuYN1g9yH+KCvS6aL
         xPrg==
X-Forwarded-Encrypted: i=1; AL+hErHttvg2dl8iv3PbsE3goKOKDcZPWsovCtktcB9gXDNJX/DTs2Uejon3RNRyqR69+h1eqbfLTKWd/etsGd0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vsP/KiHZ1RW0Lx5yXA7jiLI1724mY2nrN7shXOO5S9/z278um
	W9kbKg+GlNRHwQtP0gIjSD1zDLeF3gDAfZzeEOeH1IKYHw7GyciUbm+QIH6GgzGjpc0rkvRzeWD
	xvOzo5X3DNLjpKdEfcGnH7X9Nzi/RX58=
X-Gm-Gg: AZFdTZdakrEG8/fHwSH6Q9sWOgip6M+qHXi34JTcHVBQCRcPOlOsUvijkBz3uacI1Fo
	Ia6/LXD04zzIS6ccgANnKMSr0GemTgBd4a9VdngS4U2lO+4GEfTqYeuAKhx4ZqgSHc3UPqrm0e2
	I/oq8doe9T9V+xFTjqls2bTbZ9ZecO50241X95fLkSBOX+dGNyTV26KUBZs7A+O4w1/fIxrQwUm
	S+LMKJvTz23s0pUPYRVsPH7ZdrdqUGhJSoB14s7xy6vxUMuNEHUWQwuwfDTT6VWNcpojC1tvAfm
	HB9/eTGPwexVUGP+qcNjOQm47nQRtm3iDz9kcPwt7jdrovRgSznLpUFhHMMU4UQhGbZYFwnLYzy
	/UGezphguaRZJjFMCrGRvjzkwLiynWdwiYlsace1Z
X-Received: by 2002:a5d:5846:0:b0:4b5:fdc3:33ca with SMTP id
 ffacd0b85a97d-4b5fdc33455mr5655709f8f.32.1795515526164; Tue, 24 Nov 2026
 02:18:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
 <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-4-f2322a91686d@gmail.com>
 <179551183567.11700.4795900066384429160.b4-review@b4>
In-Reply-To: <179551183567.11700.4795900066384429160.b4-review@b4>
From: GaryWang <is0124@gmail.com>
Date: Tue, 24 Nov 2026 18:18:34 +0800
X-Gm-Features: Aa3M54p4pYVawcdbet-1QzcXbMDc3P95wSAEB4W3N0rsbxri08OxfQ1k5YM--u0
Message-ID: <CANYHO6pWocCPaO=_6Feh9nAY4EpQOtznviwks7N5VOp9cAKszA@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: upboard: fix I2C pinmux-select set CPLD GPIO
 OUT not function mode
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>, 
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, BillyChou <BillyChou@aaeon.com.tw>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 5:17=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> > The CPLD I2C pin mode setting following uart & spi used modes array
> > on device AANT0F04.
> >
> > CC: stable@vger.kernel.org
> > Fixes: dca2f73cf19f ("pinctrl: Add pin controller driver for AAEON UP b=
oards")
>
> Please explain the real issue you met and how you fixed it.
Ok.
>
> >
> > diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctr=
l-upboard.c
> > index b9af6dd93c34..66c1c3e3bfe0 100644
> > --- a/drivers/pinctrl/pinctrl-upboard.c
> > +++ b/drivers/pinctrl/pinctrl-upboard.c
> > @@ -225,11 +225,21 @@ static const unsigned int upboard_up_i2c0_pins[] =
=3D {
> >       UPBOARD_UP_BIT_TO_PIN(I2C0_SDA),
> >  };
> >
> > +static const enum upboard_pin_mode upboard_up_i2c0_modes[] =3D {
> > +     UPBOARD_PIN_MODE_FUNCTION,
> > +     UPBOARD_PIN_MODE_FUNCTION,
> > +};
> > +
>
> Add a static_assert.
>
> >  static const unsigned int upboard_up_i2c1_pins[] =3D {
> >       UPBOARD_UP_BIT_TO_PIN(I2C1_SCL),
> >       UPBOARD_UP_BIT_TO_PIN(I2C1_SDA),
> >  };
> >
> > +static const enum upboard_pin_mode upboard_up_i2c1_modes[] =3D {
> > +     UPBOARD_PIN_MODE_FUNCTION,
> > +     UPBOARD_PIN_MODE_FUNCTION,
> > +};
> > +
>
> Ditto.
>
> >  static const unsigned int upboard_up_spi2_pins[] =3D {
> >       UPBOARD_UP_BIT_TO_PIN(SPI_MOSI),
> >       UPBOARD_UP_BIT_TO_PIN(SPI_MISO),
> > @@ -289,8 +299,8 @@ static const unsigned int upboard_up_adc0_pins[] =
=3D {
> >
> >  static const struct upboard_pingroup upboard_up_pin_groups[] =3D {
> >       UPBOARD_PINGROUP("uart1_grp", upboard_up_uart1_pins, &upboard_up_=
uart1_modes[0]),
> > -     UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, UPBOARD_PIN_MO=
DE_GPIO_OUT),
> > -     UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, UPBOARD_PIN_MO=
DE_GPIO_OUT),
> > +     UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, &upboard_up_i2=
c0_modes[0]),
> > +     UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, &upboard_up_i2=
c1_modes[0]),
>
> I personnally prefer the actual implementation because it saves some line=
s.
>
> But if you really want to use modes array even if the mode is the same fo=
r all
> pins of the group, you should convert all groups to modes array, drop dea=
d code
> and explain the benefits.
The benefits just have flexibility in the future. if 2 pins mode is
not the same.
AI code review is not the whole accurate, The current code hasn't NULL
pointer modes array in UP2.
However the UPBOARD_PIN_MODE_FUNCTION starts from 0, if there is a pin
that has set UPBOARD_PIN_MODE_FUNCTION then it will get NULL pointer
modes.
So the good fix I'll set UPBOARD_PIN_MODE_FUNCTION as 1 then we can set I2C
to UPBOARD_PIN_MODE_FUNCTION as you wish.



>
> --
> Best Regards,
> Thomas Richard
>
