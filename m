Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453837;
	b=T2ebkF1IRUv+MhMQI7bbKBkBqVzve72Pwj1njh7LKUjLm1dbMYHRmnNHWaj0QqMYzTnm
	 4F2AY1QORFltEhmTe+CSIVR8O2ShwIqhohtGTMmaueJTZYmZw4LpDY2ba/qQKBj5O8eVb
	 hcGEJjfYRNOGtM8CUtVgOEim5d1t4mbdqJ78P/pTOBbd9ngIp9VhRjoMINpBLTI9NA0gc
	 W0kaqrJsvbaZjB5hNeq4pZSI0RPNKDU4EvUHee5CGpDVQdZDft9KRDkGp2xNQR9DYMtoG
	 XlmkjYeEisHmDFXnrnXG8U+ymNigiKD7O/VXA+CCQPjHdx7F+wB52mE7elJbD0MkbYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=PCqMmm7ydf0lsdxDlwRQHmJxvbfNPyH1GOn4s2cFrCY=;
	b=RTgngZ9l79uWyyJevpTKF4FwIOolpjYSIwbfISgQPvGXj9oyDEiBlUsiGUsVP9OTTza/
	 6PMHYjF5x3MTtHr1TNma5Uu/FFxAtSZqQgxZEI3vVvQOJnji9sAFnTG+RvJSRK7ErZVfy
	 KnYOZV4khFNKFdcxA5Y6uqrssxtl/pbaW8GimEFcSBDiYVEJvxA7LeUuDOy9nP38/MK0M
	 7aDwAsA/JMHIJEUhH8+sg5jUEXyfHOtLhbQWkqm7yGVeDDkzA5x52tiTbr/7JOG/THWyU
	 19TBgeIXTEKFj/m/YcVfB6bR/eOXz7+14AFOmVIx/BWubss7fJ1sZXqGvv0B0smnJaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KDlqh6gr;
	arc=none smtp.remote-ip=209.85.208.69
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BFC606A691
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06BFC606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KDlqh6gr
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b42827bb4bso2742594a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795453835; x=1796058635; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PCqMmm7ydf0lsdxDlwRQHmJxvbfNPyH1GOn4s2cFrCY=;
        b=KDlqh6grwyoldOtsf94ulb4sKAeDICALAD4ihiAWH/51s6V6j1dca+bgF9LmlsGCgT
         4qgOFrlvkqpE9FwIJlWuMUEKVPt8Pf68m0IY+tZD01z0rsKyEV+DCJBMkpmkDVhvyjlt
         uPoDWHF84oVG3hwRWrMtP9HeMl4uBEMkJjbVKCMDUPATYXsodyszhCr4BLpC1KmUpHrc
         jf3ziBMMXiLAdDZQdgojX8e+Zglkb5brEWpec5IibUAGTJhtWDB/4k+mitzw9ttDP4Zv
         SUAPynJMsxnoRS7tHVEpWaPr/pVSLWFYI8BaKkaY8MnFiXuPJNEqU/F2vfTDknn6XjWL
         tUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453835; x=1796058635;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCqMmm7ydf0lsdxDlwRQHmJxvbfNPyH1GOn4s2cFrCY=;
        b=YNpaIXEj+rNIfu4z6n6KWZetvrbot3FTtw8Tt0sD0puH08z3p4wSJiA8WH7j9GVIsG
         hme+uAhvOJ0pqG+hROCK0bxxGCASs6aoGxiSyqOTNy3f4O3GMXnEtRQnCOmajKjsa9fl
         lNhldXNMU/6+IvG+SD+OsF5k2qnxqgqf64fcPrdf3+FNAkMcwqFP5p0B7SXZ/zKX2o8g
         xnrdy76mn39nOEu1GsBpJSZ18UFpaVThmQsf3UQoiwWvcl+2fJWyq+mE5j7weAugnTKW
         uuq+4iUCtAiZLXlCbOd0j1Jwiq3wQPxcESljMzkRvPwYhByKyFAs+pE096V42kCkJONi
         rT+A==
X-Forwarded-Encrypted: i=1; AL+hErF5q3RAz5uWg28ExOdt7s1Qj/13V2oRTNSZVX7KxpOd8i82aC1c4HjvE+BzMyxWnI6sUL6dkjMfYCGCJHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BdM3ihQGue/dpFqAnJmM8LoJHnCpfJepzJ3HQVJkEfFlFhfkY
	/X4EIZaxIrJPhVEbh29RHEXVthSnyFJ4g0r4S7RkOSh2Vxlc2zXuhVwO8gIjS+5FhD5lFl9ymEI
	PsShGfD/75kZi8g==
X-Received: from edai38.prod.google.com ([2002:a05:6402:f26:b0:6b5:77d0:adf5])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:23d0:b0:6b8:8706:59cc with SMTP id 4fb4d7f45d1cf-6ba37e69d7cmr7007358a12.18.1795453835053;
 Mon, 23 Nov 2026 09:10:35 -0800 (PST)
Date: Mon, 23 Nov 2026 17:10:31 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123170846.3165648-1-jpiecuch@google.com>
Subject: [PATCHSET sched_ext/for-7.4-fixes] sched_ext: Fix ops_state and
 ops.dequeue() locking in dispatch
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, fangqiurong <fangqiurong@kylinos.cn>, 
	sched-ext@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

finish_dispatch() hands a task claimed in SCX_OPSS_DISPATCHING to
scx_dispatch_enqueue(), which inserts it into the target DSQ and only
then, after dropping the DSQ lock and (for SCX_DSQ_GLOBAL) after calling
ops.dequeue(), stores SCX_OPSS_NONE. When the task is remote,
finish_dispatch() holds the dispatching CPU's rq lock, not the task's.
This causes three problems.

1) The task is visible on the DSQ while still DISPATCHING. Another CPU
   can consume and requeue it before the dispatcher's final store, which
   then overwrites the new state. Without the waits described below:

     CPU 0 (finish_dispatch(), rq0)        CPU 1 (rq1 == task_rq(p))
     ------------------------------        ------------------------------
     QUEUED -> DISPATCHING
     insert p into global_dsq, unlock
     ops.dequeue(p) ...
                                           scx_consume_global_dsq()
                                             moves p to local DSQ
                                           reenq_local()
                                             ops.enqueue(p)
                                             ops_state = QUEUED(qseq')
     ops_state = NONE
       -> QUEUED(qseq') is lost, later
          finish_dispatch()es of p see
          NONE and drop it, p stalls

   Commit 7de9a6fb44ea ("sched_ext: Wait for SCX_OPSS_DISPATCHING before
   reenqueueing a task") and commit 2935062be771 ("sched_ext: Wait for
   SCX_OPSS_DISPATCHING before moving tasks off DSQs") paper over this
   with scx_wait_dispatching() at every place that takes a task off a
   DSQ. Consuming a task from the global DSQ then busy-waits, with the
   task's rq lock held and IRQs off, until the dispatching CPU returns
   from ops.dequeue(). Lockdep can't see that dependency.

2) For a remote task dispatched to SCX_DSQ_GLOBAL (or to a destroyed
   user DSQ, which falls back to the global DSQ), task_leave_custody()
   does an RMW of p->scx.flags without the task's rq lock. DISPATCHING
   keeps dequeues away, but other paths update p->scx.flags under the rq
   lock without dequeueing:

     CPU 0 (finish_dispatch(), rq0)        CPU 1 (scx_sub_enable_workfn())
     ------------------------------        ------------------------------
     QUEUED -> DISPATCHING
     lock global_dsq, insert p
     tmp = p->scx.flags
                                           task_rq_lock(p)
                                           p->scx.flags |= SUB_INIT
                                           task_rq_unlock(p)
     p->scx.flags = tmp & ~IN_CUSTODY
       -> SCX_TASK_SUB_INIT is lost

3) In the same case ops.dequeue() runs with scx_locked_rq() pointing at
   the dispatching CPU's rq, although SCX_CALL_OP_TASK() promises the
   task's rq is locked. kfuncs that operate on the locked rq then act on
   the wrong CPU, e.g.:

     scx_dispatch_sched()                       /* CPU 0, rq0 locked */
       ops.dispatch()
         scx_bpf_dsq_insert(p, SCX_DSQ_GLOBAL)  /* task_cpu(p) == 1 */
       scx_flush_dispatch_buf()
         finish_dispatch()
           scx_dispatch_enqueue(rq0, global_dsq, p)
             ops.dequeue(p)
               scx_bpf_cpuperf_set(1, ...)
                 scx_error("Invalid target CPU 1")

Patch 1 clears ops_state in scx_dispatch_enqueue() while the target DSQ
(or rq) is still locked and before ops.dequeue(), so a task found on a
DSQ is never DISPATCHING. finish_dispatch() now inserts a remote task
into the global DSQ under the task's rq lock, using the holding_cpu
handoff that dispatch_to_local_dsq() already uses, factored out into
release_dispatching_and_lock_task_rq(). scx_dispatch_enqueue() returns
false on a destroyed user DSQ when the caller doesn't hold the task's rq
lock, so the fallback takes the same path. SCX_TASK_IN_CUSTODY is only
set with the task's rq locked, lockdep assertions are added, and the now
impossible QUEUED && !IN_CUSTODY retry in ops_dequeue() and a stale
comment in scx_bypass() are dropped.

Patch 2 removes scx_wait_dispatching() and all its callers, as it can no
longer find a DISPATCHING task. ops_dequeue() keeps its own wait.

Patch 3 makes dequeue_remote check in ops.dequeue() that
scx_bpf_locked_rq() is the task's rq, and adds a scenario that inserts
tasks into SCX_DSQ_GLOBAL from remote CPUs. dequeue_remote fails without
patch 1.

The patches were written with the help of an AI coding assistant.

Kuba Piecuch (3):
  sched_ext: Fix ops_state and ops.dequeue() locking races in dispatch
  sched_ext: Remove scx_wait_dispatching()
  selftests/sched_ext: Test that ops.dequeue() runs with the task's rq
    locked

 kernel/sched/ext/ext.c                        | 261 ++++++++++--------
 kernel/sched/ext/internal.h                   |   1 -
 .../selftests/sched_ext/dequeue_remote.bpf.c  |  34 ++-
 .../selftests/sched_ext/dequeue_remote.c      |  37 ++-
 4 files changed, 207 insertions(+), 126 deletions(-)


base-commit: 2f7928516314f37d7cb334675656b4412edc8be3
-- 
2.56.1.750.gf70dc682cf-goog

