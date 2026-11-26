Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795696381;
	b=EXyykD3zJugme2OaJPF91SHMAPgvUSLQyJV5WcmhhE4k4D4hn60wtkLkurLy2SXt33/a
	 G9A9OqB+XrFRNj9ZNhscy65vkRzDf0lba6/RCsPAXs2J+hfWFOoh1FhXPwbj1yMb7dB+B
	 Tq0fR4w2vQw6eA/mGO0nSML8iR5Xx9r/1AzOsjLFUMoqPO/yj3BROloGP9rJiy+nY/qIC
	 8QILq6rwJUvraMLp0hiLqtEb8yvDgrfQvuc/FKmjwQl5pEQe8+7TWsr0f3ocjiezBnZur
	 RPwAsC8PNhWLHMEpe/3rZDS95rRIIILLYihgxqQ29OeSV2EOxIO09Xhp3hK+pjwJUIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=a82Xu3Ap01oB5zC1g+9yPaWAXUDVFqvsJpL5pn/9wt4=;
	b=ktQ2vIcKoyg2//LVvXdb2zrGr2qKqaEuuponI1Pe9q1gwu9uPmfE04r31wEZtUO8sHrR
	 bvqNQEuMQqzL7milZFXRcHl0rMp+19JfTQkzzyUkArM7pdjYtixW5wWK1CTeiteL0PUZl
	 Cp5wZfzt7IwxHJECQtsZKd62EEudlDvFYJ+UK3DJ67UccI7MZPMxophJGOq8mGWxDMzq+
	 lEomAtk2P+FJVpy04MOXpjjpw/ZQfjV5V7BYXX3I5XQ8G+o9P0y+7FTyYAY20lIOHKcVS
	 UC54AEmbnzNTdd0CkwIT0v4DuHNnz4JX0KIkx3yKLKvm0MqvuphacXSo74R3XNa/XQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kwuo52H8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB45606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB45606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kwuo52H8
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386c71feeeaso3371394eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:33:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795696380; cv=none;
        d=google.com; s=arc-20260327;
        b=YMCYw9nk8Aqjx1zzMJLffq1IiObpB3A5mP2C/okpTw9AceEjmIgM4AluGCG3+vk1fB
         ljtSH442Wr57Wbgj3x0a7G4hcLmXn00YUbhS3m5/AuR//OUeDFXC/tpZXZ15Z5rLzHxu
         nvD//r1l9uKFMZrUqeWTnP80AiKYw8Bb850sTapQkDTJO4nIROY9uoHpS05RlU3cUCrN
         w2CT2KCIt1dJlODTlPP0csIvrXbfJzY3XwfEFYDDs37GpFPRoNRyBlMr8fAxDPu06dEJ
         FYBg7i/NjN927NcT7yfMh0UjKj4lsedyxlCmlZATUyuO0rcRFt2NeepstqOQdP2WEbWe
         eS2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a82Xu3Ap01oB5zC1g+9yPaWAXUDVFqvsJpL5pn/9wt4=;
        fh=N9GWTJYHOGg/AV2b7dFdd8jYcoT5z0URadZRz0pRNqg=;
        b=sTiojOkeeHOMR7FbDO04fFYFLD+O+prsJjHbuOxwCFOxYxtxYYEyelNnEm9juiHsgU
         TW48AlV5bwIIuaJV0NMGcwWK3PjVz+pVaOmBy7HiYjrvgNGJb80hDSl1QXMpEE4dN5jo
         gfQ5rby5r5ngN/9gioKFGgWFNIT9a6Itc+DBCoFu9/q/ZOR/tIbG6juhpUt4Li2ArLmo
         UYnZQHmmOn1Iz6a3Y51ih2SgYyBsZ6XLBY0af/iFyftO80Y7BrdQoJ8koS+koDeO9CLF
         utODr69a1lT8riUk3dgeLmJ6dpuk0yhtowATk1mrjQI2slfZaPU1RqnGmNgKL25Yc2zd
         Ceug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795696380; x=1796301180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a82Xu3Ap01oB5zC1g+9yPaWAXUDVFqvsJpL5pn/9wt4=;
        b=Kwuo52H8cNDbabrZS0nn/S/hu+yvXnC3SCGPcZxUa8Xsij5I7NOdnPBXUGHY6YjxxN
         Wg3xNXgK+1JdpgOD1nL46zZ1EAMri/965h+nZMunr7BGuYBTsy9DURJNSwzwp9ykYoPv
         EZYNPLau0NmiudjSpE7oyysQo4OdGU8LeJXzUGGq1DIAARDXDrYMR3Qh5+feoMIfs9Kt
         3ve1XqcwsBs+ONpTs7FTKPO6rwfcYuycLKrASAkVu02WTHT4U4i32RvMYYzFHX2dNn14
         bAhjdgP/UIGvHInzSHKOP/6TwjYiPvOGTjWFBR42QJJWszYumxEDeWLZAkjvRivGnCMo
         8rcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795696380; x=1796301180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a82Xu3Ap01oB5zC1g+9yPaWAXUDVFqvsJpL5pn/9wt4=;
        b=cFtz0dr+/6BNoOr06lODPbxF8vFJg7jiy1GKC0joKyPjpTEyPSjyNETIJahizVYB5Q
         4pRkzhWudmaDXxrkUvN624WdMvTG1Ka5LrRvJJG0VEnLIk5EdDC5a5Rxw8sfimYQtALt
         cficx2Z2hC94k3xttKV6va741CKrPNXS1RHcPh8GeMrASlpB8/aviDPSnrCXVVNmkVF8
         2A4IIAmmKofb+HgLgMsJtcmsf5HxmMTRDBIZZPj4LvTdgx/woB/DuIXWqZ5LL8RBP8dY
         Sw2nq1zuLuRhoL7LscJ2QRcVWoVyzDG8Rqcei7/PBtR09IgsDUxSMojXQjTB9vps0ISK
         PZKg==
X-Forwarded-Encrypted: i=1; AL+hErFGpFdt2H3GutVcK+IGMOabbsua5FdGZkZ3EljhpioKTLjbqE3OfruhcaQSHaUMd+qo0AXGhF1WZCT2y0M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+h8Vril+U8OSRL473M9TVR4hPGyQyeWqM3y6yHXZFS5KAmuPu
	3n9JPfJYk79ppie/9OvgBZuB3b5WbEQlS2pL7ue6Y4gZ4lhSjEs5ohyyYk93bA9VUx3mjD+pUyZ
	OH7jmb5iq3gLeLi/E4X3yB55dzUY61YE=
X-Gm-Gg: AZFdTZcXTHeqXI8GozwjcpTeWmxLJeCxltu9opcDQTOQdwJ5hW8I+gaA+q86Shf/wb3
	oF2UheZH9zkL8YzY6UDhBjb0+QzeqHsxyMreo6EyOEtF84VWxgySKj7aQnfy1JqVkU4Jvjm33DV
	yn8yMI7RvLstQaxJw/WpkGOf4mpVEo8rrItdhUJxqjKwwO5ZoMapdWhw+nfp5dj0mi1GDn6dsWH
	vRZtzcAXOCqZbnTPBjn6G4s7k4cojr2fuHUrssPC1DjHjwthDrH7ViHSrbp/R4bquZdMTNRhAi4
	4jIuiwihsbO1I+v0cAkZODnrjfVcjRb9ZcHsC8qAfW5mKOV0fUgWfa76dHOe10e/c8E95Fr/ZnZ
	zbAYDkOsi7DNDCgQSDeu2dDV6UptwYzF7puUrtNtZl5oeWaBISKVdGnWwSyHEBTjzcTB4CGcbKv
	YIAGWz6IVFvP0666+1NQGMAU7ShjdqmTk=
X-Received: by 2002:a05:693c:4143:10b0:36a:1f4f:3e9 with SMTP id
 5a478bee46e88-386b1067bf5mr14067545eec.20.1795696379819; Thu, 26 Nov 2026
 04:32:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115084347.70592-1-clamor95@gmail.com> <20261115084347.70592-3-clamor95@gmail.com>
 <179510281165.63755.6096974058338821986@kernel.org>
In-Reply-To: <179510281165.63755.6096974058338821986@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 14:32:46 +0200
X-Gm-Features: Aa3M54ooZHwa1yjqqwCLWy7pCcfJ2o9UO-Q8qrvTvCJeca418nn2atFKExuddxs
Message-ID: <CAPVz0n3abYU7BfjcXPb-tZOpw0UbsKS2WTVYqCZhrm_4biH3UA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] leds: lm3533: Support getting LED sources from DT
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:4=
3 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 15 Nov 2026, Svyatoslav Ryhel wrote:
>
> > Add support for the standard `led-sources` device tree property to
> > configure the mapping between control banks and physical low-voltage LE=
D
> > (LVLED) outputs.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/leds/leds-lm3533.c | 57 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >
> > diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> > index 7db1105bee5c2..ad8bc3751e3e5 100644
> > --- a/drivers/leds/leds-lm3533.c
> > +++ b/drivers/leds/leds-lm3533.c
> > @@ -26,6 +26,14 @@
> >  #define LM3533_ALS_CHANNEL_LV_MIN    1
> >  #define LM3533_ALS_CHANNEL_LV_MAX    2
> >
> > +#define LM3533_REG_OUTPUT_CONF1                      0x10
> > +#define   OUTPUT_CONF1_SHIFT                 2
> > +#define   OUTPUT_LVLED_MASK                  0x3
> > +#define   OUTPUT_CONF1_PREP(x)                       (((x) << OUTPUT_C=
ONF1_SHIFT) & 0xff)
> > +#define LM3533_REG_OUTPUT_CONF2                      0x11
> > +#define   OUTPUT_CONF2_SHIFT                 6
> > +#define   OUTPUT_CONF2_PREP(x)                       (((x) >> OUTPUT_C=
ONF2_SHIFT) & 0xff)
> > +
> >  #define LM3533_REG_CTRLBANK_BCONF_BASE               0x1b
> >  #define LM3533_REG_PATTERN_ENABLE            0x28
> >  #define LM3533_REG_PATTERN_LOW_TIME_BASE     0x71
> > @@ -54,6 +62,9 @@ struct lm3533_led {
> >       u32 max_current;
> >       u32 pwm;
> >
> > +     int num_leds;
> > +     u32 leds[LM3533_LVCTRLBANK_MAX];
>
> Since LM3533_LVCTRLBANK_MAX is 5 (matching the maximum control bank ID)
> and there are 4 low-voltage LEDs, shouldn't this array size and the
> bounds checks below use LM3533_LVCTRLBANK_COUNT (4) instead?
>

No, leds are referring to number of LVLED, and there are 5 of those.

> Also, are 'num_leds' and 'leds' used anywhere after probe()?  If they
> are only consumed by lm3533_led_setup(), could they live on the stack
> instead of here?
>

and in lm3533_led_setup() which means that I have to pass there leds,
num_leds and lm3533_led itself

> > +
> >       bool have_als;
> >  };
> >
> > @@ -622,8 +633,36 @@ static const struct attribute_group *lm3533_led_at=
tribute_groups[] =3D {
> >
> >  static int lm3533_led_setup(struct lm3533_led *led)
> >  {
> > +     u32 output_cfg_shift =3D 0;
> > +     u32 output_cfg_val =3D 0;
> > +     u32 output_cfg_mask =3D 0;
> >       int ret;
> >
> > +     for (int i =3D 0; i < led->num_leds; i++) {
> > +             if (led->leds[i] >=3D LM3533_LVCTRLBANK_MAX)
> > +                     continue;
>
> If an out-of-range source index is provided in DeviceTree, shouldn't we
> fail probe() with -EINVAL rather than silently ignoring it?  Note that
> with LM3533_LVCTRLBANK_MAX (5), an index of 4 would pass this check and
> corrupt bits 4:5 (HVLED2) of LM3533_REG_OUTPUT_CONF2.
>

How index 4 will corrupt bits 4:5?

> > +
> > +             output_cfg_shift =3D led->leds[i] * 2;
> > +             output_cfg_val |=3D led->id << output_cfg_shift;
> > +             output_cfg_mask |=3D OUTPUT_LVLED_MASK << output_cfg_shif=
t;
> > +     }
> > +
> > +     if (led->num_leds) {
> > +             /* LVLED1, LVLED2 and LVLED3 */
> > +             ret =3D regmap_update_bits(led->regmap, LM3533_REG_OUTPUT=
_CONF1,
> > +                                      OUTPUT_CONF1_PREP(output_cfg_mas=
k),
> > +                                      OUTPUT_CONF1_PREP(output_cfg_val=
));
> > +             if (ret)
> > +                     return ret;
> > +
> > +             /* LVLED4 and LVLED5 */
> > +             ret =3D regmap_update_bits(led->regmap, LM3533_REG_OUTPUT=
_CONF2,
> > +                                      OUTPUT_CONF2_PREP(output_cfg_mas=
k),
> > +                                      OUTPUT_CONF2_PREP(output_cfg_val=
));
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> >       ret =3D lm3533_ctrlbank_set_max_current(&led->cb, led->max_curren=
t);
> >       if (ret)
> >               return ret;
> > @@ -690,6 +729,24 @@ static int lm3533_led_probe(struct platform_device=
 *pdev)
> >
> >       device_property_read_u32(dev, "ti,pwm-config-mask", &led->pwm);
> >
> > +     /*
> > +      * If led-sources property is not set then either this Control Ba=
nk uses
> > +      * its default LVLED or is not linked to any LVLED at all.
> > +      */
> > +     led->num_leds =3D device_property_count_u32(dev, "led-sources");
> > +     if (led->num_leds > LM3533_LVCTRLBANK_MAX)
> > +             return dev_err_probe(dev, -EINVAL, "Number of LED sources=
 exceeds max %d: %d\n",
> > +                                  LM3533_LVCTRLBANK_MAX, led->num_leds=
);
> > +
> > +     if (led->num_leds < 0)
> > +             led->num_leds =3D 0;
> > +
> > +     if (led->num_leds > 0) {
> > +             ret =3D device_property_read_u32_array(dev, "led-sources"=
, led->leds, led->num_leds);
> > +             if (ret)
> > +                     return dev_err_probe(dev, ret, "Failed to get led=
-sources\n");
> > +     }
> > +
> >       ret =3D lm3533_led_setup(led);
> >       if (ret)
> >               return ret;
> > --
> > 2.53.0
> >
> >
>
> --
> Lee Jones
