Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698636;
	b=gfG0aGg9JzdcEcu4Y6C4mkGiQF6oBj7vEAQ3vVmHdWvOZ5N/jt5Wi3KLUkf/d23L/ffy
	 n54ezd/7vQBuOwJ+lmzcDRv2GFi9qtb+R4/ml568MNzcc0/bu1wnJ1uGb6DtXaJF3a4Za
	 qez65mtsx2IpwmKJgUCmWsIP0aIUPUKYoLD/gh3y/hG4zam+imFSPQfPBmOt4Vnr1Yl6b
	 kxN/YUdcG0eSQegQ5H4H5HkFQBwgwV3jLDFKCz1rwcRuf2J6PTRnP5x5aqwrhIPTcrDTL
	 KUTBM0vwiT77OKphIwojledXFfk8TGQsSugzPgT59TidcLFldnm5VZRPCsdVoRUL/Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698636;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eLIMWYK2tRuuSmcR411tVKpNv/NLLUeNfkrsrD+ZPRI=;
	b=cS0lmblxQMj9iUWm3qxeUxvZzKWCc6IF7hazp9bkg4jtpA8XEPF/0YBYZq4nU2rNe7ZN
	 XZ7oCCzNLKhocmCBHorEJ1nij/KCcer9xcQA+Pr021ylt2XK+MA8rBgd/nXyYOme1qYxz
	 p+E7xlZXR2x3fGbUeahYABfnM8LMFz41Z/qiLJMKVEZhMiYOvp3XGbFdCNEl7ZxzNUVgs
	 WrqxPs01EIhua3uXQgRfDbIYEAZGaKpmUzX43XkAFYzg7KOuK5ljEO4Bk/FtwkMtDCxim
	 +eTgeoz9LKPKp2+Z389dW/rD2OXTPQJriI/jbCegRIQ7IdSRakiRAz00getwTSI+eRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KABLy4Mb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548A0606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KABLy4Mb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3711F000D1
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698635;
	bh=eLIMWYK2tRuuSmcR411tVKpNv/NLLUeNfkrsrD+ZPRI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KABLy4Mb7/8tRa4Rewu/+nZwIEk+I5x5MMMUaD/tmWvGce79i7HJc1HwOwbkbIsxC
	 1BYLKHEUtYVctJqn3fFgfafWnqhR57vgLBF4k/XcWVn4aCkhyOWH03b2Z3jof1ghcw
	 XFzZE4T1KfCYHRutsmAGupbU04tbN1xIy/uOvwJQ240ccGE5tBMZoxuFGyW3r00yUt
	 jQ1Tf40xK6wYyTN9GHzP5Zxe1s5ZCO4JELDhIV6NTWlo55GjBMMb3XCzdhWYsqkYFA
	 35dDUUZc94KuDJnFWNd6/oGLurHkMm2gqBHTuICOwqtKhPGWwIaieqEtVAOIfWaR9h
	 umMpbNJKlj5vw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c31369ae36so2339510e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:10:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG3VeSUs201bbi0aQA6X+HEsrWAFZKx/XegHGr+TBnY6OwVDvxfqplcauMzvLFPxedtpyUYYHl56nSh/60=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5G7SEFby2dv8tlypj9p6XFE/L7AOjkiGewgOkCIbAKfZ9cgVI
	MOyYDbl1XcMeaTyqPUhPcpAXHtTMWBp9xkvt00gAZBJcp5wYM023SbFUTIM3lP+YF5r0esiI7JU
	9VjfrDEhITiY/Lgw7Iva5gwgYX2vgd5U=
X-Received: by 2002:a05:6512:1394:b0:5bf:d004:a84d with SMTP id
 2adb3069b0e04-5c1bc6d11ebmr5767057e87.5.1795698634681; Thu, 26 Nov 2026
 05:10:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAD++jLn1P9hT-YH9vM9VSvoMRei5LJv+hDZMH1en6CfFXPB-5w@mail.gmail.com>
 <20261119060924.675-1-laixiangwu@cmss.chinamobile.com> <2a6ea91480a6c002a7354ce1223c1d904891371f.camel@foss.st.com>
In-Reply-To: <2a6ea91480a6c002a7354ce1223c1d904891371f.camel@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 14:10:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLn0tuzo8gUmn0rOKRe1q58L=q7-P+iQNkSmtntk6zyJKQ@mail.gmail.com>
X-Gm-Features: Aa3M54oOoJ7amL-cGP1ok1LI-hGii4NmUQAyFDE4e8UOSHEPLef66fnvPCb_WOk
Message-ID: <CAD++jLn0tuzo8gUmn0rOKRe1q58L=q7-P+iQNkSmtntk6zyJKQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: stm32: Fix reset control leak in
 stm32_pctl_probe() error paths
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antonio,

On Thu, Nov 19, 2026 at 12:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> The driver's "resets" property is not currently used by any upstream DT.
> Using it is also problematic, as asserting the reset affects all GPIOs in
> the bank, including those already configured by the bootloader or secure
> world. The current driver uses this only to deassert the reset during
> probe.
>
> As part of the cleanup following the planned removal of armv7m support,
> I was considering removing this unused property from both the binding and
> the driver. Although the ST reference manual documents a per-bank reset,
> I lean toward removing its support given the maintenance burden of unused
> code.
>
> I've added Krzysztof in copy to get his early feedback on whether removin=
g
> the "resets" property from the binding would be acceptable and appropriat=
e.

Why would you remove the property from the bindings?

The DT describes the hardware, the block has a reset, it should be in the
binding, end of story. Things such as boot loaders could be using the
same device tree and may need the property.

You might want to delete the *use* of that property from the Linux
kernel, so as to leave the hardware in the bring-up state. That is
a Linux concern and has nothing to do with the bindings.

We don't remove DT properties to protect people from themselves,
that's not what they are for.

Yours,
Linus Walleij
