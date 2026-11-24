Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557056;
	b=rVdbyRdd6x+GhHEXB2L8ekjJEEV1yCKAhmtA37JBB3I0r4rx7MGY8ZcuWQAnHTPMQVEp
	 nwoaWgeHVGU4LY9qJ7/08CsnIQHvwYA9Aoh2n7SluhuQbIDGh5Ked0ClqEKRWAW+VreSQ
	 srFGcb46ph0WGBkAPLxUFUSsbZm8VTQuHEify54rkOzr4vZEJd5mtCQNzQcIGavPvX4mV
	 TrRsDQn0hrVdWzi/el0jAuWzytjjntS18/xZXyYBNogONXxOPssMwywecA5qYfPq7RKiu
	 kJw9Cy285Xc+yWSYxj0zDjGk8QKmVZP3H3LjwG/DTzLsSy75tIRVhUX5pSjmNo6iuTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=hVPbxPzCfcI5EYvAMMF38p87BSkLVMs8H/NP5SJFtqM=;
	b=BzKcHSLCl8jKCYDistkM+cRKorWES34wlVzNPfTEOeJUc8DXskUoVje6GHgu0xCvYcfE
	 Fk/pk15TSNlNKbrZHwiNCUz+FFuZpGTprRGCHfXWfXTbLFNhZ72XEPOy663Gp6E6T7Ku0
	 /W1XYtJ/+uKl84+gkcsBJGELLaUMex+1wX1ufE4Xcqr2LAjF3w1QZ3sTo4K2ZgydAXJp1
	 Dt1Z4V5F4+U9kHvsplTghs3faUDabp3IGmSOSsBKGLXDw2Lr3eNJZrunjhL0Tl58Wa/NR
	 VTiTvtB+7NRA925Xor/cg4gLmN4VXIdVsYcT32hcIS1Rm4ZIBETs9Nnbe2C8+IpBLFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EIA5OVv4;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D5F606A333
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5D5F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EIA5OVv4
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5361e313e63so67686141cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795557055; x=1796161855; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVPbxPzCfcI5EYvAMMF38p87BSkLVMs8H/NP5SJFtqM=;
        b=EIA5OVv4lqgsmtllpkq84bX7n7pysJ5rppqkAfIU+lh/KpkplAHMhS8YbQDLDJXyZp
         rr3nYUaDHCzVcSdxrtXuT/NSOEs+OXrEegYgZYLLYJSnBTU/5d9I/v7EXWL2736o0Q1S
         eXA5LyZqVEhHucQXeZXpAbG6SZOxOK5x/ehbaXFdnNCYXcB36QI1Vh5FcpenVSUV/eER
         ah3K2qzxVzTEYyBNIilLtG1+5pNhCG95mhLjBQwniGdyqoT4ZdgFdAhJDPJBxR6BgdNn
         mxdopQ3rG629WuwLzXGvcU5Z6t66vq5rfKr0gxXmb7qHdluJ7LY9lCtT0X3/qxm/VEXy
         nm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557055; x=1796161855;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVPbxPzCfcI5EYvAMMF38p87BSkLVMs8H/NP5SJFtqM=;
        b=zJmbjuMIvDPLgIEtXuqBxLzYPKKWs7mZt/AhUhVM6QUQMjOpu55XDOs2T6fq3zZUwB
         TBHMq3fNqG56q0lBaFrbMOHj7Tg9ccY4R6ROAVboppHLbye2yvzAX2+SX31e6OBTiz+7
         TzzFf2DGf+rZsi90oEKFMYhwpiKOK86pzwka6RMyF4omw8BdEh5+UQQf/a91kapSqzhA
         RRkO8gFDsXLAFsqrS8odcRVkK4YpXPzNvN7ELepWk3+sSkOn0azVnoEnmLAU7yhzqbdb
         PbWmUlJVPtXqhqk0rCOuqft5nO2HMAsNBN5qyb0ISqG2BIvaNA98CWKgt59p0fjni07W
         i+og==
X-Forwarded-Encrypted: i=1; AL+hErGr948nH8nlL4el1AP9JBDk8zt01jKNz4i6gjfKCQeoeJMh7Odje46FvDtDguSezZuGXYP6YzaCFZcWgJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SzmXD7JvYgwVeWZqqiGdGLWbFkL+l6U9GY0ouSPV96Eji5dFE
	F0BiEOProVoY40m/F+trpjsoPRcUL03XKTtyIr3cGs+1bFIlJiJ43gZgdgNz58xTUdc=
X-Gm-Gg: AZFdTZf6KnjxryVDMkU6uGKyt6sBMuXoG+H+/LigK3hbk4Ubb+aYIamiuyVfLzZr11p
	iCZE3+k+57xLDSs6R1+PSCNIOwCE1B0Y0cQlU/kSljVVXotZWjFQf6xtQ7/f0lWi7jXhcSQggO4
	QCdtmSiO7pdAPOrsL3NGeLtxGAlg6x6GvdhLvEafnCmUfhA8UBJaF3sgvA0L35FbqxEElB485ZO
	6E4wYb+/SPPYdU7sVLBP0+O7iOWwQMFYx0Lk8LpzWE9KETHHviT5eFeqc0YBAOOINbONeAGFvrz
	C97n2dYEkn7/JJAvAMS2JadAdt2H0oyo7Yed1/gv/DR9p5pa2T2+ihCfs+K2rkmmCfQiI9M1lcK
	ZyRg7ySs7jig7gpQ6WEV8pXeHRcVshxzantarFnZFquFF1r4qeVTBmNV3O86NN8EdP516mkNiEF
	3vhQlr8HyRom/35ZZziiRLHezwgiIJmbTgeg+YMSnNstut83ZjFhFpHODe3dOlOcpZJ1T/5m8CV
	l7sOHT/YS/+G5XmyMXzA+o9MQILEDvyTguQDWohbYBpIzV92R9F6yzCUG97SctT4M7kmgKJRbX+
	Z3im3rG8BydnGVwc9VzY0T43W6DfYWJxv+4lRwP5ypKXMg3NmORooio=
X-Received: by 2002:ac8:598a:0:b0:533:3fc2:8b19 with SMTP id d75a77b69052e-55d769e1664mr304362671cf.20.1795557054795;
        Tue, 24 Nov 2026 13:50:54 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8absm135589651cf.27.2026.11.24.13.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:54 -0800 (PST)
Message-ID: <d1057ae0d26a942d1e79bc09ac188dd804ff97b0.camel@ndufresne.ca>
Subject: Re: [PATCH v2 16/17] media: rockchip: rga: put all cores into first
 core iommu domain
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
Date: Tue, 24 Nov 2026 16:50:53 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-16-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-16-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-cVwN/Xd2NZTsdcaY+cOO"
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

--=-cVwN/Xd2NZTsdcaY+cOO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Put all cores into the iommu domain of the first core to allow them to
> be used by any core. All buffers accessed by the hardware are allocated
> on the first core, as the scheduling to a specific core is done after
> the allocation. Therefore put all cores into the same domain to have the
> same iommu mapping on all cores.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20
> ---
> v2
> - Fixed domain not being an err ptr
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D14)
> - Detach domain on unbind callback
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D14)
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 5348fcc03c525..b2eeae0a61771 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -10,6 +10,7 @@
>  #include <linux/delay.h>
>  #include <linux/fs.h>
>  #include <linux/interrupt.h>
> +#include <linux/iommu.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> @@ -761,6 +762,19 @@ static int rga_core_bind(struct device *dev, struct =
device *master, void *data)
>  =09=09  rga->version.major, rga->version.minor);
> =20
>  =09if (rga->num_cores) {
> +=09=09/* Attach to the first cores iommu */
> +=09=09struct iommu_domain *domain =3D iommu_get_domain_for_dev(rga->core=
s[0]->dev);
> +
> +=09=09if (!domain) {
> +=09=09=09dev_err(core->dev, "Couldn't get domain of the first core\n");
> +=09=09=09return -ENODEV;

Hmm, Sashiko is annoyingly right, this driver support disabling IOMMU befor=
e
this change. Maybe simply return 0, and turn the error into a warning? It a=
lso
says you are missing pm_runtime_put() or something.

> +=09=09}
> +=09=09ret =3D iommu_attach_device(domain, core->dev);
> +=09=09if (ret) {
> +=09=09=09dev_err(core->dev, "Couldn't attach to the domain of the first =
core\n");
> +=09=09=09return ret;

Also missing PM release.

> +=09=09}
> +
>  =09=09/* we are not the first core, expect that we have the same version=
 */
>  =09=09if (rga->version.major !=3D version.major || rga->version.minor !=
=3D version.minor) {

Keep this check above the iommu setup, so you don't have to undo it. Not a =
big
deal though.

Nicolas

>  =09=09=09v4l2_err(&rga->v4l2_dev, "Detected multi-core setup with differ=
ent core versions!\n");
> @@ -788,6 +802,14 @@ static void rga_core_unbind(struct device *dev, stru=
ct device *master,
>  =09=09if (rga->cores[i] !=3D core)
>  =09=09=09continue;
> =20
> +=09=09if (i) {
> +=09=09=09/* Detach from the first core iommu */
> +=09=09=09struct iommu_domain *domain =3D iommu_get_domain_for_dev(rga->c=
ores[0]->dev);
> +
> +=09=09=09if (domain)
> +=09=09=09=09iommu_detach_device(domain, core->dev);
> +=09=09}
> +
>  =09=09rga->cores[i] =3D rga->cores[rga->num_cores - 1];
>  =09=09rga->num_cores--;
>  =09=09break;

--=-cVwN/Xd2NZTsdcaY+cOO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYGvQAKCRDZQZRRKWBy
9EiZAQDgH7HdEx0kZfJoihc2NEWpoQw2AZO/TWinadRHtBt/SgEA5WsnvdZUOkaR
KYMLUEnn4bMuAzk58Ugd+hcGj6IXvgk=
=dLTW
-----END PGP SIGNATURE-----

--=-cVwN/Xd2NZTsdcaY+cOO--
