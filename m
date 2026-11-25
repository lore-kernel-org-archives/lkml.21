Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603985;
	b=DSndCzp+Jcm1t48lh+H7fsoPjQ/v2JwfDxsnOvcPIaEfmUJfQPi9nK6CVB7j5x6FcSbd
	 1T9G/O8wm6yTskVCQnwBzPceNUnrxsullergoPN3c0hBkl8bY/bshLG/gxLdmA6/erhWo
	 yCKyAL97+Prg5bky25dGYk2g21X2u/QZj1bVXHv63hyQMqxBBryNfKV0avzkN4pIRvSS+
	 0P/YA0PtSY9yVZI51jmnwNv6bOhPlQ2XQP6WF1EqgNLp47wSqFy1ydNYHOWJnJrtldr51
	 Qzgdg4YVdn1nJr3Npw/y7T4jEZGqZXFaj2V62Sa6DxJXiGsu5NiIEUJDBGXhkn2+R3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GtyqZEMexnqUKbDqv2TlW/7VEDcPuxK4TtntSukqHfg=;
	b=VPqnwSgTAPFr1cbn17b2apzZPB9ikEu98YpLC/Lmh54bB0MAOx1vAJkjE92Wrkzv7Sz0
	 dbaXnSu89cH8/eo20rY/2k/a/Z3yoBNUoxyXs2ThaWrVa3mOgasXDQyU0okMUV5/LBhoe
	 IxgUHzZIjcLfi1hY1gHB0+MzOkJ30qw6JztP8583hsBfcryR+K+gURIYThRG1QGzes5nX
	 fLCl/J4aWcM6N8bY+lZ3fA2Ix2Rxlo5Fp8XseGtmxnXNwd62dW1u76R57+in+3+rU+h0I
	 6Xl7i+rD3cxQZGjByaRP8gKGVtEWGjHOcsBfZI5lNvS2OzjZ9OuFijvsyI+A7QA+gqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZQLLNSep;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC5A606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CC5A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZQLLNSep
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so27615555e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795603983; x=1796208783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GtyqZEMexnqUKbDqv2TlW/7VEDcPuxK4TtntSukqHfg=;
        b=ZQLLNSepQaoHarrnqWeyG4f8VwH9MS+htiIaGhKRruFOrQbKn+J9w/l08zzFlA5J5c
         umSjq/J9LJyNcElsTl0fwemLQy5VpuESexyNF7A+r8IyufkqFyWYa8R/6aOM5wQ8nQEd
         qyi6yBtbjHxdkT3++ADg85sE3dTkBryDS7/uruqwp7VlLMuMk/PhLksXBqm88a3484XP
         Z02GhcPzwGG5XoLCIxR2rjn7pdeoq45tX+Fb78WOZpyT9iOjH9a0cNp+jcDDdqNvfKq/
         MHPaESzBn79lc/KQpTvzeq7MAF4+5FydeFO15G5Ei7yYiOhiMI+MEneGwF8ANdHRPoN7
         FZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603983; x=1796208783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GtyqZEMexnqUKbDqv2TlW/7VEDcPuxK4TtntSukqHfg=;
        b=qyVcBtC9068mMDHQNfQ/9UYyh3UYfaOr/ORXXbOXZSD+iLcvOe8C2fvTyT0of444bl
         haFQ4lsO8QNw6sgZJSx6xg8Je90Znx1XzjYXP6kWH3mj/+HXw1KamXr/H3U9VEMysH9n
         mPYIx+9/+BWoV2OdNIjYz4EqQDUgyWawErJgnJlaEYeChIRH4pNjiIQF34BQAPHrFTHI
         4GeCMeppSEH7xY3d9giGH29JaxmJmQmzBbe9i/9YAn1EHwysr0dyb+nhEnGWZQq+0xMC
         YsYFWvON7nLzxiJaMQ4aunnnNFZDJIEK30cKeCejSkujj60srK73tukkUTosoaMeKUws
         1GOw==
X-Forwarded-Encrypted: i=1; AL+hErHFwj7Uln3z+kEZbACbobYeyny+gu9P11j6wGHg7xMjr/vqZx4W9wZeCNDgXJBx4SeyOF0MlnkcDcGeVRQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kTmM+FOuSlT3NqVjZRK8CGRKnw7Px7r36rqU2mKYzUuJRf7hS
	iBxPLmGUf7XlsVbc+YJElxUndMpdt4alJm2ar4T8N4KkiQ/jetq043hMSqHedBJtm3E=
X-Gm-Gg: AZFdTZeYcmOuohIAfspvrpKUIqb5RPNTNS8coIsqOT8xB/mMrSpQPXbcvbWRppbKYhR
	j6U9nMYNTfocY2SqPGHO4pxqc4+8IcAc50cZkNPLjF1N3/S+ItdAwnIFaAwC5ZfM7+jLQDOqr5x
	UcbPFpJBtZhtaQQOr4SU+wcpYOnjHuXWY0hiFhXE/CTAI4qebm0l5cnXghzBexr2DB3kKZ+h8D1
	+oEr3h3Vdea552DfXKOLts4SKKOrilJSgD5nwZIfnl9gtij2v2fQMvQE7MvM9Z208DXGvq6B7/0
	B6PLePbmZlCFfZ7faKGPExiWak2GEShhw37eHSZZ1XAEK0zL/aSNuwbndH8xfsyeDNIs7+vE8Hl
	+Zk9QAIfTWzAuiKKS4Zjxo4wE4if5gOd+XUh659+yIOwxI1brGFnta1PFqOzcdzzmlhttM/mE0P
	1miOPWAXSH4qLAgi3YHYx3hi2IXIiERbOpcWeRoMQEWTuXqZlNrKP8AgH9g10k7pVraccpXBTUw
	W4oQkYcmwukd5/JlgZuA2yP+9U9UVgsZ69EdBXsQrEK15Idv99wJEYKIpJ9zOm1SujjUgrQQoMF
	1x/2zvICVmbGxW64t5uJ07qtLQpO8LrAG3p/tcqYKpLyQ/kiMJlaST+H+mUdjqyKbPSfd9MWp+B
	UPRRoyMQEjdSR3Lgp
X-Received: by 2002:a05:600c:638f:b0:4aa:2339:a375 with SMTP id 5b1f17b1804b1-4bb8880607cmr329616615e9.13.1795603982845;
        Wed, 25 Nov 2026 02:53:02 -0800 (PST)
Received: from localhost (p200300f65f19a9043ef7230869dfba63.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3ef7:2308:69df:ba63])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb853a12acsm539176075e9.8.2026.11.25.02.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:53:02 -0800 (PST)
Date: Wed, 25 Nov 2026 11:53:00 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Magnus Lindholm <linmag7@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: richard.henderson@linaro.org, mattst88@gmail.com, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-next@vger.kernel.org, 
	netdev@vger.kernel.org, iommu@lists.linux.dev, joro@8bytes.org, will@kernel.org, 
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
Message-ID: <awa6Owm3eDW3EitJ@monoceros>
References: <20261115103809.1288167-1-linmag7@gmail.com>
 <20261115103809.1288167-3-linmag7@gmail.com>
 <awVzJMLVw4wUSqky@monoceros>
 <CGME20261124232303eucas1p10f2da7a94c8aa19fa4e406d089c1367e@eucas1p1.samsung.com>
 <CA+=Fv5QJxoxEoKxRpm5Hisdf=y+VpmM-s_VBC1tDQ2FTCfb08w@mail.gmail.com>
 <3467269e-9929-4c9f-bc19-847976f49527@samsung.com>
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
	protocol="application/pgp-signature"; boundary="6sn276mtbb7rvtiq"
Content-Disposition: inline
In-Reply-To: <3467269e-9929-4c9f-bc19-847976f49527@samsung.com>


--6sn276mtbb7rvtiq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
MIME-Version: 1.0

Hello,

On Wed, Nov 25, 2026 at 09:54:08AM +0100, Marek Szyprowski wrote:
> Hi Magnus,
>=20
> On 25.11.2026 00:22, Magnus Lindholm wrote:
> > Thanks for catching this and identifying the interacting commits.
> >
> > I reproduced the error on next-20261123. In
> > arch/alpha/kernel/pci_iommu.c, I changed:
> >
> > page =3D (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(dev, size, gfp);
> >
> > to:
> >
> > page =3D (gfp & GFP_DMA) ? NULL :
> > dma_alloc_contiguous(dev, size, gfp, dev_to_node(dev));
> >
> > This fixes the allmodconfig pci_iommu.o build. A full DP264 UP build
> > with CMA enabled also passed, as did an object build with CMA disabled.
> > The full allmodconfig build hit an unrelated cgroup sample error
> > involving PATH_MAX and LINE_MAX.
> >
> > I'd prefer to keep the Alpha tree independent of the DMA series.

That's up to you, but in my eyes merging in the immutable branch
provided by Jakub into your tree (or rebasing on top of it as suggested
by Marek) is really the easiest option. That way you don't have to wait
for the change to hit Linus' tree and there is no further need for
coordination or others paying attention to not create non-bisectable
commit graphs.

However looking at the immutable branch I see it contains both the dma
API change and then separately various adaptions to ethernet drivers.
IMHO the immutable branch should only contain the API changes (that is
the commits up to 31f7e12d621b) to reduce the amount of possible
conflict.

Best regards
Uwe

--6sn276mtbb7rvtiq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsGvgoACgkQj4D7WH0S
/k7oNAgAknak/QZHg7BqHZFzHCe4qtzYco0MHY20TLpuveFkHfRuLa9UVG2bG0Ww
LQZfbq0hnFip66k6fjmWJ+mGt0QyF7sJj/DpkCtXlI6aQtnnm3D3slJhpH/bWjue
fk1SdxjYh64pzlg1UF9rEJri73sW9fln2Gz2EK1iHllG2Z1XRGwb4bBzh6WpzAxc
AuLAWN7R4PJvFLQ+kNkR4YocW5+EV0RnYb7/i7Fb9ABP1MxCxi+4OM8+uD8MGuGZ
OFggCxgES6vXm2Ostds9EY3vRvG+zs6/ZpyofM5BxVfPInkgG1teIzoXDpivIgkA
C+dJzsR+ixI93VaJu1B++KrDBjHhlw==
=UmCO
-----END PGP SIGNATURE-----

--6sn276mtbb7rvtiq--
