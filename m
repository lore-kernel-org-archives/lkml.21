Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368146;
	b=XWvJBoytWWfuJbRrJv1rNSx1BMQdCA1H2MJnRkbeiElu6/cTIb7mDdCIlCZq7BuBweAU
	 9IC1ll6iHgMaVxmO3wgzgfVCiVqawEEtjwSihv0cpXjstRRYWvQqL2OjD3pdPjWb89lc8
	 AbUr6EDVzM8RYJCTApykMOX6hbkZxg9xXrkEGHQub6Ivy18KOWr3KCJoqdEtTaH9JazOZ
	 jT8zoAEuwd8Qho1pJDFxYrYoOikrLglics8k8MYeCEnpZel5zzSKgQvM/YxEaMcd+5ARd
	 un1QRP/Rt7fMT3BixGbah+u44IOKKdb/kDwP64ZMEH86StmTH0cFzJZ45E+qMJmaj+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YrnbCkOTsVOvgdWtAIwkkHvSyqxBpaAe1LBpCGRGi2c=;
	b=oqC4x6iVjUWVga9G3tSKXAdDsdGWJAeoccLfrOrrtA+YcxzF7ez42Hh2c7kDI2sIyR/d
	 qNIgzgV7w1rTOlaPwRqho2OzDGmvXMydlv1eBAihvU1Fofe75I9n5QZ2K9K70YbNPcV89
	 MoIVZyavtm5jEdEFaaxEJgieECSujN12ZSqI/1WP5i65w5cIMwVAOMs/OAe0OIqTGOqOg
	 jkHs6PoVTj+RoC40yiIKgBGTVVXw7juft1Sx76D3DJgXGhLFwmxq2g9/p6xzcF1DZesVC
	 7JtWnOHe+HuFxHIDrdX0YHD0bM7ytX6Ta5xpW0B2OkaEa+ZQIMwErAj4+7e8hbvJKug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fXp8aubI;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6469C606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6469C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fXp8aubI
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so23128485e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795368144; x=1795972944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YrnbCkOTsVOvgdWtAIwkkHvSyqxBpaAe1LBpCGRGi2c=;
        b=fXp8aubIF2RcvVGYbSh1GReObG9wzokbZuGlv+7eHRN97eeK6tXBbZaZ7yyDMU3V7h
         0Np0y+/fvttD+Ah7fqo4Qr08B7XjjoX1sQp/j6N17gc+RzSyQuIxxfH3WYkOC2rIYR43
         Rw9VU2hqROABe7xwnVa1DsOkj90MCFi9f/1z+Mn5FZFLhdqBihOEx7OKorPq07/j/RF5
         hC7+LlAVYbcZRcET5Vf8jmjeyl3nOC2A6KWu/O6UkXY72k4Q0EKxEtPTzBMylrWZvS9H
         1/ms1/WCn4mcfUNXFnDz9e7T7H6O1If0q8MvF7NDs4erSceFqwrxvN7RXM4UAFhFLsJp
         72yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368144; x=1795972944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YrnbCkOTsVOvgdWtAIwkkHvSyqxBpaAe1LBpCGRGi2c=;
        b=0h1a32MAF/IPBfj/Rk0nr/QCAq9UhKBm3lfuJZYoTdJo0I1ukL27oS8oeRhKSQSACQ
         P90eB0KMtHKOGl2tSP70njnb1SBN9EdRxdA9wjyA042NUjpZq9kya+vRAAfB9K8SLBQs
         ibvKAigp9OCLjwCOrEGNZWlJtGt2FLI6avWWaw68maEZBMsP6vFptNQtYr8E4u+uWRwQ
         KLk3clmwXUpbbO78fZVGBzvUZzqi4+AuowrajL9jyT2oC9yUO/KfwXvtiRaGDvkQ8BWH
         ELqMP9RLyyBCi+UvkgIrUQA/Ak9CBOqhshgcTmeHL7asa9ffBX+PTrDHewjTQ/AT/oPM
         XEvQ==
X-Forwarded-Encrypted: i=1; AL+hErHFeuuRNsF3Fbyr0fgXYMClqHZ58kqFPrwxAcSHSE1xDL380g+j/Rj2l8/tPIZAM86WYw3lIjnD9hR7smA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/ot/Tm8sGHYb6K/zbYA8LuUj5+Sf3dC1rYoU+ReidQgn/G/L4
	I08BGyT4ITM2s/pUpcBNyDoV5ZQ/b8NSFqc+obbX2FNbmaRgVAH4VQ3PSbg/YD1fHbM=
X-Gm-Gg: AZFdTZcK5lvmTO1oqaAOAivr9Z9TDlxnhurfuruchsoSl+/8A2zELbRLFcYRy2lvVUj
	CetGHJvwFZJw/KUHr2sRfGH415+NQZdwxtpjsuME25iOc1O+QZB/f86wsxAXvs1heGyEVhyXby8
	cuXzIqTBjWgdFp1dc35oVvLXUufQE5rJ07/9ZBivg32yZLv4imYirfJ5PgQ2woLRFhUCzbqQswC
	8zaj3CSt3iGbxHBNBq4pKc/RrIkPXXoA3aku2AIVTkbOt/IHA/scKB+w7ojuwrjy7JfyYK3QgaV
	6nt+2eP9gVSVVoxbCN2oge7gyojS1LlRgAWjUJOe7np+mZV7utdt5si/TDs+psw9F5fKTK5F4rB
	XW7dzDgxR/i8k0vjPoaMr5nnYckyLx6h2K1S4OU8u6iboCpoIQSQ1f6o9cu6Jrh4oSESAmTwpw5
	TqtiV2ItA22vCN1RZUCB2mlhoAfgyoxknLsOschytv5DpdprUnxlcTWlVpv8L0YWEC6TDw/OorJ
	r9bQWby/VepeJG5D2oph9AFbdyjsEblEHryY1gpNemSEDcbg9waBX3st9Bpzkf2QUCAv4myon2o
	P8jbke+jHgRPeM3CnzEwCTnL0icvqK7EKlok9P7fsSdzYE1jBNWgws0z59poNR0hNxmOypqIebX
	KOQ==
X-Received: by 2002:a05:600c:5246:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb88930707mr208116965e9.26.1795368143265;
        Sun, 22 Nov 2026 09:22:23 -0800 (PST)
Received: from aerith (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm283265595e9.15.2026.11.22.09.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:22:22 -0800 (PST)
Date: Sun, 22 Nov 2026 17:22:19 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Christian Loehle <christian.loehle@arm.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, 
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: Re: [PATCH v6 0/3] Fix uclamp race against non atomic static key
 enable
Message-ID: <awMi01DePXqbdZ9h@aerith>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261121041507.39582-1-qyousef@layalina.io>

On 11/21/26 04:15, Qais Yousef wrote:

> So in summary RT throttling is not fixed and being ignored.

For the sake of completeness, the below patch (only compile tested) should fix
it. What I was tripping at before is that tasks don't get dequeued on
throttling, but only the group. This requires a bit of rework to walk the tasks
that are being dequeued and perform full dequeue instead. As stated in the
cover letter, given this is already being discussed for removal and being
marked as broken, not worth the effort. But in case we need to come back to it,
hope the below can remind us and give us head start.

--->8---

From 411ce77117253e5eac301b0acf67e266363c7630 Mon Sep 17 00:00:00 2001
From: Qais Yousef <qyousef@layalina.io>
Date: Sun, 1 Nov 2026 00:10:12 +0000
Subject: [RFC PATCH] sched/rt: Rework how rq->nr_running is manged

This partially reverts commit f4ebcbc0d7e009783256c9daf76bc4b90e645c14.

While trying to address uclamp static key race condition the throttling
logic in RT and fair has highlighted that both perform incomplete
dequeue since they don't go through core. RT logic seemed to diverge
from fair pattern where rq->nr_running was management oddly.

This is due to the fact that tasks are not really dequeued on
throttling, but only the group rt_se; leading to the oddity of how
nr_running is managed.

Bring the logic more inline with the rest of the classes by
adding/subtracting nr_running on inc/dec_tasks() if it is a task. And
add extra logic to walk the group and do rq accounting for nr_running
and uclamp in case of throttling. Less efficient, but more obvious and
robust.

Replace usage of rt_queued with rt_rq_throttled().

Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 kernel/sched/rt.c    | 141 ++++++++++++++++++++-----------------------
 kernel/sched/sched.h |  20 ++++--
 2 files changed, 80 insertions(+), 81 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index fd116139ac9bf..b12f5502a4c54 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -82,12 +82,11 @@ void init_rt_rq(struct rt_rq *rt_rq)
 	rt_rq->highest_prio.next = MAX_RT_PRIO-1;
 	rt_rq->overloaded = 0;
 	plist_head_init(&rt_rq->pushable_tasks);
-	/* We start is dequeued state, because no RT tasks are queued */
-	rt_rq->rt_queued = 0;
 
 #ifdef CONFIG_RT_GROUP_SCHED
 	rt_rq->rt_time = 0;
 	rt_rq->rt_throttled = 0;
+	rt_rq->tasks_throttled = false;
 	rt_rq->rt_runtime = 0;
 	raw_spin_lock_init(&rt_rq->rt_runtime_lock);
 	rt_rq->tg = &root_task_group;
@@ -429,8 +428,6 @@ static void dequeue_pushable_task(struct rq *rq, struct task_struct *p)
 	}
 }
 
-static void enqueue_top_rt_rq(struct rt_rq *rt_rq);
-static void dequeue_top_rt_rq(struct rt_rq *rt_rq, unsigned int count);
 
 static inline int on_rt_rq(struct sched_rt_entity *rt_se)
 {
@@ -524,6 +521,37 @@ static inline struct rt_rq *group_rt_rq(struct sched_rt_entity *rt_se)
 static void enqueue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flags);
 static void dequeue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flags);
 
+static void walk_rt_tasks(struct rt_rq *rt_rq, bool throttle)
+{
+	struct rq *rq = rq_of_rt_rq(rt_rq);
+	struct rt_prio_array *array = &rt_rq->active;
+	struct sched_rt_entity *rt_se;
+	int idx;
+
+	for_each_set_bit(idx, array->bitmap, MAX_RT_PRIO) {
+		struct list_head *queue = array->queue + idx;
+
+		list_for_each_entry(rt_se, queue, run_list) {
+			struct rt_rq *child_rt_rq = group_rt_rq(rt_se);
+
+			if (child_rt_rq) {
+				if (!child_rt_rq->tasks_throttled)
+					walk_rt_tasks(child_rt_rq, throttle);
+			} else {
+				struct task_struct *p = rt_task_of(rt_se);
+
+				if (throttle) {
+					sub_nr_running(rq, 1);
+					uclamp_rq_dec(rq, p);
+				} else {
+					add_nr_running(rq, 1);
+					uclamp_rq_inc(rq, p);
+				}
+			}
+		}
+	}
+}
+
 static void sched_rt_rq_enqueue(struct rt_rq *rt_rq)
 {
 	struct task_struct *donor = rq_of_rt_rq(rt_rq)->donor;
@@ -535,9 +563,12 @@ static void sched_rt_rq_enqueue(struct rt_rq *rt_rq)
 	rt_se = rt_rq->tg->rt_se[cpu];
 
 	if (rt_rq->rt_nr_running) {
-		if (!rt_se)
-			enqueue_top_rt_rq(rt_rq);
-		else if (!on_rt_rq(rt_se))
+		if (rt_rq->tasks_throttled) {
+			rt_rq->tasks_throttled = false;
+			walk_rt_tasks(rt_rq, false);
+		}
+
+		if (rt_se && !on_rt_rq(rt_se))
 			enqueue_rt_entity(rt_se, 0);
 
 		if (rt_rq->highest_prio.curr < donor->prio)
@@ -552,8 +583,12 @@ static void sched_rt_rq_dequeue(struct rt_rq *rt_rq)
 
 	rt_se = rt_rq->tg->rt_se[cpu];
 
+	if (!rt_rq->tasks_throttled) {
+		walk_rt_tasks(rt_rq, true);
+		rt_rq->tasks_throttled = true;
+	}
+
 	if (!rt_se) {
-		dequeue_top_rt_rq(rt_rq, rt_rq->rt_nr_running);
 		/* Kick cpufreq (see the comment in kernel/sched/sched.h). */
 		cpufreq_update_util(rq_of_rt_rq(rt_rq), 0);
 	}
@@ -561,11 +596,6 @@ static void sched_rt_rq_dequeue(struct rt_rq *rt_rq)
 		dequeue_rt_entity(rt_se, 0);
 }
 
-static inline int rt_rq_throttled(struct rt_rq *rt_rq)
-{
-	return rt_rq->rt_throttled && !rt_rq->rt_nr_boosted;
-}
-
 static int rt_se_boosted(struct sched_rt_entity *rt_se)
 {
 	struct rt_rq *rt_rq = group_rt_rq(rt_se);
@@ -920,23 +950,12 @@ static inline struct rt_rq *group_rt_rq(struct sched_rt_entity *rt_se)
 
 static inline void sched_rt_rq_enqueue(struct rt_rq *rt_rq)
 {
-	struct rq *rq = rq_of_rt_rq(rt_rq);
-
-	if (!rt_rq->rt_nr_running)
-		return;
-
-	enqueue_top_rt_rq(rt_rq);
-	resched_curr(rq);
+	if (rt_rq->rt_nr_running)
+		resched_curr(rq_of_rt_rq(rt_rq));
 }
 
 static inline void sched_rt_rq_dequeue(struct rt_rq *rt_rq)
 {
-	dequeue_top_rt_rq(rt_rq, rt_rq->rt_nr_running);
-}
-
-static inline int rt_rq_throttled(struct rt_rq *rt_rq)
-{
-	return false;
 }
 
 static inline const struct cpumask *sched_rt_period_mask(void)
@@ -1007,44 +1026,6 @@ static void update_curr_rt(struct rq *rq)
 #endif /* CONFIG_RT_GROUP_SCHED */
 }
 
-static void
-dequeue_top_rt_rq(struct rt_rq *rt_rq, unsigned int count)
-{
-	struct rq *rq = rq_of_rt_rq(rt_rq);
-
-	BUG_ON(&rq->rt != rt_rq);
-
-	if (!rt_rq->rt_queued)
-		return;
-
-	BUG_ON(!rq->nr_running);
-
-	sub_nr_running(rq, count);
-	rt_rq->rt_queued = 0;
-
-}
-
-static void
-enqueue_top_rt_rq(struct rt_rq *rt_rq)
-{
-	struct rq *rq = rq_of_rt_rq(rt_rq);
-
-	BUG_ON(&rq->rt != rt_rq);
-
-	if (rt_rq->rt_queued)
-		return;
-
-	if (rt_rq_throttled(rt_rq))
-		return;
-
-	if (rt_rq->rt_nr_running) {
-		add_nr_running(rq, rt_rq->rt_nr_running);
-		rt_rq->rt_queued = 1;
-	}
-
-	/* Kick cpufreq (see the comment in kernel/sched/sched.h). */
-	cpufreq_update_util(rq, 0);
-}
 
 static void
 inc_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio)
@@ -1171,6 +1152,19 @@ unsigned int rt_se_rr_nr_running(struct sched_rt_entity *rt_se)
 	return (tsk->policy == SCHED_RR) ? 1 : 0;
 }
 
+static inline bool rt_se_throttled(struct sched_rt_entity *rt_se)
+{
+#ifdef CONFIG_RT_GROUP_SCHED
+	for_each_sched_rt_entity(rt_se) {
+		struct rt_rq *rt_rq = rt_rq_of_se(rt_se);
+
+		if (rt_rq->tasks_throttled)
+			return true;
+	}
+#endif
+	return false;
+}
+
 static inline
 void inc_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
 {
@@ -1183,8 +1177,10 @@ void inc_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
 	inc_rt_prio(rt_rq, prio);
 	inc_rt_group(rt_se, rt_rq);
 
-	if (rt_entity_is_task(rt_se))
+	if (rt_entity_is_task(rt_se)) {
+		add_nr_running(rq_of_rt_rq(rt_rq), 1);
 		uclamp_rq_inc(rq_of_rt_rq(rt_rq), rt_task_of(rt_se));
+	}
 }
 
 static inline
@@ -1198,8 +1194,10 @@ void dec_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
 	dec_rt_prio(rt_rq, rt_se_prio(rt_se));
 	dec_rt_group(rt_se, rt_rq);
 
-	if (rt_entity_is_task(rt_se))
+	if (rt_entity_is_task(rt_se)) {
 		uclamp_rq_dec(rq_of_rt_rq(rt_rq), rt_task_of(rt_se));
+		sub_nr_running(rq_of_rt_rq(rt_rq), 1);
+	}
 }
 
 /*
@@ -1389,39 +1387,29 @@ static void __dequeue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flag
 static void dequeue_rt_stack(struct sched_rt_entity *rt_se, unsigned int flags)
 {
 	struct sched_rt_entity *back = NULL;
-	unsigned int rt_nr_running;
 
 	for_each_sched_rt_entity(rt_se) {
 		rt_se->back = back;
 		back = rt_se;
 	}
 
-	rt_nr_running = rt_rq_of_se(back)->rt_nr_running;
-
 	for (rt_se = back; rt_se; rt_se = rt_se->back) {
 		if (on_rt_rq(rt_se))
 			__dequeue_rt_entity(rt_se, flags);
 	}
-
-	dequeue_top_rt_rq(rt_rq_of_se(back), rt_nr_running);
 }
 
 static void enqueue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flags)
 {
-	struct rq *rq = rq_of_rt_se(rt_se);
-
 	update_stats_enqueue_rt(rt_rq_of_se(rt_se), rt_se, flags);
 
 	dequeue_rt_stack(rt_se, flags);
 	for_each_sched_rt_entity(rt_se)
 		__enqueue_rt_entity(rt_se, flags);
-	enqueue_top_rt_rq(&rq->rt);
 }
 
 static void dequeue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flags)
 {
-	struct rq *rq = rq_of_rt_se(rt_se);
-
 	update_stats_dequeue_rt(rt_rq_of_se(rt_se), rt_se, flags);
 
 	dequeue_rt_stack(rt_se, flags);
@@ -1432,7 +1420,6 @@ static void dequeue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flags)
 		if (rt_rq && rt_rq->rt_nr_running)
 			__enqueue_rt_entity(rt_se, flags);
 	}
-	enqueue_top_rt_rq(&rq->rt);
 }
 
 /*
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 5bbed5ff2d957..f35ec835c6d68 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -872,8 +872,6 @@ struct rt_rq {
 	bool			overloaded;
 	struct plist_head	pushable_tasks;
 
-	int			rt_queued;
-
 #ifdef CONFIG_RT_GROUP_SCHED
 	int			rt_throttled;
 	u64			rt_time; /* consumed RT time, goes up in update_curr_rt */
@@ -883,6 +881,8 @@ struct rt_rq {
 
 	unsigned int		rt_nr_boosted;
 
+	bool			tasks_throttled;
+
 	struct rq		*rq; /* this is always top-level rq, cache? */
 #endif
 #ifdef CONFIG_CGROUP_SCHED
@@ -890,9 +890,21 @@ struct rt_rq {
 #endif
 };
 
+#ifdef CONFIG_RT_GROUP_SCHED
+static inline bool rt_rq_throttled(struct rt_rq *rt_rq)
+{
+	return rt_rq->rt_throttled && !rt_rq->rt_nr_boosted;
+}
+#else
+static inline bool rt_rq_throttled(struct rt_rq *rt_rq)
+{
+	return false;
+}
+#endif
+
 static inline bool rt_rq_is_runnable(struct rt_rq *rt_rq)
 {
-	return rt_rq->rt_queued && rt_rq->rt_nr_running;
+	return !rt_rq_throttled(rt_rq) && rt_rq->rt_nr_running;
 }
 
 /* Deadline class' related fields in a runqueue */
@@ -2914,7 +2926,7 @@ static inline bool sched_dl_runnable(struct rq *rq)
 
 static inline bool sched_rt_runnable(struct rq *rq)
 {
-	return rq->rt.rt_queued > 0;
+	return rt_rq_is_runnable(&rq->rt);
 }
 
 static inline bool sched_fair_runnable(struct rq *rq)
-- 
2.53.0

