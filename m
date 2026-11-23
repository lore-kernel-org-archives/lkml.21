Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462824;
	b=2cA1PzsLLWawRQeM+YckOD27aij9oI+TzvHmvgMrZw02I/spw9Uo/UiloB5zhVb73W0X
	 MF6JDeviVGL5rrp3E7U1muyY7+S3BwvMNEWZH3ndmFTnrspHjeMimq1RHA9XTQ2cbbgja
	 J8BW1VT6yn5ehPA2sNP7F8Z5qqfmj163y3yLNwtl8d/9bGmerVOB48D0YnDXM/+BdACZG
	 nYDlVVAHXa+il0FZyYjRQZGfCx6Q4XMnRzuLeiLq4IRUJCEdiWzsKPVqekazeyw4Cawec
	 KLTpu0OlE9zMTrDZYzSVJkJSafa7MFUL7LWk6nQtjlPjywinA89/Dr/rcqFDaRIysiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462824;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=rWt4jkvX+aDqne3RPrhkEcisiXzoZeGXKrtROR1UN4Y=;
	b=1z6S+xhHJIKSrZ52ADZnKJD+jTCCtWMcfpbmnvvkp1cOTgqBiRCVjy8LljWU5ZpGlbjz
	 3EcPiM0TtBwEoKyVo1kzGVt0nUgEuXJnqsfJI9zCZ6PNr9zH4mC4z88Uo/KVnqkMDnvC3
	 1fNQR2nOpIv8gNvBtsT70uiLfieXdP7U+YFWpxq6OkfN3SthIQ293Ys2We4fdf8N4Fw2r
	 Ybpdx0CLyhrNp13uV6uLN5gk2veYW4v4mImJ4XbURdVarJIjK9W4Q8CKha81qgaLYgkLC
	 J9+RsBuhg8+zRYTvA6ib5mpOzl63wIjsh3faIGBZn6SpMrzaeZ6SpljdcJPEmZO4NRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJ3fE9Ck;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6A4606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJ3fE9Ck
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82641F0093E;
	Mon, 23 Nov 2026 19:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795462823;
	bh=rWt4jkvX+aDqne3RPrhkEcisiXzoZeGXKrtROR1UN4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fJ3fE9CkrXPKFuoKH/Bi76N4hh0MjlZDcgzkP4Y5L+4Ktwnyx4ASX6iATbBzc8Kau
	 mV0EHo+7wAETspFf9Bzb/JfApxJj5SBh0Y0FtoMijGIgUClpj3OVAOKGLQyaCKGs50
	 RWkod1zJS35j1mlAFFeobfKYAC0sYylIUW9LvC+eZBVwNp6USOu4kzVyF0sYzxnHhV
	 eD+oZRp81HBHTi+IznMVqwYZBQsiGMxtXrsiL6N2ZmWwp3MhCv++cyKEPoyhWHXcu+
	 wib3c8x+WopDTbchB1Xfids4V8+e536q9OXfaTGuzSF2cwi54f6bfQHD27v+fUM5gN
	 Oa7x3mYsQUoZw==
Date: Mon, 23 Nov 2026 19:40:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 5/9] arm64: sysreg: Reject a Fields or Mapping line with
 an undefined target
Message-ID: <5f2e0fbd-95f9-4349-8db9-079ac02adb25@sirena.org.uk>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-6-fuad.tabba@linux.dev>
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
	protocol="application/pgp-signature"; boundary="u4GOULcsuVh2ieqU"
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-6-fuad.tabba@linux.dev>
X-Cookie: Truth is free, but information costs.


--u4GOULcsuVh2ieqU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 07:52:15AM +0000, Fuad Tabba wrote:
> A Sysreg block can use another block's layout. "Fields X" names a
> SysregFields block and "Mapping X" another Sysreg. The generator emits
> the register's RESx and UNKN masks as X_RES0, X_RES1 and X_UNKN, but it
> doesn't check that X exists. A misspelt or missing X gives macros that
> expand to undefined names, and the build fails only once something uses
> them. MPAM1_EL12 had such a line.
>=20
> Check every Fields and Mapping target once the whole file is read, since
> a target may be defined after the register that names it (MPAM1_EL1
> follows MPAM1_EL12). Either kind of block defines the masks, so the
> check accepts either kind as the target of a Fields or a Mapping line.
> Give fatal() an optional line number, so that the error is reported at
> the Fields or Mapping line.

Reviewed-by: Mark Brown <broonie@kernel.org>

--u4GOULcsuVh2ieqU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsElqIACgkQJNaLcl1U
h9Cv6gf+LopeoyCZ/hE1CKI7NNJOTF/QI2dwVp7OmYRtHEp9e6D8bT1muSASYpuB
Xyc6Qt7DnUw5tqjcEfFVyuPYMx2kGckLoJi6oH1VpyF0gNU8av46tjcSYecEo+2E
/u7sQtH6IZ0eSKGrvSEvKk4VtIpHHtjU1BLeNPL/n00yaGADVZsjfANnZSqk/Q4/
UqQYkGT01RxzMUkuGYZxDBkfos1zQ3P+Qp5zU9+9M9mU04EKdj1nntMRJzhkUC0Z
5m2u+I24zfI51GjeKNq+mOxd1xNjHIJZBMeABeNjmYseO4Z2xqgMKGLUsVcxLMv6
Ggar/2fQxkzrh7Np2HKRhF/bhPwqMw==
=d5xF
-----END PGP SIGNATURE-----

--u4GOULcsuVh2ieqU--
