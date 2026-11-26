Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.71.94.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698980;
	b=MhVa2FzzgUgrScoKRpDqFp04jdNZA2gwZll7l61J0cqS3X9mtAxwZHnYlo313T5DX/Th
	 l0vzt6VRp6zTBUvitgopNOzcQoczRcTg9U53SOLBbM2jUp+vXabBFFffir4tu1EFNVD3Q
	 x77W5upiAW8q9uqfEMUQs9/TpQZOm5WzHe8hqbddjJbKByDufYcPow3/Dba76fjh1/VkU
	 36n/mtngTgUKrDGX5/0D7jcAwE+2O1eiLZAPce3QU58S6K/Eges/drICe64nPeEZLJQpB
	 88wbSzpawZEnTAg0hX1WmmfneaM9x49S/MJknVtRc1gGFUr8kp7uxp4HcIhRvBYH7HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698980;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=XTod620/gxjj9j03+rwV+9pqtXfHSZ+F/v3sKpSznuE=;
	b=svsGVYWe3zC7e6U1qnnjCqrgR/2XCEDMBppMG23nOU0VoMcqZ85Bqvzfg4GsMyH/jZKS
	 x6tgxp6h/avLpj51ynyZkQmS4PvXEERaVWvW9f0kZN4P4HsCmoh32/qXTRlUOtV0pK3mc
	 Hk4dEs6fyg1BIqhDLOMvDjyh1eoYOCBU5YYwYXXtCI/kh73cTQJNRnm+DKquYWalZr/A2
	 crkHjJTYisOzRY1dgiudKRMueeoh+soz3PAnwbXYwb6DZVszukWAhCQqTHdd4QuvGNP+N
	 Vv390hQ9elWipYBr6aNUlh1z3yRdEnVTgs7JK5xxoTD/WD/jCbzuErXrG18xIJ8F+bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=none smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=124.71.94.104
Received: from dggmsgout13.his.huawei.com (dggmsgout13.his.huawei.com [124.71.94.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CED606A338
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5CED606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggmsgout13.his.huawei.com (SkyGuard) with ESMTP id 4jZxrV104Mz1rr8k
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:16:10 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 4890940974
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:16:15 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.193])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgAHDgEOMQhrq143Fw--.33284S6;
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
Subject: [RFC PATCH 4/7] sched/cache: Converge task accounting to the affinity root
Date: Thu, 26 Nov 2026 13:48:25 +0000
Message-Id: <cf5eaad0ece8894dfabc6498875b599ebff34899.1795691926.git.luogengkun2@huawei.com>
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
X-CM-TRANSID:_Ch0CgAHDgEOMQhrq143Fw--.33284S6
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw1fZr45CFWDKFWUKF18AFb_yoW7XF4fpF
	Wq9rW5Jr4kta17X393A3yUZr1rX3s3Xa47GryxJFyfAw13tr4rtry0y34a9rWY9rs2ka42
	vr4Y9ay2kF1DKaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPqb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
	xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Y
	z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2
	AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x
	07UZTmfUUUUU=
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/

Merging two affinity groups only sets the loser's parent: the tasks of
the loser keep accounting in their old group. Add
sched_grp_refresh(), which walks a task's merge links up to the
root and switches the task to it, so the entire affinity group ends up
accounted in a single group.

The convergence is lazy, triggered at the task's next accounting: a
task outside any affinity group is untouched, while a task whose
affinity group has not moved pays only a type read and a parent read.
account_mm_sched() converges before accounting, and task_cache_work()
does the same; the walk and switch happen at most once per member per
merge.

Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
---
 include/linux/sched.h      |  3 +++
 kernel/sched/cache_sched.c | 54 ++++++++++++++++++++++++++++++++++++++
 kernel/sched/fair.c        | 16 +++++++++++
 3 files changed, 73 insertions(+)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index de270443cffa..769e2304f617 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2442,6 +2442,9 @@ void sched_cache_exit_mm(struct task_struct *p);
 
 int sched_cache_hint(struct task_struct *t1, struct task_struct *t2);
 
+struct sched_cache_group *sched_grp_refresh(struct task_struct *p,
+					    struct sched_cache_group *grp);
+
 #else
 
 struct sched_cache_group { };
diff --git a/kernel/sched/cache_sched.c b/kernel/sched/cache_sched.c
index 52106c3ac049..c5fce997c114 100644
--- a/kernel/sched/cache_sched.c
+++ b/kernel/sched/cache_sched.c
@@ -468,3 +468,57 @@ int sched_cache_hint(struct task_struct *t1, struct task_struct *t2)
 	}
 	return ret;
 }
+
+/*
+ * Converge @p to the group its affinity group accounts in, and return the
+ * group the caller should account in.  A task outside any affinity group
+ * keeps its group, i.e. the default thread-group behaviour.
+ *
+ * @p is always the task running on the rq being accounted, but the caller
+ * need not run on that CPU: a remote wakeup's enqueue or a bandwidth
+ * unthrottle calls account_mm_sched() on rq->curr under that rq's lock, so
+ * this can converge @p while @p itself is in exec_mmap() or exit_mm() on
+ * its own CPU.  The move is therefore a cmpxchg, mirrored by
+ * sched_cache_replace_grp() and scg_get_or_alloc_affinity(): whoever
+ * loses drops the reference it just took and converges again at the next
+ * accounting.
+ */
+struct sched_cache_group *sched_grp_refresh(struct task_struct *p,
+					    struct sched_cache_group *grp)
+{
+	struct sched_cache_group *new_root;
+
+	/* Outside any affinity group: keeps the mm's group, nothing to do. */
+	if (!grp || READ_ONCE(grp->type) != CACHE_GROUP_AFFINITY)
+		return grp;
+
+	scoped_guard(rcu) {
+		/* Still the root: the common case. */
+		if (!rcu_dereference(grp->parent))
+			return grp;
+
+		/* The group we account in was merged away: follow the links. */
+		new_root = scg_find_root(grp);
+		/*
+		 * Pinned by the reference @p holds on @grp: it keeps the whole
+		 * chain above alive, and an RCU-pending @grp holds its edge on
+		 * the parent until its free callback, so attaching cannot fail
+		 * here.
+		 */
+		if (!sched_cache_group_attach(new_root))
+			return grp;
+		/*
+		 * Move @p's reference to the new root.  Losing means @p moved
+		 * on (exec installed a new mm's group, exit cleared it) after
+		 * the caller read @grp: give back the membership and the
+		 * reference just taken, the winner's is its own.
+		 */
+		if (!try_cmpxchg(&p->sched_cache_grp, &grp, new_root)) {
+			sched_cache_group_detach(new_root);
+			return grp;
+		}
+		sched_cache_group_detach(grp);	/* nr_threads + the field's reference */
+	}
+
+	return new_root;
+}
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index f5610cbc76ec..5be8a7c7076e 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1788,6 +1788,14 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 	if (p->flags & PF_KTHREAD || !grp || !grp->pcpu_sched)
 		return;
 
+	/*
+	 * Converge to the group the task's affinity group accounts in
+	 * before accounting into it; a no-op outside any affinity group.
+	 */
+	grp = sched_grp_refresh(p, grp);
+	if (!grp || !grp->pcpu_sched)
+		return;
+
 	pcpu_sched = per_cpu_ptr(grp->pcpu_sched, cpu_of(rq));
 
 	scoped_guard (raw_spinlock, &rq->cpu_epoch_lock) {
@@ -1912,6 +1920,7 @@ static inline void update_avg_scale(u64 *avg, u64 sample)
 static void task_cache_work(struct callback_head *work)
 {
 	struct sched_cache_group *grp __free(sched_cache_group_put) = NULL;
+	struct sched_cache_group *new_grp;
 	cpumask_var_t cpus __free(free_cpumask_var) = CPUMASK_VAR_NULL;
 	int cpu, m_a_cpu = -1, nr_running = 0, curr_cpu;
 	unsigned long next_scan, now = jiffies;
@@ -1934,6 +1943,13 @@ static void task_cache_work(struct callback_head *work)
 	grp = task_cache_group_get(p);
 	if (!grp)
 		return;
+	new_grp = sched_grp_refresh(p, grp);
+	if (new_grp != grp) {
+		sched_cache_group_put(grp);
+		grp = sched_cache_group_get(new_grp);
+		if (!grp)
+			return;
+	}
 
 	next_scan = READ_ONCE(grp->next_scan);
 	if (time_before(now, next_scan))
-- 
2.34.1

