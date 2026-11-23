Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795461742;
	b=ar0Ep96E8PibZ0rDzBhKvK9dKR7MAPHPT1nQRRMkdRSN1dmjZc8nuIH+y/Sjgg9vDKRM
	 22e0FRjuLu6RckbZPKRYK6s7ecxMKtqh/YhP9Wp3wtjVeEoHODgSq4XPxAkh6IO2qiKXB
	 kzqmbiGnAn9UKqodom6kdITKGC7qcY3Lukz2RWyt240bfTBQhO3E8fE/jU7r3uKsxAhqo
	 ysvFlZda+vhCwHA1NuYSsjQ0uyRbUp5lElSa58SH0N1d0ZcT7sybJSOxY/dKzDeP+buig
	 IIffVO4e18d3q2EWVhSNRMd5KWSslnpm2aglotzvMEyqVMr0r69zZCr+0X/46aRb3KA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461742;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YP1x0WrWzySnHtf2OzJF4ttWfMfqI0KRxFqhQF+Vqn8=;
	b=ISu6k+wRafI6Yiue4WtRGZizYJJzQ+02SSXuIrzbE1n3LKbDEgHObgDYBf/mfSYk319n
	 SFwItWBqvIp7gJL024O6mQu8UTD4VFqsB3wvpufuxFPkYw29aRg4r9QXHsc06igVwP5Th
	 Zim7ql/GoNVzdSras1dMn9tk+Hk7vG9KYTxYNHeHJxmRmzBHlw33t8Ch+RiskJ1zgKGGS
	 MRFm2Tc6OT4tK52F+ILqPSZUYTCJ+VSESDKzIZyTgzRBMRxVGwHZMG6ZRA2X3o1oxoEaC
	 4MUqS++A3W7VbeHib5+aD9d/vPSp8yJ7H/NTEmuuaysl2VSJg2ElKIKOxKbkw1raK3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c7J843K3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03BA606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c7J843K3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795461742;
	b=ZjR/OjCh6KeGdY3ZUQZOYwHpSZ99yw0BLAuypcNUShCjC4QWFRAvqclAQO+C3lMxRUb6
	 AXijtNfFf62ILHW1LjsdujfTEKe3nrICLzHt7tbY2nibfv1HbWrwWu29q/Wsb1FZ2653/
	 2+v3PlaZ+2v2pjBEATTo6bzAu9lvnVJfA7KkLp0Tt7/5spfMzzykjAnmLGy1J9T4fgcxJ
	 DqAj44GJi9a3cxfzlS50Frr6z/c6yaHV/ogtjPoOVxymMJy8puCWin/MRMfVecjO0esAY
	 MaGydwnSOCWWmD5p/Kmts9sJzFH/cpb3lUOfs8NjxyAPYRirKJGOD3ViIVNyE78yEng==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795461742;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YP1x0WrWzySnHtf2OzJF4ttWfMfqI0KRxFqhQF+Vqn8=;
	b=2Q++8ROYA1ArfFk36eHK60ADLLzSzfHmuUQ7Nyja/Ujo42MYy9tGk+aDIwYFfLscKNKk
	 LPq+K8KBTqv2xLDEbWdBllPU7Uk5SVgCu1/GVUzv1jh8r89lyNcmVvuH9gfHIG89A4Nud
	 wTFRpTlHWFhaU74t0dkTU1xTBtbDiFfXNpLdemfhNdWlAZmDByvla5fkqE0QIT5kSkdMG
	 0D6wCWYh1KU3udNPwcLZwuGPtboK8d0BY6LwHJ0xmFJ1BjeIdSHFmSo1HrZrwm96HqrsH
	 UJrKdjj8cyjYxDXSX8hZ3fFgzdbVGdHYL2STupu8P740YLi58RP6f3FVw0KaO1UDaCQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 607041F000D3;
	Mon, 23 Nov 2026 19:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795461742;
	bh=YP1x0WrWzySnHtf2OzJF4ttWfMfqI0KRxFqhQF+Vqn8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=c7J843K38u19ZubeWLJbd47d1+Sg83hApzpy8TuDaqn4d4nZcaIgAJvfrnG4Bah98
	 U0zrfZoPHrdzr/Tma7DnFlxfEZRsy0xKMFi6UiteN47xWY7s/P2Pa7a1ZiBEJLy89t
	 2xJxV1cpJUhzZMfAyFZ7urLbvOGC+3ipHJincS9R552wwrFLaBZLofdJZLYk4sENIZ
	 3/GJY3Fdj/ExhTY+WVyMdw7213WBovKEIikrwIeIuQkVASNgUpLlw3fwilYI7J4ztG
	 nrf4WsGnp0HTvYM1oDduJSGvFF0ziKKgooVaUHeAB/nE5OtAOsL5pZovYMV4SumWG4
	 8tYVdqsrilS5w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E43844C65D;
	Mon, 23 Nov 2026 19:22:10 +0000 (UTC)
From: Josh Lafleur via B4 Relay <devnull+josh.lafleur.outlook.com@kernel.org>
Date: Mon, 23 Nov 2026 11:21:44 -0800
Subject: [PATCH 2/2] sched/rt: Restore pinned candidates for PUSH_IPI
 balancing
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
Message-Id: <20261123-migrate-on-ipi-v1-2-eacfe7e4b808@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795461730; l=3070;
 i=josh.lafleur@outlook.com; s=20260930; h=from:subject:message-id;
 bh=xltmhTC4RivVjUMo09gIqOcjEP9mbokiZAZj+95EZ6g=;
 b=0YV6/7c+5cwgzNUPkUGAx13DqJZ7wyn8eIKKFO7PbXP4S4QivJ70H5drE25ME4KwOFRVOccSG
 AC1btqTljKgDrHVaiRajvKgXBEoYu2d78o0PxApzIPRK6+D6ubTRfX0
X-Developer-Key: i=josh.lafleur@outlook.com; a=ed25519;
 pk=slf3cskRg11vRnFROP6D9bMBKyvvRNsP2Msvm4/qpmM=
X-Endpoint-Received: by B4 Relay for josh.lafleur@outlook.com/20260930 with
 auth_id=1090
X-Original-From: "Josh Lafleur (Zipline)" <josh.lafleur@outlook.com>
Reply-To: josh.lafleur@outlook.com
Content-Transfer-Encoding: 7bit

From: "Josh Lafleur (Zipline)" <josh.lafleur@outlook.com>

Commit a7c81556ec4d ("sched: Fix migrate_disable() vs rt/dl
balancing") added a PUSH_IPI fallback for a migrate-disabled RT
candidate. It runs the stopper to move the running task so that the
pinned task can run on its current CPU.

Commit dae5c0292080 ("sched/rt,dl: Skip migrate-disabled tasks when
picking a push candidate") made the RT picker skip pinned candidates.
This avoids futile ordinary pushes, but also prevents the push-IPI
path from reaching that fallback.

Select migrate-disabled candidates on the PUSH_IPI path, while
continuing to skip them on ordinary pushes. An ordinary push can
therefore still reach a movable task behind a pinned one. Use the
same selection mode when retrying after a failed destination search;
the head recheck for ordinary candidates continues to skip pinned
tasks.

The preceding patch allows the stopper target to pass the head
recheck after the source rq lock is reacquired.

Fixes: dae5c0292080 ("sched/rt,dl: Skip migrate-disabled tasks when picking a push candidate")
---
 kernel/sched/rt.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 54a6533cffe07..bb0d125889bd1 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1866,7 +1866,7 @@ static int find_lowest_rq(struct task_struct *task)
 	return -1;
 }
 
-static struct task_struct *pick_next_pushable_task(struct rq *rq)
+static struct task_struct *pick_next_pushable_task(struct rq *rq, bool pull)
 {
 	struct plist_head *head = &rq->rt.pushable_tasks;
 	struct task_struct *i, *p = NULL;
@@ -1875,8 +1875,9 @@ static struct task_struct *pick_next_pushable_task(struct rq *rq)
 		return NULL;
 
 	plist_for_each_entry(i, head, pushable_tasks) {
-		/* skip tasks that cannot be migrated */
-		if (!task_on_cpu(rq, i) && !is_migration_disabled(i)) {
+		/* Only the push-IPI path can push the current task instead. */
+		if (!task_on_cpu(rq, i) &&
+		    (pull || !is_migration_disabled(i))) {
 			p = i;
 			break;
 		}
@@ -1941,7 +1942,7 @@ static struct rq *find_lock_lowest_rq(struct task_struct *task, struct rq *rq)
 			 */
 			if (unlikely(is_migration_disabled(task) ||
 				     !cpumask_test_cpu(lowest_rq->cpu, &task->cpus_mask) ||
-				     (task != pick_next_pushable_task(rq) &&
+				     (task != pick_next_pushable_task(rq, false) &&
 				      !stopper_push))) {
 
 				double_unlock_balance(rq, lowest_rq);
@@ -1976,7 +1977,7 @@ static int push_rt_task(struct rq *rq, bool pull)
 	if (!rq->rt.overloaded)
 		return 0;
 
-	next_task = pick_next_pushable_task(rq);
+	next_task = pick_next_pushable_task(rq, pull);
 	if (!next_task)
 		return 0;
 
@@ -2051,7 +2052,7 @@ static int push_rt_task(struct rq *rq, bool pull)
 		 * run-queue and is also still the next task eligible for
 		 * pushing.
 		 */
-		task = pick_next_pushable_task(rq);
+		task = pick_next_pushable_task(rq, pull);
 		if (task == next_task) {
 			/*
 			 * The task hasn't migrated, and is still the next

-- 
2.53.0


