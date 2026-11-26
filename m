Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698837;
	b=OB9T/zzjbmnPKWJjPsdAoaxT1kVCx/82hMxTIhzM/YhEy+uJ3YT+1bIf5WeXTDnA1EEz
	 o7a/k0tf6GwJZxb6GVsoDkpq0BrhLq959OVYp/SRgA9hwuQrKPQ8TZPzR8Q1HO2lpva8v
	 fKkb9CLqi0LoXOYV5YU6ywLnI9Op4gbXYnGImSt3RyKiNvap5LZicgvd8Yf0qQepIHx7B
	 jPEpnxfUtFBb5ZMWDek88jhm688MlwESSn+KC6ug0l+8MzDhKvjMZg4SnGYLq6x9d1Z+w
	 Tsfzdn2HddDuFNtguJWyFZ8nHrbqiSxC1sh/mU2N70QUMw8Rz1+vEPu01zQS8vTqkXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698837;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NGKjIx/lsrYSs635frFVwYK8gqcYIaaf5ELPmMFxaA4=;
	b=KR3EBWcvZK658dMB56Kxmy/ZlwOmcyH37qTBq3idLQXkjB5tNpH5oILxYkgPxwkfGAlL
	 EGeWGa9d4Rj9KzGL+B01XiesKrHxZP0Ij8PjUr0P/gO6fxNcQjBunSa9JdxNWyW1on0T7
	 0rmqLcaqZ79Pu6FafMMbupTFjJsxML2b7kzylwU+T6FsDvhjHFOgOTKmoJ9wcNr99b5kB
	 oNQD835V1+DM4uOhzrPhm7B/pkA1pINKcSLIVYrM6/4AKo8xhtNStgI1an5vqPjhIYIQt
	 WBvSR0pGDFcQkCQAhrPamCatvtwpd8tXqKz2OFcwMNbzV7V/9DMlLbqxZEwuTJnBkrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qm2UeKZ5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3305D606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qm2UeKZ5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19121F000D0
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698837;
	bh=NGKjIx/lsrYSs635frFVwYK8gqcYIaaf5ELPmMFxaA4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Qm2UeKZ5qAbSJ6oGH4cwMbeZK+rCDwpT+uZSLyYvyal4sfb31denN6knwVdXhwhWy
	 hPZYSuzRbRYeQGZn7VNwYWF64gi5SH2YXrh3cu/SfOu7mOSDIDVAwUYuF+AGZvrnwa
	 la80+wMoBlte8N0zTYwk+nyfyGh50n1HrrHZ3R2A1YpYdgCOisCnQWYuQne7Xb5WEl
	 Nn2msXbuOfoFk31isoSQB1Es5V9nn90M6Cv9QY8h9AaT3golwLv7IViM+J8o43YmBA
	 xcIJV+b04dwOq7rZndNfqiIw/0a7zTOXtpQcgLANZduMlso0fuJKWkfOlchTVBDFIj
	 Cdh88xDhKA3Tg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bccecba199so6813897e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:13:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFagIUmkmonqEI3dyB5kwvr1/VuE39/aId/zMTYw65f7adsJxkzTfwsdht9m8Dv7AkbMeKSZjAalgbl8qk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tHhLs1LA5qMytorW4lCNhS65zSW6Fw73bDPngDR8OvMK1mW51
	Ztk2ozifzsAnJEF48gdJqX59XwhrmfifKu0uyAHejW+dxucO1yNIv0BLHLWkdMcEsGKBorABWRw
	+MO5P3rDpgEhaDc+L2Elv1RC1A4vdss0=
X-Received: by 2002:a05:6512:304d:b0:5c0:a65:ad2 with SMTP id
 2adb3069b0e04-5c1bc814bccmr7600916e87.49.1795698835538; Thu, 26 Nov 2026
 05:13:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 14:13:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLkSr5Rw3vzQH_t2uGq3ZSnFDuFxwhMpdPbZ-OHmTqiMvg@mail.gmail.com>
X-Gm-Features: Aa3M54q_yjAB_gF_ehQIHoUZMFIkQNhkQlSji1urlQGfqAlyuSk3xRkB3BtsRVk
Message-ID: <CAD++jLkSr5Rw3vzQH_t2uGq3ZSnFDuFxwhMpdPbZ-OHmTqiMvg@mail.gmail.com>
Subject: Re: [PATCH 00/19] riscv: add initial support for the Allwinner V861
 and Avaota F2
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Han Gao <rabenda.cn@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Han,

thanks for your patches!

On Fri, Nov 13, 2026 at 11:33=E2=80=AFPM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:


>       dt-bindings: pinctrl: add the Allwinner V861 pin controllers
>       pinctrl: sunxi: allow a per-controller IRQ register base
>       pinctrl: sunxi: add support for the Allwinner V861 PIO
>       pinctrl: sunxi: add support for the Allwinner V861 R-PIO

Can you send these four patches separately so I can review and merge
them in isolation?

I think entire-SoC patch bombs only delay merging the things piecemal.

Thanks!
Linus Walleij
