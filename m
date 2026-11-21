Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795297070;
	b=2N6VI+BwLgeLHPMxgT45f3C65TKQniFK+9vGis3y9u5BhTyuS9k3DhueRu0GYNr1uG6e
	 17G6LyE/tCph/IdtHkkO0J6XXWDhQPaIfOME4bsHE0HoHeheDLv1USxZTblkd24cC5aoV
	 8V1OSfn6xNAYHQ5DMAqtsabDm64QqjejD2cJZg2rpcReFUb3QDLRoHRLpYnKbJ7LU0g0s
	 95gOonKDwWt4dmVWQxVGBU4/xQh4npKtOdNM99cE4QFEYLjCwXXl7il6lGySworZ2RG6q
	 Ibpc2fakHimEDvEoI5MhjMzx6VCDKfRo+blkvjmC1FDSrLtioWo/JTPHALFnTvNatLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795297070;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=YReuVX/iv8fG4ap3eAgFe88aw1J3+LNXyvu6qNX5svU=;
	b=o0iD7+t86eWJzKzbX3298kUYPMHaRP92PV0mnTphzsLwuher2qXRrSTJ8zb+BdDmNOj6
	 ufPyvNHK9Nht0fx3/fK10unpYCvbhINqpYGPznxHTn25yxOx3qnzWtg1kUTiOJSpD9wm/
	 0sfnycpSqI3CJR5LnSWPKYVT5fUJYxbFv7bOycybwaSL6B4N5Oy2noYHm/Q3DXfg8I1NI
	 z1u1lZHWliMBa5jAtcNiJkFZVy+Ofro8b8OQIbJZplvWHYtMZWsSVfeGsDH8iEL05X2eS
	 MPIiWHYPeicZCiVz4Yo61Mc4FjZaB1JyFHju1J3nOznJrLIuOYwF5t1LeyA1X2lCCZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=H4GmxzfE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA28606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA28606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=H4GmxzfE
Received: from pengutronix.de (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: mkl@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A7B48201862;
	Sat, 21 Nov 2026 22:37:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795297066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=YReuVX/iv8fG4ap3eAgFe88aw1J3+LNXyvu6qNX5svU=;
	b=H4GmxzfECgHq5U5PxhNAqJtvMaFKd5fMb0vwZAy49OHYiFd00W/JFmzM/W7++Jp/YZ6nkQ
	ovOtGRm7CX+LOTyw5IHvLLZy3pItfI9rqrOW6ijO26A/zdw7Bh9F45LXbO9fz3fgMA85JP
	F2j4oiaVkMwT0hCrwhlg/PLpejh8ihQtounwbX1HBNUcmVQmXDl6iz+lth3rG6hzYc1/O1
	ek1Vh7ZbtQZX9WIv3OrSSdWTpfbzRcH7ZqnF1VzNmCrBq6wJeBS+iqCw8zovrUTlijSeim
	L8gb7bFInhdIycqLpi1Vpa2QGpWrZ1SkxC4gxCf77xShGTsSIZ+0hJNwIrmo9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795297066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=YReuVX/iv8fG4ap3eAgFe88aw1J3+LNXyvu6qNX5svU=;
	b=BD5OLnUMtuxhTjq7aLoq7t++hmnNfYFjqHsFvSGFgkaUwZD4QeCcSJ1uvgpuuXEss1SO0U
	VegaoisshYlUtofFiz8LUw5r2T9lMThcpNSF/sTRqc+Nd32VjXM9uNFykUIYFo2jiggRP7
	/W9UHEil+Pw0s0jbrCFCdBP3bdUwA2mbjJTskk9rcW/faCjmgeeCYex7f83700u5bcXP6P
	n+KamNE8pZc/5GdKVlqE276pk7nclNG1j56E5A9RmsfnXtKj7lFrXf9Q0z8GIw3ADSllEW
	3fhGkiUIdBukUAwvcikbj9ei3kunJ3spxf+EXRPMfTwK+e6RmAqCpz07/jZbAw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795297066; a=rsa-sha256;
	cv=none;
	b=Qn0b6falndSM1LdIQj1W6QeBOOahkpYPWPeQAFTzuGYE72SQ4WBRbE1HtnTSj75/9m18GF
	nzl5JtSW55MiilEdoty9HfIdp/uljWnafdDRVg9YLUFEO0qUlBpwx6D64xGpVSSnI8XF+1
	YUqgVQmsHbEiCg+pSS4MD3qXij9TklMYkRkEXfCETjM48j5rLyrGARU5Rnt5EipuWIR4XH
	1FXWUSv6G41vePkP7huQDrJNikMW2BgtbMIwT+gP1JljzAgr4x63duHMTwBkL4e+7leLGh
	fQV5jXuLrBa/QmDfhdnpxK6jhsNt+1/9zUMl7GyORpvKwVWFK9weo4EmwxQGDw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=mkl@pengutronix.de smtp.mailfrom=mkl@pengutronix.de
Date: Sat, 21 Nov 2026 22:37:46 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: checkpatch: false positive "Alignment should match open parenthesis"
 with struct_group_tagged()
Message-ID: <20261121-gifted-cryptic-mouse-9362cf-mkl@pengutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6rnbbeesqshjisvl"
Content-Disposition: inline


--6rnbbeesqshjisvl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: checkpatch: false positive "Alignment should match open parenthesis"
 with struct_group_tagged()
MIME-Version: 1.0

Hello,

it seems that all users of struct_group_tagged() in the kernel indent
with 1 tab, like this:

| struct gs_host_frame {
| 	struct_group_tagged(gs_host_frame_header, header,
| 		u32 echo_id;
| 		__le32 can_id;
|
| 		u8 can_dlc;
| 		u8 channel;
| 		u8 flags;
| 		u8 reserved;
| 	);
|
| 	union {
| 		DECLARE_FLEX_ARRAY(struct classic_can, classic_can);
| 		DECLARE_FLEX_ARRAY(struct classic_can_ts, classic_can_ts);
| 		DECLARE_FLEX_ARRAY(struct classic_can_quirk, classic_can_quirk);
| 		DECLARE_FLEX_ARRAY(struct canfd, canfd);
| 		DECLARE_FLEX_ARRAY(struct canfd_ts, canfd_ts);
| 		DECLARE_FLEX_ARRAY(struct canfd_quirk, canfd_quirk);
| 	};
| } __packed;

But checkpatch doesn't like this and warns:

=E2=97=8F 06b928706f7e: can: gs_usb: gs_usb_get_gs_can(): introduce new fun=
ction to consolidate validation of struct gs_can
  =E2=97=8F checkpatch.pl: drivers/net/can/usb/gs_usb.c:271: CHECK: Alignme=
nt should match open parenthesis

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--6rnbbeesqshjisvl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCawIPKAAKCRDMOmT6rpmt
0iVtAQCW1BUSt5QNTxYHb6O2P65YIHGQiWpsqh7emUcCtZd4BAEAnETtC0eQwIjd
dEXfN7cV+yesniyIBbOJLxreNVn8LgA=
=BnAa
-----END PGP SIGNATURE-----

--6rnbbeesqshjisvl--
