Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726446;
	b=xb/3hm3lz9hdQlZnarMLpS1Z2ABLXVksY6M6HFh+Sg6SaGzT1kH1aI7kOwQHDfIDsvQJ
	 Id7xhn/TtJcOWEaisPRbawPfaKK7HfAOVGI4PDeO9aePClXCN5NDwxm+uE/UrBXk89dWP
	 HEAzpfaSLfUOBgBEwKmKKBBkh6d0/UIjKI9Y3YHIa2QMWZ6N8OZxtt447Z24edy9YjxJ0
	 uSe2N8iODpMFR9QqMlUQr17jA031aDD+zjcflm+6qZmzHkbfRl9msJ0rgw6syclI91mZ9
	 78FSVPbrvgZQ1NUYgJPEJUlYdya/NfSb64v9H2czRCifuzZMq+qXU7zWFvJO7r+3kog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726446;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=tJSzehbueaib/vskHYCzN/ybyboaq0seZQJEfuh0zfU=;
	b=iGlzBC0jLD6Nh2urvAgGKBj8OjS3i/LqYvoEhHtEYwK2WtjSEs3ePSGBQC/qNoLWvmw4
	 R/xzuQht5d8pYVKo76qpwV/ddXqJDMJqSBaO3bdoGppCuNhZ6TwaCEw3/PFmc9VMHJEqL
	 gC79zDYZXeaRW9Jtir98PIHXbl6s9XbZtBdlNJJhma7qqnNzPsBoQYpEsNHYx8GMsHCCD
	 rcUVwgepuvvZyzWteAJffGMp82YojiIU4Oc0MaxYwLhtj+5z081zV9qnmJnYFJ+aII8hM
	 yhA19ZiOiqpDZwAgX/xxa+UZg3jGfKhbEiW+kMcGiW1Er2LmxgfrChs82NqeTZvs5mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UR8aDB67;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A06606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2A06606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UR8aDB67
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 047C71BA8;
	Thu, 26 Nov 2026 12:54:01 -0800 (PST)
Received: from [10.57.70.173] (unknown [10.57.70.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E32ED3F86F;
	Thu, 26 Nov 2026 12:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795726443; bh=YxjSEhCdcBhtvdRl+ZNHZA230RFfTK5umez7Rd4YXIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UR8aDB67A/hQeSev2QdLorTUAPbwz9sdVy8QH8hPkQE89K9k6Bi5k+kwLAghhwa47
	 odvUPrKKGOix/BILCuqx4/bcJQHBw2y2poM5cHmk087jrWbE9ap+T+N8Lmc1bgFtlL
	 2d1pla6fUqp9YkC17S7NWfoJP1ClNHStNeEnU0X4=
Message-ID: <8472ef10-7793-4c3b-99e8-d72983b1e064@arm.com>
Date: Thu, 26 Nov 2026 20:53:59 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] sched/uclamp: Move uclamp_rq_{inc, dec}() from
 core.c
To: Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org, Kayra Cizmeci <kayracizmeci@gmail.com>
References: <20261126012836.15205-1-qyousef@layalina.io>
 <20261126012836.15205-4-qyousef@layalina.io>
From: Christian Loehle <christian.loehle@arm.com>
Content-Language: en-US
In-Reply-To: <20261126012836.15205-4-qyousef@layalina.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/26/26 01:28, Qais Yousef wrote:
> Fair and RT throttling can dequeue tasks without going through core
> leading to partial dequeue and corrupt rq uclamp state. Fix the problem
> by pairing uclamp_rq_{inc, dec}() with {add, sub}_nr_running() so that
> each class that cares about uclamp updates the rq state along with the
> nr_running. For RT use {inc, dec}_tasks() when a task is added/removed
> since managing nr_running is more complicated.
> 
> Since RT group throttling doesn't actually dequeue the task but only the
> group but lies about nr_running, it is a more complicated fix and there
> are proposals to mark it as broken, so this is not handled and left
> alone.
> 
> Remove the sched_delayed guards from uclamp_rq_{inc, dec}() since we now
> react at the appropriate time to do the operations and no longer need to
> care about this detail. With this gone, the flags parameter can be
> dropped too.
> 
> Signed-off-by: Qais Yousef <qyousef@layalina.io>
> ---
>  kernel/sched/core.c    | 33 +++++++++------------------------
>  kernel/sched/ext/ext.c |  6 ++----
>  kernel/sched/fair.c    |  6 ++----
>  kernel/sched/rt.c      | 10 ++++++----
>  kernel/sched/sched.h   |  8 ++++----
>  5 files changed, 23 insertions(+), 40 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 04c396435413a..8994e27f8582d 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -1894,7 +1894,7 @@ static inline void uclamp_rq_dec_id(struct rq *rq, struct task_struct *p,
>  	}
>  }
>  
> -static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags)
> +void uclamp_rq_inc(struct rq *rq, struct task_struct *p)
>  {
>  	enum uclamp_id clamp_id;
>  
> @@ -1907,13 +1907,6 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
>  	if (!uclamp_is_used())
>  		return;
>  
> -	if (unlikely(!p->sched_class->uclamp_enabled))
> -		return;
> -
> -	/* Only inc the delayed task which being woken up. */
> -	if (p->se.sched_delayed && !(flags & ENQUEUE_DELAYED))
> -		return;
> -
>  	for_each_clamp_id(clamp_id)
>  		uclamp_rq_inc_id(rq, p, clamp_id);
>  
> @@ -1922,7 +1915,7 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
>  		uclamp_rq_clear_idle(rq);
>  }
>  
> -static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
> +void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
>  {
>  	enum uclamp_id clamp_id;
>  
> @@ -1935,12 +1928,6 @@ static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
>  	if (!uclamp_is_used())
>  		return;
>  
> -	if (unlikely(!p->sched_class->uclamp_enabled))
> -		return;
> -
> -	if (p->se.sched_delayed)
> -		return;
> -
>  	for_each_clamp_id(clamp_id)
>  		uclamp_rq_dec_id(rq, p, clamp_id);
>  }
> @@ -2178,8 +2165,6 @@ static void __init init_uclamp(void)
>  }
>  
>  #else /* !CONFIG_UCLAMP_TASK: */
> -static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags) { }
> -static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p) { }
>  static inline void uclamp_fork(struct task_struct *p) { }
>  static inline void uclamp_post_fork(struct task_struct *p) { }
>  static inline void init_uclamp(void) { }
> @@ -2215,11 +2200,10 @@ void enqueue_task(struct rq *rq, struct task_struct *p, int flags)
>  		update_rq_clock(rq);
>  
>  	/*
> -	 * Can be before ->enqueue_task() because uclamp considers the
> -	 * ENQUEUE_DELAYED task before its ->sched_delayed gets cleared
> -	 * in ->enqueue_task().
> +	 * Need to be careful what operations are done here, some classes like
> +	 * fair and RT can enqueue tasks without going through core due to some
> +	 * features like throttling.
>  	 */
> -	uclamp_rq_inc(rq, p, flags);
>  
>  	p->sched_class->enqueue_task(rq, p, flags);
>  
> @@ -2249,10 +2233,11 @@ inline bool dequeue_task(struct rq *rq, struct task_struct *p, int flags)
>  	psi_dequeue(p, flags);
>  
>  	/*
> -	 * Must be before ->dequeue_task() because ->dequeue_task() can 'fail'
> -	 * and mark the task ->sched_delayed.
> +	 * Need to be careful what operations are done here, some classes like
> +	 * fair and RT can dequeue tasks without going through core due to some
> +	 * features like throttling.
>  	 */
> -	uclamp_rq_dec(rq, p);
> +
>  	return p->sched_class->dequeue_task(rq, p, flags);
>  }
>  
> diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
> index a9e36b5bb0386..1dc35dbd42df1 100644
> --- a/kernel/sched/ext/ext.c
> +++ b/kernel/sched/ext/ext.c
> @@ -2496,6 +2496,7 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int core_enq_
>  	p->scx.flags |= SCX_TASK_QUEUED;
>  	rq->scx.nr_running++;
>  	add_nr_running(rq, 1);
> +	uclamp_rq_inc(rq, p);
>  
>  	if (SCX_HAS_OP(sch, runnable) && !task_on_rq_migrating(p))
>  		SCX_CALL_OP_TASK(sch, runnable, rq, p, enq_flags);
> @@ -2647,6 +2648,7 @@ static bool dequeue_task_scx(struct rq *rq, struct task_struct *p, int core_deq_
>  	p->scx.flags &= ~SCX_TASK_QUEUED;
>  	rq->scx.nr_running--;
>  	sub_nr_running(rq, 1);
> +	uclamp_rq_dec(rq, p);
>  
>  	scx_dispatch_dequeue(rq, p);
>  	p->scx.flags &= ~SCX_TASK_REENQ_REASON_MASK;
> @@ -5922,10 +5924,6 @@ DEFINE_SCHED_CLASS(ext) = {
>  	.prio_changed		= prio_changed_scx,
>  
>  	.update_curr		= update_curr_scx,
> -
> -#ifdef CONFIG_UCLAMP_TASK
> -	.uclamp_enabled		= 1,
> -#endif
>  };
>  
>  s32 scx_init_dsq(struct scx_dispatch_q *dsq, u64 dsq_id, struct scx_sched *sch)
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 731d78155e654..dde12d9e1af4d 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8266,6 +8266,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>  
>  	/* At this point se is NULL and we are at root level*/
>  	add_nr_running(rq, 1);
> +	uclamp_rq_inc(rq, p);
>  
>  	/*
>  	 * Since new tasks are assigned an initial util_avg equal to
> @@ -8385,6 +8386,7 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
>  		__dequeue_entity(cfs_rq, se);
>  
>  	sub_nr_running(rq, 1);
> +	uclamp_rq_dec(rq, p);
>  
>  	/* balance early to pull high priority tasks */
>  	if (unlikely(!was_sched_idle && sched_idle_rq(rq)))
> @@ -15962,10 +15964,6 @@ DEFINE_SCHED_CLASS(fair) = {
>  #ifdef CONFIG_SCHED_CORE
>  	.task_is_throttled	= task_is_throttled_fair,
>  #endif
> -
> -#ifdef CONFIG_UCLAMP_TASK
> -	.uclamp_enabled		= 1,
> -#endif
>  };
>  
>  #define SCHED_DEBUG_MAX_ITER 4096
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index 81a71aa5f094a..f353add1cc854 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -1189,6 +1189,9 @@ void inc_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
>  
>  	inc_rt_prio(rt_rq, prio);
>  	inc_rt_group(rt_se, rt_rq);
> +
> +	if (rt_entity_is_task(rt_se))
> +		uclamp_rq_inc(rq_of_rt_rq(rt_rq), rt_task_of(rt_se));
>  }
>  
>  static inline
> @@ -1201,6 +1204,9 @@ void dec_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
>  
>  	dec_rt_prio(rt_rq, rt_se_prio(rt_se));
>  	dec_rt_group(rt_se, rt_rq);
> +
> +	if (rt_entity_is_task(rt_se))
> +		uclamp_rq_dec(rq_of_rt_rq(rt_rq), rt_task_of(rt_se));
>  }
>  
>  /*
> @@ -2644,10 +2650,6 @@ DEFINE_SCHED_CLASS(rt) = {
>  #ifdef CONFIG_SCHED_CORE
>  	.task_is_throttled	= task_is_throttled_rt,
>  #endif
> -
> -#ifdef CONFIG_UCLAMP_TASK
> -	.uclamp_enabled		= 1,
> -#endif
>  };
>  
>  #ifdef CONFIG_RT_GROUP_SCHED
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 8fcac9b6be9cd..f6ff4e78fce0e 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -2729,10 +2729,6 @@ enum snt_e {
>  
>  struct sched_class {
>  
> -#ifdef CONFIG_UCLAMP_TASK
> -	int uclamp_enabled;
> -#endif
> -
>  	/*
>  	 * move_queued_task/activate_task/enqueue_task: rq->lock
>  	 * ttwu_do_activate/activate_task/enqueue_task: rq->lock
> @@ -3816,6 +3812,8 @@ static inline unsigned long cpu_util_rt(struct rq *rq)
>  
>  unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
>  void init_uclamp_rq(struct rq *rq);
> +void uclamp_rq_inc(struct rq *rq, struct task_struct *p);
> +void uclamp_rq_dec(struct rq *rq, struct task_struct *p);
>  
>  /*
>   * When uclamp is compiled in, the aggregation at rq level is 'turned off'
> @@ -3925,6 +3923,8 @@ uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
>  }
>  
>  static inline void init_uclamp_rq(struct rq *rq) {}
> +static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p) {}
> +static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p) {}
>  
>  static inline bool uclamp_rq_is_capped(struct rq *rq) { return false; }
>  

FWIW two of the sashiko findings are unrelated to patch 1 and seem like
genuine concerns to me.
I guess I'll pick up patch 2 for now with my dequeue-only fix?
