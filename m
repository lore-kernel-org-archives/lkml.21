Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795461186;
	b=ir1mH7dzYqgJHqv4HilztuAe+tBJRAuz0MS3lu+KxwJKWPt8M6t8OolFCbuMA8VIhUH+
	 0jQF0MtYN1nLSoNREv+M01Wx4QRULar2hLSUvO4/Ix4H/aWoOVqY4lP0CTdYh3SPpzQl8
	 MomsU0rQtzjZbpCWZ+MS15MviCs1E0pahyCIMNap125P/6dpXwhkAah730WXmihKgOdyv
	 DQ+WSgsTcdbdsls/ZAePjBQMmG4RSFu68yMFjFc6NxfT8OaRNB2KL7oCzaHtd9wyOdFhC
	 WT9q54vA/EnuIxj8Co8D6Mt/wzsro4sTOPVxptgYOstwf69ZQDih0WDs/a4I3qh+1Ww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=SFo6AVw97R2wCBIFYeT75YVKRSh5N0fKfYv/Pz+bvSk=;
	b=mII2XLqEM54N+Eq6SfLBuUOcMUJ0qokKLuAih+NI1epKJLf+yCyEk2Fwf77i1mRRNFzh
	 V+KSj9Mu+YI56gSwwhqBx3hP3Z4t6rVk+0+Q5DSvElyA2x/vG3nbc0C2rO24VNuq5RkKL
	 ktKSh+UDVaxjPQ40RXg22imYaHNp4ai4b7mOby2xQwGa7fCbL+1pGoosvYYqr5YOJzIJC
	 WWSvSJwsK20x76j1AeKCYbR/IHWiX3Z9i7+hNQhmarMbpozmqNexbh69EYkp+MwkSI0VH
	 Gyu5MIuNj0disJNepLPRdN1wN0CGA+ZWF5maR8uZ9DRQSndxMEyPhVisuIbUvtUxG0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DVYU9vn1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD07606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DD07606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DVYU9vn1
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so3026165f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:13:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795461184; cv=none;
        d=google.com; s=arc-20260327;
        b=BL/OshVd15r2zxnfOuc8AFBg7Y4V7SBRWLGYWt2YZeRbwbXBZWglYAYAxcW1FHpnxa
         QNV3qZtHsmp/xqgEwr8YcVG0dy+1+/HgTyR/NqtG1B4UAF6XBTIK2x7C822MIqNc5mCl
         1yR1+u/siwfiQq/YQQ0l3ECiPnjQrdt3rChwLI74+JlbCapAFQjZHU0Xv3i5ZjFRE8g1
         KEMh69a9h1WzDY6ZMCBhUMFEF1N+7X3PPgsK7twavhPj9h/BQRKpWqO6SoyXSVTGfDJA
         Fvkcvhw+5+s7XlcpYkvnQd8mDO/tuxgRRPKbbN7d8OZ+asDojW9+2zrOCQ0FltXEvE3B
         /Etw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SFo6AVw97R2wCBIFYeT75YVKRSh5N0fKfYv/Pz+bvSk=;
        fh=hdFRlbnxxkjS9tDxbo6Fpszunuktg8QIBrSh2pK7cJ0=;
        b=nqPivQu3t9quBEJnS6xd6eg/+S88rr+VzZFECxbVYd73iglUj0dySjDAKFHmnSl5VH
         Pxvn1S/A7/WsMrJm0pEQPEgXVQfQvIRyAQbFjoN1AS1UYZ0M6tvaW/6aO+U9oA5k2RdY
         pr8A50JNCg7fMwdA9IEYkUqPfsQqwKsHQtweSOoUO5e7OT4yjh/QvqtGJBQTpRvwaYpy
         ZHVenisSrIeYSWIgcyaMov3Gn7ChezEcd5OljDJvTo1jiTXQ/632zkHIICCpnJaFDD0m
         6333AfniHq+X4MpTuC3PGLh3vOQdQOpaXQ7zgwMkelpEyie7cT5Q44QjEX72EvmznNrq
         gDnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795461184; x=1796065984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SFo6AVw97R2wCBIFYeT75YVKRSh5N0fKfYv/Pz+bvSk=;
        b=DVYU9vn1DqAWQYOlUxFkfhUi66cAjkHIsqcu10r+duux7csRxPJv73b+mZwuZH4wTd
         Ymz4wKI7Jl7pM6Z8kIst2hSNA7IbRCtKU87fVUdTJElzvbbYICRl35ukOjsGw0ZpDvc2
         0cr0i+K7JfNVmwFRaSjl+Ll4R7i5kYC7MfQUNj0mcQftf3672NiZ0ZgB10x1dJ0RjVvy
         W+FuGku/sDvfvBmhGNNuEeK3QvmiL6suOXLzuJjNzLAeQ6k3WXFRCA5jdU9UHrE54D1O
         WLTeppnjzn/ChZNiZgCEDZ47QZtNVtT5nL/20IGFvHXDSRaLDph4OfmFNxUKuWaep9SC
         17hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461184; x=1796065984;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SFo6AVw97R2wCBIFYeT75YVKRSh5N0fKfYv/Pz+bvSk=;
        b=foTr/2ISsk2DlOPeNKleojRsBrOSWG5wzzL6D9gH46k5KyegxkAsLvCaamKGfAYz18
         NT57nY9IvxruNVZuEHat2GL0Hq3ebppr/JPwqSZ5hda6I0QZcWsQ+njClhVftnuDCmQw
         EtoznVAImOtRXaJCGZ0i7GAr03cS+c/0VwTsfnW1o+kIILBUd/bMLvdsraPiRxK0b1Le
         YlDV/GKZeO7d4twifwGett2XuhlhuQBW42bzjyNfHYBkEYTEYn6/lyMIxCwc52okAnx7
         uOgX8dR2c2ya3tG3Tk5A2hBimeeAkrEpVCF9BHpIaZ1vMNBg5QVetUaYZMSrRLPaZBrL
         KZjQ==
X-Gm-Message-State: APuU4Z9mjHRTcgyy/cHGCgfSlPSnTibFJQF8EKJfDc5CdxUSR/xAFE9C
	f37SP2nz6hOibtoUOwC1NCZ/M8v82dkeOCAqTH4dsHyjyluUWWDcQuLmyouxilOjI9DkBqQYmc8
	8DODKB7iiS3CAlVpawyc7RV0ArHInun2sdy45HzYW
X-Gm-Gg: AZFdTZfLGamWSYqXNXO5A+TU+5J+gg+b9+jfxKCCAxNUWSNdAOangZWLDfz1OqQBa0D
	FLh0cRni3E09aKSdfmmI0My3iYbSSX1NW5gwIjrhewrPWhw7X4QGnd3Fr3Q5QE27eLyx7le+hg8
	PV4AaktAu/4Q+fFX/OR9zDnPVLrr3ELEOsMT/k9WqPlenfaEiWayxO8CdPvYfxH+Of656fLxYJ7
	0eIAqq8S0tamupGj9dac9AjDk1XEre3NvorqnMlWCyi+5fBP+la6/qpUas7CiT4Ws5/7kPGf3E7
	rG80nPmcC4ydFrO40W/Uz1lTYgim3MqlRepLRfVhjcmPgSqNXIzNgPW9Stpoki/b3UDibk/Wk3I
	qTmHwxaodAjba9xH7WsojgR/WYj6VHLbzy48Qc5Q+fjNq3zyEH8uS+fPQq5vUEaATIsdwORxSZz
	jRBZyT3345eACexGS7qVg/1Cm6sYANhKMTtm6bqOBE6Z9k+mmgsmB0WEaGi4oSFQGbSvHvUVgPv
	julxeD4AH59sEeZSOLaX4SkH+3zsz7hnwuPog==
X-Received: by 2002:a05:6000:2082:b0:4aa:ba0f:c24 with SMTP id
 ffacd0b85a97d-4abb3956754mr24614079f8f.40.1795461183189; Mon, 23 Nov 2026
 11:13:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122105646.2223131-2-ardb+git@google.com>
In-Reply-To: <20261122105646.2223131-2-ardb+git@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 23 Nov 2026 11:12:52 -0800
X-Gm-Features: Aa3M54r6JmUuoccFpePkZck7gBy4-XWk5fve6pPNHXm6KMQa4IK8PAKHdQcHNY8
Message-ID: <CAKwvOdkOjGkGajGMKtqcHpRSrpXC9UZrH9XPsiv5Rpcdte5tJQ@mail.gmail.com>
Subject: Re: [PATCH] locking/local_lock: Don't evaluate the per-CPU lock
 pointer if unused
To: Ard Biesheuvel <ardb+git@google.com>, Bill Wendling <morbo@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 2:56=E2=80=AFAM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> When lock debugging is disabled, local_lock_acquire() and friends are
> empty, and so the per-CPU lock pointer that is passed to them, which is
> usually computed using this_cpu_ptr(), is not used at all.
>
> However, on x86, when the compiler does not support named address spaces
> (i.e., Clang), this_cpu_ptr() is based on inline asm with a memory

I had to look this one up ("named address spaces").

https://gcc.gnu.org/onlinedocs/gcc/Named-Address-Spaces.html#x86-Named-Addr=
ess-Spaces

So __seg_fs / __seg_gs ?

CC_HAS_NAMED_AS : arch/x86/Kconfig#2331

Weird, clang _does_ seem to support these, since clang-11 (clang-17 is
the current minimum supported default).
https://godbolt.org/z/cfhj8r69E

commit 47ff30cc1be7 ("x86/percpu: Enable named address spaces for all
capable GCC versions")
added a

depends on CC_IS_GCC

What happens if you turn that off?

Ah, a week after that commit was authored, the same author filed
https://github.com/llvm/llvm-project/issues/93449

(currently assigned to Bill; Bill, can you PTAL?)

They also filed
https://github.com/llvm/llvm-project/issues/93449

https://github.com/llvm/llvm-project/issues/187893 looks like possible
a dup of one of the above.  Bill, can you please take a look at those
3?

> operand, and Clang does not discard such inline asm even if its result
> is unused. So the computation of the per-CPU address of the lock is
> emitted regardless, e.g., on every local_lock_nested_bh() in
> process_backlog() and on every local_lock() in the folio batching code.

I'm more so curious how you even noticed this problem? Was there a
thread? Were you looking at some assembler and wondering what was
going on here? Or was there another thread about this?

Very detailed commit message, but you kind of bury the lede here on
what the actual problem this patch is fixing *is*.

>
> This was addressed before by commit
>
>   9983a9d577db ("locking/local_lock: Make the empty local_lock_*() functi=
on a macro.")
>
> but that change was reverted by commit
>
>   2d2f8f083ef2 ("Revert "locking/local_lock: Make the empty local_lock_*(=
) function a macro."")
>
> once commit
>
>   1c1e7e3c23dd ("x86/percpu: Remove volatile from arch_raw_cpu_ptr().")
>
> had dropped the volatile qualifier from the inline asm, on the basis that
> the compiler no longer emits the unused per-CPU reference in that case.
> This is true for GCC, but not for Clang.
>
> So implement the !CONFIG_DEBUG_LOCK_ALLOC versions of these helpers as
> macros that only reference their argument in dead code, so that it is
> type checked but never evaluated. Referencing it only in an unevaluated
> context instead, as the typecheck() in the original macros did, makes
> Clang complain about per-CPU locks that are only used via these helpers
> (-Wunneeded-internal-declaration), which is what commit
>
>   a4812d47deff ("mm/page_alloc: mark pagesets as __maybe_unused")
>
> had to work around at the time.
>
> Also, only evaluate the lock pointer in __local_lock_acquire() and
> __local_lock_release() when it is actually needed, i.e., for
> local_trylock_t.
>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Boqun Feng <boqun@kernel.org>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Bill Wendling <morbo@google.com>
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: llvm@lists.linux.dev
> Fixes: 2d2f8f083ef2 ("Revert "locking/local_lock: Make the empty local_lo=
ck_*() function a macro."")
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  include/linux/local_lock_internal.h | 47 +++++++++++++-------
>  1 file changed, 30 insertions(+), 17 deletions(-)
>
> diff --git a/include/linux/local_lock_internal.h b/include/linux/local_lo=
ck_internal.h
> index 234be7f12c15..7c3191438c90 100644
> --- a/include/linux/local_lock_internal.h
> +++ b/include/linux/local_lock_internal.h
> @@ -69,10 +69,21 @@ static inline void local_lock_debug_init(local_lock_t=
 *l)
>  #else /* CONFIG_DEBUG_LOCK_ALLOC */
>  # define LOCAL_LOCK_DEBUG_INIT(lockname)
>  # define LOCAL_TRYLOCK_DEBUG_INIT(lockname)
> -static inline void local_lock_acquire(local_lock_t *l) { }
> -static inline void local_trylock_acquire(local_lock_t *l) { }
> -static inline void local_lock_release(local_lock_t *l) { }
>  static inline void local_lock_debug_init(local_lock_t *l) { }
> +
> +/*
> + * The argument passed to these is usually a this_cpu_ptr() expression, =
which
> + * is implemented using inline asm when the compiler lacks support for n=
amed
> + * address spaces (e.g., Clang). Clang may fail to discard such inline a=
sm
> + * even if its result is never used, so only reference the argument in d=
ead
> + * code, which type checks it without evaluating it. (Referencing it onl=
y in an
> + * unevaluated context such as sizeof() would make Clang complain about =
per-CPU
> + * locks that are only used via these helpers being unneeded.)
> + */
> +static inline void __local_lock_typecheck(local_lock_t *l) { }
> +# define local_lock_acquire(l)         ({ if (0) __local_lock_typecheck(=
l); })
> +# define local_trylock_acquire(l)      ({ if (0) __local_lock_typecheck(=
l); })
> +# define local_lock_release(l)         ({ if (0) __local_lock_typecheck(=
l); })
>  #endif /* !CONFIG_DEBUG_LOCK_ALLOC */
>
>  #define INIT_LOCAL_LOCK(lockname)      { LOCAL_LOCK_DEBUG_INIT(lockname)=
 }
> @@ -105,20 +116,23 @@ do {                                               =
               \
>         local_lock_debug_init(lock);                            \
>  } while (0)
>
> +/*
> + * Only evaluate @lock if it is actually used, i.e., for local_trylock_t=
, or
> + * when lock debugging is enabled (see local_lock_acquire() above).
> + */
>  #define __local_lock_acquire(lock)                                     \
>         do {                                                            \
> -               local_trylock_t *__tl;                                  \
> -               local_lock_t *__l;                                      \
> -                                                                       \
> -               __l =3D (local_lock_t *)(lock);                          =
 \
> -               __tl =3D (local_trylock_t *)__l;                         =
 \
>                 _Generic((lock),                                        \
>                         local_trylock_t *: ({                           \
> +                               local_trylock_t *__tl =3D (local_trylock_=
t *)(lock); \
> +                                                                       \

Why do we need the temporary?

>                                 lockdep_assert(__tl->acquired =3D=3D 0); =
   \
>                                 WRITE_ONCE(__tl->acquired, 1);          \
> +                               local_lock_acquire((local_lock_t *)__tl);=
 \
>                         }),                                             \
> -                       local_lock_t *: (void)0);                       \
> -               local_lock_acquire(__l);                                \
> +                       local_lock_t *: ({                              \
> +                               local_lock_acquire((local_lock_t *)(lock)=
); \

Is this cast necessary?

> +                       }));                                            \
>         } while (0)
>
>  #define __local_lock(lock)                                     \
> @@ -181,18 +195,17 @@ do {                                               =
               \
>
>  #define __local_lock_release(lock)                                     \
>         do {                                                            \
> -               local_trylock_t *__tl;                                  \
> -               local_lock_t *__l;                                      \
> -                                                                       \
> -               __l =3D (local_lock_t *)(lock);                          =
 \
> -               __tl =3D (local_trylock_t *)__l;                         =
 \
> -               local_lock_release(__l);                                \
>                 _Generic((lock),                                        \
>                         local_trylock_t *: ({                           \
> +                               local_trylock_t *__tl =3D (local_trylock_=
t *)(lock); \
> +                                                                       \
> +                               local_lock_release((local_lock_t *)__tl);=
 \
>                                 lockdep_assert(__tl->acquired =3D=3D 1); =
   \
>                                 WRITE_ONCE(__tl->acquired, 0);          \
>                         }),                                             \
> -                       local_lock_t *: (void)0);                       \
> +                       local_lock_t *: ({                              \
> +                               local_lock_release((local_lock_t *)(lock)=
); \
> +                       }));                                            \
>         } while (0)
>
>  #define __local_unlock(lock)                                   \
> --
> 2.56.1.750.gf70dc682cf-goog
>


--=20
Thanks,
~Nick Desaulniers
