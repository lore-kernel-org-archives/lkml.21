Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795661927;
	b=oSmh4dxkzNZl8rx8el2kr1lp34Q/IQhjU6qqAABeatjyr+AKJTADiIht9+reSwKezul8
	 trZ4EKa81Zz66otA4m2MuSC8HBvykXeOBQ5jrI7YhdD0ssZiflX10DsqPBKAb67jkPueB
	 g+oAUWMymLbgn7huZuwuC4XV/dy1CsrNCEJOmLreyKSYmS4nqPBaUSLRORp4euqmEM1rs
	 I9ESZfKR1M8eD5wg646uynf1xIMRuCdhxPwMff69FVyoINXDi0RBzYe8LJ1YXoXpM1uMW
	 ztPzjpYJeE57iFcorPSS7mokjjJqOMGqNOqCm3a5ZIdHmFqsYWsNNVSRF0ri4/rSqxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Jcf46vMrL1Ak3SRRaGZ9cHEca600Xi/gbcvc53XSl6M=;
	b=KqcRZ3cnjDoZufXaqCPDUWuH6JJvifJNeQ9Tfb93l9L1rpn70EIVY+LM3txsnPIx6a4t
	 3nR9HVRl28IC7jhR1VXhdR7kGQ3gy6wPuxspnrDMNnoL+nutH9n6GGPOJfKOtfennhRmj
	 KvPfSBemX5P3MH5AGh5/KdhrGKBSWT73LP9GOvwMXLECW+9RipTG+2JVZ+AtXxZdU1bOO
	 mgxjldnBEGqcAmJcLT94f7SUO5sw6xRnJmYubHlKukIdzLaPzqqVutf9X2/rNUqD+9N3x
	 kylJJajcuOYmsB/7qrob7RV0Mg7jJP+d5Q8RKxI/4lGizvCkT2is4kYnMAsjV5P65oQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="s/r8Hg18";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E45606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06E45606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s/r8Hg18
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so4065224f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:58:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795661925; cv=none;
        d=google.com; s=arc-20260327;
        b=O0OoiXnM8VsogoYw9oHK3NxYuncwhU1QULvLJI6uGodrZfyGiF5YroBD+QhHpPhCkH
         eZ0u5QElOB/QV4hVr1EiWsrgl4Cc8W4HVbSX/8N6PI2xAAE3iOmFidQj/8+db9BTHhZ0
         XoMJmc0rok+n4sxiviTJ1kODSwrdSvhv1UoB7JRiTg9Tkbz4Zli0nH5KerhXJyPGdYIh
         KcMQvslI7l5/hS+1IT+7kqBpl+pXKQYP+NMLJ5vNrBasmCQImTaJ7ip9HAcQ5cO6nYjv
         tcsL8Q7clJwtokFhb8eaazMmDtEbV29eab4DZzAxaPcc5xCDgbzZX1Oj0GMZ/Ckzog69
         MMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jcf46vMrL1Ak3SRRaGZ9cHEca600Xi/gbcvc53XSl6M=;
        fh=3HP18voVIx4dMgTM//LaRcIllNWtCgsBNRz9b+SmLdI=;
        b=iPOvVcfoZklAInA6RF9F1fvMDUftJTAVTHj2Q6M+v5WWJA8wS7D5EawzuatkAtirzz
         8m42CGDLoMJ1dLTspTRNYR2uJqESE1r7vcaLP254uqrFkSCcQwUyYRpq2dZFIDefpBKL
         BW7H6WKJ4Y3uKtg7Jcm/7l/ry72rd5ipBr9m/ZTi/iUR7Cf89+f4VLe6+jR1zGzGd8Ot
         YGVs8KjCZ6cpilDLElojHi7iqUXmYdUwudlXWanS3YQeeUZ29Br6Ciyt09o31/9ZWBRn
         Z6xVi6HlOtJwJ2rGjJj4rQ9KGAHpZV1GdjOdTEFsiCDDCm7FdhLGUZGPm9rTmg16QkzU
         L2lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795661925; x=1796266725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jcf46vMrL1Ak3SRRaGZ9cHEca600Xi/gbcvc53XSl6M=;
        b=s/r8Hg18FrJblqdWFGWVzUgbEgFq61sfKi5K9hLBScs0jKDLLbxEALFrQffzy5Weml
         BOj4zRpRn3NVZGNgzcoWo6iWQyqUvy3Db2M3VzhqC2EeEMpilqsPZfyiSBAkgA1+2oc6
         4te8oyjyFoLxMOWy3z1dw0tDGbC4CeITWURTt8vff6cSYIdSGaSgGCZp61RYwwnNHhQG
         TkByypWspNoq7djJOO0Zv+StD1LuMP2ebH5Fak0D+gJcnnBY8OiU4mdxotWU9WWSFUN7
         wWzRul7fgN/ZYDUCMJSNg+MlS0wAYutqZNi7LdLAtDbmjaWNADUePJ2+GX577aMK7M55
         8jQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661925; x=1796266725;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jcf46vMrL1Ak3SRRaGZ9cHEca600Xi/gbcvc53XSl6M=;
        b=j51QoWtuFGXI8/5acepr7O1pfxOMrerxvZyesUcZ2eAE9d0Fo0s4zfUxRNyLCCqg8r
         GuKoUxxC7MOs7i/ITCRbdsDMOg2WIoJbPNBLzCX7/cQZm1IpXQLNKc9gy0wWmzPOQSmC
         MA1A6rX18TTwO7RupXt/qT7ZghhBMsLdlLc15INrCY9qQWzYK5BnbQuRjVXLeGGXM1eV
         z1wBY70N5BgT17utn+njDEOuN1Gd1r3rJOxNOPa5SuZKrfHJ/EfDqIHByb5NjCS93Pm7
         Y9m5pKJTjGdSyEnezvE+4dwbYU2dYV5Z76WayPnA5I7Ngp+3TGa4nojFHKQbBrmNOx9U
         Amog==
X-Forwarded-Encrypted: i=1; AL+hErGgIgXSLxrHGxrHxqWdy8WSHUg4U4R95fnyrODljPhGJe4rpQhf+RfM/IIv4n8xWjvrsYYQmQvXnQDSnPc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YME3edg3m8Y451dE+3Yuwydl52+hs1oyk4MqfuSRFsBHw1/pH
	jP7OvWp+r/NjxWBb53atCzSeHGjL/8o8HRttk0mtZcRIJQwFrCgdiqinue0kmFAWMfW2me4spmT
	vlUSLdTGi58Ki3TeqyKlm7v/Ixaua6F8=
X-Gm-Gg: AZFdTZcHwg5VYG2xzypmW8hI4XXJPDEaEAjpqoxk8gPj+llGQcG75oXSRJr2xtuLpCa
	WyZXjakof71CYmICyhzRKK0wswO4m9UyS0BHFxre+huS65B1X7bI7D09lJMITkLtvOQg4DTTTmX
	AVwULrHswT21cv+DRxvxGhKZoYzlMi6fSKPNjYZzsN2xaX6KdQMdVDi+f2ZWtEVFLWriFtajxtb
	djJQAXCiZ36UPhzEMqIgMXPIe+yg6CrfgCR4TOtb03wYxKUgTJ4y/z4ssxioA3pM0MT6Z+BSdCM
	Rjur53t6QGe1IG7Ce0a+l4S9vEJI8DXidlrhHgFQCzisHolT1AO8iDZs2ScOsaMauKZCfHbZa8V
	ujOhNdY7WdLyon5RxxKuGkOXRgdewOfb9t9SXMWYrBRhWkYKytOzM9B3bjfCBF2pMqkxpFUMZXI
	OMskl6fABaE+5LcJEADn9yRoZn0kL3wOL+xgLp
X-Received: by 2002:a05:600c:5303:b0:4a2:1a:a11d with SMTP id
 5b1f17b1804b1-4bb88785d24mr379605215e9.0.1795661924538; Wed, 25 Nov 2026
 18:58:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123135148.1146372-1-elver@google.com> <CAN_Opa_TKjDAWz8EQaw6ro=joymwurpcy-k_x=q4E6TLt6ZpUQ@mail.gmail.com>
 <CANpmjNNOVD3KVrau5KD4WzqxoMkZZoJCfdPzvjLmZsGy9zXBug@mail.gmail.com>
 <CAN_Opa9zKzSptpNOnCzaW_EK0oT=HDDVoJxy5Q0crM+6b9bR_g@mail.gmail.com> <awdlqAbyRyJdSVeG@elver.google.com>
In-Reply-To: <awdlqAbyRyJdSVeG@elver.google.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 26 Nov 2026 10:58:32 +0800
X-Gm-Features: Aa3M54ochhGaRkCzJjnnDdPYZBZX-ICAJDvpktjGqTffKLARgZDNnQQDN4W6cyY
Message-ID: <CAN_Opa-Oa1-NiR9bHLkT-Z1pb+JDTj+oTKv_phVitVtwsV1EDA@mail.gmail.com>
Subject: Re: [PATCH] kcsan: Detect cross-CPU races on {READ,WRITE}_ONCE_THIS_CPU()
To: Marco Elver <elver@google.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 6:48=E2=80=AFAM Marco Elver <elver@google.com> wrot=
e:
>
> On Wed, Nov 25, 2026 at 05:40PM +0800, KunWu Chan wrote:
> [...]
> > Makes sense to keep the test in both configurations.
> >
> > I reran the three new KUnit cases on next-20261123 with rcutorture
> > disabled, using the same image with interruptible watchers on and
> > off.  Both runs passed all three cases at all seven thread counts
> > (21/21 per run, no skips).
> >
> > With watchers on, I checked the console reports for both remote
> > cases.  The two accesses were on different CPUs in each report.
> > The earlier -EBUSY and remote_read failures did not reproduce.
> > The separate 60-second rcutorture run also completed without any
> > reports involving got_idle_tick or tick_nohz_handler.
> >
> > One question about the IRQ-off path.  A local NMI can still write
> > to the watched address while its KCSAN checks are disabled.  If
> > that changes the sampled value and no other access hits the
> > watchpoint, is an unknown-origin report expected for THIS_CPU?
>
> Yeah, but we can suppress it:

Thanks, that addresses my NMI concern. The trade-off makes sense
to me.

>
> diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
> index 51340bf1d4a3..b3e0c2627712 100644
> --- a/kernel/kcsan/core.c
> +++ b/kernel/kcsan/core.c
> @@ -689,7 +689,9 @@ kcsan_setup_watchpoint(const volatile void *ptr, size=
_t size, int type, unsigned
>                 kcsan_report_known_origin(ptr, size, type, ip,
>                                           value_change, watchpoint - watc=
hpoints,
>                                           old, new, access_mask);
> -       } else if (value_change =3D=3D KCSAN_VALUE_CHANGE_TRUE) {
> +       } else if (value_change =3D=3D KCSAN_VALUE_CHANGE_TRUE &&
> +                  /* May be due to a permitted write from NMI on this CP=
U. */
> +                  !(type & KCSAN_ACCESS_THIS_CPU)) {
>                 /* Inferring a race, since the value should not have chan=
ged. */
>
>                 atomic_long_inc(&kcsan_counters[KCSAN_COUNTER_RACES_UNKNO=
WN_ORIGIN]);
>
>
> The downside is not detecting races with uninstrumented code, but usage
> of *_ONCE_THIS_CPU() is still rare, and if someone wants that coverage
> back, we can think of something better. In general, I find the unknown-
> origin reports not all that helpful in many cases, so my preference is
> to just ignore those.
>
> > Tested-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> Below is the complete v2 patch with the unknown-origin suppression.

I tested v2 on next-20261123. A 60-second rcutorture run with
strict KCSAN completed without any reports involving got_idle_tick
or tick_nohz_handler.

With rcutorture disabled, I ran the three new KUnit cases twice
with interruptible watchers on and twice with them off.
remote_write and local_noreport passed at all seven thread counts
in all four runs. The remote_read results were:

  watchers on:  one run passed; threads=3D5 failed in the other
  watchers off: threads=3D4 failed in one run; threads=3D5 and 8
                failed in the other

I also saw intermittent remote_read failures on v1 with
rcutorture enabled. Have you seen this in your runs?

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu

>
> Thanks,
> -- Marco
>
> ------ >8 ------
>
> From: Marco Elver <elver@google.com>
> Date: Mon, 23 Nov 2026 11:03:32 +0000
> Subject: [PATCH v2] kcsan: Detect cross-CPU races on {READ,WRITE}_ONCE_TH=
IS_CPU()
>
> READ_ONCE_THIS_CPU() and WRITE_ONCE_THIS_CPU() identify accesses to
> per-CPU data that are intended to race only with other contexts on the
> same CPU. So far they are plain READ_ONCE() and WRITE_ONCE(): no marked
> accesses involving them are reported, incl. from other CPUs.
>
> Make the new accessors assert exclusivity but ignore same-CPU accesses:
> READ_ONCE_THIS_CPU() asserts no concurrent writers,
> WRITE_ONCE_THIS_CPU() asserts no concurrent accesses.
>
> For KCSAN to ignore racing accesses from other contexts on the same CPU,
> introduce KCSAN_ACCESS_THIS_CPU, which makes KCSAN keep interrupts
> disabled while the watchpoint is set up. A value change without a racing
> access is not reported for these accesses, since it may be due to a
> permitted write from an NMI on the same CPU.
>
> With that, any racing accesses (incl. marked ones) from other CPUs
> involving READ_ONCE_THIS_CPU() and WRITE_ONCE_THIS_CPU() will be
> reported as "KCSAN: assert: race ...".
>
> Suggested-by: KunWu Chan <kunwu.chan@gmail.com>
> Tested-by: Kunwu Chan <kunwu.chan@gmail.com>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  include/asm-generic/rwonce.h | 22 +++++++--
>  include/linux/kcsan-checks.h |  1 +
>  kernel/kcsan/core.c          | 10 +++-
>  kernel/kcsan/kcsan_test.c    | 90 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 117 insertions(+), 6 deletions(-)
>
> diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
> index 3dc65a3310fb..e2d563096738 100644
> --- a/include/asm-generic/rwonce.h
> +++ b/include/asm-generic/rwonce.h
> @@ -66,11 +66,25 @@ do {                                                 =
                       \
>   * which are intended to race only with accesses from other execution
>   * contexts on the same CPU, e.g. task and interrupt context.
>   *
> - * For now, these are simple wrappers around READ_ONCE() and
> - * WRITE_ONCE().
> + * With KCSAN, concurrent writes (for READ_ONCE_THIS_CPU()) or any concu=
rrent
> + * accesses (for WRITE_ONCE_THIS_CPU()) from other CPUs are reported.
>   */
> -#define READ_ONCE_THIS_CPU(x)          READ_ONCE(x)
> -#define WRITE_ONCE_THIS_CPU(x, val)    WRITE_ONCE(x, val)
> +#define READ_ONCE_THIS_CPU(x)                                          \
> +({                                                                     \
> +       auto __tc_p =3D &(x);                                            =
 \
> +       kcsan_check_access(__tc_p, sizeof(*__tc_p),                     \
> +                          KCSAN_ACCESS_ASSERT | KCSAN_ACCESS_THIS_CPU);\
> +       READ_ONCE(*__tc_p);                                             \
> +})
> +
> +#define WRITE_ONCE_THIS_CPU(x, val)                                    \
> +do {                                                                   \
> +       auto __tc_p =3D &(x);                                            =
 \
> +       kcsan_check_access(__tc_p, sizeof(*__tc_p),                     \
> +                          KCSAN_ACCESS_ASSERT | KCSAN_ACCESS_WRITE |   \
> +                          KCSAN_ACCESS_THIS_CPU);                      \
> +       WRITE_ONCE(*__tc_p, val);                                       \
> +} while (0)
>
>  static __no_sanitize_or_inline
>  unsigned long __read_once_word_nocheck(const void *addr)
> diff --git a/include/linux/kcsan-checks.h b/include/linux/kcsan-checks.h
> index e135dacaa90f..afe50fe351fa 100644
> --- a/include/linux/kcsan-checks.h
> +++ b/include/linux/kcsan-checks.h
> @@ -20,6 +20,7 @@
>  /* The following are special, and never due to compiler instrumentation.=
 */
>  #define KCSAN_ACCESS_ASSERT    (1 << 3) /* Access is an assertion. */
>  #define KCSAN_ACCESS_SCOPED    (1 << 4) /* Access is a scoped access. */
> +#define KCSAN_ACCESS_THIS_CPU  (1 << 5) /* Ignore races from same-CPU ac=
cesses. */
>
>  /*
>   * __kcsan_*: Always calls into the runtime when KCSAN is enabled. This =
may be used
> diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
> index 26755add7cdb..b3e0c2627712 100644
> --- a/kernel/kcsan/core.c
> +++ b/kernel/kcsan/core.c
> @@ -567,9 +567,13 @@ kcsan_setup_watchpoint(const volatile void *ptr, siz=
e_t size, int type, unsigned
>          *      1. Races of the reordered access with interrupts. To avoi=
d, if
>          *         the current access is reorder_access, disable interrup=
ts.
>          *      2. Avoid races of scoped accesses from nested interrupts =
(below).
> +        *
> +        * Similarly, KCSAN_ACCESS_THIS_CPU accesses may only race with
> +        * interrupts on the same CPU: disable interrupts, so that only r=
aces
> +        * with other CPUs are detected.
>          */
>         is_reorder_access =3D find_reorder_access(ctx, ptr, size, type, i=
p);
> -       if (is_reorder_access)
> +       if (is_reorder_access || (type & KCSAN_ACCESS_THIS_CPU))
>                 interrupt_watcher =3D false;
>         /*
>          * Avoid races of scoped accesses from nested interrupts (or sche=
duler).
> @@ -685,7 +689,9 @@ kcsan_setup_watchpoint(const volatile void *ptr, size=
_t size, int type, unsigned
>                 kcsan_report_known_origin(ptr, size, type, ip,
>                                           value_change, watchpoint - watc=
hpoints,
>                                           old, new, access_mask);
> -       } else if (value_change =3D=3D KCSAN_VALUE_CHANGE_TRUE) {
> +       } else if (value_change =3D=3D KCSAN_VALUE_CHANGE_TRUE &&
> +                  /* May be due to a permitted write from NMI on this CP=
U. */
> +                  !(type & KCSAN_ACCESS_THIS_CPU)) {
>                 /* Inferring a race, since the value should not have chan=
ged. */
>
>                 atomic_long_inc(&kcsan_counters[KCSAN_COUNTER_RACES_UNKNO=
WN_ORIGIN]);
> diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
> index 1c8853f14dae..3e9689492abe 100644
> --- a/kernel/kcsan/kcsan_test.c
> +++ b/kernel/kcsan/kcsan_test.c
> @@ -22,6 +22,7 @@
>  #include <linux/kcsan-checks.h>
>  #include <linux/kernel.h>
>  #include <linux/mutex.h>
> +#include <linux/percpu.h>
>  #include <linux/sched.h>
>  #include <linux/seqlock.h>
>  #include <linux/spinlock.h>
> @@ -337,6 +338,7 @@ static struct {
>         long val[8];
>  } test_struct;
>  static long __data_racy test_data_racy;
> +static DEFINE_PER_CPU(long, test_pcpu_var);
>  static DEFINE_SEQLOCK(test_seqlock);
>  static DEFINE_SPINLOCK(test_spinlock);
>  static DEFINE_MUTEX(test_mutex);
> @@ -403,6 +405,34 @@ static noinline void test_kernel_assert_access(void)
>         ASSERT_EXCLUSIVE_ACCESS(test_var);
>  }
>
> +static noinline void test_kernel_read_this_cpu(void)
> +{
> +       sink_value(READ_ONCE_THIS_CPU(test_var));
> +}
> +
> +static noinline void test_kernel_write_this_cpu(void)
> +{
> +       WRITE_ONCE_THIS_CPU(test_var, 42);
> +}
> +
> +static noinline void test_kernel_write_this_cpu_local(void)
> +{
> +       preempt_disable();
> +       WRITE_ONCE_THIS_CPU(*this_cpu_ptr(&test_pcpu_var), 1);
> +       preempt_enable();
> +}
> +
> +static noinline void test_kernel_reset_this_cpu_local(void)
> +{
> +       long *p;
> +
> +       preempt_disable();
> +       p =3D this_cpu_ptr(&test_pcpu_var);
> +       if (READ_ONCE_THIS_CPU(*p))
> +               WRITE_ONCE_THIS_CPU(*p, 0);
> +       preempt_enable();
> +}
> +
>  #define TEST_CHANGE_BITS 0xff00ff00
>
>  static noinline void test_kernel_change_bits(void)
> @@ -1223,6 +1253,63 @@ static void test_assert_exclusive_access_scoped(st=
ruct kunit *test)
>         KUNIT_EXPECT_FALSE(test, match_expect_inscope);
>  }
>
> +/* Test that remote writes racing with READ_ONCE_THIS_CPU() are reported=
. */
> +__no_kcsan
> +static void test_this_cpu_remote_write(struct kunit *test)
> +{
> +       struct expect_report expect =3D {
> +               .access =3D {
> +                       { test_kernel_read_this_cpu, &test_var, sizeof(te=
st_var), KCSAN_ACCESS_ASSERT },
> +                       { test_kernel_write_atomic, &test_var, sizeof(tes=
t_var), KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ATOMIC },
> +               },
> +       };
> +       bool match_expect =3D false;
> +
> +       KCSAN_TEST_REQUIRES(test, !IS_ENABLED(CONFIG_KCSAN_IGNORE_ATOMICS=
));
> +
> +       begin_test_checks(test_kernel_read_this_cpu, test_kernel_write_at=
omic);
> +       do {
> +               match_expect =3D report_matches(&expect);
> +       } while (!end_test_checks(match_expect));
> +       KUNIT_EXPECT_TRUE(test, match_expect);
> +}
> +
> +/* Test that remote reads racing with WRITE_ONCE_THIS_CPU() are reported=
. */
> +__no_kcsan
> +static void test_this_cpu_remote_read(struct kunit *test)
> +{
> +       struct expect_report expect =3D {
> +               .access =3D {
> +                       { test_kernel_write_this_cpu, &test_var, sizeof(t=
est_var), KCSAN_ACCESS_ASSERT | KCSAN_ACCESS_WRITE },
> +                       { test_kernel_read, &test_var, sizeof(test_var), =
0 },
> +               },
> +       };
> +       bool match_expect =3D false;
> +
> +       begin_test_checks(test_kernel_write_this_cpu, test_kernel_read);
> +       do {
> +               match_expect =3D report_matches(&expect);
> +       } while (!end_test_checks(match_expect));
> +       KUNIT_EXPECT_TRUE(test, match_expect);
> +}
> +
> +/*
> + * Test that races between task and interrupt on the same CPU's instance=
 are not
> + * reported; the test threads' timers access the same per-CPU instance a=
s the
> + * interrupted thread. Only meaningful with CONFIG_KCSAN_INTERRUPT_WATCH=
ER=3Dy.
> + */
> +__no_kcsan
> +static void test_this_cpu_local_noreport(struct kunit *test)
> +{
> +       bool match_never =3D false;
> +
> +       begin_test_checks(test_kernel_write_this_cpu_local, test_kernel_r=
eset_this_cpu_local);
> +       do {
> +               match_never =3D report_available();
> +       } while (!end_test_checks(match_never));
> +       KUNIT_EXPECT_FALSE(test, match_never);
> +}
> +
>  /*
>   * jiffies is special (declared to be volatile) and its accesses are typ=
ically
>   * not marked; this test ensures that the compiler nor KCSAN gets confus=
ed about
> @@ -1485,6 +1572,9 @@ static struct kunit_case kcsan_test_cases[] =3D {
>         KCSAN_KUNIT_CASE(test_assert_exclusive_bits_nochange),
>         KCSAN_KUNIT_CASE(test_assert_exclusive_writer_scoped),
>         KCSAN_KUNIT_CASE(test_assert_exclusive_access_scoped),
> +       KCSAN_KUNIT_CASE(test_this_cpu_remote_write),
> +       KCSAN_KUNIT_CASE(test_this_cpu_remote_read),
> +       KCSAN_KUNIT_CASE(test_this_cpu_local_noreport),
>         KCSAN_KUNIT_CASE(test_jiffies_noreport),
>         KCSAN_KUNIT_CASE(test_seqlock_noreport),
>         KCSAN_KUNIT_CASE(test_atomic_builtins),
> --
> 2.56.1.839.g22a8290db9-goog
>
