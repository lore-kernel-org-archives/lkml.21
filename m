Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606121;
	b=jr5m1cF3+zdb27aVeMh0Sg8TWswmoX18PqylnfkAhzECeBB2mCjduX4k6Ni5K4E9GWYe
	 Xk00LuqgxIt48EI01xWr9E/jDn/8bdoahk+6HhxwOnD3sch39UFEYpcz0P8jKJ090RU2w
	 SHEFxPnphpTnBqlKqo38uBjD/C3m/hSVdy/TO71zJv+ioKJb0dUd2bUbYOU+n5N9DrPWA
	 HpFXevDpQadGSWzFWpV5sbbGCFHEN0NezCwZCH5uQ2h6p4K5jNv1LguhFObQm5BUEAyS2
	 +8mmBoREOiRwGqyMuB/GDRjQR1V7f0R5iQIQFILwggk7DwpZCqrEFcUxGg/twbAPekw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ZYZwLQfYchu10NlP8wZM+iDrPykFs3AzjnpE4jR9w34=;
	b=mmVtmfXeo+lp/SL84llTAUIeHx1ys8qq0I99g4qkHbLgNCtGUP1he+Apzx+/HGfLVf9b
	 q1FB6qV3pjPE4glkeKrQ85jmME+6hS8xfD4lfaJ/a8Xh6YhdNjKDNsQ0yMORheIEI9bYa
	 XJza69EemrVH3VxGpAfCMCtsxeRN102cVJH7MXsDU446Zzg/ECMkJSXZAT8ckahDJk0oe
	 N4BsRp6ZV9NAsEJNaEVeR1UtRg3laQc1armSUmuclwDi2JaNYN2dAiLkGABNZdqcI07D8
	 bG6OGq+uEUFjIq0FfVgmJMgT2rwwVSdYuCgONRPpH+YURtl9WAKMUA5DSajbaXav+oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="cD0cn/qs";
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C34606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80C34606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cD0cn/qs
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e011829easo3401310f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795606120; x=1796210920; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZYZwLQfYchu10NlP8wZM+iDrPykFs3AzjnpE4jR9w34=;
        b=cD0cn/qsIDIDQttTrW/fdVDa4M6smWYt3mmHlGLWAVhG6v2h0FA3cxaMY5l6fUjqJ8
         HlmsTj+g620qKsEaqke8X0EIHxDDCkNk/CR5b0Bgego88U1U7/G9ESc/3ga+8bbnt7M4
         QNKa0V6EL74o1FmhNcuyEFLmL0ywTX9Tk2bWAs1q88lJSvBvgAwI32mkzUdfRlyWNTD4
         6g0RLzn+6qC3l95yJgkIvFQCKfg3+Jc2mYMm3/7bwjK2ixjImvsUA/3R0ooOKczmA4FK
         uR0ca1SuoHyWv/PdrZEJsU/FlDwZgz0tHdhzTGZRqTLv+6XmXN/+gUMV7nMW3JCgucbK
         t/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606120; x=1796210920;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYZwLQfYchu10NlP8wZM+iDrPykFs3AzjnpE4jR9w34=;
        b=beOv0VtkTkh74pc7kU9xN7TENEtE6l5uASeZX+o2aCjUwPOYob/MaaGm62icQ37iss
         kvUdftv2LSjPFfsxq5318HPYF0hjhmiiuXAxkRQWtH27cPK/umQk3oJz6UF4VfnMf93K
         FK+9XizIVJ3KyimsXf+T5aefm3jZLsx+gPxIs0AL1T/JpHHKl8CntaPRkRmtAI0836rq
         AI1nFM9ng0avfXqCGHdOpL18OCo2B2efyDbnYwGYURCQ0IUET4izH6wbwYHV/iM+fvbn
         kBbYogTJa37VUKM8JO5fSl8F7WrfhHtZwNg1RN6TvKTPFZISaLUSDOAygwfIJ5VcQCJ4
         OyNA==
X-Forwarded-Encrypted: i=1; AL+hErEbXg35upEoVc8HagQeb7ENYHE19lcJfgQMM808r74shfOHs0iCehl7H4e11rFW47nl/n5DTxL9KpTpSbA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cLB3Dy8/9HWf8fpOzO0b9g+diZYKIeVMnsc+omZTS4BLMJXIy
	LJDwxsnealbOCX+hLIWQJl+xH35hbLz3KDA2VU91Kgqi8+xUYQvbTMu8SZKt5Ut6CUAL09PgNLZ
	MkqADmvZy/t0xcQ==
X-Received: from wrpg9.prod.google.com ([2002:adf:f3c9:0:b0:4b7:8eec:f673])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4812:b0:4a6:bc53:247f with SMTP id ffacd0b85a97d-4abb7d45e6cmr30551834f8f.48.1795606119414;
 Wed, 25 Nov 2026 03:28:39 -0800 (PST)
Date: Wed, 25 Nov 2026 11:28:34 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125112553.1539758-1-jpiecuch@google.com>
Subject: [PATCHSET v2 sched_ext/for-7.4-fixes] sched_ext: Fix ops_state and
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

Patch 1 factors the holding_cpu + SCX_OPSS_NONE + switch_rq_lock()
handoff out of dispatch_to_local_dsq() into
release_dispatching_and_lock_task_rq() with no functional change.

Patch 2 clears ops_state in scx_dispatch_enqueue() while the target DSQ
(or rq) is still locked and before ops.dequeue(), so a task found on a
DSQ is never DISPATCHING. finish_dispatch() now inserts a remote task
into the global DSQ under the task's rq lock via
dispatch_remote_task_to_global_dsq(), using
release_dispatching_and_lock_task_rq(). On a destroyed user DSQ,
scx_dispatch_enqueue() clears ops_state after scx_error() and returns
without falling back to the global DSQ, leaving scx_bypass() to recover
the task. SCX_TASK_IN_CUSTODY is only set with the task's rq locked,
lockdep assertions are added, and the now impossible QUEUED &&
!IN_CUSTODY retry in ops_dequeue() and a stale comment in scx_bypass()
are dropped.

Patch 3 removes scx_wait_dispatching() and all its callers, as it can no
longer find a DISPATCHING task. ops_dequeue() keeps its own wait.

Patch 4 makes dequeue_remote check in ops.dequeue() that
scx_bpf_locked_rq() is the task's rq, and adds a scenario that inserts
tasks into SCX_DSQ_GLOBAL from remote CPUs. dequeue_remote fails without
patch 2.

The patches were written with the help of an AI coding assistant.

Changes in v2:
- Split release_dispatching_and_lock_task_rq() extraction out into a
  separate preparatory patch (Patch 1) (Tejun).
- Patch 2: On a destroyed user DSQ in scx_dispatch_enqueue(), clear
  ops_state and return instead of falling back to the global DSQ,
  letting scx_bypass() recover the task and dropping the bool return and
  finish_dispatch() retry (Tejun).

v1: https://lore.kernel.org/all/20261123170846.3165648-1-jpiecuch@google.com/

Kuba Piecuch (4):
  sched_ext: Factor out release_dispatching_and_lock_task_rq()
  sched_ext: Fix ops_state and ops.dequeue() locking races in dispatch
  sched_ext: Remove scx_wait_dispatching()
  selftests/sched_ext: Test that ops.dequeue() runs with the task's rq
    locked

 kernel/sched/ext/ext.c                        | 264 ++++++++++--------
 kernel/sched/ext/internal.h                   |   1 -
 .../selftests/sched_ext/dequeue_remote.bpf.c  |  34 ++-
 .../selftests/sched_ext/dequeue_remote.c      |  37 ++-
 4 files changed, 208 insertions(+), 128 deletions(-)


base-commit: 97e1c7d467d07734f8f5c8c64730e1f7c415bd46
-- 
2.56.1.839.g22a8290db9-goog

