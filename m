Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009503;
	b=T+V41Fnk/bum+/Ghj4UMrpBiUvH4uVWwZqvq9k0yCHA3OW0oBb8PSrN5ftBVM8X9WZqo
	 cohfcxBIpFdGwBq2M70DT5k+hTRhC8plwGVwzSkjVDbDX+KmvE/apeR+24WdlTdAMDVQy
	 qTORuV6uSSSs+0uCk92g5IeQcuK+UAZ7Fwz5W472E8PHTd0AUiCCdp++S2Q/DxK08C1/q
	 PNCzVowe6xctPlkSc5m/CmjFJvV611G8fyYWE0i0KqmfrRtJc3F9G5JMPSWaNsGcXwxYr
	 Fdr6xyrUIH/fCb2SInsva9o/ePDNra+jbCurXKD5iNrfeKNAnbGAYmWBJj9rEEoDY4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009503;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=0Tublv8yREvRlD0r2vLMl5/NAukCKy2oUflfeehTBNo=;
	b=GHy7gp1Za9Grk8LvqkuqHh1OzdBVhaO+DyyFYrWFSHYgHxCKNpq7RnMRk9mZhmrNAyE3
	 Qx2pJdFjxzdmueFcgdiWFgeq2eAM1P1qW7i53Y6jQmU8eoPVbkFvwROvNZIyzRSKjHkJd
	 RK2u5OeM+l5jkLXZyTfzygK/XDUOcDqtvU06f0uTHzldbXHJtQJvYp/DN4oxGkXtXXuxI
	 cxRkvDy6s926hC7tn2sDtuYU8tGY0VftgTHoVyL20y/h5xfJynAnt0at9wJpFfOQ2PwFN
	 g/WRaE/JjeJ/w7gLJVn+sLJjQo7ccRhFX1SRzTMnrCNicpkSls7/p6gqewQTt44hiBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rjBsUdO8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FbyrQn1x;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233EC606A330;
	Wed, 18 Nov 2026 13:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 233EC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rjBsUdO8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FbyrQn1x
Date: Wed, 18 Nov 2026 13:44:57 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795009499;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Tublv8yREvRlD0r2vLMl5/NAukCKy2oUflfeehTBNo=;
	b=rjBsUdO8PmxR8QYv8sM2gcnHUomCP8OEM2UXhp2IJr5T4SWLkb7CGzNCUttaKywl77e/dw
	BpgYy+iwC3SDaecWzAQWjibJ1b16RNWDUe6t5SqV9LtGHPiWSO2oylRStcmKKaJtqVzsOL
	YJqonMjiXO4HCxFCq+hM+ww9DIy3Asmday5Kb5y0BiBDjjXZ04EM2j08dEbWsxkZhskNtF
	nJ7/h/lk3pAhyMbHGOgP6y4frv4zW4r+IjIUwh+8WgazuVtLLrstR9/XOl46KiFPkr71RI
	snZ0q6UIACBBrLpYv5wdutbYzj7mrMQzIrjO/HbRG/AuujDFefw7PANUVrTVXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795009499;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Tublv8yREvRlD0r2vLMl5/NAukCKy2oUflfeehTBNo=;
	b=FbyrQn1x/AMf6L3GtK2C1mi/FyqEWzDIddDGuQcMaqNNCSCekNJem71n6rb67FIkdeMlK1
	IFq8oML0lgGhdSAA==
From: "tip-bot2 for Radu Toader" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] softirq: Treat an interrupted idle task as idle in
 tick_irq_exit()
Cc: Radu Toader <radu.m.toader@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261111112944.3868822-1-radu.m.toader@gmail.com>
References: <20261111112944.3868822-1-radu.m.toader@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179500949792.3191731.10522801986782630428.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     b251360cb2e6c7b74d962831f5797a4520511b36
Gitweb:        https://git.kernel.org/tip/b251360cb2e6c7b74d962831f5797a45205=
11b36
Author:        Radu Toader <radu.m.toader@gmail.com>
AuthorDate:    Wed, 11 Nov 2026 11:29:44=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 18 Nov 2026 14:32:21 +01:00

softirq: Treat an interrupted idle task as idle in tick_irq_exit()

tick_irq_exit() only runs tick_nohz_irq_exit() if sched_core_idle_cpu(),
which is idle_cpu() unless core scheduling is built in. idle_cpu() is
false when the run queue has tasks while the idle task runs.

That is the normal state of a CPU under sched_ext whose BPF scheduler
holds back a runnable task of that CPU in one of its queues, e.g. a task
of a cgroup at its CPU limit: the task stays queued on the CPU's run
queue and counts in rq->nr_running, while the CPU sits in the idle loop.

tick_nohz_irq_exit() is what marks an idle CPU as idle again for the
scheduler clock after an interrupt in the idle loop
(TS_FLAG_IDLE_ACTIVE, sched_clock_idle_sleep_event()). Without it, the
next exit from the idle loop doesn't resynchronize the CPU's sched_clock
with sched_clock_idle_wakeup_event(). With an unstable sched_clock, e.g.
under kvm-clock without a stable TSC, the clock of a CPU in tick-stopped
idle is clamped to its last stamp plus a tick, so a task picked after a
reschedule IPI (which doesn't go through irq_enter()) starts with a
stale exec_start, and the next tick charges the whole idle stretch to
it.

Measured with one thread spinning 10 ms in every 100 ms in a cgroup,
kept off its CPU for a further 7 to 53 ms per period by a sched_ext
scheduler: the cgroup's cpu.stat usage_usec over the thread's own
CLOCK_MONOTONIC measurement of its busy time reached 2.00, twice the
CPU time the thread could possibly have used, and is 0.96 with this
patch. The same ratio with no BPF scheduler loaded is 1.005.

Commit 548796e2e70b ("sched/core: introduce sched_core_idle_cpu()")
fixed this same gate for the other case of "the idle task runs while
nr_running > 0", forced idle under core scheduling, where the symptom
was too little idle time in /proc/stat. sched_ext made that state
reachable without CONFIG_SCHED_CORE, and there the symptom is idle time
charged to a task as runtime.

Ask whether the idle task is running, which covers both cases. CPUs
whose run queue is really empty are unaffected; a CPU interrupted
between leaving the idle loop and switching to a task has need_resched()
set or has already left the idle accounting, see tick_nohz_irq_exit().
sched_core_idle_cpu() has no users left and goes.

The two gates test different predicates rather than one containing the
other, and the difference is deliberate. idle_cpu() is idle_rq():
rq->curr =3D=3D rq->idle && !rq->nr_running && !rq->ttwu_pending.
is_idle_task() tests PF_IDLE on current. Newly covered:

 - the two "the idle task runs while nr_running > 0" cases above;

 - a CPU idling with a wakeup queued by TTWU_QUEUE whose IPI has not
   run yet;

 - injected idle. play_idle_precise() sets PF_IDLE on a SCHED_FIFO
   kthread which then loops on do_idle(), so rq->curr is not rq->idle
   there and the old gate was false off nohz_full CPUs. Interrupts
   taken during injected idle now run tick_nohz_irq_exit() with
   TS_FLAG_INIDLE set. That CPU is running an idle state and needs the
   same latch for the same reason, so this is wanted rather than merely
   harmless, but note it reaches the idle injection users in
   drivers/powercap/idle_inject.c, intel_powerclamp and
   cpuidle_cooling, and is not confined to sched_ext.

One state is no longer covered: PF_IDLE is set by cpu_startup_entry()
and not by init_idle(), so a CPU on its idle task before that point
satisfied idle_cpu() but does not satisfy is_idle_task(current). Nothing
is lost, because TS_FLAG_INIDLE is only set inside do_idle(), so
tick_nohz_irq_exit() had nothing to do there, and nohz_full CPUs are
covered by tick_nohz_full_cpu(cpu) either way.

What keeps the new gate from giving a CPU idle accounting it should not
have is that tick_nohz_irq_exit() tests TS_FLAG_INIDLE itself and only
does the idle bookkeeping inside the idle loop.

Tooling: the bug was found and this patch and changelog were written by
Claude Opus 5 (Claude Code), in a session measuring cgroup CPU limit
enforcement under sched_ext. All of the patch and all of the changelog
are tool-generated. The measurements above were taken on hosts that no
longer exist and were not repeated for this posting. By the threat model
in Documentation/process/threat-model.rst this is a regular bug and not
a vulnerability: it misreports CPU time under a legitimate configuration
and crosses no privilege or isolation boundary.

Fixes: f0e1a0643a59 ("sched_ext: Implement BPF extensible scheduler class")
Signed-off-by: Radu Toader <radu.m.toader@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Frederic Weisbecker <frederic@kernel.org>
Link: https://lore.kernel.org/lkml/20261106094343.174905-2-radu.m.toader@gmai=
l.com/
Link: https://patch.msgid.link/20261111112944.3868822-1-radu.m.toader@gmail.c=
om
---
 include/linux/sched.h   |  2 --
 kernel/sched/syscalls.c | 12 ------------
 kernel/softirq.c        | 12 ++++++++++--
 3 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 1b08925..7cd8df8 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2328,11 +2328,9 @@ extern void sched_core_free(struct task_struct *tsk);
 extern void sched_core_fork(struct task_struct *p);
 extern int sched_core_share_pid(unsigned int cmd, pid_t pid, enum pid_type t=
ype,
 				unsigned long uaddr);
-extern int sched_core_idle_cpu(int cpu);
 #else
 static inline void sched_core_free(struct task_struct *tsk) { }
 static inline void sched_core_fork(struct task_struct *p) { }
-static inline int sched_core_idle_cpu(int cpu) { return idle_cpu(cpu); }
 #endif
=20
 extern void sched_set_stop_task(int cpu, struct task_struct *stop);
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index a78672b..d12d3ef 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -194,18 +194,6 @@ struct task_struct *idle_task(int cpu)
 	return cpu_rq(cpu)->idle;
 }
=20
-#ifdef CONFIG_SCHED_CORE
-int sched_core_idle_cpu(int cpu)
-{
-	struct rq *rq =3D cpu_rq(cpu);
-
-	if (sched_core_enabled(rq) && rq->curr =3D=3D rq->idle)
-		return 1;
-
-	return idle_cpu(cpu);
-}
-#endif /* CONFIG_SCHED_CORE */
-
 /**
  * find_process_by_pid - find a process with a matching PID value.
  * @pid: the pid in question.
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 7fc2200..e7d649c 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -738,8 +738,16 @@ static inline void tick_irq_exit(void)
 #ifdef CONFIG_NO_HZ_COMMON
 	int cpu =3D smp_processor_id();
=20
-	/* Make sure that timer wheel updates are propagated */
-	if ((sched_core_idle_cpu(cpu) && !need_resched()) || tick_nohz_full_cpu(cpu=
)) {
+	/*
+	 * Make sure that timer wheel updates are propagated. An interrupted
+	 * idle loop counts as idle even with runnable tasks queued on the
+	 * CPU: forced idle under core scheduling, and the tasks sched_ext
+	 * keeps on a CPU's run queue while its BPF scheduler holds them back.
+	 * idle_cpu() would skip the idle bookkeeping of tick_nohz_irq_exit()
+	 * for those, and with an unstable sched_clock the CPU's clock then
+	 * isn't resynchronized when it leaves the idle loop.
+	 */
+	if ((is_idle_task(current) && !need_resched()) || tick_nohz_full_cpu(cpu)) {
 		if (hardirq_count() =3D=3D HARDIRQ_OFFSET)
 			tick_nohz_irq_exit();
 	}
