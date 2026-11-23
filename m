Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795454600;
	b=W9daqIwtrrcXu823eBQMPmXjA02wjQw3FCGtX3kGLIGM9LBv16fUdnnXpq78uEo/HH2q
	 6etvxfInKFkQCQ4gpKxkVD8BNRtgpq4I11szlbxBODGcVYaEzSTXd6/PKZ27jfeORQeoE
	 RnW3PSrm0KoF6hBtoxgS19T9Qw4hu7l2LpGI9aUN3e9Ige6EokmaUBYs1ye7e2mzVrObP
	 UdsNDML0sUFZ/6ZL5dFcwDMYnikKUdFQMiCqAMb3tNXqpD9mbEtrUznJ/9gZ7vkAtfdfX
	 wjWKXYfzoMnuPiKNlzjp2cAm/VgsrYC6rDDyhEOdDsfR6y2Um5vLtJ/1w3vUy11o0Ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=pIjZM5YARubpbKnjhnkxxasjXDnuG3q+R/DYJrQigIw=;
	b=KeZP9ir0wS8I++Q8rhI5Je0Thrf+93ADMk+9hhq+mXav/Q9ksmbxgjpwzN3R3gh4S2t2
	 Bt94qy3z8mFX2wMUo8710InllKpF2TmxcIf8kjC80CRsi3HbcsgrcxuCdIxD8V76p9iEF
	 hNBDRvehHu4mBhG/35ccDxMeGarf45vIb8ds4uVNogvJrSRplLi1jslJM+FubXMOXmiY3
	 vUopNqjXpXVRUPx9nWY75INvElODRiGrpQtJ54tvUmdtlcjP9TH5j3WcR8+R+i+8Kti3e
	 oAs4eISEFQLkOHSUZRd52PrPbI9+CpmAZR25vBaPyAsHhk8wRdu+UxrtqVZCafjxd3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lWM5Jyip;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF90606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BF90606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lWM5Jyip
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso4553241a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:23:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795454598; cv=none;
        d=google.com; s=arc-20260327;
        b=fC7d7YtqCdzg2p45LRij2vbtOzR/cB7YaaeSazNkln2Zt9PLJFelUgGj3nd/ZBjtH9
         K6BasQJfZAYYr7HWwfk2AGbOdIn5ZHb+qtT9uP8+oHinBGjoKHXbS8DWKxA+ba21fH2w
         ENLYJl29FpGelpjz+QP+mnWaADjQpS0dYj8RexBKhOZ4wL5B+HYHo0rluZysnPv8UDnE
         vpEHxMEmjsX5XPxVP4ixeT/k6LlgMUttY0V0S9Rpayn31t2o0QUUEejX04Ir66VIjM16
         u0AcPbVRn4UAKNVgmeJFDvjWZIu0ipzGmrJfEIU0/E394RHRLHI9acioig7wTewjapKe
         ekOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pIjZM5YARubpbKnjhnkxxasjXDnuG3q+R/DYJrQigIw=;
        fh=yBawzj1Fv81lcJmXWYx9boPvfyv63w2I4RCF3HM+Kqw=;
        b=fW6WKRjOGqMYsxU8D1HayiGKkdZUneMojDNXNHMih3YnEPGh7kpWzJGcpk3PpQi0pq
         XazXa/J0w6dCkqeBoKdA7blKhugKVsczuFNTLWNFJ2xRMBpL7okxWLnMIUjL4hx9KLEm
         P/CIvkkwQ8GKHBFWdEdJpkIugohBs8osearyWQyp1fEnQZpLZPX45jCUAsWz4bi6CIR2
         rP6zylJTNHOt4YGUpQ/ukcCzTw9NHGIf0VfBadXyXeoy4BSe1L2a1FNSq6wgQITfbUqp
         EEYzK+oMG23C3H/ze7a5TlN2txgup7txJw0fi2sMJNO5/roCXfwtTUotSzMPgO88J+1I
         r79Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795454598; x=1796059398; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pIjZM5YARubpbKnjhnkxxasjXDnuG3q+R/DYJrQigIw=;
        b=lWM5JyipaT3QbErglAxinuL2s2Ih8CWD8z2Ny2IuvS1GkvWyLBUXikfQp2FH5FTkas
         TCtOTNO6hRtallU8IgqJUZ6wDuMglzncZHZ3C5Otpay2ZCkEdezmTEE9fsmqFuXffqEo
         hMEBSc4QVsmUuBdB3ZfaippEwIbj3sisS7rcwI+nBEKVX79WNah/x6Zu3woM+gQTOo9g
         c8Adj1fW1GsLZYVOGLrOJ4lygG0aAH70QL/7QBIavMh7QdnzM+oTQaFzhzMfiIHXNDTu
         G5/B4PEH1Mm3YoYIP6FOKiDoiEMCZjFQcOn3UvRUDBwEGbWcZDfpyabsrz2YL/5CTMLY
         2lqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454598; x=1796059398;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pIjZM5YARubpbKnjhnkxxasjXDnuG3q+R/DYJrQigIw=;
        b=1cornz1dJM7/q1UmM89hoLDpaZg2ydvrQ8XbnObuL45+NWkax4uRz0x6awT6wEf6o2
         6bSiOeimYjENmPy+k44k9NEHc6ldGuNA6GGKnZMYbMksZO5cdEX6JtblKSKN64b+fs3B
         dgT51Jp/YnkMgBg6Es+XlKzxrOR2fXVN2rjFshGu5TwZE/YRbnsYJlxmvlYQ1JURJ/RH
         wcQ3jVwaR3Y1vDLW3jPQXqpAdHxAF5XWedn5svdC+kF7GLLfis0C4hHRUwYtOQwD9L7n
         iFW9/6Y09msbvGMPMxnIftRMKuTLAS7p50cj7gxCTMU/acMUSLw2o3Ui8C9DfIpC0VJl
         X8oA==
X-Forwarded-Encrypted: i=1; AL+hErFsTiYWumYP4qDl/kasv3NXUWrqR3mz5eMcfd/rfq/qKUm3SvWqjhmvb0JnU5CuSzHzEgq0Nf1ZIFea6wg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AC14v4jrdz27s/0so3zq4TTqlHniOdJzL+eqbnHfzrIcjgWFo
	PY+8DAPQwgUlYzhFWypboRMkY1aGiN0WEJVr0C9EpVU5+sqEGxqeEQWu028Xnd+nFyXGlKeM+BF
	MdhlRekSDErif+LbB6o6TKoLVnNeSl4YH5trbCTq8LQ==
X-Gm-Gg: AZFdTZcPbYB3j+IaQoBOVoERT4uOlbI9Zzyw14C3WHZeTC5WHXuOwN6olLK+9PYmQm/
	KXDrJkx5wz8kRTmgj3JJ+l/GEjPReHaAIMnohJTtoqERdDTQzgo776y5lb/SCU4Hp+vjnj/kO33
	RD/UhBukt4hp727k3pq8eiNnKximQurD9DtEc3SvFuu31gB0LAhPTznG3yPi2U7t/cD7TtNd8Vd
	0rvJcX5KGWKzcc98ZfCJrSZ9gD0y50BNMDvZDeaG4LcmSzGIcPRG5u48Sfazif2faO6ImdSbBmL
	RAC1nDQjz0jDUAtbJG1jEd+HTo5vRSiUfnxkcG0Ij9QA1c1QPxQL7ODHp29i1BVUEA/b6sQKJj6
	jV+ntf52lDQulCE3yHYAtz+JtUDc0Feie9sN5u4ZwzjueVuK96y8SGv9v7AnklwLZMKNbVA==
X-Received: by 2002:aa7:c253:0:b0:6b4:1629:b1aa with SMTP id
 4fb4d7f45d1cf-6ba37c7630emr6745183a12.2.1795454598358; Mon, 23 Nov 2026
 09:23:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121041507.39582-1-qyousef@layalina.io> <20261121041507.39582-2-qyousef@layalina.io>
 <282a3922-91da-4145-94b6-d1a6459b6da6@arm.com>
In-Reply-To: <282a3922-91da-4145-94b6-d1a6459b6da6@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 23 Nov 2026 18:23:06 +0100
X-Gm-Features: Aa3M54rXvWgOhC_cPvHi5JLEYdwzDp36KdLwQeW4viCbaDkojRW7f51fTQE4e-U
Message-ID: <CAKfTPtAT_gPBMaw_xyjkY4TTEA6+kuPBAAyNvMvT4Uq6T42xkA@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
To: Christian Loehle <christian.loehle@arm.com>
Cc: Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, 
	Kayra Cizmeci <kayracizmeci@gmail.com>, Wei Wang <wvw@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 15:38, Christian Loehle <christian.loehle@arm.com> wrote:
>
> On 11/21/26 04:15, Qais Yousef wrote:
> > Static keys are not guaranteed to be enabled atomically across CPUs.  Or
> > across callsites on the same CPUs. Which means when sched_uclamp_used is
> > enabled, some CPUs/callsites will return true for uclamp_is_used() while
> > others won't, leading to asymmetric uclamp_rq_{inc, dec}_id. If we
> > decrement without increment this is safe as documented in the code. But
> > an increment without a decrement is a problem and will leave the
> > uclamp_rq in a corrupt state.
>
> So if we only need decrement to work then we can rely on
> p's uclamp_se.active and decrement regardless of uclamp_is_used() and call it
> a day?

The static key prevents overhead for those who don't use uclamp. It's
a default rule for features like numa, cache aware, eas, uclamp etc to
not impact those who don't use it.
I'm afraid that the executing  uclamp_rq_dec up to
p->uclamp[clamp_id].active will not be free of overhead

> See the attached patch.
>
> >
> > The reported case seems to happen due to callsites on the same CPU not
> > seeing the flipped state.
> >
> > Plugging the race is hard as discussed in [1]. Take it for granted and
> > do correction actions on going to idle to guarantee this state is
> > transient for a short period after uclamp_sched_used is enabled.
> >
> > [1] https://lore.kernel.org/lkml/CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com/
> >
> > Reported-by: Wei Wang <wvw@google.com>
> > Signed-off-by: Qais Yousef <qyousef@layalina.io>
> > ---
> >  kernel/sched/core.c  |  2 +-
> >  kernel/sched/idle.c  | 19 +++++++++++++++++++
> >  kernel/sched/sched.h |  3 +++
> >  3 files changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index d7c3b43158dea..c6780358a7975 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -2111,7 +2111,7 @@ static void uclamp_post_fork(struct task_struct *p)
> >       uclamp_update_util_min_rt_default(p);
> >  }
> >
> > -static void __init init_uclamp_rq(struct rq *rq)
> > +void init_uclamp_rq(struct rq *rq)
> >  {
> >       enum uclamp_id clamp_id;
> >       struct uclamp_rq *uc_rq = rq->uclamp;
> > diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> > index 76f3c84ca6846..84301fc49e699 100644
> > --- a/kernel/sched/idle.c
> > +++ b/kernel/sched/idle.c
> > @@ -502,6 +502,25 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
> >        * lost_idle_time of clock_pelt
> >        */
> >       update_idle_rq_clock_pelt(rq);
> > +
> > +     /*
> > +      * Due to a race condition when enabling sched_uclamp_used static key,
> > +      * we can end up with imbalance where uclamp_rq_inc_id() has happened
> > +      * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't seen
> > +      * the static key flipped. The race condition is unlikely, but ensure
> > +      * the uclamp_rq() state is set properly on each entry to idle.
> > +      *
> > +      * The reset will cause the uclamp_max from uclamp_idle_value() to be
> > +      * lost. Since we are imbalanced, hard to know what is right. So just
> > +      * cleanup. This should be a transient error state once we recover
> > +      * everything should work as expected.
> > +      *
> > +      * We need to be careful of some paths that can force idle with tasks
> > +      * are still queued.
>
> It wouldn't hurt spelling these paths out IMO.
>
> > +      */
> > +     if (uclamp_is_used() &&
> > +         !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))
> > +             init_uclamp_rq(rq);
>
> I guess this means init_uclamp_rq() will need to use WRITE_ONCE() for .value at least?
>
> >  }
> >
> >  struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf)
> > diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> > index 7d2ec527b8a25..d87bdbd2121df 100644
> > --- a/kernel/sched/sched.h
> > +++ b/kernel/sched/sched.h
> > @@ -3704,6 +3704,7 @@ static inline unsigned long cpu_util_rt(struct rq *rq)
> >  #ifdef CONFIG_UCLAMP_TASK
> >
> >  unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
> > +void init_uclamp_rq(struct rq *rq);
> >
> >  /*
> >   * When uclamp is compiled in, the aggregation at rq level is 'turned off'
> > @@ -3802,6 +3803,8 @@ uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
> >       return SCHED_CAPACITY_SCALE;
> >  }
> >
> > +static inline void init_uclamp_rq(struct rq *rq) {}
> > +
> >  static inline bool uclamp_rq_is_capped(struct rq *rq) { return false; }
> >
> >  static inline bool uclamp_is_used(void)
