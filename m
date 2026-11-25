Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607458;
	b=elpwFZpWIbusdUIq7khfD7vMv+hwJmRM33OwxMhlMwqWioaJofIflHQZSEDiKhZXqT/U
	 Kh1+vzdAcT7rD3G3hLps6Ebs5tsrVq0y02SvKoSY0cY/HctenneNa85rsN7N7jfuoAjmS
	 XHwGoUSIs6Zq+0RfmecL/mTAe3ruCQo8Yc3QFEr820VW7gA9/+fQtiMPdXHm1KakWxi/q
	 Wb0jt6B2m9kCcI9FPQCJMdANHZWEga4XYkvSlCvpaCWcmXAlOBZs6VJ4X3uxcQrZgjJOE
	 TBuAfLaBxTTP99HHw0g4kkM8YGrXrbV27ygBbq+Y7bIYmX3oGExnZCe8t5Zi2IT3VeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=XxpHxjNY3UsTDcTzG60Yu5gGt0anPZ0u89T3qoWHlA4=;
	b=ivak9Lk0FRrInQn8RParfrgK6ldH36bBzUWw80ntOCi7b+N377B/fRR7K5a0NkzrHhIr
	 re11QzGQmn8Zjzv+p2vRyMJRjtoAml3LxVWqx6ZK572UZhfUXzhtUt5zi7fkQ93zwCZWP
	 s9tEuhxLzBgv2zkaY2mxBWQ/f2Sz4oPXdqyf7Jtd5D22A1OVB9fULgldWknhTeV9Yktnf
	 XDvPnCa+DZ6LrBd3hJ2N5D5jAi68ufhp7GUEpbmA7PbSPxCoSoabYe0betLioKUdr9r73
	 JF/gqiHkXMY3dZZQwfcte8F7tDtBTk9W8tbCVzCHFl6pyENbMpbDgmHYkQ5eZwXZV4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TS2CKJVy;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41D6606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D41D6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TS2CKJVy
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4ba078abd78so37187025e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795607456; x=1796212256; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxpHxjNY3UsTDcTzG60Yu5gGt0anPZ0u89T3qoWHlA4=;
        b=TS2CKJVyHZjN3a2LLkbriXllBbUn/IhFtK5At+wHf8/a4TNmUMbn1RE+kcn9xpSnge
         4hJW+z0Nvf7iTd4yHSGAx1JhzN7QBbTYBRJWRq7E2dOviUmud5uQNubZzTlivRBiGOcA
         78GztIyedsgLKM8HwOItfpa3fdKXKJn0b8SgJkxm3ec2GqzJCZjndK5OTa7pPhYAemqb
         oAPrrVHMNZJOn0Y3u8vA9XePeDCtN2g9gXbKtcFflNQ0NMB1U3HbyDjOQnsUvelXJEUx
         JZrL1dkhlbQowNRUNDUwjQfBqqrP8XdseL5q/2cjrBgjCQL1YsQIe6GLLEOCBwp7NiFV
         rnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607456; x=1796212256;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XxpHxjNY3UsTDcTzG60Yu5gGt0anPZ0u89T3qoWHlA4=;
        b=jD/IwMgMn2dYzQ/qA6qEHSDeLAODN+5N/viU6+RhSrZ9HgBmof8Q84tg0iMN62X7wI
         Fxk6BGYczWNNjI52u25w93z8fR+0gpOdQJpML+IBUn8UYWyA702iHvbUSJXSDeT666kF
         0wbmCKhSQlI/LL/41+KsqWx8w+8kx+pbcU6x6ZYdSL4dYyT08GZ7eaygx4TXPTulEVB/
         XuYN9cG0di0fiKRhL63ihViKM899W504hFmPjph4rGMwqEIVkwpA6Ar+xZGoxrRAAGg1
         ZmDNr2JBmKdYwy9q+5MlkgppbSgaji3z/DNHZm1qXzOy/CXjHFDE5Zh7hgABSmzxb86r
         RABw==
X-Forwarded-Encrypted: i=1; AL+hErFkn7XfDnN/39L0PxjxgkpJe4w1nLXsUYUwBuU3h/Xq6yRBpwZ0C3i1YDr6EKiXJ05/tVcLxQnnPGbLJ9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WQ4LTfKAqS+ul9wOWvha8IPV/jlTW2M8kD4+E17tfOGl5KdSB
	AvFmCjTYHVV62c+jqvslSqEX3u3l6iRdICNdll01L6J/DYwFc8vBXjZDguo7ntGixV/6GNKtIXs
	PE7U2vdgoh+pW7Q==
X-Received: from wmbiv17.prod.google.com ([2002:a05:600c:5491:b0:4b6:5d12:e070])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46cc:b0:4bb:69b3:2b42 with SMTP id 5b1f17b1804b1-4bb888277b3mr377419855e9.16.1795607455071;
 Wed, 25 Nov 2026 03:50:55 -0800 (PST)
Date: Wed, 25 Nov 2026 11:50:52 +0000
In-Reply-To: <20261125114932.3198836-1-jpiecuch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125114932.3198836-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125114932.3198836-2-jpiecuch@google.com>
Subject: [RFC PATCH 1/2] sched_ext: Reenqueue IMMED tasks when a higher class
 wins the pick
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, Peter Zijlstra <peterz@infradead.org>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

SCX_ENQ_IMMED relies on rq->next_class to tell whether a higher class task
is about to take the CPU. rq_is_open() refuses IMMED insertions while
next_class is above ext and wakeup_preempt_scx() reenqueues IMMED tasks
when a higher class task raises next_class. However, a higher class task
can take the CPU without going through wakeup_preempt(), leaving IMMED
tasks on the local DSQ until it gives the CPU up:

- sched_setscheduler() or a PI boost promoting a queued task to RT or DL.
  sched_change_end() doesn't call wakeup_preempt() for tasks which aren't
  running, switched_to_rt() only calls resched_curr() and switched_to_dl()
  calls wakeup_preempt_dl() directly.

- DL replenishment, CFS bandwidth unthrottling (in partial mode) and RT
  group unthrottling make tasks runnable without wakeup_preempt().

- When the ext dl_server picks an SCX task, next_class becomes ext even
  though RT tasks are queued. Once the server runs out of budget, RT takes
  over without a wakeup.

- With core scheduling, a forced idle pick resets next_class to idle while
  tasks remain on the local DSQ. An RT task waking up on the CPU then goes
  through wakeup_preempt_idle() instead of wakeup_preempt_scx().

With proxy execution enabled, scx_proxy_reenqueue_retry() already catches
these. __schedule() sets rq->next_class from the picked task right before
calling it, so it reenqueues IMMED tasks whenever a higher class wins the
pick, whether or not that task went through wakeup_preempt(). Without proxy
execution (CONFIG_SCHED_PROXY_EXEC=n or sched_proxy_exec=0), nothing does.

Rather than chasing every path which can make a higher class task
runnable, check once the pick is final, whether or not proxy execution is
enabled. Add scx_settle_pick(), called by __schedule() after proxy
resolution, on the path which every pick reaches. If rq->next_class is
above SCX and the local DSQ has IMMED tasks, schedule a reenqueue. It runs
right after the context switch. rq_is_open() is false by then, so the
IMMED tasks go back to the BPF scheduler. With proxy execution,
rq->next_class is the class of the donor, so a higher class donor running
an SCX lock owner counts too. Core-sched siblings apply a pick made by
another CPU in their own __schedule(), so they're covered as well.

This makes the IMMED check in scx_proxy_reenqueue_retry() redundant, so
remove it. The reenqueue from wakeup_preempt_scx() stays, as it kicks in
earlier for the common case. When no BPF scheduler is loaded, the new hook
is a static branch.

Fixes: 98d709cba319 ("sched_ext: Implement SCX_ENQ_IMMED")
Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 kernel/sched/core.c    |  1 +
 kernel/sched/ext/ext.c | 53 +++++++++++++++++++++++++++++++++++-------
 kernel/sched/ext/ext.h | 13 +++++++++++
 3 files changed, 58 insertions(+), 9 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f7a452123ef5..7eb99b833a4a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7340,6 +7340,7 @@ static void __sched notrace __schedule(int sched_mode)
 	clear_tsk_need_resched(prev);
 	clear_preempt_need_resched();
 keep_resched:
+	scx_settle_pick(rq);
 	rq->last_seen_need_resched_ns = 0;
 
 	is_switch = prev != next;
diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index efa1d01d03af..cea7bd9acc8b 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -1264,14 +1264,6 @@ void scx_proxy_reenqueue_retry(struct rq *rq, struct task_struct *next)
 		scx_proxy_update_tick(rq, next);
 #endif
 
-	/*
-	 * A higher priority class may wake up while @rq is transiently idle
-	 * for proxy resolution. wakeup_preempt_scx() isn't invoked in that
-	 * case, so reenqueue IMMED donors parked on the local DSQ here.
-	 */
-	if (rq->scx.nr_immed && sched_class_above(rq->next_class, &ext_sched_class))
-		scx_schedule_reenq_local(rq, 0);
-
 	if (rq->scx.flags & SCX_RQ_PROXY_RETRY) {
 		rq->scx.flags &= ~SCX_RQ_PROXY_RETRY;
 		schedule_deferred_locked(rq);
@@ -2713,18 +2705,61 @@ static void wakeup_preempt_scx(struct rq *rq, struct task_struct *p, int wake_fl
 
 	/*
 	 * Getting preempted by a higher-priority class. Reenqueue IMMED tasks.
-	 * This captures all preemption cases including:
+	 * This captures the preemption cases which go through wakeup_preempt()
+	 * including:
 	 *
 	 * - A SCX task is currently running.
 	 *
 	 * - @rq is waking from idle due to a SCX task waking to it.
 	 *
 	 * - A higher-priority wakes up while SCX dispatch is in progress.
+	 *
+	 * The rest is caught by scx_settle_pick() once the higher-priority task
+	 * gets picked.
 	 */
 	if (rq->scx.nr_immed)
 		scx_schedule_reenq_local(rq, 0);
 }
 
+/**
+ * __scx_settle_pick - Reenqueue IMMED tasks left behind by a pick
+ * @rq: rq of the current CPU, locked
+ *
+ * Called by __schedule() once the pick, including proxy resolution, is final.
+ * If rq->next_class is above SCX, IMMED tasks on @rq's local DSQ can't run.
+ * With proxy execution, rq->next_class is the class of the donor. A higher
+ * class can take the CPU without going through wakeup_preempt_scx(), as
+ * rq->next_class doesn't always reflect the highest class with runnable tasks:
+ *
+ * - A queued task getting promoted to RT or DL by sched_setscheduler() or a PI
+ *   boost only triggers resched_curr() or a class-local preemption check.
+ *
+ * - DL replenishment and CFS or RT bandwidth unthrottling make tasks runnable
+ *   without going through wakeup_preempt().
+ *
+ * - When the ext dl_server picks an SCX task, rq->next_class is set to ext even
+ *   if RT tasks are queued. RT takes over once the server runs out of budget.
+ *
+ * - With core scheduling, a forced idle pick resets rq->next_class to idle
+ *   while tasks are still on the local DSQ. A later wakeup goes through
+ *   wakeup_preempt_idle().
+ *
+ * - While @rq is transiently idle for proxy resolution, a higher class task
+ *   waking up also goes through wakeup_preempt_idle().
+ *
+ * Catch all of these here. The reenqueue is deferred and runs right after the
+ * context switch. rq->next_class is still above SCX by then, so rq_is_open() is
+ * false and the IMMED tasks on the local DSQ go back to the BPF scheduler.
+ */
+void __scx_settle_pick(struct rq *rq)
+{
+	lockdep_assert_rq_held(rq);
+
+	if (rq->scx.nr_immed &&
+	    sched_class_above(rq->next_class, &ext_sched_class))
+		scx_schedule_reenq_local(rq, 0);
+}
+
 void scx_move_local_task_to_local_dsq(struct scx_sched *sch, struct task_struct *p,
 				      u64 enq_flags, struct rq *dst_rq)
 {
diff --git a/kernel/sched/ext/ext.h b/kernel/sched/ext/ext.h
index d32bc01071b0..c66c4c97a2e0 100644
--- a/kernel/sched/ext/ext.h
+++ b/kernel/sched/ext/ext.h
@@ -26,6 +26,7 @@ void scx_proxy_donor_start(struct rq *rq);
 void scx_proxy_reenqueue_retry(struct rq *rq, struct task_struct *next);
 void init_sched_ext_class(void);
 void __scx_update_idle(struct rq *rq, bool idle, bool do_notify);
+void __scx_settle_pick(struct rq *rq);
 
 static inline bool scx_allow_proxy_exec(const struct task_struct *p)
 {
@@ -41,6 +42,17 @@ static inline void scx_update_idle(struct rq *rq, bool idle, bool do_notify)
 		__scx_update_idle(rq, idle, do_notify);
 }
 
+/*
+ * Called by __schedule() once the pick, including proxy resolution, is final.
+ * A pick which lands in a class above SCX can leave %SCX_ENQ_IMMED tasks behind
+ * on the local DSQ. See __scx_settle_pick().
+ */
+static inline void scx_settle_pick(struct rq *rq)
+{
+	if (scx_enabled())
+		__scx_settle_pick(rq);
+}
+
 static inline u32 scx_cpuperf_target(s32 cpu)
 {
 	if (scx_enabled())
@@ -80,6 +92,7 @@ static inline void scx_proxy_reenqueue_retry(struct rq *rq,
 					     struct task_struct *next) {}
 static inline void init_sched_ext_class(void) {}
 static inline void scx_update_idle(struct rq *rq, bool idle, bool do_notify) {}
+static inline void scx_settle_pick(struct rq *rq) {}
 
 #endif	/* CONFIG_SCHED_CLASS_EXT */
 
-- 
2.56.1.839.g22a8290db9-goog

