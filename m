Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.71.94.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698979;
	b=ZJJio92Zyonhwd22a5LSTYDVzD0uKdlhrk5B92/EQYB2RPiPNrLqDGiqJEXtsiVKxBfU
	 X8SDEIGkTroR2m5hQkqDzI33r5pL2CLAPepJmp2lfiHhOc/Sf425/7hBR/bofpoksnFUW
	 hJ06EeUHEoVtUI5U+Y2UlBBuxTQo9ZIPXh5z+s/YAZHl5irjuiaq2ghdrYL9V3EbODHoO
	 wr2n8+ye7kz1pyyWK4VuOXHvC4rJSA06Dpy5Xf1XenCllDEicu1OSeb+RUs85zzkiwHmC
	 ueE5GSOEoFfQGoNgl/owneRrJreDiXc/8jTr+PZ3kgAT1CAUV1/7djFthSuGMwAX/Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698979;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ddqZD5WyD7/gPerHNHej8ssXX0LdrPJwLGvidWLjN8c=;
	b=Xo1wWz6vd56ISx3UOedjz4560UjpJYy4yllBlYyL0kYRq+qWHlsoM69NKAh1Mals+O6+
	 pWKV+LrwB7vOre9wW6+lSDVnopTKcAnqLoqRwezgUzfYQFpoPuEw44CaOBg4QXtZq39ai
	 6NjHVwjiyimq2T+Ua0tWVLZk6CiIFQufUX0PtvT0uNSHsPwdIm4mfhnOsxwK/3JfA1vWj
	 8jX0aC4ZqIm/Djkapj81n9YkhdYDOCWvfSPXcba7ZuVzFICvXwik21ZX9AfPnYpPQdI8Q
	 dJWpE2R+ocBOXrKFxesjP2ApayrmqPJj4g6bn5IlKvsGHsizOycqkd0WylXISRVbI2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=none smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=124.71.94.104
Received: from dggmsgout13.his.huawei.com (dggmsgout13.his.huawei.com [124.71.94.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CA8606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51CA8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggmsgout13.his.huawei.com (SkyGuard) with ESMTP id 4jZxrT5PRsz1rrPy
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:16:09 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id DEAF140561
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:16:14 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.193])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgAHDgEOMQhrq143Fw--.33284S3;
	Thu, 26 Nov 2026 21:16:14 +0800 (CST)
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
Subject: [RFC PATCH 1/7] sched/cache: Move the cache group lifecycle to cache_sched.c
Date: Thu, 26 Nov 2026 13:48:22 +0000
Message-Id: <5c7b27a9434ab577fd24454d1335ac1c47c01d94.1795691926.git.luogengkun2@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1795691926.git.luogengkun2@huawei.com>
References: <cover.1795691926.git.luogengkun2@huawei.com>
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
X-CM-TRANSID:_Ch0CgAHDgEOMQhrq143Fw--.33284S3
X-Coremail-Antispam: 1UD129KBjvAXoWfGryUCFy5Jr1xAr4rCw1rWFg_yoW8Jr13uo
	WSyFWrJr1xK348trZ5GFn5JryUWw1Ykr17Ars5Gr13WF1DAa4UGw18Gwn8uFyrXFyIyan5
	A3WDXa98Ca1Utw18n29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUO17kC6x804xWl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK
	8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr
	4l82xGYIkIc2x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI
	0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
	WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8-_
	-PUUUUU==
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/

The cache group's allocation, initialization, and reference lifecycle
currently lives in fair.c inside its CONFIG_SCHED_CACHE block, mixed
in with the wakeup and load balancing code that consumes it.

Move it into its own compilation unit, kernel/sched/cache_sched.c
(built into build_utility.o), to lay the groundwork for the rest of
this series.

The moved code is unchanged except for the allocator, which is split
out of mm_init_sched() as sched_cache_alloc_group() along with its
failure path. Export this constructor via the new
kernel/sched/cache_sched.h, while keeping the responsibility of
publishing the group to the mm inside mm_init_sched(). Also make
sched_cache_group_put() global, as task_cache_work() and
mm_destroy_sched() remain in fair.c and still call it.

No functional change intended.

Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
---
 kernel/sched/build_utility.c |   5 ++
 kernel/sched/cache_sched.c   | 155 +++++++++++++++++++++++++++++++++++
 kernel/sched/cache_sched.h   |  19 +++++
 kernel/sched/fair.c          | 133 +-----------------------------
 4 files changed, 181 insertions(+), 131 deletions(-)
 create mode 100644 kernel/sched/cache_sched.c
 create mode 100644 kernel/sched/cache_sched.h

diff --git a/kernel/sched/build_utility.c b/kernel/sched/build_utility.c
index e2cf3b08d4e9..f7ea083de6a3 100644
--- a/kernel/sched/build_utility.c
+++ b/kernel/sched/build_utility.c
@@ -85,6 +85,11 @@
 
 #include "topology.c"
 
+#ifdef CONFIG_SCHED_CACHE
+# include "cache_sched.h"
+# include "cache_sched.c"
+#endif
+
 #ifdef CONFIG_SCHED_CORE
 # include "core_sched.c"
 #endif
diff --git a/kernel/sched/cache_sched.c b/kernel/sched/cache_sched.c
new file mode 100644
index 000000000000..c20ed59ba45b
--- /dev/null
+++ b/kernel/sched/cache_sched.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "sched.h"
+
+#define rcu_deref_sched_cache_grp(tsk) \
+	rcu_dereference_check((tsk)->sched_cache_grp, (tsk) == current)
+
+static struct sched_cache_group *sched_cache_replace_grp(struct task_struct *p,
+							 struct sched_cache_group *new)
+{
+	struct sched_cache_group *old;
+
+	old = rcu_deref_sched_cache_grp(p);
+	rcu_assign_pointer(p->sched_cache_grp, new);
+
+	return old;
+}
+
+static void sched_cache_group_free_rcu(struct rcu_head *rcu)
+{
+	struct sched_cache_group *grp =
+		container_of(rcu, struct sched_cache_group, rcu);
+
+	free_percpu(grp->pcpu_sched);
+	kfree(grp);
+}
+
+void sched_cache_group_put(struct sched_cache_group *grp)
+{
+	if (!grp || !refcount_dec_and_test(&grp->refcnt))
+		return;
+
+	call_rcu(&grp->rcu, sched_cache_group_free_rcu);
+}
+
+DEFINE_FREE(sched_cache_group_put, struct sched_cache_group *,
+	    sched_cache_group_put(_T));
+
+struct sched_cache_group *sched_cache_group_get(struct sched_cache_group *grp)
+{
+	/*
+	 * refcount_inc_not_zero() is the acquire primitive for lockless
+	 * (RCU) lookups; plain refcount_inc() would scribble the count if
+	 * it already reached zero. Return NULL in that case.
+	 */
+	if (grp && !refcount_inc_not_zero(&grp->refcnt))
+		grp = NULL;
+
+	return grp;
+}
+
+struct sched_cache_group *task_cache_group_get(struct task_struct *p)
+{
+	guard(rcu)();
+	return sched_cache_group_get(rcu_dereference(p->sched_cache_grp));
+}
+
+void sched_cache_fork(struct task_struct *p)
+{
+	/*
+	 * The child takes its own reference on the mm's cache group, separate
+	 * from the reference held by the mm. @p is not yet visible to readers,
+	 * so a plain initializing store is enough.
+	 */
+	RCU_INIT_POINTER(p->sched_cache_grp,
+			 sched_cache_group_get(p->mm->sched_cache_grp));
+}
+
+void sched_cache_fork_cleanup(struct task_struct *p)
+{
+	/*
+	 * A fork that fails after sched_cache_fork() never reaches exit_mm(),
+	 * so drop the reference here. @p never became visible, so there are no
+	 * concurrent readers and the reference we hold keeps the group alive.
+	 */
+	sched_cache_group_put(rcu_access_pointer(p->sched_cache_grp));
+	RCU_INIT_POINTER(p->sched_cache_grp, NULL);
+}
+
+void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct *mm)
+{
+	struct sched_cache_group *old;
+
+	/*
+	 * Acquire the new reference before publishing the pointer, then drop
+	 * the old one. @p is current and the only writer of its own pointer.
+	 */
+	old = sched_cache_replace_grp(p, sched_cache_group_get(mm->sched_cache_grp));
+	sched_cache_group_put(old);
+}
+
+void sched_cache_exit_mm(struct task_struct *p)
+{
+	struct sched_cache_group *grp = sched_cache_replace_grp(p, NULL);
+
+#ifdef CONFIG_NUMA_BALANCING
+	/*
+	 * Subtract this task's footprint from the group before dropping the
+	 * reference, so the group footprint converges as its threads exit.
+	 * Unlocked for performance; clamp to avoid underflow.
+	 */
+	if (grp && p->total_numa_faults) {
+		unsigned long fp = READ_ONCE(grp->footprint);
+		unsigned long sub = min(fp, p->total_numa_faults);
+
+		WRITE_ONCE(grp->footprint, fp - sub);
+	}
+#endif
+	sched_cache_group_put(grp);
+}
+
+static void sched_cache_group_init(struct sched_cache_group *grp,
+				  struct sched_cache_time __percpu *_pcpu_sched)
+{
+	unsigned long epoch = 0;
+	int i;
+
+	for_each_possible_cpu(i) {
+		struct sched_cache_time *pcpu_sched = per_cpu_ptr(_pcpu_sched, i);
+		struct rq *rq = cpu_rq(i);
+
+		pcpu_sched->runtime = 0;
+		/* a slightly stale cpu epoch is acceptible */
+		pcpu_sched->epoch = rq->cpu_epoch;
+		epoch = rq->cpu_epoch;
+	}
+
+	raw_spin_lock_init(&grp->lock);
+	grp->epoch = epoch;
+	grp->cpu = -1;
+	grp->next_scan = jiffies;
+	grp->nr_running_avg = 0;
+	grp->footprint = 0;
+	refcount_set(&grp->refcnt, 1);
+	/*
+	 * The update to grp->pcpu_sched should not be reordered
+	 * before initialization to grp's other fields, in case
+	 * the readers may get invalid mm_sched_epoch, etc.
+	 */
+	smp_store_release(&grp->pcpu_sched, _pcpu_sched);
+}
+
+struct sched_cache_group *
+sched_cache_alloc_group(struct sched_cache_time __percpu *_pcpu_sched)
+{
+	struct sched_cache_group *grp;
+
+	grp = kzalloc_obj(*grp);
+	if (!grp) {
+		free_percpu(_pcpu_sched);
+		return NULL;
+	}
+
+	sched_cache_group_init(grp, _pcpu_sched);
+	return grp;
+}
diff --git a/kernel/sched/cache_sched.h b/kernel/sched/cache_sched.h
new file mode 100644
index 000000000000..4d0febe5fee1
--- /dev/null
+++ b/kernel/sched/cache_sched.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Cache-aware scheduling: the interface between fair.c and the cache
+ * group's own compilation unit, kernel/sched/cache_sched.c.
+ */
+#ifndef _KERNEL_SCHED_CACHE_SCHED_H
+#define _KERNEL_SCHED_CACHE_SCHED_H
+
+#include <linux/sched.h>
+
+#ifdef CONFIG_SCHED_CACHE
+
+struct sched_cache_group *
+sched_cache_alloc_group(struct sched_cache_time __percpu *_pcpu_sched);
+void sched_cache_group_put(struct sched_cache_group *grp);
+
+#endif /* CONFIG_SCHED_CACHE */
+
+#endif /* _KERNEL_SCHED_CACHE_SCHED_H */
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4..29c6be227ef8 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -60,6 +60,7 @@
 #include "sched.h"
 #include "stats.h"
 #include "autogroup.h"
+#include "cache_sched.h"
 
 /*
  * The initial- and re-scaling of tunables is configurable
@@ -1652,39 +1653,13 @@ int mm_init_sched(struct mm_struct *mm,
 		  struct sched_cache_time __percpu *_pcpu_sched)
 {
 	struct sched_cache_group *grp;
-	unsigned long epoch = 0;
-	int i;
 
-	grp = kzalloc_obj(*grp);
+	grp = sched_cache_alloc_group(_pcpu_sched);
 	if (!grp) {
-		free_percpu(_pcpu_sched);
 		mm->sched_cache_grp = NULL;
 		return -ENOMEM;
 	}
 
-	for_each_possible_cpu(i) {
-		struct sched_cache_time *pcpu_sched = per_cpu_ptr(_pcpu_sched, i);
-		struct rq *rq = cpu_rq(i);
-
-		pcpu_sched->runtime = 0;
-		/* a slightly stale cpu epoch is acceptible */
-		pcpu_sched->epoch = rq->cpu_epoch;
-		epoch = rq->cpu_epoch;
-	}
-
-	raw_spin_lock_init(&grp->lock);
-	grp->epoch = epoch;
-	grp->cpu = -1;
-	grp->next_scan = jiffies;
-	grp->nr_running_avg = 0;
-	grp->footprint = 0;
-	refcount_set(&grp->refcnt, 1);
-	/*
-	 * The update to grp->pcpu_sched should not be reordered
-	 * before initialization to grp's other fields, in case
-	 * the readers may get invalid mm_sched_epoch, etc.
-	 */
-	smp_store_release(&grp->pcpu_sched, _pcpu_sched);
 	/*
 	 * Publish the group last.  Not every reader qualifies it by
 	 * grp->pcpu_sched - can_migrate_llc_task() only checks that the
@@ -1696,113 +1671,9 @@ int mm_init_sched(struct mm_struct *mm,
 	return 0;
 }
 
-static void sched_cache_group_free_rcu(struct rcu_head *rcu)
-{
-	struct sched_cache_group *grp =
-		container_of(rcu, struct sched_cache_group, rcu);
-
-	free_percpu(grp->pcpu_sched);
-	kfree(grp);
-}
-
-static void sched_cache_group_put(struct sched_cache_group *grp)
-{
-	if (!grp || !refcount_dec_and_test(&grp->refcnt))
-		return;
-
-	call_rcu(&grp->rcu, sched_cache_group_free_rcu);
-}
-
 DEFINE_FREE(sched_cache_group_put, struct sched_cache_group *,
 	    sched_cache_group_put(_T));
 
-#define rcu_deref_sched_cache_grp(tsk) \
-	rcu_dereference_check((tsk)->sched_cache_grp, (tsk) == current)
-
-static struct sched_cache_group *sched_cache_replace_grp(struct task_struct *p,
-							 struct sched_cache_group *new)
-{
-	struct sched_cache_group *old;
-
-	old = rcu_deref_sched_cache_grp(p);
-	rcu_assign_pointer(p->sched_cache_grp, new);
-
-	return old;
-}
-
-struct sched_cache_group *sched_cache_group_get(struct sched_cache_group *grp)
-{
-	/*
-	 * refcount_inc_not_zero() is the acquire primitive for lockless
-	 * (RCU) lookups; plain refcount_inc() would scribble the count if
-	 * it already reached zero. Return NULL in that case.
-	 */
-	if (grp && !refcount_inc_not_zero(&grp->refcnt))
-		grp = NULL;
-
-	return grp;
-}
-
-struct sched_cache_group *task_cache_group_get(struct task_struct *p)
-{
-	guard(rcu)();
-	return sched_cache_group_get(rcu_dereference(p->sched_cache_grp));
-}
-
-void sched_cache_fork(struct task_struct *p)
-{
-	/*
-	 * The child takes its own reference on the mm's cache group, separate
-	 * from the reference held by the mm. @p is not yet visible to readers,
-	 * so a plain initializing store is enough.
-	 */
-	RCU_INIT_POINTER(p->sched_cache_grp,
-			 sched_cache_group_get(p->mm->sched_cache_grp));
-}
-
-void sched_cache_fork_cleanup(struct task_struct *p)
-{
-	/*
-	 * A fork that fails after sched_cache_fork() never reaches exit_mm(),
-	 * so drop the reference here. @p never became visible, so there are no
-	 * concurrent readers and the reference we hold keeps the group alive.
-	 */
-	sched_cache_group_put(rcu_access_pointer(p->sched_cache_grp));
-	RCU_INIT_POINTER(p->sched_cache_grp, NULL);
-}
-
-void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct *mm)
-{
-	struct sched_cache_group *old;
-
-	/*
-	 * Acquire the new reference before publishing the pointer, then drop
-	 * the old one. @p is current and the only writer of its own pointer.
-	 */
-	old = sched_cache_replace_grp(p, sched_cache_group_get(mm->sched_cache_grp));
-	sched_cache_group_put(old);
-}
-
-void sched_cache_exit_mm(struct task_struct *p)
-{
-	struct sched_cache_group *grp = sched_cache_replace_grp(p, NULL);
-
-#ifdef CONFIG_NUMA_BALANCING
-	/*
-	 * Subtract this task's footprint from the group before dropping the
-	 * reference, so the group footprint converges as its threads exit.
-	 * Unlocked for performance; clamp to avoid underflow.
-	 */
-	if (grp && p->total_numa_faults) {
-		unsigned long fp = READ_ONCE(grp->footprint);
-		unsigned long sub = min(fp, p->total_numa_faults);
-
-		WRITE_ONCE(grp->footprint, fp - sub);
-	}
-#endif
-	sched_cache_group_put(grp);
-}
-
 void mm_destroy_sched(struct mm_struct *mm)
 {
 	sched_cache_group_put(mm->sched_cache_grp);
-- 
2.34.1

