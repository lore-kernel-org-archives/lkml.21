Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795662874;
	b=nJQdvXXJJVc+5y0Dfsf3f7Auz98F6k5DGM33JozLJqZ8niEaq38NYOTfsQ/j7u9cukvs
	 Ck21dCbkUlM/5RIRqoZysgQUXU8n93dGMPYR4ydDtqIVaOIVJdczsl5zQrGwFvFFctWFr
	 lGNRDS5hUoZoDYQPY89LxBRs8m5hQBV8f69GB2YZusbauOslRVL3PrHsZHcIn7UXdf0Q6
	 jPdl5oKp1RsKyXKL4fbB9pLA+t+YFACLOEJpnRGCCpV97G8u3Tq2omWu+Ptm9p0JfL1pI
	 pem/1vPlSrbCPmSjy+fHVeF+uvnoMUP/nM54CvR2PUZNcbG+ylJAM1YViLudUnO21OQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GcbvCV5GSqklGhaKRYdmeFkbVhlk/m5bj3QKHwsg91o=;
	b=Yebj9swByF9Kkxh7WneTXXG2NRTQEOxpjy5hnK8CWJC2N6W4LO4d42+JyxGI0bZDvglZ
	 WcjolGU4VzAlQNR/ljgKGhDSbErz+WFwnkG+sp2Uk0u46Vsdp3jJQC1Ew/Jbc/8bq3bNG
	 6Vn/kv1xhqLL5ZdIyS/ugSsO6GEkbgmPh6q0fK+HgstYeDDN1mjMK37kKoNl6Mcruj4A0
	 vpQVzm5gXOJxRiNc+uFw3pZFfZgL7PbnE2ulzhBY1oQZ+RynQXMEAtyA8oeP3M7N8jk3L
	 7L04n+GQBR5T2kiz6nZwtWCE7Lmfn5+i0uw6c0ZSMuLtZ7eKdXrOR1QsfAZDyrpK3NQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k57OBqG+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DFC606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33DFC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k57OBqG+
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4af81963f35so4626975b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795662873; cv=none;
        d=google.com; s=arc-20260327;
        b=EEVVoEbhqpkUXOcOyr5G7wHMrRA+ZRT+b0UYGXz22C8NE0lOqN5AvOZaLjLoGSrJrd
         cFB3N+20UqNGlt77V/wG69PpM+Jlu3BMFHj2C3UOTh7xLSQBeSJZCu54IDorYe0/wvyK
         DqQH+yCf0yeIJys7tNGOhm9OhDh7/LpZgc9KGIUPPATwNn1jEVOl+Ny59gTlhqk5qrR0
         eiphJdJfNpA1FTBEDXXwxYKUKtZ5Ilu7SLQ1qufUH2iRBvtMpYeSsLrBVMuPYBATHZl4
         fX77Y0EsUaC5WajuEXDZekvEdAZ/ny90HuErg3jmE3YomvpgZZjk0cTHOqE/VT7mw4W9
         bQqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GcbvCV5GSqklGhaKRYdmeFkbVhlk/m5bj3QKHwsg91o=;
        fh=wPEn0LAE0pUkGJlOFUaZ9L5C2u8dSWgCadXqgc/K7oo=;
        b=dEof4WfQk5XUi+td6TnmE1HlB/2MTEcUoUoxdroHqSr0FWxg7C+xUTzY2hp0HiuRtV
         M9/eYIWvaQ2amI5lD4VfUvY1SsKGLZ0JrxnTOKDrLEhNgaJ3MLpkcmFC//FiKgjHzjXb
         E9Sjep/wzbTyXkn1NQFpG+DW9Uwh2iRZcAobXdrY0kugibw2U53MJGblNILsqGuOLt1N
         xgVa5pl7Vtjj8NMHKO4A8rByP0jrJk3s3SrFp4AyEKit7zISdAsO1QZMqN05MialMTgT
         QnR4YuqDeHhnUIch/ypMrNPqsXEkEVsWHviTuuJDVDF5H5TV0o0GQEfWGtDOv8L0Mx2P
         1bKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662873; x=1796267673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcbvCV5GSqklGhaKRYdmeFkbVhlk/m5bj3QKHwsg91o=;
        b=k57OBqG+sdHsS6tAnO60PQtKVwTw9tGjuHZQ6fJn2LWBHbCWjCVJHSbctqtcHi75Yv
         QuEi6Z26SQkGadic68tDApWZ2a3oxHJvUjRD2bqpfURy8q+N9DwPWhRQimhJJVEDCQfi
         3pCmJHG3J3hzYFa5VWeSRYrUUDxbdYfgj0bBx80qn6FwsmGvyeiCkDaKggXKJTbE4/wJ
         cbxTtNYHJF+z5UtaK+VKTYJDMqWOHqR1lC+RmtSeH9UR6QRlzhGbRcsZfJOlHkdrkmlc
         esNzgsR/LZxPXubTaN82BFU7SgBK4nexG/+G4RkXQWnwkTWTyq5exAgc5GTD2Ny2bCkn
         iENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662873; x=1796267673;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcbvCV5GSqklGhaKRYdmeFkbVhlk/m5bj3QKHwsg91o=;
        b=nRUMj1y6NEiZXcdtelvC3exUTIPJY6FJjyaHs6rfUL5xeDG53PiFAOMiOb0+4x7sC8
         jCdQcsjwDk0MpH5o6K7E5S/ZAv073uY3jZx3/MV6YF70BQ3ODkqToLyHY2vfZXdpgcDS
         mNO36QZas7nGTtu9PF++oOrN1agbZJ+TzqQkT5YphEdz4w6dd75JU8Y+iDDjj4spt/8b
         c8z+6Evpg7Kre2yAVOuGO7qAq6QRtGV0BG0U6IEcBxaqYGj6FTZq9sQDa+qN9rv34f3L
         ewm16iZMnaU9lYy4TOZIvEMIwd8DdKnKAECC6UAG9LwTqTUp4N2pEKdFrk8l7hoVYrx5
         ohyA==
X-Forwarded-Encrypted: i=1; AL+hErF5rFg+JLjsa+eMCXOkTsUBsCQnkZfY8GDDSEiCnFAQDiKg61HoXPtg+NA5KFbeRTJVK+1ixLdONvvs6YE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y0BwoCbOw2qEqdb9HsQ2ZVf457Ipv81X/+PUmTnGTad1ziq/l
	fPdqcdPhs9zRevoQFcvwH/JxSsC1blLmr7JisPtuGiFF3lPlO/+2JuXT1kSSfumcO15MHuYQGZf
	Ecp1wrFP18YEyf0jQzFChYmp2vUYILbo=
X-Gm-Gg: AZFdTZds1ehLaWxGrZQ+48pLd0L0wv5Zkq78NZJpuYtHnoWe7Lmb0rnGoLiIRbHB0T4
	2/2W9lqkcvmixdY3D1uK92M/4bb/KO6xu/+Q+DaxUv4WpZSv3KASzmPuY7MedQeRC6RqxoPKEms
	hxaWcyRZ5ZxL8HRwoRYV1lQLo5RMSRBJaRKr9rmrFAg87ZyIecZlanQjMEjVRvLb8hVlsF11ghx
	CT5cEQyPYd026se4C2v3lF53j+jRQu2hGbM+SnQcc9U36y2n7y/hMY6u8oFBFzGntUVq4zqkGB2
	ksGPHiDhQ9lgDDIZoGxfoMx0Sjunbl8sKVkNy+pYz5d8iZ/cWYrJ/xENRCAd0EE03gSQvAcMQNz
	luN3lphhGY8qBbg46qKycWn1Ss0NXdbyawdnGgyjczkvkV9B1d/neTyS0OnBovKKSNAnedh/1Ju
	4WDBUZ23If7k/ug3EUS3FQXAVQiX2uBe8=
X-Received: by 2002:a05:6809:757:20b0:57d:1af2:6e12 with SMTP id
 5614622812f47-57d1af26e3emr9673937b6e.30.1795662873030; Wed, 25 Nov 2026
 19:14:33 -0800 (PST)
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
 <CAHi4H7HVNRnBynR2KLnxr=fpep=jkSBbE1NHvFr5e2DsvSTpjQ@mail.gmail.com>
In-Reply-To: <CAHi4H7HVNRnBynR2KLnxr=fpep=jkSBbE1NHvFr5e2DsvSTpjQ@mail.gmail.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Thu, 26 Nov 2026 11:13:56 +0800
X-Gm-Features: Aa3M54o33vWSDdhl3EhMnBuHhyvDxviml_wh1UCQV3GqiVxQrmBIeWc2Ms3zbUM
Message-ID: <CABOQOSV5eW5X0_ChXe8MT2tTFPtLTHLuRn520Ya-tUp8MoQTFQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: bcm: support more than two CPUs on BCMBCA
To: William Zhang <william.zhang@broadcom.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi William,

On Thu, 26 Nov 2026 at 02:48, William Zhang <william.zhang@broadcom.com> wr=
ote:
>
> Hi  Ho Jie,
> On Mon, Nov 23, 2026 at 6:22=E2=80=AFAM Ho Jie Feng <hjf3108@gmail.com> w=
rote:
> >
> > BCMBCA Cortex-A7 SoCs can have more than two cores, such as the
> > quad-core BCM6755. Extend the CFE SMP support to all secondary CPUs.
> >
> > CFE parks every secondary CPU on the same mailbox, and the wakeup SGI
> > wakes all offline CPUs at once. Hold them in a pen and release them one
> > at a time.
> >
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> > ---
> >  arch/arm/mach-bcm/Makefile         |  1 +
> >  arch/arm/mach-bcm/bcmbca_headsmp.S | 26 +++++++++++++++++
> >  arch/arm/mach-bcm/bcmbca_smp.h     |  9 ++++++
> >  arch/arm/mach-bcm/board_bcmbca.c   | 46 ++++++++++++++++++++++++------
> >  4 files changed, 73 insertions(+), 9 deletions(-)
> >  create mode 100644 arch/arm/mach-bcm/bcmbca_headsmp.S
> >  create mode 100644 arch/arm/mach-bcm/bcmbca_smp.h
> >
> > diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
> > index fcc4e0174a..c3cd2959bc 100644
> > --- a/arch/arm/mach-bcm/Makefile
> > +++ b/arch/arm/mach-bcm/Makefile
> > @@ -60,4 +60,5 @@ endif
> >  ifeq ($(CONFIG_ARCH_BCMBCA),y)
> >  obj-y                          +=3D board_bcmbca.o
> >  obj-$(CONFIG_SMP)              +=3D bcm63xx_smp.o bcm63xx_pmb.o
> > +obj-$(CONFIG_SMP)              +=3D bcmbca_headsmp.o
> >  endif
> > diff --git a/arch/arm/mach-bcm/bcmbca_headsmp.S b/arch/arm/mach-bcm/bcm=
bca_headsmp.S
> > new file mode 100644
> > index 0000000000..3d0d0d97be
> > --- /dev/null
> > +++ b/arch/arm/mach-bcm/bcmbca_headsmp.S
> > @@ -0,0 +1,26 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * All CPUs will wake up on an SGI. Wait in the holding pen until
> > + * bcmbca_cpu_release matches the MPIDR.
> > + *
> > + * Based on arch/arm/mach-versatile/headsmp.S
> > + */
> > +#include <linux/linkage.h>
> > +#include <asm/assembler.h>
> > +
> > +       .arm
> > +ENTRY(bcmbca_secondary_startup)
> > + ARM_BE8(setend        be)
> > + THUMB(        badr    r9, 1f          )
> > + THUMB(        bx      r9              )
> > + THUMB(        .thumb                  )
> > + THUMB(1:                      )
> > +       mrc     p15, 0, r0, c0, c0, 5
> > +       bic     r0, #0xff000000
> > +       adr_l   r6, bcmbca_cpu_release
> > +pen:   ldr     r7, [r6]
> > +       cmp     r7, r0
> > +       bne     pen
> > +
> It is better to invalidate the L1 cache for the secondary cpus
> regardless of whether the bl does that or not.

If I'm not wrong, this will eventually end up in __v7_ca7mp_setup
which calls do_invalidate_l1?
https://elixir.bootlin.com/linux/v7.4-rc1/source/arch/arm/mm/proc-v7.S#L301

Best regards,
Jie Feng
