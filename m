Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009291;
	b=BLLT+8orSway0s2hnGrO2KPKAgO77nQfCeNmjOfjskHvQNhyPsKYnArL8kuHHsTav/Ah
	 4/ADJYhYWKrehaGGvGEDBX2VXvtOYTBtTkD4Kg82/N67KMTgBfDKHk2F+l9z/OdPA7wHb
	 is0BBqMLLmq7nHn4OsR5GkKIv7hcsONrT6TvRIBVcqti4u1RWxkwPv4WBu3MWq0nQVgVy
	 EZGvhvPpS7a3E7VGkTzYI0eE4QNEGrd6uLHwZPgpT/HRuFUEtpWpbtbq9Wl8nHa0nH8dE
	 T3kA+C+kwCVxgZdyVx+JDkRJeX9fHKfsLdQN5gpW6RBADQZi/xm0ToEHzAoqSReFc4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009291;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Scanned-By;
	bh=t+8cW/gDIaKJoLLS3xYez2o0SiTBBAxEPE0CSZXSu4Q=;
	b=L6nhaI9bwGF13sK3eBpj4KBrjJGsnbtqJDpylFfQ4YAA7wnY2OhNHVQxPsmfl84APN2W
	 ujA697foGUdaLB8gyr+0zTlpzZZcAZ8iCdbbBSurGvhwmdBVU76zuuQuYKdJ8kkXtZp/w
	 MKHbwV0OyF0c3tFj8BYGHFGuaAvweFEZRwdFEAyFxOk6v1QBvM69C06/SpzB1InUUCS9w
	 Jw4yVVUN+16TEb3EtIwGb/qPTBc1nRQkhYJgFgSKMhzfbmX/kAkX0CbITZRuDaVn+njP9
	 n8J1XnlswwyItUw186ypsSM2QXz2t+93sIyyXtcTT/tIO1pAtxwftCIvYsvOQU2YJYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gquvEtoB;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFAC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AFAC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gquvEtoB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795009289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t+8cW/gDIaKJoLLS3xYez2o0SiTBBAxEPE0CSZXSu4Q=;
	b=gquvEtoBDpQpe0Dvn45JNpGzmoVlUa8rmwuVFbrpuDrFsiCqlGza0+8gKG7uLDpvRwd6bR
	8SDWih2TR3qSG56/wukbr+mNnXi6bm2aUAr4nrNU2qY0l+mNbvoXvGhtD9rQR7Qlszp0Eu
	2hbyesU7NXdhxSAWYNGa8pAYmYmMbvQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-20-UVzkpF5jOLO0-j3G2nTElA-1; Wed,
 18 Nov 2026 13:41:25 +0000
X-MC-Unique: UVzkpF5jOLO0-j3G2nTElA-1
X-Mimecast-MFC-AGG-ID: UVzkpF5jOLO0-j3G2nTElA_1795009281
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9145B1956057;
	Wed, 18 Nov 2026 13:41:19 +0000 (UTC)
Received: from pauld.westford.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 66640588;
	Wed, 18 Nov 2026 13:41:11 +0000 (UTC)
Date: Wed, 18 Nov 2026 08:41:09 -0500
From: Phil Auld <pauld@redhat.com>
To: Jirka Hladky <jhladky@redhat.com>
Cc: Chen Yu <chen.yu@linux.dev>, Tim Chen <tim.c.chen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Chen, Yu C" <yu.c.chen@intel.com>, Ingo Molnar <mingo@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Hillf Danton <hdanton@sina.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Jianyong Wu <jianyong.wu@outlook.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Tingyin Duan <tingyin.duan@gmail.com>,
	Vern Hao <vernhao@tencent.com>, Vern Hao <haoxing990@gmail.com>,
	Len Brown <len.brown@intel.com>, Aubrey Li <aubrey.li@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>, Chen Yu <yu.chen.surf@gmail.com>,
	Adam Li <adamli@os.amperecomputing.com>,
	Aaron Lu <ziqianlu@bytedance.com>, Tim Chen <tim.c.chen@intel.com>,
	Josh Don <joshdon@google.com>, Gavin Guo <gavinguo@igalia.com>,
	Qais Yousef <qyousef@layalina.io>,
	Libo Chen <libchen@purestorage.com>, linux-kernel@vger.kernel.org,
	"Luck, Tony" <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Joe Mario <jmario@redhat.com>
Subject: Re: [Patch v4 17/22] sched/cache: Avoid cache-aware scheduling for
 memory-heavy processes
Message-ID: <20261118134109.GA1417782@pauld.westford.csb>
References: <a2d7e7b2-5a4c-48bc-b567-61e3cbd17786@intel.com>
 <20260410092057.GG3126523@noisy.programming.kicks-ass.net>
 <CAE4VaGAZavgRWDf=ukaj_EJvOO52hTpAYKPe1JEtUE3E2q0y0w@mail.gmail.com>
 <13d982ce42116f876f01a77bae7f02d3800f08fc.camel@linux.intel.com>
 <avqYbuJPHo4zLDOd@three-body>
 <CAE4VaGAL5FPGUrG76pzf=9pJTaMWa60pbkLv-ZXCFjr5H2JpDg@mail.gmail.com>
 <879c23213859f24b12a23530d6ae849bbe504b6b.camel@linux.intel.com>
 <avxDmPs4rs39NC9O@three-body>
 <avxGoEVvohbK0nUS@three-body>
 <CAE4VaGD2idBi35zDQWCY2ybB0spz+tKEX5=59O5U5tBbjGuYAw@mail.gmail.com>
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
In-Reply-To: <CAE4VaGD2idBi35zDQWCY2ybB0spz+tKEX5=59O5U5tBbjGuYAw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95


Hi,

On Wed, Nov 18, 2026 at 04:06:55AM +0100 Jirka Hladky wrote:
> Hi Tim, Chen Yu,
> 
> Thank you both for the patches and the detailed design discussion.
> Two updates: the trace Tim asked for, and test results for the two
> patches.
> 
> PART 1: is NUMA balancing preventing the re-spread?
> 
> > Wonder if NUMA balancing is preventing the re-spread?
> > If your traces have numa_preferred_nid and task_numa_migrate activity
> > after the trip, that would confirm or rule out out.
> 
> I traced it on the Fix-2 test kernel (mg.D 1x64 CAS-on, two runs that
> aggregated on different nodes, same structure in both): per-thread
> numa_preferred_nid sampled at every context switch, sched_setnuma()
> and migrate_task_to() in the task's own context, every
> sched_migrate_task with origin and destination, and wakeup target
> CPUs, alongside the group state per epoch.
> 
> The short answer: yes, but only late, and it is not the main
> obstacle. The run decomposes into three phases:
> 
> 1. 0 - 4.9 s: consolidation. About 30 cross-node migrations toward
>    the aggregated node; the footprint crosses the threshold at
>    4.2 - 4.9 s and grp->cpu is cleared.
> 
> 2. Trip to sweep completion (4.9 - 35.8 s in the traced run): the
>    re-spread runs at about 0.5 net cross-node migrations per second
>    (thread placement 2/63 across the two nodes at t=4 s, 18/47 at
>    t=28 s), and numa_preferred_nid is -1 for every thread during this
>    whole window: sched_setnuma() first fires only when the sweep
>    completes and placement runs, at t=35.8 s. So the NUMA preference
>    cannot be what holds the re-spread back here. What the trace shows
>    instead: the wakeup placement keeps directing threads to the
>    aggregated node at roughly 2:1 to 3:1 throughout the window
>    (1264 vs 87 wakeups per 2 s at t=8 s, still 639 vs 380 at t=32 s;
>    these are OMP barrier wakeups landing near their wakers), while
>    the periodic balancer moves tasks out at only about 2 per 4 s.
>    The net drift is the difference.
> 
> 3. Sweep completion to end (35.8 - 42 s): placement sets
>    numa_preferred_nid to the aggregated node for 53 of 66 threads
>    (the pages have migrated there by then, so the fault statistics
>    point there, exactly your reinforcing loop). From this moment the
>    pull-back engages: migrate_task_to() toward the preferred node
>    appears, and the cross-node churn in the last 6 s is 8 moves out
>    vs 10 moves back, i.e. the spread stalls.
> 
> So NUMA balancing does prevent the re-spread, but only in the last
> 15 percent of the run. For the first 85 percent the preferred node is
> simply not set, and what holds it back is wake placement plus the
> conservative pace of cross-node load balancing. Resetting NUMA
> preferences at withdrawal would therefore not help this workload:
> the sweep outlives the run, so there is nothing to reset during the
> window that matters. And the wake-placement observation suggests the
> re-spread would stay slow even with preferences reset; an active
> re-spread may need to move the tasks and let the wake placement
> follow.
> 
> PART 2: test results for the two patches
> 
> I built a kernel from the same 7.4.0-0.rc2.19.eln159 source, with
> Chen Yu's sketch (as tested before) and both patches applied. Both
> applied cleanly. Same test battery as the earlier rounds, n=5
> medians for the NAS runs:
> 
>   workload             stock OFF  stock ON   patched OFF patched ON
>   NAS MG D, 1x64thr    26.45 s    41.78 s    26.38 s     26.47 s (+0.3%)
>                                                       (+58%)
>   NAS MG C, 1x4thr       9.34 s     11.99 s     9.38 s      9.36 s (-0.2%)
>                                                       (+28%)
> 
> Both reported regressions are gone. The mechanism trace shows why:
> grp->cpu = -1 in all 42,566 task_cache_work() samples over one
> CAS-on MG run. The aggregation never settles, not even during the
> warm-up: the RSS bound refuses within ~0.1 s of the allocation phase,
> before first-touch can skew anything. The hysteresis from PART 1
> never develops because there is nothing to unwind.

That is an excellent thing to see. Thanks for all the testing Jirka!

And thank you Tim and Chen Yu for being so responsive to our
issue.

...

> 
> I vote for keeping both fixes. They do different jobs: the RSS
> bound is the only thing that protects the window before the first
> sweep, which is where the memory-bound workloads take their damage,
> and the within-sweep accumulation is what makes the decision
> correct afterward and recovers the beneficial cases. The cost
> asymmetry settles the default: a wrongly granted aggregation cost
> us 58 percent, a wrongly refused one forfeits a 20 percent gain.
>

I agree both fixes seem worth having. 


> Two refinements seem worth considering on top:
> 
> - Hysteresis on the grant/withdraw decision. The VM trace showed a
>   boundary case as it sits close to the threshold, so the aggregation
>   flips as the window grows and the history decays. Withdrawing above
>   the threshold and re-granting below half of it, the pattern imb_pct
>   and overaggr_pct already use, would stabilize it.
> 
> - The tolerance splitting. aggr_tolerance was designed to scale the
>   footprint threshold, and it now scales the RSS bound too, so
>   tolerance 2 jumps the bound from 108 MiB to 27.5 GiB. That works
>   as an opt-in but is a blunt one; the per-group control from the
>   prctl RFC seems the better tool for "this large-RSS workload
>   wants aggregation", with the tolerance kept for the estimate.
>


These also look like reasonable refinements.

I may have missed it (or cut too much :), but how did this changed
kernel behave on all the other tests? That is, did it regress
else where?  I'm thinking it should be pretty safe since it
targets this use case and should not play a role in the
cases that did not hit this. 


Cheers,
Phil


> Happy to share the probe scripts or re-run anything.
> 
> Thanks,
> Jirka
> 
> [3] The VM test boots a small VM directly off the host's own kernel
>     and initramfs, with no guest OS install: 1 VM, 8 vCPUs, 25 GB of
>     guest memory. Two workloads run inside it, in this order: a
>     cache-locality test (process pairs exchanging data through FIFO
>     pipes, reported as ops/s) and a memory-bandwidth test (cp over a
>     216 MB buffer, twice this host's LLC, reported as MB/s). The
>     test records which physical CPUs the vCPU threads land on, which
>     is how the packing effect is measured. The long variant scales
>     the in-VM iterations 10x, to about 100 s per workload phase.
> 
> On Mon, Nov 17, 2026 at 12:39 AM Tim Chen <tim.c.chen@linux.intel.com> wrote:
> 

-- 

