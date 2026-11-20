Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151901;
	b=MheORCThhcI4LjYlwUUVM81Z8RMjJiUUdcb2yNSl7RS5+b2/Y81m/xH/ssJaE0JO38k0
	 QKCHeEwrIepOJlZfi8vFHW1gi78q7WA2Qq9LnInonphElVRP2SUahKKLdsrRNFXlUZW9T
	 9x2AfaOLjErCqoz/iqtCyNki3G28UKG8sTfPQ/y1Y2CHQyCi80DvPFqbroRc2fzBHhHHe
	 2MXZRJwwbWqMzZHkQWsIQ7EyKxnUU18ngZrQup7JCRGE8Z+4KZTlXjkOcXKbV8qFbVLkB
	 V9Z+dk3C4umijMS/JBEMh/U1GuG8x+EEMwCE9jn2l+iEIfeay6aSd9oNp3SuuzmsldQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151901;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=xqf2htAeLyF0ppmE57JNFMIZuWy/Ise5HM77ivMOKcA=;
	b=MzSSSRCWWS9G5UjI+EWo881jb1JODXvhK8ABSpyydKKLygNYw6WcG6ONiwnAgAXI7zfJ
	 QKxbg9GvghkpGBqw+LUYIzwqxpyTAiNiPhB4HcdjU/EtCB+Wfy5Z0w9bpaTYkQWNYSSho
	 EWRBGdY+Rs4Qw6WeXuZpGAbVwoVVESTbqqJqHFcGR94Jhu8OTBjuxAzvfsEdx6jMN7+vj
	 /Qulrd1+blexwuNjpLyA6XSCHtKzV3hR4kmyGoDW8nMZzhGnIwKaW3wZ/c2Rq5HW7TlbQ
	 LdzgwkWxeSzZ8GknbweOcgHBmQBNGCGJ7Ho160fnSPS0p88H4/DmB9hbW1fJtVZzClw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=azttUxCb;
	arc=none smtp.remote-ip=91.218.175.130
Received: from mta0.migadu.com (out-130.mta0.migadu.com [91.218.175.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD15E606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD15E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=azttUxCb
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=11l679jNwgBj/AMOW7sfJifPsJflCJfdQ/Vtffb6N1w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795151898; v=1; x=1795756698;
 b=azttUxCboE+0Nqt/WlogFRqahYiLdY5F9dUPVbyE9KSHy1PzX8lN+Wr9OnhRklgiM7EKUz7O
 avOj4AbDE4iF4MZCfQOS6bdwxDhDbzMI1v0Dwfsj4KnsndXf7e0B/IAkVxjbytXhkEyY5I23ksB
 pI06p/pZ2Nq+knEdc47Tw52E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 24478dd4f6f37f38;
	Fri, 20 Nov 2026 05:18:18 +0000
X-Mizu-Trace-ID: 24478dd4f6f37f38
X-Migadu-Flow: FLOW_OUT
From: Fushuai Wang <fushuai.wang@linux.dev>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	sshegde@linux.ibm.com
Cc: linux-kernel@vger.kernel.org,
	wangfushuai@baidu.com
Subject: [PATCH v3] sched/core: Fix a TOCTOU bug in sched_non_preferred_cpu_push_stop()
Date: Fri, 20 Nov 2026 13:17:42 +0800
Message-Id: <20261120051742.50358-1-fushuai.wang@linux.dev>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
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

From: Fushuai Wang <wangfushuai@baidu.com>

sched_push_current_non_preferred_cpu() is called in irq context. It
checks is_migration_disabled() before queuing the stopper.

migrate_disable() sets p->migration_disabled in preempt_disable() section.
An irq can hit after preempt_disable() but before p->migration_disabled=1.
After the irq returns, the task cannot be preempted by stopper because
preemption is disabled, so it finishes setting p->migration_disabled=1
before the stopper runs.

It may be like:
    task context:                       irq context:
    migrate_disable()
        preempt_disable()
                                        is_migration_disabled()
        migration_disabled = 1
        preempt_enable()

So recheck is_migration_disabled() in sched_non_preferred_cpu_push_stop()
before calling __migrate_task().

The stack may be like:
   WARNING: kernel/sched/core.c:3432 at set_task_cpu+0x1b8/0xdf0, CPU#21: migration/21/152
   CPU: 21 UID: 0 PID: 152 Comm: migration/21 Tainted: G        W  O        7.4.0-rc1 #3 PREEMPT(lazy)
   Stopper: sched_non_preferred_cpu_push_stop+0x0/0xb10 <- sched_push_current_non_preferred_cpu+0x6a6/0x9a0
   RIP: 0010:set_task_cpu+0x1b8/0xdf0
   Call Trace:
    <TASK>
    ? set_task_cpu+0x5/0xdf0
    move_queued_task+0xfc/0x650
    ? is_cpu_allowed+0x341/0x820
    ? __this_cpu_preempt_check+0x13/0x20
    sched_non_preferred_cpu_push_stop+0x7b7/0xb10
    ? __this_cpu_preempt_check+0x13/0x20
    ? __pfx_sched_non_preferred_cpu_push_stop+0x10/0x10
    ? __pfx_sched_non_preferred_cpu_push_stop+0x10/0x10
    ? sched_non_preferred_cpu_push_stop+0x5/0xb10
    ? __pfx_sched_non_preferred_cpu_push_stop+0x10/0x10
    cpu_stopper_thread+0x205/0x410
    ? smpboot_thread_fn+0x307/0xa60
    ? __pfx_cpu_stopper_thread+0x10/0x10
    smpboot_thread_fn+0x352/0xa60
    ? __pfx_smpboot_thread_fn+0x10/0x10
    kthread+0x3a6/0x4d0
    ? __pfx_kthread+0x10/0x10
    ret_from_fork+0x68e/0xb40
    ? __pfx_ret_from_fork+0x10/0x10
    ? __kasan_check_read+0x11/0x20
    ? __switch_to+0x592/0x1210
    ? __pfx_kthread+0x10/0x10
    ret_from_fork_asm+0x1a/0x30
    </TASK>

Fixes: 74699f56ebcf ("sched/core: Push current task from non preferred CPU")
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
---
v2->v3: No code changes, just add some comments.
v1->v2: No code changes, just improve the commit message.

 kernel/sched/core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5ed660f099a5..c351d708aab3 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -11314,7 +11314,8 @@ static int sched_non_preferred_cpu_push_stop(void *arg)
 		rq->npc_push_work_pending = false;
 		update_rq_clock(rq);
 
-		if (task_rq(p) == rq && task_on_rq_queued(p)) {
+		if (task_rq(p) == rq && task_on_rq_queued(p) &&
+		    !is_migration_disabled(p)) {
 			struct rq *dest_rq = __migrate_task(rq, &rf, p, cpu);
 
 			if (rq != dest_rq)
@@ -11355,6 +11356,11 @@ void sched_push_current_non_preferred_cpu(struct rq *rq)
 		if (rq->npc_push_work_pending)
 			return;
 
+		/*
+		 * Racy: is_migration_disabled() isn't stable in IRQ
+		 * context and can race with migrate_disable(). The stopper
+		 * should recheck it.
+		 */
 		if (is_migration_disabled(push_task))
 			return;
 
-- 
2.36.1

