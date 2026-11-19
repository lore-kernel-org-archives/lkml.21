Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049862;
	b=Lq/89wANqREUmVqoQvJXNkXhFCqNMnMAGiF1Egodsu2rZXNH4Qa8vttSpSZ0A4dXKI1w
	 b1jjOW5rFRWfRbz+/HFAzwSjAHhA8OQTJrKCafOUzDSMblZ24r7iaMvxYp/zQDaRyDEx9
	 50p0gesMz3+WO81i+cXR74Q6WvmHTnv/IQfqZhsceu8XA2onwxmqEpUlP6vV2kFikJe7T
	 btt0+jC2hmF/qY0WajLQA18LfYE+pyPz5Cj5l1i5cAv7ERw4qjcKaTw+NPte5LMXEzWU+
	 Gwa57yFTbdk20mfWiu3XRAoHk/DE4undx1zjKrxGIiMDgO7pJptlFLc8l9Q9BJzQMeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049862;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=694qyvLriy9O4VfWG13DifSnjzBTkvYAPHjYHQpTfnw=;
	b=ELI5b/+bTQCi0BHTkEaVPFY4DjgVory+9FxE2QXQY+v5QTAqpGWCvsmqW5aSD9VuRtkD
	 kphF6wGu1IxqtKvPyLaeZTG7lIg0Ev+0HG/gfbLBBrBUum66zOpt7lyaWZDkNLRyLWFh5
	 8red0uV/n/5yP+c2hfSXwu29qOxoFUz9bGG/Mdr5sj3BU3yUbLclWUuKNAe6qSKRQPBH0
	 x+bTI7WYBSFnkLrj/sXLLs6LHWfNCXkiCgUY5YZDp6Dfbxf3BHl6QcQWvSeup+lzifHR3
	 czTbNxR9OFOKzTzAX1eccN2K8U6SJFNCwuEVxN4zaqE80cKt5Z4qA5AjYkq+yyV9QvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sVcuAXkm;
	arc=none smtp.remote-ip=91.218.175.168
Received: from mta0.migadu.com (out-168.mta0.migadu.com [91.218.175.168])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376CB606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 376CB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sVcuAXkm
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kR2ie0DRRFoOotdAIPB61Zj5lWd1xo8MCNE1wz+K2CU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795049860; v=1; x=1795654660;
 b=sVcuAXkmZhqDb2tZgKi8kYlrGXqCQdkI+qVM6FNcQeqJtDwn8QE52PAyRbilAvCOKmvUJ0jk
 xxxVO9gZUaLCYr4SbqGLYi5TBCT9vhZgAu7tBZurpCMvJA8kM08q+ausPzw3d3q5IFcvdA37OeT
 72sXSUMWHraoC5+i8wENAs1M=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b936f5bc137214bc;
	Thu, 19 Nov 2026 00:57:40 +0000
X-Mizu-Trace-ID: b936f5bc137214bc
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Wed, 18 Nov 2026 19:57:22 -0500
Subject: [PATCH v2 2/3] sched/fair: Skip rq_offline_fair() work for CPUs
 that stay active
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
Message-Id: <20261118-bug-sched-fair-offline-active-v2-2-b6ede596c6a6@linux.dev>
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

A sched domain rebuild, triggered by CPU hotplug or a cpuset partition
change, calls rq_attach_root() for every active CPU in the affected
domains. That takes the CPU offline and back online with the rq lock
held and interrupts disabled, so rq_offline_fair() runs for CPUs that
are not going down.

Commit af98d8a36a96 ("sched/fair: Fix CPU bandwidth limit bypass during
CPU hotplug") made unthrottle_offline_cfs_rqs() return early for active
CPUs, but clear_tg_offline_cfs_rqs(), added by commit f60a631ab9ed
("sched/fair: Fix tg->load when offlining a CPU"), still walks every
task group and drops the CPU's tg->load_avg contribution, which
update_tg_load_avg() then adds back. With thousands of cpu cgroups each
rebuild costs O(nr_cpus * nr_task_groups).

Return early from rq_offline_fair() unless the CPU is going down, which
covers both walks, and drop the active check from
unthrottle_offline_cfs_rqs().

With 4000 cpu cgroups on a 32-CPU VM booted with rt_group_sched=0,
switching a 4-CPU cpuset to a partition root and offlining or onlining
one CPU take (median of 20 partition switches and 16 hotplug operations):

  operation         before (ms)  after (ms)  change
  partition root          14.86        8.35    -44%
  cpu offline             49.99       33.91    -32%
  cpu online              36.10       31.02    -14%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 kernel/sched/fair.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index db9ab8ce36500..1b38c4c47b656 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7859,10 +7859,6 @@ static void __maybe_unused unthrottle_offline_cfs_rqs(struct rq *rq)
 
 	lockdep_assert_rq_held(rq);
 
-	// Do not unthrottle for an active CPU
-	if (cpumask_test_cpu(cpu_of(rq), cpu_active_mask))
-		return;
-
 	/*
 	 * The rq clock has already been updated in the
 	 * set_rq_offline(), so we should skip updating
@@ -15093,6 +15089,9 @@ static void rq_offline_fair(struct rq *rq, bool hotplug)
 {
 	update_sysctl();
 
+	if (!hotplug)
+		return;
+
 	/* Ensure any throttled groups are reachable by pick_next_task */
 	unthrottle_offline_cfs_rqs(rq);
 

-- 
2.43.0

