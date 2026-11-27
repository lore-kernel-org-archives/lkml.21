Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795770621;
	b=JMONULW+srX4ZY3ntbBif9aKEoTSahdxmcaA5dgDJlBm4iwDKiD3zVqk7YSSlZ51MFnb
	 0TkoSi2CDlgZeC2ORDeo/9xAjHFYfVuU+GLq4vY99fzVTwQjQFTyGh+pqU0ZHBKJ9HIhy
	 adiwdldlF1YZqK94N7IrUMaFIINyeiTY7lYiaT6Jow0mKAIVlnCzWpZjuVBu3F49Z6IqP
	 2kWWfaOH+iLGrzJD/yVX7SNpjJUCs7SjGWjxmoN0+1HhFqCGj/I4HznmS7O2qoI/DAvCS
	 0NAAo7MpAuURjCma+rMub61YxAaC0hfegFmzO1w6j559DyC41S0jskzN/LzpASrc3ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DJZqyiXYJp/ORTQv62jnN7SBWTU5iRS+KZCY7pRd8ZI=;
	b=MhISIIm5OKtB5IcnWjk2muWY2VJmXL8B5QzlK7zD5Qbzsk0ptih0BbWRhxtBma07nxvI
	 6ScUMoG6vzfs8JwwFzP8zr/dgUfUMjdb2JLXczpLT97JG8Hq0OxW5SrHRbpdih3X/tFnt
	 E6mjoJP5LjvK/kListSprZiCjKxpksZ/FDpd/Z/cT3Bi9oyEjii1WuVeMVVYIMqgS3kG8
	 uL8mW3C9WyfwnXUoEoLCOmwFfwoMXD9j9DBkEYLAXvFsb/ZpAukJ4MMSGV3iNhadCgsUI
	 jUNs7MliVQPZ0AYZO7vhZ2a1kKdDiSJ9X9T8iHjDqKDtC7zxD4btVEi79sVHJZ2J6lA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+ASaesM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BFD606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32BFD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+ASaesM
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3869f03af6aso6954668eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:10:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795770620; cv=none;
        d=google.com; s=arc-20260327;
        b=es83iIadjMUb0UWrkzfZ0I/1zS5mwC8MIAgq792qNmpqHi/ElL1Hgdw3F0Z/ikkfzz
         QZrcCb/nA56NjhQOrWyTgR9dG9kY4JDMaY1DuZMoEVQf47xqAoghZYl8/kjjHfwGXgGC
         MFVz7TEONSw7cUkzwnLJLM8M8JH+mwJVFT5G98ecMxV0D1LiLF+/Z69HxcGLZKHwcUFg
         YUtwVeROEPfZc3zJb7yJIriNHgG09mG4V1CpWY5ddURk9KH5ehpZ2pfX2w1bwFCgxAyq
         kqaRPSmXDVoTX2FbdEbxMMPhrPavGonykKjitiXVqRxgX07CGflu5/EQApnZz3raGuEH
         SL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DJZqyiXYJp/ORTQv62jnN7SBWTU5iRS+KZCY7pRd8ZI=;
        fh=7pYSUSAdonhHs90LE5WIzkODWcCWTl0xxyhlQPYVSRU=;
        b=NnxIbsfXcqcyUh6HSJn4sNr4wtMC0t0CLO8SD6zLzztN5+el5SLxlVlswLiISFz9yF
         MgvirvnMkO/Gq57Ad/NvYJRyDMe0TXaH43raH47A12sywJAzqoW123D+VTjkb6FnTr0M
         AMaRudy2tBEnG5QnJHgaNxBLvpbm6HPyZoZ9WDtiEn2hW7gvSyJEzp2bq7T241zrS9qV
         jS6CpaltiqOyrYXt6hXsiSvl6xxhkbsyO/9jobZE+hsXXd0hTlwZ6LxzKTo+dPw0Qr51
         86O1NiKLIQqSUVKzEVsOVTb0hxTB0DDvF0XdanvNAOkOOmYDz44T0i+dL6aknLrO7IXx
         jmug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770620; x=1796375420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DJZqyiXYJp/ORTQv62jnN7SBWTU5iRS+KZCY7pRd8ZI=;
        b=C+ASaesMaG8sC0jROZY8oTB1Syewggehc0t3fKW5tvM8R64+d6YV47sO3dHY5oW1kl
         XmeOUkTGBKZui/vWZV3pw6PbSImO2oWhBZEoua95m+Uj6bEQwzQPfK8mAr+yJIc0nxIA
         3t+mqwlePrggszdszBfVx6kYjFYqhPHMvqp3WrF7mipWdQOKToVl38/P/eC5SB0a2H+s
         qHpTRinrzmxMuGEdNCM+EtuZEEezMPkKtWeDskKvbztNbro71czf1RFFs966BWSl+9aK
         bWoOCrQnR8zNwclhqV/m47MmEvmqBb5OpUgnZ+giN8gHGvcflJzmTip8+H+Dcrf2S+KS
         ZZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770620; x=1796375420;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DJZqyiXYJp/ORTQv62jnN7SBWTU5iRS+KZCY7pRd8ZI=;
        b=zgoZ5uOvgICsjpQ814in5D4Lke1PZipZbzDCgnpr6b9qZxnGKefG360DpBh/yahkuX
         Ey3nIQpjQNSYKjsZFJPkPwEQos0zisiZtBE9p+t81rUXrSIPpR3xFOsur4dhRN/7kCCf
         zOmrH4f3K5r6PQ7yqWs80eOrxvFBdWXoMLmcOsPlOlgSWBD/snfMdBJDVswOXtpVwdTS
         2BPe93tLvjquPe8hd0DkpHItvU8bT7vzUsZkKNEDNN8LJHbjRG21uYxPqD7TW0+9aEsq
         nwp5tM/gvvEw0r5fz3b+jUNUgRRyH9hLGmj09jpd1KxTldeNYRupXBtP3g1F8Z/7j3QP
         zPBQ==
X-Forwarded-Encrypted: i=1; AL+hErHvT/MwTZvE4/VeIUVSpmX1sep95XeJqyfX1j7QCIQRDfua1pcEZxvSVaacpG55pS4aXYYImTVhvoLE3Mw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pM+z/7LnjMzk0KoHQPSKkCUqAcbTSpmhD6954Ctvp7zh0cTr8
	KBqT5c1lRUn9rGvqDMURs/UJjzEQAtAH1LiUYNAhnN/C2s7VRBHDT+YM8asqS0O2j1i+/BQjMiZ
	OoXsPRGArfQ2p4swqlcPzHEmlH60NWUI=
X-Gm-Gg: AZFdTZdMvaU148w2XMuegvBkD0OwxtB0o6OXoG+l0t8juzCfOfOexU6GIPm5q8jecsL
	Rewz8+K2qhLsduF0YXrGUSeCy0j0d9AcL4RGe+WSrWXqVyVGyELEVU90YBvrmYp0Q8a5H3olKGz
	dJs/rlSEgGB5kJWqwcIIOKhNPQoiLA0ebLtPFTW73vNsb5nLJ0oQQ//7t6FdsJR8oJT0DaGASJg
	+3AZ0lou5G2LjPZOSCLSlpxFNisESunWsou4KXUQDcc4iEFUK6po0yCEPm+y2cP1q+P5sPfvHPj
	ThrVnh5Cya7txznK4X/iMw95ZVLV7nb/j6Cd4wvqLQ0GBZTTKBLbLClbq3n6GR0dpyiek1+g9Ok
	tG5g9YIUWmJ9ajGG2mO1+1xawBKgXOUcM/QoVQb6yxZ+F1dgbpiVyil/qMlilO6vZtXW5ZtR7xe
	Xq1yHkppMNr3dFTp70l/nN3Js68UIZLw64GRNe/uFw3x/Am8hNgmc=
X-Received: by 2002:a05:7300:a228:b0:386:6685:1492 with SMTP id
 5a478bee46e88-386668523cfmr22742277eec.12.1795770620255; Fri, 27 Nov 2026
 01:10:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <20261122081820.53199-3-clamor95@gmail.com>
 <hlO8KiQKSi62yShZAIyhpw@nvidia.com>
In-Reply-To: <hlO8KiQKSi62yShZAIyhpw@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 11:10:08 +0200
X-Gm-Features: Aa3M54rkyrHWlpK4-CIwvCUcDLkbHyRjNHzHood9SyBQos7xlCctA1vsn6y0klI
Message-ID: <CAPVz0n0Qyekm7qUyCVFMTDSuVSw=1my4x-rgiafp3+mQ_sgk3Q@mail.gmail.com>
Subject: Re: [PATCH v8 02/12] drm/panel: panel-hitachi-tx10d07vm0baa: Convert
 to use MIPI DBI bus
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 06:2=
3 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Switch from a generic platform driver to a dedicated MIPI DBI Type B
> > driver.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 25 +++++++++----------
> >  1 file changed, 12 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/driv=
ers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > index 83c2af1be9755..318ece68b7806 100644
> > --- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > +++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > @@ -14,6 +14,7 @@
> >  #include <video/mipi_display.h>
> >
> >  #include <drm/drm_mipi_dbi.h>
> > +#include <drm/drm_mipi_dbi_bus.h>
> >  #include <drm/drm_modes.h>
> >  #include <drm/drm_of.h>
> >  #include <drm/drm_panel.h>
>
> You should now be able to get rid of includes of of_platform.h
> (replacing with of.h) and platform_device.h. Agent says drm_of.h and
> property.h are also unused.
>
> > @@ -25,7 +26,7 @@ static const struct regulator_bulk_data hitachi_tx10d=
07vm0baa_supplies[] =3D {
> >
> >  struct hitachi_tx10d07vm0baa {
> >       struct drm_panel panel;
> > -     struct mipi_dbi *dbi;
> > +     struct mipi_dbi_device *dbidev;
> >
> >       struct regulator_bulk_data *supplies;
> >       struct gpio_desc *reset_gpio;
> > @@ -40,9 +41,10 @@ static inline struct hitachi_tx10d07vm0baa *to_hitac=
hi_tx10d07vm0baa(struct drm_
> >  ({ \
> >       const u8 d[] =3D { seq }; \
> >       struct drm_panel *panel =3D &(priv)->panel; \
> > +     struct mipi_dbi_device *dbidev =3D (priv)->dbidev; \
> >       struct device *dev =3D panel->dev; \
> >       int ret; \
> > -     ret =3D mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_SIZE=
(d)); \
> > +     ret =3D mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRAY_SI=
ZE(d)); \
> >       if (ret) \
> >               dev_err_ratelimited(dev, "error %d when sending command %=
#02x\n", ret, cmd); \
> >       ret; \
> > @@ -54,10 +56,6 @@ static int hitachi_tx10d07vm0baa_prepare(struct drm_=
panel *panel)
> >       struct device *dev =3D panel->dev;
> >       int ret;
> >
> > -     priv->dbi =3D dev_get_drvdata(dev->parent);
> > -     if (!priv->dbi)
> > -             return -ENODEV;
> > -
> >       gpiod_set_value_cansleep(priv->reset_gpio, 1);
> >
> >       ret =3D regulator_bulk_enable(ARRAY_SIZE(hitachi_tx10d07vm0baa_su=
pplies), priv->supplies);
> > @@ -243,9 +241,9 @@ static const struct drm_panel_funcs hitachi_tx10d07=
vm0baa_panel_funcs =3D {
> >       .get_modes =3D hitachi_tx10d07vm0baa_get_modes,
> >  };
>
> Unnecessary semicolon here.
>
> >
> > -static int hitachi_tx10d07vm0baa_probe(struct platform_device *pdev)
> > +static int hitachi_tx10d07vm0baa_probe(struct mipi_dbi_device *dbidev)
> >  {
> > -     struct device *dev =3D &pdev->dev;
> > +     struct device *dev =3D &dbidev->dev;
> >       struct hitachi_tx10d07vm0baa *priv;
> >       int ret;
> >
> > @@ -264,6 +262,9 @@ static int hitachi_tx10d07vm0baa_probe(struct platf=
orm_device *pdev)
> >               return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> >                                    "Failed to get reset gpio\n");
> >
> > +     priv->dbidev =3D dbidev;
> > +     mipi_dbi_set_drvdata(dbidev, priv);
> > +
> >       ret =3D drm_panel_of_backlight(&priv->panel);
> >       if (ret)
> >               return dev_err_probe(dev, ret, "Failed to get backlight\n=
");
> > @@ -272,9 +273,7 @@ static int hitachi_tx10d07vm0baa_probe(struct platf=
orm_device *pdev)
> >       if (ret)
> >               return dev_err_probe(dev, ret, "Failed to add panel\n");
> >
> > -     platform_set_drvdata(pdev, priv);
> > -
> > -     return 0;
> > +     return devm_mipi_dbi_attach(dev, dbidev);
> >  }
> >
> >  static const struct of_device_id hitachi_tx10d07vm0baa_of_match[] =3D =
{
> > @@ -283,14 +282,14 @@ static const struct of_device_id hitachi_tx10d07v=
m0baa_of_match[] =3D {
> >  };
> >  MODULE_DEVICE_TABLE(of, hitachi_tx10d07vm0baa_of_match);
> >
> > -static struct platform_driver hitachi_tx10d07vm0baa_driver =3D {
> > +static struct mipi_dbi_driver hitachi_tx10d07vm0baa_driver =3D {
> >       .driver =3D {
> >               .name =3D "panel-hitachi-tx10d07vm0baa",
> >               .of_match_table =3D hitachi_tx10d07vm0baa_of_match,
> >       },
> >       .probe =3D hitachi_tx10d07vm0baa_probe,
> >  };
> > -module_platform_driver(hitachi_tx10d07vm0baa_driver);
> > +module_mipi_dbi_driver(hitachi_tx10d07vm0baa_driver);
> >
> >  MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> >  MODULE_DESCRIPTION("HITACHI TX10D07VM0BAA MIPI DBI Type B panel driver=
");
> > --
> > 2.53.0
> >
> >

I agree that your suggestions are ok, but they are out of scope of
this patch. They would require either dedicated commits or can be sent
as followups later on since they do not cause bugs.
