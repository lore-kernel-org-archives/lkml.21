Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174709;
	b=IiQg1IvV2tkOskyLBvX5H9PN5hZAsw+Nz90AdT14ncO9eR/uGYAgH4wQpdrT+NUkXXaG
	 1OorkZ1ySJ6ZAU9TPVKDReFwHkiJ8XiqJ/r2JqUN4ulQUW4ZN7h3ok3Y+Orcny4Io7sSg
	 Ie9UGB8xFCMUI3xM3SlD8ZudpGDxhBqQ26Rl8vpAsgyIbLwZ3Rm77jszyTyMse7BqGGax
	 /pzNFS8riK4fi1dQJB5quUfjFpMcmO+ELp4iMWQhnC2Snu+7K4m6ioSQU1fvmhDo+Jpqv
	 p3tXPBCQEJdTZcv96WW+d3K3pxsbquhM5gG3EajSfhYuaM6tmWPXv+Zo74cgsRfcIFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RXY63Zo5uvZhPFI98Q/TScgGLzf2IyKlYtsZMNa3YBs=;
	b=etGkjvRLIjQUgh8gyFqLzmCBIU3F3iQ/0ollzyZJ8lU4RFoh/F824XWdEEMNovAGU7Xb
	 lj+qRLX2lfiD/1R38zgIa2s0Iy4gX+WXk9pPz0ErDAVRMKK0zs7Bn4eIYLHibiUqTVhNX
	 UBiYs6zkw+3Gj0wkk9wqtZibpAqWEV2P6ICVlSQnk/bnF40hjVZ+SSExzRZyhaJ4D9jkd
	 B+P/bqVZjJkXsxP6pqGxmizDZpsH2+AY6n7RJ59bqbiEdgiLp+9afRW0YlHLbAsKabxTg
	 y803R8Xc40Oj4uoxjnF+htiqDlD+RShRTisP8t+n2a29zp96003A05s7d9gEamScdDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ndmq/QHu";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2442D606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2442D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndmq/QHu
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so412195f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174707; x=1795779507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RXY63Zo5uvZhPFI98Q/TScgGLzf2IyKlYtsZMNa3YBs=;
        b=ndmq/QHuoRBguIFOggKUs+Sda5GQg1fiH1RA9eEH9T57jYVFZoFNsvmwVdrVqbrSSP
         /Np4fGfEiynF37xan6NwwLXOdGIBUp0o+dr3PLXqYFAGK1HxaA6MpIdCT5G5vW9153QZ
         hfAJo8NG3VH7YlZx9Hopf66bfQHtgFAFLFcDVH2qXGtf+mmnpLcNRURNpY3ZK6en4ed6
         J9PZys+UILNabCIsX6e/5FM9DStyEt8Hoxkder3nPUMb344q/WR9+AsxYbktonX0qHY0
         Xr94sHBh/tMqNzpZJTMP1oasdbKFeP/vOPnkXOga7AnMB5g6ZZZ9W9esiPCLF1ebynsD
         ZLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174707; x=1795779507;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXY63Zo5uvZhPFI98Q/TScgGLzf2IyKlYtsZMNa3YBs=;
        b=IktzElYlbb4JQ0ZQsqucj/HafsomJFxvhpLPyUdNLF6tfOH/39c00G0qa0CkvdYEBI
         Y+4z91jzEU5uvD8OcD8Tc5Cq+/AShWeP/I8Z2WhqE8JwXwC2u9BHDis0O+QkeWaJQxzC
         KvDRghKWuk5vjP8zubKDP94XDSXRi7aryY7kwWbgDl5fIUKTfJyTa0xjmW3Zho6Z46PK
         WXAgpG7NrFWQE6XsDgyinNKKWdKokduoQQeDZNl14vEzamSU+bZ6imu4Gm80w98UbSrL
         9f1eb16BujdXgviyVXFFL3U9SaP6Uup5E7Rhl3L+Bitu7ZJtixGnEgo0LreqI5U/Qv4z
         ayXw==
X-Forwarded-Encrypted: i=1; AL+hErEpnn5p6fJ5nh68/Da3W2Z8zEN1C1VEWfQ+zU44Iaje8jliGGMtE6VH+E+naWeX1LJak9FmjTU4tGwysAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z91yh8jK+xl4nBc39s6Vlr7etnrgs1ixOYtM+kdYSn806HagUNA
	8tSnez4NuIQ4W3Dv4VtLIyTfPyJkXPimAOWMNrD49srlIznRy8wEZJ9gFDdPk/ZM
X-Gm-Gg: AZFdTZfEskMIMq4KLmvkBVPq92HJXONwHMuyWPdap/3rrwt0uvLdiKlv8a6ELkskkaD
	YmYHnka3xuLykPpm45Ho9NS8krCokwpwhBY7p7qlDoIJtFalO7PetYSnZDXVu2SA16TzWv1x090
	Ti8ZAzkBQsNkKbJwawJe0HVkaqOzGndaWbx1nNYfOQaZEmyp5WyQt7Pn+dWzauO4iUt/Qxy0w0z
	bLBQjGrWjL2ivhIQQ45WR8nt5iz5BR+RvWg8I+T2orY/3aMWr++CopRWGQsXq1NgWFBHQnW1hBs
	T4Ls+Wa9SmckAFj2GgtGazGjhC3vhgp3xrvT3ApSEU5/r7YEsWSvasmluizzMs2qXzNo3JFnoQv
	f+z9tC3r7/BYVNM8dtEOwQv+utnWYI0RE89nYdZURaqdL2hZl9IgmEK3T308O4AxD3dN5MkbDmt
	7hdLnoJnZZRKQ3NzjAT5P4DYioe5hmsEGmP5pGAmDcV89oNnfkP3zeVAPNAGVSv+NkATSYBnDW+
	LaWxgh3/hUR9B06D9WsD/O/hyhdrtco6vGjmAeR7oRi4fFSN2vsFW7Uvc/RfEPXb0yHJUP/LLLL
	9a+DygIzx69EMQmM71xg7NFAnPh4Al0N9/5wW5kmD/47MBRmyrqQ/soMCP2Lpt48kA==
X-Received: by 2002:a05:6000:47ca:b0:4a8:9702:6cbe with SMTP id ffacd0b85a97d-4abb2dda46bmr3489036f8f.27.1795174707260;
        Fri, 20 Nov 2026 03:38:27 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm5347378f8f.2.2026.11.20.03.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:38:26 -0800 (PST)
Date: Fri, 20 Nov 2026 11:38:25 +0000
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
Message-ID: <20261120113825.234bee1c@pumpkin>
In-Reply-To: <CAKwvOdnzNU_xtLeb4vXSFe3DLN9QmdNSSReUmQahsLX+1pZxCw@mail.gmail.com>
References: <20261119213147.1094488-1-usama.arif@linux.dev>
	<20261119213147.1094488-3-usama.arif@linux.dev>
	<CAKwvOdnzNU_xtLeb4vXSFe3DLN9QmdNSSReUmQahsLX+1pZxCw@mail.gmail.com>
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

On Thu, 19 Nov 2026 14:28:04 -0800
Nick Desaulniers <ndesaulniers@google.com> wrote:

> On Thu, Nov 19, 2026 at 1:32=E2=80=AFPM Usama Arif <usama.arif@linux.dev>=
 wrote:
> >
> > With KSTACK_ERASE, every return to user space poisons the part of the
> > task stack that was used since the previous return. The generic
> > __stackleak_poison() does that one word per loop iteration, so a syscall
> > that went 1-2 KiB deep pays for 128-256 separate stores. On Meta hosts
> > running many small VMs, stackleak_erase() accounts for about 1.5% of
> > non-idle host kernel cycles.
> >
> > Override __stackleak_poison() on x86-64, as s390 already does, through
> > the hook added by commit 491a78663e03 ("stackleak: allow to specify arch
> > specific stackleak poison function"). Fill spans larger than 512 bytes
> > with REP STOSQ and keep the word loop for shorter ones, where the fixed
> > startup cost of REP STOSQ does not pay off. REP STOSQ starts to win at
> > about 300-400 bytes on Zen 5c and Cooper Lake, so on both no span gets
> > slower.
> >
> > The fill is inline asm, so the noinstr function still makes no calls.
> > memset64() would be the same instruction, but it is only static inline,
> > and with KMSAN it is an out-of-line function.
> >
> > In a Zen 5c KVM guest, stackleak_erase() got about 35% cheaper per retu=
rn
> > to user space (71 ns to 46 ns, scan included) over a futex, epoll, proc=
fs
> > and Unix socket syscall mix. Same-vCPU futex wake/wait and Unix socket
> > sendmsg()/recvmsg() ping-pong round trips got 5-8% faster.
> >
> > Signed-off-by: Usama Arif <usama.arif@linux.dev>
> > ---
> >  arch/x86/include/asm/processor.h | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/pr=
ocessor.h
> > index 77488ff5eb8c7c..049231d484ad0e 100644
> > --- a/arch/x86/include/asm/processor.h
> > +++ b/arch/x86/include/asm/processor.h
> > @@ -580,6 +580,31 @@ static __always_inline bool on_thread_stack(void)
> >                                current_stack_pointer) < THREAD_SIZE;
> >  }
> >
> > +#ifdef CONFIG_X86_64
> > +#define __stackleak_poison __stackleak_poison
> > +static __always_inline void __stackleak_poison(unsigned long erase_low,
> > +                                              unsigned long erase_high,
> > +                                              unsigned long poison)
> > +{
> > +       unsigned long count;
> > +
> > +       /* Short spans do not amortize the startup cost of REP STOSQ. */
> > +       if (erase_high <=3D erase_low + 512) {
> > +               while (erase_low < erase_high) {
> > +                       *(unsigned long *)erase_low =3D poison;
> > +                       erase_low +=3D sizeof(unsigned long);
> > +               }
> > +               return;

gcc 13 onwards makes a meal of that - https://godbolt.org/z/KPP4h8xz6
It does manage to unroll the loop once - which is good because the intel
cpu (I've got) won't execute a 'one clock loop' (the zen5 will); but the
setup code is horrid.
But I also think some of the more recent cpu can execute more than
one write per clock.
If you unroll the loop 4 times it may run a lot faster.
Perhaps:
	long count =3D (erase_high - erase_low) / sizeof(unsigned long);
	if (count <=3D 64) {
		while ((count -=3D 4) >=3D 0) {
			*(unsigned long *)erase_low =3D poison;
			*(unsigned long *)(erase_low + 8) =3D poison;
			*(unsigned long *)(erase_low + 16) =3D poison;
			*(unsigned long *)(erase_low + 24) =3D poison;
			erase_low +=3D 32;
		}
		if (count & 2) {
			*(unsigned long *)erase_low =3D poison;
			*(unsigned long *)(erase_low + 8) =3D poison;
			erase_low +=3D 16;
		}
		if (count & 1)
			*(unsigned long *)erase_low =3D poison;
	} else {
		...
	}

Except that gcc makes a mess of it again.
I don't think the 'erase_low +=3D 32' is going to execute at the
same time as the last (two probably) writes so costs a clock.
So it may need to be asm.

> > +       }
> > +
> > +       count =3D (erase_high - erase_low) / sizeof(unsigned long);
> > +       asm volatile("rep stosq"
> > +                    : "+D" (erase_low), "+c" (count)
> > +                    : "a" (poison)
> > +                    : "memory"); =20
>=20
> Surely this isn't the only place using `rep stosq` in the tree, right?
> It's not, see memset64 in arch/x86/include/asm/string_64.h.

Which seems to have very few users.
memset_p() and memset_l() have almost no users.

David

>=20
> > +}
> > +#endif
> > +
> >  #ifdef CONFIG_PARAVIRT_XXL
> >  #include <asm/paravirt.h>
> >  #else
> > --
> > 2.53.1-Meta
> > =20
>=20
>=20

