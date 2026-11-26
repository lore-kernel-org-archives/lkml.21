Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656529;
	b=InjPnVQ8fgu5nDRFyTHLFIv9Tp6vQUKx0v2BzdhIz8O1I5MUaXoWrS8FluLvxVN2WDC8
	 EW/+YphtaiokJUOBBXicvr0V4oYBJLqEQa8dtzkp8hxlCNPqcQdRVk2rIPUPuy7AbKnmj
	 kNY+efDsngnGvYpQDsw9rryJS1MdgM3/VQ1DnYLZTAh9WOXwXezq/xmFqmvKLylo5uh1Y
	 q+TSVae+HGfDHwRFzEFNFpDfL2nFumptx3K/jzHYnHdZIGDf34VTCy3NncdSyGPTA8LqP
	 kfZNr8TLJGqU99dSvCGcWRR05hKjB1qd1/9k4ObDMeQPJ6sw1T1k8CLULp3v6kILHvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7S05gQFwDGSilhZNn3UVXq/+P8b7K7pLFrrNV31ejLI=;
	b=TM7qbvGtWGc4ldL8PunlOgU+rJaQKMsRs5wJGt1KK8Lcu0nHowaFoEtabGPi95u0YLUk
	 wc3J5GbNfJ+J4HGawbG4f3aNwRm7AIYvMzDIEoi2xQlMhWm+R8aQlyyxdllrBm6+VYial
	 GJfFyO7R0w7cCQYJJlNFgn/6mtAiWuVJ1vC2Jt5SrdrrgGZlS+q4UPPk4QdhFEN7thDgG
	 D2mmGHb74XVG/9XX5XCuTZRyOZyLNeU77Apt39BhxcdTr5iWPT/iFcsuQzhBxBXN/LXco
	 A0J0tnyIutoOUT1ev9/gkmkEZ7G30FykRqDxKwDVcSsK7sdXNdIT87pfzbLD871jb1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="Agm5wPq/";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3FA606A332
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F3FA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Agm5wPq/
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e47347279so3889257f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795656528; x=1796261328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7S05gQFwDGSilhZNn3UVXq/+P8b7K7pLFrrNV31ejLI=;
        b=Agm5wPq/JT1PbzbNO+1qk5mFCN/UE2unMBGXL9bSOo6E9JL2hS5JAhZRInW4yIiqep
         VshNACHmHcnJjdO2GgcJEU0SY+7a2JdRawTnRuNlc/niyFwf36nMKHHNeu3vHlvxnr/A
         2MK2JjACmfZSjgW0xmryGp0jFsS9IEl5MS2IW6C11SvTGhJHXvDNkjif+gQSbDXluaEJ
         PHa19v8I3N1HcNVWkFxW0TitSE9p2oRDOxNxdpJKmKQIEFqP9hioE83OQbabU3DvPBZ5
         mFHVMP0NpVcJ56++uOUB3tuvq8TBYedcgY8uMoRbHHctMctzJAWmYmhXIhTgFCriuX8l
         0E0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795656528; x=1796261328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7S05gQFwDGSilhZNn3UVXq/+P8b7K7pLFrrNV31ejLI=;
        b=FimiMBQIMiTij8MsTShdQYWvBR+sbfjnird/l2URRtYVFtabINZRX0WiRu1zeu3gGc
         9tjD0B0hUtIgW0hODm10+cCVLVIrPQdqkApshCCKowHcKIdfhvU3rosjFMQpo5qD4AIh
         EOZnbISH/+gvYFb3AlWvs6VVXy5XIWpuZHlRjZW7lTXqo/00w/KP5dBSEVqnfIZT0NP8
         W+ZAXf6erJhDSNhX2sNocmEfdVIcWsK/rr/axRnr63SLTzpbieaDKfUFiKF4FHyIHj21
         xdz92sJ4GmE3zwfV75xGAaogRO5qQp2y0GwPJpg9ic61JJlhrH8XtRqCV8TUYhuw8PP/
         o6Yg==
X-Forwarded-Encrypted: i=1; AL+hErEs6vWgzAGD4Kdakat4JoNuIsa+22iJLg3qu0gVN7Tu4Zfh+vJOlD+OkfSOeBfEJrsVl/xMK73OSL62o5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5Nw4xfH4SByWt4iyAC/l7rHAeDU8MnKfXd+D+nWnstNsRnO05
	se+k9FfnEnVJ+MFHwVebXjfL2hNyWHTFHiYdPw68AvYiCkimGDsxjrt1+AJz46r2h/o=
X-Gm-Gg: AZFdTZfeffI4Hzz2TPoGBzdk8+zn2zQOfTFuzLsTIb2hbkllNEiEt5G1wYYE5tp7vJH
	WABg5D+fOv/c6BmDdcM7XniKe3HsPNhPayYXasTIVf9y+8wyjJyqY7QAi1B05s/XfKdp18aVK7N
	g1tZS1nrDlrIlKDqL507xb60GCllpcuvBgYQyAuTouFZ9cFSYePFOFdXCbuJIwBmJ5n1vD3ZZHD
	tq20ONUL5MUjpfxGm+x0kW9bY7qKOOQ8aZQdPMnA0btcVCR9NJ2nlgscZL6aVFb5QMSk+M0FNuE
	y9vfczN+vYe2vkjypInrhLz7lAy0HGm5olx1fwGeBO+EhvQu7l74KW1rdx5YAh/f88X0Zvi2ma6
	k4fYTtrWNJDrmowX/Z7S92gTEXA+uOymTDCOmUuLulh/rh1L9WZOZqS46ODR6Nz6zryK6zwPQnB
	Z7EQV6lvyzrCvan3GNXMJyXFdsSDRmPGMI+ewWqlnxaJjA3bHdbW90wj92BZucLw6QObUbDo33A
	uYpl8Nb1K5sy7H0eOHdSMq38MtiDREoZIRXmaC7lRvHkwSxNlmSO9xenn4qal8bYsJ0dQqNf2Li
	nBbBjp0q10w8GojBuPQq8uQIT2n+nxyGV84ruVazC+NM3NXI3cpsyhIXiE4dXe0IRF8ecaoN+/C
	WpHf6CLsH
X-Received: by 2002:a05:6000:26c1:b0:4b3:b495:d5ad with SMTP id ffacd0b85a97d-4b3b495d6efmr21107972f8f.23.1795656527657;
        Wed, 25 Nov 2026 17:28:47 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm30520335f8f.35.2026.11.25.17.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:28:46 -0800 (PST)
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
Subject: [PATCH v7 3/3] sched/uclamp: Move uclamp_rq_{inc, dec}() from core.c
Date: Thu, 26 Nov 2026 01:28:36 +0000
Message-ID: <20261126012836.15205-4-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126012836.15205-1-qyousef@layalina.io>
References: <20261126012836.15205-1-qyousef@layalina.io>
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
index 04c396435413a..8994e27f8582d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1894,7 +1894,7 @@ static inline void uclamp_rq_dec_id(struct rq *rq, struct task_struct *p,
 	}
 }
 
-static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags)
+void uclamp_rq_inc(struct rq *rq, struct task_struct *p)
 {
 	enum uclamp_id clamp_id;
 
@@ -1907,13 +1907,6 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
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
 
@@ -1922,7 +1915,7 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
 		uclamp_rq_clear_idle(rq);
 }
 
-static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
+void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
 {
 	enum uclamp_id clamp_id;
 
@@ -1935,12 +1928,6 @@ static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
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
@@ -2178,8 +2165,6 @@ static void __init init_uclamp(void)
 }
 
 #else /* !CONFIG_UCLAMP_TASK: */
-static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags) { }
-static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p) { }
 static inline void uclamp_fork(struct task_struct *p) { }
 static inline void uclamp_post_fork(struct task_struct *p) { }
 static inline void init_uclamp(void) { }
@@ -2215,11 +2200,10 @@ void enqueue_task(struct rq *rq, struct task_struct *p, int flags)
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
 
@@ -2249,10 +2233,11 @@ inline bool dequeue_task(struct rq *rq, struct task_struct *p, int flags)
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
index a9e36b5bb0386..1dc35dbd42df1 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -2496,6 +2496,7 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int core_enq_
 	p->scx.flags |= SCX_TASK_QUEUED;
 	rq->scx.nr_running++;
 	add_nr_running(rq, 1);
+	uclamp_rq_inc(rq, p);
 
 	if (SCX_HAS_OP(sch, runnable) && !task_on_rq_migrating(p))
 		SCX_CALL_OP_TASK(sch, runnable, rq, p, enq_flags);
@@ -2647,6 +2648,7 @@ static bool dequeue_task_scx(struct rq *rq, struct task_struct *p, int core_deq_
 	p->scx.flags &= ~SCX_TASK_QUEUED;
 	rq->scx.nr_running--;
 	sub_nr_running(rq, 1);
+	uclamp_rq_dec(rq, p);
 
 	scx_dispatch_dequeue(rq, p);
 	p->scx.flags &= ~SCX_TASK_REENQ_REASON_MASK;
@@ -5922,10 +5924,6 @@ DEFINE_SCHED_CLASS(ext) = {
 	.prio_changed		= prio_changed_scx,
 
 	.update_curr		= update_curr_scx,
-
-#ifdef CONFIG_UCLAMP_TASK
-	.uclamp_enabled		= 1,
-#endif
 };
 
 s32 scx_init_dsq(struct scx_dispatch_q *dsq, u64 dsq_id, struct scx_sched *sch)
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 731d78155e654..dde12d9e1af4d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8266,6 +8266,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 
 	/* At this point se is NULL and we are at root level*/
 	add_nr_running(rq, 1);
+	uclamp_rq_inc(rq, p);
 
 	/*
 	 * Since new tasks are assigned an initial util_avg equal to
@@ -8385,6 +8386,7 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
 		__dequeue_entity(cfs_rq, se);
 
 	sub_nr_running(rq, 1);
+	uclamp_rq_dec(rq, p);
 
 	/* balance early to pull high priority tasks */
 	if (unlikely(!was_sched_idle && sched_idle_rq(rq)))
@@ -15962,10 +15964,6 @@ DEFINE_SCHED_CLASS(fair) = {
 #ifdef CONFIG_SCHED_CORE
 	.task_is_throttled	= task_is_throttled_fair,
 #endif
-
-#ifdef CONFIG_UCLAMP_TASK
-	.uclamp_enabled		= 1,
-#endif
 };
 
 #define SCHED_DEBUG_MAX_ITER 4096
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 81a71aa5f094a..f353add1cc854 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1189,6 +1189,9 @@ void inc_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
 
 	inc_rt_prio(rt_rq, prio);
 	inc_rt_group(rt_se, rt_rq);
+
+	if (rt_entity_is_task(rt_se))
+		uclamp_rq_inc(rq_of_rt_rq(rt_rq), rt_task_of(rt_se));
 }
 
 static inline
@@ -1201,6 +1204,9 @@ void dec_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
 
 	dec_rt_prio(rt_rq, rt_se_prio(rt_se));
 	dec_rt_group(rt_se, rt_rq);
+
+	if (rt_entity_is_task(rt_se))
+		uclamp_rq_dec(rq_of_rt_rq(rt_rq), rt_task_of(rt_se));
 }
 
 /*
@@ -2644,10 +2650,6 @@ DEFINE_SCHED_CLASS(rt) = {
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
index 8fcac9b6be9cd..f6ff4e78fce0e 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2729,10 +2729,6 @@ enum snt_e {
 
 struct sched_class {
 
-#ifdef CONFIG_UCLAMP_TASK
-	int uclamp_enabled;
-#endif
-
 	/*
 	 * move_queued_task/activate_task/enqueue_task: rq->lock
 	 * ttwu_do_activate/activate_task/enqueue_task: rq->lock
@@ -3816,6 +3812,8 @@ static inline unsigned long cpu_util_rt(struct rq *rq)
 
 unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
 void init_uclamp_rq(struct rq *rq);
+void uclamp_rq_inc(struct rq *rq, struct task_struct *p);
+void uclamp_rq_dec(struct rq *rq, struct task_struct *p);
 
 /*
  * When uclamp is compiled in, the aggregation at rq level is 'turned off'
@@ -3925,6 +3923,8 @@ uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
 }
 
 static inline void init_uclamp_rq(struct rq *rq) {}
+static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p) {}
+static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p) {}
 
 static inline bool uclamp_rq_is_capped(struct rq *rq) { return false; }
 
-- 
2.53.0

