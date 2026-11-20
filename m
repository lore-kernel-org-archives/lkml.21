Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139112;
	b=puQ+2usSYeGsdSZ1qUAS81Wqlk2stpIxa717M6Nv/X8IG6SbbIm99N4nQUbS3KjqYrTd
	 CI5CGg4kf+hnYwMOzFklx0eA/x3exTdKRPzx2nXOh7uERzTZLti5zkilkq7o7nMYeR170
	 Ul3v19SpGVJDTD7QISgSSkHzj5c9kBEw2WnU7H+E5F/Z3ozY7rCuS9wYRlHJxUWxat7Bu
	 7g8mvgMDoT1tENTT6xyzD5/M6+DyfktdnXL16F9hFm0dnN5YtNTfaXzK0zqSZWVyIYEDM
	 fmwmHWyYw4lo6E0xS8VAIj+OzBqcfEwqzy2T9FfELfJoQyZ9KnzVhdaW41GbI6EWzAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139112;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vOfDRV65gpl3XFue5yfsPa1mXlSX9SKYUF7kxeoYwdI=;
	b=FVdWEbwZNCTfKitNkr7dAewdfnmtkpvCVDRtSyaTjC+oy3cIOed35YWMWTLezT8R3Fyy
	 CdTyRlEkI++dN0oVbIwKDqXEthWHjvZEfoOUb5tPxYZGqS6rwVXge/Zwf871rh5tKukWO
	 E8K+gvV2DgtWyr4TJhbY/v99sTByXvPnH+F5W7NWFaVgHDbMRp8BMiUuGM3zanx1bv34g
	 EP8X8ORP79trM7MQOC07gwkdz7Gvpyjl6e0XBqNXsdyBsJHp6YQQ9xRINVXnuzkTs1+/o
	 DFgDjYa7X5qGKUp3UbDONRjljVeAg5oknfoIjnlgY/FFFK2ILFA277qYx8AmAXEBoqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.220
Received: from out28-220.mail.aliyun.com (out28-220.mail.aliyun.com [115.124.28.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D68A606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D68A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0179785-0.0017062-0.980315;FP=2006169323307648251|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037028158;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.k6A78-M_1795139106;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.k6A78-M_1795139106 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 20 Nov 2026 09:45:07 +0800
Subject: Re: [PATCH v4] sched/fair: Distribute burst-woken tasks when rq depth
 reaches 3x average
To: peterz@infradead.org
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org
References: <20261111061803.337042-1-likunyu@open-hieco.net>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <9cc3d7d8-a0ae-6c14-3464-f1cdb17838b5@open-hieco.net>
Date: Fri, 20 Nov 2026 09:45:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261111061803.337042-1-likunyu@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Peter,

On 2026/11/11 14:18, Li kunyu wrote:
> When a task burst-wakes a large number of tasks in a short period, tasks
> can pile up on a single CPU regardless of whether the system has idle
> CPUs or NO_HZ enabled.
> 
> During the periodic load-balance pass at the top-level domain, compute
> and cache the 3x average runqueue depth threshold (floored at 3 tasks)
> in root_domain, updating it only when the value changes.
> 
> In select_task_rq_fair(), if the target runqueue depth reaches 3x the
> system average, fall back to cpumask_any_and_distribute() with
> housekeeping_cpumask(HK_TYPE_DOMAIN) to rotate waking tasks across
> allowed non-isolated CPUs. In addition, reset the periodic load-balance
> and scheduling-domain intervals so regular load balancing can promptly
> smooth out the distribution.
> 
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Link: https://lore.kernel.org/all/20261021125419.GK2823843@noisy.programming.kicks-ass.net/
> Signed-off-by: Li kunyu <likunyu@open-hieco.net>
> ---
> Changes in v4:
> - Gate the scheduling-domain interval reset within the time_after()
>   conditional block.
> - Update the commit message to match the current implementation.
> - Only update overload_nr_threshold when env->cpus has complete CPU
>   statistics for the domain (Kayra Cizmeci).
> - Filter out isolated CPUs via housekeeping_cpumask(HK_TYPE_DOMAIN).
> 
> Changes in v3:
> - Move the overload check to the end of select_task_rq_fair() and verify
>   dist_cpu has fewer running tasks than new_cpu (Kayra Cizmeci).
> 
> Changes in v2:
> - Rebase onto latest mainline (Kayra Cizmeci).
> - Cache pre-calculated 3x threshold in root_domain and only WRITE_ONCE()
>   when the threshold changes to avoid hotpath math and cacheline dirtying
>   (K Prateek Nayak).
> - Expedite periodic balance via rq->next_balance gated by time_after()
>   (K Prateek Nayak, Kayra Cizmeci).
> ---
>  kernel/sched/fair.c     | 67 ++++++++++++++++++++++++++++++++++++++---
>  kernel/sched/sched.h    |  3 ++
>  kernel/sched/topology.c |  2 ++
>  3 files changed, 68 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index cfc982205b98..46ae9ab62a2d 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -9900,6 +9900,36 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
>  	return target;
>  }
>  
> +/*
> + * Check if a CPU's rq depth reaches the 3x system-wide average threshold
> + * cached in root_domain (floored at 3 tasks).
> + */
> +static inline bool rq_burst_overloaded(int cpu)
> +{
> +	struct rq *rq = cpu_rq(cpu);
> +
> +	if (unlikely(!rq->rd))
> +		return false;
> +
> +	return rq->nr_running >= rq->rd->overload_nr_threshold;
> +}
> +
> +static inline void reset_periodic_lb_interval(int cpu)
> +{
> +	struct sched_domain *sd;
> +	unsigned long next = jiffies + 1;
> +	struct rq *rq = cpu_rq(cpu);
> +
> +	if (time_after(rq->next_balance, next)) {
> +		rq->next_balance = next;
> +
> +		for_each_domain(cpu, sd) {
> +			if (sd->balance_interval > sd->min_interval)
> +				sd->balance_interval = sd->min_interval;
> +		}
> +	}
> +}
> +
>  /*
>   * select_task_rq_fair: Select target runqueue for the waking task in domains
>   * that have the relevant SD flag set. In practice, this is SD_BALANCE_WAKE,
> @@ -9970,12 +10000,22 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  	/* Slow path */
>  	if (unlikely(sd)) {
>  		new_cpu = sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> -		return select_idle_smt_cpu(p, new_cpu);
> +		new_cpu = select_idle_smt_cpu(p, new_cpu);
> +	/* Fast path */
> +	} else if (wake_flags & WF_TTWU) {
> +		new_cpu = select_idle_sibling(p, prev_cpu, new_cpu);
>  	}
>  
> -	/* Fast path */
> -	if (wake_flags & WF_TTWU)
> -		return select_idle_sibling(p, prev_cpu, new_cpu);
> +	if (unlikely(rq_burst_overloaded(new_cpu))) {
> +		int dist_cpu = cpumask_any_and_distribute(p->cpus_ptr,
> +							  housekeeping_cpumask(HK_TYPE_DOMAIN));
> +
> +		if (likely(dist_cpu < nr_cpumask_bits && cpu_rq(dist_cpu)->nr_running <
> +			   cpu_rq(new_cpu)->nr_running && cpu_active(dist_cpu))) {
> +			reset_periodic_lb_interval(dist_cpu);
> +			return dist_cpu;
> +		}
> +	}
>  
>  	return new_cpu;
>  }
> @@ -11682,6 +11722,7 @@ struct sg_lb_stats {
>  struct sd_lb_stats {
>  	struct sched_group *busiest;		/* Busiest group in this sd */
>  	struct sched_group *local;		/* Local group in this sd */
> +	unsigned long total_nr_running;		/* Sum of nr_running in this sd */
>  	unsigned long total_load;		/* Total load of all groups in sd */
>  	unsigned long total_capacity;		/* Total capacity of all groups in sd */
>  	unsigned long avg_load;			/* Average load across all groups in sd */
> @@ -11705,6 +11746,7 @@ static inline void init_sd_lb_stats(struct sd_lb_stats *sds)
>  		.local = NULL,
>  		.total_load = 0UL,
>  		.total_capacity = 0UL,
> +		.total_nr_running = 0UL,
>  		.busiest_stat = {
>  			.idle_cpus = UINT_MAX,
>  			.group_type = group_has_spare,
> @@ -12977,6 +13019,7 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
>  		/* Now, start updating sd_lb_stats */
>  		sds->total_load += sgs->group_load;
>  		sds->total_capacity += sgs->group_capacity;
> +		sds->total_nr_running += sgs->sum_nr_running;
>  
>  		sum_util += sgs->group_util;
>  		sg = sg->next;
> @@ -13000,6 +13043,22 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
>  
>  		/* Update over-utilization (tipping point, U >= 0) indicator */
>  		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
> +
> +		/*
> +		 * We update the average task count at the top-level (root)
> +		 * domain, as this incurs the least overhead and comes
> +		 * closest to the ideal scenario. The trade-off is that we
> +		 * must accept some temporary data inaccuracy.
> +		 */
> +		if (env->sd->span_weight && cpumask_weight(env->cpus) == env->sd->span_weight) {
> +			unsigned long thresh;
> +
> +			thresh = max_t(unsigned long,
> +				       (sds->total_nr_running * 3) / env->sd->span_weight, 3);
> +
> +			if (READ_ONCE(env->dst_rq->rd->overload_nr_threshold) != thresh)
> +				WRITE_ONCE(env->dst_rq->rd->overload_nr_threshold, thresh);
> +		}
>  	} else if (sg_overutilized) {
>  		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
>  	}
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 6c7c5633524a..71d946da9600 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1096,6 +1096,9 @@ struct root_domain {
>  	cpumask_var_t		rto_mask;
>  	struct cpupri		cpupri;
>  
> +	/* 3x average per-CPU rq depth threshold for burst wakeup distribution */
> +	unsigned long		overload_nr_threshold;
> +
>  	/*
>  	 * NULL-terminated list of performance domains intersecting with the
>  	 * CPUs of the rd. Protected by RCU.
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 919d0fb00bd9..fe154dfdf23e 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -572,6 +572,8 @@ static int init_rootdomain(struct root_domain *rd)
>  
>  	if (cpupri_init(&rd->cpupri) != 0)
>  		goto free_cpudl;
> +
> +	rd->overload_nr_threshold = 3;
>  	return 0;
>  
>  free_cpudl:
> 

Could you review the patch again and let me know if there are any other parts
that need to be modified?

-- 
thanks,
kunyu
