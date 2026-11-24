Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515797;
	b=ftM0SGkN/xSwy4jj+WSvH8ofF7quDBDt/SvjFCGT9Qt5hPRuSPURx73LP6eab3zPjPwh
	 Hgc3xz1O7WmkAU4U+52OJUAN+BQ6n2waTLknjJeHyHBeLLquKGlJd/HVQpXfJQVi2FTHI
	 78rgzQAUUYY63rHzmL8+DS/sWVvVznkd/wTzf0U4BBtRhu9GyQNbgJ2FEJ2hg5cNGJirh
	 /73Hq4PyKpVlGVxrdHgVUmUrjVQiZothP+XgK4F11x1FAZAjFXgig33Rs9cVvS1XKC8FJ
	 NIzECaee8NrHKr9GabgNq3wwoCcuYoZQFgtVYLUmqLaJUGPI3Mia33KMGYvDnuwgPlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=qBoWo02MaLgXB+hZPQ8xqyCHXhNVrv9lLkhhLMJg/BY=;
	b=APQwOc2jZ7TOZKVv5j6/B6v29T69XzTEjY+eXJLlFhI3lKbbD3QDyXz4gSCce9aWqXzs
	 4ZQmXWLRTVfWN+gA+7Q91l/2Bt9lCjIEz10BrmJ7l99zZACOseCsUjmfFTniEHEAFVlI5
	 lF7EazpKl20OJibLKhp+FgmRxQTgmFyJvqeYM7AYxPSE1w44nICHUwNGggSZqnAIuyOND
	 2YC133kpbM2lfvMryBb9SNvvQv8tQDs9WrE7T/v8WWzpeLrrmSLErJTfA1SqnP4jwmwrV
	 0GjljY6mDu8qwpq2zviFhb3X0wuPhDaYYej7g5qqS3ba6XaMNzkbhFE+GUCekwB2aYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rQCZ7TPf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5FC606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E5FC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rQCZ7TPf
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so5892062a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:23:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795515795; cv=none;
        d=google.com; s=arc-20260327;
        b=KZlbdKLTGYeS7GqY1Hvv9wYSsWScIp2yq9Bt+RGbDtWqQu4LqdJJUlYo7mj8nELTv5
         kis7SKgOXVEzi0rYr8TdoAJiBCmPwvvr8v1aRqn8g8cWHy/2HxT/4XYOyQgPff8h+G21
         qF4vQhsfyxY0TdoSwQ7tpKXIdtNU9EBnyf/gefEJja8D907xLwTsTuPNCR5YSCatGoXQ
         alN+riuCmxHEU9QAqrmxjCmS/+CIPWl6kkobnU5rBiUypRIOeHzgAoUqx4T2JONQbnuK
         jNsjziFif88uyVhfeUsvQ2qV2r1ih+pUUOhWskrTY3sq4CBZ9zbqYTklv37corxSZCll
         f2vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qBoWo02MaLgXB+hZPQ8xqyCHXhNVrv9lLkhhLMJg/BY=;
        fh=RhZ2C6LvTv3BScaXDNRsqVk43NPy1GONNoOPRD8QnCk=;
        b=PNUBpOJTrT1pMbbQ8PDCpRPh1CDZjdQYHazQWaBwv9kADTm46L6Sj8vkQ4ohQctFSb
         Y127tMtNEHeS/P4MDwL/N2SeVnGrCg13QWj4xu/ogykoeKVCUJgGawrUSEEiFIeMOlr5
         dtxL92Y5rnEN0lTdT+GSQUjKrCW3C1E0Ee53HKT3CopZbo2stkzklTiZroXOAA5b3tpZ
         gs5xombpu9KCq7WTzmx3sqF7m6Zn2iOaQpx7qi1oxISbE3cIVdLj1BwxkNHsdsv60tIi
         oEsnIKnWqF4xT0/inuCpOK8MkRS2D6LnnzKuaokn1DNoXa6EAwcwRZtLyiOE151FK7N2
         EIAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795515795; x=1796120595; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qBoWo02MaLgXB+hZPQ8xqyCHXhNVrv9lLkhhLMJg/BY=;
        b=rQCZ7TPfd7L0gOBVbny4Ckd5Bk/Ighm8jp3n+qNJsQKL3DbYwA/MrExW/VnZtC3xnW
         6kinqEgV6ABFzZ9ipcwiUTrEkFf5+gZ7YKxLzIF6Jz88NinvQZvu8e7S9YK5PtUfldso
         uVvKxvW9BmDJbkXNx2HZf5HLhcfHQY7iURywGif+OC4KDouqbEjx6wQk4tnDGaCmJCGD
         QCaco8aJ+/Bvg5jBbrpYm31NOoBiWCIFkmz3kUnKKTKpTjl0DXeHXx+cXOo2OnFiwXdL
         /GRVhN+cO4siATeuMezofnKJ0tcIW4sTD5AFbIaVEZTMehcPtY6EnnN/dBWNDBzoKAXD
         uaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515795; x=1796120595;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qBoWo02MaLgXB+hZPQ8xqyCHXhNVrv9lLkhhLMJg/BY=;
        b=CrGuSeeYaBzxm1dTlMhcQNs2QA2WmJ/DmFhjqdTeEsxerrST4pa7lOaZxMVzC7H/wV
         iLCDauHLusSkvwiGeZGmngEABkxC3ziYNJfOi/uoTp8KEo1yphzyF16tGheYn3UrQhWX
         MPeS+bm+yGHI84pfMMG9sy4IyLa/u+jUZQ/EQi4lEnfiMXRUQKgH4M42qVZg6Tdfq8bw
         QIR94IKJEwVGF6qd/UM9Gt5te4hANmOHR06H58MoyTGZoMPJXIAbI5d0uGoEccLxPz5d
         AIaEGxtijtPVJ1Aaw3UdzyZ4x18uVF8WzshhXg9/kwsf/Bzis03+1S6Z/gX9CY5jjJ1Y
         yarg==
X-Forwarded-Encrypted: i=1; AL+hErGHar3DDHpzQKi1qC1P7zRqSpABLV1MJJ4vRP2Y5aRPA/n6PR4H9boQc8bjc30HMYioWlRVwOCPp8FRJ2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/a5W0t3N0LhaQlTNvUWvnNws5cxF30POHcWfZTUE6/g6HwAqPp
	oip7m0+F7eiAyZwHKuso+jAS8Wf8/SOTHWKBLC3v9lkqIFMGClQk5KEAEHbaptJlbUchWWQeAQQ
	m+tc6vp0MuMOZ6s8StKhU/YIWa6NAkmto6iuofu7/UA==
X-Gm-Gg: AZFdTZfGipjw4zqnAe0Q0fIt59Ra3IFDD0JWzFV2j4jO4gtLu0MiVKkUab0PhonPRog
	B2y+Yw4ejpf1qjAZytgLzqZqxtYEq8mSxS8VXe80K8WnjJn75RikY1f1gOyROwT5EslNzL/ydrY
	DhIO07xZhEUTn4gzeIDAycX4dQi7oXprHWcxtJasGxHgY0VmkWxxbuPrgYiUhF5lrJCcDIc6ixb
	5Gi1r5NuCUPttgj48UWfsuTobHG6mn8xNZ7VLJTpb6V5vBaLVqmOI6QFGIyrT0zYnS1CzH0H75d
	CPuUr0Ci4N6chFyiv5S6BetxCcCHBu8WPyGHH7QY5csFzyI3ver9Wv/MqZ6Xr9iGJhDEQo/V0/8
	mRhIb1FWNkNTU/JNovn1JdRBbSIrgF0MN0EtxZvJeNP4zOmw8fIm1osyVlkDWjzYNys8jSw==
X-Received: by 2002:a05:6402:90b:b0:6bb:6a9:b1b7 with SMTP id
 4fb4d7f45d1cf-6bb06a9ba28mr589950a12.6.1795515795398; Tue, 24 Nov 2026
 02:23:15 -0800 (PST)
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
 <cover.1795462673.git.penghuang@google.com> <9b14aecb0ad560a3ce5f7925aaaee6e4f4a1a760.1795462673.git.penghuang@google.com>
In-Reply-To: <9b14aecb0ad560a3ce5f7925aaaee6e4f4a1a760.1795462673.git.penghuang@google.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 24 Nov 2026 11:23:03 +0100
X-Gm-Features: Aa3M54qNqgI5hWzy6Ve_ebg-Vzu946g_60D42C4fuPQJz6zxrRzoY5M38661JuI
Message-ID: <CAKfTPtDb6CZ8WyN8rdK_-9RNhaFRxaZGOE3+EfbkReqkFCCy2g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] sched/fair: Clear residual sums on zero task-group
 avg propagation
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
> In update_load_avg(), __update_load_avg_se() ages the group entity @se
> before propagate_entity_load_avg() runs. If @se's _avg has already
> decayed to 0 while its _sum still holds a sub-divider residual, and the
> child gcfs_rq's _avg also reaches 0 (e.g. when its last task detaches),
> update_tg_cfs_{util,runnable,load}() see delta_avg == 0 and return early
> without subtracting @se's remaining _sum from the parent cfs_rq.
>
> Keep scaling non-zero averages by the parent cfs_rq's divider to
> preserve period_contrib alignment, while letting zero-avg propagations
> proceed whenever @se still holds a non-zero _sum so the residual is
> cleared from both @se and its parent cfs_rq.

When fair tasks are involved, the next decays will clear the *_sum
anyway so I suggest to skip this patch if it's not needed for
scx_switched_all() case

>
> Fixes: 7ceb77103001 ("sched/pelt: Continue to relax the sync of util_sum with util_avg")
> Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Peng Huang <penghuang@google.com>
> ---
>  kernel/sched/fair.c | 35 +++++++++++++++++++++++++++--------
>  1 file changed, 27 insertions(+), 8 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0c8af1cac2d5..f6c3bbb19557 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5516,9 +5516,15 @@ update_tg_cfs_util(struct cfs_rq *cfs_rq, struct sched_entity *se, struct cfs_rq
>         long delta_sum, delta_avg = gcfs_rq->avg.util_avg - se->avg.util_avg;
>         u32 new_sum, divider;
>
> -       /* Nothing to update */
> -       if (!delta_avg)
> -               return;
> +       if (delta_avg == 0) {
> +               /* Keep util_sum as-is for unchanged non-zero avg */
> +               if (gcfs_rq->avg.util_avg != 0)
> +                       return;
> +
> +               /* Nothing to clear once se->avg.util_sum is also 0 */
> +               if (se->avg.util_sum == 0)
> +                       return;
> +       }
>
>         /*
>          * cfs_rq->avg.period_contrib can be used for both cfs_rq and se.
> @@ -5543,9 +5549,15 @@ update_tg_cfs_runnable(struct cfs_rq *cfs_rq, struct sched_entity *se, struct cf
>         u64 new_sum;
>         u32 divider;
>
> -       /* Nothing to update */
> -       if (!delta_avg)
> -               return;
> +       if (delta_avg == 0) {
> +               /* Keep runnable_sum as-is for unchanged non-zero avg */
> +               if (gcfs_rq->avg.runnable_avg != 0)
> +                       return;
> +
> +               /* Nothing to clear once se->avg.runnable_sum is 0 */
> +               if (se->avg.runnable_sum == 0)
> +                       return;
> +       }
>
>         /*
>          * cfs_rq->avg.period_contrib can be used for both cfs_rq and se.
> @@ -5617,8 +5629,15 @@ update_tg_cfs_load(struct cfs_rq *cfs_rq, struct sched_entity *se, struct cfs_rq
>         load_avg = div_u64(load_sum, divider);
>
>         delta_avg = load_avg - se->avg.load_avg;
> -       if (!delta_avg)
> -               return;
> +       if (delta_avg == 0) {
> +               /* Keep load_sum as-is while child load is non-zero */
> +               if (load_sum != 0)
> +                       return;
> +
> +               /* Nothing to clear once se->avg.load_sum is also 0 */
> +               if (se->avg.load_sum == 0)
> +                       return;
> +       }
>
>         delta_sum = load_sum - (s64)se_weight(se) * se->avg.load_sum;
>
> --
> 2.56.1.831.g720f3f5937-goog
>
