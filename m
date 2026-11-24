Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795512339;
	b=ooi2XjIBAOnJswEw8Jo+8Ulb/nB1q830YoCPCngCpBFisOThjAxZbrbeocXzT+DBa4AH
	 JL3dp7mgVCrm9n6SzaANb44knO4Ynt98xh6HPCb5neIlBErIYUEvj1gSD+pheFYQDAdAj
	 0C3QpdVMYsU1D0XCj1InMJVzGVAZKK7PgRaRmJ7YYujw3UEVCdzDrXg7ih7M309Ol27v/
	 pC0ndyyd6vtbzV6nIv30YQ+H+xtbdW0U32sZMAmdo4t+4TjNrA4O1lnuoAiStfi2+bAGB
	 oDsWZpWWrSRJ+BjI5K2iOPnaa4V74sVvi2bRrHu2r2M52qdBb1HCa6UXPbM3IVUeqLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JXb4dn1nNHSswo4MgAhXlyqcFgRnxdqawmClYiFfd5o=;
	b=pUY0NjE4wuXuQJevccCI8MZ4JYvZs62LIhgk284AZXnyAcA5AjiuhVnp9Hpaks4oolPG
	 vzoQuO/O5ePWL9LLZLd5jDqvD5Uns4kGGCTeiHK8QrXhtjnGfip1Q6EAirUpOXTzKtDXR
	 DeM260SIYptyufbplKutVS4cIoANCFtiweltfv0OVtjOPtDiCUWWGFBO9+N4UtZbP+8V3
	 m9aAWLFtHylLyN32bUpHJijRp+yV+6dbbWOm/Uxxu6j9aS6Cn05g1m3UxOMtpyl563Voa
	 /V+n8g8/LeGFrhoV8rvORhSCC9kb7qs6Os/ajrozdKRsD+4mqyROzjC38JTniJVYNIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fZcExJoN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EEC606A338
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0EEC606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fZcExJoN
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so5704330a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:25:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795512337; cv=none;
        d=google.com; s=arc-20260327;
        b=GO+eztNikFFldDhJSH3fAoaAovKcRRgEp/s0a/LFxgaNSwKtlTgFxsWHSsPEPG5b4o
         Q6I8OwGiQV4/R4XA7+MgPZKy7QKG48G9t5F10ed3mCBbtQl7AAdomalRwspT5bTfUe6q
         V47c/aCywv67ySdNQEr6fHfAICDsFPO0vhkkWLZknEwzNjW/dy/HjJtIjp5/kpekQL2M
         3J0mliuDuimEuVMy0uzVFHYLDjMc2DVnny1czeATWc8tLeUijG1+11indc+Zwg2e4wLW
         55OvXbQn9tQF/aNOAsVnczQX/42X6F6dAg2u6kVKBEsddOxsrFS/jL4/PX4/zLyMzhrV
         d/lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JXb4dn1nNHSswo4MgAhXlyqcFgRnxdqawmClYiFfd5o=;
        fh=Xp+jEEzLlWXaurwSWfzFlDTEBu6Np8FS0oyW7cSzmSU=;
        b=JbD4oid4sZG3BZB7sOdvHPxqUbuo2oI8KNn8tqATXiGo2dxQsAf5hTOeYH10GvezmZ
         yEcdlh1/EekLpdtUkMOQPZBQe01R2BeJ2SeZpo31bm9XBJj1f9pCqPZ3OLKQAkkMVhbq
         LOJ8bpDOxIXAYpPALGLVPOm21PWpFfnJqdEwm/sxD1cUP1sLcy2sv/6Bv7Z6ZhtYXqyt
         ASoNvP//kHSB1A73zI28saDau3n8MSTHFM/HUnCLLm/Q3ldsBGBE6MtyYjdOJSNMn7Nn
         /TxVMiXx2JiSqVomkXvLzoykfIivHu2C1zN/RXE7YWhB9ow0Jz3avyg0WNCfCTiE47r9
         uz2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795512337; x=1796117137; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JXb4dn1nNHSswo4MgAhXlyqcFgRnxdqawmClYiFfd5o=;
        b=fZcExJoNqoCZ2qS09zNQN+zMYUNYjRc/fsv7fnOe6D1afl7iniw4tgy4TB0b/LxGQh
         eE4lPQvATAW3sdHUCVcaQ3BV/jB61++QymOI3KSjdmd+i3JfzM8zX1GQL5WQqpT/8yQ2
         6APZTlcrUismevTgl4xD0pRvy6tobNK1VVDmDDOYb6hza5odZyHAhhLNg4PELnvMgYaf
         XEwitEqs+r6om8zUvUfgAHzZrEkmzFirYZElxNwUkTgNOXAUNLQheDJc+0MQ0xJEcHw9
         bk33+wx/MT9pH9nynQnw/WHYU6JRYZSZ5RZhUSSeZeodLAa+CV9MNrWfMiQoEMbzkXYG
         +E+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795512337; x=1796117137;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JXb4dn1nNHSswo4MgAhXlyqcFgRnxdqawmClYiFfd5o=;
        b=2UQAvfBL65ifkgLock3oNhiuxeDYAD9JX7S9ngPdjZR2aFhznuWi2roqtRr0qr0yUX
         g7n9hyKo/AtX9rbW1MAkLAgqjPqQzEKKzzvuv4z55xb3TheB1bZlkLlqBL6XzPd9+Lk/
         xGo2pAmInQ63qpGjfKWab+vSRLmfuBdtYkJlHfm6eFGvIfNgISNfwdVcPlAPhN8kJazY
         kmV0+OFYn+WDboxOwvexkQVheQ/66mHYeGNhoeHEI7P0jTD/f2dmK44avPy2oRHGlNmJ
         UiHczNrkQy2AtWfQWiTIemD58lIm6G1YVHq3A46prFhSBUOXZa3qYYO06nJnF4gGXe7b
         jRyQ==
X-Forwarded-Encrypted: i=1; AL+hErFq2CG4MoH3qVe0MZkpeR51mOHLBd1eb5Tc5/F3s8PeX3sk4pk9WpA7HXkp0z26rzpYEL+2xDi4V40z1KE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+qQsU3+BUBB8KYPL640PrfFOG9cmZW40sk2G1gRcmiHUnosKh
	krJjVsQH4nP9MjNeMA71RUAPn8sNKNmk/XW94yd5TWBYpB3ZDLT6HNDIsP0G2UXWBCm18M0pQ6T
	XJ1uHVb5US6Rqtfg+fQv7H/eHTX0/h/HLre5r1F67aQ==
X-Gm-Gg: AZFdTZeAT5hUp0M5SdMmSNfuajeLCn4b9HeLSKjYFu50SpzTde0i0chkt3i8QMAQoyT
	qulT7BYZd4zcqvKelJbOUKQy8DK1FWB9bCG+38dWZl4UWk4W/rgyTCYrjCt1a+HBarcu8ys+Ezm
	DrwJL9YS5S5RIsJ1UmN+VKxL4hZ8atXxF+ofHHAXqWyzn5DECguduccy/42ZvvQeKaAHWbGeV4z
	5QxfghojwOgVH9SmonQ2T4e6vDgno8mvNBmxrFMVvTT1A5EFZ3Ruv07ft2AvoNTC3GT/KiPDaWP
	lDKFp6725sJ16FH+s0RCak5iZCg9SOR4Y5Xf2ge23d/81y4TH0Mr4YHS/QInl4bxvD67fQOEo9a
	6/hmn0IZHsHrkXWN2oRfoHQ3lIMIYufkU6oa+hIke8j/HGvOfbpK7jlAOTSLMGNoREAxkLQ==
X-Received: by 2002:a05:6402:4004:b0:6ba:6ec7:abed with SMTP id
 4fb4d7f45d1cf-6ba6ec7ad55mr6346687a12.27.1795512337183; Tue, 24 Nov 2026
 01:25:37 -0800 (PST)
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
 <282a3922-91da-4145-94b6-d1a6459b6da6@arm.com> <CAKfTPtAT_gPBMaw_xyjkY4TTEA6+kuPBAAyNvMvT4Uq6T42xkA@mail.gmail.com>
 <8150e8ee-cd2c-41c0-8c5c-3f0c7a087ac2@arm.com>
In-Reply-To: <8150e8ee-cd2c-41c0-8c5c-3f0c7a087ac2@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 24 Nov 2026 10:25:25 +0100
X-Gm-Features: Aa3M54pVdept4kdX7HHBllIz8kqrPzLIaPZt02LIaLWRdtx5aoumIey6uCHyqw8
Message-ID: <CAKfTPtA87Zm-6DLav2wm1TOZJuoQeZV0AE-ytCnvez=4gmu_fA@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
To: Christian Loehle <christian.loehle@arm.com>
Cc: Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, 
	Kayra Cizmeci <kayracizmeci@gmail.com>, Wei Wang <wvw@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 19:15, Christian Loehle <christian.loehle@arm.com> wrote:
>
> On 11/23/26 17:23, Vincent Guittot wrote:
> > On Mon, 23 Nov 2026 at 15:38, Christian Loehle <christian.loehle@arm.com> wrote:
> >>
> >> On 11/21/26 04:15, Qais Yousef wrote:
> >>> Static keys are not guaranteed to be enabled atomically across CPUs.  Or
> >>> across callsites on the same CPUs. Which means when sched_uclamp_used is
> >>> enabled, some CPUs/callsites will return true for uclamp_is_used() while
> >>> others won't, leading to asymmetric uclamp_rq_{inc, dec}_id. If we
> >>> decrement without increment this is safe as documented in the code. But
> >>> an increment without a decrement is a problem and will leave the
> >>> uclamp_rq in a corrupt state.
> >>
> >> So if we only need decrement to work then we can rely on
> >> p's uclamp_se.active and decrement regardless of uclamp_is_used() and call it
> >> a day?
> >
> > The static key prevents overhead for those who don't use uclamp. It's
> > a default rule for features like numa, cache aware, eas, uclamp etc to
> > not impact those who don't use it.
> > I'm afraid that the executing  uclamp_rq_dec up to
> > p->uclamp[clamp_id].active will not be free of overhead
>
> I get why the static branch is there, but as long as p->uclamp[clamp_id].active
> never changes from 0, like when uclamp is never used, the check should be virtually
> free on any half-decent branch predictor.

The same applies to other features as well and the path includes a for_each

> Also in any case the enqueue path ought to be the expensive part for uclamp.
>
> I can come back with some numbers though, including the original netperf that
> introduced the static key.
>
> >
> >> See the attached patch.
> >>
> >>>
> >>> The reported case seems to happen due to callsites on the same CPU not
> >>> seeing the flipped state.
> >>>
> >>> Plugging the race is hard as discussed in [1]. Take it for granted and
> >>> do correction actions on going to idle to guarantee this state is
> >>> transient for a short period after uclamp_sched_used is enabled.
> >>>
> >>> [1] https://lore.kernel.org/lkml/CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com/
> >>>
> >>> Reported-by: Wei Wang <wvw@google.com>
> >>> Signed-off-by: Qais Yousef <qyousef@layalina.io>
> >>> ---
> >>>  kernel/sched/core.c  |  2 +-
> >>>  kernel/sched/idle.c  | 19 +++++++++++++++++++
> >>>  kernel/sched/sched.h |  3 +++
> >>>  3 files changed, 23 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> >>> index d7c3b43158dea..c6780358a7975 100644
> >>> --- a/kernel/sched/core.c
> >>> +++ b/kernel/sched/core.c
> >>> @@ -2111,7 +2111,7 @@ static void uclamp_post_fork(struct task_struct *p)
> >>>       uclamp_update_util_min_rt_default(p);
> >>>  }
> >>>
> >>> -static void __init init_uclamp_rq(struct rq *rq)
> >>> +void init_uclamp_rq(struct rq *rq)
> >>>  {
> >>>       enum uclamp_id clamp_id;
> >>>       struct uclamp_rq *uc_rq = rq->uclamp;
> >>> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> >>> index 76f3c84ca6846..84301fc49e699 100644
> >>> --- a/kernel/sched/idle.c
> >>> +++ b/kernel/sched/idle.c
> >>> @@ -502,6 +502,25 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
> >>>        * lost_idle_time of clock_pelt
> >>>        */
> >>>       update_idle_rq_clock_pelt(rq);
> >>> +
> >>> +     /*
> >>> +      * Due to a race condition when enabling sched_uclamp_used static key,
> >>> +      * we can end up with imbalance where uclamp_rq_inc_id() has happened
> >>> +      * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't seen
> >>> +      * the static key flipped. The race condition is unlikely, but ensure
> >>> +      * the uclamp_rq() state is set properly on each entry to idle.
> >>> +      *
> >>> +      * The reset will cause the uclamp_max from uclamp_idle_value() to be
> >>> +      * lost. Since we are imbalanced, hard to know what is right. So just
> >>> +      * cleanup. This should be a transient error state once we recover
> >>> +      * everything should work as expected.
> >>> +      *
> >>> +      * We need to be careful of some paths that can force idle with tasks
> >>> +      * are still queued.
> >>
> >> It wouldn't hurt spelling these paths out IMO.
> >>
> >>> +      */
> >>> +     if (uclamp_is_used() &&
> >>> +         !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))
> >>> +             init_uclamp_rq(rq);
> >>
> >> I guess this means init_uclamp_rq() will need to use WRITE_ONCE() for .value at least?
> >>
> >>>  }
> >>>
> >>>  struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf)
> >>> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> >>> index 7d2ec527b8a25..d87bdbd2121df 100644
> >>> --- a/kernel/sched/sched.h
> >>> +++ b/kernel/sched/sched.h
> >>> @@ -3704,6 +3704,7 @@ static inline unsigned long cpu_util_rt(struct rq *rq)
> >>>  #ifdef CONFIG_UCLAMP_TASK
> >>>
> >>>  unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
> >>> +void init_uclamp_rq(struct rq *rq);
> >>>
> >>>  /*
> >>>   * When uclamp is compiled in, the aggregation at rq level is 'turned off'
> >>> @@ -3802,6 +3803,8 @@ uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
> >>>       return SCHED_CAPACITY_SCALE;
> >>>  }
> >>>
> >>> +static inline void init_uclamp_rq(struct rq *rq) {}
> >>> +
> >>>  static inline bool uclamp_rq_is_capped(struct rq *rq) { return false; }
> >>>
> >>>  static inline bool uclamp_is_used(void)
>
