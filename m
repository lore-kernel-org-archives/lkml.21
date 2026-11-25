Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607024;
	b=Eu1LEUzqO4Xd2Ue2eTXqCNGMGKeMvxYnpfZKf2kvWIwAgqYGhlh4jXo/lJwSfV69tJHX
	 LAfAsfPp3iu0Ha+sVTeSgOHSXtjzRvdHseo6VcY7HRmnCs9OeG9qx/TJEys3rwnbK/Ihz
	 CsuyiCP0S3hqrUcRwiFIPoz6btb3D/rjFZlShSWD+Ox3vSTPAsjtim+w85F88ox83LquL
	 mEdlygPytGOEGOaXkoR6FNRLe8m7O7ctKX3a7KONo+FEkMoWJKAV6dId90nfit39qE3lZ
	 Ysmtr1Qzz+KBTOFh6vR1EKwNvLPFLKoEywpWYh3c88zkjpne+RKmj6FMTHLX/jZCMng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=orbQl2N4vlIOWiLrIf8SUWQ1uKxLJ8cjnJYad+kaD0M=;
	b=Za44msd/AyEbnMMj7Zg9YtD1KLqwavtl4VqWhLyJcw6JqX1HpwW20u+hMZmZxSzBcIaw
	 W5J08n+zf2lV1rncoZkCwPYHJCkcYHTJuKGH3i9W5ui0kEC3hd9zyfOBtZk2GEfeNMHaX
	 EXPhm2wInyM/Y9lVWj0u5PFFUvBcev1DnkiMD9PMsI/jqU9fbr/mgVSblTroyWxx3k+xr
	 VRcKkHaLs1rKT2prwXHLAAYk/fUcgIprDG1X1VbtpdPYl24kTYderj+3l9U92NCsjB5Qi
	 soVIwcqa7NI/5cWYcjHKqqFoJja0xrwpHg7lPDx8DKnwngk+WKBPWflcCeHkf18l/6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CMRkec4k;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BE6606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64BE6606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CMRkec4k
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d05d51553so40593925e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795607023; x=1796211823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=orbQl2N4vlIOWiLrIf8SUWQ1uKxLJ8cjnJYad+kaD0M=;
        b=CMRkec4k5ljHKroiikKHK4JTT+TkveMrUsH8OoShvX5KDi5dPTXWqpP2Mbk0Pfj+6J
         Er7ZpXo+2y75226hO+joL+YszbhdM1NRWuxPLKAyEB8pQpjz1DidQalEl4a1lQ4YS7ED
         PL4+0pNUumQ8wO10YMUGsK6lehpVDiG+BMkjoy4YS4BfEUqBSeD2540gXMl05mjpyHvn
         Z6XMOy1+V20r7LVyADNHTgzJf7i9eoIe0AWaBGIGdOli5cuI7uHYFKWZYtWm8k16wUcQ
         m7ZJwnhUp3g4R6xsVYm7WvLZ4+yPkzw5DHQ8jmCE/dx+daeVXeaBXSP0HABTudNC9Z+O
         S0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607023; x=1796211823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=orbQl2N4vlIOWiLrIf8SUWQ1uKxLJ8cjnJYad+kaD0M=;
        b=qJ1ktOcbsbDqNub4j6i2d7IzWMkvy+RtZXN7rzaKxANseeYbKEShfm6mIqJJj1dD2Y
         xshC/RBQtzJyZsXFBrYAydT3CQNf8mw/DaRXzZ3yFKH8w7V2IPeWCIwO7WZPs28cTRHH
         smQOoUol5K8HUvZAYSxZtBcteaQvjS8d/PNZeUWhp5uJYo3NuRxc1hjC1Az3tdJPGLEO
         niHkKfXpU+WZury+qGJKX2uBFXe0UkYVanGprBJJ8dTu/N1P1oY05THrKU9d3sMWJ6t5
         Gddl+z7dxUYQRjPVDzIH0TVHoU+EdGRB3TC9v4WqQgqJXzKfEehI1yAAoYHcM/d/iTRD
         hqEQ==
X-Forwarded-Encrypted: i=1; AL+hErHJeCtarlALk011ihTYc2sbntiHfdSM1ln4h5aI3TTgn223y9uU4VOushGyjo5VRmmDEdy78Xuj0RApL6g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kP3aZnJxMX+NGEYWZ7UzbBAD2FNw14olxWYddhBykmSjX6UNG
	LS7cE9aohUEihhO2OuiRfgZX1/xvG5yyOOF/9LcC9DXCfaqUexnOxcPzsJ0+2q3ROV0=
X-Gm-Gg: AZFdTZcvHKYqtdUxvFM4belwhp2WBjp3LwEW9JNlY68j5ilHhUbs9xPmumJQaFN3GOQ
	q5CizZvHFxUi28bkbg6QzSFfJAizckLHQlKPe0poK/f8ubhrkknf4J67L6jEKrko0wJnkE4r8KN
	L11TPlC1PvXKdSfHX+y+C576WnTmTty69e8WUYl5wxC9mNx9DgUxLuYryudVkEg8vYJOTK4+jL2
	rs8qa7P/rF5RUUb5X3lfOa/o96SE0hfKoU8sM/ddXeWGmhs3QBENsNT5XtStkGId0XWGxyFpcOg
	4+MIr6L6ehTdImwiZ+oLScB7X45P3fCkAIGJiSfWXEtYEoH9lJRh0KRmrDdDyGTyerHh0+RhR74
	Qn0/JqeyvWYeoRbghB2tDwGqfgj93p3kKcfbN9xlSaXP+PsFf+iZpnfuWLxs8QaRtoAnc6w+qDs
	YcxbLyjqiOYV46v/JlM2bFdlF1UdyM7x+Nwpjux2N28EIugl/4uT0ZYu6PxuagFmJvOlm7KoCZI
	VJWkBGtxCEsy2QwgwuHIPiNWUwqzi4OVCrN+HmHipN505PdHZYD9Ju0JegVVJGi+o9CoQObfDA7
	SU0KGED2JyT5nL0gLlP/P86r0rVrCjq5BQXlIYHE2sHRr5hRJiMwXY5lPUCfYvKJg87ILs7NchN
	nj0SHMcDvKzyIr6Cw
X-Received: by 2002:a05:600c:4e0d:b0:4bb:69b2:d3b3 with SMTP id 5b1f17b1804b1-4bb8881eea5mr364570665e9.27.1795607022789;
        Wed, 25 Nov 2026 03:43:42 -0800 (PST)
Received: from localhost (p200300f65f19a9043ef7230869dfba63.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3ef7:2308:69df:ba63])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884865a2sm527753115e9.3.2026.11.25.03.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:43:41 -0800 (PST)
Date: Wed, 25 Nov 2026 12:43:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Brian Norris <briannorris@chromium.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>, linux-clk@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	Mariano Marciello <mmarciello@google.com>, google-soc@lists.linux.dev
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
Message-ID: <awbJUwrBQw5TnowW@monoceros>
References: <20261125000349.3385325-1-briannorris@chromium.org>
 <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
 <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="huwbq4lvetfh3uwf"
Content-Disposition: inline
In-Reply-To: <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>


--huwbq4lvetfh3uwf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 09:48:04AM +0100, Philipp Zabel wrote:
> > +#include <linux/mod_devicetable.h>
>=20
> Please include the specific <linux/device-id/*.h> that is needed
> instead of all of <linux/mod_devicetable.h>.

Or better still, rely on the bus headers to provide the needed
*_device_id structures. (That is <linux/platform_device.h> provides
of_device_id (for patch #2) and <linux/auxiliary_bus.h> provides
auxiliary_device_id and of_device_id (for patches #3 - #6)).

Best regards
Uwe

--huwbq4lvetfh3uwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsGyeoACgkQj4D7WH0S
/k7XEggAlcj2TrM3p6EXOwI/xsUxWXF252CxwyEWI8ZmPEpI6bAu6Q2vo1jWzU80
RgNMuXczOoZoJ6+hJdkMeoqHuhp2FPvl718ZM9+ZXmIzmzCoBNWIn7I/StnNApVp
CRTaJoMc3RQ58/iAEYs4Bd6kNCpJoojOnWxMnprqZsXFWDmYDOaKauDIqnRyeGSd
Y/roBTL3HpvnWDZxm7b51fG8984ltXAM06Db+ZRdnLxyged3B5xdXwcFGLlqeoKG
ti6pQXYhQnxuxJFTg8v+DdOAKp8wPe6CkjTN92KfVvWDgxJYHe7zwZ1V0TrgDqMQ
p3mJ8Bmk3uxwBcQfM5lzAgDW6N8h4Q==
=fqd8
-----END PGP SIGNATURE-----

--huwbq4lvetfh3uwf--
