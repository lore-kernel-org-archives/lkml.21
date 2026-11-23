Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447084;
	b=3bueLHmzFYhUSeKUicoIrfVXqZrgZ7Ne/tyXSlkJppMasgXWdx8TZxlcBp1IUhHxXPs1
	 78rnoaNVZ/dXIZqx5+cRiOv3zsFJHXBzvNbxcE9HR/CdetWXyAcS0f55Ai6YOidnyH7LW
	 NcH4m54NO+MrNeEn7KfqU2xks24yn0PGuwTN5L+YgqUvBS69NrcGgXHokAnkA1hpxLZjN
	 wUrRu9ukFYhwqT9ofYrwl0j7Y3ARc/vNmjooD4U/VyOH3bD0Z0iW3PnNaWeD668Lxy8ws
	 CfFjbnljyqXfmqjGQ9B3QINJRKSHlpm6+RR4IgkDIztmVdR0jALF7UXxCcuynKV3jdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447084;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=uFaqDWnXCL7lbQ1m2ghG3uVd4/zClsBm+zuG3VSwDIE=;
	b=0t9VBA9FvgxR/gEZTpP858rDnNCDRAjVLGvuXEnb9vEqSwltE4z9J1kVq2ixnEFYOmkK
	 bMN0VZs6rrv3ak/QfeFNsFkVxYl4XGhNCjQtz0jGnD4CzWfIIaLWe7nQcbJbunk2Lv7Sn
	 M7ZbdjfnoTOjgP2Fce45gaiABuiTq6KpEf+3UBPKgJYKIGjxTRW/cPAb2OwVnXmQBBcWv
	 QkUiwol6EqcoGFm5w8xiOvH1XebaMZvVTPrmvtLhgZr0Egpwk72Gpy15DjVQr3+DGKdIy
	 ODBA1DHfjhKJMsnE3/xsDfJk+iAk68N4AorYTuuToVUpDFf11umWjvqlZzCaMX/CCPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MRHf3VfY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ACA606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MRHf3VfY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F22C1F000CF;
	Mon, 23 Nov 2026 15:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795447083;
	bh=uFaqDWnXCL7lbQ1m2ghG3uVd4/zClsBm+zuG3VSwDIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MRHf3VfYBvEPDsKAPvDiY8ZjheWE2cSY5CeATGae+eyO5iKwmpXKtC+Ix5fnadJoW
	 jfm9jk1+9IZRq7qerCsJhej2YBn8+a3RV7C6L8LctiWXjg0t80vgm6RaB5BuJv6MwT
	 jhFgvNDEC/8yWcYdv8f/R82Ktyh/RZl+oFQlo3rWqD6NTmswUFExjksM1nUBRbetiJ
	 kur7Z3vyRXJ2+6yRGTvKLuELeKZ+nwTw5SZalQbYKzYbpDiLOiHou+nJh0VaPFG/30
	 /FzQ6wQMmNhe/KQXq0oEbhw7hd/FVt7Jpp5d1EBcgcsjcjNXnOkEGaHSwD/Jtzp06/
	 jrHj3+xK4rwsQ==
Date: Mon, 23 Nov 2026 15:17:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 4/9] arm64: sysreg: Don't run the end-of-file checks
 after an error
Message-ID: <7bd3a3fd-1978-4b17-bd88-310dac170281@sirena.org.uk>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-5-fuad.tabba@linux.dev>
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
	protocol="application/pgp-signature"; boundary="zUTPHxRisGs7H7TG"
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-5-fuad.tabba@linux.dev>
X-Cookie: Truth is free, but information costs.


--zUTPHxRisGs7H7TG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 07:52:14AM +0000, Fuad Tabba wrote:
> fatal() ends the run with exit, but awk still runs the END rule after
> it, and END checks the file as though it had been read to the end. An
> error inside a block leaves that block open, so the error is followed by
> a second, bogus one about a missing terminator.
>=20
> Skip the END checks once fatal() has run.

Reviewed-by: Mark Brown <broonie@kernel.org>

--zUTPHxRisGs7H7TG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEWSYACgkQJNaLcl1U
h9BadQf+NSmuypEBCVXyJeln/ZFYlxuxoAKR1U8vOo3yLyl/pboC826kJkApVWUP
e+OlBlq2rlTva7asUusYgIAAVvtxiIBEwYyL4tEq3PZbt3vepDPMV069+1tnvgrX
3CwT131wBNV/oplZAtLCGT5SJF2zRBy2IpGm6xEwBu6YhlyDzrDik5Gx8ker7z9u
0OMC9yar5PPLHveMsSvN+EEAK0NDQO0QdmBAftqphxZGQRQ0fIbl7WYij3qRoDZk
4l0TqjIdnuoiieav0rGZJQeePM8oSu8jDi15X0kIo86XYiJ8IsihxbQSijY/S3Xo
SDMZVOpCxx9HP/ZfzW01vTGFCG8JNg==
=vUIK
-----END PGP SIGNATURE-----

--zUTPHxRisGs7H7TG--
