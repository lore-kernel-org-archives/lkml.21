Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612618;
	b=hzDbZbRv5aB4/H9EgvSgZoKNyEZeQpSzRsafgV9cjotQJDaN1m35C2HE7hQWV+4Rokgs
	 2/ojj5zZ9nHde0nSQN+b0TgDkFlO8k32lZH+3ikOFPQfC+Cn5L38CAonyMddbEW3kl6D6
	 8VF/ylW7vHBlyrBG6k+zBB6gCNfHgfshpNJXHQf9EygJMcNtREK/CSwJ8qY8aMR5EVP0I
	 V431pIUgdQRtjwYtegch3Fq7hPZyH3+5R9r1AQSnuar9R7b+ubckp3FItCJipjq2EDBpy
	 +NeSuH0F0dVyKVmdIKKapGMxsllGTdHAvaMcLrVr3eVsNWiw0DpjzmQzUBsQiXB5Qag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612618;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fuM8zftzEZ7FGt0ToEWS4ubo+9q+jl38mKnAlc00kBk=;
	b=0qtxO2X5LqpIYa7HJE5O8yw7ju1zm4Im6pSrUaGyc9d/VFpBMzmV7Av0K1hrpmsBA6Xv
	 8vUfkA/X0tYmt9B2a6DxzRlksdPt3+ot8t3kxnC6QtpE2VkWg93lwiD226TuBRbe/UajU
	 uwq03RbrVA+tFQXVrgSAIQPv3+mFg7SaB1AYIP5GrsG7D9NrzeqjQrWd7lnorWLuv9hE1
	 +vq9IRhF194+gksMMkOOgOK9TvB9rcEjrX4LjtmqzEucSv3+wDMXwv/alupTa8ufJVsiK
	 5HqoFdQ0J/wNP1bh+0EqqeUgd/lEGmY8/NN13ZS2lYOChCV4Ur7bqbV7RMTq7YFUwLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZWYPQMso;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F17606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZWYPQMso
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246861F000F4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795612618;
	bh=fuM8zftzEZ7FGt0ToEWS4ubo+9q+jl38mKnAlc00kBk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZWYPQMsoksdYfaAucq9RwMJ08xuBM5wqFwpEjo4jA+ITuAJsZVbw9qIId6kFslIGL
	 naKZUk5dQjK1EpPOZGXAAqetg6ZWivpWnWpWijq6qKgOs3BkCENw/08pJc4Cr3kula
	 dWkA3jNjN1BF76JCS/VGac9hJOO+U21hWkjAbO072eXxWjDZTU3ZwqOHM7rXX3tISw
	 DQ4fprlmmWiJ+21e7QTjZ5IeQlDgSNXp1dIebtONS+yyVJF9EbKfDPcZRFFmEAzT/J
	 IJoQEjtoDFL+5qs78KXMfD/5OC1A5fNdtm3v27dD8hiD/dORY1JrmoER6phwRIw8YT
	 m5uEc3ax6+SqQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso5114827e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:16:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFvol9ngMqdDcJKceR2xd5x8Vuzh7/IlFSmFORWu98lUVIGrU+N+cBuB6p+8+nNs3xivpZDFsdcCsqonB0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HLh1rNdkIPzzNX8zHX/Pi4vH8jQ7sask7tCg6RE1NnXxJis2V
	nSMTYm19RdIxYRWgCf7jMofV/vnjaUbl8HPbtNI6J+NAYxduVyhieRLk7ar0a3n7BPI9unMmdep
	G6AVzpqImo8EY5P15w5vB/vBfofpjRQ4=
X-Received: by 2002:a05:6512:3192:b0:5c1:4e2d:57bc with SMTP id
 2adb3069b0e04-5c1bc816d7cmr5471270e87.47.1795612616338; Wed, 25 Nov 2026
 05:16:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125103451.1385246-1-zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261125103451.1385246-1-zhongqiu.han@oss.qualcomm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 25 Nov 2026 14:16:44 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0h8Xn=6kjgRxJWdRw9M1VPwG+zcuFNMPFo5y=egJk7XvQ@mail.gmail.com>
X-Gm-Features: Aa3M54pUsTnSXiAl8_OWe9Ym0pquhG9chDjYuSJaN6ZeXF6Kv2BvXQ533vfWaPM
Message-ID: <CAJZ5v0h8Xn=6kjgRxJWdRw9M1VPwG+zcuFNMPFo5y=egJk7XvQ@mail.gmail.com>
Subject: Re: [PATCH v2] cpufreq: schedutil: Run irq_work in hardirq context on PREEMPT_RT
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	bigeasy@linutronix.de, clrkwllms@kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	Christian Loehle <christian.loehle@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 11:35=E2=80=AFAM Zhongqiu Han
<zhongqiu.han@oss.qualcomm.com> wrote:
>
> On PREEMPT_RT, an irq_work not marked IRQ_WORK_HARD_IRQ runs in the
> per-CPU irq_work/N thread at SCHED_FIFO priority 1. The schedutil slow
> path queues its irq_work on the local CPU, so the wakeup of the
> SCHED_DEADLINE sugov thread is delayed until no other RT or DL task is
> runnable on that CPU.
>
> Meanwhile work_in_progress stays set, so no new frequency update is
> queued for any CPU of the policy: one busy RT task can freeze the
> frequency of its whole policy.
>
> sugov_irq_work() only calls kthread_queue_work(), which only takes raw
> spinlocks and is safe in hard interrupt context on PREEMPT_RT, so mark
> the irq_work IRQ_WORK_HARD_IRQ, as commit f8d958880933 ("srcu: Use
> IRQ_WORK_INIT_HARD for srcu's irq_work") did for srcu.
>
> Tested on a Qualcomm SM8850 board running PREEMPT_RT, with SCMI cpufreq
> forced into the slow path. With a SCHED_FIFO 10 stress-ng worker on CPU1
> (30% load, 50 ms slices, 15 runs of 5 s each), sugov_irq_work() now runs
> within 15 us of irq_work_queue() instead of waiting for the RT burst to
> end (up to 212 ms), and the policy frequency is no longer frozen. The
> irq_work latency below is measured from irq_work_queue() to the entry of
> sugov_irq_work(). The cost is that the kthread wakeup now runs in the
> irq_work IPI handler, as it does on !PREEMPT_RT. In a separate cpufreq
> stress test with cyclictest (SCHED_FIFO 90) on all CPUs, this raises the
> average IRQ work IPI time from ~0.5 us to ~1.3 us, with no change in the
> number of IPIs, and the cyclictest per-CPU worst case by ~2 us.
>
>   PREEMPT_RT                           before              after
>   ---------------------------------    -------------       ----------
>   irq_work latency on CPU1, max        130 - 212 ms        <=3D 14.5 us
>   policy0 frozen, total per 5 s run    0.57 - 1.25 s       none
>   cyclictest max, CPU1-5               13 - 16 us          14 - 18 us
>
> On !PREEMPT_RT, cyclictest and IRQ work IPI duration are unchanged. No
> lockdep or DEBUG_ATOMIC_SLEEP splat on either PREEMPT_RT or !PREEMPT_RT.
>
> Fixes: b4c6f86ec2f6 ("irq_work: Handle some irq_work in a per-CPU thread =
on PREEMPT_RT")
> Reviewed-by: Christian Loehle <christian.loehle@arm.com>
> Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> ---
> v1 -> v2:
> - Add Fixes tag (Christian).
> - Collect Reviewed-by from Christian.
>
>  kernel/sched/cpufreq_schedutil.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_sche=
dutil.c
> index 14405a614991..b2e9ac7e3517 100644
> --- a/kernel/sched/cpufreq_schedutil.c
> +++ b/kernel/sched/cpufreq_schedutil.c
> @@ -726,7 +726,7 @@ static int sugov_kthread_create(struct sugov_policy *=
sg_policy)
>         else
>                 kthread_bind_mask(thread, policy->related_cpus);
>
> -       init_irq_work(&sg_policy->irq_work, sugov_irq_work);
> +       sg_policy->irq_work =3D IRQ_WORK_INIT_HARD(sugov_irq_work);
>         mutex_init(&sg_policy->work_lock);
>
>         wake_up_process(thread);
> --

Applied as 7.5 material, thanks!
