Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401690;
	b=qSRkX38v2h1cNCnu7kZV2c2eMrXb2BGuYCon23Jk32lMFUHj37Pk1p2TOtZXT9+VwRfo
	 uUEmeva6Qj/PRaU/Q4fUw9VlGLmQno08JrUn1Ty/qh+Ssi2UYcmlpjbfOllpzO3Qe5b41
	 ePss8yOy2/8jIP5FHeGM0J1jqIMSxM5sg2MBGyyt3EUYWo5dA4pZbC3lyPPv6uLVpz4MM
	 XYgnlw8J3n5aEzIDZNj2ogfaFoFt1Q6H52cN+4Hdf6BPwv8Zulx0VomCkC70rG+rDvw+q
	 TfbVeT5bHDv8ZBvdeWEn78ntz2ZajVUSV+hVsrbirP03igOcZQP57UMX5rvIp7y+O2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DCR5n0TbPRkgr0wo/HBC8V7L6UUpxciDosZVJpsgNo4=;
	b=45AEAUU0YiZp0/CIlwOFW5XrLP/VvvNyLdKkfuRumtt0sE4zDQ4NB+0FuROmUyaxl9Et
	 FI0qLLJ780XSe/OR2bO061yHMwuagsSyXugSFDkhZFlkZJSg/EYM8cbrO/dM9ahFCWpMK
	 JtY9ZmsT3Dyy/yrR2wyW+n0v9IqHJMPNMPZ2t5LfNwca6BWUdBpDYDEOSvOs8hfWEbif0
	 BY4hZ7cPi+XSgMHqAdX+WIFuOgbrL6MKabFTaxlCtEYVukM+Efm/yvj/Xa3WKW684lMqe
	 Kxoprkt9ygAopytx4JaaMa6i6a3cWmcIdPRGYxJ/9MDEBhtzxpgsqjZqDGhP//67/TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xlIlDPv6;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FD9606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6FD9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xlIlDPv6
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f020d0169eso12456665ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795401689; x=1796006489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DCR5n0TbPRkgr0wo/HBC8V7L6UUpxciDosZVJpsgNo4=;
        b=xlIlDPv67XPYULIFOaX4co/fFKiXdHOFa6LiQwo6g8rb6SCWpxerQXmsmE5IdzJ2sH
         h46V/emgEHVLlpczAOB0WpLo9fXwq0Z73I4voLNt7wgJfRp3DK3O+PfvII3Lf0USlF1y
         BmHj+imZrqNDNglQKaNrSi7YvloxECE+jLmgH42A8HsBRG92G220ndS9FvMfwfA9/lfD
         6WsgZcHcKR/jBxRsOET6Cl3Dk/bWpvZJzBhHrUIWcd+3UeO6vSJtG8gid9GBls/b5TGL
         NHyI2zcQ6Sf7zCe+3zPgX2Qnne9EBj1b7mDJjs5Q9EdyoGSj/HfXBKn2FxXEqFlStUgG
         MQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795401689; x=1796006489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DCR5n0TbPRkgr0wo/HBC8V7L6UUpxciDosZVJpsgNo4=;
        b=KafOfzjO7WC6/VXPmBAAilmvNC2LwjPWiYYADY8FWI397sNWHr2V8Wl7dJVL22DSpG
         PKZi9K2QsK1qDX+6a3jLdY2k9Cg2gqNCXzjS0B9B4wngbBa7hdh8PDOqf/9LnTuxpuSB
         vZIyb/6EXndg8uL7EixJ37yOoCwLJHuUIgNgZF7pfgVq1ipH1BF7Mp67CytU6DZPEe38
         JMduHN515xeCfZMDW6OszBHxUZwX2dkfG4MvIu18rEMxYjuUib4qfyqF1ps3q1oGQXPg
         7CRx6EsRjsA4ZrJdfX51duhjUyngHkmyGHvIdRVxGLkdyQ8LAREmupDgB6p1SmMC8HUe
         nz0w==
X-Forwarded-Encrypted: i=1; AL+hErFxPlP5EwBvM9MzxbD101Kcb/wJaDd9braDIJDmNtkhaQxQTjglChPPchz27DO5Vh/NdtL12sA+tojFeJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MF8ebI0sT6y3XqESWfbKJCqM+zBnOJlzt2ti7Y0N6/q3E35rB
	Sli31ibve0cDQKkzilRnHR6YMKMhtCWm2PUz2KyM7ok+yTkL6tn/Ztl2
X-Gm-Gg: AZFdTZeno0dNh8pu4ieRZ0SPa+EyMMsvNmnQSHsEivPsTAHU8/nNzBbvBWGygFGzNoU
	3tA5X9Ktu6y385L8bPFt3I0gJO1b+7N5uWgJT0A5E1+5+5k8kXuvyih3fFD+loZghPAIos5UJOk
	Tr4L8GBm+yet7rNTGIScsZ/x8f78bbPHA0Kt3wwy7eDSPNxLi/j9QgS5S1J2CQIt3FQ2Bp70qBj
	UDyiAd23SHOcL06lcU4evXnsHwlzuvtMvQIE4433PpAb3Nw8QiMA8cOkvpwirqgrS9/KYmQxb+N
	3MX94rFNhqbnMDLaIb5+xEkilXMthDGuTeZeYgXRncr84w0s9EOUgkoLM4XjleHwRsLZkoS8MFi
	Y2dG6i3V0Ncr71HlLyzaPtGCMaKYWQpN4rwnuStNQsAZd3F3BUFcLla/MPIe+6CsiD/ZZRydWjv
	6aZkwNFWBHPE2KqozkLyS1/JqHGO8gBms0K4KWWoncSxZ9eZxZXOnSyljF587J2VcUfRXJ2FxVM
	FhS/N9ciGOsZQHjBx9bUnUE5IUVlZeKqyE9vdWHjXy/EsIrDjG1HXft4PdlMl6JtY/HaFZ9S5gL
	VNIdiNjEErRGsuwlEUJXcgfOAJ/ZzTdKMPxjxpph3aG63d4FJS/af2GyElr3OnRd+nMlbUZoerK
	nIPdSEZZ/2ZqeNS2GEGAt1yA=
X-Received: by 2002:a17:903:1ce:b0:2ef:d157:e128 with SMTP id d9443c01a7336-2f03f1e8493mr100110335ad.52.1795401689016;
        Sun, 22 Nov 2026 18:41:29 -0800 (PST)
Received: from localhost.localdomain ([240e:46c:1b00:720:54e4:b505:2937:4e95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a69sm42783495ad.18.2026.11.22.18.41.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 18:41:28 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: jpoimboe@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org
Cc: live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v2] livepatch: Avoid blocking tasklist_lock too long
Date: Mon, 23 Nov 2026 10:41:19 +0800
Message-ID: <20261123024119.16154-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Problem
=======

As more and more patches accumulate in the cumulative livepatch, we see an
increasing number of latency spikes from latency-sensitive services during
livepatch upgrades. The most recent case is the redis data_server [0].

With some tracing added to the userspace redis code and a hard trace in the
kernel, we finally tracked the root cause down to tasklist_lock contention
during livepatch transition.

When redis flushes data, it clones a new task, which takes the write side
of tasklist_lock. If a livepatch upgrade is in progress at the same time,
tasklist_lock is held for the whole transition. Below is the trace we
captured while reproducing the issue:

=== [2026-11-15 15:18:06] tid=1635309 comm=data_server  WRITE wait=79372 us

        queued_write_lock_slowpath+276
        queued_write_lock_slowpath+276
        _raw_write_lock_irq+69
        copy_process+3474
        kernel_clone+157
        __do_sys_clone+102
        __x64_sys_clone+37
        do_syscall_64+56
        entry_SYSCALL_64_after_hwframe+100

=== [2026-11-15 15:18:06] klp scan held tasklist_lock(read) ~ 96864 us (comm=insmod)

        klp_enable_patch.cold+247
        init_module+477
        do_one_initcall+70
        do_init_module+82
        load_module+2526
        __do_sys_finit_module+200
        __x64_sys_finit_module+24
        do_syscall_64+56
        entry_SYSCALL_64_after_hwframe+100

=== [2026-11-15 15:18:08] klp scan held tasklist_lock(read) ~ 3504145 us (comm=kworker/8:2)

        klp_transition_work_fn+36
        process_one_work+492
        worker_thread+83
        kthread+235
        ret_from_fork+31

  crash> p klp_signals_cnt
  klp_signals_cnt = $1 = 1

The latency budget of our redis workload is 50 ms, while the clone() call
observed during the livepatch transition took ~79 ms.

Environment used for the reproduction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  server: 256C AMD EPYC server
  tasks: 1000~2000
  number of patched functions: around 80

Solution
========

The redis application can work around this issue by removing the clone()
from its data flush path, but I believe we should improve this in the
kernel if we can.

In 2025, we discussed completely replacing tasklist_lock with RCU [1], but
Petr pointed out that it is far more complicated than we expected [2], so
we ended up abandoning that idea.

We still have a more lightweight way to partially replace this heavy
tasklist_lock with RCU, as Josh suggested [3]:

  : Maybe klp_try_complete_transition() could iterate the tasks in two
  : passes?  The first pass would use rcu_read_lock().  Then if all tasks
  : appear to be patched, try again with tasklist_lock.

This patch implements that suggestion.

Verification
============

I verified this solution on my test server:

  server: 64C AMD virtual server
  tasks: ~2000 processes with ~8000 threads, ~30 running
  number of patched functions: 200

- Before this patch
  the maximum clone() latency during the livepatch transition exceeded
  500 ms.

- After this patch
  the maximum clone() latency during the livepatch transition is below
  20 ms, which is within the range expected by the redis side.

Link: https://github.com/redis/redis [0]
Link: https://lore.kernel.org/all/20250227024733.16989-1-laoar.shao@gmail.com/ [1]
Link: https://lore.kernel.org/all/Z8CRXxfI24E9_IHC@pathway.suse.cz/ [2]
Link: https://lore.kernel.org/all/20250213013603.i6uxtjvc3qxlsqwc@jpoimboe/ [3]
Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 kernel/livepatch/transition.c | 48 ++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 7 deletions(-)

---

v1->v2: improve further by skipping the second pass if the first pass fail
	(Josh)

diff --git a/kernel/livepatch/transition.c b/kernel/livepatch/transition.c
index 2351a19ac2a9..0953372359b7 100644
--- a/kernel/livepatch/transition.c
+++ b/kernel/livepatch/transition.c
@@ -444,12 +444,38 @@ void klp_try_complete_transition(void)
 	 *
 	 * Usually this will transition most (or all) of the tasks on a system
 	 * unless the patch includes changes to a very common function.
+	 *
+	 * To avoid holding the tasklist_lock for too long, we iterate over the
+	 * tasks in two passes. In the first pass, we use the lightweight RCU
+	 * read lock to iterate through most tasks. This pass will cover the
+	 * majority of tasks, except for some newly forked tasks which may be
+	 * added into the tasklist concurrently. In the second pass, we acquire
+	 * the tasklist_lock to handle the tasks missed in the first pass.
 	 */
-	read_lock(&tasklist_lock);
-	for_each_process_thread(g, task)
+
+	/* First pass: Iterate over tasks using the lightweight RCU read lock. */
+	rcu_read_lock();
+	for_each_process_thread(g, task) {
+		/* klp_check_stack() requires preemption to be disabled */
+		if (task == current)
+			continue;
+
 		if (!klp_try_switch_task(task))
 			complete = false;
-	read_unlock(&tasklist_lock);
+	}
+	rcu_read_unlock();
+
+	/*
+	 * If the first pass succeeded, grab the more heavyweight tasklist lock
+	 * to check current and any newly forked tasks.
+	 */
+	if (complete) {
+		read_lock(&tasklist_lock);
+		for_each_process_thread(g, task)
+			if (!klp_try_switch_task(task))
+				complete = false;
+		read_unlock(&tasklist_lock);
+	}
 
 	/*
 	 * Ditto for the idle "swapper" tasks.
@@ -681,17 +707,25 @@ void klp_copy_process(struct task_struct *child)
 	 * the thread flag was copied in setup_thread_stack earlier. Bring
 	 * the task flag up to date with the parent here.
 	 *
-	 * The operation is serialized against all klp_*_transition()
-	 * operations by the tasklist_lock. The only exceptions are
-	 * klp_update_patch_state(current) and __klp_sched_try_switch(), but we
-	 * cannot race with them because we are current.
+	 * Disabling preemption explicitly is only needed on CONFIG_PREEMPT_RT:
+	 * there tasklist_lock is a sleeping lock, so write_lock_irq() doesn't
+	 * disables preemption. Without it we could be preempted between the two
+	 * reads below and the RCU pass could switch us, tearing the
+	 * flag/patch_state pair. On !CONFIG_PREEMPT_RT the spinning
+	 * tasklist_lock already disables preemption, so this is a no-op.
+	 *
+	 * The only other updaters are klp_update_patch_state(current) and
+	 * __klp_sched_try_switch(), but we cannot race with them because we
+	 * are current.
 	 */
+	preempt_disable();
 	if (test_tsk_thread_flag(current, TIF_PATCH_PENDING))
 		set_tsk_thread_flag(child, TIF_PATCH_PENDING);
 	else
 		clear_tsk_thread_flag(child, TIF_PATCH_PENDING);
 
 	child->patch_state = current->patch_state;
+	preempt_enable();
 }
 
 /*
-- 
2.52.0

