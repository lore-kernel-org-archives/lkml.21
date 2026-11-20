Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178484;
	b=GrUuIAuurcVNnmGp8C8IS+uyb7whW7fKmuzZjLUSYopySVIqB2X9VTSkviQDIVQJoBLG
	 uZ1Irhx/wOORiXFidmbtQZcKJYLtEFBD468gAzMLb4FeMMRFU8za8jSRpRutGUbtHbBaN
	 z2KlflJLywsLsLh0eLWwTqCuZMl3Ny26j1E2JpzIGZwfSV3eEfJrK/qJ+vlM5l4tIBcUI
	 JiZWTcJv9f9d5xLg3urRXx+SB+2r2B6J1PD9qZUAG2ragoFBhy9Az6oEZfaBqQZaAN2cD
	 GfcZOHW0UynBc58WxxreC0Z3NUvnIREnaRCStPsz/cImLGmDCDMBoK7d/lrxmDf3iOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178484;
	h=Received:DKIM-Signature:Mime-Version:Content-Type:Date:Message-Id:To:
	 Subject:Cc:From:X-Mailer:References:In-Reply-To;
	bh=pOz5Kp9Rx77Id2rt+cmAdtztYLE/96Bihgs/QD1W4Ds=;
	b=fF0qGHAaZfTUx7z4zo2YAI5JKXGdMTCWMUeI/kdKBxDN+L76XXoxszzq4dGcI9ZZDlju
	 y4zOVz3itomL7tPhB6LEuN5MBA8C0RTOXHW5ZMOAoBiRcl/AYLTY8D5HleUeWumaJqIeu
	 3tk0FbkUU7nyxcwsYjD6Z+Mhyc7KdHEaWLyTCWi6P6aojsipu7QNrAiC6SLpANtfm9006
	 +N954swr4CBSKKrF3HWgZlRbmpjaeV4zmkfPlzUU0PNgVcFGi98faj3PQ/NALvbJHuZdr
	 lCibay1NBP9P22c7nFjxnMhk/EFIo+0iSAZvC+S8TsCDSrIbSTmAc901EgPkrG9FxEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hso3mAMK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 5BD10606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hso3mAMK
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 51C541F000CA;
	Fri, 20 Nov 2026 12:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795178483;
	bh=pOz5Kp9Rx77Id2rt+cmAdtztYLE/96Bihgs/QD1W4Ds=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=hso3mAMKKr1LtxhrYacAuDi5W3FY/TsDpioBP9WvasaMxmR603VWxr5AAoZfadPtD
	 GRn+eYgWucP6Dt0PEHvYfCk7lfiwXO4v9nHpRQ4AopeVhxSnevQb5fujM2iPZ3oR21
	 t3obW9Y/gpmGQUZLUt6e2IdBUV0XI2ApJnOkWVLtsmWbE942T04u+IgWBJIYFWMmfS
	 dKuVP8HFswJSP8tUwNfBcAyJ+mF+D3YG72F0uZnnQ5dpGu7BgBFhJmNJ4lr1EbXO9L
	 /EqZDPuZlxvgKTJZcupnla90tT20DBDUtMSIVyn2q/lwGMjmlT6NpFyZ9yM4F4+7rB
	 Ai1Jm9Fq4vIYg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=654c4deafe92b97eeb8f531c0823c0f759ccbbe1599d33a102b0087920a3;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 20 Nov 2026 13:41:19 +0100
Message-Id: <DN01NSO0FLT0.11GY6QPV7JVR4@kernel.org>
To: "Cheng Ming Lin" <linchengming884@gmail.com>, "Marek Vasut"
 <marex@nabladev.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Describe locking support for
 MX25L51245G
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Maarten Zanders" <maarten@zanders.be>,
 "Cheng Ming Lin" <chengminglin@mxic.com.tw>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20261024001658.222147-1-marex@nabladev.com>
 <8ee5b312-80bc-4584-ac35-cc76c2812c5d@nabladev.com>
 <20261028081534.945416-1-linchengming884@gmail.com>
In-Reply-To: <20261028081534.945416-1-linchengming884@gmail.com>

--654c4deafe92b97eeb8f531c0823c0f759ccbbe1599d33a102b0087920a3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

sorry for the slow response.

On Wed Oct 28, 2026 at 9:15 AM CET, Cheng Ming Lin wrote:
> On 10/24/26 2:18 AM, Marek Vasut wrote:
>> Cheng Ming , can you (or someone from Macronix) please have a look at
>> this patch and confirm that it is OK ?
>
> I checked the patch against the MX25L51245G datasheet. RDCR (0x15),
> CR bit 3 as TB, the TB bit being OTP, and the 4-BP locking scheme all
> match the datasheet, so the description is correct from our side.
>
> One concern, in line with the sashiko-bot comment: since locking is
> an optional feature, I think failing to read CR should not fail the
> probe. Controllers with a restricted opcode set (e.g. spi-intel) will
> return -EOPNOTSUPP for 0x15, and this part probes fine on them today
> with macronix_qpp4b_fixups. Rather than special-casing -EOPNOTSUPP,
> how about just leaving locking disabled on any CR read error, e.g.:
>
> 	/*
> 	 * Locking is optional. If CR cannot be read (e.g. the controller
> 	 * does not support RDCR), leave locking disabled instead of
> 	 * failing the probe.
> 	 */
> 	if (mx25l51245_read_cr(nor, nor->bouncebuf))
> 		return 0;
>
> Michael, a related question for you. Maarten posted a series last
> year to make the RDCR opcode configurable in the core and use 0x15
> for Macronix:
>
> https://lore.kernel.org/linux-mtd/20250922155635.749975-1-maarten@zanders=
.be/
>
> It stalled because setting 0x15 for all Macronix parts is wrong (e.g.
> MX25L12805D has no RDCR), and because there was no user of RDCR at the
> time. This patch is now such a user.
>
> I have gone through the flashes currently in the Macronix ID table
> and checked which ones do not have a CR / do not support RDCR. If it
> helps, I can add this information per flash entry, so that 0x15 is
> only used for the parts that actually support it. For IDs that are
> shared by several parts, RDCR would only be enabled if all of them
> support it. That should address the concern on Maarten's series, and
> this patch could then simply use spi_nor_read_cr() instead of
> implementing its own RDCR helper in macronix.c.
>
> Would that be an acceptable direction?

Yes and in fact with the recent changes, you should be able to set
.read_sr2.

-michael

--654c4deafe92b97eeb8f531c0823c0f759ccbbe1599d33a102b0087920a3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCawA/8BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jcJAF9E/kmErxSnR7jg/hNYnj2SE2ALvVM715N
vihDIpRMR9t4q5LL483W0iqcWM/no4krAX4uX2p6HZIN+77TdCHivdnx4Dnvcmyd
Kl++/8Pn6vWeHBpg69v/a/6F/g63Tj88WYk=
=QVSo
-----END PGP SIGNATURE-----

--654c4deafe92b97eeb8f531c0823c0f759ccbbe1599d33a102b0087920a3--
