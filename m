Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597988;
	b=QKLrPjsDm7EwYiRoDHnMxSJqWjZSXlI9WAZf3l6L6Im3cu7JrIxrBvsa/RgMPoXg76w4
	 hEVR+h5UmHup3r664DribALBSwk8L3yPKlcu08PdTRoFLdfhfRqgQDVUvwKjZrnNdvxuY
	 gL6PhpukBn5/qHGCLgsr+rqa9EW032Tpkb/PywA9yYYChvWeyzYvan5L61Xm0rD8lohCo
	 r7wNdXLgYaY1sTgvk3vl6/os+H6yL7AhsAlBWvQaUBDeR70p8wS08++FqDS1zaZIbljrt
	 opKZ9tKbg05puPtCFdTaVoMLvB7blcHVrVotOeeuA78mUyhbDSFPkVwqKE3Ni3Y86nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597988;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fBbA7f75JhN9HANNn3kC6lKd83tbxL8EiFgl4oSUhNg=;
	b=gi7zeCEgJOVMGERXnBvacPXPHsqkeG0NeN8W4V/QHm1vFwvslhzwHWxrCHH5WR94eSQi
	 A1enH2X9NoiYkluijyqSRCyW/nRX2SeTeOp7Gz/R10vBI8ZYBHit/zpGjNJ362+cWva3h
	 yS+KRnY2bCiDDJ3QEm/tUiECW2ibgpaKOSLMRnWn2YUO8ZFwoee3qVFQLUlPNH5vQjktc
	 vHzE0HKNpRII2fUafuM+wJjLJtL/Okue4rOYvBjTpAk4y8G59w9DmTctruh2DmIArC1gg
	 su5vNt/Dpsp5QXXseeLXib5con9YGpcMlAnNN6MoUffRDW8jqWRz4rXOeQC/pZMIZ7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="auec/fRe";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B681D606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B681D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=auec/fRe
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BC7C14BF;
	Wed, 25 Nov 2026 01:13:03 -0800 (PST)
Received: from [10.57.72.178] (unknown [10.57.72.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A90C73F86F;
	Wed, 25 Nov 2026 01:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795597986; bh=T2NC8T0jTyk4gZlxozZQrUOSqUiKlrLH08lB8MFbagE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=auec/fRe6J2rjAF1wox4mg80JWoQpWv+uP9vbt8kK69Rwnp+NFyQbiuwFFyfBgmK7
	 gpCDAg/zqw3Y6EmHYsuYIJP6dR8RKf0rkE/gXgsPQus49AEQSuYlbLb7wIJuRtipkO
	 Go8pyzm4jeR9XnO3E8dW1nyQ8/P+5+cfAAne4nZE=
Message-ID: <f607fd0e-64ff-4b1e-92b0-88cd04fd6ffb@arm.com>
Date: Wed, 25 Nov 2026 09:13:01 +0000
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
Subject: Re: [PATCH v6 1/3] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
From: Christian Loehle <christian.loehle@arm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org, Kayra Cizmeci <kayracizmeci@gmail.com>,
 Wei Wang <wvw@google.com>
References: <20261121041507.39582-1-qyousef@layalina.io>
 <20261121041507.39582-2-qyousef@layalina.io>
 <282a3922-91da-4145-94b6-d1a6459b6da6@arm.com>
 <CAKfTPtAT_gPBMaw_xyjkY4TTEA6+kuPBAAyNvMvT4Uq6T42xkA@mail.gmail.com>
 <8150e8ee-cd2c-41c0-8c5c-3f0c7a087ac2@arm.com>
Content-Language: en-US
In-Reply-To: <8150e8ee-cd2c-41c0-8c5c-3f0c7a087ac2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/23/26 18:15, Christian Loehle wrote:
> On 11/23/26 17:23, Vincent Guittot wrote:
>> On Mon, 23 Nov 2026 at 15:38, Christian Loehle <christian.loehle@arm.com> wrote:
>>>
>>> On 11/21/26 04:15, Qais Yousef wrote:
>>>> Static keys are not guaranteed to be enabled atomically across CPUs.  Or
>>>> across callsites on the same CPUs. Which means when sched_uclamp_used is
>>>> enabled, some CPUs/callsites will return true for uclamp_is_used() while
>>>> others won't, leading to asymmetric uclamp_rq_{inc, dec}_id. If we
>>>> decrement without increment this is safe as documented in the code. But
>>>> an increment without a decrement is a problem and will leave the
>>>> uclamp_rq in a corrupt state.
>>>
>>> So if we only need decrement to work then we can rely on
>>> p's uclamp_se.active and decrement regardless of uclamp_is_used() and call it
>>> a day?
>>
>> The static key prevents overhead for those who don't use uclamp. It's
>> a default rule for features like numa, cache aware, eas, uclamp etc to
>> not impact those who don't use it.
>> I'm afraid that the executing  uclamp_rq_dec up to
>> p->uclamp[clamp_id].active will not be free of overhead
> 
> I get why the static branch is there, but as long as p->uclamp[clamp_id].active
> never changes from 0, like when uclamp is never used, the check should be virtually
> free on any half-decent branch predictor.
> Also in any case the enqueue path ought to be the expensive part for uclamp.
> 
> I can come back with some numbers though, including the original netperf that
> introduced the static key.

So I compared mainline, my dequeue-only fix and a version where uclamp_is_used()
always returns true (i.e. no static branch optimisation at all).
A MeteorLake, Xeon and Orion, all compared to mainline as a base:

 Workload / metric              │  MeteorL: fix / always-on │    Xeon: fix / always-on │   Orion: fix / always-on 
────────────────────────────────┼───────────────────────────┼──────────────────────────┼──────────────────────────
 messaging-processes / seconds  │         -1.00% / (+0.02%) │        (-0.11%) / +0.67% │      (+0.02%) / (+0.34%) 
 messaging-threads / seconds    │       (+0.06%) / (+0.58%) │      (+0.04%) / (-1.04%) │      (-0.10%) / (-0.08%) 
 pipe-processes / usec_per_op   │         (-0.06%) / +1.42% │        (+0.33%) / +1.86% │          +1.29% / +1.68% 
 pipe-threads / usec_per_op     │         (+0.16%) / +1.18% │        (+0.22%) / +1.99% │          +3.46% / +2.42% 
 schbench-256k / rps            │         +0.05% / (-0.01%) │       (+0.003%) / -0.07% │        (+0.32%) / +0.38% 
 schbench-256k / wakeup_p99_us  │        -18.72% / (-1.45%) │     (+2.63%) / (+11.06%) │      (-3.65%) / (-2.36%) 
 schbench-4096k / rps           │       (+0.00%) / (+0.00%) │      (+0.00%) / (+0.00%) │      (+0.00%) / (+0.00%) 
 schbench-4096k / wakeup_p99_us │      (-19.12%) / (-7.35%) │     (-11.03%) / (-6.98%) │      (+0.14%) / (+9.45%) 
 tcp-stream-1024 / Mbps         │       (-0.02%) / (+0.04%) │        (-0.25%) / +1.46% │        +0.75% / (-0.30%) 
 tcp-stream-16384 / Mbps        │         -0.44% / (-0.16%) │          -0.22% / +0.33% │        +1.14% / (-0.12%) 
 tcp-stream-64 / Mbps           │        (+0.81%) / +10.86% │       (-0.67%) / +15.31% │          +3.98% / +2.96% 
 tcp_rr / transactions_per_sec  │       (+0.37%) / (-0.39%) │          -0.31% / -0.97% │          -2.40% / -2.13% 
 udp-stream-1024 / rx_Mbps      │       (+0.77%) / (+0.18%) │        (-0.20%) / +0.33% │      (+0.57%) / (-0.39%) 
 udp-stream-128 / rx_Mbps       │       (-0.04%) / (-0.13%) │        (-0.30%) / +1.56% │      (-0.02%) / (-0.68%) 
 udp-stream-16384 / rx_Mbps     │       (+0.17%) / (+0.04%) │        (-0.06%) / +0.19% │          +0.82% / +0.97% 
 udp-stream-2048 / rx_Mbps      │       (-0.36%) / (-0.85%) │          -0.31% / -0.54% │      (+0.85%) / (-0.22%) 
 udp-stream-256 / rx_Mbps       │         (-0.50%) / -0.72% │        (-0.29%) / +1.15% │      (+0.05%) / (-0.33%) 
 udp-stream-3312 / rx_Mbps      │       (-0.53%) / (-0.54%) │          -0.33% / -0.54% │        +0.91% / (+0.19%) 
 udp-stream-4096 / rx_Mbps      │       (-0.28%) / (+0.17%) │      (-0.18%) / (-0.04%) │      (+0.65%) / (-0.03%) 
 udp-stream-64 / rx_Mbps        │       (+0.23%) / (+0.31%) │          -0.48% / +1.30% │      (+0.72%) / (-0.44%) 
 udp-stream-64-pinned / rx_Mbps │       (-0.77%) / (-1.11%) │      (-0.33%) / (+0.72%) │        +1.29% / (+0.35%) 
 udp-stream-8192 / rx_Mbps      │       (-0.01%) / (-0.46%) │      (+0.14%) / (-0.36%) │        +1.24% / (+0.50%) 
 udp_rr / transactions_per_sec  │       (+0.31%) / (-0.75%) │        (+0.14%) / -1.07% │        (-0.28%) / -2.04% 

That being said moving the active check up in uclamp_rq_dec() gets rid of the
regression.
I'll post that version and numbers separately.

> 
>>
>>> See the attached patch.
>>>
>>>>
>>>> The reported case seems to happen due to callsites on the same CPU not
>>>> seeing the flipped state.
>>>>
>>>> Plugging the race is hard as discussed in [1]. Take it for granted and
>>>> do correction actions on going to idle to guarantee this state is
>>>> transient for a short period after uclamp_sched_used is enabled.
>>>>
>>>> [1] https://lore.kernel.org/lkml/CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com/
>>>>
>>>> Reported-by: Wei Wang <wvw@google.com>
>>>> Signed-off-by: Qais Yousef <qyousef@layalina.io>
>>>> ---
>>>>  kernel/sched/core.c  |  2 +-
>>>>  kernel/sched/idle.c  | 19 +++++++++++++++++++
>>>>  kernel/sched/sched.h |  3 +++
>>>>  3 files changed, 23 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>>>> index d7c3b43158dea..c6780358a7975 100644
>>>> --- a/kernel/sched/core.c
>>>> +++ b/kernel/sched/core.c
>>>> @@ -2111,7 +2111,7 @@ static void uclamp_post_fork(struct task_struct *p)
>>>>       uclamp_update_util_min_rt_default(p);
>>>>  }
>>>>
>>>> -static void __init init_uclamp_rq(struct rq *rq)
>>>> +void init_uclamp_rq(struct rq *rq)
>>>>  {
>>>>       enum uclamp_id clamp_id;
>>>>       struct uclamp_rq *uc_rq = rq->uclamp;
>>>> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
>>>> index 76f3c84ca6846..84301fc49e699 100644
>>>> --- a/kernel/sched/idle.c
>>>> +++ b/kernel/sched/idle.c
>>>> @@ -502,6 +502,25 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
>>>>        * lost_idle_time of clock_pelt
>>>>        */
>>>>       update_idle_rq_clock_pelt(rq);
>>>> +
>>>> +     /*
>>>> +      * Due to a race condition when enabling sched_uclamp_used static key,
>>>> +      * we can end up with imbalance where uclamp_rq_inc_id() has happened
>>>> +      * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't seen
>>>> +      * the static key flipped. The race condition is unlikely, but ensure
>>>> +      * the uclamp_rq() state is set properly on each entry to idle.
>>>> +      *
>>>> +      * The reset will cause the uclamp_max from uclamp_idle_value() to be
>>>> +      * lost. Since we are imbalanced, hard to know what is right. So just
>>>> +      * cleanup. This should be a transient error state once we recover
>>>> +      * everything should work as expected.
>>>> +      *
>>>> +      * We need to be careful of some paths that can force idle with tasks
>>>> +      * are still queued.
>>>
>>> It wouldn't hurt spelling these paths out IMO.
>>>
>>>> +      */
>>>> +     if (uclamp_is_used() &&
>>>> +         !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))
>>>> +             init_uclamp_rq(rq);
>>>
>>> I guess this means init_uclamp_rq() will need to use WRITE_ONCE() for .value at least?
>>>
>>>>  }
>>>>
>>>>  struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf)
>>>> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
>>>> index 7d2ec527b8a25..d87bdbd2121df 100644
>>>> --- a/kernel/sched/sched.h
>>>> +++ b/kernel/sched/sched.h
>>>> @@ -3704,6 +3704,7 @@ static inline unsigned long cpu_util_rt(struct rq *rq)
>>>>  #ifdef CONFIG_UCLAMP_TASK
>>>>
>>>>  unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
>>>> +void init_uclamp_rq(struct rq *rq);
>>>>
>>>>  /*
>>>>   * When uclamp is compiled in, the aggregation at rq level is 'turned off'
>>>> @@ -3802,6 +3803,8 @@ uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
>>>>       return SCHED_CAPACITY_SCALE;
>>>>  }
>>>>
>>>> +static inline void init_uclamp_rq(struct rq *rq) {}
>>>> +
>>>>  static inline bool uclamp_rq_is_capped(struct rq *rq) { return false; }
>>>>
>>>>  static inline bool uclamp_is_used(void)
> 

