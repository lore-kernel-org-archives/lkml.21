Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457759;
	b=mYCJae0dZTFM/v63QKxjpwIUjMTx6HGI3KmRf3PMy4qiqjLSFTkYGv+tY7mOCz8zhYqP
	 UQtOn0pA8KbGFK8b5vtUgj5ls6LpzorLQWwRC1mIJwfDA7mQO7JBIhfEGwEUaGop3jHRo
	 GzwIRGM5WXzj/2GAw2wZp6pUv56x0v+ELJ9/9TniVnziQ8p6dfoTtzjy+oG+cYlfp34Et
	 zj5jYdvyyS3Nia82f5GBhM3Pt/Fx0aap4fO+qEINp2nI7RgExBo/WAy6nDvvrdaXj+DsT
	 X5HP4YHY/sPX0QKX0590jdqITVZAptiygBDPAulRtQhTKq45LOy1Yt6qSdlbMg8sH/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457759;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=D2qAmA528vK6K1GBYBMu/erklfls5RIaGcSEzCYHqdE=;
	b=NuCbg9HHkDrfDch9Yj4NdiBRPUET2KD5GP6TMQabV3FQRORJonJNlzYduE7Ik3eahEJy
	 PB+6Zl2YR96ILp//Qwkqa3n3QI3KewlkP73VYhanW1n/3WCkG/9Bgqnlz96Kt2cTMCIvT
	 IaTn8JcJ04538hbkKCIXuVPs11ehkQyE52TKHL0ORfALfU6P7M6B5UJiwLSieavDT33dW
	 IYo7OJIgCT2HSpjMzn0mvzDRrjThsD38F/jPkqItKXJ+lKegytkYdzr2UjBFwDWCYvx4I
	 zYI8sfFJ7PXcz1XVx2eucVWj8PALagW4WXnJlSM9B3dyEfNpeYcHmQVjqkNZWdAi11Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Czm1T7ve;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B277606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B277606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Czm1T7ve
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2BE2143D;
	Mon, 23 Nov 2026 10:15:53 -0800 (PST)
Received: from [10.57.71.117] (unknown [10.57.71.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4DEF3F763;
	Mon, 23 Nov 2026 10:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795457756; bh=nyF04ZUWuqnaVt2LZsIw4vE84TUwhq8y8DbC4Ndiq4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Czm1T7veFQiIrIRd7AebV+FS9k5GjNL4svKxp4YKVdFF+lT5oGfDi1zLFhVVRR0pv
	 XgOENK+qs+GPEPzIZ9Le7uoWBSOtGzU94fJRYqNGYCkKDjVq8RIGituz3GA2Rx5pPO
	 U6RZjfto0cMELkNPWpJ9lMm5bPg2Xfa9VQml3sts=
Message-ID: <8150e8ee-cd2c-41c0-8c5c-3f0c7a087ac2@arm.com>
Date: Mon, 23 Nov 2026 18:15:52 +0000
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
From: Christian Loehle <christian.loehle@arm.com>
Content-Language: en-US
In-Reply-To: <CAKfTPtAT_gPBMaw_xyjkY4TTEA6+kuPBAAyNvMvT4Uq6T42xkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/23/26 17:23, Vincent Guittot wrote:
> On Mon, 23 Nov 2026 at 15:38, Christian Loehle <christian.loehle@arm.com> wrote:
>>
>> On 11/21/26 04:15, Qais Yousef wrote:
>>> Static keys are not guaranteed to be enabled atomically across CPUs.  Or
>>> across callsites on the same CPUs. Which means when sched_uclamp_used is
>>> enabled, some CPUs/callsites will return true for uclamp_is_used() while
>>> others won't, leading to asymmetric uclamp_rq_{inc, dec}_id. If we
>>> decrement without increment this is safe as documented in the code. But
>>> an increment without a decrement is a problem and will leave the
>>> uclamp_rq in a corrupt state.
>>
>> So if we only need decrement to work then we can rely on
>> p's uclamp_se.active and decrement regardless of uclamp_is_used() and call it
>> a day?
> 
> The static key prevents overhead for those who don't use uclamp. It's
> a default rule for features like numa, cache aware, eas, uclamp etc to
> not impact those who don't use it.
> I'm afraid that the executing  uclamp_rq_dec up to
> p->uclamp[clamp_id].active will not be free of overhead

I get why the static branch is there, but as long as p->uclamp[clamp_id].active
never changes from 0, like when uclamp is never used, the check should be virtually
free on any half-decent branch predictor.
Also in any case the enqueue path ought to be the expensive part for uclamp.

I can come back with some numbers though, including the original netperf that
introduced the static key.

> 
>> See the attached patch.
>>
>>>
>>> The reported case seems to happen due to callsites on the same CPU not
>>> seeing the flipped state.
>>>
>>> Plugging the race is hard as discussed in [1]. Take it for granted and
>>> do correction actions on going to idle to guarantee this state is
>>> transient for a short period after uclamp_sched_used is enabled.
>>>
>>> [1] https://lore.kernel.org/lkml/CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com/
>>>
>>> Reported-by: Wei Wang <wvw@google.com>
>>> Signed-off-by: Qais Yousef <qyousef@layalina.io>
>>> ---
>>>  kernel/sched/core.c  |  2 +-
>>>  kernel/sched/idle.c  | 19 +++++++++++++++++++
>>>  kernel/sched/sched.h |  3 +++
>>>  3 files changed, 23 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>>> index d7c3b43158dea..c6780358a7975 100644
>>> --- a/kernel/sched/core.c
>>> +++ b/kernel/sched/core.c
>>> @@ -2111,7 +2111,7 @@ static void uclamp_post_fork(struct task_struct *p)
>>>       uclamp_update_util_min_rt_default(p);
>>>  }
>>>
>>> -static void __init init_uclamp_rq(struct rq *rq)
>>> +void init_uclamp_rq(struct rq *rq)
>>>  {
>>>       enum uclamp_id clamp_id;
>>>       struct uclamp_rq *uc_rq = rq->uclamp;
>>> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
>>> index 76f3c84ca6846..84301fc49e699 100644
>>> --- a/kernel/sched/idle.c
>>> +++ b/kernel/sched/idle.c
>>> @@ -502,6 +502,25 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
>>>        * lost_idle_time of clock_pelt
>>>        */
>>>       update_idle_rq_clock_pelt(rq);
>>> +
>>> +     /*
>>> +      * Due to a race condition when enabling sched_uclamp_used static key,
>>> +      * we can end up with imbalance where uclamp_rq_inc_id() has happened
>>> +      * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't seen
>>> +      * the static key flipped. The race condition is unlikely, but ensure
>>> +      * the uclamp_rq() state is set properly on each entry to idle.
>>> +      *
>>> +      * The reset will cause the uclamp_max from uclamp_idle_value() to be
>>> +      * lost. Since we are imbalanced, hard to know what is right. So just
>>> +      * cleanup. This should be a transient error state once we recover
>>> +      * everything should work as expected.
>>> +      *
>>> +      * We need to be careful of some paths that can force idle with tasks
>>> +      * are still queued.
>>
>> It wouldn't hurt spelling these paths out IMO.
>>
>>> +      */
>>> +     if (uclamp_is_used() &&
>>> +         !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))
>>> +             init_uclamp_rq(rq);
>>
>> I guess this means init_uclamp_rq() will need to use WRITE_ONCE() for .value at least?
>>
>>>  }
>>>
>>>  struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf)
>>> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
>>> index 7d2ec527b8a25..d87bdbd2121df 100644
>>> --- a/kernel/sched/sched.h
>>> +++ b/kernel/sched/sched.h
>>> @@ -3704,6 +3704,7 @@ static inline unsigned long cpu_util_rt(struct rq *rq)
>>>  #ifdef CONFIG_UCLAMP_TASK
>>>
>>>  unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
>>> +void init_uclamp_rq(struct rq *rq);
>>>
>>>  /*
>>>   * When uclamp is compiled in, the aggregation at rq level is 'turned off'
>>> @@ -3802,6 +3803,8 @@ uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
>>>       return SCHED_CAPACITY_SCALE;
>>>  }
>>>
>>> +static inline void init_uclamp_rq(struct rq *rq) {}
>>> +
>>>  static inline bool uclamp_rq_is_capped(struct rq *rq) { return false; }
>>>
>>>  static inline bool uclamp_is_used(void)

