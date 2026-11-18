Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012834;
	b=fKqRzml11B9YlqCYSnhe9S3ZT63RDaV8aU8WpDlCfuyjHvoXiy/tDyhE7Um7zahyrX+8
	 kVY6Ow8uHt2JCZcE7lU6nUqdg9f04Zk6hcu6p2iUuZ4LAfQC8wMQSG7/EbhF5pHsbxmnN
	 HIj31BohRyTOFGNEbOa3JqWKVuRXechE8UNhIHlqzqVLS8txlEO3fwV7uUyHcMiEwAUWd
	 6GBt0mwEh9D8XDxvxCUkxk0eEIwAvjeJL6PUCAebOGCkw0+G6mugyh8zfeY2YAcQ2L+dL
	 ExhoUuoob8qVKMUbvONMBU1cyZMbEoQ4qN/7Rs29KlON0EDMZnpwTql5frw4Sj2KRzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012834;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Nnwwna36IxDtc3v5QWc45ewBRZW7Zvy8JaVt7ACEVKc=;
	b=XBf9KbeyrXH/Jg/eREsfMUTvIHkeybZy29xZic717/4yqv3Yqtw/97D4Sc9zJz0v4bbG
	 dfBO7RYtAGTsAjJW3tEJ23v39T5kDP6nyIUHDXFuJOIpprWcM3EDdF1ue8WjI7mWv8KRs
	 TJh9Q3OYjiF2A+DCofWZDmVHzp4QtR/HOw2mKBFTlXn5maxkvUjsJF7MbS/0QGMH5yZZ6
	 Y/44LVIyJvp9zJF6a/PIJTCpuBqV58kxJUJddRT3UAobrNBE82sbX8nVAD3C0i1c9j+I5
	 0jTRRS1FiA+jnswhFE5DTFx/JoWDkogwCkjWeVOFf8AsvhKmci3MZ0BB/0LI3ikBpdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=O9QZg+UN;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1519606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1519606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=O9QZg+UN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Nnwwna36IxDtc3v5QWc45ewBRZW7Zvy8JaVt7ACEVKc=; b=O9QZg+UNo4GloWxBVmGLfVNssQ
	o/oLAIB0an83SptWasi/sYQs7Tj7flHYZlYAymPlWrG0ZNHLnx7jDgKjX6n90WFfNKIAnshf6ca4Q
	8aGrL8HdphvXXFHqO1Y4BWOY8pkTZSgMhI8J2WCt7JEZpKmQb2A7V3TUsJZLUjW9ClwMX2My0Smb1
	TbVHhaNKQrkTbaoCpRLUTuKtCs2EtGxvSRVfVUGk+mjHXaLf8YcS/kYPJPvkbJRs8glzEQHedMnNJ
	I/euJ4Q92DcZhOKsUTYTCydcAMcWSxuIYGv9PipzFulPtyBl8C6JYwOQOMuaAbE0HeQwyUzyIEQG0
	m0Yozqqg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgpp-0000000G9Lh-17Lb;
	Wed, 18 Nov 2026 14:40:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 08CC130057F; Wed, 18 Nov 2026 15:40:28 +0100 (CET)
Date: Wed, 18 Nov 2026 15:40:27 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ibrahim Elshahed <lshahed@amazon.de>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org,
	nh-open-source@amazon.com, Fernand Sieber <sieberf@amazon.com>,
	Roman Kagan <rkagan@amazon.de>
Subject: Re: [PATCH 2/2] sched/core: Don't skip a pending core-wide pick on
 idle re-entry
Message-ID: <20261118144027.GZ1779021@noisy.programming.kicks-ass.net>
References: <20261117142704.6878-1-lshahed@amazon.de>
 <20261117142704.6878-3-lshahed@amazon.de>
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
In-Reply-To: <20261117142704.6878-3-lshahed@amazon.de>

On Tue, Nov 17, 2026 at 02:27:03PM +0000, Ibrahim Elshahed wrote:

> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index b1718ba5a4..58b429bbe3 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -347,6 +347,17 @@ void sched_core_dequeue(struct rq *rq, struct task_struct *p, int flags)
>  		resched_curr(rq);
>  }
>  
> +/*
> + * An idle CPU with an empty runqueue must still call pick_next_task() while
> + * it has a pending core-wide pick or the core is forced idle. Only that pick
> + * consumes rq->core_pick and ends the forced idle.
> + */
> +static inline bool sched_core_idle_needs_pick(struct rq *rq)
> +{
> +	return sched_core_enabled(rq) &&
> +	       (rq->core_pick || rq->core->core_forceidle_count);
> +}

I'm not sure I understand the rq->core_pick condition here. We already
have !rq->nr_running, and if we have rq->core_pick, then nr_running must
be non-zero, right?

>  static int sched_task_is_throttled(struct task_struct *p, int cpu)
>  {
>  	if (p->sched_class->task_is_throttled)
> @@ -550,6 +561,7 @@ void sched_core_put(void)
>  static inline void sched_core_enqueue(struct rq *rq, struct task_struct *p) { }
>  static inline void
>  sched_core_dequeue(struct rq *rq, struct task_struct *p, int flags) { }
> +static inline bool sched_core_idle_needs_pick(struct rq *rq) { return false; }
>  
>  #endif /* !CONFIG_SCHED_CORE */
>  
> @@ -7285,8 +7297,13 @@ static void __sched notrace __schedule(int sched_mode)
>  	 */
>  	prev_state = READ_ONCE(prev->__state);
>  	if (sched_mode == SM_IDLE) {
> -		/* SCX must consult the BPF scheduler to tell if rq is empty */
> -		if (!rq->nr_running && !scx_enabled()) {
> +		/*
> +		 * SCX must consult the BPF scheduler to tell if rq is empty,
> +		 * and core scheduling may need pick_next_task() to consume
> +		 * rq->core_pick or to end forced idle.
> +		 */
> +		if (!rq->nr_running && !scx_enabled() &&
> +		    !sched_core_idle_needs_pick(rq)) {
>  			next = prev;
>  			rq->next_class = &idle_sched_class;
>  			goto picked;
> -- 
> 2.47.3
> 
