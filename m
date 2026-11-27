Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778009;
	b=uwd1sYBwePt071ze2AWtdbTLwwvQHAwzgATobW2KLflpR0sys6RipsABz2M4BnlsHtyc
	 ef47Noqlj4XJx8hDcsAz0XlR+wlB+rZ7DqPkaxwzfeLTazOZgRKUP3E31bW/+Wx7wAJL0
	 C+QO8K3zMd7bu0YHWM7cl17tuQF1vxN7E3TkAqSXte+i+Z9lcnCntXJ3TVMSJweAPPuww
	 fMM8UqNFkcrNKwIJ7V/AZ7s5/tIyKNjVF0invmFOpCgRfWGahoVTZ5JOj2cs2MlG0y/Uu
	 qThBfsusq66yVGnqOkhkGY8EKvxOTuqwMJv7m4QenMJIhKXNi4AMv+g213QuLburGtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778009;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+5tP6rtJ1bB2oQDVa4bA4tO1KZ/GMGbOnN7rSPykNc0=;
	b=oXweP7VnvjNKWlgNRveSx/sG/AAj1vdCzHFenBTqkbIeyBSilhaoroaqLg8sWfrwAVtH
	 yfolSmdALZjazxc3upGIJgxPZhtf3iaUhAg5crdpTURfLEl+q3hx/I/sOIEVrv2ri57js
	 eL2QwXEeIYCdZ9q/mlxINYVrlu3irlRdmYptnzESFtnDO1vjdpYD0arsytTBbEngkvzWN
	 w7dptuuaUxVeGnQJudepOdjUZKzNc25XkTNainqN313AO4pVFyZmnZajDiS+VrVkujVAv
	 zj2z2gR7p4Ptz2JTyN7O8RJ2VQjNN4UfBQGe1yKFxGDeH0ykOGNcqz2ceHFVJWt42jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LNhKcxPt;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8D9606A332
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C8D9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LNhKcxPt
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B6181758;
	Fri, 27 Nov 2026 03:13:25 -0800 (PST)
Received: from e127648.arm.com (unknown [10.57.70.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3BEBD3F632;
	Fri, 27 Nov 2026 03:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795778008; bh=50GZp/cJ5Cs8GjpWot4Updy51zZN9Hi/XUtNHHPkxbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LNhKcxPtNgt/auXW6fgkxM/hp0MEjV7imYp1jyNWJVvagqoWdubMsSX9PLcbLP6lp
	 uKGTyJxBKUmPqL1xRA4OZwvb4wue8YsGTWloR27v0+sP/nt1rDfp0zCGv0tMNiYciz
	 M5lByfLaJJrLy43i47Gg5HCYUPkV2CdKy7TjP3tg=
From: Christian Loehle <christian.loehle@arm.com>
To: mingo@kernel.org,
	peterz@infradead.org,
	vincent.guittot@linaro.org
Cc: qyousef@layalina.io,
	christian.loehle@arm.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	jstultz@google.com,
	kayracizmeci@gmail.com,
	wvw@google.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] sched/uclamp: Always account active clamps on dequeue
Date: Fri, 27 Nov 2026 11:13:15 +0000
Message-Id: <20261127111316.3321502-2-christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127111316.3321502-1-christian.loehle@arm.com>
References: <20261127111316.3321502-1-christian.loehle@arm.com>
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

Enabling sched_uclamp_used does not update all static-key callsites
atomically. An enqueue can observe the key enabled and increment a
task's uclamp buckets while a subsequent dequeue still observes it
disabled and skips the decrement. This leaves stale bucket references
and active bits, which can keep the runqueue clamps elevated after the
task sleeps or migrates.

Replace the static-key check in uclamp_rq_dec() with a check of the
task's effective UCLAMP_MIN active flag. This records whether the task
contributed to the runqueue accounting, so an accounted task releases
its references regardless of static-key update progress.

Enqueue and dequeue update both effective clamps under rq->lock.
Updates to an already active clamp complete their decrement and
increment under the same lock, so dequeue cannot observe their
temporary inactive state. At entry to uclamp_rq_dec(), either active
flag therefore suffices to determine whether the task has accounting
to release.

Keep the static key on enqueue, so unused uclamp still skips enqueue
accounting. On dequeue, the early active check returns before the
scheduling-class and delayed-task checks or either per-ID helper call.
Limiting the change to dequeue retains the enqueue benefit of the
static key and reduces the unused dequeue path to an active-state
check.

Drop the redundant active check in uclamp_rq_dec_id(), now done by callers.

Reported-by: Wei Wang <wvw@google.com>
Closes: https://lore.kernel.org/all/CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com/
Suggested-by: Wei Wang <wvw@google.com>
Fixes: 46609ce22703 ("sched/uclamp: Protect uclamp fast path code with static key")
Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 kernel/sched/core.c | 39 ++++++---------------------------------
 1 file changed, 6 insertions(+), 33 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c9890ed35df7..fadad7d3f3a2 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1617,8 +1617,7 @@ static struct uclamp_se uclamp_default[UCLAMP_CNT];
 
 /*
  * This static key is used to reduce the uclamp overhead in the fast path. It
- * primarily disables the call to uclamp_rq_{inc, dec}() in
- * enqueue/dequeue_task().
+ * disables uclamp_rq_inc() accounting in enqueue_task().
  *
  * This allows users to continue to enable uclamp in their kernel config with
  * minimum uclamp overhead in the fast path.
@@ -1830,32 +1829,6 @@ static inline void uclamp_rq_dec_id(struct rq *rq, struct task_struct *p,
 
 	lockdep_assert_rq_held(rq);
 
-	/*
-	 * If sched_uclamp_used was enabled after task @p was enqueued,
-	 * we could end up with unbalanced call to uclamp_rq_dec_id().
-	 *
-	 * In this case the uc_se->active flag should be false since no uclamp
-	 * accounting was performed at enqueue time and we can just return
-	 * here.
-	 *
-	 * Need to be careful of the following enqueue/dequeue ordering
-	 * problem too
-	 *
-	 *	enqueue(taskA)
-	 *	// sched_uclamp_used gets enabled
-	 *	enqueue(taskB)
-	 *	dequeue(taskA)
-	 *	// Must not decrement bucket->tasks here
-	 *	dequeue(taskB)
-	 *
-	 * where we could end up with stale data in uc_se and
-	 * bucket[uc_se->bucket_id].
-	 *
-	 * The following check here eliminates the possibility of such race.
-	 */
-	if (unlikely(!uc_se->active))
-		return;
-
 	bucket = &uc_rq->bucket[uc_se->bucket_id];
 
 	WARN_ON_ONCE(!bucket->tasks);
@@ -1918,12 +1891,12 @@ static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
 	enum uclamp_id clamp_id;
 
 	/*
-	 * Avoid any overhead until uclamp is actually used by the userspace.
-	 *
-	 * The condition is constructed such that a NOP is generated when
-	 * sched_uclamp_used is disabled.
+	 * Static-key updates are not atomic across callsites. An enqueue may
+	 * have accounted this task before this callsite observes the key enabled.
+	 * Check the task's accounting state instead. Both clamps are updated
+	 * under the rq lock, so either active flag is sufficient here.
 	 */
-	if (!uclamp_is_used())
+	if (!p->uclamp[UCLAMP_MIN].active)
 		return;
 
 	if (unlikely(!p->sched_class->uclamp_enabled))
-- 
2.34.1

