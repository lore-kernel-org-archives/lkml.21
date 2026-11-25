Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620865;
	b=oqGpmXoDaOOkdxqi0KejEDXZ3se9dvEcxVJMQodcfrEYB2ib1dsmWqGJnUTNLsR3RgYr
	 SGGzC5BktRDkACZg1sV1nPhpghcvarLX9hn7qN1iuCngmCPKyqMAUZiWYH4G87zqHnlJg
	 e0PkWBlGxfNSpK2vpIQsLu2NOxpQmrgQ7Wqk5BLSdjf+1GSiZRC4vog2rgM+IKcHLO/Yg
	 4YknBaX5hzWCbVSRCSaK8AuqPiXKJSyUeEZ5MLXLpN712smoX6STdAJiu42W31/jV05la
	 5VQddhSHgAlJizrnllkJOXmP5Lm4LF/vPP9Xpl9LWxQqvy/7EFvLmIXeaugETO6cGEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=KinJlHopK6bybWfdH+Z3VhGjbEHAS/fH8cSNDqvPnfA=;
	b=ycfTO2mcSmzhjwAcTrXiYQVKBmfRl4T546Rl8+IozSt7vLkOlHhnuLBFf+3w5U5aX+DU
	 Uz2wGFjW6oI997FN3rBrdjEGcHTZBatVxSCakjOkF/KIeU0ynomfRmm0DRFUnOlt0bgYU
	 /Zfg0u3mmlM307L2hG9lVXNzOsxx/Ap50HTsRFzxfOQFgkDOxGsfZp9l8XOKFGJp1rP3z
	 pJu8zuw2FdhdTAnzsbqaAUq5Md5UNgK+rvJTapTYIKhSSxSBeI5SJ6oPXhlv+8k7h96VS
	 TVtaaQT40lEXpoDzqaFQCmTYxxRbRZRFjsayRQGmZ7Gne7CiEQjBCSOsMoYA4MC5K0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="oJd/J5cf";
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3632606A332
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3632606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oJd/J5cf
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so37067055e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795620863; x=1796225663; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KinJlHopK6bybWfdH+Z3VhGjbEHAS/fH8cSNDqvPnfA=;
        b=oJd/J5cfmVPJ2asXmIruPG2AwXA5Hk5wsJMh90HaKHXUYtqDQnN8nSOz1uAxow7U0p
         qA+zc8WTRsGxmvcAo1QeIFmBisWHp22W4nzzjQhNgxwtNgf7ZYht0K498BUuDlksz/N4
         UMoJ5OH8kP85Lmv6cnpUFGhEJTAnTw2+YwwTedhOq4tod6UDd5u/J6QqJmMdqHoSo9k9
         +PbH4auT+mtbyWON7CDUM1IiPdNWV1+FhKm0qg6nSFekw0enHb4QOGZRCX4A5dVkd7FP
         t3T+YhuNsca6likK7q+KUIthJkDzurlkPNhPTidxV9S2n733Oatfni4cAOJJfAemN3Jc
         ZayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620863; x=1796225663;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KinJlHopK6bybWfdH+Z3VhGjbEHAS/fH8cSNDqvPnfA=;
        b=qRBfb8WYvVP42a9Ey0yRw1OG+TKWqevwlQOdwuqXVRf9UU6r5VfKqMakJlLUEsPRDf
         +C2c9r5ofncQ+W5n9kYuUe/kXsTMXcfxlXUUBOYK41+PGUPb4KMlZP8gwzGO5YjewcfT
         Pymm+OQGgLBC1JFPp8qwFJNkesV80pkrkwbHkcIQDUjV6Gns6ZgaEZTA0mYRzign1oDM
         BbMrxqDVceb+yIsOCbIz54xiOSEIs+C0Tw1D+8l1cLJ0VzN0rZuevosf4IHC81Hs7Skk
         V0FSU/SXboi7RHHdkZYbkrjGLczGWKHmGHCMpl+Rt2juEDUEEPiFk1hcMmt2ku/yPSMH
         zrgg==
X-Forwarded-Encrypted: i=1; AL+hErFN0RX4M2Xg4le4gQtE/HFhaQGXb/jELjBucRLnfSShYkPmwbVsaDd7iB6Q9sf3YxlZ6C0+bukok+6JYqI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/C7L0VTgWKBNiEuOSrNwWc/7i5K76za2O7LFZvcBUNZH+20Ox2
	DQbExR6okX3bTAvWH0HHq5aOFtGk6CaxUpJ4YraFWLjpA+FmsBIBmprmMPJcmS3Z7ZOafWfhcl+
	flC/d/ca7J0Vx1A==
X-Received: from wmfq8.prod.google.com ([2002:a05:600c:2e48:b0:4bb:5bb3:d156])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a087:b0:4bb:5c92:ce22 with SMTP id 5b1f17b1804b1-4bb887fe887mr367808505e9.8.1795620863173;
 Wed, 25 Nov 2026 07:34:23 -0800 (PST)
Date: Wed, 25 Nov 2026 15:34:20 +0000
In-Reply-To: <20261125153353.1364467-1-jpiecuch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125153353.1364467-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125153353.1364467-2-jpiecuch@google.com>
Subject: [RFC PATCH 1/2] sched_ext: sub: Defer ops.sub_caps_updated() out of
 SCX op contexts
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

scx_bpf_sub_grant() and scx_bpf_sub_revoke() are in scx_kfunc_ids_any and
deliver ops.sub_caps_updated() synchronously with a NULL locked_rq.
__SCX_CALL_OP() leaves scx_locked_rq_state untouched when locked_rq is
NULL, so ops.sub_caps_updated() inherits whatever context its parent
called grant or revoke from:

- From ops.sub_attach() or a BPF timer, scx_locked_rq() is NULL. From an
  rq-locked op (such as ops.enqueue(), or scx_qmap repartitioning a
  grandchild from ops.sub_ecaps_updated()), scx_locked_rq() points at the
  parent's rq. Unlike other callbacks, the child cannot safely tell which
  state it is in: scx_bpf_locked_rq() aborts the child when unlocked,
  scx_bpf_cidperf_set() aborts it with "Invalid target CPU" on any cid
  outside the parent's rq, and SCX_DSQ_LOCAL in scx_bpf_dsq_reenq() and
  scx_bpf_dsq_nr_queued() resolves to scx_locked_rq() ?: this_rq().

- Because ops.sub_caps_updated() may propagate grant/revoke to its own
  children, synchronous delivery can fan out across a subtree of
  descendant callbacks while holding the parent's rq lock, p->pi_lock
  (from ops.select_cpu()) or scx_dump_lock (from ops.dump*()), extending
  lock hold time.

- From ops.dump*(), scx_dump_data.cpu remains set, so a child calling
  scx_bpf_dump() writes into the parent's dump instead of failing.

Give ops.sub_caps_updated() a consistent unlocked context by deferring
delivery when grant or revoke runs in an SCX op context (an rq lock held,
kf_tasks[] set, ops.select_cpu() or ops.dump*()). Queue the deliveries on
a global list and kick a per-cpu hard irq_work, or an online cpu's when
this cpu is going down. Suppress the kick while PM is in progress, where
irq_work_queue() can malfunction in the syscore phase, and kick any queued
deliveries from scx_sub_pm_end(). Queued nodes stay in flight so later
updates keep coalescing into them. Before freeing a scheduler's pshards,
scx_free_pshards() drops its queued entries and flushes every cpu's
irq_work.

Fixes: 5f2a9a4c2e6c ("sched_ext: Add coalescing sub_caps_updated() notifier for sub-schedulers")
Cc: stable@vger.kernel.org # v7.3+
Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 kernel/sched/ext/ext.c      |   6 ++
 kernel/sched/ext/internal.h |   8 +++
 kernel/sched/ext/sub.c      | 129 ++++++++++++++++++++++++++++++++++--
 3 files changed, 139 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index efa1d01d03af..570d6c923904 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -7964,6 +7964,12 @@ static void ops_dump_exit(void)
 	scx_dump_data.cpu = -1;
 }
 
+/* whether this cpu is in scx_dump_state(), where scx_bpf_dump() is allowed */
+bool scx_in_dump(void)
+{
+	return READ_ONCE(scx_dump_data.cpu) == raw_smp_processor_id();
+}
+
 static void scx_dump_task(struct scx_sched *sch, struct seq_buf *s, struct scx_dump_ctx *dctx,
 			  struct rq *rq, struct task_struct *p, char marker)
 {
diff --git a/kernel/sched/ext/internal.h b/kernel/sched/ext/internal.h
index 58652370da5a..69846ac85a44 100644
--- a/kernel/sched/ext/internal.h
+++ b/kernel/sched/ext/internal.h
@@ -909,6 +909,8 @@ struct sched_ext_ops {
 	 * cpu, once it is in effect.
 	 *
 	 * May call scx_bpf_sub_grant() / scx_bpf_sub_revoke() on children.
+	 * Even if the parent called grant / revoke under an rq lock or from
+	 * ops.select_cpu() or ops.dump*(), this callback runs unlocked.
 	 */
 	void (*sub_caps_updated)(const struct scx_cmask *cmask, u64 caps);
 
@@ -1666,6 +1668,11 @@ enum scx_cap_flags {
  *
  * (3) leads to deferred delivery. Events accumulate during grant/revoke and are
  * delivered after the shard lock is released.
+ *
+ * When grant or revoke runs in an SCX op context (an rq lock held,
+ * ops.select_cpu() or ops.dump*()), caps_updated_deliver_or_defer() defers the
+ * delivery to an irq_work so that ops.sub_caps_updated() always runs unlocked
+ * instead of inheriting the caller's context.
  */
 struct scx_caps_updated {
 	raw_spinlock_t		lock;
@@ -2314,6 +2321,7 @@ bool scx_consume_dispatch_q(struct scx_sched *sch, struct rq *rq,
 			    struct scx_dispatch_q *dsq, u64 enq_flags);
 bool scx_consume_global_dsq(struct scx_sched *sch, struct rq *rq);
 bool scx_rq_online(struct rq *rq);
+bool scx_in_dump(void);
 void scx_flush_dispatch_buf(struct scx_sched *sch, struct rq *rq);
 s32 scx_init_dsq(struct scx_dispatch_q *dsq, u64 dsq_id, struct scx_sched *sch);
 __printf(2, 3) void scx_dump_line(struct seq_buf *s, const char *fmt, ...);
diff --git a/kernel/sched/ext/sub.c b/kernel/sched/ext/sub.c
index 7c069a289766..d535b9258b10 100644
--- a/kernel/sched/ext/sub.c
+++ b/kernel/sched/ext/sub.c
@@ -66,7 +66,10 @@ static DECLARE_WAIT_QUEUE_HEAD(ecaps_offline_waitq);
 static struct cpumask scx_frozen_cpus;
 static DECLARE_WAIT_QUEUE_HEAD(scx_frozen_cpus_waitq);
 
-/* between the PREPARE and POST notifications of a PM cycle */
+/*
+ * True between the PREPARE and POST notifications of a PM cycle. Updated under
+ * caps_updated_deferred_lock.
+ */
 static bool scx_pm_in_progress;
 
 /**
@@ -307,6 +310,47 @@ void set_cgroup_sched(struct cgroup *cgrp, struct scx_sched *sch)
 		rcu_assign_pointer(pos->scx_sched, sch);
 }
 
+/*
+ * Queue of ops.sub_caps_updated() deliveries deferred out of SCX op contexts.
+ * Queued entries stay linked on scx_caps_updated->node_in_flight so that
+ * caps_updated_record() keeps coalescing into them.
+ *
+ * Each cpu has its own hard irq_work:
+ * - A single irq_work queued on multiple cpus can run irq_work_single()
+ *   concurrently and clear IRQ_WORK_BUSY early, breaking irq_work_sync().
+ * - A dying cpu still runs SCX ops after hotplug parks its irq_work thread,
+ *   which would strand a regular irq_work on PREEMPT_RT.
+ */
+static void caps_updated_deferred_workfn(struct irq_work *irq_work);
+static LIST_HEAD(caps_updated_deferred);
+static DEFINE_RAW_SPINLOCK(caps_updated_deferred_lock);
+static DEFINE_PER_CPU(struct irq_work, caps_updated_deferred_irq_work) =
+	IRQ_WORK_INIT_HARD(caps_updated_deferred_workfn);
+
+/*
+ * Drop @sch's deferred caps_updated deliveries before freeing its pshards.
+ * scx_sched_free_rcu_work() calls this after two RCU grace periods post
+ * unlink, so scx_bpf_sub_grant/revoke() cannot queue new entries for @sch.
+ */
+static void caps_updated_cancel_deferred(struct scx_sched *sch)
+{
+	struct scx_caps_updated *cu, *tmp;
+	s32 cpu;
+
+	scoped_guard (raw_spinlock_irqsave, &caps_updated_deferred_lock) {
+		list_for_each_entry_safe(cu, tmp, &caps_updated_deferred, node_in_flight) {
+			if (container_of(cu, struct scx_pshard, caps_updated)->sch != sch)
+				continue;
+			guard(raw_spinlock)(&cu->lock);
+			list_del_init(&cu->node_in_flight);
+		}
+	}
+
+	/* wait for any workfn that already spliced @sch's entries */
+	for_each_possible_cpu(cpu)
+		irq_work_sync(per_cpu_ptr(&caps_updated_deferred_irq_work, cpu));
+}
+
 static void free_pshard(struct scx_pshard *pshard)
 {
 	struct scx_caps_updated *cu;
@@ -327,6 +371,7 @@ void scx_free_pshards(struct scx_sched *sch)
 
 	if (!sch->pshard)
 		return;
+	caps_updated_cancel_deferred(sch);
 	for (si = 0; si < sch->nr_pshards; si++)
 		free_pshard(sch->pshard[si]);
 	kfree(sch->pshard);
@@ -1034,6 +1079,77 @@ static void caps_updated_deliver(struct list_head *to_deliver)
 	}
 }
 
+static void caps_updated_deferred_workfn(struct irq_work *irq_work)
+{
+	LIST_HEAD(to_deliver);
+
+	/* hard irq_work, same irq-disabled context as a synchronous delivery */
+	lockdep_assert_irqs_disabled();
+
+	scoped_guard (raw_spinlock, &caps_updated_deferred_lock)
+		list_splice_init(&caps_updated_deferred, &to_deliver);
+
+	caps_updated_deliver(&to_deliver);
+}
+
+static void caps_updated_kick_deferred(void)
+{
+	s32 cpu = smp_processor_id();
+
+	lockdep_assert_held(&caps_updated_deferred_lock);
+	lockdep_assert_irqs_disabled();
+
+	/*
+	 * During the PM syscore phase, irq_work_queue() can malfunction.
+	 * scx_sub_pm_end() kicks the queue when the PM cycle finishes.
+	 */
+	if (unlikely(scx_pm_in_progress))
+		return;
+
+	if (likely(cpu_online(cpu))) {
+		irq_work_queue(this_cpu_ptr(&caps_updated_deferred_irq_work));
+		return;
+	}
+
+	/*
+	 * When hotplug parks a dying cpu's migration thread, ops.update_idle()
+	 * runs after smpcfd_dying_cpu() already drained local irq_work. Route
+	 * to an online cpu; cpus_write_lock() keeps cpu_online_mask stable.
+	 */
+	cpu = cpumask_first(cpu_online_mask);
+	if (likely(cpu < nr_cpu_ids))
+		irq_work_queue_on(per_cpu_ptr(&caps_updated_deferred_irq_work, cpu),
+				  cpu);
+}
+
+/*
+ * If the caller runs in an SCX op context (an rq lock held, ops.select_cpu()
+ * or ops.dump*()), defer @to_deliver to an irq_work. Otherwise deliver it now.
+ *
+ * ops.sub_caps_updated() is called with a NULL locked_rq, which leaves
+ * scx_locked_rq() untouched. Delivering synchronously here would inherit the
+ * parent's scx_locked_rq() or dump state and hold the parent's rq lock, pi_lock
+ * or scx_dump_lock across any cascading grant/revoke down the subtree.
+ */
+static void caps_updated_deliver_or_defer(struct list_head *to_deliver)
+{
+	lockdep_assert_irqs_disabled();
+
+	if (likely(!scx_locked_rq() && !current->scx.kf_tasks[0] &&
+		   !this_rq()->scx.in_select_cpu && !scx_in_dump())) {
+		caps_updated_deliver(to_deliver);
+		return;
+	}
+
+	if (list_empty(to_deliver))
+		return;
+
+	scoped_guard (raw_spinlock, &caps_updated_deferred_lock) {
+		list_splice_tail_init(to_deliver, &caps_updated_deferred);
+		caps_updated_kick_deferred();
+	}
+}
+
 /*
  * Deliver caps owed to @sch that couldn't be delivered earlier (e.g. a grant
  * taken during its sub_attach(), before has_op was set). Called once has_op is
@@ -1325,6 +1441,7 @@ void __scx_process_sync_ecaps(struct rq *rq, struct task_struct *prev)
 
 void scx_sub_pm_begin(void)
 {
+	guard(raw_spinlock_irqsave)(&caps_updated_deferred_lock);
 	WRITE_ONCE(scx_pm_in_progress, true);
 }
 
@@ -1376,7 +1493,11 @@ void scx_sub_pm_end(void)
 				   cpumask_weight(&scx_frozen_cpus));
 	}
 
-	WRITE_ONCE(scx_pm_in_progress, false);
+	scoped_guard (raw_spinlock_irqsave, &caps_updated_deferred_lock) {
+		WRITE_ONCE(scx_pm_in_progress, false);
+		if (!list_empty(&caps_updated_deferred))
+			caps_updated_kick_deferred();
+	}
 	cpumask_clear(&scx_frozen_cpus);
 	wake_up_all(&scx_frozen_cpus_waitq);
 }
@@ -2981,7 +3102,7 @@ __bpf_kfunc s32 scx_bpf_sub_grant(u64 cgroup_id, u64 caps,
 
 	ret = any_denied ? -EPERM : 0;
 out:
-	caps_updated_deliver(&to_deliver);
+	caps_updated_deliver_or_defer(&to_deliver);
 	return ret;
 }
 
@@ -3073,7 +3194,7 @@ __bpf_kfunc void scx_bpf_sub_revoke(u64 cgroup_id, u64 caps,
 		}
 	}
 
-	caps_updated_deliver(&to_deliver);
+	caps_updated_deliver_or_defer(&to_deliver);
 }
 
 /**
-- 
2.56.1.839.g22a8290db9-goog

