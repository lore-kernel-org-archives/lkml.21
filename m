Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794993629;
	b=eMe2hKEzxa7JRO9+Vtx/ytCwgU67R4PMvt+5WcKQL8kvT3Ft4vOXlXWrCGs97ejEx6yq
	 +3p3gtPDN1yGx07+FEZ3YfiTvZHrKckUToLNoa8LDErPl4ugmJokEILkPZ7Bce7avrTyb
	 t6lKljxNBALJ9IhQMbU97tl2QsU+QDT7Jia5BAilwVIJ2boIzDodJSGLvW8Rpn5xFdOWW
	 21G9dj+NrPkq3c4x3nmR9plbCJxrKDWBAXgC0/jsUDrpHPVWAGYfwh4ynLqjko7CVxvtB
	 xr37WO8ytOJwCTNCxtENQwfQMXvVjiFKVExlkyJFyT02rxLy+tHhK5JpWXCjTUIb7WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Aeo8Kc6gDZPXZvE0DmabfYTz/zNuvasGH9KV0/D9kjE=;
	b=nmSbQmkYN5dQCbmNM12ZgtjsGPA+yf/RUSZXvSZBtoPBfZSIx/I6l58Vy/IMF+ANUxdx
	 mfrtUXwLj6bzlxc3KpVWVnwsxnLfeRRY36YzquzULF8PubhIxm7U1GqpLpUQSP2KOP9Kc
	 ld7RWhvmO25JPFISpdOjU5tkShzpXtNpURZP6yvA3Wb9AYnNYLBgAoI7skbVyDN8ldwIn
	 lLd+06KZmiDE12tZr28wkEuTiREelJP4u8e7+oY5D6KDLuox3QVbQM6cnarRpJ9ro3sbB
	 5fI5yPALPmLSgG5kcJeNFrsIQ2KDfhYN+PnYkA5K7jlgOwfM3tUzAD8Ko4fYgyx2MhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iyLBskJd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76064606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76064606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iyLBskJd
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so1122202a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:20:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794993628; cv=none;
        d=google.com; s=arc-20260327;
        b=BhXQPeBkJCke4rT5q5L7KXm5LY8PvOrMcm5YP1ZsfiofF82LKUv0AAs9TgXFoYbZNv
         opf/wAPSPc4+kgNUBxVYb08M4p/x1a8FZnhGqDjH9NEhyY4DPx13F0XIeuo7QT74LINO
         OOinjgLJW8OxPvS0FkTo8DnVtU+to8oWi/JZJuH6R0j/+Z2W3X3micMxtKEhNDz8QxAy
         R21KLFb3qwpploX0mJJZy6XCHh2sr6TiOShtR6tshGRIB8Flw6agkkMEoVFBxrjZvqbS
         lkn6evog/cU8J6GU48ZWlTUiMoletL1cLNjBkiLDR8eMASnAbv1ZzQj5p1CtOqpL96tk
         VMQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Aeo8Kc6gDZPXZvE0DmabfYTz/zNuvasGH9KV0/D9kjE=;
        fh=eaNKhkTWpjR5KHXz/5ebW3/1WW6L+5KNVpkFdAU0Bik=;
        b=oITpAMHf/9V/SIKfU1sQlIfcyvZluwmt7VJC4Eoq5mZQXeHDM0612uY5gkdyy+zv5g
         fOBfKeqFKMeE021kAotHCnDK6Eza0gd4RrfcIGpndVSGj3/AopBxIscVdVmUPwSH53dU
         bcxBD5aTr7YVpCDGLtz2DggzefoinpA0WDuYM2Ga1goCol09PjaxRu0fs8NKhVG/9nla
         LtnDksLc7BQdl3lvauiG+JmwUrxK+DWba/iYOcgm9zOeY30wKQzpTI6OfO1m09dAqSNs
         rzcu4h4HNDpnh742L5y9W4C/tr0fBFdULoeLb5P6ZraANen9WA01HpzY0NT/0pRqVK6t
         cgGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794993628; x=1795598428; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aeo8Kc6gDZPXZvE0DmabfYTz/zNuvasGH9KV0/D9kjE=;
        b=iyLBskJdIJtYGSnIY6piD6QVm91jLi12dM2xCcsHRaMWSWN690hEfVOHUUlWHsOG8p
         Eci2PpHWtm9mJ9KckBu6HcEg3M2rL3Kly9c4Vv+YVrZPu4vAwR3YM0FesX2SQuxwt2f+
         7Gadniz8CG14kuqgyHf7rJTpxGh6mfKbWIao2LHP67ckbIEwMp+5CV5NbP5C4VG8WGEM
         tqEaq7Qka8acwIXS1GE9Zu8bJxCIFFZ7rvD97vjPCvrOygYLNSvTxJLUQwX89y8aoQH1
         vtX13yPITnlM6+NkXDSByUNvW+ZeptLlZp0jZhbW2XWc84XM10wOVHxXoc1maSuwfAT/
         nWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794993628; x=1795598428;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Aeo8Kc6gDZPXZvE0DmabfYTz/zNuvasGH9KV0/D9kjE=;
        b=q/9JcZK1ZSFh4TIpeJ7Wu+iGTq4wiKXNZXyI1thFTWUzFgErvynzqHYrySjOtVyLeJ
         0te5pKf47CwMt1P4ye8Zx/Sqs5CIOjqXYKkZPb7ldEbvvU7YN6LOG/ZfQKQh0UzpmLGG
         KivDzmlHKk7HaS9o00kPRaQOsocMrVYggyYuSx9+kfr7JjlKs7/xiSz+R2emDLkyXoEe
         sbbx3iHUqaIJCHtQIZN+sv8CDoBcxvi1ZtHnp9EMIoqFjiauHRTO6N/TxFnhfelr5DNS
         v5DEgKzoGGhv4ghUtRmDXQLtLk00mQa1hm+YgRqXrqe8xNqGeaz123s+vUJwYJDq7n3r
         cK7A==
X-Forwarded-Encrypted: i=1; AL+hErFz9FM+j4tarzHg36CVj1P+2ir5TVmHTEL/UkIxzGrt7mwmO3Qtx8fWSMF6mG+Bd0GnOpp0oRnFcgMTXwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/W1Qr+yGWWDaUqwI1dThRvNuDScox6ftRaQiL2e0YQ7SLpZYeh
	VDBfbSmvjxRqB1a7aB6ihoZW9QnOB8redKX9/o71Wk+jY1XywIWcNixyAhQQUBAyi+57NppF+Zs
	IqqanHRgaHi/bZYybQ4UyoA666DBkZcso71cfOVc7OA==
X-Gm-Gg: AYBFou284BCZBcmZni+KX4s2KzM0wzRdUnm1eDUWdtXSjwIwbE9Qdb88dyxn7pzu4nA
	3iNpgAqbF5Auudoz709dofWD3u9ZpHqzVU/a8ko3k2eYGapL3VS9yZ5IDJz+i54ES5BrBkYQbH6
	2b06zN8QIJs6JafXKoxf+R6Ypnb6je2rDeUGK6ZLYqniVqeRCq34qYCIP24CrtyAge08qwzOCdX
	yVCTDteH4LnscvG/Ni7tuC4AQO2Po6ya/ujz5+CN1WVgcAqia6qVGyATw45DBx/lY8jzdhib/VN
	sg+T4dZzg4M6VmB9gOFgvmCgpauJg/2BZEXMFWEZ8E/8qhUeAuC6tcHifHGUUHoHI6e64+eUR4i
	HHeBzmPbFO0u16hBwaSWLOa76XfSGecKFS3szl7KqsqsDvVW80AM2q7QinNtWcdT1saj3TVzhSi
	UTaU44iFTws0+P
X-Received: by 2002:a05:6402:5025:b0:6b7:dda4:f72c with SMTP id
 4fb4d7f45d1cf-6b88814ddbemr1418382a12.44.1794993627427; Wed, 18 Nov 2026
 01:20:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
 <20261106151947.3991524-2-vincent.guittot@linaro.org> <avr4MsRsjGfGHKKk@scheduler.schedules>
In-Reply-To: <avr4MsRsjGfGHKKk@scheduler.schedules>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 18 Nov 2026 10:20:14 +0100
X-Gm-Features: AclHuK_oniCwAqlI2oAZeu8xsFu1h8iipcGgGgvvNigzDOS5HzX_db5ZNqKqLFA
Message-ID: <CAKfTPtBZ=Dc_X48EQ0yXMym0JrS=pWvbviyVyFri0tv5VdR3Eg@mail.gmail.com>
Subject: Re: [PATCH 01/20 v3] sched/eevdf: Decay positive lag of sleeping entities
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org, 
	linux-pm@vger.kernel.org, tj@kernel.org, void@manifault.com, 
	arighi@nvidia.com, changwoo@igalia.com, sched-ext@lists.linux.dev, 
	qyousef@layalina.io, christian.loehle@arm.com, pierre.gondois@arm.com, 
	sshegde@linux.ibm.com, tim.c.chen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 14:57, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
>
> Hi Vincent!
>
> On Fri, Nov 06, 2026 at 04:19:28PM +0100, Vincent Guittot wrote:
> > Similarly to delayed dequeue, which enables an entity to decay its negative
> > lag while sleeping, a task should not keep a positive lag forever.
> >
> > The sleep duration and the weight are used to decay the positive lag at
> > wakeup.
> >
> > Apply the decay when enqueueing on prev rq for which we hold the lock to
> > get rq_clock_task().
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  kernel/sched/fair.c | 124 ++++++++++++++++++++++++++++++++------------
> >  1 file changed, 90 insertions(+), 34 deletions(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 0feec172fd37..5cd171f830d8 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -897,6 +897,91 @@ bool update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
> >       return avruntime - vlag != se->vruntime;
> >  }
> >
> > +/*
> > + * Signed add and clamp on underflow.
> > + *
> > + * Explicitly do a load-store to ensure the intermediate value never hits
> > + * memory. This allows lockless observations without ever seeing the negative
> > + * values.
> > + */
> > +#define add_positive(_ptr, _val) do {                           \
> > +     typeof(_ptr) ptr = (_ptr);                              \
> > +     __signed_scalar_typeof(*ptr) val = (_val);              \
> > +     typeof(*ptr) res, var = READ_ONCE(*ptr);                \
> > +                                                             \
> > +     res = var + val;                                        \
> > +                                                             \
> > +     if (val < 0 && res > var)                               \
> > +             res = 0;                                        \
> > +                                                             \
> > +     WRITE_ONCE(*ptr, res);                                  \
> > +} while (0)
> > +
> > +/*
> > + * Remove and clamp on negative, from a local variable.
> > + *
> > + * A variant of sub_positive(), which does not use explicit load-store
> > + * and is thus optimized for local variable updates.
> > + */
> > +#define lsub_positive(_ptr, _val) do {                               \
> > +     typeof(_ptr) ptr = (_ptr);                              \
> > +     *ptr -= min_t(typeof(*ptr), *ptr, _val);                \
> > +} while (0)
> > +
> > +static inline unsigned long cfs_rq_load_avg(struct cfs_rq *cfs_rq);
> > +static unsigned long task_h_load(struct task_struct *p);
> > +
> > +static __always_inline
> > +void decay_entity_lag(struct cfs_rq *cfs_rq, struct task_struct *p, int flags)
> > +{
> > +     struct sched_entity *se = &p->se;
> > +     s64 delta_exec, vlag = se->vlag;
> > +     unsigned long cfs_load;
> > +     struct rq *rq;
> > +
> > +     WARN_ON_ONCE(se->on_rq);
> > +
> > +     /* Negative lag is managed by delayed dequeue path */
> > +     if (vlag <= 0)
> > +             return;
> > +
> > +     rq = rq_of(cfs_rq);
> > +
> > +     /* No fast access to prev rq task clock */
> > +     if (flags & ENQUEUE_MIGRATED)
> > +             return;
> > +
> > +     /* Compute sleep time */
> > +     delta_exec = rq_clock_task(rq) - se->exec_start;
> > +     if (unlikely(delta_exec <= 0))
> > +             return;
> > +
> > +     /* For anything above ~4 seconds, save computation and clear the lag */
> > +     if (unlikely(delta_exec >> 32)) {
> > +             se->vlag = 0;
> > +             return;
> > +     }
> > +
> > +     /*
> > +      * Use cfs' load and p's weight to estimate what would have been the
> > +      * share for p. task's load contribution to cfs' load is replaced by
> > +      * its weight.
> > +      */
> > +     cfs_load = cfs_rq_load_avg(cfs_rq);
> > +     lsub_positive(&cfs_load, task_h_load(p));
> > +     if (cfs_load) {
> > +             unsigned long weight = scale_load_down(se->h_load.weight);
> > +
> > +             delta_exec *= weight;
> > +             delta_exec = div64_long(delta_exec, cfs_load + weight);
> > +     }
> > +
> > +     vlag -= calc_delta_fair(delta_exec, se);
> > +
> > +     /* vlag can't become neg while sleeping */
> > +     se->vlag = max(0, vlag);
> > +}
>
> Look:
>
> Let's say we have 3 tasks named TA, TB and TC. They all have the same
> weight and the same slices. So TA gets picked, works for a while and then
> sleeps for less than the rest of its slice.
>
> So the part that I hate and love, math. For your diff, we do:
>
> (sleep_time * weight) / (3 * weight)
>
> 3 * weight here is TA + TB + TC, it equals to 3 * weight since they all
> have the same weight.
>
> So if sleep_time equals 2, weight equals 1, and slice equals 3 this equals
> 2/3. If the lag is 2, we do 2 - 2/3 resulting with 4/3.

yes, we assume that TA would have run 1/3 of its sleep time

>
>
> Later, place_entity() uses this formula to do V - ((Sum(weight) + weight) * lag) / Sum(weight)
> So ((2 + 1) * 4/3) / 2 equals to 2. But this is wrong, no?

why is this wrong ?

Assuming TB and TC have the same vruntime before placing TA, the
average vruntime is avg == V(TB) == V(TC).
place_entity will do V(TA) = avg - 2
After placing TA, avg' = (V(TA) + V(TB) + V(TC)) / 3
avg' = (3*avg - 2) / 3 = avg - 2/3
TA's lag is : (avg - 2/3)  - (avg - 2) = 4/3 which is what we assumed above
TB's lag equals TC's lag : (avg - 2/3)  - avg = -2/3

>
> If we didn't decayed lag: ((2 + 1) * 2) / 2 equals 3.
> So we would do V - 3.

Which would end up once placed to
avg' = (3*avg - 3) / 3 = avg - 1
TA's lag is : (avg - 1)  - (avg - 3) = 2
TB's lag equals TC's lag : (avg - 1)  - avg = -1

>
> Now our objective is to add the sleep_time of the task to -3.
> Because if the task didn't slept, in that time it would be working
> instead of sleeping.
>
> So, we should do V - 1. But we do V - 2.

Why ?
You assume that the whole sleeping time would have been spent by TA
running on the CPU but we don't really know. We can assume that a task
with positive lag should run first, but this also depends on other
tasks enqueued.
My first version assumed the whole sleep time would have been used to
run which is optimistic. Peter suggested using the ratio of weight and
cfs loads instead which accounts more fairly for the running time.

>
>
> AFAICT, we can't already know for sure how much will a task run even
> when the sleep_time is smaller than the slice. Because of preemption
> :-(.
>
> The cleanest, the simplest and maybe the worst or the best solution I can think of
> is just setting lag to 0 on every wakeup with positive lag TBH.

Keeping eternal positive lag for a long sleeping task is unfair but on
the other end, clearing all positive lag for a micro sleeping or
because of waiting on a shared lock is also unfair

>
> Or maybe, try to calculate when sleep_time is smaller than the slice,
> but just set the lag to 0 when sleep_time is bigger or equal to slice.

There is a difference between sleep time and lag. Even with a sleep
time longer than the slice, the task can still have positive lag after
sleeping (this is also true for runtime). All this depends on how many
other tasks are running simultaneously and their weight

>
> What you think?
>
> Sreehc,
>
> Kayra
