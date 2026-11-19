Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101467;
	b=Ij9DGV9Tqd6Lyz1dkAAmigTT35Li9lkWWTMdJmt8u2xE4qO9zTy+tQbsEA0T5Vk74C4q
	 Wn063Ws8XyVn5e4eOhgJjDp1bBfBC7/HwaN+Z+kacpgJHQ4IbpCuShb33NX6UMGlVLgiR
	 Z26YIIwFyD1adm94NFMI8tuBm11xYmUZckdHZ4yTjceYle4ywfa/MLDAV0p3vEyjKKUJ0
	 L3KjECMQ7UKIVBemWjteIbfqCiE05A/TNrp/4R/Yy1kEBEwEzv5kanc4Bt03spCa4fpid
	 U9L+tP5vRvP0whjya42nolFwdaT0X6n0MFldFM7cVzxg4ht5IO3bxKsvocpcCfI5H+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101467;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=x4hbCJvmegmmaEDLovLxJCTrTv75XFq94LvkQ0idbpk=;
	b=W5JDda2LZT61s3B4QuBmb1wx99h5b0mA2Pi/KbDfBLBP7C6tMPJk26IEI9YfOpTYdXBV
	 0nX3jCKYqMIV8bnC3eNaZiEK/v9tp59Ge40a7AlBvWyiVcjU/Rc3L7Dqy+YjdT0SQd8l7
	 HxsVz4kAgQq2xj7ASwl80EcEyicUq5llT1Dz4J8kHRqxhjhaab2zZU1+ogUD6xNwaY/lj
	 da4/cKP0YFKRJe3YOfuY4Rn9eadGPQ3roSr8JBpFL04NgH3O1F6rMgmw8MySspjZnVgYO
	 H3ePpGGtOOKqx++Cd14lKQuv2vNw8/qIKvAa3Hitlvn/tei4syn0CA9bn6XPykrN47A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=V4w6QSnG;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580C7606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 580C7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=V4w6QSnG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=x4hbCJvmegmmaEDLovLxJCTrTv75XFq94LvkQ0idbpk=; b=V4w6QSnG7GcXtMgucg4Ez/AKju
	VKq3suB6zErfE4Sq9kQMduLI4gSWzMRTtPbEghuNDm9TI2re5oOU2C+FMSg9Y4Zc15qcb6gt5lbzL
	wN2zWAfXv3Lo6n+3oqGTF03E+KgyvisRT8pR5iY99x+QlneNhzjp7tFhNwuQvTJXTIKxfOTnHktsP
	xkJ+kDci0kA7khz3CCmdwPmpR+4HrKdhjRe9Z7sy+PWCC0mt1rdNKaZSZ9Arbu4vGkQ+SUFsS42mT
	PHIj90zqQXia/GmwBoc8ScGYq1Sl7W8naxLvFLd+O6IoEnwYP7mT/YSm3tTidkToBpUlvU+vUXkyg
	AhrhYG6A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3tN-00000007V8D-1ZQ2;
	Thu, 19 Nov 2026 15:17:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 016F93007E1; Thu, 19 Nov 2026 16:17:40 +0100 (CET)
Date: Thu, 19 Nov 2026 16:17:39 +0100
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
Message-ID: <20261119151739.GF2669272@noisy.programming.kicks-ass.net>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119150812.GT2668200@noisy.programming.kicks-ass.net>

On Thu, Nov 19, 2026 at 04:08:12PM +0100, Peter Zijlstra wrote:
> On Thu, Nov 19, 2026 at 12:06:21PM +0000, Mel Gorman wrote:
> 
> > > > > Suppose:
> > > > > 
> > > > >   migrate_disable();
> > > > >   ...
> > > > >   schedule()
> > > > >     migrate_disable_switch()
> > > > >       // switches p->cpus_ptr and p->nr_cpus_allowed
> > > > >     pick_next_task()
> > > > >       p = class->pick_task();
> > > > >       put_prev_set_next_task(rq, rq->donor, p);
> > > > >       return p;
> > > > > 
> > > > > So any task that ends up in put_prev_task_rt() wlll have passed through
> > > > > migrate_disable_switch(), which have updated nr_cpus_allowed.
> > > > > 
> > 
> > Short summary, this assumption is wrong, nr_cpus_allowed is not updated
> > in that path.

> Bah, and I cannot remember either. Let me have a poke, see if something
> bubbles up.

So this version did update nr_cpus_allowed:

https://patch.msgid.link/20200921163845.769861942%40infradead.org

And the next version it did not:

https://patch.msgid.link/20201005150921.859981475%40infradead.org

But I can't seem to locate quite yet why it changed.


