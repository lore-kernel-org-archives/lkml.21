Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=3.121.9.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996337;
	b=AzdK4AfFF7UtmW5QblKyBnMhkBbCpSX7jyCc4+PqZtr8f8fyrBslXXZLJtYCtdkJcLP7
	 G+OWgveWpEVl3vfomdCBw4G0s90mwqzFR8tALfCv9AbP/FIgojONz3RJpJMWJSX8RCm4M
	 uDTLlgoGvRaqwYcPNARH+f+fcs6MZbriqHz2asNP+VNW7s74Q1ZPw2OJP0Xepe7oIY6u8
	 8nEw/QvUMrIK7JnCIvvGEd9OqALhspxhvWyrEezAABhsoT02gTdAeOyNh8M6gnjyKN+df
	 bmX0qE2W358MACUCpd9+epHCagFw1j6Sh6Ze70n0OJbf/4vnjyjSqogCfjek/OMHozA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996337;
	h=DMARC-Filter:Received:X-Titan-User-Uid:DKIM-Signature:X-AuthUser:
	 Received:Date:Feedback-ID:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:X-F-Verdict:
	 X-Titan-Src-Out:X-CMAE-Score:X-CMAE-Analysis;
	bh=Pe0AOfEXOyipGdj7ZRze/R5+qF0TIOc+kk2vWj/SSA4=;
	b=RrXhhoEsBRLbydcs+cjPEng6iDxMIpZxbjx5zOcqH7WRJ8kgP4pU/DSMRld18lsjkjVn
	 cVwyPQ1gKvxGzru3kZPH6V6cjsHXQkD4ugf/WkHjiKgTZYND/Xxpa1pVufUU7wkj+MT1p
	 QD/ggOTgGoL+5/GYpiusM4k98E+HBXKZsFfW25DRA9lgTdXpOQjW2vMjwqsPC3/cK8W4t
	 p/4FIxmZRUJlPU3wJ1nfz5wBbPPlWOaHW3Csf6G+/dB70mtZLXBgFcdIHqwzctjI5mZ19
	 WrKypMeuQuq/vv8geXHM76JDRrP6zJgsiBqIKyEqkF4gDjoMVDS5cCPAcUyLg9KwJBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=techsingularity.net;
	spf=pass smtp.mailfrom=techsingularity.net;
	dkim=pass header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=ByvFR39Z;
	arc=none smtp.remote-ip=3.121.9.152
Received: from mail33.out.titan.email (mail33.out.titan.email [3.121.9.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DD2606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53DD2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=ByvFR39Z
Received: from localhost (localhost [127.0.0.1])
	by smtp-out0101.titan.email (Postfix) with ESMTP id 4jTy083d9wzBrJt;
	Wed, 18 Nov 2026 10:05:28 +0000 (UTC)
X-Titan-User-Uid: eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..o5-troWWB6m0Ppnt.j_NzXpRd2hsW1SQB_05qNM_Fuh0qDVeZuv7AtWlGcZ2wz5PvDV8nJTndAzk_c-j_EMnJBAZWE3SxAEte7V121dnduoxEE7hJDb441CyqWUh3SMw59RCmgA5GTQ.taSZ9yQEpOpHUCNvyooPEQ
DKIM-Signature: a=rsa-sha256; bh=Pe0AOfEXOyipGdj7ZRze/R5+qF0TIOc+kk2vWj/SSA4=;
	c=relaxed/relaxed; d=techsingularity.net;
	h=subject:message-id:references:date:from:in-reply-to:to:cc:mime-version:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1794996328; v=1;
	b=ByvFR39ZukAJmgLr4bGXy+VtzuHbK7Qg3G/orx0Kc+zvU+PR4eaCh3ZB9t4/xt90HQAbf8VJ
	lZ9ajWOFJnQr6D1j660ozfcS2XnsJ4cRLxTdA/ZtEwtbtf132XnOCVqxITBt9cD0AbH0Vlb5EpT
	Fy/eUFBeGgFm2Qw3NAj4bf9E=
X-AuthUser: mgorman@techsingularity.net
Received: from techsingularity.net (unknown [84.203.169.102])
	by smtp-out0101.titan.email (Postfix) with ESMTPA id 4jTy075wQ0zBrJb;
	Wed, 18 Nov 2026 10:05:27 +0000 (UTC)
Date: Wed, 18 Nov 2026 10:05:21 +0000
Feedback-ID: :mgorman@techsingularity.net:techsingularity.net:flockmailId
From: Mel Gorman <mgorman@techsingularity.net>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Seiji Nishikawa <snishika@redhat.com>, Mian Yousaf Kaukab <ykaukab@suse.de>, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] sched/rt: Do not account migrate-disabled tasks as
 pushable
Message-ID: <av1q-2D_tdi9oNEj@techsingularity.net>
References: <20261113160655.2909479-1-mgorman@techsingularity.net>
 <20261117152026.GI1813469@noisy.programming.kicks-ass.net>
 <20261117152414.GG1922751@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261117152414.GG1922751@noisy.programming.kicks-ass.net>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1794996328270808189.1930444.7156754528199208151@prod-euc1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=Kuj0MWWN c=1 sm=1 tr=0 ts=6afd7868
 a=pHym636nsqzIClKRuQkSuw==:117 a=pHym636nsqzIClKRuQkSuw==:17
 a=Q9fys5e9bTEA:10 a=CEWIc4RMnpUA:10 a=pycgwy6UaF_tR2Lduj4A:9
 a=PUjeQqilurYA:10

On Tue, Nov 17, 2026 at 04:24:14PM +0100, Peter Zijlstra wrote:
> On Tue, Nov 17, 2026 at 04:20:26PM +0100, Peter Zijlstra wrote:
> > On Fri, Nov 13, 2026 at 04:06:55PM +0000, Mel Gorman wrote:
> > 
> > > As above, the runqueue is still marked overloaded by enqueue_task_rt()
> > > and put_prev_task_rt() even if the task is migrate-disabled. A
> > > migrate-disabled task reaches the pushable list through enqueue_task_rt()
> > > or put_prev_task_rt() when it is preempted, or when it wakes while
> > > still migrate-disabled. Either path calls enqueue_pushable_task() to set
> > > rq->rt.overloaded and rto_mask if unset. Once set, every pull from another
> > > CPU that fires an IPI may only find migrate-disabled tasks rendering the IPI
> > > useless for a condition that was detectable when placed on the pushable list.
> > > 
> > > Stop adding migrate-disabled tasks to the pushable list if RT_PUSH_IPI is
> > > enabled. This is not a heuristic as migrate-disabled tasks cannot move. Even
> > > when migration is enabled, the rq still has no pushable candidates until the
> > > task schedules. The !RT_PUSH_IPI behaviour is preserved and migrate-disabled
> > > tasks are added to the pushable list. Without IPI, the alternative path in
> > > pull_rt_task() must find runqueues with off-CPU migrate-disabled tasks. It
> > > can then push the running task away allowing the migrate-disabled task
> > > to run.
> > 
> > Last time I either didn't notice, or I've gone dumb from staring at perf
> > issues all day, but I'm not entirely sure I understand how we get here.
> > 
> > Suppose:
> > 
> >   migrate_disable();
> >   ...
> >   schedule()
> >     migrate_disable_switch()
> >       // switches p->cpus_ptr and p->nr_cpus_allowed
> >     pick_next_task()
> >       p = class->pick_task();
> >       put_prev_set_next_task(rq, rq->donor, p);
> >       return p;
> > 
> > So any task that ends up in put_prev_task_rt() wlll have passed through
> > migrate_disable_switch(), which have updated nr_cpus_allowed.
> > 

I did not check in this direction but that does not mean I think you're
right but I also am struggling to prove it.

An earlier version of the patch was like what you suggested (check both
conditionally in rt.c and copy to deadline.c), hen I thought "deadline had
no RTO IPI" and the copy felt like cargo culting which definitely would get
a kicking and I'd be asked "Why did you copy that" and my answer would be
"Uhhh.. cargo cult?" and then feel like a right idiot.

Without the push IPI, deadline.c needed an explanation why the same check
is necessary so looked closer at the !PUSH_IPI handling.  The !IPI path
in both assumes that such tasks can be visible so "why look up?"

In rt.c

--8<--
 static void pull_rt_task(struct rq *this_rq)
	....
	#ifdef HAVE_RT_PUSH_IPI
		if (sched_feat(RT_PUSH_IPI)) {
			tell_cpu_to_push(this_rq);
			return;
		}
	#endif

	(!RT_PUSH_IPI path, default in !PREEMPT_RT or sched_debug toggle)

	for_each_cpu(cpu, this_rq->rd->rto_mask) {
		...

/*****
  ****
  **** This bit
  ****
  ****

		/*
		 * Do we have an RT task that preempts
		 * the to-be-scheduled task?
		 */
		if (p && (p->prio < this_rq->rt.highest_prio.curr)) {
			...
			if (is_migration_disabled(p)) {
				push_task = get_push_task(src_rq);
			} else {
				move_queued_task_locked(src_rq, this_rq, p);
				resched = true;
			}
			...
		}
	}
--8<--

The !IPI path assumes that a migrate_disabled(p) can exist on the rto_mask
and it's been like that for a while. Compounding the problem that kept me
looking down was that PREEMPT_RT tree used to have a patch e18de5e2e3e9
("sched/rt: Don't try push tasks if there are none.")  that tangentially
affected the bug (the PREEMPT_RT patch was visible in the distro kernel
the bug was reported against). The PREEMPT_RT patch was removed around 6.7
because "it's much better now" and while it was not stated why, I assumed
it was due to 612f769edd06 ("sched/rt: Make rt_rq->pushable_tasks updates
drive rto_mask")

I'm not saying this is right, I am saying that blocks of code in both
rt.c and deadline.c assume this condition can occur.

> > Or so my current thinking goes. You seeing this patch make a difference,
> > seems to suggest I'm missing something, but I couldn't spot it in that
> > wall of text.
> 

It is definitely the case, and I've measured it, that the patch removes
spurious IPIs and it's verified on a mainline kernel. Spurious IPI in
this case is that a CPU that has no task that can migrate is considered
pushable and receives a *lot* of IPIs per second that never move a task
because there is no task that *can* move. I didn't try quantifing it much
beyond that because reducing thousands of IPIs/sec seemed like suffficient
justification to me.

> Ah, is the sched_change pattern the clue? I'm thinking that RT might hit
> that more than usual due to the PI path.
> 

You give me too much credit, I started with a cargo cult copy of rt.c to
deadline.c but couldn't put an obviously correct comment or changelog
on it so a short paragraph of a changelog turned into a "wall of text"
while I talked to myself for longer than is considered healthy even by
the rubber duck.

> In that case we do indeed end up in put_prev_task() / set_next_task()
> without going through schedule(). In that case the task would be on the
> pushable list during the change, HOWEVER we should hold rq->lock (which
> implies have IRQs disabled) over the entire thing, so again, I'm not
> sure how this is then observable.
> 
> > Anyway, I'm still not sure why we can't just write:
> > 
> > > diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> > > index 1535046a23ff..bb640278d30e 100644
> > > --- a/kernel/sched/rt.c
> > > +++ b/kernel/sched/rt.c
> > > @@ -396,6 +396,13 @@ static inline void rt_queue_pull_task(struct rq *rq)
> > >  
> > >  static void enqueue_pushable_task(struct rq *rq, struct task_struct *p)
> > >  {
> > > +	if (p->nr_cpus_allowed <= 1)
> > > +		return;
> > > +#ifdef HAVE_RT_PUSH_IPI
> > > +	if (sched_feat(RT_PUSH_IPI) && is_migration_disabled(p))
> > > +		return;
> > > +#endif
> > > + 
> > 
> > 	if (p->nr_cpus_allowed <= 1 || is_migration_disabled(p))
> > 		return;
> > 

Yeah, I had that and couldn't copy it to deadline.c because the bug is
about IPIs, IPIs of the same type don't exist in deadline.c, so the copy
is "obviously bogus" and on rt.c the same check makes a bunch of
long-lived code unreachable. That is obviously shit logic to use for
justifying a kernel change.

I have to look closer at why you think it's not reachable and Steven
thinks it's plausible. All I've got so far is that

o migrate_disable_switch checks does nothing if
  "p->cpus_ptr != &p->cpus_mask"
  and so do_set_cpus_allowed is not guaranteed to be called and
  therefore the statement "migrate_disable_switch(), which have updated
  nr_cpus_allowed" might have a counter-example.

o pick_next_pushable_task() has BUG_ON(p->nr_cpus_allowed <= 1) and this
  thing certainly seems to believe that migrate_disabled tasks can reach
  it
                        if (unlikely(is_migration_disabled(task) ||
                                     !cpumask_test_cpu(lowest_rq->cpu, &task->cpus_mask) ||
                                     task != pick_next_pushable_task(rq))

  which means nothing at all yet, other than it's an example that is
  very difficult to reconcile with your version (which matches my old
  version) and state "this is ok".

> > But perhaps I'm missing something; the above seems to suggest that is a
> > theme today.

Not sure yet, all I know is that I cannot find so far a way of writing
a comment or changelog on that version that shows it's safe and doesn't
degrade rt.c, deadline.c at minimum or break it at worst.

-- 
Mel Gorman
SUSE Labs
