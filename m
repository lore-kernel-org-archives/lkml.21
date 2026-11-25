Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580365;
	b=TdChxChh9c3UElzfEMhXUotKUsQtleUSOqDhZoVrdNlpifi/UIMgCYon9WFL99MhXx62
	 g9d30v+FwDuB4q4YlCqLJ61O0QOaiIN9l/kbExGNVFrdi/XdrciHUI1hB2bn/HA8paQO6
	 n2vDiDuJGRAoun6QPFQdbiMC5K+lQzcISAztZbn32BdUmmZm7nWB9CN0mm44PjSB6QkrH
	 n6as68bEnvgmp2XG7ULRRw3HqidXUL/PO87PslaipIvYgHeK50kqcJglUMdk2OAUvwv4a
	 94+Ypd6pgqdIG0xmIS1E57p8NTGSNDZKoXNzEbZ7Wt2HXjkn7QBghbFTgibfgaNDclg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=n+Tz4tKq2gG6UGE18fILf4KAFd//6eCE6q5DDhgZjQs=;
	b=XlHmkl/wnWHnRIr6zMukYH8bZFAXgX8TOy+Vu27eWjn+CIXnbElLjWHA7tzBgHzmUhlO
	 tUk0/uSJME8FVYNNt0ZErW2hkeceM9/JhqK31aytqyjV5GxYJfjV9bys3WR2SKVCJhrj/
	 8o9LVEZ5e2y1DcmjQV98MXyEkRVsIDKJbzJS0pPyQ/A7SYkj8uXk1RGvE82pi0JJHBcvT
	 zd0IwC/xJXCzdJXRbdrYh6YaNCiblPs2ur/5a9fcIs4dHLsv6epQ736gjjkjj3HlwMSg0
	 5hGpnsthLi0SRQTTpI7L1eqvXJNNFBmDlGeLGoflvxxBeSfo9zToufM5fP35jgT/rrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q+hLBC2o;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0D5606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D0D5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q+hLBC2o
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb8b260bb4so2941055a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795580364; x=1796185164; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+Tz4tKq2gG6UGE18fILf4KAFd//6eCE6q5DDhgZjQs=;
        b=Q+hLBC2oy0jjpJenHnSoOJ5788mD9qnq6PftQskd4EczEcb8SGA9aYwC+QfSs/sZi5
         vwvQuTzfPe8LzPjShZA0MrQGbr/laGJLSH8w/qHZoFBxe/i2XF69a6oA+X9K3VwDd4Lv
         RT8UATovuihGi3+0hGBZ2HK6CV1p7c2KsYI8EMfKlmzIeQfqhr8lIvXjZMkjNuLpqwaJ
         ABLHD41LFa+PGyMyhHp50sOrcqSpofT6CbaSxOCusaCJZ4EieaoS616jIyypNk0trAqT
         y1YaADt/RJSDdLBsAzJUpLQNvEDVs2t0lPnFmGkuETKrgS/4oVmG+JKYDyZy0xt0FHB/
         1fTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580364; x=1796185164;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n+Tz4tKq2gG6UGE18fILf4KAFd//6eCE6q5DDhgZjQs=;
        b=NeBPCmux0HExBTrnKhaXz8dFWE5a/wt6RZi9u1KLh6YFBS2ic0hevrgGL7dgz40mS7
         N21WlJgGVarGeYeYzehrd58IzhMpx6gYYCoj0/9CAUY9+r+kH6PoL2XjWwrHmFAEEgO/
         joki5jcZbZsAUGzE+G56ZzaX9KWOiveZJzY5aV61/jbEup+Fj4gyLbWWfezos/QGwBN/
         8A11tFY0TP86aiyMj5sDE8TR9E74o7foDMVdFUx5WzvPEqk95wBSgxWkXRjEZwHyofLg
         Oj4UuQHHWXoJeLdSv3OBvBr2cIRsPPgjAecSXKX4eNVRiyEshsHJYy5J8855nqc5EL0C
         JcnA==
X-Forwarded-Encrypted: i=1; AL+hErHoTQAbXkvTXbwX4fHK889WezyMR0ugSbRjnsV2RNNeAgo9pszeyxrgtrKDqCta2hxpqstnFlSKg0TQxkc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8al35kD3hhKyODDgD4tq2c7pN9Ur5gqvPM9UnDwhz4W8SeSiZ9
	oh9P0+pmWJeda6etxNVsJWPdwo7odjXeyUWTANkEN6HYFRkUuF9XC6heYjqvjUtWrrQMOvO6QPf
	cwAcs8KXVCbnUYbXkpbDZbbNrtg==
X-Received: from plrd18.prod.google.com ([2002:a17:902:aa92:b0:2eb:50b1:b505])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:32ce:b0:2ef:d0b0:c386 with SMTP id d9443c01a7336-2f03f170cb6mr177864885ad.32.1795580363429;
 Tue, 24 Nov 2026 20:19:23 -0800 (PST)
Date: Wed, 25 Nov 2026 04:18:59 +0000
In-Reply-To: <20261125041900.3243569-1-dylanbhatch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125041900.3243569-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125041900.3243569-2-dylanbhatch@google.com>
Subject: [PATCH v2 1/2] sched, livepatch: Fix transition stall for CPU-bound tasks
From: Dylan Hatch <dylanbhatch@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Shuah Khan <shuah@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Gleixner <tglx@kernel.org>, live-patching@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit 676e8cf70cb0 ("sched,livepatch: Untangle cond_resched() and
live-patching") moved klp_sched_try_switch() from cond_resched() into
__schedule() and gated it on READ_ONCE(curr->__state) & TASK_FREEZABLE.
This causes livepatch transitions to stall when CPU-bound kthreads,
PF_USER_WORKER threads (such as vhost-<pid>), or user tasks in long
kernel loops spin with cond_resched() for two reasons:

1. Even when __schedule() is entered via preemption or an unfreezable
   sleep (such as PF_NOFREEZE kthreads or PF_USER_WORKER threads
   sleeping in TASK_INTERRUPTIBLE), curr->__state does not have
   TASK_FREEZABLE set, so klp_sched_try_switch() skips the task.
   Livepatch safety in __schedule() is already guaranteed by
   stack_trace_save_tsk_reliable() inside klp_check_stack().
2. A sole runnable task spinning in the kernel never gets
   TIF_NEED_RESCHED set during sched_tick(). In klp_send_signals(),
   wake_up_state(task, TASK_INTERRUPTIBLE) is a no-op for a
   TASK_RUNNING task, and set_notify_signal() sets TIF_NOTIFY_SIGNAL
   without TIF_NEED_RESCHED, so the resulting reschedule IPI returns to
   kernel mode without entering __schedule().

Fix both issues by:
- Removing the TASK_FREEZABLE check from klp_sched_try_switch() and
  checking TIF_PATCH_PENDING inline.
- Waking interruptibly sleeping PF_USER_WORKER tasks alongside
  PF_KTHREAD tasks in klp_send_signals(), and calling resched_cpu() on
  any still-running task's CPU so it is forced through __schedule() and
  switches in klp_sched_try_switch().

Note that when a CPU-bound task is the sole runnable task on its CPU,
entering __schedule(SM_PREEMPT) from preempt_schedule_irq() leaves an
in-kernel interrupt pt_regs frame on the stack during
klp_sched_try_switch(). Completing the transition in that context
requires arch_stack_walk_reliable() to support unwinding across
in-kernel exception frames (as CONFIG_UNWINDER_ORC=y does on x86_64);
configs and architectures whose reliable unwinder rejects in-kernel
exception frames (x86 with CONFIG_FRAME_POINTER=y, arm64, powerpc, and
s390) still require another runnable task to context-switch the spinning
task out until exception-boundary reliable unwinding (e.g. via SFrame)
is available.

Fixes: 676e8cf70cb0 ("sched,livepatch: Untangle cond_resched() and live-patching")
Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 include/linux/livepatch_sched.h |  2 +-
 include/linux/sched.h           |  1 +
 kernel/livepatch/transition.c   | 19 +++++++++++++++----
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/include/linux/livepatch_sched.h b/include/linux/livepatch_sched.h
index 065c185f27638..533b754f10da4 100644
--- a/include/linux/livepatch_sched.h
+++ b/include/linux/livepatch_sched.h
@@ -14,7 +14,7 @@ DECLARE_STATIC_KEY_FALSE(klp_sched_try_switch_key);
 static __always_inline void klp_sched_try_switch(struct task_struct *curr)
 {
 	if (static_branch_unlikely(&klp_sched_try_switch_key) &&
-	    READ_ONCE(curr->__state) & TASK_FREEZABLE)
+	    unlikely(test_tsk_thread_flag(curr, TIF_PATCH_PENDING)))
 		__klp_sched_try_switch();
 }
 
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 1c93da75226e3..121f2b3ed69b0 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2035,6 +2035,7 @@ extern int wake_up_process(struct task_struct *tsk);
 extern void wake_up_new_task(struct task_struct *tsk);
 
 extern void kick_process(struct task_struct *tsk);
+extern void resched_cpu(int cpu);
 
 extern void __set_task_comm(struct task_struct *tsk, const char *from, bool exec);
 #define set_task_comm(tsk, from) ({			\
diff --git a/kernel/livepatch/transition.c b/kernel/livepatch/transition.c
index 2351a19ac2a9e..f626b8a07323b 100644
--- a/kernel/livepatch/transition.c
+++ b/kernel/livepatch/transition.c
@@ -402,12 +402,13 @@ static void klp_send_signals(void)
 		 * Meanwhile the task could migrate itself and the action
 		 * would be meaningless. It is not serious though.
 		 */
-		if (task->flags & PF_KTHREAD) {
+		if (task->flags & (PF_KTHREAD | PF_USER_WORKER)) {
 			/*
-			 * Wake up a kthread which sleeps interruptedly and
-			 * still has not been migrated.
+			 * Wake up a kthread or user worker which sleeps
+			 * interruptibly and still has not been migrated.
 			 */
-			wake_up_state(task, TASK_INTERRUPTIBLE);
+			if (wake_up_state(task, TASK_INTERRUPTIBLE))
+				continue;
 		} else {
 			/*
 			 * Send fake signal to all non-kthread tasks which are
@@ -415,6 +416,16 @@ static void klp_send_signals(void)
 			 */
 			set_notify_signal(task);
 		}
+
+		/*
+		 * If the task is currently running (e.g. CPU-bound in the
+		 * kernel), force its CPU through __schedule() so it can switch
+		 * itself in klp_sched_try_switch().
+		 */
+		scoped_guard(preempt) {
+			if (task_curr(task))
+				resched_cpu(task_cpu(task));
+		}
 	}
 	read_unlock(&tasklist_lock);
 }
-- 
2.56.1.839.g22a8290db9-goog

