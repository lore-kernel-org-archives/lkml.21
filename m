Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418731;
	b=flZx3X9RokqLnRtc034v3Gi4imJKQgYb+bJH2i2r1dUlNAHN752DTOquqL9PTe001R6y
	 DUXGCJ1FdDHOtSPm7KRdmIPEhPzkPUYaczvEmkK2fFRuB84F9kngSp0VsOp/WjteGWcnA
	 U+cjeRRndyfbe48nZHPfjuCYBjhvtZIgdjy2TNxbY0SJWFh8KRQZ+U2qj85p/BYNqSss1
	 3Xbnkszk8KKfBe0s8P1a33gd0uI1mcL3YBT02H+8htLeNcjUrA8eyGVQYN5vWfrfTcAfy
	 ncUyAX0drUUd8PSiY1LwLgkOaJEUvs/+8R5j1+efInkw5oS86MPXXzbyDUfTfoMgoaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418731;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=EMZuz1Kzpi8YnsNKCYHbI4Zr1dhvmEYlryo7hYA+IlM=;
	b=CRp20DDPwq8EYNkchuja6HikE/6stXNeKdECtabvEGB+uAovp5rzDgzttBLPsXwiU11A
	 yKtNB6vo3MpEO3iTIS2JL7Yn+B2p/nh1bKuzsxA2F0Ot7IDU6Y3YF0xhdvY9xxUiseXuj
	 2ZKC8Eh9EzZwly1z+mWRbOUWhsX1YfqpdsE/fS9p4dkKiXQAW62F3eM49xOpriDLIxBv8
	 AjUIVfq5O6dacl0zzCOCymD7Ex/0ccdkIhX2ZsaKcPu/v3nLtTtK4g6aqYuF8Hq3lugtZ
	 psIlB0RR9deJPe3+LEMFjJ32BtkcpSV3xI4f7yANON3dWBmc0Wp2ZYu1eb/aGx6ThaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.74
Received: from out28-74.mail.aliyun.com (out28-74.mail.aliyun.com [115.124.28.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10559606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10559606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07444257|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.180538-0.00332074-0.816141;FP=850186494572872926|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037071049;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.k881Slu_1795418711;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.k881Slu_1795418711 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 23 Nov 2026 15:25:15 +0800
Subject: Re: [PATCH v3 2/3] sched: Keep CPUs that stay active online across
 root domain moves
To: Qiliang Yuan <qiliang.yuan@linux.dev>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org
References: <20261120-bug-sched-fair-offline-active-v3-0-325e9eefa56d@linux.dev>
 <20261120-bug-sched-fair-offline-active-v3-2-325e9eefa56d@linux.dev>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <a0be247c-24be-5b13-ce39-48ed45d2eb64@open-hieco.net>
Date: Mon, 23 Nov 2026 15:25:14 +0800
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
In-Reply-To: <20261120-bug-sched-fair-offline-active-v3-2-325e9eefa56d@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 2026/11/21 10:57, Qiliang Yuan wrote:
> +void rq_attach_root_domain(struct rq *rq)
> +{
> +	struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
> +	const struct sched_class *class;
> +
> +	cpumask_set_cpu(rq->cpu, rd->online);
> +
> +	for_each_class(class) {
> +		if (class->rq_attach_root)
> +			class->rq_attach_root(rq);
> +	}
> +}
> +
> +void rq_detach_root_domain(struct rq *rq)
> +{
> +	struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
> +	const struct sched_class *class;
> +
> +	update_rq_clock(rq);
> +	for_each_class(class) {
> +		if (class->rq_detach_root)
> +			class->rq_detach_root(rq);
> +	}
> +
> +	cpumask_clear_cpu(rq->cpu, rd->online);
> +}
> +
> 
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 99878da03bce7..cc2bc832dad1a 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -488,14 +488,26 @@ static void free_rootdomain(struct rcu_head *rcu)
>  void rq_attach_root(struct rq *rq, struct root_domain *rd)
>  {
>  	struct root_domain *old_rd = NULL;
> +	bool active, move = false;
>  	struct rq_flags rf;
>  
>  	rq_lock_irqsave(rq, &rf);
>  
> +	active = cpumask_test_cpu(rq->cpu, cpu_active_mask);
> +
>  	old_rd = rcu_dereference_root_domain(rq->rd);
>  	if (old_rd) {
> -		if (cpumask_test_cpu(rq->cpu, old_rd->online))
> -			set_rq_offline(rq);
> +		if (cpumask_test_cpu(rq->cpu, old_rd->online)) {
> +			/*
> +			 * Keep an online CPU that stays active online and move
> +			 * only its root domain state.
> +			 */
> +			move = active;
> +			if (move)
> +				rq_detach_root_domain(rq);
> +			else
> +				set_rq_offline(rq);

Check whether rq->cpu is active. This approach effectively prevents a series of
issues such as the active CPU going offline and then back online (after the rd
root domain is updated). It also invokes the abstraction function for rd root
domain updates implemented for RT and DL, thereby ensuring the overall logic
remains correct.

> +		}
> 
> @@ -512,7 +524,9 @@ void rq_attach_root(struct rq *rq, struct root_domain *rd)
>  	rcu_assign_pointer(rq->rd, rd);
>  
>  	cpumask_set_cpu(rq->cpu, rd->span);
> -	if (cpumask_test_cpu(rq->cpu, cpu_active_mask))
> +	if (move)
> +		rq_attach_root_domain(rq);
> +	else if (active)
>  		set_rq_online(rq);
>  

By the way, does "base-commit: b251360cb2e6c7b74d962831f5797a4520511b36" point
to a specific development branch of the kernel (such as tip/sched/core)? The
code in the rq_attach_root function appears to differ slightly from what is
currently in mainline.

-- 
thanks,
kunyu
