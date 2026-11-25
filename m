Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638142;
	b=SRr7ZW1V04YdwRF3T7dDyaLZspiahW2zjJbt9v9PN4VNodvhdg50C93+XFfJwkjY/HKW
	 0AMOXlWuil4VQwprVM8rBfrdVxa0R8GgoMuWd9QEtbC+bAjDiB9a288T8j2L/nQIshOG2
	 vEXosPvef84I9pgO5+wZCTmsAFQuGTweEsgZNEUFmowTT/nQ+zcZfypre1wWjTv6UREgp
	 fqrE155VHBcrFC7ARookE38t1OLunjSmcF+rJIas4pqz/YleaiKvVOd6pqwW2n4yYUTEo
	 DpTCf4Nxg6kbrzhRnEG9HDBVhkDP5AmsTNZVYinkWVpFg5vH3nXZX/HYFOjgrJaTh5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638142;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XbsPsHDNDZOT3PrL7mmyfMbGA3Nrea04DVo4jF3fclY=;
	b=QxypbdB4y8TpvlbFh4Nkce8EfHCMtNXZ1Gtbx8iy3M6+VGR3BqSLIExmxlq0mlwsBGmf
	 oFgPeog9Cv1CHc25XQfIM+bCNjGUZ8Cur75zaPGRYvN2WDkJeokAgtO8MiFhA0aV7x1Qk
	 nn6YX6lfstI+UzL+5NT2dGFnp0xxZwgE5ydiklHgfjq/iNGDKZ9xhMKZn5ZXK7uTUcyLo
	 ZiLe/PQXzZ1Q4GCmEJapcPglAwUlTKKJUICek36cqqNRYb/pO8RMM6FYjGRo8e8PaxJHG
	 uON02lNMSBfSc0W1rEQBTY0g7cqqNvdvDEFX6/aW/swNjg8+8QD3cSNb/WdVlg/IkoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VMgR/par";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBEB606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VMgR/par
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 718B31F000C6
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795638141;
	bh=XbsPsHDNDZOT3PrL7mmyfMbGA3Nrea04DVo4jF3fclY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VMgR/pardZc5QfYRxFlN06UjN6Ffnq5R7/EFeYbVxQMePpLqUW4AD2LdWAcpm1QIK
	 moWBTdRs5Rjspj82/ZIn1SliMw/+QkNMxkFWoXRHPBRu+ZYKaiomksQc+oNHTMZDIM
	 95+Q3WI0A0uGX0q8REwxZO0zP9L7KH/NrNDO0PlAHImaFjTMr7mZ57a7tf5Q2DAo4W
	 IXHTxnF2BIknLwUmiejcTsDFn1n3/1BjzBk2w9aKROgAR+Q96SbTi6b59vVBqxeJXm
	 KhHTOhcyZelaMhII/rfJPReeTpVV2qm/4jfRO6hJP3Y1ZheLj4buQLN1j2yMnGsLUr
	 dQHUJxVycD3kw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c1a3374400so5041808e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:22:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGj9Wxc/GbAbRNKoXlLkXIlQ592xIjpftkAqrtfjYhMVHvU3KSw8Ct0eOZVF6L9KT1ebnRYlomOf65Y5jg=@vger.kernel.org
X-Gm-Message-State: APuU4Z91xZrLBqxs9qn+2/52qvh9/PE3b946Um/8JFnavwOtnaF6ZOzJ
	e14q9t2rTy1lgYLFJbWdtuyoZKGKzv7hOdUpBDy69wVssoP4X2eoZ+490VPecI0Z3hBNJbq6Vs7
	nFh4uFJiqLxY1qx949mw3EfViboUJ42o=
X-Received: by 2002:a05:6512:3187:b0:5c1:9752:4a4a with SMTP id
 2adb3069b0e04-5c1bc85a157mr5079056e87.65.1795638139884; Wed, 25 Nov 2026
 12:22:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120161020.297735-1-paul.cercueil@bootlin.com> <20261120161020.297735-2-paul.cercueil@bootlin.com>
In-Reply-To: <20261120161020.297735-2-paul.cercueil@bootlin.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 25 Nov 2026 21:22:07 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jeJSx3C8hdU8iAtje-NGNz4DdaVGhE_T3WpVrODuwemg@mail.gmail.com>
X-Gm-Features: Aa3M54qJVQowL3VP6DW9qrB5yt2UPfz-jyeLrSfectOaAsSDv7t8m2R8M7yuJ5Q
Message-ID: <CAJZ5v0jeJSx3C8hdU8iAtje-NGNz4DdaVGhE_T3WpVrODuwemg@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] ACPI: platform: Add basic support for ACPI 6.5
 fixed clock resources
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 5:10=E2=80=AFPM Paul Cercueil <paul.cercueil@bootli=
n.com> wrote:
>
> ACPI 6.5 introduced a clock input resource descriptor, which allows to
> specify in the ACPI tables what clocks are connected to a given device.
>
> This patch adds support for the most basic clock resource, which is the
> one that represents a fixed clock. The new code will then create a
> clk_hw for each fixed clock resource, which is then made available to
> the device drivers, that can obtain it through a regular call to
> clk_get(NULL).
>
> Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
> ---
>
> v5: Register fixed clock as "<ACPI_ID>-clkX" because we need a
>     system-wide identifier there, and we don't have the 16-characters
>     limit there.
>     Register the first clock to clkdev without a name, so that
>     clk_get(NULL) will obtain it.
>     Register every other clock for that ACPI device with a "acpi-clkX"
>     name.
>
> v4: Change clock names to "acpi-clkX", because ACPI devices names can be
>     up to 17 characters long, and our clock name must be 16 characters
>     max.
>
> v3: No change
>
> v2:
> - Use the calculated clock name in devm_clk_hw_register_fixed_rate()
>   instead of the device name
> - Make sure clkres->scale is <=3D 2. The field is 2 bits but the value
>   clkres->scale =3D=3D 3 is not defined in the spec.
> - Compute the fraction numerator using 64-bit math, to make sure it
>   won't overflow on 32-bit systems.
> - Initialize clocks only when the device_type matches
>   ACPI_BUS_TYPE_DEVICE.
> - Use a shorter name for clocks as the hard limit is 16 characters
>   including the terminator.
> ---
>  drivers/acpi/acpi_platform.c | 75 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
>
> diff --git a/drivers/acpi/acpi_platform.c b/drivers/acpi/acpi_platform.c
> index 80ea7121744d..b4f2ccf3e51f 100644
> --- a/drivers/acpi/acpi_platform.c
> +++ b/drivers/acpi/acpi_platform.c
> @@ -10,17 +10,27 @@
>
>  #include <linux/acpi.h>
>  #include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/ioport.h>
> +#include <linux/kconfig.h>
>  #include <linux/kernel.h>
> +#include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> +#include <linux/units.h>
>
>  #include "internal.h"
>
> +struct acpi_clk_data {
> +       struct device *dev;
> +       unsigned int idx;
> +};
> +
>  /* Exclude devices that have no _CRS resources provided */
>  #define ACPI_ALLOW_WO_RESOURCES                BIT(0)
>
> @@ -130,6 +140,68 @@ static unsigned int acpi_platform_resource_count(str=
uct acpi_resource *ares, voi
>         return AE_CTRL_TERMINATE;
>  }

First off, will clocks only be needed for platform devices?  If not,
acpi_add_fixed_clock() should be defined in drivers/acpi/resource.c.

> +static int acpi_add_fixed_clock(struct acpi_resource *res, void *d)
> +{
> +       static const unsigned long clk_scale[] =3D { 1, HZ_PER_KHZ, HZ_PE=
R_MHZ };
> +       struct acpi_resource_clock_input *clkres;
> +       struct acpi_clk_data *data =3D d;
> +       struct device *dev =3D data->dev;
> +       const char *name =3D NULL;
> +       struct clk_hw *clk;
> +       unsigned long rate;
> +       unsigned int idx;
> +       char buf[64];
> +       int err;
> +
> +       if (res->type =3D=3D ACPI_RESOURCE_TYPE_CLOCK_INPUT) {

Maybe

if (res->type !=3D ACPI_RESOURCE_TYPE_CLOCK_INPUT)
        return 1;

> +               clkres =3D &res->data.clock_input;
> +
> +               if (clkres->mode) {
> +                       dev_warn(dev, "Only fixed rate clocks supported f=
or now.\n");

_warn() is likely overkill here and it would be better to print this
relative to an ACPI handle, so use acpi_handle_info().

> +                       return 1; /* keep going */
> +               }
> +
> +               if (clkres->frequency_divisor =3D=3D 0 || clkres->scale >=
 2)
> +                       return -EINVAL;

This is firmware providing bad data, so not -EINVAL.

> +
> +               rate =3D DIV_ROUND_UP_ULL((u64)clkres->frequency_numerato=
r * clk_scale[clkres->scale],
> +                                       clkres->frequency_divisor);
> +
> +               idx =3D data->idx++;
> +
> +               /* When registering a clk_hw the name must be unique acro=
ss all devs */
> +               snprintf(buf, sizeof(buf), "%s-clk%u", dev_name(dev), idx=
);
> +
> +               clk =3D devm_clk_hw_register_fixed_rate(dev, buf, NULL, 0=
, rate);

Why devm_?  This is called at the device creation time, not in probe,
so how/when is clk going to be unregistered?

Also, devm_ doesn't work with struct acpi_device which are never
probed and drivers are never removed from them.

> +               if (IS_ERR(clk))
> +                       return PTR_ERR(clk);
> +
> +               if (idx > 0) {
> +                       /* When registering a clkdev the name must be <=
=3D 16 characters */
> +                       snprintf(buf, sizeof(buf), "acpi-clk%u", idx);
> +                       name =3D buf;
> +               }
> +
> +               err =3D devm_clk_hw_register_clkdev(dev, clk, name, dev_n=
ame(dev));

Same thing about devm_.

> +               if (err)
> +                       return err;
> +       }
> +
> +       return 1;
> +}
> +
> +static void acpi_platform_init_clocks(struct acpi_device *adev)
> +{
> +       struct device *dev =3D &adev->dev;

Note that &adev->dev is not a real device.  It is a "firmware node",
quite like a DT one, but I guess it may be used for registering
clocks.

How is a platform device driver going to use those clocks though?

> +       struct acpi_clk_data data =3D { .dev =3D dev };
> +       LIST_HEAD(list);
> +       int ret;
> +
> +       ret =3D acpi_dev_get_resources(adev, &list, acpi_add_fixed_clock,=
 &data);
> +       if (ret < 0)
> +               dev_err(dev, "Failed to add clock resources: %d\n", ret);
> +}
> +
>  /**
>   * acpi_create_platform_device - Create platform device for ACPI device =
node
>   * @adev: ACPI device node to create a platform device for.
> @@ -196,6 +268,9 @@ struct platform_device *acpi_create_platform_device(s=
truct acpi_device *adev,
>                         }
>                         acpi_dev_free_resource_list(&resource_list);
>                 }
> +
> +               if (IS_ENABLED(CONFIG_COMMON_CLK))
> +                       acpi_platform_init_clocks(adev);
>         }
>
>         memset(&pdevinfo, 0, sizeof(pdevinfo));
> --
