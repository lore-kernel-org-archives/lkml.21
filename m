Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191288;
	b=BIL8qbB6P2jIVBprHg5sA//VWr4T41yy1Lv2aN/S1RpoW3ZMex0I0wyyavbXAsLZF9lB
	 2DAmdfFrhYrwC6V37+vZzi4G+fNCCI/zPwIH3MLyYb7Pvl4IiScDg+ofoipy5Z+cqJKLu
	 7uA1LYG3MrNcfYPKba7J/0bKozhf7BTnzLUR6EWeTBpvlFE8dA13005dCcw7pZT+v7uMw
	 cYmiS7Z1u3OIk5PJGvbitIzKlVK/aqmXOo5HhuvBlFjjZnnWcyMMh9Oq5LtDr4nW0PfOz
	 P6mIybWn/cbJUZtYLHiaIAFKhUuqacSKUMIcP3V94P4f8ET3qw19cD/uYDnqPEHWsjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191288;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GvYCDEkwGbOkGGg0zHPjL4BohH+d4nYyJ0W4Hnr09Sw=;
	b=SkzyNC5jRDyktnGMBHCOH0u/v1zg1NVULvbJkTIn+sIT8IEkwdiUnUoH+qAYoAIdUUIO
	 PsJr9vFYMJs3CMk/fLzTt7Y+fYH2Ypo5ARbnRslV+RCWMKQj8Q2sEzmDg2IOckAb8d19b
	 SDTmCNFY3lPg47A9zqaC9xqEPCbESDOFyBSFOyM/JfmUB0wgBvdhJh1UouxUp4qoLYEHR
	 7H41lxPuW29JLCqR5REjIbVR0lPfjXAbTY3Ld6pRxYNJ1cYzBgb8vTP0+VTHgVanNq9Jh
	 jKtOPvP1+gnRdv1asjUbI+CHO2qBFW+DIrzmfNEEOgd4IoZsffKzLPub0TT4Fsgr59Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQHfnawW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE2D606A333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQHfnawW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3398D1F000D8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795191283;
	bh=GvYCDEkwGbOkGGg0zHPjL4BohH+d4nYyJ0W4Hnr09Sw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=VQHfnawWjbsVjDcrOHdKsTzNvVyGA2s1vjqh9c6P/gGSqgO2JKm0sAhW5owbcCE1A
	 gGemTeFO9QbxRVC0cJADzBUoTL/bUkmFLso/QrkFvPTXFqVNVd+88g2kudNr8ooX3n
	 MT6d+gEAMKjWgKDjBYKFx/8YuSoqj4MP8f4JqG1OduKNciPX82LtQeXAxvcLAlAcWz
	 RnBxinOYNnwyqONwbr4ku0gV5BUUCV1mLEfwsUJWMmYEP3eck15T2ASw5Lmexwg8A+
	 KSb/9Cvp6VRqNZwvn/FZjNFAtbTJ/BXBHO4zm/UN4+0HCb464JWNBeHQG1cXE2PW0E
	 /zCeJ8xXTBjZQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae2fb3fe2fso9457111fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:14:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHVtT51RFeEzb7Ap3J5aIwUGCb3EQnRU/pz9/K+ynXON5zNKWjkOocOBxs9Sr9U6UkEHgkI390HJV5WHZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ycMfN4GzWzJ+7YmUTXQ4NqjY7vpFShWF+lNeg7g4l/Srvw/dr
	3HuLM3CcDkqrXGbu2BrQOi+xCkFLT/f2FXxJVJyiTTgTTQHrSufXVChYHmx3E7y4a8ndJCpUX2M
	o7NATdiEJzTBiWw8ij5Zoce402dwlKV0=
X-Received: by 2002:a05:651c:54f:b0:3a9:9a2e:27fd with SMTP id
 38308e7fff4ca-3ae7f7cfce8mr12445241fa.0.1795191281589; Fri, 20 Nov 2026
 08:14:41 -0800 (PST)
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
In-Reply-To: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 21 Nov 2026 00:14:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v66nKWdF3AvXDfb07iYVQE5FC5yDkhuutShp+Z-EgFXEfg@mail.gmail.com>
X-Gm-Features: Aa3M54qKCun4hmKn_uEzeiCoNcJXuK8nohmeg7erANAuWhgR2_nHJkd26qyMXiE
Message-ID: <CAGb2v66nKWdF3AvXDfb07iYVQE5FC5yDkhuutShp+Z-EgFXEfg@mail.gmail.com>
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

On Wed, Nov 11, 2026 at 9:49=E2=80=AFPM Vinicius Pedrosa
<vinicius.eduardo.pedrosa@gmail.com> wrote:
>
> Add a board DT for the Radxa Cubie A7Z (Allwinner A733), based on Enzo's
> A733 SoC description and Cubie A7S DT [1].
>
> The A7Z differs from the A7S in its PG supply (BLDO5), the SY8089
> regulator feeding the PMIC's BLDO and CLDO inputs, and the microSD
> card-detect line, which has an external pull-up. The series enables
> UART0, the AXP318W PMIC, MMC0, RTC, bank supplies and the green user LED.

There seem to be 3 revisions of A7Z. Which one are you targeting? Or are
there no differences as far as the OS is concerned?


ChenYu

> Tested on a Cubie A7Z with v7.4-rc1 and the posted A733 prerequisites.
> Eight CPUs, R-I2C0/PMIC, MMC0 read/write at 3.3 V, RTC, LED, PSCI
> reboot/power-off and CPU hotplug worked.
>
> MMC0 card-detect hotplug needs the separate A733 EINT-mux fix [8]. The
> tested DTB also had a local 16 MiB no-map reservation for my boot
> firmware, which is not part of this series.
>
> Dependencies:
> [1] https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmai=
l.com
> [2] https://lore.kernel.org/r/20261009-a733-clk-v6-0-ae8178fce7e8@pigmora=
l.tech
> [3] https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d=
@baylibre.com
> [4] https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
> [5] https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedro=
sa@gmail.com
> [6] https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com
> [7] https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
> [8] https://lore.kernel.org/r/20261110130157.112155-1-vinicius.eduardo.pe=
drosa@gmail.com
>
> Vinicius Pedrosa (3):
>   dt-bindings: arm: sunxi: document Radxa Cubie A7Z
>   arm64: dts: allwinner: add Radxa Cubie A7Z board
>   arm64: dts: allwinner: sun60i-a733-cubie-a7z: add the user LED
>
>  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../dts/allwinner/sun60i-a733-cubie-a7z.dts   | 298 ++++++++++++++++++
>  3 files changed, 304 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.d=
ts
>
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> prerequisite-patch-id: 0ed6b92774b5b794761c7ce34db653a5435dc833
> prerequisite-patch-id: 27ed3814dbd0c7ad830532ff125625917c873b4b
> prerequisite-patch-id: 74d03898c5ce14763f4e89fb73e021de59f0fb9f
> prerequisite-patch-id: 9225cb094cf6cbb338b14ac63711d68bed12d24d
> prerequisite-patch-id: 568dae1c91a0d7318d6eb14a18054343b84b603a
> prerequisite-patch-id: ff3806332e741f0e2c8dac1c11f4c71449c16c8c
> prerequisite-patch-id: 39461e0543aefb5c40184664625cbab19ac8408a
> prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
> prerequisite-patch-id: e27ef0b1e3a7fc0a659a1a82c1a7184665451265
> prerequisite-patch-id: c598480f753e36b7f6230129b864c559b9f185d5
> prerequisite-patch-id: f86b468a896a40f132adfcba885700327dff1bc5
> prerequisite-patch-id: 079d60101e1b9e5425458060314bde3e9cc2fe4c
> prerequisite-patch-id: 5d657469bcf35ca76bbe291203363403e00fab54
> prerequisite-patch-id: 85db03df3394cdcb2780a0da122a74b2c1fe220d
> prerequisite-patch-id: a3e883da50bf03e8f522444def66fec7f996ffbe
> prerequisite-patch-id: c6889699a6dc13c336ce4cf4659e21b551e9a9fc
> prerequisite-patch-id: af0aebcae7c38d58354925119c412178b5821b5e
> prerequisite-patch-id: beb8a098ba14724e316ff243bdf8e00e729243c1
> prerequisite-patch-id: 63342c5ec38e8eb9e55c8c74d3c5a81a630d5f69
> prerequisite-patch-id: 1dc8d70f80674c98b2b15d09556dd27f643b20da
> prerequisite-patch-id: cf6d9a8d3f2089f59a8a5afb4cc9375d7a6dc482
> prerequisite-patch-id: 4cdaae8c384016491ce01e6e328acbb347debd62
> prerequisite-patch-id: cb253a02b7d81079cc1ea4f75def94564468c80c
> prerequisite-patch-id: 1f869e65014f3cd678bab7f235cbcb14c60a1608
> prerequisite-patch-id: 184825f979a16a0b6900c58ba342899747da11b4
> --
> 2.43.0
>
