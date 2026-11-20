Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172371;
	b=X5ENLAtHKwIupljMHG5yxlDnGHyt8eRLUB2ZSkSVPOnxz+Gcn8m/X8DddOP/tmTQyreo
	 ADKOqubAZ8R0ralMXm1eQ6iKp5PQyp5lddsQEUVmkVzKEmffR94GLshepN0nyPjN0LSGn
	 /H8yn9nFqIzvU99GdMazQNzgvd/ZIu/baZYhtzckGS9D9wHSl/WInXYQ3U/Bf7Rn7KMwl
	 lbSedQM88AtiCVa6XNfRq/AJakroJIm5upw7EBfBW0Qhxh66Lu+y0l2Sq5NJFaChKHThP
	 ho+l2OHhEd/Wbkmrh2GVRKysk3ixjqW8uA64rEEnnRpba1panEcBIPjrYpj4wvWiZ4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172371;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=pxamVE2YLuLCY7Zm2QMVZarL3GRha3NU0zajscp4KfU=;
	b=GDp7Zi/Ym1JA9o41yQFmrtzGj2qwUI5PUWq9e/3kbgR8nfuAmzy5/KnnL2xhwKQNDrh8
	 KBPNxrVTSBEHOo2COdUTDf44nW1RX1StVIGOYSknnby5DHJkH7rs4ScCvRTCAA2klafGZ
	 iPfaUGx1AJcKgDTITrXIot+7d5b0q4g6OKR3sHu5n9rS17f5IsQgT0b2qw8iyP0iKDJDk
	 Lt+8rjd5pgj5fiftOmcS7JhaHP9ugmoqrJYCxk4LOFnLJaeWQZsvbC7R5Xurs4MRTDow/
	 /1sNl2XRc6H62FbRhlroozIHkJR0FbzijpSO79WqILxjj2NBn3Ldyvf1UgI7Fv/x9bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IM5S9TH7;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB90606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB90606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IM5S9TH7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pxamVE2YLuLCY7Zm2QMVZarL3GRha3NU0zajscp4KfU=; b=IM5S9TH7Yib6C7iMU4XdsQSzNr
	djcdsWIeZCDGIo7v3hg1ed1HfLPhpZMd/pgio1R0aUK0T/HVQUugQKKsGsNg+8YEg2WUz9SbhQvFI
	0UjGhzXowQR7bgrjGP5K9KSc5RXv3VA+SZD8R066XEIJoeqbtpifvFZ/IGOQ5KY77B8nGmXj8099Z
	tQ7E6aZQtULQOjFUA+WNSN5MQWN4J0HXQGgTXQhTXmpHawmt5fHQkuyl3V4GGgrHBrtZ2W6WfGgu9
	3S9d2MpqXqWQQQCmS1o8Dbv1V49SHYMh55L72f4CLO6SIvDE4yc9rQxm/BvkNrzulvrRay2UYNBJN
	JqP+Oy/g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMKy-00000000gD8-26Hd;
	Fri, 20 Nov 2026 10:59:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 208CE301185; Fri, 20 Nov 2026 11:59:23 +0100 (CET)
Date: Fri, 20 Nov 2026 11:59:23 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] sched/fair: Exclude delayed-dequeued tasks from
 sum_nr_running
Message-ID: <20261120105923.GI2669272@noisy.programming.kicks-ass.net>
References: <20261120014946.1355234-5-srikar@linux.ibm.com>
 <20261120014946.1355234-6-srikar@linux.ibm.com>
 <20261120105456.GP2668564@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261120105456.GP2668564@noisy.programming.kicks-ass.net>

On Fri, Nov 20, 2026 at 11:54:56AM +0100, Peter Zijlstra wrote:
> On Fri, Nov 20, 2026 at 07:19:48AM +0530, Srikar Dronamraju wrote:
> > Delayed dequeue keeps a sleeping task on the CFS runqueue until its
> > accumulated lag is repaid. While such tasks remain accounted in
> > rq->nr_running, they are no longer runnable and are not eligible to
> > consume CPU time.
> > 
> > update_sg_lb_stats() currently uses rq->nr_running when computing
> > sum_nr_running. As a result, delayed-dequeued tasks contribute to group
> > load statistics even though they are effectively sleeping. This can
> > inflate the apparent load of a group and influence load balancing
> > decisions.
> > 
> > Other metrics collected by update_sg_lb_stats(), such as group_runnable
> > and h_nr_runnable, already focus on runnable work. Counting delayed
> > entities in sum_nr_running makes it inconsistent with the rest of the
> > load-balancing statistics.
> > 
> > Exclude cfs_h_nr_delayed() tasks from sum_nr_running so that load
> > balancing decisions are based on runnable tasks rather than entities
> > waiting to complete delayed dequeue accounting.
> > 
> > Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
> > ---
> >  kernel/sched/fair.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index d4cc0caee626..21f2b17894e3 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -12296,7 +12296,7 @@ static inline void update_sg_lb_stats(struct lb_env *env,
> >  		sgs->group_runnable += cpu_runnable(rq);
> >  		sgs->sum_h_nr_running += rq->cfs.h_nr_runnable;
> >  
> > -		nr_running = rq->nr_running;
> > +		nr_running = rq->nr_running - cfs_h_nr_delayed(rq);
> 
> 
> h_nr_runnable already excludes delayed; its is h_nr_queued that includes
> it.

Argh, I cannot read, my bad. I looked at the line above that uses
h_nr_runnable.
