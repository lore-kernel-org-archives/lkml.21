Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604036;
	b=N2P+VnQ1UuWUSiM7J/icPkTDvPjBFVIeNd2CrvA8br/I3sfdOOTnUkFDjXhri+WBx0nu
	 L4nH2p9ncT5QcbDk6Q88QTSR0ayhdZtzFBp5UaoCB/1eAI4nFCCB1ok4W9iX9uP8cB3+5
	 +v4TkdycvfH6PW1tZCWZYHibiYKDUeJBzp1C09FhKfrs8Juy/0P8HP8cX5ldK9IwHPxg0
	 pPiPoWiUtzbqXrhdzelBSOCaER7TecFg/WDHOUEDbX8SFZ0PEyWQV3ju7/x0hJZDC4J/p
	 kVzGV48RqdA/Sg+wBarzqKEFpaplAXzF9X0qvmTU5EGuiFwL8DeYAJ2ezi+H/zGzuSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604036;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=iqErz88zDh21Dhtu+nWpX5VVI96DHKsDBgdaKGe/X6E=;
	b=LJHqSousEvVni8QQ6LnumrOO32yeuSE+SJNaoqUlni9ZRtS1rdv00uxA1h9wQreXaTR/
	 4DU7kehLntZkLPifXrXxwMhi+nhj/xt1LIsEBdFQkSuxTfJsLjRdXKBJg1CF07xRA07S8
	 F85iM269uV8NP1lKrbhm3nIsynV5qfd3gFr1DrWymPa6hSRHOHt51XB0ATAMcCo6YViFl
	 g9q3cea64UI3FF0hmp+edUX3bOeLVURT1+KPraJrbnpmtozFrBUtsL+AzOVs/WluzAWan
	 UrgID2HL7IJQkVY6/bNwclEJ3L/LGmAi1hQstwG8ddXW31ODh2yZQQurl2fK1EruG8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e6bHT4kE;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB49606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDB49606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e6bHT4kE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795604034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iqErz88zDh21Dhtu+nWpX5VVI96DHKsDBgdaKGe/X6E=;
	b=e6bHT4kEdcLDR4zlsTa7ewLAo1I3Z7VyO/YS9Cz8ojQgJDI8TytzQyc4LS/ilLN84yOwOf
	ei1J7N1rMBQlfw05G7cVuP06H+/mctwiHFWsDlhm2ynQtwHcnMzvyjFF0iQt9Owis5IY8s
	opTAV4qvdCCxxCUNDQUHerXTCOwqEno=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-482-hn348FgpOCOxunjleTY67w-1; Wed,
 25 Nov 2026 10:53:50 +0000
X-MC-Unique: hn348FgpOCOxunjleTY67w-1
X-Mimecast-MFC-AGG-ID: hn348FgpOCOxunjleTY67w_1795604028
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 64B3A196F758;
	Wed, 25 Nov 2026 10:53:32 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DCF671956049;
	Wed, 25 Nov 2026 10:53:28 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: [PATCH v2] sched/fair: Don't let task_tick_fair() IPI isolated CPUs
Date: Wed, 25 Nov 2026 11:53:13 +0100
Message-ID: <20261125105313.3874773-1-vschneid@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

From: Peter Zijlstra <peterz@infradead.org>

While testing some CPU isolation / NOHZ_FULL stuff I stumbled on something
like so:

  kworker/u289:5-241489 [001] d..3.  2963.728734: ipi_send_cpu:         cpu=6 callsite=task_work_add+0x84 callback=0x0
  kworker/u289:5-241489 [001] d..3.  2963.728735: kernel_stack:         <stack trace >
  => trace_event_raw_event_ipi_send_cpu (ffffffffa6d7ba45)
  => kick_process (ffffffffa6d827a2)
  => task_work_add (ffffffffa6d645c4)
  => task_tick_fair (ffffffffa6d9cfbe)
  => sched_tick_remote (ffffffffa6d84c69)
  => process_one_work (ffffffffa6d5d57b)
  => worker_thread (ffffffffa6d5e1af)
  => kthread (ffffffffa6d66e85)
  => ret_from_fork (ffffffffa6cb3f2b)
  => ret_from_fork_asm (ffffffffa6c7741a)

In this case CPU6 is isolated via isolcpus=, and is executing a single pure
userspace task, so should be fully leveraging dynticks.

However, because that task is SCHED_OTHER, housekeeping CPUs periodically
handle a sched_tick_remote() on its behalf, and end up kicking that task
out of userspace to run the task_cache_work().

task_tick_numa() causes the same pattern, one or the other may show up
depending on the timing of their respective balancing periods.

Let task_tick_fair() recognize when it is run against a fully isolated
CPU (no sched_domain) and return early to skip the load-balancing related
functions.

Not-signed-off-by: Peter Zijlstra <peterz@infradead.org>
[Switched from RD to SD check]
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
v1 -> v2
========
o Ditched sched_tick_remote() logic
o Included task_tick_numa()
---
 kernel/sched/fair.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 731d78155e654..bd6815c2e21a5 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4588,6 +4588,9 @@ static void task_tick_numa(struct rq *rq, struct task_struct *curr)
 	struct callback_head *work = &curr->numa_work;
 	u64 period, now;
 
+	if (!static_branch_unlikely(&sched_numa_balancing))
+		return;
+
 	/*
 	 * We don't care about NUMA placement if we don't have memory.
 	 */
@@ -15401,15 +15404,17 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int hrtick)
 	if (hrtick)
 		return;
 
-	if (static_branch_unlikely(&sched_numa_balancing))
-		task_tick_numa(rq, curr);
+	task_tick_core(rq, curr);
 
+	 /* If there is no SD; there is no balancing, and none of this matters */
+	if (!rcu_dereference_sched_domain(rq->sd))
+		return;
+
+	task_tick_numa(rq, curr);
 	task_tick_cache(rq, curr);
 
 	update_misfit_status(curr, rq);
 	check_update_overutilized_status(task_rq(curr));
-
-	task_tick_core(rq, curr);
 }
 
 /*
-- 
2.56.1

