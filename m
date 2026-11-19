Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102112;
	b=cPeksxCi3VxFBcaQbgNubgC000O05f7B8EsfyENCGyapvYirzLL1L03pw4ohdH3T6ix4
	 fqMujhwxJXrpWhNaY5hzuXgb1QmUj7aTyRWiPfEB6wlGmP6O2IezUECjZskTtW02ZmC+L
	 EPTJlNcuKIJPMA8DmxXsLlkVeWIGuc/JXYW4uXQy1T+0BDhVYx6BZcWM/IJYMte561177
	 FrKnbYS0lx/waw+QsdlL1PiM9r6dk2jLFJkkb/p5vpwHuYyfaW5mIUsR3/mNWKzqnKLS/
	 cSKgXW7vnM2z9QjUeXJbmj6WDHG6kMImP6g0UbZEXtAlK4TZgJ4MRWEzsplDePOd+NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102112;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=M3HWUaCMhUODbjG1/soeDrauR4tv8yITiGmORow4vCk=;
	b=KmHC8PMN0I80bUda+vfoadi5slxDVi0H1508UcB0BSsCtaSKZfJnL/eTNlQ4Mu9XcLAn
	 /5LnAUJXybl8tRLPKtqhxbtMQCtn9YYBkXNYVUoP9r2S6a2xX2KzAzHjrT6ESG59qcydv
	 BvnWSdq12QQ4//lclyzO8p/7OKYffo+6mGpcyPkyQENycj4+5SvS99i54w+unWsTfheCl
	 cYdHWOL0zGKWI4FpuDEokRzCoBIdNUQlfzsSfifkFOuH27vANLs+yay3nCrI7UahBN4XX
	 ctK+byHu5PQz3cievfzHrCXZryIC0C4ata2tbIgljwG4TnBdFFdH0ssa6HohLD4Pejg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=i4KSGmjz;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E865606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E865606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=i4KSGmjz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M3HWUaCMhUODbjG1/soeDrauR4tv8yITiGmORow4vCk=; b=i4KSGmjzl3MVtPGfDKhOlr/1Vh
	gf5QHifr/fKDcgjtjDXNEe24TyZfGJEBPMWYS1skR6boGipb5A4RddmHIYFsXRgbvtf4gdCrL57DY
	Q0xD/L0PgniyfvOkBFWVbC/Fas1fAz8Utda5zBa2qzIKnme6IrAg1mPy6ZLhhOK0/ev05+EREHsM9
	K1B8WXUlMOkwVnTYLAzXsQXCHu7XXFPqUvKSaPYIrXr3j7/34R72zUsp7AlVwhN3wpRt8mK+eEXnD
	az7qWyMAQWfOmDVAAFl0vPu/Q6g1D7gCdgPBJdxUZNZuR0YDLLTnsLJrqDHLTPR6DZ8xfHwtNhWlu
	MYrR0NhA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU43o-00000007bYx-13ao;
	Thu, 19 Nov 2026 15:28:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BF3FC30072F; Thu, 19 Nov 2026 16:28:27 +0100 (CET)
Date: Thu, 19 Nov 2026 16:28:27 +0100
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
Message-ID: <20261119152827.GG2669272@noisy.programming.kicks-ass.net>
References: <20261113160655.2909479-1-mgorman@techsingularity.net>
 <20261117152026.GI1813469@noisy.programming.kicks-ass.net>
 <20261117152414.GG1922751@noisy.programming.kicks-ass.net>
 <av1q-2D_tdi9oNEj@techsingularity.net>
 <av7Pj6uBsSVAoxbZ@techsingularity.net>
 <20261119150812.GT2668200@noisy.programming.kicks-ass.net>
 <20261119151739.GF2669272@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261119151739.GF2669272@noisy.programming.kicks-ass.net>

On Thu, Nov 19, 2026 at 04:17:40PM +0100, Peter Zijlstra wrote:
> On Thu, Nov 19, 2026 at 04:08:12PM +0100, Peter Zijlstra wrote:
> > On Thu, Nov 19, 2026 at 12:06:21PM +0000, Mel Gorman wrote:
> > 
> > > > > > Suppose:
> > > > > > 
> > > > > >   migrate_disable();
> > > > > >   ...
> > > > > >   schedule()
> > > > > >     migrate_disable_switch()
> > > > > >       // switches p->cpus_ptr and p->nr_cpus_allowed
> > > > > >     pick_next_task()
> > > > > >       p = class->pick_task();
> > > > > >       put_prev_set_next_task(rq, rq->donor, p);
> > > > > >       return p;
> > > > > > 
> > > > > > So any task that ends up in put_prev_task_rt() wlll have passed through
> > > > > > migrate_disable_switch(), which have updated nr_cpus_allowed.
> > > > > > 
> > > 
> > > Short summary, this assumption is wrong, nr_cpus_allowed is not updated
> > > in that path.
> 
> > Bah, and I cannot remember either. Let me have a poke, see if something
> > bubbles up.
> 
> So this version did update nr_cpus_allowed:
> 
> https://patch.msgid.link/20200921163845.769861942%40infradead.org
> 
> And the next version it did not:
> 
> https://patch.msgid.link/20201005150921.859981475%40infradead.org
> 
> But I can't seem to locate quite yet why it changed.

Tada!

https://patch.msgid.link/20200924123527.GJ2628%40hirez.programming.kicks-ass.net

I'm leaning towards "we got it wrong" on this.
