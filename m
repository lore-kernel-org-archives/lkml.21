Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640464;
	b=Yp58vems9UrNvr5sUJg2uPN5IgfoQ0BRJIKOfPlba1iH+trJOUSuLS7TpQeYRdrHsa7H
	 09XBs+kt+kgM9XIoz1BBs2TtwtUHuSm6wq2tVSMq954K42ckya4D08d1dwSgT/X9zQn6y
	 6L06m+qTc2aznuqWZio6qPnnokoN8lbUPhEk4Vfa3YX2MyxlX2K4AwLim4c5zf1/TTxAk
	 NjL6gdUH5O5OXMHu/dFJw0VsCnXCKGwxTCNdtswe6fZtJXHjsjZUE6ycq1Xy1qI5D9B7C
	 Uccoq+KMQ26RFk7CBLhvHv3jlby9OIq2jOac5XWHqnIyuuCqjUpuFBkKkFDOX84i/mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640464;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tS2gaavtLHkaRIhoftiQwAfQBELkcBZUly25G8RQWLA=;
	b=MSmwhSp+1TQYrHQTq3Vp+2KvbnDIw9MJlNc4uPazerITjgNIFjyWPj6bFdZ4P1+wXTpH
	 TadZKkihX+mEtY/xCpgGE/rD61LEW1rI0lNviMe9r4VtnOn9tdYmhxfOhghm1D1RBQRHo
	 Z68/WEHx6Moh0vbJCzLSIHyFixXFdlVTrS3pSWL9uyjAsojGA4oS9Q59JhJYNjPyYzRpF
	 xAMtFzv9SsR1eyU+vMTy8RyIkmRqBVrzhkwRCTotvNeNScqb+lHRJCSrk5WG2fAiVCaCW
	 0qPwNf71Mv0wmNIU8H/P8Me7sebdgPt34GoLtJFi9/oakUsw5jzl9aKQHBc7YgTeSZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FGesK0V8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C1D606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FGesK0V8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A1F1F000D4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795640464;
	bh=tS2gaavtLHkaRIhoftiQwAfQBELkcBZUly25G8RQWLA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FGesK0V8hAz8p/FNSSfFtqDzfHsTOzomDp2OKK5CWs4cgy4IHpLiHFf0ouNaE2yW8
	 EKVr+QPZnUFGmd6BVHmftGq/GJLT+YG4yVR2UjyklSK1gJqyl/JBodFnCIdE1946uH
	 RUVdWWufi74tVT2llyHKS+8foZszOgLGFqypzEdw1X4NOSj0etKnD061x0DekDTmp9
	 TsbstYwMb5mnEWkUgz0/5Ur7yUB0PUhJGsLQB06zrT3J3fOdlumGHbeEkd+WQS15Ta
	 AWB4ibUTtuUCOoegB3uyRvs+ffxevPp9EQW0tKnOcvp/ZegepwZHTpeMpbJWrLsj73
	 73dP8orPHWbrA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ae22dcfdc3so50682421fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:01:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGM27/iwu+9GVoTSuHqi2dZ5Fcex13BvnbXjhgnzA6QDCjVsAEp+gzhy1U4nJ+bmCCCRuaY2oYhX+gPasQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cFXSf+tUrLx6UXtPfX2+4yPZoxUQGX5RT+wcoeKMh67J4BXO4
	WICw51xm1VO1rKyI68VUK8FRcf6x7um+t4++datgmVuvSUM373UZY/3a0qSNsJc+oE/hQ+hTxRj
	d3oRktOi4vZ3NKK06UBZkr819lediYfI=
X-Received: by 2002:a05:6512:110a:b0:5c1:5cee:634c with SMTP id
 2adb3069b0e04-5c1bc8447d5mr6322238e87.61.1795640462553; Wed, 25 Nov 2026
 13:01:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123142203.3860616-1-hjf3108@gmail.com> <20261123142203.3860616-3-hjf3108@gmail.com>
In-Reply-To: <20261123142203.3860616-3-hjf3108@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 22:00:48 +0100
X-Gmail-Original-Message-ID: <CAD++jLmHRkL7Zmw7VrV-UFo14nwgMTLB3UVA15vn9JWsvrXQfw@mail.gmail.com>
X-Gm-Features: Aa3M54qUkO3zSeEjRH-PO8oJtdJZnSyIyAg3hK9lVAU8zHOdRHoMwx9ZR26Yhlg
Message-ID: <CAD++jLmHRkL7Zmw7VrV-UFo14nwgMTLB3UVA15vn9JWsvrXQfw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: bcm: support more than two CPUs on BCMBCA
To: Ho Jie Feng <hjf3108@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, William Zhang <william.zhang@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ho Jie,

thanks for your patch! It's nice to see others building on this
idea, for a while I thought I was the only person in the world
who care about BCMBCA upstream.

On Mon, Nov 23, 2026 at 3:22=E2=80=AFPM Ho Jie Feng <hjf3108@gmail.com> wro=
te:

> +++ b/arch/arm/mach-bcm/bcmbca_headsmp.S

> +#include <linux/linkage.h>
> +#include <asm/assembler.h>
> +
> +       .arm
> +ENTRY(bcmbca_secondary_startup)
> + ARM_BE8(setend        be)

Are you aware about any people booting these platforms
in big endian? I don't think that works, just skip this.

> + THUMB(        badr    r9, 1f          )
> + THUMB(        bx      r9              )
> + THUMB(        .thumb                  )
> + THUMB(1:                      )

This code is for the CPU to switch from thumb mode to
ARM mode if it was booting in thumb mode. Does this
actually happen in practice? Else you can skip this too.
It just looks overly cautious.

Also the ordinary secondary_startup_arm does the same things already!

> +       mrc     p15, 0, r0, c0, c0, 5
> +       bic     r0, #0xff000000
> +       adr_l   r6, bcmbca_cpu_release
> +pen:   ldr     r7, [r6]
> +       cmp     r7, r0
> +       bne     pen
> +
> +       b       secondary_startup

And why are you first spinning on the GPIO address
and then spinning again in this "pen" (as a place for
livestock, such as CPUs ;) it was added to mach-versatile
to work around a CPU bug in early silicon.

As Russell King writes in 2018:
https://lore.kernel.org/linux-arm-kernel/20181213175952.GC26090@n2100.armli=
nux.org.uk/

> The "pen_release" thing was created for ARM Ltd development platforms
> where there was no way to individually control secondary CPUs leaving
> the boot loader - they all jumped to whatever physical code address
> was supplied at the same time.  This made it necessary for _these_
> platforms to have a "holding pen" for the CPUs while the kernel
> initialised.

The "pen" is only needed if all CPUs jump to that address at the same
time. I don't think the BCMBCA platforms do that because you send
one IPI to each CPU?

So I would skip this assembly completely...
I don't understand why you're doing this other
than copy/paste?

> @@ -58,17 +76,27 @@ static int bcmbca_boot_secondary(unsigned int cpu, st=
ruct task_struct *idle)
>         /*
>          * The CFE stub reads GPIO GeneralPurpose after an interrupt and
>          * branches to it in ARM state. Clear any Thumb function pointer
> -        * tag and complete the MMIO write before sending the wakeup IPI.
> +        * tag and complete the MMIO write before opening the pen and
> +        * sending the wakeup IPI.
>          */
> -       writel(__pa_symbol(secondary_startup_arm) & ~1, mailbox);
> +       writel(__pa_symbol(bcmbca_secondary_startup) & ~1, mailbox);
>         dsb(sy);
> -       arch_send_wakeup_ipi_mask(cpumask_of(cpu));

Have you actually tested *not* changing this code and see if
all CPUs just come up? It should just send each CPU in order to
secondary_startup_arm like we want?

Yours,
Linus Walleij
