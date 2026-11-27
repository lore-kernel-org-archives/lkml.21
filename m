Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747760;
	b=NHurWA2/xPJzqxxnqoEu1AIRndOJnvidQtdIdo+lm5ioAPHrofgRzvEU7o3prl0pb06L
	 sKrXwXMVJnvEKNothgoooEAAYepDM25WLDdl6V+ZJBzptXu5FPsp/eJjZwRP0Qk+w/w1Z
	 5/e8/ZeOub1mfyv4ltksa+hYE+n2pOAaMj6+BIdteJU9KLqxZL3wN/h3fpN03NYMmtUhf
	 9LwTjD8lXjsMC0PdC7Hy/pVX87ra7N0iRiiLj3kzbHlturGhv1ZTegQzk+HRZLWSj+tyl
	 3TGWYUwmf7YSBitjANnOem5nwsnDI+NRHa9ReaogMRbos7uGdMM6PqiTgmvCMyJsK+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747760;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=OSiCGm4VGRlHMeYtUonyYNFZ604+r2PFDFasU3N6ghk=;
	b=SaPSi3mcQm0/sKo1xz5pBH3EBzVaVQ0qnsIFKd6bhg8THGUIWR/xbSCJe8dFqMw2FyeJ
	 obz5Yiw/jCP0d+8S3Ue8odtNNGeJRXt06D0gjLUvwl2wzoXiMOEk6qoy3SmsOfmAZDR1Z
	 Z7AJ29OICG0pgQeliNJONhpeNwzGR5Qh6WVKiSg/+MmFaqGhZH8vjneA+HVyY7jGu9wIJ
	 NyY5xGK+WUNEbDIWBmxwl6iqUEGFBt0+q2k6VHoA4ZCRtOeM75qzjTR8L4fdCupemnKCR
	 i/m4PZYMIPDuAB1HW1ghyZWl6Ijk7lg1CJkjzBS5u2HfqeHnCNn5xGImVLkzBT9lhTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=B4Fq56sd;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1D3606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A1D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=B4Fq56sd
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so3534671a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:49:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795747760; x=1796352560;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OSiCGm4VGRlHMeYtUonyYNFZ604+r2PFDFasU3N6ghk=;
        b=ZMN0AEZJgFqQXRFa3urr68KAhqYJDYQHbBVYR8OIqUgMOuo+dyh5pNH70lQYyrsbHM
         ffWTFE2gKYeRAYGWZ8KZ+7UhL9GD7gAmxevaIJ7vpa6z9/0MVYh+zbPmTI1G4+FwnCJp
         p14p0ehql259D46UzoSwdLvQx4Rf2MpZvaaa+hyQjwg9EXRjIytEq82OiSP9ZluvCd1o
         gQUa8ZMTNO4mENrjY6tuJfEHifYx9hNte0WXu7dtQq2VUqXNuLgWdVUZ6oPhHjdg2Sk1
         vYnobde45vKEk9K0F7Fo0KvuSfn4PGnnaRUeAmXIBF6hN3ZJipNPydp7A2P4atxHMJns
         0aNw==
X-Forwarded-Encrypted: i=1; AL+hErGVyjA/Gu1dq9WsnmF2wj0eU0exMKQEV6HTXQHawQ3dX1rdL4DljEDZ5jGfniUdTF/5kPXt3sa3Mn7m50k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wnUuWNWuAyLCMaf/hCnsF9YLQAhzOQRnTKTxlCLjSUnzURhE1
	QTUU429IvYvfZc1SrUwPEXZxsiT0G9R26s3kRPMwjmY+XFvOiKjlPWd1F24nWno1O95imU3Kqr0
	2aCScD9U0iG9xAstIjUlTY7nO1144Rf8vHycDaO1YOPm3FLGD2+HytF87daZWEnFeDg89DhEXpR
	W+53PZYcsr1bNAWWv15hyklwJhGQmcxsIAot6di9wZW2v+aLwK1un82Zmr/kF8U05LTMq2KnfAR
	Sg1i4L64H+SiGPY7gd9
X-Gm-Gg: AZFdTZdtnQYC05cZYDOeHJaAqWKHvxLenLxsa0GvDt8gizFbJzfAWYzacL/LSK3vVC4
	yuzH9WdHtlr3TntUHRPqH986xSb+95uOc7xNjl0WY2g6SD3uS41GvPX+Z+EI0THro+wcPxygmaD
	b5NIPUOEcdS/R+xZi5cIiV1/vYQeCfPifoyog408LuK1LLO0BhE1mUuzok15EUfFhZ0mCmnWunz
	ok8C2VTZC7ewmZr8cARAgbk/WCDqMC50SURrJmaP6cjF1iV+JlBGpaNZehngRFR7RhIJQVAhkpR
	YXwdE39l2YLtMapi2pEg0k6KuFZa8b7268AmH9ongFpO+2U8Dnh8C4/uExgMgKZQ+yIS9arpaIS
	UrkNd3VGVaGjMSh0/i+bl/K5ntW0wROw3PfcqZPYOYFoH+AFBfs3oJWSB6sRLmVmAALEho6TaIj
	rORfmDftH6USkQViLh9yCYoKJHNbtdsbLPQOofBj0=
X-Received: by 2002:a17:90b:4ec4:b0:3b3:bf8f:9ccb with SMTP id 98e67ed59e1d1-3b41c8ffa94mr19664306a91.18.1795747759363;
        Thu, 26 Nov 2026 18:49:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41add899dsm15548114a91.3.2026.11.26.18.49.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 18:49:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-677c4ca2265so11814202d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795747758; x=1796352558; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSiCGm4VGRlHMeYtUonyYNFZ604+r2PFDFasU3N6ghk=;
        b=B4Fq56sdPOpWVtKV8xUfrzcwwK39GGV+kx53JDiY4rXsEpyFa6qPEg1VUcmkW9ly93
         cygFJ5exlRZr7omErFLPKBupv8yJSdDq0nHEsmXcj8hvg486GPNmaicE2hC1r9bW5tR6
         FNaMu84oHg01Cqra4GXV3B1lmItpM7GCdg1Ow=
X-Forwarded-Encrypted: i=1; AL+hErGb6Jnf0Fc9PNwpRGG57jJGHQCNT8ZWtnXxuoG1Re0ijSWD2i2KGkdAic1/nZAzL8AtGk0EDL5lZ0itBJw=@vger.kernel.org
X-Received: by 2002:a05:690e:4282:20b0:67d:b299:df55 with SMTP id 956f58d0204a3-67df44c44d1mr6507971d50.77.1795747757656;
        Thu, 26 Nov 2026 18:49:17 -0800 (PST)
X-Received: by 2002:a05:690e:4282:20b0:67d:b299:df55 with SMTP id
 956f58d0204a3-67df44c44d1mr6507958d50.77.1795747757215; Thu, 26 Nov 2026
 18:49:17 -0800 (PST)
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
 <CAD++jLmHRkL7Zmw7VrV-UFo14nwgMTLB3UVA15vn9JWsvrXQfw@mail.gmail.com> <CABOQOSWT8pFPEECEfH6oR9yQT1_-_QU-okJGOGgdm_k9G=Ft6g@mail.gmail.com>
In-Reply-To: <CABOQOSWT8pFPEECEfH6oR9yQT1_-_QU-okJGOGgdm_k9G=Ft6g@mail.gmail.com>
From: William Zhang <william.zhang@broadcom.com>
Date: Thu, 26 Nov 2026 18:49:03 -0800
X-Gm-Features: Aa3M54oHRS2J9X8iudMbAVZuiZwxMusKg2Lbj_K1yS1jEnbd2KoeRXCi4s-jAwo
Message-ID: <CAHi4H7H+=WiAXhDQPRP9epDtzOWFZ+UcMLPVO9L=9E6F6bpNWg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: bcm: support more than two CPUs on BCMBCA
To: Jie Feng <hjf3108@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000038ce520661391baa"

--00000000000038ce520661391baa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jie,

On Wed, Nov 25, 2026 at 7:06=E2=80=AFPM Jie Feng <hjf3108@gmail.com> wrote:
>
> Hi Linus,
>
> On Thu, 26 Nov 2026 at 05:01, Linus Walleij <linusw@kernel.org> wrote:
> >
> > Hi Ho Jie,
> >
> > thanks for your patch! It's nice to see others building on this
> > idea, for a while I thought I was the only person in the world
> > who care about BCMBCA upstream.
> I'm also trying to boot OpenWrt on a BCMBCA router and already got
> many things working. Going to send the dts upstream soon.
>
> > On Mon, Nov 23, 2026 at 3:22=E2=80=AFPM Ho Jie Feng <hjf3108@gmail.com>=
 wrote:
> >
> > > +++ b/arch/arm/mach-bcm/bcmbca_headsmp.S
> >
> > > +#include <linux/linkage.h>
> > > +#include <asm/assembler.h>
> > > +
> > > +       .arm
> > > +ENTRY(bcmbca_secondary_startup)
> > > + ARM_BE8(setend        be)
> >
> > Are you aware about any people booting these platforms
> > in big endian? I don't think that works, just skip this.
> >
> > > + THUMB(        badr    r9, 1f          )
> > > + THUMB(        bx      r9              )
> > > + THUMB(        .thumb                  )
> > > + THUMB(1:                      )
> >
> > This code is for the CPU to switch from thumb mode to
> > ARM mode if it was booting in thumb mode. Does this
> > actually happen in practice? Else you can skip this too.
> > It just looks overly cautious.
> I am not very familiar with how bcmbca is used. Since these kernels
> can be booted by CFE and I do not know what kinds of CFEs or
> bootloaders are there, I left that in.
Neither CFE nor u-boot bootloader on these chips use thumb mode.

>
> > Also the ordinary secondary_startup_arm does the same things already!
> >
> > > +       mrc     p15, 0, r0, c0, c0, 5
> > > +       bic     r0, #0xff000000
> > > +       adr_l   r6, bcmbca_cpu_release
> > > +pen:   ldr     r7, [r6]
> > > +       cmp     r7, r0
> > > +       bne     pen
> > > +
> > > +       b       secondary_startup
> >
> > And why are you first spinning on the GPIO address
> > and then spinning again in this "pen" (as a place for
> > livestock, such as CPUs ;) it was added to mach-versatile
> > to work around a CPU bug in early silicon.
> >
> > As Russell King writes in 2018:
> > https://lore.kernel.org/linux-arm-kernel/20181213175952.GC26090@n2100.a=
rmlinux.org.uk/
> >
> > > The "pen_release" thing was created for ARM Ltd development platforms
> > > where there was no way to individually control secondary CPUs leaving
> > > the boot loader - they all jumped to whatever physical code address
> > > was supplied at the same time.  This made it necessary for _these_
> > > platforms to have a "holding pen" for the CPUs while the kernel
> > > initialised.
> >
BCMBCA SoC is not subject to this silicon bug.

> > The "pen" is only needed if all CPUs jump to that address at the same
> > time. I don't think the BCMBCA platforms do that because you send
> > one IPI to each CPU?
> I can experiment with that.
>
> > So I would skip this assembly completely...
> > I don't understand why you're doing this other
> > than copy/paste?
> >
> This is obtained from the vendor source code where there is also a holdin=
g pen:
> https://github.com/Asuswrt-Merlin/asuswrt-merlin.ng/blob/main/release/src=
-rt-5.04axhnd.675x/kernel/linux-4.19/arch/arm/plat-bcm63xx/platsmp.c
> https://github.com/Asuswrt-Merlin/asuswrt-merlin.ng/blob/main/release/src=
-rt-5.04axhnd.675x/kernel/linux-4.19/arch/arm/plat-bcm63xx/plat-ca9mp-heads=
mp.S
>
>
> > > @@ -58,17 +76,27 @@ static int bcmbca_boot_secondary(unsigned int cpu=
, struct task_struct *idle)
> > >         /*
> > >          * The CFE stub reads GPIO GeneralPurpose after an interrupt =
and
> > >          * branches to it in ARM state. Clear any Thumb function poin=
ter
> > > -        * tag and complete the MMIO write before sending the wakeup =
IPI.
> > > +        * tag and complete the MMIO write before opening the pen and
> > > +        * sending the wakeup IPI.
> > >          */
> > > -       writel(__pa_symbol(secondary_startup_arm) & ~1, mailbox);
> > > +       writel(__pa_symbol(bcmbca_secondary_startup) & ~1, mailbox);
> > >         dsb(sy);
> > > -       arch_send_wakeup_ipi_mask(cpumask_of(cpu));
> >
> > Have you actually tested *not* changing this code and see if
> > all CPUs just come up? It should just send each CPU in order to
> > secondary_startup_arm like we want?
> I traced the code to drivers/irqchip/irq-gic.c, since
> arch_send_wakeup_ipi_mask will eventually end up there.
>
> - Line 1248-1253 every gic_cpu_map[] entry is set to 0xff
> https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/irqchip/irq-gic.=
c#L1253
> - Line 836, 845 the driver ORs the map, so IPI get sent to all secondary =
CPUs
> https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/irqchip/irq-gic.=
c#L836
>
> Since this platform is booted by the CFE and not using PSCI, I decided
> to use the vendor source code since it looks like the safest option.
>
The Asus-Merlin code you referenced is not too old and it supports
PSCI by default with u-boot instead of CFE. See psci node in this dts:
https://github.com/Asuswrt-Merlin/asuswrt-merlin.ng/blob/main/release/src-r=
t-5.04axhnd.675x/kernel/dts/ip/bcm_cortexA7_quad.dtsi

If  Asus-Merlin still uses CFE, it is fine but the
plat-ca9mp-headsmp.S code for non-PSCI CFE boot is bit out of date,
although it still works. However, we don't use it in our production
which uses PSCI.
It should be replaced by kernel existing secondary_startup_arm
function as Linus suggested and should work. And you correctly pointed
out that it also covers the l1 cache invalid.

> > Yours,
> > Linus Walleij
>
> Best regards,
> Jie Feng

--00000000000038ce520661391baa
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
h/MQnSVp7hxQh+pWD/s0l6Xdgl+kxvcdfm35zsnIZBUwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMTI3MDI0OTE4WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAjkMxyHPklthNoiA5D5cqHWdMeu47udjqFlD5
wvLoX+WWAd00Adxc9B6jKBTtQIqg7NNMhBEv4kJeNc6eL632Gq1aOV/MbUVrjMbsouf5T2f87DfJ
s8/yKHcSaCglKwXLsBYLbbeTBwbYCj++7I1/D2fZ4uuDI8xTcfXTLyjgky6mb6t0oKD6Igy1s9mv
LIPNDEAYMnffGYAitPEbV8Qrda2LBxeeA6u6YncuDBz8rsT9JIsluGZr39epqDMlwwf+QaVjoBWB
Cx/pvNhBjnCVM0FIF6DTrX5lpbykcavT8DruECNv8V1FORzob1igMdl89UFvfHV5K6z9mXoeFkX0
Uw==
--00000000000038ce520661391baa--
