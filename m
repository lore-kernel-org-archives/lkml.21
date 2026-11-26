Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.71.93.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698979;
	b=V8cVZmk+vnd9Ziol5UVvs7yQhFONRbJxol4jYO2T8yFqVrCn+99SWhgpg3LeNRU1ECT9
	 srIl9IhpceJp2PtH5nnau//kC/4dy1WuntW3HGHcl6fPb68HQGE7s/83YYo/leKr4UX2I
	 1k53DCwR2CD4SZ9E16H4cQrzzrAZzo/oFaYEqaznWFJBKjnOl4qGVJPBVRkeUOKkc22q0
	 3I30aCp9IEgyoHFyaJOhIxSyNpj9DnUl2McxMc6OA0L02OOkmTJvBi4nQUdRkJ9lFZi1d
	 cSXZZxvjHP88MWBK4uc4yTWyCFEmrD/3++50Zj8IxgcTh75/5Vshkl7DOm/48yySyVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698979;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=KAc/v4Dg8lJPpu6BJCim/U1GMnfvr2G0xasjxiudAVw=;
	b=fKTpqm+zWFfZR/KSXC+pJv0Z9olepIvrfOaT9BoGEV6BM4euw+26KrzUceedGUewr+Zj
	 Tkj3rWdfeCgy7TAgGTItv5QynZ4eKwn2tTNRqyk6KPVeqVqXrae9x49ZLzHN74aFpcNXC
	 m+oYqOAjdRTu8BHU0QHFGk6bJ0fp5yAIC1mKBFzVDGEN0mnK6X8AFu2zyE1zLng6XgGqR
	 MiS7po1UQV27O6bzZ8g5z+RKa1W2Khy/W/10izsNmvkTGXJj2C3pCq7OJ25FKLewUrwMu
	 wns2IaXFr66vmctrIybpSkLy25MYu2lOU8rxhIAiIne5HTaLpV3bKg/t+4tN2fnup6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=none smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=124.71.93.99
Received: from dggmsgout11.his.huawei.com (dggmsgout11.his.huawei.com [124.71.93.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15819606A333
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15819606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggmsgout11.his.huawei.com (SkyGuard) with ESMTP id 4jZxrS3QKNz1c271
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:16:08 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 6916F40576
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:16:15 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.193])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgAHDgEOMQhrq143Fw--.33284S7;
	Thu, 26 Nov 2026 21:16:15 +0800 (CST)
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
Subject: [RFC PATCH 5/7] sched/cache: Add the per-CPU hint queue
Date: Thu, 26 Nov 2026 13:48:26 +0000
Message-Id: <5d34ed653bf971c02f40517591a4b38fb89a469d.1795691926.git.luogengkun2@huawei.com>
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
X-CM-TRANSID:_Ch0CgAHDgEOMQhrq143Fw--.33284S7
X-Coremail-Antispam: 1UD129KBjvAXoW3ur17tr13Wr1DuF1rtr1DJrb_yoW8Jw1DKo
	WSvan8Xr1kKw18G39YyF18tFW5uayI9ryUZrs8uF45X3WkXw18W3y5GwnxXFyfKr40kFZx
	Za48W39Yyw4Ikr95n29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUO57kC6x804xWl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK
	8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF
	0E3s1l82xGYIkIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x02
	67AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I
	80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCj
	c4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4
	kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtV
	W8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuY
	vjxUF9NVUUUUU
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/

sched_cache_hint() is not callable from every context: it sleeps when it
has to allocate a group, and it takes the hinted tasks' rq locks, which
a caller on the wakeup path may already hold.  This adds a lockless
per-CPU queue in front of it: submitting a hint only queues it, and
everything that sleeps or locks happens in the worker's own context.

The queue is one lock-free llist per CPU.  A producer takes a slot from
the per-CPU pool and queues it with llist_add(); the per-CPU smpboot
worker detaches the whole batch with llist_del_all() and calls
sched_cache_hint() on each hint.  A queued hint owns the caller's
references on its two tasks, and the worker drops them as it consumes
each hint.  The producer raises the worker with irq_work only when it is
not already running; the worker sleeps when the queue is empty, so there
is no polling.

SCG_HINT_LIMIT bounds both the pool and the queue, so the queue can
never overflow.  A hint is dropped when the feature is off or the
backlog is full - hints are advisory, and whoever still observes the
relation submits it again.  The BPF-facing submitters are added in the
next commit.

Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
---
 kernel/sched/build_utility.c |   1 +
 kernel/sched/cache_sched.c   | 359 +++++++++++++++++++++++++++++++++++
 2 files changed, 360 insertions(+)

diff --git a/kernel/sched/build_utility.c b/kernel/sched/build_utility.c
index f7ea083de6a3..5f63dbd43714 100644
--- a/kernel/sched/build_utility.c
+++ b/kernel/sched/build_utility.c
@@ -28,6 +28,7 @@
 #include <linux/hashtable_api.h>
 #include <linux/irq.h>
 #include <linux/kobject_api.h>
+#include <linux/llist.h>
 #include <linux/membarrier.h>
 #include <linux/mempolicy.h>
 #include <linux/nmi.h>
diff --git a/kernel/sched/cache_sched.c b/kernel/sched/cache_sched.c
index c5fce997c114..fafb04bcdfa9 100644
--- a/kernel/sched/cache_sched.c
+++ b/kernel/sched/cache_sched.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include "sched.h"
 #include "cache_sched.h"
+#include <linux/smpboot.h>
+#include <linux/irq_work.h>
 
 #define rcu_deref_sched_cache_grp(tsk) \
 	rcu_dereference_check((tsk)->sched_cache_grp, (tsk) == current)
@@ -522,3 +524,360 @@ struct sched_cache_group *sched_grp_refresh(struct task_struct *p,
 
 	return new_root;
 }
+
+/*
+ * The hint queue: producers submit hints locklessly, per-CPU workers consume
+ * them.  sched_cache_hint() sleeps and takes the hinted tasks' rq locks,
+ * which a producer may already hold, so submitting only queues the hint;
+ * everything that sleeps or locks runs in the worker's own context.
+ *
+ * The queue is one lock-free llist per CPU, the shape irq_work uses:
+ * submitting is one atomic on a local cache line, and the worker takes its
+ * CPU's worth with another atomic, so producers append to the now-empty
+ * list without contending with the consumer.  The worker runs on the CPU
+ * the hints were submitted on, so the queue, the hints and the tasks the
+ * batch connects stay cache- and node-local.
+ *
+ * A per-CPU smpboot thread drains the queue and sleeps when it is empty; a
+ * submitter raises it with irq_work only when it is not already running.
+ * SCG_HINT_LIMIT bounds the backlog: past it a hint is dropped - hints are
+ * advisory, and whatever still observes the relation submits it again.
+ */
+struct scg_hint {
+	struct task_struct	*t1;
+	struct task_struct	*t2;
+	struct llist_node	node;
+};
+
+struct scg_hint_queue {
+	struct llist_head hints;
+	struct llist_head free;
+	atomic_t cnt;
+	struct irq_work waker;
+	/*
+	 * The worker task that drains this queue.  The waker and the
+	 * submitters reach the worker through the queue - never through the
+	 * CPU they happen to run on - so a preemptible producer that
+	 * migrates still wakes the worker that owns the queue it filled.
+	 * Filled in by the smpboot .create callback.
+	 */
+	struct task_struct *thread;
+};
+
+#define SCG_HINT_LIMIT		128	/* per-CPU backlog before dropping */
+
+static struct scg_hint_queue __percpu *scg_hint_queues;
+
+/* The per-CPU worker itself; owned by the smpboot machinery. */
+static DEFINE_PER_CPU(struct task_struct *, scg_hint_thread);
+
+static inline struct scg_hint *scg_hint_alloc(struct scg_hint_queue *q)
+{
+	struct llist_node *node = llist_del_first(&q->free);
+
+	if (node)
+		return container_of(node, struct scg_hint, node);
+	return NULL;
+}
+
+static inline void scg_hint_free(struct scg_hint_queue *q, struct scg_hint *h)
+{
+	llist_add(&h->node, &q->free);
+}
+
+static inline s32 __scg_submit_hint(struct scg_hint_queue *q, struct scg_hint *h)
+{
+	s32 err = 0;
+
+	/* A full queue sheds load; the hint is dropped, and it will come. */
+	if (atomic_read(&q->cnt) >= SCG_HINT_LIMIT) {
+		err = -EBUSY;
+		goto err_free;
+	}
+	/*
+	 * Count before publishing: the worker decrements the count per hint
+	 * as it consumes each slot, so publishing first could let the count
+	 * dip below what is queued; the xchg in llist_add() orders the count
+	 * before the hint becomes visible, so the count only ever
+	 * overcounts, briefly, never undercounts - the worker can gate on it.
+	 */
+	atomic_inc(&q->cnt);
+	llist_add(&h->node, &q->hints);
+
+	return 0;
+
+err_free:
+	scg_hint_free(q, h);
+	return err;
+}
+
+/*
+ * Best-effort, lockless check whether @t1 and @t2 already account in
+ * one group: in one affinity group, or in one mm's group.  A stale read
+ * can cause a false negative, and the queued hint then runs as a no-op;
+ * it never causes a false positive.
+ */
+static inline bool scg_same_group(struct task_struct *t1,
+				   struct task_struct *t2)
+{
+	struct sched_cache_group *g1, *g2;
+	struct mm_struct *mm;
+	bool same = false;
+
+	rcu_read_lock();
+	g1 = rcu_dereference(t1->sched_cache_grp);
+	g2 = rcu_dereference(t2->sched_cache_grp);
+
+	if (g1 && g1 == g2) {
+		if (READ_ONCE(g1->type) == CACHE_GROUP_AFFINITY) {
+			/* One affinity group: the two account in one group. */
+			same = true;
+		} else {
+			/*
+			 * A shared mm group means one accounting only while
+			 * the two really share the mm: exec installs the new
+			 * mm before the new group, so a task mid-exec still
+			 * points at the old mm's group from a new mm, and
+			 * such a pair is already two processes.
+			 */
+			mm = READ_ONCE(t1->mm);
+			same = mm && mm == READ_ONCE(t2->mm);
+		}
+	}
+	rcu_read_unlock();
+
+	return same;
+}
+
+/*
+ * The producer holds preemption off from the this_cpu_ptr() to the
+ * queueing, so the queue it filled is the queue whose worker drains it;
+ * the callback itself may fire on a different CPU.  Find the owning worker
+ * through the queue, not through the CPU it runs on.
+ */
+static void scg_waker_fn(struct irq_work *work)
+{
+	struct scg_hint_queue *q =
+		container_of(work, struct scg_hint_queue, waker);
+	struct task_struct *tsk = READ_ONCE(q->thread);
+
+	/*
+	 * Wake only a worker that is not running; waking a running one just
+	 * burns a runqueue operation.  The smpboot loop publishes
+	 * TASK_INTERRUPTIBLE - a full barrier - before it re-checks the
+	 * queue, and the submitter's list update precedes its state read,
+	 * so if the worker still reads as running here it is bound to
+	 * observe the new hint and keep draining.
+	 */
+	if (tsk && !task_is_running(tsk))
+		wake_up_process(tsk);
+}
+
+/*
+ * Queue a hint connecting @t1 and @t2.  The caller must already hold a
+ * reference on each task: once the hint is queued it owns both, and the
+ * worker drops them; every path that does not queue drops both here.
+ */
+static inline s32 scg_submit_hint_pinned(struct task_struct *t1,
+					 struct task_struct *t2)
+{
+	struct scg_hint_queue *q;
+	struct task_struct *tsk;
+	struct scg_hint *h;
+	s32 ret;
+
+	/*
+	 * The cheapest gate first, before any pinning: the sched_feat gate
+	 * on the wake path does not imply this one, and with the feature
+	 * statically off every affine wakeup would otherwise pay the task
+	 * pinning and the queue dance only to be discarded in here.
+	 */
+	if (!sched_cache_enabled()) {
+		ret = -EOPNOTSUPP;
+		goto out_drop;
+	}
+
+	if (unlikely(!READ_ONCE(scg_hint_queues))) {
+		ret = -ENOMEM;
+		goto out_drop;
+	}
+
+	/*
+	 * preempt_disable() keeps a second submitter on this CPU off, but
+	 * interrupt contexts bypass it - a hardirq, softirq or NMI program
+	 * runs regardless - so refuse those instead of racing them; the
+	 * hint is advisory and will come again.
+	 */
+	if (!in_task()) {
+		ret = -EOPNOTSUPP;
+		goto out_drop;
+	}
+	preempt_disable();
+
+	q = this_cpu_ptr(scg_hint_queues);
+
+	if (scg_same_group(t1, t2)) {
+		ret = 0;
+		goto out_enable;
+	}
+
+	h = scg_hint_alloc(q);
+	if (!h) {
+		ret = -ENOMEM;
+		goto out_enable;
+	}
+	h->t1 = t1;
+	h->t2 = t2;
+
+	ret = __scg_submit_hint(q, h);
+	if (ret)
+		goto out_enable;
+
+	/*
+	 * The smpboot loop publishes TASK_INTERRUPTIBLE before its last look
+	 * at the queue, so a worker that still reads as running here will
+	 * pick this hint up itself; only wake one that is not.
+	 */
+	tsk = READ_ONCE(q->thread);
+	if (tsk && !task_is_running(tsk))
+		irq_work_queue(&q->waker);
+
+	preempt_enable();
+	return 0;		/* queued: the hint owns both references */
+
+out_enable:
+	preempt_enable();
+out_drop:
+	put_task_struct(t1);
+	put_task_struct(t2);
+	return ret;
+}
+
+static int scg_hint_should_run(unsigned int cpu)
+{
+	return !llist_empty(&per_cpu_ptr(scg_hint_queues, cpu)->hints);
+}
+
+static void scg_hint_thread_fn(unsigned int cpu)
+{
+	struct scg_hint_queue *q = per_cpu_ptr(scg_hint_queues, cpu);
+	struct llist_node *llnode = llist_del_all(&q->hints);
+	struct scg_hint *h, *n;
+
+	/*
+	 * Consume one hint at a time: each slot returns to the pool and drops
+	 * the count as it is processed, so a submitter sees the freed capacity
+	 * immediately instead of only after the whole batch.
+	 */
+	llist_for_each_entry_safe(h, n, llnode, node) {
+		sched_cache_hint(h->t1, h->t2);
+		put_task_struct(h->t1);
+		put_task_struct(h->t2);
+		scg_hint_free(q, h);
+		atomic_dec(&q->cnt);
+	}
+
+	/* A full batch may have taken a while; yield before the next one. */
+	cond_resched();
+}
+
+/*
+ * The smpboot layer stores the freshly created thread and only then calls
+ * back, so the just-stored task is already visible here.  The queues are
+ * published before the threads are registered, and a later hotplug bringup
+ * goes through the same store-then-create path.
+ */
+static void scg_hint_create(unsigned int cpu)
+{
+	WRITE_ONCE(per_cpu_ptr(scg_hint_queues, cpu)->thread,
+		   per_cpu(scg_hint_thread, cpu));
+}
+
+/*
+ * A CPU going offline parks its worker with the queue undrained: drop what
+ * is left so the pinned task references do not sit on an offline CPU
+ * forever.  The hints are dropped rather than processed - they are
+ * advisory, and park context is not the place for sched_cache_hint()'s
+ * sleepable work.  Hints queued after the offline sit until the CPU comes
+ * back, bounded by the queue limit.
+ */
+static void scg_hint_park(unsigned int cpu)
+{
+	struct scg_hint_queue *q = per_cpu_ptr(scg_hint_queues, cpu);
+	struct llist_node *llnode = llist_del_all(&q->hints);
+	struct scg_hint *h, *n;
+
+	llist_for_each_entry_safe(h, n, llnode, node) {
+		put_task_struct(h->t1);
+		put_task_struct(h->t2);
+		scg_hint_free(q, h);
+		atomic_dec(&q->cnt);
+	}
+}
+
+static struct smp_hotplug_thread scg_hint_threads = {
+	.store			= &scg_hint_thread,
+	.thread_should_run	= scg_hint_should_run,
+	.thread_fn		= scg_hint_thread_fn,
+	.create			= scg_hint_create,
+	.park			= scg_hint_park,
+	.thread_comm		= "scg_hints/%u",
+};
+
+/*
+ * Late, on purpose: smpboot threads need the scheduler up, and the queues
+ * must be published before any hint can be submitted.
+ */
+static int __init scg_hint_init(void)
+{
+	struct scg_hint_queue __percpu *queues;
+	struct scg_hint __percpu *pool;
+	int cpu, ret;
+
+	queues = alloc_percpu(struct scg_hint_queue);
+	if (!queues)
+		return -ENOMEM;
+
+	pool = (struct scg_hint __percpu *)
+		__alloc_percpu(sizeof(struct scg_hint) * SCG_HINT_LIMIT,
+			       __alignof__(struct scg_hint));
+	if (!pool) {
+		free_percpu(queues);
+		return -ENOMEM;
+	}
+
+	for_each_possible_cpu(cpu) {
+		struct scg_hint_queue *q = per_cpu_ptr(queues, cpu);
+		struct scg_hint *hpool = per_cpu_ptr(pool, cpu);
+		int i;
+
+		init_llist_head(&q->hints);
+		init_llist_head(&q->free);
+		for (i = 0; i < SCG_HINT_LIMIT; i++)
+			llist_add(&hpool[i].node, &q->free);
+		atomic_set(&q->cnt, 0);
+		init_irq_work(&q->waker, scg_waker_fn);
+	}
+
+	/*
+	 * Publish first: the workers - and the .create callbacks the smpboot
+	 * registration below runs - consult the queues as soon as they run.
+	 */
+	scg_hint_queues = queues;
+
+	ret = smpboot_register_percpu_thread(&scg_hint_threads);
+	if (ret) {
+		/*
+		 * Leak the queues rather than tear them down: they are already
+		 * published, and no producer can exist this early - the kfuncs
+		 * are not registered and CACHE_WAKE_HINT is off until debugfs
+		 * is up - so the only cost is that this feature fails to boot.
+		 */
+		pr_err("sched_cache: Failed to register the hint workers (%d)\n",
+		       ret);
+		return ret;
+	}
+
+	return 0;
+}
+late_initcall(scg_hint_init);
-- 
2.34.1

