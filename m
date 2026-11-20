Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185247;
	b=1cOClJZNyyloe8KOIDekxqAC4RaRauxGBpxrff3yrBVUl46iQxXmo+G2VQ3HxFYgqFIM
	 sT9V3fHJGY/NE0J2qAYKtt+ydJJUUWuzQ03XJyEg9pceJ5PHcDROu0JVVIR5dyEv0DT1l
	 pSjBoZoND6FRistr91Ww1pDJNLtTZQusaAHy5dHUfQ1WsBpgelSvkaNYu/IE4dJu/sXyJ
	 y0YMz+YXeiTn18WAsmgXVDp2ALk2wSDPpbMFFwnKom9cfesPk8ScxFZVd//ZaaYpqJtYL
	 hcqn/tEFrBe9vEUVIz0VkXYsfkRcIul2FcTq3B4N6A9L7F+k30bLOZAixTw4Jew9VMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185247;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=YuAKHbbXV3jCHWSzAuL0OsesH9HU+Le2AJuVjr7ZIbM=;
	b=opI0O1Ox5m1SR4iTDHIXcxe/OKkuXNTWouK8A26klYE9cHiwQ+Q7O1nnPOLngJbm6qwo
	 qNSUeoF5GbHTHmy1lofDRdOEpXPjlCqDUdJ6TxbIw3xnFxjeVwtsQ4TA26CrLpfHJhC0x
	 sGe6jrmvsejx3s1d5jd+lGKM4OmoxCrXi6fzzt3gbWli0TsKhlf31oxgDRjg5GQM7nob0
	 zBXJbudm3V5E5ES2LunqDmJVvUWHalEN98AdE7BvkdEJ9Vl/N7w8Mchtlfos4JlX7fKah
	 8YTIfV1FAYskrU7ctyeOiUxJwUtKfjW1Chg1xjaxIRazJhubB3kI/K8VVyU7xkNeAnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BycBojCO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2900606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BycBojCO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697941F000D3;
	Fri, 20 Nov 2026 14:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795185246;
	bh=YuAKHbbXV3jCHWSzAuL0OsesH9HU+Le2AJuVjr7ZIbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BycBojCO2/GXenUyEVZFK/6ZS4ELIaMuZIbnwO5k4o8jKPF5HiU5GZHVtw+agS1Lj
	 +zMR//igXD2bLvZGZbHgfzeJ5ZDSaoaJMQ+QP/F+H3382tdHOs2kplcxyh9SEk2Ufl
	 cOBFuhAFZ6HQNldsJC8P/d39kZ0+mrx5TVBHEgQ6dq+TAF8MtBROjImoiCR/MRZaK+
	 8u+SzCAEgS5/0easNb755oW8z2YYiDHNV63vvP6QLOBBBAbbPWAxbXucO6g0S8dR8k
	 9k1z+/XCN5Gb80jCETJpTqqFRfcQVTA6jUduWeclHJW0srb92W71Zl/fny+3KGQ8ZR
	 tLv2ZaZMhrAoQ==
Date: Fri, 20 Nov 2026 14:34:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Victor Chernyakin <chernyakin.victor.j@outlook.com>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>
Subject: Re: [RFC PATCH v2 0/2] regmap: add APIs to bypass regmap_field and
 work with reg_field directly
Message-ID: <8f9f8fb2-9755-43f8-a24c-a5eef0ab8541@sirena.org.uk>
References: <SN1PR12MB2528812E26B65457239E9EEDA57F2@SN1PR12MB2528.namprd12.prod.outlook.com>
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
	protocol="application/pgp-signature"; boundary="KLTvVxng65nBkwQ+"
Content-Disposition: inline
In-Reply-To: <SN1PR12MB2528812E26B65457239E9EEDA57F2@SN1PR12MB2528.namprd12.prod.outlook.com>
X-Cookie: Error in operator: add beer


--KLTvVxng65nBkwQ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 13, 2026 at 12:55:44AM -0600, Victor Chernyakin wrote:

> This is not actually a new idea! Both it and the current *_alloc approach
> were suggested as alternatives right when the regmap_field_* APIs were
> being added [1]. The *_alloc approach was chosen without much
> discussion, but I think (and Patch 2 demonstrates, I hope) that
> this approach is the cleaner one.

This approach doesn't address the main driver for the field API so well.
That is where we have devices with similar programming models but
differing register layouts, for example bitfields changing sizes or
moving.  That ends up meaning you don't get most of the inlining
benefits since nothing is known at compile time, the compiler wasn't
being particularly helpful with it.

--KLTvVxng65nBkwQ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsAWlkACgkQJNaLcl1U
h9A9rQf/Yaj2RbG4+o8VT61wK+hEBTh3kU8b5w9stHCeyxcp1Lx4rBp0DtTrbKhO
w9ACOeNiWBTTplnElWQ/SfRYl/vKatcmnBuaOIUF9sOONAQcmdlYsTRRraTOoDYa
viN55PbapyCPditMhUjEVuprtEKyO2m5EpNIiC0KGbvcLY5ng8SDLpa5nzBZ/fkd
SQ8fFoJ1B75lVbwWHddkyFPn3WSTljDX3k4yufmhGGV2K7icbiI7X9tH4FwkU0Y8
qsuuBE42ZMCvcqnMHKKctWe+4BiaRX/AuczLnV69XU5OJ/Elt3vlM6znp+QhU3ZO
l9T7gPuAv49WuMoWeCwnSpm+nHQ9ng==
=9D7h
-----END PGP SIGNATURE-----

--KLTvVxng65nBkwQ+--
