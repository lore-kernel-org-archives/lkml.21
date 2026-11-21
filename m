Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.241
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795229874;
	b=gczchm2kxt5JTptlCLZ9bDX+WFidbyRG7C8TzqFyIVokc3voIiGQTd8IvMmLUDhPjeHn
	 wymPWEEOxeot6csrWNRc+uSsRahaN3AgAM4lWEK8GWFPY5+FBKTSG5nGius1cS+aUyl7w
	 b57B+7ZXe95eGd7kzRqwXLz4TORFk3AttCr8qBk14chQaVse2+2DpInj5pIIu0lDFJFM1
	 R893g2D7zhF+JRFO0etAcJFskRktS5T4HWEA2khmvKA+ASQWKWOPauVeblR2HWLC4U9QM
	 yYEtRZRX5bCEEAuoah+VGmvAqpgnMUwRslXo/6eysJc7JXsEbIEP7PXSlwqC2wwkxGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795229874;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=Mxhl/TovSxd7tFVq3+0xncX85stNDBZis0a6yy8hdso=;
	b=JoQ4OedTc8LXUXfUxewwpwTyOEwzpDS0KAxXctJ3BhAhCOG9BbfMiegtV66pnBTMh+rh
	 JGSSQx+QeiAy4uXTojA+ZrNeUfH5f0lvV3eU1wYA5w3nTZ+3Nse5P5AfjQ1qONmn74UZ6
	 AtT6RTN48txmYuJmAHAuWi4C54PO0ataRZicIayNkSPhUuMGKlKcg4BysDGaTwYEDGysI
	 k9QbtMn8y+QEdggXOfhvc8wdbtTe/gL5yNAolXvES8zS7G+qkwlEob4OGy4cRywIcGQ/E
	 V0Y0R8s+B60dHLbT/lPjG3MWlDV3OSQxeCPLuncn2bkUrM3YNw1GzbeIjCt2UpImEwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TBZTOuhj;
	arc=none smtp.remote-ip=91.218.175.241
Received: from mta0.migadu.com (out-241.mta0.migadu.com [91.218.175.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5E6606A6B3
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 02:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA5E6606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TBZTOuhj
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UQ3d6XxIXoDiMYT8MRy4iqt0mRxiRTsX3sK+wZ0Kb9s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795229866; v=1; x=1795834666;
 b=TBZTOuhjFbwsz+nd5lWdHTMydR1UMu82Pd9+Pyx7HzYN9BoA6CMyfTfWmXCR+4wfOOnqW/IS
 HF2WrtBQKB/Uf/1+ja8R+2olJAR8AcAIKpiznkeSSryQ0w+3/vkcsvjNvroKXYuDqeK3j1n48WK
 ep3bngLh062cQGgbO2rIJE7s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5da319ec8fc0d3b7;
	Sat, 21 Nov 2026 02:57:46 +0000
X-Mizu-Trace-ID: 5da319ec8fc0d3b7
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Fri, 20 Nov 2026 21:57:25 -0500
Subject: [PATCH v3 2/3] sched: Keep CPUs that stay active online across
 root domain moves
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
Message-Id: <20261120-bug-sched-fair-offline-active-v3-2-325e9eefa56d@linux.dev>
References: <20261120-bug-sched-fair-offline-active-v3-0-325e9eefa56d@linux.dev>
In-Reply-To: <20261120-bug-sched-fair-offline-active-v3-0-325e9eefa56d@linux.dev>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Li kunyu <likunyu@open-hieco.net>, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

A sched domain rebuild, from CPU hotplug or a cpuset partition change,
calls rq_attach_root() for every active CPU. rq_attach_root() takes the
CPU offline in its old root domain and puts it back online in the new
one, running all rq_offline() and rq_online() callbacks with the rq
lock held and interrupts disabled.

For fair, that walks all task groups twice per CPU: rq_offline_fair()
in clear_tg_offline_cfs_rqs() and rq_online_fair() in
update_runtime_enabled(), although nothing they maintain changes for a
CPU that stays active; tg_set_cfs_bandwidth() already keeps
runtime_enabled in sync on online CPUs. A rebuild thus costs
O(nr_cpus * nr_task_groups), and hosts running AI agent harnesses
commonly carry over a thousand cpu cgroups.

Keep a CPU that stays active online and move only its root domain
state with the rq_attach_root() and rq_detach_root() callbacks. A CPU
that comes up is still put online by the rebuild in
sched_cpu_activate(), and one that is no longer active is still taken
offline there.

With 4000 cpu cgroups on a 32-CPU VM booted with rt_group_sched=0,
switching a 4-CPU cpuset to a partition root and offlining or onlining
one CPU take (median of 20 partition switches and 16 hotplug
operations, min-max in parentheses):

  operation       before (ms)           after (ms)           change
  partition root  15.97 (14.76-35.88)    1.18 (1.14-2.26)      -93%
  cpu offline     49.66 (42.11-58.82)   14.49 (12.71-23.19)    -71%
  cpu online      37.39 (33.40-41.99)   13.70 (9.65-16.53)     -63%

Each rq_attach_root() call during those partition switches takes (1280
calls, change of the median):

  kernel  median (us)  p90 (us)  max (us)  change
  before          229       265      1335
  after             1         1        26    -99.6%

Suggested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 kernel/sched/core.c     | 27 +++++++++++++++++++++++++++
 kernel/sched/sched.h    |  2 ++
 kernel/sched/topology.c | 20 +++++++++++++++++---
 3 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index ca920a302ecba..49a0cee90a834 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8580,6 +8580,33 @@ void set_rq_offline(struct rq *rq)
 	}
 }
 
+void rq_attach_root_domain(struct rq *rq)
+{
+	struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
+	const struct sched_class *class;
+
+	cpumask_set_cpu(rq->cpu, rd->online);
+
+	for_each_class(class) {
+		if (class->rq_attach_root)
+			class->rq_attach_root(rq);
+	}
+}
+
+void rq_detach_root_domain(struct rq *rq)
+{
+	struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
+	const struct sched_class *class;
+
+	update_rq_clock(rq);
+	for_each_class(class) {
+		if (class->rq_detach_root)
+			class->rq_detach_root(rq);
+	}
+
+	cpumask_clear_cpu(rq->cpu, rd->online);
+}
+
 static inline void sched_set_rq_online(struct rq *rq, int cpu)
 {
 	struct root_domain *rd;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index a24801d2058b4..1ceef4af26bc8 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3534,6 +3534,8 @@ static inline void double_rq_unlock(struct rq *rq1, struct rq *rq2)
 
 extern void set_rq_online (struct rq *rq);
 extern void set_rq_offline(struct rq *rq);
+void rq_attach_root_domain(struct rq *rq);
+void rq_detach_root_domain(struct rq *rq);
 
 extern bool sched_smp_initialized;
 
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 99878da03bce7..cc2bc832dad1a 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -488,14 +488,26 @@ static void free_rootdomain(struct rcu_head *rcu)
 void rq_attach_root(struct rq *rq, struct root_domain *rd)
 {
 	struct root_domain *old_rd = NULL;
+	bool active, move = false;
 	struct rq_flags rf;
 
 	rq_lock_irqsave(rq, &rf);
 
+	active = cpumask_test_cpu(rq->cpu, cpu_active_mask);
+
 	old_rd = rcu_dereference_root_domain(rq->rd);
 	if (old_rd) {
-		if (cpumask_test_cpu(rq->cpu, old_rd->online))
-			set_rq_offline(rq);
+		if (cpumask_test_cpu(rq->cpu, old_rd->online)) {
+			/*
+			 * Keep an online CPU that stays active online and move
+			 * only its root domain state.
+			 */
+			move = active;
+			if (move)
+				rq_detach_root_domain(rq);
+			else
+				set_rq_offline(rq);
+		}
 
 		cpumask_clear_cpu(rq->cpu, old_rd->span);
 
@@ -512,7 +524,9 @@ void rq_attach_root(struct rq *rq, struct root_domain *rd)
 	rcu_assign_pointer(rq->rd, rd);
 
 	cpumask_set_cpu(rq->cpu, rd->span);
-	if (cpumask_test_cpu(rq->cpu, cpu_active_mask))
+	if (move)
+		rq_attach_root_domain(rq);
+	else if (active)
 		set_rq_online(rq);
 
 	/*

-- 
2.43.0

