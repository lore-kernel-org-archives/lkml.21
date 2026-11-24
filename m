Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514201;
	b=RWvWAikq3wuP5vpVkVcrfMURKfQKm2+8KDk4MNkf4mEX3VHsHpAmaOfFZ+Q0A99Ni63Q
	 U4J/lrtWSh05ejE6AVl9dBxKuZtYlXrgR11/Ho79ZgKfVqrUCSLqFM8bMNUdT/us0OWGc
	 afbSCF+W9O++6ilCMcJ1RMmk7GqPJSt3d+Fjf17bDs2FZde9vENfm0l3UAx2vWUECQcb8
	 /4B7pYL08Cvl3nEhAmVGqLMVVbxQsi5leVDLEu0MW/AZwO/gJHUMADSAN3d9ch+t1nIfG
	 JNPDloWMtGpnzAZrNtAKu/HA123XWSaRxxV0n4O5bctfD10NBVISu7gX77EZec8azeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514201;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6RxDNhcrptkLwm5icpyITA1cARO1T74TvXZeN92Qajg=;
	b=qjKsFW8Dwcf+H+5b4o8x5o0Q11OQGqs289yGXd9y9qEUmkkreV282mdyJAsKKMvvZG7r
	 yHuh871TEX4XCGaUVCyS5xckVfkDgGlXCSCu7Zdl/ddEs3i8HdutOhs9HA2SdP9alwSiq
	 TQjRZJbkVSn8ICn/09vgbwH+zSw33s6E1MUWgwyTekBh16Vm3GYU3yR8dA6KFhvYnath8
	 8eWvJUzRAr11S5lqcsoEjVhCaeF2Ilq2NixBsdaeU0n/dYFavXTmUV1y9vEvuwgtkL6Jy
	 FFYcbc1OhZ1Wa9ReMbqfKjfkTSSASnmX79zBGXet02qdj46sXQ3Av1GiUgutpFoLBLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lf2VEmI1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D93A606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lf2VEmI1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702BF1F000E0
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795514200;
	bh=6RxDNhcrptkLwm5icpyITA1cARO1T74TvXZeN92Qajg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lf2VEmI12JFLEgUGjVFCTv0QjW3DzCel4nyHoZURtSOyTH4f6ATQ1F9160ju0vvcJ
	 1PxA6UlQXZt13PWLF8DKe4G2fyNtZEfkNquipMkfq4cB4Vyyt9Vb8QLIjeBylBY68V
	 8fkdXxi2Q/3e9CgZNUHA8x8SIhVN3xZ7Go/+IbWqCEQoBiEztDO1QPeqv+6bOeCBfl
	 eGtwiPdREEoZEEaGpzvmpTVcOtD31t91A/v5X3KXjPTtvGx+yrS5sJKsvgO+GX4oTb
	 OlIqX7l7+ISlIVFgCxMWp9ns6b0uSX94naPiT/WMszXh8HjzkH/+81WGhZ75t3GckW
	 FxW2yjPsT6HCA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c1c0c8d61aso2744090e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:56:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH35bNFrC1Wzj0ObL9akIIptVIqpGayI7Di35asCNnVRwwDfG/3jdsd5ftcYRLqrnEqPe9ZG7eaBB5RTDs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RQDfspUtdodb0gV4pyQb456ywRAwCFpwkCL/cXIpG0sl2L/Aw
	MEkcl9fh8nvcTxkcPE335OShMSiig1cC9mdz+uVk88e4CjNGbztVH0pttOab5IVN4zp0vuVI9Pl
	W6FkP1Id/DeHp4v09jkc/XSrYwoplbvo=
X-Received: by 2002:a05:6512:1048:b0:5bf:6c4c:62ce with SMTP id
 2adb3069b0e04-5c1bc81c49bmr3664194e87.55.1795514199208; Tue, 24 Nov 2026
 01:56:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com> <20261123-cs7542-syscon-v2-4-1cd74b2522f9@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v2-4-1cd74b2522f9@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Nov 2026 10:56:26 +0100
X-Gmail-Original-Message-ID: <CAD++jL=jLDF1mRBp9mai7hFKU21SG8ud-Wf5ebS89BHiUWM9sg@mail.gmail.com>
X-Gm-Features: Aa3M54pJBPNtS8HBHNO_8ov-NITzhFzIUmDM0dw5V6Dl7sMdZPPnTtRSJZShNYc
Message-ID: <CAD++jL=jLDF1mRBp9mai7hFKU21SG8ud-Wf5ebS89BHiUWM9sg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: Add Cortina Systems CS7542 pin multiplexer
To: filipp.dunsky@gmail.com
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 9:27=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Use the global syscon regmap for the five GPIO mux registers. Each
> bit selects GPIO when set and a peripheral signal when clear. Support
> GPIO on all 160 lines and the six UART pins exercised by the OpenWrt
> port. Do not guess mux settings for the other peripherals.
>
> Use masked regmap updates so independent pins and users of the shared
> block retain their settings. No register changes are made merely by
> probing; only a selected state or a GPIO request changes a pin.
> Register and initialize the controller before enabling its own hogs.
>
> AI assistance: Codex prepared this change from the existing OpenWrt port
> and GPL vendor sources.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

This looks good to me:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
