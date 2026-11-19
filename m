Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795128602;
	b=UgrYT3lkAciXveNMYtFUS+7HAaCWTshLDxWVU0ffJwzJSCIM/DtUkOkheKBWAo9QeNze
	 GLLoyH7bCi2led6Zu65BiHDtfwuIaXiN6gOLGvyRr9l1dmRgrMKARZv2POOPpuu8L/7gJ
	 CXhsO/iJfwIgZAisDG3SgS9DlZwB29rXgDp5yiTpOr0Ux/qCSfhOt2TyY2vqL7uNJw1Cx
	 WO3st7VqpDmDO3QuAVYcpuHJ7SOPIgdTmCPSwV3nd+iiQCNaVb4dg2upNQ5ko0Bw6pOcx
	 w5wX/nQl/lExqGmIPoqRU47eZlW2ArZI/cP3GLX4097T0XGCn8eBOK5N2xnJGFgSHaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=p82MsU5uHXLg76rO4GqK7iuem4a8yq2GXZHkhH3CUjY=;
	b=CSUDw28jkTqr0N/gM0FaytZmhs25jNBafj3/rZMhJPs2YnAXb65eTNkc2CgXpumQIE3Z
	 1itXCnoPKl0CCQV7n930ahx1KbDsg71jOxUoKOGnnmFhVK6uUQVws6A3t6mxh8rFD9PiI
	 0k/hU7QLz80caWSs9U6Awexvp6GIii4pDZDJt8MR5JLsOG3Etg9L2XzOyn75Ci3MkLtVm
	 sLiSr641Aoo1kj4b1D/hCxWwqm22gU6Di6IuooHblIh++Xj9FGlbyr9F+Ezkh4Iv+UiT2
	 /X0JuyldM2DIgi8KLzwTn9y18TmLYAFziTafS07GtDspraxuLD3ov+ffen39yaV1kCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ofns0t/o";
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B2D606A333
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2B2D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ofns0t/o
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-382af5cfc58so726088eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795128601; x=1795733401; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p82MsU5uHXLg76rO4GqK7iuem4a8yq2GXZHkhH3CUjY=;
        b=ofns0t/oaex1/ayIK027xx51ADn9JcbgjnkYoNC/mK1owrcjaHAd2MfCT6x+U2tkLs
         WkuqSOnWUTl1GTBz3ekMOKpgDgJGjl+xOgat0++Wm3pvxgZ8bs0MV3tYgQygnEMtUYh9
         17wnltl+3bzxOpJa9oFc9MmW025hLDlXFfprKo5tg4U1i/WONoNoio0UpeJlTWJCboMw
         jYKIhPv7fVvXlWLE+E3oLCcSeax97RCy/EK/ggMjQRocMUH/RevnTxad3ag/IPD8D7TK
         tiGtSneGehLTOMa9Kl03v0PfWxCEMLCxgN7d+p5/+3p9SrgV6ZD/N+xVyj4yH9dW4UBu
         CPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795128601; x=1795733401;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p82MsU5uHXLg76rO4GqK7iuem4a8yq2GXZHkhH3CUjY=;
        b=uBFbRhgLuZPZ4WGEqtPulhFLpA9/RzDnWElBYT6t6662aa2sp/mkAu+WWHxA27qHcb
         bO/CDqJZbYMVYN1cYS2e0vhq3idoms8b+Zh4XxUDqcRo4sO4W7E/Fo1+0xkG7dqIERug
         7UGFV0aHeacortw4nx4ncsKIYr5tRQMixL2H0gXTakveeQ/x81qYTJz0Tcm9xQWh2UOE
         aQQpXZOLzaz8tRktiI8Lsx+TDo4ZlzYmaRBt0i8+ugtaKxzJ+ZE7bxNs/lH1djsGPUqN
         ThF2Fs1suKAxlbraTPJJ4ScdKJKJtMOJa3ZX1vyl9+lnk7IwwVvqjF2JI3GTZzjkYP5d
         SE6A==
X-Forwarded-Encrypted: i=1; AL+hErFK+5JDSDTIgNFXLnh3Oc4z8rLbIZ8gDV+HIiuzZTjB3mnQhwwehba50kCVkfaKMH7KqAppQv8jk9VvXlI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1Wi3TX9MkwnQXUYEUSMLQ3yd5StQwm99oXQfJHVGqwLWyjwBh
	M724YhBvra2JxfbEksVm/9jV42GX1d09+0uah+sVKsefrqhAERaM0LRi2CMhF7Zv99VVM4Ytm8/
	SzC9k5CjkbuuSAZajSw==
X-Received: from dled6-n2.prod.google.com ([2002:a05:701b:42c6:20b0:19a:9ffd:b30e])
 (user=penghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:2096:10b0:151:2e62:fe5b with SMTP id a92af1059eb24-1b5568eb642mr1126332c88.22.1795128600185;
 Thu, 19 Nov 2026 14:50:00 -0800 (PST)
Date: Thu, 19 Nov 2026 14:49:53 -0800
In-Reply-To: <20261119224954.196990-1-penghuang@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119224954.196990-1-penghuang@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261119224954.196990-3-penghuang@google.com>
Subject: [RFC PATCH 2/3] sched: boost rwsem holders with contended
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

Keep queued fair tasks holding rwsems on rq->held_rwsem_tasks and check
waiter demand across scheduler wakeup, preemption, tick, and idle
load-balance pull paths.

Uncontended lock/unlock paths never touch rq->held_rwsem_tasks; a task
is linked only if preempted, enqueued, or crossing a tick while holding
an rwsem. Thus rq->held_rwsem_tasks stays empty for the vast majority of
ticks and idle pulls, exiting immediately with zero iteration or
max_waiter_prio lookups.

When a fair task holds a contended rwsem (max_waiter_prio < task prio),
temporarily elevate its effective priority and EEVDF weight without
altering user-visible static_prio/nice, and restore it on unlock or
lazily unlink uncontended unlocks on tick.

Signed-off-by: Peng Huang <penghuang@google.com>
---
 kernel/sched/core.c  | 109 ++++++++++++++++++++++++++++++++++++++++++-
 kernel/sched/fair.c  |  51 ++++++++++++++++++++
 kernel/sched/sched.h |  27 +++++++++++
 3 files changed, 185 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5737fe55d52c..2ead771c703a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1561,7 +1561,12 @@ static inline void sched_rwsem_fork_init(struct task_struct *p)
 	INIT_LIST_HEAD(&p->rwsem_rq_node);
 }
 
-static int sched_rwsem_compute_boost_prio(struct task_struct *p)
+static inline void sched_rwsem_rq_init(struct rq *rq)
+{
+	INIT_LIST_HEAD(&rq->held_rwsem_tasks);
+}
+
+int sched_rwsem_compute_boost_prio(struct task_struct *p)
 {
 	int best = MAX_PRIO;
 	int i;
@@ -1613,10 +1618,88 @@ bool sched_rwsem_check_boost(struct task_struct *p, bool update_load)
 	return true;
 }
 
+static inline void sched_rwsem_track_on_rq(struct rq *rq, struct task_struct *p)
+{
+	if (list_empty(&p->rwsem_rq_node))
+		list_add(&p->rwsem_rq_node, &rq->held_rwsem_tasks);
+}
+
+/*
+ * Safe to inspect p->held_rwsems[] here because ttwu() holds p->pi_lock
+ * after smp_cond_load_acquire(&p->on_cpu, !VAL), so @p is off-CPU and
+ * cannot concurrently run up_read()/kfree(sem).
+ */
+static inline void sched_rwsem_wakeup_boost(struct task_struct *p)
+{
+	if (READ_ONCE(p->nr_held_rwsems))
+		sched_rwsem_check_boost(p, false);
+}
+
+static inline void sched_rwsem_enqueue_locked(struct rq *rq,
+					      struct task_struct *p)
+{
+	if (!READ_ONCE(p->nr_held_rwsems) ||
+	    p->sched_class != &fair_sched_class)
+		return;
+
+	sched_rwsem_check_boost(p, false);
+	sched_rwsem_track_on_rq(rq, p);
+}
+
+static inline void sched_rwsem_on_preempt_locked(struct rq *rq,
+						 struct task_struct *prev)
+{
+	if (!READ_ONCE(prev->nr_held_rwsems) || task_rq(prev) != rq ||
+	    !task_on_rq_queued(prev) || prev->se.sched_delayed ||
+	    prev->sched_class != &fair_sched_class)
+		return;
+
+	sched_rwsem_track_on_rq(rq, prev);
+	sched_rwsem_check_boost(prev, true);
+}
+
+static inline void sched_rwsem_tick_locked(struct rq *rq)
+{
+	struct task_struct *curr = rq->curr;
+	struct task_struct *p, *tmp;
+	bool need_resched = false;
+
+	if (READ_ONCE(curr->nr_held_rwsems) &&
+	    curr->sched_class == &fair_sched_class &&
+	    task_rq(curr) == rq && task_on_rq_queued(curr) &&
+	    !curr->se.sched_delayed) {
+		sched_rwsem_track_on_rq(rq, curr);
+		sched_rwsem_check_boost(curr, true);
+	}
+
+	/*
+	 * Lazily unlink tasks whose unlock fastpath skipped rq->lock because
+	 * they were never boosted (!nr_held_rwsems short-circuits sem access),
+	 * or if proxy/delayed-dequeue movement left a stale rq link.
+	 */
+	list_for_each_entry_safe(p, tmp, &rq->held_rwsem_tasks, rwsem_rq_node) {
+		if (!READ_ONCE(p->nr_held_rwsems) ||
+		    task_rq(p) != rq || !task_on_rq_queued(p)) {
+			sched_rwsem_dequeue_locked(p);
+			continue;
+		}
+		if (p == curr || task_on_cpu(rq, p) || p->se.sched_delayed)
+			continue;
+		sched_rwsem_check_boost(p, true);
+		if (p->rwsem_boost_prio < curr->prio)
+			need_resched = true;
+	}
+
+	if (need_resched)
+		resched_curr(rq);
+}
+
 void sched_rwsem_recalc_boost(struct task_struct *p)
 {
 	guard(task_rq_lock)(p);
 
+	if (!READ_ONCE(p->nr_held_rwsems))
+		sched_rwsem_dequeue_locked(p);
 	if (p->sched_class == &fair_sched_class) {
 		update_rq_clock(task_rq(p));
 		sched_rwsem_check_boost(p, !p->se.sched_delayed);
@@ -1629,6 +1712,16 @@ static inline bool sched_rwsem_is_boosted(const struct task_struct *p)
 }
 
 static inline void sched_rwsem_fork_init(struct task_struct *p) { }
+static inline void sched_rwsem_rq_init(struct rq *rq) { }
+static inline void sched_rwsem_wakeup_boost(struct task_struct *p) { }
+
+static inline void sched_rwsem_enqueue_locked(struct rq *rq,
+					      struct task_struct *p) { }
+
+static inline void sched_rwsem_on_preempt_locked(struct rq *rq,
+						 struct task_struct *prev) { }
+
+static inline void sched_rwsem_tick_locked(struct rq *rq) { }
 #endif
 
 void set_load_weight(struct task_struct *p, bool update_load)
@@ -2284,6 +2377,8 @@ void enqueue_task(struct rq *rq, struct task_struct *p, int flags)
 	if (!(flags & ENQUEUE_NOCLOCK))
 		update_rq_clock(rq);
 
+	sched_rwsem_enqueue_locked(rq, p);
+
 	/*
 	 * Can be before ->enqueue_task() because uclamp considers the
 	 * ENQUEUE_DELAYED task before its ->sched_delayed gets cleared
@@ -2323,7 +2418,11 @@ inline bool dequeue_task(struct rq *rq, struct task_struct *p, int flags)
 	 * and mark the task ->sched_delayed.
 	 */
 	uclamp_rq_dec(rq, p);
-	return p->sched_class->dequeue_task(rq, p, flags);
+	if (p->sched_class->dequeue_task(rq, p, flags)) {
+		sched_rwsem_dequeue_locked(p);
+		return true;
+	}
+	return false;
 }
 
 void activate_task(struct rq *rq, struct task_struct *p, int flags)
@@ -4566,6 +4665,8 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 		 */
 		smp_cond_load_acquire(&p->on_cpu, !VAL);
 
+		sched_rwsem_wakeup_boost(p);
+
 		cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
 		if (task_cpu(p) != cpu) {
 			wake_flags |= WF_MIGRATED;
@@ -5957,6 +6058,7 @@ void sched_tick(void)
 		resched_curr(rq);
 
 	donor->sched_class->task_tick(rq, donor, 0);
+	sched_rwsem_tick_locked(rq);
 	if (sched_feat(LATENCY_WARN))
 		resched_latency = cpu_resched_latency(rq);
 	calc_global_load_tick(rq);
@@ -7391,6 +7493,8 @@ static void __sched notrace __schedule(int sched_mode)
 		switch_count = &prev->nvcsw;
 	}
 
+	sched_rwsem_on_preempt_locked(rq, prev);
+
 pick_again:
 	assert_balance_callbacks_empty(rq);
 	next = pick_next_task(rq, &rf);
@@ -9125,6 +9229,7 @@ void __init sched_init(void)
 		rq->max_idle_balance_cost = sysctl_sched_migration_cost;
 
 		INIT_LIST_HEAD(&rq->cfs_tasks);
+		sched_rwsem_rq_init(rq);
 
 		rq_attach_root(rq, &def_root_domain);
 #ifdef CONFIG_NO_HZ_COMMON
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0c8af1cac2d5..59ce6321a265 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11312,6 +11312,53 @@ static struct task_struct *detach_one_task(struct lb_env *env)
 	return NULL;
 }
 
+#ifdef CONFIG_RWSEM_SCHED_BOOST
+/*
+ * On idle pull, prioritize migrating a fair task holding a contended rwsem
+ * so a blocked high-priority waiter is not starved on a busy little core.
+ */
+static int detach_boosted_rwsem_task(struct lb_env *env)
+{
+	struct task_struct *p, *tmp;
+
+	if (env->idle != CPU_IDLE && env->idle != CPU_NEWLY_IDLE)
+		return 0;
+
+	list_for_each_entry_safe(p, tmp, &env->src_rq->held_rwsem_tasks,
+				 rwsem_rq_node) {
+		if (env->src_rq->nr_running <= 1)
+			break;
+		if (task_rq(p) != env->src_rq || !task_on_rq_queued(p)) {
+			sched_rwsem_dequeue_locked(p);
+			continue;
+		}
+		if (task_on_cpu(env->src_rq, p) || p->se.sched_delayed)
+			continue;
+		if (sched_rwsem_compute_boost_prio(p) >= MAX_PRIO)
+			continue;
+		if (!can_migrate_task(p, env))
+			continue;
+
+		/*
+		 * enqueue_task() on dst_rq updates the boosted weight
+		 * via sched_rwsem_enqueue_locked(), avoiding a redundant
+		 * reweight_eevdf() on src_rq before detaching.
+		 */
+		detach_task(p, env);
+		list_add(&p->se.group_node, &env->tasks);
+		env->imbalance = 0;
+		return 1;
+	}
+
+	return 0;
+}
+#else
+static inline int detach_boosted_rwsem_task(struct lb_env *env)
+{
+	return 0;
+}
+#endif
+
 /*
  * detach_tasks() -- tries to detach up to imbalance load/util/tasks from
  * busiest_rq, as part of a balancing operation within domain "sd".
@@ -11339,6 +11386,10 @@ static int detach_tasks(struct lb_env *env)
 	if (env->imbalance <= 0)
 		return 0;
 
+	detached = detach_boosted_rwsem_task(env);
+	if (detached)
+		return detached;
+
 	while (!list_empty(tasks)) {
 		/*
 		 * We don't want to steal all, otherwise we may be treated likewise,
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 98bc9029f9ae..58e53980e71b 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1317,6 +1317,13 @@ struct rq {
 	int			online;
 
 	struct list_head cfs_tasks;
+#ifdef CONFIG_RWSEM_SCHED_BOOST
+	/*
+	 * Queued fair tasks holding an rwsem; protected by rq->lock and
+	 * unlinked on dequeue_task() (incl. migration and TASK_DEAD).
+	 */
+	struct list_head	held_rwsem_tasks;
+#endif
 
 	struct sched_avg	avg_rt;
 	struct sched_avg	avg_dl;
@@ -4368,7 +4375,18 @@ static inline int sched_rwsem_effective_prio(struct task_struct *p)
 	return sched_rwsem_prio(p, p->normal_prio);
 }
 
+int sched_rwsem_compute_boost_prio(struct task_struct *p);
 bool sched_rwsem_check_boost(struct task_struct *p, bool update_load);
+
+/*
+ * Remove @p when it leaves an rq (sleep, migration, class change,
+ * TASK_DEAD via DEQUEUE_SPECIAL, or stale cross-rq cleanup).
+ */
+static inline void sched_rwsem_dequeue_locked(struct task_struct *p)
+{
+	if (!list_empty(&p->rwsem_rq_node))
+		list_del_init(&p->rwsem_rq_node);
+}
 #else
 static inline int sched_rwsem_cfs_prio(const struct task_struct *p)
 {
@@ -4380,11 +4398,20 @@ static inline int sched_rwsem_effective_prio(const struct task_struct *p)
 	return p->normal_prio;
 }
 
+static inline int sched_rwsem_compute_boost_prio(struct task_struct *p)
+{
+	return MAX_PRIO;
+}
+
 static inline bool sched_rwsem_check_boost(struct task_struct *p,
 					   bool update_load)
 {
 	return false;
 }
+
+static inline void sched_rwsem_dequeue_locked(struct task_struct *p)
+{
+}
 #endif
 
 #endif /* _KERNEL_SCHED_SCHED_H */
-- 
2.56.1.750.gf70dc682cf-goog

