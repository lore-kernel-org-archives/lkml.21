Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795692115;
	b=WINjo5JVfwjih3+pBAt+SXDCNdPGD/fNaCEJEVcP3Sn0XRiUBso5EhwInBJ6FjFgynXf
	 Hh1Pf7wbxqfmLd32VMVJCn2qxd2SIPyo7NcCVWRgjKazjRx5T712R35+m+wo6XATzNMch
	 17wl33LFjhL6om+eJEJgClB2xNxDHXA2T+PSdBpSPDR3O55lF5wFXTTKrnz7PLgBFEP1c
	 VjvO8pfsjFuNOIPczA3TBeV9pke3csR+WKkcUq8jZNc52YsZ6jss6aSnisR5VbNpHdCPx
	 3z5fgPYru+VbD9nKfbTR0Dz/DvC0VyYljZNc7gixDL8WR+UPJvMODaCGIPSfbXRjHQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ESOad2QCV2baf5M2gtMxUgkYlEGMjsbl0P5SkwZ4o70=;
	b=H9YP1SHpvwjK+BYJPJamppBxKUOKIMqBDVhquZfpy0c1cyhAkoU/gpOTryZp5u0x6hUl
	 +/NJ64CU2lHu1QvZl8mPL5cEBg74FLKE9pLK9YhXrFlCaRYuP/8Zi5gtajkZG2LkzF1Lo
	 jfcPiCxNwNHR0cr403KAaHO9CMeWbl0zKYbLSnwQBjq66XiSj1Op4BwSmHt8/MCP+pX5d
	 XvL4TAwu++QJHQW2ou8L2ELh1BhnNAyWsesiFF7g7riLYBJVoqCc1clTXpvYZktv5bDNX
	 Jd7akYcDTFBC9bdo2kJSkdgOzWQVacyizpoYASEPswKgtGoBDXN3GeXJGXBBre8G1Wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JExpFe+c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432D1606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 432D1606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JExpFe+c
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6bb06dc1fd5so4039612a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:21:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795692114; cv=none;
        d=google.com; s=arc-20260327;
        b=UqXM2cfoFn9CLhcRccT/x70tO5zaDy81+JqXydMBtgF2oWfa4ufNASPxhmCNSguDh/
         zQwKJhBd1Sc490FD5Cog/AwDOQPkft1Cd8vxhtQO21eUj+B3AS8O+dxMCFxytEd2PveT
         UhmNFhGkyAfOT+vQJ6bSaQWkjfz72NFNc1rX6BS/ZqSOH1Xa8s/0EyarqX6bi2ssPW8C
         J+x/A0Qz9BkJhyJYzbZ9/bVzft7BsgKymHuYyNSLsf6k9wFRt/AOf2+bNXzyF2UJ1Zuf
         6dZp6gBUHAtRHxbbDi/Fpz//R2Pts4CvhM+18Wqb7rjCbdfcOrYdSFGWcZnKYK2qPkMn
         ZQrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ESOad2QCV2baf5M2gtMxUgkYlEGMjsbl0P5SkwZ4o70=;
        fh=sxQCuOqzAhsCz1NOiv/B3SGYuuvvpAUIrLLz+/KfzsA=;
        b=qAkMspowOTc6WsIojNVpbazBFRyshR/SofBImgsMYsLrF2dmY03zCAmbyAG0+QdSHs
         eeBgQmEjHLfhd6uof2dTfLEByFmhCNbKoi3JDpDHcDr41stlNiiJpbYlspC3zMjvhMj7
         iCvWD6rOGay3kJJ2OM/gzHLztJVyiH3P9nXtFj5icmPLoda027aJuK2dUUMIdD4Ilaw2
         rDVw1c41tPVKAH1mo2ng9OnJ8/o1OQZ4NKtAIyTy+y6sguOzpZXomJwaYvq3Vzc4ZBMa
         Z89ttjKrZm1AulBmsLziOUQvUQehiLeLkr8snZemQKYW1/HMl0zK7ml8SOAwmuiinnXV
         98+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795692114; x=1796296914; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ESOad2QCV2baf5M2gtMxUgkYlEGMjsbl0P5SkwZ4o70=;
        b=JExpFe+ca4CXwjqVf7bSMb7bDwmGaSvpGo0MvHaeTah3Kixk1fIup51p4EwCXmmbf0
         qGHSMAGncL1lS0vCtcjKTUzLla60i40LbLiTwTP+8903wNCrG/uAjMu9YR+gqRW7XFdB
         oy0sJThSkkMh6j5KqkLsId5FDf9CrW1uy/O8mJ2BzgT69Z8lriJ7MtKnUM65fY2LUjzj
         jdgn3soOx4yeou+PEI0NOdkuU4fcBzCpBLRFm6rjom5sVin2WnVmGTde18B597dsli7B
         WgZ7JTorZ/39r7SMHqr9MbkERxkVHGqXJU1+Ro86n1vFjFQhId4fekZ6/qah69EAnt3G
         8iXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692114; x=1796296914;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ESOad2QCV2baf5M2gtMxUgkYlEGMjsbl0P5SkwZ4o70=;
        b=ncOfZz0teWRv/Qd3NfAjJ71Q6jhd70LGecXqH3mTxHE00vvOHARmVQOpLyjA1AO0eq
         YTZG1n4uHiq31NuQ4F+SwVudF12Q1qBcvFjPpmoRFncPV5xj4BFUeBmNQd+zC75i8FQh
         xX800xZuVjQDGS0CdcnJ8PWJNReK1gIrJ3NFFAZxiD1vsLO8ls3WtAMBqkfLOhbPRbKI
         bR6JWMyyymQe7EslZOdCJW0DyRVgdjj/37dZMQNDpCnDWm6ezHLb43Npd7UZGF1L5tMM
         ovWUpQqqYBpYcggfCOoBn4F9/YqmyOYfXBIML0CbswbutIgnznnLnMzbqUTGco15MxqZ
         OXDA==
X-Forwarded-Encrypted: i=1; AL+hErHZua7QfEp8MvGD8eBWqqRQniFnNCj4/UyHgUXhVOXVLOfxhpiFjELqY8Zxez/3n6JDNaa68mNt1SLxzwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Rm/niP3jdFlaROEuhL88yu745UrfRciUr3YdmHaDDxUEX/y0K
	7MBNLvbIxWP6Shg33VSER5eXEIlTns0jV2qCVRqNUO39pGnOXCWgS+MICOMIM6fAa0MEwCmI/ew
	XauSNnIx3AghH7cK1GbsiXN2BqaAxPlMPJxhU8XUDyA==
X-Gm-Gg: AZFdTZd7WUnQV4WGzcfxZfJ8qiucx+mjOYv8XaaUDAp9UBSOgCbkVcS6qFPY4eolgIw
	XbnUJriSsEo6tUcN/wlsqESwbhhAuFPzXuIJCzLW0mOUrwMT9M05ncUalzvBzdeDEYr7iYZuz99
	+hCxYqWq/VdsA+4BuM53jFZUfdRc/8QLMLj4H3hJpoNhfCscdxaMmQF8ROQHaSYbuljBkpi1gkJ
	vCf3PBCPf6gaeGQFNDqG1cglYnYT3cS9j4kc9fzVLymk1wUL9nS/v0J1112MQuHsvdaGn1MLwtK
	JRZL6jkHuKwa1VcminfH9dIs+JZJK0/WkvN5ftgdNAnAqks0poGkP1OwcrFMpR3WG6w+J2gljYc
	Q/RKQZSA5mZVlmPGr0Pm2BXl2nO6D+7lI4OWWGkFZEvAYshxuEW5j0D/jHL7rvv7Uiz1kOQ==
X-Received: by 2002:a05:6402:2745:b0:6ba:1347:5cf with SMTP id
 4fb4d7f45d1cf-6ba37cc07e6mr15105847a12.2.1795692113559; Thu, 26 Nov 2026
 03:21:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125003653.1264087-1-keisuke.nishimura@inria.fr>
In-Reply-To: <20261125003653.1264087-1-keisuke.nishimura@inria.fr>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 26 Nov 2026 12:21:41 +0100
X-Gm-Features: Aa3M54pi_qrdnqjzJTTIR8qBTxM08RTXSfVEdv7cxNtlX2ONePizGBKP0BPpNFc
Message-ID: <CAKfTPtBY=U5voby+_6=JErmsHoaXFqxYLFib6ESKFmO_pmGZyg@mail.gmail.com>
Subject: Re: [PATCH v2] sched/fair: Don't pick recent_used_cpu if target has
 no sched domain
To: Keisuke Nishimura <keisuke.nishimura@inria.fr>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org, julia.lawall@inria.fr, 
	jean-pierre.lozi@inria.fr
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2026 at 01:54, Keisuke Nishimura
<keisuke.nishimura@inria.fr> wrote:
>
> select_idle_sibling() can return recent_used_cpu if it is idle and
> shares the LLC with target. However, it does not check if target is an
> isolated CPU where the scheduler should not move tasks.
>
> Consider the following situation:
> * isolcpus=1,2
> * recent_used_cpu=1
> * target=prev=2
> * affinity=1,2
>
> When CPU 1 is idle but CPU 2 is busy, select_idle_sibling() returns
> recent_used_cpu (CPU 1).
>
> To prevent the scheduler from moving the task among isolated CPUs, check
> whether target has a sched domain before searching for an idle CPU.
>
> This bug was found with the help of verification using Frama-C.
>
> Fixes: 32e839dda3ba ("sched/fair: Use a recently used CPU as an idle candidate and the basis for SIS")
> Signed-off-by: Keisuke Nishimura <keisuke.nishimura@inria.fr>
> ---
> Changes in v2:
> - Return early at the beginning of select_idle_sibling() if target has
>   no sched domain.
> - Instead of `per_cpu(sd_llc, target)`, use `cpu_rq(target)->sd` to
>   check if target is isolated or not. A CPU might be in an asymmetric
>   capacity domain, but not in an LLC domain. In this case, returning
>   early based only on the LLC domain would miss the chance to run
>   select_idle_capacity().
> - Rewrite the explanation, because sd_llc is not the main issue anymore.
> ---
>  kernel/sched/fair.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index da0d9e19c457..9746fc55241b 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -9155,6 +9155,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>         unsigned long task_util, util_min, util_max;
>         int i, recent_used_cpu, prev_aff = -1;
>
> +       /* Do not search for idle CPUs if target has no sched domain. */
> +       if (!rcu_dereference_all(cpu_rq(target)->sd))
> +               return target;

After more thought,  You have to move this check one level up at the
beg of select_task_rq_fair().
Something like:

--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9979,6 +9979,11 @@ select_task_rq_fair(struct task_struct *p, int
prev_cpu, int wake_flags)
         * required for stable ->cpus_allowed
         */
        lockdep_assert_held(&p->pi_lock);
+
+       /* Do not search for a CPU if prev has no sched domain. */
+       if (!rcu_dereference_sched_domain(cpu_rq(target)->sd))
+               return;
+
        if (wake_flags & WF_TTWU) {
                record_wakee(p);


> +
>         /*
>          * On asymmetric system, update task utilization because we will check
>          * that the task fits with CPU's capacity.
> --
> 2.34.1
>
