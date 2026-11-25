Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795580297;
	b=TNPf2z7SiFHIBXXU/+k3uLMX5/Lx2ZtwEZwTAOiGBvYTnXmEPnKybcdQr7PnZm2xr1N4
	 PNGYTdcaS6HFQBLXMl02fLplZGTocZYPPml9pOSM2IMgxKNHi90iQg8+4gFGQOvgEs8oG
	 T2IICosopyQM150MiM1gvOr5bx9Ocrjej7Q/fL9YbvMYf7qRc8W/cOBINns7Vg1vdJcxs
	 NxDFe2HF7LWmp5O3nW3kGXCAy2KsPjdkmbJ9czORiI7c45McJovspYl4h6F1H84zc3Vjw
	 9ySr54jlGOxqOcEAQv1PrQHfWOmL5rZCZp+lRExieBAtjQqWJjEDGEGrB8aX+aXRWAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kLeHDG2VnEXhT3JsLotiTiwhgWFVUUN1QQojkOZhb2I=;
	b=ubeEOBGdWdQkvEnhOSa9dzR18rQhXzk2GxULp+4WjWAwXsUR3X4OB0AUnk0x8f8KSrnP
	 e41HSVp1xeZAl+6sdWQQdtdbMh/5zWEJ4dQ1JcN/DG+beK5diVsnTotkoXXc+sPRd6Bke
	 r1qehTcIcUQSLf1LeuO+qA+1WtignLQTkZ9vsIimywDw5AgLWq+tPjrB3BchiNT0hH2Ps
	 VzVKqQQFZuCfjI7XyMqCY8dRtoeNlkAA6sGlo+0eRLw9qe1m1nDD0Br4vu9Caiv5C0g02
	 WhIdg7n1UDRjGD+wFqfryUdW1+aeMjfnZEfz/ZBQYVxx4OJ439fgIQ/tfxNV+dCoBaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gr4V25J5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F25C606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F25C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gr4V25J5
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9912c47367cso3438411241.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:18:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795580296; cv=none;
        d=google.com; s=arc-20260327;
        b=aqNnndsAbwXkZydHifHDaXMmPz3Wgkl1b8vUYog9ErAovbZWsv2anQ33uOVF2oArQc
         w3HkmotjKScafFKhgRt80utTKHz3TwR5zpP2sPQjYXJ96EEpDlUCUNjcB1Y7LUNzcP+a
         IXnA0nXr6deIPdQIAphUah2r0TXbpEtI5Xy1O7gdfBnScA7mAYRJzHWMiFl9ixxewWP2
         eJEge3YtXENBJdYf4T4EWgOqWZ7V1Ci/pKc3iww3lMPE8PGwItu9jn6RrSb1TkjS7XM5
         1yiGqpEe6CPIChmiIe7n1OsL7rH8QJgXTfzDmKtrVxn+0un2fP6yY5ufYFXYa+17UNS3
         7e5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kLeHDG2VnEXhT3JsLotiTiwhgWFVUUN1QQojkOZhb2I=;
        fh=TP5FoAIwA6WXjXUAvzNGR+vxV8gLiNXAUEi6B+YYaJk=;
        b=GIHbfL2ws6rqNZQSOq8IIn3pNOWcaecsOKlS696a4fTbU2VI4w2gqN8Z9KMtzmqJJV
         pXRle7SD0/7T7YV9HgGmbWoH7l4Tca/CZPdjuUPOyxPZHKIKXC6QWuKB9NA4XdOUo08r
         sJLGawWkwTa+mwm2LLRCxN8QCKLsL48cTE/5F7+ia0C/FGlw5aVb8o4FoX3ec6Sufd+Y
         Eovys4iVIjbjljncymkV3Dohr1YdKRTW6zX1ZNymF4oOgRj5WFWqUvpY6k2Jtw6VgkJ9
         6L55Z2dlGldNb0DsYaZnplAEmAY8qtnyZ1PHyW9N6y1SiwYCfbIczfCI8h7pjkPgon0Q
         a8/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795580296; x=1796185096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kLeHDG2VnEXhT3JsLotiTiwhgWFVUUN1QQojkOZhb2I=;
        b=Gr4V25J5P7BKBn0hrLKwdOaxCKfi33xlDSKABVG9b3SBg7R49I/LmFG/rHdDo+/IDj
         8ABDwK3CAw+gRQE7tMTvB/me+goYNKDSPf/+CXTiO4lsY4mdOSgJsUYeFwKxy7tKNkcn
         N8qi46Fw3QR151tdVh3lddwqDAv2gPij7WkmvoLz8Lirw4fjJvx5OZemRS1kTSkZXLTa
         kfo1Lm+wSMhAtdWExiTl9EsbBYmC+J8d/1dfUSmExuybUJmGpKmfhYSzQU7VfqjIAz95
         pmjSXmMMZ28kMPG69JhJltRejSQFGg5AMgKnOKhgRX2ShFWSfenhoeYPOmRYbQQisxhA
         oYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580296; x=1796185096;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLeHDG2VnEXhT3JsLotiTiwhgWFVUUN1QQojkOZhb2I=;
        b=xKaiZIkynLfiYRqEY36A0elOVA1MpzI/M0XN/xEhaZoXZ32cGicHVB+9fNWpmC13UF
         LgnMkXLpr69Y/E5KCAJhZ5PH3WmU4hQuksSAp3nvTrWLAstb7V1ejIEdfaHihMhqUvPh
         IYSESZ9O7pqBaNYZ6NDV/I6h0cT1cH8mDJEdBXR5FqvpPy9VEpMQyb1sXcs3geJc/iUy
         3o313taMC+a3PSGSDjarUUVjWu/voVcJFYlX/6IZSaPNVvt5xkSEwqDG1OAufi0UKV1+
         Nv3ODWFDjO9ehBLxrEzfgDzjPYsHCHprG0DpMAd0tfss4bNTvhhuZvnLJY61ok8YtGWu
         Q6zw==
X-Forwarded-Encrypted: i=1; AL+hErG9tWLJib1obTAJV7bns0hdm+LzfdpDE/jlcNOyZMVJ+QA4OzCZczrilce8X2VNyf7mqFnKQfOpPI48BCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z96xj78n9MnsQZHE3I9pBllTPO39ce6ex6e4aJeS5BgoHGmr+jY
	D/lmgHZF9W0Q4Ed2S/lbce4342fcIUufwsk3iDP7ateJJarJRgBDXr05xE0k7PWh6yHBJouHkRn
	jTgf4/b9nZQSK58t/JpNv+15pHb/D8+t970gRwwKP
X-Gm-Gg: AZFdTZcFgSGCmWO+kpHpFvRWQyAjU/AajaVOyZx5XbXrIpkk38gkrpZXdjBODQk4Vo+
	rPuktkdXJMVfZk/ZUrH2IWIyh1DrjysCnQ66POkaicHm53zYQLPvEGT8iZHxb50O9OYsebLVhxi
	c7BImAxQJrU5uwHOemiljFrTEHNAxu9nN7/JFpm+A5J8TffhMioKtFwEUiYtPZUHI+5uyviKqC9
	nRAMGa/8dmyob4i5rBi03oLguRSQDkogGKwDQpD036I8LJYg/KbEVn2wEEa1j1Q1X0HzyJKwos/
	NnBZB/lCsfdF2+ONWHDJIchgGckHqC7ndtKpl1diZvwtcXKktL9fWxDA/veEsOhuPMvgYqnH06T
	QLU8LA2irFCwOuXsWhlDkZsNnx0g8DmMetJmbj3wPXkYCYtb4WG0qJH7dmw==
X-Received: by 2002:a05:6102:41a3:b0:7a3:b2c2:2e70 with SMTP id
 ada2fe7eead31-7d7395e32c3mr5734305137.11.1795580295324; Tue, 24 Nov 2026
 20:18:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117045254.1048298-1-dylanbhatch@google.com>
 <20261117045254.1048298-2-dylanbhatch@google.com> <awIMltMpXzhXiDpU@jpoimboe>
In-Reply-To: <awIMltMpXzhXiDpU@jpoimboe>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Tue, 24 Nov 2026 20:18:04 -0800
X-Gm-Features: Aa3M54pyIniNB_vn7eg13DbCLk1cWp5ylttVhb4AKr3piHRNkIg2PU3xZVlnsAY
Message-ID: <CADBMgpzifnY=3wF2vt01UTaqPE68N2e9oe5WoSMDUrdgBSWgvA@mail.gmail.com>
Subject: Re: [PATCH 1/2] sched, livepatch: Fix transition stall for CPU-bound tasks
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Shuah Khan <shuah@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Gleixner <tglx@kernel.org>, live-patching@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Josh,

On Sat, Nov 21, 2026 at 1:55=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Tue, Nov 17, 2026 at 04:52:53AM +0000, Dylan Hatch wrote:
> > Commit 676e8cf70cb0 ("sched,livepatch: Untangle cond_resched() and
> > live-patching") moved klp_sched_try_switch() from cond_resched() into
> > __schedule() and gated it on READ_ONCE(curr->__state) & TASK_FREEZABLE.
> > This causes livepatch transitions to stall when a CPU-bound kthread or
> > PF_USER_WORKER thread (such as vhost-<pid>) spins in a kernel loop with
> > cond_resched() for two reasons:
> >
> > 1. A sole runnable task on a CPU (cfs_rq->nr_queued =3D=3D 1) never has
> >    TIF_NEED_RESCHED set during sched_tick(), and wake_up_state(task,
> >    TASK_INTERRUPTIBLE) in klp_send_signals() is a no-op for a
> >    TASK_RUNNING kthread. Because _cond_resched() is a no-op under
> >    CONFIG_PREEMPTION=3Dy, the task only enters __schedule(SM_PREEMPT) o=
n
> >    return from interrupts via irqentry_exit_cond_resched() when
> >    TIF_NEED_RESCHED is set.
> > 2. Even when __schedule() is entered via preemption or an unfreezable
> >    sleep (such as PF_NOFREEZE kthreads or PF_USER_WORKER threads
> >    sleeping in TASK_INTERRUPTIBLE), curr->__state does not have
> >    TASK_FREEZABLE set, so klp_sched_try_switch() skips the task.
> >    Livepatch safety in __schedule() is already guaranteed by
> >    stack_trace_save_tsk_reliable() inside klp_check_stack().
> >
> > Fix both issues by:
> > - Removing the TASK_FREEZABLE check from klp_sched_try_switch() and
> >   checking TIF_PATCH_PENDING inline via klp_sched_need_resched().
> > - Calling resched_curr(rq) in sched_tick() when klp_sched_need_resched(=
)
> >   is true for the current task, ensuring CPU-bound tasks with a pending
> >   livepatch enter __schedule() at the next timer tick.
> >
> > Note that when a CPU-bound task is the sole runnable task on its CPU,
> > entering __schedule(SM_PREEMPT) from preempt_schedule_irq() leaves an
> > in-kernel interrupt pt_regs frame on the stack during
> > klp_sched_try_switch(). Completing the transition in that context
> > requires arch_stack_walk_reliable() to support unwinding across
> > in-kernel exception frames (as CONFIG_UNWINDER_ORC=3Dy does on x86_64);
> > configs and architectures whose reliable unwinder rejects in-kernel
> > exception frames (x86 with CONFIG_FRAME_POINTER=3Dy, arm64, powerpc, an=
d
> > s390) still require another runnable task to context-switch the spinnin=
g
> > task out until exception-boundary reliable unwinding (e.g. via SFrame)
> > is available.
> >
> > Fixes: 676e8cf70cb0 ("sched,livepatch: Untangle cond_resched() and live=
-patching")
>
> Oof, so Peter's patch broke all non-ORC for this case :-(
>
> Not sure what we can do about that other than get kernel sframe/eh_frame
> working for exception boundary unwinding, as you mention.
>
> > Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> > ---
> >  include/linux/livepatch_sched.h | 13 +++++++++++--
> >  kernel/sched/core.c             |  3 ++-
> >  2 files changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/livepatch_sched.h b/include/linux/livepatch_=
sched.h
> > index 065c185f27638..748b6012e2e06 100644
> > --- a/include/linux/livepatch_sched.h
> > +++ b/include/linux/livepatch_sched.h
> > @@ -11,15 +11,24 @@ void __klp_sched_try_switch(void);
> >
> >  DECLARE_STATIC_KEY_FALSE(klp_sched_try_switch_key);
> >
> > +static __always_inline bool klp_sched_need_resched(struct task_struct =
*curr)
> > +{
> > +     return static_branch_unlikely(&klp_sched_try_switch_key) &&
> > +            unlikely(test_tsk_thread_flag(curr, TIF_PATCH_PENDING));
> > +}
> > +
> >  static __always_inline void klp_sched_try_switch(struct task_struct *c=
urr)
> >  {
> > -     if (static_branch_unlikely(&klp_sched_try_switch_key) &&
> > -         READ_ONCE(curr->__state) & TASK_FREEZABLE)
> > +     if (klp_sched_need_resched(curr))
> >               __klp_sched_try_switch();
> >  }
> >
> >  #else /* !CONFIG_LIVEPATCH */
> >  static inline void klp_sched_try_switch(struct task_struct *curr) {}
> > +static inline bool klp_sched_need_resched(struct task_struct *curr)
> > +{
> > +     return false;
> > +}
> >  #endif /* CONFIG_LIVEPATCH */
> >
> >  #endif /* _LINUX_LIVEPATCH_SCHED_H_ */
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 04b62c16fa8ca..fcea9cea3edf1 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -5854,7 +5854,8 @@ void sched_tick(void)
> >       hw_pressure =3D arch_scale_hw_pressure(cpu_of(rq));
> >       update_hw_load_avg(rq_clock_task(rq), rq, hw_pressure);
> >
> > -     if (dynamic_preempt_lazy() && tif_test_bit(TIF_NEED_RESCHED_LAZY)=
)
> > +     if ((dynamic_preempt_lazy() && tif_test_bit(TIF_NEED_RESCHED_LAZY=
)) ||
> > +         klp_sched_need_resched(curr))
> >               resched_curr(rq);
>
> Hm, so for unpatched tasks this forces a full preemption and stack walk
> on every scheduler tick?
>
> Instead can we just kick the thread in the existing klp_send_signals()
> escalation path like below (untested)?

Sounds good to me, moving to klp_send_signals() for v2. I encountered
two issues with your suggested diff as-is:

1. Based on kernel/trace/rv/monitors/opid/opid.c it looks like we
can't call set_tsk_need_resched from here:

rv: monitor opid does not allow event sched_need_resched on state any
with env irq_off=3D0,preempt_off=3D1

It looks like resched_cpu() works (suggested by my AI tool), so
sending v2 calling this instead.

2. I think this also misses user tasks stuck in the kernel with the
same behavior, so I moved the resched logic out of the (PF_KTHREAD |
PF_USER_WORKER) block. I also added coverage in the selftest, so the
same cond_resched situation is also created from a user task.

>
> diff --git a/include/linux/livepatch_sched.h b/include/linux/livepatch_sc=
hed.h
> index 065c185f27638..77161f5725dcc 100644
> --- a/include/linux/livepatch_sched.h
> +++ b/include/linux/livepatch_sched.h
> @@ -13,8 +13,7 @@ DECLARE_STATIC_KEY_FALSE(klp_sched_try_switch_key);
>
>  static __always_inline void klp_sched_try_switch(struct task_struct *cur=
r)
>  {
> -       if (static_branch_unlikely(&klp_sched_try_switch_key) &&
> -           READ_ONCE(curr->__state) & TASK_FREEZABLE)
> +       if (static_branch_unlikely(&klp_sched_try_switch_key))
>                 __klp_sched_try_switch();
>  }
>
> diff --git a/kernel/livepatch/transition.c b/kernel/livepatch/transition.=
c
> index e058d21d84b75..1ccbae2051c72 100644
> --- a/kernel/livepatch/transition.c
> +++ b/kernel/livepatch/transition.c
> @@ -402,12 +402,22 @@ static void klp_send_signals(void)
>                  * Meanwhile the task could migrate itself and the action
>                  * would be meaningless. It is not serious though.
>                  */
> -               if (task->flags & PF_KTHREAD) {
> +               if (task->flags & (PF_KTHREAD | PF_USER_WORKER)) {
>                         /*
>                          * Wake up a kthread which sleeps interruptedly a=
nd
>                          * still has not been migrated.
>                          */
> -                       wake_up_state(task, TASK_INTERRUPTIBLE);
> +                       if (wake_up_state(task, TASK_INTERRUPTIBLE))
> +                               continue;
> +
> +                       /*
> +                        * If it's running, force it through __schedule()=
 so
> +                        * it can switch itself in klp_sched_try_switch()=
.
> +                        */
> +                       if (task_curr(task)) {
> +                               set_tsk_need_resched(task);
> +                               kick_process(task);
> +                       }
>                 } else {
>                         /*
>                          * Send fake signal to all non-kthread tasks whic=
h are
>
