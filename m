Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795731997;
	b=fz1fx2pONgmRT3dvNs3rpka5AIqfcb0PFF27qOztTfzyAgvoZILViO4pXQsPXu9FyznO
	 Pfi5hbrfa4dXCoqakznQIs9wcg4X1SFC691WsQCuZFoY+P6OyouH1Y5D1ccaOWW2v4+yo
	 s2P+Y+KD2vVbnUiUbcmCOl9A/9mQ3/OEwbJ912MjYGpunt718TJN2t3rn4K6H9jH8cF2V
	 mlE08QGeEHOk1k7qBwRyOrb8h2OcSqH20fDtPfAmzmb4oyOvcGJCNOg0FTrwo+QNonwcw
	 7xGQgV7Yvpj8pGTpNnH/ltjymw52wEmgmV+0p84ZCE+uX9VBIfcGjiBkVY/uF+7jH2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795731997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=DXV3jwg1vEpIFRKy3B1iiTGO2c9okEZN1fkPq1gh+eA=;
	b=qSXaRF8E+jS5rWADgE8i/LyuqA4HLssFTCuxoKX+fRe1lnRevRvYO4yMbrisliP4XnMS
	 S3YahFM05p7dUBrD8ml3X0KOtGqtus7eJKp7LL6uIJl+7ekjPbQcYe2NeMNkXPlFp1zKX
	 XM6AKABbQrhBzmnl+pwxtJTut2vGrny5rZEb6++dIch9bofz7+EooqXZvrCbLOaLv4jjt
	 HOBXMOSMai4zjdxf+oAbEbz57mD80BGk1kMqKJKO69vyKLHpcFVbD9IAC42F+w9lPCUYR
	 7BYrhb8Et+lI8WS3jgWV7dH8HkPAABB8nnYnkDypW4vkVyJ2fhlfC9Y2qMfwuscmS8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cmjOsy9q;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A93606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60A93606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cmjOsy9q
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9496473b511so873286185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795731996; x=1796336796; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DXV3jwg1vEpIFRKy3B1iiTGO2c9okEZN1fkPq1gh+eA=;
        b=cmjOsy9qs2WoFRV/0DQ6AkkCqNJ4/YpwpYv/JPvgqKUJPJs1rRfP1sXjPD2Bezw+Lg
         +5+nLqIlzz5nlcPe0sXo73Dej/DOrnmvnAueHttrZi6OJYvAxRCrdOcrFwixcx6JUQ+q
         n+3H2iFhvFbWmafMPVuv6R55L+a2hiU11msuvLEsY7gppItGalchjFZnG/ukwgFNfZV1
         2VsWKqseuOgIEexDc/8jTSITmiG13kW14MKcuivZhjmT60TeoKdKE4mWoK/8prEiCLpR
         6ZDQk0+7dMhEepvx8u23dnoD3Uqe6Qp8OUvu+ekKTuYQjY/ssCMnMQVbjK2sknjdeGSw
         tSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795731996; x=1796336796;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXV3jwg1vEpIFRKy3B1iiTGO2c9okEZN1fkPq1gh+eA=;
        b=Dg95QZktAnkvInMLZD7Q66JImyIBxKRECpdIJt+lZheM+iJzMHCYwYM1TDNphAglLF
         sM8XmkEmOXkhwF9Rc7zXZN40Eeo4k7ejFuTbBJj5MQmBZOjF2ck/XvPyhuNqmTrfSEIM
         jfO3gLzlHjs7zMobjTBnvmk8Tir2Mn+lbE2DNZ3itBSLams2ZsqTlwQ+Nm/BbgK3SrxS
         R+z8IBsF40/KUIEL++whRz0KLwOqmONQFdK8oegQ/GAYm8lEUpIrbQS2ItN1sH3aThsd
         gpJJNjHY39zv12MUIut5DdCvzVg921L8Nz8d78vWmvxPldQKMGLKBDLP/6ZHt1rGP1/R
         BoOQ==
X-Forwarded-Encrypted: i=1; AL+hErErKpc0MOnabIsGnS6Hh/QJYtqMdNA7CWDL/lbDBL2Fph835Rl3bycuqyOl1Mb3ukNQ6me0FeeFFn6JO3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xJSau6HcKwKj8AYE5Y0bgvi1eIA1TSzp/nonLmQ87uZXmwCyv
	XEBw6ck4Zla7Esi8tCARDK92qW22aEA2Jl7TO0JOIDAB6qGJcOyT7xZXlpJ4/+FER7Y=
X-Gm-Gg: AZFdTZfnAHo2HwlgQmib8TX9QU2H9wib8H6HHdG7VTSRvXGguzgjQ9gYmDe1I536wbO
	pIsNdeIrJXQFrd262ET07B7lg4OoxlLCI0zlSZpiEQCk6qMlEWjcxeQl4zF8Zw25e+9Hz00hs8J
	ozdpwGb1eqQWN6XD9EbiRaF77CONP51PPpI12ziiQI/FIe8SxdeHm1f3z1Oh+q3Ez0Pr8duxahS
	BOgbOo+KEm2N2RlDbPwqr+CVO9gpidlYX4BGfEuUDy0h2cDYJAjO1uLRmOuRdu7Sm95qR4tT/ff
	Ciuo1fjCOuxd49qy6vRkucbBtZRGFSctbLOpj42J8eR/wTGx80Tsn2vKQQrKZYUOPfZuWzaIayV
	iZmXeVt4nugWKK9apKmQ4jKf1UbYhmQv9zK5M9q2aCRQC0Xb69TQFCByhMASPN+8Uc3xPaOz2nB
	mVUqEUMxom8+PctSwqavGe1OXpz34lJ6YyZkBNXAMtIM5jj1SNdhmS5FjeRk9fv296UgUOpM2GN
	H2b6A3gqRqBcSuxEolVfkkYIVGh8rACswniCSVmXxCaLaCbZFUwPu5okCohrkCXnMUHrvXAQj3l
	MakTOUXnSBm1A20ubFAs3js/WosdZip2ucXGqUM3fEVCIfsQ1cWnGClH
X-Received: by 2002:a05:620a:372b:b0:949:70c5:c0ce with SMTP id af79cd13be357-949b35ac8e0mr4145462985a.19.1795731996315;
        Thu, 26 Nov 2026 14:26:36 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm1681287985a.14.2026.11.26.14.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 14:26:35 -0800 (PST)
Message-ID: <f41c7d6471f41d7fcc2109e14289e47091610822.camel@ndufresne.ca>
Subject: Re: [PATCH] media: sun8i-di: Don't sleep while waiting for
 coefficient access
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Samuel Holland
	 <samuel@sholland.org>, Hans Verkuil <hverkuil@kernel.org>, Maxime Ripard
	 <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 17:26:34 -0500
In-Reply-To: <20261104185930.885203-1-jernej.skrabec@gmail.com>
References: <20261104185930.885203-1-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-i1ae5NoATxMPm6Cs3hN+"
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

--=-i1ae5NoATxMPm6Cs3hN+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 04 novembre 2026 =C3=A0 19:59 +0100, Jernej Skrabec a =C3=A9cri=
t=C2=A0:
> deinterlace_irq() calls deinterlace_device_run() to start processing
> the second field, so it runs in hard interrupt context. However,
> deinterlace_device_run() waits for coefficient access with
> readl_poll_timeout(), which may sleep.
>=20
> Use readl_poll_timeout_atomic() instead.
>=20
> Fixes: a4260ea49547 ("media: sun4i: Add H3 deinterlace driver")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/sunxi/sun8i-di/sun8i-di.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/m=
edia/platform/sunxi/sun8i-di/sun8i-di.c
> index 65bc426e5aac..bb90e0efa4d1 100644
> --- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> +++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> @@ -163,8 +163,8 @@ static void deinterlace_device_run(void *priv)
>  =09/* neutral filter coefficients */
>  =09deinterlace_set_bits(dev, DEINTERLACE_FRM_CTRL,
>  =09=09=09     DEINTERLACE_FRM_CTRL_COEF_ACCESS);
> -=09readl_poll_timeout(dev->base + DEINTERLACE_STATUS, val,
> -=09=09=09   val & DEINTERLACE_STATUS_COEF_STATUS, 2, 40);
> +=09readl_poll_timeout_atomic(dev->base + DEINTERLACE_STATUS, val,
> +=09=09=09=09  val & DEINTERLACE_STATUS_COEF_STATUS, 2, 40);
> =20
>  =09for (i =3D 0; i < 32; i++) {
>  =09=09deinterlace_write(dev, DEINTERLACE_CH0_HORZ_COEF0 + i * 4,
>=20
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

--=-i1ae5NoATxMPm6Cs3hN+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawiyGgAKCRDZQZRRKWBy
9MOtAP4lcK/xSN3c+U7uRq10fy5MnpVhec9Sqx0NG67DpPGZAgEA8d3GOhpIEGXC
xicNBf+fQ7gEyX7c665ziueulfyRVAg=
=8HHY
-----END PGP SIGNATURE-----

--=-i1ae5NoATxMPm6Cs3hN+--
