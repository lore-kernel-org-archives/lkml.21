Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982652;
	b=aG0RUrmpMGWFyohYSf62SihY/ZRadd9M+Z7zAUnejby65bksGvyltkAS62VIixxzIbqF
	 IQDyYn1EBGR/mCpFOg9reUkZzb6OGBJCMgjO9e8AfpSrZ+Zvh0LMdGVwYLVwki9l8RmFK
	 Bx/MB4rXOXh/yIGM3xFM6BAAFvorFWCpX1Ansfa6wtNmd0BAKmJ5l2WTq4uW2I3fnLAph
	 ct89NFbyshngj6R8bQGfpvJpWcTCkstxcenuhq/PjmTeg4aFUWmGPrgM1V9PFF4QZqlLY
	 b7tSiROfdinHp8VHnk1Ox5U5LiFMSztoA9S88mBX0hGj1QpDmUYibO9ljGXCeVhItsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982652;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/6E6EWPmB6dLJDBOnn3wrvadZ55eZzkgnB2dErotCA0=;
	b=PdX++jDhP1URpyBJOGCfGhgOZt1IC/ei3e8x/hPlYQuMyO/PmKPGQ/ONcugSd7n/jy/d
	 bTncyXQoOjroFURHTq581CGN98K0xKKajBYSdZbNrvooBjhQQGgb5+xz/mwQv71C4scHl
	 ZXrH1nzwsnYldZRKlhP6UAlSaiITtjDH8OLirpwhKoJa9eRWMjytxdUnVMK2wdN7YI/Nu
	 fE54RpvEewmicWDl6d6yfIgpH1kuPVPO+L8H9mjqeKBI28JERJHDGKiqNeVZXiZ6GJU28
	 3GUQ0uRAYWJr5wFhiquijMmtyjPLEviIKwlUgcVfaR1zrL746UFkenc2kPA9cZLaV5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.124
Received: from out28-124.mail.aliyun.com (out28-124.mail.aliyun.com [115.124.28.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8353606A335
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8353606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.0748736|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_enroll_verification|0.0154472-2.97058e-05-0.984523;FP=13494324110916486646|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033032065030;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.k4eF9PO_1794982645;
Received: from localhost.localdomain(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.k4eF9PO_1794982645 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 18 Nov 2026 14:17:26 +0800
From: Li kunyu <likunyu@open-hieco.net>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org,
	Li kunyu <likunyu@open-hieco.net>
Subject: [PATCH 1/2] sched/fair: Convert rq_lock_irqsave() to guard()/scoped_guard()
Date: Wed, 18 Nov 2026 14:17:11 +0800
Message-ID: <20261118061712.14503-1-likunyu@open-hieco.net>
X-Mailer: git-send-email 2.47.3
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

Convert three straightforward rq_lock_irqsave()/rq_unlock_irqrestore()
pairs in fair.c to the modern guard()/scoped_guard() helpers. This
removes the now-unnecessary struct rq_flags variables and makes the
locking scope explicit in the code structure.

sched_balance_rq() is deliberately left unchanged: it releases the rq
lock before restoring IRQs so that attach_tasks() runs without the
busiest rq lock held but with interrupts disabled. A scoped guard
would fold both steps into a single unlock_irqrestore() and change
that semantics.

Signed-off-by: Li kunyu <likunyu@open-hieco.net>
---
 kernel/sched/fair.c | 49 +++++++++++++++++++--------------------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0c8af1cac2d5..1e128214f2e9 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -14747,11 +14747,9 @@ static void _nohz_idle_balance(struct rq *this_rq, unsigned int flags)
 		 * do the balance.
 		 */
 		if (time_after_eq(jiffies, rq->next_balance)) {
-			struct rq_flags rf;
-
-			rq_lock_irqsave(rq, &rf);
-			update_rq_clock(rq);
-			rq_unlock_irqrestore(rq, &rf);
+			scoped_guard (rq_lock_irqsave, rq) {
+				update_rq_clock(rq);
+			}
 
 			if (flags & NOHZ_BALANCE_KICK)
 				sched_balance_domains(rq, CPU_IDLE);
@@ -15764,16 +15762,14 @@ static int __sched_group_set_shares(struct task_group *tg, unsigned long shares)
 	for_each_possible_cpu(i) {
 		struct rq *rq = cpu_rq(i);
 		struct sched_entity *se = tg_se(tg, i);
-		struct rq_flags rf;
 
 		/* Propagate contribution to hierarchy */
-		rq_lock_irqsave(rq, &rf);
+		guard(rq_lock_irqsave)(rq);
 		update_rq_clock(rq);
 		for_each_sched_entity(se) {
 			update_load_avg(cfs_rq_of(se), se, UPDATE_TG);
 			update_cfs_group(se);
 		}
-		rq_unlock_irqrestore(rq, &rf);
 	}
 
 	return 0;
@@ -15818,34 +15814,31 @@ int sched_group_set_idle(struct task_group *tg, long idle)
 		struct cfs_rq *grp_cfs_rq = tg_cfs_rq(tg, i);
 		bool was_idle = cfs_rq_is_idle(grp_cfs_rq);
 		long idle_task_delta;
-		struct rq_flags rf;
 
-		rq_lock_irqsave(rq, &rf);
+		scoped_guard (rq_lock_irqsave, rq) {
 
-		grp_cfs_rq->idle = idle;
-		if (WARN_ON_ONCE(was_idle == cfs_rq_is_idle(grp_cfs_rq)))
-			goto next_cpu;
+			grp_cfs_rq->idle = idle;
+			if (WARN_ON_ONCE(was_idle == cfs_rq_is_idle(grp_cfs_rq)))
+				continue;
 
-		idle_task_delta = grp_cfs_rq->h_nr_queued -
-				  grp_cfs_rq->h_nr_idle;
-		if (!cfs_rq_is_idle(grp_cfs_rq))
-			idle_task_delta *= -1;
+			idle_task_delta = grp_cfs_rq->h_nr_queued -
+					  grp_cfs_rq->h_nr_idle;
+			if (!cfs_rq_is_idle(grp_cfs_rq))
+				idle_task_delta *= -1;
 
-		for_each_sched_entity(se) {
-			struct cfs_rq *cfs_rq = cfs_rq_of(se);
+			for_each_sched_entity(se) {
+				struct cfs_rq *cfs_rq = cfs_rq_of(se);
 
-			if (!se->on_rq)
-				break;
+				if (!se->on_rq)
+					break;
 
-			cfs_rq->h_nr_idle += idle_task_delta;
+				cfs_rq->h_nr_idle += idle_task_delta;
 
-			/* Already accounted at parent level and above. */
-			if (cfs_rq_is_idle(cfs_rq))
-				break;
+				/* Already accounted at parent level and above. */
+				if (cfs_rq_is_idle(cfs_rq))
+					break;
+			}
 		}
-
-next_cpu:
-		rq_unlock_irqrestore(rq, &rf);
 	}
 
 	/* Idle groups have minimum weight. */
-- 
2.47.3

