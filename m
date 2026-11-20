Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163689;
	b=tKFrYgZ5dxT2ZmWck2IeflUcJyDFYycWDF8k+eo7AJLEJOhNATZJ1bpgOFXzxBz1Ld9T
	 iNMspOMqtzmZK/24/RAy7cEU2It9Hux28V2NdVELXjTRP6PJk4z3j6ewVgr3+kSzjLfcB
	 giZrj7oGbejglVw6x3TrmMri4cwt9qGsUOXkXJ5XXnWl4DXCctuZ4QfN3VDx1dlLSAFfv
	 wabU3OaI+J4aNHU0WjzCbGWom0VkYih3kU8Seed+DVuGplxGhaR0p7Q9nt7zNBi1EtouD
	 7dcbyA5FXo5mQgX+cMBRXfR5vfmxQaW8gIZwZt/ox19Egh03KcbquEaw9MMFg49pwZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163689;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ujB6CeiETicBvrBp7xnOPbEZ4TngNBdrwuDtR11sq8c=;
	b=0F1YZibiaAMjGLs+jhJN5DH9ZkVuMy6SPVXEjOlc7mVnM/aXbgyOY5u7h7xHPgyfeIQA
	 3y4tgPNzU4q1NZCWRdpzM2Xe7z84LQwIiTppxmGRpEP+ffr16cns7W5JjXTSlhiUXEDxY
	 fAqJLhFBHujvj1Bkg/qwsCl5fthz7H5+rEXoA4X7eZhQDysuMAkoaNlNGYTNdGEyJdOxe
	 n45D5UIBcQavndg83mntq1hAq1m0x3/yBG9cZ4xeWnFh0To3jfc7CiTnQHC4K9kiBnkQX
	 1JzZLbISgTpVqZgFEIw64VaXiOtKhi3aisyd1bb+nufPYSPXLd8U4guRkkfiQJlYqEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=o1pU1paS;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC93606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DC93606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=o1pU1paS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ujB6CeiETicBvrBp7xnOPbEZ4TngNBdrwuDtR11sq8c=; b=o1pU1paSCnhtxGOZ8GCD7j9zaT
	MmB721hVqiVAwtVlxOHbxpwzfig/ajqCJkZWdiJp5Jqa0b0bkJDaFB3fGyMwgMlxFJ0UgkryrAu7N
	vKEarmZfEg1P9YsOWTVDjbg1mRx1bFQJLu+kGjPtPUghhHRIUtOgmo7wMuUbeTld300A/8U5ZYA7y
	DfsQ55fo/ZPII59xeUDrgkZl6TbdpBKW3+xL8JW7AeEgOrwNNtXy2oO2qCmxADBRIvrpCxmdrNuWT
	1VyFo+IcWunp71BsiXBMRv8s5CEMrd4mZX/Psv5G4M2UtEKfqs9pz4v5gDV2Q7FdTD8Db17lI8Y26
	BUZJWWyQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUK4v-00000000YBC-35vR;
	Fri, 20 Nov 2026 08:34:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4823130057F; Fri, 20 Nov 2026 09:34:40 +0100 (CET)
Date: Fri, 20 Nov 2026 09:34:40 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [PATCH] sched/fair: Don't let task_tick_cache() IPI dyntick CPUs
Message-ID: <20261120083440.GL2668564@noisy.programming.kicks-ass.net>
References: <20261119203825.2732984-1-vschneid@redhat.com>
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
In-Reply-To: <20261119203825.2732984-1-vschneid@redhat.com>

On Thu, Nov 19, 2026 at 09:38:25PM +0100, Valentin Schneider wrote:
> While testing some CPU isolation / NOHZ_FULL stuff I stumbled on something
> like so:
> 
>   kworker/u289:5-241489 [001] d..3.  2963.728734: ipi_send_cpu:         cpu=6 callsite=task_work_add+0x84 callback=0x0
>   kworker/u289:5-241489 [001] d..3.  2963.728735: kernel_stack:         <stack trace >
>   => trace_event_raw_event_ipi_send_cpu (ffffffffa6d7ba45)
>   => kick_process (ffffffffa6d827a2)
>   => task_work_add (ffffffffa6d645c4)
>   => task_tick_fair (ffffffffa6d9cfbe)
>   => sched_tick_remote (ffffffffa6d84c69)
>   => process_one_work (ffffffffa6d5d57b)
>   => worker_thread (ffffffffa6d5e1af)
>   => kthread (ffffffffa6d66e85)
>   => ret_from_fork (ffffffffa6cb3f2b)
>   => ret_from_fork_asm (ffffffffa6c7741a)
> 
> In this case CPU6 is isolated via isolcpus=, and is executing a single pure
> userspace task, so should be fully leveraging dynticks.
> 
> However, because that task is SCHED_OTHER, housekeeping CPUs periodically
> handle a sched_tick_remote() on its behalf, and end up kicking that task
> out of userspace to run the task_cache_work().
> 
> Let task_tick_cache() recognize when it is invoked via a remote tick, and
> bail out rather than disturb dyntick CPUs.
> 
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> ---
>  kernel/sched/fair.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index d4cc0caee6265..42394745a124b 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1925,6 +1925,13 @@ static void task_tick_cache(struct rq *rq, struct task_struct *p)
>  	    !grp->pcpu_sched)
>  		return;
>  
> +	/*
> +	 * We got here from a sched_tick_remote(), meaning @p is making use of
> +	 * NOHZ_FULL. Don't disturb it with a task_work() IPI.
> +	 */
> +	if (cpu_of(rq) != smp_processor_id())
> +		return;
> +
>  	epoch = rq->cpu_epoch;
>  	/* avoid moving backwards */
>  	if (time_after_eq(grp->epoch, epoch))


Its early, and I definitely need more wake-up juice, but how is
task_tick_numa() different here?

Also, I'm not sure sched_tick_remote() is the right condition here. But
perhaps something like so? Does this make sense?

---
diff --git a/arch/x86/include/asm/stop_machine.h b/arch/x86/include/asm/stop_machine.h
deleted file mode 100644
index e69de29bb2d1..000000000000
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 731d78155e65..ddcfd82a9e8e 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4588,6 +4588,9 @@ static void task_tick_numa(struct rq *rq, struct task_struct *curr)
 	struct callback_head *work = &curr->numa_work;
 	u64 period, now;
 
+	if (!static_branch_unlikely(&sched_numa_balancing))
+		return;
+
 	/*
 	 * We don't care about NUMA placement if we don't have memory.
 	 */
@@ -15401,15 +15404,20 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int hrtick)
 	if (hrtick)
 		return;
 
-	if (static_branch_unlikely(&sched_numa_balancing))
-		task_tick_numa(rq, curr);
+	task_tick_core(rq, curr);
 
+	/*
+	 * If there is no root domain; there is no balancing, and none of this
+	 * matters.
+	 */
+	if (!rq->rd)
+		return;
+
+	task_tick_numa(rq, curr);
 	task_tick_cache(rq, curr);
 
 	update_misfit_status(curr, rq);
 	check_update_overutilized_status(task_rq(curr));
-
-	task_tick_core(rq, curr);
 }
 
 /*
