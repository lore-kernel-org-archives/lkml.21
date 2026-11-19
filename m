Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100900;
	b=JcdIzjNzBauQ0duiqC5/fpmOgDR93gMaDSC19wz/qAfo2HHyL1Fs4nnPWkeHlDb5Y9VI
	 L7Fld+PahQF1Hn3xVgQHUnKg4IGDJbVUvCe2t0/neSasxhp9V11Jh4HPnebypvX++98oQ
	 7yS0UxBiK5tmPwTjnJylWjjo9myIh3SzXxWcJfl6YJQKJbvQczLzBi+jxhEsGDY3knaaq
	 cEOWRm1geuvxR/VtOCwEesV/pgB9tMilqEViLmhBcbBV8+X1U2ShzY++yPIm264DaJ8wd
	 G5XfDgy28RPkMaQpEU5kvx+dXRDHPAFBEbBdCdx3KVNbV41rJkEBibWdbxnsEuj3Wzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100900;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=OzaR6MIA1MeV7t/YPZ+I2O/JYesZsPQTU/oMUSdcRXc=;
	b=HtdL4fliOAZafqvXABUTJqU+zr+7j/wZIG9kOf+SAp3+4nnSCWJMO9wZprMxO7YKPCT1
	 HH0Tv2ItGM1hG+NyijhGAO76qmWK5G4jOUrmcNS4FuMBq7LyBnlREx+2qlxV0EMmpF6bs
	 a7bhC1a0YgPIKo+1/FWkyMlJmWxaIlljpjmuVpISv/NWu4WPr1Dz/PcWthHYs+GqkW6/u
	 wEOGDDopQKHxCpz+eWLk/l+uHYOFKrZsacb/7YYzU+1TdMUYdQ2TndCOFjydobImxtS5H
	 +z2QXSQcEWNq7mQbTvj9o63Dxq6apLUGzHvRxsLlV/SjBU/No79efx2nCIAE0Sqgcow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=YzgygdP2;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBA2606A7F0
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FBA2606A7F0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=YzgygdP2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OzaR6MIA1MeV7t/YPZ+I2O/JYesZsPQTU/oMUSdcRXc=; b=YzgygdP23H5UPCt9r801jpFWuS
	Lw2n8tZZm3kVkwTvgcebjmXsGfF8HeBlBo+xIidxK5Fl+MuD0XUTPHp/Kgknmqc1/iC71yBy1VenQ
	ozMeBODbThdEd4uF/HsAJf++j48uBq+TunLVvzMxvjAULIGgPx1mKT8q9HcfLlQWJKGTlbyu4AvQA
	jbkoC5tRPjh8xJlZnHkHwP6VPPGLoszN9Pm/Up8wx/VFj2VfQQDnrQEb/UCzuYeRdv5VTis7eM/t7
	AdxyrNQs0sHKNXAgmis0NB4PcNO3sbSh897HRG1THltc3Bp+761IgziOSzLU6wBc+lv4axDdqA9nq
	i6rQJQ5Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3kE-0000000HMzr-2359;
	Thu, 19 Nov 2026 15:08:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EEF7B30072F; Thu, 19 Nov 2026 16:08:12 +0100 (CET)
Date: Thu, 19 Nov 2026 16:08:12 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Mel Gorman <mgorman@techsingularity.net>
Cc: Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Seiji Nishikawa <snishika@redhat.com>,
	Mian Yousaf Kaukab <ykaukab@suse.de>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] sched/rt: Do not account migrate-disabled tasks as
 pushable
Message-ID: <20261119150812.GT2668200@noisy.programming.kicks-ass.net>
References: <20261113160655.2909479-1-mgorman@techsingularity.net>
 <20261117152026.GI1813469@noisy.programming.kicks-ass.net>
 <20261117152414.GG1922751@noisy.programming.kicks-ass.net>
 <av1q-2D_tdi9oNEj@techsingularity.net>
 <av7Pj6uBsSVAoxbZ@techsingularity.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <av7Pj6uBsSVAoxbZ@techsingularity.net>

On Thu, Nov 19, 2026 at 12:06:21PM +0000, Mel Gorman wrote:

> > > > Suppose:
> > > > 
> > > >   migrate_disable();
> > > >   ...
> > > >   schedule()
> > > >     migrate_disable_switch()
> > > >       // switches p->cpus_ptr and p->nr_cpus_allowed
> > > >     pick_next_task()
> > > >       p = class->pick_task();
> > > >       put_prev_set_next_task(rq, rq->donor, p);
> > > >       return p;
> > > > 
> > > > So any task that ends up in put_prev_task_rt() wlll have passed through
> > > > migrate_disable_switch(), which have updated nr_cpus_allowed.
> > > > 
> 
> Short summary, this assumption is wrong, nr_cpus_allowed is not updated
> in that path.


> That sounded plausible and while Steven did not explicitly say so, I
> think he agreed with you and it sounded believable to me but looked
> anyway
> 
> 	(disable side)
> 	migrate_disable_switch
> 	  do_set_cpus_allowed(p, &ac);
> 	    p->sched_class->set_cpus_allowed(p, ctx);
>     
> 	(enable side)
> 	___migrate_enable
> 	  __set_cpus_allowed_ptr(p, &ac);
> 
> Other than the assymetry, it looks ok so disable side for rt.c
> 
> DEFINE_SCHED_CLASS(rt) = {
> 	.set_cpus_allowed       = set_cpus_allowed_common,
> }
> 
> Nothing special, back to core.c
> 
> void set_cpus_allowed_common(struct task_struct *p, struct affinity_context *ctx)
> {
>         if (ctx->flags & (SCA_MIGRATE_ENABLE | SCA_MIGRATE_DISABLE)) {
>                 p->cpus_ptr = ctx->new_mask;
>                 return;
>         }
> 
>         cpumask_copy(&p->cpus_mask, ctx->new_mask);
>         p->nr_cpus_allowed = cpumask_weight(ctx->new_mask);
>         mm_update_cpus_allowed(p->mm, ctx->new_mask);
> 
> 
> set_cpus_allowed_common only sets cpus_ptr for SCA_MIGRATE_ENABLE|SCA_MIGRATE_DISABLE
> and **nr_cpus_allowed is not changed** which is the assumption the
> straight-forward patch relies on.
> 
> I do not recall looking too closely at migrate_disable or forgot why it's
> like this so I kept looking to see where SCA_MIGRATE_ENABLE originated
> (presumably Set Cpus Allowed (SCA) instead of a typo of Ska) leading to
> af449901b84c ("sched: Add migrate_disable()") which was no help explaining
> the why. It's there with a tonne of warnings about locking violations
> but does not explicitly state why. Best is this bit
> 
> -       if (p->nr_cpus_allowed > 1)
> +       if (p->nr_cpus_allowed > 1 && !is_migration_disabled(p))
> 
> That sortof suggests the patch relied on the behaviour to distinguish
> between nr_cpus_allowed == 1 and nr_cpus_allowed is equivalent to 1
> because if migrate_disabled even though p->migration_enabled existed. I was
> under time pressure at this point so had to draw the line and stop. It's
> not particularly clear why set_cpus_allowed_common() is like this but
> get_push_task() still checks
> 
> 	if (p->nr_cpus_allowed == 1)
> 		return NULL;
> 
>         if (p->migration_disabled)
>                 return NULL;
> 
> It's not clear at all to me why both are needed. I expect if I kept digging
> that I would find something clever but the obvious fix does not work,
> or at least if it does work, it's not very obvious why it's ok and has
> no side-effects.

Bah, and I cannot remember either. Let me have a poke, see if something
bubbles up.
