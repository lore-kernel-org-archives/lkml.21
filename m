Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425598;
	b=mYFpS/YfxhjkWBFmlV4MaihMjgqENhoAAoD5MDHhwabyA4rXgYcNZFggW+miRO1W1WMH
	 mbs3WH1c1q6y3AdomVeNENz6Jd8fBIQBTOxfh9HzptHmiOVU4Fz8E8AXGrpCnv+9e9dZH
	 uKduv8V3wQrQ3NRstg0j95bsoEdaWZHlqvCnYWtqm8sKYP1D1A9QgLEhoODa6xF+DJ9Yi
	 jlWQk5AXBylusFjw7Mz7X4ZKub7MZ0lUVs7TDNxbDlQsz2+ByeJapLSD4ePsZUHziSqrH
	 vUzIdPu+hSpFw9u0g69RGh97N6HbPdJmMJbiEftyugGzoJGpcGyC1nHQFz7W3PS6c1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425598;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WpbP0z8E0eAQAw0sg1Hz5GB+D2x+8Crurg7SyzQBMqI=;
	b=Kzb7tdnEnnoQ94cfIeJNDqhDgTgPHvPJjmm7wxP5DVz5110KyAoXA0zzmeGWfzILSWYd
	 DeDOPG435huRylbnovF7BMiyAlhAOpmf+1BaSSgq4ZFsmSWrMt4XsRKqigOAJtgM8NAGG
	 ggi41mM84BYGhoYPHYDL5RndiY4qeqMCxv4hSw8LPNB6YoAUzwt1bvXYgRREokZYr2GA5
	 Ao62D1HzEe2c1+G9/ZrjJGoXMe3jaGEqVGf8RgLcibBkY+Op4DDyr8ehleNZGDxY8IDmG
	 hSs6tdeBlHsuO8gxT1nmdXWSr3S8VNN+Re9MgrKn+BIF235RL/ZFRjvo3QrRcQXBDSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JHeynlCD;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC0E606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FC0E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JHeynlCD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA8ED1476;
	Mon, 23 Nov 2026 01:19:53 -0800 (PST)
Received: from [10.57.71.117] (unknown [10.57.71.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE0F13F632;
	Mon, 23 Nov 2026 01:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795425596; bh=qgCszqfW1h1o1Fs6nNg9Q1hwuFmazFQq76X2baxn9jY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JHeynlCD5Lnw7oedumy+2kJ7/5A1b7/ryFWUJvjyecf4wcbhvNCvWsygJ1gM2RLSU
	 XydDS/cEs30+QKwtYI2psnZskvq6pUZcK/ulEpLSewvT++/1nruJjqLw57UDPrSQOC
	 aKtCj5MZ1Hqu9ZBXwcqZLT5VIRV5C4inu3Wh6O2I=
Message-ID: <070726aa-0e91-4d65-b3c5-00df3a180732@arm.com>
Date: Mon, 23 Nov 2026 09:19:52 +0000
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
Subject: Re: [PATCH v6 0/3] Fix uclamp race against non atomic static key
 enable
To: Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org, Kayra Cizmeci <kayracizmeci@gmail.com>
References: <20261121041507.39582-1-qyousef@layalina.io>
From: Christian Loehle <christian.loehle@arm.com>
Content-Language: en-US
In-Reply-To: <20261121041507.39582-1-qyousef@layalina.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/26 04:15, Qais Yousef wrote:
> Latest version drops the partial revert (patch 3 in v5) as RT group
> throttling is going to be marked as broken and anyway a proper fix will
> require non trivial rewrite how dequeue happens for throttled tasks or
> full revert of subtracting nr_running added 10 years ago. Both of which
> is not appealing and with the proposal to mark this feature as broken,
> better leave it and hopefully just delete the problem area.
> 
> So in summary RT throttling is not fixed and being ignored. Fair
> throttling is fixed by pairing uclamp_rq_inc/dec with
> add/sub_nr_running. For RT, we do that in inc/dec_tasks() which are
> called when tasks are actually enqueued/dequeued - as stated will fail
> in RT throttling case. Given the minor severity of the problem and
> effort required to restructure part of RT group throttling that is being
> marked broken as we speak, I think this should do.
> 
> Changes since v5:
> 	- Drop patch 3 to partial revert subtracting rq->nr_running for
> 	  RT throttling.
> 	- Drop fixes tag from patch 1 as the series now is partially
> 	  fixed and not suitable for LTS.

Is this how this is done? I guess we could also NAK the backports?
Also presumably this was observed in live systems, so is not-backporting
an option?

> 
> Changes since v4:
> 	- Fix problems in fair/RT throttling logic that were exposed by
> 	  the original fix.
> 
> Changes since v3:
> 	- Fix Sashiko report about force_idle paths where
> 	  rq->nr_running is not 0 highlighted by Christian
> 	- Update patch 1 commit message to reflect jump_label call
> 	  sites on the same CPU might not be updated atomically too
> 
> Changes since v2:
> 	- Use uclamp_rq_is_idle() instead of scanning buckets to detect
> 	  imbalance
> 	- Do some cleanup on accessing the flag as an additional patch
> 
> Changes since v1:
> 	- Fix kernel test robot report due to missing static inline in dummy
> 	  definition of init_uclamp_rq()
> 
> Tested with the patch below to force imbalance via sched_feat. I could see the
> warning appearing and frequencies spiking during imbalance. Correct behavior is
> restored when sched_feat is disabled where the idle entry reset fixes things
> up.
> 
> I had a mix of uclamp_max mainly used in the system via schedqosd.
> 
> 	diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> 	index a2035d66270b9..14f9f1e419e02 100644
> 	--- a/kernel/sched/core.c
> 	+++ b/kernel/sched/core.c
> 	@@ -1889,6 +1889,11 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
> 		for_each_clamp_id(clamp_id)
> 			uclamp_rq_inc_id(rq, p, clamp_id);
> 
> 	+       if (sched_feat(UCLAMP_IMBALANCED)) {
> 	+               for_each_clamp_id(clamp_id)
> 	+                       uclamp_rq_inc_id(rq, p, clamp_id);
> 	+       }
> 	+
> 		/* Reset clamp idle holding when there is one RUNNABLE task */
> 		if (uclamp_rq_is_idle(rq))
> 			uclamp_rq_clear_idle(rq);
> 	diff --git a/kernel/sched/features.h b/kernel/sched/features.h
> 	index 8f0dee8fc4755..b59e532500fd9 100644
> 	--- a/kernel/sched/features.h
> 	+++ b/kernel/sched/features.h
> 	@@ -142,3 +142,5 @@ SCHED_FEAT(LATENCY_WARN, false)
> 	  */
> 	 SCHED_FEAT(NI_RANDOM, true)
> 	 SCHED_FEAT(NI_RATE, true)
> 	+
> 	+SCHED_FEAT(UCLAMP_IMBALANCED, false)
> 	diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> 	index 84301fc49e699..dbc3f5e1a7e01 100644
> 	--- a/kernel/sched/idle.c
> 	+++ b/kernel/sched/idle.c
> 	@@ -519,7 +519,7 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
> 		 * are still queued.
> 		 */
> 		if (uclamp_is_used() &&
> 	-           !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))
> 	+           !rq->nr_running && unlikely(WARN_ON(!uclamp_rq_is_idle(rq))))
> 			init_uclamp_rq(rq);
> 	 }
> 
> Qais Yousef (3):
>   sched/uclamp: Fix race condition leading to imbalanced uclamp_rq
>   sched/uclamp: Use wrappers instead of open coding UCLAMP_FLAG_IDLE
>   sched/uclamp: Move uclamp_rq_{inc, dec}() from core.c
> 
>  kernel/sched/core.c    | 49 +++++++++++++++---------------------------
>  kernel/sched/ext/ext.c |  6 ++----
>  kernel/sched/fair.c    |  6 ++----
>  kernel/sched/idle.c    | 19 ++++++++++++++++
>  kernel/sched/rt.c      | 10 +++++----
>  kernel/sched/sched.h   | 21 ++++++++++++++----
>  6 files changed, 63 insertions(+), 48 deletions(-)
> 

FWIW I could apply this series on base b99b7f60c5b4 ("sched: Replace nr_iowait_cpu() with a bool accessor")
but it would be nice to have this series rebased or base-commit specified,
even for sashiko reviews.
I'd be lying if I claimed all the interactions with idle/enqueue/dequeue
transitions and the edge-cases fit in my head...
