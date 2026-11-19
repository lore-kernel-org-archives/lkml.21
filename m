Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795102041;
	b=EFDghNvIB6NpRUJnIMQBfggVLJ2BQVQgamY22L1BPr9TeAB5YMLAFc7RUdvuMPe35/b7
	 ow83aOnXOe1dI9DNvrTfLranayRuAEAyPOzSOpdqLnoEcaR+Th5VrtZIFIBcx2gmVp57H
	 YzqO/xeYVCEPnyl9fwNstBR5sMN5FA7FPnNOg2o2cdwgN/I8VL5NloKcn8PSY+RVV059j
	 AamKOhrvRwj1HG1QJmdjFjeHmywEG1KmG+w68Tqi44J8RPfc64PF4eATh3qal1GQAAcQ/
	 pfCu18ifwZfF1qLJjnxfd3dDZJRH2c5egG+uYlp64AQJ8rha1J5mlalsdaQexaXjLwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CZqy6xFABQEyD7CGf6Z9ErvSDunlUYlFbbHfyyFxeho=;
	b=3QmolgeCGfn1T23Cby1K78BLeeGEUqQzEgYJFwdLKirR7cDJdeemdTrGVvO7rofT7SqO
	 SUfDJyxY4rB8vUBisTf6X7YDi9qNzpMO0XLBzsfxh/VPPvKXcgGhjOr1wEtwusriNpcsq
	 AeU+qHN267AYaRNDisq+eVXJt2simqefdbUGLiMeKMYdQ0DD7tMvx5Va2ygsJwq+HjJ5t
	 +YlB5rlLe3vOUp9PMmIsATaHnO5/2XtS1vqqc2Mga+zFh8O/O1z54f3xdstoRQrgJWk1H
	 /dG8m7JTDyBWTSvhtRVWDm4IDePxCnUW5QDuDf0a4wGJUarRHG87IIV8yWqvoYzo+CA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=qsbv9f9X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1757606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1757606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=qsbv9f9X
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so21430105e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:27:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795102039; cv=none;
        d=google.com; s=arc-20260327;
        b=Ch6zLgXdnwEZ7uu0Z/8GV8NbUdpZX9ZJcE6SmFYL+D5bwHIkJQbZSv6a2YDpZjuc13
         hS5KTYt7SgKwObIqQMF3xNezcqm/wgNNLlPv1uRR7KwFJqM9UqWmN42IdV0Qf3FW8n+3
         morOedJmkVDrf7gBmc8ihX2PsveW0DBJb/WOw7gtnyR3O5aasyVbRk/hzJ+dicTF1gSW
         /bKLsOUMdzoAisUsdPfBxVluYC9QO7p3hqjEU6A++pKXFS2/AWGlwTNdbZbKHrvO4UfX
         n9YkXxxSoh+q51MbKAVe7HH5h3eMzlRCLtpiyL8Oka8DccEnJYcTGRygU1SwskQ+X13X
         ENLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CZqy6xFABQEyD7CGf6Z9ErvSDunlUYlFbbHfyyFxeho=;
        fh=4vGMg6agZXF32td0NNM9AWAnDpWIhmk0LNmZzJkN1W4=;
        b=icR8RJp1FNM2rb2Omt/79U1jJDLx1WDYAgEk4PJo8UcBMTh1sOYuz7Lgb0HovzMWjw
         ck5bmVVqDkGv3BaljMkkDMVBbE6nzvNLLfRgsDZjfVha/AKcqcpZvzIlSXO8LSZsbhnN
         Kl59sip+2NisTNN7y9n2IbZJC0YR1ecz8jG93WEoHXxUsGT/t6xyFRIae70011dMpve5
         0ggr6cGxd1RcUlHOSeWk1kSmugdpOrN1k6kdt8sIBBZKZPL9CmTWqOTrXt10YMXzkVrD
         ansgHAxZP8Gb8XCIX9rgLw+drnpZqkgPpAQ7Y0xxZKPyp5LXpCWuJdt2mgH9yu/BaLty
         7XZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795102039; x=1795706839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CZqy6xFABQEyD7CGf6Z9ErvSDunlUYlFbbHfyyFxeho=;
        b=qsbv9f9XlOjyM4QYFAOG4kMPWUZNb7q33N3+H96WjvHAPHCwDqiOYPU2UKXxDTpEY6
         CUSiHzoSCXhgbFTfH8oifUg21xSy4aPUsqivVz/oln67NWpD0vRUlfZ8J0t6dsRBpwA7
         IujGAro2KlwijgWpnnxP49TK+YWproFDYYkFzcSgrJNuv6vz6xsq/vpUt4gfOxTqBYM4
         qHJLuD02qWtnIRji8am8zmkFeliHdOUXzKNnA62vq+XeRalRWoFisI0j/Gbdtgww7ZcU
         qdY7GUlh+bgyhHVJzq1IjXuOPADDOpyEifpClv+9SPAuTjqdnQn4rnKn5NDkzF3+SEfJ
         c2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102039; x=1795706839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZqy6xFABQEyD7CGf6Z9ErvSDunlUYlFbbHfyyFxeho=;
        b=vlY6rjJfaeSxwfzHU8PU5nwmJYVe11TlumvupNukdSxFWJsRihZ1BYEv/isODigoc3
         ilaSttONY/Rn7J1qUFq05uP4Jq7oLK7E8EdXEcCUqa8e619NQCNpqQxHwXMBesS8chMc
         B/bDaKAvkXaNlDqRXpKqFabEK8u0p8G9QHO3fbwvXnch5+ZWFZToptGxkvSQV9/SLyYi
         9JQZOcn+J9mnhl2xVnIuUCRRSrjLws6QX6X6EeWKBExaapOuX5lwsyK3Heo9sanX4evl
         8xL+3YWS+LCBWSMvbWm6MGHwqOCrUi6sjFqwiqNOtWD13dGRjtBg0aPwhqJAlqM/W/uL
         Hfdg==
X-Forwarded-Encrypted: i=1; AL+hErGs2YxmE3Xuuu78KDGDoCxYqwTftLjOlrR0FijKP4vSl5N/q6KDJKTbNqvYla8asJA9gFnx+QixzRSng7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z822K/EG3quFVKz1KzbmjsVE3z23xngpmEilpw9Ej+tOT28hjp1
	ieOs2zYrjkl78qwLDU5NRFHj5qc1n7qDj0ZY/8j0VY56dpGj3si70/GBg/y70jA9/Z0s79EG/BN
	Lqe5vwyo8gFCiQ25Rl3HKKBG1cYzbbwfV4sfJl9TTgw==
X-Gm-Gg: AYBFou0jg5yGcplZUsKRStJVgJ+PurWx7x/I7fLrQevE2ATZttMLHFXakqX2O/xgktD
	+2YvlBMU/WJ9R2JacxA/xJ0iMCixRQun5PU2/Ewg6EgGub1MF+3Um0qKY8vOhsSOXd40tETA597
	ICkOWD8DBV1LpBqM8epM93iOw4rxpBbgb81HgQAnQV+UjAwZNvTLLBhK8jvzmo+Q43Hf3/pN2C1
	o1u7Gd/CyB9mw1fzTVsuMhyR4c/4mhmYrwrK7C8Mc2WCw+Bx83JLMTULbkEIP3W+apOlvkwbR7N
	K8EikXqoP4tV/ZlyQzO4TwFc8C8Q1bHjIxwNIekXgkFvy4DeCXOq+N0zXJAeMDMvhDnP5D0/Tza
	DED2B5DZAb1cmuILwLRSuFcMPOyAu1uVuMQ/hKNKT4yA9rW5dmfNnOw/SnQ+bpEe2wkv7x2s0VK
	jmnpsrBJaC5DNfJEVq/2g2FDBjd5u/89fS9WFTeERsb21OnUe1ne47w+4=
X-Received: by 2002:a05:600c:154a:b0:4bb:6b6b:fbaa with SMTP id
 5b1f17b1804b1-4bb7da12ab1mr128048755e9.16.1795102039017; Thu, 19 Nov 2026
 07:27:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-5-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-5-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 20:57:07 +0530
X-Gm-Features: Aa3M54rZEbG4RNdS6O1BRxLO3kDHI5P1qMQJ1pxxqQiXGApFrfCV5-bLcT-cUmk
Message-ID: <CAAhSdy1fx4uJJTTamoyOjojh+ApdZmPVh9nd==NcfM6fTCoOvQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] riscv: pmu: Add infrastructure for Control
 Transfer Record
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atishp@rivosinc.com, anup.patel@oss.qualcomm.com, 
	will@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	beeman@rivosinc.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	devicetree@vger.kernel.org, Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 3:21=E2=80=AFPM Vikram Singh
<vikram.singh3@oss.qualcomm.com> wrote:
>
> To support Control Transfer Records (CTR) extension, we need to extend th=
e
> riscv_pmu framework with some basic infrastructure for branch stack
> sampling. Subsequent patches will use this to add support for CTR in the
> riscv_pmu_dev driver.
>
> With CTR, the branches are stored into a hardware FIFO, which will be
> sampled by software when perf events overflow. A task may be
> context-switched between overflows, and to avoid leaking samples we need
> to clear the last task's records when a task is context-switched in.
> To do this we will be using the pmu::sched_task() callback added in this
> patch.
>
> Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20261106173942.3175069-5-vikram.singh3@os=
s.qualcomm.com
> Signed-off-by: Anup Patel <anup@brainfault.org>

As mentioned in PATCH1, drop the "Link:" and the subsequent
"Signed-off-by:" lines.

> ---
>  drivers/perf/riscv_pmu.c        | 19 +++++++++++++++++++
>  drivers/perf/riscv_pmu_legacy.c |  2 ++
>  drivers/perf/riscv_pmu_sbi.c    | 17 +++++++++++++++++
>  include/linux/perf/riscv_pmu.h  | 23 +++++++++++++++++++++--
>  4 files changed, 59 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> index 8e3cd0f35336..d4826eb73b16 100644
> --- a/drivers/perf/riscv_pmu.c
> +++ b/drivers/perf/riscv_pmu.c
> @@ -157,6 +157,19 @@ u64 riscv_pmu_ctr_get_width_mask(struct perf_event *=
event)
>         return GENMASK_ULL(cwidth, 0);
>  }
>
> +static void riscv_pmu_sched_task(struct perf_event_pmu_context *pmu_ctx,=
 struct task_struct *task,
> +                                bool sched_in)
> +{
> +       struct riscv_pmu *pmu;
> +
> +       if (!pmu_ctx)
> +               return;
> +
> +       pmu =3D to_riscv_pmu(pmu_ctx->pmu);
> +       if (pmu->sched_task)
> +               pmu->sched_task(pmu_ctx, task, sched_in);
> +}
> +
>  u64 riscv_pmu_event_update(struct perf_event *event)
>  {
>         struct riscv_pmu *rvpmu =3D to_riscv_pmu(event->pmu);
> @@ -269,6 +282,8 @@ static int riscv_pmu_add(struct perf_event *event, in=
t flags)
>         cpuc->events[idx] =3D event;
>         cpuc->n_events++;
>         hwc->state =3D PERF_HES_UPTODATE | PERF_HES_STOPPED;
> +       if (rvpmu->ctr_add)
> +               rvpmu->ctr_add(event, flags);
>         if (flags & PERF_EF_START)
>                 riscv_pmu_start(event, PERF_EF_RELOAD);
>
> @@ -290,6 +305,8 @@ static void riscv_pmu_del(struct perf_event *event, i=
nt flags)
>         if (rvpmu->ctr_stop)
>                 rvpmu->ctr_stop(event, RISCV_PMU_STOP_FLAG_RESET);
>         cpuc->n_events--;
> +       if (rvpmu->ctr_del)
> +               rvpmu->ctr_del(event, flags);
>         if (rvpmu->ctr_clear_idx)
>                 rvpmu->ctr_clear_idx(event);
>         perf_event_update_userpage(event);
> @@ -402,6 +419,7 @@ struct riscv_pmu *riscv_pmu_alloc(void)
>         for_each_possible_cpu(cpuid) {
>                 cpuc =3D per_cpu_ptr(pmu->hw_events, cpuid);
>                 cpuc->n_events =3D 0;
> +               cpuc->ctr_users =3D 0;
>                 for (i =3D 0; i < RISCV_MAX_COUNTERS; i++)
>                         cpuc->events[i] =3D NULL;
>                 cpuc->snapshot_addr =3D NULL;
> @@ -416,6 +434,7 @@ struct riscv_pmu *riscv_pmu_alloc(void)
>                 .start          =3D riscv_pmu_start,
>                 .stop           =3D riscv_pmu_stop,
>                 .read           =3D riscv_pmu_read,
> +               .sched_task     =3D riscv_pmu_sched_task,
>         };
>
>         return pmu;
> diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_leg=
acy.c
> index 1b8e4789cb3c..5214e90c61a6 100644
> --- a/drivers/perf/riscv_pmu_legacy.c
> +++ b/drivers/perf/riscv_pmu_legacy.c
> @@ -115,6 +115,8 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
>         set_bit(RISCV_PMU_LEGACY_INSTRET, pmu->cmask);
>         pmu->ctr_start =3D pmu_legacy_ctr_start;
>         pmu->ctr_stop =3D NULL;
> +       pmu->ctr_add =3D NULL;
> +       pmu->ctr_del =3D NULL;
>         pmu->event_map =3D pmu_legacy_event_map;
>         pmu->ctr_get_idx =3D pmu_legacy_ctr_get_idx;
>         pmu->ctr_get_width =3D pmu_legacy_ctr_get_width;
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 21a2078eab98..b14b3acf7567 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -825,6 +825,14 @@ static void pmu_sbi_reset_scounteren(void *arg)
>                           csr_read(CSR_SCOUNTEREN) & ~BIT(pmu_sbi_csr_ind=
ex(event)));
>  }
>
> +static void pmu_sbi_ctr_add(struct perf_event *event, int flags)
> +{
> +}
> +
> +static void pmu_sbi_ctr_del(struct perf_event *event, int flags)
> +{
> +}
> +
>  static void pmu_sbi_ctr_start(struct perf_event *event, u64 ival)
>  {
>         struct sbiret ret;
> @@ -885,6 +893,12 @@ static void pmu_sbi_ctr_stop(struct perf_event *even=
t, unsigned long flag)
>         }
>  }
>
> +static void pmu_sbi_sched_task(struct perf_event_pmu_context *pmu_ctx, s=
truct task_struct *task,
> +                              bool sched_in)
> +{
> +       /* Call CTR specific Sched hook. */
> +}
> +
>  static int pmu_sbi_find_num_ctrs(void)
>  {
>         struct sbiret ret;
> @@ -1506,6 +1520,8 @@ static int pmu_sbi_device_probe(struct platform_dev=
ice *pdev)
>         pmu->pmu.attr_groups =3D riscv_pmu_attr_groups;
>         pmu->pmu.parent =3D &pdev->dev;
>         bitmap_copy(pmu->cmask, cmask, RISCV_MAX_COUNTERS);
> +       pmu->ctr_add =3D pmu_sbi_ctr_add;
> +       pmu->ctr_del =3D pmu_sbi_ctr_del;
>         pmu->ctr_start =3D pmu_sbi_ctr_start;
>         pmu->ctr_stop =3D pmu_sbi_ctr_stop;
>         pmu->event_map =3D pmu_sbi_event_map;
> @@ -1517,6 +1533,7 @@ static int pmu_sbi_device_probe(struct platform_dev=
ice *pdev)
>         pmu->event_mapped =3D pmu_sbi_event_mapped;
>         pmu->event_unmapped =3D pmu_sbi_event_unmapped;
>         pmu->csr_index =3D pmu_sbi_csr_index;
> +       pmu->sched_task =3D pmu_sbi_sched_task;
>
>         ret =3D riscv_pm_pmu_register(pmu);
>         if (ret)
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pm=
u.h
> index ecaa40370830..c748a06ad751 100644
> --- a/include/linux/perf/riscv_pmu.h
> +++ b/include/linux/perf/riscv_pmu.h
> @@ -28,6 +28,15 @@
>
>  #define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
>
> +struct sse_event;
> +

Drop this forward declaration of "struct sse_event" and the
subsequent newline.

> +#define MAX_BRANCH_RECORDS 256
> +
> +struct branch_records {
> +       struct perf_branch_stack branch_stack;
> +       struct perf_branch_entry branch_entries[MAX_BRANCH_RECORDS];
> +};
> +
>  struct cpu_hw_events {
>         /* currently enabled events */
>         int                     n_events;
> @@ -47,6 +56,11 @@ struct cpu_hw_events {
>         bool snapshot_set_done;
>         /* A shadow copy of the counter values to avoid clobbering during=
 multiple SBI calls */
>         u64 snapshot_cval_shcopy[RISCV_MAX_COUNTERS];
> +       /* Saved branch records. */
> +       struct branch_records *branches;
> +

Drop the redundant newline.

> +       /* Active events requesting branch records */
> +       int ctr_users;
>  };
>
>  struct riscv_pmu {
> @@ -60,17 +74,22 @@ struct riscv_pmu {
>         int             (*ctr_get_idx)(struct perf_event *event);
>         int             (*ctr_get_width)(int idx);
>         void            (*ctr_clear_idx)(struct perf_event *event);
> +       void            (*ctr_add)(struct perf_event *event, int flags);
> +       void            (*ctr_del)(struct perf_event *event, int flags);
>         void            (*ctr_start)(struct perf_event *event, u64 init_v=
al);
>         void            (*ctr_stop)(struct perf_event *event, unsigned lo=
ng flag);
>         int             (*event_map)(struct perf_event *event, u64 *confi=
g);
> -       void            (*event_init)(struct perf_event *event);
> +       int             (*event_init)(struct perf_event *event);
>         void            (*event_mapped)(struct perf_event *event, struct =
mm_struct *mm);
>         void            (*event_unmapped)(struct perf_event *event, struc=
t mm_struct *mm);
>         uint8_t         (*csr_index)(struct perf_event *event);
> -
> +       void            (*sched_task)(struct perf_event_pmu_context *ctx,=
 struct task_struct *task,
> +                                     bool sched_in);
>         struct cpu_hw_events    __percpu *hw_events;
>         struct hlist_node       node;
>         struct notifier_block   riscv_pm_nb;
> +
> +       unsigned int    ctr_depth;
>  };
>
>  #define to_riscv_pmu(p) (container_of(p, struct riscv_pmu, pmu))
> --
> 2.43.0
>

Regards,
Anup
