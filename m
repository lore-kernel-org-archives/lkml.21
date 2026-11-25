Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614739;
	b=EPE3ZWRG08JNrgg5vNB6724sojtvfeH9lTCDWi3xnM4nDo8+IlrdxYiaZUOaKJ/yF4JO
	 fa4J6B9Hh94soTrYtrCStonHlh5UY+rwQTUa4JgaXfDVftWBfuzk7COy82Fpxw/0/UlUJ
	 X0afczecGgm0J8xL+f0Gb+UReDpG/I5UaFSXkMRgfk7iVMdICPF3ZFgTmGAf/6nqJ3ywX
	 QZOduEmGdVtPEEXyKzLs/eyybrBqgPzkOaf+Ryg+BOqm4ecacXMAaqEn/OrsyQ3xFVU1H
	 lP9PlpK0CQ5DJ95V3q13bTYllZOhKlP+paR0WoW55Ydnyj6xVy4B2HT+1Fp1cLr+qdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614739;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=d1OT518H4ki16FAaDWhpo7G6vnPaZ/w9V0TjOKp530E=;
	b=aEQH+xYplrKDwvz9+Bgx/3EzGbjQvG5xxy7nWvSnF8V4KiCkainA7nwbzzLgj87MLt6L
	 CDQZoDisuD7C/jXf1di1t5QMzQxCcqfV7XR8lhRu0fka+ein4st2kpkze5u5kyE9OcccE
	 K3ci5n0fm59p/NEF5avoZoTa2/bp/XHP9Q48Dw4WjeDfLmL3gc5P+y3zOcs/maQliKTd0
	 xz1/vgaqSZtmxOf4VmN0KPNu2MzzLH9dsndAYD5uOaadZISSuVr9R98bnv5ZsEv9slnow
	 2iE5Wf9KzAgH/Lu56TG0uFMx1rQwXscW/sgrGM7X2vH6QximAvm5LpE7o2+BZr+efwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BPZ3SN0M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8A0606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BPZ3SN0M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800821F000EB
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795614738;
	bh=d1OT518H4ki16FAaDWhpo7G6vnPaZ/w9V0TjOKp530E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BPZ3SN0Mc7yfYD+EH1mBtJFptnm0a2EM4MlUxsZ1vmepJ0UzHsPu3S7Qrlm5cJsyC
	 agcTerqVohBFSD1ywknuv+fFOLUEim9g4Gj5fefAjlOPLXiBmr9Qj3PNVYgnh3KxiK
	 EA7GTFovKjx8jLqDsoDO18OHiC40biTwroqgRoWbyInvJbvxC3HyMIQE/ZNE+vqofD
	 afS/XAvVL93bPUH7rUtImU3an32EIsvWAcsKAoarOwXbpbDvRSDtvI7yOYQiANuy/B
	 NBzwvVSKeK6PSO0qmZwRDsvZ5Gl0XNcKgaz7WbRzxgSRVFkcRyZjxbhC3HuiNp+SwH
	 HckkFb/HfC0uQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso8070638e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:52:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGTuRNgEItKD/6LJrtV3Dh/pftPMUT4hOjTp+7dCKHy8REogdltD2Qu93Q+AbZIVtVnGLBjjefXGS6Vb7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z87AQuqYtQtmMdp/EOhKSOK5eCYhuX8DS+VB6v/a09aEAJWWP7s
	KO5f7fHKDvT0PaaJDWcY+oHvLuh1Do04hu3EuCmuUjQbdxZebgRFnoSilol44xIrtXTQaQVmfGC
	vq9BeCn+wgbuCbwWgwMScm92BtrSJjCE=
X-Received: by 2002:a05:6512:114d:b0:5bf:b93e:89f0 with SMTP id
 2adb3069b0e04-5c1bc85f0c4mr4585226e87.62.1795614737267; Wed, 25 Nov 2026
 05:52:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com>
In-Reply-To: <20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 14:52:05 +0100
X-Gmail-Original-Message-ID: <CAD++jL=xA7eZUeb30xOnCZ8uRy0UE7q8h=8AA4p-tmiBf3Sb9g@mail.gmail.com>
X-Gm-Features: Aa3M54rgkY6kl63K6RGx-SAGV9m-zKLuuASbiq7hoLrao3O7E8ZmBvChRlc02Pw
Message-ID: <CAD++jL=xA7eZUeb30xOnCZ8uRy0UE7q8h=8AA4p-tmiBf3Sb9g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: a733: do not switch the mux to read IRQ lines
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: linux-gpio@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, Pablo Mazzini <pmazzini@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:02=E2=80=AFPM Vinicius Pedrosa
<vinicius.eduardo.pedrosa@gmail.com> wrote:

> The A733 description sets irq_read_needs_mux. When a GPIO used as an
> interrupt is read, sunxi_pinctrl_gpio_get() then switches the pin to
> input and back to SUN4I_FUNC_IRQ, which is function 6. The A733
> interrupt function is 14, so after the first read the pin is left on
> function 6 and its interrupt no longer fires.
>
> On my board this breaks microSD card detection: the PF6
> card-detect line is read at probe, and after that neither removal nor
> insertion of the card is noticed.
>
> The A733 data register reports the pin level while the pin is muxed
> to the interrupt function, so the switch is not needed. The A523 and
> D1 descriptions do not set this flag either. Drop it.
>
> Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733"=
)
> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>

Patch applied for fixes, sorry for the delay.

Yours,
Linus Walleij
