Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795229865;
	b=LRQ4BQhSIqHqS8oVGfueZjXqBVZBKGVetYklmETAgFjjArWb/BJr3VgEpIC6csgsFkVL
	 lVKWs820kjykUWgLXIJY5MJ5B8sNw2SabAUKBIYZMglNRvILyBFl2MXp1IMSdTcO3xKua
	 nN5rJpoYndpIhSw9S8boZfTU4sAJG2rCAYx5+ca3vnDXbH7Qk5yh+5Sjtj4fPV5+qILtf
	 EXhSE8X5EMC0Eute/z8Wc+hDUvHsxJP4tZcYQXpY/fmzrHx+alyCp8r9q8awy0MlWAitp
	 /LlWbkMhq0bJiqePJ3kIx8+OpIjU42sLl0kAUUGMyy8JSDn+RkdI9NpT6DfyBRA5/4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795229865;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=NpM1hBpAqL6TruKvkKba6ihti27OsSFgtTJFbLRQSKA=;
	b=zQ3Q2jz8ewzuMxztjj3RZhuUNm5Qyo/HizUqTABJCkoMsKjvLJ4xv//at0u6JVNoUk3/
	 bV/oPiz6C2E7GyOmw5WjUdhnAqmgN9k2AlJ9tu0s8huENUEj8JxOya8EAXdFnx5QXCVhp
	 +sirdmHGs/Jg8zucoF8DZBJn2fX0qYSE6vwYWNWtQwSq8R+uMe4dxUr2VyUzWvVeH4uBc
	 Vx2ww9JnUYFjiQ15Nw4pgPbCDlaZp+/UPkHSrF2liURj0yMLOCSlvhIJbSudYyylKem81
	 zu9quWVZzBfOyQvDJwB5luub89XaocvVuCczqzFgSpn4zqxgx/WUdWvsI6eQRxkuKlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ID2WTG9D;
	arc=none smtp.remote-ip=95.215.58.220
Received: from mta1.migadu.com (out-220.mta1.migadu.com [95.215.58.220])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68F1606A69B
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 02:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E68F1606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ID2WTG9D
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SNxcP97DrMFSTzKl8YbePCg7uEhW1WeC0lpxno3jHZ4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795229852; v=1; x=1795834652;
 b=ID2WTG9DytpPTawOajfdywxKh44KOYTOox65HIszkGXacWM7zyhqcwpgM8myLQxkf8ndLrYb
 C/FdvaLuvwZcpaUPEM3ZMhDu7vvNYFDRlyzpDiXSOm1o9GCzhkAJcFVzlS+CWiqNr+GxSJhOF2d
 lcsybmC6+SEalWX97Fj1BGfI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a933601eed77272d;
	Sat, 21 Nov 2026 02:57:31 +0000
X-Mizu-Trace-ID: a933601eed77272d
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Subject: [PATCH v3 0/3] sched/fair: Cut per-group work from sched domain
 rebuilds
Date: Fri, 20 Nov 2026 21:57:23 -0500
Message-Id: <20261120-bug-sched-fair-offline-active-v3-0-325e9eefa56d@linux.dev>
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
X-B4-Tracking: v=1; b=H4sIAJMIAWsC/43NwQ6CMAyA4VcxO1szNjbQk+9hPIytgyYGzAYLh
 vDuDk7ctLe/Tb4uLGIgjOx2WljARJGGPoc8n5jtTN8ikMvNBBe6yAPN1EK0HTrwhgIM3r+oRzB
 2pIRQO64lVlI56Vk23gE9zbv/eObuKI5D+OzvUrFt/5VTARxKr0olpFWm4vd8neaLw8Q2OYmjV
 v/SRNYajQ7VVVtt9FFb1/ULAYqopRgBAAA=
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Li kunyu <likunyu@open-hieco.net>, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

A sched domain rebuild, from CPU hotplug or a cpuset partition change,
moves every active CPU to a new root domain through rq_attach_root().
It does so by taking the CPU offline and back online, and
rq_offline_fair() and rq_online_fair() then walk all task groups with
the rq lock held and interrupts disabled, so a rebuild costs
O(nr_cpus * nr_task_groups). Dietmar pointed at the offline side when
f60a631ab9ed was reviewed [1]. Hosts running AI agent harnesses
commonly carry over a thousand cpu cgroups, and their VMs hot-add vCPUs
at run time.

Based on Prateek's patch [2], patch 1 gives root domain moves their
own sched_class callbacks, which only rt and dl implement.
Patch 2 keeps CPUs that stay active online across a rebuild and moves
only their root domain state, so fair is no longer called for them.
Patch 3 drops a check in fair that patch 2 leaves dead.

With 4000 cpu cgroups on a 32-CPU VM booted with rt_group_sched=0
(median of 20 partition switches and 16 hotplug operations, both
kernels measured in the same run):

  operation       base (ms)  patch 1-3 (ms)  change
  partition root      15.97            1.19    -93%
  cpu offline         49.66           15.74    -68%
  cpu online          37.39           13.33    -64%

Each rq_attach_root() call, which runs with interrupts disabled, takes
(1280 calls over the 20 partition switches, change of the median):

  kernel      median (us)  p90 (us)  max (us)  change
  base                229       265      1335
  patch 1-3             1         1        10    -99.6%

Partition switches and onlining no longer grow with the number of
groups; offlining still walks them once for the CPU that goes down.
With RT_GROUP_SCHED enabled, the rt.c runtime walks remain.

[1] https://lore.kernel.org/r/dbd36b16-4acb-415a-9bbd-258b2e022475@arm.com
[2] https://lore.kernel.org/r/e1a63a3c-3975-4b05-8ab4-518c37d867d6@amd.com

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
V2 -> V3:
- Give root domain moves their own rq_attach_root() and rq_detach_root()
  callbacks, implemented by rt and dl, and keep CPUs that stay active
  online across rebuilds instead of passing a hotplug argument to
  rq_online() and rq_offline() (K Prateek Nayak)
- Keep putting a CPU that comes up online from the rebuild in
  sched_cpu_activate()
- Move the removal of the active CPU check in
  unthrottle_offline_cfs_rqs() into patch 3
- Update the numbers from a new run

V1 -> V2:
- Pass a hotplug argument to rq_online() and rq_offline() instead of
  adding a member to struct rq (Peter Zijlstra)
- Skip both fair task group walks on rebuilds, which leaves no second
  loop to merge
- Rebase onto tip/sched/core, where sched_ext no longer implements
  rq_online() and rq_offline(), and update the numbers from a new run

CPU hotplug and partition flips were also run with SCHED_FIFO tasks
(rt_group_sched=1, RT_RUNTIME_SHARE on and off), SCHED_DEADLINE tasks
and scx_simple loaded, plus the sched_ext selftests, with the same
results as on tip/sched/core (b251360cb2e6c).

v2: https://lore.kernel.org/r/20261118-bug-sched-fair-offline-active-v2-0-b6ede596c6a6@linux.dev
v1: https://lore.kernel.org/r/20261111-bug-sched-fair-offline-active-v1-0-4f54523c5a70@linux.dev

---
Qiliang Yuan (3):
      sched: Give root domain moves their own sched_class callbacks
      sched: Keep CPUs that stay active online across root domain moves
      sched/fair: Drop the active CPU check from unthrottle_offline_cfs_rqs()

 kernel/sched/core.c        | 31 +++++++++++++++++++++++++++++++
 kernel/sched/cpudeadline.c |  5 +++--
 kernel/sched/deadline.c    |  8 ++++----
 kernel/sched/fair.c        |  4 ----
 kernel/sched/rt.c          |  8 ++++----
 kernel/sched/sched.h       |  8 ++++++++
 kernel/sched/topology.c    | 20 +++++++++++++++++---
 7 files changed, 67 insertions(+), 17 deletions(-)
---
base-commit: b251360cb2e6c7b74d962831f5797a4520511b36
change-id: 20261111-bug-sched-fair-offline-active-8d063e735d3f

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

