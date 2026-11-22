Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795321568;
	b=HVTGG2gfLEK0uN8pO9R6GXvUZY9qg+kDXcCY9m+vQkPexA5Mru4nJvmjTDRK8S13wA8l
	 xnqoiJWneg4iBkfZ4GMHyZ8TdoaMbShViBjVdjMAOJZnV4T/HUaAxdjIEY4aIDxyCrxa8
	 taJImyqEnv+3xEARKu1U3gJLtnq+RtMQte7LeWCxBpJDeVhCRqWdzEODBA5FEy0ihJw6H
	 5lxRgmqRecnrUDQUSzqOPtWklkVTqWimYpO7KHjjjfUtj2TDv/4+fusTQxVIBzYPE4oOS
	 nhRJyrgJkmIDnPGzMEvQ6nrZWuzFU4kg5Y5xS1Tgq+WDwz4v+08H9w3m10ulw63QfRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795321568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=0jg4qq9XadgtOFwiQ/w6ym8+ZsypQY27mB/+0Ay1dt0=;
	b=XDwYWL94nEo0r5VzY8Xg9yV7umtSW4P8rGWdIYy+tJEApG3ghm9Sr94/6MHKdlwUBnrO
	 /asUAe9TMVu1PEIDySorKBUV8lz9bNqKn/Vyim2BeUmyj5NVyqWKz74MtD8IUKKg2mEGv
	 xC9w7Tuuy6rpTfQQGCmzbL4JSBOU/QChiNj4+Ub4E5Zuk7bQUO1GSWneHrKHv8rDik1cj
	 sScpPcWdeMgPFqX0Kh9C6+naEaRwwvkzhlv8TGQWFFEv3+q9Hb1k9sl8z35ezeyHPOy0O
	 VFak2ftXMCiVw7gUkTDPWR1rAhgISlgfRiPjjh2ReQkZ3Au/iGUXBITVeO0T47frLwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HFlVdpNQ;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304A3606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 304A3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HFlVdpNQ
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so3747835eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795321566; x=1795926366; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jg4qq9XadgtOFwiQ/w6ym8+ZsypQY27mB/+0Ay1dt0=;
        b=HFlVdpNQmEKqA+4aoJbOiyCqaGnXTtJ9F1Wz4GaQxCjprp1+XKaRD4ecvr6FbxVS9L
         Cwd8AHyw4+x7ZAuk/4QQEH/KzIzWCxKub4ZOiSsV0sKq1uhbm6lLP0ihLeS6gAzL1PfD
         2aD43hvvQO0E7LuRe9lTeZJk9q/toypEhfFWn6fkHwItMEj75x1EhduAmHIGCVZDAR+O
         KnZyS2MvwWYOBrmaaqswq9OUP4yLozCsHVwaIWzrPaXTzf7dE9uz8/xB8e5y6IMf+BOX
         OM4Yi33KQGtbCBSkuyQWpDu8AqIhvoFd+QVS+J72L341WDTFEyPKgIr+hLnGTT9Fu1Ej
         m2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795321566; x=1795926366;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0jg4qq9XadgtOFwiQ/w6ym8+ZsypQY27mB/+0Ay1dt0=;
        b=xTrEBl6fOkdOi5JCEQZQeAZdTH2og+jU+cgPvuUGtc657SNrzPzL+sRToYGUlsBhHC
         tMIpbMk81AHHbmXff+TtHqWX/v397pUqcjGQ+0Q/4zikBfxlnn7lksH1WekSQUWNitmP
         lnDW+u7OgI7nvZK2PCJ/1J2giJInV1mPBBg1h/KWDQU77eCX42HeZU4wbr4uRimdK6rg
         D00ESPA1qwXTbwXC/xnCpaLg3WoP1rfsjO4wIxIDK+G2yGyw41POJ7vAjpLjwUoHHQzC
         x5qaqwKm8m9bNjOtzGcSi60ytTCOJszagvpNPVi9P1cQ12LLyk5K6Pf2HxXSRK7z3jQE
         6CIQ==
X-Forwarded-Encrypted: i=1; AL+hErEeSzHl12tSQOyjWogHt0wpT4r0OwBeqz3GRf/TdzKRgExgIGsLPfzpuSPjQH+03qqvkCGZjG97lPz2AbE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GqA8NQ9LWngGmkyfaV5jp6dLMJbe5LmaHJNfTyDMS0JQbSRXx
	5HJPj3ESN2fqHqXrorxCdTBE5ygngbrvc3ih9v9+jaxZ1mC7bhbF8EnYGkevK+KzglSGaXLdBrk
	aGTUt28h1rY8Lsn/V9A==
X-Received: from dlbsj2-n1.prod.google.com ([2002:a05:7022:f902:10b0:17d:5c89:d119])
 (user=penghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:4281:20b0:14d:c7ae:85dd with SMTP id a92af1059eb24-1b55686523bmr8270361c88.7.1795321565734;
 Sat, 21 Nov 2026 20:26:05 -0800 (PST)
Date: Sat, 21 Nov 2026 20:26:05 -0800
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
Message-ID: <20261122042605.2996910-1-penghuang@google.com>
Subject: [PATCH] sched_ext: Block donor on rt_mutex_setprio() switch to SCX
From: Peng Huang <penghuang@google.com>
To: Tejun Heo <tj@kernel.org>, Andrea Righi <arighi@nvidia.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, sched-ext@lists.linux.dev
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, penghuang@google.com
Content-Type: text/plain; charset="UTF-8"

scx_prepare_setscheduler() and scx_root_enable_workfn() block any
retained proxy donor before entering sched_ext so a blocked task is not
carried across scheduling classes without sched_ext admission.
rt_mutex_setprio() misses this cleanup when PI deboost returns a
blocked RT or DL donor back to ext_sched_class.

Expose scx_block_proxy_donor() via scx_prepare_class_switch() in ext.h
and invoke it in rt_mutex_setprio() before sched_change when
transitioning a task into ext_sched_class. Because rt_mutex_setprio()
has already updated rq->clock, calling scx_block_proxy_donor() directly
matches scx_prepare_setscheduler() and avoids double clock updates.

Fixes: be8be8acb268 ("sched_ext: Block proxy donors before taking control")
Signed-off-by: Peng Huang <penghuang@google.com>
---
 kernel/sched/core.c    |  4 +++-
 kernel/sched/ext/ext.c |  8 ++++++--
 kernel/sched/ext/ext.h | 12 ++++++++++++
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5ed660f099a5..1a2a317f1194 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7814,8 +7814,10 @@ void rt_mutex_setprio(struct task_struct *p, struct task_struct *pi_task)
 	prev_class = p->sched_class;
 	next_class = __setscheduler_class(p->policy, prio);
 
-	if (prev_class != next_class)
+	if (prev_class != next_class) {
+		scx_prepare_class_switch(rq, p, next_class);
 		queue_flag |= DEQUEUE_CLASS;
+	}
 
 	scoped_guard (sched_change, p, queue_flag) {
 		/*
diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 10de6bd865e8..4914da605519 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -26,10 +26,14 @@ DEFINE_RAW_SPINLOCK(scx_sched_lock);
 
 /*
  * Block a retained proxy donor, telling put_prev_task_scx() that the donor is
- * about to be dequeued and must not be reenqueued.
+ * about to be dequeued and must not be reenqueued. Caller holds @p->pi_lock
+ * and @rq's lock and has already updated @rq's clock.
  */
-static void scx_block_proxy_donor(struct rq *rq, struct task_struct *p)
+void scx_block_proxy_donor(struct rq *rq, struct task_struct *p)
 {
+	lockdep_assert_held(&p->pi_lock);
+	lockdep_assert_rq_held(rq);
+
 	rq->scx.flags |= SCX_RQ_PROXY_BLOCKING;
 	sched_proxy_block_task(rq, p);
 	rq->scx.flags &= ~SCX_RQ_PROXY_BLOCKING;
diff --git a/kernel/sched/ext/ext.h b/kernel/sched/ext/ext.h
index d32bc01071b0..d2e0e7a23639 100644
--- a/kernel/sched/ext/ext.h
+++ b/kernel/sched/ext/ext.h
@@ -19,6 +19,7 @@ void scx_rq_activate(struct rq *rq);
 void scx_rq_deactivate(struct rq *rq);
 int scx_check_setscheduler(struct task_struct *p, int policy);
 void scx_prepare_setscheduler(struct task_struct *p, int policy);
+void scx_block_proxy_donor(struct rq *rq, struct task_struct *p);
 bool task_should_scx(int policy);
 bool scx_allow_ttwu_queue(const struct task_struct *p);
 bool __scx_allow_proxy_exec(const struct task_struct *p);
@@ -54,6 +55,14 @@ static inline bool task_on_scx(const struct task_struct *p)
 	return scx_enabled() && p->sched_class == &ext_sched_class;
 }
 
+static inline void
+scx_prepare_class_switch(struct rq *rq, struct task_struct *p,
+			 const struct sched_class *next_class)
+{
+	if (scx_enabled() && next_class == &ext_sched_class)
+		scx_block_proxy_donor(rq, p);
+}
+
 #ifdef CONFIG_SCHED_CORE
 bool scx_prio_less(const struct task_struct *a, const struct task_struct *b,
 		   bool in_fi);
@@ -73,6 +82,9 @@ static inline void scx_rq_deactivate(struct rq *rq) {}
 static inline int scx_check_setscheduler(struct task_struct *p, int policy) { return 0; }
 static inline void scx_prepare_setscheduler(struct task_struct *p, int policy) {}
 static inline bool task_on_scx(const struct task_struct *p) { return false; }
+static inline void
+scx_prepare_class_switch(struct rq *rq, struct task_struct *p,
+			 const struct sched_class *next_class) {}
 static inline bool scx_allow_ttwu_queue(const struct task_struct *p) { return true; }
 static inline bool scx_allow_proxy_exec(const struct task_struct *p) { return true; }
 static inline void scx_proxy_donor_start(struct rq *rq) {}
-- 
2.56.1.750.gf70dc682cf-goog

