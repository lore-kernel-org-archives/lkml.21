Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985185;
	b=YBdg432r+RsxP3eELO5TjhJvoCI33+drMuB2/uje+ZKaOqLmHbolqejQPJ2kDHm+1KMT
	 DHgJ0ImwiqgIg+vMDhZWwRPvurFG9mwN7Ws6DzGjgZ5oP1P2/jhL76GSTF8v0TTXPuky6
	 esPmwGxvAdiv0+iLaGM3u13KOnM8c9oWcZzdAjLknCJ4GuW2csfwdbYqLKuYQvyCiNixD
	 HnPzh5hTnI7YcM6b4UvOV9ibtEHHXnnO+7T4DSeLedPQ+JYpxGDLL1iyOFwXU/vF2KJj1
	 EVRsEl/9FMkfL/w/PwJvOR3fm8UlSJWyvsB7I6Oo0Zas3ZserhkJv7c+Wo29auAQMaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985185;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=heXCHdN3Xo0X72Nq73T4MUZg+DJ+WOwvUemHigw2T60=;
	b=uwgrY52Wl5ZjvWNS8yyiXrAHtGgDT3zJEWgDlc2batssrM1mgi6EnU4r2ezkGsFyesUX
	 hdb7obNj/RXyr9DUjrWkR73vi3zipaqypiMJ9Q+GIqgGtOiSK37Cmxe6Mmy8hb9INf/xc
	 Wg+YaH8Qkl0NiKF9SCx945LhDnqaw0AC7IruyeIx6Qem2Vu2fRsxYu1W5SZbLN6CHYgF1
	 WVKBg40AumtxZoMjnC0aE9Ms2WPIvfJkHes+fgSDo66kAzVT0LMBd3zjfsSXM63WupUOy
	 /28t5KLGo5/V+ON229yjdTv+gTWoMjTxsKHz2dlZHtIZDgOHwsDmDOtGTiuqjoqd99Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ber6wwS1;
	arc=none smtp.remote-ip=95.215.58.131
Received: from mta1.migadu.com (out-131.mta1.migadu.com [95.215.58.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0E0606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E0E0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ber6wwS1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Rg+1vT3rPQ1wgGLASxTg42XZBtRbemyqxsNnQ7I22sU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794985181; v=1; x=1795589981;
 b=ber6wwS1LnR4PBKI0+Bo0P+SE/NyIMRuJmZtg2mtPepf3h7uKBK7SEAQYZiySJJdVvqtvZX8
 8F1L1ZZH3pswBWbN/Ke61MVtvHMYDwOwNN72EK0VKYzftJxk1zNAZ7eoP+Fyow0R1asmJau7Efh
 o4ZrcIqmR0aSg347q4CnqwN0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 6b525de8134ec44f;
	Wed, 18 Nov 2026 06:59:41 +0000
X-Mizu-Trace-ID: 6b525de8134ec44f
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
Subject: [PATCH v2] sched/core: Fix a TOCTOU bug in sched_non_preferred_cpu_push_stop()
Date: Wed, 18 Nov 2026 14:59:21 +0800
Message-Id: <20261118065921.98260-1-fushuai.wang@linux.dev>
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
After the irq returns, the task cannot be preempted by stopper becuase
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
Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
---
v1->v2: No code changes, just improve the commit message.

 kernel/sched/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5ed660f099a5..6f9374aa3f19 100644
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
-- 
2.36.1

