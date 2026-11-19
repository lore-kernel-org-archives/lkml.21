Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795128601;
	b=xlqQCfUtCaniejXdtOlEEFTfwTvxs2VbowrnOkhsU1kIx3efY7Wxb6FTVgsPkm8fwaJT
	 ONMJTIWviz49r6VsSX33I7SvMEJPfVgBjkKcymLe6fpcQSIkddCaCbbrkb/BLIsSIp521
	 lyOJmo9Bq4p2rRsXpllWP4f2QqBjf3Lse+Cz3SRrYrEoqN1rFBGU8ndwieZOWW3s72+1D
	 CEOxueI10rvRsLTaXGLr/Zpmk1zd0CnF4G7N3Oc49vxsOkjRhb4BZG2ZOv0Kj0I8PNOSq
	 SjncPdjhOvu8Zkr0wVQXdj31D3PiPrNzLUCc3L3VCcmHcal5ofPq+CTl/mvCOYZpRjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=1c1ZZX7ZlmJK09SZ6Pld1Ak4vFFQjPIKOyIDD1h1pBw=;
	b=hKYLA3/z1dJWzBtqYefSaPFsVhMk5Uty0PHVR/dp434oGO5dmEvue6oe/krlKreZ1Toi
	 tr2O1v9mYj/llBNbFqFd6jahCo9hB0f5W5xXhYOIbfJlAmha48V+t5C0g6Ha5deidaAcx
	 t4rEoBJcSZl+MdBAtOQM//dmfKePrefOnCSdUwTw/NWIMwmGFjVTQ5OKCeigJWRMkbVny
	 wBrMGz/y/55/oya+wZPBkscGHhBxR+Y0QasQDkwTbaO5niejSxA3sl9JbFMIF7VrwKPNP
	 OUr+JQGcMFtY+0lM10qladUh6IhSBeRoJg2olBfZ/9m/DMOvOeuPg6SaxJfd/xdbmVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A5XZgkF9;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C24606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8C24606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A5XZgkF9
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a5005fd0f8so614816c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795128600; x=1795733400; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1c1ZZX7ZlmJK09SZ6Pld1Ak4vFFQjPIKOyIDD1h1pBw=;
        b=A5XZgkF9je1/4oIlgEnwGsB6epsd7h5TuHY8gmZpzcEaInxmsehLwpjt5rROQs+COc
         2hwwS9f8hww8CO9OvRotGTFO4haMs9323i/hYE++qGzlR5OfawU5JEK1HejkNrCF9PzG
         xlLyJwQZex0200sJVLIwp7WMqVAb/RmYUcXThAYkHLTspRY5aYhWW3zW7nPB66bSnTEt
         LiRIGyTDRJ0F77LOtJzJbAdqDbkCCozSTKWzATXkQt6bPtJNiH7tWNIP/cqA2/9IM44H
         FOGHNWUti7X0TH3vpRw6kzakju8sKuzDFIzRo5Q51z34wWs3KcU75l6cbuG1U9+lnkxw
         ZTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795128600; x=1795733400;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1c1ZZX7ZlmJK09SZ6Pld1Ak4vFFQjPIKOyIDD1h1pBw=;
        b=bnHAT/59cO00ekkKgrFfjKNuAbOJzvh0sOk7fq72rSpx3FoSm6MyCcoRV+MECXlHar
         KUpApu/l4s91mWDtbVrQ88J9krdStXVO/VaS8Fyl9EP1uL3eJMrSSBs3pHj/ZMpjtqGH
         7uPKi00OlidO4t3x/Eg4Lf4pBH6hO582+H+stPqmoK1osWv8QQVhKD6lvLO5jtiaU3UW
         4zl1Sthtc6/h7sQo+FTSOoklRe6AebRUOcK4UDgGGceN9MIsefgLG5y5oYqZquPl/nTE
         w45QuSlCa/2surKoA1nxJ0ROFC2U354QgB96NP1D+ongHmuQ7rcpBnH+yfzx0zO+Idho
         afLQ==
X-Forwarded-Encrypted: i=1; AL+hErEzdfUsGdyFv63m5U6M+GNtXD+EpxpTJUcALwGDEuo8JaEpf79G6mEN4Td1bzgIMgol87VvykyrbTPJ/ZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b3t3mTpEfTHpey7DRbswBUHa2HE5EUepzOLFlUjWfsv/5gB+u
	5G1Xt/1JxpI0V40QE3U7Bel89+eIUle0Wa9wDIfjKqsUSVzZntZUeRD9XWyQZrcO5kt2SB04W0/
	Ie18XD1ksrkTn6Hv1tQ==
X-Received: from dybtt7.prod.google.com ([2002:a05:7300:f407:b0:369:f864:c5e])
 (user=penghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:4584:b0:1ac:9da7:e86e with SMTP id a92af1059eb24-1b556908c17mr969201c88.30.1795128599211;
 Thu, 19 Nov 2026 14:49:59 -0800 (PST)
Date: Thu, 19 Nov 2026 14:49:52 -0800
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
Message-ID: <20261119224954.196990-2-penghuang@google.com>
Subject: [RFC PATCH 1/3] locking/rwsem, sched: track held rwsems and waiter priorities
From: Peng Huang <penghuang@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org, Peng Huang <penghuang@google.com>
Content-Type: text/plain; charset="UTF-8"

Track per-task held rw_semaphore pointers in a small fixed-size slot
array (CONFIG_RWSEM_SCHED_BOOST_SLOTS) and track the highest-priority
contending waiter on each rw_semaphore (max_waiter_prio, capped at
MAX_RT_PRIO).

Blocking acquisitions skip irqs/atomic guards to avoid pushf on the
fastpath, while trylock paths keep IRQ/atomic context filtering for
non-owner unlockers such as BPF helpers. Held slots are cleared under
preempt_disable() before releasing sem->count so another CPU cannot
acquire and free the semaphore while a tick/preempt check still sees
it in held_rwsems[].

Also wire up core priority calculation, runtime toggle
(rwsem_sched_boost=), and post-unlock priority restoration.

Signed-off-by: Peng Huang <penghuang@google.com>
---
 .../admin-guide/kernel-parameters.txt         |   5 +
 include/linux/rwsem.h                         |  28 +++
 include/linux/sched.h                         |  16 ++
 init/init_task.c                              |   4 +
 kernel/Kconfig.locks                          |  15 ++
 kernel/locking/rwsem.c                        | 211 ++++++++++++++++--
 kernel/sched/core.c                           | 102 ++++++++-
 kernel/sched/sched.h                          |  43 ++++
 kernel/sched/syscalls.c                       |   2 +-
 9 files changed, 402 insertions(+), 24 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 176648941aec..2c5207dd9c53 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6778,6 +6778,11 @@ Kernel parameters
 
 	rw		[KNL] Mount root device read-write on boot
 
+	rwsem_sched_boost=
+			[KNL] Enable or disable rwsem scheduler priority
+			boosting when CONFIG_RWSEM_SCHED_BOOST=y.
+			Defaults to 1 (enabled). Format: <bool>
+
 	S		[KNL] Run init in single mode
 
 	s390_iommu=	[HW,S390]
diff --git a/include/linux/rwsem.h b/include/linux/rwsem.h
index 6a1a7bae5f81..b9188de31881 100644
--- a/include/linux/rwsem.h
+++ b/include/linux/rwsem.h
@@ -16,6 +16,8 @@
 #include <linux/atomic.h>
 #include <linux/err.h>
 #include <linux/cleanup.h>
+#include <linux/jump_label.h>
+#include <linux/sched/prio.h>
 
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 # define __RWSEM_DEP_MAP_INIT(lockname)			\
@@ -58,6 +60,9 @@ context_lock_struct(rw_semaphore) {
 #endif
 	raw_spinlock_t wait_lock;
 	struct rwsem_waiter *first_waiter __guarded_by(&wait_lock);
+#ifdef CONFIG_RWSEM_SCHED_BOOST
+	atomic_t max_waiter_prio;
+#endif
 #ifdef CONFIG_DEBUG_RWSEMS
 	void *magic;
 #endif
@@ -101,12 +106,19 @@ static inline void rwsem_assert_held_write_nolockdep(const struct rw_semaphore *
 #define __RWSEM_OPT_INIT(lockname)
 #endif
 
+#ifdef CONFIG_RWSEM_SCHED_BOOST
+# define __RWSEM_SCHED_BOOST_INIT .max_waiter_prio = ATOMIC_INIT(MAX_PRIO),
+#else
+# define __RWSEM_SCHED_BOOST_INIT
+#endif
+
 #define __RWSEM_INITIALIZER(name)				\
 	{ __RWSEM_COUNT_INIT(name),				\
 	  .owner = ATOMIC_LONG_INIT(0),				\
 	  __RWSEM_OPT_INIT(name)				\
 	  .wait_lock = __RAW_SPIN_LOCK_UNLOCKED(name.wait_lock),\
 	  .first_waiter = NULL,					\
+	  __RWSEM_SCHED_BOOST_INIT				\
 	  __RWSEM_DEBUG_INIT(name)				\
 	  __RWSEM_DEP_MAP_INIT(name) }
 
@@ -327,8 +339,24 @@ extern void up_read_non_owner(struct rw_semaphore *sem) __releases_shared(sem);
 # define down_write_nest_lock(sem, nest_lock)	down_write(sem)
 # define down_write_nested(sem, subclass)	down_write(sem)
 # define down_write_killable_nested(sem, subclass)	down_write_killable(sem)
+#ifdef CONFIG_RWSEM_SCHED_BOOST
+void down_read_non_owner(struct rw_semaphore *sem) __acquires_shared(sem);
+void up_read_non_owner(struct rw_semaphore *sem) __releases_shared(sem);
+#else
 # define down_read_non_owner(sem)		down_read(sem)
 # define up_read_non_owner(sem)			up_read(sem)
 #endif
+#endif
+
+#ifdef CONFIG_RWSEM_SCHED_BOOST
+extern struct static_key_true rwsem_sched_boost_key;
+static inline void rwsem_sched_boost_set(bool enable)
+{
+	if (enable)
+		static_branch_enable(&rwsem_sched_boost_key);
+	else
+		static_branch_disable(&rwsem_sched_boost_key);
+}
+#endif
 
 #endif /* _LINUX_RWSEM_H */
diff --git a/include/linux/sched.h b/include/linux/sched.h
index e4f6323d7855..9ce2c11aa500 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -78,6 +78,7 @@ struct rcu_node;
 struct reclaim_state;
 struct root_domain;
 struct rq;
+struct rw_semaphore;
 struct sched_attr;
 struct sched_dl_entity;
 struct seq_file;
@@ -1266,6 +1267,13 @@ struct task_struct {
 	struct rt_mutex_waiter		*pi_blocked_on;
 #endif
 
+#ifdef CONFIG_RWSEM_SCHED_BOOST
+	struct rw_semaphore		*held_rwsems[CONFIG_RWSEM_SCHED_BOOST_SLOTS];
+	u8				nr_held_rwsems;
+	int				rwsem_boost_prio;
+	struct list_head		rwsem_rq_node;
+#endif
+
 	struct mutex			*blocked_on;	/* lock we're blocked on */
 	raw_spinlock_t			blocked_lock;
 
@@ -2250,6 +2258,14 @@ static inline void clear_task_blocked_on(struct task_struct *p, struct rt_mutex
 }
 #endif /* !CONFIG_PREEMPT_RT */
 
+#ifdef CONFIG_RWSEM_SCHED_BOOST
+void sched_rwsem_recalc_boost(struct task_struct *p);
+#else
+static inline void sched_rwsem_recalc_boost(struct task_struct *p)
+{
+}
+#endif
+
 static __always_inline bool need_resched(void)
 {
 	return unlikely(tif_need_resched());
diff --git a/init/init_task.c b/init/init_task.c
index ce7c2b07d855..a52a08f11ffd 100644
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -134,6 +134,10 @@ struct task_struct init_task __aligned(L1_CACHE_BYTES) = {
 		.time_slice	= RR_TIMESLICE,
 	},
 	.tasks		= LIST_HEAD_INIT(init_task.tasks),
+#ifdef CONFIG_RWSEM_SCHED_BOOST
+	.rwsem_boost_prio = MAX_PRIO,
+	.rwsem_rq_node	= LIST_HEAD_INIT(init_task.rwsem_rq_node),
+#endif
 #ifdef CONFIG_SMP
 	.pushable_tasks	= PLIST_NODE_INIT(init_task.pushable_tasks, MAX_PRIO),
 #endif
diff --git a/kernel/Kconfig.locks b/kernel/Kconfig.locks
index 1c6423aafcd4..7487cdab4e59 100644
--- a/kernel/Kconfig.locks
+++ b/kernel/Kconfig.locks
@@ -279,3 +279,18 @@ config ARCH_HAS_MMIOWB
 config MMIOWB
 	def_bool y if ARCH_HAS_MMIOWB
 	depends on SMP
+
+config RWSEM_SCHED_BOOST_SLOTS
+	int "Maximum held rw_semaphores tracked per task for priority boost"
+	range 0 16
+	default 4
+	depends on !PREEMPT_RT
+	help
+	  Number of rw_semaphore pointers recorded per task_struct so the
+	  scheduler can detect and boost holders blocking higher-priority
+	  waiters across wakeup, preemption, tick, and idle-balance hooks.
+	  Set to 0 to disable.
+
+config RWSEM_SCHED_BOOST
+	def_bool y
+	depends on RWSEM_SCHED_BOOST_SLOTS > 0
diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
index b9c180ac1eee..5289bb4bf5eb 100644
--- a/kernel/locking/rwsem.c
+++ b/kernel/locking/rwsem.c
@@ -30,6 +30,80 @@
 #include <linux/hung_task.h>
 #include <trace/events/lock.h>
 
+#ifdef CONFIG_RWSEM_SCHED_BOOST
+/*
+ * Record @sem in a free per-task slot for scheduler boost inspection.
+ * Trylock callers can run in IRQ/atomic contexts (e.g. BPF helpers whose
+ * deferred irq_work uses up_read_non_owner() when irqs_disabled() was true),
+ * while process-context non-owner callers use down_read_non_owner(). Guard
+ * trylocks with @check_atomic so skipped contexts never strand @sem in slots.
+ */
+static inline void rwsem_record_hold(struct rw_semaphore *sem,
+				     bool check_atomic)
+{
+	struct task_struct *curr = current;
+	u8 nr;
+	int i;
+
+	if (!static_branch_likely(&rwsem_sched_boost_key))
+		return;
+	if (unlikely(!in_task() ||
+		     (check_atomic && (irqs_disabled() || in_atomic()))))
+		return;
+
+	nr = READ_ONCE(curr->nr_held_rwsems);
+	for (i = 0; i < CONFIG_RWSEM_SCHED_BOOST_SLOTS; i++) {
+		if (!curr->held_rwsems[i]) {
+			WRITE_ONCE(curr->held_rwsems[i], sem);
+			WRITE_ONCE(curr->nr_held_rwsems, nr + 1);
+			return;
+		}
+	}
+}
+
+/*
+ * Clear @sem from held_rwsems[] under preempt_disable() BEFORE
+ * releasing sem->count so another CPU cannot acquire/free @sem after
+ * unlock while scheduler inspection still sees it in held_rwsems[].
+ */
+static inline void rwsem_record_release(struct rw_semaphore *sem)
+{
+	struct task_struct *curr = current;
+	u8 nr = READ_ONCE(curr->nr_held_rwsems);
+	int i;
+
+	if (unlikely(!in_task() || !nr))
+		return;
+
+	for (i = 0; i < CONFIG_RWSEM_SCHED_BOOST_SLOTS; i++) {
+		if (curr->held_rwsems[i] == sem) {
+			WRITE_ONCE(curr->held_rwsems[i], NULL);
+			WRITE_ONCE(curr->nr_held_rwsems, nr - 1);
+			return;
+		}
+	}
+}
+
+static inline void rwsem_sched_unboost_if_needed(void)
+{
+	if (unlikely(in_task() && current->rwsem_boost_prio < MAX_PRIO))
+		sched_rwsem_recalc_boost(current);
+}
+#else
+static inline void rwsem_record_hold(struct rw_semaphore *sem,
+				     bool check_atomic)
+{
+}
+
+static inline void rwsem_record_release(struct rw_semaphore *sem)
+{
+}
+
+static inline void rwsem_sched_unboost_if_needed(void)
+{
+}
+#endif
+
 #ifndef CONFIG_PREEMPT_RT
 #include "lock_events.h"
 
@@ -324,6 +398,9 @@ void __init_rwsem(struct rw_semaphore *sem, const char *name,
 	scoped_guard (raw_spinlock_init, &sem->wait_lock) {
 		sem->first_waiter = NULL;
 	}
+#ifdef CONFIG_RWSEM_SCHED_BOOST
+	atomic_set(&sem->max_waiter_prio, MAX_PRIO);
+#endif
 #ifdef CONFIG_RWSEM_SPIN_ON_OWNER
 	osq_lock_init(&sem->osq);
 #endif
@@ -349,6 +426,50 @@ enum rwsem_wake_type {
 	RWSEM_WAKE_READ_OWNED	/* Waker thread holds the read lock */
 };
 
+#ifdef CONFIG_RWSEM_SCHED_BOOST
+static inline int rwsem_clamp_waiter_prio(struct task_struct *tsk)
+{
+	/* Cap boost at CFS highest priority (nice -20) to protect RT tasks. */
+	return max_t(int, READ_ONCE(tsk->prio), MAX_RT_PRIO);
+}
+
+static inline void rwsem_update_max_waiter_prio(struct rw_semaphore *sem,
+						struct task_struct *waiter_task)
+{
+	int prio = rwsem_clamp_waiter_prio(waiter_task);
+
+	lockdep_assert_held(&sem->wait_lock);
+	if (prio < atomic_read(&sem->max_waiter_prio))
+		atomic_set(&sem->max_waiter_prio, prio);
+}
+
+static void rwsem_recalc_max_waiter_prio(struct rw_semaphore *sem)
+{
+	struct rwsem_waiter *first = sem->first_waiter;
+	struct rwsem_waiter *w;
+	int prio = MAX_PRIO;
+
+	lockdep_assert_held(&sem->wait_lock);
+	if (first) {
+		prio = min(prio, rwsem_clamp_waiter_prio(first->task));
+		list_for_each_entry(w, &first->list, list)
+			prio = min(prio, rwsem_clamp_waiter_prio(w->task));
+	}
+
+	if (atomic_read(&sem->max_waiter_prio) != prio)
+		atomic_set(&sem->max_waiter_prio, prio);
+}
+#else
+static inline void rwsem_update_max_waiter_prio(struct rw_semaphore *sem,
+						struct task_struct *waiter_task)
+{
+}
+
+static inline void rwsem_recalc_max_waiter_prio(struct rw_semaphore *sem)
+{
+}
+#endif
+
 /*
  * The typical HZ value is either 250 or 1000. So set the minimum waiting
  * time to at least 4ms or 1 jiffy (if it is higher than 4ms) in the wait
@@ -394,9 +515,12 @@ static inline bool
 rwsem_del_waiter(struct rw_semaphore *sem, struct rwsem_waiter *waiter)
 {
 	lockdep_assert_held(&sem->wait_lock);
-	if (__rwsem_del_waiter(sem, waiter))
+	if (__rwsem_del_waiter(sem, waiter)) {
+		rwsem_recalc_max_waiter_prio(sem);
 		return true;
+	}
 	atomic_long_andnot(RWSEM_FLAG_HANDOFF | RWSEM_FLAG_WAITERS, &sem->count);
+	rwsem_recalc_max_waiter_prio(sem);
 	return false;
 }
 
@@ -542,6 +666,8 @@ static void rwsem_mark_wake(struct rw_semaphore *sem,
 			break;
 	} while ((waiter = next) != NULL);
 
+	rwsem_recalc_max_waiter_prio(sem);
+
 	adjustment = woken * RWSEM_READER_BIAS - adjustment;
 	lockevent_cond_inc(rwsem_wake_reader, woken);
 
@@ -683,6 +809,7 @@ static inline bool rwsem_try_write_lock(struct rw_semaphore *sem,
 	 * success.
 	 */
 	__rwsem_del_waiter(sem, waiter);
+	rwsem_recalc_max_waiter_prio(sem);
 
 	rwsem_set_owner(sem);
 	return true;
@@ -1081,6 +1208,7 @@ rwsem_down_read_slowpath(struct rw_semaphore *sem, long count, unsigned int stat
 	} else {
 		list_add_tail(&waiter.list, &first->list);
 	}
+	rwsem_update_max_waiter_prio(sem, current);
 
 	/* we're now waiting on the lock, but no longer actively locking */
 	count = atomic_long_add_return(adjustment, &sem->count);
@@ -1177,6 +1305,7 @@ rwsem_down_write_slowpath(struct rw_semaphore *sem, int state)
 		sem->first_waiter = &waiter;
 		atomic_long_or(RWSEM_FLAG_WAITERS, &sem->count);
 	}
+	rwsem_update_max_waiter_prio(sem, current);
 
 	/* wait until we successfully acquire the lock */
 	set_current_state(state);
@@ -1376,7 +1505,7 @@ static inline int __down_write_trylock(struct rw_semaphore *sem)
 /*
  * unlock after reading
  */
-static inline void __up_read(struct rw_semaphore *sem)
+static inline void __up_read_common(struct rw_semaphore *sem, bool track_owner)
 {
 	long tmp;
 
@@ -1384,6 +1513,8 @@ static inline void __up_read(struct rw_semaphore *sem)
 	DEBUG_RWSEMS_WARN_ON(!is_rwsem_reader_owned(sem), sem);
 
 	preempt_disable();
+	if (track_owner)
+		rwsem_record_release(sem);
 	rwsem_clear_reader_owned(sem);
 	tmp = atomic_long_add_return_release(-RWSEM_READER_BIAS, &sem->count);
 	DEBUG_RWSEMS_WARN_ON(tmp < 0, sem);
@@ -1395,6 +1526,20 @@ static inline void __up_read(struct rw_semaphore *sem)
 		rwsem_wake(sem);
 	}
 	preempt_enable();
+
+	/* Drop boost after waking waiters and re-enabling preemption. */
+	if (track_owner)
+		rwsem_sched_unboost_if_needed();
+}
+
+static inline void __up_read(struct rw_semaphore *sem)
+{
+	__up_read_common(sem, true);
+}
+
+static inline void __up_read_non_owner(struct rw_semaphore *sem)
+{
+	__up_read_common(sem, false);
 }
 
 /*
@@ -1413,6 +1558,7 @@ static inline void __up_write(struct rw_semaphore *sem)
 			    !rwsem_test_oflags(sem, RWSEM_NONSPINNABLE), sem);
 
 	preempt_disable();
+	rwsem_record_release(sem);
 	rwsem_clear_owner(sem);
 	tmp = atomic_long_fetch_add_release(-RWSEM_WRITER_LOCKED, &sem->count);
 	if (unlikely(tmp & RWSEM_FLAG_WAITERS)) {
@@ -1420,6 +1566,7 @@ static inline void __up_write(struct rw_semaphore *sem)
 		rwsem_wake(sem);
 	}
 	preempt_enable();
+	rwsem_sched_unboost_if_needed();
 }
 
 /*
@@ -1517,11 +1664,16 @@ static inline int __down_read_trylock(struct rw_semaphore *sem)
 	return rwbase_read_trylock(&sem->rwbase);
 }
 
-static inline void __up_read(struct rw_semaphore *sem)
+static inline void __up_read_non_owner(struct rw_semaphore *sem)
 {
 	rwbase_read_unlock(&sem->rwbase, TASK_NORMAL);
 }
 
+static inline void __up_read(struct rw_semaphore *sem)
+{
+	__up_read_non_owner(sem);
+}
+
 static inline void __sched __down_write(struct rw_semaphore *sem)
 {
 	rwbase_write_lock(&sem->rwbase, TASK_UNINTERRUPTIBLE);
@@ -1574,6 +1726,7 @@ void __sched down_read(struct rw_semaphore *sem)
 	rwsem_acquire_read(&sem->dep_map, 0, 0, _RET_IP_);
 
 	LOCK_CONTENDED(sem, __down_read_trylock, __down_read);
+	rwsem_record_hold(sem, false);
 }
 EXPORT_SYMBOL(down_read);
 
@@ -1588,6 +1741,7 @@ int __sched down_read_interruptible(struct rw_semaphore *sem)
 		return -EINTR;
 	}
 
+	rwsem_record_hold(sem, false);
 	return 0;
 }
 EXPORT_SYMBOL(down_read_interruptible);
@@ -1603,6 +1757,7 @@ int __sched down_read_killable(struct rw_semaphore *sem)
 		return -EINTR;
 	}
 
+	rwsem_record_hold(sem, false);
 	return 0;
 }
 EXPORT_SYMBOL(down_read_killable);
@@ -1615,8 +1770,10 @@ int down_read_trylock(struct rw_semaphore *sem)
 {
 	int ret = __down_read_trylock(sem);
 
-	if (ret == 1)
+	if (ret == 1) {
 		rwsem_acquire_read(&sem->dep_map, 0, 1, _RET_IP_);
+		rwsem_record_hold(sem, true);
+	}
 	return ret;
 }
 EXPORT_SYMBOL(down_read_trylock);
@@ -1630,6 +1787,7 @@ void __sched down_write(struct rw_semaphore *sem)
 	might_sleep();
 	rwsem_acquire(&sem->dep_map, 0, 0, _RET_IP_);
 	LOCK_CONTENDED(sem, __down_write_trylock, __down_write);
+	rwsem_record_hold(sem, false);
 }
 EXPORT_SYMBOL(down_write);
 
@@ -1648,6 +1806,7 @@ int __sched down_write_killable(struct rw_semaphore *sem)
 		return -EINTR;
 	}
 
+	rwsem_record_hold(sem, false);
 	return 0;
 }
 EXPORT_SYMBOL(down_write_killable);
@@ -1660,8 +1819,10 @@ int down_write_trylock(struct rw_semaphore *sem)
 {
 	int ret = __down_write_trylock(sem);
 
-	if (ret == 1)
+	if (ret == 1) {
 		rwsem_acquire(&sem->dep_map, 0, 1, _RET_IP_);
+		rwsem_record_hold(sem, true);
+	}
 
 	return ret;
 }
@@ -1708,6 +1869,7 @@ void down_read_nested(struct rw_semaphore *sem, int subclass)
 	might_sleep();
 	rwsem_acquire_read(&sem->dep_map, subclass, 0, _RET_IP_);
 	LOCK_CONTENDED(sem, __down_read_trylock, __down_read);
+	rwsem_record_hold(sem, false);
 }
 EXPORT_SYMBOL(down_read_nested);
 
@@ -1722,6 +1884,7 @@ int down_read_killable_nested(struct rw_semaphore *sem, int subclass)
 		return -EINTR;
 	}
 
+	rwsem_record_hold(sem, false);
 	return 0;
 }
 EXPORT_SYMBOL(down_read_killable_nested);
@@ -1732,30 +1895,17 @@ void _down_write_nest_lock(struct rw_semaphore *sem, struct lockdep_map *nest)
 	might_sleep();
 	rwsem_acquire_nest(&sem->dep_map, 0, 0, nest, _RET_IP_);
 	LOCK_CONTENDED(sem, __down_write_trylock, __down_write);
+	rwsem_record_hold(sem, false);
 }
 EXPORT_SYMBOL(_down_write_nest_lock);
 
-void down_read_non_owner(struct rw_semaphore *sem)
-	__no_context_analysis
-{
-	might_sleep();
-	__down_read(sem);
-	/*
-	 * The owner value for a reader-owned lock is mostly for debugging
-	 * purpose only and is not critical to the correct functioning of
-	 * rwsem. So it is perfectly fine to set it in a preempt-enabled
-	 * context here.
-	 */
-	__rwsem_set_reader_owned(sem, NULL);
-}
-EXPORT_SYMBOL(down_read_non_owner);
-
 void down_write_nested(struct rw_semaphore *sem, int subclass)
 	__no_context_analysis
 {
 	might_sleep();
 	rwsem_acquire(&sem->dep_map, subclass, 0, _RET_IP_);
 	LOCK_CONTENDED(sem, __down_write_trylock, __down_write);
+	rwsem_record_hold(sem, false);
 }
 EXPORT_SYMBOL(down_write_nested);
 
@@ -1771,15 +1921,34 @@ int __sched down_write_killable_nested(struct rw_semaphore *sem, int subclass)
 		return -EINTR;
 	}
 
+	rwsem_record_hold(sem, false);
 	return 0;
 }
 EXPORT_SYMBOL(down_write_killable_nested);
 
+#endif
+
+#if defined(CONFIG_DEBUG_LOCK_ALLOC) || defined(CONFIG_RWSEM_SCHED_BOOST)
+void down_read_non_owner(struct rw_semaphore *sem)
+	__no_context_analysis
+{
+	might_sleep();
+	__down_read(sem);
+	/*
+	 * The owner value for a reader-owned lock is mostly for debugging
+	 * purpose only and is not critical to the correct functioning of
+	 * rwsem. So it is perfectly fine to set it in a preempt-enabled
+	 * context here.
+	 */
+	__rwsem_set_reader_owned(sem, NULL);
+}
+EXPORT_SYMBOL(down_read_non_owner);
+
 void up_read_non_owner(struct rw_semaphore *sem)
 	__no_context_analysis
 {
 	DEBUG_RWSEMS_WARN_ON(!is_rwsem_reader_owned(sem), sem);
-	__up_read(sem);
+	__up_read_non_owner(sem);
 }
 EXPORT_SYMBOL(up_read_non_owner);
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5ed660f099a5..5737fe55d52c 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -39,6 +39,7 @@
 #include <linux/sched/nohz.h>
 #include <linux/sched/rseq_api.h>
 #include <linux/sched/rt.h>
+#include <linux/rwsem.h>
 
 #include <linux/context_tracking.h>
 #include <linux/cpuset.h>
@@ -1534,12 +1535,108 @@ int tg_nop(struct task_group *tg, void *data)
 }
 #endif
 
+#ifdef CONFIG_RWSEM_SCHED_BOOST
+DEFINE_STATIC_KEY_TRUE(rwsem_sched_boost_key);
+
+static int __init rwsem_sched_boost_cmdline(char *str)
+{
+	bool val;
+
+	if (str && !kstrtobool(str, &val) && !val)
+		static_branch_disable(&rwsem_sched_boost_key);
+	return 1;
+}
+__setup("rwsem_sched_boost=", rwsem_sched_boost_cmdline);
+
+static inline bool sched_rwsem_is_boosted(const struct task_struct *p)
+{
+	return p->rwsem_boost_prio < MAX_PRIO;
+}
+
+static inline void sched_rwsem_fork_init(struct task_struct *p)
+{
+	memset(p->held_rwsems, 0, sizeof(p->held_rwsems));
+	p->nr_held_rwsems = 0;
+	p->rwsem_boost_prio = MAX_PRIO;
+	INIT_LIST_HEAD(&p->rwsem_rq_node);
+}
+
+static int sched_rwsem_compute_boost_prio(struct task_struct *p)
+{
+	int best = MAX_PRIO;
+	int i;
+
+	if (!READ_ONCE(p->nr_held_rwsems))
+		return MAX_PRIO;
+
+	for (i = 0; i < CONFIG_RWSEM_SCHED_BOOST_SLOTS; i++) {
+		struct rw_semaphore *sem = READ_ONCE(p->held_rwsems[i]);
+		int wprio;
+
+		if (!sem)
+			continue;
+		wprio = atomic_read(&sem->max_waiter_prio);
+		if (wprio < best)
+			best = wprio;
+	}
+
+	if (best >= MAX_PRIO)
+		return MAX_PRIO;
+	if (best < MAX_RT_PRIO)
+		best = MAX_RT_PRIO;
+	if (best >= p->static_prio && !task_has_idle_policy(p))
+		return MAX_PRIO;
+
+	return best;
+}
+
+/*
+ * Recompute @p's effective priority and EEVDF weight from its held rwsems.
+ * Callers must hold @p's rq->lock (or pi_lock while @p is WAKING) and ensure
+ * @p cannot concurrently execute up_read() + kfree(sem) on another CPU.
+ */
+bool sched_rwsem_check_boost(struct task_struct *p, bool update_load)
+{
+	int new_boost;
+
+	if (p->sched_class != &fair_sched_class)
+		return false;
+
+	new_boost = sched_rwsem_compute_boost_prio(p);
+	if (new_boost == p->rwsem_boost_prio)
+		return false;
+
+	p->rwsem_boost_prio = new_boost;
+	if (!rt_or_dl_prio(p->prio))
+		p->prio = sched_rwsem_effective_prio(p);
+	set_load_weight(p, update_load);
+	return true;
+}
+
+void sched_rwsem_recalc_boost(struct task_struct *p)
+{
+	guard(task_rq_lock)(p);
+
+	if (p->sched_class == &fair_sched_class) {
+		update_rq_clock(task_rq(p));
+		sched_rwsem_check_boost(p, !p->se.sched_delayed);
+	}
+}
+#else
+static inline bool sched_rwsem_is_boosted(const struct task_struct *p)
+{
+	return false;
+}
+
+static inline void sched_rwsem_fork_init(struct task_struct *p) { }
+#endif
+
 void set_load_weight(struct task_struct *p, bool update_load)
 {
-	int prio = p->static_prio - MAX_RT_PRIO;
+	int prio = sched_rwsem_cfs_prio(p) - MAX_RT_PRIO;
 	struct load_weight lw;
 
-	if (task_has_idle_policy(p)) {
+	if (task_has_idle_policy(p) && !sched_rwsem_is_boosted(p)) {
 		lw.weight = scale_load(WEIGHT_IDLEPRIO);
 		lw.inv_weight = WMULT_IDLEPRIO;
 	} else {
@@ -4888,6 +4985,7 @@ int sched_fork(u64 clone_flags, struct task_struct *p)
 	 * Make sure we do not leak PI boosting priority to the child.
 	 */
 	p->prio = current->normal_prio;
+	sched_rwsem_fork_init(p);
 
 	uclamp_fork(p);
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 220927453a88..98bc9029f9ae 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -4344,4 +4344,47 @@ void sched_push_current_non_preferred_cpu(struct rq *rq);
 static inline void sched_push_current_non_preferred_cpu(struct rq *rq) { }
 #endif
 
+#ifdef CONFIG_RWSEM_SCHED_BOOST
+static inline int sched_rwsem_prio(struct task_struct *p, int base_prio)
+{
+	/*
+	 * SCHED_IDLE tasks carry static_prio == NICE_TO_PRIO(0) despite
+	 * WEIGHT_IDLEPRIO; use rwsem_boost_prio directly so low-priority
+	 * waiters do not boost a SCHED_IDLE holder up to nice 0.
+	 */
+	if (task_has_idle_policy(p))
+		return p->rwsem_boost_prio < MAX_PRIO ? p->rwsem_boost_prio
+						      : base_prio;
+	return min(base_prio, p->rwsem_boost_prio);
+}
+
+static inline int sched_rwsem_cfs_prio(struct task_struct *p)
+{
+	return sched_rwsem_prio(p, p->static_prio);
+}
+
+static inline int sched_rwsem_effective_prio(struct task_struct *p)
+{
+	return sched_rwsem_prio(p, p->normal_prio);
+}
+
+bool sched_rwsem_check_boost(struct task_struct *p, bool update_load);
+#else
+static inline int sched_rwsem_cfs_prio(const struct task_struct *p)
+{
+	return p->static_prio;
+}
+
+static inline int sched_rwsem_effective_prio(const struct task_struct *p)
+{
+	return p->normal_prio;
+}
+
+static inline bool sched_rwsem_check_boost(struct task_struct *p,
+					   bool update_load)
+{
+	return false;
+}
+#endif
+
 #endif /* _KERNEL_SCHED_SCHED_H */
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 0ec401af80d1..d9e3c61fcfba 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -58,7 +58,7 @@ static int effective_prio(struct task_struct *p)
 	 * to the normal priority:
 	 */
 	if (!rt_or_dl_prio(p->prio))
-		return p->normal_prio;
+		return sched_rwsem_effective_prio(p);
 	return p->prio;
 }
 
-- 
2.56.1.750.gf70dc682cf-goog

