Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.71.93.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698980;
	b=mUDY/WYWkDFP8AUQqSTivmYXPQAxfVNw/itG/Je6RWhcy95FiwfPA6YSv0sar6SdMMqQ
	 JFLdl1Jjm3XyfPwdoNuGuRmun8vqwhhSZkMB/kbh6VPObAhYDbZ42qxXdeRhY4Y9AzZbG
	 ZIDFPHhovln5gzDCoBJeZjMURf7wntn2gvb8AfL9BaRVkY5eeyhNwnSXOgPEVNHMCGBeC
	 LmJ+tVvKG3UtYoqxjgFeYIA8DvPszjEXR9SYMJ5lN5N3rcHmvB3oeWFRmWqfcF2CPdVz5
	 XJR9ZzgXAP5tR9v/POHCVHAdFghoUxdkQpZcDY1+gvl11ED5OxZlUFZlAsJ6n4HEZ+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698980;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Dm3o7HWyrwQi/Bxo40IS1mpfQYFyG5QMf6JJuORWUwo=;
	b=u5euFUbfETodt5LzuDntlQzUgS46D6JUEWD/gL79EUVo9HzGIBGEBplxNZQ1qeJJ4+U0
	 p2nxMpHwviK65/V/Td5bwMDNhNdwvzhqSGCLf8/d5z38BBO8Fd6bJLcFSalCQlxa28IJk
	 NZ6dHdYnhYOFgzvLOVwrWxpJHDKnqzXqZpNRI5K4c2ut11crcnjzc0hHul9BMMVpucMlb
	 mpTB7wPkrosGX3hgyF7WiFNVk9vqAWnLHxkLwI6rpvKRj4kd5EIPYNxNEWb4P7IK5QGjq
	 o9AJpEJDljdCu76n1Fkliv0hw0WAX2+YAXeWnGlvGMUe5o3F6+enOTUHltoP0fZlrVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=none smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=124.71.93.99
Received: from dggmsgout11.his.huawei.com (dggmsgout11.his.huawei.com [124.71.93.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1276606A334
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1276606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggmsgout11.his.huawei.com (SkyGuard) with ESMTP id 4jZxrS1cmkz1c29T
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:16:08 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 2D71B40561
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:16:15 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.193])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgAHDgEOMQhrq143Fw--.33284S5;
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
Subject: [RFC PATCH 3/7] sched/cache: Introduce the task affinity group
Date: Thu, 26 Nov 2026 13:48:24 +0000
Message-Id: <df8628df627d603e038f5228b08b8b63000b5e50.1795691926.git.luogengkun2@huawei.com>
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
X-CM-TRANSID:_Ch0CgAHDgEOMQhrq143Fw--.33284S5
X-Coremail-Antispam: 1UD129KBjvAXoWfGw4UuF43GrWUWFyrGw1fXrb_yoW8JFy7Zo
	WSy3yrJr18K348JrZ5GFn5JrW8u34Y9r9xAr45urnxG3WDZ348G34UGwn8Wa4fXFWIkFs3
	A3WkXan8Ca1Utw1rn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUO07kC6x804xWl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK
	8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr
	Wl82xGYIkIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ew
	Av7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY
	6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14
	v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU
	FF4iUUUUU
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/

A cache group belongs to an mm today, and it is what gathers all the
tasks of a thread group together.  But it cannot gather tasks from
different mms: two processes talking through a pipe, for example, have
data affinity, yet still cannot be gathered together.  To address this
problem, add the affinity group: it belongs to no mm, so it can gather
tasks from different mms.

An mm's group and an affinity group are the two kinds of cache group,
told apart by the new type field.  An affinity group adds two members:

  - parent, used only by affinity groups: when two affinity groups
    merge, the loser points to the winner
  - rank, used only by affinity groups: when two affinity groups merge,
    rank decides the winner

Submitting sched_cache_hint(x, y) is all it takes to gather x and y
into one affinity group.  An example:

          before                     after

      [ A ]      [ B ]            [ A ]----->[ B ]
      /   \      /   \            /   \      /   \
     t1    t2   t3   t4          t1    t2   t3   t4

This commit only sets A->parent to B; updating the sched_cache_grp of
the tasks in A to follow the link is implemented in the next commit.

Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
---
 include/linux/sched.h      |  19 +++
 kernel/sched/cache_sched.c | 280 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 296 insertions(+), 3 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 3073ed421b58..de270443cffa 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2406,6 +2406,16 @@ struct sched_cache_time {
 	unsigned long epoch;
 };
 
+/*
+ * The kind of a cache group.  An mm's group and an affinity group are the
+ * only kinds there are, and only an affinity group ever carries a merge
+ * link: the type tells them apart.
+ */
+enum cache_group_type {
+	CACHE_GROUP_MM = 0,
+	CACHE_GROUP_AFFINITY,
+};
+
 struct sched_cache_group {
 	struct sched_cache_time __percpu *pcpu_sched;
 	raw_spinlock_t lock;
@@ -2416,6 +2426,9 @@ struct sched_cache_group {
 	int cpu;
 	refcount_t refcnt;
 	atomic_t nr_threads;
+	enum cache_group_type		type;
+	struct sched_cache_group __rcu	*parent;
+	unsigned int			rank;
 	struct rcu_head rcu;
 } ____cacheline_aligned_in_smp;
 
@@ -2427,6 +2440,8 @@ void sched_cache_fork_cleanup(struct task_struct *p);
 void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct *mm);
 void sched_cache_exit_mm(struct task_struct *p);
 
+int sched_cache_hint(struct task_struct *t1, struct task_struct *t2);
+
 #else
 
 struct sched_cache_group { };
@@ -2436,6 +2451,10 @@ static inline void sched_cache_fork_cleanup(struct task_struct *p) { }
 static inline void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct *mm) { }
 static inline void sched_cache_exit_mm(struct task_struct *p) { }
 
+static inline int sched_cache_hint(struct task_struct *t1, struct task_struct *t2)
+{
+	return -EOPNOTSUPP;
+}
 #endif
 
 #ifndef MODULE
diff --git a/kernel/sched/cache_sched.c b/kernel/sched/cache_sched.c
index e1562b6af0bc..52106c3ac049 100644
--- a/kernel/sched/cache_sched.c
+++ b/kernel/sched/cache_sched.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include "sched.h"
+#include "cache_sched.h"
 
 #define rcu_deref_sched_cache_grp(tsk) \
 	rcu_dereference_check((tsk)->sched_cache_grp, (tsk) == current)
@@ -9,8 +10,14 @@ static struct sched_cache_group *sched_cache_replace_grp(struct task_struct *p,
 {
 	struct sched_cache_group *old;
 
+	/*
+	 * A hint on another CPU may change the field concurrently.  cmpxchg
+	 * makes sure @old is the group this call actually replaced: that is
+	 * the one to detach, and a concurrent swap is left intact.
+	 */
 	old = rcu_deref_sched_cache_grp(p);
-	rcu_assign_pointer(p->sched_cache_grp, new);
+	do {
+	} while (!try_cmpxchg(&p->sched_cache_grp, &old, new));
 
 	return old;
 }
@@ -19,10 +26,15 @@ static void sched_cache_group_free_rcu(struct rcu_head *rcu)
 {
 	struct sched_cache_group *grp =
 		container_of(rcu, struct sched_cache_group, rcu);
+	struct sched_cache_group *parent;
 
 	WARN_ON_ONCE(atomic_read(&grp->nr_threads));
+	/* Only affinity groups hold it; for an mm's group this is NULL. */
+	parent = rcu_access_pointer(grp->parent);
 	free_percpu(grp->pcpu_sched);
 	kfree(grp);
+
+	sched_cache_group_put(parent);
 }
 
 void sched_cache_group_put(struct sched_cache_group *grp)
@@ -120,8 +132,7 @@ void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct *mm)
 	 * the store publishes it, so a reader that finds it in the field sees
 	 * a group @p is already counted in.  The store then hands over that
 	 * reference and the old group is detached, which drops both its
-	 * membership and the reference it was published with.  @p is current
-	 * and the only writer of its own pointer.
+	 * membership and the reference it was published with.
 	 */
 	old = sched_cache_replace_grp(p,
 			sched_cache_group_attach(mm->sched_cache_grp));
@@ -194,3 +205,266 @@ sched_cache_alloc_group(struct sched_cache_time __percpu *_pcpu_sched)
 	sched_cache_group_init(grp, _pcpu_sched);
 	return grp;
 }
+
+/*
+ * Follow the merge links up to the root of @grp, which is where the
+ * accounting lives.  Walking needs no lock of its own: the caller's
+ * reference on @grp keeps it alive, and every live affinity group holds a
+ * reference on its parent, so the chain cannot be freed under the walk.
+ */
+static struct sched_cache_group *scg_find_root(struct sched_cache_group *grp)
+{
+	struct sched_cache_group *parent;
+
+	while ((parent = rcu_dereference(grp->parent)))
+		grp = parent;
+
+	return grp;
+}
+
+/*
+ * Allocate an affinity group: a fresh group typed CACHE_GROUP_AFFINITY,
+ * never an mm's.  Returns with one reference, the caller's.  Sleeps, so
+ * call it with no lock held.
+ */
+static struct sched_cache_group *scg_affinity_alloc(void)
+{
+	struct sched_cache_time __percpu *pcpu_sched;
+	struct sched_cache_group *grp;
+
+	pcpu_sched = alloc_percpu(struct sched_cache_time);
+	if (!pcpu_sched)
+		return NULL;
+
+	/* Frees @pcpu_sched itself when it fails. */
+	grp = sched_cache_alloc_group(pcpu_sched);
+	if (!grp)
+		return NULL;
+
+	grp->type = CACHE_GROUP_AFFINITY;
+
+	return grp;
+}
+
+/*
+ * Whether @p can be put into an affinity group.  A kernel thread has no mm
+ * to pin, and a task on its way out of one - the last exec or exit - is past
+ * the point where an affinity move means anything.
+ *
+ * Both are racy reads from another CPU: a stale read only lets a hint
+ * through, and the cmpxchg on the field settles that race like any other.
+ * What the checks buy is skipping an affinity allocation and swap for a task
+ * that is already gone.
+ */
+static bool scg_can_attach(struct task_struct *p)
+{
+	return !(p->flags & (PF_KTHREAD | PF_EXITING)) &&
+	       !p->in_execve && p->mm;
+}
+
+/*
+ * The task's entry into its affinity group: the group it accounts in.  A
+ * task outside any affinity group accounts in its mm's group; first contact
+ * switches it to a fresh affinity group here, so membership and accounting
+ * are one fact in one field.
+ *
+ * The switch mirrors sched_cache_replace_grp(): exec and exit race it from
+ * @t's own context, and two hints may race each other, so whoever wins the
+ * cmpxchg owns the attach and the detach of what it installed and replaced.
+ */
+static struct sched_cache_group *
+scg_get_or_alloc_affinity(struct task_struct *t)
+{
+	struct sched_cache_group *c, *new;
+
+	scoped_guard(rcu) {
+		c = rcu_dereference(t->sched_cache_grp);
+		/* The type is stamped before publication and never changes. */
+		if (c && (READ_ONCE(c->type) == CACHE_GROUP_AFFINITY)) {
+			if (!sched_cache_group_get(c))
+				return ERR_PTR(-EAGAIN);
+			return c;		/* already an affinity group */
+		}
+	}
+
+	if (!scg_can_attach(t))
+		return ERR_PTR(-ESRCH);
+
+	new = scg_affinity_alloc();			/* sleepable, outside any lock */
+	if (!new)
+		return ERR_PTR(-ENOMEM);
+
+	scoped_guard(rcu) {
+		c = rcu_dereference(t->sched_cache_grp);
+		if (!c) {
+			/* Exit took the group away while we were allocating. */
+			sched_cache_group_put(new);
+			return ERR_PTR(-ESRCH);
+		}
+		if (READ_ONCE(c->type) == CACHE_GROUP_AFFINITY) {
+			/* Another hint won the first contact while we allocated. */
+			if (!sched_cache_group_get(c)) {
+				sched_cache_group_put(new);
+				return ERR_PTR(-EAGAIN);
+			}
+			sched_cache_group_put(new);
+			return c;
+		}
+
+		/*
+		 * First contact: switch the accounting to the fresh affinity
+		 * group.  A lost cmpxchg means @t moved on after the read
+		 * above (exec installed a new mm's group, exit cleared it):
+		 * drop the hint, not the task.
+		 *
+		 * Two references are in play: the allocator's, which the
+		 * caller owns, and the field's.  Attaching takes the second
+		 * and counts the membership in the same step.
+		 */
+		if (!sched_cache_group_attach(new)) {
+			/* Fresh from the allocator, so this cannot happen. */
+			sched_cache_group_put(new);
+			return ERR_PTR(-EAGAIN);
+		}
+		if (!try_cmpxchg(&t->sched_cache_grp, &c, new)) {
+			sched_cache_group_detach(new);	/* the field's */
+			sched_cache_group_put(new);	/* the allocator's */
+			return ERR_PTR(-EAGAIN);
+		}
+
+		sched_cache_group_detach(c);
+	}
+
+	return new;				/* the allocator's reference */
+}
+
+/*
+ * Put one root under the other; every member keeps converging to whatever
+ * its root is now.
+ *
+ * The child's reference on the root keeps the chain up while the members
+ * that cached the child are still converging through it; it is dropped only
+ * in the child's free callback.
+ *
+ * The lock is the groups' own, shared with the tick's queueing, which runs
+ * from interrupt context - hence the IRQ-disabled take.  The two groups are
+ * locked in address order, the only nesting this lock ever sees.
+ */
+static int scg_merge(struct sched_cache_group *a, struct sched_cache_group *b)
+{
+	int ret = 0;
+	struct sched_cache_group *root, *child;
+	unsigned long flags;
+
+	if (a == b)
+		return 0;		/* same affinity group already */
+
+	/* Merge links exist only between affinity groups, never an mm's. */
+	if (WARN_ON_ONCE(a->type != CACHE_GROUP_AFFINITY ||
+			 b->type != CACHE_GROUP_AFFINITY))
+		return -EINVAL;
+
+	if (a > b)
+		swap(a, b);
+
+	raw_spin_lock_irqsave(&a->lock, flags);
+	raw_spin_lock_nested(&b->lock, SINGLE_DEPTH_NESTING);
+
+	if (rcu_dereference_protected(a->parent, 1) != NULL ||
+	    rcu_dereference_protected(b->parent, 1) != NULL) {
+		ret = -EAGAIN;
+		goto out;
+	}
+	root = a->rank < b->rank ? b : a;
+	child = root == a ? b : a;
+	if (root->rank == child->rank)
+		root->rank++;
+
+	/*
+	 * The child's per-CPU runtime history dies with the group - the
+	 * merged affinity group's occupancy starts over from what accrues on
+	 * the root.  These are advisory statistics, not accounting of record;
+	 * keeping the sums continuous would mean walking the child's
+	 * per-CPU array under both locks, for numbers that converge again
+	 * within an epoch anyway.
+	 */
+	refcount_inc(&root->refcnt);	/* child owns one ref on root */
+	rcu_assign_pointer(child->parent, root);
+
+out:
+	raw_spin_unlock(&b->lock);
+	raw_spin_unlock_irqrestore(&a->lock, flags);
+
+	return ret;
+}
+
+/*
+ * Connect @t1 and @t2: they are accounted in one group from here on.  The
+ * caller's references are enough, no tasks are pinned.
+ *
+ * Two threads of one mm need nothing of this only while neither is in an
+ * affinity group: their accounting already meets in the mm's group.  Once
+ * one of them joins an affinity group the pair is split, and the hint has
+ * real work to do.
+ */
+int sched_cache_hint(struct task_struct *t1, struct task_struct *t2)
+{
+	struct sched_cache_group *c1, *c2;
+	struct mm_struct *mm1;
+	int ret = 0;
+
+	if (!sched_cache_enabled())
+		return -EOPNOTSUPP;
+
+	if (t1 == t2)
+		return 0;
+
+	/*
+	 * The common same-mm case is two threads outside any affinity group:
+	 * they share the mm's group already, so skip the lock.  These reads
+	 * are racy and may skip a pair that just joined an affinity group;
+	 * hints are advisory, and whatever still observes the relation
+	 * submits again.
+	 */
+	mm1 = READ_ONCE(t1->mm);
+	if (mm1 && mm1 == READ_ONCE(t2->mm)) {
+		struct sched_cache_group *g1;
+
+		rcu_read_lock();
+		g1 = rcu_dereference(t1->sched_cache_grp);
+		if (g1 && g1 == rcu_dereference(t2->sched_cache_grp) &&
+		    READ_ONCE(g1->type) != CACHE_GROUP_AFFINITY) {
+			rcu_read_unlock();
+			return 0;
+		}
+		rcu_read_unlock();
+	}
+
+	if (!scg_can_attach(t1) || !scg_can_attach(t2))
+		return -ESRCH;
+
+	for (;;) {
+		c1 = scg_get_or_alloc_affinity(t1);
+		if (IS_ERR(c1)) {
+			ret = PTR_ERR(c1);
+			break;
+		}
+		c2 = scg_get_or_alloc_affinity(t2);
+		if (IS_ERR(c2)) {
+			sched_cache_group_put(c1);
+			ret = PTR_ERR(c2);
+			break;
+		}
+		rcu_read_lock();
+		ret = scg_merge(scg_find_root(c1), scg_find_root(c2));
+		rcu_read_unlock();
+
+		sched_cache_group_put(c1);
+		sched_cache_group_put(c2);
+
+		if (ret != -EAGAIN)
+			return ret;
+		cond_resched();
+	}
+	return ret;
+}
-- 
2.34.1

