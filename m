Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795784769;
	b=guFrLLmqIQN0AW9pOeiBfVeCT93O3gV1DQmJktLH4s3AAK7E9EQWq5BposwkwuonuteQ
	 bDirDEzFAJe02GqqSmZGypiP/SuSlJclWyPpa31u9G24wHBz1rthlTlxZsFoRKdnAUdwZ
	 XJPP8Eo+j8e4epkQbEphE0QRRNZHs9X6Q2crh+43/9iWUbc2nHD5kbcdez8aLTexKaOPs
	 8Sa0yqQ80eIkFfhkbqkkKrPbHKwz6d6hVGUbMdlg6XuRA6qkSLpkIHHXb24pe7ehB8aH3
	 QXdXgB0pe+sMJ2puIs4Yp2JyzPpqgJzJgYlZrFTCQejCPT+yHarf80aRedpUNj7zMzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rCMabWNVLHo310l5VZlzJENw34NHGgbmW33frc79yEc=;
	b=Hif6Cy8W/R6yOOZtr2YweodumGdIw2xwb9/UVRBzvsAR8oX+13stmsr9gMgWW3HfCY8C
	 cd/lW+oClzV0ehldOAF5IbEBgLlz41fKCWxAreDPkNoUFwAa4aZXt64yIZFO79ECi5Xzs
	 gQ7nq+CnfpYHAat1JWX3cfHc1RycySZYOKgZcTmy6w9bXX8beOA6/ldFRCHwX+ORNtcxW
	 GXQu3n8FN0JkQzxmUQq9relufnhbObDL1uKQEoEOjtsGDs1rLJMqzPWSrQYnMuREtVB5f
	 SqjaJh0F0SYLOv3UD5l2VqHBb8r8w6CF8StZrFORrwsoidSt8sXy+CIVEm/7woZHuVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KHZEWqjV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51310606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51310606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KHZEWqjV
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38190551625so15445943eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:06:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795784767; cv=none;
        d=google.com; s=arc-20260327;
        b=SqvmRR+PJTNJ8GQX8Gu26Mhjo7614ave3u8zz5yud1U8ZDJYUjlEdX0BhtXeisLnlN
         TeWb8XFjk3zupZbX4Y+01KG0WUa0+lJ0CDI0BDcbqW3GoMVB9SXvFQieG4VwYVJOPMRd
         5XVgeFEWeXFLVT0j1t8kE/J2pt8zBwf8nTiKiMlx1AORYwiLFwmWCFiu6DF6FGHX6Qpn
         4x9Pba36UQYGh0o2L8MR4v1OPiBZN1ayfrk0jPe136Hl6EeGwOAUYIciGt2pT0KdVvNY
         L0ShX0je2hE+HGL0HymbRmmR6dlBR7TqSliEAY8Y6OOQ25c5jb+bFxGl3pVEjCoNQCQJ
         2Mng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rCMabWNVLHo310l5VZlzJENw34NHGgbmW33frc79yEc=;
        fh=pnveOQq/MrA03c1sX3eQ+3ePvQgvaaiLsqZsiFHq8zo=;
        b=deKhRN4XDhHTKjaM1BUX69wtHH3hInWGn38lSUKog0dSfqmIs+sMVpgM28SEA9/Ioh
         3HGV3e4SSHK62pKsNm7rrsgvO9U4sY03gkafnenf0vK79vBi/e76u/AreioujWfura2c
         sWf+/7WIBHKd9MxiM+PDu9aWK7cnFNS/HWlkqxY0SEOTKenkcxzsGPu39tRkJP3WewQG
         2rdmv3REitNdehVpIQHGGbsrMAsQhoCijmDhkOy6r6rzRrLdunG6Ww0wwyhzV29mddiS
         GdimaezxG1OcfSq47yQ5lJI2j0PVCFJvljkYFDPxDyOeq+6sLYssXUWmngd/cLQhVdGw
         AKkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795784767; x=1796389567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rCMabWNVLHo310l5VZlzJENw34NHGgbmW33frc79yEc=;
        b=KHZEWqjVnyjsl3HzN9b+pcWjkHqlOZMjdMuuBb1A2MYja/roCirTPdBCJA0tAQYmqZ
         ZUP0cbYhtyOTgoPv8dU0fLsQmYX72Vrj3LG1//TmUp3ttSd3fW17Qgr43OOFVrkoM8Ji
         V9VLovfxGfxR5Mb/Ihd/kXgM6hyllhOB92Pcrjio629HlPgFpF5HNXvTR17iA+jnNNJ0
         OdRVAlc+EKFXcSeUSq/c3yAUPPT0BitzgdQPtXkSr5TehCocLDNuMZp8C/z+PumPT+ZS
         TuFTbiCCZoUYCIUNawMEXLW8aCzkZs5HwWXna1uhWMVu3iJlNFC8FGjRvu8pCx7Er9tU
         ayrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784767; x=1796389567;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCMabWNVLHo310l5VZlzJENw34NHGgbmW33frc79yEc=;
        b=IiLszzwUe+qZCUfsEWz6Jka0EzRBgNfLI5L/xxvIwZnWEAQ9n88z9IhXssYmApwRMG
         4bsKixkI4nW2K5vQMxbUzhXhZlHiDQZGtjGaR6shlAzPeSQieVMjzS1T4wW9y2IDOiZs
         8394Q1pl3xZ1HAGaqt7dVmEtuWB3N5xprrLe3/8d0ncguygGBfwoZAFKV655E2ticyNe
         b9IYo4xsdfF5NbAcJ4v+78SWSbEStjxG59WALfg866DZ3wrwQ1zbc222rJAPrUx0goWL
         2h9WcY5x/bL9Ah7Y5Mrw5G6CFzU7QFNeM/BKlqHSXZbQzKQxLV79CEqH2T2is+uigKIt
         ZRvw==
X-Forwarded-Encrypted: i=1; AL+hErGKKrt+eK8BJbpfvuTKXD5Jsd8z4dU7IDNh3SLpDtRdWNvcljGDTSKfqdbJ6f35jiArRWzn0mIEundQFcA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KF857ax5uFAu73mHExHfWgvj2+Av5HPIKQySQ/tk5Y6NqlQrP
	ruH/9v2nc9p6h0MkZZWcxScyvVpxUGPRE/8AhE7bcVUgkvssnM8L0NpRBTBVVYrnyUxEDlTnWcY
	xN9JnwZrD8cpLzAGbhp92I/EHvldr+p8=
X-Gm-Gg: AZFdTZeorz5u6dRtG6KU1udiJf4mAnMsFqjk4xYs7Nsf9oeWFJ/QKRHEWXOlmgBWRzq
	zYHb/gbpz18Dp3YLdkXg0NlyMX/8NNjEy7TQ/YRjpMOoPccRAqiEZJN08hDom/DftGMe92//K1e
	nBQ/K8sdX1szKfP6KUl5Wq0G92k9BNEsaC8CloV7mcFvc9b8UqZuuaNUXoJjK6oPdKMgJIU28vg
	vkAlvvBBNOIBO531w2ol1r7HjSdrazTMO5OH9OPPLEnbeWQdjXhn1ngGp8o86okwX5LLm++gG8W
	fYbfb8AYppeLdqN/d0EBeftg42rNNyC5kdHCPvhPg/ztwxG+SO3HJIcM5mkbboQSK3GCSwPYcMY
	LWMxPdksLpp9Mo3YrX1I5s08WZfv79YEdWOdDNJXqouuTDZ2yA07HOyi1lZX3mBtbSjjKPBD4+/
	TKDW/bs70NiyfVLK0nrjzhvOKOH97YJQ==
X-Received: by 2002:a05:7300:e9cf:10b0:386:e571:4bb4 with SMTP id
 5a478bee46e88-386e5715040mr4222896eec.13.1795784767152; Fri, 27 Nov 2026
 05:06:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <tWBq0CmbQN-l5IJnxter_A@nvidia.com>
 <CAPVz0n2G2Bw6xyD4zYrEWNZj-SMGXLUeUFOHU6PBy_vketU_JQ@mail.gmail.com> <H5TrL9ZbQaiciaNOSrG3BQ@nvidia.com>
In-Reply-To: <H5TrL9ZbQaiciaNOSrG3BQ@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 15:05:55 +0200
X-Gm-Features: Aa3M54rdw1cA0HsgOk0fYtbEdzf8T5gamsT0cE1c6cvHx-PjQrf9g4uoqAkv38Y
Message-ID: <CAPVz0n3LEEVpEB-e-0Mtr8e5JS4QcEcY02t3bBtMC5N=FAkiTg@mail.gmail.com>
Subject: Re: [PATCH v8 01/12] drm: Add MIPI DBI bus support for MIPI DBI Type
 A and B
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
> On Friday, November 27, 2026 6:06=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
06:16 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > The MIPI DBI bus allows modeling DBI hosts and peripherals using th=
e Linux
> > > > driver model. DBI hosts are registered by their respective drivers.=
 During
> > > > registration, DBI peripherals are created from the device tree node=
s
> > > > provided by the host.
> > > >
> > > > DBI hosts expose operations that can be used by peripheral drivers =
to
> > > > access associated devices.
> > > >
> > > > This implementation adds support for MIPI DBI Type A and Type B onl=
y.
> > > > Type C support existing in drm_mipi_dbi.c was not altered. The fram=
ework
> > > > is modeled to closely resemble the existing MIPI DSI setup for seam=
less
> > > > integration.
> > > >
> > > > Suggested-by: Mikko Perttunen <mperttunen@nvidia.com> # preliminary=
 sketch
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/Makefile           |   2 +-
> > > >  drivers/gpu/drm/drm_mipi_dbi_bus.c | 287 +++++++++++++++++++++++++=
++++
> > > >  include/drm/drm_mipi_dbi_bus.h     | 148 +++++++++++++++
> > > >  3 files changed, 436 insertions(+), 1 deletion(-)
> > > >  create mode 100644 drivers/gpu/drm/drm_mipi_dbi_bus.c
> > > >  create mode 100644 include/drm/drm_mipi_dbi_bus.h
> > > >
> > > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > > index 2c6bc093a923a..880f0dc930b85 100644
> > > > --- a/drivers/gpu/drm/Makefile
> > > > +++ b/drivers/gpu/drm/Makefile
> > > > @@ -166,7 +166,7 @@ obj-$(CONFIG_DRM_KMS_HELPER) +=3D drm_kms_helpe=
r.o
> > > >
> > > >  obj-y                        +=3D tests/
> > > >
> > > > -obj-$(CONFIG_DRM_MIPI_DBI) +=3D drm_mipi_dbi.o
> > > > +obj-$(CONFIG_DRM_MIPI_DBI) +=3D drm_mipi_dbi.o drm_mipi_dbi_bus.o
> > > >  obj-$(CONFIG_DRM_MIPI_DSI) +=3D drm_mipi_dsi.o
> > > >  obj-y                        +=3D arm/
> > > >  obj-y                        +=3D clients/
> > > > diff --git a/drivers/gpu/drm/drm_mipi_dbi_bus.c b/drivers/gpu/drm/d=
rm_mipi_dbi_bus.c
> > > > new file mode 100644
> > > > index 0000000000000..4b51de5bdf0b5
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/drm_mipi_dbi_bus.c
> > > > @@ -0,0 +1,287 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > > +/*
> > > > + * MIPI DBI devices with command transport through parallel interf=
ace
> > > > + *
> > > > + * Copyright 2026 Mikko Perttunen <mperttunen@nvidia.com>
> > > > + * Copyright 2026 Svyatoslav Ryhel <clamor95@gmail.com>
> > > > + */
> > > > +
> > > > +#include <linux/err.h>
> > > > +#include <linux/init.h>
> > > > +#include <linux/of.h>
> > > > +#include <linux/of_device.h>
> > > > +#include <linux/pm_runtime.h>
> > > > +#include <linux/slab.h>
> > > > +
> > > > +#include <drm/drm_mipi_dbi.h>
> > > > +#include <drm/drm_mipi_dbi_bus.h>
> > > > +
> > > > +/**
> > > > + * DOC: overview
> > > > + *
> > > > + * There are three MIPI DBI implementation types:
> > > > + *
> > > > + * A. Motorola 6800-type parallel bus
> > > > + *
> > > > + * B. Intel 8080-type parallel bus
> > > > + *
> > > > + * C. SPI-type with three options:
> > > > + *
> > > > + *    1. 9-bit with the Data/Command signal as the ninth bit
> > > > + *    2. Same as above, except it is sent as 16 bits
> > > > + *    3. 8-bit with the Data/Command signal as a separate D/CX pin
> > > > + *
> > > > + * This library provides a framework for MIPI Display Bus Interfac=
e (DBI)
> > > > + * compatible display controllers using Type A and Type B. This
> > > > + * implementation closely matches existing DSI framework behavior =
to
> > > > + * allow seamless integration.
> > > > + *
> > > > + * Type C options 1 and 3 are covered by drm_mipi_dbi.c with
> > > > + * mipi_dbi_spi_init().
> > > > + */
> > > > +
> > > > +static int mipi_dbi_match(struct device *dev, const struct device_=
driver *driver)
> > > > +{
> > > > +     return of_driver_match_device(dev, driver);
> > > > +}
> > > > +
> > > > +static int mipi_dbi_uevent(const struct device *dev, struct kobj_u=
event_env *env)
> > > > +{
> > > > +     return of_device_uevent_modalias(dev, env);
> > > > +}
> > > > +
> > > > +static const struct dev_pm_ops mipi_dbi_device_pm_ops =3D {
> > > > +     .runtime_suspend =3D pm_generic_runtime_suspend,
> > > > +     .runtime_resume =3D pm_generic_runtime_resume,
> > > > +     .suspend =3D pm_generic_suspend,
> > > > +     .resume =3D pm_generic_resume,
> > > > +     .freeze =3D pm_generic_freeze,
> > > > +     .thaw =3D pm_generic_thaw,
> > > > +     .poweroff =3D pm_generic_poweroff,
> > > > +     .restore =3D pm_generic_restore,
> > > > +};
> > > > +
> > > > +static const struct bus_type mipi_dbi_bus_type =3D {
> > > > +     .name =3D "mipi-dbi",
> > > > +     .match =3D mipi_dbi_match,
> > > > +     .uevent =3D mipi_dbi_uevent,
> > >
> > > These two callbacks are just direct wrappers so I believe we should b=
e
> > > able to set them to of_driver_match_device / of_device_uevent_modalia=
s
> > > directly.
> > >
> >
> > May you specify a bit more please?
>
> mipi_dbi_match just calls of_driver_match_device and mipi_dbi_uevent
> just calls of_device_uevent_modalias. So rather than having the
> mipi_dbi_* functions, we should be able to assign the of_* functions
> here directly.
>

Noted

> >
> > > > +     .pm =3D &mipi_dbi_device_pm_ops,
> > >
> > > I think we can drop setting .pm as well. These callbacks will fall ba=
ck
> > > to the same code (driver callbacks) if we don't set the bus PM ops.
> > >
> >
> > Noted.
> >
> > > > +};
> > > > +
> > > > +static void mipi_dbi_device_release(struct device *dev)
> > > > +{
> > > > +     of_node_put(dev->of_node);
> > > > +     kfree(to_mipi_dbi_device(dev));
> > > > +}
> > > > +
> > > > +static void mipi_dbi_device_unregister(void *data)
> > > > +{
> > > > +     struct device *dev =3D data;
> > > > +
> > > > +     of_node_clear_flag(dev->of_node, OF_POPULATED);
> > > > +     device_unregister(dev);
> > > > +}
> > > > +
> > > > +/**
> > > > + * devm_mipi_dbi_device_register() - create a managed peripheral M=
IPI DBI
> > > > + *                                Type A or B device.
> > > > + * @dev: device to tie the MIPI-DBI device lifetime to
> > > > + * @host: DBI host to which this device is connected
> > > > + * @np: device tree node associated with the panel MIPI DBI device
> > > > + *
> > > > + * This function is called by DBI host driver to create panel devi=
ce.
> > > > + * It automatically calls mipi_dbi_device_unregister() when @dev i=
s
> > > > + * unbound. It does not automatically free passed device node poin=
ter,
> > > > + * it must be put manually.
> > > > + *
> > > > + * Returns:
> > > > + * A pointer to the newly created MIPI DBI device, or, a pointer e=
ncoded
> > > > + * with an error.
> > >
> > > For brevity, I would just use 'an error pointer'.
> > >
> >
> > Noted
> >
> > > > + */
> > > > +struct mipi_dbi_device *
> > > > +devm_mipi_dbi_device_register(struct device *dev, struct mipi_dbi_=
host *host,
> > > > +                           struct device_node *np)
> > > > +{
> > > > +     struct mipi_dbi_device *dbidev;
> > > > +     int ret;
> > > > +
> > > > +     if (!host || !host->dev || !host->dbi || !host->dbi->command =
||
> > > > +         !host->ops || !host->ops->attach || !host->ops->detach ||=
 !np)
> > > > +             return ERR_PTR(-EINVAL);
> > > > +
> > > > +     if (!of_device_is_available(np))
> > > > +             return ERR_PTR(-ENODEV);
> > > > +
> > > > +     dbidev =3D kzalloc_obj(*dbidev);
> > > > +     if (!dbidev)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +
> > > > +     if (of_node_test_and_set_flag(np, OF_POPULATED)) {
> > > > +             kfree(dbidev);
> > > > +             return ERR_PTR(-EBUSY);
> > > > +     }
> > > > +
> > > > +     dbidev->host =3D host;
> > > > +     dbidev->dbi =3D host->dbi;
> > > > +     device_initialize(&dbidev->dev);
> > > > +     dbidev->dev.parent =3D host->dev;
> > > > +     dbidev->dev.bus =3D &mipi_dbi_bus_type;
> > > > +     dbidev->dev.release =3D mipi_dbi_device_release;
> > > > +     device_set_node(&dbidev->dev, of_fwnode_handle(of_node_get(np=
)));
> > > > +
> > > > +     ret =3D dev_set_name(&dbidev->dev, "%s:%s", dev_name(host->de=
v), np->full_name);
> > > > +     if (ret)
> > > > +             goto put_device;
> > > > +
> > > > +     ret =3D device_add(&dbidev->dev);
> > > > +     if (ret)
> > > > +             goto put_device;
> > > > +
> > > > +     ret =3D devm_add_action_or_reset(dev, mipi_dbi_device_unregis=
ter,
> > > > +                                    &dbidev->dev);
> > > > +     if (ret)
> > > > +             return ERR_PTR(ret);
> > > > +
> > > > +     return dbidev;
> > > > +
> > > > +put_device:
> > > > +     of_node_clear_flag(np, OF_POPULATED);
> > > > +     put_device(&dbidev->dev);
> > > > +     return ERR_PTR(ret);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(devm_mipi_dbi_device_register);
> > > > +
> > > > +static void mipi_dbi_detach(void *data)
> > > > +{
> > > > +     struct mipi_dbi_device *dbidev =3D data;
> > > > +
> > > > +     dbidev->host->ops->detach(dbidev->host, dbidev);
> > > > +     dbidev->attached =3D false;
> > > > +}
> > > > +
> > > > +/**
> > > > + * devm_mipi_dbi_attach() - managed attach of peripheral DBI devic=
e to its MIPI
> > > > + *                       DBI Type A or B devices.
> > > > + * @dev: device to tie the MIPI-DBI device lifetime to
> > > > + * @dbidev: DBI peripheral
> > >
> > > Add a return value description. Otherwise inevitably someone will sen=
d
> > > an autogenerated oneline fix to add it.
> > >
> >
> > Noted
> >
> > > > + */
> > > > +int devm_mipi_dbi_attach(struct device *dev, struct mipi_dbi_devic=
e *dbidev)
> > > > +{
> > > > +     int ret;
> > > > +
> > > > +     if (dbidev->attached)
> > > > +             return -EBUSY;
> > > > +
> > > > +     ret =3D dbidev->host->ops->attach(dbidev->host, dbidev);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     dbidev->attached =3D true;
> > > > +     return devm_add_action_or_reset(dev, mipi_dbi_detach, dbidev)=
;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(devm_mipi_dbi_attach);
> > > > +
> > > > +/**
> > > > + * mipi_dbi_write_buffer_multi() - mipi_dbi_command() w/ accum_err=
 but for
> > > > + *                              MIPI DBI Type A and B
> > > > + * @ctx: context for multiple DBI transactions
> > > > + * @cmd: command to be sent
> > > > + * @data: buffer containing data to be transmitted
> > > > + * @len: size of transmission buffer
> > > > + *
> > > > + * Acts like mipi_dbi_command() for MIPI DBI Type C but for Types =
A and B
> > > > + * and deals with errors in a way that makes it convenient to make=
 several
> > > > + * calls in a row.
> > > > + */
> > > > +void mipi_dbi_write_buffer_multi(struct mipi_dbi_multi_context *ct=
x,
> > > > +                              u8 cmd, const u8 *data, size_t len)
> > > > +{
> > > > +     struct mipi_dbi_device *dbidev =3D ctx->dbidev;
> > > > +     struct device *dev =3D &dbidev->dev;
> > > > +     ssize_t ret;
> > >
> > > mipi_dbi_command_stackbuf returns an int, so this can be an int as we=
ll.
> > >
> >
> > This is deliberately void, errors are accumulated in context. This
> > repeats DSI approach.
>
> I mean the type of the 'ret' variable.
>

oh, yes, good find.

> >
> > > > +
> > > > +     if (ctx->accum_err)
> > > > +             return;
> > > > +
> > > > +     ret =3D mipi_dbi_command_stackbuf(dbidev->dbi, cmd, data, len=
);
> > > > +     if (ret < 0) {
> > > > +             ctx->accum_err =3D ret;
> > > > +             dev_err(dev, "sending dcs data %*ph failed: %d\n",
> > > > +                     (int)len, data, ctx->accum_err);
> > > > +     }
> > > > +}
> > > > +EXPORT_SYMBOL(mipi_dbi_write_buffer_multi);
> > > > +
> > > > +static int mipi_dbi_drv_probe(struct device *dev)
> > > > +{
> > > > +     struct mipi_dbi_driver *drv =3D to_mipi_dbi_driver(dev->drive=
r);
> > > > +     struct mipi_dbi_device *dbidev =3D to_mipi_dbi_device(dev);
> > > > +
> > > > +     return drv->probe(dbidev);
> > > > +}
> > > > +
> > > > +static int mipi_dbi_drv_remove(struct device *dev)
> > > > +{
> > > > +     struct mipi_dbi_driver *drv =3D to_mipi_dbi_driver(dev->drive=
r);
> > > > +     struct mipi_dbi_device *dbidev =3D to_mipi_dbi_device(dev);
> > > > +
> > > > +     drv->remove(dbidev);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void mipi_dbi_drv_shutdown(struct device *dev)
> > > > +{
> > > > +     struct mipi_dbi_driver *drv =3D to_mipi_dbi_driver(dev->drive=
r);
> > > > +     struct mipi_dbi_device *dbidev =3D to_mipi_dbi_device(dev);
> > > > +
> > > > +     drv->shutdown(dbidev);
> > > > +}
> > >
> > > This could be simplified slightly by making these (probe, remove,
> > > shutdown) bus-level callbacks (set on mipi_dbi_bus_type). Then the
> > > callback assignments in __mipi_dbi_driver_register are not needed. Th=
e
> > > 'if's do have to move into the bus-level callbacks. This also cleans =
up
> > > the remove callback return type.
> > >
> >
> > I have added these to match DSI behavior as more established framework.
>
> Well, there are other established frameworks that have the bus-level
> functions. But both approaches are pretty much equal in complexity so
> either one is fine.
>

I will test with bus level calls.

> >
> > > > +
> > > > +/**
> > > > + * __mipi_dbi_driver_register() - register a driver for MIPI DBI T=
ype A or B devices.
> > > > + * @drv: DBI driver structure
> > > > + * @owner: owner module
> > > > + *
> > > > + * Return: 0 on success or a negative error code on failure.
> > > > + */
> > > > +int __mipi_dbi_driver_register(struct mipi_dbi_driver *drv, struct=
 module *owner)
> > > > +{
> > > > +     drv->driver.bus =3D &mipi_dbi_bus_type;
> > > > +     drv->driver.owner =3D owner;
> > > > +
> > > > +     if (drv->probe)
> > > > +             drv->driver.probe =3D mipi_dbi_drv_probe;
> > > > +     if (drv->remove)
> > > > +             drv->driver.remove =3D mipi_dbi_drv_remove;
> > > > +     if (drv->shutdown)
> > > > +             drv->driver.shutdown =3D mipi_dbi_drv_shutdown;
> > > > +
> > > > +     return driver_register(&drv->driver);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(__mipi_dbi_driver_register);
> > > > +
> > > > +/**
> > > > + * mipi_dbi_driver_unregister() - unregister a driver for MIPI DBI=
 Type A or B devices.
> > > > + * @drv: DBI driver structure
> > > > + */
> > > > +void mipi_dbi_driver_unregister(struct mipi_dbi_driver *drv)
> > > > +{
> > > > +     driver_unregister(&drv->driver);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(mipi_dbi_driver_unregister);
> > > > +
> > > > +static int __init mipi_dbi_bus_init(void)
> > > > +{
> > > > +     return bus_register(&mipi_dbi_bus_type);
> > > > +}
> > > > +subsys_initcall(mipi_dbi_bus_init);
> > > > +
> > > > +static void __exit mipi_dbi_bus_exit(void)
> > > > +{
> > > > +     bus_unregister(&mipi_dbi_bus_type);
> > > > +}
> > > > +module_exit(mipi_dbi_bus_exit);
> > > > +
> > > > +MODULE_DESCRIPTION("MIPI DBI devices with command transport throug=
h parallel interface");
> > > > +MODULE_LICENSE("GPL");
> > > > diff --git a/include/drm/drm_mipi_dbi_bus.h b/include/drm/drm_mipi_=
dbi_bus.h
> > > > new file mode 100644
> > > > index 0000000000000..6f00a8eef9c67
> > > > --- /dev/null
> > > > +++ b/include/drm/drm_mipi_dbi_bus.h
> > > > @@ -0,0 +1,148 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > > > +/*
> > > > + * MIPI DBI devices with command transport through parallel interf=
ace
> > > > + *
> > > > + * Copyright 2026 Mikko Perttunen <mperttunen@nvidia.com>
> > > > + * Copyright 2026 Svyatoslav Ryhel <clamor95@gmail.com>
> > > > + */
> > > > +
> > > > +#ifndef __DRM_MIPI_DBI_BUS_H__
> > > > +#define __DRM_MIPI_DBI_BUS_H__
> > > > +
> > > > +#include <linux/device.h>
> > > > +#include <linux/module.h>
> > > > +
> > > > +struct device_node;
> > > > +struct mipi_dbi;
> > > > +struct mipi_dbi_device;
> > > > +struct mipi_dbi_host;
> > > > +
> > > > +/**
> > > > + * struct mipi_dbi_host_ops - DBI bus operations for MIPI DBI Type=
 A and B.
> > > > + * @attach: attach DBI device to DBI host
> > > > + * @detach: detach DBI device from DBI host
> > > > + */
> > > > +struct mipi_dbi_host_ops {
> > > > +     int (*attach)(struct mipi_dbi_host *host, struct mipi_dbi_dev=
ice *dev);
> > > > +     void (*detach)(struct mipi_dbi_host *host, struct mipi_dbi_de=
vice *dev);
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct mipi_dbi_host - DBI host device for MIPI DBI Type A and =
B.
> > > > + * @dev: driver model device node for this DBI host
> > > > + * @dbi: MIPI DBI interface
> > > > + * @ops: DBI host operations
> > > > + */
> > > > +struct mipi_dbi_host {
> > > > +     struct device *dev;
> > > > +     struct mipi_dbi *dbi;
> > > > +     const struct mipi_dbi_host_ops *ops;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct mipi_dbi_device - DBI peripheral device for MIPI DBI Typ=
e A and B.
> > > > + *                       This structure describes a peripheral DBI=
 device,
> > > > + *                       an endpoint for DSC commands and video da=
ta, and must
> > >
> > > DCS commands
> > >
> >
> > Nodes
> >
> > > > + *                       be paired with a DBI host device for MIPI=
 DBI Type A
> > > > + *                       and B. This layout is built to closely re=
semble
> > > > + *                       the DSI framework.
> > > > + *
> > > > + *                       If your device is MIPI DBI Type C (with a=
n SPI
> > > > + *                       control bus) and incorporates DBI within,=
 you
> > > > + *                       should use the mipi_dbi_dev structure and=
 Type C
> > > > + *                       framework from drm_mipi_dbi.c.
> > >
> > > I don't think we need to talk about the DSI or Type C frameworks here=
.
> > > drm_mipi_dbi.c already mentions it's for Type C.
> > >
> >
> > I was explicit since Thierry and Maxime were very clear that
> > differences are not described enough.
> >
> > > > + * @dev: driver model device node for this peripheral
> > > > + * @dbi: MIPI DBI interface
> > > > + * @host: DBI host for this peripheral
> > > > + * @attached: the DBI device has been successfully attached
> > > > + */
> > > > +struct mipi_dbi_device {
> > > > +     struct device dev;
> > > > +     struct mipi_dbi *dbi;
> > > > +     struct mipi_dbi_host *host;
> > > > +     bool attached;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct mipi_dbi_multi_context - Context to call multiple MIPI D=
BI funcs in a row
> > > > + * @dbidev: Pointer to the peripheral MIPI DBI Type A and B device
> > > > + * @accum_err: Storage for the accumulated error over the multiple=
 calls
> > > > + *          Init to 0. If a function encounters an error then the =
error code
> > > > + *          will be stored here. If you call a function and this p=
oints to a
> > > > + *          non-zero value then the function will be a noop. This =
allows calling
> > > > + *          a function many times in a row and just checking the e=
rror at the
> > > > + *          end to see if any of them failed.
> > > > + */
> > > > +
> > > > +struct mipi_dbi_multi_context {
> > > > +     struct mipi_dbi_device *dbidev;
> > > > +     int accum_err;
> > > > +};
> > > > +
> > > > +#define to_mipi_dbi_device(__dev)    container_of_const(__dev, str=
uct mipi_dbi_device, dev)
> > > > +
> > > > +void mipi_dbi_write_buffer_multi(struct mipi_dbi_multi_context *ct=
x,
> > > > +                              u8 cmd, const u8 *data, size_t len);
> > > > +
> > > > +/**
> > > > + * mipi_dbi_write_seq_multi() - transmit a command with payload
> > > > + *
> > > > + * This macro will print errors for you and error handling is opti=
mized for
> > > > + * callers that call this multiple times in a row.
> > > > + *
> > > > + * @ctx: context for multiple DBI transactions
> > > > + * @cmd: command to be sent
> > > > + * @seq: buffer containing data to be transmitted
> > > > + */
> > > > +#define mipi_dbi_write_seq_multi(ctx, cmd, seq...)                =
           \
> > > > +     do {                                                         =
           \
> > > > +             static const u8 d[] =3D { seq };                     =
             \
> > > > +             mipi_dbi_write_buffer_multi(ctx, cmd, d, ARRAY_SIZE(d=
));        \
> > > > +     } while (0)
> > > > +
> > > > +struct mipi_dbi_device *
> > > > +devm_mipi_dbi_device_register(struct device *dev, struct mipi_dbi_=
host *host,
> > > > +                           struct device_node *np);
> > > > +int devm_mipi_dbi_attach(struct device *dev, struct mipi_dbi_devic=
e *dbidev);
> > > > +
> > > > +/**
> > > > + * struct mipi_dbi_driver - DBI driver for MIPI DBI Type A and B.
> > > > + * @driver: device driver model driver
> > > > + * @probe: callback for device binding
> > > > + * @remove: callback for device unbinding
> > > > + * @shutdown: called at shutdown time to quiesce the device
> > > > + */
> > > > +struct mipi_dbi_driver {
> > > > +     struct device_driver driver;
> > > > +     int (*probe)(struct mipi_dbi_device *dbi);
> > > > +     void (*remove)(struct mipi_dbi_device *dbi);
> > > > +     void (*shutdown)(struct mipi_dbi_device *dbi);
> > > > +};
> > > > +
> > > > +static inline struct mipi_dbi_driver *
> > > > +to_mipi_dbi_driver(struct device_driver *driver)
> > > > +{
> > > > +     return container_of(driver, struct mipi_dbi_driver, driver);
> > > > +}
> > > > +
> > > > +static inline void *mipi_dbi_get_drvdata(const struct mipi_dbi_dev=
ice *dbi)
> > > > +{
> > > > +     return dev_get_drvdata(&dbi->dev);
> > > > +}
> > > > +
> > > > +static inline void mipi_dbi_set_drvdata(struct mipi_dbi_device *db=
i, void *data)
> > > > +{
> > > > +     dev_set_drvdata(&dbi->dev, data);
> > > > +}
> > > > +
> > > > +int __mipi_dbi_driver_register(struct mipi_dbi_driver *drv, struct=
 module *owner);
> > > > +void mipi_dbi_driver_unregister(struct mipi_dbi_driver *drv);
> > > > +
> > > > +#define mipi_dbi_driver_register(driver) \
> > > > +     __mipi_dbi_driver_register(driver, THIS_MODULE)
> > > > +
> > > > +#define module_mipi_dbi_driver(__mipi_dbi_driver) \
> > > > +     module_driver(__mipi_dbi_driver, mipi_dbi_driver_register, \
> > > > +                     mipi_dbi_driver_unregister)
> > > > +
> > > > +#endif /* __DRM_MIPI_DBI_BUS__ */
> > >
> > > __DRM_MIPI_DBI_BUS_H__
> > >
> >
> > Noted
> >
> > > > --
> > > > 2.53.0
> > > >
> > > >
> > >
> > >
> > >
> > >
>
>
>
>
