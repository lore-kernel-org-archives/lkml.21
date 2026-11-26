Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795695621;
	b=UOdqifgY1bKWSdSTnQIZ21IjFrE2PCRuTTEUXOCvVTbdok4N3I7StkoyiPomnbhyyjgq
	 09LF3PwsxHhwZPxtqPPBTfJQ1TYHD8GD4/DZY+lr18vkcI+tJ/kRtJ7+/jDIYGIomIQB9
	 W/8cgHWZzX6fbSlY1ivfPHtXLc9YPmmtGP636CBk0oxLUUd7opI1wVwvRSQ2SiyuhPZua
	 LX6FcXH865SzaZrRKYo+m8ugeB9ZYLNgbk5YoHyjHKXWbFQzutF4NkZHw/P0gs1umJQoe
	 eCbSksj6wiH2si63TWgr3B+h71+x2YqaNTlMX1dsl4uM1YvEa5ZnGHGaefhoyYsjg6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+lSvuZp8Y17eXoO25lsbfQdbZJVTJnq/pMdU2BkHd48=;
	b=5nnALQrx89yGqi20L2DGIVdNEF1iWc5UjYOlrDyTy652nBbe7TXM4bVHUPurTJodAn+P
	 GpMFg8QXVq4WvdH6gSZRnm5WmPrdq4XRzsR0PVDwLln3Oq/ZWLXoIKjbVs79asaLAUhuw
	 ExzIQhra95KrWNPJEB1hhuI/icEnrRmubxn76vKQVVbXJqcVpCH+pX7QutOolH4nVynI8
	 Sad5AH9RQjxm1yR/RJ/g+zb9LIMBYVn2YN93tblvL39i3UWPPbVTYRm8jxdiXw0B+VN4X
	 H66B4rLVV6dgCLTrh7T0mJ4IaK41dZTIK94kMBzo6IMqFZZ3rahzn+sklceqZwCitrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UlaG+/e8";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058AB606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 058AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UlaG+/e8
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3863db981d4so9794452eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:20:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795695620; cv=none;
        d=google.com; s=arc-20260327;
        b=fKPXIXdfMecS+1mYd65osh1E/WoRMi7Ppt451/HgNo5TbjR3IAXUUC/Be+GDBt6zq2
         MYPBJlbG4lvUkHAmZY8N2cNkzLUk8ZAvEhLdLA54NppuBYL7S0LgBN09aOO+nWUMfPW9
         IljdvknKQIO9V+LLEZ7s+MK4r+x1Vk3H3TEF21hlL+OolftmdRh987aUCmOABNiSlAxR
         kSkfvi1Roj8G3Y8TYD2hph1JgOxZ8R8wD3uhc0P8vAOXDkBTquDJT00Pk7bb94MIPygE
         OYDJ2aWsQoy/Zwp6BfOQk6egTM1B9I9lUgm7PQsPUBXI2dy8FYFjvEMCZEvBVYumnLFA
         k6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+lSvuZp8Y17eXoO25lsbfQdbZJVTJnq/pMdU2BkHd48=;
        fh=F/WmoXWj0p2K67tbAB7TYYnU16lbCzqJZakB6UfsBTo=;
        b=X/PN8r6AsGKL8pbZLDcgSTtzQJpRXqRLicRRtPkP9mxtOkefUzue7ae7LF1FvXYmYQ
         coHlXdyi8RKxPXjLWNCndJ8QlkoEek+vTvlVljbz/qcfL5H0LsnTsMjQNFHkmQ19DyW4
         yeG3Sd+rQpwOicX01VDk3YpHSJ3LQiozfST1tPglUuNDDiYnbvaAxoH/4mKdzw5U4zX0
         8okYjcVlbP+/s7Q/7dxLRdYk1ENA416D/VXe2GNN3p2IJpgTefsn0fvlClDyiOSOjZFs
         l9z7LnfzFE1g9g8VxDPkUzsr0jW9twyT3m3ztdzv7KbAHBd10i2A6zFLMQo949Oa3/n+
         13TA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695620; x=1796300420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+lSvuZp8Y17eXoO25lsbfQdbZJVTJnq/pMdU2BkHd48=;
        b=UlaG+/e82l2AjomShygNKH/4y/HwtzYOoUI7zeBT0PWO6OWZm2i6LeI9evsqpKyp5b
         khnkoneCcNjZKC0QfqncH522M9OzVV9qSLcWDS2nP+dmA1u3GxFS5fSTAw5LnPe/VG+E
         N0L8KqiKbFAKzbttgM6OdAV3Lb9dhKETJkGfbu9nh5gsRWR7tBUe6WuKKIckaoJVOJ/L
         RHevXeFqAy7AxPANSVu9r08rWy/Tn/s8w1PBnC1LuVla8x9INDGxPnRsNYU/GOjif3EV
         rHHSKJmght1HjBB9PqlmGTvj+GNPlQ/B5K3EqNe7are3gkZVL0CWgx9kX8sM83Pf1ALC
         uDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695620; x=1796300420;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+lSvuZp8Y17eXoO25lsbfQdbZJVTJnq/pMdU2BkHd48=;
        b=AQN0+Y3w5MbawVjOUR9fj0SwbhNhutTS3HD2CrSWQdkVpxM6B3B8Qw0mLkim+owIQ1
         SCrJjEBs8UbbuCkpd5F0KFrnHmyCxn34PG93emUTHpHjqWPlfrs9WXQAJhzByJgiX++4
         FqxvJVDij4yukHvn6SsJdIyQW/0/EpzJJ6D6XbTNtvm/hHc1xfJnYV5EADHyl3JbKG32
         Bosg76dq7sty0nBHxNY6CWWZMSvHxTJFc7aWPLAn4KJcfZYx/hXucD8HCFhLFqYyKCNg
         SI8LSOCHxVgIyElaUmp6qgOIOsj1UJPklrICTj+bQJVOODctny5fv6fB57lewqxwnIMI
         3v1g==
X-Forwarded-Encrypted: i=1; AL+hErEm4gCs4SjaDyqphpiDPyeID45dQ4Q1j4Afm90ggP1LliQEf3bs9C805XTUxMpc13snTkxrFT/sQa3NbF8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+b7QHqoEmRS1K6Np2Osrp3uyPY40SIPP7xDHRMDb/NLjlX7UmR
	vamwskV8ahw8ucR61pdsk9xOczFY5JG8VmCB2KSEplteZ3Gxx1um7VcfhxUuvuZsN3kESg4R0u8
	pLHKpN23F9BTshc3BB90zQ9Ybr5xgdXU=
X-Gm-Gg: AZFdTZfsvLOQWeTnsF+2tcLvan5IV2Iwq3R9mwjCxLQ3UpnEh5JAv7AN8PA/0ma5t33
	WKNdgYW9ETHxKKPsnl9Txd11mSUntRSPT7sONKjceFencrz7Aerb4OYQ4VPrkF3dZGrbuYzd1lF
	tXYQU9qocFlxcQDEyEip2JhtrCvUgMfkMELYRS2oaosgxqNb5xhklELS1W/pIN6zpFntdwbSG0m
	kICowLprtCO9iHazRP5++LjV4XymFHMOnYN1fl7O21TIFdKldDx9wjbNkdOfvlStkyPti2N13dR
	rWNWhzorBM3w9+vPa5pWLWwCS3SotzjYng8v+UugcibZHm78GJecJPGw7gH8FK0TrZhrN+HzOs1
	kl9vGd4hMYdUJRRcMP8Nj1i1x6oC2TCqjGZc2e4ukK7kYqXpXnIlUEDWj4JlELtsnkv6PhYxUlQ
	cn3H5mR1G3kG1wPBOLYsPuweWqZ3hG62XwE4SHR5z81a9/rqm61f4=
X-Received: by 2002:a05:7301:929:b0:376:37a2:87f3 with SMTP id
 5a478bee46e88-38570f25262mr19450186eec.31.1795695620162; Thu, 26 Nov 2026
 04:20:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115085155.80043-1-clamor95@gmail.com> <20261126114506.GF38590@joneslee-macbookpro.roam.internal>
In-Reply-To: <20261126114506.GF38590@joneslee-macbookpro.roam.internal>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 14:20:08 +0200
X-Gm-Features: Aa3M54qVnLT4LX9aypLg829C8Q--H88cVFtiIS6wh8smfquZHuMzs0sW-CXGNDk
Message-ID: <CAPVz0n1QApS9Y67WH1xJ34wg9AWz+RQ0DXEd5jAPEnAw=cTd2g@mail.gmail.com>
Subject: Re: [PATCH v3] video: leds: backlight: lm3533: Support getting LED
 sources from DT
To: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:4=
5 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 15 Nov 2026, Svyatoslav Ryhel wrote:
>
> > Add Control Bank to HVLED/LVLED muxing support based on the led-sources
> > defined in the device tree.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
> > ---
> > This was part of the original LM3533 controller DT/OF conversion patchs=
et,
> > but it appears to have been accidentally separated during the final ite=
ration.
> > Therefore, I am sending it as a follow-up.
> >
> > Changes in v2:
> > - leds: switch to macros in regmap_update_bits() calls to apply 0xff ma=
sk
> >   since regmap writes may cause unwanted writing.
> >
> > Changes in v3:
> > - leds part moved into a separate patchset
> > - switched to dev_err_probe()
> > - for loop moved out of if condition
> > ---
> >  drivers/video/backlight/lm3533_bl.c | 44 +++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >
> > diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backli=
ght/lm3533_bl.c
> > index fd6e7f4f1f61c..cb9df6ff73001 100644
> > --- a/drivers/video/backlight/lm3533_bl.c
> > +++ b/drivers/video/backlight/lm3533_bl.c
> > @@ -7,6 +7,7 @@
> >   * Author: Johan Hovold <jhovold@gmail.com>
> >   */
> >
> > +#include <linux/bits.h>
> >  #include <linux/module.h>
> >  #include <linux/init.h>
> >  #include <linux/platform_device.h>
> > @@ -21,6 +22,7 @@
> >  #define LM3533_HVCTRLBANK_COUNT              2
> >  #define LM3533_BL_MAX_BRIGHTNESS     255
> >
> > +#define LM3533_REG_OUTPUT_CONF1              0x10
> >  #define LM3533_REG_CTRLBANK_AB_BCONF 0x1a
> >  #define   CTRLBANK_AB_BCONF_ALS(n)   BIT(2 * (n))
> >  #define   CTRLBANK_AB_BCONF_MODE(n)  BIT(2 * (n) + 1)
> > @@ -35,6 +37,9 @@ struct lm3533_bl {
> >       u32 max_current;
> >       u32 pwm;
> >
> > +     int num_leds;
> > +     u32 led_strings[LM3533_HVCTRLBANK_COUNT];
> > +
> >       bool have_als;
> >       bool linear;
> >  };
> > @@ -236,6 +241,8 @@ static const struct attribute_group *lm3533_bl_attr=
ibute_groups[] =3D {
> >  static int lm3533_bl_setup(struct lm3533_bl *bl)
> >  {
> >       int ctrlbank =3D lm3533_bl_get_ctrlbank_id(bl);
> > +     u32 output_cfg_val =3D 0;
> > +     u32 output_cfg_mask =3D 0;
> >       int ret;
> >
> >       ret =3D regmap_assign_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCO=
NF,
> > @@ -243,6 +250,21 @@ static int lm3533_bl_setup(struct lm3533_bl *bl)
> >       if (ret)
> >               return ret;
> >
> > +     for (int i =3D 0; i < bl->num_leds; i++) {
> > +             if (bl->led_strings[i] >=3D LM3533_HVCTRLBANK_COUNT)
> > +                     continue;
> > +
> > +             output_cfg_val |=3D ctrlbank << bl->led_strings[i];
> > +             output_cfg_mask |=3D BIT(bl->led_strings[i]);
> > +     }
> > +
> > +     if (bl->num_leds) {
> > +             ret =3D regmap_update_bits(bl->regmap, LM3533_REG_OUTPUT_=
CONF1,
> > +                                      output_cfg_mask, output_cfg_val)=
;
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> >       ret =3D lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current)=
;
> >       if (ret)
> >               return ret;
> > @@ -320,6 +342,28 @@ static int lm3533_bl_probe(struct platform_device =
*pdev)
> >
> >       device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &bl->p=
wm);
> >
> > +     /*
> > +      * If led-sources property is not set then either this Control Ba=
nk uses
> > +      * its default HVLED or is not linked to any HVLED at all.
> > +      */
> > +     bl->num_leds =3D device_property_count_u32(&pdev->dev, "led-sourc=
es");
> > +     if (bl->num_leds > LM3533_HVCTRLBANK_COUNT)
> > +             return dev_err_probe(&pdev->dev, -EINVAL,
> > +                                  "num of LED sources %d exceeds max %=
d\n",
>
> Nit: As I mentioned before, this is user-documentation - should be number=
?
>

Daniel Thompson was fine with num

> > +                                  bl->num_leds, LM3533_HVCTRLBANK_COUN=
T);
> > +
> > +     if (bl->num_leds < 0)
> > +             bl->num_leds =3D 0;
> > +
> > +     if (bl->num_leds > 0) {
> > +             ret =3D device_property_read_u32_array(&pdev->dev, "led-s=
ources",
> > +                                                  bl->led_strings,
> > +                                                  bl->num_leds);
> > +             if (ret)
> > +                     return dev_err_probe(&pdev->dev, ret,
> > +                                          "failed to get led-sources\n=
");
> > +     }
> > +
> >       ret =3D lm3533_bl_setup(bl);
> >       if (ret)
> >               return ret;
> > --
> > 2.53.0
> >
>
> --
> Lee Jones
