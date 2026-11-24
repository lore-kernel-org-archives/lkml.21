Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538201;
	b=LTKy9R9mz2KMfCNEUxGEkDOVLuI3R4MJiawjqu0fUKh/Dmn+KFsm9tgSmnZ4tn9VihNe
	 I+BlsrBHvNpECttQLEpDnBDjwobLdpeDMjYda6n+6ZVHZwHeAREYQd01v3cSkBl/F/lGz
	 lu1ErBDSofDGguywySOZcmgWh5UN79BLdrHh0J7KQWci0BewW6lVBcHPu8VcYbvZ0n0F8
	 mbjx1kXDqpGjc4DqEXeEBE6EPCkhAdgVtHuN02tkcgVf13lXguuoc/VpLsD9R2qZsBF1M
	 FqVVJJg2f8v5zZYm4hnZ9MpMQiukHVve/07yTjruqfsiaGrj5aXpPwudI0E67GI9Tew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=S/yEUI4+MwJL9iHwMgVBLQAZrhHUTmAwr9QyqtqrLaM=;
	b=KaPAGNEm9i7S6+lQHkzu6kwJG9EEA+ruASvHOBwBNjQZPwnLaJif3QRmJrvv0/MmZh1a
	 By3JmUSmhUATDgXS0OGYS0UkzKZmKKypmAH0qkuzuoIksGXEuVf8U7Vq9NfXzmPOdFKyR
	 Qs/61NtlOGzpjWkQ6m/CXb3kAuQIaUF+BH5Ghw1BGqrOCAdFzbsLwH3gJ8toKRdM2BZno
	 4AEiQp9FBvb842e+dEg4owjJ0QXeXQTJk4y8NqU34yEYr+VCsR2dYDpevInnY295NEu/G
	 PTS353/6BWv95NR2yI+INs5m9HSQ/t/dyrB3AxyqLNjffnzgCsJSzjVEC6bxjBR65dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YJ57iqgL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A17606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17A17606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YJ57iqgL
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so6002813a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:36:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795538199; cv=none;
        d=google.com; s=arc-20260327;
        b=OoNsYciGvWJGokEiCijT0AuRPigyBi5UkE98syuDjiSqDoA4ApqX2Ct5ZBIH8Xn2K2
         K4Pvvn5DaWinWlALKZgwd0Cg5DAMgxAyXmcwUYJIXl3ChTv8CjHDnEJupxORdq6032Z8
         0kPXlMk86tlyk1x+U2CL2LDj/rHKK7ROo7+5hcpwyuOsSJd21djHS5OySTPQ6ZOASzfB
         phReZDMHbke6JRYl/zMzqgNOPDYmA3hkDEPuANPCMVCEjb4ltvT4OZT4bdBCr3Ft4JUS
         bu7ux32zMd+REBS7GCYoO334dWWjPOLJPhUVqyGxgi8p1D2d357XG7ixYFMkr2CbdQ50
         OtlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S/yEUI4+MwJL9iHwMgVBLQAZrhHUTmAwr9QyqtqrLaM=;
        fh=v8KXA9esM0yWrQoirQV6eI6Iv2el5D4ssz6iB75SYuM=;
        b=przMf+ghchJaYPvG9GCUaQXwiOVHn4Z8guQsV/tBvkxrZBkM80dMtMxTnzkOZh4gtj
         DUyKlOwBZVw8yTJn0WJtJW35IfDyelEKao36v2L6xo3hW3OGs5z0Fbcgm7eHa2sqrMsz
         WzRn98boDy0AnamrIZVASPFYXlB/Mb/PNBqhgl4xsm9TKk2HTlo/q2Xfpr5hEP+uwv6s
         Y+vC2DUi40+1ZHQuotBCi/nPlr4w7J6BGh/+w4eq/HuHh+E6hvXwY6GtRl8TAvgplR+t
         iUIi6OCATlcMJjJEfJlWpJ9MIMbUSKiEyApflFF7S9DPgUzSygth9xdDPTCvtKKc+OD1
         SfRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795538199; x=1796142999; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/yEUI4+MwJL9iHwMgVBLQAZrhHUTmAwr9QyqtqrLaM=;
        b=YJ57iqgLKSx1CNqDNsfhXTXSYKrBtFiGA7j2a0lYdhNTagMZ8Gf07v62Zv0ewW9Bf4
         QTZ9JGitGQPPIEM/zQot2F0H59FSEe6qAb4MgWH2cxTfS+BQfdUTAfU4OtW4M8eGMcZX
         kWQI4IpRuZhXC8vzU+fhZ7sCDWOifwAvqBqJvDUZ1b8xKTaBpJVX592fKu5T+Xzyo8gc
         Uu5AY/mmgj/1ku4jmkU3Qpxw/pmlzxunusqZd5iGJSZMLto5sRXHDqBQ3dr6yTMs4nTs
         GMqCjbQ02KioM2ySnZA84t7MY9KeviFydS1Lnjr0NDX4FXTHz+M4wIAMPYpzWQ9oTkE9
         DqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538199; x=1796142999;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S/yEUI4+MwJL9iHwMgVBLQAZrhHUTmAwr9QyqtqrLaM=;
        b=Atqn/0RNsz7KM6JhCWnUfM8VoyYK076+pTCrkptb0UaH5Rdony8kbFCv1aBpEyZdDs
         MHBE6WDtLGGeKJob132a4752WY60NvXeO9x8x/IFeSyz6IttZHxMINYE5vXIhtc+GZLq
         8YNAbrGt2QFw/40wKMbR0mngbdY9Ddmy7LhA+uE9NUuepcMT25mWKOAzI46nxDTvbtcf
         ijr/VCtAsefO/VMDffxmMXWci99JU1yqfDL4V2ap2KkOTUgILajtRbnmX/WYwjT6PSmg
         Tvs2YatRVaj3Lb93auSMPWwjOtaA883euaDEm9ks8Q/8c8k1f0MIi6XdkebBthcfe1uL
         EHOQ==
X-Forwarded-Encrypted: i=1; AL+hErH9vn4mP0LbvwlAVzdWQP0zK9ljcK3bwFdwnakN2Mgs/ovFi+0wBiLjS7dpfFd6nJLqRRMVJYMS0aoMq04=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DrtkVYjbfYtbguRM66vlIGAKPoAoPUX4jO0JA+A7SX5mRT8bt
	DqhdTyb5VtGxH/48jcbc4PnEVWYaCyBc4RWAK3WmpMSdaXjlI+q0+BSi3ayQ5UdnogS/BkE53pf
	xRf9+QsrGv/1hfhCpo1HFB6vUO918PCEVSJ5jR3v9Qg==
X-Gm-Gg: AZFdTZetxpV25t5fIqHU/hTqigN58l4LCgDP6Kl3vIIn1hg0D4E/oP8BpDpdGkofjp1
	IHVPuhlMpsea+dazTnrC3AU9cHwJ2bdRqNxZnT/R3OL3bf3Mtv6ofgPfegadpwStxuCYSqiMGDl
	hgE7/AEiAQP7p0VnmbN1fbQKexxniVMcGaIfEVxA3deiXaADLoq4cvQ946MRWP+YGA4A1nhudb/
	F8jXBPdiu1uR41/44y/NfFMWDf1S4bDkZkUwqtgOTR9uG3XyvkfAGIMNPU0mBkYTgb/+TSf4yF4
	+YEmtzsmNU28uGpFQxOZwq8o4tK474dveM38fcbaCViaIhbONW0xsh0F5r03PKdcecPNz35p9mf
	tqOXc2SmNUvMTOpwBT8podYc1UIcN/iqE2gu9whHZkThaL/06BzHhoPe8th5cHTfyobQyHw==
X-Received: by 2002:a05:6402:249e:b0:6b8:7a44:7fa9 with SMTP id
 4fb4d7f45d1cf-6ba37ecb000mr10607634a12.36.1795538199406; Tue, 24 Nov 2026
 08:36:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124155107.358643-1-keisuke.nishimura@inria.fr>
In-Reply-To: <20261124155107.358643-1-keisuke.nishimura@inria.fr>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 24 Nov 2026 17:36:27 +0100
X-Gm-Features: Aa3M54pQEXmZRvL-pRC5Pm9opvR9WNVU8kklVa7owx1yoMuUJUe9QKX5POns-LA
Message-ID: <CAKfTPtARqb5VW0LBxDjGK6cZV7+6Ba4EsjchEMjqO6L2PkiHHg@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: Don't pick recent_used_cpu if target has no
 LLC domain
To: Keisuke Nishimura <keisuke.nishimura@inria.fr>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org, julia.lawall@inria.fr, 
	jean-pierre.lozi@inria.fr
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 16:59, Keisuke Nishimura
<keisuke.nishimura@inria.fr> wrote:
>
> select_idle_sibling() can return prev or recent_used_cpu if they are idle
> and share the LLC with target. However, cpus_share_cache() returns true
> for any two isolated CPUs because their sd_llc_id is never set and keeps
> the initial value.

Are you sure that's because their sd_llc_id is never set and keeps the
initial value? Or it's because they are in the same llc_mask() and we
use the same sd_llc_id for all CPUs in the same llc_mask ?

Being able to set a dedicated sd_llc_id for isolated cpu seems the right option

>
> As a result, the original implementation can move a task between
> isolated CPUs.  Consider the following situation:
> * isolcpus=1,2
> * recent_used_cpu=1
> * target=prev=2
> * affinity=1,2
>
> When CPU 1 is idle but CPU 2 is busy, select_idle_sibling() returns
> recent_used_cpu (CPU 1).
>
> To prevent the scheduler from moving the task among isolated CPUs, add a
> check whether target has an LLC domain.
>
> The path for prev is not impacted, because target == prev if target is
> isolated. Add the same check there for consistency.
>
> This bug was found with the help of verification using Frama-C.
>
> Fixes: 32e839dda3ba ("sched/fair: Use a recently used CPU as an idle candidate and the basis for SIS")
> Signed-off-by: Keisuke Nishimura <keisuke.nishimura@inria.fr>
> ---
>  kernel/sched/fair.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index da0d9e19c457..6314ff4c2f99 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -9151,7 +9151,7 @@ static inline bool asym_fits_cpu(unsigned long util,
>  static int select_idle_sibling(struct task_struct *p, int prev, int target)
>  {
>         bool has_idle_core = false;
> -       struct sched_domain *sd;
> +       struct sched_domain *sd, *sd_asym;
>         unsigned long task_util, util_min, util_max;
>         int i, recent_used_cpu, prev_aff = -1;
>
> @@ -9175,10 +9175,13 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>             asym_fits_cpu(task_util, util_min, util_max, target))
>                 goto select_smt_priority;
>
> +       /* NULL if target has no LLC domain, e.g. isolcpus */
> +       sd = rcu_dereference_all(per_cpu(sd_llc, target));

if sd_lls is null, can't we return immediately as there is no shared llc ?

> +
>         /*
>          * If the previous CPU is cache affine and idle, don't be stupid:
>          */
> -       if (prev != target && cpus_share_cache(prev, target) &&
> +       if (prev != target && sd && cpus_share_cache(prev, target) &&
>             choose_idle_cpu(prev, p) &&
>             asym_fits_cpu(task_util, util_min, util_max, prev)) {
>
> @@ -9213,7 +9216,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>         p->recent_used_cpu = prev;
>         if (recent_used_cpu != prev &&
>             recent_used_cpu != target &&
> -           cpus_share_cache(recent_used_cpu, target) &&
> +           sd && cpus_share_cache(recent_used_cpu, target) &&
>             choose_idle_cpu(recent_used_cpu, p) &&
>             cpumask_test_cpu(recent_used_cpu, p->cpus_ptr) &&
>             asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu)) {
> @@ -9233,7 +9236,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>          * sd_asym_cpucapacity rather than sd_llc.
>          */
>         if (sched_asym_cpucap_active()) {
> -               sd = rcu_dereference_all(per_cpu(sd_asym_cpucapacity, target));
> +               sd_asym = rcu_dereference_all(per_cpu(sd_asym_cpucapacity, target));
>                 /*
>                  * On an asymmetric CPU capacity system where an exclusive
>                  * cpuset defines a symmetric island (i.e. one unique
> @@ -9242,8 +9245,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>                  * SD_ASYM_CPUCAPACITY. These should follow the usual symmetric
>                  * capacity path.
>                  */
> -               if (sd) {
> -                       i = select_idle_capacity(p, sd, target);
> +               if (sd_asym) {
> +                       i = select_idle_capacity(p, sd_asym, target);
>                         if ((unsigned int)i < nr_cpumask_bits) {
>                                 target = i;
>                                 goto select_smt_priority;
> @@ -9252,7 +9255,6 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>                 }
>         }
>
> -       sd = rcu_dereference_all(per_cpu(sd_llc, target));
>         if (!sd)
>                 return target;
>
> --
> 2.34.1
>
