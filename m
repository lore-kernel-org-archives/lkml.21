Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461737;
	b=310fj0mORmds7c29oPpVovWY519bw5Jwr/tjSVK1vGTn5e06Lcl4htFWe24Kwth0RcC8
	 yAU+1EGqoclNVJG8SBbaa9GQPxsE1O+UB0Vby3UccQAUXVn1CQaNBU8ttQ80w08A4PWTl
	 t5qF7Fl0eThK154b+TLirRkNzzi5VWzemQFKN9N7dxPnXOBhqnFXjPdKtWhf3OGbtmPoN
	 RAUtc5T2C8eyGPJ/iLIZ48g6KEkBpSJ6fsnPdF0tn9arhyzNk1E1FWU9kMNIilQ64gx4+
	 Sl34rlHhnaNYgWHwAdClWvk7VwxMivGFeN34GVH54gEsDHZmBiLY9zTmaJMYVWP0VCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461737;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=r7x051pi9+bzNFVFk4VRqaN6J+AY1zf6tYeOToiqKg0=;
	b=2nPjEG3H2GtxkzAgm6ms0My44aLs7CtavkRDY2qdI0mZ/wGyFftiGQEjdEyESf6VLGbj
	 IqhOmGQTuTl58rGybj/7aQ811L9glQ1o0RYRuLa00u2K55mpXY8AdmOMUchNGCtA5EvMs
	 oEh5PymjHp8OQW85NhByhkCLfmUyAt7OdJMs7yaH8ml8y5B41PSvszLX84gVvccfS65Lg
	 EAe9WWOfFufAN6cv4po8/3gAAphQ/x9iPLKck91WISqLCDz5UNrY8U7a6c9fHIi3YQkAr
	 z7a+TBpTVUK02XIvagcN6h42otHJwzAIWNW/xDpnZuTIVQPKB1L+01R5I9OnhN0I6JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CilitgUE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B9A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CilitgUE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DF31F000ED;
	Mon, 23 Nov 2026 19:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795461736;
	bh=r7x051pi9+bzNFVFk4VRqaN6J+AY1zf6tYeOToiqKg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CilitgUEz+xIRnkU/Nf9+YPk0lz6OoORcacSbADqIWEozhyqNcLQodPiPDoFR5McH
	 Xsaf4sExdsc+o9QkdV+zIwX3PtdAoh3VOSLqqH+ZXxtxG9Q1SJPb3ph0VKRkwCvkTu
	 kBXlAjjwKAOVSVPjxVH7XEBSl2aN//O1J8TENE6SNIUBI6wYNmfYqtbDLsGpy0X85s
	 yJ9pzYnhBQlutVxDrR75DZqrLhKbRTwhSAN9ZrIenkRMo4XSssgVQ8bTY4nC9wZS+S
	 aoCIWkAdA+a7MKGNbJcB0w8ZlBhm2mSLldWQXa3NUWfCX8SP2IESGVSOPNm8Kgth4p
	 VcMeOAv8d2FUw==
Date: Mon, 23 Nov 2026 19:22:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 7/9] arm64: sysreg: Reject a macro name defined twice
Message-ID: <5488cf12-1ca9-487d-8d4e-f738154f1dcd@sirena.org.uk>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-8-fuad.tabba@linux.dev>
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
	protocol="application/pgp-signature"; boundary="TpVsIbikX93Jrlqv"
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-8-fuad.tabba@linux.dev>
X-Cookie: Truth is free, but information costs.


--TpVsIbikX93Jrlqv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2026 at 07:52:17AM +0000, Fuad Tabba wrote:

> Record every macro name the generator defines, and fail on the second
> definition. This covers a duplicate block or prefix too, but their own
> checks stay, since they report the duplicate at the block's own line, by
> block name.

Reviewed-by: Mark Brown <broonie@kernel.org>

--TpVsIbikX93Jrlqv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEkmMACgkQJNaLcl1U
h9CJ6gf9G0VVVez9En/GNAc+Xta4ninX8YZMyyF9nppj5A6C2+mDoLqGpTskuURl
GgML4TBtz77l0Naw1ZeMHkyB04pinVtuzHHPS1w3/us9kuE4JP6rSMmgD6vO06Z9
ToxvP08vLjJeo/WO8H5bURcCDSJN/97uhWw5h94DVCHdDSJ/Kri0J7KP62eCzfld
T6uxdHivQaf88bl1APISQbzeB3frKnGQvbuww33Ode6I77XmvbjZizEhHb0IDm8U
n9EgXmCvjJc9S0t+iOUGVacyjKgR6a2xBXdWbxiu9MUdgbcx9yd9lNmDQxj7qN2l
BjoUB+wBY8Cma4CIHlj40hMqvUqp1g==
=5oQk
-----END PGP SIGNATURE-----

--TpVsIbikX93Jrlqv--
