Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009508;
	b=Mn9FVCN54KkNHO2FaiC5RO0Xe5hLL7QgmgYDqqBqwmRJxHi22BRaJ5/MJJOsGzh6Iqen
	 SmkUs3205jknXmZ6Qf0ZGoSF4kWU/F1nlvl0c2udpAWD3qe7rKintBaiLXnC8s2imVERx
	 ty2kl5NZo99eGElxyV5xFllG0TmTmBrPkl8fSA7Au3I6eTx9Ca/cL1AEzoXKA3vKYJW76
	 zvdzlLmxPwyp6ZJuWSJROwCNJxcIUc57Bp452GGYC2ubgutfmK2zxfO6jyKnNTuvwpWSV
	 /LT4sWi3NEYLrBKfGV1oSH3eaEYwVRq9gxGq80scYGJgpyKYBBdFndHvoFBcGtnKy3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009508;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=PjrEHtJWTZplJvlyHUPEpmdlAZVgPQmhBaGWk/K3vkI=;
	b=ctuMqt9aBl7vWRqVCjZj6rBvvIINhYvA2z2QOpMD1QWElD1olUFMTqivCvH1qplc2yzj
	 UXh1oPe5cbnSF+hYoa3xIOEst4AnUr0nx+ugoyC0gzmTrG8nwSCGRhbiDBfYl/E23n9VZ
	 OxoeKZs+im4CdWOMLz2wbtozoyprlWR7DykChmh0hcicjnR6QB25Qey2q8660ISwxm25x
	 ov9jIUFd2bqhLuTSoULomtWlbJuuwFjLNFDvjO66nQpkmZSSsa1HjUomyq4ZPCQ0MCsWD
	 fIfcMmVJyNxIHglNXL7bw1q55g6sDKCz4ESecyx5bYxv5Lq30NskbD2hWb/QxU/m77A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=snlOxsJ3;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ESjS5BiC;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB74606A334;
	Wed, 18 Nov 2026 13:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBB74606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=snlOxsJ3;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ESjS5BiC
Date: Wed, 18 Nov 2026 13:45:04 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795009506;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PjrEHtJWTZplJvlyHUPEpmdlAZVgPQmhBaGWk/K3vkI=;
	b=snlOxsJ34bYOHOU6bNIT6xEcXoPMmUIfv2vPi6WDvtYJqAhw7KNGT05WH27TkNwNC2lwUH
	OlLU1TVmXCs5AMBLBhDMbz19um/AeQz/Fa67hedF13hlOVxNGX6ZauWt+WE7RdOhRK9jVS
	Qzh0Xk1awQ22qL+wKhzzMj0jtkfwhE8gJfluA2lFh6YM0rvmT6S8IAkJV7v9nA/kpzhDcK
	qzNbnFcPuAeLF2kS7H6DE58GGhxNLboHWEHJKBhy68+dxOggJPQnCQeMLUIifIBNlyc23u
	9uxUkjTtVW7e97L7sMZ/aH3xQfs3Dr1P5O0tYrBcBdsVcLg4K4S5ajbOdKM3oA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795009506;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PjrEHtJWTZplJvlyHUPEpmdlAZVgPQmhBaGWk/K3vkI=;
	b=ESjS5BiCVBBOywchydD6U5UoHWqfTq67XWZ50qkw04BeBPu4zdJPKIZESn3VJaTZvy7vZx
	2SkByWwyKEHchmAg==
From: "tip-bot2 for Luo Gengkun" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/cache: Reduce the overhead of task_cache_work
 by only scan the visisted cpus
Cc: Luo Gengkun <luogengkun@huaweicloud.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Chen Yu <yu.c.chen@intel.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261111110409.1498035-2-luogengkun@huaweicloud.com>
References: <20261111110409.1498035-2-luogengkun@huaweicloud.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179500950465.3191731.18185708199689515175.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     953f9fc86e54bf0debeb3f83e3e28ace167175e1
Gitweb:        https://git.kernel.org/tip/953f9fc86e54bf0debeb3f83e3e28ace167=
175e1
Author:        Luo Gengkun <luogengkun@huaweicloud.com>
AuthorDate:    Wed, 11 Nov 2026 11:04:08=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 18 Nov 2026 14:32:20 +01:00

sched/cache: Reduce the overhead of task_cache_work by only scan the visisted=
 cpus

The overhead of task_cache_work() is high, especially in multi-NUMA systems.
Currently, task_cache_work() tries to find the pref_llc by scanning all CPUs
in the system. However, most of these scans are meaningless, such as those
for CPUs that have never been visited or were accessed a long time ago.

To address this problem, introduce visited_cpus to track the visited CPUs
and evict them once they have not been accessed for a duration exceeding
llc_epoch_affinity_timeout.

Now that we know exactly which CPUs to scan from visited_cpus, we can remove
get_scan_cpumasks().

Below are the Redis test results conducted on AMD server.

When NUMA balancing is disabled:

  valkey-benchmark rps  |      baseline       |         schedcache           =
   |     schedcache_visit
                        |  (no cache aware)   |    (without this series)     =
   |     (with this series)
  ----------------------+---------------------+---------------------+--------=
---+-------------------+--------
                        |   p99 latency(ms)   |    p99 latency(ms)  |   DIFF(=
%) |   p99 latency(ms) |  DIFF(%)
  400000                |      0.436          |        0.554        |   -25.6=
8% |         0.441     |   -1.14%

  Additionally, the output of perf top -e cycles:k highlights the overhead
  incurred by task_cache_work():

  valkey-benchmark rps  |         schedcache                        |     sch=
edcache_visit
                        |    (without this series)                  |     (wi=
th this series)
  ----------------------+-------------------------------------------+--------=
-------------------------------
  400000                |  0.81%  [kernel]  [k] task_cache_work     |  0.02% =
 [kernel]  [k] task_cache_work

The trace data is shown below:

echo NO_SC_VISIT > /sys/kernel/debug/sched/features
    redis-server-24660   [195] .....  2916.005989: sched_cache_scan: comm=3Dr=
edis-server pid=3D24660 scan=3D384
 valkey-benchmar-48836   [317] .....  2916.005993: sched_cache_scan: comm=3Dv=
alkey-benchmar pid=3D48836 scan=3D384
 valkey-benchmar-48487   [310] .....  2916.006002: sched_cache_scan: comm=3Dv=
alkey-benchmar pid=3D48487 scan=3D384

echo SC_VISIT > /sys/kernel/debug/sched/features
    redis-server-29080   [225] .....  2876.257909: sched_cache_scan: comm=3Dr=
edis-server pid=3D29080 scan=3D14
    redis-server-26694   [018] .....  2876.257909: sched_cache_scan: comm=3Dr=
edis-server pid=3D26694 scan=3D13
 valkey-benchmar-48198   [103] .....  2876.257909: sched_cache_scan: comm=3Dv=
alkey-benchmar pid=3D48198 scan=3D16

The above results show that this series significantly reduces the overhead
of task_cache_work() by decreasing the number of CPUs that need to be
scanned, from 384 to 16, when NUMA balancing is disabled.

Even with NUMA balancing enabled, this patch provides better performance
benefits. The following tests were conducted with NUMA balancing enabled:

  valkey-benchmark rps  |      baseline       |         schedcache           =
   |     schedcache_visit
                        |  (no cache aware)   |    (without this series)     =
   |     (with this series)
  ----------------------+---------------------+---------------------+--------=
---+-------------------+--------
                        |   p99 latency(ms)   |    p99 latency(ms)  |   DIFF(=
%) |   p99 latency(ms) |  DIFF(%)
  400000                |      0.437          |        0.454        |   -3.89=
%  |         0.442     |   -1.14%

  The overhead of task_cache_work() is as follows:

  valkey-benchmark rps  |         schedcache                        |     sch=
edcache_visit
                        |    (without this series)                  |     (wi=
th this series)
  ----------------------+-------------------------------------------+--------=
-------------------------------
  400000                |  0.13%  [kernel]  [k] task_cache_work     |  0.03% =
 [kernel]  [k] task_cache_work

Hackbench testing was also conducted. The results below show that this
series does not affect the accuracy of cache-aware scheduling.

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  Hackbench Comparison: baseline vs schedcache
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  MODE       GROUPS  FDS |     baseline(std)  |  schedcache(std)   |    DIFF(=
%) | VERDICT
  ---------- ------ -----+--------------------+--------------------+---------=
---+-----------
  threads         1   10 |    113.200 (4.22%) |     67.300 (1.32%) |     40.5=
5% | IMPROVED
  threads         1    2 |     16.555 (4.11%) |     11.020 (1.66%) |     33.4=
3% | IMPROVED
  threads         1   20 |    250.774 (1.26%) |    265.026 (5.44%) |     -5.6=
8% | REGRESSED
  threads         1    4 |     42.117 (1.44%) |     27.758 (1.64%) |     34.0=
9% | IMPROVED
  threads         1    6 |     65.140 (4.31%) |     39.182 (1.38%) |     39.8=
5% | IMPROVED
  threads         1    8 |     84.286 (1.29%) |     53.721 (1.58%) |     36.2=
6% | IMPROVED
  threads         2   10 |    122.592 (0.44%) |    113.365 (4.93%) |      7.5=
3% | IMPROVED
  threads         2    2 |     17.702 (4.09%) |     10.473 (0.42%) |     40.8=
4% | IMPROVED
  threads         2   20 |    336.457 (1.77%) |    314.108 (1.51%) |      6.6=
4% | IMPROVED
  threads         2    4 |     43.989 (0.88%) |     27.067 (3.38%) |     38.4=
7% | IMPROVED
  threads         2    6 |     69.322 (0.85%) |     41.707 (4.19%) |     39.8=
4% | IMPROVED
  threads         2    8 |    103.767 (1.81%) |     58.518 (3.00%) |     43.6=
1% | IMPROVED
  threads         4   10 |    148.882 (3.56%) |    149.449 (1.06%) |     -0.3=
8% | REGRESSED
  threads         4    2 |     18.909 (2.96%) |     11.063 (2.08%) |     41.4=
9% | IMPROVED
  threads         4   20 |    724.943 (2.14%) |    631.222 (3.92%) |     12.9=
3% | IMPROVED
  threads         4    4 |     48.191 (1.91%) |     27.352 (5.35%) |     43.2=
4% | IMPROVED
  threads         4    6 |     79.725 (3.84%) |     78.732 (4.10%) |      1.2=
5% | IMPROVED
  threads         4    8 |    108.768 (1.36%) |    105.928 (1.65%) |      2.6=
1% | IMPROVED

  Hackbench Comparison: schedcache vs schedcache_visit
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  MODE       GROUPS  FDS |    schedcache(std) |schedcache_visit(std) | DIFF(%=
) | VERDICT
  ---------- ------ -----+--------------------+----------------------+-------=
--+-----------
  threads         1   10 |     67.300 (1.32%) |     67.014 (0.96%)   |   0.42=
% | IMPROVED
  threads         1    2 |     11.020 (1.66%) |     10.557 (1.46%)   |   4.20=
% | IMPROVED
  threads         1   20 |    265.026 (5.44%) |   212.366 (16.32%)   |  19.87=
% | IMPROVED
  threads         1    4 |     27.758 (1.64%) |     25.711 (1.32%)   |   7.37=
% | IMPROVED
  threads         1    6 |     39.182 (1.38%) |     38.914 (0.34%)   |   0.68=
% | IMPROVED
  threads         1    8 |     53.721 (1.58%) |     52.889 (0.27%)   |   1.55=
% | IMPROVED
  threads         2   10 |    121.203 (6.99%) |    124.254 (1.38%)   |  -2.52=
% | REGRESSED
  threads         2    2 |     10.473 (0.42%) |     11.206 (5.91%)   |  -7.00=
% | REGRESSED
  threads         2   20 |    314.108 (1.51%) |    301.754 (1.95%)   |   3.93=
% | IMPROVED
  threads         2    4 |     27.067 (3.38%) |     28.028 (2.01%)   |  -3.55=
% | REGRESSED
  threads         2    6 |     41.707 (4.19%) |     42.149 (3.35%)   |  -1.06=
% | REGRESSED
  threads         2    8 |     58.518 (3.00%) |     57.133 (4.39%)   |   2.37=
% | IMPROVED
  threads         4   10 |    149.449 (1.06%) |    141.407 (0.08%)   |   5.38=
% | IMPROVED
  threads         4    2 |     11.063 (2.08%) |     11.360 (5.85%)   |  -2.68=
% | REGRESSED
  threads         4   20 |    631.222 (3.92%) |    622.780 (2.49%)   |   1.34=
% | IMPROVED
  threads         4    4 |     27.352 (5.35%) |     27.947 (5.37%)   |  -2.18=
% | REGRESSED
  threads         4    6 |     78.732 (4.10%) |     73.911 (0.70%)   |   6.12=
% | IMPROVED
  threads         4    8 |    105.928 (1.65%) |    107.535 (3.29%)   |  -1.52=
% | REGRESSED

Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: Chen Yu <yu.c.chen@intel.com>
Link: https://patch.msgid.link/20261111110409.1498035-2-luogengkun@huaweiclou=
d.com
---
 include/linux/sched.h |   2 +-
 kernel/sched/fair.c   |  99 ++++++++++++++++-------------------------
 2 files changed, 43 insertions(+), 58 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index e4f6323..1b08925 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2385,6 +2385,7 @@ static __always_inline int task_mm_cid(struct task_stru=
ct *t)
 struct sched_cache_time {
 	u64 runtime;
 	unsigned long epoch;
+	unsigned long epoch_last_visit;
 };
=20
 struct sched_cache_group {
@@ -2397,6 +2398,7 @@ struct sched_cache_group {
 	int cpu;
 	refcount_t refcnt;
 	struct rcu_head rcu;
+	cpumask_var_t visited_cpus;
 } ____cacheline_aligned_in_smp;
=20
 struct sched_cache_group *sched_cache_group_get(struct sched_cache_group *gr=
p);
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 46bb609..731d781 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1622,11 +1622,11 @@ int mm_init_sched(struct mm_struct *mm,
 	int i;
=20
 	grp =3D kzalloc_obj(*grp);
-	if (!grp) {
-		free_percpu(_pcpu_sched);
-		mm->sched_cache_grp =3D NULL;
-		return -ENOMEM;
-	}
+	if (!grp)
+		goto err_free_pcpu;
+
+	if (!zalloc_cpumask_var(&grp->visited_cpus, GFP_KERNEL))
+		goto err_free_grp;
=20
 	for_each_possible_cpu(i) {
 		struct sched_cache_time *pcpu_sched =3D per_cpu_ptr(_pcpu_sched, i);
@@ -1635,6 +1635,7 @@ int mm_init_sched(struct mm_struct *mm,
 		pcpu_sched->runtime =3D 0;
 		/* a slightly stale cpu epoch is acceptible */
 		pcpu_sched->epoch =3D rq->cpu_epoch;
+		pcpu_sched->epoch_last_visit =3D rq->cpu_epoch;
 		epoch =3D rq->cpu_epoch;
 	}
=20
@@ -1660,6 +1661,14 @@ int mm_init_sched(struct mm_struct *mm,
 	 */
 	smp_store_release(&mm->sched_cache_grp, grp);
 	return 0;
+
+err_free_grp:
+	kfree(grp);
+
+err_free_pcpu:
+	free_percpu(_pcpu_sched);
+	mm->sched_cache_grp =3D NULL;
+	return -ENOMEM;
 }
=20
 static void sched_cache_group_free_rcu(struct rcu_head *rcu)
@@ -1668,6 +1677,7 @@ static void sched_cache_group_free_rcu(struct rcu_head =
*rcu)
 		container_of(rcu, struct sched_cache_group, rcu);
=20
 	free_percpu(grp->pcpu_sched);
+	free_cpumask_var(grp->visited_cpus);
 	kfree(grp);
 }
=20
@@ -1808,13 +1818,24 @@ static inline void __update_mm_sched(struct rq *rq,
 	}
 }
=20
-static unsigned long fraction_mm_sched(struct rq *rq,
-				       struct sched_cache_time *pcpu_sched)
+static unsigned long fraction_mm_sched(int cpu,
+				       struct sched_cache_group *grp)
 {
+	struct sched_cache_time *pcpu_sched =3D
+		per_cpu_ptr(grp->pcpu_sched, cpu);
+	struct rq *rq =3D cpu_rq(cpu);
+
 	guard(raw_spinlock_irqsave)(&rq->cpu_epoch_lock);
=20
 	__update_mm_sched(rq, pcpu_sched);
=20
+	/* Evict the CPU if this sched group has not run on it for a while */
+	if ((rq->cpu_epoch - pcpu_sched->epoch_last_visit) >
+	    llc_epoch_affinity_timeout) {
+		cpumask_clear_cpu(cpu, grp->visited_cpus);
+		return 0;
+	}
+
 	/*
 	 * Runtime is a geometric series (r=3D0.5) and as such will sum to twice
 	 * the accumulation period, this means the multiplcation here should
@@ -1890,6 +1911,9 @@ void account_mm_sched(struct rq *rq, struct task_struct=
 *p, s64 delta_exec)
 		pcpu_sched->runtime +=3D delta_exec;
 		rq->cpu_runtime +=3D delta_exec;
 		epoch =3D rq->cpu_epoch;
+		pcpu_sched->epoch_last_visit =3D epoch;
+		if (!cpumask_test_cpu(cpu_of(rq), grp->visited_cpus))
+			cpumask_set_cpu(cpu_of(rq), grp->visited_cpus);
 	}
=20
 	/*
@@ -1940,52 +1964,6 @@ static void task_tick_cache(struct rq *rq, struct task=
_struct *p)
 	}
 }
=20
-static void get_scan_cpumasks(cpumask_var_t cpus, struct task_struct *p,
-			      struct sched_cache_group *grp)
-{
-#ifdef CONFIG_NUMA_BALANCING
-	int cpu, curr_cpu, nid, pref_nid;
-
-	if (!static_branch_likely(&sched_numa_balancing))
-		goto out;
-
-	cpu =3D READ_ONCE(grp->cpu);
-	if (cpu !=3D -1)
-		nid =3D cpu_to_node(cpu);
-	curr_cpu =3D task_cpu(p);
-
-	/*
-	 * Scanning in the preferred NUMA node is ideal. However, the NUMA
-	 * preferred node is per-task rather than per-process. It is possible
-	 * for different threads of the process to have distinct preferred
-	 * nodes; consequently, the process-wide preferred LLC may bounce
-	 * between different nodes. As a workaround, maintain the scan
-	 * CPU mask to also cover the process's current preferred LLC and the
-	 * current running node to mitigate the bouncing risk.
-	 * TBD: numa_group should be considered during task aggregation.
-	 */
-	pref_nid =3D p->numa_preferred_nid;
-	/* honor the task's preferred node */
-	if (pref_nid =3D=3D NUMA_NO_NODE)
-		goto out;
-
-	cpumask_or(cpus, cpus, cpumask_of_node(pref_nid));
-
-	/* honor the task's preferred LLC CPU */
-	if (cpu !=3D -1 && !cpumask_test_cpu(cpu, cpus) && nid !=3D NUMA_NO_NODE)
-		cpumask_or(cpus, cpus, cpumask_of_node(nid));
-
-	/* make sure the task's current running node is included */
-	if (!cpumask_test_cpu(curr_cpu, cpus))
-		cpumask_or(cpus, cpus, cpumask_of_node(cpu_to_node(curr_cpu)));
-
-	return;
-
-out:
-#endif
-	cpumask_copy(cpus, cpu_online_mask);
-}
-
 static inline void update_avg_scale(u64 *avg, u64 sample)
 {
 	int factor =3D per_cpu(sd_llc_size, raw_smp_processor_id());
@@ -2034,7 +2012,7 @@ static void task_cache_work(struct callback_head *work)
 	if (time_before(now, next_scan))
 		return;
=20
-	/* only 1 thread is allowed to scan */
+	/* elect a single scanner per epoch */
 	if (!try_cmpxchg(&grp->next_scan, &next_scan,
 			 now + max_t(unsigned long,
 				     READ_ONCE(llc_epoch_period), 1)))
@@ -2055,7 +2033,13 @@ static void task_cache_work(struct callback_head *work)
 	scoped_guard (cpus_read_lock) {
 		guard(rcu)();
=20
-		get_scan_cpumasks(cpus, p, grp);
+		/*
+		 * account_mm_sched() can set a bit in visited_cpus while
+		 * it is read here locklessly for efficiency. A CPU missed
+		 * this way has only just been used by this sched group,
+		 * so its share small, and the next scan will include it.
+		 */
+		cpumask_and(cpus, cpu_online_mask, grp->visited_cpus);
=20
 		for_each_cpu(cpu, cpus) {
 			/* XXX sched_cluster_active */
@@ -2066,9 +2050,8 @@ static void task_cache_work(struct callback_head *work)
 			if (!sd)
 				continue;
=20
-			for_each_cpu(i, sched_domain_span(sd)) {
-				occ =3D fraction_mm_sched(cpu_rq(i),
-							per_cpu_ptr(grp->pcpu_sched, i));
+			for_each_cpu_and(i, sched_domain_span(sd), cpus) {
+				occ =3D fraction_mm_sched(i, grp);
 				a_occ +=3D occ;
 				if (occ > m_occ) {
 					m_occ =3D occ;
