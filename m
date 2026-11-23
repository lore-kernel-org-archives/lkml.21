Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446751;
	b=dhFukleEGZUb4iF63iVFvuyYqWGO6I0zHdtbI6aUvtpzSTy84fnXmkUnhCibGqGkfItP
	 YHHRcYtKe7TMgvr+1mP2T9tLcyJQpBz/nnr8Yj73RPtztsQPJtmyiaSG6ubfQkXz2csVd
	 GO4dlJ26wZTa4xs972foEd54XX8E8TdiXV73r933v4MmjOMTiW2lPvp6gVDNStd8bzm1a
	 9nzf03zbiCprr9XkiGxbZ8KUmU8mQ+QfnaSsz0a+/5whVs0Pza2H/80JN821BQTBag3qG
	 i8df6gCQNEXDZdPB8qSQzz9zHMluDZp53g5EpMXUDIzFAjjcQL0yzWLibxEJoCsgH0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446751;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=Wxk7B7PFuan5joq/yVQKmCCEtznZSJrtGIEWSRbzgrc=;
	b=37rl2YGueAcZVqZEc7JqF6FggVD4HlSkUSigQPMjUIcQ6u/lVVaf03C+n9KXFVxlxdhV
	 +PfT8st7keDZqwz51YM/Wx5DmuXol8ZiOwT4Zrhh+jsOkqNyscRvWd0HMF9c/HBl2s6NW
	 sUwcAHl5RlKZw2BgAMxOLUBiq6CHCUxRibclxM5D9MWUAlC5oQgwRTZcmJJKWvehPut3P
	 vHzScikwIrXDOMvc9DOHW23hQm84m/PxhYCRQbvRtwUtStygKq3m2K3GJ5+MNnBxZBJ8n
	 w8DkMVUcD8xVITl5HMSqfJrw4Ki3pUSWiLl8C9xZOntY/4VS8AwoXN7DV5t7JxYFlbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kslaK79l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBEC606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kslaK79l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA871F000E0;
	Mon, 23 Nov 2026 15:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446751;
	bh=Wxk7B7PFuan5joq/yVQKmCCEtznZSJrtGIEWSRbzgrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kslaK79l57T0qR5vGV7ELtGq37tF20pxUagzw41djQ0Ns4Doukv9rpls7mqt8RkOF
	 AAOIuDnrCCcxMLZn7lvfYNuKrN89O9Ezpz2BKjmq2TfMFQ+Lh374tpQkA8ibwKw/+z
	 rcufgsz3av5cTyJZAuLhqPrnN9sVIp/ixb/57Bsc4rdUFl/B5MIOzBCQjTpl7L/MPh
	 o6aekkUgQoL8UMiXKHb7kW36d200Hg+oDPyTViKe9jk4n/fjq4Jk7mv+QiT81s7Iff
	 rVK8w2e+cWQsaDP1bAzD4Gp08Q2bRv44fkRxYcqOT0gYCAkdus4gQEji1b4MNlj18B
	 rE8qNgRssmHuw==
Date: Mon, 23 Nov 2026 15:12:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 3/9] arm64: sysreg: Reject a Sysreg and a SysregFields
 with the same name
Message-ID: <9738c9a6-8e40-4fd1-900d-f348f84aa33c@sirena.org.uk>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-4-fuad.tabba@linux.dev>
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
	protocol="application/pgp-signature"; boundary="mZltvRBnIGYBvbfX"
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-4-fuad.tabba@linux.dev>
X-Cookie: Truth is free, but information costs.


--mZltvRBnIGYBvbfX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 07:52:13AM +0000, Fuad Tabba wrote:
> The generator rejects two Sysreg blocks, or two SysregFields blocks,
> with the same name, but tracks the two kinds separately. Both kinds name
> their macros for the block, so a Sysreg FOO and a SysregFields FOO that
> each have a field A both define FOO_A, as well as FOO_RES0 and the other
> masks, and the compiler warns only where the definitions differ.
>=20
> Track both kinds of name in defined_regs, so that a block is rejected
> when either kind already has its name, and leave the kind out of the
> error.

Reviewed-by: Mark Brown <broonie@kernel.org>

--mZltvRBnIGYBvbfX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEV9kACgkQJNaLcl1U
h9BFjwf/a+uTWOL2w2fGAih4ZFxCdRmDPI0lORk1uRY/EwUS4pTT6T95X55ZZsiq
DrfywqDojL9Rvq4UdT68snDIJYWp8atheiuYld4aYw9JSg473hbnG8Jpe2D+zgwG
FVWA1rZaYLwM7esW8BAYA99oTQOtyHsfNVWldygU1xWXMo6b2We++DTVshtSVab8
VeSzxcR8dTVVENeE6fA2lCfkYJLQmv67fkD/MRVP4qfbkMi2p2hTOnKsERENSWfa
UOG504rltECx6G1/OD2r6zEcoFG2OrhrR90nlXwmCYHmSQZ8Z0/zIv86aWHvqyE9
mluJtY5ZmxOBmBJZgBsa7ipz5uIYhw==
=m9OD
-----END PGP SIGNATURE-----

--mZltvRBnIGYBvbfX--
