Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795461742;
	b=s8R6pSxLlhSp1xgfFwo6FJV+6vX0TL9afdynYxXOqqjEW71K4uNCosWevBECbV8b3Dct
	 xBQbHFL8jSjtY/E7msbrErRYExBOI5IPBcTqAmzhsRBtQG5+RZeasY/kyOvNiA3eBXyjO
	 fhmnsfuUNLUyhReKzoGiREIxFrWFzwP7/XpiR8Ll2DRXfGkDRRG28CIHYmDfxHD2CIkWb
	 yFNBHATQ0sxVFyeeX+2LZn21CnHUMfpNyQDmaRG8jP00A9p1+RL+81obPxVxzHTEinEGw
	 TCWlgl5x8LJcgvbw0bZ+rRwDpenIr/xUPymVhW3hOeK9w/D+RtkfXx0J4CZoE5ZYrjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461742;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=AyL+KMh6DD33kI+Y41G7RzMfbQwYAGuOCoDwtZ9/VBE=;
	b=hIYS79eKg/jvYeHcKK5VxOJEWe0THzA717DXZQDKjm9moCGbyAupMKlBu9z5nimZ0hq9
	 hRshwpkf4/nM6ylbh2zGyueCxHmfy0BFcHKYYBM8Zw3UiefTL9oQUWVJv0MshDfqtHpoE
	 t1g+4wdUASHeJ4FTyXymizyHHv4eMoHL6UuPedQ4R3JH3JCnDfR+eJHtsvPBoCKrn0gzo
	 1LViBWKaOXHoriSUMP01XYVa/ZHzfc/oJPwNwVK4ibuvAjdSMgixvb7T2Hhlsad4ehyLw
	 JdHVtaMSezQ4Mt1mBUlBlb8F9CzBA8TuH8QySd3e115z8685oAnI9YGromzpmj0+mFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c6c+As3p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04B4606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c6c+As3p
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795461742;
	b=yYDjWQnW8WN1uyjxNqBR674mFWlIaq0De5lh2V8HVo9mdPwlB1BS54sey2FIwGOc5PJE
	 Mh9SI0qYDirPE2cLJiTejjh+M8m+OtBKksIXCu0S0QsJltMmsfNDhSfQmQC/mvXh4Asxb
	 qyadPlZLaRE31Z+xSn8sV53a7/gpxd31WcNWTZvtSNJiu8whttZe0VIMW/EnDmOIyLVbh
	 LOsMCVN+cicDFXGOoscgV5HJud2ngnPklJ4xbykXylPyQGQLljqr7nEiA7rTDt+N+5jKw
	 KfJ219nmHIlANM+ub1gNX0M7FWo0typUDyg1A1QqA87rXUy7jdpNkAygwJvXTrphFdQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795461742;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=AyL+KMh6DD33kI+Y41G7RzMfbQwYAGuOCoDwtZ9/VBE=;
	b=cSH1zPJLv10vrLrvLunmf/Syu5if0cLDh4GvxZZL03i/NObfHFyDxzToST+2uxpJxIWm
	 EhG5Myo5sHlSWiGGxMK3FRCLpaXWu1uiU4Kj5XywOp6eNOc+BcdluHdKWf74lT9uKE5sn
	 LWVdvCCS3wo0RBSjjAVXNglG1fBYLzlNGYb1Mca9lqEow02LgyKJ60zatsVPLBdVTCZBE
	 UjBakal9e/0HeIGbRL4SQhV9iy8OqdlVVGE17B05kWJBNv2fopBiN9QCO0csNORh6Cc3/
	 hhO8U9wEft7PRXbZurK5h0mIi89eMHUMV5fDVlVFq0YKiTOHN8vpuczaKRnITyw67GQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A4C91F000D2;
	Mon, 23 Nov 2026 19:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795461742;
	bh=AyL+KMh6DD33kI+Y41G7RzMfbQwYAGuOCoDwtZ9/VBE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=c6c+As3pYkf61WB1sF1LQlvjI6blT3xLtMqdJh3dcgy/pVpL7zuF7ddMJaVF6ZXnk
	 /qWBE7XM5/ZVy2zv+oy33prT06N4JP4xvqNI2W2O9Mc2GNdENnvOrVn1HXDN+mWqzx
	 mHO9W/VyAcqr+N0mpPB0WFoXz7nEIegoCJpV4sqnuKioZDlStkB/PR3hxV9GVdpGci
	 d3YlzDkRqB4N9J1fp6b/pLUUSmtNo93bcYb/9yy9+8R9vKxELx+vVtEEKl8MEMKV1F
	 438Aq7Bu/e6g6ZdVfiImREMshqcHENzyyW9R0wK4hmdanyLauvtF3xjBxrRO3I9PrE
	 wGSiwxFIcAA/w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C70E54C63D;
	Mon, 23 Nov 2026 19:22:10 +0000 (UTC)
From: Josh Lafleur via B4 Relay <devnull+josh.lafleur.outlook.com@kernel.org>
Date: Mon, 23 Nov 2026 11:21:43 -0800
Subject: [PATCH 1/2] sched/rt: Allow queued stopper targets past the
 pushable-head check
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-migrate-on-ipi-v1-1-eacfe7e4b808@outlook.com>
References: <20261123-migrate-on-ipi-v1-0-eacfe7e4b808@outlook.com>
In-Reply-To: <20261123-migrate-on-ipi-v1-0-eacfe7e4b808@outlook.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 Gauri Patwardhan <gauri.patwardhan@nutanix.com>, 
 Phil Auld <pauld@redhat.com>, Harshit Agarwal <harshit@nutanix.com>, 
 Jon Kohler <jon@nutanix.com>, Seiji Nishikawa <snishika@redhat.com>
Cc: Rahul Chunduru <rahul.chunduru@nutanix.com>, 
 linux-kernel@vger.kernel.org, 
 "Josh Lafleur (Zipline)" <josh.lafleur@outlook.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795461730; l=2708;
 i=josh.lafleur@outlook.com; s=20260930; h=from:subject:message-id;
 bh=o4GzxLYqqTV3IeOkvWTrIx4wPgWzaqGktUyZ0rosvB8=;
 b=F7U76h1hy9eXYv5ekR6RwyYyecYwEn7/TSFjYsIfG3AIoeP1vWcvQZmmTUO6sMmuxcHGoHYJ9
 fD7ipgBdECoDNS1NCHjwELfyxCVSwWyzn/Bw5kG80/HmMxdIMfoaqpw
X-Developer-Key: i=josh.lafleur@outlook.com; a=ed25519;
 pk=slf3cskRg11vRnFROP6D9bMBKyvvRNsP2Msvm4/qpmM=
X-Endpoint-Received: by B4 Relay for josh.lafleur@outlook.com/20260930 with
 auth_id=1090
X-Original-From: "Josh Lafleur (Zipline)" <josh.lafleur@outlook.com>
Reply-To: josh.lafleur@outlook.com
Content-Transfer-Encoding: 7bit

From: "Josh Lafleur (Zipline)" <josh.lafleur@outlook.com>

Commit a7c81556ec4d ("sched: Fix migrate_disable() vs rt/dl
balancing") added a stopper push when RT balancing cannot push a
migrate-disabled task which moves the running task so the pinned
task can run locally. The PUSH_IPI path can request the same fallback
when it selects a pinned push candidate.

Commit 690e47d1403e ("sched/rt: Fix race in push_rt_task") added a
pushable-head check after find_lock_lowest_rq() drops and reacquires
the source rq lock. That check protects ordinary pushes, but can
reject a queued stopper target when another task remains ahead of it
in the pushable list. The stopper then gives up without moving the
task. Since we know in the stopper push case the rq is actively
owning the last running task and the rq is push_busy, we can be
confident that it will not be migrated between the push_rt_task()
and subsequent stopper handler.

Allow a queued stopper target that is still on the source rq to pass
the head comparison. Keep the migration-disable and affinity checks,
and retain the head comparison for ordinary pushes. This also makes
the PUSH_IPI fallback usable when pinned candidates are selected by
the following patch.

Fixes: 690e47d1403e ("sched/rt: Fix race in push_rt_task")
---
 kernel/sched/rt.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 1535046a23ffa..54a6533cffe07 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1923,19 +1923,26 @@ static struct rq *find_lock_lowest_rq(struct task_struct *task, struct rq *rq)
 
 		/* if the prio of this runqueue changed, try again */
 		if (double_lock_balance(rq, lowest_rq)) {
+			bool stopper_push = rq->push_busy &&
+					    (rq->curr == rq->stop) &&
+					    (task_rq(task) == rq) &&
+					    task_on_rq_queued(task);
+
 			/*
 			 * We had to unlock the run queue. In
 			 * the mean time, task could have
 			 * migrated already or had its affinity changed,
 			 * therefore check if the task is still at the
-			 * head of the pushable tasks list.
+			 * head of the pushable tasks list. A queued stopper
+			 * target need not be at the head of that list.
 			 * It is possible the task was scheduled, set
 			 * "migrate_disabled" and then got preempted, so we must
 			 * check the task migration disable flag here too.
 			 */
 			if (unlikely(is_migration_disabled(task) ||
 				     !cpumask_test_cpu(lowest_rq->cpu, &task->cpus_mask) ||
-				     task != pick_next_pushable_task(rq))) {
+				     (task != pick_next_pushable_task(rq) &&
+				      !stopper_push))) {
 
 				double_unlock_balance(rq, lowest_rq);
 				lowest_rq = NULL;

-- 
2.53.0


