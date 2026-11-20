Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172103;
	b=q9rjVWN4JbGXT32ucd6/cBCit5iDX2TtUNvtmrSUuJRtv0f26b9dXyKmhMmdlklhcvec
	 Jy/PzA7Oh5cOGKRPnQj3tPkwEZX/jQa3f6KCRTqgHOd9f3DA3BqAigBZ84DZKehnL5HGw
	 qJNFcb+ZKwBTZNfnnIjPruyldQFOd3GRhFnw3fdb7EuCODxQzynLJU2+LT5KFVQcHHp6c
	 QWYuo9uc0Weetnlnqq6JvnVdqpzTkT32B9izCDyAU/QOObZGvYwc1MLuE+kCihpk2oCkj
	 pqpz0igystsk59UKIoCeck0SO4YgmB+V6PJr5nObJ8bn5OQ2MdMvvKGa/5QAiBFkdow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172103;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=cvPLEmeTUHEF2wrMMepAaUi4M7a6trP9s7NRe1oef+U=;
	b=e9v29iI4JSxMM6WueoeMdudvvhKOgKUQlsbZezgPVPiyBPsJGaezY6c8Y+Su1SkFqrR1
	 BKZL0+WIbkLflL8M24GMBxzBnNSFbicGJUCXkoLMlDAl1/Y5RJuvNw6mJ8BicvJLpfPxJ
	 czRgp4ugmXPEblN2pYb4kOh5tnEEamiaSVNvmQ5f610XCXhdA2QYnV93sx81xN0seLMNH
	 qRSWD0G/C32F5QTupA6RRA69ifxPeACuzj3HwQau6rfLOBdOrEeD75xKI3b5F+s3U1qem
	 jux76381iTQV0S0CgGsBOj013RUEICCclffcGkChoSopBAzOMCAtJpf4DrN0N/N2WRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=n3+RjC5J;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71EA606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A71EA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=n3+RjC5J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cvPLEmeTUHEF2wrMMepAaUi4M7a6trP9s7NRe1oef+U=; b=n3+RjC5J57jvE+SwR8pFzZJj8Y
	xnGH2NuMq4sgwkpSZg3mOyvaFB2EyjPKl89NCCMwTf7TZQXmwy+cTyKaJoZcr/oY4mhDeRzm6iu3x
	OV+GWORJd6xgBfgxNedFG/0nXJ7KGGCc11GRRLv+RDEFw+VFquoZQcDILd/OuiAIz6PRoD6HW6V4K
	zjUDEw21U4aW5y1NfYnDaixFQXNvoVGG4ylYpP5FnmSio8Cn1iI9l+ulttWpozKXQSR6z05WZNMC5
	Kvgz43gKy+aP8Cs1GhLEiphMfKAqWf3EOah8A/9+bl+Xt6W4qC18wRzjjUOwsUo1UbgbkzG0U3J1c
	F/fH7TaA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMGf-000000032dv-0Xwc;
	Fri, 20 Nov 2026 10:54:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A0E9C3008D6; Fri, 20 Nov 2026 11:54:56 +0100 (CET)
Date: Fri, 20 Nov 2026 11:54:56 +0100
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
Message-ID: <20261120105456.GP2668564@noisy.programming.kicks-ass.net>
References: <20261120014946.1355234-5-srikar@linux.ibm.com>
 <20261120014946.1355234-6-srikar@linux.ibm.com>
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
In-Reply-To: <20261120014946.1355234-6-srikar@linux.ibm.com>

On Fri, Nov 20, 2026 at 07:19:48AM +0530, Srikar Dronamraju wrote:
> Delayed dequeue keeps a sleeping task on the CFS runqueue until its
> accumulated lag is repaid. While such tasks remain accounted in
> rq->nr_running, they are no longer runnable and are not eligible to
> consume CPU time.
> 
> update_sg_lb_stats() currently uses rq->nr_running when computing
> sum_nr_running. As a result, delayed-dequeued tasks contribute to group
> load statistics even though they are effectively sleeping. This can
> inflate the apparent load of a group and influence load balancing
> decisions.
> 
> Other metrics collected by update_sg_lb_stats(), such as group_runnable
> and h_nr_runnable, already focus on runnable work. Counting delayed
> entities in sum_nr_running makes it inconsistent with the rest of the
> load-balancing statistics.
> 
> Exclude cfs_h_nr_delayed() tasks from sum_nr_running so that load
> balancing decisions are based on runnable tasks rather than entities
> waiting to complete delayed dequeue accounting.
> 
> Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
> ---
>  kernel/sched/fair.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index d4cc0caee626..21f2b17894e3 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12296,7 +12296,7 @@ static inline void update_sg_lb_stats(struct lb_env *env,
>  		sgs->group_runnable += cpu_runnable(rq);
>  		sgs->sum_h_nr_running += rq->cfs.h_nr_runnable;
>  
> -		nr_running = rq->nr_running;
> +		nr_running = rq->nr_running - cfs_h_nr_delayed(rq);


h_nr_runnable already excludes delayed; its is h_nr_queued that includes
it.
