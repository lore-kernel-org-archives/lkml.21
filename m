Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076983;
	b=SyAUIvh/S//kRFlME5ezGA6+4mfuwkqT1MchmbqvU4t2rHnpa41o7WGV4Ph+uLxcm5E9
	 ffuP3eJiVthjldQZqyMODXxtzHnhkAnMzgx/IybCdOawY8bNog7EWt2vX+4IDiHarnOAJ
	 LaS3F2IF6Gc74vK4HyVvgT9ZKTvs6FunDhZXt/rUdjX5+nKpYiTXgRsaAiSg1qY56apvU
	 6WmrgDGp23M7JhhVVZIYK4EvcdvN/Lsvu6rrP3BVtkeMu1lPjO+zzCffAN2uCziSeSjBx
	 VfO5206KheQ2LOU3dM74jJzVKLFvm7RaZ9fhR44wZgt12zU8IujbNeVmY5z4eMOVQxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076983;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=K7zUG+frS2SH+BOGTST+cKNobSKrv30UhclGR3RT9KM=;
	b=0/CSuZoCXuAL6ItCzXi+b24nBWfMmZaYgtT9fNbk6nCuANZhiL5fgUMs2oTsi7+heUmm
	 tmdqXyxfRdJ8C1tZlWWXpxE3yD7rcN7nU4dt1VTumhJH/EE7/XhU//+Ip5YVnAwNlxVyb
	 ozeW8oII8FkjaGrfZPLFphKpmxf1nMLWtB3MFowh5e+/w8n0NJRIuEhNIpw6UEs0m1Prm
	 eFcwLKE312DEyGgqVwU09FmF2LOyxe37nGLL0iphGTMdTmK4QY4IAechA+ExprHYMZmQx
	 VnmPCPkUlLaCK5x+/yNaqt4dqlNyXchhLT052shkar9RzG1hA+qbCOiiAXK3oorG9+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.194
Received: from out28-194.mail.aliyun.com (out28-194.mail.aliyun.com [115.124.28.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28808606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28808606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436383|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0811587-0.0130548-0.905787;FP=13458286862952661050|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045166233;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.k5jA7.z_1795076969;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.k5jA7.z_1795076969 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 19 Nov 2026 16:29:31 +0800
Subject: Re: [PATCH v2 1/3] sched: Tell rq_online() and rq_offline() whether
 the CPU changes state
To: Qiliang Yuan <qiliang.yuan@linux.dev>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org
References: <20261118-bug-sched-fair-offline-active-v2-0-b6ede596c6a6@linux.dev>
 <20261118-bug-sched-fair-offline-active-v2-1-b6ede596c6a6@linux.dev>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <6fd92ba8-2249-b5e1-772d-cc598c91bad5@open-hieco.net>
Date: Thu, 19 Nov 2026 16:29:27 +0800
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
In-Reply-To: <20261118-bug-sched-fair-offline-active-v2-1-b6ede596c6a6@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

On 2026/11/19 8:57, Qiliang Yuan wrote:
> -void set_rq_online(struct rq *rq)
> +void set_rq_online(struct rq *rq, bool hotplug)
>  {
>  	if (!rq->online) {
>  		const struct sched_class *class;
> @@ -8554,12 +8554,12 @@ void set_rq_online(struct rq *rq)
>  
>  		for_each_class(class) {
>  			if (class->rq_online)
> -				class->rq_online(rq);
> +				class->rq_online(rq, hotplug);
>  		}
>  	}
>  }
>  
> -void set_rq_offline(struct rq *rq)
> +void set_rq_offline(struct rq *rq, bool hotplug)
>  {
>  	if (rq->online) {
>  		struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
> @@ -8568,7 +8568,7 @@ void set_rq_offline(struct rq *rq)
>  		update_rq_clock(rq);
>  		for_each_class(class) {
>  			if (class->rq_offline)
> -				class->rq_offline(rq);
> +				class->rq_offline(rq, hotplug);
>  		}
>  
>  		cpumask_clear_cpu(rq->cpu, rd->online);
> @@ -8585,7 +8585,7 @@ static inline void sched_set_rq_online(struct rq *rq, int cpu)
>  	rd = rcu_dereference_root_domain(rq->rd);
>  	if (rd) {
>  		BUG_ON(!cpumask_test_cpu(cpu, rd->span));
> -		set_rq_online(rq);
> +		set_rq_online(rq, true);
>  	}
>  	rq_unlock_irqrestore(rq, &rf);
>  }
> @@ -8599,7 +8599,7 @@ static inline void sched_set_rq_offline(struct rq *rq, int cpu)
>  	rd = rcu_dereference_root_domain(rq->rd);
>  	if (rd) {
>  		BUG_ON(!cpumask_test_cpu(cpu, rd->span));
> -		set_rq_offline(rq);
> +		set_rq_offline(rq, true);
>  	}
>  	rq_unlock_irqrestore(rq, &rf);
>  }
> 
> +static void rq_online_dl(struct rq *rq, bool hotplug)
>  {
>  	if (rq->dl.overloaded)
>  		dl_set_overload(rq);
> @@ -3379,7 +3379,7 @@ static void rq_online_dl(struct rq *rq)
>  }
>  
>  /* Assumes rq->lock is held */
> -static void rq_offline_dl(struct rq *rq)
> +static void rq_offline_dl(struct rq *rq, bool hotplug)
>  {
>  	if (rq->dl.overloaded)
>  		dl_clear_overload(rq);
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 731d78155e654..db9ab8ce36500 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -15082,14 +15082,14 @@ void sched_balance_trigger(struct rq *rq)
>  	nohz_balancer_kick(rq);
>  }
>  
> 
> -static void rq_online_fair(struct rq *rq)
> +static void rq_online_fair(struct rq *rq, bool hotplug)
>  {
>  	update_sysctl();
>  
>  	update_runtime_enabled(rq);
>  }
>  
> -static void rq_offline_fair(struct rq *rq)
> +static void rq_offline_fair(struct rq *rq, bool hotplug)
>  {
>  	update_sysctl();
>  
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index 81a71aa5f094a..fc6224a343552 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -2398,7 +2398,7 @@ static void task_woken_rt(struct rq *rq, struct task_struct *p)
>  }
>  
>  /* Assumes rq->lock is held */
> -static void rq_online_rt(struct rq *rq)
> +static void rq_online_rt(struct rq *rq, bool hotplug)
>  {
> 
>  	if (rq->rt.overloaded)
>  		rt_set_overload(rq);
> @@ -2409,7 +2409,7 @@ static void rq_online_rt(struct rq *rq)
>  }
>  
>  /* Assumes rq->lock is held */
> -static void rq_offline_rt(struct rq *rq)
> +static void rq_offline_rt(struct rq *rq, bool hotplug)
>  {
>  	if (rq->rt.overloaded)
>  		rt_clear_overload(rq);
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index e957524c3ee52..5f7b6ab4dde6d 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -2796,8 +2796,8 @@ struct sched_class {
>  	/*
>  	 * sched_set_rq_{on,off}line: rq->lock
>  	 */
> -	void (*rq_online)(struct rq *rq);
> -	void (*rq_offline)(struct rq *rq);
> +	void (*rq_online)(struct rq *rq, bool hotplug);
> +	void (*rq_offline)(struct rq *rq, bool hotplug);

I noticed that the functions set_rq_online and set_rq_offline have added a new
bool hotplug parameter, and the corresponding scheduler class callback
declarations have also been updated accordingly. However, in the actual
implementations - such as rq_online_fair(struct rq *rq, bool hotplug) - this
parameter does not appear to be used.
Is this parameter currently unused, or is it being introduced at the callback
layer in advance for future use cases?

-- 
thanks,
kunyu
