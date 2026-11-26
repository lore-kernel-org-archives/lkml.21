Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697888;
	b=dleLfoMs9gyzgggV8do4ZNbrc2/5kftT3oTpve8hs6yEcx1mF7yp8Boryv/mU11PhSsL
	 01DROtMUyg2ksAshzsD6aBizTcEhy2H0Rb8wETQwbLaR2Po1hvnddw9GKH+WPp3Ds3slq
	 bjdb3Wd2BV2BeWLUDFDa0zZ9+TrzF6IOdbYFgucs9H9CtHypkL+nILLfXrmwYommMpRjB
	 esC1tTk5qBHXMJ+xpigSj7fdDCV6sLQbQH1vUc3v35sWVLrC2hYhm8xY5hq7GxWtxMblv
	 DhYA3wHFIHlbHEc20qDyUx7+zOjzpZNzPUG5eeXDzgql6CsssMOnbetVKxUuUmlUAeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697888;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xxW8JN/Y0KCbuZrpXSaBVqEQmNUxkhkOMH9G0xvrG40=;
	b=HPIb1DXvsnZDUYxfs0121u7BT1nlii4D/vDcCIpF0prwirVrppFcvkxX5HddddkWmZsG
	 W+1JuD5QJOkIQ1T0f2tTlrc6FrVVl8MEubNlGPZGKYRbyfpwGWl63XS9pqDMzDt7PlHPR
	 aW7nXt0DH20pZvujGlWgpDWJ7yZutsRtqFV6QD/qmtFk5rRHUde4v83uZ9OfE/OKX4y0G
	 qdKk73tSW/RpqubqpatV5Bhw++jzzCGjfmj6AioWG5ijcEwRfXimxaakghJ3UL8LprGEn
	 TcGLYoay/IoYKTH1/EoKDTjIg3RdmFhs8BzvvdVk2hbnquPcH3xqV83gXVLC0Lp1D+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2OMRWwO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7876606A339
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2OMRWwO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D141F00A03
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697888;
	bh=xxW8JN/Y0KCbuZrpXSaBVqEQmNUxkhkOMH9G0xvrG40=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=N2OMRWwOIZIr3SX5v/CoGDRGsPPHjWiRV7OcWqFsHo5iJULUScB+hFmCLPs/lXRRY
	 tfmKM0ZHbrnm9N1JPXOOTDapVE18izEy2rnka6AMgYcOjwgCnZbF6x0TzNfy7m4Q77
	 I6lvEiFVGGCncNny7G7AMIKPs28WaIYRfUpH1FZkphXp3pco58DIvZjjBKMU1Q0AW2
	 g8RN6VGoysZimrdpmmgQRUpHXZgUdyYXAlbuh3EIo9AgR9jQ77/wEXl8vZlTqXkXhZ
	 qQTotmM/QVH6N8FO9vwm8asjgLfL+1gPqfGZ+ps3APN+OuKgfrof0X6CTZxyzRi2M/
	 NrdhLNDajx+qg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ad5529ae64so52716221fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:58:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH8y81ms6iMn4a+VrV2jtyI8aGuL2hHJkkmHJuDyhDJWY82EGwH1Wfe0/ta0+1jlIjlJ899d+/J8k4yd+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ewU/TM0K5XqMgy7Ya/EQDn8AFf5f/fy3P8pgUQEnRXShp9XT/
	kcxrbXuEl3DSJhFBpP++1zDDv3ao4+vSIgkfJXGRlpIUyTiIL5+KNvh1aYbgnERcB40/Jv0ESBk
	Hv+JqqKHuxXxjCSv/FNOM205afpKPfpQ=
X-Received: by 2002:a05:6512:3d14:b0:5bf:d54c:c189 with SMTP id
 2adb3069b0e04-5c1bc660a0dmr6649201e87.5.1795697886865; Thu, 26 Nov 2026
 04:58:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115102401.3520-1-jszhang@kernel.org>
In-Reply-To: <20261115102401.3520-1-jszhang@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 13:57:54 +0100
X-Gmail-Original-Message-ID: <CAD++jL=TE0pF60vR-Y==z2LDfs4n2rvfZ5FMOuEoFsD2PwMXhw@mail.gmail.com>
X-Gm-Features: Aa3M54p6XoJWkVp7q4vqRmQARyVxQsd0uuJbzgC_NhGGCjDNxq9tWPObFVl9RBU
Message-ID: <CAD++jL=TE0pF60vR-Y==z2LDfs4n2rvfZ5FMOuEoFsD2PwMXhw@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] arm64: add Synaptics SL2610 SoCs and RDK boards
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jisheng,

On Sun, Nov 15, 2026 at 11:44=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org>=
 wrote:

> Add initial support for the Synaptics SL261X SoCs and corresponding
> RDK boards.
(...)
>  drivers/pinctrl/berlin/Kconfig                |  16 +
>  drivers/pinctrl/berlin/Makefile               |   1 +
>  drivers/pinctrl/berlin/berlin.c               | 259 +++++-
>  drivers/pinctrl/berlin/berlin.h               |  17 +-
>  drivers/pinctrl/berlin/pinctrl-sl2610.c       | 759 ++++++++++++++++++
(...)
>  create mode 100644 drivers/pinctrl/berlin/pinctrl-sl2610.c

Can you break out all the pinctrl changes and send separately?
(Also any binding changes.)

It's best to review and apply this in isolation, hopefully there are
no build-time dependecies.

Yours,
Linus Walleij
