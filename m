Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689667;
	b=VnGUENL+2SHYNXL0gHf/PtBPLQNxkPyc7cWFib3AJmOOKCC9942/vpuw6VzUjl1tsFgj
	 8/WwppUYv/067bHPveGMhW1zXpBIrp5jpCGK3k3ZeR8AmydEGNh40HQ/Ns3wHcb8RRPDg
	 M7FPv1QWnYnx3ppWy98zizXfFpFlD8nhozRgobUIk2dkcE/w8QLo8qTkdjaOddvqBNopG
	 rVPMyqS9bqvQnnAShn98lcDWj8Sb1UAwxM0Mq+CsJcbGdNoW03uf0pTV/lyuY3KDAdtFn
	 282u1+S27frzTw1CD22vq4DdgQeJtYu/eI45qLmF+vjRUz5Pfsaa5umFH5DQX82iUfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689667;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=YudPHR0y7obhUcJd7K4kCSQc4O5wz3tOCyEJvIs0Smk=;
	b=OFPgvNwyqqCGOrMYGzB/rjKpr27ZSnkGKeE5fuVm25K9iot8zltSKUiesb0AnndCuEAq
	 Bs+EnjBze0gIfqCtLPqfAZ0OFOD89vioA+vWSEJahNgALL+CbIVrHzcmzZ4ui8uUmf4sJ
	 4xP8sYMbVvXxDCXsldQMG7hvkW/KP+W7tHZ57dn2D3yuDZyCtp7b3Mjl/uqRMzyB7r1DZ
	 cKXQTE2swPo88XFTtQdcghKq9NJ4RN7LmWLNPjrXLEINExILuCULHlFiN82LTW6NsOrLL
	 3L5HA7b9tNtODSxQ1FwbC4paxWAirlrxaYcJcKAhommopV6dUt7KTpfj/h2TRXRO8ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Hu9KkhKd;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7581C606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7581C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Hu9KkhKd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YudPHR0y7obhUcJd7K4kCSQc4O5wz3tOCyEJvIs0Smk=; b=Hu9KkhKd/9E9DnafUAmiWvQOfr
	F2pDmgIiN0I4S8HeJzLJdDBgaLdnD4TEeiNQ5FXDMDa0k1dyS13/y7bhSOHpvt5T/pupmtoVu57SD
	Dk9GxdFIOpa5R5D2CMRCUfXNVVUs42oWIrRqNsx5U9P889ZL+/OaveF7MV758fltgpbGi2xkDRlHl
	ma8CUoFuXsSiGdWKLwkw41SHp3nPXlnfcQ8rDLMojGfCoLT6AO8RDVVBTx3YSvjV+6ynuMVgi7bp5
	pZQtalI/jBEEev6TIv5mBgZY2h4KYtNdzEFKDShwc30aRB8SM09vmQ+XD7m5iDxJUyUAuO7JPO4jC
	WeImeD5g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWuJ-00000006L7D-0nj9;
	Thu, 26 Nov 2026 10:40:51 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 72C82302186; Thu, 26 Nov 2026 11:40:49 +0100 (CET)
Date: Thu, 26 Nov 2026 11:40:49 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	syzbot <syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [PATCH v3] sched: Reset cpumask if __migrate_task() failed for
 migration_cpu_stop()
Message-ID: <20261126104049.GC49833@noisy.programming.kicks-ass.net>
References: <20261120171658.Cf9qIU-Y@linutronix.de>
 <20261125172018.GD2668564@noisy.programming.kicks-ass.net>
 <20261125193735.qrxCdHTx@linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125193735.qrxCdHTx@linutronix.de>

On Wed, Nov 25, 2026 at 08:37:35PM +0100, Sebastian Andrzej Siewior wrote:
> On 2026-11-25 18:20:18 [+0100], Peter Zijlstra wrote:
> > On Fri, Nov 20, 2026 at 06:16:58PM +0100, Sebastian Andrzej Siewior wrote:
> > > syzbot reported a race of assigning a CPU affinity during CPU hotplug
> > > operation.
> > > After the affinity of an IRQ has been changed, the IRQ-core sets
> > > IRQTF_AFFINITY and wakes the relevant interrupt threads which need to
> > > adjust their affinity mask. The thread will then invoke
> > > set_cpus_allowed_ptr() to update the mask. Based on the new mask a CPU
> > > is chosen on which the thread should run.
> > 
> > This is irq_thread_check_affinity(), right?
> 
> This is what the bot used to trigger this, correct.
> 
> > So the problem begins here, by selecting a CPU that isn't guarded to
> > remain online until after the operation completes.
> 
> Right, we don't enforce this so everyone without a CPU-HP lock held has
> a problem here. From irq_thread_check_affinity() perspective, it is fine
> because once the CPU goes down, there will be another update aligning
> the thread with the CPU that has been picked to serve the interrupt.

Right, that is true in this case. But will that always be true for
people that 'forget' hotplug.

> It is B) and CPU-A = CPU-C in this case. 
> 	CPU-A                              	    CPU-B
> 	irq_thread()
> 	  irq_thread_check_affinity()
> 	    irq_thread_check_affinity
> 	      set_cpus_allowed_ptr(B)
> 					   	<hotplug unplug>
> 	      <returns with butchered mask>
> 	  irq_forced_thread_fn()
> 	    migrate_disable();
> 	    schedule();
> 	      migrate_disable_switch();
> 
> 	    migrate_enable();
> 
> > > At this point, affine_move_task() expects
> > > task_struct::migration_pending set but it is NULL because noone
> > > requested an affinity change while the task was in migrate-disable
> > > section.
> > 
> > We're talking about:
> > 
> > 	migrate_enable()
> > 	  ___migrate_able()
> > 	    __set_cpus_allowed_ptr()
> > 	      __set_cpus_allowed_ptr_locked()
> > 	        affine_move_task();
> > 
> > Right? Where the target is a kthread while running on a CPU that isn't
> > inside p->cpus_mask (because p->cpus_mask intersected with online_mask
> > is empty).
> 
> Almost. The requested CPU wasn't part of online_mask and it got rejected
> earlier in is_cpu_allowed(). But now in __set_cpus_allowed_ptr_locked()
> has this at the end
> 
> |         dest_cpu = cpumask_any_and_distribute(cpu_valid_mask, ctx->new_mask);
> |         if (dest_cpu >= nr_cpu_ids) {
> |                 ret = -EINVAL;
> |                 goto out;
> |         }
> 
> and we don't take this exit. So the CPU is back.

Ooh, cute. So not only was the CPU unplugged, it was then quickly
brought back online again. Fun though; if we did hit this condition then
migrate_enable() would have silently failed. Also not a good thing.

We should probably have ___migrate_enable() warn on this.

> > So, affine_move_task() will fail the first branch; we're not inside
> > cpus_mask. And we'll fail the second branch, because SCA_MIGRATE_ENABLE,
> > and hit:
> > 
> > 	pending = p->migration_pending;
> > 	WARN_ON_ONCE(!pending);
> > 
> > OK.
> 
> Yes.
> 
> > > --- a/kernel/sched/core.c
> > > +++ b/kernel/sched/core.c
> > > @@ -2710,17 +2710,16 @@ static int migration_cpu_stop(void *data)
> > >  		if (task_on_rq_queued(p)) {
> > >  			update_rq_clock(rq);
> > >  			rq = __migrate_task(rq, &rf, p, arg->dest_cpu);
> > > +			if (rq != cpu_rq(arg->dest_cpu)) {
> > > +				struct affinity_context ac = {
> > > +					.new_mask  = cpumask_of(rq->cpu),
> > > +				};
> > > +
> > > +				do_set_cpus_allowed(p, &ac);
> > > +			}
> > >  		} else {
> > >  			p->wake_cpu = arg->dest_cpu;
> > >  		}
> > > -
> > > -		/*
> > > -		 * XXX __migrate_task() can fail, at which point we might end
> > > -		 * up running on a dodgy CPU, AFAICT this can only happen
> > > -		 * during CPU hotplug, at which point we'll get pushed out
> > > -		 * anyway, so it's probably not a big deal.
> > > -		 */
> > > -
> > >  	} else if (pending) {
> > >  		/*
> > >  		 * This happens when we get migrated between migrate_enable()'s
> > 
> > So yes, this cures things, but I'm not sure silently updating the mask
> > is nice. People could be surprised the cpumask isn't what they set --
> > then again, perhaps such people should disable hotplug when changing
> > affinity?
> 
> Yes, exactly. Use the HP-lock if it is needed. As I said earlier, it is
> like select_fallback_rq() but without the printk.

Right -- so the printk is gated with p->mm, which kthreads will mostly
fail. So even if the timing was different and we'd have hit
select_fallback_rq() we'd not have seen a printk().

However, the 'fixup' is different, select_fallback_rq() will set the
widest possible mask, while this will set only the one CPU.

Then there also are __balance_push_cpu_stop() and
sched_non_preferred_cpu_push_stop() that use __migrate_task(). AFAICT
both of those should also be able to hit this task, both of them run it
through select_fallback_rq().

Does something like so make sense? That routes them all through
select_fallback_rq().

---
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5ed660f099a5..6ec27dc5e0c2 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2627,27 +2627,7 @@ struct set_affinity_pending {
 	struct migration_arg	arg;
 };
 
-/*
- * Move (not current) task off this CPU, onto the destination CPU. We're doing
- * this because either it can't run here any more (set_cpus_allowed()
- * away from this CPU, or CPU going down), or because we're
- * attempting to rebalance this task on exec (sched_exec).
- *
- * So we race with normal scheduler movements, but that's OK, as long
- * as the task is no longer on this CPU.
- */
-static struct rq *__migrate_task(struct rq *rq, struct rq_flags *rf,
-				 struct task_struct *p, int dest_cpu)
-	__must_hold(__rq_lockp(rq))
-{
-	/* Affinity changed (again). */
-	if (!is_cpu_allowed(p, dest_cpu))
-		return rq;
-
-	rq = move_queued_task(rq, rf, p, dest_cpu);
-
-	return rq;
-}
+static int select_fallback_rq(int cpu, struct task_struct *p);
 
 /*
  * migration_cpu_stop - this will be executed by a high-prio stopper thread
@@ -2670,7 +2650,7 @@ static int migration_cpu_stop(void *data)
 	local_irq_save(rf.flags);
 	/*
 	 * We need to explicitly wake pending tasks before running
-	 * __migrate_task() such that we will not miss enforcing cpus_ptr
+	 * move_queued_task() such that we will not miss enforcing cpus_ptr
 	 * during wakeups, see set_cpus_allowed_ptr()'s TASK_WAKING test.
 	 */
 	flush_smp_call_function_queue();
@@ -2708,19 +2688,16 @@ static int migration_cpu_stop(void *data)
 		}
 
 		if (task_on_rq_queued(p)) {
+			int cpu = arg->dest_cpu;
+
 			update_rq_clock(rq);
-			rq = __migrate_task(rq, &rf, p, arg->dest_cpu);
+			if (!is_cpu_allowed(p, cpu))
+				cpu = select_fallback_rq(rq->cpu, p);
+
+			rq = move_queued_task(rq, &rf, p, cpu);
 		} else {
 			p->wake_cpu = arg->dest_cpu;
 		}
-
-		/*
-		 * XXX __migrate_task() can fail, at which point we might end
-		 * up running on a dodgy CPU, AFAICT this can only happen
-		 * during CPU hotplug, at which point we'll get pushed out
-		 * anyway, so it's probably not a big deal.
-		 */
-
 	} else if (pending) {
 		/*
 		 * This happens when we get migrated between migrate_enable()'s
@@ -8415,7 +8392,7 @@ static int __balance_push_cpu_stop(void *arg)
 		rq_lock(rq, &rf);
 		update_rq_clock(rq);
 		if (task_rq(p) == rq && task_on_rq_queued(p))
-			rq = __migrate_task(rq, &rf, p, cpu);
+			rq = move_queued_task(rq, &rf, p, cpu);
 		rq_unlock(rq, &rf);
 	}
 
@@ -11315,7 +11292,7 @@ static int sched_non_preferred_cpu_push_stop(void *arg)
 		update_rq_clock(rq);
 
 		if (task_rq(p) == rq && task_on_rq_queued(p)) {
-			struct rq *dest_rq = __migrate_task(rq, &rf, p, cpu);
+			struct rq *dest_rq = move_queued_task(rq, &rf, p, cpu);
 
 			if (rq != dest_rq)
 				schedstat_inc(p->stats.nr_migrations_cpu_non_preferred);
