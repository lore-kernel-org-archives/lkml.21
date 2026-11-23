Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795461883;
	b=FZ4HqfCDhjtr04upSQywiO3JDODzwP+wY1zXg+P0mxqUSkF6jtWJyrHSf7TfPfmvqzXX
	 EHfMxo0rxbJqlq6w25RAdWWZ4ruWCh29ilCb7CSCnPRZEvMfKoZaJRZD1nobURgD8fwAD
	 9wJg//W9oxyAWcflgqkEVuKg20DFMMnCOmi+uUobqTAD1DzY1U25Efr4ADdbIsuotoJeU
	 AjwsVE0hp13xpdTtHrJfhpOX300GYh5PTxP4ckzSjWic96WVLf5JcfkJpM6glUjx64k3f
	 FmngKkVghOM12GldCjEqPArdF/h4W3V9jRfHVNvQcdfQ414PwDR6r666Bb+u8a65/jA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mu3NpxL0VDL/oCB28gOtk5lf+/OEsMsSKxF2nMbAOns=;
	b=Va5pmJb48wFZbpabCnKt7uZr/qwKh93fg7WRGZyIVzWdhj1di+szF5U+vpCdS8A1Vk1z
	 KIrzQuZOVe3eJrkagflzhKCjM+9uvxByNotCuwIohTFk6qxjrlFOCGBJY1O7Gim4ylghf
	 qxKceVSA4LVs+D+YyZANsXt7eD7oQY8v/oc3GEIcgQo/KSVI4LrBdbPx5nGBnzAUelNNI
	 cbSeNqs9jvL4YyC/l+03h3PJe6Llww8t3fJhJvXcs+MFe64eiBFFiBRNLFDbWK6+ZnyM2
	 JHzyZp21odwQk3YvyaA5C0V/l9NY+9Ymo9jtWUqiEe40AjJB+Bzsrl7RzA8/mOzeI1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7jDIIKH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBACB606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBACB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7jDIIKH
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38644aedba1so5566307eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:24:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795461882; cv=none;
        d=google.com; s=arc-20260327;
        b=CqJzVlk2ctsihGev/uAvCrRdmnqp05yswOKsSa3rIlTjVKVGBa4TD9L0/GZcQSyoP1
         F2gumvcqkd4qJmMXn7oEJ+q+HXkuVNh6wFGQd162Yoz75L4PZlEXnSI7DwoCHgMcUymZ
         c/kPumYqgx3X07HloGOe42KRPXBI7neHenzcIPmcdq+6WPGtZG7HgbO10RdAiQ1q1RXt
         Nge31aW8KuH71Y7sxpG0yHVO08K4AmWEU8hKVQ+sdnR+xhHsX/nK8rxRYe0pwi0E0FMO
         Iw7GcO156zdcSI1InXCHY/9FK0jaXAyHtJC1ug3/T7nGN9KJCpoaF38xlIGphn8Q7FNP
         eVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mu3NpxL0VDL/oCB28gOtk5lf+/OEsMsSKxF2nMbAOns=;
        fh=DaaEXz7Vi41GhBfYTgI/n9WxFs6ZgkdTozHojvr2JhI=;
        b=Vp7Z+BNHXgjOz2aw+jej6cdSSPrPhzhUF3j35wle1J4slIopMhlVHiQKh3bcDb36TT
         TsLqzH/E3IT5mtKpV/wgLoNY2FcyojbaCdDYBHazreg3z9LPI0VLHmSUYmAfhiU1bWYm
         F++bbwkedWBKMgaiACC80VvW9LYxrVxWI9zzr+/n3U+Xn1PG1JtihTuGY1mViYON5EnY
         an8a1UDPe7hpP2uDeFOG0E20JiN57QtVMVNUFjuaCrofERX/FU1FRIl0uscYJyon0rhc
         eMNyQ5QQdtyeT420E/1uAVuQTG6mBS2E8iPQyGnMOgtwfUPBgCiZdyqDeO5bHp632hv5
         0Igg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795461882; x=1796066682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mu3NpxL0VDL/oCB28gOtk5lf+/OEsMsSKxF2nMbAOns=;
        b=h7jDIIKHDbwAJU/+rLgBlKd7MZbSjgSI1Al9rnYKD7Yk1+Eo/U/PcalKvg0hiCo55L
         P919qWgeYHhUTFV7zKjK3i6tOoZ8PIQ9VnO1VbPPzSM0qUr+4lPoQmpM3OvBKEuj1qSX
         wl+kYIZ4Q+rDehFY0h4XMPUxGhB6McliNkn6T/hcwrbwPXrJ5reTHx68UpF9NheNB5tB
         haVNO1NKTLML/nh8jnfoURMF0PQB1kcIZ3j5aMP562Lm9UCCOXBz3UNcM/3i2HDCffQB
         7Qiq5zBBxmYq7LdrBX4r/aLNaQRclterA05Q6Kmal1JoUOMKFL7bLnApornbOIQG7KpG
         WS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461882; x=1796066682;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mu3NpxL0VDL/oCB28gOtk5lf+/OEsMsSKxF2nMbAOns=;
        b=cPOQ74sZM6dxtK0pmm0ZFuPNkHm7OuyuXRO541ycu19NILtbiR5c9ZUEXuPe4cUxZs
         JJneCmVpUBm2GGAnNYc/E3a6DmPGsWdORGU9HBS4RYcqg5sbRvemdajIzHm7OQvT3vJv
         bZ/h8ZzHtEVZ37t+KwAVTfMeHTucjEl7ufkqOFAYjnQG3pbQk0Mg236k54ZYTMstffOL
         tzp+mTygmbNxItPWwwkghbsQlDjVlg+eqSMziXCVvJLmJZIvgfkfUkriafzPnvKdwg+2
         EEjqVe2eEOL8wQzYA+ghwOsecJATxh5MoWN4Q0WVZ9okQzQnFiP1QmmGcSmI1z/S9fvd
         lotw==
X-Forwarded-Encrypted: i=1; AL+hErGgzwYMwYWu0o1EbcDRsGPAVxzmHSnc1MIS9WYMgIVMaXA5Qc+y0E8q2WtcJOqoGIdzbK6Tvwvu0QCc+C4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8A2BryENoKIY2MM5L+APG2qW36OtPbr3VlqZs45I7BpjLYW83j
	tL3mycI122xn25Ly3B+JfSqTbtUgNU2NGCfxcZDE0/7G3sRRXOb0yeSFw6ws9fAu2BaosURzoCN
	Adp+8VAkFzb5nSA9Ynnsvch1KIa98hcQ=
X-Gm-Gg: AZFdTZe9z3Fk51BUNSM3XkQEHHaNLwcnRHC/mVHWI3SORWVZ0L0gV6xUok1GHWRCkHr
	ca8HvnJHqHDBbsyGKuvUSQ72x5nbEICYr8cwGb+zUTC1lbM4rdRmwnS5KTXI+32eGue2n5BLPs/
	2cOaT7uxm2u3hNaNjwWX1LBKO2v9NtZ0aaWJHEYHnBX+J3rMEZUrq/hw0RUve2iWbUmKJcsG03+
	8QdU0ya5Klrkt7Gz40cqaQ+97C8RJlB/6saO4yL+HLgA/jocGt6EquAmPPnoCeOxNGpSOtJD4DF
	qEWeKX9RwAanJZ4c+OszULWFfBgSx+DPwYXhy5HN0PRxoaiLmg12p5p/a80Fut/5lSoMkyxE+AU
	rgJqzayVYaDHpiMSS9oYe5KhQzFJOmMkNuq1OJtzT432491DBw3dZegyGsLny4E/67rx0y4K+Kg
	OMs4QxzsA/WteECcTKPYEM3ZcWLledkQ==
X-Received: by 2002:a05:693c:8641:20b0:383:50b7:1d78 with SMTP id
 5a478bee46e88-38571223ee7mr14067601eec.40.1795461881820; Mon, 23 Nov 2026
 11:24:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123150725.212836-1-clamor95@gmail.com> <20261123150725.212836-4-clamor95@gmail.com>
 <awSNc2piI26LgyAU@ashevche-desk.local>
In-Reply-To: <awSNc2piI26LgyAU@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 23 Nov 2026 21:24:30 +0200
X-Gm-Features: Aa3M54p9p3fpa_qpWITuz1CQVJO7lvIEsLxGf_QiAXXT24x-6L6prR2LGWA5Z2I
Message-ID: <CAPVz0n2yBtFh-TJ13cH8WXtiyzR3tOrbhACyq8MThi_6+7DOYg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] iio: adc: Add support for MAX8907 ADC cell
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-iio@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 23 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:0=
1 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Nov 23, 2026 at 05:07:24PM +0200, Svyatoslav Ryhel wrote:
> > The MAX8907 PMIC has a dedicated ADC cell, which provides 8 ADC channel=
s
> > with information about different parts of the power system, including t=
he
> > battery, charger/plug, jack and thermal readings.
>
> ...
>
> > +#define MAX8907_CHAN(_type, _idname, _datasheet_name) {              \
> > +     .type =3D (_type),                                        \
> > +     .address =3D MAX8907_REG_##_idname##_MSB |                \
> > +                MAX8907_REG_##_idname##_MEASURE << 8,        \
> > +     .indexed =3D 1,                                           \
> > +     .channel =3D (_idname),                                   \
> > +     .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |          \
> > +                           BIT(IIO_CHAN_INFO_SCALE),         \
> > +     .scan_index =3D (_idname),                                \
>
> Using () means that you expect an expression as a possible input. In such
> a case the macro is buggy as it will evaluate it twice for _idname. The
> simple solution is to drop these parentheses and expect that this macro
> won't ever be used with the expressions in the parameters.
>

You have a point but current state should not cause issues as well.

> > +     .scan_type =3D {                                          \
> > +             .format =3D IIO_SCAN_FORMAT_UNSIGNED_INT,         \
> > +             .realbits =3D 12,                                 \
> > +             .storagebits =3D 16,                              \
> > +             .endianness =3D IIO_CPU,                          \
> > +     },                                                      \
> > +     .datasheet_name =3D (_datasheet_name),                    \
> > +}
>
> ...
>
> > +static int max8907_adc_read(struct iio_dev *indio_dev,
> > +                         struct iio_chan_spec const *chan,
> > +                         int *val, int *val2, long mask)
> > +{
> > +     struct regmap **regmap =3D iio_priv(indio_dev);
>
> Then logically better to go further and have
>
>         struct regmap *map =3D *regmap;
>

This is matter of taste, I was inspired by MAX77541 ADC which uses
exactly this approach.

> > +     __be16 data;
> > +     int ret;
> > +
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_RAW:
> > +             ret =3D regmap_write(*regmap, MAX8907_TO_MEASURE(chan->ad=
dress), 0);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             ret =3D regmap_bulk_read(*regmap, MAX8907_TO_REG(chan->ad=
dress), &data, sizeof(data));
>
> This is a bit too long.
>

101 char, yeah 1 char too long, though maybe it is not wort resending
for a single char too long?

>                 ret =3D regmap_bulk_read(map, MAX8907_TO_REG(chan->addres=
s),
>                                        &data, sizeof(data));
>
> > +             if (ret)
> > +                     return ret;
> > +
> > +             *val =3D be16_to_cpu(data) >> 4;
> > +
> > +             return IIO_VAL_INT;
> > +
> > +     case IIO_CHAN_INFO_SCALE:
> > +             *val =3D max8907_default_ref[chan->channel];
> > +             *val2 =3D chan->scan_type.realbits;
> > +
> > +             return IIO_VAL_FRACTIONAL_LOG2;
> > +
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
>
> ...
>
> > +static int max8907_adc_init(struct regmap *regmap)
>
> Why not name it 'map'?
>

Because regmap is more explicit and is used consistently across the driver.

> > +{
> > +     u32 value;
> > +     int ret;
> > +
> > +     /* Enable internal voltage reference. Exact purpose of bits is no=
t known. */
> > +     ret =3D regmap_update_bits(regmap, MAX8907_REG_TSC_CNFG1, GENMASK=
(1, 0), BIT(1));
>
>         ret =3D regmap_update_bits(map, MAX8907_REG_TSC_CNFG1, GENMASK(1,=
 0), BIT(1));
>

which map? bitmap? statemap? or maybe geographical map?

> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Check for internal reference IRQ */
>
> Please, make style of one-line comments consistent ("all or none" are wit=
h or
> without period, same for the first letter =E2=80=94 capital or small).
>

First comment has 2 sentences, that is why it has periods. Second only
one, so it does not need period.  "same for the first letter =E2=80=94 capi=
tal
or small" - have you even checked the patch?


> > +     ret =3D regmap_read_poll_timeout(regmap, MAX8907_REG_TSC_STA_INT,=
 value,
> > +                                    !(value & MAX8907_MASK_NREF_OK), 1=
0, 1000);
>
>         ret =3D regmap_read_poll_timeout(map, MAX8907_REG_TSC_STA_INT, va=
lue,
>                                        !(value & MAX8907_MASK_NREF_OK),
>                                        10, 1 * USEC_PER_MSEC);
>

hmm, replace 1000 (4 chars, pretty readable) with USEC_PER_MSEC (12
chars and twice wrapped line and needs tinkering or looking into
units.h), I don't think so.

> > +     if (ret)
> > +             return ret;
> > +
> > +     return regmap_update_bits(regmap, MAX8907_REG_ADC_SCHED,
> > +                               MAX8907_ADC_SCHED_AUTOSCH_ENABLE |
> > +                               MAX8907_ADC_SCHED_AUTOSCH_TIME,
> > +                               MAX8907_ADC_SCHED_AUTOSCH_ENABLE);
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>

I would like to hear what Jonathan has to say.
