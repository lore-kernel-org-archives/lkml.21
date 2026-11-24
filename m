Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795555305;
	b=tay0d8xDAW1+hBLcLjozzTpN5HIFO/17UXfLmGAZjcRQ3imrqy+yzbW0gLKE2KKBzcxq
	 vJygcG0k26gZIjOiv5S/emaLxUgcaJV6OW49rg9qFZpUr0UBHLolTG4emsEt61Sq21O+x
	 bpGjOzCFRPSWEl+GkssyjqCF5gYLqo0Ta87IQ3719FxIfm5HJjDTgPT9DsbAAW7Ake5pI
	 eCgkqXBz+a+9Re81vEsfKZEbLZFpPXYaJXnva+GeJEZh70ZtHp4BWQ3NWZoKD5Uq0tCeT
	 +o+DYeKSRSe+BIkXUnP3W0iRcCq5TKGun0xR1V4opqEDl1jBtYmZCDp7dejg4aj4Utg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Kz0XauTGdOgnd6tw9kPNk/ldh50fDY3LEXEPBQT0ngw=;
	b=VL1Xclnea9ERPjyWoYu8u+nEAwEy2GYpL893+E38IH803fI0VTdht78b9LDM4Yb01Sr4
	 kI4QD5r2V57c823d57D+aHVJtx1KkliO2TiAjH0FhINmJe0rdjoCFDMKO34nCdcYLs5vN
	 OxMdA5iCu7dZWX6eVcmT6vVyspra0XN9/kYIzRa76thbj8JFgg4TvUYGnZsfK+js/AMOQ
	 yop9uzmqODY7Bw6F1cXyZ+FDodIybO56eH6UNy6Tm2i9AN1wUWIzH5CqgCFOCSyxyT4+G
	 BoLS9pyWV8zZmf7TwgS+Qxhq6d6/Eb4Sg/7jXU+M0kQ36WKIaWV8phXmDU6ADww38Vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=YI+KcRB8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3CF606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE3CF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=YI+KcRB8
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b335ef6441so36334807b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:21:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795555304; cv=none;
        d=google.com; s=arc-20260327;
        b=MuHE9yMYdjGDiMOs+3i/P/MRaPuekj6HinPUW4lFchEp1rXvyac7GY6YxImvhIEcOJ
         BVvxniWJSBcOQxf11HXjAV9/nMpRmnTP4VxZ00PJA4xgOW6Diaxx3d6xC18OJ7Sb5ucq
         Roy7XO/8glgyWvsiYsfUrv2SFpyVuLBWRBBw1CqXtgt4TQUmozOAHjrYMn96cOCTacYu
         vrwde68PAm2r9emR32KLnz2CqmkPg4hwL0+KQME/4B12D8cS3/3ZAw9DbbvDKz8OXvpW
         CXyBkPI5mLub87QVXDGTbeaqoaOY2TeJEv0GZTZMhINl18dxoDpK17vUeiBlFBsLWV2b
         z35w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kz0XauTGdOgnd6tw9kPNk/ldh50fDY3LEXEPBQT0ngw=;
        fh=k7UFxeCeO41/jKFFj78DmOqIVCqBazI3MtCe5rIF28o=;
        b=ot9xfZIuGy7x12xDxSVQPWoxCb9GT/BjL2DkG79FN2HLvD7Zs5578QxKVKyc3DXlr+
         3E1bXw4ipCm7Mful67lzNJBpcUSPSjHKBTIPPlfr7XWmj2Dcwj/dIn/gvMbrD6xlswO5
         8PG/1uCV/urdHtY/n+PG+CoL+yIiqjrbluIcqRKCc8VwPMj/uXxAo7BTlXkRSZ5yupdh
         nRtluW6/JJqpU3rdNeAAv96VxUcIIy2fo7Q3qOEsnA0RuIrQxRHso6uqRs8pLp2MtgeB
         h9vUIky1fLXinXjXWAdTfLhx9wz28TfI2Uk0zX2EiK6Rfnf6+Y7BRqv32oYdMdctpFoo
         aZbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795555304; x=1796160104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kz0XauTGdOgnd6tw9kPNk/ldh50fDY3LEXEPBQT0ngw=;
        b=YI+KcRB8+lAE9AY5pSod3xhKPrtxh2vzQXySdKNHgIsa/d5VW56FCDTYBIXj4Yd+vf
         XtPdVN4LsEWfC0NcrPhBRyn8Zs/EHBcZuDttbTCGszkcRGZIBfnuwTiNwLF88AuUZwsK
         WM4X4BboEaxjz/5rvZIfiY1YuivEiVlvsPjsxcqN2ljh62EKE/MzIuXiUEJz0U8Qb6bv
         yZtl8Q8TJ+Kd25h+TvhE7cPrN7htZZMDtHLRw6VpWyYBbBCh4Bi+H1VH5oSZQHANrxNv
         NZVvkw79EUuHYxMmw8Fd7BjHdqAliEIsrVaWpUaUm3dGS8wJI9spy8UVJjh5QnnZBv0Z
         qTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555304; x=1796160104;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kz0XauTGdOgnd6tw9kPNk/ldh50fDY3LEXEPBQT0ngw=;
        b=XVgTtojQij4w3s/tFrqh+n9ixrtb6PXkctidWH+we6yCaLrmJD6QMM5Khaw+O40WY2
         xnkMK+L8Ek7RioygmJS4m3ZqjumPanJyQaSXJ32m/mH9LOgCT4YW5SXMoIF86g7Zy6Nd
         L2TziXOA0KER6P/0m3ulaRbqrcEfMkzl24H6l4dQZyQOpfvho6yXVlvDcvnuTx2BYP6k
         sGsJbdC8G7QSVNYpzZQt5xw7U9C2qJeEnqsOkfRJyK9DUh6pwtCp6yhi32VFScicdvSU
         otuRux+e6BZwuYOvNHAaFWNSD/XNcNbfEHyWs22j4VBevZoVgTxd5kn9TStR/xW3dh/n
         7c0Q==
X-Forwarded-Encrypted: i=1; AL+hErGiMn8qayUvsEEQwTgZU/XYZihMUXwWFHjfGXI5mErOzMZGk6Neux/VVpy4n1L+4dmVG+pcbU5Advu0fo8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ziqdwg7OvxEljlj4wFXl/LVL2i25DO0NHCe7t8OcfDYAeYK9c
	JtOnvz4kVFCI6EV0D7RJJeLqLCk93PijGojGMbqyXKj8Bqu+DW8BW/c2xyzPQxzfqNLxB8QSOoH
	zlH4o6QVmA5Ia+weNL3q6K2CR/CQgYVQ=
X-Gm-Gg: AZFdTZeWDObCiMYZ+pX3xI9kfGCmPwxImsdoNMoBXcFv9TjougPTvW8aPkM5ZGIE3GD
	WSfj/qKAsBw150cet5viXL61r4NNCoaD8ntn++CLUTZtJQOTNdBA9XMUHR1gA5pUiNGyKl1gNZY
	w94CORmcRy5RzsyBSrwnjysj4iOs/ieV+JlJG3uXaCZNlL7e4abXgC2AM3hKbehBCbzVfoZvTgY
	2/652TacsTi4iijx1F+Zl6oIfS/O9CqMag4crmjMomvIOC/ups8WFaP/C/DrxJLxYffmFtcU4UU
	goxH0e/zZZyXKUpFBNuEbeot9VL3G7DWw936sfZ7HQckqb4T0g1aL85wbJDQVlexhrXyRsZCM8D
	4y0RiE+5jUKtxz4x+kKFgrTXBdGyUpmQBx0Em/upGdtQcb/D04YPUA1rzkIazAUgV9U2WTw==
X-Received: by 2002:a05:690c:6213:b0:8b4:dd2b:10dd with SMTP id
 00721157ae682-8b52050f0demr45322637b3.64.1795555303828; Tue, 24 Nov 2026
 13:21:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com> <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
 <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
In-Reply-To: <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:21:33 +0100
X-Gm-Features: Aa3M54qIikBwR4PI-ZQunVxuxoqfwLNl1dfjIK5NjVa_KqUN1kcswl51cnQYi_s
Message-ID: <CAFBinCAjFb7yS4VQp+BqLw2dG61To+iU4aiBvaVE9B9bWe=oUQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 12:06=E2=80=AFAM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> On 11/15/26 10:28 PM, Martin Blumenstingl wrote:
> > On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre=
.com> wrote:
> > [...]
> >> +       if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin=
", "FIFO"))
> >> +               return meson_card_set_fe_link(card, dai_link, np, fals=
e);
> > I suggest using the "audin" prefix. AIU / audin seem close enough on
> > all supported SoCs that we don't need a SoC generation prefix  in
> > there to handle this differently.
>
> Do you mean using "meson,audin" instead of "meson,gxbb-audin" for the
> compatible?
> If so I'm not sure this is allowed nowadays. As far as I understood
> "meson,aiu" is a sort of legacy naming. 'writing-binidings.rst' says
>
>    "DO use a SoC-specific compatible for all SoC devices [...]"
Let me use an example as I realize that I wasn't very clear:
  compatible =3D "amlogic,gxbb-audin", "amlogic,audin";
Does fulfill the criteria (as far as I understand it).
What doesn't work is "amlogic,audin" alone.

The GXL example then would be:
  compatible =3D "amlogic,gxl-audin", "amlogic,gxbb-audin", "amlogic,audin"=
;

And for Meson8/8b (sorry, I didn't get around to testing) I would then use:
  compatible =3D "amlogic,meson8-audin", "amlogic,audin";
  compatible =3D "amlogic,meson8b-audin", "amlogic,meson8-audin", "amlogic,=
audin";


Best regards,
Martin
