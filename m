Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795128600;
	b=fgA8Ubw/Qsz0Za3TtK4d1cjoFuYwxZHTPFEr3RRKvaSVVeacdPKv0kC2o/GT7JwPnbvF
	 BgNBjb2aiT4OKNvmIQG2zE382K/61kQDwnKQcI1Yc3SsudosSE+DlZXvEJIzSFdwZ89Nk
	 vSeXWY6PYoF76nW3kzGV/zKR2vHpZlqhG1PL8naQWVq+VbWGcv90dQWQ61NmiwQC1qjKq
	 OpLqHGMVZrRQ03CIOuQYwm2jER34xB0YDywlkymmgh2irN9k5HqP8ht3JG+FeEstEOJvD
	 eq0B44AAhZ6skhxuAhWl13aSDCAJv+n3rlQHVs6i8RaEOqR7x5q+g7nv9KSTVshK72w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=OjdvoyUmYbdh0HDEpImy3+98CX0v5JetVHazSlGmu9M=;
	b=RwvrTqbV86C5/++7hqEY/anognYGE79satUWkde6JDGGyhvRgxFIiFWt95P7KUh1bAYx
	 PTipvCOGTW361iJvoIFaO1jnDttB+DiKmgjPRNArhM2lVzdJ+MlIFwt5jsRuBUlpG1Fm7
	 HAEehSUVtJz/3bVJWqgODmYEnSqU8xzPztpzhYHys2Nuq7sKAf5bIZjWqab1gHa/zKgbK
	 ut+p34WRaSYkR90ixB11G3evQYFjYLGggWvLrUsBsNzI0+aD/zs971OvNu6pBVdxNbRDS
	 8uYIMl+zrpahaQinAxj0/YCbqh+T+JrR7iILLZ8xxaVoDcBJlTtrkrjy70KUcd/Dqbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ldy8ikZD;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49A0606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A49A0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ldy8ikZD
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38131260a5dso624426eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795128599; x=1795733399; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OjdvoyUmYbdh0HDEpImy3+98CX0v5JetVHazSlGmu9M=;
        b=Ldy8ikZDEy1madLkL26RoIbPNmeg+JkhMF9tQSidkCB74Ire1TApNE/TJDWDiDaJS5
         vj9UYWNcprbe39MT3Ks7FYKb5G3UXAmPeSfAbVPx4/umqTlk5yAUdcBBpfHR+5xwycLq
         JTnyDTOGaGtEJ74jBgau4VuBLbj/5d6ml+XbWR8A9R895A8+ipIMs8q8jINYGV7KUC8o
         BVCfcPI0YwTSXbVqt57lFffX0Tdnfr7enlV4xbocWZ4+zntRdqJD1XSfIIc9DI4HpWZe
         9sKKlstaOsrkAv01xJascqqG3YRcI8qMyk37ZeZlybzctB6i9h3bOnojGJyiZFXymK4Y
         1csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795128599; x=1795733399;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OjdvoyUmYbdh0HDEpImy3+98CX0v5JetVHazSlGmu9M=;
        b=0PtLjeNaNjxwRzg1owFH3I2Rykw7AKuI1dDv0q0BweML/nVJGAAhtcGxv05g3kyg+V
         XO9xCx/ayYqsgcNj4Qjsknf2IL4alMpRBxs7urq0eB0GamThWSNrQ9VhQdTrovRJCHJj
         MsohyZhz4RCOzgykfDUkR4IGHOxUJcYZ/HJJq+/m0LrajdV0ZaIkkk5Jo48IoV3zvdMQ
         Oe3FVL51o2y5oS/xihBKj1JrRt3snU+M//GBPIeuAvhikubasIhulEisrpyiNwW46JOr
         2yo3AlBoZw8wS2u+jzSvluBh6faRORdAfoA5zw3kGp/UCS60AsgTxVKaX/zIBjMuw+Rm
         8Ydg==
X-Forwarded-Encrypted: i=1; AL+hErEENTkZ9ZI4NBrUdqKNTokthxvMp2flK3aV+jEV9ywtJyjpjN1MSxwnvpWUpaPN+2NxUu8U5pf+JIbXir0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+otJR4wM3NxPuJ3ZkumIq2uu1lCt++4rOgx5O1Y13EAM5zv8Fd
	+Bel16LK0196WamlbCdP7dEOq2Ae9PVsMOGS6f/ZFv2vEU76yk7LjURj4iFD1HinMG36a3VuXl9
	7DgnphFosBfnQekWxPA==
X-Received: from dybuz23.prod.google.com ([2002:a05:7301:5097:b0:381:d719:7923])
 (user=penghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:80ce:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-3856f254a24mr724437eec.20.1795128598239;
 Thu, 19 Nov 2026 14:49:58 -0800 (PST)
Date: Thu, 19 Nov 2026 14:49:51 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261119224954.196990-1-penghuang@google.com>
Subject: [RFC PATCH 0/3] rwsem: priority boost for holders blocking
 high-priority waiters
From: Peng Huang <penghuang@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org, Peng Huang <penghuang@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

High-priority interactive threads (such as UI/render threads) can stall
for tens to hundreds of milliseconds on shared rw_semaphores like
mm->mmap_lock, inode->i_rwsem, or mapping->i_mmap_rwsem/invalidate_lock
when lower-priority (or SCHED_IDLE) read-owners are preempted on busy
CPUs and block an incoming higher-weight writer. Upstream
CONFIG_SCHED_PROXY_EXEC currently covers mutexes, and out-of-tree rwsem
proxy efforts only track a single write-owner, leaving multi-reader
inversions unaddressed.

This RFC proposes a lightweight priority-inheritance mechanism for CFS
rw_semaphore holders that accelerates stalled readers and writers in
parallel without requiring lock-side reader tracking.

Design rationale
----------------
1. Per-task hold tracking (avoiding lock-side reader lists):
   Because rw_semaphore allows unbounded concurrent readers, storing a
   reader list inside struct rw_semaphore would require dynamic
   allocation or extra locking in the down_read()/up_read() fastpath.
   Instead, each task records up to CONFIG_RWSEM_SCHED_BOOST_SLOTS
   (default 4) rwsem pointers in task_struct under current-only access.
   This supports an unlimited number of concurrent readers per rwsem;
   the slot count only caps simultaneous nested rwsems held by one task.

2. Contended waiter demand (sem->max_waiter_prio):
   Waiters in rwsem_down_{read,write}_slowpath() publish the lowest
   normal prio (i.e. highest nice weight, capped at MAX_RT_PRIO so CFS
   holders never escalate into RT/DL) into sem->max_waiter_prio,
   recalculating without redundant atomic writes as waiters wake/leave.

3. Per-rq runqueue list and parallel boost:
   Runnable CFS tasks holding at least one rwsem are linked onto a
   per-CPU list (rq->held_rwsem_tasks) during enqueue/dequeue/migrate
   under rq_lock, keeping lock/unlock fastpaths list-free. Normal short
   holds never touch rq->held_rwsem_tasks; tasks are only linked if
   preempted, enqueued, or crossing a tick while holding a lock, so tick
   and idle-pull typically exit immediately on an empty list with zero
   iteration or max_waiter_prio lookups. Across wakeup, preemption, tick,
   and idle-balance pull paths, the scheduler checks held locks'
   sem->max_waiter_prio and elevates the holder's effective priority and
   EEVDF weight (preserving static_prio/nice and handling SCHED_IDLE
   separately) down to min(p->prio, max_waiter_prio), restoring cleanly
   on unlock. Runtime/build disablement is provided via
   rwsem_sched_boost=0, CONFIG_RWSEM_SCHED_BOOST_SLOTS=0, or PREEMPT_RT.

4. Model trade-off (Parallel priority spray vs. Proxy Execution):
   Proxy Execution follows task->blocked_on to boost one owner at a
   time on the owner's CPU (entailing cross-CPU proxy migrations and
   requiring a lock-side owner list for readers), while naturally
   propagating transitively across mutex/futex/rwsem chains. By
   contrast, this RFC avoids lock-side reader tracking and lets all
   preempted readers on any CPU boost and drain in parallel once
   contended, at the intentional cost of not propagating transitively
   through mutex/futex chains (e.g. RT -> mutex -> rwsem).

Validation & known trade-offs
-----------------------------
- Included KUnit suite (Patch 3/3, CONFIG_RWSEM_SCHED_BOOST_KUNIT_TEST):
  Reproducible under ARCH=um via kunit.py (10/10 pass incl. SCHED_IDLE
  cap, interleaved unlock, and slot overflow):
  * Preemption inversion (n=3, 4 nice=0 hogs):
    Control mean 1939 ms (max 1970 ms) -> Treatment mean 49 ms (-97.5%)
  * Uncontended fastpath (1,000,000 ops):
    read +2.75 ns/op (21.43 -> 24.18),
    write +1.99 ns/op (20.78 -> 22.77),
    nested2 read +4.31 ns/op (21.20 -> 25.51)
- ARM64 mobile hardware (6.18 backport, asymmetric SMP, user-space
  madvise/mprotect stress reproducer):
  * mmap_lock inversion (nice -10 madvise vs 7 nice 0 mprotect hogs):
    - Unpinned 5-round AB (100 runs): mean 120.22 -> 7.26 ms (-94.0%),
      missed 16ms deadlines 46/100 -> 8/100
    - Mid-cluster pinned 4-round AB/BA (80 runs): mean 281.11 ->
      7.34 ms (-97.4%), max 736.14 -> 50.76 ms, missed 16ms 80/80 -> 4/80
  * Big-core pinned syscall fastpath (big core, 4 rounds x 100k iters):
    madvise 615.8 -> 604.8 ns/op (-1.8%),
    mprotect 857.5 -> 848.5 ns/op (-1.0%)
  * Contended equal-priority non-inversion (4 threads, Mid pinned):
    145.5 -> 162.5 ms (+11.7% throughput trade-off under contention;
    also +10.8% in x86_64 QEMU -smp 4 TCG)
  * Pinned hackbench / pipe ping-pong (Mid+Big):
    hackbench 263.7 -> 243.3 ms (-7.7%),
    pipe 10.81 -> 10.33 us/op (-4.4%)

Request for feedback
--------------------
Before iterating further, feedback is especially welcome on:
- Parallel priority spray (task-slot tracking) vs. extending Proxy
  Execution with lock-side reader tracking, vs. a slowpath/owner-only
  heuristic;
- Using normal prio / nice weight as the demand currency vs. EEVDF
  virtual deadline / lag considerations;
- Struct size impact of adding max_waiter_prio to struct rw_semaphore
  (+8 bytes aligned on 64-bit, 32 -> 40 bytes, embedded in inode/mm);
- Intentional RFC boundaries: 4-slot nested limit per task, boosting
  all concurrent readers equally, idle-pull inspecting only the
  busiest rq (no global CPU scan/cpumask), no cgroup/task_group share
  propagation, and no transitive inheritance across mutex/futex chains.

Per Documentation/process/generated-content.rst: Jetski AI coding
assistance was used for drafting, refactoring discussions, and KUnit /
benchmark verification; all patches and tests have been reviewed and
verified by the author.

Peng Huang (3):
  locking/rwsem, sched: track held rwsems and waiter priorities
  sched: boost rwsem holders with contended high-priority waiters
  locking/rwsem: add KUnit tests for scheduler priority boost

 .../admin-guide/kernel-parameters.txt         |   5 +
 include/linux/rwsem.h                         |  28 +
 include/linux/sched.h                         |  16 +
 init/init_task.c                              |   4 +
 kernel/Kconfig.locks                          |  15 +
 kernel/locking/Makefile                       |   1 +
 kernel/locking/rwsem.c                        | 209 +++++++-
 kernel/locking/rwsem_sched_boost_test.c       | 504 ++++++++++++++++++
 kernel/sched/core.c                           | 211 +++++++-
 kernel/sched/fair.c                           |  51 ++
 kernel/sched/sched.h                          |  70 +++
 kernel/sched/syscalls.c                       |   2 +-
 lib/Kconfig.debug                             |  10 +
 13 files changed, 1101 insertions(+), 25 deletions(-)
 create mode 100644 kernel/locking/rwsem_sched_boost_test.c

-- 
2.56.1.750.gf70dc682cf-goog

