Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421128;
	b=zAUM2gDoO3ZYf+t3WV8gChm83qeS8mDxBLZJFZRvM3qs2tT4KKVpU6z5uOp4HufU9BE4
	 r/mGk8YSEs4JJpg8VkWkP235a6Vv2eYpU4uQiOHzO4TwIHccD51ore+i5ncGClLUw80+5
	 i9nfdloP64ib3RC+IUfkvmQ2sghxHfSSjB8szbaIWRI5xY6e2Yozrys8TWBW41t5+D1Wv
	 Gp+khHpbKWpt7160gRk8MQ0dH19kozds+qzYg9/C/aduzyHqZ/6TM4LF+mL7T+dSvxENq
	 Mu+W37eTY5Cfd7JoKqH/yS9xpyobIjKrwNFG7QLoCshouY0I4aYshI2fNjCVpcMInig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421128;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=twrxjfkIjpHysePIox8EoY+a4mTY5HZBuzREdgZ4c4k=;
	b=vl2pRR5Wy0EImA+I0e1M8KlRrlt4rLIInuWDZgZ9Emm8LcpnTfUO3i3K4ttbTFUR73nJ
	 0y/X9Gm2SHIoX88XTBSdBlpGcdt44gkRkex5UABSWc/iWw8/eeUs2wbmHGWNpJvdF4z4O
	 bnt1BRzZBiMPOuhAsZEFdugO4weipXV7QZ9ezSQ6uzjH6GdjdS3OF3o5vKpx+/UKm96lu
	 DKqQwwsL4q8Fhyci3wdREpP0VR/oC+tOlOvmwqvNbSnbyPdi5VIm4mcV2XRuo4/qSrV0h
	 PBOTsf9lqB7QdRYn5nD0vS35YETF+0k/E9VCa0fa0UP4RIrpIxSusFPsCEaI7m7njGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q4BM2MtX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983C5606F624
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q4BM2MtX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E8301F000CF
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795421128;
	bh=twrxjfkIjpHysePIox8EoY+a4mTY5HZBuzREdgZ4c4k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Q4BM2MtX4N41I7AjB0viwchCUFmXmEQbYJ6K5yH9c1hk06TOaDGke9c+9jSk69MXK
	 23hBtcz3HcpqVJqsXQhBAfyTPI6oSGP3PEVTrV4ObYDJ+DZrvkxw1fncBCJS7CZe6P
	 QGUN+W9ifC+VHNlHSTbXrDIiufhH5wWFH5Ky2fU9f1eJwnnO7PUbBSFOz1+IQccxIy
	 OKVoAcNSivdZCtf9+7MSDgZ3M+y7f5eaaIW3jVw5oTklX/IoOL0P8cRDbmhOJDgFds
	 I+079TKuUpMo9CzhPtR9zc+KAqJzYFGQvrzaz/cF0aYAk4EbtazPOHntzNGqDYqkDb
	 V9vnMo2kg7ldw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso2616410e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:05:28 -0800 (PST)
X-Gm-Message-State: APuU4Z/5Js6T4BHYU2F7edmDQ4TcaCK0MzoB5o2Fy2lQf7tiMrSIeRyz
	qbafDy2Cw+H6ZjFew0r5ZWQ3+KGbMx5l9zt30kn/laENtPsqm6jNwRxBBCEvDo0kytFwFRym2f2
	ww/dkQ+5jfni+6qSV7iSyOdh0VVRM/q0=
X-Received: by 2002:a05:6512:33ca:b0:5c1:520f:728a with SMTP id
 2adb3069b0e04-5c1bc80af8bmr2732246e87.38.1795421127123; Mon, 23 Nov 2026
 00:05:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123004501.1771603-1-rdunlap@infradead.org>
In-Reply-To: <20261123004501.1771603-1-rdunlap@infradead.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 09:05:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLk2fZyDwTgc_ZpHSyd+M2oxpB8qT_nXS7wkE45D7Pbsew@mail.gmail.com>
X-Gm-Features: Aa3M54oj6YBbA9XFup0ctnJJbEySVwx8-0ciWrikSUzYcfK9CqN6GvfxpDvMdTw
Message-ID: <CAD++jLk2fZyDwTgc_ZpHSyd+M2oxpB8qT_nXS7wkE45D7Pbsew@mail.gmail.com>
Subject: Re: [PATCH v2] chardev: GPIO common access methods: repair
 non-kernel-doc comment
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 1:45=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:

> Change a "/**" non-kernel-doc comment to a plain C comment "/*"
> to avoid 21 warnings like these:
>
> Warning: ./include/linux/nsc_gpio.h:2 Cannot find identifier on line:
>    nsc_gpio.c
> Warning: ./include/linux/nsc_gpio.h:4 Cannot find identifier on line:
>    National Semiconductor GPIO common access methods.
> Warning: ./include/linux/nsc_gpio.h:6 Cannot find identifier on line:
>    struct nsc_gpio_ops abstracts the low-level access
>
> Fixes: fe3a168a2ce1 ("[PATCH] chardev: GPIO for SCx200 & PC-8736x: add gp=
io-ops vtable")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Jim Cromie <jim.cromie@gmail.com>

For the patch:
Acked-by: Linus Walleij <linusw@kernel.org>

For this stuff's existance:

$ git grep 'nsc_gpio\.h'
drivers/char/nsc_gpio.c:#include <linux/nsc_gpio.h>
drivers/char/pc8736x_gpio.c:#include <linux/nsc_gpio.h>
drivers/char/scx200_gpio.c:#include <linux/nsc_gpio.h>
drivers/leds/leds-net48xx.c:#include <linux/nsc_gpio.h>

Blaeh, we need to get this "necessarily different" stuff in line.

I'm not blaming anyone because it may very well predate gpiolib,
what could they do.

I'll analyze.

Yours,
Linus Walleij
