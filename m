Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.71.93.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698979;
	b=EhmJrFPZhb82mErC268PSfi2290H560F48nL74Zq43vyccr9xbIiDx+o7uMckoE9W5HG
	 XBxKGBnVzNqNxTwpgv2Ls8fSSeYPzCBzK0kFwT846cLKzdxh0khmVdHRsPqY4cKNcABO8
	 /WJFjWNpulQYowcBAzbOFt8t17dc2j4i+N8rCpDSlsXWjc3Ge6+dauzEv8/b70MGx81B6
	 33S9PC54GB0Xln++7gep6oDQuCHRbSwNYk6l/76Y4a+N2E39udvYFi+KvrF4IQyUudhmP
	 j811slYp+MHJBLI4Ue9lOP9alAERGf/YwGtKiMN1TtvthicnVYGSn9FvLVzQzkh9HAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698979;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=bZjYfXmX0e57TkM6zZZV+pRJhC7w37NwJU64ENac4Eg=;
	b=VYQyeILJHBYr6UCgVsodUzXEhy4F+gWQVLlcdlCgrZd/Ohv6APm0qscC1DunM9D4mxWa
	 PZmUfPUQH+OFLgtqhOlg2cbW0ZwJZRB50gUyJUMn2VNqeAUocQaAi+LUhd9wUszlPU2uM
	 wDcjPWIxdXoOh4pZd86tsoXfYQCf2oU2B4sS6vE5X5gNxbAlbR+tAhyRkqUK7Jtyi9dO3
	 nG7PvTKDkH4rlcFPYj0EHOmaeEqaTnpMYX2qhXna8RgxTG1V0XkAektc71hFR2SxJOYwe
	 7p34Jot9f/5fPP5BRXI7QTAsfujNlUeNDOUD8XmQ9NNSssquROpVXY2wL6QUCAh0TQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=none smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=124.71.93.99
Received: from dggmsgout11.his.huawei.com (dggmsgout11.his.huawei.com [124.71.93.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1571D606A332
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1571D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggmsgout11.his.huawei.com (SkyGuard) with ESMTP id 4jZxrS0cF7z1c29G
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:16:08 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 0991E40574
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:16:15 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.193])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgAHDgEOMQhrq143Fw--.33284S4;
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
Subject: [RFC PATCH 2/7] sched/cache: Add thread count to cache group
Date: Thu, 26 Nov 2026 13:48:23 +0000
Message-Id: <4d976ab4e82b43f7733b3a47729e66aff3d32e58.1795691926.git.luogengkun2@huawei.com>
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
X-CM-TRANSID:_Ch0CgAHDgEOMQhrq143Fw--.33284S4
X-Coremail-Antispam: 1UD129KBjvJXoW3GFW7Gw4UAw1rGFW7urWfKrg_yoW3ZFW3pF
	ZrurWUJFsYqr4UW3yUA3yUZr1rtr92q3W7Gw1rJa4FywnFyr4rtr18t34fZrW5ZF4xCay2
	yw1Y93yIgr1Dtr7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxV
	WUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUFSdy
	UUUUU
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/

Every cache group belongs to an mm today, so get_nr_threads() is a
reasonable stand-in for the group's member count.  Later patches in
this series will introduce cache groups that no mm owns, and
get_nr_threads() cannot tell whether such a group is valid.

So add an atomic nr_threads counter to struct sched_cache_group and
maintain it through fork, exec, exit and failed-fork cleanup.
invalid_llc_nr() switches to grp->nr_threads, an exact count of the
tasks that reference the group.

Also add a WARN_ON_ONCE in sched_cache_group_free_rcu() so any leak is
caught when the group is finally released: a group being freed has no
members left, so a non-zero count means an attach/detach pairing bug.

Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
---
 include/linux/sched.h      |  1 +
 kernel/sched/cache_sched.c | 59 ++++++++++++++++++++++++++++++++------
 kernel/sched/cache_sched.h |  1 +
 kernel/sched/fair.c        | 14 ++++-----
 4 files changed, 59 insertions(+), 16 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index d35ae49a991f..3073ed421b58 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2415,6 +2415,7 @@ struct sched_cache_group {
 	unsigned long footprint;
 	int cpu;
 	refcount_t refcnt;
+	atomic_t nr_threads;
 	struct rcu_head rcu;
 } ____cacheline_aligned_in_smp;
 
diff --git a/kernel/sched/cache_sched.c b/kernel/sched/cache_sched.c
index c20ed59ba45b..e1562b6af0bc 100644
--- a/kernel/sched/cache_sched.c
+++ b/kernel/sched/cache_sched.c
@@ -20,6 +20,7 @@ static void sched_cache_group_free_rcu(struct rcu_head *rcu)
 	struct sched_cache_group *grp =
 		container_of(rcu, struct sched_cache_group, rcu);
 
+	WARN_ON_ONCE(atomic_read(&grp->nr_threads));
 	free_percpu(grp->pcpu_sched);
 	kfree(grp);
 }
@@ -54,26 +55,60 @@ struct sched_cache_group *task_cache_group_get(struct task_struct *p)
 	return sched_cache_group_get(rcu_dereference(p->sched_cache_grp));
 }
 
+/*
+ * Become a member of @grp and take one reference on it.  The reference
+ * returned is the caller's: publishing @grp into a task's sched_cache_grp
+ * hands it to the field, and every other outcome gives it back through
+ * sched_cache_group_detach().
+ *
+ * Returns NULL, having taken nothing, when @grp is NULL or already being
+ * released.
+ */
+static struct sched_cache_group *
+sched_cache_group_attach(struct sched_cache_group *grp) __must_check;
+
+static struct sched_cache_group *
+sched_cache_group_attach(struct sched_cache_group *grp)
+{
+	if (!grp || !refcount_inc_not_zero(&grp->refcnt))
+		return NULL;
+
+	atomic_inc(&grp->nr_threads);
+	return grp;
+}
+
+void sched_cache_group_detach(struct sched_cache_group *grp)
+{
+	if (grp) {
+		atomic_dec(&grp->nr_threads);
+		sched_cache_group_put(grp);
+	}
+}
+
 void sched_cache_fork(struct task_struct *p)
 {
 	/*
 	 * The child takes its own reference on the mm's cache group, separate
-	 * from the reference held by the mm. @p is not yet visible to readers,
-	 * so a plain initializing store is enough.
+	 * from the reference held by the mm.  Attaching takes that reference
+	 * and the membership in one step, and the store publishes both: @p is
+	 * not yet visible to readers, so a plain initializing store is enough.
 	 */
 	RCU_INIT_POINTER(p->sched_cache_grp,
-			 sched_cache_group_get(p->mm->sched_cache_grp));
+			 sched_cache_group_attach(p->mm->sched_cache_grp));
 }
 
 void sched_cache_fork_cleanup(struct task_struct *p)
 {
+	struct sched_cache_group *grp;
+
 	/*
 	 * A fork that fails after sched_cache_fork() never reaches exit_mm(),
 	 * so drop the reference here. @p never became visible, so there are no
 	 * concurrent readers and the reference we hold keeps the group alive.
 	 */
-	sched_cache_group_put(rcu_access_pointer(p->sched_cache_grp));
+	grp = rcu_access_pointer(p->sched_cache_grp);
 	RCU_INIT_POINTER(p->sched_cache_grp, NULL);
+	sched_cache_group_detach(grp);
 }
 
 void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct *mm)
@@ -81,11 +116,16 @@ void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct *mm)
 	struct sched_cache_group *old;
 
 	/*
-	 * Acquire the new reference before publishing the pointer, then drop
-	 * the old one. @p is current and the only writer of its own pointer.
+	 * Attaching takes the new group's reference and its membership before
+	 * the store publishes it, so a reader that finds it in the field sees
+	 * a group @p is already counted in.  The store then hands over that
+	 * reference and the old group is detached, which drops both its
+	 * membership and the reference it was published with.  @p is current
+	 * and the only writer of its own pointer.
 	 */
-	old = sched_cache_replace_grp(p, sched_cache_group_get(mm->sched_cache_grp));
-	sched_cache_group_put(old);
+	old = sched_cache_replace_grp(p,
+			sched_cache_group_attach(mm->sched_cache_grp));
+	sched_cache_group_detach(old);
 }
 
 void sched_cache_exit_mm(struct task_struct *p)
@@ -105,7 +145,7 @@ void sched_cache_exit_mm(struct task_struct *p)
 		WRITE_ONCE(grp->footprint, fp - sub);
 	}
 #endif
-	sched_cache_group_put(grp);
+	sched_cache_group_detach(grp);
 }
 
 static void sched_cache_group_init(struct sched_cache_group *grp,
@@ -131,6 +171,7 @@ static void sched_cache_group_init(struct sched_cache_group *grp,
 	grp->nr_running_avg = 0;
 	grp->footprint = 0;
 	refcount_set(&grp->refcnt, 1);
+	atomic_set(&grp->nr_threads, 0);
 	/*
 	 * The update to grp->pcpu_sched should not be reordered
 	 * before initialization to grp's other fields, in case
diff --git a/kernel/sched/cache_sched.h b/kernel/sched/cache_sched.h
index 4d0febe5fee1..c73595ad6a9a 100644
--- a/kernel/sched/cache_sched.h
+++ b/kernel/sched/cache_sched.h
@@ -13,6 +13,7 @@
 struct sched_cache_group *
 sched_cache_alloc_group(struct sched_cache_time __percpu *_pcpu_sched);
 void sched_cache_group_put(struct sched_cache_group *grp);
+void sched_cache_group_detach(struct sched_cache_group *grp);
 
 #endif /* CONFIG_SCHED_CACHE */
 
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 29c6be227ef8..f5610cbc76ec 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1527,17 +1527,17 @@ static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
 	return false;
 }
 
-static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_struct *p,
-			   int cpu)
+static bool invalid_llc_nr(struct sched_cache_group *grp, int cpu)
 {
 	int scale;
 
-	if (get_nr_threads(p) <= 1)
+	/* Skip if the cache group has at most one member. */
+	if (atomic_read(&grp->nr_threads) <= 1)
 		return true;
 
 	/*
 	 * Scale the number of 'cores' in a LLC by llc_aggr_tolerance
-	 * and compare it to the task's active threads.
+	 * and compare it to the group's active threads.
 	 */
 	scale = get_sched_cache_scale(1);
 	if (scale == INT_MAX)
@@ -1802,7 +1802,7 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 	 * its preferred state.
 	 */
 	if ((long)(epoch - READ_ONCE(grp->epoch)) > llc_epoch_affinity_timeout ||
-	    invalid_llc_nr(grp, p, cpu_of(rq)) ||
+	    invalid_llc_nr(grp, cpu_of(rq)) ||
 	    exceed_llc_capacity(grp, cpu_of(rq))) {
 		if (READ_ONCE(grp->cpu) != -1)
 			WRITE_ONCE(grp->cpu, -1);
@@ -1946,7 +1946,7 @@ static void task_cache_work(struct callback_head *work)
 		return;
 
 	curr_cpu = task_cpu(p);
-	if (invalid_llc_nr(grp, p, curr_cpu) ||
+	if (invalid_llc_nr(grp, curr_cpu) ||
 	    exceed_llc_capacity(grp, curr_cpu)) {
 		if (READ_ONCE(grp->cpu) != -1)
 			WRITE_ONCE(grp->cpu, -1);
@@ -10830,7 +10830,7 @@ static enum llc_mig can_migrate_llc_task(struct lb_env *env,
 		return mig_unrestricted;
 
 	/* skip cache aware load balance for too many threads */
-	if (invalid_llc_nr(grp, p, dst_cpu) ||
+	if (invalid_llc_nr(grp, dst_cpu) ||
 	    exceed_llc_capacity(grp, dst_cpu)) {
 		if (READ_ONCE(grp->cpu) != -1)
 			WRITE_ONCE(grp->cpu, -1);
-- 
2.34.1

