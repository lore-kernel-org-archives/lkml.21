Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169821;
	b=Vh6QmOqorWuFdr9VzdTe3tOMMfm8ad2P5vbJuLvYH/5dfPJFVs4uqkrGiJwvn86QX0LC
	 tbOwwISz+M+VM2J6l6fV1WsxCkl7QuBKgrvIndiAXriW1SvtUVxIIpZN+UDZDZNuse3FR
	 yYZOQDKpWWyQJNUmetb4QU0YQfOcthMmHIrVkcPjAn4FmXdD3Tvzuy4rb7j74xczQN2Ry
	 Xn8/YCqCBcfk4HwVcnNaZ8XR/n45J5lcc0IjbEs6IT02oQgnbOeupTqf+VXY/DbaIPsj/
	 noPldCmuxkNMK0+88sehPHztabTfd53O47B/TBDbupebASV2tWY1Zub6EbEiHTT97/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169821;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iPxLabQdoN68FZ0X9Umj5d27ppImCx2DZGZVjQtbf8o=;
	b=2jnI861vpdtQt3LkPsYkgyKWR3kPWnZ0VQ9gkp/smvjTr9glARguYb+sDo0NDPjz/Np8
	 BRXtKt3jpYAyuvCORb9eH+TBd9wrRIbL1Gx7I51Qw4h0TMF4+PP8MMIf/c55G50xZckGu
	 j+MQFD2F5GzEJzEAopdQ+lG7m7VJZK/eQ266fZRB5i1VAfdl1yCmwOPMAqeRLCd80JlaL
	 9Masr2rtTSj2UaljZ8b0n8Dc5O6IeJsAOi/9fpWv0b6/fyy4ABswyasaxCBbPL2LvH/e8
	 0sposfUUiMmrnS2k5Ma9U9Je5x3fAmmG2hUAxQi6pSitLftrqFTDwSSd/hB6TwNg4xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NYC7Op8j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B81606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NYC7Op8j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B3E1F000CF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795169821;
	bh=iPxLabQdoN68FZ0X9Umj5d27ppImCx2DZGZVjQtbf8o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NYC7Op8jBwkC+EPyVI0l+2WXwJsGob80JnSOyRbAu0EUOlHRi5nVdVt+38yyNO45m
	 X9I5P0fp9KqD7e9SxWrxD9ef4qQr9xnyx7OVmSJGcxzCJmxYrKbxg7HFCQS+dI0Z9B
	 pMUUrqMh+TXtqNBoyaUDF1FvmVE7rftKO9dQj1fWfG0AZ4xUjQzAiXCJ5rmGhYx04M
	 OFI3+caE4cxPJ1tB04zohXOl0yKdUVNc6hZvKRXJb3LIaDWPln3QIljq24fcEQpzKD
	 9MWy288juni5/63bw4o2lLVVGwT5g6ndehPMmufwKoIPw46Q5LpsgPN3j9mc7KC0mA
	 0AAZp6ikgtJFg==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so786863a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:17:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHlgVq9HT4kg1FO0RZ+g1OVysCNEnrVUu7K61P0Xw0Dauy0PcLfmSznJQaAkqu7X147K/euj/CW1ySnAW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hO/ojCaGB+2tNYCwn7IR1TOGWxAeMmZ9s9vzU9LqN3q6eVyeQ
	5TpJQRdM0OOiWsQH+Aq/pVWTPhQHwhQHRWEMlxiIv4aiIeicl90TX4oSBCZ9YR54mJtYudsgqRs
	r0pXHRRiZXdyhCOrew0L/GkPJg26/tuA=
X-Received: by 2002:a05:6402:320f:b0:6b4:59d0:7294 with SMTP id
 4fb4d7f45d1cf-6ba37e9ec85mr1935077a12.31.1795169819810; Fri, 20 Nov 2026
 02:16:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <C3361EF435F90A22+20261119121937.2447021-1-luoqiu@kylinsec.com.cn>
 <CAAhV-H7037=znoeU3+V086qGuDkRMVeSmt0PKe8DrdiFKcvF0A@mail.gmail.com> <6ADB4C8146800DEE+635e4c74-fbd8-46bc-b1b7-670a35e62cb8@kylinsec.com.cn>
In-Reply-To: <6ADB4C8146800DEE+635e4c74-fbd8-46bc-b1b7-670a35e62cb8@kylinsec.com.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 20 Nov 2026 18:16:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4PM0iPH0mBQy=Tj16b2o_5zNwzEyjd8LqMMQeRQpDxNg@mail.gmail.com>
X-Gm-Features: AclHuK-YmEMq8EzRIlOlYYsJkkRScBGDxyK9YYsJCi-Mgq0THeVmQJWVwOOdbkM
Message-ID: <CAAhV-H4PM0iPH0mBQy=Tj16b2o_5zNwzEyjd8LqMMQeRQpDxNg@mail.gmail.com>
Subject: Re: [PATCH] platform/loongarch: laptop: Fix backlight device lifetime
 on unload
To: Luo Qiu <luoqiu@kylinsec.com.cn>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, Yao Zi <ziyao@disroot.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Zixing Liu <liushuyu@aosc.io>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 5:13=E2=80=AFPM Luo Qiu <luoqiu@kylinsec.com.cn> wr=
ote:
>
>
> On 11/20/26 4:16 PM, Huacai Chen wrote:
> > Hi, Qiu,
> >
> > On Thu, Nov 19, 2026 at 8:22=E2=80=AFPM Luo Qiu <luoqiu@kylinsec.com.cn=
> wrote:
> >> The driver registers a platform backlight device during module init bu=
t
> >> discards the returned pointer. Consequently, the device is never
> >> unregistered when the module is removed, leaving its ops callbacks
> >> pointing into freed module text. After module removal, reading the
> >> backlight's actual_brightness attribute can call the stale callback an=
d
> >> crash the kernel. Registration failures are also silently ignored.
> >>
> >> Store the returned pointer, use it for resume, and unregister it on
> >> module exit. Propagate registration failures to avoid silently
> >> continuing without a backlight device.
> >>
> >> Fixes: 6246ed09111f ("LoongArch: Add ACPI-based generic laptop driver"=
)
> >> Signed-off-by: Luo Qiu <luoqiu@kylinsec.com.cn>
> >> ---
> >>   drivers/platform/loongarch/loongson-laptop.c | 19 +++++++++++++-----=
-
> >>   1 file changed, 13 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/pl=
atform/loongarch/loongson-laptop.c
> >> index 4ec56621db24..ec0742e5ed46 100644
> >> --- a/drivers/platform/loongarch/loongson-laptop.c
> >> +++ b/drivers/platform/loongarch/loongson-laptop.c
> >> @@ -56,6 +56,7 @@ static acpi_handle hotkey_handle;
> >>   static struct key_entry hotkey_keycode_map[GENERIC_HOTKEY_MAP_MAX];
> >>
> >>   static bool bl_powered;
> >> +static struct backlight_device *backlight_dev;
> >>   static int loongson_laptop_backlight_update(struct backlight_device =
*bd);
> >>
> >>   /* 2. ACPI Helpers and device model */
> >> @@ -194,13 +195,12 @@ static int loongson_hotkey_resume(struct device =
*dev)
> >>   {
> >>          int status =3D 0;
> >>          struct key_entry ke;
> >> -       struct backlight_device *bd;
> >>
> >> -       bd =3D backlight_device_get_by_type(BACKLIGHT_PLATFORM);
> >> -       if (bd) {
> >> -               loongson_laptop_backlight_update(bd) ?
> >> +       if (backlight_dev) {
> >> +               loongson_laptop_backlight_update(backlight_dev) ?
> >>                  pr_warn("Loongson_backlight: resume brightness failed=
") :
> >> -               pr_info("Loongson_backlight: resume brightness %d\n", =
bd->props.brightness);
> >> +               pr_info("Loongson_backlight: resume brightness %d\n",
> >> +                               backlight_dev->props.brightness);
> >>          }
> >>
> >>          /*
> >> @@ -409,6 +409,7 @@ static int laptop_backlight_register(void)
> >>   {
> >>          int status =3D 0, ret;
> >>          struct backlight_properties props;
> >> +       struct backlight_device *bd;
> >>
> >>          memset(&props, 0, sizeof(props));
> >>
> >> @@ -426,9 +427,12 @@ static int laptop_backlight_register(void)
> >>          props.power =3D BACKLIGHT_POWER_ON;
> >>          props.type =3D BACKLIGHT_PLATFORM;
> >>
> >> -       backlight_device_register("loongson_laptop",
> >> +       bd =3D backlight_device_register("loongson_laptop",
> >>                                  NULL, NULL, &backlight_laptop_ops, &p=
rops);
> >> +       if (IS_ERR(bd))
> >> +               return PTR_ERR(bd);
> >>
> >> +       backlight_dev =3D bd;
> >>
> >>          return 0;
> >>   }
> >> @@ -622,6 +626,9 @@ static void __exit generic_acpi_laptop_exit(void)
> >>                                  generic_subdriver_exit(&generic_sub_d=
rivers[i]);
> >>                  }
> >>          }
> >> +
> >> +       backlight_device_unregister(backlight_dev);
> > backlight_device_register is called conditionally but
> > backlight_device_unregister() is called unconditionally, I think this
> > is wrong.
> >
> > Huacai
> Hi, Huacai.
>
> Thanks for the review. The unconditional call is intentional and is safe
>
> because backlight_device_unregister() explicitly accepts a NULL device:
>
>      void backlight_device_unregister(struct backlight_device *bd)
>      {
>          if (!bd)
>              return;
>          ...
>      }
>
> backlight_dev is statically initialized to NULL. It is only assigned afte=
r
> backlight_device_register() succeeds and the IS_ERR() check has passed. I=
f
> registration is skipped or fails, the pointer remains NULL, so the call i=
n
> the module exit path is a no-op rather than a NULL dereference.
>
> I can change it to `if (backlight_dev) backlight_device_unregister(...)` =
in
> a follow-up if you prefer that style.
Yes, I think that is better. And it is also better to put this block
before the "if (generic_inputdev)" block.

Huacai

>
> Thanks.
>
> Qiu Luo
> >
> >> +       backlight_dev =3D NULL;
> >>   }
> >>
> >>   module_init(generic_acpi_laptop_init);
> >> --
> >> 2.56.1
> >>
>
