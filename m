Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795699872;
	b=lp+sPJ3hCrIIlmR/2za0TPkSycAs0Y6cgEuX91QgjjphDfYWyVIu1XUSgHIYrCsBMXHA
	 F2FkBCUZgy89RbHCvx8kB3920IfmjWL6gGY4oYf1LJjeaNuBWuZpuVFhrVBuaOrwQ5Kjm
	 k0WT3X1NlwUrUka6Vz7vmbsWFqpJn/6uKv+BbDsVh0Pb9rRZeCfekCYJiuAnbwTlL0A8e
	 V4R3MsN9yGOxoB8crpNR7ncdPblF5n+2zzKcxq2eHi0x50RtH1Fztmk/neYPouer3E3AM
	 eFbo/PqiNCnYosfT5N6XGE9tXgPC3/elH5ejGIZZCXNe7tgeFcLE47P2E5qO9svxXAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uS1w4Rd5nuvuC9FkPk+TP9nuwffSvQOGwCuNRy+qt9M=;
	b=HCBwdshxR/x/RRR+BncFlG1ujTS2av+aaKPTtFQRMj73TSkknMlDhBSH7djkrfoD5WpP
	 LyQAXDKvOAtuLhTbxdFtvkuZA+oUqx/OGi5QCCN2wJTvyaYPekQHydgMCGU9Uxb0G8ljO
	 FSJIVRFsl3HRxndMWemh5XPXkf2SQm0hYjulDRz77WYjmpHFPI/8vKbET+0uwAZDCKh7s
	 SABzAQNH0oxJQHyhGm8hU1jLHG+J9pV6ER8Qj1Uxx8hnyQdCl2gWIa9fkiBUXsM5flaTw
	 rlWRPWrSBZCMt8JC5gfxladi3vGw+rcehIByacElb6/35Vur410wAYG9zPzbYrFPwrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dcoh8iYS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863F9606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 863F9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dcoh8iYS
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4395d31228so1197598566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:31:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699870; cv=none;
        d=google.com; s=arc-20260327;
        b=EVlEPtPIfvVvpLPq9y3Im46od/OfEuvTCBIIUT4+bDpkkaxCk+XBIA6FpBplSi4F1O
         qYHTNeW600IXASybvxz4YQb4J8GFa2tWytSg74Qz6I2UlocDRNUAU0CVeIw2gBHFy1uw
         ccAPwigejmiji5d5q1sk31/rZ9i6ir0f9qgeUZ2YfOJKlgHiCBrJuFvUq7bIOu1PClqM
         PY4xUGF16AbGuIdeTFaZxACsrp2KKtcIfyK6blTdwHjOefnolNA0B0Dc9UalLh8OsWIR
         qb7G8XqGtglf9pIkwjbldjXzojSK8KaRo3v9OH+fIS8SvP6qXjWcK2/e+lyUyenfqkU/
         mowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uS1w4Rd5nuvuC9FkPk+TP9nuwffSvQOGwCuNRy+qt9M=;
        fh=3t5hENwuS9O8R+UqdJJ52VEooRutvyNAY9wSCTVED/E=;
        b=AgSrugNi5bSKaUhre0C9vFrJvxsfz0OLPblbZKCd/D1/w7N6mlrrgG+07DZhIVWtbu
         aqxjAzyPwP+XaJ0r4SPhrXqC19xQhbMAPdbNULVBQIuTe3kGwnq8uIMGCX0D6VWyZDVm
         amQZS0YOkW0Ef4K2Og3MOZX9uz3k7/pAJyJt0sjpM6gR/oCI+uRg8vYGJB/KZ7fdZLQB
         mthNaozqnjDg9MR8DRf2nnNoS6OOpurlJCTZdlGBoHf7pVF7I3qOLTob4MY7gxJdBlBw
         fAwCmstl3W27DBhHiyu8oGqw7NJB/Jt6cjhKYwbqtjwecSjf7pypMpIAhyZgioS4Jk5q
         g/WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795699870; x=1796304670; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uS1w4Rd5nuvuC9FkPk+TP9nuwffSvQOGwCuNRy+qt9M=;
        b=dcoh8iYS0P1CCyVwUqXRAjYqG7PuhZzquwJdA7CSZmv7ltgvjUfC19nubtptcPRHFQ
         E0R/oB2NJelmkA+pyFBua4ZbyhRWsLO3YBxY+J3e1QXnChxee4ZMEIzsoNFaw2dKCE6F
         JdfBJvQ3RAkJnUcj+lUIPbncJUInYvI0LEdSaE39BucMTpuMC3daaGKTg7kXwCTCO0qF
         x2miZNTvquMGZmNp7fboyZla+jR1VUlRWxxovxtdwsaggo6ynUIDOMi6mql99ZnQmNXV
         Fzntyz+do/SpQDY3tv6KThKwzW8PssolBoJca/OmWStzKbyvScDv3rer4iMOBRaveIeX
         Xdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699870; x=1796304670;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uS1w4Rd5nuvuC9FkPk+TP9nuwffSvQOGwCuNRy+qt9M=;
        b=ygFW5HOB/fyjyrG0coT3JdZnV+NtVtM355iKXONlqx+3cEEfH7wtL/kpk8M7CJ/Bkx
         t4vWxLcwdMV3WczGAYoo5bHPc0vwxa38RXuGoo4yXC7qk1iOUzUOkbNSszLjWgg02Nxn
         A7aQv4GulfAo4NlpL9U2G7njNTamWgB5UgFjbepqypXu2LJd2j2BaDgew4joLXk3jmKt
         2htxpkWBFkOFKr6U/X3kN/H0hSftMDTwWw7UFFFZvA+GrrcoWaG5dRDFCQ7bYXJKPW7t
         147/ceqTUTBYGRvkNHhEdq71lxxRPh5B2oLpTRDwGcRUBVhOArcvEXGaTPCIDA3maZ4X
         k0Iw==
X-Forwarded-Encrypted: i=1; AL+hErE/JWvTaW7e1qQ6Hi3+6qmj2wQSAEZ+O7ML4mDICkZ8Ss9h4kBTbgWasR97hOitN695VihDbCRWpa5X7og=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AjTRfluhEXT/G+bgoaLWbxckFwOH3iYPc17HsBx5FpqqS/AS+
	ci0XP8XsSfsiploJyK1MIrNFOq3n6EaM3MJWTWBO5RaBNTPocYfFn2myTvWuyh/rPLGZI9BvDjs
	Y1TCom4aIJS/ZX17ErF92SKHgN4tjyAwAUda9qECfXA==
X-Gm-Gg: AZFdTZeWwo/3HLDo0SlCYgM+Gs1Pt0+9rdiTe32maFvn6tQ+Ai75x9huQblS8uQtAUd
	fbaM1hN/BZNG5j6RtVQuniLYUgptjIbhaWJJ2v21/TkKljlUPVb5S3mM+InqdAckPfj9Le61Rpj
	CpRnERCXTS9rnqF2FBgtKJR7oCmj4BdEY+Mgl9md+WooTceoFVW+OG3HRhFJXcfOsuzf6YHlbMu
	WnVgCXxo8h9j3cLlS07VvS5imDSr4izM46s83rg+mX+aNQaod48QULBUz2WTpmhhsYpcI/nHrO7
	NUY0THb0FHYKmr+WJ45k0vaSKIOwFZiKgqCz99VxPgxvkZ8EZZNtqQkUsfUiWs6mSxvb4mb/HPK
	65ZVCpGwh8Abq5IefdKranrf2pn0SFb3atD0sN1LV3Kl5I/umQgNl6TV3cuFkYX3ERgHNzCIKZa
	oRSR1hmzG0/GhOqpQ=
X-Received: by 2002:a17:907:4d0:b0:c51:f6:216a with SMTP id
 a640c23a62f3a-c513aaa8eebmr1436117366b.37.1795699869221; Thu, 26 Nov 2026
 05:31:09 -0800 (PST)
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
 <CAKfTPtBY=U5voby+_6=JErmsHoaXFqxYLFib6ESKFmO_pmGZyg@mail.gmail.com>
 <CAKfTPtCaWVApT+6WAreKapk2wRCrXCngZPLt8oayuZT9cB1k+Q@mail.gmail.com> <8e3f3ce6-2194-489a-9f30-91eb71f5e33f@inria.fr>
In-Reply-To: <8e3f3ce6-2194-489a-9f30-91eb71f5e33f@inria.fr>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 26 Nov 2026 14:30:56 +0100
X-Gm-Features: Aa3M54oNyondioRZOzHIz0CRG_A7q0SoqSUIn4pNsKe3Im_92mpdWlXDoKg73pY
Message-ID: <CAKfTPtDyFQ=dnSDiJZvoN46QioSfx2esHAjqScOOMrRevU+vGw@mail.gmail.com>
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

On Thu, 26 Nov 2026 at 13:14, Keisuke Nishimura
<keisuke.nishimura@inria.fr> wrote:
>
>
>
> On 11/26/26 12:26, Vincent Guittot wrote:
> > On Thu, 26 Nov 2026 at 12:21, Vincent Guittot
> > <vincent.guittot@linaro.org> wrote:
> >>
> >> On Wed, 25 Nov 2026 at 01:54, Keisuke Nishimura
> >> <keisuke.nishimura@inria.fr> wrote:
> >>>
> >>> select_idle_sibling() can return recent_used_cpu if it is idle and
> >>> shares the LLC with target. However, it does not check if target is an
> >>> isolated CPU where the scheduler should not move tasks.
> >>>
> >>> Consider the following situation:
> >>> * isolcpus=1,2
> >>> * recent_used_cpu=1
> >>> * target=prev=2
> >>> * affinity=1,2
> >>>
> >>> When CPU 1 is idle but CPU 2 is busy, select_idle_sibling() returns
> >>> recent_used_cpu (CPU 1).
> >>>
> >>> To prevent the scheduler from moving the task among isolated CPUs, check
> >>> whether target has a sched domain before searching for an idle CPU.
> >>>
> >>> This bug was found with the help of verification using Frama-C.
> >>>
> >>> Fixes: 32e839dda3ba ("sched/fair: Use a recently used CPU as an idle candidate and the basis for SIS")
> >>> Signed-off-by: Keisuke Nishimura <keisuke.nishimura@inria.fr>
> >>> ---
> >>> Changes in v2:
> >>> - Return early at the beginning of select_idle_sibling() if target has
> >>>    no sched domain.
> >>> - Instead of `per_cpu(sd_llc, target)`, use `cpu_rq(target)->sd` to
> >>>    check if target is isolated or not. A CPU might be in an asymmetric
> >>>    capacity domain, but not in an LLC domain. In this case, returning
> >>>    early based only on the LLC domain would miss the chance to run
> >>>    select_idle_capacity().
> >>> - Rewrite the explanation, because sd_llc is not the main issue anymore.
> >>> ---
> >>>   kernel/sched/fair.c | 4 ++++
> >>>   1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> >>> index da0d9e19c457..9746fc55241b 100644
> >>> --- a/kernel/sched/fair.c
> >>> +++ b/kernel/sched/fair.c
> >>> @@ -9155,6 +9155,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
> >>>          unsigned long task_util, util_min, util_max;
> >>>          int i, recent_used_cpu, prev_aff = -1;
> >>>
> >>> +       /* Do not search for idle CPUs if target has no sched domain. */
> >>> +       if (!rcu_dereference_all(cpu_rq(target)->sd))
> >>> +               return target;
> >>
> >> After more thought,  You have to move this check one level up at the
> >> beg of select_task_rq_fair().
> >> Something like:
> >>
> >> --- a/kernel/sched/fair.c
> >> +++ b/kernel/sched/fair.c
> >> @@ -9979,6 +9979,11 @@ select_task_rq_fair(struct task_struct *p, int
> >> prev_cpu, int wake_flags)
> >>           * required for stable ->cpus_allowed
> >>           */
> >>          lockdep_assert_held(&p->pi_lock);
> >> +
> >> +       /* Do not search for a CPU if prev has no sched domain. */
> >> +       if (!rcu_dereference_sched_domain(cpu_rq(target)->sd))
> >> +               return;
> >> +
> >>          if (wake_flags & WF_TTWU) {
> >>                  record_wakee(p);
> >>
> >
> > And this still doesn't fix the case when cpus are isolated at runtime
>
> Thanks. Moving the check to select_task_rq_fair() makes sense.
>
> Could you elaborate on the case where CPUs are isolated at runtime? I would
> expect rq->sd to be NULL in that case as well?

llc_id has been set in case of runtime isolation. So any reference to
this newly isolated cpu that is saved in a task (p->recent_used_cpu as
an example) waking on a non isolated cpu, sharing same llc_id, can
match the cpus_share_cache() test and select_idle_sibling() can return
the newly isolated cpu.


>
> Best,
> Keisuke
>
> >
> >>
> >>> +
> >>>          /*
> >>>           * On asymmetric system, update task utilization because we will check
> >>>           * that the task fits with CPU's capacity.
> >>> --
> >>> 2.34.1
> >>>
>
