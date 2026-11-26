Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712149;
	b=gejVrvAdLVb6eGCdj7Ktk7gAAQYuIg0JmQF1dn5C0U4RSpb5zk7TLkeFE8vZr5wv0wgj
	 vtgwai6jodQPl0V0OZJ2AHmy1kEybqFW8WgdIdJyv5rIHKqwcl1GmrPGbdfj8qEU5we8q
	 qqlnyrlQ39drfjnqhT7cJmvok3hho/ZZaenlRONEhtsK/w+kpq9/+E9uZy5dkh2a/uvn8
	 DP6YxaSUTW+etppfXtV38kQie9iDkDDuCiotfDSDJBNDKemdK60MOJKd3JU3af95rXjh6
	 Joh7ViveB6UGTYIdUwDv2MdzM6fT/9XJt3vYjlnRqttmHGDP5zAQ7EgCjTPcFcNg7fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712149;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0rafnJ6ETOXB4I+4JzC7j5xOZDkxdPx41IQxH9sjp+g=;
	b=UnwbauVna2ZYSsajH62cFoXLQImlq//aeFuflRWFfPvDxkryKo08JHMtMBpBwJCyAAh5
	 SZn7GLCe9DdNwGz7uU7OHDm8h5sTAMcoDtuNR57AbAxPvyldA9xmkHfOfKSj+vy+35bFt
	 cvLhE0jAWLrDr0O6AA7TpDpTzKPU7OzqWvRMD1j0Vi73n70F0GIOcharAF3ijuf/M8jOl
	 5VuvWNIcBXLYv52WPVmQSrJWGh4wNrEDP28lZmMXSTN9xd3CAXaC+SVoyrQMrUUYxMWp2
	 x8V5dzE1fyl5AXqLOHXMB6iU3XPSU/DKacqxJ+9gpcHAgTC+CLFL1wdA2W6R3xPX6PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=hFHPmiA6;
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACEB606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ACEB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=hFHPmiA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0rafnJ6ETOXB4I+4JzC7j5xOZDkxdPx41IQxH9sjp+g=;
  b=hFHPmiA6McMZ/nWmSELjPvw7aNkG9d4pmVhltcP9f3NTttuNgQuJWf9d
   F2CuNbE+tEYEJmeQLvGMjo5IVZ0q924nJOfv1veeAl4CEvI5FyuU+iqAy
   vao2xHtD4tXT3Hd5tufnPUSgYGGqfw2i1tsC5UCJThsBZwS1RbO1Fa5RU
   0=;
X-CSE-ConnectionGUID: 6/6b8RvLReGIp6FyG2JhkQ==
X-CSE-MsgGUID: HeIaQ4beTdy7RQSMJaenkg==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=keisuke.nishimura@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,235,1787004000"; 
   d="scan'208";a="307575058"
Received: from nr-sop-535.grid5000.fr (HELO grvingt-17.nancy.grid5000.fr) ([194.254.60.13])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 17:55:44 +0100
From: Keisuke Nishimura <keisuke.nishimura@inria.fr>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Cc: julia.lawall@inria.fr,
	jean-pierre.lozi@inria.fr,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>
Subject: [PATCH v3] sched/fair: Don't pick recent_used_cpu if it has no sched domain
Date: Thu, 26 Nov 2026 17:53:41 +0100
Message-Id: <20261126165341.96436-1-keisuke.nishimura@inria.fr>
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

select_idle_sibling() can return recent_used_cpu if it is idle and
shares the LLC with target. However, it does not check if
recent_used_cpu is an isolated CPU where the scheduler should not move
tasks.

Consider the following situation:
* isolcpus=1,2
* recent_used_cpu=1
* target=prev=2
* affinity=1,2

When CPU 1 is idle but CPU 2 is busy, select_idle_sibling() returns
recent_used_cpu (CPU 1).

A similar issue can occur when recent_used_cpu becomes isolated at
runtime while prev_cpu remains non-isolated.

To prevent these migrations, check that recent_used_cpu has a sched
domain. Also, return early from select_task_rq_fair() if prev_cpu has no
sched domain.

This bug was found with the help of verification using Frama-C.

Fixes: 32e839dda3ba ("sched/fair: Use a recently used CPU as an idle candidate and the basis for SIS")
Signed-off-by: Keisuke Nishimura <keisuke.nishimura@inria.fr>
---
Changes in v3:
- Move on_null_domain() up and reuse it.
- (Vincent) Move the early return to select_task_rq_fair() and check
  prev_cpu.
- Check that recent_used_cpu has a sched domain, which also covers CPUs
  isolated at runtime.

Changes in v2:
- Return early at the beginning of select_idle_sibling() if target has
  no sched domain.
- Instead of `per_cpu(sd_llc, target)`, use `cpu_rq(target)->sd` to
  check if target is isolated or not. A CPU might be in an asymmetric
  capacity domain, but not in an LLC domain. In this case, returning
  early based only on the LLC domain would miss the chance to run
  select_idle_capacity().
- Rewrite the explanation, because sd_llc is not the main issue anymore.
---
 kernel/sched/fair.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index da0d9e19c457..ca29c7afd67a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8468,6 +8468,11 @@ static unsigned long capacity_of(int cpu)
 	return cpu_rq(cpu)->cpu_capacity;
 }
 
+static inline int on_null_domain(struct rq *rq)
+{
+	return unlikely(!rcu_dereference_sched(rq->sd));
+}
+
 static void record_wakee(struct task_struct *p)
 {
 	/*
@@ -9214,6 +9219,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	if (recent_used_cpu != prev &&
 	    recent_used_cpu != target &&
 	    cpus_share_cache(recent_used_cpu, target) &&
+	    !on_null_domain(cpu_rq(recent_used_cpu)) &&
 	    choose_idle_cpu(recent_used_cpu, p) &&
 	    cpumask_test_cpu(recent_used_cpu, p->cpus_ptr) &&
 	    asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu)) {
@@ -9926,6 +9932,11 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 	 * required for stable ->cpus_allowed
 	 */
 	lockdep_assert_held(&p->pi_lock);
+
+	/* Keep the task on prev_cpu if it has no sched domain. */
+	if (on_null_domain(cpu_rq(prev_cpu)))
+		return prev_cpu;
+
 	if (wake_flags & WF_TTWU) {
 		record_wakee(p);
 
@@ -14325,11 +14336,6 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
 
 }
 
-static inline int on_null_domain(struct rq *rq)
-{
-	return unlikely(!rcu_dereference_sched(rq->sd));
-}
-
 #ifdef CONFIG_NO_HZ_COMMON
 /*
  * NOHZ idle load balancing (ILB) details:
-- 
2.34.1

