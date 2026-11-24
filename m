Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553200;
	b=b2s+60cdj/ON0xiiFX6dEpmch1juScpzBETY3SldjCPDBZFWgHfMEmr1DiG0kKlh0p+u
	 dxnY49dQYovE6l7IxOtzZVG61/zaZ8CNgMR6zm+dx/l87uxSlq0352x4sXEJxGd/zri/A
	 fSPf8SOKVzMfZN8h9x0SgwoYtgYDpbZQKXNPneP6LtpJ9wHX+IncO6pmuB3eZhPOQIVFx
	 0AhKK7OTRcmyb1MaNmrB1YPwfgKYwrBb3O2fCLeBZ/UG6VWwH7CMxFef8o7HSAeDsLvDh
	 ahUeW24RmOHCc3Zyhyq7hKoqEbrVI8UFDKUcrPT0QsbV5lZgrjWZtVv7LsxeTSJrlfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=fiIU6xlbIXxSNj9YDB57fALFXrcAD48xRem5XKs4A1U=;
	b=NjzzHpkHyE0qwGqkm0nH6It9RdiVTDJhrnGtATUVgXAxgMqTt5Rud66o2IgYy69GypHd
	 QBgyAacp7xpy+7e7BYsCJHc82tEugmOU31+tiid7GhUaYF+wKm9bccFMlFpNGIPMHbY9f
	 XSBfGa2StQWZAJOe523pnKYQlF9gKPyde/NYXRMNwFhNHiiahAgrLCqce0VKcjQOfBVVt
	 58TADjNM+OA6kj71iD4WlEKTcJfBzGd+Fn+CGANNuvPbYCZoY+Whfcqp4NnBzYoUq+Y64
	 5VXntlKOcMDlluLFAlVmArc0K+l5RH8b+2TFjZDIyJGFOr8FWLl0c5UGvPY9u3NiPxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=V3A1VhlO;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760D4606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 760D4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=V3A1VhlO
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-537548b811aso41748171cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795553199; x=1796157999; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fiIU6xlbIXxSNj9YDB57fALFXrcAD48xRem5XKs4A1U=;
        b=V3A1VhlOO8nJ8nEokV3Qr2n66oO4jKp87kD4x0a4zjRaBQQXa/rm8mah0rDtQdEdCG
         FgEwaNbF5QKpZDCFC5MW1zUSTsnSgKAl4jO0/WiIjSJJFUmmZSJ3F1UZV1bq3/5zKt4Z
         CjS+G9JNoVyeEzIKLOG6oYURkfo0citw4xdxpkn0XR9Vhay2K63LnBC/sALuWc0RBjl9
         hu4azC9u72XAPgRss+FOgZPRlTiui/NdqPLzmNxEVfWZpgyi56rD+r8E1DspprlJYkmI
         ccouq/8urLxq7CI0RqAnwtljTciOfIktdkN7iJZguMBt3wNLS/bsP3py4vu/i34YiRV7
         Xx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553199; x=1796157999;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fiIU6xlbIXxSNj9YDB57fALFXrcAD48xRem5XKs4A1U=;
        b=qvfZ6pC305HbwhH0cFzC7ANLIQ24IN5U1NqkuD+xaOjGM8/OarLw1aLrW0H8FcevML
         4kMhRGlWbNJAdtYv3X/5IVMAi7cJeIbmn01PyksiEFidLbtvwuGp+HSKlIHxBAV1aqtf
         dFYvk/B7QQlUtg/cEHT9Z/c/2RBTM5YqudmJ98U+FptbYS568lklg8EN1OpgFaxSr5wC
         hRaP7ZAN1FDdneZzApms+Jc49eulhGYGkKqitEoCu1wuiuvB3e8KJx4QMliyJRlTqdss
         +kwYOfhRF1D+O3J8PVyKj+CwBhJa60L7bnWPC2FLtloCPuDj/T02GELF+fiklG3+u1qt
         oAww==
X-Forwarded-Encrypted: i=1; AL+hErFcEfRrg5F2/qtD2SgVdutI4ydVmid/YHE3LmWicicGfztR/qWuhYajHiDdFI2j6jUwdltHmmWIg4Vz0H8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CFKHMkrG7aUh4XOgaJBnhqraXFTDEGu4vfuI56jVLep+4G9rC
	WYe+HKh9rIMgx/d+LLANWP+3y7iAQOqz7RiZqt82FpOmCHTnriV+Pd3UibWcxeueQ4k=
X-Gm-Gg: AZFdTZf0o2nQ+vR+GyYsGXsqvdObbaR2h1oYinnRJ1FxHfT2ZPOaywGptWWL6aMo1p/
	+f9saNQdlHwIv7zUbrm3XX/eDlM+805K7eME9NSmKeztAABTptaNFgN8slSnpcC7jFTvPfsBI1T
	QXq8lCbmJzOuiuRTwO7Mm9MtbqAJkEmy9dq9wgfGtk7VJ79dDxDyAxqftwH4uqC3T7NYLAzOqLm
	y3nOJwvTeq1rzzkLpaO1dEiT4id47G5vXCQxnWhgGuthgTsKaqaX5+EJcavyMU8VfKJDSJzpr5X
	3fPla7UnOOeXjDFdL0gOkiOgTzOJWUTCxQcXUVL8j+0AntiZ4Fysdgmgsue4NPInjjHK30F6ft9
	wzpHlhsCC2r3HWIz0emm5C56aPV1dXFGhLcxvDHglvtL4H858wKm2i5jQZ2HppdFyrAyXCJvCdV
	IMHH00NuHJXHB7BRk3AB89e71hGbw55YiO+3s5M0UX+Wrk/2X55AOpiuf4n7ZUMrkbMRj5kOD/u
	tqQdt+sHW1tjM0UikGNBoVEWqvwfGfyvWJ+KpMXvLA3qGIneV7ohiMUhqBVnep1Da7NazdUentu
	yfdVjn5aAolhr2SmAnNSkgRxZsday1kre38b4RqWG2XtyhoE922TNWQ=
X-Received: by 2002:ac8:5a50:0:b0:535:a5fa:ee05 with SMTP id d75a77b69052e-55d76a68f72mr297291921cf.69.1795553199445;
        Tue, 24 Nov 2026 12:46:39 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7c654585sm130765191cf.5.2026.11.24.12.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:46:38 -0800 (PST)
Message-ID: <bc5e98e046f373ae491210e218ded9f06f997734.camel@ndufresne.ca>
Subject: Re: [PATCH v2 04/17] media: rockchip: rga: removed unused regmap
 member
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
Date: Tue, 24 Nov 2026 15:46:37 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-4-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-4-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-MYb0fk1ys1f42Xkvhfm5"
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

--=-MYb0fk1ys1f42Xkvhfm5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> The grf member variable is never accessed or written by the RGA driver.
> Therefore drop it from the rockchip_rga struct.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rga/rga.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 2b4f5694375a4..0e62337f8dd38 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -71,7 +71,6 @@ struct rockchip_rga {
>  =09struct video_device *vfd;
> =20
>  =09struct device *dev;
> -=09struct regmap *grf;
>  =09void __iomem *regs;
>  =09struct clk_bulk_data *clks;
>  =09int num_clks;

--=-MYb0fk1ys1f42Xkvhfm5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawX3rQAKCRDZQZRRKWBy
9PZvAP97BrjjWk9V+gf2ONjhQjCuulubPU+SH6u/ajoB9+AP+wEAhck2FAqU1AHS
lSsUCU6gvG4EIWmI38xkcilLfrI5Ag0=
=Yixs
-----END PGP SIGNATURE-----

--=-MYb0fk1ys1f42Xkvhfm5--
