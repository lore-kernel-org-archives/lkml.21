Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795633534;
	b=zDI3+m14g7mcvonZobHxmIm9FrjgtGfoIF+ztKpA7koUfz70+W14xliomeC5BF2tmzp4
	 2SoxWUdek8Y99NkdB9RVEdCJl6eaDw7XXiTq4QxrBvLMEDQQ6NFbmJSkDYvngySJTkC6A
	 kjMLTNvhCI5znZMoW3Tf2J9Hu0fk+x7QQKMwshbbPfwwPrHZBjLORlZ9ES3fRMS+ZZRF9
	 Aik2gQyTFFpiNtppYWL1eVTch3uF9rdK/oEJgl7PAS2+BuiGuyFwXWEjDq22Lyj9W437d
	 X5K6+SIhPguJzZFLKBy5Q6+jyWkssIandpp2uP4FpCkk278ub9pEVV4gt8nSXSoUUpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Y4MXJUZftqeBpcJ4VHagm5DzlkCdJPUcBe7w/9/n0sU=;
	b=jFvzP1hoiHJQ70/J1cyj3Wih1EBjqFKNezOjAadgOYA3C5GWfTo+oK0zjmo7hmCWz6s9
	 nGrMEKwnu9xnk8MJ9IT+6Nm/QL0AGGpuTwRBIXVqEwlNVSQ1buh/pS41pZv1WWF/83Vxa
	 eBbHKLjaZNlZJSVu9r/oSKALfI327HGXEA187XT00ObzsK5YFfEZUYxHKwDA8v9Mm7fg5
	 UmCS6kVGom3hwPxYdPUFKisSMw22NDOLYgSfbRwyUxGXKLSgtO74YAD2pvj01TByrEW2R
	 OEkpgCxbEbQLGDiw3nfyOL2bsoecUoB2nbVIx+jk0emuKh6AxrLSwBZ723yxB5E/X1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V8Rb91H2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FAA606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05FAA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V8Rb91H2
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so42110585e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:05:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795633531; cv=none;
        d=google.com; s=arc-20260327;
        b=L7FjHHrK11rewpeDWK9KJxGpoQZ6AiLz8EwQpz690iSKDz0jQz+SA5Zz0jLQcQUesh
         Wm6pi5LXzE8taPfOlVVghrjsM6LoBuFj8i4NqUeyGqCoOELXA25ons1L6vxfw2i0JONG
         QoUqrcR6THVq0CIB698aCjpEQc7wQ5XSL+xjep07xS4l0jizF8mmGAfQYdx1jVJMJQYr
         JC/eXk/oivHmtTP5QLkjJavUOWw0FV05H7qE9zefp1KfxyWP3cP2A6oy/4jPW8MFcgxg
         CT+0LE+Evc9fedOthTtu3ZCMaPQRVQDSw7+Fy0T9tiVHXU/seGVM01miEwPGeW5DfJd5
         r6XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y4MXJUZftqeBpcJ4VHagm5DzlkCdJPUcBe7w/9/n0sU=;
        fh=spt4B6PAUFSl5M4US3W3pwIi+RBF66DVTac1Fe+oRXM=;
        b=iBJ2l8tNsFB3tXP35cw6doQqc8+zxtYr+KL7LkpVk5PfNVqNklNfa3xaqdwR4nUsTn
         iCKjBCyzqz1iLnpAKyX3251OX301QxQiXZoCFbv0ifBCmfOo1Oki4QmLEpkR3+jid3Tb
         vNIaiJydBVDGomzGMZRliTe8Yn2J/SRE3zqpp3IXiAA8PD0rdOO6zwk2/9IV802ADZXC
         ADtSeuektcOQ0Fwx6KPcN+4BppEn9dG72S9jBesYcfN+pbcKdzZoFA9taTQjfSoRY+Xo
         ZAtDQNw9eL5hsBBOLUeRkEKyEgsBm4Ijd1oOMAJTq+4ZnpBLQc8KMFCiv7nVhRTZWO9V
         u2nQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795633531; x=1796238331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y4MXJUZftqeBpcJ4VHagm5DzlkCdJPUcBe7w/9/n0sU=;
        b=V8Rb91H2G7Gq4NC2n6YqH5xgVt5e7dZfeScZYhTRe9difhXXvLSybQJZtatQUrElxY
         6+T/TU1QQ4Y+2JZU6VQPrXe/9UOsJ+cC+Egy9er0wmXn3kJUcIOgoHfFMflypiwE6LpD
         zV+FEhKYcr/dFWJ7js7a5BAkOtlWRp2YUr7euNu/VnWjyeViMVxIfTYXYvqS0G23CI43
         WDRVxyGFm4gxVlmncOBYfwGm1QjcnnzrHkq7NW86Sp3WmKVhAV7L9rH9ghhIBWo7vGBO
         U3kui85uwmUTr2YXdInyxTlpab3P0EOFSSbazkATHj+kiXcOJf2AMpom1Bx5AWdeleB2
         kjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795633531; x=1796238331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4MXJUZftqeBpcJ4VHagm5DzlkCdJPUcBe7w/9/n0sU=;
        b=JkBekRxLOvhdX+1VJ27ffuIkJoXMC57wX+BfF1mF75EJVCT4ayWREe3gQeK703FCBs
         7LsRzK+SCgfQImbdGQHvAROP5dd9nzNUOTVJB4RsF0L4Qc4NiOori9HJu7UAzgLCXSM/
         I+vOFj+kH47x19Af9xxtDPSEOBJ8OUBTr6AuTo5iZOpZbGxY2Ijg/fH9Y90k+QAsHIqm
         qI4cjXCTHnmeU2ZXtlAD0x/dXIt/u9jYAhvvmoNlvNa56VYmm6r13dJdwBCyTDbH7cqm
         OkZ7ywCskx6+0y8t5+Ahbtxs84v5hm/rLCifV+DAaEo+czZl1uVZOxvQnI2LYY3qIqJ+
         e9ZA==
X-Gm-Message-State: APuU4Z+ORGNc3zcORFpJrHM5MKb+D27+BoBj9ENy6eo3jf4rPJ6fBbmV
	8J1xDKOildhIrH/T3ldtdBh98wB3X2ACkb+oMcRcdVsyddrvcsRAvyUpfhSUQWXseiZKDeTYb5S
	mWflM5DwHNT7kRjfnlzSmTk3VzL3+8+nSdC4CU+ld
X-Gm-Gg: AZFdTZdB+c8XFpIfh2rmQMu2fsZMmdgBjvgbX/7twoB8gjylVKO2+0xYddlblb8Gneb
	DJ83IhrybNtfweqlFpw09nsrDU5kLyoo8+9mVWSLZqDWU0gN6vsW9ESsu0bIGZs2myNHuTcrFOz
	Id9yyZq9Def03ivbr+Bc4gogEO4RXheSaB7O3Cz0VhylRVjvREkxssrwaE39397uVka5QNQFsR7
	B5y769QVORJV8OmCjmZiGzVgmwgWI+olMK0i+4FFY58efIcsJxQgf3QkJBkW0FjP3rH0+JZCK7n
	9Lxjaq1Yu9mWF8VhJaJI1oDgWFhn4iA6OEr6eHF65H46uodWzhxrJRzxuQPxBAssP2i4dVcclau
	p10aNbcFVff9wE7lqMKXapn1cpMNj3cR1yZKTFPKAJMm4T6t5xiIXTUmJtMXFNxQR+tNLtil8Cz
	sAnuide7Azpvru7McHdF1+iEaILC4KO6Hvux6OnPnBEF3eHogWWOf6sfIK0h6yksvu93D465rui
	nO6npy9FltiUciI5P6RAnq6tdYp60GdGQYRRA==
X-Received: by 2002:a05:600c:3ac9:b0:4a2:a3b:7aa8 with SMTP id
 5b1f17b1804b1-4bb887e068emr399468375e9.3.1795633530828; Wed, 25 Nov 2026
 11:05:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125104953.381561-2-ardb+git@google.com>
In-Reply-To: <20261125104953.381561-2-ardb+git@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 25 Nov 2026 11:05:19 -0800
X-Gm-Features: Aa3M54oQa-n6hX_dmNQu1dR69V5rK8706NS8asd4OdWsFAnXmMx7BavZiXUkbsQ
Message-ID: <CAKwvOd=1u6d2Epp8MgkesknixWcB+JLKfAQq8g9kqYw5sDoLow@mail.gmail.com>
Subject: Re: [PATCH] x86/percpu: Use address space loads for per-CPU reads
 when using Clang
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, x86@kernel.org, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Uros Bizjak <ubizjak@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 2:50=E2=80=AFAM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Clang never discards inline asm with memory operands, even if its result
> is unused [0]. This means unused per-CPU reads are always emitted,

Ack on this missed optimization.  I _just_ got beers with Bill last
night, and forgot to bring this up!

> including the load of this_cpu_off by this_cpu_ptr() in cases where the
> resulting pointer is never dereferenced.
>
> Clang's support for the __seg_gs/__seg_fs named address space qualifiers
> is insufficient for full CONFIG_USE_X86_SEG_SUPPORT, but works well
> enough [1] for plain loads, and is present in all versions of Clang that
> Linux still cares about. So use those to implement __raw_cpu_read() on
> SMP, permitting the compiler to elide them when the result is unused.
>
> On a v7.4-rc1 defconfig build, this gets rid of 174 spurious per-CPU
> loads, 136 of which are loads of this_cpu_off from this_cpu_ptr().
>
> [0] https://github.com/llvm/llvm-project/issues/245738
> [1] Exclude KMSAN, which ignores the segment base when instrumenting
>     such loads.

+ Maintainers of KMSAN. Ard, can we get a formal bug report about that?
https://github.com/llvm/llvm-project/issues
With the report in hand, it would be handy to reference it below.

+ Uros for good measure.

>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Bill Wendling <morbo@google.com>
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: llvm@lists.linux.dev
> Cc: x86@kernel.org
>
> This supersedes "locking/local_lock: Don't evaluate the per-CPU lock
> pointer if unused"
>
> https://lore.kernel.org/all/20261122105646.2223131-2-ardb+git@google.com/
>
>  arch/x86/include/asm/percpu.h | 25 ++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.=
h
> index cef9a4ca9841..40262edef878 100644
> --- a/arch/x86/include/asm/percpu.h
> +++ b/arch/x86/include/asm/percpu.h
> @@ -32,13 +32,13 @@
>
>  #define __force_percpu_prefix  "%%"__stringify(__percpu_seg)":"
>
> -#ifdef CONFIG_CC_HAS_NAMED_AS
> -
>  #ifdef __CHECKER__
>  # define __seg_gs              __attribute__((address_space(__seg_gs)))
>  # define __seg_fs              __attribute__((address_space(__seg_fs)))
>  #endif
>
> +#ifdef CONFIG_CC_HAS_NAMED_AS
> +
>  #define __percpu_prefix
>
>  #else /* !CONFIG_CC_HAS_NAMED_AS: */
> @@ -144,6 +144,25 @@ do {                                                =
                               \
>
>  #else /* !CONFIG_USE_X86_SEG_SUPPORT: */
>
> +#if defined(CONFIG_SMP) && defined(CONFIG_CC_IS_CLANG) && !defined(CONFI=
G_KMSAN)
> +
> +/*
> + * Clang never discards inline asm with memory operands, even if its res=
ult is
> + * unused. Its named address space support is sufficient for plain loads=
, so

After the first sentence, I'd link to
https://github.com/llvm/llvm-project/issues/245738. Since this code is
meant to be temporary until that is fixed in clang, a future traveler
may simply open the link, see it's closed, then see what they can do
about cleaning up this code.  It's handy for Nathan or myself to use
`grep` to find links to llvm issues, then verify if they're stale and
can be cleaned up (once we have newer toolchains).

> + * use those instead, allowing unused per-CPU reads to be elided. KMSAN =
is
> + * excluded as it ignores the segment base when instrumenting such loads=
.

Then I'd link to your to be filed bug report, for the same reason.

> + *
> + * Once CONFIG_USE_X86_SEG_SUPPORT is fully implemented in Clang, this v=
ersion
> + * can be dropped.

And finally here I'd link to the final issue.  That way it's clear
there's 3 different issues on the toolchain side conspiring here.

> + */
> +#define __raw_cpu_read(size, qual, _var)                               \
> +({                                                                     \
> +       *(qual TYPEOF_UNQUAL(_var) CONCATENATE(__seg_, __percpu_seg) * __=
force) \
> +               (__force uintptr_t)&(_var);                             \

Beautiful.

> +})
> +
> +#else
> +
>  #define __raw_cpu_read(size, qual, _var)                               \
>  ({                                                                     \
>         __pcpu_type_##size pfo_val__;                                   \
> @@ -156,6 +175,8 @@ do {                                                 =
                               \
>         (typeof(_var))(unsigned long) pfo_val__;                        \
>  })
>
> +#endif
> +
>  #define __raw_cpu_write(size, qual, _var, _val)                         =
       \
>  do {                                                                   \
>         __pcpu_type_##size pto_val__ =3D __pcpu_cast_##size(_val);       =
 \
> --
> 2.56.1.831.g720f3f5937-goog
>


--=20
Thanks,
~Nick Desaulniers
