Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631697;
	b=Flamflyml25PayYbwwr5QhhEQokiefriZMt4XUVFSYDfMDvgRx9DAVkQ21MefGPyhxPJ
	 mSAy1d5RPsqE8VWBcEMndsdA6So0+Mst0+/FroxZ5Tih98NefOrxklefIWt/OyIab4gfD
	 MIWVLZEIUq0MCiM4eE1iq5+Qoi2hiQATgWTZa0WNK6EJL1wihZ2qcaIF6wAUY3R4O9B5+
	 4B7NHSw4HxjOjw10OrEwrYnU2ps/xY05aLJ4r65xrNHPVJNxQdmuxIVSnJEE2t14eFS8X
	 RLHaFR1vT+5/8VwA4yqljvHfO0piIuX0NE1Ff1bG+au34AjG5HXNHmmKpaYQ+dEOjlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631697;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TWsUZ4Yx/ugCrzDX8uSHJCRajgVZgocX3xB6kXa9XWw=;
	b=tzWWmS1RLF+xjOGIzXXoxkUSUDe1wY8twMjHMG6x5Qow7RCmHsA8v2YzofY+SJvsd6Ci
	 Lf21tbFv5F1XPl4fqyzpUp/d0vBUk9Nr7xfn8JlEZoqN5jzF78gZStdZGcaTg9SljqR4c
	 kUow55FflUO+hSIczX65eOezkznLyuCPIL4U7mP2Ac2geICRihhXi8JG4jnxRbWgblvjF
	 0yjDAYn6EttbTG/bDuXYEVoZyeJv3G/boQDJAecdKSL4R4pXtIeolbddEN/M75Tolxvzb
	 CloKrlVOVpn7DyZz5v+sQozAEVhe6RO1Gei/4UvwRKWaKO7cSNfbigVrAWMQBzp7DMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AccAoIpv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD35606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AccAoIpv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232D11F000E0
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631696;
	bh=TWsUZ4Yx/ugCrzDX8uSHJCRajgVZgocX3xB6kXa9XWw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AccAoIpvu7+qzRklPC93AUQnIoHA9P4c6asbAvajc/yCDHHiq7yfcr/0QRdyTgXZI
	 A2OjQon8kfLMRWiYcWm8rA782St9VLQJhdvuodRi4WUnfSiRqBmPibjwAzJMEZ2eJH
	 wWDzp5Fpe7W6kJCLsjxBFGsOjugVcENSk/rjwTiRgmW97BDFjcQzL+T2p5R6kSEQXu
	 ik3BgM9ATnL0YL427gGWegyLvBKlWAsWNIOkoJLZONkQ/Wnfx8IDVSkRUR2hXM6iwT
	 xBugMWnFATHYbWXkw3UAU1SoMkNLa1icZP0HmyMLA1Dd33FQs2kOMogk008U1qqHWJ
	 SSDzWrFG88vMg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bccecba199so5973036e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:34:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGwbMRAvnXrG9iiEy9E71M+ALA5ydsy3MEIBnauwyfc/K6qGuEMZD8bjMhwMKpaQTzCPPwWjWwRxqTX4ss=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ng+IysR5uZWUQxn0/oPBD+ohGKMyB1J4XXM9X2gJ0Yb4WVhYE
	lTwKCuNYM9Fgpp4LouDMBcphLcu047wfZw/xN01nik4wQoK2VSyWDmW8IaBAg5cFjoyrLAXADoh
	uKuJKXmV7xBXT7o5jcjGHfVR45lMVBzs=
X-Received: by 2002:a05:6512:85ca:20b0:5c1:5970:ae1f with SMTP id
 2adb3069b0e04-5c1bc863452mr4167518e87.63.1795631694900; Wed, 25 Nov 2026
 10:34:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119204748.2558209-1-lee@kernel.org> <20261119204748.2558209-4-lee@kernel.org>
In-Reply-To: <20261119204748.2558209-4-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:34:43 +0100
X-Gmail-Original-Message-ID: <CAD++jL=uCDqb0XJSVdzzMDNrxXYxB9KgJKqEh61mjAKhusMmQw@mail.gmail.com>
X-Gm-Features: Aa3M54qdnjbrThHpc_O_xCS8rqPK1pjBvtoIqC7wMcjPKsfTBJLGOdyvo3aqDng
Message-ID: <CAD++jL=uCDqb0XJSVdzzMDNrxXYxB9KgJKqEh61mjAKhusMmQw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] pinctrl: mediatek: mt7981: Add missing entries to mt7981_ant_sel_funcs
To: Lee Jones <lee@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sam Shih <sam.shih@mediatek.com>, 
	Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:48=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> mt7981_ant_sel_pins[] defines 14 pins (pins 14..25, 34, and 35), all of
> which select ANT_SEL at function mux mode 6, but mt7981_ant_sel_funcs[]
> only contains 12 entries.  When mtk_pinmux_set_mux() iterates over
> grp->grp.npins (14), it reads two int elements past the end of
> mt7981_ant_sel_funcs[].
>
> Add the two missing mode 6 entries to mt7981_ant_sel_funcs[] so its
> length matches mt7981_ant_sel_pins[].
>
> Fixes: 6c83b2d94fcc ("pinctrl: add mt7981 pinctrl driver")
> Closes: https://sashiko.dev/#/bug/linux-6233f285-1487-4d2d-afe3-d4ce3c445=
054
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Patch applied!

Yours,
Linus Walleij
