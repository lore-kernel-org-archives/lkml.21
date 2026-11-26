Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678137;
	b=e7Qqd8SK+61K4Ok1ImnJkRzc0dFLwgXbAykSfyofH83zJaSvSdPMhNftz+74WH2JRqVr
	 T4qKCktFzbiWTLADqpz3DE83Rymh3jvsRCfaR5CZnnXcNUvn7pzSyjn++U+/5zO/6jNqW
	 XQs4TqMCbeAjVf4A5OhXuPe34t6a67zakx9MWwoKxX++EIbabZ5ls/QpoqFVGCS1XjoM2
	 eO43pkqCX1eFlGYjfcfl/4SEvs7y5aYBkkjms2NE2rRPWVnmJfD6cl6FmXgvItjLdDoJF
	 XP/1junBOuLjtVAe1Yiu84qyGBIvl+T3xtkrpFJ69BwkoXFrVyGyi7dI9rPnW8khz2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kAalqxfxZCZO4sNiFlK3ouIz24MCsQGbMzL88+QHtpw=;
	b=5YSsZIVQuQtgaRXhJT2ltvJK+d8bN/KcdbXAa2qsH0baR/ASalxbKZdc+VQKykMr4Oth
	 IsW4pEp3KqSaFY3zRGvhrzMXb5SfJL3nEFCwI+N8kcMFe0C7iUs4sf53IIlXy2JhwtOfS
	 1EkgHUPWw6FZPxsTVHyJBk/tmGh9QqLynzEb9V1hN+w/3wcePBgYlceSuErCVzNYr0TYI
	 nrrp3VzYI06zBqV4f/zCeoh7IvX8SswQHAsa/J1TRkuo5KxzzcP+o+TXutSCc5t9BbENP
	 xwGUMa7OJ6OBhIornbEarzi8zpAz85g5Pb4ZyZ8vQf7CyiRYb/fMufx1u58AXFSVnzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nUHlouIf;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3966606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3966606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nUHlouIf
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso4532875a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795678136; x=1796282936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kAalqxfxZCZO4sNiFlK3ouIz24MCsQGbMzL88+QHtpw=;
        b=nUHlouIfEWRaW5BM8C4xx9IPmfLhYRQfxvdZrYws7+GyVLmwswxZMAIwV9qv+/WqMy
         gZh7+LdcmmSBeFiny6nudMfGlIknw2BrE2NBONcBeC/lo0Pea7GaCEuCgebaWZeGBdvw
         JaL9cAfAp1LMQsaMSUqM6pBMcGNLAVCl21ChbSgtEbG+qZ6ooZWzniRhsgLts9fK28nb
         1DWHPUD07TSACo3IauAv2dZ0WDMdj0jPtfkzLqvNhaAmjlYn7VSPg6mt2zqcjrWoZTEL
         c6l1dajvcVpvGAsCZHsQn+Ack4xHjA/M6ClGpx+FqkMcvtwShNkAGgD6XfJMAe67aQME
         cJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678136; x=1796282936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kAalqxfxZCZO4sNiFlK3ouIz24MCsQGbMzL88+QHtpw=;
        b=vP+RtHiHE8fCX0BXHr0VkMKHPAfJzL0zT++/q4FC9yGG687ASMJXfWENxgz68bhCn0
         +XcXpXtOtwXVyaZEm/RmdmE+vtENR5L2ut40gXkgKsk2FBFbv/hIbCRYnnvKNJwqYIOt
         rp6/a5qkFfFUgxTt5Lnlk5kmXFNJyEWb7rL95Cp69MHWj6LldkHoAZvmZ3j4mShFnT+6
         ZwJGJl18s8AayDaDRCXCybZWB9KSTFV4c7r1Df7vhDKO6L0ZepZ9xt4TxtNBw35KbZy/
         5c7WpLqK3ATTAe34SU55kYBHwP6obZrQRlnsC97IHCrE1/09C0zbW5NcfP/utqqxFMc3
         HJ5A==
X-Forwarded-Encrypted: i=1; AL+hErG32NYINT3Hy/fq6oo52tLnS1LWldaATVJpnMYq+36zRqM/V3oH4BsazegDu/dpyxDHmDRhWBUZi1sqsx4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HXyB9c2FEBqKlwnu2IhnawGiBM8eKfWG0B9sG1YHV8Wx32owu
	GQvQDTjyF/cEyMGCDfLzkuZPFMMLBZ7jj9qeItWYGeCMZS9pbwGYg+Uu
X-Gm-Gg: AZFdTZdHpmqHaHoXl2hub4Fz/sXdD+aZcZdzoQksmkL8mL41tcPkjv3DPcUDpriRjEM
	0ykXCy0TM5ePJ/5yx+Tu0pKG/3p+yPr8vQe7AR/JDujcY9ql8EWoticcOLOScDMZXgYQoXG2pAA
	sK8qWAerCnRC/z7w3vxMnDSBjItKVm+WgA4jYeXuUDtf4GdFuUDlH19Q0yTH8kEwynV6mvsVrb+
	Iz/EiNucQKZ7R/USxVPpjEn6+jcwuu1k8qnGWPfWfpGq5fR/GPc624mgNFXyGQU9f2XzI0oPtUJ
	AHRbU4BDDo/UDLlaGq1mroJDQVi1oncULjQvB9/+sZVroOcZQ64vY+KXWOHbl1BkoPd9wWO3mTO
	gE6W8LQy/jJt5OeZLllVxOdvjZfDj+s2aiLyCzqW0tjKcCgT9d43/eEvcKvzIEIwejFk76NcAkA
	DWK30GkZ+m8QZi2ooP3aWKGIe8uSEHlRS9xk4pbKkRgFKGxF3GA87owBZtFnZ7cAgmmJo9W8OOQ
	UcbPnKNYH14POiUD13bzB0FgYh2b2GyWeVgUnJtLq3ik13LmADXW1kq2124zD8APR7I8OtCnyTs
	F80PtbvP2D2BHGfbhxaicK3XufJu/tNL38TH5MnMxXlkEVc3RFpRg7oWhERb60V5tflkC2Tq5w2
	fm3GZo3axGjIwR0zFB7ppdQ==
X-Received: by 2002:a17:90b:4a47:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3b41c8fe84amr20623464a91.10.1795678136058;
        Wed, 25 Nov 2026 23:28:56 -0800 (PST)
Received: from localhost.localdomain ([240e:46d:2300:827:b108:4552:5e9:4319])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b217a5bsm14772112a91.0.2026.11.25.23.28.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 23:28:55 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: jpoimboe@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org
Cc: live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v3 2/2] livepatch: Avoid blocking tasklist_lock too long
Date: Thu, 26 Nov 2026 15:28:29 +0800
Message-ID: <20261126072829.97792-3-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261126072829.97792-1-laoar.shao@gmail.com>
References: <20261126072829.97792-1-laoar.shao@gmail.com>
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
 kernel/livepatch/transition.c | 44 +++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/kernel/livepatch/transition.c b/kernel/livepatch/transition.c
index 4739fc170f48..2f3cffa897a8 100644
--- a/kernel/livepatch/transition.c
+++ b/kernel/livepatch/transition.c
@@ -458,12 +458,34 @@ void klp_try_complete_transition(void)
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
 		if (!klp_try_switch_task(task))
 			complete = false;
-	read_unlock(&tasklist_lock);
+	}
+	rcu_read_unlock();
+
+	/*
+	 * If the first pass succeeded, grab the more heavyweight tasklist lock
+	 * to check any newly forked tasks.
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
@@ -695,17 +717,25 @@ void klp_copy_process(struct task_struct *child)
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

