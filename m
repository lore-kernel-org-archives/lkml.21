Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997559;
	b=Rbm7yYkU6K12syklmhSgAsIGQJVpwIxA8xODG7v3BPsaqv4be5EGutMewUDIbnn2Dnfd
	 GNe8QsazzlzKLnB1Zk0kBnmNfK7ih7g57MATSb552VbMH2D67n0DcrkOsUSOsS+zymWDy
	 4j5nL1mGQIvcku6tsIL2Uyf8FmLPRfllmx2Rqy5nRewey3fODegN0V9ERL5597GU93sX+
	 B6jIfUw3shCeQ/WfyeHfW/SxZhmbenxFb3eXhQiYgh/tqrgGu3OniVxhZBqtkWWw7SuN3
	 k5goiD0TP9ChwBx47T4/MsJi0Jasv6LseGrxSma/598ExlVkcEIJLcikIzBLcpUhQZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997559;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5+A/JE9HHMD6dVa1CZzmW3mLu2nIXMpf4wNuwenC3+U=;
	b=gdgesuIAFg4f2+Lm392KBht+P2tRjo+/k0m97o4eLAWIdAqFrukVtMP3wjLomIjXp9TS
	 EF1ZSbvK4JDpyFDt80SGyJnOPPD43EFYfsstQyrOyfPvovWd5YJZsNv/EJLI9OA1PteRW
	 hsLqlc0/8JM49HnpCaVltoYSQji9Iw0wGxudnUP1D5JknQGlI/0MaCZ7fEh/ZZWbSpNs8
	 Co+CjxfTwjOLxMx5N4Ym9ueLJy5iuIfRCPYoG+MYtoZGvDXAJY/9aT6wq0+Pe5JIr/qWN
	 LY/QJCAvcZFSMH1lGYsetntA2mRPJKXq+slOM4lT9r+LA0aUyXi3ZHe46Q5sq+Jytaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=GxTQyBaS;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E11606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68E11606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=GxTQyBaS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5+A/
	JE9HHMD6dVa1CZzmW3mLu2nIXMpf4wNuwenC3+U=; b=GxTQyBaSgKQuxxOenLFT
	O84dJiQJBpcVrYoxyFGunEe+EqcW1TheaLc1BQWC+xBwFjJ2LpOtIOq+wvm2BFzH
	bKKJZ9qjN9FRSbQ/Zvlc207xaTyTcnZtgcmvAsPYsiKap7lbde0Rpo9PsSu6ZyNv
	TwrWjDnT7UyankInaIMJFf63BOUGe0E5AMWv7nxpBnze5To7ZNfyCKfwMLjhyA0l
	G546ZGw5rULm6VfXgJJyLiuIKvcA8o4V3ZmgL3Djn+AYCYDQsAD400X5mi5YxqGg
	omAXhygeDTQjxgjEZ65HveExb8xWXHMzl/K7mkQs3k+Z7qgBOnw8Vlr7AwIWVPju
	iw==
Received: (qmail 613206 invoked from network); 18 Nov 2026 11:25:53 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2026 11:25:53 +0100
X-UD-Smtp-Session: l3s3148p1@ocuBb4pgPqYujnsi
Date: Wed, 18 Nov 2026 11:25:52 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v8 0/3] Add Renesas RZ/N1x EDAC driver
Message-ID: <av19MPAXUdBRWyup@shikoro>
References: <20261118-paul-v7-3-rc1-edac-v8-0-ed791084cc19@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="NCYSeN1R4nBIFoOa"
Content-Disposition: inline
In-Reply-To: <20261118-paul-v7-3-rc1-edac-v8-0-ed791084cc19@bootlin.com>

--NCYSeN1R4nBIFoOa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Changes in v8:
> - After discussion with Wolfram and Geert, the driver have no reason to
>   be disabled by default. Remove the status property in patch #3.
> - Reparent on next-20261116.
> - Link to v7: https://patch.msgid.link/20261019-paul-v7-3-rc1-edac-v7-0-84c76c6d7595@bootlin.com

Added Tested-by for patch 2 ;)


--NCYSeN1R4nBIFoOa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmr9fTAACgkQFA3kzBSg
Kbaz2A//ZFr9og+NfiSjf3BkKGwKvg29uJAcd5HTu1pehLA6BcyBojdxor7SjFRp
kXz4KHXpvxs770gBwMM6QGN2QiLofED8gMGIg/wY9tqMh8ibtBheacty9tBg5Kha
1/XIjuG6zn78jqEYWLAhNZbruRPVSdF3MUjQR8cgdmHKelLaOofyRXuWt9au6a3b
hS3MRaWpI+lymMZKJu2yckVt6r5OfpAknbKLusuCDTtLGfFV8iFUfHkREmeR5ANI
CxgbZxbAhes5cxdYlRDSssMG83Pr1Ppj1FR+xOd7Qy0gyW2p+OO5eoy2D+01eSam
V5GTy2g06V9shiroZijB6cfuIEbStIfWGEd+SXAOTENzQPCcyRGGaBNcwwzTG1Gn
HHZOfnjg7tBtNHVXeHgJZGmccYYmPHrMpQ30Uz8U0VcGUGssuqMWqJx4WKoe2ljp
IaaeX13IcuoK4tfA6SD5gjlK+Gx97Epq+RWscHZoDsnzLQGWyqqFk449MF7cnD8/
Z8dPq2JPnOO7tktGM5Y962ckmHjFERXRujNlq0HBAtshuwoUDW79my/9AUrlIHuq
iuKPT87Ztfqqcj7vrb+yReC0liWcfSP22dSGDs2C2NvuiStY77rbHQZUEUmGWEHh
ENJwlNKZfRTsnIkYIzmrNT44OoRmr7Ha25f3C6EQfkNmHhIgNoQ=
=vTIW
-----END PGP SIGNATURE-----

--NCYSeN1R4nBIFoOa--
