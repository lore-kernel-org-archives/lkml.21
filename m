Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695263;
	b=ypA1CDG9UvFQsLFNC0q5MoQ3558N8G1YRqgCFOsOS68MVUNN52ussnW+7c9ANK/L17Q0
	 TjhBIFvj2FfVMLnjl2Jd98DJXYf3bTtPglqhTDAZbJpWF/uFwUldo9oGz09VD2vj7HG9w
	 bcafsF5N5H5DEceJMzVvejYSLchUccyiXh/jZI4PuRsH93pD1tEnddOcmnBRxHF9eCEtx
	 NcmqZT9E3qIzEsJ+Gpzqd2AH3Q1DN/0B7hJsm/HI1RIMJn9dDPVH5eoUqg4pp2JhCn8Vv
	 oJ2NDTVTodYk3AhOL2wco678Ais9LRWTqWoz/HDkUFIOHkw6nGOuuV/WzpPetBJNKhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695263;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=546S0vvCdApwscsNAZ8CZi4emsV4mPDm/U+dt6ePpK8=;
	b=pKKA6/dDqU/QMaNTWEJv2wKhjnEibDn7kl+UtA1rPJa29Km6Z2Y6eyUl835yoOjiQh3o
	 gG10VanPJ9Z1BewQ7140yzvr8T8z2lOwhrPcxMtjg5y/w/GYTkKy+1YRZMdmmFGxpKKHx
	 hAXYTcJYV9swvwgVxIjiVmVXFGAQ3TG5Zqhxes0F58IbtiaXcOadc+nQLoRFAYVuyRvMf
	 OUdAD/ZT1UW7v3k++N/8OHNoIsUgdAv5AaGl2NJ0Ei0XIMQD83sXkgArN2lNXJ00cmCQ6
	 uBeXgRPr7LpzQoEUpF32djUgQ3+lz38N6/4qRysZpys7EOyhLWEVyugT1c2ZxiWBLoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=D8ZEtQOF;
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F44E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F44E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=D8ZEtQOF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=546S0vvCdApwscsNAZ8CZi4emsV4mPDm/U+dt6ePpK8=;
  b=D8ZEtQOFgEu7xBEzSaT/h3eUQQTwgoebpvNJpXsuBSV5UePoyvzcgPCG
   Wm0gwR1X65o7jWVUbV+ChGG7e6ZyQQTYgwVNatiqeA+5xJiU2IJCH1ZsV
   vKBWkWL2yuZ1bsI7AeEhD+wMk59Lb9lMIBxTxDa3lRumDibbSV667mqHo
   E=;
X-CSE-ConnectionGUID: feh5mozUQwWGM+Qdn6kukg==
X-CSE-MsgGUID: nPMBlAtvTMW8rpoD0riTdg==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=keisuke.nishimura@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,234,1787004000"; 
   d="scan'208";a="307507729"
Received: from dt-aponte.paris.inria.fr (HELO [128.93.67.66]) ([128.93.67.66])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 13:14:12 +0100
Message-ID: <8e3f3ce6-2194-489a-9f30-91eb71f5e33f@inria.fr>
Date: Thu, 26 Nov 2026 13:14:12 +0100
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
Subject: Re: [PATCH v2] sched/fair: Don't pick recent_used_cpu if target has
 no sched domain
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org,
 julia.lawall@inria.fr, jean-pierre.lozi@inria.fr
References: <20261125003653.1264087-1-keisuke.nishimura@inria.fr>
 <CAKfTPtBY=U5voby+_6=JErmsHoaXFqxYLFib6ESKFmO_pmGZyg@mail.gmail.com>
 <CAKfTPtCaWVApT+6WAreKapk2wRCrXCngZPLt8oayuZT9cB1k+Q@mail.gmail.com>
Content-Language: en-US
From: Keisuke Nishimura <keisuke.nishimura@inria.fr>
In-Reply-To: <CAKfTPtCaWVApT+6WAreKapk2wRCrXCngZPLt8oayuZT9cB1k+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/26/26 12:26, Vincent Guittot wrote:
> On Thu, 26 Nov 2026 at 12:21, Vincent Guittot
> <vincent.guittot@linaro.org> wrote:
>>
>> On Wed, 25 Nov 2026 at 01:54, Keisuke Nishimura
>> <keisuke.nishimura@inria.fr> wrote:
>>>
>>> select_idle_sibling() can return recent_used_cpu if it is idle and
>>> shares the LLC with target. However, it does not check if target is an
>>> isolated CPU where the scheduler should not move tasks.
>>>
>>> Consider the following situation:
>>> * isolcpus=1,2
>>> * recent_used_cpu=1
>>> * target=prev=2
>>> * affinity=1,2
>>>
>>> When CPU 1 is idle but CPU 2 is busy, select_idle_sibling() returns
>>> recent_used_cpu (CPU 1).
>>>
>>> To prevent the scheduler from moving the task among isolated CPUs, check
>>> whether target has a sched domain before searching for an idle CPU.
>>>
>>> This bug was found with the help of verification using Frama-C.
>>>
>>> Fixes: 32e839dda3ba ("sched/fair: Use a recently used CPU as an idle candidate and the basis for SIS")
>>> Signed-off-by: Keisuke Nishimura <keisuke.nishimura@inria.fr>
>>> ---
>>> Changes in v2:
>>> - Return early at the beginning of select_idle_sibling() if target has
>>>    no sched domain.
>>> - Instead of `per_cpu(sd_llc, target)`, use `cpu_rq(target)->sd` to
>>>    check if target is isolated or not. A CPU might be in an asymmetric
>>>    capacity domain, but not in an LLC domain. In this case, returning
>>>    early based only on the LLC domain would miss the chance to run
>>>    select_idle_capacity().
>>> - Rewrite the explanation, because sd_llc is not the main issue anymore.
>>> ---
>>>   kernel/sched/fair.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>>> index da0d9e19c457..9746fc55241b 100644
>>> --- a/kernel/sched/fair.c
>>> +++ b/kernel/sched/fair.c
>>> @@ -9155,6 +9155,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>>>          unsigned long task_util, util_min, util_max;
>>>          int i, recent_used_cpu, prev_aff = -1;
>>>
>>> +       /* Do not search for idle CPUs if target has no sched domain. */
>>> +       if (!rcu_dereference_all(cpu_rq(target)->sd))
>>> +               return target;
>>
>> After more thought,  You have to move this check one level up at the
>> beg of select_task_rq_fair().
>> Something like:
>>
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -9979,6 +9979,11 @@ select_task_rq_fair(struct task_struct *p, int
>> prev_cpu, int wake_flags)
>>           * required for stable ->cpus_allowed
>>           */
>>          lockdep_assert_held(&p->pi_lock);
>> +
>> +       /* Do not search for a CPU if prev has no sched domain. */
>> +       if (!rcu_dereference_sched_domain(cpu_rq(target)->sd))
>> +               return;
>> +
>>          if (wake_flags & WF_TTWU) {
>>                  record_wakee(p);
>>
> 
> And this still doesn't fix the case when cpus are isolated at runtime

Thanks. Moving the check to select_task_rq_fair() makes sense.

Could you elaborate on the case where CPUs are isolated at runtime? I would 
expect rq->sd to be NULL in that case as well?

Best,
Keisuke

> 
>>
>>> +
>>>          /*
>>>           * On asymmetric system, update task utilization because we will check
>>>           * that the task fits with CPU's capacity.
>>> --
>>> 2.34.1
>>>

