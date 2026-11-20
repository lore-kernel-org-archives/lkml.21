Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795211067;
	b=PTndyHcduoExFINztcay6TVz81EpTRMm2fj3jLokvpPFZcc/wh3wM/W1KT5tQEtct72v
	 l30im3JPBfJDsScbh3ij30lTvQ/MKL7BKFHFc6NW6YqwOuCKuphQzgzwpnNRkdoHFl+1n
	 WTwoke5N8j1I6QKYBTR9mwRE4f+so7ImADDocM8CoJQWZ5fKuXhxhaUhgAAzb3tCfGQTM
	 ryN64AAVgIRr49upjv/fIyPfNAb/KaoweEKNDe1lTO404VOsavJImU0BCUD5wIKPEPMaO
	 nfMap62leH/V9YYuoaNNA1FYFPLE/K5qiTFVsjOe2y0vozaFFl6ewup+pZfOhGqNqCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795211067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rXcNRQCIOSxwLtGXJnstBt6P3fFtFAxQQPTFjcsDhnA=;
	b=glFx0SyZED1y2siwtfSgIMhRS4Y1tiXj9YzBPAKYFHIisoMQyN/Y+pvsO47FJka2BK27
	 n2hCr8Atyu8KmuMvIjaO84iogtN8+KYcIsfPeN2xRSKMIv+dstaa0zBgJ/PsGbXezjGpZ
	 sEJhME0lTtrXJh31PDW516LUdp5UDbfPOZp92IeUkxTLtBSa/YnLs1yHNmjINAT4xUgx5
	 OmBhFUw+WdOdQmSzZrT829p6GAh/8AY17gQ9SrHPhTyohfuaEOk8V3mVTNiSiyF+tAb6+
	 iaRkFIhXZvr2PatC+OGXZCd8rOPL+uU1SuSL1IFj2SfBELg5bOyCLTRXGaFksI8cNvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aaE2m7Do;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FB3606A6A9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16FB3606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aaE2m7Do
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d05d51553so10118175e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795211057; x=1795815857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rXcNRQCIOSxwLtGXJnstBt6P3fFtFAxQQPTFjcsDhnA=;
        b=aaE2m7DoQJh6eGOLhWM+gaySpD+JUViVs4QmPHM0Tflg42yuhXUtK5vy+yVVlAF2/O
         kx/lsqWZcJ+bpbs10W1S+FpvIZ28/Fem6m967lymXET9nK++93s1F0GOQV9rLAKQddx5
         KGQ1R8/JrutIbsYZfJ9kaMMk9nppMXkxZh7Kg9cxcwiUPQQKrDrwRd+z0tNqN5b0bS/G
         /D7lMV0n7I3CwSsa5TbVyP8vqCsVyPewShsyoctg/xJkV93nrbByiEgf3GvBsAdk70K1
         hcpPgIW3VqzVJ0k+twihaDcxmO4jyvV7XLMyglH81bQGeF2uNTpwLeEbQ43xsR9I0k2r
         qUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795211057; x=1795815857;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rXcNRQCIOSxwLtGXJnstBt6P3fFtFAxQQPTFjcsDhnA=;
        b=clWbG+4QkBerQTlbcpo7lKbKguw6aDN22nE7v8Q7ezoNtjkfULDM+LOdZD3tPSehFq
         eVwTuZQguMdpJAVD5z5yuLHJgvERUTBm2MUkoaM7HFZYnL4oUvXvDB9QW+yova9+8gEi
         qfzutGKHTzottXnGuO4df6C0ouw7ZfzxqVkXLZ8QDNhVvkiKnWS4ctX5D0o4g51kaQzN
         ZhPLf6uXDdYhlmnMU0mSPKZ4mNE6b9cNwPafDtb6fpIT4EbT3/8BX2wITf6+DDhui5rB
         lSpnt+hWqgwTPYWAyXpZaykXPat3SQ5XSeAbbUsm++qK6UroMDNURql599m2KUHOeIwp
         ONUg==
X-Forwarded-Encrypted: i=1; AL+hErHDn9qZaDISEQV5qKjaHlOjqrLek6LnaV2NdOw5JXtJ+zOSSZFsf3hkjYFgY8RZ8e8dSgGJTQaOnqKsQhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eR0pekkuEfjz5KILdmccrxDKBwG7iRHwwVEZIkJw4Xst+zxba
	o/AjhBEKTu5lxT/com8zWk+GG69/bBbJS1XYLfmsvqd9Qy2iOQbYGzCD
X-Gm-Gg: AYBFou07AIZOKVvgHBCDX8mJLzHMnieRO8I64VNSQRV60J/bUiT25A6Mjn33FofFXZY
	zBP76KgG6gIy3vfarPdZa9nQjkFGLA3uIsfq0NFZDXobwty/zB9cMG8149DWqDB6Rp0yaOotf/D
	ZY80aIbALR1JjWSEZMRAsWM02cmhat0DzLyAzTrglkYfPIA9nlJpuLewYe6NoHFveAqUwX8IGex
	xUvFhR+XQK7pLqHwMn6gKrGfI4+dcHg+EFOP+pp6hXS2aGFMxmDNKIqCMaUx8b+wKNhuCxktiyi
	CulA1qa2QkWovuSScVJdlil8ax44b4XqlgA3iCNAdcLPMT2uGWQFDayn8337+V7hoxWvFE6lVQn
	P7P+jTqrRuvVySHXNUjwOeglWcsYETWbW9I4WPeISQqzcBfyYDiyXj7jRL1vqr1UzGprTWCkCD2
	e/zGEVEmXPalDPHVF5D8uH3XaYGW9IksbcXUsZNFvyTEBbxaZb5bklImZ5kCirmGicOwVYz0lxE
	GITkarsoxy713xnBvqsJyjWOU8zMwQndxdP7ok09shfn6JzVg6lKozdGF0E2XUcSqd6NnLbVKZp
	eP0Kxl4+OUfy8K1j80WEYODvdMQ+IrVM//pQJBn7kLk3Z3M3F9WSfKvz9P9BuHBu9RHvd9AnzeG
	S8LJLB0UmdLI=
X-Received: by 2002:a05:600c:820d:b0:4bb:6cef:d14b with SMTP id 5b1f17b1804b1-4bb887c34f1mr109184455e9.2.1795211057153;
        Fri, 20 Nov 2026 13:44:17 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm161429175e9.14.2026.11.20.13.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 13:44:16 -0800 (PST)
Date: Fri, 20 Nov 2026 21:44:15 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: Nick Desaulniers <ndesaulniers@google.com>, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, kees@kernel.org, hpa@zytor.com, gustavoars@kernel.org,
 ardb@kernel.org, hca@linux.ibm.com, nathan@kernel.org, morbo@google.com,
 justinstitt@google.com, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, riel@surriel.com,
 shakeel.butt@linux.dev, kernel-team@meta.com, rkeilty@meta.com,
 atish.patra@linux.dev, dgreid@meta.com
Subject: Re: [PATCH 2/2] x86/kstack_erase: Use REP STOSQ for large stack
 fills
Message-ID: <20261120214415.060e8375@pumpkin>
In-Reply-To: <97e94491-ce19-45a1-8737-b30b49e997e8@linux.dev>
References: <20261119213147.1094488-1-usama.arif@linux.dev>
	<20261119213147.1094488-3-usama.arif@linux.dev>
	<CAKwvOdnzNU_xtLeb4vXSFe3DLN9QmdNSSReUmQahsLX+1pZxCw@mail.gmail.com>
	<20261120113825.234bee1c@pumpkin>
	<20261120124252.14ff8a74@pumpkin>
	<97e94491-ce19-45a1-8737-b30b49e997e8@linux.dev>
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

On Fri, 20 Nov 2026 18:46:01 +0000
Usama Arif <usama.arif@linux.dev> wrote:

> On 20/11/2026 04:42, David Laight wrote:
> > On Fri, 20 Nov 2026 11:38:25 +0000
> > David Laight <david.laight.linux@gmail.com> wrote:
> >  =20
> >> On Thu, 19 Nov 2026 14:28:04 -0800
> >> Nick Desaulniers <ndesaulniers@google.com> wrote:
> >> =20
> >>> On Thu, Nov 19, 2026 at 1:32=E2=80=AFPM Usama Arif <usama.arif@linux.=
dev> wrote:   =20
> >>>>
> >>>> With KSTACK_ERASE, every return to user space poisons the part of the
> >>>> task stack that was used since the previous return. The generic
> >>>> __stackleak_poison() does that one word per loop iteration, so a sys=
call
> >>>> that went 1-2 KiB deep pays for 128-256 separate stores. On Meta hos=
ts
> >>>> running many small VMs, stackleak_erase() accounts for about 1.5% of
> >>>> non-idle host kernel cycles.
> >>>>
> >>>> Override __stackleak_poison() on x86-64, as s390 already does, throu=
gh
> >>>> the hook added by commit 491a78663e03 ("stackleak: allow to specify =
arch
> >>>> specific stackleak poison function"). Fill spans larger than 512 byt=
es
> >>>> with REP STOSQ and keep the word loop for shorter ones, where the fi=
xed
> >>>> startup cost of REP STOSQ does not pay off. REP STOSQ starts to win =
at
> >>>> about 300-400 bytes on Zen 5c and Cooper Lake, so on both no span ge=
ts
> >>>> slower.
> >>>>
> >>>> The fill is inline asm, so the noinstr function still makes no calls.
> >>>> memset64() would be the same instruction, but it is only static inli=
ne,
> >>>> and with KMSAN it is an out-of-line function.
> >>>>
> >>>> In a Zen 5c KVM guest, stackleak_erase() got about 35% cheaper per r=
eturn
> >>>> to user space (71 ns to 46 ns, scan included) over a futex, epoll, p=
rocfs
> >>>> and Unix socket syscall mix. Same-vCPU futex wake/wait and Unix sock=
et
> >>>> sendmsg()/recvmsg() ping-pong round trips got 5-8% faster.
> >>>>
> >>>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> >>>> ---
> >>>>  arch/x86/include/asm/processor.h | 25 +++++++++++++++++++++++++
> >>>>  1 file changed, 25 insertions(+)
> >>>>
> >>>> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm=
/processor.h
> >>>> index 77488ff5eb8c7c..049231d484ad0e 100644
> >>>> --- a/arch/x86/include/asm/processor.h
> >>>> +++ b/arch/x86/include/asm/processor.h
> >>>> @@ -580,6 +580,31 @@ static __always_inline bool on_thread_stack(voi=
d)
> >>>>                                current_stack_pointer) < THREAD_SIZE;
> >>>>  }
> >>>>
> >>>> +#ifdef CONFIG_X86_64
> >>>> +#define __stackleak_poison __stackleak_poison
> >>>> +static __always_inline void __stackleak_poison(unsigned long erase_=
low,
> >>>> +                                              unsigned long erase_h=
igh,
> >>>> +                                              unsigned long poison)
> >>>> +{
> >>>> +       unsigned long count;
> >>>> +
> >>>> +       /* Short spans do not amortize the startup cost of REP STOSQ=
. */
> >>>> +       if (erase_high <=3D erase_low + 512) {
> >>>> +               while (erase_low < erase_high) {
> >>>> +                       *(unsigned long *)erase_low =3D poison;
> >>>> +                       erase_low +=3D sizeof(unsigned long);
> >>>> +               }
> >>>> +               return;   =20
> >>
> >> gcc 13 onwards makes a meal of that - https://godbolt.org/z/KPP4h8xz6
> >> It does manage to unroll the loop once - which is good because the int=
el
> >> cpu (I've got) won't execute a 'one clock loop' (the zen5 will); but t=
he
> >> setup code is horrid.
> >> But I also think some of the more recent cpu can execute more than
> >> one write per clock.
> >> If you unroll the loop 4 times it may run a lot faster.
> >> Perhaps:
> >> 	long count =3D (erase_high - erase_low) / sizeof(unsigned long);
> >> 	if (count <=3D 64) {
> >> 		while ((count -=3D 4) >=3D 0) {
> >> 			*(unsigned long *)erase_low =3D poison;
> >> 			*(unsigned long *)(erase_low + 8) =3D poison; =20
> >=20
> > The add (probably) needs to be in the middle...
> >  			erase_low +=3D 32; =20
> >> 			*(unsigned long *)(erase_low - 32 + 16) =3D poison;
> >> 			*(unsigned long *)(erase_low - 32 + 24) =3D poison;
> >> 		}
> >> 		if (count & 2) {
> >> 			*(unsigned long *)erase_low =3D poison;
> >> 			*(unsigned long *)(erase_low + 8) =3D poison;
> >> 			erase_low +=3D 16;
> >> 		}
> >> 		if (count & 1)
> >> 			*(unsigned long *)erase_low =3D poison;
> >> 	} else {
> >> 		...
> >> 	}
> >>
> >> Except that gcc makes a mess of it again.
> >> I don't think the 'erase_low +=3D 32' is going to execute at the
> >> same time as the last (two probably) writes so costs a clock.
> >> So it may need to be asm. =20
> >=20
> > I threw in enough OPTIMIZER_HIDE_VAR() to stop the optimiser breaking
> > the code. https://godbolt.org/z/nx477T4M1
> > gcc then generates:
> >         movq    %rdx, (%rdi)
> >         movq    %rdx, 8(%rdi)
> >         addq    $32, %rdi
> >         movq    %rdx, -16(%rdi)
> >         movq    %rdx, -8(%rdi)
> > .L32:
> >         subq    $4, %rcx
> >         jns     .L22
> > for the code loop (clang is a bit worse - but should be ok).
> > I think that will be a 'two clock loop' on cpu that can do
> > two writes/clock; zen3 and ice lake).
> > For 'stack splatting' rounding up to a multiple of 32 bytes
> > will save all the 'remainder' code. =20
>=20
>=20
> The range can't be rounded: erase_low is wherever the poison search
> stopped, and erase_high is the stack pointer or the bottom of pt_regs
> (168 bytes, so only 8-byte aligned). Rounding up writes live stack,
> rounding down can write STACK_END_MAGIC when the stack was used to the
> end.

If the stack down by STACK_END_MAGIC has been written you are almost in
'deep do-do land' so task_low_bound() could return an aligned address
and that would let you align down the low address.
(So leaving the very last few words alone.)
It also probably doesn't really matter about the top few words.
So the length could be rounded down.

Alternatively, do STACK_END_MAGIC and STACK_ERASE_POISON even need
to have different values?
(And aren't stacks now allocated with a guard page - so you get a
fault on overflow much earlier than any check for STACK_END_MAGIC.)

But does this code even work in a useful manner.
It seems to stop scanning after finding 128 bytes of KSTACK_ERASE_POISON.
Isn't that going to stop on a function with a large on-stack buffer
(especially since one is likely to be on the deepest part of the stack).
I'd have thought you'd jump down the stack in larger lumps than that
just looking for an unwritten word before even trying to decide if it
was the boundary.

David

>=20
>=20
> >=20
> > David
> >  =20
> >> =20
> >>>> +       }
> >>>> +
> >>>> +       count =3D (erase_high - erase_low) / sizeof(unsigned long);
> >>>> +       asm volatile("rep stosq"
> >>>> +                    : "+D" (erase_low), "+c" (count)
> >>>> +                    : "a" (poison)
> >>>> +                    : "memory");     =20
> >>>
> >>> Surely this isn't the only place using `rep stosq` in the tree, right?
> >>> It's not, see memset64 in arch/x86/include/asm/string_64.h.   =20
> >>
> >> Which seems to have very few users.
> >> memset_p() and memset_l() have almost no users.
> >>
> >> David
> >> =20
> >>>    =20
> >>>> +}
> >>>> +#endif
> >>>> +
> >>>>  #ifdef CONFIG_PARAVIRT_XXL
> >>>>  #include <asm/paravirt.h>
> >>>>  #else
> >>>> --
> >>>> 2.53.1-Meta
> >>>>     =20
> >>>
> >>>    =20
> >> =20
> >  =20
>=20

