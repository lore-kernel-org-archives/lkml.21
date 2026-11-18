Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994585;
	b=iwk/K+LsPtmpwKjahRzl3jqy3Jisd64WIwKqL9bIlEnIf/nKw3h5Pwbtzd2t2XtpAfuR
	 OSa+4s3y/lwgVig67ufOjj3sIQ/wh+8aVmmFOVwW3sGWKCii0Hk9gR605Q/0hse2IIsli
	 /agW0uckoZJK/nNX6Fs/ndO7Ipg+9MDm1E7zBb0wuTT6JO9TJlt6V/9MfK2WSG3gpw3L/
	 JivZE+jiMgl8PSCdEOMqlDYDIDBJUdaVqZwdM0EB7wIMu+Kdk6Q8qx7rZ62gfbXXFwAk8
	 Ozq5OAxLOCAo2BQEcurwY3m+bXFNmiNBhOKMNCSvA76634Yrszl/Rx6PABSDu+Ju3kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994585;
	h=Received:DKIM-Signature:Mime-Version:Content-Type:Date:Message-Id:
	 From:To:Subject:X-Mailer:References:In-Reply-To;
	bh=RGL8gtqo67zTaXOPPcJjQ1x3D5OhGNepSQNuVWxQWm0=;
	b=zDBOMJx1LBBQcgHEk4DqSUWRQPMqmh+6qPCsvmZ5Ri+v1W0QoQDuWslQQtNLyDqO15qF
	 mvOr2fB95c0QOp6kg4r5oWM7mMNdJFaY7a5j+VjOF2TYGzPmng7GOlbcXzMkcB8lRVNuj
	 PTce77iZtVOFZZCDpq40t3BgM30FvojQSKTBZ6YjJWIT/ASwTVSJjjWRpvsuhjO2vTj5W
	 6bAjvc6Blbapi8RPMhGKHf3tP7nanSBjKP9UN5TJ06yabgIPokmYclu/48GLRdafpZvnn
	 EkuCgYv0/nBgVz1bUrbpUQJrG763Rt3bqebmNUVod1Ih014DPRbbFs+xQ9IaZLMconA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LHekCrgf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 2E697606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LHekCrgf
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 447D41F000C4;
	Wed, 18 Nov 2026 09:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794994584;
	bh=RGL8gtqo67zTaXOPPcJjQ1x3D5OhGNepSQNuVWxQWm0=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=LHekCrgf/uYJO3LPG7xLt18b/p7B9KxNCL7SEjfewM8b+tAYXceEObHFQSGia+xmi
	 24zubLpcNTAt3fE+NwDvCp70HPOqJYfX1JKvn0/uEyNn/7ZDTad+luV/CQJ7LTLEAx
	 QGzkrut9+8qt5lnI95WrR+C3ygciG83rBNUM+KsaB6WHuH4zhIR9qlOX9qSaHDvbdL
	 wOr+HpKB0r3+GUsJjNdKifRTHy3arV8nlGLjoWQUZnxs1rvqEhM3PToR7TBnx0qfvM
	 9H/PfwINM9eKEE6Th4vx2IOLd0SsnzO1CeizOxdO1tmRjKk36x8DvpfNnHx5kr2dUJ
	 /BPI+G4JLS6aQ==
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
 boundary=ea5a356e3b57aa04ecf55e748656dca03721c85a98af16b5e7724dfd2ac3;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 18 Nov 2026 10:36:20 +0100
Message-Id: <DMY8H2AUQ3LV.VQ3MVOE3YV41@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Tze Yee Ng" <tze.yee.ng@altera.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 0/2] mtd: spi-nor: fix use-after-free on unbind with
 open handles
X-Mailer: aerc 0.20.0
References: <20261022035352.52129-1-tze.yee.ng@altera.com>
 <SJ0PR03MB5950FE5D82CA5E77AAE0AC9CA17A2@SJ0PR03MB5950.namprd03.prod.outlook.com>
In-Reply-To: <SJ0PR03MB5950FE5D82CA5E77AAE0AC9CA17A2@SJ0PR03MB5950.namprd03.prod.outlook.com>

--ea5a356e3b57aa04ecf55e748656dca03721c85a98af16b5e7724dfd2ac3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Nov 18, 2026 at 9:07 AM CET, Tze Yee Ng wrote:
> Gentle ping on this patch. Any chance for a review when you have time?

I had a quick glance, and honestly, I really don't like all the
reference and resource handling splattered all over the place. Also
do we really need the low level kref_ handling? And what about
spi-nand and all the other MTD subsystems? They have the same
problem, no?

-michael

--ea5a356e3b57aa04ecf55e748656dca03721c85a98af16b5e7724dfd2ac3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCav1xlBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hj5AF+OKgSgkq6WET6CBLgx/AdEEayduamVoe1
/TfBTHQgaMFp/Jb3hF5z8YsmfWV+MAr/AYDJBsytNjwZljGpB3nTSsG8QFy1Yh5j
n3WbpoB9HCkdTSKVagkiMJvn4Stc3fWW9nY=
=K07H
-----END PGP SIGNATURE-----

--ea5a356e3b57aa04ecf55e748656dca03721c85a98af16b5e7724dfd2ac3--
