Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178576;
	b=K7volX5mXg2+u4/q75xEoS87lVABjuosQDEmM35NyabvkM5dQ7xFanqOh4pPdcQ+na1b
	 SYOh1x1rwAxnms3Qx0GTtKpKD8vNQNkSeWxPyz1H0Kr4o3x4l/rWdPOULcFFdNzUtMFrW
	 y1FEyAMrE/G+pXXwDV0ESCSJnIq9VVWZ9uGvtPtlZSBfCt9H12l6vsj+mqTLrUT9qgsGQ
	 +8xY2IF1SQZ/jrcx1gd/sNG5e9GHu0Osh8WUXf3W2GOGYYnSlqcJ8LwhTRP5W4gzPhHcp
	 brc/IoevR8gLo1M/xflaIcLdn28vwOBIGtdhpdb5eDNgnvGs3mwsk0q0cKxzuKYTy6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=iOoKME7Xey4HWkDa4Kr4VY5ssgP9qjXjOrF/wCFOTCE=;
	b=4CFBKdUg2mAoWv1H+yg3AHf70zgViCB/sWWE5ytAEwK15co/OB+Xq5I3UcU7iOMtfmEj
	 ehs4VG6STG4hxTIUajB9IVwbLaFPftULTHMh9ck/sfjqUEMCUlKZuzIkbEZDuUQs5iL0n
	 TPEuo/gQfVWCwEEcRlyfEfIIdawrKJX60H3666UyAl9qRP9e3EylF+2xhGD4jXMrTixkl
	 2ezjFko5+NlYpFGOw7RxO3iNV/q4HzmXkNhSCL/mD54h7QRL0zYHK5YJDvMNsE0TrSmim
	 crxM5sz8vD0xxECDn1VXaNUld3xqGQOse3YuMPwCSkaqSrXQUIrlL3TELerPRgyY3kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zo1L4G4E;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC8C606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EC8C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zo1L4G4E
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so7874155e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795178574; x=1795783374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iOoKME7Xey4HWkDa4Kr4VY5ssgP9qjXjOrF/wCFOTCE=;
        b=zo1L4G4EiUpI3rkdGclrRCVyfCVFT1TC6lfMOr8Ri9BZHIw6L6GLZfmz+FHrGZGWBB
         puW2OWyiOJSs9BuhNt8PduiO39XaQzktR0VpSbD9XKzNX2sxe5NIocMzy1zHDThqprIO
         dygKpAfwWy1O+rymPraJbMre3gmuS/ea5QRPFziPSQ2cjXJagv6H4H0vB/kPSCFVk8S0
         53hJ7s0BoOEtElTwf1I/1i5diioSpP801Eo4eWbRDxg/t32WCQ9gtTi3FIFn6CqVf7Qj
         RvslyNOhldMS0WAzVqjkm9m3t4JRA2DhMryWJb4YvUcVo4FA/BgWaChB4qkjMO3+YwbK
         o/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178574; x=1795783374;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOoKME7Xey4HWkDa4Kr4VY5ssgP9qjXjOrF/wCFOTCE=;
        b=zC6VFq8T1rDPLLMkHK5xA6NiwIJzMRxWXfxwjiM/XDb59cCHBDrByaWF0EQ/7+Y/Uw
         ScZs22m/kUcI68Pz/MzjxQnO8KH4odbDoIpSLkKgaS73ilA39Ruv84SR6D38hmQ5J4uq
         K3bW7Usi/obuBycXijEgT7O1MZsecWKgYDzjZGgKi7meMM55SDlOVxJktypTrr9ispPO
         AOq3wAO8mkg/MeivRktTFKRZvkWoa/ELpsTAIy7yiWXDsRo8feghHj2gh8L/4NUhuTNq
         TNZ5579EHSEsS1utqhhebtDPDFXsSRYgZ1hTVj4H+6qkdmFxZOfcI/PC/rUbZOvQKCaV
         jYnw==
X-Forwarded-Encrypted: i=1; AL+hErFeYHzKUISxWJP+j0cguxu3WEZDoSAAcq/a6dN2QHuwXRdAjLq3zhCBpxQg0YUEEz0AZfghWYUiPE1grqw=@vger.kernel.org
X-Gm-Message-State: APuU4Z89ZAW+uwhIJyRPXgfLwtxhQt5/W0nq/KbTmNTsDOCXqD3aOAf4
	EwT28Y/syizoZkGKmGUHOczXdSMa2Xya+q0rzOLZd3crykogG2LgjMGS
X-Gm-Gg: AYBFou0wJs4f64tzEjm122bFURxFoNEVuBmaOTdqrY56vARc1vPefuE9RP7DLammi2v
	Q6emRpL96IV1U3Ht+j3n+wIyMNHMphAjz/Pr3mSN0xg/ap2nEd3PSiijnRUZvOoQf3ccPwe8idU
	OQEk9ZWhawl3ZCY8lnPBS4BXmgsw2Lsuor7w6REsEyJUrzIROEkn7zOVKF3I4O8PkfcZ0Egu+PD
	+NAYVEm1ccTqQoJeWqSVneeg49ezXQC5MGb0TI8AfdKc+3h8fooLjMxuf9FQiQ5NA/J4NhlWp6P
	wqIHvsaRQMF2x3Ohg7O9aakixHSq0auyisfnoj1emKnmUH8PibylRdGfL2+0vInzRioUy+Dqo5K
	6uoVYas98qi2S2cv7HMlBDOhUdtL1TyIEQGiepNN+Tf9eO4cNWTWoeXZJ4NkoMDiEMLPD9t+8Dt
	M8BJmsPKy05pNi1GJSjJzUpnN/IDjRnnpaQxAxJW/92CR+xnGfXDGqXg/xWXOW0w95+PPbXi6wK
	U9eeMVZJ3l5RppNvfGg2UhiKNGzZcfZW1H8AB9+SZmOa5c4YtAv0cGTMsueyJDOksY3oDDwWEp5
	ysNgVYNClcHkcCSoDsmPDZDs9D4Mzz2gH1WN5izc6D2aZsQepb6Sgk4v5o+0ohetZjw=
X-Received: by 2002:a05:600c:3ba3:b0:4bb:7571:5743 with SMTP id 5b1f17b1804b1-4bb88813444mr69928975e9.27.1795178573835;
        Fri, 20 Nov 2026 04:42:53 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f278dsm37666745e9.0.2026.11.20.04.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:42:53 -0800 (PST)
Date: Fri, 20 Nov 2026 12:42:52 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Usama Arif <usama.arif@linux.dev>, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, kees@kernel.org,
 hpa@zytor.com, gustavoars@kernel.org, ardb@kernel.org, hca@linux.ibm.com,
 nathan@kernel.org, morbo@google.com, justinstitt@google.com,
 linux-hardening@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, riel@surriel.com, shakeel.butt@linux.dev,
 kernel-team@meta.com, rkeilty@meta.com, atish.patra@linux.dev,
 dgreid@meta.com
Subject: Re: [PATCH 2/2] x86/kstack_erase: Use REP STOSQ for large stack
 fills
Message-ID: <20261120124252.14ff8a74@pumpkin>
In-Reply-To: <20261120113825.234bee1c@pumpkin>
References: <20261119213147.1094488-1-usama.arif@linux.dev>
	<20261119213147.1094488-3-usama.arif@linux.dev>
	<CAKwvOdnzNU_xtLeb4vXSFe3DLN9QmdNSSReUmQahsLX+1pZxCw@mail.gmail.com>
	<20261120113825.234bee1c@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Nov 2026 11:38:25 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Thu, 19 Nov 2026 14:28:04 -0800
> Nick Desaulniers <ndesaulniers@google.com> wrote:
>=20
> > On Thu, Nov 19, 2026 at 1:32=E2=80=AFPM Usama Arif <usama.arif@linux.de=
v> wrote: =20
> > >
> > > With KSTACK_ERASE, every return to user space poisons the part of the
> > > task stack that was used since the previous return. The generic
> > > __stackleak_poison() does that one word per loop iteration, so a sysc=
all
> > > that went 1-2 KiB deep pays for 128-256 separate stores. On Meta hosts
> > > running many small VMs, stackleak_erase() accounts for about 1.5% of
> > > non-idle host kernel cycles.
> > >
> > > Override __stackleak_poison() on x86-64, as s390 already does, through
> > > the hook added by commit 491a78663e03 ("stackleak: allow to specify a=
rch
> > > specific stackleak poison function"). Fill spans larger than 512 bytes
> > > with REP STOSQ and keep the word loop for shorter ones, where the fix=
ed
> > > startup cost of REP STOSQ does not pay off. REP STOSQ starts to win at
> > > about 300-400 bytes on Zen 5c and Cooper Lake, so on both no span gets
> > > slower.
> > >
> > > The fill is inline asm, so the noinstr function still makes no calls.
> > > memset64() would be the same instruction, but it is only static inlin=
e,
> > > and with KMSAN it is an out-of-line function.
> > >
> > > In a Zen 5c KVM guest, stackleak_erase() got about 35% cheaper per re=
turn
> > > to user space (71 ns to 46 ns, scan included) over a futex, epoll, pr=
ocfs
> > > and Unix socket syscall mix. Same-vCPU futex wake/wait and Unix socket
> > > sendmsg()/recvmsg() ping-pong round trips got 5-8% faster.
> > >
> > > Signed-off-by: Usama Arif <usama.arif@linux.dev>
> > > ---
> > >  arch/x86/include/asm/processor.h | 25 +++++++++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > >
> > > diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/=
processor.h
> > > index 77488ff5eb8c7c..049231d484ad0e 100644
> > > --- a/arch/x86/include/asm/processor.h
> > > +++ b/arch/x86/include/asm/processor.h
> > > @@ -580,6 +580,31 @@ static __always_inline bool on_thread_stack(void)
> > >                                current_stack_pointer) < THREAD_SIZE;
> > >  }
> > >
> > > +#ifdef CONFIG_X86_64
> > > +#define __stackleak_poison __stackleak_poison
> > > +static __always_inline void __stackleak_poison(unsigned long erase_l=
ow,
> > > +                                              unsigned long erase_hi=
gh,
> > > +                                              unsigned long poison)
> > > +{
> > > +       unsigned long count;
> > > +
> > > +       /* Short spans do not amortize the startup cost of REP STOSQ.=
 */
> > > +       if (erase_high <=3D erase_low + 512) {
> > > +               while (erase_low < erase_high) {
> > > +                       *(unsigned long *)erase_low =3D poison;
> > > +                       erase_low +=3D sizeof(unsigned long);
> > > +               }
> > > +               return; =20
>=20
> gcc 13 onwards makes a meal of that - https://godbolt.org/z/KPP4h8xz6
> It does manage to unroll the loop once - which is good because the intel
> cpu (I've got) won't execute a 'one clock loop' (the zen5 will); but the
> setup code is horrid.
> But I also think some of the more recent cpu can execute more than
> one write per clock.
> If you unroll the loop 4 times it may run a lot faster.
> Perhaps:
> 	long count =3D (erase_high - erase_low) / sizeof(unsigned long);
> 	if (count <=3D 64) {
> 		while ((count -=3D 4) >=3D 0) {
> 			*(unsigned long *)erase_low =3D poison;
> 			*(unsigned long *)(erase_low + 8) =3D poison;

The add (probably) needs to be in the middle...
 			erase_low +=3D 32;
> 			*(unsigned long *)(erase_low - 32 + 16) =3D poison;
> 			*(unsigned long *)(erase_low - 32 + 24) =3D poison;
> 		}
> 		if (count & 2) {
> 			*(unsigned long *)erase_low =3D poison;
> 			*(unsigned long *)(erase_low + 8) =3D poison;
> 			erase_low +=3D 16;
> 		}
> 		if (count & 1)
> 			*(unsigned long *)erase_low =3D poison;
> 	} else {
> 		...
> 	}
>=20
> Except that gcc makes a mess of it again.
> I don't think the 'erase_low +=3D 32' is going to execute at the
> same time as the last (two probably) writes so costs a clock.
> So it may need to be asm.

I threw in enough OPTIMIZER_HIDE_VAR() to stop the optimiser breaking
the code. https://godbolt.org/z/nx477T4M1
gcc then generates:
        movq    %rdx, (%rdi)
        movq    %rdx, 8(%rdi)
        addq    $32, %rdi
        movq    %rdx, -16(%rdi)
        movq    %rdx, -8(%rdi)
.L32:
        subq    $4, %rcx
        jns     .L22
for the code loop (clang is a bit worse - but should be ok).
I think that will be a 'two clock loop' on cpu that can do
two writes/clock; zen3 and ice lake).
For 'stack splatting' rounding up to a multiple of 32 bytes
will save all the 'remainder' code.

David

>=20
> > > +       }
> > > +
> > > +       count =3D (erase_high - erase_low) / sizeof(unsigned long);
> > > +       asm volatile("rep stosq"
> > > +                    : "+D" (erase_low), "+c" (count)
> > > +                    : "a" (poison)
> > > +                    : "memory");   =20
> >=20
> > Surely this isn't the only place using `rep stosq` in the tree, right?
> > It's not, see memset64 in arch/x86/include/asm/string_64.h. =20
>=20
> Which seems to have very few users.
> memset_p() and memset_l() have almost no users.
>=20
> David
>=20
> >  =20
> > > +}
> > > +#endif
> > > +
> > >  #ifdef CONFIG_PARAVIRT_XXL
> > >  #include <asm/paravirt.h>
> > >  #else
> > > --
> > > 2.53.1-Meta
> > >   =20
> >=20
> >  =20
>=20

