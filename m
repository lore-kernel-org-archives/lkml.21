Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795614723;
	b=T3+yFZ1iPRBqOOtAX5spwI0zQa5wP85aNU0XrTYMNm2x/bIfH8oB4pf8SSJN3WBktyWz
	 drsCmb8x1z8cXe3yvHFW3NklwhTxw0m4Wb1UI0j/OHcMKyajUr4ryFxzp0JaX6agkiLEa
	 oP88f3oYTToCYfS+vPwetA/JtdUarS27Z40ZYqJG+DJCTUDcC7TF4wLFGZuQXq9tJH6uz
	 zhpKHC6kQ3EJDaGmQ1aEUOjUj9EgzkYV3yku+xQDj55EQPo1FJL8xUKbmWMq5pNbtqyOD
	 6V+ihVyENjlUMBUeWe9wk1cWlYql9F+rYz3FXtgpEsFyiLyePgOejXTPnFlNgnKqRwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Dk5J3h/sVjTiXHv23N868Pwgsnpoz2KWfjMivypjcyk=;
	b=VCAmZ9LzAGtRJLp9XzLCmoNfvQlC/9JPaEK47pfLHLPNueEt5tPrivC+pUyhMAYs/9yF
	 kEI/5NU3WVAJS+esNvHvTHScGl+63+x4rDJiBHK7ZzRSDxb1KtrBRNA+O8gSUkcL67bj+
	 0qCdTiY29oR6yAysajo2oFW932r0TuqUe8g+IIZFZygrHgVwSNWop/2mBP4zVMd7tzcUr
	 /1Jzc6JccZWrLelpvCbHC8QXxldvaa1YfYEkGMOG4Q5Ic5ycnaGLBfDrqj9+pixFamaNW
	 mfQ8kBiwFsN+HQtc2eNhPyxDDRlcBYp35UhT9sP/AwA5EmVPg0Q7D5whuOJfycufGvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTkOQqsF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947FA606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 947FA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTkOQqsF
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso6848703a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:52:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795614721; cv=none;
        d=google.com; s=arc-20260327;
        b=KLMt/elEgBLBh7hRV+HUena4ra/+R6YXJSdGEf0h/LgyOdRkWzqzl8GoLFcwLeRkV9
         lU3fusCkUOE98ZxQnpGy9d1XqeYY6zGR2nzH9/V8e7vqWOXljLuSJ1RAM3WGtL/bdvXo
         7ZHI7DYu5hpIqE7WLuOhefSB5PsW+yGeemGLofdQ/t4KnQk26sAs4HwzVIYSoW8aCXbZ
         /nJY5fXwTmmcbLMiU5YmT9VHa8j8NlPC9pJvk5xlKkRXwOdtbA/GnAkdN7nIgQbM4bBd
         vNnrIqsdHIHG4oGo7sbq7e/KmNsalDPBdwmzVEdyeGnKu4DGdxqtY9phFNQ1Mjd/jNGQ
         hNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dk5J3h/sVjTiXHv23N868Pwgsnpoz2KWfjMivypjcyk=;
        fh=91KnA/2OgBLrvDz5Y7ZBWO2lPl879gY2RrgqvE08Kpg=;
        b=RaOX7fgJNILDRiFQ4xPdH1b1fLJSyv8kZS4QB4uyHcPU6Ws+s/E+BbdLJLlJcU/mB/
         pVG+7k4W0YEaYnVwG+ju+rUvoJ7aMi60potqjdWo1E6PTQEByp8nxD6s/GOyO+YFeRWK
         7jjNgOp3FJ1bIEZFcMQOLLznZdB4MbUAjf/bcukHEQQ0Zc3So9lk1YwmEbdBPIlVhWWh
         nutzXVyTDetGDacjaxHwaRQ7+4MlH5yhN7NCi7wKqGqLARKpsOtfsMYm3s9nGQIDfTNJ
         HTplWrZKI8S6AxP1Xh7Op+U13vO1Ocu3ri1vkIAwBmv8Eq/NJoHmKzPY5atKsZR4M/kj
         Wh0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795614721; x=1796219521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dk5J3h/sVjTiXHv23N868Pwgsnpoz2KWfjMivypjcyk=;
        b=hTkOQqsFligKpegbXqtNk4uMFkdNRyBPfZ2mAihorUwOugSZqSI5U62GKkbL4c2WXv
         ad9FUZyG20FSBtb5ocPtVN4iJBMlVkyw3xvKebgXvdh/rLyEf1hXp6w40gUPLSaFgMhx
         Cck0ZdqeESFXpD548WOq2f6QF8LHPmgTNGPyfufHDVVgKuE7kk/4YpG8Xkx9s/zm2Nz9
         asOVERaE2QeJ5JU4XIcgUDEbQ2TDF/QAPCaigc/ZI1N7IlRXkolqJ0tpAMAi0USlCo30
         78d9tQyqZtInjtLdkYfmdpCEDFynWABbPCJLbYnec6zZ8HpCwEW3+cmvpBqO3fv+WJ6v
         fibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614721; x=1796219521;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dk5J3h/sVjTiXHv23N868Pwgsnpoz2KWfjMivypjcyk=;
        b=hAEb5ZrwKiNxv39sE4m65iOFoAjAegqFsVN3ENCijL3SlbT0KhSVVa0qrdyL6et2Xx
         MGClCiOKCyH14IjIpIdgim1u8Tv4BUD1OPXm5yCqMkPMUDiaiitGonUpzZpui7pKBal8
         xRZ/XvQmjDYbg+Q4YXcDrW5zPATN6XKeSyktVxfWi5ExIIYdIJoeE4slxQi6AzwUBVt1
         m7JBh5fHHwNex7QPztO7HoEHar67Qh6+ntLZ0bQIimXq3rcjXlTpmxnRdp5RQd5eu2fc
         Fos/bXQ48lRpPkD+YWGCYYHznzdY0R6W9wZptKkszXgRMwO0Dj9jRn1Yswq9Z/5kQV3z
         +ggg==
X-Forwarded-Encrypted: i=1; AL+hErHaEQRfRAarp5WY4HFX2dN9K3Xkx3+8FCNwHZ59r0zMH5A83nulsGfM7og0PMFSjetx2+PlJtWRnpizVcY=@vger.kernel.org
X-Gm-Message-State: APuU4Z94BO42JLGVaX23WqvIfCmIES1PWtbF55tCJgGugzNOS4HzlDb6
	wmVLL2vcnPf0U4dIekMw96KqmbUlLOkRfQ8m94cJRDvd1wv2NE2VJ64pyVUySDP5Kgnqeq/z8PH
	hn3SzeSV+ZIandP9gsZ21mGBBKVzQjK8=
X-Gm-Gg: AZFdTZc1saWNc5fLkdDqvkJDPa6uk3/+NwJ7j85REV5DMWT1tsg+va05ISAh2YP+Z9f
	F/EVzkKJz88kPVQWSRmRfjvUKFrb157wEs45WApmtU6Vk7atVWy/7Z50ZP78CQjCvExUKwWtjVC
	YuE5jyl40OxVybIIIb0gjAuMiFHnBFl/ZeunURMZHHJlJMI3TZVVjFrjzDkM7/lqZzKIedJQ0cD
	QZrKBv6DyxA3R6Mbp84Ul4Gj7gGEUu4aeasD76eB5jegOoJ8qQbIsb5CWkCjkmholmzIUSDikon
	EQXzrtFAcnFh5RxUaQWKyfjlJA8cy5vs7ogDcJms7ssXPRoJAcy/FzR7u1f0pjmPKPnf+OGoRlo
	t/7e1pypcPyhfdSN6GI+MaEkjZz92M30gIZGU1ZlZyN0ZILrOohPY3uI+5zQW4R58ArF0uuo9hg
	oFO6W36yM09LhmLBaaJPdXZTIFiJERl/Vp8jZoyABZhan+xF+s
X-Received: by 2002:a05:6402:234f:b0:6bb:6df:1fbc with SMTP id
 4fb4d7f45d1cf-6bb06df2246mr3254979a12.18.1795614720526; Wed, 25 Nov 2026
 05:52:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAMnMt5aufzBXQvs2OeFpBqdh1_VgNUxstvkVX61dPPcfo94QOg@mail.gmail.com>
 <4df7445b-f4c8-4615-8f1d-3fcc59f8cba0@suse.de>
In-Reply-To: <4df7445b-f4c8-4615-8f1d-3fcc59f8cba0@suse.de>
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Wed, 25 Nov 2026 16:52:17 +0300
X-Gm-Features: Aa3M54pK3hgtA55gmMohtw-eYgBCkVBj9zN9rKUbfTXwsOwAE6_ryIdlXxyJdas
Message-ID: <CAMnMt5bOFRye_=Q-nXmpaO4ZsJmnh6tWxjaxsFXEgw5TpFA_zA@mail.gmail.com>
Subject: Re: [PATCH] drm/ast: Optimize cursor updates and reduce overhead
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=E2=80=99m sorry. First, I didn=E2=80=99t break it down into multiple patc=
hes, and
second, I didn=E2=80=99t test it properly, and I also didn=E2=80=99t note t=
hat this
patch Assisted-by: LLM.

=D1=81=D1=80, 25 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 14:5=
3, Thomas Zimmermann <tzimmermann@suse.de>:
>
>
>
> Am 25.11.26 um 12:24 schrieb Herman Semenoff:
> >  From f9574b5a246bf9021ea75f530a9a8ab7c9995274 Mon Sep 17 00:00:00 2001
> > From: Herman Semenoff <GermanAizek@yandex.ru>
> > Date: Tue, 24 Nov 2026 12:53:31 +0300
> > Subject: [PATCH] drm/ast: Optimize cursor updates and reduce overhead
> >
> > On server platforms equipped with ASPEED BMC GPUs (such as AST2400 on
> > Lenovo RD450X), VRAM is mapped over a slow PCIe link with limited
> > bandwidth.
> >
> > Currently, on every cursor move (e.g. via drmModeMoveCursor or atomic
> > commit updating plane coordinates without damage clips),
> > ast_cursor_plane_helper_atomic_update() invokes
> > drm_atomic_helper_damage_merged(). Because userspace does not provide
> > damage clips for pure cursor movements,
> > drm_atomic_helper_damage_iter_init() treats the absence of clips as a
> > full plane update. Consequently, on every mouse move event:
> >   1. ast_cursor_plane_get_argb4444() performs format conversion on CPU
> >   2. ast_set_cursor_image() recalculates 32-bit checksum on CPU
> >   3. memcpy_toio() pushes 8192 bytes over the slow PCIe link into VRAM
> >   4. Cursor base registers are reprogrammed
> >
> > Fix this by only updating the cursor image and base when the image
> > actually changes (fb !=3D old_fb, plane was previously invisible, or
> > damage clips were provided). For pure position updates, only update
> > the coordinates in the hardware cursor signature and registers,
> > skipping VRAM transfer, format conversion, and checksum calculation.
> >
> > Additionally:
> > - Add DRM_FORMAT_XRGB8888 support to ast_cursor_plane_formats and handl=
e
> >    it with opaque alpha in ast_cursor_plane_get_argb4444(), preventing
> >    compositors from unnecessarily falling back to software cursors on t=
he
> >    primary plane
> > - Implement .panic_flush in ast_primary_plane_helper_funcs to disable t=
he
> >    hardware cursor during kernel panics (CONFIG_DRM_PANIC)
>
> I this is mostly wrong and the patch is terrible. I refuse to further
> deal with any of this.
>
> >
> > Signed-off-by: Herman Semenoff <GermanAizek@yandex.ru>
> > Signed-off-by: Herman Semenoff <GermanAizek@aizekgroup.ru>
> > ---
> >   drivers/gpu/drm/ast/ast_cursor.c | 39 +++++++++++++++++++++++++++++--=
-
> >   drivers/gpu/drm/ast/ast_drv.h    |  1 +
> >   drivers/gpu/drm/ast/ast_mode.c   |  8 +++++++
> >   3 files changed, 45 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast=
_cursor.c
> > index 690d4cd1db5e..883d1e6f20bd 100644
> > --- a/drivers/gpu/drm/ast/ast_cursor.c
> > +++ b/drivers/gpu/drm/ast/ast_cursor.c
> > @@ -142,7 +142,7 @@ static void ast_set_cursor_location(struct
> > ast_device *ast, u16 x, u16 y,
> >    ast_set_index_reg(ast, AST_IO_VGACRI, 0xc7, y1);
> >   }
> >
> > -static void ast_set_cursor_enabled(struct ast_device *ast, bool enable=
d)
> > +void ast_set_cursor_enabled(struct ast_device *ast, bool enabled)
> >   {
> >    static const u8 mask =3D (u8)~(AST_IO_VGACRCB_HWC_16BPP |
> >        AST_IO_VGACRCB_HWC_ENABLED);
> > @@ -162,6 +162,7 @@ static void ast_set_cursor_enabled(struct
> > ast_device *ast, bool enabled)
> >   static const uint32_t ast_cursor_plane_formats[] =3D {
> >    DRM_FORMAT_ARGB4444,
> >    DRM_FORMAT_ARGB8888,
> > + DRM_FORMAT_XRGB8888,
> >   };
> >
> >   static int ast_cursor_plane_helper_atomic_check(struct drm_plane *pla=
ne,
> > @@ -229,6 +230,30 @@ static const u8
> > *ast_cursor_plane_get_argb4444(struct ast_cursor_plane *ast_curs
> >    argb4444 =3D argb4444_dst[0].vaddr;
> >    }
> >    break;
> > + case DRM_FORMAT_XRGB8888:
> > + {
> > + struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] =3D {
> > + IOSYS_MAP_INIT_VADDR(ast_cursor_plane->argb4444),
> > + };
> > + unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] =3D {
> > + AST_HWC_PITCH,
> > + };
> > + unsigned int x, y;
> > + u16 *dst16;
> > +
> > + drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
> > +    shadow_plane_state->data, fb, clip,
> > +    &shadow_plane_state->fmtcnv_state);
> > +
> > + for (y =3D clip->y1; y < clip->y2; y++) {
> > + dst16 =3D (u16 *)(ast_cursor_plane->argb4444 +
> > + y * AST_HWC_PITCH);
> > + for (x =3D clip->x1; x < clip->x2; x++)
> > + dst16[x] |=3D 0xf000;
> > + }
> > + argb4444 =3D argb4444_dst[0].vaddr;
> > + }
> > + break;
> >    }
> >
> >    drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> > @@ -261,13 +286,21 @@ static void
> > ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
> >    unsigned int offset_x, offset_y;
> >    u16 x, y;
> >    u8 x_offset, y_offset;
> > + bool update_image;
> >
> >    /*
> >    * Do data transfer to hardware buffer and point the scanout
> > - * engine to the offset.
> > + * engine to the offset only if the cursor image actually changed
> > + * or the plane became visible. For pure cursor moves, avoid
> > + * expensive PCIe bus transfers, format conversion, and checksum
> > + * calculation.
> >    */
> > + update_image =3D (fb !=3D old_plane_state->fb) ||
> > +       !old_plane_state->visible ||
> > +       drm_plane_get_damage_clips_count(plane_state);
> >
> > - if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &da=
mage)) {
> > + if (update_image &&
> > +    drm_atomic_helper_damage_merged(old_plane_state, plane_state, &dam=
age)) {
> >    const u8 *argb4444 =3D ast_cursor_plane_get_argb4444(ast_cursor_plan=
e,
> >      shadow_plane_state,
> >      &damage);
> > diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_dr=
v.h
> > index 4f221b848d68..d846d5cf4f5e 100644
> > --- a/drivers/gpu/drm/ast/ast_drv.h
> > +++ b/drivers/gpu/drm/ast/ast_drv.h
> > @@ -542,6 +542,7 @@ int ast_sil164_output_init(struct ast_device *ast);
> >   /* ast_cursor.c */
> >   long ast_cursor_vram_offset(struct ast_device *ast);
> >   int ast_cursor_plane_init(struct ast_device *ast);
> > +void ast_set_cursor_enabled(struct ast_device *ast, bool enabled);
> >
> >   /* ast dp501 */
> >   bool ast_backup_fw(struct ast_device *ast, u8 *addr, u32 size);
> > diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> > index 08db132acae8..f94f849d157b 100644
> > --- a/drivers/gpu/drm/ast/ast_mode.c
> > +++ b/drivers/gpu/drm/ast/ast_mode.c
> > @@ -639,6 +639,13 @@ static int
> > ast_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
> >    return -ENODEV;
> >   }
> >
> > +static void ast_primary_plane_helper_panic_flush(struct drm_plane *pla=
ne)
> > +{
> > + struct ast_device *ast =3D to_ast_device(plane->dev);
> > +
> > + ast_set_cursor_enabled(ast, false);
> > +}
> > +
> >   static const struct drm_plane_helper_funcs ast_primary_plane_helper_f=
uncs =3D {
> >    DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> >    .atomic_check =3D ast_primary_plane_helper_atomic_check,
> > @@ -646,6 +653,7 @@ static const struct drm_plane_helper_funcs
> > ast_primary_plane_helper_funcs =3D {
> >    .atomic_enable =3D ast_primary_plane_helper_atomic_enable,
> >    .atomic_disable =3D ast_primary_plane_helper_atomic_disable,
> >    .get_scanout_buffer =3D ast_primary_plane_helper_get_scanout_buffer,
> > + .panic_flush =3D ast_primary_plane_helper_panic_flush,
> >   };
> >
> >   static const struct drm_plane_funcs ast_primary_plane_funcs =3D {
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> GF: Stefan Gaiser, Jochen Jaser, Abhinav Puri, (HRB 36809, AG N=C3=BCrnbe=
rg)
>
>
