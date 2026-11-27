Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795784921;
	b=cD7QKuNnrAJhtNlJElUSsFxOem1N+CQyrjVm9ZFWBTAHfI9zLpRC4UazU6LSnBfw6dze
	 uCrwgUN7h1PDxY9dlOapzCyoxnCuJ7yhjkKlVTrO+S4e6Wv/JhcfMi7KF6LvpJn5AoY5U
	 aVKkaAN7aqdeeu/nNKHgfurMNmpNZMpy21KGQpAZ6/shh3Ix1jkord3KKip5AdBWkeLll
	 PcObwNBzPNVbHXEA5l/6Tar6iIDSj4cxZTgHFOVcwHKLhP/WG54KRHKyCJ119QTCA3glV
	 R0JZQUjgH8vU679kN6LQR9rxEMb5NgJJ/V2yb+c1YEvHFxV2pUxRA5eLDhCVx2cTrbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C0gaW0T//VOtwOuwTFVY9WwABc2rEZBaWTGdLWhFohw=;
	b=U61gJIGGAIl0SgxvjZcml+wzzLzDy0qQMZNiQhrbayJcAb8cdsjjdZXsUFgq44BkUIEq
	 6UpdjIWpXMN3QAsf6+8VRzTtp+9aQ35UzGF7tlkf2MIMk8Ge5mUK2mhrzu2xoBoZxWsfx
	 7l6B66J0YQX9drpfSjeC1C1c3uwHH0d7YBwqPevDP8hVIXnMUihqDv159iFtC0ewCiCfo
	 B0WYSlZPJ3OjjFvKt/EdcnOshlKd05wdDYiBmkuxi7xLnFwLlbkMamVlLAmJ3pGaD6yC5
	 Lyipc9TSUlQfTNLrvht/PWnYz7LphNje5xIK27G8rcgzkdcihEjBDOqGx8y6PDfmH0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=chi5MtYr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF31B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF31B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=chi5MtYr
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3863db981d4so11360998eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:08:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795784920; cv=none;
        d=google.com; s=arc-20260327;
        b=Zmc0r1JDI80bg3M7l26Ky2Vs795zEwoWC7vXFFFmgRNDagK3GfviAdTpjkal76YkKi
         hChdUJvysayhATR6WsyqLlJN1cZru9xdfEnxGXvjQVr4WyrdM1BVuQ1TDIiTFhDQf0cp
         xSJK26vrZ2rE/w/bm07x113qou0wljyTK3cvXtBGVuZCttXvFYvqtoKq8Iw+Ib7nE0h9
         1reUZ1Q1aD7PlxRLy/M83TPXxdFsbN8cofzWpeHOozAkZX7ri36Fqf1OQz2yJ/SiAQoj
         lKgHMvy/scg9G+en79YNjZwOdnyAa2X1/fZZJBV9lM6lXhhulkkbO7qtyNsF4N6vX+iM
         0Y7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C0gaW0T//VOtwOuwTFVY9WwABc2rEZBaWTGdLWhFohw=;
        fh=STz3OS/WimS7uU8PK8KIBfxv2yF0DKLNQCbnS6V3Q5Y=;
        b=YWkYDfPBX2vmoGVgoSI1IcRZsAuskUSwcBH3G2F8Ki1w5W4iJIfIuiZdUD3+hVYqhC
         OmLOsDxaApyqrP2e3RLXkcSV7zlfmor1lBVoTaFox/Ile9zqS8VjkB3az42oalbc3bk+
         HTiOim1FpX1hAi8jnNk1dR710xJEuj5S+BYYWcJxZ4K0IJzA53/PeQfQNhlc0F9lvIAh
         /TJJEN1y6canfc18h4IW47b9ARd6cP2LHR+6XdyeeziQ2of/xnuu9B8HpJjbTHOxBKfQ
         RAwsUGVLQgU7ijGJcjHccRXFX0LeVvpcqpdUtwtTvCbvl/YlFetiqN1LsKR6HYKRsBnl
         A6lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795784920; x=1796389720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0gaW0T//VOtwOuwTFVY9WwABc2rEZBaWTGdLWhFohw=;
        b=chi5MtYr3koVFYMUEYFb/9Z33Tg5jvqNFv7PQiVYP6JtHQogg71xigG6+9IKUkLflg
         5tqXonZxZKCkPH7LxzxdtM6eT0IjqnV1tNiKt6S/wqjgcVPvklq2RPIPm10uVPKTjS5f
         vgBQ7ihJ6JxXsHRy+TG14neqjBL/5CWUhbW5dnzciv0/SQgdXH4jHo8+3ZbhVgTe3jnC
         NGdYvemtb1U5RQDiqiCJ+0iIM2aQt4Z1YzhvIOx4MfLGYD6OpXoUM34mXC80iizWZ01X
         xw7wTF8k91xdsblalCvkUSKdLNlC7qGCgU8XGuwGjwXJVM+S1N8o+VXIpSGYS0oveZcu
         NOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784920; x=1796389720;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0gaW0T//VOtwOuwTFVY9WwABc2rEZBaWTGdLWhFohw=;
        b=GJf8xeOsEuGHnGnWqr6DmhJ3FUUH4A0ieCoisyXWQPdQDNWtHbCNBoD+0qSgGuWwsT
         Rzr8nRMxo61QBBlpylfUmCnPHnhG6TNCNJnGPS/mqqA5usgrG/O8tgiN/er8Ycfe4ovD
         vz7ekPT1ovBSxgAc0E0j/cM2Jn8rwTv72lU/ot0fnDyGS63RcK1tGeBWwzR44fw38DBN
         OVx/2mRIYu9/buW6j4JaUkSEHf1K2gfL50zUwUwXNKKoOiIvGhNy6I6dDeNwL5Ca7wf8
         jXDZhHgYailZdgfS9kk/7osouUAYLrTp3AcfP29/lNgHpDsbtCbJaEeEM0Dc7/CYrYJI
         mCmg==
X-Forwarded-Encrypted: i=1; AL+hErHOWUzAsvXU0gPBYoSiI8pBrAHO8dkAxfndMyRnrwPmjow/6f4hy3a6kl7lX3zgnYeZ/AmJ1Jd/237LiBU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DtGN7Z0EijHZxuU/AiigilQNc3cYcKTMfbqpv0pW6Qjj/9YB7
	EDejpfN+QKxBwo67OgMfI6MQjH99mAI/SlB6AzzJCqm0B6VBhhynZIWUdaRrIxnD0iqpwxgi2IL
	K+OBt2VIlYZ1Ro4fdM/dultj1AotH3Ic=
X-Gm-Gg: AZFdTZcg6jA+dp0BQOnHsK0FgkKdlDciqm/soszeVy6RRbXOigJtWlbtc0yBxRgYVAS
	FEsIkhyYtXiDcy6Ph7Dg4gphsl9QrHDFebIsy+B41R0lDyXG9L3cJaHukE1bYVQdRqd4ivqrtZE
	mf4YVKlAcf3Zca1tgm8+spEciQyAwJtYawlqmf8i52VZ4eJ1KNm1afQZ/kDjzJJxoMkMSW0Koi/
	3eQUxRZIK3UPCLpveYgGyJ+1lkgD0Q4M7KfzXmNt9iVM+CAeCOW5WWUNQm+/qP7GhhxWUcoHIpb
	sVSm3KwPF2hhnGlbXQArZejQyUDnvhqgz3SMuY2MLP2LSBPLlre/ngaI487s97lbGF+tzpjRJcM
	QymWVYgklmVtXKfuvRGmrmx88U2c9ZkiFVH7ONx3wqfr+MXBqcVed1E8jGUk1x2naDUGgBAyw4C
	mGZ+NSHEerx8LJolMei30vuqbcFpu8GCQ=
X-Received: by 2002:a05:7301:10c4:b0:386:d310:4c1c with SMTP id
 5a478bee46e88-386d3104c52mr9700616eec.21.1795784919819; Fri, 27 Nov 2026
 05:08:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <hlO8KiQKSi62yShZAIyhpw@nvidia.com>
 <CAPVz0n0Qyekm7qUyCVFMTDSuVSw=1my4x-rgiafp3+mQ_sgk3Q@mail.gmail.com> <uQ14beL2SOumMxaLqMFc4w@nvidia.com>
In-Reply-To: <uQ14beL2SOumMxaLqMFc4w@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 15:08:28 +0200
X-Gm-Features: Aa3M54qgDXor0Xf9K6XHdCJ3yIc8SRM3BWawDQskrGgi0w7vMixGfnu5GIJLqUQ
Message-ID: <CAPVz0n3hT2qGag=CzH6JimHpWVqTC-B1p=7n5U9SPP7UHyeGdA@mail.gmail.com>
Subject: Re: [PATCH v8 02/12] drm/panel: panel-hitachi-tx10d07vm0baa: Convert
 to use MIPI DBI bus
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:2=
0 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, November 27, 2026 6:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
06:23 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > Switch from a generic platform driver to a dedicated MIPI DBI Type =
B
> > > > driver.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 25 +++++++++------=
----
> > > >  1 file changed, 12 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/=
drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > > index 83c2af1be9755..318ece68b7806 100644
> > > > --- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > > +++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > > @@ -14,6 +14,7 @@
> > > >  #include <video/mipi_display.h>
> > > >
> > > >  #include <drm/drm_mipi_dbi.h>
> > > > +#include <drm/drm_mipi_dbi_bus.h>
> > > >  #include <drm/drm_modes.h>
> > > >  #include <drm/drm_of.h>
> > > >  #include <drm/drm_panel.h>
> > >
> > > You should now be able to get rid of includes of of_platform.h
> > > (replacing with of.h) and platform_device.h. Agent says drm_of.h and
> > > property.h are also unused.
> > >
> > > > @@ -25,7 +26,7 @@ static const struct regulator_bulk_data hitachi_t=
x10d07vm0baa_supplies[] =3D {
> > > >
> > > >  struct hitachi_tx10d07vm0baa {
> > > >       struct drm_panel panel;
> > > > -     struct mipi_dbi *dbi;
> > > > +     struct mipi_dbi_device *dbidev;
> > > >
> > > >       struct regulator_bulk_data *supplies;
> > > >       struct gpio_desc *reset_gpio;
> > > > @@ -40,9 +41,10 @@ static inline struct hitachi_tx10d07vm0baa *to_h=
itachi_tx10d07vm0baa(struct drm_
> > > >  ({ \
> > > >       const u8 d[] =3D { seq }; \
> > > >       struct drm_panel *panel =3D &(priv)->panel; \
> > > > +     struct mipi_dbi_device *dbidev =3D (priv)->dbidev; \
> > > >       struct device *dev =3D panel->dev; \
> > > >       int ret; \
> > > > -     ret =3D mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_=
SIZE(d)); \
> > > > +     ret =3D mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRA=
Y_SIZE(d)); \
> > > >       if (ret) \
> > > >               dev_err_ratelimited(dev, "error %d when sending comma=
nd %#02x\n", ret, cmd); \
> > > >       ret; \
> > > > @@ -54,10 +56,6 @@ static int hitachi_tx10d07vm0baa_prepare(struct =
drm_panel *panel)
> > > >       struct device *dev =3D panel->dev;
> > > >       int ret;
> > > >
> > > > -     priv->dbi =3D dev_get_drvdata(dev->parent);
> > > > -     if (!priv->dbi)
> > > > -             return -ENODEV;
> > > > -
> > > >       gpiod_set_value_cansleep(priv->reset_gpio, 1);
> > > >
> > > >       ret =3D regulator_bulk_enable(ARRAY_SIZE(hitachi_tx10d07vm0ba=
a_supplies), priv->supplies);
> > > > @@ -243,9 +241,9 @@ static const struct drm_panel_funcs hitachi_tx1=
0d07vm0baa_panel_funcs =3D {
> > > >       .get_modes =3D hitachi_tx10d07vm0baa_get_modes,
> > > >  };
> > >
> > > Unnecessary semicolon here.
> > >
> > > >
> > > > -static int hitachi_tx10d07vm0baa_probe(struct platform_device *pde=
v)
> > > > +static int hitachi_tx10d07vm0baa_probe(struct mipi_dbi_device *dbi=
dev)
> > > >  {
> > > > -     struct device *dev =3D &pdev->dev;
> > > > +     struct device *dev =3D &dbidev->dev;
> > > >       struct hitachi_tx10d07vm0baa *priv;
> > > >       int ret;
> > > >
> > > > @@ -264,6 +262,9 @@ static int hitachi_tx10d07vm0baa_probe(struct p=
latform_device *pdev)
> > > >               return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> > > >                                    "Failed to get reset gpio\n");
> > > >
> > > > +     priv->dbidev =3D dbidev;
> > > > +     mipi_dbi_set_drvdata(dbidev, priv);
> > > > +
> > > >       ret =3D drm_panel_of_backlight(&priv->panel);
> > > >       if (ret)
> > > >               return dev_err_probe(dev, ret, "Failed to get backlig=
ht\n");
> > > > @@ -272,9 +273,7 @@ static int hitachi_tx10d07vm0baa_probe(struct p=
latform_device *pdev)
> > > >       if (ret)
> > > >               return dev_err_probe(dev, ret, "Failed to add panel\n=
");
> > > >
> > > > -     platform_set_drvdata(pdev, priv);
> > > > -
> > > > -     return 0;
> > > > +     return devm_mipi_dbi_attach(dev, dbidev);
> > > >  }
> > > >
> > > >  static const struct of_device_id hitachi_tx10d07vm0baa_of_match[] =
=3D {
> > > > @@ -283,14 +282,14 @@ static const struct of_device_id hitachi_tx10=
d07vm0baa_of_match[] =3D {
> > > >  };
> > > >  MODULE_DEVICE_TABLE(of, hitachi_tx10d07vm0baa_of_match);
> > > >
> > > > -static struct platform_driver hitachi_tx10d07vm0baa_driver =3D {
> > > > +static struct mipi_dbi_driver hitachi_tx10d07vm0baa_driver =3D {
> > > >       .driver =3D {
> > > >               .name =3D "panel-hitachi-tx10d07vm0baa",
> > > >               .of_match_table =3D hitachi_tx10d07vm0baa_of_match,
> > > >       },
> > > >       .probe =3D hitachi_tx10d07vm0baa_probe,
> > > >  };
> > > > -module_platform_driver(hitachi_tx10d07vm0baa_driver);
> > > > +module_mipi_dbi_driver(hitachi_tx10d07vm0baa_driver);
> > > >
> > > >  MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> > > >  MODULE_DESCRIPTION("HITACHI TX10D07VM0BAA MIPI DBI Type B panel dr=
iver");
> > > > --
> > > > 2.53.0
> > > >
> > > >
> >
> > I agree that your suggestions are ok, but they are out of scope of
> > this patch. They would require either dedicated commits or can be sent
> > as followups later on since they do not cause bugs.
>
> I don't see why the include changes are out of scope. The platform
> driver was including platform includes but now it's no longer a platform
> driver so it shouldn't include platform driver stuff. The rest are minor
> enough that I think they can be included as well.
>

I can remove headers, sure. Regarding semicolon, here is a bigger code frag=
ment

 static const struct drm_panel_funcs hitachi_tx10d07vm0baa_panel_funcs =3D =
{
    .prepare =3D hitachi_tx10d07vm0baa_prepare,
    .enable =3D hitachi_tx10d07vm0baa_enable,
    .disable =3D hitachi_tx10d07vm0baa_disable,
    .unprepare =3D hitachi_tx10d07vm0baa_unprepare,
    .get_modes =3D hitachi_tx10d07vm0baa_get_modes,
};

- static int hitachi_tx10d07vm0baa_probe(struct platform_device *pdev)
+ static int hitachi_tx10d07vm0baa_probe(struct mipi_dbi_device *dbidev)
{
- struct device *dev =3D &pdev->dev;
+struct device *dev =3D &dbidev->dev;
struct hitachi_tx10d07vm0baa *priv;
int ret;


>
>
