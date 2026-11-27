Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772795;
	b=4u6wLCcpPZP+guupMUG5MHZUglwapeuAtX2CfqP9+uCN3uUN/tlgE3czinPZBibGULye
	 4Bl5yfVZJie67xj2R+c1Wq8IwaLSoPV8kCdVN/Hbqh0GexCGI1Hr+IWVPg8eV7Ud+RZyP
	 faYOA0BEkhEumPR4WZwI3BzpF9ZjQlmAAjq5M9bDbr3C/oXcyAmTj1TDgBDx8pdm1YVgc
	 45CZsve9+6XCZ6KZysalvLQfH93/Y+YWHuoH6kDvocerlAUca3+csUW6d4vFpadJ+1n2E
	 VMcIHXsgZdl3oyPqvkxBJGF3TX8RwjygmGEHo/bhXUXY14vtRRZ04eoD9Pdd/zTKzOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772795;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=syr4kBKHsyuWC7XlHZeB1cq+DtpSlUzsQSELSjgCwsM=;
	b=Hq2ateN3i9mzlNup/taTVqj+ozAo9VUwBvHu/nytAs1MvC72c+Ou8ly7Gc7vu7C7KhoH
	 8sma3tqG6Oq5Dv6bkHEyIhnBQ2FRlVTPo97/00v7wD/OHGnjxKK6KOQlDtJ/9U7clE5m7
	 XNVa/W7MuFm5kjnQCpaHjFVWTwR81R8mGXQDuXaJwhVonq91jZu7wfRiUlOusrMSBbaQ9
	 ixpNAX1YeJ/96uNLnDoEimd67LdUwlm4jJxHPlaCxDv4/AJjo3pkjQumB8H7ZpxRD0Vkn
	 MBNCYJrvW7+fF29mC1naxqoM0JsHm07tq8/LrvXIA3g/59fllLA8jn4hKPUbthYJJ8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b="eKpsIz/4";
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1C8606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA1C8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eKpsIz/4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=syr4kBKHsyuWC7XlHZeB1cq+DtpSlUzsQSELSjgCwsM=; b=eKpsIz/4aXk0aJGefQHllCagYe
	UQ+jNZzsOyHuYdYdqjim8mNxVWGVVqZjNkbkHriuzYJAads6ZLIwMZN4xcHg4eDdFrv4+uhZldnQb
	JEeYPP90kvVPEU3DDdJW9ZNJR29tHNDWnOyj0rRg11rCyTjN0enwz+oWw/Lk2+qL2lzXQPMLPFR49
	28BsVh3EsoT80GWYK7UjMmp1O+ng6Lt27ULLWfPaBi4QWOourVIDq7a55R5ZcrBY2h96TOSqinCtO
	JMYhcvNeRSaV3IiYsDQTF6bmg8uXjvU1rMukeE8sJmfbn6D3hnU20hdtOUUBtu9Qa2eI8ygsv2sWV
	vcvDVu5Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsXE-00000007Wzr-3vMY;
	Fri, 27 Nov 2026 09:46:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C8CA230027B; Fri, 27 Nov 2026 10:46:27 +0100 (CET)
Date: Fri, 27 Nov 2026 10:46:27 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, mingo@redhat.com,
	juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/fair: Use task_delayed everywhere in
 __dequeue_task()
Message-ID: <20261127094627.GQ49833@noisy.programming.kicks-ass.net>
References: <20261126164036.1938852-1-vincent.guittot@linaro.org>
 <awhlwJTOLPeNqFW8@scheduler.schedules>
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
In-Reply-To: <awhlwJTOLPeNqFW8@scheduler.schedules>

On Thu, Nov 26, 2026 at 08:22:51PM +0300, Kayra Cizmeci wrote:
> On Thu, Nov 26, 2026 at 05:40:36PM +0100, Vincent Guittot wrote:
> > Reuse task_delayed instead of checking flags bit
> > 
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  kernel/sched/fair.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 731d78155e65..942140247f76 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -8354,7 +8354,7 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
> >  	update_curr_eevdf(cfs_rq);
> >  	update_entity_lag(cfs_rq, se);
> >  
> > -	if (flags & DEQUEUE_DELAYED) {
> > +	if (task_delayed) {
> >  		WARN_ON_ONCE(!se->sched_delayed);
> >  	} else {
> >  		bool delay = task_sleep;
> > -- 
> > 2.53.0
> > 
> 
> As I see and know, cleanups attend to get lost in sched's traffic.
> I don't like that. So I'll review this :-).

That's why I often sneak them into larger series :-) But yes, my inbox
has gone absolutely nuclear the past year or so, it is very hard to keep
track of things.

> Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> 

I've got this one at least. Thanks!

