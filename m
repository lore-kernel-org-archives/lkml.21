Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555850;
	b=FZet2ZzXlK6cI891Ow+bZuCj4485VAwdp4zXUN0s34ilEaS/7Qk5dEVJYIT45qaQJ7WA
	 aUC+kYy/e9KP0AAq1V9XqdsKnoH4rPH03XuJmycqWhrhQorfVvHymJnHd7qYRiJZ8X+Pk
	 haasnW/6DEWwMomVR1isa5qPik1uavPAhxHPe/xdOWK9j5Hh6ZsPEsD3SoSD5G/4oaVx2
	 6k3f334sZA8mhPCNCWCn48/WlFgngVarZp6xnlmnfKO17OnMjkbiOA0icXOerkyka63vI
	 Mjs4q4sFGAZ0MZ4QYBBnPf+SSMOF+LjpMcRjJmI2S3di0nQsHkFR104hQJR2Q19AsdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=JTZbfiL8h6libj4MHWHrf7zVUgJWzRuBE28KYs3BHsY=;
	b=Gm7Q4Yi5M67Cmgi1GPxub5Ily6edtHnhMSXRzYtoFS4E7qlChAf+8JoY4CdTiuchDZYY
	 5kdMwbHOTSVEQIc1l7y3hrj0K3Xh+z384MvwXoxqnL/u3TjOxA2jfcSNZ0c8KZYQ2Bf3i
	 nFwc22K2dMTVAF/xQexJF7qLkQtTbydrCp3f0W+ecGcdqWcPOf4LioRuHv8akfSWyUNV4
	 epJ3DDqw1KhDk7N5KlWcRJREJKNHuGuY3GFNx/Ri+lggV8PcqfhHP0rfE6GbCShb3hBUq
	 BuwfBLpCpNX0p4UMrOtNlZkUlV78uf61NDTrEJ62mHREPx6x2vcMVHEUbigikHuuAqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ALHMWXUp;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2F8606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C2F8606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ALHMWXUp
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-9210f2622ccso58352496d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795555841; x=1796160641; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JTZbfiL8h6libj4MHWHrf7zVUgJWzRuBE28KYs3BHsY=;
        b=ALHMWXUpnZEvK9/BEsWmjRwq009fO97rpoTohQDD2Nnq9Wtu5HoHwrosgK3qUsIQp3
         0KMPSp6yyspwsSi77gpjC00nJF+tBAn4jtov3PMXYs8sqPyMX+cORn/l+7ZFn/+e1rUI
         MlaOS1LroW8XwrQ7NOMGapb1Ll5C4pt85bEE0ANFR8mKOprWoHyr1qFsOBt6T36szdd/
         5INgk80TiqJKgKNDAf7c5yiks/lOh4AozkXjMnZBA64i8rqWecbJIYdLk9N61CeowDku
         t62RI7blWr9oDjHCzpEmK+mPaT+/zHSzE1zXOoG4XQOdAQBkbbd2nYFJmkH/ehPqLFN6
         31og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555841; x=1796160641;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JTZbfiL8h6libj4MHWHrf7zVUgJWzRuBE28KYs3BHsY=;
        b=blHZ6xZGtaKmRF/GEdODl1dy8XJ1dz6xeM9xNWikpu1idajYhE6njPf6Y/uC8hjbnI
         pJ3VQDCNpWm/G5UFdJS/jlQE7QqJ0mDsYP/1ZRKMpAFejDGTJEFF70Qv+/deXWzXylV8
         on58fRG0c+gY/b7W+uXRV1ma1O2UpcEV2oosJguEsKulnwoziLCbMlDdQisvEPsEQmzU
         2zg/sdHdsx67eQBMxwcthN3Av0H3iHYifg5zdN0C4QEnHGifwkTfieNG5yu1/si+w9od
         tj5mXzyyrBeTU+J9M2i4Znb/2XwVAhI0+wAhYTTehAVBlfW8QkP49Xyziopki2e2559m
         4glA==
X-Forwarded-Encrypted: i=1; AL+hErEf5lzMeNp1yUb5ej42Ri8K9DOZr14u+Zt1TdshuNb0SGfKjLqYQiRqwJIweFH3M+8dI0hdkGJKRo6Nx1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bMCGUHIBNXuzLEGCygIqBpmbDHqtmK/3USrPSfWiMsQqoMX5h
	h61BtxoLG5fmAXpFlay6S6jsr7tEk6LJo54YzgGgHM2bf6fxrZleeiMcMusGXyFnq+g=
X-Gm-Gg: AZFdTZezgUwtUPzXJD7mi/3YhYRIrI/WmTHg+29DO8iiiYtP3T9TAcBznQAikIoVyOa
	p7XHzYt8eanaSn4xYD+8ya37fPbZkoGwwW7wJ+A3gdwE4LSLJXhElGkMXcrIsNa9iEfELl6Btsa
	N4q1Wgk2YVFIVqk0zuO7o8gtrp24wAZAKmAvXg0T82ooN7/m+ajqp3v6PmV0adnFt9Seja7cw0F
	vIH81jCCFX9M978G2i1mkfteRNYoQh1isgsNeubVtuc7A+eqePzsD15tmTocaSEfqUvz9fz2IpP
	jXkzijWl+6XbT8Kh1C87uCvcKZkxJRNRpP8o4nQT26d5//AtkT0GnwBIN3KvVAhFfcX1GV2Z+ra
	SHzt8dBBElmmgLcL7cJel83DLC6Nai6NvxuEvpls46vfAyChFm4eDUQb8+5MNbfGqUpxmYecYhO
	6zsRkj3iLX9j22ja+Ozfqv/rAa/590uZWaeGgzUIszRsilur7IXW9ZOpxINp6PnBVLw90IRPcCJ
	6ZkhBtVaRBx91olRUUN87UHNN9koZu1czoOipZIXEbfYhufiMilIdCPYgYCwpvQ4Oen+tbturMO
	F6XfapqkaYzKXD2H/RBeM2Q30uX6+418rRWiPIAKmRWlD2SJfni2JT8=
X-Received: by 2002:a05:6214:8616:b0:91f:2374:d001 with SMTP id 6a1803df08f44-92134aef4e6mr298052886d6.25.1795555841277;
        Tue, 24 Nov 2026 13:30:41 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d2322sm147433536d6.19.2026.11.24.13.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:30:40 -0800 (PST)
Message-ID: <e20c4d1d343b3162394c9f900a7bacf698ad04d8.camel@ndufresne.ca>
Subject: Re: [PATCH v2 12/17] media: rockchip: rga: move rockchip_rga
 allocation to master probe
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
Date: Tue, 24 Nov 2026 16:30:39 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-12-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-12-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-0iHuTyOqnMvKgly+r/YZ"
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

--=-0iHuTyOqnMvKgly+r/YZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Move the rockchip_rga struct allocation to the master component probe
> function in preparation of enabling all cores. This also adjusts the
> allocation to use the actual number of cores found in the of tree
> instead of being fixed to one core.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rga/rga.c | 32 ++++++++++++++++++-------=
------
>  1 file changed, 19 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 367df0ee7b02f..37ccac5b406a4 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -741,7 +741,7 @@ static int rga_parse_dt(struct rga_core *core)
>  static int rga_core_bind(struct device *dev, struct device *master, void=
 *data)
>  {
>  =09struct platform_device *pdev =3D to_platform_device(dev);
> -=09struct rockchip_rga *rga;
> +=09struct rockchip_rga *rga =3D data;
>  =09struct rga_core *core;
>  =09struct video_device *vfd;
>  =09int ret =3D 0;
> @@ -750,17 +750,6 @@ static int rga_core_bind(struct device *dev, struct =
device *master, void *data)
>  =09if (!pdev->dev.of_node)
>  =09=09return -ENODEV;
> =20
> -=09rga =3D devm_kzalloc(&pdev->dev, sizeof(*rga) + 1 * sizeof(*rga->core=
s), GFP_KERNEL);
> -=09if (!rga)
> -=09=09return -ENOMEM;
> -
> -=09rga->hw =3D of_device_get_match_data(&pdev->dev);
> -=09if (!rga->hw)
> -=09=09return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match dat=
a\n");
> -
> -=09spin_lock_init(&rga->ctrl_lock);
> -=09mutex_init(&rga->mutex);
> -
>  =09core =3D devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
>  =09if (!core)
>  =09=09return -ENOMEM;
> @@ -941,9 +930,10 @@ static struct platform_driver rga_core_pdrv =3D {
> =20
>  static int rga_bind(struct device *dev)
>  {
> +=09struct rockchip_rga *rga =3D dev_get_drvdata(dev);
>  =09int ret;
> =20
> -=09ret =3D component_bind_all(dev, NULL);
> +=09ret =3D component_bind_all(dev, rga);
>  =09if (ret) {
>  =09=09dev_err(dev, "component bind failed\n");
>  =09=09return ret;
> @@ -968,6 +958,8 @@ static int rga_probe(struct platform_device *pdev)
>  =09struct device *dev =3D &pdev->dev;
>  =09struct component_match *match =3D NULL;
>  =09struct device_node *core_node;
> +=09struct rockchip_rga *rga;
> +=09u8 num_cores =3D 0;
> =20
>  =09if (!match_desc)
>  =09=09return dev_err_probe(dev, -ENODEV, "missing platform data\n");
> @@ -979,6 +971,7 @@ static int rga_probe(struct platform_device *pdev)
>  =09=09of_node_get(core_node);
>  =09=09component_match_add_release(dev, &match, component_release_of,
>  =09=09=09=09=09    component_compare_of, core_node);
> +=09=09num_cores++;
> =20
>  =09=09/*
>  =09=09 * As multi core is not implemented yet,
> @@ -989,6 +982,19 @@ static int rga_probe(struct platform_device *pdev)
>  =09=09break;
>  =09}
> =20
> +=09rga =3D devm_kzalloc(dev, sizeof(*rga) + num_cores * sizeof(*rga->cor=
es), GFP_KERNEL);
> +=09if (!rga)
> +=09=09return -ENOMEM;
> +
> +=09rga->hw =3D match_desc->data;
> +=09if (!rga->hw)
> +=09=09return dev_err_probe(dev, -ENODEV, "failed to get match data\n");
> +
> +=09spin_lock_init(&rga->ctrl_lock);
> +=09mutex_init(&rga->mutex);
> +
> +=09dev_set_drvdata(dev, rga);
> +
>  =09return component_master_add_with_match(dev, &rga_master_ops, match);
>  }
> =20

--=-0iHuTyOqnMvKgly+r/YZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYB/wAKCRDZQZRRKWBy
9ECCAQC+deSrUC8XaYp7KyJkq6hxi/cBcfk+FAraOaSImCZpTQEAlogWlperaC7/
3uOxWQhYh5ZmAsh6d2alRohlL9U3WwE=
=uDa9
-----END PGP SIGNATURE-----

--=-0iHuTyOqnMvKgly+r/YZ--
