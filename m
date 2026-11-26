Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.71.94.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698988;
	b=c8jX9Knw1MEF8A5gWRf6yoZZ/ObDgSOkUkIkIOfjzqXH3dl3nAVqsbDmr+DGOA/veQQI
	 3QZX01hlwxY71mmoA0Qzrd1kZKck3ptZf7PsoX/ziQ3vmAqk65tLOFEY6w8j7RtFvTdMQ
	 3PWifeDcvZLAp+CAw/WUtgyFVlmZoeG481EoToDjeckvJr+6zCP3KqdKcdvD1kUeIRy/0
	 KA9tJqB/pUlcRMrFkwnIS64NvYvCm1fcPj9foEpJz+ahAND1mWOkTSZ31ZhdU8MuM5t/5
	 3BFCo2gQJIKD+dFgYpLfdhQWI9EAUov47wmsr4nsqO/weGcyMFNxvr9nStc3TvSNaBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698988;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=oyFy3o2OibNE9mRXH6tBmY+2r9tJGvDJhzUmtpBxd/I=;
	b=v/CqyGjaF+qwLA6kUyifHrkUEehVzPaoJIz+2Y2Yi4bWdKZn98/vLRCLumcXsAGeCMSQ
	 5I2Q/FInQsLhdJDDktiRaWWkezZWgzhskkzhqIx1xq67/wXR7G9s/789+nGsn7mBcA1C1
	 O8WLW4CPfL6cDnPVVRsKsJ/XruORy81ViRi8wFDogaElQNrg9thx5eXgsI3TNXNv3oynr
	 VR78vm2HEhZNc9ZjFWkeoot8KiuudXlbmmeK5FuIzBn5qfIUYd3cd2Wv106Dd5H71HpEr
	 4qFqacTW4FU7Xp3HJwsWVgQAet5sLJeDEPCjlw5qxkZv5VI2fYJQu7ewZ0KPGcQBLsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=none smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=124.71.94.104
Received: from dggmsgout13.his.huawei.com (dggmsgout13.his.huawei.com [124.71.94.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27AA606A336
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B27AA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggmsgout13.his.huawei.com (SkyGuard) with ESMTP id 4jZxrT4LjHz1rrPy
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:16:09 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id BA3DE4056E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:16:14 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.193])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgAHDgEOMQhrq143Fw--.33284S2;
	Thu, 26 Nov 2026 21:16:10 +0800 (CST)
From: Luo Gengkun <luogengkun@huaweicloud.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Chen Yu <yu.c.chen@intel.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/7] sched/cache: Introduce per-task affinity group via BPF detector
Date: Thu, 26 Nov 2026 13:48:21 +0000
Message-Id: <cover.1795691926.git.luogengkun2@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgAHDgEOMQhrq143Fw--.33284S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar4UGr15tFW3tF1Utw1UZFb_yoWfJFW3pF
	Zxtrs3JFn7tw47WrZ7Aw4xWr1fGas3Wa43Jr1ftryfAF4Yyr15trW0yw18JFy7Cr93Cay2
	vrn0grZ29Fy2v3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAa
	w2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
	6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU17KsUUUUUU==
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/

Hi all,

Cache aware scheduling today groups tasks by their mm: the LLC aggregation
target lives in mm_struct, so the address space is the unit of grouping.
That works, but it is the wrong unit for a large class of workloads, and
the only knob we have over it is a single system-wide debugfs switch.

Threads are not the only way to share work.  Processes talk to each other
over IPC - a pipe, a socket, a shared buffer - just as often and just as
heavily, and the tasks at the two ends of that IPC have the same reason to be
on one LLC as two threads of one process do.  But they never share an mm, so
the scheduler's one grouping signal never fires for them, and today there is
no way to ask for the pairing.

So the core idea of this series is simple: make the grouping an object in its
own right, one that no mm owns - the same object Tim's prctl series [1] builds
from user space - and let a BPF program submit a hint for it instead, so that
no application has to change and no policy has to live in the kernel.  A hint
is one pair of tasks believed to be talking to each other: the program
observes the IPC, the two ends become one pair, and the scheduler decides what
to do with it.  A hint says "these two talk", never "put them here", so a
wrong one costs performance, not correctness.

What the series does
====================

Patches 1-2 are pure preparation, no behavior change.  They move the cache
group's allocation, init and reference lifecycle out of fair.c into
kernel/sched/cache_sched.c, and give the group an exact nr_threads.  The
counter is needed before the group can exist without an mm - get_nr_threads()
has nothing to count once the group is mm-less - and doing it first keeps the
next patch a pure addition.

Patches 3-4 introduce the object and make it work.  The cache group gains a
type; an affinity group is the type that owns no mm, and adds two members:
parent and rank.  Linking two groups that should be one is a pointer store on
the loser:

     t1    t2   t3   t4          t1    t2   t3   t4
      /   \      /   \            /   \      /   \
      [ A ]      [ B ]            [ A ]----->[ B ]

          before                     after

Patch 3 stops there, with A->parent set and no task yet following it, so the
merge can be reviewed as a data structure on its own.  Patch 4 is what makes
the link real: task accounting walks to the root and switches, at most once
per member per merge, and a task outside any affinity group pays a type read
and a parent read on the accounting path and nothing else.  The merge itself
is O(1) and does not care how many members either side has.

Patches 5-6 are the delivery path, and nothing calls it until patch 7.  The
consumer has to sleep and has to take rq locks, neither of which a BPF
program running in the pipe path may do, so a producer only enqueues into a
per-CPU lockless queue; a per-CPU worker drains it, and when the pool is
empty the hint is dropped rather than retried.  Two kfuncs are the whole
interface:

    s32 scg_bpf_submit_hint(u32 tid1, u32 tid2)
    s32 scg_bpf_submit_hint_tsk(struct task_struct *t1,
                                struct task_struct *t2)

Both are registered for tracing, kprobe, tracepoint and syscall programs, so
a detector can be written against whatever signal it likes.

Patch 7 is the reference detector, and it is a sample, not a policy: fentry
on anon_pipe_read and anon_pipe_write, keyed by the pipe_inode_info the two
ends share.  All senders of a hackbench-style group share one sender context,
so a pipe is written by several tasks in turn and read by one.  Remembering
only the last writer drops the reader state on every switch and re-queues the
same pair on nearly every read, so the per-pipe record keeps a small bounded
set of writers plus a bitmap of the pairs already hinted, and the bitmap is
tested before any task is resolved.  An ancestor check keeps a start/finish
barrier from chaining the coordinator to every worker it feeds.

Test results
============

The series was applied and tested on commit 97d73c825122.

    Machine:     2 socket AMD EPYC 9654 (Genoa)
    NUMA:        4 nodes, 48 cores / 96 CPUs per node, NPS2
    SMT:         on
    Per node:    6 CCDs
    Per CCD:     8 cores / 16 CPUs, one 32 MB LLC
    sd_llc_size: 16

    cas:       CONFIG_SCHED_CACHE alone, no BPF program.
    bpf hint:  this series with the pipe detector loaded.

 [hackbench, process mode]
             cas  bpf hint
            time  ratio [imp] (cv)
 --------  ------  -------------------------
 fd2 g1     9.00  0.75 [ +25.3%] (cv 19.0%)
 fd4 g1    18.80  0.62 [ +37.8%] (cv  2.2%)
 fd6 g1    33.08  0.73 [ +27.2%] (cv 13.8%)
 fd8 g1    49.45  0.65 [ +35.2%] (cv 11.9%)
 fd2 g2     9.48  0.62 [ +37.6%] (cv 15.6%)
 fd4 g2    19.73  0.68 [ +31.7%] (cv  9.0%)
 fd6 g2    34.47  0.73 [ +27.4%] (cv 21.7%)
 fd8 g2    51.82  0.68 [ +32.3%] (cv 18.5%)
 fd2 g4     8.47  0.76 [ +23.6%] (cv  6.6%)
 fd4 g4    19.92  0.74 [ +25.6%] (cv  2.2%)
 fd6 g4    38.37  0.68 [ +32.4%] (cv 12.9%)
 fd8 g4    52.77  0.81 [ +19.4%] (cv 16.6%)
 fd2 g8     9.25  0.77 [ +23.2%] (cv 12.6%)
 fd4 g8    23.86  0.62 [ +37.9%] (cv 12.6%)
 fd6 g8    39.68  0.75 [ +24.9%] (cv 13.4%)
 fd8 g8    53.88  0.84 [ +15.6%] (cv 14.6%)

 [hackbench, threads mode]
             cas  bpf hint
            time  ratio [imp] (cv)
 --------  ------  -------------------------
 fd2 g1     6.73  1.11 [ -11.1%] (cv 22.1%)
 fd4 g1    15.46  1.00 [  -0.1%] (cv 40.5%)
 fd6 g1    23.34  1.13 [ -12.5%] (cv 14.6%)
 fd8 g1    29.82  1.12 [ -12.1%] (cv 10.1%)
 fd2 g2     6.16  1.08 [  -8.0%] (cv 15.9%)
 fd4 g2    16.25  1.07 [  -7.1%] (cv 10.6%)
 fd6 g2    28.65  1.19 [ -19.0%] (cv  6.9%)
 fd8 g2    46.93  1.01 [  -0.7%] (cv  4.5%)
 fd2 g4     7.90  1.05 [  -4.6%] (cv 12.2%)
 fd4 g4    21.27  1.04 [  -4.0%] (cv 11.2%)
 fd6 g4    35.26  1.09 [  -9.2%] (cv  4.7%)
 fd8 g4    49.95  1.03 [  -2.8%] (cv  8.1%)
 fd2 g8     8.67  1.22 [ -21.6%] (cv  8.6%)
 fd4 g8    24.12  1.07 [  -6.8%] (cv  4.3%)
 fd6 g8    41.38  0.98 [  +1.8%] (cv 16.3%)
 fd8 g8    52.17  1.04 [  -4.2%] (cv  4.9%)

Comparing the two modes shows the expected trade-off.  In process mode,
pairing hints supply the grouping signal and outperform baseline CAS by
15.6%-37.9% across all configurations.

In thread mode, tasks already share an mm_struct, so baseline CAS already
groups them; here the detector only contributes the BPF program overhead
and the overhead of the hinting mechanism itself, resulting in a
0.1%-21.6% slowdown (typically ~5-10%). 

To isolate that instrumentation cost from scheduling behavior, we pinned a
pipe-heavy run (hackbench -g 2 --process --pipe -l 3000000 -f 2) to 8
CPUs within a single LLC so placement could not vary:

 [hackbench -g 2 --process --pipe -l 3000000 -f 2, pinned to 8 CPUs]
                time  [imp] (cv)
 --------  ---------  ----------------
 cas           3.155   [ +0.0%]  (cv 0.5%)
 bpf noop      3.401   [  -7.8%] (cv 0.3%)
 bpf hint      3.554   [ -12.6%] (cv 0.7%)

Furthermore, comparing process-mode with BPF hints directly against
threads-mode baseline CAS shows that BPF hints achieve even better
performance.  This is because BPF hints provide finer-grained grouping
information, allowing each communicating IPC group to form its own
independent sched cache group rather than gather the entire workload
under a single mm.

 [hackbench: process bpf-hint vs threads cas]
           thr-cas  proc-bpf  ratio [imp]
 --------  -------  --------  ---------------
 fd2 g1       6.73      6.72   1.00 [  +0.1%]
 fd4 g1      15.46     11.69   0.76 [ +24.4%]
 fd6 g1      23.34     24.08   1.03 [  -3.2%]
 fd8 g1      29.82     32.04   1.07 [  -7.5%]
 fd2 g2       6.16      5.92   0.96 [  +4.0%]
 fd4 g2      16.25     13.48   0.83 [ +17.1%]
 fd6 g2      28.65     25.03   0.87 [ +12.7%]
 fd8 g2      46.93     35.08   0.75 [ +25.2%]
 fd2 g4       7.90      6.47   0.82 [ +18.1%]
 fd4 g4      21.27     14.82   0.70 [ +30.3%]
 fd6 g4      35.26     25.94   0.74 [ +26.4%]
 fd8 g4      49.95     42.53   0.85 [ +14.8%]
 fd2 g8       8.67      7.10   0.82 [ +18.1%]
 fd4 g8      24.12     14.82   0.61 [ +38.6%]
 fd6 g8      41.38     29.80   0.72 [ +28.0%]
 fd8 g8      52.17     45.47   0.87 [ +12.8%]


[1] https://lore.kernel.org/all/
    cover.1787955777.git.tim.c.chen@linux.intel.com/

Luo Gengkun

Luo Gengkun (7):
  sched/cache: Move the cache group lifecycle to cache_sched.c
  sched/cache: Add thread count to cache group
  sched/cache: Introduce the task affinity group
  sched/cache: Converge task accounting to the affinity root
  sched/cache: Add the per-CPU hint queue
  sched/cache: Add BPF-facing hint submitters
  samples/bpf: Add pipe-based cache hint example

 include/linux/sched.h            |  23 +
 kernel/sched/build_utility.c     |   9 +
 kernel/sched/cache_sched.c       | 978 +++++++++++++++++++++++++++++++
 kernel/sched/cache_sched.h       |  20 +
 kernel/sched/fair.c              | 163 +-----
 samples/bpf/Makefile             |   4 +
 samples/bpf/scg_pipe_hint.bpf.c  | 361 ++++++++++++
 samples/bpf/scg_pipe_hint_user.c | 210 +++++++
 samples/bpf/scg_pipe_noop.bpf.c  |  24 +
 9 files changed, 1654 insertions(+), 138 deletions(-)
 create mode 100644 kernel/sched/cache_sched.c
 create mode 100644 kernel/sched/cache_sched.h
 create mode 100644 samples/bpf/scg_pipe_hint.bpf.c
 create mode 100644 samples/bpf/scg_pipe_hint_user.c
 create mode 100644 samples/bpf/scg_pipe_noop.bpf.c

-- 
2.34.1

