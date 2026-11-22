Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795318398;
	b=c+hwiDz1/OUOvqdZvf+XfJ2QFjBcA6bSUW0bpvlPhbYuJ9BqcH6dF6yPPDgyGWNpN6Q0
	 bOfy4lHvkHulx9xbk7/ohXfLRHv+hkt7QYbEshkkRQ2KKGsHbSiQTzPJkiIpk1/AOTeaO
	 VtquLHcvmnFfxMVpSWJ81vXiTgQy+FPxrE1VfE7PeLGrwIs9G/HfRv5mrptDhbgI3fMu1
	 3yhZ5eGRsSQbu9LEBWjSV3IN2CZDA7waPhusb/fImVjMXc2C3ccHYb5oGN4kaKMjObMIK
	 fcPC3emQnpl1Qd5XrLlZmnXdbxXjgOAjEknCT9ZmFGMcl274j+Wv0U7vvsWPny/OS/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795318398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=nEWTTmYbR5yEEt5N6be7z5Q5FBiYqT8Psorb4IsgBd8=;
	b=KPM30++NKtOVJ6FyC8QIpGfgcX0tn18LWZ8YA8oLjSdISg/coDJYWxo+VJa8WBYfIKcb
	 rgIooB5Q1Qo4AMHBcsPwqZX1a7Ei3xWTGLOZV2swKejyUO8TswgBddyzTA9eElbU4Cqex
	 TdTDDzwdL2xwymJc36yEeUoMXXOWwgWpcReMd9LphtaSFJ6lwGToOotHzIUEVys9Oiaiu
	 ryFT6gIBl1us/32pxT0B3oHPAL7JUSVXvry6oxTI/CNfB4HxF7Z55Eclg3B7s2rR6xgkS
	 oqfYa6tVSEBbtVlieiX0rU0xRb7NqojeN5E83q1UH0RLRjEs3xFrS667lwdyVuax5KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MVBebZk1;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D39606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14D39606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MVBebZk1
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b29df78132so2100778c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795318397; x=1795923197; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nEWTTmYbR5yEEt5N6be7z5Q5FBiYqT8Psorb4IsgBd8=;
        b=MVBebZk1wxUXG9NIyQQS5/bv7z6bcLi5bM9Dt4HV+k1RPq2Ib25WFkHCp2mVBXJg/U
         uG/VGjRfP73V1lcDk2bT27gG4z4xZKifF/YQTm0BU80PNi5YnLd4520B/UTRrBhO6VFu
         1qTJ0o3gGWyMLNteXMV+iHPZJIYJNw9YeCDiw/na02ROJgphAyDw4mPYtTE9JM/Nz2om
         EAu7PXn9mPF17pWtDsSX+PBA+iuwzpEi88bJEImzxrBzmosbqaU3t6VytdNRbT29iAFs
         qyhn+l0nVeJqB+GXxfS67tzO8PTfyTuPkPkXlh0xfGztDoL2tDiJLXmiCZ4RxM53FMo4
         LESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795318397; x=1795923197;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nEWTTmYbR5yEEt5N6be7z5Q5FBiYqT8Psorb4IsgBd8=;
        b=yKMXO3PRWq9oXnTr7OcSwPa77SWMgajXdOKIJ5f8fI7H30JTDV6Vnnsyy1afXEZv5I
         BKsRtxINamgillyKqYy2YZDziIJECZCxxlV/yNkq+qAJQyxb8p8NyLMIppgkJTMSqkMa
         dBiekJSy78hv/HYkHO+gVUhxrEa+IjOYRrFeOLKxi1Vd8tTduYGJpOJDEwyleO/ei2y2
         1RkepvCqBn+IP1O8b4ciw/ZawaXUiOfFpuxcfiGKJm5TqqDGZokugOuzRFwUu1G/WWGN
         LZZmp0plH68DzROn/EvyL44jVRlIbW5e9uPdWIE0LNzYUuz2eHFPI2gcstH5+GH4Vxv0
         hoOA==
X-Forwarded-Encrypted: i=1; AL+hErHd0LvyhPCp201KTaPJ3jizr+EL3lg4N9uSYuwbklS9N+NYVpIjneu48iruw1AQfKoWGc+At88WGgCatV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6eiF8/85D72I+eZnX8aAeBwkmHBq4hb3Urh/rwfnL0N/2NoUX
	frVRfoTRBq9MuakGNWZW0tr3MmJwNXLIQ34nZc/phXGzBpBkh8MjtDM5jx9F4rBocjlfVXBBEzs
	vuX1GO/5KgB8klhGs1w==
X-Received: from dlgw5-n1.prod.google.com ([2002:a05:701a:cc85:10b0:15f:4035:64c7])
 (user=penghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:f516:b0:1b5:4aba:b087 with SMTP id a92af1059eb24-1b5567c0c01mr6774411c88.3.1795318396734;
 Sat, 21 Nov 2026 19:33:16 -0800 (PST)
Date: Sat, 21 Nov 2026 19:33:16 -0800
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
Message-ID: <20261122033316.2819845-1-penghuang@google.com>
Subject: [PATCH] sched_ext: Update other_load_avgs on set_next_task_scx
From: Peng Huang <penghuang@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, sched-ext@lists.linux.dev
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Barret Rhoden <brho@google.com>, Josh Don <joshdon@google.com>, Hao Luo <haoluo@google.com>, 
	linux-kernel@vger.kernel.org, penghuang@google.com
Content-Type: text/plain; charset="UTF-8"

When scx_switched_all() is enabled, scheduler_tick() skips
sched_balance_trigger(), so __update_blocked_others() no longer runs to
decay RT, DL, IRQ, and HW pressure load averages. Other-class load
averages then depend on scx_tick() and SCX_RQ_CAN_STOP_TICK transitions
in set_next_task_scx().

If SCX_RQ_CAN_STOP_TICK stays unchanged (e.g., remaining set across an
idle or RT interval on tickless CPUs, or remaining clear on finite-slice
switches before a tick fires or before going idle), stale RT/DL PELT
values can remain elevated when consumers such as effective_cpu_util()
or update_idle_rq_clock_pelt() read them.

Track load-average updates explicitly with @update_load_avgs in
set_next_task_scx() and refresh update_other_load_avgs() on SNT_PICK as
well as when SCX_RQ_CAN_STOP_TICK toggles.

Fixes: 22a920209ab6 ("sched_ext: Implement tickless support")
Cc: stable@vger.kernel.org
Signed-off-by: Peng Huang <penghuang@google.com>
---
 kernel/sched/ext/ext.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 10de6bd865e8..e29c9c18e1ab 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -3553,6 +3553,7 @@ static void kick_sync_wait_bal_cb(struct rq *rq);
 static void set_next_task_scx(struct rq *rq, struct task_struct *p, enum snt_e type)
 {
 	bool first = type == SNT_PICK;
+	bool update_load_avgs = first;
 	bool can_stop_tick;
 
 	/*
@@ -3619,10 +3620,6 @@ static void set_next_task_scx(struct rq *rq, struct task_struct *p, enum snt_e t
 	 * @p is getting newly scheduled or got kicked after someone updated its
 	 * slice. Update SCX_RQ_CAN_STOP_TICK to reflect whether the tick can be
 	 * stopped. See scx_can_stop_tick().
-	 *
-	 * Moreover, refresh the load_avgs just when transitioning in and out of
-	 * nohz. In the future, we might want to add a mechanism to update
-	 * load_avgs periodically on tick-stopped CPUs.
 	 */
 	if (can_stop_tick) {
 		if (!(rq->scx.flags & SCX_RQ_CAN_STOP_TICK)) {
@@ -3634,13 +3631,12 @@ static void set_next_task_scx(struct rq *rq, struct task_struct *p, enum snt_e t
 			 */
 			rq->scx.flags |= SCX_RQ_CAN_STOP_TICK;
 			sched_update_tick_dependency(rq);
-
-			update_other_load_avgs(rq);
+			update_load_avgs = true;
 		}
 	} else {
 		if (rq->scx.flags & SCX_RQ_CAN_STOP_TICK) {
 			rq->scx.flags &= ~SCX_RQ_CAN_STOP_TICK;
-			update_other_load_avgs(rq);
+			update_load_avgs = true;
 		}
 
 		/*
@@ -3651,6 +3647,15 @@ static void set_next_task_scx(struct rq *rq, struct task_struct *p, enum snt_e t
 		if (tick_nohz_full_cpu(cpu_of(rq)))
 			tick_nohz_dep_set_cpu(cpu_of(rq), TICK_DEP_BIT_SCHED);
 	}
+
+	/*
+	 * Refresh other-class (RT/DL/IRQ/HW) load averages when picking a new
+	 * task or toggling nohz tick dependency while CFS PELT is dormant.
+	 * In the future, we might want to add a mechanism to update load_avgs
+	 * periodically on tick-stopped CPUs.
+	 */
+	if (update_load_avgs)
+		update_other_load_avgs(rq);
 }
 
 void scx_proxy_donor_start(struct rq *rq)
-- 
2.56.1.750.gf70dc682cf-goog

