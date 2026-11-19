Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049851;
	b=THsRmjLdpGiGybmi8Z9aXl8NKrAh6pFm4irKdklcOdQPGmFyBFu2wJG2mVj7MBX4fi4l
	 FsL5XuE+HkRtUfm86YhEspND82ehvxDO5UKlpnj3uI5PLBPq1IFRxemkjZqxFAPPA32yT
	 VJud52B4Lt1I5M2vFr1Vx/O8fBCuM+K6UchZtqQF0wswXlBJqwYus6xGqGQp7QyzKyU3K
	 OsQBevnMkm9WC9+DWTu59SlS7CbTGwaTOA0ODMWwmIJwLlmjiauOmxnPthrhC18ublgKd
	 QIhUpzMj67MoB1dtwt55I8xQnJxQDqEP1s9tmpW4PaddxO6h9ZQvBP9+uYpq8oCuJcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049851;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=0LnpsVqC6siU/73di3TPzMgPXTjkpav8RMqqpYcZlrQ=;
	b=bjU+fYmTkU7TiPXbQmyhn7P0u3cQs0MRQ0gBZal/xDLH1IzoCgb27tLGGk3tWNNzVdpC
	 fNZUoEmpYdwq7NrJfTMRKXT3svrjLFPOapX3KEngUMQfQE0ZRbMOf4faZOyAtMpA7I/Qk
	 Wta5I+swK/ylLRfP/76iv8vsgftPWjUkdGhrMXl0LQAV5tO+k/8z++6c4Ml7BVVh0yV9A
	 A8/KrHz1o8NFdlE9ciRjVCkIyFD35q5k7NoXWNF4IxR/3m9IfgnEhDL8+4SBn6Out/pul
	 yYGPwwHBl2lFX9SU1zHz4gh5K6e/qKw9M7sfFAsr83ox3iCkHNPMYyhinah1klqoWfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FOSQBcAL;
	arc=none smtp.remote-ip=95.215.58.38
Received: from mta1.migadu.com (out-38.mta1.migadu.com [95.215.58.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A948E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A948E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FOSQBcAL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WPQquKUTe68pkvSRN0JIiYqVwtCxkDbVbf03Vg+jdXw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795049848; v=1; x=1795654648;
 b=FOSQBcAL+tpefhGz9SYetP0/TZSgQVP/wDFYe+7hjYttfltoRZZdrMrGGAdgtkPPkgwOxCRG
 KY4YpgCZXuD68G8hJ/F904hFmIHbr6fxLevUFK/POxPwill6vC2VuNKxe3Iu2RFleHer0roFlSh
 oinb8zfMblT+sTXuq5ZegI0A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f2c1486e07125503;
	Thu, 19 Nov 2026 00:57:28 +0000
X-Mizu-Trace-ID: f2c1486e07125503
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Subject: [PATCH v2 0/3] sched/fair: Cut per-group work from sched domain
 rebuilds
Date: Wed, 18 Nov 2026 19:57:20 -0500
Message-Id: <20261118-bug-sched-fair-offline-active-v2-0-b6ede596c6a6@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHBJ/moC/42NQQqDMBBFryKz7pSYGC1deY/iIk0mOlC0JBosk
 rs39QT9u/c/vH9ApMAU4V4dEChx5GUuIC8V2MnMIyG7wiCFbOsSfG4jRjuRQ2844OL9i2dCY1d
 OhDcnWkWd0k55KI53IM/76X8MhSeO6xI+512qf+2/5lSjwMbrRktltelEX9ZtvzpKMOScv42UU
 tfKAAAA
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

A sched domain rebuild, from CPU hotplug or a cpuset partition change,
moves every active CPU to a new root domain through rq_attach_root().
For each of them rq_offline_fair() and rq_online_fair() walk all task
groups with the rq lock held and interrupts disabled, so a rebuild
costs O(nr_cpus * nr_task_groups). Dietmar pointed at the offline side
when f60a631ab9ed was reviewed [1]. Hosts running AI agent harnesses
commonly carry over a thousand cpu cgroups, and their VMs hot-add
vCPUs at run time.

Patch 1 tells the rq_online() and rq_offline() callbacks whether the
CPU actually changes state. Patches 2 and 3 use that to skip the two
fair walks when it doesn't.

With 4000 cpu cgroups on a 32-CPU VM booted with rt_group_sched=0
(median of 20 partition switches and 16 hotplug operations, all three
kernels measured in the same run):

  operation         base (ms)  patch 1-2 (ms)  patch 1-3 (ms)  change
  partition root        14.86            8.35            1.20    -92%
  cpu offline           49.99           33.91           16.49    -67%
  cpu online            36.10           31.02           12.87    -64%

Each rq_attach_root() call, which runs with interrupts disabled, takes
(1280 calls over the 20 partition switches):

  kernel      median (us)  p90 (us)  max (us)  change
  base                229       256      6987
  patch 1-2           122       162       988    -47%
  patch 1-3             2         3       118    -99%

With all three patches, partition switches and onlining no longer grow
with the number of groups; offlining still walks them once for the CPU
that goes down. With RT_GROUP_SCHED enabled, the rt.c runtime walks
remain.

K Prateek Nayak proposed separate rq_attach_root() and rq_detach_root()
callbacks for the root domain moves instead [2]. This series follows
Peter's suggestion of a hotplug argument to rq_online() and rq_offline();
I'm happy to redo it on top of Prateek's approach if that is preferred.

[1] https://lore.kernel.org/r/dbd36b16-4acb-415a-9bbd-258b2e022475@arm.com
[2] https://lore.kernel.org/r/e1a63a3c-3975-4b05-8ab4-518c37d867d6@amd.com

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
V1 -> V2:
- Pass a hotplug argument to rq_online() and rq_offline() instead of
  adding a member to struct rq, as Peter suggested
- Skip both fair task group walks on rebuilds, which leaves no second
  loop to merge
- Rebase onto tip/sched/core, where sched_ext no longer implements
  rq_online() and rq_offline(), and update the numbers from a new run

CPU hotplug and partition flips were also run with SCHED_FIFO tasks
(rt_group_sched=1, RT_RUNTIME_SHARE on and off), SCHED_DEADLINE tasks
and scx_simple loaded, plus the sched_ext selftests, with the same
results as on tip/sched/core (b251360cb2e6c).

v1: https://lore.kernel.org/r/20261111-bug-sched-fair-offline-active-v1-0-4f54523c5a70@linux.dev

---
Qiliang Yuan (3):
      sched: Tell rq_online() and rq_offline() whether the CPU changes state
      sched/fair: Skip rq_offline_fair() work for CPUs that stay active
      sched/fair: Avoid re-syncing runtime_enabled on root domain changes

 kernel/sched/core.c     | 12 ++++++------
 kernel/sched/deadline.c |  4 ++--
 kernel/sched/fair.c     | 15 ++++++++-------
 kernel/sched/rt.c       |  4 ++--
 kernel/sched/sched.h    |  8 ++++----
 kernel/sched/topology.c | 13 ++++++++++---
 6 files changed, 32 insertions(+), 24 deletions(-)
---
base-commit: b251360cb2e6c7b74d962831f5797a4520511b36
change-id: 20261111-bug-sched-fair-offline-active-8d063e735d3f

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

