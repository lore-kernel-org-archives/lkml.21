Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795467931;
	b=AEfgYDJUaaudl5ghEDvg68wxh74Uwz1RW8H1eMk3cE+kOLkhMe+150/2ZDHb3ld3M2mP
	 hQKiJD4it6cqGmE+x1tJFCPB+eEg7bgFjyvzPOOCS/u2NB5ZIfiCeoq13ds1dRniZ08Aw
	 raLE/Uh86xjmjzYVjqHTCaDYtJEQgxXLkISrNnJ4LavxyZN2BvT1lPBeTpmoj3i6Ubems
	 qMTZq9EWvU7F0kXno3dVxgUx1t7GwOcKj3TWa6tUFbNtE086UbULhMlqZAnnvGULWe12q
	 h+HCO9VRxEewsq9JB2sVmep516RfUPICU5BObN7IlsOnSs3WOZA6eWiqOAszJlmo2QQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VtSta76K0DhmEm+a+Fx+3wCOoe6ARhPuKaUdQkwi8Y8=;
	b=4b2iT27tfVDKa/puG3EVG1YUUlvN0ddJdLiG/txAIQJOuWK1KJOvDk+RpE/jGIDwVkka
	 eSg4aiOvqi8B7U1TkRIs2dqcObYopXNVx69jAO4L+AGxVRwOHohCvJMA56iPzEh/757Si
	 G907rMQZZHZ/yMTeaFEPDlPX0GSjMXhXBUfH9jcyPJOk+37LMdMUSODE454571i2LI+6Y
	 YaqgwRMzOn66Cgn9t6nRVvpoEZdUvjaLktOphpjI6mkuRtpLIRIZQiGS5I3jZc0Mb85pX
	 RYwNhWlgKO7rfOofa6DfXuAzK/yjoBt1ShWypy4RUvXtC5BxhPP1MewxGmXp36GKU5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGGalddF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D92F606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D92F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGGalddF
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cde5a7d7849so1601966a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:05:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795467931; cv=none;
        d=google.com; s=arc-20260327;
        b=rmlhxoX5aIkM7QveRAGfslo62/Xpp1oA9iPqC25zVem9dyYrXpSydgWUXnp7NAP+Ji
         LRnHqYjKGxKDvkmnlF0XsKUVmf3K0ei+97heMN8/Vjb7UFZmpZl+TlqeuJ+VyjUAByic
         iF0GltbBPHEH+F4kGOr1RaPOqu3Q26H1b20/bMTDA0HW0aZrZmuiNbqkAeBJlcsAOpkf
         XiAlxQ3wF22UxMUYyOkWsX9AADTu+q1+i4ZEzTVmG8szITHinGTuH1tnwfrmEJhRBH+5
         X2Fx28kYwy8fYz44/LJ3bR/h5skWfMw5AqdC5Tw5/7xnDwPXca36hvrJEAkYKj4cix10
         BO5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VtSta76K0DhmEm+a+Fx+3wCOoe6ARhPuKaUdQkwi8Y8=;
        fh=tRV018Pt8xM0KG2h7Z6Zzk0bH5cM1PAg3NZLZdfW8CI=;
        b=juGx5lqF1cQ5YohQ+Kn7leDlR7y/miwQ5jq5qK1Ul2BFZIKZZydlAc3/sCBtNZJMuV
         7IQ7w/QaI1dSccK+7UCEqvfu0zayU5ox7hOqOuaHsDkL0Kvc8Kz4fe5kK2FCBipCytrV
         bbN0XT+GHRdqSjoTKLMxur1IElkNDXrSDDGMT3XcxMiwtmDKzI7DCbxti9Hkxc8MWkEa
         ud45Dwr3enNtJeYTDF0uf29aNP2Py3KKGkzMn7LUl/8NHqd/n8hnRzodrXT56Boy5mOk
         8fvzfU1pypsq/WwlA25Bo9++SdmP7Zwk1Pi1Emwe3lNC2QYL0IrMdV876/vNaDphtQns
         Hf+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795467931; x=1796072731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VtSta76K0DhmEm+a+Fx+3wCOoe6ARhPuKaUdQkwi8Y8=;
        b=zGGalddFvYP7BCevKmOSQIJR0BADVJZWfKfoCqHYdUCKUn7eO7sv/DcYTsqsAHNFt9
         oIM7jtIFQ4TutDk8AvY87WO5fMbo8nsnkNJZmnrxJrVPulsxru1XJ4h11yLAS4V1/SI7
         93YYrOiYE1uENsPTMYacIYdTeCQjy8hM5ntNhFjroGihGWvSDLoeVnJTaPligx8LxQam
         tkBL6PMk3tpnh9pRnIrAN78diJDZybSsCdlyCLoqcz9cukcJm3c4S8A5uBrceMe3nO6S
         RGZI4kvCf+ZHMxzE0azXEQOPZ1Ys7uri6rAtPHlM4GQb0+P8BhhK6cNLwYS5qvwlvqEi
         k2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467931; x=1796072731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtSta76K0DhmEm+a+Fx+3wCOoe6ARhPuKaUdQkwi8Y8=;
        b=uIqaH+XYD8L6vHGLl0UMaV4JhxV7O16agEjTcoqaktt+A+hY8s+36ySRSi1XAbSnKa
         pRWq8PwoHlTSEpqteRavn66hFiaUAAe9v9yui8/TS9kaYvjsfZsqX5PUxnDPHu1UVOJw
         1faalQ04ShjbxmxYOBmFZqs6iF3R2qOJdLL6rV/wUd14jC2Bw5YYe6BDQzlbHxpO3FT5
         7AY7c1lAxJSzprwE1YTn40kR5maH4F1Y2tlU8ZX7I/pYiH48GVdMYnjHBKnRsyFViKeR
         xK3nZ9VDzcwUXtl0TP1JA2Vchb63ZgfRSWEi5+0l+60CPPEkf9rTshLkW1fbYiqzl8eg
         rGDA==
X-Forwarded-Encrypted: i=1; AL+hErFoQYVbnlaFY5gz9x3CHcl/5ZIuruX3QN14P42QvLf8ZcJj1PZLAvwZSiDRXhSVxVClIBH09Jafbn2Cdzg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8v1xCCKm3kN0URsZGczKQn/+bOvOj8bWofkMB4MwUcyVG6Gokx
	b266ErZbQNIfTmQeCcQWgHobWWDqPoCYo4eKMwDfj3G+KHM1D22BLT2OcDCjl1mW8aThTNIvag5
	OuUidma5b1XOBfmKybrklmPXCPEZtlmokOKMAt5I4gw==
X-Gm-Gg: AZFdTZd+eh5cODgHGwCoU8Ljbuso1OmJsrW5cflOwVPaNK+3kmd7tInnC6kIQoOG4yC
	+HCFx3eK7VfrghpbncW2eBU4aE3VPSShshBUjGNGlMyy7MxaS1XlfxSfAL4a1+uHv1Zt43zbRH4
	M5XuyPsynRb2jd2a3aezoXJJRTI0+PZK/joOX3FTQUoDzkSufR5PJ6CX3cUv0HZ2VswG3sM+Pqr
	xQPiD377zLwwPfknxD0W2UnGFz+BAuaSjMV4M4EsldcSO+7ta19QwFNRltbx5IB3olg8YIuccsx
	xiwVLa/OJBvc4qKD0YEAcHi8gFtuR2+n3fN4FIashdo6cBkjzXzwStJk3zewLmDS/smjJaSUSQp
	v415im9i9RWckYDIiCjUi+AmCSOFvtVuiw/h5lNQpz1sogUSeJh09
X-Received: by 2002:a17:90b:2b50:b0:3b0:9a1b:b708 with SMTP id
 98e67ed59e1d1-3b41c98245cmr11402649a91.62.1795467930592; Mon, 23 Nov 2026
 13:05:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112205228.42630-1-pmazzini@gmail.com> <20261112205228.42630-2-pmazzini@gmail.com>
 <9bd10826-7684-462a-808b-91b72c9d5689@roeck-us.net> <awSmYnfbVnjnSwNB@lizhi-Precision-Tower-5810>
In-Reply-To: <awSmYnfbVnjnSwNB@lizhi-Precision-Tower-5810>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 23 Nov 2026 21:04:47 +0000
X-Gm-Features: Aa3M54rQKL8p1RMTDp94rq8cRMTWaP5id1ZTML445APcrBI-bARIJu24uS0qbcg
Message-ID: <CAAxh=juHWgAnDTBiu0oM7TEpGxMV7LoK9wnHqbfXPGPpJx0VKg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] hwmon: sy7636a: read the temperature only while
 the rails are on
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Alistair Francis <alistair@alistair23.me>, 
	Andreas Kemnade <andreas@kemnade.info>, Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 03:47:30PM -0500, Frank Li wrote:
> Do you meand depend on CONFIG_MFD_SY7636A=3Dy

Hi Frank,

2/2 depends on 5f828ac25ef9 ("regulator: sy7636a: bind to the I2C
device directly") in Mark's regulator for-7.5, which removes
MFD_SY7636A.

Thanks,
Pablo

On Mon, Nov 23, 2026 at 8:47=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Sat, Nov 14, 2026 at 08:33:47AM -0800, Guenter Roeck wrote:
> > On Thu, Nov 12, 2026 at 08:52:27PM +0000, Pablo Mazzini wrote:
> > > The driver enables VCOM at probe, which keeps the panel's high voltag=
e
> > > rails on for good. Read the temperature only while the rails are on, =
when
> > > the chip samples it, and return -ENODATA otherwise. Read power good w=
ith
> > > it in one transfer, so the value can not be from before the first sam=
ple
> > > or after the rails went off.
> > >
> > > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> >
> > This patch depends on the rest of the patch series, so I can not apply =
it
> > to a hwmon branch. Assuming it will be applied to some other branch,
>
> Guenter:
>
> Do you meand depend on CONFIG_MFD_SY7636A=3Dy
> https://lore.kernel.org/all/20261112205228.42630-3-pmazzini@gmail.com/
>
> Frank
>
> >
> > Acked-by: Guenter Roeck <linux@roeck-us.net>
> >
> > Thanks,
> > Guenter
> >
> > > ---
> > >  drivers/hwmon/sy7636a-hwmon.c | 35 ++++++++++++++++++++++++---------=
--
> > >  1 file changed, 24 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hw=
mon.c
> > > index a0d0b4119bb3..a8bfbf1716a1 100644
> > > --- a/drivers/hwmon/sy7636a-hwmon.c
> > > +++ b/drivers/hwmon/sy7636a-hwmon.c
> > > @@ -9,26 +9,43 @@
> > >   */
> > >
> > >  #include <linux/auxiliary_bus.h>
> > > +#include <linux/bits.h>
> > >  #include <linux/err.h>
> > >  #include <linux/hwmon.h>
> > >  #include <linux/module.h>
> > >  #include <linux/regmap.h>
> > > -#include <linux/regulator/machine.h>
> > >
> > > -#define SY7636A_REG_TERMISTOR_READOUT      0x08
> > > +#define SY7636A_REG_FAULT_FLAG             0x07
> > > +#define SY7636A_FAULT_FLAG_PG              BIT(0)
> > >
> > >  static int sy7636a_read(struct device *dev, enum hwmon_sensor_types =
type,
> > >                     u32 attr, int channel, long *temp)
> > >  {
> > >     struct regmap *regmap =3D dev_get_drvdata(dev);
> > > -   int ret, reg_val;
> > > -
> > > -   ret =3D regmap_read(regmap,
> > > -                     SY7636A_REG_TERMISTOR_READOUT, &reg_val);
> > > +   u8 buf[2];
> > > +   int ret;
> > > +
> > > +   /*
> > > +    * The thermistor is sampled while ON_OFF is set, but the first s=
ample
> > > +    * is only ready after the ADC sampling and conversion time (ADC_=
SPL +
> > > +    * ADC_DEL in the datasheet); until then it holds its reset value=
, 0.
> > > +    * PG is only set once all rails are up, after the first sample, =
so
> > > +    * read it in the same transfer and report the temperature only w=
hile
> > > +    * it is set.
> > > +    *
> > > +    * With ON_OFF set but PG low (rails still ramping up, or a fault=
), no
> > > +    * temperature is reported even if one may be available. That is
> > > +    * accepted: the display driver reads the temperature only while =
it
> > > +    * holds the rails on, after power good.
> > > +    */
> > > +   ret =3D regmap_bulk_read(regmap, SY7636A_REG_FAULT_FLAG, buf, siz=
eof(buf));
> > >     if (ret)
> > >             return ret;
> > >
> > > -   *temp =3D reg_val * 1000;
> > > +   if (!(buf[0] & SY7636A_FAULT_FLAG_PG))
> > > +           return -ENODATA;
> > > +
> > > +   *temp =3D (s8)buf[1] * 1000;
> > >
> > >     return 0;
> > >  }
> > > @@ -72,10 +89,6 @@ static int sy7636a_sensor_probe(struct auxiliary_d=
evice *adev,
> > >     if (!regmap)
> > >             return -ENODEV;
> > >
> > > -   err =3D devm_regulator_get_enable(&adev->dev, "vcom");
> > > -   if (err)
> > > -           return err;
> > > -
> > >     hwmon_dev =3D devm_hwmon_device_register_with_info(&adev->dev,
> > >                                                      "sy7636a_tempera=
ture", regmap,
> > >                                                      &sy7636a_chip_in=
fo, NULL);
