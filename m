Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795120733;
	b=RbUvF2ZgbxdZdKvbQLY9vGsB6rjQQcPqR+KWNVzUChQPP8/lcp5gbB+0jALEpmv3pBWq
	 09WzKBWDWq747RePPiAjvy3Ch2YUROcp9CRTfL6G5QeRGFVolpwG0L7F2eUk2XGp4ynQj
	 vpZVBZ5tQcfr8jH+xD1qOv8nRU9ULKLdjGkCNnfJ92UyEEOzOK7CKVxqjwkDkMarR8w0h
	 pOIcdWg7WrL4X7I1v1wIj5S9O4XEJwdlC4rmBGSCNESRnDjACdz8tnjMCUbukeWbfpoo3
	 Z/x3tLXtfnAhC7fcykaAOYkrgmQO4g9Ho9q1PGPUYgLSyjHmv2l6kmUZo5V/OAPeISw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120733;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=eY+jEDaHUk+ln7rqsnpbhM6okH0nP1nYu0Dop4HMq+o=;
	b=KfaETBCPZ6GB1QE36DrtImcnPgEK1CnNAHyTd8ZLsxsRv5dIzeo6sxrDKqS6DFXurNSh
	 8A2G4xkj4L7+jw5vmshk1sZ24evcKbpcTFJf9eZ3qcRQWdGaJIjhfJ/t52XSSjKY2inan
	 rEC2OcAJPAafxp0/9ruWfqyGgaa7deCgtOkItQ9Vhu5bhXbY4ZTQuzqRQianbDwItwSRq
	 uASB+g69T/mHA0tPtkfo4LZIr5WJqT59DoIkf4TQ1zqXIyUT3p9OcAlXf4j3JDbF39Mur
	 v1cpjp9KZIMeMtJcTj0bPc3V+6pnmah+woWvA7BqXrLWaLGrnb3HUTVnmoPPueRtWPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SIS2E3v8;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489B6606A931
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 489B6606A931
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SIS2E3v8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795120732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eY+jEDaHUk+ln7rqsnpbhM6okH0nP1nYu0Dop4HMq+o=;
	b=SIS2E3v8pH7GUTQ4AlZy0ZUo/mGgJmhVD4JCXFNKIfqgdXFeLeC5LwHwFJgXx8my3+5+ef
	fFeNlRETq7yphXwdFaCxuYR3Cou69QoboPl8tOaa/+3SjzjPA9qaP1dwzZhbViHUFTjRU8
	a1lZrVcgEMrmWfHyf9cy8SJGXIwKR6A=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-638-_GDpDu8JOsWE2j2_-CvKiw-1; Thu,
 19 Nov 2026 15:38:46 -0500
X-MC-Unique: _GDpDu8JOsWE2j2_-CvKiw-1
X-Mimecast-MFC-AGG-ID: _GDpDu8JOsWE2j2_-CvKiw_1795120724
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 349A81955DC1;
	Thu, 19 Nov 2026 20:38:44 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3C3B718004FE;
	Thu, 19 Nov 2026 20:38:40 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: [PATCH] sched/fair: Don't let task_tick_cache() IPI dyntick CPUs
Date: Thu, 19 Nov 2026 21:38:25 +0100
Message-ID: <20261119203825.2732984-1-vschneid@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

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

Let task_tick_cache() recognize when it is invoked via a remote tick, and
bail out rather than disturb dyntick CPUs.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/sched/fair.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d4cc0caee6265..42394745a124b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1925,6 +1925,13 @@ static void task_tick_cache(struct rq *rq, struct task_struct *p)
 	    !grp->pcpu_sched)
 		return;
 
+	/*
+	 * We got here from a sched_tick_remote(), meaning @p is making use of
+	 * NOHZ_FULL. Don't disturb it with a task_work() IPI.
+	 */
+	if (cpu_of(rq) != smp_processor_id())
+		return;
+
 	epoch = rq->cpu_epoch;
 	/* avoid moving backwards */
 	if (time_after_eq(grp->epoch, epoch))
-- 
2.56.1

