Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795213344;
	b=jIjE3tKI5xtaE/a0KtRK4VwplgjcnlnhzaDel7CfgU1hIUcDznZQY2taAlwWYT0dWHBX
	 X6SsSbWguh8xdKNbg+GotiRG4NY+JLRucOgP/TZGSFPQ/BEY8ntlDLmai8CN3Vl77P7SJ
	 KRNqGrNQQh3q4EdzXla/olrMpTVpyJI1hVKySMSjv2V16QJ3UsdqYaNxz1jxz4Y+iDcY8
	 gmE1NE9+2fpn60idU3b8LJOsBL007e8VsYalfn7iktirAjqeqSKK2qH8B+t0Y7yJCeN8O
	 VJB2aeSXTsYRC/XVVxxseLhPl/tQtt3LnRo4kmevWI794FBfwKPFZdTJq8tyLMU3PCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795213344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=yzXVm4lahSNyTqJMJ8XzNkiqp9bv+uJ5iG2RmmNtml8=;
	b=2TCISWEEYZ9HTQdR0CzMk3SIWF+MZ9da0/YfpizgFwlr6G2ZOATOrRDyS5rC33e7wEZI
	 CJGBVq5HM1iRuduGpaT6RJbq5nQbFF4tzRoB/5l5YcRjHMkBmN/Rv030hbPsMnQLzK9aO
	 K6KMEF226wB2UFAlCZYK0RxoeU0cSW02G9FHzolYrT5QuqZwiqwfxt3IU91/pBZLiwfV4
	 5XBGnZYhSAhvskZGdDa8NplnH8zk7LVikNPHGt8wDYfE9AuN1zDWmuzbfTQrIVzpSi06Q
	 YkzV6IvqVjiUBclesE+lMkSJ349phbbJYDUhdE+pQyYc3sY1NmwVTw8XxXto/0yVdJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wfoZwPSg;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA774606A6BD
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA774606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wfoZwPSg
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so11312255e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795213334; x=1795818134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yzXVm4lahSNyTqJMJ8XzNkiqp9bv+uJ5iG2RmmNtml8=;
        b=wfoZwPSgr0KHa/TkHNN4+russXXgvfAcywVgjI/2aDjuKUuNQUJ9fY8Znxgz56WoVj
         yHHQXNfN0nrOzuk37lwF2uEru4XG4tgt3UN4PS10Vkg3W893Il/CIYiwSfPCEVlxSk3+
         moLyEYWxHGSAiyXTGJD777BdAJe2YBLxzd6vLxAl/hfo3zetLmPo4WMX9MAu4yTWpteO
         VnTGKMP+xAtC+aYaYYvB+7ini7gNf/CWnq74+UPpRmlPY+4Lr7m8/sgMsd5Guf/wIioC
         /aNvsduicZEKnwcIPsw4fthEEE4CpVwHXkTqRdYphigIlF5Q2MfhzapALIEx7CG9UozL
         Y7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795213334; x=1795818134;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzXVm4lahSNyTqJMJ8XzNkiqp9bv+uJ5iG2RmmNtml8=;
        b=txx2Vw7TJhl8TgiLRQuDBvivsr/5flczcj/VEe4t17Id2QwEdWNeQ+wGPEiavtLt39
         Z32AqNDXyOr9W4KKyDAzgznmYuMx3rN1lydLJNpMRoYpBWtPX0PIMd3r2thEFUFdzcf/
         nEiDbGjrkqknvMlaiyCpLVL4cNauXLpGA49wrWtQws6WllpBKZFcVHStqYxgNgVkCUVo
         NUZMgxuUoQihexMf8Tbt+BxrwPWr/kh7BSSld4m+hTVV0i7hVlExI6rAjoc5ZxXJAmCt
         eEDv7iPCp2EsaoREOI3vHQSEfZhdaPqqZRQ/ls+WyQeQJ0gEWZa/6sC3e9rx/QG/emGl
         KwCA==
X-Forwarded-Encrypted: i=1; AL+hErGJ4P2BCxEjaccGVf+hCo3vbzjcQa5rKFR7xVr4FEcawVJwUviNoJpNGyb6KTKaH7fZrySjAVOgYEM02Hg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/wXDW2lsTlmv5H8O6Mu/8b9nm/RhbYTnHCbJSJvMwQNmw6Rfs
	8KYyNGb41f8JKemfLnElV5+J6ce2Mmiqq0375jaDicDtVEYqhfg8aSZ3
X-Gm-Gg: AYBFou0BxoKJ1J8eDlhRX28zJg8uMeJDv5hKflFDlQSdqYuXB/5wicKgnoHqHQ3EOm0
	ULGSYkZpvuzY4l+VxxeqUo5zCKvRflZMQyrHQTZ+tOYWM+FM8tXwRTSmcA/5SSPlRfdiQONF9o8
	rn0PyJH3Sk/gyCEKgOUC0+KWNc/zMWOmULeXTA6vEGW6r7UUz1/W1bfXo29tkUY0fuyOwviLE3A
	DNZFBp+9fVy1g+TOFId2XPfUkMuHWTnxBkC6fiGlB/6AXmhgTFlQtHbYUfh6Y1LufjPeIT4A0b8
	FAQLo6ChFWvaiqlZES93btjbfITdbneqmPjVZaPxHMEgc1Lc5cufL6SBb6UOJmETLKKQQUo6cHZ
	RylFPxpdHDErrZEHF/GjQudK4Y0xxXWIs/DgQEwAabDnnlYRHscZ/XQt2fz6QWrYXO5skwxJnr7
	AytQOHI1kKwvAzMGYPmfh18dkSTyJ4+P69Qo1YZNb/NtPI4CQBrz0ivcVxK8bMaCpB9v0SYQgca
	nUrESTKVvKOvoOEJlgAxok4oOVw4fDbcTb/sSdkRo0uC5y+Upd+WKoXJ0DBRF6hq3uc+388rJLm
	bLM5fl90R//0rASXcO0sa8PG7/3OLQ6fxFEWzt2Zff1kh4jUTeZdmY/a+5HsoUwZ5A==
X-Received: by 2002:a05:600c:828e:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb88785a99mr100126115e9.0.1795213333610;
        Fri, 20 Nov 2026 14:22:13 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm144561245e9.5.2026.11.20.14.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:22:13 -0800 (PST)
Date: Fri, 20 Nov 2026 22:22:11 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: Peter Zijlstra <peterz@infradead.org>, ndesaulniers@google.com,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, kees@kernel.org,
 hpa@zytor.com, gustavoars@kernel.org, ardb@kernel.org, hca@linux.ibm.com,
 nathan@kernel.org, morbo@google.com, justinstitt@google.com,
 linux-hardening@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, riel@surriel.com, shakeel.butt@linux.dev,
 kernel-team@meta.com, rkeilty@meta.com, atish.patra@linux.dev,
 dgreid@meta.com
Subject: Re: [PATCH 2/2] x86/kstack_erase: Use REP STOSQ for large stack
 fills
Message-ID: <20261120222211.2f0d5cbc@pumpkin>
In-Reply-To: <bad389b1-f4a6-43d4-9531-54b75e067c7a@linux.dev>
References: <20261119213147.1094488-1-usama.arif@linux.dev>
	<20261119213147.1094488-3-usama.arif@linux.dev>
	<20261120104534.GO2668564@noisy.programming.kicks-ass.net>
	<20261120122635.GJ2669272@noisy.programming.kicks-ass.net>
	<bad389b1-f4a6-43d4-9531-54b75e067c7a@linux.dev>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Nov 2026 18:43:38 +0000
Usama Arif <usama.arif@linux.dev> wrote:

> On 20/11/2026 04:26, Peter Zijlstra wrote:
> > On Fri, Nov 20, 2026 at 11:45:34AM +0100, Peter Zijlstra wrote:  
> >> On Thu, Nov 19, 2026 at 01:31:08PM -0800, Usama Arif wrote:  
> >>> +#ifdef CONFIG_X86_64
> >>> +#define __stackleak_poison __stackleak_poison
> >>> +static __always_inline void __stackleak_poison(unsigned long erase_low,
> >>> +					       unsigned long erase_high,
> >>> +					       unsigned long poison)
> >>> +{
> >>> +	unsigned long count;
> >>> +
> >>> +	/* Short spans do not amortize the startup cost of REP STOSQ. */
> >>> +	if (erase_high <= erase_low + 512) {
> >>> +		while (erase_low < erase_high) {
> >>> +			*(unsigned long *)erase_low = poison;
> >>> +			erase_low += sizeof(unsigned long);
> >>> +		}
> >>> +		return;
> >>> +	}
> >>> +
> >>> +	count = (erase_high - erase_low) / sizeof(unsigned long);
> >>> +	asm volatile("rep stosq"
> >>> +		     : "+D" (erase_low), "+c" (count)
> >>> +		     : "a" (poison)
> >>> +		     : "memory");
> >>> +}
> >>> +#endif  
> >>
> >> Gemini seems to suggest 16-32 words would be sufficient to amortize the
> >> REP STOS setup. It was also adamant I try and unroll that earlier loop.
> >>
> >> How about something like so, does that make sense? Also, I suppose we
> >> should make memset64() __always_inline if we use it here. I'm not at all
> >> sold on the unroll here, the asm is pretty horrid for what it does.  
> > 
> > This one is much improved:
> > 
> > --- a/arch/x86/include/asm/processor.h
> > +++ b/arch/x86/include/asm/processor.h
> > @@ -28,6 +28,7 @@ struct vm86;
> >  #include <asm/vmxfeatures.h>
> >  #include <asm/vdso/processor.h>
> >  #include <asm/shstk.h>
> > +#include <asm/string.h>
> >  
> >  #include <linux/personality.h>
> >  #include <linux/cache.h>
> > @@ -580,6 +581,35 @@ static __always_inline bool on_thread_st
> >  			       current_stack_pointer) < THREAD_SIZE;
> >  }
> >  
> > +#ifdef CONFIG_X86_64
> > +#define __stackleak_poison __stackleak_poison
> > +static __always_inline void __stackleak_poison(unsigned long erase_low,
> > +					       unsigned long erase_high,
> > +					       unsigned long poison)
> > +{
> > +	unsigned long count = (erase_high - erase_low) / sizeof(unsigned long);
> > +
> > +	/* Amortize the startup cost of REP STOSQ. */
> > +	if (count < 32) {
> > +		unsigned long *ptr = (unsigned long *)erase_low;
> > +
> > +		while (count) {
> > +			unsigned long mod = (count-1) % 4;
> > +			count -= mod+1;
> > +			switch (mod) {
> > +			case 3: ptr[count+3] = poison; fallthrough;
> > +			case 2: ptr[count+2] = poison; fallthrough;
> > +			case 1: ptr[count+1] = poison; fallthrough;
> > +			case 0: ptr[count+0] = poison; break;
> > +			}
> > +		}
> > +		return;
> > +	}
> > +  
> 
> Hello Nick, Peter and David,
> 
> Thanks for the reviews! I should have used memset64 from the get go :)
> 
> I have tested 2 possible revisions now as well as this one from Peter,
> have added both of them at the end of the reply.
> 
> - v2.1 where you loop upto 512B and then memset
> - v2.2: 4 stores per loop up to 512 B, then 64-byte aligned memset64()
> 
> I timed stackleak_erase() in a Zen 5c guest over a futex/epoll/procfs/unix
> syscall:
> 
>   No patch                             68.3 ns per erase
>   v1 (loop up to 512 B, then REP)           46.6 ns
>   v2.1 (loop up to 512 B, memset64())       46.6 ns
>   this version                              46.4 ns
>   v2.2 (4 stores/iteration, aligned REP)    43.7 ns

What are the lengths of those erases?
(and where does the 46ns come from??)
I'd definitely time 'just the code loop  - various loops' and
'just rep stos'.

> The switch doesn't seem to help.

To many conditions in the loop.
You could do it this way:
	switch (count & 3) {
	case 0: do { *ptr++ = poison;
	case 3:      *ptr++ = poison;
	case 2:      *ptr++ = poison;
	case 1:      *ptr++ = poison;
		} while ((count -= 4) > 0);
	}
(give or take some off-by-one here and there).
But I suspect that using Duff's device is frowned up.

> Either way I kept 512 bytes: REP STOSQ only wins from ~430 bytes on Zen
> 5c against the plain loop (~850 against the unrolled one),

For zen5 you should only need to unroll the loop once (two writes per iteration).
In my experiments it can execute a loop in one clock.
Unless the compiler unrolled it for you (and got it right!) the original
loop would be half the speed 

> and from ~320 on Cooper Lake.

I'd also try some older Intel cpu.
The setup costs are likely to be higher with FRMS and friends.

David

> 
> 
> My personal preference is v2.1, as its much simpler code and the difference
> in performance between v2.1 and v2.2 isn't actually that much. But if there is
> a stronger preference for v2.2, I can send that as it is faster.
> 
> 
> v2.1:
> 
> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
> index 77488ff5eb8c7c..3d205ae8566114 100644
> --- a/arch/x86/include/asm/processor.h
> +++ b/arch/x86/include/asm/processor.h
> @@ -28,6 +28,7 @@ struct vm86;
>  #include <asm/vmxfeatures.h>
>  #include <asm/vdso/processor.h>
>  #include <asm/shstk.h>
> +#include <asm/string.h>
> 
>  #include <linux/personality.h>
>  #include <linux/cache.h>
> @@ -580,6 +581,26 @@ static __always_inline bool on_thread_stack(void)
>                                current_stack_pointer) < THREAD_SIZE;
>  }
> 
> +#if defined(CONFIG_X86_64) && !defined(CONFIG_KMSAN)
> +#define __stackleak_poison __stackleak_poison
> +static __always_inline void __stackleak_poison(unsigned long erase_low,
> +                                              unsigned long erase_high,
> +                                              unsigned long poison)
> +{
> +       /* Short spans do not amortize the startup cost of REP STOSQ. */
> +       if (erase_high <= erase_low + 512) {
> +               while (erase_low < erase_high) {
> +                       *(unsigned long *)erase_low = poison;
> +                       erase_low += sizeof(unsigned long);
> +               }
> +               return;
> +       }
> +
> +       memset64((u64 *)erase_low, poison,
> +                (erase_high - erase_low) / sizeof(u64));
> +}
> +#endif
> +
>  #ifdef CONFIG_PARAVIRT_XXL
>  #include <asm/paravirt.h>
>  #else
> diff --git a/arch/x86/include/asm/string_64.h b/arch/x86/include/asm/string_64.h
> index 2dae70c2b01465..73cc91254b1381 100644
> --- a/arch/x86/include/asm/string_64.h
> +++ b/arch/x86/include/asm/string_64.h
> @@ -54,7 +54,7 @@ static inline void *memset32(uint32_t *s, uint32_t v, size_t n)
>  }
> 
>  #define __HAVE_ARCH_MEMSET64
> -static inline void *memset64(uint64_t *s, uint64_t v, size_t n)
> +static __always_inline void *memset64(uint64_t *s, uint64_t v, size_t n)
>  {
>         const auto s0 = s;
>         asm volatile (
> 
> 
> 
> 
> 
> v2.2:
> 
> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
> index 77488ff5eb8c7c..5e76e1140908d7 100644
> --- a/arch/x86/include/asm/processor.h
> +++ b/arch/x86/include/asm/processor.h
> @@ -28,7 +28,9 @@ struct vm86;
>  #include <asm/vmxfeatures.h>
>  #include <asm/vdso/processor.h>
>  #include <asm/shstk.h>
> +#include <asm/string.h>
> 
> +#include <linux/align.h>
>  #include <linux/personality.h>
>  #include <linux/cache.h>
>  #include <linux/threads.h>
> @@ -580,6 +582,48 @@ static __always_inline bool on_thread_stack(void)
>                                current_stack_pointer) < THREAD_SIZE;
>  }
> 
> +#if defined(CONFIG_X86_64) && !defined(CONFIG_KMSAN)
> +#define __stackleak_poison __stackleak_poison
> +static __always_inline void __stackleak_poison(unsigned long erase_low,
> +                                              unsigned long erase_high,
> +                                              unsigned long poison)
> +{
> +       unsigned long *p = (unsigned long *)erase_low;
> +       unsigned long *end = (unsigned long *)erase_high;
> +       unsigned long i;
> +
> +       /* Fewer than four words, or nothing to do. */
> +       if (erase_high < erase_low + 4 * sizeof(*p)) {
> +               while (p < end)
> +                       *p++ = poison;
> +               return;
> +       }
> +
> +       /* Four stores per iteration; the last four may overlap. */
> +       if (erase_high - erase_low <= 512) {
> +               end -= 4;
> +               while (p < end) {
> +                       p[0] = poison;
> +                       p[1] = poison;
> +                       p[2] = poison;
> +                       p[3] = poison;
> +                       p += 4;
> +               }
> +               end[0] = poison;
> +               end[1] = poison;
> +               end[2] = poison;
> +               end[3] = poison;
> +               return;
> +       }
> +
> +       /* REP STOSQ is faster from a 64-byte aligned destination. */
> +       for (i = 0; i < 8; i++)
> +               p[i] = poison;
> +       p = (unsigned long *)ALIGN(erase_low + 1, 64);
> +       memset64((u64 *)p, poison, end - p);
> +}
> +#endif
> +
>  #ifdef CONFIG_PARAVIRT_XXL
>  #include <asm/paravirt.h>
>  #else
> diff --git a/arch/x86/include/asm/string_64.h b/arch/x86/include/asm/string_64.h
> index 2dae70c2b01465..73cc91254b1381 100644
> --- a/arch/x86/include/asm/string_64.h
> +++ b/arch/x86/include/asm/string_64.h
> @@ -54,7 +54,7 @@ static inline void *memset32(uint32_t *s, uint32_t v, size_t n)
>  }
> 
>  #define __HAVE_ARCH_MEMSET64
> -static inline void *memset64(uint64_t *s, uint64_t v, size_t n)
> +static __always_inline void *memset64(uint64_t *s, uint64_t v, size_t n)
>  {
>         const auto s0 = s;
>         asm volatile (
> 
> > +	memset64((void *)erase_low, poison, count);
> > +}
> > +#endif
> > +
> >  #ifdef CONFIG_PARAVIRT_XXL
> >  #include <asm/paravirt.h>
> >  #else  
> 
> 

