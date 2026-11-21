Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795234524;
	b=dLJZwX0RxW0M8rnBhNbbunxVjN8vG7Zt1ptrBaryyvX8fLSgDXDLld6RkvbdMqKd2zk8
	 pghKpMfPurO6OlOkP8O7YA9MGVdk+/34FuWWM2/y4K1aU0YcwtOMBS/+jX7VRDBJdafO0
	 Bgi3tnYTXI45+NRdYP4kCUjPefPHsiZh0KkYeARoxIGBwNZwLSBUyfrOLNpB6wEtNBW4L
	 fbApjxyj8NKPpV30mBmcoR+wEemKpqY9XHTvDGN9UMsJLQzpVakkoufqweeS2Iy6Tu4rU
	 yic0Ftg/1AQXa2n811nZP/p1dF7kiWNzdP/1DvOPg4LgCE1Ul+AsZnQYDpU5byRvxgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795234524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JvhpU0Veldl9OJFIGxYPkLLjgu1RWIcxaGd12bSRzks=;
	b=Jx7okW85Fu1z2v5VBKPa7k53+t/FGsvqdv8Y5Px/fGPDtCh4qptUdHpz06MmE4+SiBPU
	 xqdgZtkNxMQdLZ1ll5WJ5FFKLWiPRO2RSK4Mb5yrBDN+SyAZEe8VXDq4PDJUIY9NXGXo7
	 5/4Nb0uoYGvbqlBKE/PHPag70wJEyPU9gOZ6lIiFHKJD9UGARe8rpMf3JzuLy4ErpVNxF
	 gL0wFsgFC+ENNymYM4xcf+KVcZfnJPovZbh/oG2x+sH2g+XOi1Y9R6vvfKTKR+J718zmW
	 NBk/LFLiz3FhPOMmU255Cyekq6CVOFoGXEsYzPOOi5h7WevF7BbMm5y+4TEUKhPC1pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ii5HXJDC;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95C7606A6A4
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E95C7606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ii5HXJDC
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso17522545e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795234517; x=1795839317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JvhpU0Veldl9OJFIGxYPkLLjgu1RWIcxaGd12bSRzks=;
        b=Ii5HXJDCKevy9EF42AwYA17hadIGNGyPFN7eqcTmcOYZpyOxq9usE+H/YriOy/2yAH
         BWk1ZTYRvzUw0iIKLncgFAQxnqcFVE8Et0+SlE0+y3c8wO6hGd4tFQOxVq435gsqXl3E
         knQVmlX73KlcAmbJJ9YoBi20EE2Lm7+OkEwtCEXfYmWAEaoVF6nNLIsF8I+KSSWayW0J
         Y0jFhyC9cdBEM+BwF/krpv70D75mOBxOJaSfrf4L4jNl2Cfiwf5cQKJ3b9upNyJ3vMnC
         jYjSyye2z1TFyzbfVC8UXwCuacNQ3fQJCB46velU2aR2dmCEhjJq0JGGQbl7LRINw4Y4
         qWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795234517; x=1795839317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JvhpU0Veldl9OJFIGxYPkLLjgu1RWIcxaGd12bSRzks=;
        b=EKZgv7Rs3AL+Nn0hZMnFfnTLNkGOpLCNo/5BXgPxQzAY65befYk3/3861+q6/FGVnN
         pV39Ol4RyXKqsnymlgWXPbgNCrWeFPn0ZKLeB+26kwiD+qzi+Na8cfP3eKBEbvbLEtYB
         OQIi8Nl2f8SM7yJYX+ZvrjOlAPAzKNj2Yu2a/8nRhAARI9nH5XUSQVupw/uGYeqsGGI7
         kmkznMpPdcxibo99wOCEDwpnxiZ4KltDXnbQefU0iuBW0JRP2C8xPTqq4DcyNBoP1tHo
         DtLu25o2p0sKCqNOIHQUzK/oAfna96/pVVgRzrjadDT4eFcXA4XLlnhLK7zXor3K0NGq
         EiEw==
X-Forwarded-Encrypted: i=1; AL+hErGymquab2AY0DTVSNUDMhG2df9pDkaqef6wnbhXJ+hqX3XLNQXfvGBwK8b9R6xvw+lSX4/Fyymkqf2gp2A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jzb1w2gUZlgflqG9JuLbInwfncsaLY3IpN5CU5qsZMt13HiKk
	obzUWBY2C3pybi6iz85/IhP9B61IDkMKTY6NRCB8am6L8sSYLhdLtvkS16+wm5asYwg=
X-Gm-Gg: AZFdTZdxsYjWIwBFjz87LRrNnapKo9ET9xWZSO3rdlgz7hJlWUQAi9H60tp0/Dx+d1T
	dssN5saVfB15cCQQiWcbp7QK9lpNnXVTG8xh8n7IPcRE64DpqlhBBb41zM5IDDUxi5Bu8YFJBhl
	K8WWeJ0ByWfCYmELIphndo/dQ66B9hojhhSQQFF21aqkyMSnzjrzWMdXkcYMEixo9VnXH+VBMqo
	8inpJc7m2jkQN1cR6E2dXGaictPu8eWSLZSiW05SoQyp6JxXihKXiEPjMtcE2JGKIxh6NsDzjL0
	rpv++Dm8k8O9JR2sXEGmbL/nsu9yLuVk0Wh3dClPaCdztpKgJW3PzIC5po0niBx0Ic0TvIenK3C
	hbBLlDu9+RB9lOKw4M3oxe5Rxo37zxR1I4M/U8GzHqzplhOhdt1MdbvE9nCHb2F0kDPCigVwdUs
	0mx0nZqKjcQpuNJu6coXeKvQD3slSkGVEHIja/ynUqiBvU2Nd2+WVrUKDdudjjzrCAQklbozpnR
	KttKqnfQsMn4QZiwtkW9Fq0QEU+2g/9WsS2xhn1vnU5MVt6l7Z/Z3BVIXm/f0XvqJbAjG9wNMhT
	T8iYN9z1Y40oZilxpUbWEOjdxhJC8nFl7x6eIV+1NUS+8G794WCEVZitPbwGYVuzQoV3o4M16Nz
	T6g==
X-Received: by 2002:a05:600c:8b83:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4bb8880642cmr113390235e9.17.1795234517315;
        Fri, 20 Nov 2026 20:15:17 -0800 (PST)
Received: from aerith (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm90032175e9.4.2026.11.20.20.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 20:15:16 -0800 (PST)
From: Qais Yousef <qyousef@layalina.io>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Christian Loehle <christian.loehle@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>,
	linux-kernel@vger.kernel.org,
	Kayra Cizmeci <kayracizmeci@gmail.com>,
	Qais Yousef <qyousef@layalina.io>
Subject: [PATCH v6 3/3] sched/uclamp: Move uclamp_rq_{inc, dec}() from core.c
Date: Sat, 21 Nov 2026 04:15:07 +0000
Message-ID: <20261121041507.39582-4-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121041507.39582-1-qyousef@layalina.io>
References: <20261121041507.39582-1-qyousef@layalina.io>
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

Fair and RT throttling can dequeue tasks without going through core
leading to partial dequeue and corrupt rq uclamp state. Fix the problem
by pairing uclamp_rq_{inc, dec}() with {add, sub}_nr_running() so that
each class that cares about uclamp updates the rq state along with the
nr_running. For RT use {inc, dec}_tasks() when a task is added/removed
since managing nr_running is more complicated.

Since RT group throttling doesn't actually dequeue the task but only the
group but lies about nr_running, it is a more complicated fix and there
are proposals to mark it as broken, so this is not handled and left
alone.

Remove the sched_delayed guards from uclamp_rq_{inc, dec}() since we now
react at the appropriate time to do the operations and no longer need to
care about this detail. With this gone, the flags parameter can be
dropped too.

Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 kernel/sched/core.c    | 33 +++++++++------------------------
 kernel/sched/ext/ext.c |  6 ++----
 kernel/sched/fair.c    |  6 ++----
 kernel/sched/rt.c      | 10 ++++++----
 kernel/sched/sched.h   |  8 ++++----
 5 files changed, 23 insertions(+), 40 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index a2035d66270b9..bf690d27faf6e 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1866,7 +1866,7 @@ static inline void uclamp_rq_dec_id(struct rq *rq, struct task_struct *p,
 	}
 }
 
-static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags)
+void uclamp_rq_inc(struct rq *rq, struct task_struct *p)
 {
 	enum uclamp_id clamp_id;
 
@@ -1879,13 +1879,6 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
 	if (!uclamp_is_used())
 		return;
 
-	if (unlikely(!p->sched_class->uclamp_enabled))
-		return;
-
-	/* Only inc the delayed task which being woken up. */
-	if (p->se.sched_delayed && !(flags & ENQUEUE_DELAYED))
-		return;
-
 	for_each_clamp_id(clamp_id)
 		uclamp_rq_inc_id(rq, p, clamp_id);
 
@@ -1894,7 +1887,7 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
 		uclamp_rq_clear_idle(rq);
 }
 
-static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
+void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
 {
 	enum uclamp_id clamp_id;
 
@@ -1907,12 +1900,6 @@ static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
 	if (!uclamp_is_used())
 		return;
 
-	if (unlikely(!p->sched_class->uclamp_enabled))
-		return;
-
-	if (p->se.sched_delayed)
-		return;
-
 	for_each_clamp_id(clamp_id)
 		uclamp_rq_dec_id(rq, p, clamp_id);
 }
@@ -2151,8 +2138,6 @@ static void __init init_uclamp(void)
 }
 
 #else /* !CONFIG_UCLAMP_TASK: */
-static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags) { }
-static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p) { }
 static inline void uclamp_fork(struct task_struct *p) { }
 static inline void uclamp_post_fork(struct task_struct *p) { }
 static inline void init_uclamp(void) { }
@@ -2188,11 +2173,10 @@ void enqueue_task(struct rq *rq, struct task_struct *p, int flags)
 		update_rq_clock(rq);
 
 	/*
-	 * Can be before ->enqueue_task() because uclamp considers the
-	 * ENQUEUE_DELAYED task before its ->sched_delayed gets cleared
-	 * in ->enqueue_task().
+	 * Need to be careful what operations are done here, some classes like
+	 * fair and RT can enqueue tasks without going through core due to some
+	 * features like throttling.
 	 */
-	uclamp_rq_inc(rq, p, flags);
 
 	p->sched_class->enqueue_task(rq, p, flags);
 
@@ -2222,10 +2206,11 @@ inline bool dequeue_task(struct rq *rq, struct task_struct *p, int flags)
 	psi_dequeue(p, flags);
 
 	/*
-	 * Must be before ->dequeue_task() because ->dequeue_task() can 'fail'
-	 * and mark the task ->sched_delayed.
+	 * Need to be careful what operations are done here, some classes like
+	 * fair and RT can dequeue tasks without going through core due to some
+	 * features like throttling.
 	 */
-	uclamp_rq_dec(rq, p);
+
 	return p->sched_class->dequeue_task(rq, p, flags);
 }
 
diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 0403c46342813..fe0971cdba691 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -2174,6 +2174,7 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int core_enq_
 	p->scx.flags |= SCX_TASK_QUEUED;
 	rq->scx.nr_running++;
 	add_nr_running(rq, 1);
+	uclamp_rq_inc(rq, p);
 
 	if (SCX_HAS_OP(sch, runnable) && !task_on_rq_migrating(p))
 		SCX_CALL_OP_TASK(sch, runnable, rq, p, enq_flags);
@@ -2319,6 +2320,7 @@ static bool dequeue_task_scx(struct rq *rq, struct task_struct *p, int core_deq_
 	p->scx.flags &= ~SCX_TASK_QUEUED;
 	rq->scx.nr_running--;
 	sub_nr_running(rq, 1);
+	uclamp_rq_dec(rq, p);
 
 	scx_dispatch_dequeue(rq, p);
 
@@ -5068,10 +5070,6 @@ DEFINE_SCHED_CLASS(ext) = {
 	.prio_changed		= prio_changed_scx,
 
 	.update_curr		= update_curr_scx,
-
-#ifdef CONFIG_UCLAMP_TASK
-	.uclamp_enabled		= 1,
-#endif
 };
 
 s32 scx_init_dsq(struct scx_dispatch_q *dsq, u64 dsq_id, struct scx_sched *sch)
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0feec172fd37e..a518e28538a7f 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8210,6 +8210,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 
 	/* At this point se is NULL and we are at root level*/
 	add_nr_running(rq, 1);
+	uclamp_rq_inc(rq, p);
 
 	/*
 	 * Since new tasks are assigned an initial util_avg equal to
@@ -8328,6 +8329,7 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
 		__dequeue_entity(cfs_rq, se);
 
 	sub_nr_running(rq, 1);
+	uclamp_rq_dec(rq, p);
 
 	/* balance early to pull high priority tasks */
 	if (unlikely(!was_sched_idle && sched_idle_rq(rq)))
@@ -15886,10 +15888,6 @@ DEFINE_SCHED_CLASS(fair) = {
 #ifdef CONFIG_SCHED_CORE
 	.task_is_throttled	= task_is_throttled_fair,
 #endif
-
-#ifdef CONFIG_UCLAMP_TASK
-	.uclamp_enabled		= 1,
-#endif
 };
 
 void print_cfs_stats(struct seq_file *m, int cpu)
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 1535046a23ffa..fd116139ac9bf 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1182,6 +1182,9 @@ void inc_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
 
 	inc_rt_prio(rt_rq, prio);
 	inc_rt_group(rt_se, rt_rq);
+
+	if (rt_entity_is_task(rt_se))
+		uclamp_rq_inc(rq_of_rt_rq(rt_rq), rt_task_of(rt_se));
 }
 
 static inline
@@ -1194,6 +1197,9 @@ void dec_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
 
 	dec_rt_prio(rt_rq, rt_se_prio(rt_se));
 	dec_rt_group(rt_se, rt_rq);
+
+	if (rt_entity_is_task(rt_se))
+		uclamp_rq_dec(rq_of_rt_rq(rt_rq), rt_task_of(rt_se));
 }
 
 /*
@@ -2634,10 +2640,6 @@ DEFINE_SCHED_CLASS(rt) = {
 #ifdef CONFIG_SCHED_CORE
 	.task_is_throttled	= task_is_throttled_rt,
 #endif
-
-#ifdef CONFIG_UCLAMP_TASK
-	.uclamp_enabled		= 1,
-#endif
 };
 
 #ifdef CONFIG_RT_GROUP_SCHED
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 4706f73838a86..5bbed5ff2d957 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2652,10 +2652,6 @@ enum snt_e {
 
 struct sched_class {
 
-#ifdef CONFIG_UCLAMP_TASK
-	int uclamp_enabled;
-#endif
-
 	/*
 	 * move_queued_task/activate_task/enqueue_task: rq->lock
 	 * ttwu_do_activate/activate_task/enqueue_task: rq->lock
@@ -3705,6 +3701,8 @@ static inline unsigned long cpu_util_rt(struct rq *rq)
 
 unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
 void init_uclamp_rq(struct rq *rq);
+void uclamp_rq_inc(struct rq *rq, struct task_struct *p);
+void uclamp_rq_dec(struct rq *rq, struct task_struct *p);
 
 /*
  * When uclamp is compiled in, the aggregation at rq level is 'turned off'
@@ -3814,6 +3812,8 @@ uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
 }
 
 static inline void init_uclamp_rq(struct rq *rq) {}
+static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p) {}
+static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p) {}
 
 static inline bool uclamp_rq_is_capped(struct rq *rq) { return false; }
 
-- 
2.53.0

