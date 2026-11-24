Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555764;
	b=VC4FKZfFRXx3VUOS+3E/5WAv7qrkzUQMC9jJq8mDAYVLeeXQVOrol1c3wJR9zS6PiFdU
	 gI3wkNPZQLEi7+Jt30nHIwdCFBBKFYB/MahF6RVu7gONK4fL1IltUrKfmmWK7cwg0oeVr
	 9x7idkPoXY4qplaek9iMGqnAR2xRVFXwvqNaNA0xdjCzCi8y+Lr0NUIeWBDiZU7nDRitx
	 9y9EJU1oJdzYfokA+luwmvunNvdN4NZ5te9umCChb+jb0b98eXc/BZSc3BiCxRMtE7zdC
	 WDUINApzgQVjdQpP/3/PKZkemNRtz50m/Vms9JL1Na85sp2OMAcNYU7g5Z4E8MZU/MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=ZYHfzvW40ag+3dRlo03Cpx3dIllkxfDQ5o5/y16Uh0I=;
	b=tUeSiGThRuxJS0j4wSOJH8nKq8HTee8udiJ3Ss38Y/ETbH3NEWBfMDQOwWht17DFpSNF
	 lVE5FMdqtLw+bDcHyi0Vu24/MZEKR688TC6o9hofuwSXuW9fmJ1sF1DCeC3UOvOur28/H
	 38PbHasxMoZsrA5L+VUVIr8MbMlo0p/GttHwhJe85bO0GmGiIrW8/sMn7/I0Q0k9cfl+g
	 azYeBICePZbB5/8nQbMyUsg2dc2csyVJVKDuODIigHej6Sz6YVqC27rRYvXzUDJzeBdna
	 lDwvudH8ph8m33ypX4YbayjtPEWVD0i+syEykc/cpTC9HRN+Vr8QrKlMqPKPp1Pd2aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ErlSQlsu;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE81D606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE81D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ErlSQlsu
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91e7fc8265aso59874756d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795555762; x=1796160562; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZYHfzvW40ag+3dRlo03Cpx3dIllkxfDQ5o5/y16Uh0I=;
        b=ErlSQlsuCkRde9ECHhlfqe+iW3EuO9lzrMvLH19iND40oqMetn/9kST4sNKQ1RjhYd
         I0I7oCx1RO8ljS0Yy053sc6no+NNWZEMC3Et3XHIU3UTteW51P7yK2Lxiq4nqSY+r2Z1
         C8q8zZpMl8wv98eXOHNPhXKrSJpK2OZ/sL31qCnN5UXCZOVa2gzKqLXyS0VFdf5VV87K
         Ssyvu61D+qetQEoc/9c1oGiqj41bV1zVxAUb8OvOrWwPTmfN60ffbP7hyO24wi4FoSdA
         XaL3L9MeUujWXQ3oItNjPVdZIZ3+cwHc7hzlGU06blP5BaWH4APT07VzEyM8su1Htxj4
         ssTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555762; x=1796160562;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYHfzvW40ag+3dRlo03Cpx3dIllkxfDQ5o5/y16Uh0I=;
        b=mbsD4TTT2tnhlILNI7a0JpOEH5gx4LtZtZzS4IEiBtO41IP25K6GA6vLPwwJ/bZKrv
         H7ttkOA9E9HVf74E0H0mKZGsS01YrpeMn+Ey8zuguxglF7eLh+LADZ51TVpjln2Cu0vK
         rkKtWj4RWNHbnHMbYI/fUqa1u59oNUa1K7jH0b8wsrhrYg1FEqner8I2ERR6zyRbpWSr
         ZmkeG1yL0mrBq2fd2UmJSTQ1A6SdwutTxdOI+4Fty6Zx5rY5+Cvn2iGkUr2pN+s1RtsA
         5HWjx2vqwOJif1WkFPPy2g9+0OFt0mm2itB535VRTfpANXcVj95RHW72YSy6+jx7aaor
         VATA==
X-Forwarded-Encrypted: i=1; AL+hErGKp+gSWcjJtPFBDxFuQD7PHvL4JzROlnkiqr716MHev0n/Xr3BtZdo5nRjzR4C8R7Em9vCcatgaC1B6Jw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9pnQJqrgtzOk9NLq/TNATCP+daUX7DisDR0v9ajcwzErC1lbN
	z9nuGwFTBu70MAYP7JEWQOOLhrKpjo48z5lZoztSNjFXDzYwV8dbOLW9BnF22P4SrxM=
X-Gm-Gg: AZFdTZfYPKRid7jUe9Sei/3dHNTZK50TECLYJnlfrBnkGWa+FUefZXDWcbdMJaqeqfu
	agxVaKyHxSwSWDanzBPMLxbhvvrNmxegdQbTvA6hWFiqqA7r5vjzrWaCscQ0hKrYqt7HOhqYGRa
	CXkrekIKdB/Hy7NzhybHmR3ZNzolu8gAS7/efb21G66/s0G0WE17x/vIV63pthmJjxRJELvyoCF
	nDu49x6dg4SJIu1kvbqvQe7IGj4N8vCKme+PLi3pix9e1ic/AFsLjMXpc+LIWe5y2yRmGqLwn/m
	fB7hCyPbWcgxJItUcYgF13WiMB/GVdgFSyHmTCd2Bl3EWQPek/paGs31iqrShM16qvTzTAG3y5F
	yXnzvk+XlVQsvWqu1Qq/hZ8eTNc7J33bDwRyTmFMjozVy1w6pirqGe3r/dqGoAsMkAZh6YLkUJH
	Fi8Y4LfsLO3F3EPyjbnjFL/OCA5+en1HM6dq0D6AB5PjhPSUl3qMmH2YRqHUUKvBqaDD3hoAZXR
	pdjfGu5dxaPayb/THMlkJ08qn4BjoYyITcdoCWfErEP4i5LhVlPjJwJfJ6xgCid7foVYuHm3hRi
	4qJrl0v4+6/uuyKmsPyynG6ezSJ3m6uFXm10STYVlT5Pzwj54kMn8AA=
X-Received: by 2002:a05:6214:8507:10b0:921:1e1b:1e18 with SMTP id 6a1803df08f44-92134b0e51cmr220893876d6.39.1795555762340;
        Tue, 24 Nov 2026 13:29:22 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b456csm147238306d6.13.2026.11.24.13.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:29:21 -0800 (PST)
Message-ID: <42e8fa9d09b2f773b4b46fd95e3b499163d81267.camel@ndufresne.ca>
Subject: Re: [PATCH v2 11/17] media: rockchip: rga: use components to manage
 multiple cores
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Philipp Zabel
	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, Guangshuo Li
 <lgs201920130244@gmail.com>
Date: Tue, 24 Nov 2026 16:29:20 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-11-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-11-23aa2cb74e61@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-YumGT0JQ7SArZD4eF1gq"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-YumGT0JQ7SArZD4eF1gq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Use component helpers to manage multiple cores and aggregate them into a
> central master device. This gives us a dedicated master device and
> ensures that all cores (components) are properly set up before creating
> the video device.
>=20
> This commit only sets up a basic component device. Instead of the
> rga_disable_multicore function only the first core is added to the
> master device. To avoid the secondary core creating an additional video
> device the whole core probe implementation is moved to the bind method,
> which is only called when the core is bound to a master device.
>=20
> As we use devres (devm_*) functions for resource cleanup in the probe,
> it is technically incorrect to use them in a component bind function.
> It'll be properly split out again in the follow-up commits to avoid
> having one big migration commit.
>=20
> The implementation is based on the etnaviv gpu driver, which also groups
> multiple gpu cores under a single etnaviv master device.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20
> ---
> v2
> - clarify that devres in component bind functions is technically
>   incorrect and only done to keep the commits split up
> - use dev_err_probe instead of dev_err + return for a failed
>   component_add
> - remove if (!match) check in rga_probe, as it's only called when we
>   have found at least one dt entry (and sashiko pointed out that it's
>   an err ptr)
> - add platform_device_id table to avoid a manual binding
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 263 ++++++++++++++++++++++++=
------
>  1 file changed, 209 insertions(+), 54 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index bcfc19d29af74..367df0ee7b02f 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -5,6 +5,7 @@
>   */
> =20
>  #include <linux/clk.h>
> +#include <linux/component.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/fs.h>
> @@ -737,51 +738,9 @@ static int rga_parse_dt(struct rga_core *core)
>  =09return 0;
>  }
> =20
> -/*
> - * Some SoCs, like RK3588 have multiple identical RGA3 cores, but the
> - * kernel is currently missing support for multi-core handling. Exposing
> - * separate devices for each core to userspace is bad, since that does
> - * not allow scheduling tasks properly (and creates ABI). With this work=
around
> - * the driver will only probe for the first core and early exit for the =
other
> - * cores. Once the driver gains multi-core support, the same technique
> - * for detecting the main core can be used to cluster all cores together=
.
> - */
> -static int rga_disable_multicore(struct device *dev)
> -{
> -=09struct device_node *node =3D NULL;
> -=09const char *compatible;
> -=09bool is_main_core;
> -=09int ret;
> -
> -=09/* Intentionally ignores the fallback strings */
> -=09ret =3D of_property_read_string(dev->of_node, "compatible", &compatib=
le);
> -=09if (ret)
> -=09=09return ret;
> -
> -=09/* The first compatible and available node found is considered the ma=
in core */
> -=09do {
> -=09=09node =3D of_find_compatible_node(node, NULL, compatible);
> -=09=09if (of_device_is_available(node))
> -=09=09=09break;
> -=09} while (node);
> -
> -=09if (!node)
> -=09=09return -EINVAL;
> -
> -=09is_main_core =3D (dev->of_node =3D=3D node);
> -
> -=09of_node_put(node);
> -
> -=09if (!is_main_core) {
> -=09=09dev_info(dev, "missing multi-core support, ignoring this instance\=
n");
> -=09=09return -ENODEV;
> -=09}
> -
> -=09return 0;
> -}
> -
> -static int rga_probe(struct platform_device *pdev)
> +static int rga_core_bind(struct device *dev, struct device *master, void=
 *data)
>  {
> +=09struct platform_device *pdev =3D to_platform_device(dev);
>  =09struct rockchip_rga *rga;
>  =09struct rga_core *core;
>  =09struct video_device *vfd;
> @@ -791,10 +750,6 @@ static int rga_probe(struct platform_device *pdev)
>  =09if (!pdev->dev.of_node)
>  =09=09return -ENODEV;
> =20
> -=09ret =3D rga_disable_multicore(&pdev->dev);
> -=09if (ret)
> -=09=09return ret;
> -
>  =09rga =3D devm_kzalloc(&pdev->dev, sizeof(*rga) + 1 * sizeof(*rga->core=
s), GFP_KERNEL);
>  =09if (!rga)
>  =09=09return -ENOMEM;
> @@ -900,9 +855,10 @@ static int rga_probe(struct platform_device *pdev)
>  =09return ret;
>  }
> =20
> -static void rga_remove(struct platform_device *pdev)
> +static void rga_core_unbind(struct device *dev, struct device *master,
> +=09=09=09    void *data)
>  {
> -=09struct rga_core *core =3D platform_get_drvdata(pdev);
> +=09struct rga_core *core =3D dev_get_drvdata(dev);
>  =09struct rockchip_rga *rga =3D core->rga;
> =20
>  =09v4l2_info(&rga->v4l2_dev, "Removing\n");
> @@ -912,6 +868,27 @@ static void rga_remove(struct platform_device *pdev)
>  =09v4l2_device_unregister(&rga->v4l2_dev);
>  }
> =20
> +static const struct component_ops rga_core_ops =3D {
> +=09.bind =3D rga_core_bind,
> +=09.unbind =3D rga_core_unbind,
> +};
> +
> +static int rga_core_probe(struct platform_device *pdev)
> +{
> +=09int ret =3D 0;
> +
> +=09ret =3D component_add(&pdev->dev, &rga_core_ops);
> +=09if (ret < 0)
> +=09=09return dev_err_probe(&pdev->dev, ret, "failed to register componen=
t\n");
> +
> +=09return 0;
> +}
> +
> +static void rga_core_remove(struct platform_device *pdev)
> +{
> +=09component_del(&pdev->dev, &rga_core_ops);
> +}
> +
>  static int __maybe_unused rga_runtime_suspend(struct device *dev)
>  {
>  =09struct rga_core *core =3D dev_get_drvdata(dev);
> @@ -928,11 +905,12 @@ static int __maybe_unused rga_runtime_resume(struct=
 device *dev)
>  =09return clk_bulk_prepare_enable(core->num_clks, core->clks);
>  }
> =20
> -static const struct dev_pm_ops rga_pm =3D {
> +static const struct dev_pm_ops rga_core_pm =3D {
>  =09SET_RUNTIME_PM_OPS(rga_runtime_suspend,
>  =09=09=09   rga_runtime_resume, NULL)
>  };
> =20
> +/* add new compatibles also to the rga_ids struct */
>  static const struct of_device_id rockchip_rga_match[] =3D {
>  =09{
>  =09=09.compatible =3D "rockchip,rk3288-rga",
> @@ -951,17 +929,194 @@ static const struct of_device_id rockchip_rga_matc=
h[] =3D {
> =20
>  MODULE_DEVICE_TABLE(of, rockchip_rga_match);
> =20
> +static struct platform_driver rga_core_pdrv =3D {
> +=09.probe =3D rga_core_probe,
> +=09.remove =3D rga_core_remove,
> +=09.driver =3D {
> +=09=09.name =3D RGA_NAME "-core",
> +=09=09.pm =3D &rga_core_pm,
> +=09=09.of_match_table =3D rockchip_rga_match,
> +=09},
> +};
> +
> +static int rga_bind(struct device *dev)
> +{
> +=09int ret;
> +
> +=09ret =3D component_bind_all(dev, NULL);
> +=09if (ret) {
> +=09=09dev_err(dev, "component bind failed\n");
> +=09=09return ret;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static void rga_unbind(struct device *dev)
> +{
> +=09component_unbind_all(dev, NULL);
> +}
> +
> +struct component_master_ops rga_master_ops =3D {
> +=09.bind =3D rga_bind,
> +=09.unbind =3D rga_unbind,
> +};
> +
> +static int rga_probe(struct platform_device *pdev)
> +{
> +=09const struct of_device_id *match_desc =3D pdev->dev.platform_data;
> +=09struct device *dev =3D &pdev->dev;
> +=09struct component_match *match =3D NULL;
> +=09struct device_node *core_node;
> +
> +=09if (!match_desc)
> +=09=09return dev_err_probe(dev, -ENODEV, "missing platform data\n");
> +
> +=09for_each_compatible_node(core_node, NULL, match_desc->compatible) {
> +=09=09if (!of_device_is_available(core_node))
> +=09=09=09continue;
> +
> +=09=09of_node_get(core_node);
> +=09=09component_match_add_release(dev, &match, component_release_of,
> +=09=09=09=09=09    component_compare_of, core_node);

I believe sashiko strange report will go away with the added missing return=
.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> +
> +=09=09/*
> +=09=09 * As multi core is not implemented yet,
> +=09=09 * break out of the loop to only have one core per rockchip_rga st=
ruct.
> +=09=09 * Also put the node, which otherwise would've been done by the lo=
op iteration.
> +=09=09 */
> +=09=09of_node_put(core_node);
> +=09=09break;
> +=09}
> +
> +=09return component_master_add_with_match(dev, &rga_master_ops, match);
> +}
> +
> +static void rga_remove(struct platform_device *pdev)
> +{
> +=09component_master_del(&pdev->dev, &rga_master_ops);
> +}
> +
> +/*
> + * Keep in sync with the compatible names of rockchip_rga_match, as we n=
ame the
> + * virtual component master platform device (allocating the /dev/video d=
evice)
> + * based on the compatible value.
> + */
> +static struct platform_device_id rga_ids[] =3D {
> +=09{
> +=09=09.name =3D "rockchip,rk3288-rga",
> +=09},
> +=09{
> +=09=09.name =3D "rockchip,rk3399-rga",
> +=09},
> +=09{
> +=09=09.name =3D "rockchip,rk3588-rga3",
> +=09},
> +=09{},
> +};
> +
>  static struct platform_driver rga_pdrv =3D {
>  =09.probe =3D rga_probe,
>  =09.remove =3D rga_remove,
>  =09.driver =3D {
>  =09=09.name =3D RGA_NAME,
> -=09=09.pm =3D &rga_pm,
> -=09=09.of_match_table =3D rockchip_rga_match,
>  =09},
> +=09.id_table =3D rga_ids,
>  };
> =20
> -module_platform_driver(rga_pdrv);
> +static bool rga_of_has_available_node(const char *compat)
> +{
> +=09struct device_node *node;
> +
> +=09for_each_compatible_node(node, NULL, compat) {
> +=09=09if (of_device_is_available(node)) {
> +=09=09=09of_node_put(node);
> +=09=09=09return true;
> +=09=09}
> +=09}
> +
> +=09return false;
> +}
> +
> +static int rga_create_platform_device(struct platform_device **ppdev,
> +=09=09=09=09      const struct of_device_id *match)
> +{
> +=09struct platform_device *pdev;
> +=09int ret;
> +
> +=09pdev =3D platform_device_alloc(match->compatible, PLATFORM_DEVID_NONE=
);
> +=09if (!pdev)
> +=09=09return -ENOMEM;
> +
> +=09ret =3D platform_device_add_data(pdev, match, sizeof(*match));
> +=09if (ret)
> +=09=09goto free_platform_device;
> +
> +=09ret =3D platform_device_add(pdev);
> +=09if (ret)
> +=09=09goto free_platform_device;
> +
> +=09*ppdev =3D pdev;
> +
> +=09return 0;
> +
> +free_platform_device:
> +=09platform_device_put(pdev);
> +=09return ret;
> +}
> +
> +static struct platform_device *master_pdevs[ARRAY_SIZE(rockchip_rga_matc=
h) - 1];
> +
> +static int __init rga_init(void)
> +{
> +=09int ret;
> +=09unsigned int i;
> +
> +=09ret =3D platform_driver_register(&rga_core_pdrv);
> +=09if (ret !=3D 0)
> +=09=09return ret;
> +
> +=09ret =3D platform_driver_register(&rga_pdrv);
> +=09if (ret !=3D 0)
> +=09=09goto unregister_core_driver;
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(master_pdevs); i++) {
> +=09=09if (!rga_of_has_available_node(
> +=09=09=09    rockchip_rga_match[i].compatible))
> +=09=09=09continue;
> +
> +=09=09ret =3D rga_create_platform_device(&master_pdevs[i],
> +=09=09=09=09=09=09 &rockchip_rga_match[i]);
> +=09=09if (ret)
> +=09=09=09goto unregister_platform_devices;
> +=09}
> +
> +=09return 0;
> +
> +unregister_platform_devices:
> +=09for (i =3D 0; i < ARRAY_SIZE(master_pdevs); i++) {
> +=09=09platform_device_unregister(master_pdevs[i]);
> +=09=09master_pdevs[i] =3D NULL;
> +=09}
> +=09platform_driver_unregister(&rga_pdrv);
> +unregister_core_driver:
> +=09platform_driver_unregister(&rga_core_pdrv);
> +=09return ret;
> +}
> +module_init(rga_init);
> +
> +static void __exit rga_exit(void)
> +{
> +=09unsigned int i;
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(master_pdevs); i++) {
> +=09=09platform_device_unregister(master_pdevs[i]);
> +=09=09master_pdevs[i] =3D NULL;
> +=09}
> +=09platform_driver_unregister(&rga_pdrv);
> +=09platform_driver_unregister(&rga_core_pdrv);
> +}
> +module_exit(rga_exit);
> =20
>  MODULE_AUTHOR("Jacob Chen <jacob-chen@iotwrt.com>");
>  MODULE_DESCRIPTION("Rockchip Raster 2d Graphic Acceleration Unit");

--=-YumGT0JQ7SArZD4eF1gq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYBsAAKCRDZQZRRKWBy
9CXrAP9p8J3PfxEU1BcmlcPUVCSyirXeW04S1YI+I1IelGesTQEAgequSTj6lZL3
T3Dtx/C1iOZc7EdcwIUwbbCvoXV9Tgs=
=UMnL
-----END PGP SIGNATURE-----

--=-YumGT0JQ7SArZD4eF1gq--
