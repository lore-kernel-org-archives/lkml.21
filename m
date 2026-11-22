Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795387765;
	b=Z81Gh5rVlt4m7lS7JozukeN4+tLLiCy8Sa//3Eyl+bukFr/kxSaLTlQpyBs7ElaxVRs5
	 +hQVxcTJOoIK8vWKjErX5HsanlbeJULHqCqIjHYeM4o9/CxOlGqMZfX8U6a2Fj+/snCjG
	 F/xkbEUQ+Tp+ICT6ZdDJkHbBKhLyszEX87WQe88D8TFKTI1jzhTpAMiqMlvke4P9tSUn2
	 Ztqh0G1VaaSgCM/0DoW/dpMwOTfZuP+Ab1c6i1+ra/lEMh00MNFodMFZFQ9VwUcW1vpc4
	 C2fAOgQrcZJhS8uXVJgQuSG3sGJ26BM/F1P7izhfp+hyWwSctrJHmqc5DEbOea1A3tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795387765;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=1ziqjZyBRuRS+qQHLrvDG2XayzAfuXbvU4in4BrFOjQ=;
	b=sMRE2UjDiqo1+peW7BEChpdPqSQ+Y0HM4UlGwLqbvoYiglnTd9VUcjN5f/NM8QtsUOGx
	 UalBl4EKElHcrzFpJuY9QEq5IG3Ee1cj/OrUR1Yf7g/CJ3k2+irU1GIT6VXL9YD0JltoM
	 tsCq/RzpS8umYyLQVZTlXaB8nOM8jCj0VOZeTADfRoDnmsMV7+ppoLj9FMqIHYkq+Dasq
	 BGIsKB1sUOlJzTeiedPeWeokKFGoqslPx3+au/6AknD+zd+IYxGHk1r7Z20BGeB06KYEA
	 RCyW4xm8mRWGzF2PQ1B/4h3cWlxZaGzJTqYKCm+o84+a51naS+LwBabtqXL9rc2jTdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=iPsjVZYz;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=s44ofxmV;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4A2606A6AC;
	Sun, 22 Nov 2026 22:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B4A2606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=iPsjVZYz;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=s44ofxmV
Date: Sun, 22 Nov 2026 22:49:20 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795387763;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ziqjZyBRuRS+qQHLrvDG2XayzAfuXbvU4in4BrFOjQ=;
	b=iPsjVZYzeomiE4NUbYOjSo2V2A5IrFYjM6KEqK816gdiE97K4i5q/TnoNOZQGm+BiwDXEr
	C89h8yYitTRvXU4rJOVeFK/59tTqZF3G6fAqATBLyEE/NeJduaylVgv65h461Unw57BGwx
	tuS0y89Xxb1mKRpEoh0+TV9l9yEDQdeUGsK1sr90eVJFQPwU8WOE5s9z32/95H7dR+pvw2
	l0lw6IOc0AQ0xRQyKrGic/ZvlHpZEwZ/WIVCnCBXO13wv0qlcowlfB5xapqM5ejYKrX6v/
	SchneuRQPShpBnRelT4HAJd/Rlf35OBKXrDs32++CHocyMQ+b12RrKiJOvXJsw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795387763;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ziqjZyBRuRS+qQHLrvDG2XayzAfuXbvU4in4BrFOjQ=;
	b=s44ofxmVUWpuXxe+WfBUqxnqfuNyzT6aS/027r8B19sYOUDZ2OE7YO1whAb0OEtI9zAY7v
	XczBheLSTn+9hlAA==
From: "tip-bot2 for Fushuai Wang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/core: Fix a TOCTOU bug in
 sched_non_preferred_cpu_push_stop()
Cc: Peter Zijlstra <peterz@infradead.org>,
 Fushuai Wang <wangfushuai@baidu.com>, Ingo Molnar <mingo@kernel.org>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261120051625.50133-1-fushuai.wang@linux.dev>
References: <20261120051625.50133-1-fushuai.wang@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179538776083.92412.4311246927428883759.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     caf089159ed2852e935f4481e6e20ab9fddb7609
Gitweb:        https://git.kernel.org/tip/caf089159ed2852e935f4481e6e20ab9fdd=
b7609
Author:        Fushuai Wang <wangfushuai@baidu.com>
AuthorDate:    Fri, 20 Nov 2026 13:16:25 +08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Sun, 22 Nov 2026 16:16:44 +01:00

sched/core: Fix a TOCTOU bug in sched_non_preferred_cpu_push_stop()

sched_push_current_non_preferred_cpu() is called in IRQ context. It
checks is_migration_disabled() before queuing the stopper.

migrate_disable() sets p->migration_disabled in preempt_disable() section.
An IRQ can hit after preempt_disable() but before p->migration_disabled=3D1.
After the IRQ returns, the task cannot be preempted by stopper because
preemption is disabled, so it finishes setting p->migration_disabled=3D1
before the stopper runs.

It may be like:
    task context:                       IRQ context:
    migrate_disable()
        preempt_disable()
                                        is_migration_disabled()
        migration_disabled =3D 1
        preempt_enable()

So recheck is_migration_disabled() in sched_non_preferred_cpu_push_stop()
before calling __migrate_task().

The stack may be like:
   WARNING: kernel/sched/core.c:3432 at set_task_cpu+0x1b8/0xdf0, CPU#21: mig=
ration/21/152
   CPU: 21 UID: 0 PID: 152 Comm: migration/21 Tainted: G        W  O        7=
.4.0-rc1 #3 PREEMPT(lazy)
   Stopper: sched_non_preferred_cpu_push_stop+0x0/0xb10 <- sched_push_current=
_non_preferred_cpu+0x6a6/0x9a0
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
Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Link: https://patch.msgid.link/20261120051625.50133-1-fushuai.wang@linux.dev
---
 kernel/sched/core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index b2f6b99..c9890ed 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -11354,7 +11354,8 @@ static int sched_non_preferred_cpu_push_stop(void *ar=
g)
 		rq->npc_push_work_pending =3D false;
 		update_rq_clock(rq);
=20
-		if (task_rq(p) =3D=3D rq && task_on_rq_queued(p)) {
+		if (task_rq(p) =3D=3D rq && task_on_rq_queued(p) &&
+		    !is_migration_disabled(p)) {
 			struct rq *dest_rq =3D __migrate_task(rq, &rf, p, cpu);
=20
 			if (rq !=3D dest_rq)
@@ -11395,6 +11396,11 @@ void sched_push_current_non_preferred_cpu(struct rq =
*rq)
 		if (rq->npc_push_work_pending)
 			return;
=20
+		/*
+		 * Racy: is_migration_disabled() isn't stable in IRQ
+		 * context and can race with migrate_disable(). The stopper
+		 * should recheck it.
+		 */
 		if (is_migration_disabled(push_task))
 			return;
=20
