Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445773;
	b=fzdbUnYbFAWaNIrVcH4BcBckhm2FOTzjMWKcfZohXTwTQpGaBN8Tf3BYgKQ3/qOhTBcx
	 CyIChIzvOYH5F6uY7bxDTp5mbUSjE/ssqFD7aXH2fKxFJ3MjbNBZlR5Hqm8/nLsEwmrrS
	 LKkzLW4sFKj9WAlRlZbnUPqu1ztlT9+SVwLsD4pBawhYCqCT20D1nSkw5dCljgiC6/+Cu
	 tJw+5Ggnoe4WQFywWr8fTw1z/zshy1vqT69qC6Y6sacMne8h7n168YYXKqde6q4MlkN59
	 V1g9OqV2Wh/q07yuJaEtXCTW0cOH9uHGFdDrcUgYIFs7sBbpEFNYs0igTUgA4lxlKMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445773;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=bsIdwJux2CDGy94qqQRvPfHr2bHaEifh/4QwhpwKeB0=;
	b=hVdt2JAxjgK89pGewMD+DcpgXyAWJobXIOeSjZeAisBOEZe9zAsDo+nrQklFHarzuBcl
	 A7TTWu++KaiSJAvNngEAVl7Ma4/rvw8v7A4JtVnN9R6/3bLO+IseWLtdLnhr76MEDHd6B
	 yyBGlJC/AP+iHs0XpteNBhYNjcBV4LH+kapezybCYnhgB9GsbiGIkpX5maHy54Eq84hB8
	 v7SJLs/D4KZFcHS/QQ9FK0HthMh2GWqERfa0XQeqUR2Eic3Ccg0+3/OslvBNVIic1Ed7j
	 io1zkQEpiBOA1+jJrF0CKo2ArLE6i6Q2rrU/RPAagWoaGVdFsg384FumfuiQrBzMRcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ve62QMcv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81E2606B41A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ve62QMcv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83C71F000ED;
	Mon, 23 Nov 2026 14:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445773;
	bh=bsIdwJux2CDGy94qqQRvPfHr2bHaEifh/4QwhpwKeB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ve62QMcvcNmW5IsBQgXp91N5mwMjRF3jwkTeKlNmvt7G5Um9s5dLPxxhlEXuusPjh
	 anrqq/3r3PXatcQRXWerLCUiYHURpfTqmNkr2BHMAyae/bI8xKlFKRrTXEsaB4bSOr
	 jKyFwuGPrpeLV4S9D5+N6VrBmeDegCfu+RwFQY766mT/idByxySmvGd03DlO6YX3hi
	 3++kVjs0j2A9UWq3lWBAaE44znY9C9h7P0Y4zQBtZQ8iX5Yog6wYkgp7ZjIwp86brU
	 BAy6eTPi9c4Wta0tKY/1HWaiGHzlOtbdvVxnsqYbZOFQ7dotUUeLsiqsePNnKg//lK
	 hzRjb+q14p6Gw==
Date: Mon, 23 Nov 2026 14:56:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 2/9] arm64: sysreg: Remove the dead range check from
 parse_bitdef()
Message-ID: <55bbb1f2-3211-46c5-b9ac-29085dbde2c9@sirena.org.uk>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-3-fuad.tabba@linux.dev>
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
	protocol="application/pgp-signature"; boundary="EhbfqxCr+9y4XgGl"
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-3-fuad.tabba@linux.dev>
X-Cookie: Truth is free, but information costs.


--EhbfqxCr+9y4XgGl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 07:52:12AM +0000, Fuad Tabba wrote:
> parse_bitdef() ends by testing "low > high", but the script doesn't
> assign either variable, so the test compares two empty values and never
> fires. The "msb < lsb" test just above it already rejects an inverted
> range.
>=20
> Remove the dead test.

Reviewed-by: Mark Brown <broonie@kernel.org>

--EhbfqxCr+9y4XgGl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEVAcACgkQJNaLcl1U
h9Cw4gf/Yz7m38uN5HVSvq6TBArXkcKn+Q2/NXRuRsHMAQoVzIHkI64+wlMyz5N0
Tywqoee/LnGccW2jfrqIyg6ZHyutd+tB0HlzoRo8hiSuZq5fJKsZNlq+oOiuKwvC
kueuipZvy5isobvlRYus+os2HZY4iSB38+Xqb/tr1sTCeXh0pJNtLIKACHek9if0
yR+0QB18uY2NKwWfpn1UfQS0K8m9bxBZSBAp8kqpTPwhc9Lmarw4gk/Si9RS2VDD
AmMfEjapxKbz6SSW0gOzaSdbt+R6g1dcl3xsIvlQuRLevdl75s/psvqvVfN0p+JA
88csfKhJDkCHCpzo+rVF7qZxt9lnzA==
=UN5H
-----END PGP SIGNATURE-----

--EhbfqxCr+9y4XgGl--
