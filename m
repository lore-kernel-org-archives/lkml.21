Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079265;
	b=MDhE9kXnwT3ECthpeJXvOXPu3x99Dt1Wj4bYiIqFVLN/km6g/+XMPo5B8xkroILV16Xq
	 1aCM68pj2q/JCsRvcla7w9lm4cyZigDSCvsTeFGP6F6GIT1dPgulF30GcLb5MNwtW33Qb
	 sr4q5VqK+wix++wWgsmCKa6UF1MRwZNcS30ltgqIWLA11vHL7vMfGEfqJt8/QHfxwKpWQ
	 IfO25CLTXKxNembyGHImnNTDB2MrzF4D1hKFR+ZH0ql4pRRlUBvRp/FB+oFVjviNE0lW0
	 24sK/tQXhjSEhHlLw/iwI9gwXtXAqg41TUsBd0u9G7lsLafuBT23jn+4X61EpEW5XEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079265;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=oYTD4gK2l7qq50u6Na+bqkidm/om//4XVanpQBpITwg=;
	b=xb62gPeAQr9+hhpaNPORba0VBNhO0ERGz49C6R3t5/6gTb+vjr6byt7+nEHD4PRj7vA+
	 AzwRy87ieB19EjuY/dZ7aLpIxppDygWtFxNyIerWFxs6yNcq5hxBxPZYlJECeHan1MwHt
	 /Sgjdp3UkOPdZCLvFNmgHTNhYcf07arg3/eaK9e+kdkHbBX9SVBa9MnvmDm/IUrJhCGwD
	 W1P875Ju2/1N4eLp3vxZPnxVa5s0OXbqY2m4zqXx+0eq96ZUq8J0avXDtGhnReF1t6rdb
	 DEzF+Ornfac6qlXJQkGmDqZl4sekYTqrFstnYmV21NUx7ND+ukoQZe+AdbPR/2BkefA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=B0g8U709;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0E5606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E0E5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=B0g8U709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oYTD4gK2l7qq50u6Na+bqkidm/om//4XVanpQBpITwg=; b=B0g8U709VvYk65CKZIH4nyemhL
	7xErmyWC9pQXQtzK9UwUF+XC/Xw6ah8rxy63oI+ndEwAzLEn52EPFYx/xNOK1UuSrVz9QYSriGF2y
	vony1WYSEslMlHOlyhz04CNvtmAmlgGnPRV6vadQ6N2ku0fV7I9gqmCuukBzPuDau0mlWzVpVviR1
	SjDy2dZlCmmquA3Vg9w1oFXg9OTPt/NDiOm1ktOcmAkQS/Ve5hpeVjAH+ebxAmcE1iKRRWm+cSz1c
	pZkhTTtnMo2vn62Odnb5mHpiNquqVuFoBFFA5CwsDBWzRmF2BFdZ7Rzdzw8A4p6CyUOu1RRt4lmuB
	+4cv0Qkg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy78-0000000H21W-1JTi;
	Thu, 19 Nov 2026 09:07:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BC23030072F; Thu, 19 Nov 2026 10:07:28 +0100 (CET)
Date: Thu, 19 Nov 2026 10:07:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Fushuai Wang <fushuai.wang@linux.dev>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	sshegde@linux.ibm.com, linux-kernel@vger.kernel.org,
	wangfushuai@baidu.com
Subject: Re: [PATCH v2] sched/core: Fix a TOCTOU bug in
 sched_non_preferred_cpu_push_stop()
Message-ID: <20261119090728.GN2668804@noisy.programming.kicks-ass.net>
References: <20261118065921.98260-1-fushuai.wang@linux.dev>
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
In-Reply-To: <20261118065921.98260-1-fushuai.wang@linux.dev>

On Wed, Nov 18, 2026 at 02:59:21PM +0800, Fushuai Wang wrote:
> From: Fushuai Wang <wangfushuai@baidu.com>
> 
> sched_push_current_non_preferred_cpu() is called in irq context. It
> checks is_migration_disabled() before queuing the stopper.
> 
> migrate_disable() sets p->migration_disabled in preempt_disable() section.
> An irq can hit after preempt_disable() but before p->migration_disabled=1.
> After the irq returns, the task cannot be preempted by stopper becuase
> preemption is disabled, so it finishes setting p->migration_disabled=1
> before the stopper runs.
> 
> It may be like:
>     task context:                       irq context:
>     migrate_disable()
>         preempt_disable()
>                                         is_migration_disabled()
>         migration_disabled = 1
>         preempt_enable()
> 
> So recheck is_migration_disabled() in sched_non_preferred_cpu_push_stop()
> before calling __migrate_task().
> 

*sigh*:

  https://lore.kernel.org/r/20260925074953.GG4121339@noisy.programming.kicks-ass.net

> Fixes: 74699f56ebcf ("sched/core: Push current task from non preferred CPU")
> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
> ---
> v1->v2: No code changes, just improve the commit message.
> 
>  kernel/sched/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 5ed660f099a5..6f9374aa3f19 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -11314,7 +11314,8 @@ static int sched_non_preferred_cpu_push_stop(void *arg)
>  		rq->npc_push_work_pending = false;
>  		update_rq_clock(rq);
>  
> -		if (task_rq(p) == rq && task_on_rq_queued(p)) {
> +		if (task_rq(p) == rq && task_on_rq_queued(p) &&
> +		    !is_migration_disabled(p)) {
>  			struct rq *dest_rq = __migrate_task(rq, &rf, p, cpu);
>  
>  			if (rq != dest_rq)

I think I like a comment with this. Perhaps add something like:

	/*
	 * Racy: is_migration_disabled(current) isn't stable.
	 */
	if (is_migration_disabled(push_task))
		return;

in sched_push_current_non_preferred_cpu().



Also, I wonder if you'd find more of this if you stick something like:

	lockdep_assert(!task_on_cpu(p) || in_task());

inside is_migration_disabled().

