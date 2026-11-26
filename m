Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687550;
	b=aseaxcIiChGjX412a+Vm3zWDLf5kn6BAhT2SITWkbUVmg1+FNtchtCzlr2COAOrwRqUS
	 /RMjSkZ9cLtq7A55bHUpECPY9aSChVDYOp7f3gZlWxtSHwpO0zA/HlmKA5szEAMIX2w7X
	 waOWV+v6AZfp28ZYz+AfqpJpqISBHujT3YtU1jW7V7avSPeXWnsRS9WORyEjgSdVZLxyE
	 41XEPsYsIYWN7mFVG6oEDz2MBM5pM/4aBUMtCpifa3zwkQkWNWb/iF+IU8itvMPZ2NpR2
	 WzDmWs9m39CcU/uvy9yMWoAChYv4kr5fS18JuCzb++w7sBeOg6gDI52b0DAoxgeQRXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687550;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Ty6+GSusQzvZvW6i1/PsIEFNbWepeM6vNHIXJKskBFw=;
	b=qk97nEyVcVk5xQKGnE08Lb/kDhrjTBnvJ5nzj8+bzvVDl7/fvKQoWlzNVlqXtPqqq9aK
	 a2TUMuscocGmDCL3t2sQ0/a6AF/amiEO/Cs4EAQ7f6vxYJWHThfXV8z/v4IqwoDGBukbK
	 DY0nMXpregRTtqKNUDjpjHIUWxiVEf8I1ehkfRRkxKKGuD/JN9XCNNjb8g1IcYkm/mQkD
	 be9687Oo5RVDfCT/RgvFZN3TrnZDZNTnPAUJc7VUn0pTq8mrt69xOr89XwZ0AV4qi69qA
	 74VTqTU2PRGNXhGCM31SHmN6Dv4Jdv17Xyx+2dvhL3PcxY3TIO+bL+RtP6N9mE2NmEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SgYZqNib;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E76606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41E76606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SgYZqNib
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DDA71BA8;
	Thu, 26 Nov 2026 02:05:40 -0800 (PST)
Received: from [10.57.70.67] (unknown [10.57.70.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A0B23F86C;
	Thu, 26 Nov 2026 02:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795687543; bh=Czn0LXMeTfTW818AmgQT0BdZNE4RFyK4ZDz4s6IWYj0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SgYZqNibReZRnQLpGMkZv/BSiY+T9p40xLgiwvRmjsLy8U5BYxI+UKqlZQ1EQ7V7c
	 oBM1VINr6PcbJRZikXwTCDcXHjYV5MbbKH2uHEs1+y0Q1E5X6mdGsAN+h0diIWEjaH
	 Hk6X+NCrRQmTMx619rbiYLTyXiFjnzwVgKPkzUao=
Message-ID: <32f8da5e-adbe-4b91-8bd5-d446a59e0c3b@arm.com>
Date: Thu, 26 Nov 2026 10:05:39 +0000
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
Subject: Re: [PATCH v7 1/3] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
To: Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org, Kayra Cizmeci <kayracizmeci@gmail.com>,
 Wei Wang <wvw@google.com>
References: <20261126012836.15205-1-qyousef@layalina.io>
 <20261126012836.15205-2-qyousef@layalina.io>
From: Christian Loehle <christian.loehle@arm.com>
Content-Language: en-US
In-Reply-To: <20261126012836.15205-2-qyousef@layalina.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/26/26 01:28, Qais Yousef wrote:
> Static keys are not guaranteed to be enabled atomically across CPUs.  Or
> across callsites on the same CPUs. Which means when sched_uclamp_used is
> enabled, some CPUs/callsites will return true for uclamp_is_used() while
> others won't, leading to asymmetric uclamp_rq_{inc, dec}_id. If we
> decrement without increment this is safe as documented in the code. But
> an increment without a decrement is a problem and will leave the
> uclamp_rq in a corrupt state.
> 
> The reported case seems to happen due to callsites on the same CPU not
> seeing the flipped state.
> 
> Update init_uclamp_rq() so that we do uclamp_rq_set() to ensure
> WRITE_ONCE() is used to update the value field and keep KCSAN happy.
> 
> Plugging the race is hard as discussed in [1]. Take it for granted and
> do correction actions on going to idle to guarantee this state is
> transient for a short period after uclamp_sched_used is enabled.
> 
> [1] https://lore.kernel.org/lkml/CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com/
> 
> Reported-by: Wei Wang <wvw@google.com>
> Signed-off-by: Qais Yousef <qyousef@layalina.io>
> ---
>  kernel/sched/core.c  |  7 +++----
>  kernel/sched/idle.c  | 19 +++++++++++++++++++
>  kernel/sched/sched.h |  3 +++
>  3 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index ea89471d4743c..23009278cc9a4 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2139,15 +2139,14 @@ static void uclamp_post_fork(struct task_struct *p)
>  	uclamp_update_util_min_rt_default(p);
>  }
>  
> -static void __init init_uclamp_rq(struct rq *rq)
> +void init_uclamp_rq(struct rq *rq)
>  {
>  	enum uclamp_id clamp_id;
>  	struct uclamp_rq *uc_rq = rq->uclamp;
>  
>  	for_each_clamp_id(clamp_id) {
> -		uc_rq[clamp_id] = (struct uclamp_rq) {
> -			.value = uclamp_none(clamp_id)
> -		};
> +		 memset(uc_rq[clamp_id].bucket, 0, sizeof(uc_rq[clamp_id].bucket));

nit: indent

> +		uclamp_rq_set(rq, clamp_id, uclamp_none(clamp_id));

So I did reproduce WARN_ON_ONCE(!bucket->tasks) on CONFIG_UCLAMP_TASK_GROUP=y, which
relies on .active being in sync with bucket->active.

FWIW I don't see a good way of mitigating the missed decrement for .active,
but if somebody else sees it please shout.
I'll post my proposal in a minute

>  	}
>  
>  	rq->uclamp_flags = UCLAMP_FLAG_IDLE;
> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> index 451b4846219d5..c3882e3fbdf78 100644
> --- a/kernel/sched/idle.c
> +++ b/kernel/sched/idle.c
> @@ -506,6 +506,25 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
>  	 * lost_idle_time of clock_pelt
>  	 */
>  	update_idle_rq_clock_pelt(rq);
> +
> +	/*
> +	 * Due to a race condition when enabling sched_uclamp_used static key,
> +	 * we can end up with imbalance where uclamp_rq_inc_id() has happened
> +	 * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't seen
> +	 * the static key flipped. The race condition is unlikely, but ensure
> +	 * the uclamp_rq() state is set properly on each entry to idle.
> +	 *
> +	 * The reset will cause the uclamp_max from uclamp_idle_value() to be
> +	 * lost. Since we are imbalanced, hard to know what is right. So just
> +	 * cleanup. This should be a transient error state once we recover
> +	 * everything should work as expected.
> +	 *
> +	 * We need to be careful of some paths that can force idle with tasks
> +	 * are still queued.
> +	 */
> +	if (uclamp_is_used() &&
> +	    !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))
> +		init_uclamp_rq(rq);
>  }
>  
>  struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf)
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 32f76551a0c5e..3cbaea9e29406 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -3815,6 +3815,7 @@ static inline unsigned long cpu_util_rt(struct rq *rq)
>  #ifdef CONFIG_UCLAMP_TASK
>  
>  unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
> +void init_uclamp_rq(struct rq *rq);
>  
>  /*
>   * When uclamp is compiled in, the aggregation at rq level is 'turned off'
> @@ -3913,6 +3914,8 @@ uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
>  	return SCHED_CAPACITY_SCALE;
>  }
>  
> +static inline void init_uclamp_rq(struct rq *rq) {}
> +
>  static inline bool uclamp_rq_is_capped(struct rq *rq) { return false; }
>  
>  static inline bool uclamp_is_used(void)

