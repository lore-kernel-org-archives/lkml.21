Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162631;
	b=Fs1wXHvnRE8+uvE+sdnr5FdgBnw8jXkyP4cX7cR0fa4ApmS2JN0aDsP3dB7mMKrsY9fo
	 kS1zv864vMO9dF8FsKMSnKZzZKLEH7/Atwx48p8iG4x3dsfZKzdZc5wJjfT7Ysgd++B1R
	 8pkd5O36Ouzv6w+lU/tZNePUQZNkDe+fMq5X0qYmPc1OaAA+aNULxDzpRZZpAHk9p5+as
	 YUeuh+q02+1N07Jq/rnytCXMD+/H27v/FbXfTF40obze9nuBNHWcUsYcOvMIADJa98NQ6
	 3MlDzldmCiNfFRe0s8XFjGdiDsCsPTBuy5K0OISjxbBzcRmVcGk3wi/IkzT221qYG3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162631;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qqugXM/ypPq015y+cj21KufNxQ3WaxwLSFccQo4vIk4=;
	b=vI2TbBuFw0NzqKOV1JjK+3v5oMCpjarLPlX9qLHlHbIjNAJqrXNfSpQ1q+nYrOQaxm5x
	 gwLmGEqDD3KwZIGkjQren+O1CijwYquev1q6VCECf2NpOXcjrn0EZjECJOCNk7VQuIigv
	 KBqe5lRzO/n/Fr9gJ7grvtRExInNgTHy+lka7sTh62cSoEsQgqDF2pvVneRSwmn4ltVm4
	 8ufgt4X2WGrVDbaVKC9d01vuSIU6MzodtUZvaZAjm7tzhWU63qk5XkwZNsLffB9cphk61
	 zd5HqLiCUuVQKvfU+du9euO3ZkWeFY+Dw2aYyjutdAz5WGwoJUxMCuSJJdXQ8M1A+Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZhKAgtV+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CF560A2600
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZhKAgtV+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36FF1F000D1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795162631;
	bh=qqugXM/ypPq015y+cj21KufNxQ3WaxwLSFccQo4vIk4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZhKAgtV+iLF32YlXYM7SsKzbG9i9LAu3wAv4sqdqxIzqp3XzHbRzDczK/N6FJisKb
	 CuBf0TrollM9fgqmfEJQTt9Axe4m7yZxD8Yb5pG0gpLJY+VGfzC10aWw5B8nOJfycB
	 /6uUR14c/Qgp8yrT2ScZQ15qI355JkFRfqYTQcIP7DH7Lh3msYo9RfYq16NAe55iqb
	 fJ1Xs1zf3323lmJ88AXR+/zjwbjMGmILJcSga0vLxIV9YI2DFdIw+LDjvjp4jkVjMW
	 z3JwnRSrXbub68lNGb9cIkxdToT/OveMZD9ISOMdCepMKmTVplxNjP7YDmKkfFnr8D
	 4VhFNlzpH0eWg==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b85b58d303so300175a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:17:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGpkA4RxT+PYI0B6f7mD/UARJLVaXp/ZFtunMzHKoqWMgVCyhor59246whM4FFXW195HT5UUXhe0BMz1UI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9raYq+bpp0ht0/iLjPI1gbb+U39WSTZEry/MgQMd6ko1QGqTgp
	OzR197d+5d+jUMiVh7HudaXvzUNIiLroH4SiFia8Asy3jpa/dknPUXlHX1jlrAGXdi1BAs9+WPr
	YGeWCtkQYAUtROlaDxkfjfLnKxn4YlfQ=
X-Received: by 2002:a05:6402:a594:10b0:6b8:a711:65f3 with SMTP id
 4fb4d7f45d1cf-6ba37e935e0mr1100699a12.14.1795162629394; Fri, 20 Nov 2026
 00:17:09 -0800 (PST)
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
In-Reply-To: <C3361EF435F90A22+20261119121937.2447021-1-luoqiu@kylinsec.com.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 20 Nov 2026 16:16:58 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7037=znoeU3+V086qGuDkRMVeSmt0PKe8DrdiFKcvF0A@mail.gmail.com>
X-Gm-Features: AclHuK-3MldchjvZ2Mbp5twdDrLoLp-rfbrZ5YsXDyld-9bOwrDSw_hbmasDlbs
Message-ID: <CAAhV-H7037=znoeU3+V086qGuDkRMVeSmt0PKe8DrdiFKcvF0A@mail.gmail.com>
Subject: Re: [PATCH] platform/loongarch: laptop: Fix backlight device lifetime
 on unload
To: Luo Qiu <luoqiu@kylinsec.com.cn>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, Yao Zi <ziyao@disroot.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Zixing Liu <liushuyu@aosc.io>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Qiu,

On Thu, Nov 19, 2026 at 8:22=E2=80=AFPM Luo Qiu <luoqiu@kylinsec.com.cn> wr=
ote:
>
> The driver registers a platform backlight device during module init but
> discards the returned pointer. Consequently, the device is never
> unregistered when the module is removed, leaving its ops callbacks
> pointing into freed module text. After module removal, reading the
> backlight's actual_brightness attribute can call the stale callback and
> crash the kernel. Registration failures are also silently ignored.
>
> Store the returned pointer, use it for resume, and unregister it on
> module exit. Propagate registration failures to avoid silently
> continuing without a backlight device.
>
> Fixes: 6246ed09111f ("LoongArch: Add ACPI-based generic laptop driver")
> Signed-off-by: Luo Qiu <luoqiu@kylinsec.com.cn>
> ---
>  drivers/platform/loongarch/loongson-laptop.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platf=
orm/loongarch/loongson-laptop.c
> index 4ec56621db24..ec0742e5ed46 100644
> --- a/drivers/platform/loongarch/loongson-laptop.c
> +++ b/drivers/platform/loongarch/loongson-laptop.c
> @@ -56,6 +56,7 @@ static acpi_handle hotkey_handle;
>  static struct key_entry hotkey_keycode_map[GENERIC_HOTKEY_MAP_MAX];
>
>  static bool bl_powered;
> +static struct backlight_device *backlight_dev;
>  static int loongson_laptop_backlight_update(struct backlight_device *bd)=
;
>
>  /* 2. ACPI Helpers and device model */
> @@ -194,13 +195,12 @@ static int loongson_hotkey_resume(struct device *de=
v)
>  {
>         int status =3D 0;
>         struct key_entry ke;
> -       struct backlight_device *bd;
>
> -       bd =3D backlight_device_get_by_type(BACKLIGHT_PLATFORM);
> -       if (bd) {
> -               loongson_laptop_backlight_update(bd) ?
> +       if (backlight_dev) {
> +               loongson_laptop_backlight_update(backlight_dev) ?
>                 pr_warn("Loongson_backlight: resume brightness failed") :
> -               pr_info("Loongson_backlight: resume brightness %d\n", bd-=
>props.brightness);
> +               pr_info("Loongson_backlight: resume brightness %d\n",
> +                               backlight_dev->props.brightness);
>         }
>
>         /*
> @@ -409,6 +409,7 @@ static int laptop_backlight_register(void)
>  {
>         int status =3D 0, ret;
>         struct backlight_properties props;
> +       struct backlight_device *bd;
>
>         memset(&props, 0, sizeof(props));
>
> @@ -426,9 +427,12 @@ static int laptop_backlight_register(void)
>         props.power =3D BACKLIGHT_POWER_ON;
>         props.type =3D BACKLIGHT_PLATFORM;
>
> -       backlight_device_register("loongson_laptop",
> +       bd =3D backlight_device_register("loongson_laptop",
>                                 NULL, NULL, &backlight_laptop_ops, &props=
);
> +       if (IS_ERR(bd))
> +               return PTR_ERR(bd);
>
> +       backlight_dev =3D bd;
>
>         return 0;
>  }
> @@ -622,6 +626,9 @@ static void __exit generic_acpi_laptop_exit(void)
>                                 generic_subdriver_exit(&generic_sub_drive=
rs[i]);
>                 }
>         }
> +
> +       backlight_device_unregister(backlight_dev);
backlight_device_register is called conditionally but
backlight_device_unregister() is called unconditionally, I think this
is wrong.

Huacai

> +       backlight_dev =3D NULL;
>  }
>
>  module_init(generic_acpi_laptop_init);
> --
> 2.56.1
>
