Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793080;
	b=h1CDdY0VJwMuHegsrsCeCjYD11HAZeIiafgnB4lb0hFapaEFrT+1mpr518Kgz5Ix6JRq
	 t9KqcAGcHIUkbxUqiW/4whmk22HPMIJQkgVejk5GxA6UwIVQupPN/xpaFGB8BwNg4sNkE
	 Rha+xxK7GUok1QfV6GUK1yE48Tea0TT/HAcBXRvn0v+ma4fZLGhZ3F6/NwCZqT5IyAoEl
	 /w1S8lJbvnimdvUUapIbVR+2B6vhnFbmyUH01M8e6hYM55yeA4MzK4pC5qLmJI6Y9e9nc
	 OIOpq6ozimJIqN4ZfOBz5ifyEoBCIfUIO8NRA+eP0RFKY2V5LDZjfTb38+ukJaenQqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793080;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=Q1YJg/vei7zCrlO//VlRUUzgKSLvS/mC1B/OVWMNfm8=;
	b=HojdA0iN0pQ1pBarkoRuVxXxbdD1mA1fpj88Mt/KFOWwbFStktVTxUl4zGSKp4apqst3
	 b+c1Opw1lY2swjtNq8E3a0OXp2ImNh6ow/H8dj1hg5XNkD/nDiW+ESgh1TtaOPYF95FdK
	 ZLhMHA9yHFTKdmP2jNejn8+FvYItuETyp1FQ0pHdaUX0wGheXkc1dWEAQnkYG8PGksMXB
	 3GpRSoq2LXz1xlonAh1XVje6YBLDAjA2sgAerd/Hl+JGbx3g4PJYfqx7lt9Fy8QYtNV45
	 otY6y8b6XG+J9pQqSUsxIRBL+iJ29YFsbAmj9iSUcqKJECiVXYIiohr3raqxo34fJfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f7NPDiJT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E7F606A329
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f7NPDiJT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453071F008A0;
	Fri, 27 Nov 2026 15:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795793079;
	bh=Q1YJg/vei7zCrlO//VlRUUzgKSLvS/mC1B/OVWMNfm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f7NPDiJTMMMHEF53H60CMMUBuKFBub0mP2TprZRCNtKXW7Hn3d9DBrqQcCoF9WKsR
	 SKKksz5H0AVRGF9aQ89g/Con9+AwelH9de4cMeDXU5HOoPBEMIG8OMMrPvhXB8k7By
	 ZZY/vr77R+aZoMMOVTUQDNgmVwGAdsUetsL8SJDBzydmpN7ndFITpoLm9MNNzIfUkX
	 m21hfUmvC2rd0FHr6pvkBRHNBLXu2wUjYTIbyFnNbEKG+ZOkq0090gEDXI9GGXQq4M
	 fwOiPpcDxPs8pSgmSd45ONH3UsdvvevsCMdK2Z6kzfdxRr0xyF68pJiio9MCL8sSds
	 k47+mTWF4aeaA==
Date: Fri, 27 Nov 2026 15:24:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 10/10] arm64: sysreg: Reject a bit position written
 with a leading zero
Message-ID: <e629f139-ecf5-4e1b-81d8-84fc3f2830c3@sirena.org.uk>
References: <20261127074426.50739-1-fuad.tabba@linux.dev>
 <20261127074426.50739-11-fuad.tabba@linux.dev>
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
	protocol="application/pgp-signature"; boundary="VggYhMZppUsHxq9o"
Content-Disposition: inline
In-Reply-To: <20261127074426.50739-11-fuad.tabba@linux.dev>
X-Cookie: Sank heaven for leetle curls.


--VggYhMZppUsHxq9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 07:44:26AM +0000, Fuad Tabba wrote:
> parse_bitdef() reads a field's msb and lsb as decimal and checks the
> layout with them, but the generator copies the digits into GENMASK()
> unchanged, and C reads a leading zero as octal. "Field 63:010 A" is
> accepted as bits 63 to 10, with the next field starting at bit 9, while
> its mask is GENMASK(63, 010), bits 63 to 8, which overlaps that field.
>=20
> Require both ends of a bit range to be decimal numbers without a leading
> zero.

Reviewed-by: Mark Brown <broonie@kernel.org>

--VggYhMZppUsHxq9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsJoLEACgkQJNaLcl1U
h9BeGQf/c3d7gtDRjhAGL7I39Dax/OUjodyxr9oANgVhn6ke+jDG5mx3Tcb5esl9
0LSwkHVe/o/w7o6P9g68LDgSD8mq7mDiLnoVp2xwm9VBH8FRM3D3QhulcuUaJqZy
clzLodXqDP/2sBUBy3VEwY7sYnQlliO4J7eO6KmaqHbLt/DYDFqap3dX4lxazb8Q
siVcCARjyxRBo14vnF+WGVUnPGlA5X6wl9JuQsWdZqKzuV6soHGnojuDa/xLRoZr
NmC6QSILs1Fk7FiRlvKc9EImIfTD5+nyET3/WAyhD+7q0zVfZUWF0Tt/LrfM8Ev1
igkGcWa7hCMRQdKXYMjZKz7oQrh+Zg==
=BxPY
-----END PGP SIGNATURE-----

--VggYhMZppUsHxq9o--
