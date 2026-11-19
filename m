Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.159.192.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089997;
	b=LcSjxh8utjfuSetbJe+rpoj1O+fqljjJIkUZIhXMjfAoPd0DyfUOgf/1QWtM0/Hsmse1
	 w1H7wh269yDGXJcaaDf/YEETBWqalqcdTUuRtoHdX4o3t3bXWCGJNAvi0+L+XEFA0CEr1
	 tj54fnpf8Zp9KbIiI8Q9OPn3+LNa+8skK6n5dijO+KMYqwrFVsvN/Un/R7RHc2TgeCLT7
	 Ty/e6wntuR82wFZQQCDLqQxkzKlWYQIIVdT//VSO2xPcXgZ5a9xt3f1lTsG6x97yupU33
	 cGgDG8kkf8cFePblsG5si2/jvtytkzWCrm2tmzuOey1v+A+ZicS6M4N/aYsPOooTuuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089997;
	h=DMARC-Filter:Received:X-Titan-User-Uid:DKIM-Signature:X-AuthUser:
	 Received:Date:Feedback-ID:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:X-F-Verdict:
	 X-Titan-Src-Out:X-CMAE-Score:X-CMAE-Analysis;
	bh=hZCuMraMeRuvizMaU6dpaY32EryXrFLF/bl3UaQJOMg=;
	b=qnX+c3vNZS+mTHn5evu6qKLtjmdoAyPIUYPYNshpC3IQu6nKNA+sT/Sargc3ExUygorh
	 quR3g1m3ibr7plsEI23OGJPxz/E2km/rzqu5ctJssRJgGaqKW+tkS+ek3lvZRfdoEtetM
	 FbDmV4JMJuXbkfkwOG0v+gBZpt1+njVcnfXsbRaN9UcWVO1EV8fxJxnsVuFsLRD+R73GD
	 Vt186MQNbY78eKr5yZ1G5dacX7pq5PgHh3CzhnZ8e+XOUoSI80FeJbuGZ7tIe6GEFC/IA
	 I3ZcxaN5MCAiXZ3ITCKiNUoan1jVU6OCAHrFQAJ1Fygsja0Q0/5ih5DEm0vSN/o2R1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=techsingularity.net;
	spf=pass smtp.mailfrom=techsingularity.net;
	dkim=pass header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=OJqq+ENa;
	arc=none smtp.remote-ip=35.159.192.136
Received: from mail319.out.titan.email (mail319.out.titan.email [35.159.192.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06E1606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B06E1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=OJqq+ENa
Received: from localhost (localhost [127.0.0.1])
	by smtp-out0101.titan.email (Postfix) with ESMTP id 4jVcdJ44mTz3wYX;
	Thu, 19 Nov 2026 12:06:28 +0000 (UTC)
X-Titan-User-Uid: eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..Ke6jcg_okWaFqSPU.V_wFyPGKCNHmpmWeoufhFvHU25knMpapgtRkaUri9YQtVvo9TAQzuB8DYOdNoXGiIyJtofihGkUXWGPr9CFXFWAMRaju2pq6AwbQUt69Fgf-3C_es1IjNaLl9Q.eqIZxLux7cY2e8q2OGYrIA
DKIM-Signature: a=rsa-sha256; bh=hZCuMraMeRuvizMaU6dpaY32EryXrFLF/bl3UaQJOMg=;
	c=relaxed/relaxed; d=techsingularity.net;
	h=from:to:subject:message-id:date:references:mime-version:cc:in-reply-to:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1795089988; v=1;
	b=OJqq+ENaDkz4xG0iGMsOF7i2+RBbiSpgbFBtbr7gCuwg/ZfmWCeB0q/PF2nPIYppCjWPohSy
	rC9kpmT7/x45Qq7YIt3RamS0dvpmI0pmCVvUGopJUDlq1e3rJpI+PCKpv+Mz48sHtB/VizJBig8
	6sRmh2Dn0jrjE80QUQBSmcXo=
X-AuthUser: mgorman@techsingularity.net
Received: from techsingularity.net (unknown [84.203.231.68])
	by smtp-out0101.titan.email (Postfix) with ESMTPA id 4jVcdH5z1Gz3wYK;
	Thu, 19 Nov 2026 12:06:27 +0000 (UTC)
Date: Thu, 19 Nov 2026 12:06:21 +0000
Feedback-ID: :mgorman@techsingularity.net:techsingularity.net:flockmailId
From: Mel Gorman <mgorman@techsingularity.net>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Seiji Nishikawa <snishika@redhat.com>, Mian Yousaf Kaukab <ykaukab@suse.de>, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] sched/rt: Do not account migrate-disabled tasks as
 pushable
Message-ID: <av7Pj6uBsSVAoxbZ@techsingularity.net>
References: <20261113160655.2909479-1-mgorman@techsingularity.net>
 <20261117152026.GI1813469@noisy.programming.kicks-ass.net>
 <20261117152414.GG1922751@noisy.programming.kicks-ass.net>
 <av1q-2D_tdi9oNEj@techsingularity.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <av1q-2D_tdi9oNEj@techsingularity.net>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1795089988266193132.2081352.667306738733772207@prod-euc1-smtp-out1004.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=KNjj5FFo c=1 sm=1 tr=0 ts=6afee644
 a=FmVQ1k5Ded4TyWNjOMyd8g==:117 a=FmVQ1k5Ded4TyWNjOMyd8g==:17
 a=Q9fys5e9bTEA:10 a=CEWIc4RMnpUA:10 a=xhZe9g8LDzXaMiJfJb4A:9
 a=PUjeQqilurYA:10

On Wed, Nov 18, 2026 at 10:05:31AM +0000, Mel Gorman wrote:
> On Tue, Nov 17, 2026 at 04:24:14PM +0100, Peter Zijlstra wrote:
> > On Tue, Nov 17, 2026 at 04:20:26PM +0100, Peter Zijlstra wrote:
> > > On Fri, Nov 13, 2026 at 04:06:55PM +0000, Mel Gorman wrote:
> > > 
> > > > As above, the runqueue is still marked overloaded by enqueue_task_rt()
> > > > and put_prev_task_rt() even if the task is migrate-disabled. A
> > > > migrate-disabled task reaches the pushable list through enqueue_task_rt()
> > > > or put_prev_task_rt() when it is preempted, or when it wakes while
> > > > still migrate-disabled. Either path calls enqueue_pushable_task() to set
> > > > rq->rt.overloaded and rto_mask if unset. Once set, every pull from another
> > > > CPU that fires an IPI may only find migrate-disabled tasks rendering the IPI
> > > > useless for a condition that was detectable when placed on the pushable list.
> > > > 
> > > > Stop adding migrate-disabled tasks to the pushable list if RT_PUSH_IPI is
> > > > enabled. This is not a heuristic as migrate-disabled tasks cannot move. Even
> > > > when migration is enabled, the rq still has no pushable candidates until the
> > > > task schedules. The !RT_PUSH_IPI behaviour is preserved and migrate-disabled
> > > > tasks are added to the pushable list. Without IPI, the alternative path in
> > > > pull_rt_task() must find runqueues with off-CPU migrate-disabled tasks. It
> > > > can then push the running task away allowing the migrate-disabled task
> > > > to run.
> > > 
> > > Last time I either didn't notice, or I've gone dumb from staring at perf
> > > issues all day, but I'm not entirely sure I understand how we get here.
> > > 
> > > Suppose:
> > > 
> > >   migrate_disable();
> > >   ...
> > >   schedule()
> > >     migrate_disable_switch()
> > >       // switches p->cpus_ptr and p->nr_cpus_allowed
> > >     pick_next_task()
> > >       p = class->pick_task();
> > >       put_prev_set_next_task(rq, rq->donor, p);
> > >       return p;
> > > 
> > > So any task that ends up in put_prev_task_rt() wlll have passed through
> > > migrate_disable_switch(), which have updated nr_cpus_allowed.
> > > 

Short summary, this assumption is wrong, nr_cpus_allowed is not updated
in that path.

> 
> I did not check in this direction but that does not mean I think you're
> right but I also am struggling to prove it.
> 
> An earlier version of the patch was like what you suggested (check both
> conditionally in rt.c and copy to deadline.c), hen I thought "deadline had
> no RTO IPI" and the copy felt like cargo culting which definitely would get
> a kicking and I'd be asked "Why did you copy that" and my answer would be
> "Uhhh.. cargo cult?" and then feel like a right idiot.
> 
> <SNIP query on why the necessary conditions can occur>
>
> I have to look closer at why you think it's not reachable and Steven
> thinks it's plausible. All I've got so far is that
> 
> o migrate_disable_switch checks does nothing if
>   "p->cpus_ptr != &p->cpus_mask"
>   and so do_set_cpus_allowed is not guaranteed to be called and
>   therefore the statement "migrate_disable_switch(), which have updated
>   nr_cpus_allowed" might have a counter-example.
> 
> o pick_next_pushable_task() has BUG_ON(p->nr_cpus_allowed <= 1) and this
>   thing certainly seems to believe that migrate_disabled tasks can reach
>   it
>                         if (unlikely(is_migration_disabled(task) ||
>                                      !cpumask_test_cpu(lowest_rq->cpu, &task->cpus_mask) ||
>                                      task != pick_next_pushable_task(rq))
> 
>   which means nothing at all yet, other than it's an example that is
>   very difficult to reconcile with your version (which matches my old
>   version) and state "this is ok".
> 

This was a sad excuse so I cheated and put a WARN_ONCE_ONCE() if
migrate_disabled tasks are encountered on the !RT_PUSH_IPI path like this

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index bb640278d30e..e8384f90bf4c 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2347,7 +2347,13 @@ static void pull_rt_task(struct rq *this_rq)
 			if (p->prio < src_rq->donor->prio)
 				goto skip;
 
-			if (is_migration_disabled(p)) {
+			if (WARN_ON_ONCE(is_migration_disabled(p))) {
+				static int t_printed = 0;
+				if (!t_printed) {
+					t_printed++;
+					printk("found migrate_disabled on CPU[%d->%d] (%d:%s)", this_cpu, cpu, task_pid_nr(p), p->comm);
+				}
+				trace_printk("found migrate_disabled on CPU[%d->%d] (%d:%s)", this_cpu, cpu, task_pid_nr(p), p->comm);
 				push_task = get_push_task(src_rq);
 			} else {
 				move_queued_task_locked(src_rq, this_rq, p);

and it fires when a) running the test case on PREEMPT_RT and b) echo
NO_RT_PUSH_IPI > /sys/kernel/debug/sched/features. The warning below is
trimmed for noise

[  359.731411][ T2181] ------------[ cut here ]------------
[  359.731413][ T2181] WARNING: kernel/sched/rt.c:2350 at pull_rt_task+0x3ed/0x4a0, CPU#2: rpt_pinger/2181
[  359.959501][ T2181] RIP: 0010:pull_rt_task+0x3ed/0x4a0
[  360.068397][ T2181] Call Trace:
[  360.072005][ T2181]  <TASK>
[  360.075197][ T2181]  balance_rt+0x58/0xf0
[  360.079802][ T2181]  __pick_next_task+0xf4/0x1e0
[  360.085098][ T2181]  __schedule+0x1f1/0x1900

If I remove the RT_PUSH_IPI check and replace it with yours, which matches
early fix that was not posted, the warning no longer fires because the
code is no longer reachable for the test case. This shows the check is
necessary as stated in the changelog

	The !RT_PUSH_IPI behaviour is preserved and migrate-disabled tasks
	are added to the pushable list. Without IPI, the alternative path in
	pull_rt_task() must find runqueues with off-CPU migrate-disabled
	tasks. It can then push the running task away allowing the
	migrate-disabled task to run.

The reason for stating it in the changelog was shoddy logic. I assumed
the code must be doing something or it would not be there so stuck a
reason on it.

The warning firing or not firing is still not great reasoning though,
it's still shoddy with extra sprinkles on top so I started back with
this assumption on your patch

> > > So any task that ends up in put_prev_task_rt() wlll have passed through
> > > migrate_disable_switch(), which have updated nr_cpus_allowed.

That sounded plausible and while Steven did not explicitly say so, I
think he agreed with you and it sounded believable to me but looked
anyway

	(disable side)
	migrate_disable_switch
	  do_set_cpus_allowed(p, &ac);
	    p->sched_class->set_cpus_allowed(p, ctx);
    
	(enable side)
	___migrate_enable
	  __set_cpus_allowed_ptr(p, &ac);

Other than the assymetry, it looks ok so disable side for rt.c

DEFINE_SCHED_CLASS(rt) = {
	.set_cpus_allowed       = set_cpus_allowed_common,
}

Nothing special, back to core.c

void set_cpus_allowed_common(struct task_struct *p, struct affinity_context *ctx)
{
        if (ctx->flags & (SCA_MIGRATE_ENABLE | SCA_MIGRATE_DISABLE)) {
                p->cpus_ptr = ctx->new_mask;
                return;
        }

        cpumask_copy(&p->cpus_mask, ctx->new_mask);
        p->nr_cpus_allowed = cpumask_weight(ctx->new_mask);
        mm_update_cpus_allowed(p->mm, ctx->new_mask);


set_cpus_allowed_common only sets cpus_ptr for SCA_MIGRATE_ENABLE|SCA_MIGRATE_DISABLE
and **nr_cpus_allowed is not changed** which is the assumption the
straight-forward patch relies on.

I do not recall looking too closely at migrate_disable or forgot why it's
like this so I kept looking to see where SCA_MIGRATE_ENABLE originated
(presumably Set Cpus Allowed (SCA) instead of a typo of Ska) leading to
af449901b84c ("sched: Add migrate_disable()") which was no help explaining
the why. It's there with a tonne of warnings about locking violations
but does not explicitly state why. Best is this bit

-       if (p->nr_cpus_allowed > 1)
+       if (p->nr_cpus_allowed > 1 && !is_migration_disabled(p))

That sortof suggests the patch relied on the behaviour to distinguish
between nr_cpus_allowed == 1 and nr_cpus_allowed is equivalent to 1
because if migrate_disabled even though p->migration_enabled existed. I was
under time pressure at this point so had to draw the line and stop. It's
not particularly clear why set_cpus_allowed_common() is like this but
get_push_task() still checks

	if (p->nr_cpus_allowed == 1)
		return NULL;

        if (p->migration_disabled)
                return NULL;

It's not clear at all to me why both are needed. I expect if I kept digging
that I would find something clever but the obvious fix does not work,
or at least if it does work, it's not very obvious why it's ok and has
no side-effects.

-- 
Mel Gorman
SUSE Labs
