Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795662389;
	b=Ziwk2f3XYKuiwtk8R/BVRPCCalJs+VPUaToLCDtz6/YZb3sAckIFeYUF/KMBdCXsIIUN
	 tS7902g89hJN3kT1XYr2EsSepk7STBP+OZBZxSzJLwfDSzEPJs9G9ykPCj3ZHL5NZ8ZLW
	 r1sqfOb6tr6VPwduKC97Y3rxZkBQI7GnMckgXk/oHHZDQFVqtcRNV4wsYlfs+dnc3W4Xh
	 iTBR5wTXAYMxvCfDu/rW2LVLlT1DDiEFN4l5zxyofMbZ9MvTzi6T+BOLnNrwByD4MS5r8
	 vFuoAwPQhqqjd1DAcJWjd8gXH19bR1yHvf2ZCm3rzS5xJ4w/KLLoeFlObUZvBDt4sPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VgeqwZ6c13ysK3Ffl+UlwXTHJlLqeIHDQOOx+5zpAXI=;
	b=lIkPXf4S6LMZf7bMevtAnxZGa1t04MP6mNKwuhcA48wlF+li91+5TZ6YLkgXVIXh+qLI
	 y4ucod1wekrP8tzLkfGMR8v1oGlBygBPldkfRN36gGmhf4B50F04AwZYf+Hy1m0gZIcfR
	 s50a4TdPZnDdsHxaKMAF8xPfjzWTcKWGYZPI35bPbpFIJt2utTkWk54QaQ++ZydSnz6au
	 9A1hDF2EaugBuRc6UoKYGgceaQA1M5JNqekd0EIjc1DMDU1F3vjJ0rWPaMu/BFaRli4dm
	 LJov6czNfgrCTjNkRJ+75ukUmf6qWZ9Hrgyz+IYFjL2HBk2FV+/1ch3aMZa+DLh9lgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g7bzSk9e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C8A606A332
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C8A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g7bzSk9e
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-43bf9548df4so5998964fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:06:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795662380; cv=none;
        d=google.com; s=arc-20260327;
        b=H+6UtCcrc7PbX70urhrJ4WDubUmCbQT7sVCYCHYJ6oV63bzaufSOT4OuMTjV/C9OIr
         C6mH6JBn4OO+m7MroyQJCgcqhxTjrD/EYC9Y2YImBUDn5am7gWejBrUwjJ/7rAom8LTy
         AH2o1dC3KUCdNd736eLmDfRVC1CaKreOlrNipGHtRrFXjzQLgOXy/dKJKucjOTM4Jpw0
         s3tDl22ibUf5LUk41CF5FD6t3OG1X0K0kSgLgQlhg0BQhCBa561mD2ucdJSg4hNwMGdi
         tS1awJ4FjO7dnCBq/ZBfLZCPuqaOx9QRKvgzfADfYRayn/sDEOr7A42ugx7GoTHK9+RD
         oVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VgeqwZ6c13ysK3Ffl+UlwXTHJlLqeIHDQOOx+5zpAXI=;
        fh=d6YENrFp5Q8E4dJb2AbT6eB0PsYbkwU+6P99R52/0Uo=;
        b=GYNc80QAJRlgVJ8U2zsrt6x6nMz1F4HlWWz7a7EuYsmoN1ME6i1cRJjvh7ZvMTSFiR
         zz0ooCIYjdCHWFYGhVZz/5tIilDcTiiLFnYUYNKPyJ1ZkhJefLcLFZzRGTE8mjdqaSn7
         /0+WxTSceLB0QCezq9eRLBwiQMq3aOHab63BGC3bPnnNswAODLFnNStDk0Pvm08OwPbZ
         etoyi9gUUXYpQNxMIketlYf1ywUAF0kY/1LiARLrrrlKo0Bkkc6i94Yq66o0q53XQuFj
         zgFdaJx4f+qltQhHs857tuTa/3JodDh7nA7YDnZ9gxuKSRSBc7D737x/sXS7dngxGhfd
         F/qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662380; x=1796267180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VgeqwZ6c13ysK3Ffl+UlwXTHJlLqeIHDQOOx+5zpAXI=;
        b=g7bzSk9ebQDuqYaFA8G5/zSJbCLIj3AjSjMfZccLbTpIz+1/Kn56MU6BMFmn6voXWg
         VO0F8Y44teK+bF5f0g9CC2Kxc7Xj+dgFj+hbqSKwQPmoudrgyffS5NUVlg+4VybiemP0
         3ODMePoSzFHwSMJMUq65Ex+RM1OdFV7j9/BGYSLZ4owLSkpKVmgnWbrYjpEBGnQsjjAu
         BUkLP1YffgPBqtl6UwlqXeuBhjMqTtz6lEjDyT6B0VbYkqKE/hZzMiBgYtIztNDbtPK2
         7GKxS4f8RA7UhUCXJZnsA+/FIUN4QCvjdWCD+1SvffQOA4igWnU3oG2iOkx27QTnJCFC
         nJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662380; x=1796267180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgeqwZ6c13ysK3Ffl+UlwXTHJlLqeIHDQOOx+5zpAXI=;
        b=A5QqyyvVyHZEErr9KxHZGSuWfWR8aJ7KmzE6LtDYXy/xcBaxaS3TImqlbhuIkihdmz
         PWzDjTEBvsF266f2/WWSfVeQcNMCyZXGafhS4/F2lrPUMAPZ4LhabHm4b0ICt44wHSNc
         jMcM9f2WhtcbNUJDGtvp3awZ81rxvTO60BImF0GWSvHQb3q9MjDWdExNKewlVvtL8i5h
         DSaLgm4TUcojYZkc9qoxhx2sfn/3zuWaetc2K/VL3vQa/ygSIjaSFm739QhHnuVLO20Q
         FEglSq0nBpn149fWnwZlPYeORjH54X2rZDG6wta4GWFxsnBJIudVRlxmwcGXxOlxNtVM
         7C9w==
X-Forwarded-Encrypted: i=1; AL+hErE0Iiz4B8EnzGNpX/PmOhl28FuQ/4o3fEZmHEfYCB5sOAq7UMgIDYNX0aTtACYAD0ISJ8E30R50KHVUBkU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+54c4cgfuHX5JL3qMbOIKR1ZDX0z7i3hEvs+Et85w86hleHRgN
	GkhHQKFhSXWSpE6v7s8xmRl/bO4wOyMzutfakUiQ4Mk7V4sF2Jm0a19zQuu3amLOxuhJovdQOkz
	sJv0ZmaqZEb4voI+bpEwZhui9GJ61eIE=
X-Gm-Gg: AZFdTZeIZCOi3lTAVv7q6YTPerG1x+W2MQUrnCAUgMlAL4cE0EU5+3NrAwfi+RRAmTh
	VQG+VWAspSVLb2XGgNZQSS51Jb3PKG8OmhpvKB2VOwXH24ve0eJBip+lJvt3UPiqOOffhYnNNHA
	WfEP2aMYG7Mrc1axooKaCdhnYgW/DTqBq6cZR8R6uiOrHG1gjVwJNRXG0g5dcTrWcLoCO4pt/bY
	s21mozmPzxnZdS92Tyhln2JNn9ChAx3CLIKW+UlwDtQc5jrGX2E1Efs7Kl2Btf3xSUkJpYCgIs7
	+EIhVnX7ygg4ZUdr1VrR6/s3wnrL140wiF9hvQsKQL58vlvAJdOT/+VQ+ywzLR98igwwfLSjU+0
	66FBbb5pSBvrYRkoYm2el/X2bAPMHjqkNnF0RqyaKhOvcdpmYq2hnsjehR2xAm30I3/OkknJojM
	LmhxDhMmqCKMfR4hXzDOCcAT2rU5TZMiMHVN28IuK2b8EqmNis+64P
X-Received: by 2002:a05:6808:150b:b0:573:b059:4d5 with SMTP id
 5614622812f47-57a0a516489mr21719385b6e.11.1795662379758; Wed, 25 Nov 2026
 19:06:19 -0800 (PST)
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
 <CAD++jLmHRkL7Zmw7VrV-UFo14nwgMTLB3UVA15vn9JWsvrXQfw@mail.gmail.com>
In-Reply-To: <CAD++jLmHRkL7Zmw7VrV-UFo14nwgMTLB3UVA15vn9JWsvrXQfw@mail.gmail.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Thu, 26 Nov 2026 11:05:42 +0800
X-Gm-Features: Aa3M54pQKq03Y0-nnWMu9QCndX8rwmggo2h42nh5oUoLZC7NpdzpKY1Ii1Xr7tc
Message-ID: <CABOQOSWT8pFPEECEfH6oR9yQT1_-_QU-okJGOGgdm_k9G=Ft6g@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: bcm: support more than two CPUs on BCMBCA
To: Linus Walleij <linusw@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, William Zhang <william.zhang@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, 26 Nov 2026 at 05:01, Linus Walleij <linusw@kernel.org> wrote:
>
> Hi Ho Jie,
>
> thanks for your patch! It's nice to see others building on this
> idea, for a while I thought I was the only person in the world
> who care about BCMBCA upstream.
I'm also trying to boot OpenWrt on a BCMBCA router and already got
many things working. Going to send the dts upstream soon.

> On Mon, Nov 23, 2026 at 3:22=E2=80=AFPM Ho Jie Feng <hjf3108@gmail.com> w=
rote:
>
> > +++ b/arch/arm/mach-bcm/bcmbca_headsmp.S
>
> > +#include <linux/linkage.h>
> > +#include <asm/assembler.h>
> > +
> > +       .arm
> > +ENTRY(bcmbca_secondary_startup)
> > + ARM_BE8(setend        be)
>
> Are you aware about any people booting these platforms
> in big endian? I don't think that works, just skip this.
>
> > + THUMB(        badr    r9, 1f          )
> > + THUMB(        bx      r9              )
> > + THUMB(        .thumb                  )
> > + THUMB(1:                      )
>
> This code is for the CPU to switch from thumb mode to
> ARM mode if it was booting in thumb mode. Does this
> actually happen in practice? Else you can skip this too.
> It just looks overly cautious.
I am not very familiar with how bcmbca is used. Since these kernels
can be booted by CFE and I do not know what kinds of CFEs or
bootloaders are there, I left that in.

> Also the ordinary secondary_startup_arm does the same things already!
>
> > +       mrc     p15, 0, r0, c0, c0, 5
> > +       bic     r0, #0xff000000
> > +       adr_l   r6, bcmbca_cpu_release
> > +pen:   ldr     r7, [r6]
> > +       cmp     r7, r0
> > +       bne     pen
> > +
> > +       b       secondary_startup
>
> And why are you first spinning on the GPIO address
> and then spinning again in this "pen" (as a place for
> livestock, such as CPUs ;) it was added to mach-versatile
> to work around a CPU bug in early silicon.
>
> As Russell King writes in 2018:
> https://lore.kernel.org/linux-arm-kernel/20181213175952.GC26090@n2100.arm=
linux.org.uk/
>
> > The "pen_release" thing was created for ARM Ltd development platforms
> > where there was no way to individually control secondary CPUs leaving
> > the boot loader - they all jumped to whatever physical code address
> > was supplied at the same time.  This made it necessary for _these_
> > platforms to have a "holding pen" for the CPUs while the kernel
> > initialised.
>
> The "pen" is only needed if all CPUs jump to that address at the same
> time. I don't think the BCMBCA platforms do that because you send
> one IPI to each CPU?
I can experiment with that.

> So I would skip this assembly completely...
> I don't understand why you're doing this other
> than copy/paste?
>
This is obtained from the vendor source code where there is also a holding =
pen:
https://github.com/Asuswrt-Merlin/asuswrt-merlin.ng/blob/main/release/src-r=
t-5.04axhnd.675x/kernel/linux-4.19/arch/arm/plat-bcm63xx/platsmp.c
https://github.com/Asuswrt-Merlin/asuswrt-merlin.ng/blob/main/release/src-r=
t-5.04axhnd.675x/kernel/linux-4.19/arch/arm/plat-bcm63xx/plat-ca9mp-headsmp=
.S


> > @@ -58,17 +76,27 @@ static int bcmbca_boot_secondary(unsigned int cpu, =
struct task_struct *idle)
> >         /*
> >          * The CFE stub reads GPIO GeneralPurpose after an interrupt an=
d
> >          * branches to it in ARM state. Clear any Thumb function pointe=
r
> > -        * tag and complete the MMIO write before sending the wakeup IP=
I.
> > +        * tag and complete the MMIO write before opening the pen and
> > +        * sending the wakeup IPI.
> >          */
> > -       writel(__pa_symbol(secondary_startup_arm) & ~1, mailbox);
> > +       writel(__pa_symbol(bcmbca_secondary_startup) & ~1, mailbox);
> >         dsb(sy);
> > -       arch_send_wakeup_ipi_mask(cpumask_of(cpu));
>
> Have you actually tested *not* changing this code and see if
> all CPUs just come up? It should just send each CPU in order to
> secondary_startup_arm like we want?
I traced the code to drivers/irqchip/irq-gic.c, since
arch_send_wakeup_ipi_mask will eventually end up there.

- Line 1248-1253 every gic_cpu_map[] entry is set to 0xff
https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/irqchip/irq-gic.c#=
L1253
- Line 836, 845 the driver ORs the map, so IPI get sent to all secondary CP=
Us
https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/irqchip/irq-gic.c#=
L836

Since this platform is booted by the CFE and not using PSCI, I decided
to use the vendor source code since it looks like the safest option.

> Yours,
> Linus Walleij

Best regards,
Jie Feng
