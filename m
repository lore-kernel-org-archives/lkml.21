Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462339;
	b=TnqzntYsNzYhChuw2uq4IM35VXQqGC+N0upy4IuOOOPfjtUG0RMa9+sYcss7nVyykR0P
	 8Xry1DlOSP2XVfof0TGviw02g6DUZyKj5dXlJjqMAsqLAEwQODP4USJ+nC7kbMyMs/oCg
	 StCNwNV0Ny6bfwp/XgpmsyxRBRXmyihv5NOnipUrlaDC/TxqyVdNMMDxLgGvRTgv7HWb2
	 WbjeVc1QouVEmh/0J/HobUSxV+V2nV+omLN7a3+NwgPxNkUcVALvnek2O01KuQS+sVyxn
	 2AXBDJGVwigPA+6FFqLtLeikAUXkLs0Yjfljvm1rSxhipsc/jJGppaHFJIxMkDbzHPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462339;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=hzS4w5tk+gpP4Q2NMUst51stis15Ur5c4oCHLdwtSy4=;
	b=2ZMLzCldZn8uGlyjYgFckS6gQ+PzPKXUdsyt7YUZjca+XTRt4D6qxJACP7FX3+jjFR81
	 OJAraqkUCTdTccW2CyXyjYRFQzd3CY5yuAjs0TejYMafN24Nh7WwYviCrDKHlBmQzgNP2
	 l/2aLXC2J73QQ93vVOW13R5qmi0hZOI2y+jnjaC/ugDwoZACFAepgZW1S1ih52OT3BzUY
	 CptLomy/zpTqEgO/tC1dx9EJ54GH/bsumoqTNmi2UwcBfRp/kbId4WAaSWf2j+jPctYrq
	 VJJNdCmNCKibv93eYV5mr/Qh4Lyzw2KwjfcecdMiKKHmoivnNKTU3eMWU5VxegWm6Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WBD0V4de;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4968E606A680
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WBD0V4de
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11111F000CF;
	Mon, 23 Nov 2026 19:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795462338;
	bh=hzS4w5tk+gpP4Q2NMUst51stis15Ur5c4oCHLdwtSy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WBD0V4de2ZrcPyEqpVzkAi14634UyyIv5EMHRvL9lIK0/CfDYBMQlaSY90wT9AoSg
	 5rpIN0/DUwuT47Mjfmc9OfGDumAa/xdtRzcuXHKd37GsC4BYjPqoqPN3bDEoStN35S
	 OCF0KvBDt1y1Z931+Er+8YxwJKbzJTiXFdgkJZm1DnEqRlYysJp84VdKLH5V8Wrc+B
	 wBuCP+7hv8KCKF7JQldFDy/8SxIDYfPZ/ZDm5E/JIbee4pI2rG2BKF23H+jWIsApk8
	 JxILWIhaE/JxDpr+gbC1aD7I26Tl1X9CWkmWfDIk2Z4Er+eJdXK1z7Wbb7YvFuOZQV
	 Wiun38xScKdcQ==
Date: Mon, 23 Nov 2026 19:32:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 8/9] arm64: sysreg: Reject an out-of-range register
 encoding
Message-ID: <3f72896f-9da9-4408-ac66-21ec1dc0e8aa@sirena.org.uk>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-9-fuad.tabba@linux.dev>
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
	protocol="application/pgp-signature"; boundary="D+tECgGGNOmnrsxN"
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-9-fuad.tabba@linux.dev>
X-Cookie: Truth is free, but information costs.


--D+tECgGGNOmnrsxN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 07:52:18AM +0000, Fuad Tabba wrote:
> The generator copies a register's op0, op1, CRn, CRm and op2 into
> SYS_<reg> without checking them. sys_reg() shifts each into place
> without masking it, so a value too wide for its field spills into the
> next one. SYS_<reg> then names a different register's encoding, and the
> build doesn't report it.
>=20
> Require each of the five to be a decimal number that fits its field (two
> bits for op0, three for op1 and op2, four for CRn and CRm). Reject a
> leading zero too, since C reads such a value as octal.

Reviewed-by: Mark Brown <broonie@kernel.org>

--D+tECgGGNOmnrsxN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsElL0ACgkQJNaLcl1U
h9Digwf+Ob/6mMq0Hs0/SGUQMSBkiDCsJJu1H852n/og/5QQQhniSNYJ7kltLSEe
bx9qAXYwDHfrZ+XL8RHVjiOUMywCunYGBC/ZUVpf8oKFnRTTrGOpvqTStnFdbJsd
yaSSFwEb0Kp2zc59oop/Gtje2gpjtjAGFtvrM0WBRzPqAqPy1oDLEhdy1TjWyEVr
7dy/tHvXXSfleRpp4uJ/UHz9pQozGIfi0pvVO4Hr/QwJfjuT/MsWFRlaLHJxC4Fc
1Iwbf3KQnJNc7KVh+WNe4+eVWJcy3W8wJ7/qVmwQvspUWrJmw+ZyBti7LX0mckWI
NpuL5XhVH1D9nQHY2EMYBDDsjntd2w==
=p0Z2
-----END PGP SIGNATURE-----

--D+tECgGGNOmnrsxN--
