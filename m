Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772929;
	b=fPg66IRxisznxBWjahFyxDpY4JtN5SGR5T+IdOyz6lJrSUMl9xGb/VVP6xKXxtVNtFdx
	 t4AISnJeRA4FVBqNIlBkwPso2gRsllBsVmGVWGixaTrf5/yHjzPeePvyO41SCeDM8GQEW
	 W5Gq0+6KN3LPaKjbhx7Be4UVLP9/w3IkkD0W8qLUd5vIisNE3J/Et/FDoAwEXuCEQIg14
	 town0u5xySh6XtW7iOQa6+FTyEF7TrnKByaOrNEjVyON0BwdTJXpS/nN3a7xfO+hwFxXF
	 CkqYK0MsMHXlyUiZd57dLHMaIcp/EpUh6+dEh664mX14VlKyi452qPT8FCBx++ntsIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772929;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Xj0VllWwrFt9Q826dOs+EGn2otyNcwNsx3rBk8M9KIw=;
	b=GlnZ367b3oANvd0oMj8k5krlZA+kmJ2iBnRKgCjepj0xjFPKkxjXQ4t7foaI8xIHebbu
	 V+0zszef4TTVW0QNKbQk99Y+KeYjlQcUhSZKKmDkdfwtT5w+JIXSJ1lbvhrw9nTTRBBMC
	 5UsC/1SvatZMKVyzsJgZWG0XEDrenwmAMfsx2dsRXyz1I9uX0vicje0ORC+LoNpdE0so8
	 7fovEgYjE+u/EOCXcuVNO9p1IA0CepmoqgB6XQKw81rPaLpKixpWvVl4cNp9PC+GbNIEj
	 Eb3n3t8aUF3BWBHqbQ917v4dyNcU6nuGg2PiloNw4PS919wH3QvJ8deO/H5ZfDY7x1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=rJHWn+tP;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA46606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AA46606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=rJHWn+tP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Xj0VllWwrFt9Q826dOs+EGn2otyNcwNsx3rBk8M9KIw=; b=rJHWn+tPF3luhPVL1nWcI5yPtD
	jbwvmy5dZkW7qPpLb+d7IFM+yiY+O6Z1fTq+MmX4OwX6oWCdniaj1ZMNMPXyoNlwnX8ueFTZFQUVH
	h82mh73w3/GUqO2u2SAI0Co7ug2rM0Ldwd+qyIBN5bEZ2IZEvN81CVXWdGIr9Dl+HPs3fvVOzZDms
	gmljipwVLrtNhffl4VNSfFqS8fxvKP+VjHBzA5erOdUo9YBvTCBdTv7KnQZYggVnlh+Xws833nY6Q
	jFNRh7zxq7w+n3RTrDalrbLJWysigATNoLFKvNvMMZ5aQzVfbtrvfssACRqkJEcnZOixtEItXhsQR
	O9COmbzg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsZN-00000009Gkf-3tBJ;
	Fri, 27 Nov 2026 09:48:42 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B934330027B; Fri, 27 Nov 2026 10:48:40 +0100 (CET)
Date: Fri, 27 Nov 2026 10:48:40 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kuba Piecuch <jpiecuch@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/core: Skip empty source rqs in try_steal_cookie()
Message-ID: <20261127094840.GR49833@noisy.programming.kicks-ass.net>
References: <20261126182255.4146389-1-jpiecuch@google.com>
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
In-Reply-To: <20261126182255.4146389-1-jpiecuch@google.com>

On Thu, Nov 26, 2026 at 06:24:26PM +0000, Kuba Piecuch wrote:
> sched_core_balance() walks each CPU of each sched domain of a forced-idle
> CPU via steal_cookie_task() -> try_steal_cookie() until a matching-cookie
> task is stolen or need_resched() is set.
> 
> try_steal_cookie() disables IRQs and acquires double_rq_lock(dst, src)
> before inspecting @src, even when src->core_tree is empty and no task can
> be stolen from @src. On large machines, a forced-idle balance pass incurs
> many IRQ-off double_rq_lock() rounds and remote rq lock contention for
> nothing.
> 
> Return early if src->core_tree is empty via a lockless data_race() peek
> before disabling IRQs and locking both runqueues. Missing a task enqueued
> just after the peek is equivalent to missing one enqueued right after
> releasing the locks; all remaining checks stay under double_rq_lock().
> 
> Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
> ---
> This patch was written with the help of an AI coding assistant. I have
> reviewed the patch and verified the tests run by the tool.

*sigh*, so we need AI to write effectively single line patches these
days :-(

Anyway, the whole thing seems sane enough. Thanks!

> 
>  kernel/sched/core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index ea89471d4743..dfff7756465f 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6591,6 +6591,13 @@ static bool try_steal_cookie(int this, int that)
>  	unsigned long cookie;
>  	bool success = false;
>  
> +	/*
> +	 * Lockless hint: a missed concurrent enqueue is like arriving after
> +	 * unlock; a concurrent dequeue is caught under double_rq_lock().
> +	 */
> +	if (data_race(RB_EMPTY_ROOT(&src->core_tree)))
> +		return false;
> +
>  	guard(irq)();
>  	guard(double_rq_lock)(dst, src);
>  
> 
> base-commit: c47af85667065c6dd5b79564203c2d29948ef60e
> -- 
> 2.56.1.839.g22a8290db9-goog
> 
