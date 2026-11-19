Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104242;
	b=vZq8TYie5lQm0arralbTbRbvv7UHkf9VxKEvyQCGWatzv0FbfWtGgjTNrQT+9FDrYney
	 mLpu+SJhTokwbWtVJdpVlKk7fJ1mC/gKMkJlftrTMUqP3Yn59U2yEBCm1I71ZkuwSiDlk
	 f1dlVcf41H8ktvW0QMLKBPLNBkXAI6NyFbkZko2ml76dK3ILSUOQcY1HURqRiXvM3aTPY
	 dDD+TfLo6j6kV2Nh5pg+T4XtPVHbTlOHFgPbFDyStpPWnUCLGprliFvTmJcF2zL6AMaR4
	 UK8BZWKRJuOi9JEmPzcJ9iAqd9HjFZ9yaY6hlcAgaVhjaf3GqsW274VdHnSrc5SVBNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104242;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=P64EBgJeTS7dK4i9I+4Nyz73l+KZP5wiU7f89qC2xGs=;
	b=LG6nlMfTmbxVwU3ERqxxvVqmUAiDXyP+F//AyDdPGozat6uPSWBgjAoWzZg54acB5wXn
	 nNjUTiOzTYZDEfKURnisN3FFX5Cnv8Bumxtqzk0gpC2QLohdTyRD2V0rNFz2XLLmP6YHQ
	 EcTSi/GwspTsNwKkZL3zNSNb2iit0mjRpSGXKFZQjAsuCn3rKtNxCp0gdgb00EAmCW2Au
	 c/eQ8U66HkP/0YzD6EnA49IJS3aef5V3sxbVJ5icBoT45GgFImTIhtzv0rxIQ3GH9CNTM
	 2b0TXtUoO7N3hvSzZaDUVfaMbwxEL70o8WbaB73O3mvmIIb+GNpjXrjHRa7K8jhC+2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mh8Q2rUZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859DF606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mh8Q2rUZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDDD01F000C4;
	Thu, 19 Nov 2026 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795104242;
	bh=P64EBgJeTS7dK4i9I+4Nyz73l+KZP5wiU7f89qC2xGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mh8Q2rUZSjoTNDuLTD3fKu1Q3K5mnVoeGrzUvLL34EpppYnxuNKopD3qBSkf6tQ8o
	 Ea6/fRHpMwS4wfXKIx1Ax0sOOJuHaQXIJqmeq9RFhsJKR7A6haGtVk5DpAQOc/+hUB
	 qVH1azvtI81II18yXpVb+U93GPXYTthZEz+d81eGTgVkD5+yikbGGDidRT0N44Esk5
	 ZT1Ddjg3eskpcZUaKApxvyAUdX9Wbz7Rg9HfakkKDw1C4/rkVDYoAAwovHb18qIS7H
	 6bqTgRFSu8IHYGnWMUKE5PAI28nfewFtR/WZYUVGst4Xk5LJjA/UkTp+n2RgCXrhld
	 ICzEV3ZYJ9lOw==
Date: Thu, 19 Nov 2026 17:03:59 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Waiman Long <longman@redhat.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] sched: BUG() in select_fallback_rq() at boot with
 isolcpus=domain on the boot CPU and CONFIG_CPUSETS=n
Message-ID: <av8d79cn662slr_K@localhost.localdomain>
References: <20261117144817.265109-1-mathieu.desnoyers@efficios.com>
 <dd335ee6-c879-4bee-9ea8-6d9e9216fb0e@redhat.com>
 <av26-ojv3LkO2vXH@localhost.localdomain>
 <c40da4c4-1f70-44f7-983c-3349199b5b68@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c40da4c4-1f70-44f7-983c-3349199b5b68@redhat.com>

Le Wed, Nov 18, 2026 at 10:55:35AM -0500, Waiman Long a écrit :
> On 11/18/26 9:49 AM, Frederic Weisbecker wrote:
> > Le Tue, Nov 17, 2026 at 10:13:02AM -0500, Waiman Long a écrit :
> > > On 11/17/26 9:48 AM, Mathieu Desnoyers wrote:
> > > > Hi,
> > > > 
> > > > With CONFIG_CPUSETS=n, a kernel booted with isolcpus=domain,0 hits the
> > > > BUG() in select_fallback_rq() during boot. CPU 0 is the boot CPU. I
> > > > found it while testing a SCHED_DEADLINE series [1]. I then reproduced
> > > > it on v7.4-rc2 alone. tip/master of 2026-11-17 and next-20261116 have
> > > > the same code. A proposed fix follows the scissors line.
> > > > 
> > > > Trigger
> > > > =======
> > > > 
> > > > Build x86-64 with CONFIG_CPUSETS=n. Boot a VM of 4 CPUs with
> > > > isolcpus=domain,0 or isolcpus=domain,0,1. The kernel panics before
> > > > init runs, in every boot.
> > > > 
> > > > These boot fine:
> > > > - the same kernel with isolcpus=domain,1,2, or without isolcpus;
> > > > - a kernel with CONFIG_CPUSETS=y, with isolcpus=domain,0,1.
> > > I am now thinking about disallowing the boot CPU from being domain isolated.
> > > That will include using isolcpus=domain boot time isolation parameter as
> > > well as in setting up isolated cpuset partition. Will that be a simpler
> > > solution than fixing all these places where isolating the boot CPU will
> > > cause various problems that need to be fixed?
> > You can try that, hopefully nobody relies on that. nohz_full supports the
> > boot CPU to be isolated but it's a heresy.
> 
> The upcoming runtime modification of nohz_full CPU will not support the boot
> CPU

Agreed.

> at least for x86, as the boot CPU cannot be made offline.

We should forbid that on all archs.

> I would not
> recommend putting the boot CPU into nohz_full boot parameter, though we are
> not going to forbid it.

It's already supported and unfortunately we can't remove that as that would
break kernel ABI.

-- 
Frederic Weisbecker
SUSE Labs
