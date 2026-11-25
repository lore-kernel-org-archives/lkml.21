Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601240;
	b=hGvDQClmfPfSo2ZHssWt2LOYP9f8ie3FoPFkPPg6PzOmUS/aaMhKwZMe9n9fr8pMi8Zo
	 R1tOY8dHJno2jaIyDxZVImH1hglbW/jmFMqa7jRm91PuAYMul+pjoSHmmU/tzr0rsQ9uC
	 d/DSdqIXz87v48bBKgH/7ccG2Zj0qtCh00jA5oNHKjGZCfq9CI9IucfdhQykPw3NnA2CJ
	 wecZJ9EWYv4samecBV9qlgs7q95kp89bf09Wt4VbDZL7mXmB97/iRQu55HwWoRlUB/Nh3
	 R9QNSFXzV7+X+wy3+RW3xM58j+PNG88QHls8j633xlHPKAiSZJZlTPwJJst1z+xIbjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601240;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=t5t2s7Ii+LFKy46c9t+nabqsrotZJfh3u1iVlFeZZJ4=;
	b=eyPmsDk/hQg01RW0TIgm8L98PnmFG+0VDreOn/LCT53k302fFRe86gNF2qb9Ddy/tUgK
	 1uGYaYobqudQwsUxCb1zoGo8Ku4TTI6JLlLhZd+XvB/U9iVNbc2QzRiDPDXZ6CPaQtokY
	 YouHyQGCsJhe6hdrI/IVRpU1kBbfOVChkFmjfi5uTEIJpWzsuUAb+MLjLIFvXbc5lgdXH
	 E/QddW+ynTztDFZO8mgDpwCnU33PQ06HCdyJsWbQU6BR76BXB2SuLfWcQbaEZg2NqqW13
	 PkmPBalXOFiGYP0pWfzKR54PT/XNNePgjXgPcC/rwPX6QYlR6ipRuf5k+ErrVhGWQHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lhtQCyCk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2570F606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lhtQCyCk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724F81F000D1;
	Wed, 25 Nov 2026 10:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795601240;
	bh=t5t2s7Ii+LFKy46c9t+nabqsrotZJfh3u1iVlFeZZJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lhtQCyCk0LHIE2S2NytEYTRnql/je5PXZxgn3EPkj1G2lccSl5wh6167eZMrDAslP
	 /PLHs7fI0VB3ThkJrY64+EhQP+p2qCIJYGNAPwYS5pZs22u3KE53u96mbqruz1CPwY
	 Ctf7KIMm7yT8OG3qP3bCBtdvAeSd8zeYCNZz4j/E86SzmZdzpspsJ02/NaNccP0U8r
	 AdbU/3K900ogg2bfB91w8DCIR3TsmjmfCatpLlA4Q8tBp5yal/lrNFwfcNd/WYFGAw
	 X7Oi+daG8SmXgnfF/n1cRz4H3mmVEifl+PM83NWXXq2k70M/9AgzX2OXCSW3RECdFS
	 ZReup0mCFYCOA==
Date: Wed, 25 Nov 2026 11:07:17 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TcOgeGlt?= Pedraza Padilla <maximpedraza@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/4] drm/tilcdc: Implement state readout support
Message-ID: <awau4IF7KE7hUg6U@houat>
References: <20261116142707.1299360-1-maximpedraza@gmail.com>
 <20261116142707.1299360-4-maximpedraza@gmail.com>
 <avs2dagfmQkv00H0@houat>
 <20261118212114.150992-1-maximpedraza@gmail.com>
 <20261124141119.441163-1-maximpedraza@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="6ijf6s26eb2pqdmi"
Content-Disposition: inline
In-Reply-To: <20261124141119.441163-1-maximpedraza@gmail.com>


--6ijf6s26eb2pqdmi
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 3/4] drm/tilcdc: Implement state readout support
MIME-Version: 1.0

On Tue, Nov 24, 2026 at 03:11:19PM +0100, M=E0xim Pedraza Padilla wrote:
> On Wed, Nov 18, 2026 at 10:21:14PM +0100, M=E0xim Pedraza Padilla wrote:
> > Makes sense, I'll use the same approach in tilcdc, and see if it can be
> > turned into a common helper along the way.
>=20
> A follow-up on this one, now that I've rebased on v9. I ended up doing
> it differently, so I'd rather explain why before sending the next
> version.
>=20
> The tidss approach rounds the clock to the closest standard refresh rate.
> Panels driven by tilcdc often don't use one: with the timings from its
> datasheet, the panel on this board runs at 56.8 Hz (33.3 MHz), which would
> be read back as 60 Hz and 35.19 MHz. The adopted mode would then never
> match the panel mode, even with U-Boot programming exactly the same one.

This is *very* surprising. Do you have the datasheet available somewhere?

> So the readout keeps the actual rate (rounded to the nearest kHz), and
> tilcdc's CRTC compare hook accepts a 1% difference on the pixel clock
> before calling drm_atomic_helper_crtc_compare_state(). That's what the
> leeway is needed for: tilcdc_crtc_set_clk() only gets as close as the
> clock tree allows. I checked it with modesets at 20 pixel clocks between
> 16.9 and 45 MHz: the PLL misses some of them by up to 0.015%, which the
> exact comparison reported as mismatches, and they all pass now.

Yes, that's why we need the above mentionned helper, and more generally
why a lot of drivers allow some deviation from the clock.

> Testing on v9 also found a bug in my readout: re-enabling the CRTC
> (ACTIVE=3D0 then 1) with the adopted framebuffer crashed in set_scanout(),
> since it has no GEM object. It now keeps the DMA address the bootloader
> programmed.

It should be fixed in v10, I'm now creating a gem object.

Maxime

--6ijf6s26eb2pqdmi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCawazVAAKCRAnX84Zoj2+
duDQAYD3l+AIc0jBEhcEx3zw9GYOTIEqQ6qLxBxX11q81+y3MIRBQOxNNnTGnIWK
3wKSJwgBfiML+3gV/MN9hoyRBHy2vr9iDT99Js+wWKGc5hUe1MRVkU2CuRA9plqu
iANu/2EzIQ==
=GcoH
-----END PGP SIGNATURE-----

--6ijf6s26eb2pqdmi--
