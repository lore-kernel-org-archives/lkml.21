Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453670;
	b=WnqV2l32x8xJeQhHjzS7AdJSDeStzRnfFtNnCqOndLcViolwnqW3S0/m7hoxeDTT0/c9
	 c6j6l5gPG++FA0ah/RqdoiyoF7e+jfePrzLRHxNTIfxX5gPDRf1C2u67c6H6cMnMkmgbj
	 4KhFYILI8OIU4vr71g/7LcP1Q3pmxA6hIqnARsoH241eZsb9W+fvcma14XBSgf3FTGlYf
	 0pvKH3l92Xgu68RKb6v5vhMTdjYjUaZwH9Lk4ifnnHjGjfrWjTE8QYiYlXJAzwRoPVVWx
	 SAAmFGIg+QVM/DIT0N/q9F7HdLDOBFUghKGKVpQVlVS0gZ6PEOUs78Y9gCN+WVS91ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+xaIvYw9qB8U9m5yBZTbNli0aV2ssc6MRhHdFn2AjAQ=;
	b=RlmHGnclJfpWyF2wsAtrpswHefcM1hROxC/O36ULpEk1KCgsYfbJHE397wd6FB9qUdM2
	 CCDNpGblEpo7aLtXTjBkRk+LuwwDosBhNfwZCZco4e0Xmf0+pMjb14xBhhCweH0YW8DLQ
	 CXbSxwWgvAYZWoG5fGDLqIViGqXdENb6K2arEt6/jkD4/t3oDV2nA76zdKwHFh0uMxGfK
	 eJrfjoatN90+vfOUv2T7ARKHnWxpk7FpfEvow7ZDrwo2bVzZM6h6y4KOmpqW2HTreHwFl
	 pOvkxvE5sw0c79wLy5ymbSNUttj79oD0p4IAeIX88+y0tnK7b0opI6Aj4INUGyprdYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bJJCiYt0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB06C606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB06C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bJJCiYt0
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so4690152a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:07:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795453668; cv=none;
        d=google.com; s=arc-20260327;
        b=DuouTwdz3oeFZsyF0Iz9UkcaHjAiAy+VsBrNQyp4seQvXeIEbr5mTsw5nrQDso9ZeQ
         dSZfO4lYjTuB59h3wTxf0RTx4Oae+RAJ3QW+T5IJPV9S/BaS/mIo4wjJgG4Z/XUMY+me
         4fkN38RK6a0ePay74EvdfeznH+SIt37wERkjp9FTESwK3W13rwtbbDK2VhODzXizl7Xl
         D9HQflzJ76kr7/xE9EuXcRCx3A072ALG19zXyODTnypbqAcQwHzjkfLjPisWs/eXNAs8
         HL+O0Y016934/NFkZ3bqTaVUz5CCqFFVgkb/uWGIRWGqXw6smgBApMXX2UhIEwouHctD
         W2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+xaIvYw9qB8U9m5yBZTbNli0aV2ssc6MRhHdFn2AjAQ=;
        fh=9oimeqPVMGbCl4EX2Ezy+oXREoFDrWmlqFJrSGpAks8=;
        b=Ju5x0uQQvO7b0U2c8DAmyiRdWCqNpHrZqzj+Il99PQpjEDeBsLdH51xzIP/BVN0eCo
         8y1VaiygaN5/yuQVJ9EdesOp8aFbcDol40DxBj/ABx9uZpRS43ayqNFPXnBnSSgVRpkX
         rT4VS6WYvbBv/s6lXKfYqHTFaqnqibg7PyVri62l1uGdMcl3+D1vS5WQu+MvWgHoWtzL
         HgownS3UnrnBtQDoIJ8QSpcDBOorExSAf4yu3GlwudPUVkf1G1PelmPhACS1jvyFcUvG
         7OCzh7m/nLBwvuVeNcfey1vnXR6oOELSZz3zWS/fOuRXN3tO0WRYiCz6ZGwja5yrRSbK
         k93A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795453668; x=1796058468; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xaIvYw9qB8U9m5yBZTbNli0aV2ssc6MRhHdFn2AjAQ=;
        b=bJJCiYt0S/vb94j7FaVaundwc0nL1p6kzmMdCgNUdSklpo9uP/FCGc33k7C365cnWR
         Tj1Kp85kU/ruBKGuyRt19q2mnKBsj3DuaoAnBMEV0DV7z/pdiWYm4i/ejXqJIaeT98sI
         KP/PzGEI276UWbWHUyCb+urtpTW3xCkIB42Oi3pp2qD6U5QOC8K6eJ1iJBzxINt5neF+
         MAnUdoHI/1MOLYf8lblXa0OPV+HDeFcoV+xUzsWWcuZuOP5O+ajqRYZd31gN+fI3Yumm
         WwLK4Z/rrRZzFMJKfc/jjvERNbVYwwwhcLyQquCUyS5WVak2uVFQ2r71zz3K1JOqF53w
         pLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453668; x=1796058468;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+xaIvYw9qB8U9m5yBZTbNli0aV2ssc6MRhHdFn2AjAQ=;
        b=byoOxkIQuuFx65ogYlU0RvT2V106aEN3HwLj7WimflM7BKz3V3787Go0KOrtPIFOo5
         8qpXf5fYsHtny78cEEh2IOZAbkOUCHQ/EMQOL/YZY8nFRTUHwbDbBInk4R3YY3jGDVzx
         OZY5Lxq/l1z/3AJTV1dHjc1JJUqO+eYPX/1Ut7AilmEypd+po/8DctSc5UGi4zYT4Lyi
         VexSgd966OgLlxluspDXI+nwU7mxb0zvEqJyniN1eGEVAYsRezEyAPnvTZZ70omMYuiU
         GUzD6q7H4SJ+ngGJJUZJDFtNb92y1JEHnkDg6cz+zAAGmBjajN1Lxfau1/dOhSSpfrmo
         tXow==
X-Forwarded-Encrypted: i=1; AL+hErFnrqONVE3bRwfV2nFCTURWcOmUJbRfP46sFnLOEH8OK3uMz9B4Y0SMueQ5CX6bpNgnBDrfUl7kvWnITtU=@vger.kernel.org
X-Gm-Message-State: APuU4Z++OP5K8iC/dhoha4ylmrKf9burq/a3vxYVfNC69PyjSghtmfKo
	iBKuk2Ezun4+956MQJI5X6Tr8CD8m1GXVwPVkQku4pceBoPtuBOO4sjdunod40jp39iZ6oTLCV1
	mTHrrYUknLBkbdBPV63KSKSk6oYwM3YRXoIsO4faOKQ==
X-Gm-Gg: AZFdTZeDRpbsLJCe4ckHZ3tzaOM/zMpGB4KvkXigrBxs5aKB21FooeKzLgCvgn+RSpI
	Wqk2v+I7q1PtqlNvuAB0x9iCnizJ3X5EW2EKBWBM+kL0dVX71KMcb+MXxsSiVquLaaJ20B3ULc7
	NzRDF8D49eEvbSvZ2imIWLxW9W1X2sTq0ir/jRMfSEfnMtO9xUg5NEi4hr6t2ji0vjFQgL38qR3
	Gv6rMds0TlYmfrHRW07C9ZlNM+35DpdBRLa7TVKSMAYBbiERbZRKWeGiFQgYwlVm1uV8t6DGl0D
	SiRp2r4LGWrYdLbgxO8iUyaeM/8mpm+eazdB6tNi9pwDL7kU9VbSvst2UlC7ZyWi2/hEw35kahM
	UybuNmiwJIO4wMLju8zN07KBjP43+DRzppzCX6H6ro/L4+0uQzLkqj0YAEY3JTIh4dRqB0A==
X-Received: by 2002:a05:6402:1f90:b0:6b8:6d0e:42d1 with SMTP id
 4fb4d7f45d1cf-6ba37ec55b7mr8892708a12.42.1795453667947; Mon, 23 Nov 2026
 09:07:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122015729.2512645-1-penghuang@google.com>
 <CAKfTPtCQpVhtVT7Mhqe1=Ukcmc1pX8Jgn9ypb64--8cJ-7G4BQ@mail.gmail.com> <20261123160934.2289260-1-penghuang@google.com>
In-Reply-To: <20261123160934.2289260-1-penghuang@google.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 23 Nov 2026 18:07:36 +0100
X-Gm-Features: Aa3M54pZP_B9lARK2Zw6EDmAmPbhCNYrxOAs4lBrYCe4I2A8S177FGDlJx_bcaI
Message-ID: <CAKfTPtD17e-veL1QgrhO6i4nsKyA3QfOEm8jNinJ_zf+vc8RDw@mail.gmail.com>
Subject: Re: [PATCH] sched/pelt: Skip dormant cfs util_sum under scx_switched_all
To: Peng Huang <penghuang@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Tejun Heo <tj@kernel.org>, 
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, linux-kernel@vger.kernel.org, 
	sched-ext@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 17:09, Peng Huang <penghuang@google.com> wrote:
>
> On Mon, 23 Nov 2026 at 11:34, Vincent Guittot <vincent.guittot@linaro.org> wrote:
> >
> > When all tasks are moved to sched_ext, fair utilization should be 0
> >
> > ...
> >
> > This is not the right solution but a bandaid to hide the issue. When
> > there is not fair task,  rq->cfs.avg.util_sum shoudl become null.
> > Please look at why it is not null.
> > It could be that the update stops before everything has been
> > propagated correctly in the task group tree
>
> Thanks for pointing this out -- you are right, and looking into the
> code confirms your suspicion about stopped updates and incomplete task
> group propagation:
>
> 1. Deferred cfs_rq->removed and unvisited sibling task groups:
>    Tasks that exited (task_dead_fair()) or migrated while sleeping
>    (migrate_task_rq_fair()) before scx_enable() queue their load/util
>    in cfs_rq->removed via remove_entity_load_avg() rather than
>    deducting and propagating immediately.
>
>    During scx_enable(), switched_from_fair() -> detach_task_cfs_rq()
>    only visits and propagates along cfs_rq chains that still have at
>    least one live attached fair task. Any CPU or sibling cgroup cfs_rq
>    with no remaining live fair task is never visited, so its
>    cfs_rq->removed stays undrained and its tg_se contribution remains
>    in rq->cfs.avg. Once __scx_switched_all is enabled,
>    scheduler_tick() skips sched_balance_trigger() and fair_sched_class
>    is bypassed, so __update_blocked_fair() never runs to drain and
>    propagate those remaining leaf cfs_rqs.
>
> 2. Sub-divider util_sum residuals:
>    Even on visited chains, if tg_se->avg.util_avg has already decayed
>    to 0 (with 0 < tg_se->avg.util_sum < divider) when the child
>    gcfs_rq's last task detaches, update_tg_cfs_util() sees
>    delta_avg == 0 and returns early without subtracting
>    tg_se->avg.util_sum from the parent cfs_rq. Independent PELT decay
>    truncation and integer removed.util_avg accounting can also leave a
>    < divider remainder in cfs_rq->avg.util_sum after util_avg hits 0.
>
> For v2, rather than touching update_idle_rq_clock_pelt(), how about
> adding a fair helper (similar in spirit to rq_offline_fair() ->
> clear_tg_offline_cfs_rqs()) and calling it from scx_enable() in the
> existing per-CPU scx_switched_all() loop (where rq->lock is held,
> rq->clock is updated, and rq->cfs.h_nr_queued == 0)? Specifically, it
> would walk leaf_cfs_rq_list bottom-up (plus &rq->cfs) to:
> - flush cfs_rq->removed,
> - clear load/runnable/util _sum and _avg on the empty cfs_rqs and
>   their tg_ses while preserving last_update_time and period_contrib,
> - clear tg contributions via clear_tg_load_avg(), remove the empty
>   cfs_rqs from leaf_cfs_rq_list, and update rq->has_blocked_load.
>
> Does this direction look reasonable to you?

Yes this seems a better solution but It would be good to reuse
__update_blocked_fair() which already does the work for pelt signal.
Regarding your issue with util_avg == 0 whereas we still have a
util_sum != 0, we can use delta_sum = gcfs_rq->avg.util_sum -
se->avg.util_sum; in update_tg_cfs_util() instead. When util_avg == 0
we will be sure to clear util_sum too

Thanks,
Vincent
>
> Thanks,
> Peng
