Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.157.51.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107193;
	b=U5EqUQbNFw2BkYgturUr5JxvXFwAvLY5PxHJQeEid0MQsaN+vuYdiSJlGSSJtv464z6y
	 PiDICYtiHJOX/x8xnBFUcd7ExYbqJ5p+3zNLsfo/PaUsIC5fD7eCEYS36T77XjZVbP59J
	 WdqryfkIYw+wmORz7/kIBrdpRWaiaITEybNtsf/3nBjj/NEMEejYMXAQeyciMWUtC44Jq
	 Z69mpJEVOtI5Op/3EDe3Mqd5xy9DtCtSazZGNOlebCBQobpU+htEj2lZwmWXDwTPJaGiu
	 gaPfO9XgcXdu4EBCQO0wGCOtcDE5Zk2TERI6Z45fsaDu62mUd7FDTzfZ6v93iHAqLGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107193;
	h=DMARC-Filter:Received:X-Titan-User-Uid:DKIM-Signature:X-AuthUser:
	 Received:Date:Feedback-ID:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:X-F-Verdict:
	 X-Titan-Src-Out:X-CMAE-Score:X-CMAE-Analysis;
	bh=LXr0fzoeh9rg7YkBVzQjCjsu8RKr65SIM6KsJET29LI=;
	b=YecBTN2Nnx8J1ktjJNJnyTf4N2wD6APgM52vFIYhYk6ygXj3A9mgic69EnfnUYTp9pua
	 iOEGP9F0d5AFptcGmmZvM3oLg1BAn7kN8WWARoZ0Ankn32K/WqGOScCX1j9L9wft1tLnT
	 5BouMwAuXV9wCSjHvFMn69bh7NHWRwjHJKA6w8xISZIsiDYPzfDGMaqkA3gg1jrN/+hiA
	 b0X39WH2Yfpk/a/CHO4OYJa7YkopcyqZKAGP0zqxuc9Th2/HcTWd/HOboiMnHfntzpf/k
	 8Na8bT9zDgarqPZ1zjphO9ibwkbZPg/WF0iJjS++qtrxnx12X8T5TZPWnusees4uoKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=techsingularity.net;
	spf=pass smtp.mailfrom=techsingularity.net;
	dkim=pass header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=J4gBOHAI;
	arc=none smtp.remote-ip=35.157.51.134
Received: from mail36.out.titan.email (mail36.out.titan.email [35.157.51.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94B5606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A94B5606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=J4gBOHAI
Received: from localhost (localhost [127.0.0.1])
	by smtp-out0101.titan.email (Postfix) with ESMTP id 4jVl001Vcgz3wYD;
	Thu, 19 Nov 2026 16:53:04 +0000 (UTC)
X-Titan-User-Uid: eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..vleOuQm0NoZGPjU5.IQ4wRh866GosYmvz1VG8iEp1Y6phRxIo62Hgo6eH7OSsgbUz-fDGMyOlqhD58HGHurzUqN-dihoyALlJd3rqkfH4G5onvhSpZWT6lKSBpnq4uROuA-S64NqqXA.kdchXcTUrEyV93oG5r99Qw
DKIM-Signature: a=rsa-sha256; bh=LXr0fzoeh9rg7YkBVzQjCjsu8RKr65SIM6KsJET29LI=;
	c=relaxed/relaxed; d=techsingularity.net;
	h=mime-version:in-reply-to:date:cc:references:to:message-id:from:subject:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1795107184; v=1;
	b=J4gBOHAIcjX9Bud3Vcim/VeSZX1B3gVf62DgWzW6RsCcbjkfmtsF0TO/Oophdjh7B6hWwwGB
	81iihpnrKK47b2ZOsg5C1M6dxtek5J8BOoFzM3uhY0s9xGa7nKvckeJvD+yMLsjRLL+oru3nycJ
	ODaTXnBJtg0jhTAsD/SzLmSA=
X-AuthUser: mgorman@techsingularity.net
Received: from techsingularity.net (unknown [84.203.231.68])
	by smtp-out0101.titan.email (Postfix) with ESMTPA id 4jVkzz3dTCz3wYT;
	Thu, 19 Nov 2026 16:53:03 +0000 (UTC)
Date: Thu, 19 Nov 2026 16:53:02 +0000
Feedback-ID: :mgorman@techsingularity.net:techsingularity.net:flockmailId
From: Mel Gorman <mgorman@techsingularity.net>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Seiji Nishikawa <snishika@redhat.com>, Mian Yousaf Kaukab <ykaukab@suse.de>, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] sched/rt: Do not account migrate-disabled tasks as
 pushable
Message-ID: <av8WflarlESqUPM2@techsingularity.net>
References: <20261113160655.2909479-1-mgorman@techsingularity.net>
 <20261117152026.GI1813469@noisy.programming.kicks-ass.net>
 <20261117152414.GG1922751@noisy.programming.kicks-ass.net>
 <av1q-2D_tdi9oNEj@techsingularity.net>
 <av7Pj6uBsSVAoxbZ@techsingularity.net>
 <20261119150812.GT2668200@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <20261119150812.GT2668200@noisy.programming.kicks-ass.net>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1795107183957405737.2081352.6137690473013602418@prod-euc1-smtp-out1004.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=KNjj5FFo c=1 sm=1 tr=0 ts=6aff2970
 a=FmVQ1k5Ded4TyWNjOMyd8g==:117 a=FmVQ1k5Ded4TyWNjOMyd8g==:17
 a=Q9fys5e9bTEA:10 a=CEWIc4RMnpUA:10 a=LALsk9Mjg1orSs__qvoA:9
 a=PUjeQqilurYA:10

On Thu, Nov 19, 2026 at 04:08:12PM +0100, Peter Zijlstra wrote:
> > set_cpus_allowed_common only sets cpus_ptr for SCA_MIGRATE_ENABLE|SCA_MIGRATE_DISABLE
> > and **nr_cpus_allowed is not changed** which is the assumption the
> > straight-forward patch relies on.
> > 
> > I do not recall looking too closely at migrate_disable or forgot why it's
> > like this so I kept looking to see where SCA_MIGRATE_ENABLE originated
> > (presumably Set Cpus Allowed (SCA) instead of a typo of Ska) leading to
> > af449901b84c ("sched: Add migrate_disable()") which was no help explaining
> > the why. It's there with a tonne of warnings about locking violations
> > but does not explicitly state why. Best is this bit
> > 
> > -       if (p->nr_cpus_allowed > 1)
> > +       if (p->nr_cpus_allowed > 1 && !is_migration_disabled(p))
> > 
> > That sortof suggests the patch relied on the behaviour to distinguish
> > between nr_cpus_allowed == 1 and nr_cpus_allowed is equivalent to 1
> > because if migrate_disabled even though p->migration_enabled existed. I was
> > under time pressure at this point so had to draw the line and stop. It's
> > not particularly clear why set_cpus_allowed_common() is like this but
> > get_push_task() still checks
> > 
> > 	if (p->nr_cpus_allowed == 1)
> > 		return NULL;
> > 
> >         if (p->migration_disabled)
> >                 return NULL;
> > 
> > It's not clear at all to me why both are needed. I expect if I kept digging
> > that I would find something clever but the obvious fix does not work,
> > or at least if it does work, it's not very obvious why it's ok and has
> > no side-effects.
> 
> Bah, and I cannot remember either. Let me have a poke, see if something
> bubbles up.

I'm assuming that the patch I sent is not completely wrong and that
the RT_PUSH_IPI check is somewhat reasonable. There might be a better
potential fix somewhere.

After a break it occured to me that this could originally have been about
locking and it's sortof plausible.  migrate_enable/migrate_disable can
only be called from the task, not just because of the API, or because
it would be an odd thing to try remotely as it's completely irrational.
__migrate_enable protects the p->migration_disabled only with a barrier and
the code itself assumes a task only updates its own p->migration_disabled
and races on memory ordering are harmless. The actual push only happens
in stopper and appears to use MDF_PUSH as a deferral mechanism (reading
a7c81556ec4d ("sched: Fix migrate_disable() vs rt/dl balancing")).
I'm guessing it was deferred because an immediate move is expensive, and
actively interfering with a potentially higher priority task is a definite
cost with uncertain benefit.

I think I could probably pick it apart given enough time but I stopped
looking at it again because -- it might be like this just because it's cheap
- migrate_disable/migrate_enable has to be cheap and deferral to stopper
is relatively cheap and while I didn't check for races, the consequences
of the race I could think of are all harmless.

The cost front is also on the other side, using cpus_ptr in set_cpus_allowed_common()
instead of a full change avoids

        cpumask_copy(&p->cpus_mask, ctx->new_mask);
        p->nr_cpus_allowed = cpumask_weight(ctx->new_mask);
        mm_update_cpus_allowed(p->mm, ctx->new_mask);

There probably still is something hiding in there, it's odd that
get_push_task checks both but I'm getting confused trying to disguish what
was intended, what is really there, and the consequences for changing it. It
is more expensive to update the cpumask properly and p->migration_disabled
is not protected other than the task only changes its own field but the
original motivation could simply be -- it's cheap.

I think it's probable the "simple" fix could replace the RT_PUSH_IPI check
but I'm less convinced that doing the work necessary for that patch to
work would be still safe or fast for migrate enable/disable.

-- 
Mel Gorman
SUSE Labs
