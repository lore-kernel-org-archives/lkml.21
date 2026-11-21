Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296865;
	b=QV67DXLqLq3Uz2chiB0QEPvfIKk/6I0FM27S1mG/4WOqsfDdlUTkQKV8z/E89PV65D+c
	 NY/tIB/IDvGOjwEGZPDc4Oe1VKVpU0CZYEWlh+sqFkcvguKw0o+zuWCyo4hnYJqUVkM1r
	 Nhysrw0iyHYbMphIOejEUkkCB1rZrjU7qkQOaTTpOnuhPAr+Tw6Q1nL+1zCw48aDqur3x
	 ofE0d+whDEA8f8Bxnn75QmQ3mmxQ2b5/8zlGgN9kB3+kssC7ZTc1FfxBvKDexefzOhJSl
	 CS3abS/flTnY9i1gm8syj59UrGkNhO5BsDzMEl7Y+6DoubgDfYKW2YVIcDghp4gmkBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296865;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=mUChzLeVR2MtutKX97MdpZQXyx2OvW2YcvAen733fVE=;
	b=GtndlbboFpNU1dTwc+sxWZ48ujMCqC+Rs/DsLd6nuGNy/Tzob4w/xbtyQfyMz65hnJUc
	 t7vUehhqdtsDu/jf6o2o+ArMOANVJcskWTAwA1cFS5P9GWzZcOK0hKML46UcF8ezE7pzI
	 gJyFX3C3CWAbbuXG+uJz34LsQdcQm42gH7Es+FSGy+v4HJPxMc847Pt5BTkY5SAqoDR7h
	 5MLHpUhhKLiX4lB46wtyfHAIYyHbqMhi6178qhd48+zzSFZ2jbW/BXt6njfAggaFWazVT
	 Tgq45J3/bvc0LjJyPUjfNLveKrEtUmTURDZxb3HYaOqlxxGdT/8v2NkgVMRaWXz0zGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=d0YsZAnp;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1FE606A331
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED1FE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=d0YsZAnp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=mUCh
	zLeVR2MtutKX97MdpZQXyx2OvW2YcvAen733fVE=; b=d0YsZAnpbPtYmpNcRM2C
	SwMgfmHzUur9jym6TLvWP6yFBmfbiMz7GTVq2bYzCi9mo7w/J6gmvlLNeKVbxfEF
	ATF4zA8/M6UHo+wOll0MTUswaIbCpJ1Cy5jtzOZl/mgbRMqPWKcWExP9YxEok13Z
	IkGJniWBTahtwqByiPMbUSDp/SLEMvMN4U0kvyY9W8ZiSH1qWjNoV6WbzFV+FdWH
	wAJmaZEnUv7xwJ+Njk39l7jlQO2linQutAXM61ddpShNXZOWt/oRVIdp8eRhi08J
	/FKL7hwLS4TbZmfWrpqX0qscB2/JlqXozeMgtL1R1s0Idk1ooGu9sL+DfpM6hUYH
	ew==
Received: (qmail 1948086 invoked from network); 21 Nov 2026 22:34:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Nov 2026 22:34:21 +0100
X-UD-Smtp-Session: l3s3148p1@iaquH9BgZOIgAwDpTyYqANgHwk2rnHm5
Date: Sat, 21 Nov 2026 22:34:20 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: khendry@reliablecontrols.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: renesas: r9a06g032: Add reset controller
Message-ID: <awIOXP337u_nHqnN@shikoro>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-2-feee2bb28bb4@reliablecontrols.com>
 <awATU_lyjPBxThwq@shikoro>
 <awGZ-nCCbCNEuyr7@maple.netwinder.org>
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
	protocol="application/pgp-signature"; boundary="pTXDnQ8DG42W+K2e"
Content-Disposition: inline
In-Reply-To: <awGZ-nCCbCNEuyr7@maple.netwinder.org>

--pTXDnQ8DG42W+K2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The reset duration could vary for each reset ID, since they refer to
> different hardware. There's probably no "optimum" value here.

Figures 7.3. and 7.4. say "5us delay is recommended" when changing
XXX.RSTN bits, at least for the NoC parts. Yes, we can agree to trust
the driver authors to get it right, but we could also decide to make it
hard to get wrong. Bigger delays can still be open-coded if needed.


--pTXDnQ8DG42W+K2e
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsCDlwACgkQFA3kzBSg
KbbM8hAArBvvQ3J6Gl2ZjLmVjeIL3UFqSTbiCDK7dNBn73kMdODTOv6XgDwwQCJ0
+RQVzZUoF483LdiGroT52MAKjlo1oWzk3gdMmtMt7FtGeZyFbC+E8jykCJNKM8tW
TlPcVmrqpF94fiaGWpaa35ehTON2ezntNWShpvM/N5a467PfztHUKOEMyx7ERO/D
q8Zn//i6qbQ/bci+hmagIMmDXFBiHV6akmDzttSbf4wZdH2u1yroItrahB3wTblE
PL6B5BA4GjBL64FLKr8XW4NVDhxQmAVDoZdMlhUWjPS5vhqCPfS6NNuTLQUzUfWy
E/BWwxn1CWMTxV+HhO4AXFVFrys9T42Z08ICAFOHjOleoLZplVkfMN+zIh3h7wBR
o7iZb25vxWL2hu8UgGMc2sNo8OwT0PATXlCenrBuR/uqhSIsfhRCC/nF02/ZI47v
ahSvFkWSufuVhwIhbUmk8U5Exgzj+Mg9c4TjhrRTK6MCDa4fpdCvNnpl1U72mJHR
Xq3jgLhM+4bodCBDJQHXPVNZwkMbyKlTf+hPpav6okETuNgQ86XE+CNYNywhmnzJ
Mlo12B/mYG5JwpKPGcR1smZkcwNsrp/A+I1asgC7fhSDs7eD5HXNlLBN92yrCTc4
3LnPqGr6KuIzZPaT+I3FXAJ7Zoy5D41UpNpmpYtcFmsR2WAy6ys=
=XIqi
-----END PGP SIGNATURE-----

--pTXDnQ8DG42W+K2e--
