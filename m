Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627232;
	b=lttdB6G0nd/zpHADZ9lLjQNXY2cmGhMzr8ileF+8Ec28WYw0HNyecLAlt1qxdfDMPVUk
	 6c7ieyuCnvoTTn4cwuvfnyk/DwA5LPV+XfXqSM0+/aEO+GuhaWUKUjrhkv4B9XEqIWDqG
	 qaLQ057bG2N0cseJesPYpAXr3dvDnK6386RewZjxWbMUsr7VubYQiKLwEK+rzvBvIQrpD
	 GibCLuS+OUAMOkEFzv1QvIudbwVB2pLhRSVZc7Bxj15QA6OhlB+nNk7Covhb6TSJ+r+G+
	 YFhxGR4HdR2hLVLoQV8Pqp+mJv1GiUu4H7Fu9FbZ3g0Sm3e7lFBKgIuEx/Mygo22ezA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627232;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=cor0zS7jHNAwQFOgbGqP2fvLgRx1UFpWzZtEMHTV7J0=;
	b=Nv3IQ3zWvePY5M0BrqYwey+0wsibP9BgH9i9oNPu5Dcq9lzUNy8mlwQRy3ToYKIb9x4p
	 3+gKdx2aZ+m0oxSQcQqfwavE/LD/pEZzSmJaYCvrRFJWVKhNVgV5yfbyLVlmJcY33Du/C
	 Jz/riAi9Oaj5XecJaSEJPha0byHCw+4Ij+mPzho2wxcojBWirUObyTRNEGruVsnV0C+6y
	 SUil2pMmXAct0EYqCSe2eza0POSfXMFq1gfW27PPPdPL17IC4uqTz69bCAZny4uZ3xnc1
	 bRVaUZocGeHLJokO0Z1SVePSUTddM08gOTeVEB3tC14iUPRF9P3S4vhny2duXYnPQ6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=sdxHZeTZ;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A750606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A750606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=sdxHZeTZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cor0zS7jHNAwQFOgbGqP2fvLgRx1UFpWzZtEMHTV7J0=; b=sdxHZeTZze7rzTX8GyqmmkDwvj
	fyztdQKpoduPtX/R9l0ULjGFBPGEnTbSW4Ex3r018ToIDhTCNGmaMYa79Jkf3BzhrHKLu4O6vdtjK
	QSGqG/NOll+fE51Ebh+c5CJA9NMtPojFQ4tPLgjZDD6F4zexQH6/jLIg1Vfnfz8nBIqJ+F8IWuY/M
	hxnadS/Wi2Af7TSrDhuszuZOPCTybmlVT9xAmXE6KdHX5aOHPQ7RxC7M7OARhu9AB1XneCkTq9qwU
	kB2y3sce03jmZqSBDm9MMXD6/KIMwYBXltRVy4WS7xBZUD9rhhkUnGIZE6fsxYKrKeDbY17it6nZe
	2avA0wBA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGfL-00000001ayR-4By1;
	Wed, 25 Nov 2026 17:20:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A49C93008BF; Wed, 25 Nov 2026 18:20:18 +0100 (CET)
Date: Wed, 25 Nov 2026 18:20:18 +0100
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
Message-ID: <20261125172018.GD2668564@noisy.programming.kicks-ass.net>
References: <20261120171658.Cf9qIU-Y@linutronix.de>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261120171658.Cf9qIU-Y@linutronix.de>

On Fri, Nov 20, 2026 at 06:16:58PM +0100, Sebastian Andrzej Siewior wrote:
> syzbot reported a race of assigning a CPU affinity during CPU hotplug
> operation.
> After the affinity of an IRQ has been changed, the IRQ-core sets
> IRQTF_AFFINITY and wakes the relevant interrupt threads which need to
> adjust their affinity mask. The thread will then invoke
> set_cpus_allowed_ptr() to update the mask. Based on the new mask a CPU
> is chosen on which the thread should run.

This is irq_thread_check_affinity(), right?

So the problem begins here, by selecting a CPU that isn't guarded to
remain online until after the operation completes.

> It is verified that this CPU is online however there is no guarantee
> that this CPU remains online while affine_move_task() is moving _this_
> task. Since the current task requests the migration the stopper/
> migration_cpu_stop() is involved at which point the task pauses for a
> while. If the CPU goes offline (or is no longer cpu_online_mask) then
> __migrate_task() (due to is_cpu_allowed() reject) will return the rq of
> the CPU on which the task is currently running (which does not match
> it's task_struct::cpus_mask).

Right.

> The aftermath:
> The IRQ-thread's CPU and task's cpus_mask do not match. A
> migrate_disable()-> schedule() will change task_struct::cpus_ptr
> ensuring that the following migrate_enable() will update the task to the
> requested affinity mask.

OK, so is this all afterwards, or interleaved? That is, are we talking
about:

A)	
	CPU-A				CPU-B			CPU-C

	migrate_disable()
	schedule()
	  migrate_disable_switch();
	  				<hotplug unplug A> 	set_cpus_allowed()

	migrate_enable()

or B)	

	CPU-A				CPU-B			CPU-C

	  				<hotplug unplug A> 	set_cpus_allowed()

	migrate_disable()
	schedule()
	  migrate_disable_switch();

	migrate_enable()
	
?

> At this point, affine_move_task() expects
> task_struct::migration_pending set but it is NULL because noone
> requested an affinity change while the task was in migrate-disable
> section.

We're talking about:

	migrate_enable()
	  ___migrate_able()
	    __set_cpus_allowed_ptr()
	      __set_cpus_allowed_ptr_locked()
	        affine_move_task();

Right? Where the target is a kthread while running on a CPU that isn't
inside p->cpus_mask (because p->cpus_mask intersected with online_mask
is empty).

So, affine_move_task() will fail the first branch; we're not inside
cpus_mask. And we'll fail the second branch, because SCA_MIGRATE_ENABLE,
and hit:

	pending = p->migration_pending;
	WARN_ON_ONCE(!pending);

OK.


> There are a few spots where set_cpus_allowed_ptr() does not use
> cpus_read_lock(). In the IRQ thread case, there will be an update
> following if the CPU goes offline so it is not really needed to block
> CPU hotplug during the update.
> 
> If __migrate_task() fails, set the CPU mask of the task to runqueue it
> is currently on. Use do_set_cpus_allowed() for this so it also invokes
> class' set_cpus_allowed callback.
> Remove the comment about __migrate_task() failing.
> 
> Reported-by: syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6a9919ac.94649fcc.25487e.0005.GAE@google.com/
> Fixes: af449901b84c9 ("sched: Add migrate_disable()")
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> 
> This survives my testcase without any warnings.
> 
> v2…v3: https://lore.kernel.org/all/20261012103946.aOSAmrRe@linutronix.de/
>   - Drop RFC and with it the irq_thread_check_affinity() since the
>     problem is not limited to it.
>   - Instead of manually setting the CPU mask bit, use
>     do_set_cpus_allowed() which should handle the DL bits correctly.
> 
> v1…v2: https://lore.kernel.org/all/20260907085825.f-CZ1Q5y@linutronix.de/
>   - Repost with collected notes.
> 
>  kernel/sched/core.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 5ed660f099a55..c95d16ba9fe36 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2710,17 +2710,16 @@ static int migration_cpu_stop(void *data)
>  		if (task_on_rq_queued(p)) {
>  			update_rq_clock(rq);
>  			rq = __migrate_task(rq, &rf, p, arg->dest_cpu);
> +			if (rq != cpu_rq(arg->dest_cpu)) {
> +				struct affinity_context ac = {
> +					.new_mask  = cpumask_of(rq->cpu),
> +				};
> +
> +				do_set_cpus_allowed(p, &ac);
> +			}
>  		} else {
>  			p->wake_cpu = arg->dest_cpu;
>  		}
> -
> -		/*
> -		 * XXX __migrate_task() can fail, at which point we might end
> -		 * up running on a dodgy CPU, AFAICT this can only happen
> -		 * during CPU hotplug, at which point we'll get pushed out
> -		 * anyway, so it's probably not a big deal.
> -		 */
> -
>  	} else if (pending) {
>  		/*
>  		 * This happens when we get migrated between migrate_enable()'s

So yes, this cures things, but I'm not sure silently updating the mask
is nice. People could be surprised the cpumask isn't what they set --
then again, perhaps such people should disable hotplug when changing
affinity?

Let me ponder this while making dinner :-)
