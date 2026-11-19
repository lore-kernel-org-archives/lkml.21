Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106458;
	b=1j8UHBuVs4ctqNYxyRyhLZoYz7uq+rGoFcnku/gvjTABM1a6KxoShNkuQsHGMbqVHv5l
	 nnltKS6rSxrUT3v1mKnAr1gclcv3vM+kDUZXmRPIkCgy1663hHAz7MKNUeNFSI1MbQzTu
	 UzEFXTLfrIBrPcgrvCA4oQm5qWurJyTaI06znavYiRHv7aBFilTQ6rajcAnwiMP+Ln2cF
	 +pgtQCD5+kxgX6eauWrAYnjaOttcHdFpm+JEKXqqtDkjxXkaAL0vQqjsAGOHlMjes+nhM
	 ET7kbze4AMvLXBAS6/D9BQRjs0w8q5gVX4vlbHOb6wOzzSJRaWx9o3Z2fAM5V3fVJrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106458;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=wePpJw0HNaMbflQQO4AfvdusE7cePFyR3nwvKhTtJUo=;
	b=piWqyKhkzHCbi+z3n3GQyUXo+AbRiZ3kCDVxmRgYQyqVhRia8YucCY0uwqQdQmEH0JO1
	 20ffJl5hyUgsBwyw4cCvfmeyvZAfNuSL8Z+JmgtwJUYG/BpFZ9T9V1NP8ox7Cyq42OIGF
	 STQ/Y3aEUa+I4goa1JnbtPCoL/UmmEaEEEK4EKaTQN80iLkalAK3sppPd/yNiSloKnBOW
	 7QuNxi75XYehzwimQDcOcPCA1F/ozVWwN383YAGWO8Bs/Vvk7M9ToK4PR9AhOQjS2glUe
	 AZxIcgmo2yic0iavmARN8O+0SLO2N31vED3Nz7OvdW0MmTsfzdnlKlk3ajHzcKeEjNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=YW4ZQx12;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAC4606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FAC4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=YW4ZQx12
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wePpJw0HNaMbflQQO4AfvdusE7cePFyR3nwvKhTtJUo=; b=YW4ZQx12ODm8ed3iKFcLC0SS2o
	2RU3NUf4CHitm4jhcaDWhxqL4HGMWxEqtUbx8/x+5G+zgctz0w1NURbJ7fQjM8cNQlnsXWuuJYGSP
	zzo/mk7oxtxMI13j93Aygp4fhPSzCDRg5vIpPb1ac6wTpj+dLwlXY5qSmXTIcgnaUY/4sJLd43DNb
	XK37pOUw4BpQmMTDZu/1G3VF3fF0sstZs73ab9B0sS70Nyzr/kMHoOjykYea1qJ9z19GdgTybXxbk
	6K8QLRa9HnnBbbx82UEpeYfxV6rFkOjn0mQd2bWR7rdYrhOGt21kYe3OZ7Xi7jPfpZ86bs+0UyiEb
	wtMnw9fA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Bt-0000000HSbY-1xsO;
	Thu, 19 Nov 2026 16:40:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6176130072F; Thu, 19 Nov 2026 17:40:50 +0100 (CET)
Date: Thu, 19 Nov 2026 17:40:50 +0100
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
Message-ID: <20261119164050.GJ1922751@noisy.programming.kicks-ass.net>
References: <20261113160655.2909479-1-mgorman@techsingularity.net>
 <20261117152026.GI1813469@noisy.programming.kicks-ass.net>
 <20261117152414.GG1922751@noisy.programming.kicks-ass.net>
 <av1q-2D_tdi9oNEj@techsingularity.net>
 <av7Pj6uBsSVAoxbZ@techsingularity.net>
 <20261119150812.GT2668200@noisy.programming.kicks-ass.net>
 <20261119151739.GF2669272@noisy.programming.kicks-ass.net>
 <20261119152827.GG2669272@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261119152827.GG2669272@noisy.programming.kicks-ass.net>

On Thu, Nov 19, 2026 at 04:28:27PM +0100, Peter Zijlstra wrote:
> On Thu, Nov 19, 2026 at 04:17:40PM +0100, Peter Zijlstra wrote:
> > On Thu, Nov 19, 2026 at 04:08:12PM +0100, Peter Zijlstra wrote:
> > > On Thu, Nov 19, 2026 at 12:06:21PM +0000, Mel Gorman wrote:
> > > 
> > > > > > > Suppose:
> > > > > > > 
> > > > > > >   migrate_disable();
> > > > > > >   ...
> > > > > > >   schedule()
> > > > > > >     migrate_disable_switch()
> > > > > > >       // switches p->cpus_ptr and p->nr_cpus_allowed
> > > > > > >     pick_next_task()
> > > > > > >       p = class->pick_task();
> > > > > > >       put_prev_set_next_task(rq, rq->donor, p);
> > > > > > >       return p;
> > > > > > > 
> > > > > > > So any task that ends up in put_prev_task_rt() wlll have passed through
> > > > > > > migrate_disable_switch(), which have updated nr_cpus_allowed.
> > > > > > > 
> > > > 
> > > > Short summary, this assumption is wrong, nr_cpus_allowed is not updated
> > > > in that path.
> > 
> > > Bah, and I cannot remember either. Let me have a poke, see if something
> > > bubbles up.
> > 
> > So this version did update nr_cpus_allowed:
> > 
> > https://patch.msgid.link/20200921163845.769861942%40infradead.org
> > 
> > And the next version it did not:
> > 
> > https://patch.msgid.link/20201005150921.859981475%40infradead.org
> > 
> > But I can't seem to locate quite yet why it changed.
> 
> Tada!
> 
> https://patch.msgid.link/20200924123527.GJ2628%40hirez.programming.kicks-ass.net
> 
> I'm leaning towards "we got it wrong" on this.

One issue seems to be concurrent set_cpus_allowed_ptr(); the current
rule is that nr_cpus_allowed is the number of bits in p->cpus_mask.

I'm not sure changing this is going to be 'trivial', so perhaps
sprinkling more is_migration_disabled() is the simple solution for now.
Dunno.
