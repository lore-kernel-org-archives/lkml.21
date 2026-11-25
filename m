Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632490;
	b=mJ2p8F6RxZ0of37/t++1e+u6yZFbFvly1RRYAuyBBdule5gmsp0ByY1i1eo9+cBE4Dyx
	 hcYNU5pFly6dGsOZ319fbyh4yJcJXBbfPvhF8sHEZsmYCK44OQSqgp9IyJoTMFyLK8dTS
	 rJ+orC2U5zpmRPOExXRIdGslOHWSWxgLevzH+oti4FDVJWL7e3WyomNjjAYf4FEQOohlk
	 073HM5zIzLXtVkutIhNIxWCf/oHVD/J8kbR25N8DF8g2DVdQPdl6tiIKmpITaZm9UHUfm
	 uItM84DktuAQZDxgBtOwRX6kAJEsJHlMqPXNzF/UUxOC2v1rEukZxVWKa3aah19wNbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632490;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=N5jZLQzl6Rjyl3tD3TPDN5KL+XFk1zne9SZ6/T5EhCY=;
	b=Jso579kJzTqAp3hy68YTJx9ZQoWgJ/8k5e3K7FVRHjrhRXbBhN49IEh9CXlfNGqMBvqW
	 MkCC5a2qETTRBreQ1vkYpWqIT71abJQdFilcY9b5/IY1YFhYsA1ScUDCiKRv9hYd9LvU6
	 wA5VzrmnErrcCkTBA11j1yT4e/eXuyUVWi02QxSIRYrQzGfi+LfQzX0Ota8109Baggm7f
	 vToT7mb1bCFEqYutl8v6ZqA9mhlOOkcl0LxqbCWC2fpUMQPVuakVShFBlS9m5T9vHkSJE
	 b+npmP9nyutQE4Nuf/09CVj1zigX+KwHFDS6YgfpuueGoPo1QKaoIqJLqRDgH7FnuCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=J2QPfoym;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788CD606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 788CD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=J2QPfoym
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cddc250d815so2458249a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:48:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632490; x=1796237290;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N5jZLQzl6Rjyl3tD3TPDN5KL+XFk1zne9SZ6/T5EhCY=;
        b=s0qvbKUfujwZBg9aW/axEG2T1hKKFi5wNNX8d/JqJW29PkMwR9+iBlSO/q+5U9xQn+
         UHeiFr6YZOgaI/aL7lqQi4GuW2MFZZ8OuE1u+TPYXKvGZFICgtfH/6US6HEUyJ08cW43
         SmbFdMRtiVjlMR4E+7QcXze72KjBD6TIZnL2O702pENBqB29p8k/c3ZOCgBsTZ4etCVF
         f7JdqjzA4vKPq3eSyHMUXvPk2Fq5G1bmKLZ1AxFDu3ujVFn5vE5kB+wY6xcuvqOyicTq
         dWs81O/SLmg4N58hkC/IPOuMQLVf9UaPaNxDqzuQeNVYcp4sFQxEbtxN0aV0YdGq+Xsw
         MWQw==
X-Forwarded-Encrypted: i=1; AL+hErHip22TbUYNbf1OmdGsDZVz8PqT0UjR5nukmbYFW7qMKt+ATj+av/TjuifY+EL+rLzuAkBBhcV+5p6o4mU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jKA0K2H00BVKGFJC+ajX2JWGdRdb6yhAzQwdEmTMMAwBBC1ff
	xQNAutcIKbwSwH6BS+qBTo0PYCJkWD3SjRQEulqGawGSlF68cBiJZzUo9MbfdVTFN9+wi0jXO0R
	YA9xpsOEHFx/+HRIDkti18kFnKGa4j84DqgmAbksBVnPuhru/NLS3sdQ+F0NrYpY9JuY0VBORs0
	JU2ZZHLAXdYdLSChTgNZWjRrYc8oEmre9y9kuGwbNt5OW+lBXqQ74EWrJfv42Z1ls3+adsOuhFb
	r/pgtEpND83GzPSFSaf
X-Gm-Gg: AZFdTZcvLk0uqdfBfUggMUa8SOaiK/WWgST76Z5T3Ssw0HrRJXl8jjmfsghJSf4u4x1
	vnbO5KCuNflc97TmL+EwQUm58fm8Ys+0BPpki5vog+1wu6Ljr7zgoSXVUkCM/fvrYOKaKLprvqF
	zEPPxLGqXwsrzyuZ9qA2K+gOXtge3UxfsQBlz5LmR+ULT1IXF68kyb3RQXZbNt4rRSvL6NC3KS2
	nFJ9g8hvTtmOlAT/L7/4Rz8/igXO5FMw8wNtqX5ay/n7g07XCYnsGP9h8SLiB0snFNAys674Y8W
	i25XxXNJkPhZeFYgLRdaniQqkgeqWkjqll9ae3O757FECRL7LLJmOcuGDUJxveAs2RB1gpSJzyF
	ZdWYmRFdggcwZES9sRgvkgher1Rb1JeYZq68PPqzKxVAFw7FBZu+XgXvnmm0NIpIzbf8Ius3Ka5
	iE6D/iOUSY0mP3s8MJTdqVzBqR9Ko0SEMJi313Y0k=
X-Received: by 2002:a17:90b:3f0f:b0:3b0:934c:5e41 with SMTP id 98e67ed59e1d1-3b41c9080e7mr22424991a91.29.1795632489389;
        Wed, 25 Nov 2026 10:48:09 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b42a5a2de9sm12441838a91.5.2026.11.25.10.48.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:48:09 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67de1a8a5e7so2215638d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795632488; x=1796237288; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5jZLQzl6Rjyl3tD3TPDN5KL+XFk1zne9SZ6/T5EhCY=;
        b=J2QPfoymkAU+v7WM/M5mGg3vTTTwKSH5boKoQo3MMF/4Yqha7p9t7JxXSw5cRZF30D
         TOdIhG6xNqDIYg8BjF2LruAZqMqbuDB5FNboR9+xNOV67N8gBjsRPB4/Oc+d5/2lThJl
         3S7+h9KtRWWIrkcx8jQPDH8si0XV7raOQmlgI=
X-Forwarded-Encrypted: i=1; AL+hErEjk319FmAu2D/fdWnGx13LaHkQhjTkSMl8snC9j6MxlNVdf4lILihquxafW75weyLTFdxAh8ENpGgciCU=@vger.kernel.org
X-Received: by 2002:a05:690e:14c6:b0:679:cc49:55dc with SMTP id 956f58d0204a3-67df44e0fabmr8353270d50.92.1795632488322;
        Wed, 25 Nov 2026 10:48:08 -0800 (PST)
X-Received: by 2002:a05:690e:14c6:b0:679:cc49:55dc with SMTP id
 956f58d0204a3-67df44e0fabmr8353260d50.92.1795632487725; Wed, 25 Nov 2026
 10:48:07 -0800 (PST)
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
From: William Zhang <william.zhang@broadcom.com>
Date: Wed, 25 Nov 2026 10:47:56 -0800
X-Gm-Features: Aa3M54ptQD7IVaeGdMWLNxnqSr7JMiJj7aEZdCT3YmX8Sz7Vy0I3dl8ho_mNAnM
Message-ID: <CAHi4H7HVNRnBynR2KLnxr=fpep=jkSBbE1NHvFr5e2DsvSTpjQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: bcm: support more than two CPUs on BCMBCA
To: Ho Jie Feng <hjf3108@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000a2011006611e446d"

--000000000000a2011006611e446d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi  Ho Jie,
On Mon, Nov 23, 2026 at 6:22=E2=80=AFAM Ho Jie Feng <hjf3108@gmail.com> wro=
te:
>
> BCMBCA Cortex-A7 SoCs can have more than two cores, such as the
> quad-core BCM6755. Extend the CFE SMP support to all secondary CPUs.
>
> CFE parks every secondary CPU on the same mailbox, and the wakeup SGI
> wakes all offline CPUs at once. Hold them in a pen and release them one
> at a time.
>
> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> ---
>  arch/arm/mach-bcm/Makefile         |  1 +
>  arch/arm/mach-bcm/bcmbca_headsmp.S | 26 +++++++++++++++++
>  arch/arm/mach-bcm/bcmbca_smp.h     |  9 ++++++
>  arch/arm/mach-bcm/board_bcmbca.c   | 46 ++++++++++++++++++++++++------
>  4 files changed, 73 insertions(+), 9 deletions(-)
>  create mode 100644 arch/arm/mach-bcm/bcmbca_headsmp.S
>  create mode 100644 arch/arm/mach-bcm/bcmbca_smp.h
>
> diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
> index fcc4e0174a..c3cd2959bc 100644
> --- a/arch/arm/mach-bcm/Makefile
> +++ b/arch/arm/mach-bcm/Makefile
> @@ -60,4 +60,5 @@ endif
>  ifeq ($(CONFIG_ARCH_BCMBCA),y)
>  obj-y                          +=3D board_bcmbca.o
>  obj-$(CONFIG_SMP)              +=3D bcm63xx_smp.o bcm63xx_pmb.o
> +obj-$(CONFIG_SMP)              +=3D bcmbca_headsmp.o
>  endif
> diff --git a/arch/arm/mach-bcm/bcmbca_headsmp.S b/arch/arm/mach-bcm/bcmbc=
a_headsmp.S
> new file mode 100644
> index 0000000000..3d0d0d97be
> --- /dev/null
> +++ b/arch/arm/mach-bcm/bcmbca_headsmp.S
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * All CPUs will wake up on an SGI. Wait in the holding pen until
> + * bcmbca_cpu_release matches the MPIDR.
> + *
> + * Based on arch/arm/mach-versatile/headsmp.S
> + */
> +#include <linux/linkage.h>
> +#include <asm/assembler.h>
> +
> +       .arm
> +ENTRY(bcmbca_secondary_startup)
> + ARM_BE8(setend        be)
> + THUMB(        badr    r9, 1f          )
> + THUMB(        bx      r9              )
> + THUMB(        .thumb                  )
> + THUMB(1:                      )
> +       mrc     p15, 0, r0, c0, c0, 5
> +       bic     r0, #0xff000000
> +       adr_l   r6, bcmbca_cpu_release
> +pen:   ldr     r7, [r6]
> +       cmp     r7, r0
> +       bne     pen
> +
It is better to invalidate the L1 cache for the secondary cpus
regardless of whether the bl does that or not.
> +       b       secondary_startup
> +ENDPROC(bcmbca_secondary_startup)
> diff --git a/arch/arm/mach-bcm/bcmbca_smp.h b/arch/arm/mach-bcm/bcmbca_sm=
p.h
> new file mode 100644
> index 0000000000..30055cf766
> --- /dev/null
> +++ b/arch/arm/mach-bcm/bcmbca_smp.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __BCMBCA_SMP_H
> +#define __BCMBCA_SMP_H
> +
> +extern int bcmbca_cpu_release;
> +
> +void bcmbca_secondary_startup(void);
> +
> +#endif /* __BCMBCA_SMP_H */
> diff --git a/arch/arm/mach-bcm/board_bcmbca.c b/arch/arm/mach-bcm/board_b=
cmbca.c
> index 248b8bd776..1afba1d680 100644
> --- a/arch/arm/mach-bcm/board_bcmbca.c
> +++ b/arch/arm/mach-bcm/board_bcmbca.c
> @@ -1,14 +1,20 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  // Copyright (C) 2024 Linus Walleij <linus.walleij@linaro.org>
>
> +#include <linux/cache.h>
> +#include <linux/cacheflush.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/of.h>
>  #include <linux/smp.h>
> +#include <linux/units.h>
>
>  #include <asm/mach/arch.h>
>  #include <asm/mach/map.h>
>  #include <asm/smp_plat.h>
>
> +#include "bcmbca_smp.h"
> +
>  #ifdef CONFIG_DEBUG_BCMBCA
>  /* This is needed for LL-debug/earlyprintk/debug-macro.S */
>  static struct map_desc bcmbca_io_desc[] __initdata =3D {
> @@ -29,16 +35,28 @@ static void __init bcmbca_map_io(void)
>  }
>
>  #ifdef CONFIG_SMP
> +int bcmbca_cpu_release __cacheline_aligned =3D -1;
> +
> +static void bcmbca_write_cpu_release(int val)
> +{
> +       WRITE_ONCE(bcmbca_cpu_release, val);
> +       /* Order release write before cache clean and wakeup IPI */
> +       smp_wmb();
> +       sync_cache_w(&bcmbca_cpu_release);
> +}
> +
> +static void bcmbca_secondary_init(unsigned int cpu)
> +{
> +       /* Let the primary processor know we're out of the pen */
> +       bcmbca_write_cpu_release(-1);
> +}
> +
>  static int bcmbca_boot_secondary(unsigned int cpu, struct task_struct *i=
dle)
>  {
>         struct device_node *np;
>         void __iomem *mailbox;
>         u32 release_addr;
> -       int ret;
> -
> -       /* CFE has already powered up CPU1 and left it waiting in WFI. */
> -       if (cpu_logical_map(cpu) !=3D 1)
> -               return -EINVAL;
> +       int release, ret;
>
>         np =3D of_get_cpu_node(cpu, NULL);
>         if (!np)
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
>         iounmap(mailbox);
>
> -       return 0;
> +       bcmbca_write_cpu_release(cpu_logical_map(cpu));
> +       arch_send_wakeup_ipi_mask(cpumask_of(cpu));
> +
> +       ret =3D read_poll_timeout_atomic(smp_load_acquire, release,
> +                                      release =3D=3D -1, 10, USEC_PER_SE=
C, false,
> +                                      &bcmbca_cpu_release);
> +       if (ret)
> +               bcmbca_write_cpu_release(-1);
> +
> +       return ret;
>  }
>
>  static const struct smp_operations bcmbca_smp_ops __initconst =3D {
> +       .smp_secondary_init =3D bcmbca_secondary_init,
>         .smp_boot_secondary =3D bcmbca_boot_secondary,
>  };
>
> --
> 2.53.0
>

--000000000000a2011006611e446d
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
PRi27wH/XHTDMdyL0Org+kxniXue6MSNJvcQwaLO/UQrmgTygBlVGa+Qg9ZFfS00xvuqeYH7tImO
48WiXeu9rgn5KTH0IWP1+R74KIgxJQ+65la+caZvxwC9V3ik5p/LOGA2qS4GEjGuaYF8QKhRTR4h
/QBSktqZLbzVxpjJXrqFTA2BLlYRp9hPhqNxbn46WuLufpMWhFtjUoQi/8fRRWRsMAY0o1J0f+kB
6EI8FoxPTOpvuLRonqHIWMHk5YRnDdqJ3G5Oc8zmV+UCAwEAAaOCAd4wggHaMA4GA1UdDwEB/wQE
AwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5Bggr
BgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUG
A1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUF
BwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDag
NKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJQYD
VR0RBB4wHIEad2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQw
HwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFHjI7pbQZurVKsSRE/a9
7gUEyVCkMA0GCSqGSIb3DQEBCwUAA4ICAQCFA4fU1GnG8sY7kyUXp5tle+VeWveoWb272jPauU5R
w+udkhVXmnR0Kg7RgkCD00PLTKHNRyegXXDMArs3N9NhO3s9eSp9KjDh+h3WuQWCJH3QBHLGW0qE
fyV87wUtBIy/QsHwO4S8OlOZiXECR7V1EGIF6t3s0W+3UzgYeHL+Ttuhda+2wIVY0EbS0eNH9Vob
4YG17VTBBe7hyobXFpd9d1JGENFzIWncPUshOE0Wv7KlkrRc6aBOpL4p5xO1pHi9h9w8utyHkMoV
nefXixkn5YVHnuV/jbSF/IM4Mlqt0E+n/TRp2c0eR+1AauZKENV2syNBo4aMa0BkmikBjLSnDjt/
TYQdwHNWdV495n71idvueWwTFUhUsnudYcnh42eZENopBOYjVu2WhsffyrNz0hsuR85LriqSuBbf
drd9DMo3DgtfJ7hh4sEAhSw/x/Br86rfLBftZMU02htlnkOI9Tp1QuDsr9+MsqY6AjKeXAy67m7H
TVAZ9uyO9N20yU0p7igESOWKR1ccL1TPA1jrSHK18Y75ot5199FNWeE/UKoDKSML39iPZho9XPh/
/RlsfRFiVOPrI5Gwi4YfIfi0jjEWf310/CYEmA5jrp5gUQSdo/+FgfXLKDFiEHCf5b3B1l70r6bR
WkDCNNacYJWZtSp87i6jmw+l5xx7OkEJ9DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAX
BgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1F
IENBIDIwMjMCDD2ooFIye/WiO3KgZTANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg
uY1zxS3At2LYq6rXOOKPAGt2d7mF0tkPQSYP/yKZcl4wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMTI1MTg0ODA4WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAEy0Z96Q59jz43d9uUk40mWy+8E0QgOgp1vH6
BCDilfTSLAeUThnias4GotPK1zRWWzsVwpKv6FWfixt3K61/Xy6dQ8RYaFstQcQNK/yVTL6pWZ2g
9sAQ8rv5rnsge8GJpDaU1d9wwmLAcWdUMCfznXPFZgqVbDDV276TZwn4tYh0PtBPUQNuzbHoyqEp
LQm1uyz1iuUNpfkGHVWdNy4hqOfu7cfiHrQ/hffAbm225nckdmfD/5sS3KEWVDfnQjvB7pLP3cAl
STocnFkd8DxFxRK5QmtgjX51vztrNNYgWeqLsIMyTLd56HbPDBjSqBBDnu7N4ix+xMlCaoSKpI+8
HA==
--000000000000a2011006611e446d--
