Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795350015;
	b=QZI6VG1f8U4hhRbOY+vPs4icNychovGbMMttvr+PybiwlAGtsgRCGwl7yTctiSYUtY6i
	 Yt+HH0rmZLPI6EWTWgmqeWNOjBsiNplzmjnHH1OtFidEzXRe6R9aq1oqdeee7Q6rMjugY
	 18JI9ZBm3rNT0frqX5lzD8NNlr1hDFgCzHkoCthYrVJZVWjqdA0s4Rs5ikHJw049rfh8J
	 s3lMhutXZeb622z7HXCdqJdzNHEH8mPz58zk0rthJypdFpV2hz/Uk00VsaO7ljbez62c2
	 N7rrnHJLiPrxSdMjd1KWynHc4sdymmWOAC6f0XbpFfvc7JxJopm1D0Y0N4wvu+1wz1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795350015;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=g97xjPrBawgweQA4k3zq7SvKC3g/KKuRIh07JI3c4ug=;
	b=Qs2QNTLlQX/D697saZ5gtrsrSX82Lcs+ELXeebx5Fx/Oc0Uthk0Xwj2PPFD6lYgTffIG
	 vsaWJXlqNAueyIHDtCdxNbtRFvHNSTTBcflVQ+9ajutclm1qAkJyV6ASJcTYtKaJFAw02
	 /vpDaVRYX5fr1n0gTfYHz9b58uVhHc/VLyDT/j3nuqdDw3C0MrZ0pNCn925m0fxFmBKa+
	 xQ7hFipje0Cqeb+KyyPA85Tr3+xfAMZ10hTdEjvebuIKMCWa+skLifbtO9mD1mSy+EWvP
	 2YIQcWGJ7+C2XCP5XiTD4gr8oS+dcpa5tuHAIjFxNb6AG1UBkq6xnkwLBZsNxLERXjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Gi10WioZ;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66573606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66573606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Gi10WioZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=g9
	7xjPrBawgweQA4k3zq7SvKC3g/KKuRIh07JI3c4ug=; b=Gi10WioZ/q+F/4Xl9O
	8j3BN6Ez8MdNUaMNFA242C8aCydFeEQkzugM9JcNGCv3JjaNhYFog2tZnzwTGVhM
	RD4fGAgpRuih1sjZDmK5yw2DaqpYYcYzhFQG3FtauSEah76UZO4Gf55nVWhoMde7
	xN8cXArAW68YVuIUKLdJ2DaDQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3n0iS3QJr8NQqJg--.46311S2;
	Sun, 22 Nov 2026 20:18:27 +0800 (CST)
From: albin_yang@163.com
To: peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	kayracizmeci@gmail.com,
	linux-kernel@vger.kernel.org,
	albin_yang@163.com,
	albinwyang@tencent.com
Subject: [PATCH v3] sched/stats: Fix run_delay over-count for tasks parked on the runqueue while blocked
Date: Sun, 22 Nov 2026 20:18:23 +0800
Message-ID: <20261122121823.2572209-1-albin_yang@163.com>
X-Mailer: git-send-email 2.43.7
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
X-CM-TRANSID:_____wD3n0iS3QJr8NQqJg--.46311S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Gw1rZrW3tF43Ar1DXrWxCrg_yoW7tr48p3
	ykW3y3Ga18Kr40ga9rZr4UGa4akwnrGw43tF97t34Fkr45Jw10vF1ktFW3XFsYkr9akFWS
	vF4Yg39Fya1jyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pieyIUUUUUU=
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/xtbCzhT3mmsC3ZSBAgAA3U

From: Wei Yang <albinwyang@tencent.com>

A task parked on the runqueue while blocked -- a proxy-exec donor
migrated to its mutex owner's CPU, or a DELAY_DEQUEUE sleeper migrated
across CPUs -- is re-attached via activate_task() without
ENQUEUE_RESTORE. That arms sched_info.last_queued although the task is
not waiting for a CPU, and the parked time is later charged as
run-queue wait: by sched_info_dequeue() when proxy_needs_return()
dequeues a donor on wakeup, or by sched_info_arrive() once the task
runs.

Use p->is_blocked as the primary indicator: sched_info_dequeue() drops
last_queued without charging while blocked; sched_info_enqueue() refreshes
it on every enqueue while blocked, so the stamp ends up at the real wakeup;
ttwu_runnable() adds an explicit sched_info_enqueue() call under the
existing !task_on_cpu() guard, for wakeups that have no enqueue of their
own. Delayed sleepers also have is_blocked set, so both cases are covered.

The p == current early return in try_to_wake_up() now documents why it
needs no sched_info_enqueue() call.

Both over-counts disappear with this patch, and run_delay still grows
normally for a runnable task contending for the CPU, so the counter is
alive rather than switched off.

Fixes: b049b81bdff6 ("sched: Handle blocked-waiter migration (and return migration)")
Suggested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Suggested-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Signed-off-by: Wei Yang <albinwyang@tencent.com>
---

v3: restore Prateek's comments in sched_info_dequeue() and
sched_info_enqueue(), dropped in v2 (Kayra). No code change.

v2: switch from the v1 !task_is_blocked() gate to the is_blocked based
approach proposed by Prateek Nayak. Subject widened: v1 only mentioned
proxy-migrated donors, while the same gating fixes both cases.

Measured with two CPUs used (CPU0/CPU1); run_delay is field 2 of
/proc/<tid>/schedstat:

  proxy exec, donor migrated to the owner's CPU (~170 ms block)
    unpatched       167.07 - 167.09 ms   5/5   migrated
    patched           0.00 ms           20/20  migrated
    same-cpu control  0.00 ms            0/5   not migrated

  DELAY_DEQUEUE, sleeper migrated across CPUs (~150 ms sleep)
    unpatched       147.94 - 147.99 ms   5/20
    patched           0.00 ms            0/100

The DELAY_DEQUEUE reproducer self-checks (must reproduce unpatched) and
shows ~40 ms of run_delay growth per round throughout.

v2: https://lore.kernel.org/all/20261114092637.3206631-1-albin_yang@163.com/
v1: https://lore.kernel.org/all/20261025130740.3324391-1-albin_yang@163.com/
Full test results and the discussion of the split:
https://lore.kernel.org/all/20261101143101.353033-1-albin_yang@163.com/

p->is_blocked was added by 4c2a20413d7f ("sched: Add is_blocked task flag")
and is only available from v7.2-rc1. The DELAY_DEQUEUE over-count goes back
to v6.12 (152e11f6df29) and still needs the sched_delayed based variant on
older stable trees; that is a separate, independent fix. A second Fixes:
tag would make the stable backport machinery try this on v6.12.y, where
is_blocked does not exist. Hence only one Fixes: tag above.
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5ed660f099a5..b3af72ba948f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3962,6 +3962,8 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
 		 * it should preempt the task that is current now.
 		 */
 		wakeup_preempt(rq, p, wake_flags | WF_TTWU_RQ);
+		/* Start accounting wait time. */
+		sched_info_enqueue(rq, p);
 	}
 	ttwu_do_wakeup(p);
 	return 1;
@@ -4357,6 +4359,11 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 		if (!ttwu_state_match(p, state, &success))
 			goto out;
 
+		/*
+		 * No sched_info_enqueue() here: current is running, not
+		 * waiting for a CPU. If preempted, sched_info_switch() ->
+		 * sched_info_depart() arms the wait clock instead.
+		 */
 		trace_sched_waking(p);
 		ttwu_do_wakeup(p);
 		goto out;
diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
index ebe0a7765f98..c4c624deb25b 100644
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -239,6 +239,15 @@ static inline void psi_account_irqtime(struct rq *rq, struct task_struct *curr,
 static inline void sched_info_dequeue(struct rq *rq, struct task_struct *t)
 {
 	unsigned long long delta = 0;
+	/*
+	 * If a task is blocked (blocked donor, delayed dequeue task),
+	 * do not account the queued time as runnable. A task that is
+	 * blocking would have already cleared the "last_queued"
+	 * indicator from sched_info_arrive() when it got a chance to
+	 * run on the CPU.
+	 */
+	if (t->is_blocked)
+		t->sched_info.last_queued = 0;
 
 	if (!t->sched_info.last_queued)
 		return;
@@ -290,7 +299,23 @@ static void sched_info_arrive(struct rq *rq, struct task_struct *t)
  */
 static inline void sched_info_enqueue(struct rq *rq, struct task_struct *t)
 {
-	if (!t->sched_info.last_queued)
+	/*
+	 * "t->is_blocked" is only cleared after the enqueue is done and
+	 * the task is woken up. If the task is blocked, update the
+	 * "last_queued" timestamp to that of last enqueue - if the task
+	 * is still blocked while it leaves the runqueue, this timestamp
+	 * is ignored and is cleared at sched_info_dequeue().
+	 *
+	 * To transition a task back to blocked after wakeup, it has to
+	 * run on the CPU and naturally reach a safe preemption point.
+	 * sched_info_arrive() will do the correct wait time accounting
+	 * based on the last "last_queued".
+	 *
+	 * Any movement of task after being marked not blocked will be
+	 * correctly captured as queued time at enqueue + dequeue
+	 * boundaries when "t->is_blocked" cleared.
+	 */
+	if (!t->sched_info.last_queued || t->is_blocked)
 		t->sched_info.last_queued = rq_clock(rq);
 }
 
-- 
2.43.7

