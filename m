Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635459;
	b=qvHUO1vcGlPRuq2cILuhyPqaHmoHZlN+iFRDtjuENRKXmEGkCFWFyYOqRTQo2gDbx9cx
	 D5onc1jF4yyW0bJmO9MzJXdSSh4Kt8tnd2ebguckuKtAxlpwkR+Re1fDnYa0vIwug2zWN
	 pUgI3v32xgARPljTlzb2ex+e6zbDaXl+Fsc/vq0x+Uw+dPMwOXBd9Tsr/BAx2p/veo2VQ
	 hnnKQknfTMW1NkZOlNsx+wW8UKaGQSPdmbcGFWygV+lpe1ijz3vgTU57N+I5xhcmEgpR2
	 02ADxLtJPaa2f48v8xsboZBA6Cov5ttdmxDBhNqlfFuu8Kk9nvaiqN8tkuejG33m9Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635459;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=VoPdfhw+Wh+dcf455smlSp3zqtA6VoKK9tnIxhpi9EU=;
	b=wWbR2q7FTS7HpsyeOnMvMHoEwTvwdEyq/62rJgd2Jcrm1V/6Gox/kz/R9Zo0m/NR6PQ3
	 UkDwYVAmhkTBBgUdm1Q0B0C4nhDV2czI8PkY/nCg0eCbUUPcr6TElFHFi+YxjL1r2D6uM
	 EbE4yFsTWKT0Ll1RQg+S4tmGvXEqkTUPAX0sqUWePcUOvHBn0nsdyEuRWRIShSrGAQ94r
	 jSjKhwM5hYYZ8CC2VbVfrd2/4u/EYbyYL67nJqk5xfgf1AWdjRjKRdMHh3MimWJhV9K1m
	 egklwm/FSEoXSV79vwQbHUxijCYozrrGCuk4YmFBt/optKLFFJyLrDRg8/0gogOUbOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="OdZu/+cy";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XcySDAM6;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CCE606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52CCE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OdZu/+cy;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XcySDAM6
Date: Wed, 25 Nov 2026 20:37:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795635456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VoPdfhw+Wh+dcf455smlSp3zqtA6VoKK9tnIxhpi9EU=;
	b=OdZu/+cyweXh6B5nqpyX95NJETTO+PDMM/XCiVYIxL0MsblzN4UT2t8UImaep8jGweD0ol
	8G/SBgBUkMuG5yqeTEdIN0FotLR1zKfTm4qsB2AqLfgoWusEQ9nc10pKHUjOmwl4kvKNRn
	WMrAaeMaURpeWlETNU1cff2O21qDBIom2sN1lUdB6QdVKoQQlJoc5EnTXJcBiDyOfaS81P
	cJNBrZvLNIai8w2S4oEEOzNJjhYXjTQPda50y45X0VAhMB0oAHNE3n0ycqYx00wJHYmphD
	/L+Ab1ye4twxMqNVnUAc15P/iFePZ5QW7GKvGwI0HlYWx3IzwvGcM8fpylSLkA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795635456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VoPdfhw+Wh+dcf455smlSp3zqtA6VoKK9tnIxhpi9EU=;
	b=XcySDAM6GcYtVttyKireQ0qyGv3h8/iL+5ZZpeEbVs3dIfedEUeuJuH7Id/ZwHaN8BOA8q
	QDK5g652D9Q9ViDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
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
Message-ID: <20261125193735.qrxCdHTx@linutronix.de>
References: <20261120171658.Cf9qIU-Y@linutronix.de>
 <20261125172018.GD2668564@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261125172018.GD2668564@noisy.programming.kicks-ass.net>

On 2026-11-25 18:20:18 [+0100], Peter Zijlstra wrote:
> On Fri, Nov 20, 2026 at 06:16:58PM +0100, Sebastian Andrzej Siewior wrote:
> > syzbot reported a race of assigning a CPU affinity during CPU hotplug
> > operation.
> > After the affinity of an IRQ has been changed, the IRQ-core sets
> > IRQTF_AFFINITY and wakes the relevant interrupt threads which need to
> > adjust their affinity mask. The thread will then invoke
> > set_cpus_allowed_ptr() to update the mask. Based on the new mask a CPU
> > is chosen on which the thread should run.
> 
> This is irq_thread_check_affinity(), right?

This is what the bot used to trigger this, correct.

> So the problem begins here, by selecting a CPU that isn't guarded to
> remain online until after the operation completes.

Right, we don't enforce this so everyone without a CPU-HP lock held has
a problem here. From irq_thread_check_affinity() perspective, it is fine
because once the CPU goes down, there will be another update aligning
the thread with the CPU that has been picked to serve the interrupt.

> > The aftermath:
> > The IRQ-thread's CPU and task's cpus_mask do not match. A
> > migrate_disable()-> schedule() will change task_struct::cpus_ptr
> > ensuring that the following migrate_enable() will update the task to the
> > requested affinity mask.
> 
> OK, so is this all afterwards, or interleaved? That is, are we talking
> about:
> 
> A)	
> 	CPU-A				CPU-B			CPU-C
> 
> 	migrate_disable()
> 	schedule()
> 	  migrate_disable_switch();
> 	  				<hotplug unplug A> 	set_cpus_allowed()
> 
> 	migrate_enable()
> 
> or B)	
> 
> 	CPU-A				CPU-B			CPU-C
> 
> 	  				<hotplug unplug A> 	set_cpus_allowed()
> 
> 	migrate_disable()
> 	schedule()
> 	  migrate_disable_switch();
> 
> 	migrate_enable()
> 	
> ?

It is B) and CPU-A = CPU-C in this case. 
	CPU-A                              	    CPU-B
	irq_thread()
	  irq_thread_check_affinity()
	    irq_thread_check_affinity
	      set_cpus_allowed_ptr(B)
					   	<hotplug unplug>
	      <returns with butchered mask>
	  irq_forced_thread_fn()
	    migrate_disable();
	    schedule();
	      migrate_disable_switch();

	    migrate_enable();

> > At this point, affine_move_task() expects
> > task_struct::migration_pending set but it is NULL because noone
> > requested an affinity change while the task was in migrate-disable
> > section.
> 
> We're talking about:
> 
> 	migrate_enable()
> 	  ___migrate_able()
> 	    __set_cpus_allowed_ptr()
> 	      __set_cpus_allowed_ptr_locked()
> 	        affine_move_task();
> 
> Right? Where the target is a kthread while running on a CPU that isn't
> inside p->cpus_mask (because p->cpus_mask intersected with online_mask
> is empty).

Almost. The requested CPU wasn't part of online_mask and it got rejected
earlier in is_cpu_allowed(). But now in __set_cpus_allowed_ptr_locked()
has this at the end

|         dest_cpu = cpumask_any_and_distribute(cpu_valid_mask, ctx->new_mask);
|         if (dest_cpu >= nr_cpu_ids) {
|                 ret = -EINVAL;
|                 goto out;
|         }

and we don't take this exit. So the CPU is back.

> So, affine_move_task() will fail the first branch; we're not inside
> cpus_mask. And we'll fail the second branch, because SCA_MIGRATE_ENABLE,
> and hit:
> 
> 	pending = p->migration_pending;
> 	WARN_ON_ONCE(!pending);
> 
> OK.

Yes.

> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -2710,17 +2710,16 @@ static int migration_cpu_stop(void *data)
> >  		if (task_on_rq_queued(p)) {
> >  			update_rq_clock(rq);
> >  			rq = __migrate_task(rq, &rf, p, arg->dest_cpu);
> > +			if (rq != cpu_rq(arg->dest_cpu)) {
> > +				struct affinity_context ac = {
> > +					.new_mask  = cpumask_of(rq->cpu),
> > +				};
> > +
> > +				do_set_cpus_allowed(p, &ac);
> > +			}
> >  		} else {
> >  			p->wake_cpu = arg->dest_cpu;
> >  		}
> > -
> > -		/*
> > -		 * XXX __migrate_task() can fail, at which point we might end
> > -		 * up running on a dodgy CPU, AFAICT this can only happen
> > -		 * during CPU hotplug, at which point we'll get pushed out
> > -		 * anyway, so it's probably not a big deal.
> > -		 */
> > -
> >  	} else if (pending) {
> >  		/*
> >  		 * This happens when we get migrated between migrate_enable()'s
> 
> So yes, this cures things, but I'm not sure silently updating the mask
> is nice. People could be surprised the cpumask isn't what they set --
> then again, perhaps such people should disable hotplug when changing
> affinity?

Yes, exactly. Use the HP-lock if it is needed. As I said earlier, it is
like select_fallback_rq() but without the printk.

> Let me ponder this while making dinner :-)

Have a good one.

Sebastian
