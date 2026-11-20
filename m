Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195668;
	b=hnuQenH5E4USIgNECM+2c86thNkJ4Ig0I7hcoPh82+90sZhHMi+5hzLF/OpUr+pp8jeF
	 h0syZrd+9S0qy4QRR1y73ifdcDc5z7sBR4wNDnGy7XCEZjSbKemL0DGnbC+elxSJjIZOD
	 wdUxPr1GtOmKRL9Mq7Xwi0nIJQAnYSv/tRqu7ewcMyJOdKQL8ME2oqIqLy+G9f3hf48wl
	 Iajz66Hz6c/0KbFLKDm1RjvWmKRasBqc2s66Y/u7FSFgJSZiQKUekvCJqAvVxuwwpwN/B
	 ySF3RhtzguH9St3OP6WR7nF2x3ovIB0JIFcmeJjKscnDq6Z6A/6+MjWSvcHFzZlUF8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=piUlh1pDCE0su43+DcLPJxvz8UQFYkDV7njOU8o8Pjw=;
	b=HMO4EZyE6E1OSi68BJHX2YJMq31+jOITeWpzScT/eCD8Ky6ktldUeO3Qs27DkRrIdZgZ
	 HvcVn5YtETk1gpc/TsrodL4jZ0zwtOsaz8VvbuxU8fx4k+wAiazpvoJloTHYKoun7Ligl
	 XPSS1o3PBuzMbMod6LNUECxuXqnirx5kjG9d2kLtx7U4t238AIQe8782T3XFk4kmhr22g
	 hQzjppOjRXsLPYczAO8hLFxE5Ua0R0pX9/0O70WTM9UugoIdGjbFSCMxTF3XkWxkC2Ofc
	 t4tjTnR2r8Bdp9i13aGNNoOC3KRh+MgLC1Dzh1EOj9wpzCIR61UEjq9HLB9gmkw5JWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kLoto1o9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A98606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05A98606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kLoto1o9
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533202fe429so371271cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:27:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795195667; cv=none;
        d=google.com; s=arc-20260327;
        b=fCQREVzGillNooI0JaxKWQhxAFWJbS1cd1DJGxyEyuto0Xp+c0bTyNC2Fvx7VKT5tu
         +i++7hqydCqy6lhGP3swUlQ9Ylul2JvK1t2QbMrQMP+uxRi9C2VezJiUtfVT0098Mvem
         JdWbUOmrReXln7hfhZV2f+ldOPIeftIImalIwyJbKUvHD9y+DMGhD0zzBzI6serGa7X+
         K6olc5ZSK27iF5yIE5ISKF/hZujThMJNG7FhfKHWxu7JYZ2yof+jqbyD889T9Z6QGBeh
         6EsieY2t04Vy1s/1ML6sPzxKh70yX4ysMGcRAvuusGVAFeZY4W5+nP2eYb+DKHNY/WE0
         LRRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=piUlh1pDCE0su43+DcLPJxvz8UQFYkDV7njOU8o8Pjw=;
        fh=l6a2lKPCgNxLaRK+a2TB3qUiKoOAbCpT8cPckIPbJCo=;
        b=GSHO0PcWkr9uB1awY3VplKC7C2MRSHvdHXdPnvemTO62KQLhQ8cYtoqOlMwXzIoS8F
         S0EUU22s5ipAgFrbBR6Rl6N+MJiZT36KXCFciqF6ly8siLDLjVCEAUjy54pfQgbyBVdq
         GgUYeYnLTR5YV/tI3loudb5jT/pGSxnF4sXZQ3GdlThKmHbvdzZxenXfu1DIW3h+rs/M
         jiuFj6nNeb1QSUeqZDRA5+7fZlG4qMAWZ8EoDmC6iigZTI0xY5NOjlRToeFsSxeJwGds
         7kvtnorW3jd6AtM1WlO3EVgqD6kJ/gOgxVAyOHcuVkybyJ+V7I9ICtaSgcY1smL0ZMOu
         w3Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795195667; x=1795800467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=piUlh1pDCE0su43+DcLPJxvz8UQFYkDV7njOU8o8Pjw=;
        b=kLoto1o9tl/Dfq8V20TV+jBndKsu7ov5RESZIJPXu969lI6z1IAHVuXMDD38j3KQs8
         mRKs+zfp7xCPZs6CtbTnwZp+setGfSQE77c5hMDjV/T4Eb0UwgvltdXX0JXmqlQYaGp9
         wNlQhy4RM1KhGYlk5pjGuI0G9V9eT4+6piVhaEC9cBtTUWYOahnT4rbomvtGebQz2bcC
         Q918ezU3P7b+/ccMC9I5jcrkct4cd0nQZQCtZ4s+jFmIySe3/vLXTwU3ToJmNoMueJrK
         BDvLQhl0I9UySBlGIKfGWWfAjb1dXs04UXmKgKiB4w/Fn1QR9/SpY/pfzaGedH35bVxY
         0rCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195667; x=1795800467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piUlh1pDCE0su43+DcLPJxvz8UQFYkDV7njOU8o8Pjw=;
        b=Rep6bQ3gk+7ffQOFD/fx5YsOeK8w3bzTt1nQChAEMcbo0dLSXsllaUi0Ul+wJR5ZRJ
         RfuI8wPIBZX86QmI9HEEYty/FqSywe3H/a194sEbkaRpPz9VuvxrrvfSG/WFpQNES1Wy
         nEbJErfO3rCAk4UElQ9yBe81oAVQHyMlUvK4IsfHcPmuwn4q0Alzo78RzrOGUfd5mc1W
         /0IJKxP8W9/226bUouZlL5ko8VkmbRbQfsmz1DDEftFIK+v7DCNfe8ASWt2GDL6QUqLT
         Ei89+Kkc4Ig7ZB0/oFYP8WhTT9t5QUK3e765ddqlUwGo68i1qlRO4Rbv8EL8mfO8IdE1
         lGcQ==
X-Forwarded-Encrypted: i=1; AL+hErHSL3kSdPbD8gdDZV2x6pZA1RSMn4/lzLvqKUGe9zw8Y1sgApquGIzUs5ROXcv9U7ibmnOtTC9529ckVhk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mkGBC0nkupqJLL9U60wAm0tUXAU9mMn/K8hfThOgbo9d1BoL2
	OhR9LC4udWzsYI7L+L9qcI9YyGK94/nXkWfS5U+hb4ji6DkJipvMBQv6lWJQcupWLXKvBZQ6MZG
	ArdP4TPTbqZsWcqwah2USEE8Rwk3GYPA52WTU1kbw
X-Gm-Gg: AYBFou27CivYAm4XAJMs9q7xGDgRD/jNOwQeRQZZxB/Ub9pGXrwFHOz4Is/9pZRxtc6
	aF9A5x5SgelMvT2bMMVFm4zkyCmge4CGxcDg4BKuVEzvqczRlUiyd9COwhu4Ke2t/Rgd6WGlPe9
	iyuFJuJuuBnd2jZdntiRvQfTCFAAthrGugvFMN1M1WawoCrnl0Nok/GTgQhaCHKACEMtD2XRIB7
	8N8W6FEHn7jdDqiKJxKa8bGlraWilUbpykzyXPZXcr3QoDKkQVr1GoMgrsIIGKH/H8xL9zAdaWO
	7aUaUqdXgivBA7tdRdSZadgLlF9OjxIYNjm1d6mL/Sa46WdHJxXPC8C4oy0iJSBmOHND8iJn7Rz
	HuI+r1arF0gLBq02lfgCEKdwegsQkqTP9rUYP
X-Received: by 2002:a05:622a:c15:b0:534:d386:c3f1 with SMTP id
 d75a77b69052e-55d7a315ba4mr21064171cf.9.1795195666028; Fri, 20 Nov 2026
 09:27:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119170650.1521609-1-irogers@google.com> <2026112003-dreamlike-tricolor-f055@gregkh>
In-Reply-To: <2026112003-dreamlike-tricolor-f055@gregkh>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:27:34 -0800
X-Gm-Features: Aa3M54qV1ST3KDVbaaaVUVHrHiimI6d3jD3qxAM9oI-AuQL6wZNiVzw5o3Go7mg
Message-ID: <CAP-5=fWg=m_O4tbCFWZ_-_tvmxPcQqOxr3V2-Sz1T07CbAss5Q@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: hd3ss3220: Propagate regmap_read() errors
 from attached-state check
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 8:05=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Nov 19, 2026 at 09:06:49AM -0800, Ian Rogers wrote:
> > hd3ss3220_get_attached_state() has return type 'enum usb_role' (an
> > unsigned enum) yet returns negative regmap_read() error codes directly.
> > Neither hd3ss3220_set_role() nor output_poll_execute() checks for error=
s;
> > on a transient I2C failure (such as -EIO, cast to 0xfffffffb),
> > hd3ss3220_set_role() passes the bogus value to usb_role_switch_set_role=
()
> > and disables VBUS power. On role-switch providers without a .get callba=
ck
> > (where sw->role caches the value passed to usb_role_switch_set_role()),
> > reading /sys/class/usb_role/*/role subsequently indexes usb_roles[role]
> > out-of-bounds.
> >
> > Return an int status from hd3ss3220_get_attached_state(), pass the
> > resolved enum usb_role via an output pointer, and leave the current rol=
e
> > and VBUS state unchanged on I2C read errors.
> >
> > Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> > -Wimplicit-int-enum-cast enabled; fix and changelog drafted with an AI
> > coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
> > -Wimplicit-int-enum-cast; not tested on TI HD3SS3220 hardware.
> >
> > Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DR=
P port controller")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  drivers/usb/typec/hd3ss3220.c | 22 +++++++++++++---------
> >  1 file changed, 13 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss322=
0.c
> > index 60d6de9ba339..212c3624961c 100644
> > --- a/drivers/usb/typec/hd3ss3220.c
> > +++ b/drivers/usb/typec/hd3ss3220.c
> > @@ -163,10 +163,10 @@ static int hd3ss3220_set_source_pref(struct hd3ss=
3220 *hd3ss3220, int prefer_rol
> >                                 src_pref);
> >  }
> >
> > -static enum usb_role hd3ss3220_get_attached_state(struct hd3ss3220 *hd=
3ss3220)
> > +static int hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220,
> > +                                     enum usb_role *attached_state)
> >  {
> >       unsigned int reg_val;
> > -     enum usb_role attached_state;
> >       int ret;
> >
> >       ret =3D regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL=
,
> > @@ -176,17 +176,17 @@ static enum usb_role hd3ss3220_get_attached_state=
(struct hd3ss3220 *hd3ss3220)
> >
> >       switch (reg_val & HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK)=
 {
> >       case HD3SS3220_REG_CN_STAT_CTRL_AS_DFP:
> > -             attached_state =3D USB_ROLE_HOST;
> > +             *attached_state =3D USB_ROLE_HOST;
> >               break;
> >       case HD3SS3220_REG_CN_STAT_CTRL_AS_UFP:
> > -             attached_state =3D USB_ROLE_DEVICE;
> > +             *attached_state =3D USB_ROLE_DEVICE;
> >               break;
> >       default:
> > -             attached_state =3D USB_ROLE_NONE;
> > +             *attached_state =3D USB_ROLE_NONE;
> >               break;
> >       }
> >
> > -     return attached_state;
> > +     return 0;
> >  }
> >
> >  static int hd3ss3220_try_role(struct typec_port *port, int role)
> > @@ -231,7 +231,10 @@ static void hd3ss3220_regulator_control(struct hd3=
ss3220 *hd3ss3220, bool on)
> >
> >  static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
> >  {
> > -     enum usb_role role_state =3D hd3ss3220_get_attached_state(hd3ss32=
20);
> > +     enum usb_role role_state;
> > +
> > +     if (hd3ss3220_get_attached_state(hd3ss3220, &role_state) < 0)
> > +             return;
>
> No error propagation backward?

 Good point - hd3ss3220_probe() can fail probe and hd3ss3220_irq() can
return IRQ_NONE without clearing INT_STATUS if hd3ss3220_set_role()
returns an int error (the third caller, output_poll_execute(), is a
void delayed_work callback). I'll propagate the error out of
hd3ss3220_set_role() in v2.

> >
> >       usb_role_switch_set_role(hd3ss3220->role_sw, role_state);
> >
> > @@ -258,9 +261,10 @@ static void output_poll_execute(struct work_struct=
 *work)
> >       struct hd3ss3220 *hd3ss3220 =3D container_of(delayed_work,
> >                                                  struct hd3ss3220,
> >                                                  output_poll_work);
> > -     enum usb_role role_state =3D hd3ss3220_get_attached_state(hd3ss32=
20);
> > +     enum usb_role role_state;
> >
> > -     if (hd3ss3220->role_state !=3D role_state)
> > +     if (hd3ss3220_get_attached_state(hd3ss3220, &role_state) =3D=3D 0=
 &&
>
> Why test for 0?

I'll change this to '!hd3ss3220_get_attached_state(...)' in v2 (and
add Cc: stable@vger.kernel.org per Heikki's note).

Thanks,
Ian

> thanks,
>
> greg k-h
