Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189220;
	b=3uhtM238ykcMj6+i7W14EmIUpa6VqssWCCJ3ZL0r3eJ6Z52Mr3112IA3mtB7OrQhVor6
	 s4JK85KjGRF4nQusEBGnJKCKMwb/BjANoLLyt1ajsCBhNTDsqLddaDysFdacxnsh8Bnr2
	 WkBEMRcU1xhwv3fZ9VuJGD0MplnhcXlsXCbGj5y5wMP/Hy0D6xsuPE1s8UIGrLxOB/81y
	 6nS/lcPK4JFXAUWocdhqsXooyHfq6F2qJXIh+xwvUdvN759ICKTbkmjgY4VUb4QjENKkD
	 5cZqpxN0ddj7/51jIrtHuS7M0U6O20V3rrA5qhE3uOGOutZVtEVsdtx4pcKIrZG7xiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189220;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=g+dZzZKLMeVqJEeTNgcxpnAM4yGrDaIi/0PJVkSs7Co=;
	b=VDUvME9BG9QVqSR8yFm5Lpmni3LmaIAjMedpUbjV1HMGoN5iP8DzjCg1+RYl019zxiHL
	 g5DGwO/IIStNoMFdGUTYj0AKsuUsy5CT+s45n3opgFUM9t4q2u1/+jxB5j8EbfRheg95Y
	 OxbdNfVpCNSY67gsFoK9NziE02JqjHjm8F51p1Xe1/WDNoKZK/pQ6H4v7iQ0S+lQ/u15s
	 nLfBzRJG6LuXLQV1LNjEr3NCybcVciey+JC8Jxcs5gz1ejveB41aRQCIATDapuAZF2cPl
	 cxAc+CL0Vpq1ouI312mw/dK66ynV0Tog1Z4BIV0WNnZr959R6NGZJSM9oMTlaOQFaVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=H4A3GC1y;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8537606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8537606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=H4A3GC1y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g+dZzZKLMeVqJEeTNgcxpnAM4yGrDaIi/0PJVkSs7Co=; b=H4A3GC1yEf3ZIf02XOJRd23pAr
	C8cxfoRersDamGnKETTBqAkEFL5nxjOdqdpQWwZ2oB0x3KYvBp5KL/aNapYmd7jsqv0AwBiGo0qRr
	TfrrDAUlj7FEduXC1R89vw1t5GHx7yMlrmuyAwV1zOEOgZkQ6VuSwCuYMHHAJLdEEGs11crVpHqiW
	truPVEg3gZdQYKo3ywRXBuWVdCm52UQpQjkYmk/H6dqgKIzD9EUl/JxlCaSwyVSF35Q3gQS0oSXLy
	M+YJUAHu8ET2H41k36mHC8v3ZK5AlXbjN1CZYOXmWVzNCw86eT806ZPAZeaK0wtvCfKT2mj9xGZS6
	pub88pgg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQim-00000000umI-35pu;
	Fri, 20 Nov 2026 15:40:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A6C98301185; Fri, 20 Nov 2026 16:40:15 +0100 (CET)
Date: Fri, 20 Nov 2026 16:40:15 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [PATCH] sched/fair: Don't let task_tick_cache() IPI dyntick CPUs
Message-ID: <20261120154015.GY2668564@noisy.programming.kicks-ass.net>
References: <20261119203825.2732984-1-vschneid@redhat.com>
 <20261120083440.GL2668564@noisy.programming.kicks-ass.net>
 <xhsmhv75rojdy.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
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
In-Reply-To: <xhsmhv75rojdy.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

On Fri, Nov 20, 2026 at 12:02:49PM +0100, Valentin Schneider wrote:
> > +	/*
> > +	 * If there is no root domain; there is no balancing, and none of this
> > +	 * matters.
> > +	 */
> > +	if (!rq->rd)
> > +		return;
> > +
> 
> What if the setup involves a separate root domain where all the CPUs are in
> dynticks mode?
> 
> Methinks the signal we want is:
> 
>   is that task on a NOHZ_FULL CPU with the tick disabled?
> 
> If so then we shouldn't do anything about it. Let the other CPUs in its LLC
> / RD run some balancing. If they're all dynticks, well then there is
> nothing to do is there?
> 
> And that should also apply to the NUMA stuff like you pointed out.

If you have a root domain with more than 1 CPU in it, you get balancing,
deal with it.
