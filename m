Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433633;
	b=YMJVeAvXP6Dc8748N71FT3bbTgaWwgfvR5P3S3gyX1lsLQmHK4kxfKZnXBjOi9XQmFh8
	 jGT/sWijbv0nkrBz6GVm89H1gUhKpF3S4pVnAvNeK1c89vI0lMerTN4rrh8lIx6pkfdvu
	 gGVR6g6Harmcl5gVLNi+T3iHmCIS43kMexpnQZh20Ke6ekE8SwVy9j5dgwDnt9RyLQNmb
	 RpwSbvRix9UDMeeLwAkr8E633Njdln1RU3FHH/P11VNL1qt2e5eJSn0S1g+cyOk8Ny4qj
	 X6Y/lifJYqR0c9uAatIQMCqnuMyd+0ws7rxvcGj+mWFkrmRIRC0XCjBny2MO93Axafg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433633;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hwTobTkBKm2/JiwiYi2htTTLwpWNDT0Iwb6zrj1effc=;
	b=4JeoIih3NXRKOlHTeDen3WengpchIAqVwCEvID5IEQ0DZ22krcsZ040D1l4di/npgES+
	 tZggHiizSeh3YCP6Op2yJteS+gdMH7nUXmEP+7yU9RbQskjyBE5Xi9uh9hxRLRdet/vzq
	 HqVIFnWIrGddx1DvPLqv6iUP3HhdF9GFb2+zj8V87M+JFjiDdnpaH0gUTGoQGCkph8+00
	 BeRzOt2BiQF4DG2seuxDGBOPDnZsSMDThHc16uGEfDA3V+2vkav/hwbtrQHhYyb8WIfEc
	 8JdQmG+Rq3h5QWvVXYJDFbObukcfnqdeQkkN+E/KsX5yxy/7+Vkhl9kRodSHE0eT7NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F14sZ5ih;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE11B606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F14sZ5ih
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A4C41F000E0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795433633;
	bh=hwTobTkBKm2/JiwiYi2htTTLwpWNDT0Iwb6zrj1effc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=F14sZ5ihiSJcWYxHWXyA0XiJs3VZapM4gtxOv6f/78F22yc/zW94Pe+rIceK5uiQN
	 rN4vxdPjMMyLaTkeVfu+6xo0dfJ+WOpuacTaL4RBIkvsIZQjOu2V3Shk9FxH4Eb0h9
	 zM55HI9U2oCZop0+xtrhlkfvq2SR0fDNU9jENSHnvKbmmyM/MmX8kH9MTgwd5u34qg
	 908tlanZCWRgXMEdez/va9HaUALagWY5NhhKO54WUiiLhS9qpkNa7QBt4eryDHMu51
	 /Xs3wt7iWWXS6/OeXZeVt1EO2w1Vvic1+0yPI8IAZ/mGTmboaUfmvlxXnHgwfcCWCe
	 eo021p1gITiOw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ae22dcfdc3so24743991fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:33:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHQvsfyyyiuPq3h0kwPjBlI2asBx5ZJQ8b+4zUF6gefGHjHa2t/fOQk30qJsUiJyIsZ/9wXEgqekmzHjO4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cEBhUeHVzrTaI5wzb5SQXdd54i4B5e3tjUPYUASuGu5d2NjWQ
	uLQjHCWvxOWfTofh1Ooy5Nkz4HJSMiyoU7KlIi96ZnmNBYksbmnPG19CsqSzUlLXRBBRgkzvWBa
	qCGDqeU3m7gjLt9Ro5aOmWNlXHrIRp8A=
X-Received: by 2002:a05:651c:2214:b0:3ac:e24f:aa11 with SMTP id
 38308e7fff4ca-3ae7f9978cemr32522291fa.7.1795433631887; Mon, 23 Nov 2026
 03:33:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
 <CAGb2v66nKWdF3AvXDfb07iYVQE5FC5yDkhuutShp+Z-EgFXEfg@mail.gmail.com> <20261123111547.24280-1-vinicius.eduardo.pedrosa@gmail.com>
In-Reply-To: <20261123111547.24280-1-vinicius.eduardo.pedrosa@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Nov 2026 19:33:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v67+kz8kdz1FBX+dn8oifOkQie6hv4FZ2Fw9VHZUvzAcSg@mail.gmail.com>
X-Gm-Features: Aa3M54rCROWHf9umhZr72KzYmEmJvMkYMlPSpk2XNjS86lerVQ17v5gLjZWKnw8
Message-ID: <CAGb2v67+kz8kdz1FBX+dn8oifOkQie6hv4FZ2Fw9VHZUvzAcSg@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: add Radxa Cubie A7Z support
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 7:16=E2=80=AFPM Vinicius Pedrosa
<vinicius.eduardo.pedrosa@gmail.com> wrote:
>
> On Sat, Nov 21, 2026 at 12:14 AM Chen-Yu Tsai <wens@kernel.org> wrote:
> > There seem to be 3 revisions of A7Z. Which one are you targeting? Or ar=
e
> > there no differences as far as the OS is concerned?
>
> I'm targeting V1.11, which is the board I have and tested.
>
> I compared the published schematics. V1.10 differs from V1.11 in two
> places relevant to this DT:
>
> On V1.10, BLDOIN comes from SWOUT2 and CLDOIN from PS. V1.11 uses a
> separate SY8089 step-down regulator at 2.4 V for both.

This is pretty much invisible to the OS though, unless it is toggle-able.

> V1.11 adds a 10k external pull-up (R59) to the microSD card-detect line,
> which V1.10 doesn't have.

I think this is more of a fix, but again, mostly invisible to the OS.
The only possible difference would be that you could disable the internal
pull-up. But leaving it on shouldn't be an issue either.

> So the power supplies and card-detect configuration would need changes
> for V1.10.
>
> From the V2.00 schematic, the parts covered by this DT (PMIC, microSD,
> LED and UART) appear unchanged from V1.11. V2.00 adds MIPI DSI, a second
> CSI connector and a backlight driver, none of which are described here.
>
> Would you prefer keeping this DT for V1.11 (and V2.00), with a separate
> DT for V1.10 if needed, or splitting the revision-specific parts now?

From what you mentioned it's not a big deal. For the new connectors
on V2.00, we're still a very long way from that, and it could just
be a separate .dts file with the new bits, and include the v1.1x one
as its base.

> I also saw Andre's review of Enzo's v4 [1]. I'll apply the relevant
> changes to this DT, including removing the MMC alias and revisiting the
> regulator descriptions and constraints. I'll wait for Enzo's v5, test on
> my V1.11 board and send a v2 with those changes and the LED patch
> squashed into the board DT, as Krzysztof requested.

Sure.


Thanks
ChenYu

> [1] https://lore.kernel.org/all/20261122003932.568c099c@ryzen.lan/
>
> Thanks,
> Vinicius
>
