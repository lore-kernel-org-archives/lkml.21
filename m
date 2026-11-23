Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453839;
	b=wu9wmlE/QA/Y/T0CT3gsvgY/naaVMfBvAPE0QSe33TbDjpzTMFoDbuoaq0aohzU3axIN
	 qXYoW/poD9fYJR869vRTzkn1sRAkqSK+sIpWoJtNh5yWJu8KeqG4gUC8S7sNKGELE8uXe
	 Rrkh1Yc4gfNl+y/i6JjxA4lBk5Iec7nE+31QuaG+EPjaod7oClTHGfg2U7PRVYhhDw0BZ
	 /73GTsXhUQjGMI/XKxJvXt56vKXlirVAEA6RefA9bkS2wbmkSzyO7afGfvojj/UheeUXa
	 s6y9oY6ossO/ySaDYfjsuag1YF3WImSFpOEMcb/c/s0TEZDS8m57zk6JqbljhTY0c7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=BILifpfhsJxw/8cebu89RFMXAUf/5UZN8c2gluqCG5g=;
	b=JMQ3qhS9rSswAEgH9XXSw7NJZijXTfj817npH/G1kNqwGgGqT38scfMI1vuwBJS8YAQ+
	 frJ2sKTkFSMNM4v6pyQQrhZugG+t50z5J/x9se3Ny6hNE7uCsHxK3j5Q82B6+//AappSd
	 yLdJTBWBIR9IfLW2a9XWnphksnZ+IAc6zGI6jDB3tu151GHP6cpNJBYW5jVtCoTn9IOaK
	 xazZME/kIp8IyLUoN3xu43VCNDPhEWUVQ3p6tOoVfisEI7SZCXjQ3Jy5t7lbFMO8pzztM
	 cNAFRC8KpdWcLZkhZ0akyh7WtQzfFMfc1EQCOt1iAjj/M38EBq+NugYJL6ugUabhSoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H8XKyBZN;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC95606A6AB
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CC95606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H8XKyBZN
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4b0a307487aso17726245e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795453838; x=1796058638; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BILifpfhsJxw/8cebu89RFMXAUf/5UZN8c2gluqCG5g=;
        b=H8XKyBZNLHiX9z+C8zzv8Ka3lgVSK/Zu/Sd6379RVMOk3QsZPlKnf8mh7OSslVgVm5
         fxa0udtxrvIf006gv9moBlY7l5NKrBpEnzvaYa+1G0Sfo38NzVeMUxEt3qGaA9A6Fean
         HSoyLTBw555XBQrmsZU7wFr49nyVH+XvCLJnhS9FVQvtyCS3g28tGvhBpLZlosgd7h9x
         mWcF+VssN2l0XhhNfmMNU9RomxMAxCnTzcT4/TSpdsHogESfBSSlANL9HJk/BTIhOKe9
         ByY1geU/gpbGUtt3JxdIUuesf7YLdLdwRXwj7/ivg0/0Q1NftUvE3D9qAmx/jL9EOnZs
         RCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453838; x=1796058638;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BILifpfhsJxw/8cebu89RFMXAUf/5UZN8c2gluqCG5g=;
        b=g3+BhWtmqTWfy8gbwesOkEsW+XVli5U7zupG6paoNEeanu304ij5QHyRi3ut/z/lAJ
         53MeLFS8QWMeD+xgc9UEMV8MviIbkLU+Cbk7cQFfbyOUXEjA1Lmisx34xz6eOg0QOAlh
         znd0VQN6IcHi85NEpdx+JSQcA1YDQGJ+w3cgRQBzq3ooxKNs0i0mH6+dAdzgdHBJnbRN
         FHeGpNiqIFJGT/68d++0jkNTAWJjz+NqWGqNj1h4YdfGQEfvbGWqtAw76HS/2XvNhba5
         QEVsF0i7sFd+AWwKR0qMjAcY/A4fB62JtC1H73A2Z/QMQLWvWY+p1O/qhVGrmz3RDAe7
         uI7w==
X-Forwarded-Encrypted: i=1; AL+hErFzuccZcLURUhdkxuReknUwSl6AHX0VW8z0O9ZslesZlOndM9QtzV8rH1jssruy7S+HDBvvERyTXe+oIxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WgudiDzQR8ZBXO5KHDlPmVHRSe4EacEW3+lSkiilwaDh43JWJ
	CPvGoPguCw7Mzs5be3/ngqZfoooaQIuTSEgbE3axJojxcJq8v3CW+F6wjCHo4Q7zF+Dia4wLcrk
	fmtcArpGvzShf5w==
X-Received: from wmoo15.prod.google.com ([2002:a05:600d:10f:b0:4a1:b721:2a42])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:674f:b0:4bb:7e4e:de69 with SMTP id 5b1f17b1804b1-4bb88814c37mr243733445e9.20.1795453837392;
 Mon, 23 Nov 2026 09:10:37 -0800 (PST)
Date: Mon, 23 Nov 2026 17:10:33 +0000
In-Reply-To: <20261123170846.3165648-1-jpiecuch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123170846.3165648-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123170846.3165648-3-jpiecuch@google.com>
Subject: [PATCH 2/3] sched_ext: Remove scx_wait_dispatching()
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, fangqiurong <fangqiurong@kylinos.cn>, 
	sched-ext@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

scx_wait_dispatching() waits for a task found on a DSQ to leave
SCX_OPSS_DISPATCHING. scx_dispatch_enqueue() now clears ops_state before
a dispatched task becomes visible on any DSQ, and the remote dispatch
paths release DISPATCHING before they lock the task's rq, so the wait
can no longer trigger. Remove it and all its callers.

ops_dequeue() still waits on DISPATCHING, as a dequeue can race a
dispatcher that hasn't inserted the task yet.

Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 kernel/sched/ext/ext.c      | 24 +-----------------------
 kernel/sched/ext/internal.h |  1 -
 2 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 6d8483fb8304..0b7e9c52fa92 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -2727,14 +2727,11 @@ static void wakeup_preempt_scx(struct rq *rq, struct task_struct *p, int wake_fl
 void scx_move_local_task_to_local_dsq(struct scx_sched *sch, struct task_struct *p,
 				      u64 enq_flags, struct rq *dst_rq)
 {
-	struct scx_dispatch_q *dst_dsq;
+	struct scx_dispatch_q *dst_dsq = scx_resolve_local_dsq(sch, dst_rq, p, &enq_flags);
 
 	lockdep_assert_rq_held(dst_rq);
 
 	WARN_ON_ONCE(p->scx.holding_cpu >= 0);
-	scx_wait_dispatching(p);
-
-	dst_dsq = scx_resolve_local_dsq(sch, dst_rq, p, &enq_flags);
 
 	if (enq_flags & (SCX_ENQ_HEAD | SCX_ENQ_PREEMPT | SCX_ENQ_PREEMPT_LAZY))
 		dsq_insert_head(dst_dsq, p);
@@ -2994,7 +2991,6 @@ static bool unlink_dsq_and_switch_rq_lock(struct task_struct *p,
 		 */
 		p->scx.dsq = NULL;
 		p->scx.holding_cpu = -1;
-		scx_wait_dispatching(p);
 		return true;
 	}
 
@@ -3054,8 +3050,6 @@ static struct rq *move_task_between_dsqs(struct scx_sched *sch,
 	lockdep_assert_held(&src_dsq->lock);
 	lockdep_assert_rq_held(src_rq);
 
-	scx_wait_dispatching(p);
-
 	if (dst_dsq->id == SCX_DSQ_LOCAL) {
 		dst_rq = container_of(dst_dsq, struct rq, scx.local_dsq);
 		/*
@@ -5256,18 +5250,6 @@ static bool local_task_should_reenq(struct rq *rq, struct task_struct *p,
 	return *reenq_flags & SCX_REENQ_ANY;
 }
 
-/*
- * The dispatcher runs ops.dequeue() and stores the final ops_state after
- * dropping the DSQ lock, so @p can be found on a DSQ while still
- * %SCX_OPSS_DISPATCHING. Wait for the dispatch to finish before operating on
- * @p.
- */
-void scx_wait_dispatching(struct task_struct *p)
-{
-	if (unlikely(atomic_long_read_acquire(&p->scx.ops_state) == SCX_OPSS_DISPATCHING))
-		wait_ops_state(p, SCX_OPSS_DISPATCHING);
-}
-
 static u32 reenq_local(struct scx_sched *sch, struct rq *rq, u64 reenq_flags)
 {
 	LIST_HEAD(tasks);
@@ -5311,7 +5293,6 @@ static u32 reenq_local(struct scx_sched *sch, struct rq *rq, u64 reenq_flags)
 		if (!local_task_should_reenq(rq, p, &reenq_flags, &reason))
 			continue;
 
-		scx_wait_dispatching(p);
 		scx_dispatch_dequeue(rq, p);
 
 		WARN_ON_ONCE(p->scx.flags & SCX_TASK_REENQ_REASON_MASK);
@@ -5450,7 +5431,6 @@ static void reenq_user(struct rq *rq, struct scx_dispatch_q *dsq, u64 reenq_flag
 		}
 
 		/* @p is on @dsq, its rq and @dsq are locked */
-		scx_wait_dispatching(p);
 		dispatch_dequeue_locked(p, dsq);
 		raw_spin_unlock(&dsq->lock);
 
@@ -5555,7 +5535,6 @@ static void scx_reenq_reject(struct rq *rq)
 			WARN_ON_ONCE(p->migration_pending);
 		}
 
-		scx_wait_dispatching(p);
 		scx_dispatch_dequeue(rq, p);
 
 		list_add_tail(&p->scx.dsq_list.node, &tasks);
@@ -6819,7 +6798,6 @@ static s32 bypass_lb_move(struct scx_sched *sch, struct rq *donor_rq,
 	lockdep_assert_held(&donor_dsq->lock);
 
 	if (rq == donor_rq) {
-		scx_wait_dispatching(p);
 		dispatch_dequeue_locked(p, donor_dsq);
 		raw_spin_unlock(&donor_dsq->lock);
 	} else if (!unlink_dsq_and_switch_rq_lock(p, donor_dsq, donor_rq, rq)) {
diff --git a/kernel/sched/ext/internal.h b/kernel/sched/ext/internal.h
index 58652370da5a..c77f62cd7bc9 100644
--- a/kernel/sched/ext/internal.h
+++ b/kernel/sched/ext/internal.h
@@ -2322,7 +2322,6 @@ void scx_resched_curr_deferred(struct rq *rq);
 u64 __scx_bpf_now(struct rq *rq);
 void schedule_dsq_reenq(struct scx_sched *sch, struct scx_dispatch_q *dsq,
 			u64 reenq_flags, struct rq *locked_rq);
-void scx_wait_dispatching(struct task_struct *p);
 int __scx_init_task(struct scx_sched *sch, struct task_struct *p,
 		    struct cgroup *cgrp, bool fork);
 void scx_enable_task(struct scx_sched *sch, struct task_struct *p);
-- 
2.56.1.750.gf70dc682cf-goog

