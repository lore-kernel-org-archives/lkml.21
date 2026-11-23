Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444949;
	b=FChLFlc5ajhh8ljpwxsKFXDIpQIE9TZnjfXTCEOj0/8NXU8E43/ZJZ2cswpXpkQGwU2I
	 yiL2/3dr4uZIImhSvxGdAYxFkAqjJeWDQOlocLL4vsvcyTGZtC4MjMTTwaaKfGfrGF0SQ
	 goJmmnB6/948LdF5szty5t4SVESubmheZXEhuIs11QjFjXpLLdRti2cP0ODMZhI37fqPV
	 GYryxVIeDjutUNLcid1JDA29beJMiWlOcYFVnVRKqSandDB6O6NPs8dd6RiBuZM0tj1px
	 EgG+LksNeBrCumzWTKlEgpmT751lDT/JEXb3/3e/JWjlnFjQq95Wcw28QgChe6O3PeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444949;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=k5OVr/LE9EGGJL7rLRP9VR5d8J1PKZ3ozrJ6azZxZTc=;
	b=wSA+NFaCnt4F5Y0aj0F4jDtVjAW1iUg/oopAfVgeXgAWtfz56XAjr2uwqnYs9BP0eGsg
	 TRXdUGAtPIeDhGzhfDB2piv40ndLoABVH98YRGdzkMp6YDnishT8jWiu6lhtNae74c0Ka
	 Oy2tHcP6H+GvhZVThBhhbZmfQEbCV+oCajNKi417x3LDbK37WeBFxIs3W33tsROQynFHA
	 QT4RB9RlelM52jwAA0kAYUbRHebTJbuOaioiVXL8wKQq0Mq33lkheDsknHNjuJdZBMTar
	 03hZNoc8VM/1uQM5sKxGZSG6FV+0dpwp82zmIob2JEnYSu9BkEV14IeG4jdBlTeLO7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D9fIoGGS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75DE606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D9fIoGGS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440961F000C0;
	Mon, 23 Nov 2026 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795444949;
	bh=k5OVr/LE9EGGJL7rLRP9VR5d8J1PKZ3ozrJ6azZxZTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D9fIoGGSDIjpaWuyBUBVwNSF8+STi1eIryarFKELGbsAdKbkqXmQEhmkTlyihkiKC
	 1flHmOhQGRQZzJd3a7Q59NwOLqpgPKqmAWXUeXZWxdpIt5Jkw0EQpFo1NY5rCjU31Y
	 bKAn9b0KGJ43OAsrlSErTqFOfaSPrZbtTeXwgZgyI6pHLlefRKZ/Mb6b/8nBJmE9Kp
	 phHqItmBc06/MOKx3TDETC7X89+qAr220hfOe9Tzreb4KZFCwSxImEaRdpCzgq9YNK
	 Xnte78UT69CTH46Myp9YYwMBaJ5TXZOE1iuNJ7thUtbY9nE8dIdKYCPyYI6i9P+w9M
	 BWJwYwXUxn6kA==
Date: Mon, 23 Nov 2026 14:42:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 1/9] arm64: sysreg: Map MPAM1_EL12 to MPAM1_EL1
Message-ID: <805ccf2d-025f-4ed2-85b8-f738bb931829@sirena.org.uk>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-2-fuad.tabba@linux.dev>
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
	protocol="application/pgp-signature"; boundary="6xGYnJC2xPj9LFYw"
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-2-fuad.tabba@linux.dev>
X-Cookie: Truth is free, but information costs.


--6xGYnJC2xPj9LFYw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2026 at 07:52:11AM +0000, Fuad Tabba wrote:
> MPAM1_EL12 is the EL12 alias of MPAM1_EL1, but its entry in the sysreg
> file is "Fields MPAM1_ELx", and the file doesn't have an MPAM1_ELx
> block. Since commit 6ae7fab7d9d33 ("arm64: sysreg: Emit RESx/UNKN values
> for Mapping/Fields definitions"), the generator's MPAM1_EL12_RES0, _RES1
> and _UNKN expand to MPAM1_ELx_RES0 and the like, which aren't defined.
> They aren't used yet, but the first user would fail to build.

Reviewed-by: Mark Brown <broonie@kernel.org>

--6xGYnJC2xPj9LFYw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEUM8ACgkQJNaLcl1U
h9BRtAf/YDbNlEmdb6Yb5HPsoptakOfDJesH7NhOB17CeEIDEkdFHlhLGtA63raw
26ZzTiIICz7W3KF6hD8iKjrlyMwLv7HCHQr2jVInZW1AOEZWADDIZaqMJYm9erc0
QkX8RexdgTUMVSBLvUV9Zcua0CIoR+fHqPj8M+x4wkxdNChK5b7mTfRN5OWoYobW
hKkz4ZLtGXVq7ISQRqdFzlI3aIUoh07iceQeZX0HBGhJDEH3Eot9pwIuKX4NgpqX
T4WQwoTqSxH6VyVQ9YUn2WoTbMOh50vuQClFnfI9xwzrqoSHc4fn4NjwER5zk4aS
3IXq8pcjbrrWK3ci5a9ZYeIwGMvElw==
=bs+f
-----END PGP SIGNATURE-----

--6xGYnJC2xPj9LFYw--
