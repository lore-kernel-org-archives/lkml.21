Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049857;
	b=wgMCvAgw715DedK5eyu8+8m2Z5JCMugNsnSjT+3uUT4slZpBFQlQayPItWbjtCo9ZdeJ
	 j9P6FzJuHaWl5wLmSvE9j/kC07v//GGSFHD1eYY3Z+QDUTu57netBsOSil+TlESiHIl8D
	 UTVVHpGuntsPi0YB+SG/cERFQ+5PQ3qb+4yroRJ6BftTzU8BUeSAPL0Is6CAXbrHZJQlP
	 IiAmsQIeStRHPjYYKdLoKdhXKzkzNBniWbBNNGaXTFXIItStGQpTasj9bSlkqGOo3PcPQ
	 A9uR+5j5zg8Vy3ddstTn+9NifCzQJr9qwceGhEjfKIufcweYIvf4GUDQw/N3vI/fjLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049857;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=A0TCntnSl3K0GQL2XqtiJXmFQci7UTkli3gvoCkqfD0=;
	b=Js0u6Syp/A31yJqSsxjWt8yYfR4+kiW3nUjbivk/4elymHpZ83i/q1CRNiYIFpbW26EH
	 X6aTSqMUL8sQ0NVVwYRRP3bcLVgWZ8XAd/n9gXGh6j/1oK0Nv+IYLOb+2XR+Bq8ptF40v
	 Ta0xjKzTWJb01ZQzdMuTH7C6XwUwG94fnk+zLRi0tB+Jy7w5PAsRyIWaUoMUzJlNKk9Vg
	 oBRPNmgRR7DPCSSpZQFDI8waGmDmjpKcRxPhSFp/aFuzVJ2KXZLJbSMOenu0sMLw5ZqLC
	 Bf+PD8aHONNsINyNwMR73USgAe1/HMh62OZOZpWDn36exY/rlxI9cgklEMk8W3BJPkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CsAd3xDz;
	arc=none smtp.remote-ip=91.218.175.165
Received: from mta0.migadu.com (out-165.mta0.migadu.com [91.218.175.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BD5606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0BD5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CsAd3xDz
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=S/GBl6dIyjbn1QH1ueSXEvipEf/jDrZzt9ip8cfi6RY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795049854; v=1; x=1795654654;
 b=CsAd3xDzzHJMdFlrQSk4ayqEr5GDl0GgNJQ0rrr62v8i465xjtdsR1vtFR6PfQMfnpCQGhpR
 qn2yKQv6iQU+EqJv3Iy4LOTiFoFE3shW9fkhnhz1mpoh4rvdgIEXW1RgzH8UhzjOXkz6KMPuk37
 d8cdHpZceTM+j4TQxMdYipMs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 84d221882f027471;
	Thu, 19 Nov 2026 00:57:34 +0000
X-Mizu-Trace-ID: 84d221882f027471
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Wed, 18 Nov 2026 19:57:21 -0500
Subject: [PATCH v2 1/3] sched: Tell rq_online() and rq_offline() whether
 the CPU changes state
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-bug-sched-fair-offline-active-v2-1-b6ede596c6a6@linux.dev>
References: <20261118-bug-sched-fair-offline-active-v2-0-b6ede596c6a6@linux.dev>
In-Reply-To: <20261118-bug-sched-fair-offline-active-v2-0-b6ede596c6a6@linux.dev>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

set_rq_online() and set_rq_offline() run both when a CPU comes up or
goes down and when a sched domain rebuild moves an active CPU to a new
root domain through rq_attach_root(). The class callbacks get the same
call in both cases.

Work such as resyncing CFS bandwidth state or unthrottling cfs_rqs is
only needed when the CPU actually changes state, but the callbacks have
no way to tell, so they repeat it for every active CPU on each rebuild.

Pass a hotplug argument down to the callbacks, and have
sched_set_rq_online() and sched_set_rq_offline() pass true.
rq_attach_root() passes false when taking a CPU offline, as
sched_cpu_deactivate() has already taken a CPU going down offline
before the rebuild. When putting a CPU online it passes true only if
the CPU was not online in its old root domain: sched_cpu_activate()
rebuilds the domains before calling sched_set_rq_online(), so this is
where a CPU coming up first goes online.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 kernel/sched/core.c     | 12 ++++++------
 kernel/sched/deadline.c |  4 ++--
 kernel/sched/fair.c     |  4 ++--
 kernel/sched/rt.c       |  4 ++--
 kernel/sched/sched.h    |  8 ++++----
 kernel/sched/topology.c | 13 ++++++++++---
 6 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 8b4e4a6f4ae02..17ceb9d5046ba 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8542,7 +8542,7 @@ static inline void balance_hotplug_wait(void)
 
 #endif /* !CONFIG_HOTPLUG_CPU */
 
-void set_rq_online(struct rq *rq)
+void set_rq_online(struct rq *rq, bool hotplug)
 {
 	if (!rq->online) {
 		const struct sched_class *class;
@@ -8554,12 +8554,12 @@ void set_rq_online(struct rq *rq)
 
 		for_each_class(class) {
 			if (class->rq_online)
-				class->rq_online(rq);
+				class->rq_online(rq, hotplug);
 		}
 	}
 }
 
-void set_rq_offline(struct rq *rq)
+void set_rq_offline(struct rq *rq, bool hotplug)
 {
 	if (rq->online) {
 		struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
@@ -8568,7 +8568,7 @@ void set_rq_offline(struct rq *rq)
 		update_rq_clock(rq);
 		for_each_class(class) {
 			if (class->rq_offline)
-				class->rq_offline(rq);
+				class->rq_offline(rq, hotplug);
 		}
 
 		cpumask_clear_cpu(rq->cpu, rd->online);
@@ -8585,7 +8585,7 @@ static inline void sched_set_rq_online(struct rq *rq, int cpu)
 	rd = rcu_dereference_root_domain(rq->rd);
 	if (rd) {
 		BUG_ON(!cpumask_test_cpu(cpu, rd->span));
-		set_rq_online(rq);
+		set_rq_online(rq, true);
 	}
 	rq_unlock_irqrestore(rq, &rf);
 }
@@ -8599,7 +8599,7 @@ static inline void sched_set_rq_offline(struct rq *rq, int cpu)
 	rd = rcu_dereference_root_domain(rq->rd);
 	if (rd) {
 		BUG_ON(!cpumask_test_cpu(cpu, rd->span));
-		set_rq_offline(rq);
+		set_rq_offline(rq, true);
 	}
 	rq_unlock_irqrestore(rq, &rf);
 }
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 61b6a6d781715..73f509b87b8fa 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3366,7 +3366,7 @@ bool dl_task_needs_bw_move(struct task_struct *p,
 }
 
 /* Assumes rq->lock is held */
-static void rq_online_dl(struct rq *rq)
+static void rq_online_dl(struct rq *rq, bool hotplug)
 {
 	if (rq->dl.overloaded)
 		dl_set_overload(rq);
@@ -3379,7 +3379,7 @@ static void rq_online_dl(struct rq *rq)
 }
 
 /* Assumes rq->lock is held */
-static void rq_offline_dl(struct rq *rq)
+static void rq_offline_dl(struct rq *rq, bool hotplug)
 {
 	if (rq->dl.overloaded)
 		dl_clear_overload(rq);
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 731d78155e654..db9ab8ce36500 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15082,14 +15082,14 @@ void sched_balance_trigger(struct rq *rq)
 	nohz_balancer_kick(rq);
 }
 
-static void rq_online_fair(struct rq *rq)
+static void rq_online_fair(struct rq *rq, bool hotplug)
 {
 	update_sysctl();
 
 	update_runtime_enabled(rq);
 }
 
-static void rq_offline_fair(struct rq *rq)
+static void rq_offline_fair(struct rq *rq, bool hotplug)
 {
 	update_sysctl();
 
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 81a71aa5f094a..fc6224a343552 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2398,7 +2398,7 @@ static void task_woken_rt(struct rq *rq, struct task_struct *p)
 }
 
 /* Assumes rq->lock is held */
-static void rq_online_rt(struct rq *rq)
+static void rq_online_rt(struct rq *rq, bool hotplug)
 {
 	if (rq->rt.overloaded)
 		rt_set_overload(rq);
@@ -2409,7 +2409,7 @@ static void rq_online_rt(struct rq *rq)
 }
 
 /* Assumes rq->lock is held */
-static void rq_offline_rt(struct rq *rq)
+static void rq_offline_rt(struct rq *rq, bool hotplug)
 {
 	if (rq->rt.overloaded)
 		rt_clear_overload(rq);
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e957524c3ee52..5f7b6ab4dde6d 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2796,8 +2796,8 @@ struct sched_class {
 	/*
 	 * sched_set_rq_{on,off}line: rq->lock
 	 */
-	void (*rq_online)(struct rq *rq);
-	void (*rq_offline)(struct rq *rq);
+	void (*rq_online)(struct rq *rq, bool hotplug);
+	void (*rq_offline)(struct rq *rq, bool hotplug);
 
 	/*
 	 * push_cpu_stop: p->pi_lock && rq->lock
@@ -3526,8 +3526,8 @@ static inline void double_rq_unlock(struct rq *rq1, struct rq *rq2)
 	raw_spin_rq_unlock(rq1);
 }
 
-extern void set_rq_online (struct rq *rq);
-extern void set_rq_offline(struct rq *rq);
+extern void set_rq_online(struct rq *rq, bool hotplug);
+extern void set_rq_offline(struct rq *rq, bool hotplug);
 
 extern bool sched_smp_initialized;
 
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 99878da03bce7..577dc012e5ac5 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -488,14 +488,16 @@ static void free_rootdomain(struct rcu_head *rcu)
 void rq_attach_root(struct rq *rq, struct root_domain *rd)
 {
 	struct root_domain *old_rd = NULL;
+	bool was_online = false;
 	struct rq_flags rf;
 
 	rq_lock_irqsave(rq, &rf);
 
 	old_rd = rcu_dereference_root_domain(rq->rd);
 	if (old_rd) {
-		if (cpumask_test_cpu(rq->cpu, old_rd->online))
-			set_rq_offline(rq);
+		was_online = cpumask_test_cpu(rq->cpu, old_rd->online);
+		if (was_online)
+			set_rq_offline(rq, false);
 
 		cpumask_clear_cpu(rq->cpu, old_rd->span);
 
@@ -512,8 +514,13 @@ void rq_attach_root(struct rq *rq, struct root_domain *rd)
 	rcu_assign_pointer(rq->rd, rd);
 
 	cpumask_set_cpu(rq->cpu, rd->span);
+	/*
+	 * A CPU that comes up is first put online here, by the sched domain
+	 * rebuild of sched_cpu_activate(). Any other CPU only moves between
+	 * root domains.
+	 */
 	if (cpumask_test_cpu(rq->cpu, cpu_active_mask))
-		set_rq_online(rq);
+		set_rq_online(rq, !was_online);
 
 	/*
 	 * Because the rq is not a task, dl_add_task_root_domain() did not

-- 
2.43.0

