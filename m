Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795108136;
	b=STztAQkebHoh4OlRl70SdnbccWNt6HykdjTZoYVxuf9zT/2TvGmsk3cxcfRmqDlEqTf+
	 US88uTJOd+AkLw10jYNwN3TuAy9lkcPvSbsQoB0Eb7JURpepPldsJHQ7UAPNzJPIo5Ie/
	 kjxbdPnYt3eT8w07ZHAtYXNIy+F5nDEsn4iHmRsImG3hT609PZyhlKvzwBpmvs5CY8P6C
	 04e2BiIgUxm2+7ouqIYlauxheahnv8J4Cd0VWza2iKV5cp6XaCly22jXdQmRd5somJWqH
	 OBK7S6zEPogOcyvS+31Ri3EkrQOFhDdSgOLgLpJcsTCXLTaIpx9xyvoxBNNtwY0zlcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jsip5LtACNKYn+7qoo5OLOP346pcqMnnFr1l7MoLujQ=;
	b=5Qk5yl+lTHc6HJjdiS/ZYti0dLcIUuD6aYknsMcTROm5TqnusWUEnAPXkPAkKZd4GdUJ
	 YKpb2KvlkUNhv28Kqu2TjWQn/e+qhL8uBLMQoWkjtANyUVZDFayk+rBM/9SDKkjS8aEI8
	 5L2qvUOr9k47x86bex8SSknOQECTIE2SDSfgjGD7twZsY7pQBOxHRocgyJw4tf0vnY2VO
	 rZQo2gAqw1bkZGuzvbpx/d8e3UkDtlvdR3xbxEmkbfbAdo+qg9ZNej+h8M/otDB0n8fci
	 zKm3zhXKlBMLd9vdRFn9VGf8F1w2JaHHxYRfjui9G480Q8eFEsTUBVafwBeS4gjfpIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WU0kzWGn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEAC60A2602
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FEAC60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WU0kzWGn
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b8c60e0d39so2447477a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:08:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795108134; cv=none;
        d=google.com; s=arc-20260327;
        b=p+DK/oYYlCMkAnLo0aET8QvIJnFp46FzlSYYGQdOD9gtIyttzfQMs0u5aEFSNlpJdz
         61BX6iqjRCEfJEWKWqCMqrEZoAXeQPjXM1x8kSQ5Ka+R7X7d95iHl/heHih5rPGKLzJI
         9xNiRuqBf9P6b3KYjgmsnWfLhImtjapIP/2zLKWBIwKns3bPH9awDyL0pqihzkzzLmwL
         I1DwP6Z5BzVY3e+31QWl7alHjGKTakFJUFp7PCvqrsLTWVSKBMEPIONetccnxS9hldHr
         Ji3gB3bEFvDtgrpnL3zQ7MzR7/oRO5ByERdr5oAP00rt+HddwKssLp1E9j8WFVsIWGcC
         G1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jsip5LtACNKYn+7qoo5OLOP346pcqMnnFr1l7MoLujQ=;
        fh=KkEQjyRwXy6ykWculpIdWFUqq1jIjpsvwAZw1sMLGPc=;
        b=PCCg9AYr3dC+DATIW10W8ifypfJp+2JTargYRvNK7uwU4MoVdVPI2qZpbx0/WehTUO
         J2hikHplhnS2vcRfEsRkStDC/lSBdMIrxHfJ71OdfWDh+f8lrJbDtXFDF1YJMXYEiSSX
         hEEHM3MgFhwVWj8u8O8q84ym3swYE1DrnoXoduWMJiKI3VA+3lqW7DHia9YyOiE5DGAF
         Wvois6dAhCjTYyo7cqeJIeWZsOAfvGNc3hNf4zJyd6l7hW2V0JpK/vftGzRlAPU3OcLL
         LzG23SjfeBbQTvMSqniwZFSiD0SHnP19UUYLYdxbCsmYxvaDzy/TUs/UL6uxkXIIOkJW
         XiCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108134; x=1795712934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jsip5LtACNKYn+7qoo5OLOP346pcqMnnFr1l7MoLujQ=;
        b=WU0kzWGnQK28cjC4LK2NrlQJ+EjNsF3jHX4t8tRAUfWVliG02Q5lkA80nhgJHt57yd
         siR8WrnL+50Bq2xRqvErsiKSiYllqkG5eLc68YAsULSpAj6dtAVywEugjF2iiIgMIFEo
         HiccjeUoyfR3wpU9q/FvaFgccf3JgKoMEIrMCXTRR6dH50WFU/nzMMoKVUKjaz1uFVkF
         vMwSS+mft8KA3BvytegcqqxWJscDAOb9zjuRM96vMzpqCBh4Vem41uwryZ2h6jYfEAxR
         owoKN8fDDVFR7G7qBG7IfZS+8eBGHJPt6LCycbWY0BE0JAZDJrdlrPkrfZdab45oZT9l
         jHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108134; x=1795712934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jsip5LtACNKYn+7qoo5OLOP346pcqMnnFr1l7MoLujQ=;
        b=C7Jm11ZNBQtR2roDPcTijIAyoSMPayzW/bte64Nvvfv5JUKt7FJg5sKPEJnK/qKWt5
         5cDPeo+OLNQpghcvT/cYEjfOnB9CJbSQ4anbhGnsSkQOPxw+WgU0qjmAVGMqYYiitF21
         DyGOe3IyqMydclHplJq7KX9JsOoe4drZ4ztvYwTazZosaxeoHqdy6AvpfIcrUM+Zw7Qr
         RGKbmglqfi9YaJ/tJMX+9VduL0eabIU+UQwTkrrDg6PVc33fsruVF+gzOJFTViE0YVjR
         7TzwACw7rhP1YujZufE3XUx+pTL0kjtvgMocCUNq1GEk87xQ4dVO7ZKgwwqwv9mo2ycR
         FT8A==
X-Forwarded-Encrypted: i=1; AL+hErFJ6S3WgHiYUPtlJzOmZZjLK2ISqxQXFaVPRPlSFjHe+RONA49gv6fYb2Xy1YVs08RJJjgNdgRWhMArfWI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vG0vv73rbsHio+CFjJFIejj73gRkSO7uBaGfn6r7e03fDE/L8
	xfhmt6tzlog5EehSE3IJ8CJGaWosjTZEKvY1PWisuj2Gs61L9gCi06xLq/MGOYvxWFaingXTIjN
	2Tf2HdX82wWAq62EghaHNKpIpAm9suQA=
X-Gm-Gg: AYBFou3torQ5NfK74EqIyLzvq2Lf0OQocbOcoN6AeyDpP+fAkz4QVUpI5YMl2KTfIco
	uLxUpn8k8Zd5K80oO4SmoMUeY5IY4Z42F3Yr4tD80ib3pLQqLFIVx6GpoMMCsG7VmtGvEo2oh7K
	KS2OntQTsJEeAiPP5lV18BzupdLiSaOZN8RkvdwrKS9IThuoQ8Chd6SuyfO5ZcuOOFE9NheGL1L
	kVD0YAHsjyxTQSktNQzSSQzl/Kmp2xWaDxFqFaktPc480sd/nsYsFISfACdVD8xIs569ihFmVV7
	jkcYiTp34SIWFFJX/gzZJ5R3cLndjAqsSEZZEed61T6/fktFuPZtmMNQonytM0L+geiyUouOcuz
	rutwkgqD04PF03kKF9Q7mE+47HldwDGGvXN2ItUVDv+0fOUJsABhHbk5cBAHMRl4l
X-Received: by 2002:a05:6402:4003:b0:6ba:1881:dfcb with SMTP id
 4fb4d7f45d1cf-6ba1881e15emr2086412a12.11.1795108133606; Thu, 19 Nov 2026
 09:08:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118092928.163553-1-vitorhg20080@gmail.com> <58a7d381-fb19-4d55-98d5-dfdf9b16e2b7@roeck-us.net>
In-Reply-To: <58a7d381-fb19-4d55-98d5-dfdf9b16e2b7@roeck-us.net>
From: =?UTF-8?B?VsOtdG9yIFNpbHZh?= <vitorhg20080@gmail.com>
Date: Thu, 19 Nov 2026 17:08:41 +0000
X-Gm-Features: AclHuK9xhN-ZQamSIlc7Z1rgFKFoYFRWnrSdpZ43JMP7Tnt5FAE7JvzbDMvBa8I
Message-ID: <CAOhXrFeOS3nKWTBZS3TqT1BmOHkjKJumns7t9R5bjGwLc_sE0g@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (ads7871) Add error handle from spi_setup()
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks!

V=C3=ADtor

Guenter Roeck <linux@roeck-us.net> escreveu (quinta, 19/11/2026 =C3=A0(s) 1=
6:49):
>
> On Wed, Nov 18, 2026 at 09:29:28AM +0000, V=C3=ADtor Hugo Silva wrote:
> > The ads7871 probe() ignores the spi_setup() error return value
> > and it attempts to write to registers even if spi_setup() fails.
> >
> > Return the setup error before accessing any registers.
> >
> > AI was used for peer-review the patch.
> >
> > Fixes: e0c70b8078629 ("hwmon: add TI ads7871 a/d converter driver")
> >
> > Signed-off-by: V=C3=ADtor Hugo Silva <vitorhg20080@gmail.com>
>
> Applied.
>
> Thanks,
> Guenter
>
> > ---
> > Changes in v2:
> > - Clarify what happens when spi_setup() fails.
> > - Describe the fix in imperative mood.
> >
> >  drivers/hwmon/ads7871.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
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
