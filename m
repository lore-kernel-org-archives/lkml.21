Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004712;
	b=E7TEzQ20AUuVFkB1g91G8fXnDz82v7AbgTC2MwDrUFdQz1b+33GeYLa4KCBYnhKY7bcp
	 ao2dvaLM7uhmuNTNL+oPyatTczYgPPgUEyDO6y9IPxB6Em93wHGLnO5/vBJHIhj06Dfdh
	 krBEuW3Eqgu1OmPXJyN0lJM/dlovSNA6pNmSYubI7O+2euLNgfHOto7xWmeLmIdkcOk+7
	 GfwFQfmGZ5SuBJvkCsemI/D8wzfgwYeA+hJSIuhRO5TI4NxyQuxJwxuNtCcGC6ZQK66gO
	 gVkdpstlmYnteKcg1rAmjMhMEk4/VdyrXqlNWwF4agX2jddPPtnSklx6XkJzktvdQpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004712;
	h=Received:DKIM-Signature:Mime-Version:Content-Type:Date:Message-Id:
	 Subject:Cc:From:To:X-Mailer:References:In-Reply-To;
	bh=UqBe9rvEXQu8cq61sMILpeZS3JInEFCdIpRs0c3PbVs=;
	b=kM3maoo+B1VxRC7jEgski9GtVvCcfOBXzSlsBozpp03uENIV/DQUlHYpa4lS4uHCuwHY
	 rzrUFHIK36VExphPo1Ut98tAtdPEX5gRfmpmwTX1Kmtz0/T4FMJGYNlRxej8wcGLRi5oQ
	 1TUJ5qDPZj3pd6qYJuL4x1rtgMYl9T5vQN5b7HyeOkkB/pAbjn+vZ0qTrPNTm6H6szPyo
	 1lW8eRYkzsxx8Dg1DyneY6feEe7A8Ok/R4kNTCFjwc/gj8iKu3WzG5tROEKpuSc7aiFRh
	 CCOL3m46Qjrlck5l5yBxRSAZZd5uAj0mhzJDWxxoiYXeKmDr9i/Ln0TVXHJ/B0Ctvjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Um9umf8c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id A46F9606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Um9umf8c
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C586F1F000C4;
	Wed, 18 Nov 2026 12:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795004712;
	bh=UqBe9rvEXQu8cq61sMILpeZS3JInEFCdIpRs0c3PbVs=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=Um9umf8caZmr0sWI2i1c9ItTyZ3fGqEZvi4ArPJh6GoN/IrxgP9T2qW9yBzQSHXDA
	 qNObrFxSzzd0p+Xf+sS0ZYD21jJkajNQbYSEjIIFcYGflltqlGtlffabkj2/TVkaCa
	 X6NYPEPF52S4qmqjXKgsNtVRoSvqOBTRBQcZSKU1VVJzqKhAAgxYzeuOoNjaRUrwK+
	 EIY16/mLkgNb8fhE0SzF695IB8JS0516KkFer1yRCbSYD5p1r3GuRqDde8Hfae1e/K
	 /r0aUDGeRN4bOySxXv9/i7d/EYDM16fCWuM6o5Rfmcw407xGABHkZNmbrbh+PSeYgv
	 5r6UcooytoBBQ==
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
 boundary=c88bb83bfa15e2212b685b47a227f655f5fd51de48afcf41ae2165c1a43e;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 18 Nov 2026 13:25:08 +0100
Message-Id: <DMYC2B7I8C13.2UQIDHJKGBSP6@kernel.org>
Subject: Re: [PATCH v3 10/17] mtd: spi-nor: Fix SWP for octal DTR chips
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com> <20261013-winbond-master-spi-nor-w35t-v3-10-6dde1d513df8@bootlin.com>
In-Reply-To: <20261013-winbond-master-spi-nor-w35t-v3-10-6dde1d513df8@bootlin.com>

--c88bb83bfa15e2212b685b47a227f655f5fd51de48afcf41ae2165c1a43e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Oct 13, 2026 at 6:34 PM CEST, Miquel Raynal wrote:
> During the recent rework of status registers handling, we mostly focused
> on quad capable devices, partially skipping ODTR devices in our mental
> model. It seems that many (if not all?) ODTR devices have no SR2 read
> opcode and have other control mechanisms. Because of that, the current
> support in swp.c is broken, because reading back the written value may
> or may not lead to the expected result.

Is this still the case with the recent fix for the .read_sr2 opcode
from  Haibo Chen [1]?

-michael

[1] https://lore.kernel.org./r/20261023-spi-nor-fix-v5-1-bb6e0ce21169@nxp.c=
om

> Let's extend the _careful() suffix to the helper reading back the values
> and comparing them. Maybe this "carfulness" will have to be moved back
> to the core, it is a bit early to state it. For now, let's just make
> sure that we read back 0s without errors when virtually accessing SR2 on
> those chips.

--c88bb83bfa15e2212b685b47a227f655f5fd51de48afcf41ae2165c1a43e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCav2ZJBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ib0AGAuNEnTdAj/E1hC1K0HhKJkXWeo4+/dOre
l6nq4CMCDj2WrTV8lZgLAfEXpvDwCV5RAXwNxMDvhIWoKI5UVJbpVZl95QEE7SVd
pL56jc8dH4ZJXcypQZo1K2q3mbU4psfea+U=
=U1Fz
-----END PGP SIGNATURE-----

--c88bb83bfa15e2212b685b47a227f655f5fd51de48afcf41ae2165c1a43e--
