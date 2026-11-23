Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449454;
	b=mRS+2fapcH75dD/HieNdRugBSr/zvYohDiKkcSIxwxnUVpfCoqQBLm4+xe+FCW8oP2ue
	 6aTobQx5OA2tt4Aj3LfSrNsNkMGABLLJBdX0DFod7SlHMnbw9gXMpAZfaZ9IZlaufAmfU
	 b8lYFsM+p7tzfn6KFtiAgdKu2cVHV5R8k5lDttWFhG3IJCN/DdOqP3I3IgZkj9E/2oxgB
	 bDtZfmC2cTHUyp9LLZDNYrw3NcPb9MtMpxbho2t6f+oMZKOofA7KG1J+KkCPykXSK0pyL
	 ZVJPMNHCTE74NDb6NFSbU1Ik9/W2FmGdGWHNBWNJ7UOnV5efA1CJVKOUyBRaSexiSfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449454;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=8tlyN40+7Qkubt+Fz9S4uHt3fLqvkl8zPBbV6YJWTAo=;
	b=4Cm4elVf9ldEBsVbpbd9qz/EhZb5dtHbOhSlN8mDOV1IPnaBS3V5OanfdyQobuE3O/gk
	 f3hvUvYxt2VvcvbHrQdmlJVMbzCbjI2su5BukVhh3fSvnEgw9sUo62lmmKaVuHrBkM9TZ
	 6kPlIa5im3kuG6ACLZLPJR2rsiOx7ErmUWw9TbfHsifN2bdYjwQJBKiuXrBHJ7MKa6lVH
	 NZT0dsDP/e5/hmJaBPX7jJh57vsBmhuxeVYyR4IOOuzcpPMZJKkRt24L/gL5GeiuusKcL
	 oC9oSVUxKNzVBUe4gEeWosVLfQc4dIHzuXtijKE2qEFupoj2MHXiI4COdy/1+T/yGZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UTb1u+Nm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8C9606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UTb1u+Nm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0071F008B2;
	Mon, 23 Nov 2026 15:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449454;
	bh=8tlyN40+7Qkubt+Fz9S4uHt3fLqvkl8zPBbV6YJWTAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UTb1u+Nmrdi5Yh8tOqyRuQfy/U1vNrfIzK093DF4CmwWZJYfM4yTJ5E3GRnlpArCG
	 UKGrU9Sbmep1TMn93hhi180d9nH+DFlUR4cLaBE2fY2MNUgK8Q500JD1B5QuACTVV6
	 7Lh3+zv8IndoNEYYahvhuzjlOuowvTjpF1pPz+zsby+eyC32UQm9R5sjwnrFwULFwo
	 FHg1q1SjCXwJ38lzD51LpLBizCTi3PH0kBmqRz0WTxV4hHwME9r2anHp4zeqjGGETh
	 I+5hy9LtJWP514Fq1HNg+yBa+gCq9osa+Ll1nXBq8TW+BX1N2q91OX3n6GWL/CEeG0
	 2BC5bzQ9XFNIQ==
Date: Mon, 23 Nov 2026 15:57:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 6/9] arm64: sysreg: Reject an enum value not written at
 its field's width
Message-ID: <aabfdc59-8f37-4573-9956-14f077274d3f@sirena.org.uk>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-7-fuad.tabba@linux.dev>
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
	protocol="application/pgp-signature"; boundary="7/fkz7ZJG6AWevJ1"
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-7-fuad.tabba@linux.dev>
X-Cookie: Truth is free, but information costs.


--7/fkz7ZJG6AWevJ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 07:52:16AM +0000, Fuad Tabba wrote:
> The generator emits each enum value as written and doesn't check it
> against the width of its field, so a value wider than the field defines
> a constant the field can't hold. The duplicate value check compares the
> strings as written, so 0b01 and 0b001 in the same field pass as distinct
> values, and the rule's pattern, an unanchored /0b[01]+/, accepts 0b12
> too.
>=20
> Require each value to be 0b followed by exactly as many binary digits as
> its field has bits. The one enum written otherwise is TS, a two-bit
> field of TRFCR_EL1 and TRFCR_EL2 whose values have four digits. Write
> them with two digits, which leaves the numbers unchanged.
>=20
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Mark Brown <broonie@kernel.org>

--7/fkz7ZJG6AWevJ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEYmgACgkQJNaLcl1U
h9CNFwf/YNeLN46QZ/8fTDBpDox7PAhAxy/YFSdH0aX5xpsxry/XZ3zcL4wXBwk4
4yz10kSaD4fxpPK4sSLhtF2JIJs9k8HllEjxbbsu3SHnxbgH6nQyO2zI9sooeL3a
3C7PFlpifQ1pMj+NWN7ecK+a+Nwj/oqILFcRHBEeBNDRpK2ueRvCBdA5LjDIxWEe
ddRIQnMKZe3AaZ/hOW69CW6rZ/MFZMJyXkoVV5t2UBgubA1kVh5+WK5cZds9xEB4
WHEFGiuo1N42Mbjk3KrGN+NFXZBzqjSVNiek4XWAOfFX1081bzJGY+Xp9dKN0rSx
fO5SsapAeGWrnohmXacu6LdpJJHjug==
=YhFc
-----END PGP SIGNATURE-----

--7/fkz7ZJG6AWevJ1--
