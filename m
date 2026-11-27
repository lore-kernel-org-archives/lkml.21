Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795767490;
	b=O9L0gp44DmD+/5AUErFiTjfReSUVRAIq+g3SzUBwuDHx1GcJMkVex8xgZRdfyWeeCls0
	 mJOBLenTxn9P2mlxAX8SJzMMHkZBo9PLmvYS5eeTmK+FdWdFvXOG55nI66QjpaIlb2Nu1
	 E0K6cFqnyXb8Ey7Lne1J16tB1NFsw89lvmxMMvCYDbstmC1d2vswOIIhragw84mHwpPVQ
	 6gcjd7keAilyAylBz9r1boHbYvYsOAM9nttf+pnR4+s/M2tcgC3doVDWskxt67NupG4Dq
	 lvTTc+c1DFWi0sWqzEAjNpfAN0rE0zsTLYhezRZp31dKzAORAQDuA2R3cWGeRRm//og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795767490;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3P8dlx6RUw3egBBHkTAgLo306SxeNmauR7/fOiIjX38=;
	b=YqzzNhqWc5KAwKSCLXigLYdyrT538/iH+I4O1JlGTK8K0epGWBDsiE4TCx1wukfYuoZh
	 U2ZlOY1VGvjo24phSXJOI4QFG7vCceof68nXfAtsksHKTnvqM9eJegtLiqLbPKApI7Tnj
	 mh/SkSsAIfCdnWoAKKo1w1CII774nlXVIPxZoqlur9316mBH6EPrz2OSzbFPpv5lkQCjh
	 XySxH9XYchRmlBnq67s8dqzaQRC7AwgJpjV45Ni76tQIGYmNm0MQ4UcHOTSiVEEJxvs8d
	 Y2EAKZt81VY3vhYwI/YHGrj393pgQr37uRgOUCjiDJ0M75LXB0HjbwpHzTQ2IrAKYuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cJYHwuYk;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2050606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2050606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cJYHwuYk
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63B161E4D;
	Fri, 27 Nov 2026 00:18:06 -0800 (PST)
Received: from e127648.arm.com (unknown [10.57.70.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A07863F86C;
	Fri, 27 Nov 2026 00:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795767489; bh=ve38NyfFYP+82VX6doaeLkgUGf3FCNhBgYUKaQhXk9o=;
	h=From:To:Cc:Subject:Date:From;
	b=cJYHwuYk224eX1W81WDTMaIe/zXMGJI3fkCDbxVmvasNJiQ2jhMndEY04SFCWDEt+
	 pf4OaOJUlWev11fg7NQ13pBNhCa6ELUDcRqsJrsWO5CPm1NUkSi7FDgLy9rMle1Pjw
	 5/3dcpQfiJoi2JwWw+6ZLbyMne4BE7NVGSsdnvDg=
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
Date: Fri, 27 Nov 2026 08:16:54 +0000
Message-Id: <20261127081655.3159258-2-christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
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

Reported-by: Wei Wang <wvw@google.com>
Closes: https://lore.kernel.org/all/CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com/
Suggested-by: Wei Wang <wvw@google.com>
Fixes: 46609ce22703 ("sched/uclamp: Protect uclamp fast path code with static key")
Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 kernel/sched/core.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c9890ed35df7..05b092147c6f 100644
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
@@ -1918,12 +1917,12 @@ static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
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

