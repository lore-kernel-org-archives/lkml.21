Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794971231;
	b=IvRUKvSdYETBqCzdYiIYitdwaAKIY9hYaAgG23i5spfzCIEDKMqyey2/hTTCZHVxwHqz
	 H+2z9zr2JRbdBnxc75XtfGvrVKdMV+xeW+jdI9ZjXWptQctwUzxME+p/UtA0VmiSZF3PD
	 CTDMOeOmyO/03pQXQWBtUI86I6Wrew+2SkFzN8hB5n2hGTeAqZQPcmjCcUcELDhF1/qJx
	 mRviwU523LNuU7ez2ze9kX2NZvLLtdxXmY1TB1QHtu2ThTNUxF1C82EiFPsRbgnPAY4EF
	 5gtGloW04zVyPo1lV19j3DtEDuiiH+sup/YLh1fZNmcM+g8p7i/90QIg0ATWJw5dfTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971231;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=kysJ1HDuW0DMB+nfNSrlI72YXjyjqOWKk6yfxl+bUkA=;
	b=OQ9oFIxNbyquZT0kdN/zep5GFBViWOhDEF8PXti68wtO9pfYZugNSVSjgR3cGPzFoaVa
	 AzIUNA11DCQyRlL5DZoh3xJ43sGC+vNFoqRMolRXogYrwohB/++3EAba8EcXvvmtzmglm
	 CnkVNIkZ8oLecyWLe18WyasQttSfwVvbN1UcaZz4zMA0ogAtsAGddCjr/fl4HXul1Fucj
	 p2Z0mpu9joSZ/Hkx0HnzzbQtOM3YIGQ/YobEazqajmarKcUSuutGJQqykLZVaIYnyYtRX
	 TK8ECMF/B6hu3Udf+VfaupXVDqISvRMFtjwEj6A6ZHnbuG4e/0R90XRNfPb4j+BukeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dL4gRxiR;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BW5U2AAq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEB8606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEEB8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dL4gRxiR;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BW5U2AAq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794971229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kysJ1HDuW0DMB+nfNSrlI72YXjyjqOWKk6yfxl+bUkA=;
	b=dL4gRxiRBrn3FUNDR7jG1i0zyoap8DP19py2rFy7/QLYM8lMSLocJyG+9keZ3qZ2f9rV+7
	gbPqKtrxfy0hEtvPaqh4fRUIlvAaXuyKnOGdCROZiTuOya8M0ASfRzXWgebft4v5l/omvx
	lDLtJ32acUEFl6biVnxQP6ZsL6Mdz/0=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-5HEavrUZOeGvkMcyS_DusQ-1; Tue, 17 Nov 2026 22:07:08 -0500
X-MC-Unique: 5HEavrUZOeGvkMcyS_DusQ-1
X-Mimecast-MFC-AGG-ID: 5HEavrUZOeGvkMcyS_DusQ_1794971228
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ee30bf935eso127118e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:07:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794971228; cv=none;
        d=google.com; s=arc-20260327;
        b=F5uott3cTOIOhTklvpAAexijGa42sLhlQGcdJiMMe0ScyCygfd1YnC/sIKPqDg+udz
         PCupOrN/SGKRDz0jG5IjtLBc96An1GBrxKhhQpbAKCRaVODhOKKk2SI1mVLf5/9NlBEM
         mnEPIhHI5FxSlv4+1b+kubtlOIc9ic+263HBAujzU7ltg0mDDvY5BgRGAy03oUuTrcDM
         Gb4XLkn/LyG+9FRWNb8SnXKblcJPJ3rClbZnHCpkYXFQBkQEebP2LSh/E+jaf/RkbYy2
         UIyIj+e/NqQ3baNSVESKxEVwXfL5uoqegCou6tezdY7UYkoOniS1YcEs5F/2FH1MQo8y
         PgXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kysJ1HDuW0DMB+nfNSrlI72YXjyjqOWKk6yfxl+bUkA=;
        fh=OGanz/rgI5qjUjsHIbKU5oid/9J4HSGS5CVPdCuknHM=;
        b=b4bVtenKViAuVvcQ1sM64JXO0Fwv2z/sxxj7S2fSpGLad9PufRbwLNjOHy+u8TW0q2
         mrJ5ZxbB9b6UKJFn+6+MDb6JuiBXEPVdZhiniGnKORFsGd31hHwJzZr2JGdjO0z4WVyl
         7N3Sv4FYXKH27dAXIoYeNgEOPwGj5Q5hHNkH+04egEyL6r3biGH3/PAMoTx/blxSIhYS
         WeBz8ocEuO1XjsSWhV8pBhQaXvm0D2mOyc9fJtIS8CECQmuzYYeFIAcAQk8c97Sjcxow
         SlCrwjCio+3obHf0Co69QvFDSzIX/P5tGe5vShkwyk1t+fE1f9p5+rTzMWvUZNAZ/xsI
         JPsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794971228; x=1795576028; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kysJ1HDuW0DMB+nfNSrlI72YXjyjqOWKk6yfxl+bUkA=;
        b=BW5U2AAqpA2aQia78Vm4sN0s7bF1ic46Cz9uXAIJDljboxI0NBUkfbhSDW96ik4Rhm
         cecl/4RISiv/qrUfiU9E4cNpdMSWXSn3pP1PJ1TX//sTu6S942A6+5ulacBAQ9ijah2V
         mPqWrr0vOcig+sKAjPMEYdl4msf3Fizr7ViJIRk5wtgpSB2xTmUfsey1DSkJl/547PeS
         tF27SjEee+XTIPfj8SOgnejzci9s7rlwS5L9IghASaqB3dGrG/mgkKbfMpkUpYqDc4uY
         xDQANhWkaKBb6BqU5nfaKA0BRkNpR/E5uZadEEYv81hqj9fBQr13lw2l3jflk9UYhVDg
         COmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794971228; x=1795576028;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kysJ1HDuW0DMB+nfNSrlI72YXjyjqOWKk6yfxl+bUkA=;
        b=L02xCK9lqm0TB62EIS7x0JZ61ZbLYdENq8einTnavapUC4nIYgz2jSysMgsv55RUtq
         Aio/TCAmacXzfBcWOdi83J3DvFkyPVHSmwI3tTCdbdt9z/eQNqPfciWD0k8IKyBAImVi
         Om8Jynd8+O6Ixyx9KC3rn5O3ZQjX9Cz9xnQAfZAWI1YUsrWFknDNQLJAe2meyqyvrTTI
         IYtW0kboIBqxGnfcIs54qa0xeX+yiTymWpyNtFIBQgpzZRgTVwxvSsVm2sVJz2zTV5B0
         TfsvBHr/57CT6gfFDYFrf4VLuQqdjVqKqCNFCue9iNJ5Sz8aLBugWSYpAA0NoWJOti2p
         47sw==
X-Forwarded-Encrypted: i=1; AL+hErE0/rDFu0lwGIb7v0+MRmg6EDwHVnaQtzC4+sRppxouXUxDa/Kj7WHbWgIt2Q95H+o1R08/I9EP8jXjnlU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fgBNRPYQJZ8MNfItfIUwN7M3NML22Cm5ZodRVuYt6h5U7SbMp
	KrIjfioCP/qW68ww43qeiWSY+eFvX+tU2NJk1PTFsVHv/VG7dGW58qexocJgxNUIDJNpqUIpmje
	PKoPnJhBhClA/GmbJyZw6pWDkPdK3Bp7nIODrqXe7ED5o9BgoFLUAgn40sK59V47uUDCjjf9EvM
	oQTix/7KOLFEgYBSbtcNlyaO6/QJnVKACg2UwTUjEA
X-Gm-Gg: AYBFou1dBw1AO7tA1s2cEJ91hub+1NAvf3wMNBKU+7MnNoT4RJBmkSbfXUSjSfG097U
	h1+xezdQNPqDr4CgHmXEM0p1fr7Ifn4S9wYO5ZDnELzpONd0N17AdSQRCAYVqquYixMxTQgEUCI
	7WwvfqZD1ay9d21n4Pwt++cXWawuWLYAXw29G2GzHhlCBjZPar65K5P7Xb
X-Received: by 2002:a05:6122:1c10:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5ee645f5852mr805954e0c.1.1794971227453;
        Tue, 17 Nov 2026 19:07:07 -0800 (PST)
X-Received: by 2002:a05:6122:1c10:b0:5c8:46e3:ec57 with SMTP id
 71dfb90a1353d-5ee645f5852mr805913e0c.1.1794971226867; Tue, 17 Nov 2026
 19:07:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <339bb2636c7306e17540268a9295a8e673b92804.1775065312.git.tim.c.chen@linux.intel.com>
 <20260409124642.GC3126523@noisy.programming.kicks-ass.net>
 <a2d7e7b2-5a4c-48bc-b567-61e3cbd17786@intel.com> <20260410092057.GG3126523@noisy.programming.kicks-ass.net>
 <CAE4VaGAZavgRWDf=ukaj_EJvOO52hTpAYKPe1JEtUE3E2q0y0w@mail.gmail.com>
 <13d982ce42116f876f01a77bae7f02d3800f08fc.camel@linux.intel.com>
 <avqYbuJPHo4zLDOd@three-body> <CAE4VaGAL5FPGUrG76pzf=9pJTaMWa60pbkLv-ZXCFjr5H2JpDg@mail.gmail.com>
 <879c23213859f24b12a23530d6ae849bbe504b6b.camel@linux.intel.com>
 <avxDmPs4rs39NC9O@three-body> <avxGoEVvohbK0nUS@three-body>
In-Reply-To: <avxGoEVvohbK0nUS@three-body>
From: Jirka Hladky <jhladky@redhat.com>
Date: Wed, 18 Nov 2026 04:06:55 +0100
X-Gm-Features: AclHuK_dXo8_rXO1-eYkaMaouH9ZQLeGbGf6CYkizGRmH9HlI8WDrRtQzUvBywc
Message-ID: <CAE4VaGD2idBi35zDQWCY2ybB0spz+tKEX5=59O5U5tBbjGuYAw@mail.gmail.com>
Subject: Re: [Patch v4 17/22] sched/cache: Avoid cache-aware scheduling for
 memory-heavy processes
To: Chen Yu <chen.yu@linux.dev>
Cc: Tim Chen <tim.c.chen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Chen, Yu C" <yu.c.chen@intel.com>, Ingo Molnar <mingo@redhat.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, "Gautham R . Shenoy" <gautham.shenoy@amd.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
	Hillf Danton <hdanton@sina.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Jianyong Wu <jianyong.wu@outlook.com>, Yangyu Chen <cyy@cyyself.name>, 
	Tingyin Duan <tingyin.duan@gmail.com>, Vern Hao <vernhao@tencent.com>, 
	Vern Hao <haoxing990@gmail.com>, Len Brown <len.brown@intel.com>, 
	Aubrey Li <aubrey.li@intel.com>, Zhao Liu <zhao1.liu@intel.com>, 
	Chen Yu <yu.chen.surf@gmail.com>, Adam Li <adamli@os.amperecomputing.com>, 
	Aaron Lu <ziqianlu@bytedance.com>, Tim Chen <tim.c.chen@intel.com>, 
	Josh Don <joshdon@google.com>, Gavin Guo <gavinguo@igalia.com>, 
	Qais Yousef <qyousef@layalina.io>, Libo Chen <libchen@purestorage.com>, 
	linux-kernel@vger.kernel.org, "Luck, Tony" <tony.luck@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Philip Auld <pauld@redhat.com>, 
	Joe Mario <jmario@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi Tim, Chen Yu,

Thank you both for the patches and the detailed design discussion.
Two updates: the trace Tim asked for, and test results for the two
patches.

PART 1: is NUMA balancing preventing the re-spread?

> Wonder if NUMA balancing is preventing the re-spread?
> If your traces have numa_preferred_nid and task_numa_migrate activity
> after the trip, that would confirm or rule out out.

I traced it on the Fix-2 test kernel (mg.D 1x64 CAS-on, two runs that
aggregated on different nodes, same structure in both): per-thread
numa_preferred_nid sampled at every context switch, sched_setnuma()
and migrate_task_to() in the task's own context, every
sched_migrate_task with origin and destination, and wakeup target
CPUs, alongside the group state per epoch.

The short answer: yes, but only late, and it is not the main
obstacle. The run decomposes into three phases:

1. 0 - 4.9 s: consolidation. About 30 cross-node migrations toward
   the aggregated node; the footprint crosses the threshold at
   4.2 - 4.9 s and grp->cpu is cleared.

2. Trip to sweep completion (4.9 - 35.8 s in the traced run): the
   re-spread runs at about 0.5 net cross-node migrations per second
   (thread placement 2/63 across the two nodes at t=4 s, 18/47 at
   t=28 s), and numa_preferred_nid is -1 for every thread during this
   whole window: sched_setnuma() first fires only when the sweep
   completes and placement runs, at t=35.8 s. So the NUMA preference
   cannot be what holds the re-spread back here. What the trace shows
   instead: the wakeup placement keeps directing threads to the
   aggregated node at roughly 2:1 to 3:1 throughout the window
   (1264 vs 87 wakeups per 2 s at t=8 s, still 639 vs 380 at t=32 s;
   these are OMP barrier wakeups landing near their wakers), while
   the periodic balancer moves tasks out at only about 2 per 4 s.
   The net drift is the difference.

3. Sweep completion to end (35.8 - 42 s): placement sets
   numa_preferred_nid to the aggregated node for 53 of 66 threads
   (the pages have migrated there by then, so the fault statistics
   point there, exactly your reinforcing loop). From this moment the
   pull-back engages: migrate_task_to() toward the preferred node
   appears, and the cross-node churn in the last 6 s is 8 moves out
   vs 10 moves back, i.e. the spread stalls.

So NUMA balancing does prevent the re-spread, but only in the last
15 percent of the run. For the first 85 percent the preferred node is
simply not set, and what holds it back is wake placement plus the
conservative pace of cross-node load balancing. Resetting NUMA
preferences at withdrawal would therefore not help this workload:
the sweep outlives the run, so there is nothing to reset during the
window that matters. And the wake-placement observation suggests the
re-spread would stay slow even with preferences reset; an active
re-spread may need to move the tasks and let the wake placement
follow.

PART 2: test results for the two patches

I built a kernel from the same 7.4.0-0.rc2.19.eln159 source, with
Chen Yu's sketch (as tested before) and both patches applied. Both
applied cleanly. Same test battery as the earlier rounds, n=5
medians for the NAS runs:

  workload             stock OFF  stock ON   patched OFF patched ON
  NAS MG D, 1x64thr    26.45 s    41.78 s    26.38 s     26.47 s (+0.3%)
                                                      (+58%)
  NAS MG C, 1x4thr       9.34 s     11.99 s     9.38 s      9.36 s (-0.2%)
                                                      (+28%)

Both reported regressions are gone. The mechanism trace shows why:
grp->cpu = -1 in all 42,566 task_cache_work() samples over one
CAS-on MG run. The aggregation never settles, not even during the
warm-up: the RSS bound refuses within ~0.1 s of the allocation phase,
before first-touch can skew anything. The hysteresis from PART 1
never develops because there is nothing to unwind.

The VM reproducer [3], the workload that benefits from packing,
shows one cost of the patches and one way around it:

  VM runtime:   stock off 22.12 s, stock on 17.66 s (-20%)
                patched off 21.81 s
                patched on, tol=1: 22.47 s (+3.0%, win lost)
                patched on, tol=4: 17.70 s (-18.9%, win back)

  cache-locality: tol=1: -4.6%, tol=4: +24.6%
  mem-bandwidth:  tol=1: +2.5%, tol=4: +30.6%

The win is lost at the default tolerance: qemu's RSS (guest memory,
all anon) far exceeds the 108 MiB LLC, and the first sweep of its
~25 GB address space takes ~100 s while a reproducer pass runs ~20 s,
so the bound governs throughout and aggregation is refused. At
aggr_tolerance=4 the bound is (1 + 3*256) x 108 MiB = 83 GiB, qemu
fits, and the win returns. The tolerance knob thus doubles as the
opt-in for large-RSS workloads that benefit from aggregation.
Splitting the two, so the tolerance scales only the estimate and
not the bound, may be worth considering; either way the coupling
deserves a line in the documentation.

On Chen Yu's question, whether Fix 1 is still needed if Fix 2
accumulates the RSS bound: the data says yes for the regression
class. The bound is what refuses aggregation for MG D and MG C,
because their fault-based estimate never exists within a run (the
sweep is too slow), and Fix 2 alone recovered only one sixth of the
regression in the earlier test.

Fix 2 correcting the initial placement does happen for a
long-running VM, and I traced it. I ran the VM reproducer with the
in-VM workloads scaled 10x (about 100 s per phase, 4 minutes per
pass). The group state over the CAS-on pass at the default
tolerance:

  t=0      VM boots; rss_bound is 0 for the first epoch, CAS
           aggregates for ~0.1 s until the first RSS sample lands
           (435k pages), then refuses.
  t=16 s   the first scan sweep folds: the history becomes 27,298
           pages, the VM's actual hot set, within 1.3 percent of
           the 27,648-page LLC. The estimate takes over from the
           RSS bound, the check passes, and the aggregation is
           granted: grp->cpu is set for the first time since boot.
  t=19 s   the bandwidth phase grows the current window to 23,576
           pages; max(history, history/2 + window) crosses the
           threshold and the aggregation is withdrawn.
  rest     stably refused; the estimate stays above the threshold.

So the mechanism works exactly as designed end to end: the bound
guards the window before the first sweep, the estimate corrects the
decision afterward, and the flat combination catches the growth
within the sweep. This VM is a boundary case by accident rather
than design: its workload data is tiny, but the guest kernel and
initramfs dominate the hot set, which was never sized against the
LLC. Either way it is precisely the flip territory your max()
smoothing addresses.

The aggregate numbers reflect how little of the run the granted
window covers: the long pass ends at -2.9% runtime, +2.4%
cache-locality, +6.0% bandwidth, against -20% for the stock kernel
and +3.0% for the same patched kernel with the short (~20 s)
workload. A persistent VM partially recovers the benefit.

One race worth noting: rss_bound is sampled at the first
task_cache_work() epoch after group creation, so for about 0.1 s
the bound is 0 and CAS can aggregate. In the traced run that blip
was enough to set the initial vCPU placement (the threads clustered
and never moved afterward; the box is idle and nothing pulls 8
threads back). Sampling rss_bound at group creation in
mm_init_sched(), or withholding aggregation until the first sample,
would close it.

Putting the three rounds of testing together, my recommendation:

I vote for keeping both fixes. They do different jobs: the RSS
bound is the only thing that protects the window before the first
sweep, which is where the memory-bound workloads take their damage,
and the within-sweep accumulation is what makes the decision
correct afterward and recovers the beneficial cases. The cost
asymmetry settles the default: a wrongly granted aggregation cost
us 58 percent, a wrongly refused one forfeits a 20 percent gain.

Two refinements seem worth considering on top:

- Hysteresis on the grant/withdraw decision. The VM trace showed a
  boundary case as it sits close to the threshold, so the aggregation
  flips as the window grows and the history decays. Withdrawing above
  the threshold and re-granting below half of it, the pattern imb_pct
  and overaggr_pct already use, would stabilize it.

- The tolerance splitting. aggr_tolerance was designed to scale the
  footprint threshold, and it now scales the RSS bound too, so
  tolerance 2 jumps the bound from 108 MiB to 27.5 GiB. That works
  as an opt-in but is a blunt one; the per-group control from the
  prctl RFC seems the better tool for "this large-RSS workload
  wants aggregation", with the tolerance kept for the estimate.

Happy to share the probe scripts or re-run anything.

Thanks,
Jirka

[3] The VM test boots a small VM directly off the host's own kernel
    and initramfs, with no guest OS install: 1 VM, 8 vCPUs, 25 GB of
    guest memory. Two workloads run inside it, in this order: a
    cache-locality test (process pairs exchanging data through FIFO
    pipes, reported as ops/s) and a memory-bandwidth test (cp over a
    216 MB buffer, twice this host's LLC, reported as MB/s). The
    test records which physical CPUs the vCPU threads land on, which
    is how the packing effect is measured. The long variant scales
    the in-VM iterations 10x, to about 100 s per workload phase.

On Mon, Nov 17, 2026 at 12:39 AM Tim Chen <tim.c.chen@linux.intel.com> wrote:

