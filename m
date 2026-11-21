Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795229867;
	b=1uAMMGNLxi6p8kU0CmaAKq/SuWduVPQ/Gc7sz5fe8lnJ/chE3cD321/qbvJxA6tV6occ
	 TP7dGKRJIFhgTuujY6T2o5GQZIkQrx7MLF3r0/IskQCwXvQ0/dmfJbt5JF+eUKeYJu5bq
	 KvH0OkQqzjf/8hmvbgVhjnQbEElg0m8QSPbpZB8JcLtjFyn9E5SQXywZr7Cw8QS4q8Ad7
	 XSzxEd+9wq1MrfeJ2QD0Iw7Y2Noq4T2TRGhTQ8rD4HQphiA0NdZ1Sq5a8k9DuV94YSFk8
	 CtO8lREgMJHAz1R7E9HmCPZxfRWWnDIYy0Te5Av5r0qaetvi3XFjCBdcHcbz/1Ax3kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795229867;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=BpfWIE25dkuD8zNFed2ewq15d6pWg35O4AjdsUKuCX8=;
	b=UP384Be6uzOA+uhWASHhKSW1w7xgQjuiprcHPZobfHTQ4hYlMW2MxejsyWfypU78OeWE
	 T4inW5SI3moTtApb9PKJnaeKPVYtHJQfWDO3eGF3U4Qa3VsdZ/GN4dYB3YazL6F1jSRNm
	 fo4UyDddgwHsuBhJWFM2FGq9F6FoGRdaN36oYCSNIdYNjkuWyJ21LUl+4a6aknANfzFdH
	 avcjf8b3Kw6M7KKFTMrgvk87dzF3Do1rlwaBUpQ7HYITUtFAhRFVTkM4x4kpdUQwP4nmm
	 j4ou2y8shVZ6Q7MIxMg4R5EjthL54LUWEETujB18Sy8+sRmbxC4V33EgTZXSmovaLSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gKXtS9o3;
	arc=none smtp.remote-ip=91.218.175.239
Received: from mta0.migadu.com (out-239.mta0.migadu.com [91.218.175.239])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D79606A333
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 02:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D79606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gKXtS9o3
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lubXfcm13N5i1ubAGfTU+XgTRloOwGqG5TWqbspigoQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795229861; v=1; x=1795834661;
 b=gKXtS9o3RNZNzusmLktQFEwYuARe3KcFNBA54IDwki+WAoQ5L6hnZSHfkKRO7//QvYjNvCy4
 cSLVABFIScEaGV5bqCtJNj/5P1nPaUz2bcSuS0duXzi+aQQVUv8IetNrlfkfLQSS79W1Q30XQag
 wXcQ7CNJ7BKXifzXzjXNYviQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e06df9e49848c2d1;
	Sat, 21 Nov 2026 02:57:41 +0000
X-Mizu-Trace-ID: e06df9e49848c2d1
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Fri, 20 Nov 2026 21:57:24 -0500
Subject: [PATCH v3 1/3] sched: Give root domain moves their own sched_class
 callbacks
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-bug-sched-fair-offline-active-v3-1-325e9eefa56d@linux.dev>
References: <20261120-bug-sched-fair-offline-active-v3-0-325e9eefa56d@linux.dev>
In-Reply-To: <20261120-bug-sched-fair-offline-active-v3-0-325e9eefa56d@linux.dev>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Li kunyu <likunyu@open-hieco.net>, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

The rq_online() and rq_offline() callbacks run when a CPU comes up or
goes down, and also when rq_attach_root() moves an active CPU to a new
root domain during a sched domain rebuild. rt and dl use them for state
kept in the root domain: the overload masks, cpupri, cpudl and the RT
runtime shared within it. fair uses them for task group state, which
does not depend on the root domain.

With one pair of callbacks for both events, a class cannot do only the
work that a root domain move needs, so every rebuild runs the fair
hotplug work for all active CPUs.

Add rq_attach_root() and rq_detach_root() to struct sched_class for the
root domain state and convert rt and dl to them. Have set_rq_online()
and set_rq_offline() call both kinds of callbacks class by class, so
that every class still runs at the same points and in the same order.

Suggested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 kernel/sched/core.c        | 4 ++++
 kernel/sched/cpudeadline.c | 5 +++--
 kernel/sched/deadline.c    | 8 ++++----
 kernel/sched/rt.c          | 8 ++++----
 kernel/sched/sched.h       | 6 ++++++
 5 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 8b4e4a6f4ae02..ca920a302ecba 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8553,6 +8553,8 @@ void set_rq_online(struct rq *rq)
 		rq->online = 1;
 
 		for_each_class(class) {
+			if (class->rq_attach_root)
+				class->rq_attach_root(rq);
 			if (class->rq_online)
 				class->rq_online(rq);
 		}
@@ -8569,6 +8571,8 @@ void set_rq_offline(struct rq *rq)
 		for_each_class(class) {
 			if (class->rq_offline)
 				class->rq_offline(rq);
+			if (class->rq_detach_root)
+				class->rq_detach_root(rq);
 		}
 
 		cpumask_clear_cpu(rq->cpu, rd->online);
diff --git a/kernel/sched/cpudeadline.c b/kernel/sched/cpudeadline.c
index 0a2b7e30fd10c..8e2a95f846278 100644
--- a/kernel/sched/cpudeadline.c
+++ b/kernel/sched/cpudeadline.c
@@ -185,8 +185,9 @@ void cpudl_clear(struct cpudl *cp, int cpu, bool online)
 	if (old_idx == IDX_INVALID) {
 		/*
 		 * Nothing to remove if old_idx was invalid.
-		 * This could happen if rq_online_dl or rq_offline_dl is
-		 * called for a CPU without -dl tasks running.
+		 * This could happen if rq_attach_root_dl() or
+		 * rq_detach_root_dl() is called for a CPU without -dl
+		 * tasks running.
 		 */
 	} else {
 		new_cpu = cp->elements[cp->size - 1].cpu;
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 61b6a6d781715..fcbf53500083e 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3366,7 +3366,7 @@ bool dl_task_needs_bw_move(struct task_struct *p,
 }
 
 /* Assumes rq->lock is held */
-static void rq_online_dl(struct rq *rq)
+static void rq_attach_root_dl(struct rq *rq)
 {
 	if (rq->dl.overloaded)
 		dl_set_overload(rq);
@@ -3379,7 +3379,7 @@ static void rq_online_dl(struct rq *rq)
 }
 
 /* Assumes rq->lock is held */
-static void rq_offline_dl(struct rq *rq)
+static void rq_detach_root_dl(struct rq *rq)
 {
 	if (rq->dl.overloaded)
 		dl_clear_overload(rq);
@@ -3664,8 +3664,8 @@ DEFINE_SCHED_CLASS(dl) = {
 	.select_task_rq		= select_task_rq_dl,
 	.migrate_task_rq	= migrate_task_rq_dl,
 	.set_cpus_allowed       = set_cpus_allowed_dl,
-	.rq_online              = rq_online_dl,
-	.rq_offline             = rq_offline_dl,
+	.rq_attach_root		= rq_attach_root_dl,
+	.rq_detach_root		= rq_detach_root_dl,
 	.task_woken		= task_woken_dl,
 	.find_lock_rq		= find_lock_later_rq,
 
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 81a71aa5f094a..45d10334f7253 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2398,7 +2398,7 @@ static void task_woken_rt(struct rq *rq, struct task_struct *p)
 }
 
 /* Assumes rq->lock is held */
-static void rq_online_rt(struct rq *rq)
+static void rq_attach_root_rt(struct rq *rq)
 {
 	if (rq->rt.overloaded)
 		rt_set_overload(rq);
@@ -2409,7 +2409,7 @@ static void rq_online_rt(struct rq *rq)
 }
 
 /* Assumes rq->lock is held */
-static void rq_offline_rt(struct rq *rq)
+static void rq_detach_root_rt(struct rq *rq)
 {
 	if (rq->rt.overloaded)
 		rt_clear_overload(rq);
@@ -2626,8 +2626,8 @@ DEFINE_SCHED_CLASS(rt) = {
 	.balance		= balance_rt,
 	.select_task_rq		= select_task_rq_rt,
 	.set_cpus_allowed       = set_cpus_allowed_common,
-	.rq_online              = rq_online_rt,
-	.rq_offline             = rq_offline_rt,
+	.rq_attach_root		= rq_attach_root_rt,
+	.rq_detach_root		= rq_detach_root_rt,
 	.task_woken		= task_woken_rt,
 	.switched_from		= switched_from_rt,
 	.find_lock_rq		= find_lock_lowest_rq,
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e957524c3ee52..a24801d2058b4 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2799,6 +2799,12 @@ struct sched_class {
 	void (*rq_online)(struct rq *rq);
 	void (*rq_offline)(struct rq *rq);
 
+	/*
+	 * Move an online rq to or from a root domain: rq->lock
+	 */
+	void (*rq_attach_root)(struct rq *rq);
+	void (*rq_detach_root)(struct rq *rq);
+
 	/*
 	 * push_cpu_stop: p->pi_lock && rq->lock
 	 */

-- 
2.43.0

