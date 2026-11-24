Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795558611;
	b=K5U7pBK31H75LdjYJmVK8Sj1KifPriKO0ULBcU6RbGI1NcdurszNx4NYKtVkAaKI7Sjg
	 r6qtQ0KCPwQNxO0kwSlU/wDIH86x2dhtOo4wpfD21p7jii4cgs6F3eyaV1TXRbeZJ2UYb
	 pEL8KAg7EJqlxG7vl/h411GoYm6m9lnThjV5yIrg46F4ietEvyIm7oJXUQVlHFFxJmGvY
	 QVKUtva+8xtdSbtI5+vRK6Mz2vkJMOrjdXKhmFhxgZF/eYpqU28R52lGWNYPjPGSWOOcR
	 eS0sGqIEuDuIlktw7jDqE40nRNZoff1cwRvq7dT4R0cFpHXHU5Wd3k2m7pBb3hAmfSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=Uhmi7vdLdSTBTBfiyTnnA5vkStcVEY8sN0rPcbiafRM=;
	b=LZCIUxR2y6GGoRi8RtDHqtu15MeavAjeGedB40LOS3YI4J0sNSldscTAz/9fzNiw5AxZ
	 M7c7TcUltz/w1wKw67IwR9WuXpzT4dqKuLYE/dr+TOw9kHI40i9sVcNtk8/lpkQE98osn
	 izSLU//9BVCXEClB9XNYiO8EMtW6EsGbXko8L5SO2zjPv6HChQYIdlR6/wZv6ymBuUTXs
	 YTnTCXUSw/Ua276IW+vp7eGp0fcqeqB/S3Lizv3kXhagI/dwHEtQTz0af3zK3Pcdzpq5y
	 AsZDRFhsetbAI7E6ErKJSIvDCHoDi0lsTm5MEGuJBw3fbxJwcZOU65iiyRiM7gLRpoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=a3EZvP5O;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE945606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE945606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=a3EZvP5O
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-92123f02faeso52395806d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795558610; x=1796163410; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uhmi7vdLdSTBTBfiyTnnA5vkStcVEY8sN0rPcbiafRM=;
        b=a3EZvP5OyowAiMtFRNJn08m3NhjGNxRg7uIjCQJAiDLOLA+8FctfDs3jn2KLTG+h1O
         2hDthh3ZjlvAk0RGTcTC7DFsEWzWATomdIit+FsIi5a8lP3BJ0PiEjpUbRwvm1u9Ea6S
         QtpdcQviakqrDzRYu8t6CWRkrkR0o2598OBWpj8ZgHBJO7dKmLYA0IruhH4qS1IYIXOp
         1IVyIO4zOvm4AsUA6rrt2DcZrqrs0xejEK8QQg0+oR8XV8tgXNST0WG8AhBKHnpHNFXa
         v5AdSj0L3dC6fYZDxTcFgI3VsAwlkLG47ZbE0YQ1fsu7HmnF416hH/35MvXcf9Q0G5FQ
         pLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795558610; x=1796163410;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uhmi7vdLdSTBTBfiyTnnA5vkStcVEY8sN0rPcbiafRM=;
        b=z9l6NS2IsC3wt4hoBsmVadmXzsuOMUctsSNejvzXnbYcBjU7VSAtB211oRU5rmpcFs
         z8itG0SP+u1rqnOYTr5gIvgIm59Zz24GN/dS2jGi8ZcKG6Db5GIGvU8jDj7ifnG1B8rB
         m+Hj8GGZ8iJtMOa6IHcsa3zhFd5E7IJlJ05hyzkHnQWrMx3B/8sYittf5M6IuF/o8m6R
         0epTYSWzh839ViBMAKn5ruqdxLk0Pf39zdstZ36f7ThAwzoXg+PpOrv/PNEuEgGsr/Kg
         4N/B1RoPRfww0bJP4BJ45O9O2/STCDI3dRGbUkznIC9GutUDquYxsnRWOQuYhLd7RaWA
         jzxQ==
X-Forwarded-Encrypted: i=1; AL+hErFTldgyxACSCeTjTeEUpqnaOtlmQGPXq26Xc/QtFLUEhK9Y5eaqnWFRwHbt6O5Hrux3E4Sk0wVtWRUKlgo=@vger.kernel.org
X-Gm-Message-State: APuU4Z++1JjnjgP99O2FrLkpeEd9u3/vWk1gMfZUjja0ohilpF1YnzkL
	xStnqTg40dl+L4vMWQjELkJRqnBu0az22W6INOZO45uIQi7Yu+W6GxetjZj2/IBfESg=
X-Gm-Gg: AZFdTZe1MfsLNuVtrTaULS/cJ0JDF2SlywM+RojfqpICOXhJVqqOAdc8WpifkpD8dor
	7acgUkhJ6vDuGJyUIZ2hQCo1iXhVmg+ajeABy/TOyfhfsf7ZTuSQTIeBtcWBn/TvGzy+2D287ih
	R0KmHB0y4GI30J3i2KRIM/upjIhaMu3otlbCrOA7Z4f++G6xaSrk6INA8ZAFKaiDakPj8oNThei
	3bw/0sSz0onl0ujqxPQG5jkRthRMgj1ehlHD0xID3AGQWANtdv7oG0Vv2xt47mkupNE+Qw/8MWm
	afcd915DiO+9D0hNt5RtTBheT5uKSoSD0xV8eRBEI3AAlJZh1g/qGXpr/uuBGZX2H06bI9J1Fr9
	Jnv8NKBGiF86OxWJw+wk+DIGSMaJu7ZwtQ7S3wCeUhJywySnvN4ebZPnpYIh+Ee72SEfBAmXgzy
	F9tMkEEDAsls64+AII3sFW7RpdlkH+eanb+yCkLMwRNImUW3tS+JaYxUtjPw1LXVpVV9auOOyTV
	dE68syrE2/6l1P6n2pKpkU/uFrib9Xyh+TDDv9zbgDpcZtv+eKAvPPUspAGAbYFw5U/CVUJPzgO
	zLMAE5/SRxnt+4sdyo96IQrYomlb7OCrpKG0TE8z/3B7JZB3FHgBSVqX
X-Received: by 2002:a05:6214:1d01:b0:91e:f8bb:bfff with SMTP id 6a1803df08f44-92134a695bemr295012926d6.10.1795558609635;
        Tue, 24 Nov 2026 14:16:49 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bfe82dsm143924506d6.0.2026.11.24.14.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:16:48 -0800 (PST)
Message-ID: <4c54e652e8fb714600852a3028b892c6a292c6cd.camel@ndufresne.ca>
Subject: Re: [PATCH v3 05/17] media: v4l2-ctrls: validate vp9 tile_rows_log2
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sofus Forstreuter <sofus.c@icloud.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau
	 <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	 <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Date: Tue, 24 Nov 2026 17:16:47 -0500
In-Reply-To: <20261020-avd-v3-5-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
	 <20261020-avd-v3-5-85cbaa2125d8@icloud.com>
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
	protocol="application/pgp-signature"; boundary="=-fZhiUwItIuN4elZmSsKu"
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

--=-fZhiUwItIuN4elZmSsKu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 20 octobre 2026 =C3=A0 11:37 +0200, Sofus Forstreuter a =C3=A9crit=
=C2=A0:
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 922cf74c4eb8..384ff77771ea 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -638,7 +638,7 @@ validate_vp9_frame(struct v4l2_ctrl_vp9_frame *frame)
>  =09 * According to the spec, tile_cols_log2 shall be less than or equal
>  =09 * to 6.
>  =09 */
> -=09if (frame->tile_cols_log2 > 6)
> +=09if (frame->tile_cols_log2 > 6 || frame->tile_rows_log2 > 2)

Shouldn't this be 6 too? (log2(64)).

Nicolas

>  =09=09return -EINVAL;

> =20
>  =09if (frame->reference_mode > V4L2_VP9_REFERENCE_MODE_SELECT)

--=-fZhiUwItIuN4elZmSsKu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYMzwAKCRDZQZRRKWBy
9BA6AP9PS5poldHn0LERh5sldYW2P73wx+zTyuozNl+3ELVLUQD/aj0MPvIwO2sj
O8VuT9IjLVqFj9L0GOL8uRcAYapAAAk=
=/mpK
-----END PGP SIGNATURE-----

--=-fZhiUwItIuN4elZmSsKu--
