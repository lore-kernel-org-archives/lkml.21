Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795527327;
	b=uucP3myPvTyl8EPcz/WpyUsf0nL7ftq+YWPuNyGe/P2RpSDErfYN/zLHzwtIIv20oWTA
	 UfCqH/DVFQ4epQVZbvmEsSNo/ydkDIEVl6Xbn7S9FQiDTtCbiY4xV0iD7T3YCW16QkkeB
	 Ss69ADD4/HDnJy4pNDySYfhD7wu4Ty8tfhdPahe/SjtnQL8YHr3sJtYywLM+a4yJGHzxy
	 Jv9GE2TyvhKM4AirC8FoN6/Bgqf2tDggzrB5SbKp+xYDdL4apASceKwiz6X9zlx4SVa/q
	 XwpUzJzT/GEhtvQqGb31e7yYcB6rGcV0ILiPN1CZe+IeLwuVb7f7mDCNqPp2W5oS5xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=b1up1oCF6qzRTwv6vvBBSZW6ICBIiKGkgn9Tp8EvIiA=;
	b=KrHp2/mTG2Ac59WGXpcnGTLkGt5FA0AWCSu5OoGzTsd6b/AYKINen/v3WQE8DfqmlEnR
	 ZmGsbVg85lHPINf4TboeRvnigQZUZpJbGT8p8cIdWIxKj7WzI+E82ntgioV6XlBpLXEDr
	 exP6QanOeRXTcbthAJXe+nMBOGm29yZD9OXQ2lOAMkjOlkfRqvxEXGT/+ihzrL5Wj/wKZ
	 2zPVSFtdqgpPJZjIT73qktbqTGydp59RO3xdtivRhDi07I59M+77FFxuF4aZXJQ3F++OZ
	 ZQsEJy94GzaIa4F60sKsZyS7EojMyR+OXfstdXwk6o+WrWhoHuhNP6QqZewPPDDUNPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lPOXrb7a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30319606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30319606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lPOXrb7a
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so5161066a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:35:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795527325; cv=none;
        d=google.com; s=arc-20260327;
        b=IgHVWsXBbIlItvO1hf80CPsOtmICancq13KxCj7k0C2R1d/5xD1FGSqJ9ufk5RFFSF
         Vfb//azGwN5IGPXUgT/7iYC+3YFatTfVSE4X5heQSGUZ3aGGpNK7SWrx0PYXWW0gMXyt
         bjgQktnfB3HIBzLXhXfwCvGMSDLZ6MZBwuKw6YrUFA+2WLpHYJIM0t0iVWDYqxba1C84
         ImGK5MjozkZpxQ1rgIGHD5QnLZ6c82FVesBZEcK+XkJdfpr4Gd1stPkMzNwRdmX2HYpe
         qbdHq0V65//4VuMctECSABc+4g1Vds4JuO9O4Y04fW+hVdVCjAqBiUznWjSTzxPVkZDj
         9t7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b1up1oCF6qzRTwv6vvBBSZW6ICBIiKGkgn9Tp8EvIiA=;
        fh=qkPXiZye3IVGmfumAOLFil5yf98Sr3mGqghJsK+zg8E=;
        b=iP4kydbfle7g20n6ciSgImgONuaCoJMXG8fcKj5siotRhQlqXpMWpav3+dV/q38q+J
         uoMmyYZbTAt+bhxjlJoWMbF/qRVknV9fcxrELxbiaxTcUb6Vj7MSwesCCJPsj0xGDPFq
         fkloyLwDanMdZCHORFWK+O02yWvS+W2x9p8Pc7IslYfuG1EbIllLNHV53oXI9kUU6B0S
         WPInrEvjT8WdiyjTpwF6Z7VCzmdxuBalt00upt/naWI+RXpYE9Z3Vq+3e+GL2S0yitko
         LULcmar/Hs9AX5guAIcJMGafVjo6pDbe2ePmTDa4+HIz2Loai+yROh+24S/EKGjaESBT
         v/cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795527325; x=1796132125; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1up1oCF6qzRTwv6vvBBSZW6ICBIiKGkgn9Tp8EvIiA=;
        b=lPOXrb7a4z59iEMaV3e5nYmkAiVIOM3JSS5THtcfOrpCsUsu7MOgcdhVB0U9VxuYt4
         ZZuULPhg4ioPHbAw14WcCF8WC17/Nz244NcOk2nNAG6F3JCY4pfCKyXmmjI+2I37WSnb
         lqnO8lHhCgORHlcYdeynbLoDxU/zBqVkZ6znfhx3eIk0bA2vvtl+RteJeASTUXU4kHhP
         eZSqCvi//v4ptbBhHdPRTjOy8STF1q9+QpTsD1/3cQbxiq3djt1Dj0PpYFOcB670IRBs
         0ZpRmPdOKdjCzuknnfeKawRKCsFWIlsfbtt6P9ka96GBeSd3EksZFqXaIwjWDUI1C0Vm
         nz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527325; x=1796132125;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b1up1oCF6qzRTwv6vvBBSZW6ICBIiKGkgn9Tp8EvIiA=;
        b=qPVmbr3U1Hb4wYFjZCvrvXkvuDRflgWaJJIIAzS8nBM5K0oqNHLKABR+CvycrqnOsG
         lxjKVVJLCdWnojrXvlLp8ZFGgbVbobnqS904UBmr8KZ0WcFuJRw5OIGc5dIh7fsyH8+E
         vsrXu0xYxQoZmNUAopFzdrox/6GMz4eJ1HO9wpDol1BRiG2cKZM+Mo9YiOXZuTqGRwdq
         ZGECvZF/mzkR6rMgWRuml/JmwlgZ0U0hlIDPIWeaDkWiaJKnhsgkN0b9nRU0lr1Pd/md
         WISbwXaizzQqs8bybpJVDb3EtgDuBFxp+1tuoJG/u210g5vy4OxrrpFCYd3ZYMQHitLh
         Kq6w==
X-Forwarded-Encrypted: i=1; AL+hErE8wqYjqqes5zOGqYxGKlAU18xyuLe+EIQ6CiHVyXxjS7A+MrzJ3kGxA1UVISd8OF8KscxZye/dGF8nrBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z98rnewzIOA/bwNRq5GJaF8dlZgAd8Dl6Oa7YbCvbP+KyrkV4kJ
	oXnl+tINZyJ9wQ8/VlHcmfj3qutFeA33c2Op3+gywSW0lHVeUuyMLVysIC7PY/0cNXcHUoJWhqk
	PWVlygM+d7VHZlL9O/9JMzGQ95tJBLCW8x1sqw+ScIQ==
X-Gm-Gg: AZFdTZdmHxUzWi1vLXrcPsqQ2PXHs/tca2qMjNJVW+EbA3M5DhUXzhDWiO2NAEhDGh1
	+g2FkuuXmMNrKSW8P1OoWPVhxYHNIYu1vuARWqTUutHfARnYJzTdIeLFPT5U2DfDVdx1dGcNdRe
	7cCySEubkysARrgG14APznhdzxqOdGIght20WFZuIyJ77cQ8R6h43bUh+HCKdIY7pZ94al1NWDu
	+Tg3xsOJ+Y5Yrmlehh+8V4PFk2Oid6Rw6dWbTlaumVPJNAqhA0513f8nty4YWGnw+g3uJdz4kfa
	au3MpMPzqDECv2ThtEogpzXFUiW0luGdzQy3zlediSciHhXnJVCjBRxbSAvAlMh234d44d96yK4
	Qm6uKghDQmmJVr68Tr2Dh73ZtKS0aWjqDAv0L5nYBzKvJVDR1Bp96T5DdYznfrOEFqqf5Ig==
X-Received: by 2002:a05:6402:1c05:b0:6b9:c43d:892 with SMTP id
 4fb4d7f45d1cf-6ba37c7bebdmr7896114a12.1.1795527325503; Tue, 24 Nov 2026
 05:35:25 -0800 (PST)
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
 <cover.1795462673.git.penghuang@google.com> <2b1ef28e12d12a1f894827b951910c1979d54d45.1795462673.git.penghuang@google.com>
In-Reply-To: <2b1ef28e12d12a1f894827b951910c1979d54d45.1795462673.git.penghuang@google.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 24 Nov 2026 14:35:13 +0100
X-Gm-Features: Aa3M54r_GuyHMOfbhsDgXKslUX5_bNC9UFQqsD7NbKjR0P0AP7-nwsbW-9M7qek
Message-ID: <CAKfTPtAkNzqFbNsw2YKoNCsqzpC0wEs_LTrV0S_TU-FvDPu21g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] sched_ext, sched/fair: Drain blocked load on scx_switched_all
To: Peng Huang <penghuang@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, 
	Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org, sched-ext@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 21:13, Peng Huang <penghuang@google.com> wrote:
>
> Tasks that exit or migrate while sleeping queue their PELT load and
> utilization in cfs_rq->removed rather than deducting and propagating
> immediately. When scx_enable() switches all fair tasks to sched_ext,
> switched_from_fair() only visits cfs_rq chains that still hold live
> fair tasks, leaving unvisited leaf cfs_rqs undrained in rq->cfs.avg.
>
> Once __scx_switched_all is enabled, scheduler_tick() skips
> sched_balance_trigger() and fair_sched_class is bypassed, freezing
> blocked-load updates. Stale rq->cfs.avg.util_sum can then combine with
> active RT/DL util_sum in update_idle_rq_clock_pelt() to exceed divider,
> inflating rq->lost_idle_time and stalling rq_clock_pelt().
>
> Export __sched_balance_update_blocked_averages() and call it on each
> CPU in scx_enable()'s per-CPU scx_switched_all() loop so pending
> cfs_rq->removed entries and task-group propagations are drained cleanly.
>
> Fixes: f0e1a0643a59 ("sched_ext: Implement BPF extensible scheduler class")
> Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Peng Huang <penghuang@google.com>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
>  kernel/sched/ext/ext.c | 9 ++++-----
>  kernel/sched/fair.c    | 7 ++++++-
>  kernel/sched/sched.h   | 1 +
>  3 files changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
> index 10de6bd865e8..f7c573092e17 100644
> --- a/kernel/sched/ext/ext.c
> +++ b/kernel/sched/ext/ext.c
> @@ -9013,11 +9013,9 @@ static void scx_root_enable_workfn(struct kthread_work *work)
>                 static_branch_enable(&__scx_switched_all);
>
>         /*
> -        * Detach the fair_server bandwidth reservation now that the switch
> -        * is fully committed. In full mode (!SCX_OPS_SWITCH_PARTIAL) no
> -        * task will ever run in the fair class, so give that bandwidth
> -        * back to the RT class. The matching ext_server attach already
> -        * happened earlier; this only releases bandwidth and cannot fail.
> +        * Detach the fair_server bandwidth reservation and drain any
> +        * remaining blocked or removed fair load now that the switch is
> +        * fully committed and periodic fair blocked-load updates stop.
>          *
>          * In partial mode keep fair_server attached.
>          */
> @@ -9028,6 +9026,7 @@ static void scx_root_enable_workfn(struct kthread_work *work)
>                         guard(rq_lock_irqsave)(rq);
>                         update_rq_clock(rq);
>                         dl_server_detach_bw(&rq->fair_server);
> +                       __sched_balance_update_blocked_averages(rq);
>                 }
>         }
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index f6c3bbb19557..f19f498e01a4 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -11655,10 +11655,15 @@ static unsigned long task_h_load(struct task_struct *p)
>  }
>  #endif /* !CONFIG_FAIR_GROUP_SCHED */
>
> -static void __sched_balance_update_blocked_averages(struct rq *rq)
> +/*
> + * Update blocked PELT averages for RT/DL/IRQ and fair cfs_rqs on @rq.
> + * Caller must hold @rq's lock and have updated @rq's clock.
> + */
> +void __sched_balance_update_blocked_averages(struct rq *rq)
>  {
>         bool decayed = false, done = true;
>
> +       lockdep_assert_rq_held(rq);
>         update_blocked_load_tick(rq);
>
>         decayed |= __update_blocked_others(rq, &done);
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 220927453a88..71a69f90e5df 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -2977,6 +2977,7 @@ extern struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf);
>  extern void update_group_capacity(struct sched_domain *sd, int cpu);
>
>  extern void sched_balance_trigger(struct rq *rq);
> +void __sched_balance_update_blocked_averages(struct rq *rq);
>
>  extern int __set_cpus_allowed_ptr(struct task_struct *p, struct affinity_context *ctx);
>  extern void set_cpus_allowed_common(struct task_struct *p, struct affinity_context *ctx);
> --
> 2.56.1.831.g720f3f5937-goog
>
