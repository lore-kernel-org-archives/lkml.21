Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632195;
	b=jIsUzSlHWIp/TYcvC6OzkkGS5EbtgPTebH4Hnyn2aovh3GP73OBMa6V2vk4ydpmlJQ6w
	 NZ/ox8OG36rCiMC6n5ulmudyNCG44tDWv6uEzX3EOcQ+um61gvzd4y+Hh2ahUAJpMguIR
	 yQ6Pi/Gko7u22g5wHFWQ3nbST9nJos97Ghb8AhhMHfxn2vSOP+CG/Boa3/rrAu75ETqHh
	 2c5b34j4aoQ4De987wf1i3286Vf7jlfWFRCtLH2V6a5+38M1QFlhSeZdSupCkBoNUhdss
	 4qxrpydFMQASUrwO66GZ1qwq2aSTW2NZrMeywWATrVXi/C0HWnANlWphZlzZzXpdibg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632195;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oqOBHQAMaG6pHcHSw0q+p1A4YAB/8zxddwRDBAU9nY0=;
	b=MTaRH60oYiWP7+yHNb2JxQP78FBQGhTMmznwhpfFFIOV4+Ec+CXSs+e8Pzk5ndy3sxTl
	 yUtvTyykgjqTpfmzA2VqtS9SWk30kgJ6B3ABtUoQeUZfVLAnhOwzRs0csZVXA9M9jFdcg
	 xx7hEoIiMrGW77YtsnF+g2WgUQ8LWnfnGHfRowiQ0/70iwQJ9QG9uzDi+CGc+kpRqG42E
	 ok6HQ0QmJOPCDkNm/JcI1TaSdO1qgUqWups332CoubO5Zz2Oq9kNyXQNTXN8Z8HKna16L
	 +MIxksJq9GDtfZA8B0cF/neifOlqbJoYB1DJNvgwz7GY2RJ98EJl6xAriIzJz29Ln4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oAmEQ77U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14AF606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oAmEQ77U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31BD21F000E6
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795632194;
	bh=oqOBHQAMaG6pHcHSw0q+p1A4YAB/8zxddwRDBAU9nY0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oAmEQ77UCImqHEHBg33dv8f6I2Vf08Qs4fjLSahSoa3J0+ub+hsXzX5YE8eyZj9bx
	 uvm5EcR73t8OaaTKxS/U+jKVq9CkRbwaF3zLtaSFBBtkWyUQiseatIx4sht2d+oK1u
	 HWZXZ+MxnXazBHEQBhAtYDS6l7LTEk93ljZflFVkgTg7l+IAj8LAzQ5L2RY4cQ92R9
	 apBA0Txbo/7SsNGu5Ux6zExoBNqdqqK2GEK8r7aYCgPu5Q1A1HzLgSMygKaFyd3PtK
	 MhQ7QD+ackQ/5pbk5pcId0MjcYLxbhA8q7Yle/Cviskvt+ALPNoqZAv/R7NAdwF/CV
	 vrRmEfvQ9sWMg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c14f3dab09so3178541e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:43:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFTgQW38fvgYh5hk4MV3pc8cWxaTnmJBeylq7ecAuCkQ4SrX6Eo9Z89ub9Y3Hy8sOmz/mCuFW5LYhaxBJI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BeaK0y9Ex/ngX0c0AXKEPhZ8ZBqrMmHpX1l+YMvr8HJu1HqBr
	momAVUpW6TU9YR7mV1ceYNxuiStyS1ZujOpQbmkhqQJdjGWWFMElAiO7irFeO4FoM5vZ+ZlZ8yc
	VUlXovKRQPrB2tdumOIqzrtx9Bq6Cn1U=
X-Received: by 2002:a05:6512:1393:b0:5c0:b5c:4044 with SMTP id
 2adb3069b0e04-5c1bc690966mr5243804e87.1.1795632192950; Wed, 25 Nov 2026
 10:43:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112083600.1550204-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20261112083600.1550204-1-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:43:00 +0100
X-Gmail-Original-Message-ID: <CAD++jLkEC5eDjLGRCAfv4gQWO-f2WQQ18QThU2_QpWAvSdVi7A@mail.gmail.com>
X-Gm-Features: Aa3M54rH77em81M0iBD_Hhp5Cbppm4obv6tBVRQL2-ACfZFH3vS9jio4K6cbORE
Message-ID: <CAD++jLkEC5eDjLGRCAfv4gQWO-f2WQQ18QThU2_QpWAvSdVi7A@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: nxp: s32g2: Enable by default on ARCH_S32
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 9:36=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> The SIUL2 pin controller provides the pin muxing used by peripherals on
> the supported S32G boards: the S32G2-based S32G274A-EVB and
> S32G274A-RDB2, and the S32G3-based S32G399A-RDB3. Without the driver
> some peripherals never finish probing and a defconfig kernel cannot
> boot to rootfs on these boards.
>
> As the driver is required by every supported S32G board, make
> PINCTRL_S32G2 default to ARCH_S32 so it is enabled out of the box,
> while keeping the prompt so it can still be disabled on ARCH_S32
> platforms that do not need it.
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

This doesn't apply to my "devel" branch (or -next)
maybe I already merged an older version of the patch?

In that case send an incremental patch instead, thanks!

Yours,
Linus Walleij
