Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220091;
	b=aFmoER462QNuDXugiqSt6uspBynMpuq7cVrRK/q8UH2CxuhILemAQBfpPlD7R5DJgOyr
	 QrxCuFVrq0SfvYFDjK00n3nauUOm0r2SzWfixOiGFzcKuf4zHwbexxWjFckQQwuQACFH3
	 1DFrrpcgJRlF77H22TWH4q6hClsspyYsyt9mIcGmd4Yp8ZaKGBawxNs8irGDJqTFRCtPh
	 qNNJot2tL1TAEXUvP0sfbqhlIoAmOGNI6i5qc8vwhO0gS/WpywwP6BdBlAjO1Rwpg+09m
	 NvxhQdMxSCzmQa86e18x9jRrP7zlvbJ/9Cpozs9m9Z4qkdjKJd9dULvNv5ZRpOPMuLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220091;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PZ9yAwuYp38koYq9RCy2HQMtrR8Hqg4c34VB7omPkP8=;
	b=xQYzN9NlHReqw+sH+tRGy8WYF6nwElJdh51FoFh5YEj4ofWF9AX4ckwSpmkyYhewIqHo
	 gDM9QrGfXCWzWKEW0Y0t87M02y0sZfIqeRXgAd+BVLcNc4Q4c+6TA9T/Fk+i51JFx8ADF
	 Emso0v7jYqR/bC9rfOVSqYoBbyv/07v2Z+iSRJcWnkY2yx/YCeFXvqyaov5NXMdeXMTkC
	 B4J1ZfPZzb80QhgdS638R2PNklfKdDy/WGG5ltaI6UbPQU8sPWLRjwtZorVvWuN2qPm6B
	 eVv3bDWzceB3uNpZTZAvCrja/ItGOr6H54BdaeGdXQu8kDK9ImbrayJFRPowy4gapbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DWaVk1Ag;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2CE606A6B7
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DWaVk1Ag
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 953FB1F000D8
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795220090;
	bh=PZ9yAwuYp38koYq9RCy2HQMtrR8Hqg4c34VB7omPkP8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DWaVk1AgYX5aJsXOBhKeb1WSnDKKqVlQQXuMPu//iVws/5wISZjV/f0wWaHW2ALfJ
	 c04/68RkPhs6b5Y7sYJq0PgobwoWz1oQCH1tbh/JFj1fxvHcUOsi1prqx4Rb+8TGrk
	 Pis57zHBPJQghkA0n0APv3lS4ipYeMlfbgfucV3n5D92HI2PPMYgEYM5cxzGd1Q8xB
	 pg++G7kuj1X7Oj7ySRxgtSRDThdufqcp59B5u9lqyU0iZ3MHp+uqGIhE8Nmzpkk8F9
	 uqLaQ/H59OUmvlr8Ey4rYjgTkgROo/cpYUEad1d3wLkofiAOCMJFBRJZ87vjOIjmA6
	 1BqCT7ARUkhHw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c1a3374400so1125512e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:14:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHEzRnt/st4eHdC9R5LUYi4QERllvgjz0wbz7AImxshFkb5UWYsV8OUT+4ssul/7H7m6nvoiOCT0k/uIUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z98w4iem07E0PrP5mqBc+uQfNwStKFWXFoY3J6QxvR+iP8NBRD6
	muQE5x1exf5iAssruJt9IzilzrBXE8BoZCvsbaUpFdTIePg7gyUs/iMLWO4e9Fn4X84Q9k4+xZs
	ueyPSGwiwd4RZJBAmX+NrxbI175AHZdg=
X-Received: by 2002:a05:6512:138d:b0:5c1:56f2:fdae with SMTP id
 2adb3069b0e04-5c1bc81fb65mr1484922e87.51.1795220089318; Fri, 20 Nov 2026
 16:14:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260828-zstd2-v2-0-4d9ce7150877@kemnade.info>
 <20260912123827.3aa54e58@kemnade.info> <CAD++jLmdX=p7Th3omP8dMQuUPyTziMDwMeGPyT9PEGw-wnT5DA@mail.gmail.com>
 <20261120105659.16f48da2@kemnade.info>
In-Reply-To: <20261120105659.16f48da2@kemnade.info>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 01:14:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLkGtLDrTwrYANBvoRHuSV-L1bALNygXSAr=UKUmvumbfg@mail.gmail.com>
X-Gm-Features: Aa3M54oYxLLeiIoar9C202engs6-8reJDb1b0ieFbWZCeVeyB2esuhPIJYUycmA
Message-ID: <CAD++jLkGtLDrTwrYANBvoRHuSV-L1bALNygXSAr=UKUmvumbfg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ARM ZSTD boot compression
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Russell King <linux@armlinux.org.uk>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, j.neuschaefer@gmx.net, f.fainelli@gmail.com, 
	Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 10:57=E2=80=AFAM Andreas Kemnade <andreas@kemnade.i=
nfo> wrote:

> > Please put them into Russell's patch tracker:
> > https://www.arm.linux.org.uk/developer/patches/
> >
> I have put them there.
> I constantly get this from emails:
>
>  linux@armlinux.org.uk
>     retry timeout exceeded
>
> So how to proceed here. Am I just feeding some kind of black hole here?

Try using the web interface and see if it works.

Yours,
Linus Walleij
