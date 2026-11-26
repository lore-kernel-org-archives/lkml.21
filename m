Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795692385;
	b=v97No8/gawWYOAanESSVFF8LC2xvnkSrvynmoBVQN4WlVmUq3BmkP1HhARsY916SREmS
	 INnu2ILgK/f68uVCXAvf+ncaBWXCoTAk4EaYzqlKHYLnYUGNNiOeFD42ukruIcE3AxW5d
	 YotrnEHVbV1/+3E0k96yORnzZ7HhHIQfUa9jB6KQxYAOy3/XPefUH0u7o9DjGAH6aN17H
	 Os4s3xtZ6tNNf84EPdyKuzSrN0TsQIZdnLMq5NtSIMYWn1wkMXHzmczxmdFlX/8pugYO6
	 q4TEyqXttxH/z6pggM8WW1ZmjVRkYr8OWkU16gIHfzVdvdbRsNMFkDt9VJ0lfBed+2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Zl3AVts+WLTukpMUzpB0lw/KP0VgqYCXGhFKIV6oqPc=;
	b=MuTNWVgu0YPCxsBO6+Pe1g9PDLUJdydGadnY1SttNgXeY9KkJjnp7DPXy+vv+LN6EUbN
	 uV5ihKfP2ubmtzxuLNFJ1ceQ+07X09KEU3YgBMWiWun7G8Gk13K/y0lVGBtRa7njPB7yd
	 nfIKCGO4dGNtWa3aDLrYK9Khwdg7VGUSwJQwPEw5gCtLVHj9HYxzltH7LdM9WkTZIEjQl
	 7GNBSKa6PAb8mquvGzLChTLUuI88nTxIc/swYRAKiblI0df50HvXif3FfzPGT83EM5yvK
	 R1Hf76SBoiIgiqDpUss2upm3iAuDsoemNiaplzyYNkVSVszaZv6pjFLh3S+inNBUIVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m9kbRNAz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A483606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A483606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m9kbRNAz
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b894d9a075so7648349a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:26:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795692383; cv=none;
        d=google.com; s=arc-20260327;
        b=ns9YyNBXn3odCGEY4k9ISALLtAGZExUKqX2smB+0UjGP7F3w68FUceOQFIYTs+9OD+
         HXhqtCpz7fkCdHh53AyoqlHDJK3myva6EmhqPwN1BVmEwgeorXdOzAGmNbwmDucqlglX
         ZwEmHTEW5JXLnnUxr2PcPPZ6LmePYSjukUIRaPYfYyt4Zt0hDJHZr8/FCc7+YQa2epSe
         NE1jEmfifkgZX9GLutzlY/6lob+Sl5Hq8u325UACZBN0U/IPbR2GelhxCnB6FpiAgGAH
         Fis3J6RQzhIKhfiJbJIHj84wFmLYdY0C46MeMind5jLThR5Z/i2KKtvJ1XBMzconuIlx
         r3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zl3AVts+WLTukpMUzpB0lw/KP0VgqYCXGhFKIV6oqPc=;
        fh=sAvVK2CVJSjFwiwhMiPjGPrGjPPweEzF9Xah4leS+Dg=;
        b=hMrsqbeLBecDBIhTFwpW8mhd4bpVwC1PAgyWlXRqVvyERG4PXZWLH2cZRWwibO3Qdn
         qX/7Qmw2bfAP2uw3aNqyX/aTPM9FCoGXw+3jq5MoVs9TQdy4vcj0+N5DxpCcRAYZSsVn
         1QCFiw04asNusC5hk4B2OCA9dWxziKXs8ACLlIT5+/Jb0auEWYXgLmMSIzt8IQdBiYCI
         x6VY0RVgxBQsKRxWeELKnr4MWrJ8ZovGLZfM0/XPhVI6Kx3rANTikOv4qPmQOGOBpDha
         AjkA0oTyERsvQHeUAU/sYKitkLQt4l0Cuw+l0Uy2JoEvkiLG/3c4YoPsvCC7OAv/+I57
         r3Tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795692383; x=1796297183; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zl3AVts+WLTukpMUzpB0lw/KP0VgqYCXGhFKIV6oqPc=;
        b=m9kbRNAzZEejeD4VzN/7Vd2mdv5kAVoNWEs8e0Am+s+DnSlgLFtbts8WP/20luJYDY
         mwuqgVmSGe1OyFtyZfnpaktjKst6FFTsi5mzfv1bsDFOkfZf3biG6XasphQ7PVot6TRH
         mGE/U1FgJQAlDK3alPT8l10ffuvgTEo0u40BOWnv8bV939O04aGUTBITYzaMMFIkWiD9
         VI8CTvzgiG34cS1T+cSo3FM0cTUzbr1bzTohf5Q1YfSjGtmajoMvlLUOOCXDm6eJJOa8
         SKcJr3Hq4yQ7Did1pJOEsuVwtzrgVasqfTs9Kt10G8GqRGu3gqrHwbWo4nnp68dQZjhy
         7A8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692383; x=1796297183;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zl3AVts+WLTukpMUzpB0lw/KP0VgqYCXGhFKIV6oqPc=;
        b=Yxjgkt+g7xu7Y19/f7ohT9GX5Z32hQ8UhHaZUbY43drIyeKWY46h9e0FJm2cNJfyBa
         dDzcRb6siOYu+qZQUkv+bo6bI2rSOJaKai233j3UFxhJB55EupgTPulQcajo+HgnrkNw
         2MOaSeKm1uHgbb4kovNMk4adrQfAzNSEiwRq3saUygjACW9eZp30JpRHNW+cNy8hPZs0
         ZXFrbP7+Bl5prBGhZ0lukwVTxskfq9vY3g9CoOE0NFMSBbiiHHX4vvTGlDXGcvhRJS7U
         7ZLprIhTU7cnxIVIcQgMM8rBuiIbrcStMRDjQLFo+gCO02UQ0iUS3PTKt4mrrwj8mehN
         Xwig==
X-Forwarded-Encrypted: i=1; AL+hErHvBQcnrEhQZ3kqGDAfFjgmOO1vHWzIl4nsY/qy+YBvkAlcD+OACRt0g+AxS5D2J1RuF7EVCCvmn9AD7JY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K0VbEZDsUVV5NfYLEB4OfOc10XznZvclMgeKIr7EBpdYfb7wS
	YR2KSeLouNuCr/oCdBOkvogSzIaChvU0jCjzFxlqaJCMhVILb/Ci0woI/trU5tOCMunXIMSoMh2
	hoSwzQEXes1ttbFWUs9bOvEjXQFDmjRJ2LMTBLcFFtQ==
X-Gm-Gg: AZFdTZfR74DY0oJwjKOiaiQ3qf2KcslHcrDT+nUqTUjJsDCloGTXGbSwlhHsPs+fFcr
	KAHQzTeTo4zRF/cs8UjpFB01VZQQUYcxlAJks6qIOeuwnDp7UI20GfLhCmz9xAR+1bZPjf8RMlX
	HFkpB2fgX4kkrgnO0o4KuOMWqXUkqp08Kiv/aJQjRuLpIlR0TABO4tTLOz2Zu/5+FKkJCmvnRbR
	/2pYYLr0c8sGJEKJf0VTIim8JiWZE4AzlWh6PTWWjS5tSQQq02bWMO5wHvzOzWfWPx4FJ8XkOSL
	CegkZDRIbD/L68cXTyMcjpa9VEm0iqFrwSgEbibjRR22LbRW+UJCDeS0ZwjUEwOHjReGwCMJu0k
	TL9GWWrBfpp9PEOmgJ0RHC5giDBYn4d/V/Y4E2jLrVJhGJTRdlhKEgYX59rYtwwLTQGX/Gw==
X-Received: by 2002:a05:6402:4004:b0:6ba:6ec7:abed with SMTP id
 4fb4d7f45d1cf-6ba6ec7ad55mr11351355a12.27.1795692382773; Thu, 26 Nov 2026
 03:26:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125003653.1264087-1-keisuke.nishimura@inria.fr> <CAKfTPtBY=U5voby+_6=JErmsHoaXFqxYLFib6ESKFmO_pmGZyg@mail.gmail.com>
In-Reply-To: <CAKfTPtBY=U5voby+_6=JErmsHoaXFqxYLFib6ESKFmO_pmGZyg@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 26 Nov 2026 12:26:11 +0100
X-Gm-Features: Aa3M54oxip5CacqLHiV4Gd4cAnDizH_f15gSetaHyyylh0T5qW6I3uaNeBCU1TU
Message-ID: <CAKfTPtCaWVApT+6WAreKapk2wRCrXCngZPLt8oayuZT9cB1k+Q@mail.gmail.com>
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

On Thu, 26 Nov 2026 at 12:21, Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> On Wed, 25 Nov 2026 at 01:54, Keisuke Nishimura
> <keisuke.nishimura@inria.fr> wrote:
> >
> > select_idle_sibling() can return recent_used_cpu if it is idle and
> > shares the LLC with target. However, it does not check if target is an
> > isolated CPU where the scheduler should not move tasks.
> >
> > Consider the following situation:
> > * isolcpus=1,2
> > * recent_used_cpu=1
> > * target=prev=2
> > * affinity=1,2
> >
> > When CPU 1 is idle but CPU 2 is busy, select_idle_sibling() returns
> > recent_used_cpu (CPU 1).
> >
> > To prevent the scheduler from moving the task among isolated CPUs, check
> > whether target has a sched domain before searching for an idle CPU.
> >
> > This bug was found with the help of verification using Frama-C.
> >
> > Fixes: 32e839dda3ba ("sched/fair: Use a recently used CPU as an idle candidate and the basis for SIS")
> > Signed-off-by: Keisuke Nishimura <keisuke.nishimura@inria.fr>
> > ---
> > Changes in v2:
> > - Return early at the beginning of select_idle_sibling() if target has
> >   no sched domain.
> > - Instead of `per_cpu(sd_llc, target)`, use `cpu_rq(target)->sd` to
> >   check if target is isolated or not. A CPU might be in an asymmetric
> >   capacity domain, but not in an LLC domain. In this case, returning
> >   early based only on the LLC domain would miss the chance to run
> >   select_idle_capacity().
> > - Rewrite the explanation, because sd_llc is not the main issue anymore.
> > ---
> >  kernel/sched/fair.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index da0d9e19c457..9746fc55241b 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -9155,6 +9155,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
> >         unsigned long task_util, util_min, util_max;
> >         int i, recent_used_cpu, prev_aff = -1;
> >
> > +       /* Do not search for idle CPUs if target has no sched domain. */
> > +       if (!rcu_dereference_all(cpu_rq(target)->sd))
> > +               return target;
>
> After more thought,  You have to move this check one level up at the
> beg of select_task_rq_fair().
> Something like:
>
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -9979,6 +9979,11 @@ select_task_rq_fair(struct task_struct *p, int
> prev_cpu, int wake_flags)
>          * required for stable ->cpus_allowed
>          */
>         lockdep_assert_held(&p->pi_lock);
> +
> +       /* Do not search for a CPU if prev has no sched domain. */
> +       if (!rcu_dereference_sched_domain(cpu_rq(target)->sd))
> +               return;
> +
>         if (wake_flags & WF_TTWU) {
>                 record_wakee(p);
>

And this still doesn't fix the case when cpus are isolated at runtime

>
> > +
> >         /*
> >          * On asymmetric system, update task utilization because we will check
> >          * that the task fits with CPU's capacity.
> > --
> > 2.34.1
> >
