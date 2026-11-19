Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=63.182.176.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131268;
	b=hWXYK9rGOLfly/AeXfQP3Uhr2GTr9fRXHRwOloClvhHCuT88uOin85cB5fIv7lh6TbIv
	 +6d9q0etzPTK4ub2Zy/t7EBINmPjIVhSdKYRCRbK8c6tpxDmo0lbBl9W2W/47oQXkLeWO
	 Ovu8PORNfTFJrU1Ll4mWwfOflzwDNDmaLGyXNWWlOaghKRIGqALvkKr4C0WHBrQzDbRl2
	 263Ce78mHnti/j/GJbJK8z2DT6BqdD0jXaPFwW6vRaSmzlthNQ32w4rbObmJAnCqJtU+c
	 era3gwMJhGKhqs/2KUr/XxxgpywSDgM8aU5gI7cnv1GiErsfimTHj9ud0WU3isn6zAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131268;
	h=DMARC-Filter:Received:X-Titan-User-Uid:DKIM-Signature:X-AuthUser:
	 Received:Date:Feedback-ID:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:X-F-Verdict:
	 X-Titan-Src-Out:X-CMAE-Score:X-CMAE-Analysis;
	bh=EYfpjuwaxBu49M3huQ3pw3HednIC9v1XxyiOslMrlsM=;
	b=4Xj37xRuO+lc0masnbkKx74HNEHEeyNhTR99LspxVvTI9AcEoqj9CJqgxraokjkeh5T2
	 6B0qdUax0RjBvFuhHZddqcP9Z2BVPuWNXj7M8Q1zBVpnxl49mD0pYOxK4HTFV5kBcUlLr
	 XTfBQLKSGUBINcgT2XoHD+Svs/xUf78nFd+/sR2YT6sXkTVrh6/GQ+jEROJOWnMGcwlQG
	 Hvh//LHnXel4uUoDLIOSra8/DMgyMzi6AdX5pfwtj711GObD5qHjjvKU1IowcrKGGiVTD
	 ei36hrjiPxmesp8BfDeJisOfC9VvarUNXRsMyKZxFMumlvwgWmY/d8rffSPFpz/hjpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=techsingularity.net;
	spf=pass smtp.mailfrom=techsingularity.net;
	dkim=pass header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=RA5wMnTV;
	arc=none smtp.remote-ip=63.182.176.48
Received: from mail299.out.titan.email (mail299.out.titan.email [63.182.176.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54438606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54438606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=RA5wMnTV
Received: from localhost (localhost [127.0.0.1])
	by smtp-out0101.titan.email (Postfix) with ESMTP id 4jVvv00yLTz3wYD;
	Thu, 19 Nov 2026 23:34:20 +0000 (UTC)
X-Titan-User-Uid: eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..mQEaKwPB8yAF0Ebq.9TFhxeeVjlIKitpiOej5sN65ViRpyCmDhHdDxjjj8MQO4DYC4-QnFGkybBQBw20b3OX3Ck9SmzsGPzF4QJ4eQlCEdyrT1iT3QA78_IAM4c9foHqsrvwnwi1ajQ.nfjVgMaazrJoG6uibKNi_Q
DKIM-Signature: a=rsa-sha256; bh=EYfpjuwaxBu49M3huQ3pw3HednIC9v1XxyiOslMrlsM=;
	c=relaxed/relaxed; d=techsingularity.net;
	h=date:mime-version:to:cc:references:from:message-id:in-reply-to:subject:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1795131259; v=1;
	b=RA5wMnTVSH+vlT6k9XmhUGgzTacSrxq/idPpay5dZvHP0pYOA0Gl11SUJXpM52bu/7Ht47mC
	5pVX4qEixAM+k9gJnxYCp5Z4w7bajJAnQetFAeUEOmlDyAmQKqmq46dlltJjLrcrs9HSiEU9ceH
	p3fUCED8OAg0Ar3Is/ErGbf4=
X-AuthUser: mgorman@techsingularity.net
Received: from techsingularity.net (unknown [84.203.231.68])
	by smtp-out0101.titan.email (Postfix) with ESMTPA id 4jVvtz3Flsz3wYB;
	Thu, 19 Nov 2026 23:34:19 +0000 (UTC)
Date: Thu, 19 Nov 2026 23:34:18 +0000
Feedback-ID: :mgorman@techsingularity.net:techsingularity.net:flockmailId
From: Mel Gorman <mgorman@techsingularity.net>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Seiji Nishikawa <snishika@redhat.com>, Mian Yousaf Kaukab <ykaukab@suse.de>, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] sched/rt: Do not account migrate-disabled tasks as
 pushable
Message-ID: <av9x3iMaKhtByVzM@techsingularity.net>
References: <20261113160655.2909479-1-mgorman@techsingularity.net>
 <20261117152026.GI1813469@noisy.programming.kicks-ass.net>
 <20261117152414.GG1922751@noisy.programming.kicks-ass.net>
 <av1q-2D_tdi9oNEj@techsingularity.net>
 <av7Pj6uBsSVAoxbZ@techsingularity.net>
 <20261119150812.GT2668200@noisy.programming.kicks-ass.net>
 <20261119151739.GF2669272@noisy.programming.kicks-ass.net>
 <20261119152827.GG2669272@noisy.programming.kicks-ass.net>
 <20261119164050.GJ1922751@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261119164050.GJ1922751@noisy.programming.kicks-ass.net>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1795131259872829398.2081352.408972691124329570@prod-euc1-smtp-out1004.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=KNjj5FFo c=1 sm=1 tr=0 ts=6aff877b
 a=FmVQ1k5Ded4TyWNjOMyd8g==:117 a=FmVQ1k5Ded4TyWNjOMyd8g==:17
 a=Q9fys5e9bTEA:10 a=CEWIc4RMnpUA:10 a=bC-a23v3AAAA:8 a=JfrnYn6hAAAA:8
 a=WsHKUha7AAAA:8 a=Xkv-xyuFNo76yYj7CQwA:9 a=PUjeQqilurYA:10
 a=-FEs8UIgK8oA:10 a=FO4_E8m0qiDe52t0p3_H:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=H4LAKuo8djmI0KOkngUh:22

On Thu, Nov 19, 2026 at 05:40:50PM +0100, Peter Zijlstra wrote:
> On Thu, Nov 19, 2026 at 04:28:27PM +0100, Peter Zijlstra wrote:
> > On Thu, Nov 19, 2026 at 04:17:40PM +0100, Peter Zijlstra wrote:
> > > On Thu, Nov 19, 2026 at 04:08:12PM +0100, Peter Zijlstra wrote:
> > > > On Thu, Nov 19, 2026 at 12:06:21PM +0000, Mel Gorman wrote:
> > > > 
> > > > > > > > Suppose:
> > > > > > > > 
> > > > > > > >   migrate_disable();
> > > > > > > >   ...
> > > > > > > >   schedule()
> > > > > > > >     migrate_disable_switch()
> > > > > > > >       // switches p->cpus_ptr and p->nr_cpus_allowed
> > > > > > > >     pick_next_task()
> > > > > > > >       p = class->pick_task();
> > > > > > > >       put_prev_set_next_task(rq, rq->donor, p);
> > > > > > > >       return p;
> > > > > > > > 
> > > > > > > > So any task that ends up in put_prev_task_rt() wlll have passed through
> > > > > > > > migrate_disable_switch(), which have updated nr_cpus_allowed.
> > > > > > > > 
> > > > > 
> > > > > Short summary, this assumption is wrong, nr_cpus_allowed is not updated
> > > > > in that path.
> > > 
> > > > Bah, and I cannot remember either. Let me have a poke, see if something
> > > > bubbles up.
> > > 
> > > So this version did update nr_cpus_allowed:
> > > 
> > > https://patch.msgid.link/20200921163845.769861942%40infradead.org
> > > 
> > > And the next version it did not:
> > > 
> > > https://patch.msgid.link/20201005150921.859981475%40infradead.org
> > > 
> > > But I can't seem to locate quite yet why it changed.
> > 
> > Tada!
> > 
> > https://patch.msgid.link/20200924123527.GJ2628%40hirez.programming.kicks-ass.net
> > 
> > I'm leaning towards "we got it wrong" on this.
> 

I'm assuming you mean the nr_cpus_allowed matching rather than this patch on
spurious IPIs.  I'm not even sure the decision was "wrong" though because
I doubt it was much fun back then either.

> One issue seems to be concurrent set_cpus_allowed_ptr(); the current
> rule is that nr_cpus_allowed is the number of bits in p->cpus_mask.
> 

I'm not sure why set_cpus_allowed_ptr is a problem precisely but if it
is, it's one of many.

> I'm not sure changing this is going to be 'trivial', so perhaps

I'm fairly sure it's non-trivial because the audit requirements alone would
be a slog. Even simple stuff like this may or may not break and it's hard
to tell at a glance.

void mm_init_cid(struct mm_struct *mm, struct task_struct *p)
{
        mm->mm_cid.max_cids = 0;
        mm->mm_cid.mode = 0;
        mm->mm_cid.nr_cpus_allowed = p->nr_cpus_allowed;

It that always correct and without side-effects? It's mm-scope, not
task-scope so it's extra fun. I'm going to guess "no" because thread
something something races with migrate_disable on another task something
else.

update_misfit_status probably breaks because it's using nr_cpus_allowed
== 1 to detect pinning in a non-obvious way. I don't *think* it breaks,
degrades in some cases.

is_per_cpu_kthread() breaks although the impact is degraded performance
in corner cases.

A number of places seem to use nr_cpus_allowed to detect being pinned
so each would have to be audited to determine if they care about a CPU
affinity pin or a migration-disabled pin with extra double plus fun that
it only matters on PREEMPT_RT. If they care about the affinity pin, does
it matter if it changes in the near future due to migrate_disable? An
ironic example is that I think the task pushing a running
task away to allow a migrate_disabled task on the same CPU might break
just because a bunch of its helpers make assumptions on nr_cpus_allowed
vs task is migrate-disabled

I'm sure sched_ext has some fun but not going going to guess what.

It probably can be done with enough time and pain but it's not easy and
it's a disproportionate level of effort for a relatively simple bug.

> sprinkling more is_migration_disabled() is the simple solution for now.
> Dunno.

For the spurious IPI thing sure, but I still think the RT_PUSH_IPI
check is necessary as well just because deadline doesn't even have a
PUSH_IPI. Introducing one would probably get rejected because it endangers
tasks meeting their deadline. Applying the check anyway degrades deadline
itself. sched-rt can tolerate the PUSH_IPI without breaking its own rules
(priority over all else) and it solves a real problem. Introducing the IPI
in deadline just to match RT probably breaks or degrades deadline but it
still needs to find CPUs with migrate-disabled tasks. Someone might say
it won't break anything because the cost of the IPI, the migration and
the remaining budget is known and they'll get shutdown because the IPI
and migration costs are unknown. Same person or another will say the IPI
and migration costs can be estimated and they'll get kicked in the heuristic.

-- 
Mel Gorman
SUSE Labs
