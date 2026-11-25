Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603496;
	b=uI/YoFPytSY0of8nejoH478mok78GVTOgRLs86oJZnET3Iaad3u4OCScJgjX24gUQmET
	 I5Tko9CfOh6Oomnq3xlPsSD0cLqnvTHsCW2MOXjVnIU0un0ZPoyF5+HUSQYMkRHLWxOjt
	 g1T3+cM03Zhae6So5rppfYQjHEMfumnQYk8uVCVVKcnKBeZayjt9WDPCYQX31HeH+VNtb
	 u8SHM52yx3M9KKzB9LchKt8UlT4qC2w/sPKc4AorYd8C7QHNboEUNM1FccDPnJ0GvUl+Q
	 clmZ3PN+ZzAMorQM/KOfnhhIiLcvDNHrwMoShWu353bzhija5G12Jdyq1Fv6l8zGaBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=LZQn5K0kVaOHj3bLT68475lBkImuvzvBnXxO5ke9QrQ=;
	b=4RK3BffMQnwmtzeVznOHnULFBMAlFlsA4R7DIEuQiEMpPbVEtKLMRfHezRifvup86Htt
	 jmSJwy+tDWBZYsS0TsB4hSC154nExGP2QPLs4rTPGWmA5DCR9oRCTKs3XEC7g04wQn7fw
	 9IHJcHbP+ip00K9i3KCTKSO2C7jaGwdPmBJouBZSdj0OB47N0//Vp73pRTdAs3F4Ak+0r
	 c/5YlKWfoDfvGwIPeJDR+teWmGRrojmScCHa1OmwrfGq6kY7fAkS4vUMHaqLkXhnZfT3N
	 z+y86WM7BISDyobNgq60RqGfC3Gx8ubcaEfX3FgBe9OSAJReG46My8THCFmqBIunU/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6LGV0+V;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32982606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32982606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6LGV0+V
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a3ac4ac65bso248452f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795603494; x=1796208294; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZQn5K0kVaOHj3bLT68475lBkImuvzvBnXxO5ke9QrQ=;
        b=e6LGV0+Vll4yoNrbMGFRJ8yT1WBF2ayv5UntepGDBMgATVTWrPDHdN50WwJ1vhdjaC
         UWqtcl6gEBse4bF0CfhG38m1a+LEhiJSIMpSW4u8zOuo9gBNsBfGkXmDENSGqH4M9zTj
         a1qkVDBqwZJYZ+VfZC8P5V7thEWD7AK227lsUrBWBM9XtznpiZ81Ii5YOPPnE5ZD07R8
         aPjtRZebZzPBUSPbmdd/Ac/b3coYzF4Y/xssOwURpwUAehZFiKdtsHw6rXWYG9Oi3H14
         vrvin9d9JXwODp8pcA6NVkiFVj7oZkEkK9lI50occYV8c4tGrzo4M044w9yHfx8Y1tj4
         2dIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603494; x=1796208294;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LZQn5K0kVaOHj3bLT68475lBkImuvzvBnXxO5ke9QrQ=;
        b=T3K96gYB+RPsQ8l6yli3iq9qW+eTdlicjOxBz4TNo0VTTaCIGVKc9gVqPFZuaEXox2
         zxQ1bpsUmnAp4sOHOgy94G9EUgrfmodv+IOnYIeZARmk0D89zmfAy9KUc4qvcVisIRPn
         bM330KctkZ5njcd0AbVLTsGIKEDSkmWK7OT8mUqYNVG8NKtPJ/gkgLe/qIJk71Vnwehb
         h4pht6cbhj7JaCwxClbFRseobkCWg0L2h4dGJdOB70XxGx5FSC/v4EZfCEcplMJ2OMIk
         HmMrKsXX1MJrJ+RnfkGrqwQUQ+FzVcP1yidHt42zDw4SZJH9A7ecZNhp8xa0GdJG29sb
         /1sw==
X-Forwarded-Encrypted: i=1; AL+hErGjuoSvveHwt523LSJ6kz+d9huqGMkPuK6ogwG+LrKbBSQTJfd3YR9M2wh3wMUvnrof6zeIoij310EzW4Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BGb+dF5oLA8Ca6z1broGdvA60OCEWOihHVzV8WtzVtfx9poj9
	gqiPEm5+2qaevfJB4BvlUV1IxRFSPfDA3/ec1aG3TPu8aZlr9G5EeO9k
X-Gm-Gg: AZFdTZeRnHjnQ4CYEvFvbhNcAEqgVyVhDTrDDCk9YXYI8RP1yAaV/i6bNlhPRDdT8QG
	mvUDdF0klYwtBw5di5neDwsYdRAIRFNFypM8nFb6mE/N5lVIzk9qq6l67Oj55jJ5a1CE3zq1NBm
	mvzMLSG3dHVxjZZi4DNZTokNzPG2CrlwPruOXxRb6wScpxmmxgbS+FgnkS7HAylt1/fih0efdod
	XbwFVbLQE1hI+4YZVjmAwBFh8tEQ5Yiivu7mANvxo7RMIxJblohLyUwXguMS6kPP+U+boPFVqAp
	/YFcrWohW3ovXjInx2ruZ0rn3vTmTb8FmDwKE1Y+Y5utHiLQ2A2YGtFt0r9K2zL/l6E0EGnRTxF
	Toub9Sq002Rlxt7NTDfoYXcvwLLlNn94cjkMqqwgGadRVZ9EF4jhkaG4GIKnfoC3S1WjGpRzMT5
	UXTfy4TJJGPoeQzrj71tCdScLNTQnq2RNq6i48yIBMY9SY9aIlvqp4Frd9L3rVbqDI3B3ioAIP1
	pxQ3N/f9/tXYKecGK/7sjqeYoe7RwxTMDsyp2HH+KFvKOBbGRZwgk/L40rikTzu2O7brz4wPY+W
	pfEq68oB7mtyYwgSoIR+z4GH4Xe0/oQnOV9AmC66Z0SvCjqsLWIB1vNk
X-Received: by 2002:a5d:5f88:0:b0:4a3:45b4:f0cc with SMTP id ffacd0b85a97d-4abb253e271mr31218734f8f.3.1795603494268;
        Wed, 25 Nov 2026 02:44:54 -0800 (PST)
Received: from scheduler.schedules ([85.100.65.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm17302614f8f.19.2026.11.25.02.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:44:53 -0800 (PST)
Date: Wed, 25 Nov 2026 13:44:51 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: albin_yang@163.com
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, albinwyang@tencent.com
Subject: Re: [PATCH v3] sched/stats: Fix run_delay over-count for tasks
 parked on the runqueue while blocked
Message-ID: <awa1x5cchk1kFUKE@scheduler.schedules>
References: <20261122121823.2572209-1-albin_yang@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261122121823.2572209-1-albin_yang@163.com>

Hi Wei,

On Sun, Nov 22, 2026 at 08:18:23PM +0800, albin_yang@163.com wrote:
> From: Wei Yang <albinwyang@tencent.com>
> 
> A task parked on the runqueue while blocked -- a proxy-exec donor
> migrated to its mutex owner's CPU, or a DELAY_DEQUEUE sleeper migrated
> across CPUs -- is re-attached via activate_task() without
> ENQUEUE_RESTORE. That arms sched_info.last_queued although the task is
> not waiting for a CPU, and the parked time is later charged as
> run-queue wait: by sched_info_dequeue() when proxy_needs_return()
> dequeues a donor on wakeup, or by sched_info_arrive() once the task
> runs.
> 
> Use p->is_blocked as the primary indicator: sched_info_dequeue() drops
> last_queued without charging while blocked; sched_info_enqueue() refreshes
> it on every enqueue while blocked, so the stamp ends up at the real wakeup;
> ttwu_runnable() adds an explicit sched_info_enqueue() call under the
> existing !task_on_cpu() guard, for wakeups that have no enqueue of their
> own. Delayed sleepers also have is_blocked set, so both cases are covered.
> 
> The p == current early return in try_to_wake_up() now documents why it
> needs no sched_info_enqueue() call.
> 
> Both over-counts disappear with this patch, and run_delay still grows
> normally for a runnable task contending for the CPU, so the counter is
> alive rather than switched off.
> 
> Fixes: b049b81bdff6 ("sched: Handle blocked-waiter migration (and return migration)")
> Suggested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Suggested-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> Signed-off-by: Wei Yang <albinwyang@tencent.com>
> ---
> 
> v3: restore Prateek's comments in sched_info_dequeue() and
> sched_info_enqueue(), dropped in v2 (Kayra). No code change.
> 
> v2: switch from the v1 !task_is_blocked() gate to the is_blocked based
> approach proposed by Prateek Nayak. Subject widened: v1 only mentioned
> proxy-migrated donors, while the same gating fixes both cases.
> 
> Measured with two CPUs used (CPU0/CPU1); run_delay is field 2 of
> /proc/<tid>/schedstat:
> 
>   proxy exec, donor migrated to the owner's CPU (~170 ms block)
>     unpatched       167.07 - 167.09 ms   5/5   migrated
>     patched           0.00 ms           20/20  migrated
>     same-cpu control  0.00 ms            0/5   not migrated
> 
>   DELAY_DEQUEUE, sleeper migrated across CPUs (~150 ms sleep)
>     unpatched       147.94 - 147.99 ms   5/20
>     patched           0.00 ms            0/100
> 
> The DELAY_DEQUEUE reproducer self-checks (must reproduce unpatched) and
> shows ~40 ms of run_delay growth per round throughout.
> 
> v2: https://lore.kernel.org/all/20261114092637.3206631-1-albin_yang@163.com/
> v1: https://lore.kernel.org/all/20261025130740.3324391-1-albin_yang@163.com/
> Full test results and the discussion of the split:
> https://lore.kernel.org/all/20261101143101.353033-1-albin_yang@163.com/
> 
> p->is_blocked was added by 4c2a20413d7f ("sched: Add is_blocked task flag")
> and is only available from v7.2-rc1. The DELAY_DEQUEUE over-count goes back
> to v6.12 (152e11f6df29) and still needs the sched_delayed based variant on
> older stable trees; that is a separate, independent fix. A second Fixes:
> tag would make the stable backport machinery try this on v6.12.y, where
> is_blocked does not exist. Hence only one Fixes: tag above.
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 5ed660f099a5..b3af72ba948f 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3962,6 +3962,8 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
>  		 * it should preempt the task that is current now.
>  		 */
>  		wakeup_preempt(rq, p, wake_flags | WF_TTWU_RQ);
> +		/* Start accounting wait time. */
> +		sched_info_enqueue(rq, p);
>  	}
>  	ttwu_do_wakeup(p);
>  	return 1;
> @@ -4357,6 +4359,11 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
>  		if (!ttwu_state_match(p, state, &success))
>  			goto out;
>  
> +		/*
> +		 * No sched_info_enqueue() here: current is running, not
> +		 * waiting for a CPU. If preempted, sched_info_switch() ->
> +		 * sched_info_depart() arms the wait clock instead.
> +		 */
>  		trace_sched_waking(p);
>  		ttwu_do_wakeup(p);
>  		goto out;
> diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
> index ebe0a7765f98..c4c624deb25b 100644
> --- a/kernel/sched/stats.h
> +++ b/kernel/sched/stats.h
> @@ -239,6 +239,15 @@ static inline void psi_account_irqtime(struct rq *rq, struct task_struct *curr,
>  static inline void sched_info_dequeue(struct rq *rq, struct task_struct *t)
>  {
>  	unsigned long long delta = 0;
> +	/*
> +	 * If a task is blocked (blocked donor, delayed dequeue task),
> +	 * do not account the queued time as runnable. A task that is
> +	 * blocking would have already cleared the "last_queued"
> +	 * indicator from sched_info_arrive() when it got a chance to
> +	 * run on the CPU.
> +	 */
> +	if (t->is_blocked)
> +		t->sched_info.last_queued = 0;
>  
>  	if (!t->sched_info.last_queued)
>  		return;
> @@ -290,7 +299,23 @@ static void sched_info_arrive(struct rq *rq, struct task_struct *t)
>   */
>  static inline void sched_info_enqueue(struct rq *rq, struct task_struct *t)
>  {
> -	if (!t->sched_info.last_queued)
> +	/*
> +	 * "t->is_blocked" is only cleared after the enqueue is done and
> +	 * the task is woken up. If the task is blocked, update the
> +	 * "last_queued" timestamp to that of last enqueue - if the task
> +	 * is still blocked while it leaves the runqueue, this timestamp
> +	 * is ignored and is cleared at sched_info_dequeue().
> +	 *
> +	 * To transition a task back to blocked after wakeup, it has to
> +	 * run on the CPU and naturally reach a safe preemption point.
> +	 * sched_info_arrive() will do the correct wait time accounting
> +	 * based on the last "last_queued".
> +	 *
> +	 * Any movement of task after being marked not blocked will be
> +	 * correctly captured as queued time at enqueue + dequeue
> +	 * boundaries when "t->is_blocked" cleared.
> +	 */
> +	if (!t->sched_info.last_queued || t->is_blocked)
>  		t->sched_info.last_queued = rq_clock(rq);
>  }
>  
> -- 
> 2.43.7
> 

Technical stuff looks correct to me. I already checked it 2–3 times.
Hope I'm not missing something.

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>

Cheers!

Kayra
