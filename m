Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795128603;
	b=VH/FsvgztK0QTk/OH5ixxpfZCZktG+i6P4/I3v8RO+NyjHwvkW/aQt/M0/i5ACBpkZr4
	 ircJ+pkQAsJwNuPBUs/IgqdZHMfK9KB/ccqV4muAYTGUYy9O/7L2zM0ZuH6OAVrJOeAIO
	 cF9yU8X7jv7rP+rTNa0Qz0ZMDrlOLB3tAaKmH2pn4E0fNAdScNQUcVW4jeLO2q5OBK7N5
	 3AM4E4igogYGyV53sQPzx5gKZba8VogSJKjLOE6YQCOl4c1qdHqkMf0HlIkUhuKDfzB28
	 qalCyQwSpj4GNHgt75xduXCzWlmBgqwMIrr7CCoMB/V6ZcatnHOK9I5MZWgEXQuzaQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=65sfcvgcZuy3r9NDpjH1LjS5MW8G5PkaZNGkpaYj5c0=;
	b=CuNUZYfFcxMSf1fQgCNWPoN5+8gvEVK5FIKLgx9HMB/NJ4clPIvkgPaC1wVJn32jWvGq
	 T8Ky6uQXlAS62YJ9fjl8XNaAdPiQNO5VUzFeJDLHbMGjfpeNlowXRR2doUOgbcdbjn6LM
	 xpcn8K+wEpA797bvP29Hq4rCRFE/RjThzpuDzCFkOMkENzYog97Na0NvxflK2hPfPZa/p
	 ytQ1vokdMVZy9Rwxp98TmJxIc5oP2IP8vYUUwUO1LzGrafyB12VfroZm6spD30SEo5ef8
	 1cj3nDU54IIEEKRzMyvUzXnQHVoPHntGeLbw1lJe91tfFQ1DOCOx2xBWQUPGUEGQhvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="VjGw7/Xb";
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F132606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F132606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VjGw7/Xb
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so192510c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795128602; x=1795733402; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=65sfcvgcZuy3r9NDpjH1LjS5MW8G5PkaZNGkpaYj5c0=;
        b=VjGw7/XbFegH67qNsuFPnH4LTco/n3xryUPbil1AlWGoOdGQm642nM8pFRcMOLcpHZ
         IMbp1QTpW/8cAapZjFS7zy2wlvsTcvtdlOJrnTK1spzTwxuP04LAhGBcXhuKsukky70L
         ZIudDah7v4sbxjIVprs+VNBc5ia/59pPYVg1wVqAU0LbZODyCqfnUyjmUUP2nbwnOC4w
         6YqBAVGyLEOVUsx0t8ieiL5PI/Lf5moKAlVvBMwuWfwOtg4MZx4F8JvAw5oCqgI/qMzP
         pLx8ulFoiSMc0otekyL5dR81r4kciEyrHHYU2LSrZyJF2LoAMHoyIv9WxFLthMYh4qIU
         7b0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795128602; x=1795733402;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=65sfcvgcZuy3r9NDpjH1LjS5MW8G5PkaZNGkpaYj5c0=;
        b=Nk+wxsFOknjihjFe+cYT2l8IBjYj5It44VnMg8Vl88QB5PAgrWxRFAA7AmcU4pgitV
         TAiF+dIznkeTbpzOPzQVLPn7EPsjHzlmbRuLDov3QcDrg+UV4WdlH5pHITMjlNAHlMJy
         TT8eF8asyDv/9thYS8v+wJ8oZeKwbKSDNeM3m8SH4UKhfUep2PTLFkYdygh2AFJKVDxY
         ns+UuGdW0+MWMrupis6gP3jLvufKMB4xLova9hdPvTGKkmqR1gZHNYYCHqqHZ3/XVNK2
         un+UNF4fjIPqD8d1wojUOwy3OogJvKnCub+vFt/AoDRLaU26VMXZNkRFyzfuPs2brdOC
         a8Sw==
X-Forwarded-Encrypted: i=1; AL+hErGkZIQXYSFyH/V9+kVCAGfKgz03t10hwQA0ybk+j47HzNYFo1efFE4DqhFdCPxoweaY3hFTGhvf5hE5TXE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sm223XVeZmxvmQGM0P35SWFIZFTvirkF7qC9nRMt3n2aJt+52
	dAhJNjdIhNXjOtR2vJ852mCVRqPGQ5s7l+wYgmQs6cgdZJcTGKANCfcOuCsDvgvFHfgco+tUYhc
	720favL7Gs64IGwmvmA==
X-Received: from dlev28.prod.google.com ([2002:a05:701b:465c:b0:1b5:4b48:ba2f])
 (user=penghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:3f0d:b0:16c:3408:760b with SMTP id a92af1059eb24-1b5568dabf1mr981189c88.32.1795128601364;
 Thu, 19 Nov 2026 14:50:01 -0800 (PST)
Date: Thu, 19 Nov 2026 14:49:54 -0800
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
Message-ID: <20261119224954.196990-4-penghuang@google.com>
Subject: [RFC PATCH 3/3] locking/rwsem: add KUnit tests for scheduler priority boost
From: Peng Huang <penghuang@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org, Peng Huang <penghuang@google.com>
Content-Type: text/plain; charset="UTF-8"

Add KUnit tests covering per-task rwsem slot tracking, interleaved
unlock order, slot overflow fallback, write-lock downgrade, wakeup
boost for both reader and writer holders, preemption priority-inversion
A/B latency, false-promotion checks, and fastpath overhead measurement.

Signed-off-by: Peng Huang <penghuang@google.com>
---
 kernel/locking/Makefile                 |   1 +
 kernel/locking/rwsem_sched_boost_test.c | 504 ++++++++++++++++++++++++
 lib/Kconfig.debug                       |  10 +
 3 files changed, 515 insertions(+)
 create mode 100644 kernel/locking/rwsem_sched_boost_test.c

diff --git a/kernel/locking/Makefile b/kernel/locking/Makefile
index cee1901d4cff..3df6ae1f1707 100644
--- a/kernel/locking/Makefile
+++ b/kernel/locking/Makefile
@@ -37,4 +37,5 @@ obj-$(CONFIG_DEBUG_SPINLOCK) += spinlock_debug.o
 obj-$(CONFIG_QUEUED_RWLOCKS) += qrwlock.o
 obj-$(CONFIG_LOCK_TORTURE_TEST) += locktorture.o
 obj-$(CONFIG_WW_MUTEX_SELFTEST) += test-ww_mutex.o
+obj-$(CONFIG_RWSEM_SCHED_BOOST_KUNIT_TEST) += rwsem_sched_boost_test.o
 obj-$(CONFIG_LOCK_EVENT_COUNTS) += lock_events.o
diff --git a/kernel/locking/rwsem_sched_boost_test.c b/kernel/locking/rwsem_sched_boost_test.c
new file mode 100644
index 000000000000..d60d2a87237a
--- /dev/null
+++ b/kernel/locking/rwsem_sched_boost_test.c
@@ -0,0 +1,504 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit tests for rw_semaphore per-task hold tracking and scheduler
+ * priority boosting.
+ */
+
+#include <kunit/test.h>
+#include <linux/atomic.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/kthread.h>
+#include <linux/ktime.h>
+#include <linux/rwsem.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <uapi/linux/sched/types.h>
+
+static bool task_holds_rwsem(const struct task_struct *p,
+			     const struct rw_semaphore *sem)
+{
+	int i;
+
+	for (i = 0; i < CONFIG_RWSEM_SCHED_BOOST_SLOTS; i++) {
+		if (READ_ONCE(p->held_rwsems[i]) == sem)
+			return true;
+	}
+	return false;
+}
+
+static void test_basic_hold_and_release(struct kunit *test)
+{
+	DECLARE_RWSEM(sem);
+
+	KUNIT_ASSERT_EQ(test, current->nr_held_rwsems, 0);
+	KUNIT_ASSERT_EQ(test, atomic_read(&sem.max_waiter_prio), MAX_PRIO);
+
+	down_read(&sem);
+	KUNIT_EXPECT_EQ(test, current->nr_held_rwsems, 1);
+	KUNIT_EXPECT_TRUE(test, task_holds_rwsem(current, &sem));
+	up_read(&sem);
+
+	KUNIT_EXPECT_EQ(test, current->nr_held_rwsems, 0);
+	KUNIT_EXPECT_FALSE(test, task_holds_rwsem(current, &sem));
+
+	KUNIT_ASSERT_EQ(test, down_read_trylock(&sem), 1);
+	KUNIT_EXPECT_EQ(test, current->nr_held_rwsems, 1);
+	up_read(&sem);
+	KUNIT_EXPECT_EQ(test, current->nr_held_rwsems, 0);
+
+	down_write(&sem);
+	KUNIT_EXPECT_EQ(test, current->nr_held_rwsems, 1);
+	KUNIT_EXPECT_TRUE(test, task_holds_rwsem(current, &sem));
+	up_write(&sem);
+	KUNIT_EXPECT_EQ(test, current->nr_held_rwsems, 0);
+
+	KUNIT_ASSERT_EQ(test, down_write_trylock(&sem), 1);
+	KUNIT_EXPECT_EQ(test, current->nr_held_rwsems, 1);
+	up_write(&sem);
+	KUNIT_EXPECT_EQ(test, current->nr_held_rwsems, 0);
+}
+
+static void test_interleaved_unlock(struct kunit *test)
+{
+	DECLARE_RWSEM(sem_a);
+	DECLARE_RWSEM(sem_b);
+	DECLARE_RWSEM(sem_c);
+
+	down_read(&sem_a);
+	down_read(&sem_b);
+	down_read(&sem_c);
+	KUNIT_EXPECT_EQ(test, current->nr_held_rwsems,
+			min(3, CONFIG_RWSEM_SCHED_BOOST_SLOTS));
+
+	/* Release out of acquisition order: B, A, C. */
+	up_read(&sem_b);
+	KUNIT_EXPECT_FALSE(test, task_holds_rwsem(current, &sem_b));
+	up_read(&sem_a);
+	KUNIT_EXPECT_FALSE(test, task_holds_rwsem(current, &sem_a));
+	up_read(&sem_c);
+	KUNIT_EXPECT_EQ(test, current->nr_held_rwsems, 0);
+}
+
+static void test_overflow_graceful(struct kunit *test)
+{
+	const int total = CONFIG_RWSEM_SCHED_BOOST_SLOTS + 3;
+	struct rw_semaphore *sems;
+	int i;
+
+	sems = kunit_kcalloc(test, total, sizeof(*sems), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, sems);
+
+	for (i = 0; i < total; i++)
+		init_rwsem(&sems[i]);
+
+	for (i = 0; i < total; i++)
+		down_read(&sems[i]);
+
+	KUNIT_EXPECT_EQ(test, current->nr_held_rwsems,
+			CONFIG_RWSEM_SCHED_BOOST_SLOTS);
+
+	for (i = 0; i < total; i++)
+		up_read(&sems[i]);
+
+	KUNIT_EXPECT_EQ(test, current->nr_held_rwsems, 0);
+	for (i = 0; i < total; i++)
+		KUNIT_EXPECT_FALSE(test, task_holds_rwsem(current, &sems[i]));
+}
+
+static void test_downgrade_write(struct kunit *test)
+{
+	DECLARE_RWSEM(sem);
+
+	down_write(&sem);
+	KUNIT_EXPECT_EQ(test, current->nr_held_rwsems, 1);
+	KUNIT_EXPECT_TRUE(test, task_holds_rwsem(current, &sem));
+
+	downgrade_write(&sem);
+	KUNIT_EXPECT_EQ(test, current->nr_held_rwsems, 1);
+	KUNIT_EXPECT_TRUE(test, task_holds_rwsem(current, &sem));
+
+	up_read(&sem);
+	KUNIT_EXPECT_EQ(test, current->nr_held_rwsems, 0);
+}
+
+struct boost_ctx {
+	struct rw_semaphore sem;
+	struct completion reader_locked;
+	struct completion reader_done;
+	bool holder_is_writer;
+	bool holder_is_idle;
+	int waiter_nice;
+	int observed_boost_prio;
+	int observed_prio;
+	int observed_nice;
+	int post_unlock_boost_prio;
+	int post_unlock_prio;
+	u64 reader_work_ns;
+};
+
+static int wakeup_holder_fn(void *arg)
+{
+	struct boost_ctx *ctx = arg;
+
+	if (ctx->holder_is_idle) {
+		struct sched_param sp = { .sched_priority = 0 };
+
+		sched_setscheduler_nocheck(current, SCHED_IDLE, &sp);
+	} else {
+		set_user_nice(current, 19);
+	}
+	if (ctx->holder_is_writer)
+		down_write(&ctx->sem);
+	else
+		down_read(&ctx->sem);
+	complete(&ctx->reader_locked);
+
+	/* Sleep so the higher-priority contender queues on ctx->sem first. */
+	msleep(25);
+
+	ctx->observed_boost_prio = current->rwsem_boost_prio;
+	ctx->observed_prio = current->prio;
+	ctx->observed_nice = task_nice(current);
+
+	if (ctx->holder_is_writer)
+		up_write(&ctx->sem);
+	else
+		up_read(&ctx->sem);
+	ctx->post_unlock_boost_prio = current->rwsem_boost_prio;
+	ctx->post_unlock_prio = current->prio;
+	complete(&ctx->reader_done);
+	return 0;
+}
+
+static void run_wakeup_boost_case(struct kunit *test, bool holder_is_writer,
+				  bool holder_is_idle, int waiter_nice)
+{
+	struct boost_ctx *ctx;
+	struct task_struct *holder;
+	int saved_nice = task_nice(current);
+	int exp_prio = NICE_TO_PRIO(waiter_nice);
+	int exp_post_prio = holder_is_idle ? DEFAULT_PRIO : NICE_TO_PRIO(19);
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ctx);
+	ctx->holder_is_writer = holder_is_writer;
+	ctx->holder_is_idle = holder_is_idle;
+	ctx->waiter_nice = waiter_nice;
+	init_rwsem(&ctx->sem);
+	init_completion(&ctx->reader_locked);
+	init_completion(&ctx->reader_done);
+
+	holder = kthread_run(wakeup_holder_fn, ctx,
+			     holder_is_writer ? "rwsem_wr_hld" : "rwsem_rd_hld");
+	KUNIT_ASSERT_FALSE(test, IS_ERR(holder));
+
+	wait_for_completion(&ctx->reader_locked);
+	set_user_nice(current, waiter_nice);
+	if (holder_is_writer) {
+		down_read(&ctx->sem);
+		up_read(&ctx->sem);
+	} else {
+		down_write(&ctx->sem);
+		up_write(&ctx->sem);
+	}
+	set_user_nice(current, saved_nice);
+
+	wait_for_completion(&ctx->reader_done);
+
+	KUNIT_EXPECT_EQ(test, ctx->observed_boost_prio, exp_prio);
+	KUNIT_EXPECT_EQ(test, ctx->observed_prio, exp_prio);
+	if (!holder_is_idle)
+		KUNIT_EXPECT_EQ(test, ctx->observed_nice, 19);
+	KUNIT_EXPECT_EQ(test, ctx->post_unlock_boost_prio, MAX_PRIO);
+	KUNIT_EXPECT_EQ(test, ctx->post_unlock_prio, exp_post_prio);
+	KUNIT_EXPECT_EQ(test, atomic_read(&ctx->sem.max_waiter_prio), MAX_PRIO);
+}
+
+static void test_contention_wakeup_boost(struct kunit *test)
+{
+	run_wakeup_boost_case(test, false, false, -10);
+}
+
+static void test_writer_holder_wakeup_boost(struct kunit *test)
+{
+	run_wakeup_boost_case(test, true, false, -10);
+}
+
+static void test_sched_idle_holder_boost_cap(struct kunit *test)
+{
+	run_wakeup_boost_case(test, false, true, 10);
+}
+
+static int hog_fn(void *arg)
+{
+	set_user_nice(current, 0);
+	while (!kthread_should_stop()) {
+		cpu_relax();
+		cond_resched();
+	}
+	return 0;
+}
+
+static int busy_reader_fn(void *arg)
+{
+	struct boost_ctx *ctx = arg;
+	u64 start, end;
+	int i;
+
+	set_user_nice(current, 19);
+	down_read(&ctx->sem);
+	start = ktime_get_ns();
+	complete(&ctx->reader_locked);
+
+	/*
+	 * Busy-loop for ~10ms of CPU work while competing against nice=0
+	 * hogs; once the nice=-10 writer blocks on ctx->sem, tick/preempt
+	 * hooks should boost this reader to prio 110.
+	 */
+	for (i = 0; i < 20; i++) {
+		u64 t0 = ktime_get_ns();
+
+		while (ktime_get_ns() - t0 < 500 * NSEC_PER_USEC)
+			cpu_relax();
+		cond_resched();
+	}
+	end = ktime_get_ns();
+
+	ctx->observed_boost_prio = current->rwsem_boost_prio;
+	ctx->observed_prio = current->prio;
+	ctx->observed_nice = task_nice(current);
+	ctx->reader_work_ns = end - start;
+
+	up_read(&ctx->sem);
+	ctx->post_unlock_boost_prio = current->rwsem_boost_prio;
+	ctx->post_unlock_prio = current->prio;
+	complete(&ctx->reader_done);
+	return 0;
+}
+
+static u64 run_one_inversion_iter(struct kunit *test, struct boost_ctx *ctx)
+{
+	struct task_struct *reader;
+	int saved_nice = task_nice(current);
+	u64 wait_ns;
+
+	reinit_completion(&ctx->reader_locked);
+	reinit_completion(&ctx->reader_done);
+
+	reader = kthread_run(busy_reader_fn, ctx, "rwsem_busy_rdr");
+	KUNIT_ASSERT_FALSE(test, IS_ERR(reader));
+
+	wait_for_completion(&ctx->reader_locked);
+	set_user_nice(current, -10);
+	wait_ns = ktime_get_ns();
+	down_write(&ctx->sem);
+	wait_ns = ktime_get_ns() - wait_ns;
+	up_write(&ctx->sem);
+	set_user_nice(current, saved_nice);
+
+	wait_for_completion(&ctx->reader_done);
+	return wait_ns;
+}
+
+static void start_hogs(struct kunit *test, struct task_struct **hogs, int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++) {
+		hogs[i] = kthread_run(hog_fn, NULL, "rwsem_hog%d", i);
+		KUNIT_ASSERT_FALSE(test, IS_ERR(hogs[i]));
+	}
+}
+
+static void stop_hogs(struct task_struct **hogs, int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++)
+		kthread_stop(hogs[i]);
+}
+
+static void test_preemption_inversion_latency(struct kunit *test)
+{
+	struct boost_ctx *ctx;
+	struct task_struct *hogs[4];
+	const int iters = 3;
+	u64 ctrl_sum = 0, treat_sum = 0;
+	u64 ctrl_max = 0, treat_max = 0;
+	int i;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ctx);
+	init_rwsem(&ctx->sem);
+	init_completion(&ctx->reader_locked);
+	init_completion(&ctx->reader_done);
+
+	start_hogs(test, hogs, ARRAY_SIZE(hogs));
+
+	rwsem_sched_boost_set(false);
+	for (i = 0; i < iters; i++) {
+		u64 w = run_one_inversion_iter(test, ctx);
+
+		ctrl_sum += w;
+		ctrl_max = max(ctrl_max, w);
+		KUNIT_EXPECT_EQ(test, ctx->observed_boost_prio, MAX_PRIO);
+	}
+
+	rwsem_sched_boost_set(true);
+	for (i = 0; i < iters; i++) {
+		u64 w = run_one_inversion_iter(test, ctx);
+
+		treat_sum += w;
+		treat_max = max(treat_max, w);
+		KUNIT_EXPECT_EQ(test, ctx->observed_boost_prio,
+				NICE_TO_PRIO(-10));
+		KUNIT_EXPECT_EQ(test, ctx->observed_prio, NICE_TO_PRIO(-10));
+		KUNIT_EXPECT_EQ(test, ctx->post_unlock_boost_prio, MAX_PRIO);
+	}
+
+	stop_hogs(hogs, ARRAY_SIZE(hogs));
+
+	kunit_info(test,
+		   "A/B (n=%d, 4 hogs): Control mean=%llu ms max=%llu ms | Treatment mean=%llu ms max=%llu ms\n",
+		   iters,
+		   (ctrl_sum / iters) / NSEC_PER_MSEC,
+		   ctrl_max / NSEC_PER_MSEC,
+		   (treat_sum / iters) / NSEC_PER_MSEC,
+		   treat_max / NSEC_PER_MSEC);
+
+	KUNIT_EXPECT_LT(test, treat_sum, ctrl_sum);
+}
+
+static void test_no_false_promotion_uncontended(struct kunit *test)
+{
+	struct boost_ctx *ctx;
+	struct task_struct *hogs[2];
+	struct task_struct *reader;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ctx);
+	init_rwsem(&ctx->sem);
+	init_completion(&ctx->reader_locked);
+	init_completion(&ctx->reader_done);
+
+	start_hogs(test, hogs, ARRAY_SIZE(hogs));
+
+	rwsem_sched_boost_set(true);
+	reader = kthread_run(busy_reader_fn, ctx, "rwsem_fp_rdr");
+	KUNIT_ASSERT_FALSE(test, IS_ERR(reader));
+
+	wait_for_completion(&ctx->reader_locked);
+	/* No waiter blocks on ctx->sem. */
+	wait_for_completion(&ctx->reader_done);
+
+	stop_hogs(hogs, ARRAY_SIZE(hogs));
+
+	KUNIT_EXPECT_EQ(test, ctx->observed_boost_prio, MAX_PRIO);
+	KUNIT_EXPECT_EQ(test, ctx->observed_prio, NICE_TO_PRIO(19));
+	KUNIT_EXPECT_EQ(test, ctx->observed_nice, 19);
+}
+
+static noinline u64 bench_read_fastpath(struct rw_semaphore *sem, int iters)
+{
+	u64 start = ktime_get_ns();
+	int i;
+
+	for (i = 0; i < iters; i++) {
+		down_read(sem);
+		barrier();
+		up_read(sem);
+	}
+	return ktime_get_ns() - start;
+}
+
+static noinline u64 bench_write_fastpath(struct rw_semaphore *sem, int iters)
+{
+	u64 start = ktime_get_ns();
+	int i;
+
+	for (i = 0; i < iters; i++) {
+		down_write(sem);
+		barrier();
+		up_write(sem);
+	}
+	return ktime_get_ns() - start;
+}
+
+static void test_fastpath_overhead(struct kunit *test)
+{
+	DECLARE_RWSEM(outer1);
+	DECLARE_RWSEM(outer2);
+	DECLARE_RWSEM(sem);
+	const int rounds = 5;
+	const int per_round = 200000;
+	const u64 total_ops = (u64)rounds * per_round;
+	u64 r_off = 0, r_on = 0;
+	u64 w_off = 0, w_on = 0;
+	u64 n_off = 0, n_on = 0;
+	int i;
+
+	/* Warmup instruction and branch caches. */
+	bench_read_fastpath(&sem, 10000);
+	bench_write_fastpath(&sem, 10000);
+
+	for (i = 0; i < rounds; i++) {
+		rwsem_sched_boost_set(false);
+		r_off += bench_read_fastpath(&sem, per_round);
+		w_off += bench_write_fastpath(&sem, per_round);
+
+		rwsem_sched_boost_set(true);
+		r_on += bench_read_fastpath(&sem, per_round);
+		w_on += bench_write_fastpath(&sem, per_round);
+	}
+
+	/* Measure nested read fastpath with 2 outer slots already occupied. */
+	for (i = 0; i < rounds; i++) {
+		rwsem_sched_boost_set(false);
+		down_read(&outer1);
+		down_read(&outer2);
+		n_off += bench_read_fastpath(&sem, per_round);
+		up_read(&outer2);
+		up_read(&outer1);
+
+		rwsem_sched_boost_set(true);
+		down_read(&outer1);
+		down_read(&outer2);
+		n_on += bench_read_fastpath(&sem, per_round);
+		up_read(&outer2);
+		up_read(&outer1);
+	}
+
+	kunit_info(test,
+		   "Fastpath (%llu ops): read off=%llu.%02llu on=%llu.%02llu ns/op | write off=%llu.%02llu on=%llu.%02llu ns/op | nested2 read off=%llu.%02llu on=%llu.%02llu ns/op\n",
+		   total_ops,
+		   (r_off / total_ops), (r_off * 100 / total_ops) % 100,
+		   (r_on / total_ops), (r_on * 100 / total_ops) % 100,
+		   (w_off / total_ops), (w_off * 100 / total_ops) % 100,
+		   (w_on / total_ops), (w_on * 100 / total_ops) % 100,
+		   (n_off / total_ops), (n_off * 100 / total_ops) % 100,
+		   (n_on / total_ops), (n_on * 100 / total_ops) % 100);
+}
+
+static struct kunit_case rwsem_sched_boost_test_cases[] = {
+	KUNIT_CASE(test_basic_hold_and_release),
+	KUNIT_CASE(test_interleaved_unlock),
+	KUNIT_CASE(test_overflow_graceful),
+	KUNIT_CASE(test_downgrade_write),
+	KUNIT_CASE(test_contention_wakeup_boost),
+	KUNIT_CASE(test_writer_holder_wakeup_boost),
+	KUNIT_CASE(test_sched_idle_holder_boost_cap),
+	KUNIT_CASE(test_preemption_inversion_latency),
+	KUNIT_CASE(test_no_false_promotion_uncontended),
+	KUNIT_CASE(test_fastpath_overhead),
+	{}
+};
+
+static struct kunit_suite rwsem_sched_boost_test_suite = {
+	.name = "rwsem_sched_boost",
+	.test_cases = rwsem_sched_boost_test_cases,
+};
+
+kunit_test_suite(rwsem_sched_boost_test_suite);
+
+MODULE_LICENSE("GPL");
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2d22638ec13a..b3f2b8d6633e 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1692,6 +1692,16 @@ config WW_MUTEX_SELFTEST
 	  Say M if you want these self tests to build as a module.
 	  Say N if you are unsure.
 
+config RWSEM_SCHED_BOOST_KUNIT_TEST
+	bool "KUnit tests for rw_semaphore scheduler priority boost"
+	depends on KUNIT && RWSEM_SCHED_BOOST
+	default KUNIT_ALL_TESTS
+	help
+	  Enable KUnit tests verifying per-task rw_semaphore hold tracking,
+	  atomic max_waiter_prio updates, contention-driven priority boosting,
+	  and zero false promotion when uncontended.
+	  If unsure, say N.
+
 config SCF_TORTURE_TEST
 	tristate "torture tests for smp_call_function*()"
 	depends on DEBUG_KERNEL
-- 
2.56.1.750.gf70dc682cf-goog

