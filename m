Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556289;
	b=KBBwO8IdN38RBgrIKG3cS8I8O/yJsoKwQ7oQ1PtlXZKKvdW1A6GOvUcu37Grn/NKIP0D
	 auYkD3kRLRnrQm7iwlbZJv8xfWW2Q7bHaG7I3ypZ25mwmmIBpf8chsGZpfQBI1uznet8i
	 tBtvCfvhmEcw4ao+zSSgZBa01ageUYe2P9ByocTEd+Dj3i60PG9DBFPGg/rgelH3oAl7D
	 bA/M/SfO+9Y/bnSfnmkES1zbLO+O4uiQlSP4jxasPmxULbXQPIdCk3E28bComgaDHyfAx
	 LOXZbUcbIVOw/1Cc8gVYonjT7LntMHc5fBGA2ANatZQzi/JyQUwdALmXI4WO/4VJOuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=XvU8I+vB/hnkSYqyvTC9KODVvqvC++EcA5WWKHIkmy4=;
	b=LXlI3S3hUnXMaGGIEKMqhE5urtiXsHzUf6wEKialhQx01CgJL84Yp9wbnP7h42pBFQkn
	 b8bVHVpT6HimxKa2u1ASmkreF5IDShnIfNm/rhMAyuP8H4jLug/Nkg+u/B2t6jUQXdVy6
	 pO/JWZRjeGvQCtKq5SjBIEoKxjJyQ8W+TQvWq+yUdu+y6zGmuTgJuBcwpqec5CLID8M+r
	 X/fiTvyhA8ds3Ixjh462SZP1I4ifV4TY3+AlafvtYmZQiZmnQCoNd2ooC0lVol/hIIf4S
	 ugXLiBe20Ksg3LFafEDyLdJtuPG/Y2MJJIm08TTPPVRzWc5680dLJI+lTQRl5C90VqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pAbrDNwn;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C969C606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C969C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pAbrDNwn
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-949680e6d83so456320585a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795556288; x=1796161088; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XvU8I+vB/hnkSYqyvTC9KODVvqvC++EcA5WWKHIkmy4=;
        b=pAbrDNwnBini7SLwKbiQ7kjL49InunWlLHbZ8hHQiD6klRXxTneekfApUSaJt/lUrJ
         RYX0yHob3ShFVX8L1xveCyMh9cOoAgF1Hw4Wa7VhZ8mMR3mJ1e65YzRxzzWmuo0BYvMS
         jxLkO8ACKD5V5a3rStOhvl7XyQHTtuCEX07DEPXQ8yzi8PrQgbPGmrV/ZrqU/a+b9pqV
         j0kjIelpZo9qklBJpTA9nylJwwWxF8EoN07Z2mS/8wQmIL/FYWF26C7xiEV6aVQzzPVb
         u32TsUSoCr9BSCaflqzQvvz7+WISjClQEgR+Mn19xvkrOtK6RgulWB7UFTdq4xTGiYaF
         2lzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556288; x=1796161088;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvU8I+vB/hnkSYqyvTC9KODVvqvC++EcA5WWKHIkmy4=;
        b=xKld6cJW09jc/Hx1EMWGQVNhGTC02HfH4R6tXvWvegqyqqNh3ANKmIQb0/tltaOrtn
         vPYKdcdNZfMo/7FqR6y/xAJmBBIQ2YcHTL0TkKoEIv6biTd1+SSLrNbEDsh/dIVZkO00
         4D6WjqsDMcM+PbGE+9AgCKUro9xTgD6TKrAo7DJ7bN1zb3RU24TavPA1RTk7/7spADEo
         AtMHlx9pTBOsdso47LzYJ31/d2vWOuCACnAQTfGVNqw4ge194X7G9f56vrCo5j8OjW/q
         Mj8eMY5GfSqS+GkZZvs/Y3kVBBMQxNuf5uyGvkmuZ6at0b61cIz0o/2SS7XGJeijthfB
         P9dw==
X-Forwarded-Encrypted: i=1; AL+hErFdrz0eTFXZtHThFx1okdefKF6CH/6wAC5f9Hef7NW3TnkWVcPpYFxy+fWN31hyH0RUR6cK3IiNDcYE7w4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IHFwT/dSJPDHlsygeQ+XBKOmc0VKk9sI2ou/4j6EdhnV44ldb
	HSnPUmOXAeM2ls5rInSB26UMoD/B1XRR+a6NJzKDEz/MQlnL1xIvB5TOkz90Zef/g4o=
X-Gm-Gg: AZFdTZc3jwYuXpC+mUBmpEdpaHIMP1MCPB6aYoFf/7Tnb1Aq7SjrysNiuu9udl1VQV7
	2te6r7QXxynuN4pXApkGERwCcD7t1rvGo8QFZjHpjkVFco2FBor0ctHIotOjumeew2XOTJM2EYa
	on19AeJZxT//1bSyAfzNzMTKknvWiCrGGnEEi6gfQvPTnq4lGWymxXVshA9o1ljymk/wq3t5rsd
	+e4qFsr7rh9OdqCofmcWgv1PFNr+FuoWMwKLo9pk/8Q7CsFvbzWjTFYDtwZ7Ih8DDDa9h5oHHtP
	P+xwc/gnURmBTYicIosLO4r93tYB/CjFzpbZBWmQfAolzkbYMgu3DpnruCskh0NSa/mI2R2lnVg
	m+VUagv6rUbJ7SU12Mnq9P/3YzanhJsTXm16m5c5QRxRlUUdMwL0/mPIfvSbtQwST5jbbrNRSVA
	wGkyRl366DEsU/nFw2JZsPmDx6K2ixYGLxwgrmGaa7vdrVEUbPfXhQ8okj3U8gkbg4VCVi3MEaG
	oarLZzgdfi/PYsN5gAlSRs0CKumnBjIFBCAmtsyjumizd0iK/VOM+WVf8M43vzHkkkplJX71elm
	jCLIOE2y/Oi1O9AFIumjuMio0UBOF52j4X6oDYqQd4N7G7dbi02GSSc=
X-Received: by 2002:a05:620a:2988:b0:93e:c12c:f11f with SMTP id af79cd13be357-949bab3a1edmr2796314185a.75.1795556287741;
        Tue, 24 Nov 2026 13:38:07 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb4481c2sm1133265885a.43.2026.11.24.13.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:38:07 -0800 (PST)
Message-ID: <5282c61813191d778e724ea27e0b81c554ccc945.camel@ndufresne.ca>
Subject: Re: [PATCH v2 14/17] media: rockchip: rga: move video device to the
 master
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
Date: Tue, 24 Nov 2026 16:38:06 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-14-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-14-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-0uIQZovRXgZxDGcSLoFT"
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

--=-0uIQZovRXgZxDGcSLoFT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Move the video device allocation and registration to the master
> component bind function in preparation for binding multiple cores
> to the master. Moving it to the master bind function allows to
> only register the v4l2 device when all cores have been successfully
> bound to the master device. This also causes the video device to be
> bound against the master platform device instead of a specific core.
>=20
> As v4l2_device_register sets the drvdata (if it hasn't been set) to it's
> v4l2_device struct pointer, v4l2_device_unregister also zeroes it if the
> drvdata matches this pointer. This creates a problem, as the driver
> allocates it's main rockchip_rga struct during probe and sets it as it's
> drvdata. As the v4l2_device struct is the first element of the
> rockchip_rga struct, it has the same pointer than the rockchip_rga
> struct. Therefore v4l2_device_unregister incorrectly assumes that it has
> set the drvdata and clears it. This causes problems, as unbinding a
> core will unbind the master component, but not remove it. Therefore when
> adding the core again, the master component will be bound again and
> tries to access an NULL pointer.
>=20
> As the rga core binding expects the rockchip_rga struct to be fully
> initialized, bind the cores as the last step of the rga master bind.
> This also avoids a potential isr to hit just between the core bind and
> the actual initialization of the m2m device.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20
> ---
> v2
> - unbind components in the error handling of rga bind
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D11)
> - Bind cores at the end, as they expect a fully initialized rga struct
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D11)
> - Fix v4l2_device_unregister clearing the drvdata set on probe
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 109 ++++++++++++++++--------=
------
>  1 file changed, 58 insertions(+), 51 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index fa34b93b1b7a5..39fcb5623095b 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -746,39 +746,15 @@ static int rga_core_bind(struct device *dev, struct=
 device *master, void *data)
>  {
>  =09struct rockchip_rga *rga =3D data;
>  =09struct rga_core *core =3D dev_get_drvdata(dev);
> -=09struct video_device *vfd;
>  =09int ret =3D 0;
> =20
>  =09core->rga =3D rga;
> =20
>  =09rga->cores[0] =3D core;
> =20
> -=09ret =3D v4l2_device_register(dev, &rga->v4l2_dev);
> -=09if (ret)
> -=09=09return ret;
> -=09vfd =3D video_device_alloc();
> -=09if (!vfd) {
> -=09=09v4l2_err(&rga->v4l2_dev, "Failed to allocate video device\n");
> -=09=09ret =3D -ENOMEM;
> -=09=09goto unreg_v4l2_dev;
> -=09}
> -=09*vfd =3D rga_videodev;
> -=09vfd->lock =3D &rga->mutex;
> -=09vfd->v4l2_dev =3D &rga->v4l2_dev;
> -
> -=09video_set_drvdata(vfd, rga);
> -=09rga->vfd =3D vfd;
> -
> -=09rga->m2m_dev =3D v4l2_m2m_init(&rga_m2m_ops);
> -=09if (IS_ERR(rga->m2m_dev)) {
> -=09=09v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
> -=09=09ret =3D PTR_ERR(rga->m2m_dev);
> -=09=09goto rel_vdev;
> -=09}
> -
>  =09ret =3D pm_runtime_resume_and_get(core->dev);
>  =09if (ret < 0)
> -=09=09goto rel_m2m;
> +=09=09return ret;
> =20
>  =09rga->version =3D rga->hw->get_version(core);
> =20
> @@ -787,38 +763,13 @@ static int rga_core_bind(struct device *dev, struct=
 device *master, void *data)
> =20
>  =09pm_runtime_put(core->dev);
> =20
> -=09ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, -1);
> -=09if (ret) {
> -=09=09v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
> -=09=09goto rel_m2m;
> -=09}
> -
> -=09v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
> -=09=09  vfd->name, video_device_node_name(vfd));
> -
>  =09return 0;
> -
> -rel_m2m:
> -=09v4l2_m2m_release(rga->m2m_dev);
> -rel_vdev:
> -=09video_device_release(vfd);
> -unreg_v4l2_dev:
> -=09v4l2_device_unregister(&rga->v4l2_dev);
> -
> -=09return ret;
>  }
> =20
>  static void rga_core_unbind(struct device *dev, struct device *master,
>  =09=09=09    void *data)
>  {
>  =09struct rga_core *core =3D dev_get_drvdata(dev);
> -=09struct rockchip_rga *rga =3D core->rga;
> -
> -=09v4l2_info(&rga->v4l2_dev, "Removing\n");
> -
> -=09v4l2_m2m_release(rga->m2m_dev);
> -=09video_unregister_device(rga->vfd);
> -=09v4l2_device_unregister(&rga->v4l2_dev);
> =20
>  =09core->rga =3D NULL;
>  }
> @@ -944,20 +895,76 @@ static struct platform_driver rga_core_pdrv =3D {
>  static int rga_bind(struct device *dev)
>  {
>  =09struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> +=09struct video_device *vfd;
>  =09int ret;
> =20
> +=09ret =3D v4l2_device_register(dev, &rga->v4l2_dev);
> +=09if (ret)
> +=09=09return ret;
> +=09vfd =3D video_device_alloc();
> +=09if (!vfd) {
> +=09=09v4l2_err(&rga->v4l2_dev, "Failed to allocate video device\n");
> +=09=09ret =3D -ENOMEM;
> +=09=09goto unreg_v4l2_dev;
> +=09}
> +=09*vfd =3D rga_videodev;
> +=09vfd->lock =3D &rga->mutex;
> +=09vfd->v4l2_dev =3D &rga->v4l2_dev;
> +
> +=09video_set_drvdata(vfd, rga);
> +=09rga->vfd =3D vfd;
> +
> +=09rga->m2m_dev =3D v4l2_m2m_init(&rga_m2m_ops);
> +=09if (IS_ERR(rga->m2m_dev)) {
> +=09=09v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
> +=09=09ret =3D PTR_ERR(rga->m2m_dev);
> +=09=09goto rel_vdev;
> +=09}
> +
> +=09ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, -1);

Shouldn't this be kept last like it was before?

> +=09if (ret) {
> +=09=09v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
> +=09=09goto rel_m2m;
> +=09}
> +
>  =09ret =3D component_bind_all(dev, rga);
>  =09if (ret) {
>  =09=09dev_err(dev, "component bind failed\n");
> -=09=09return ret;
> +=09=09goto rel_m2m;
>  =09}
> =20
> +=09v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
> +=09=09  vfd->name, video_device_node_name(vfd));
> +
>  =09return 0;
> +
> +rel_m2m:
> +=09v4l2_m2m_release(rga->m2m_dev);
> +rel_vdev:
> +=09video_device_release(vfd);
> +unreg_v4l2_dev:
> +=09v4l2_device_unregister(&rga->v4l2_dev);
> +=09dev_set_drvdata(dev, rga);
> +=09return ret;
>  }
> =20
>  static void rga_unbind(struct device *dev)
>  {
> +=09struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> +
> +=09v4l2_info(&rga->v4l2_dev, "Removing\n");
> +
>  =09component_unbind_all(dev, NULL);
> +
> +=09v4l2_m2m_release(rga->m2m_dev);
> +=09video_unregister_device(rga->vfd);
> +=09v4l2_device_unregister(&rga->v4l2_dev);
> +=09/*
> +=09 * As &rga->v4l2_dev =3D=3D rga, v4l2_device_unregister (incorrectly)
> +=09 * clears the drvdata. Therefore just set it again
> +=09 * (ensuring it's correct regardless of the struct member position)
> +=09 */
> +=09dev_set_drvdata(dev, rga);
>  }
> =20
>  struct component_master_ops rga_master_ops =3D {

--=-0uIQZovRXgZxDGcSLoFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYDvgAKCRDZQZRRKWBy
9GqGAP4q+QYBtXorY2V20/Fjjuwd/k9H1RlDAJC1g2YbcNegfwD+N43LeKqeaQ/8
2zEP9Za6fbSKXjaFDf0/ir5zRkms4gs=
=wsLc
-----END PGP SIGNATURE-----

--=-0uIQZovRXgZxDGcSLoFT--
