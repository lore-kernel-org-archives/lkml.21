Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795319576;
	b=kJlV213lezQidLG4z2JvouhKeb6aTbAmm14fZyq8jAhOw3Z10zU5l8aj/3guzVlATHGx
	 DtX6/Pmqu+/HuL+mcgSYDy8ZbQI2yRm/eG6KZe5DWd0uM90VHEmlf8nvSLAUZXhkGvVxC
	 ZsygHFirysAWsYhTbGitnPOrNpR5W2xWRFN75k6Qt3rn2bga+0kkLiZCjN7Lm51kZL09y
	 DrTA2tKaLtpefjJgO38JhfbVV7BwmGphI2Imo4uygCeMxl9nJYFmPQcNXC31imtnpbKEq
	 zTW99p6j+O+BJyO/QTGQUJ2YpeyajFkB3+8UBVCq8xQ6MXEzN1wOU/Yz7SkzO1OE+Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795319576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=b+r6XPfaUdJuFlB5RmbvVvkEeNjRjm4uTzzQBZy+VHg=;
	b=jI3hC2Cca6NfYVNugDL/pLNTnmIb/t1ifBphDlOho9g/XAJKf3Z1J2SHNTLfSnpOwv/c
	 xJjc4pgirTu9884SxaKxHxA/Rm0b5/Nq4hP5uwrUgVXP8l15LNMiCwh7DpaOWzgWQjV1x
	 BMRG1ksxPgD0EvtS1VJQfy/j+tv2BRzm83wRhG47cQynyqo/+ste3klvvAYpK4COVXTAe
	 sVjkuqYa9N+Q4nLxBdfuYNmFC8Sc3KWICSLW2Q4w4M9gZPRzKYY/x4ugJRU3NzEZWgeJG
	 y1RLj/tJc+rOhi1qOwgyl4QrK6l+ws5gw9i5UFqlBpWJwRKfjBp10p4lfIRvFEOmFCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PVXEtaWN;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B87606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68B87606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PVXEtaWN
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so2871892eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795319576; x=1795924376; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+r6XPfaUdJuFlB5RmbvVvkEeNjRjm4uTzzQBZy+VHg=;
        b=PVXEtaWNAobpNBKrYAnGPsfINoEQ8arEHOITk/55CQev26mX6WjYKUhLNpYN8ORHpQ
         4+bOoIqYKv6aembKZFkZE/VAcv8QJGfZRgEQf97ymqlrsVdWty2j+COBYAsxo7+iaoBX
         ZSDUNobrqGzdChl8EAFEvsrk/rB3gVJ4PO5RwZ8Xqg3FBuFF1powXwFjXFZHx/zRNFYY
         TfkayL+GlVPDHmdS6wngUbuqVYO5522Yb+nZ2f+4pQRCvCRI6YwTV3Psntif0XSrcjrs
         WmiQSsGmC/8gKKULxvgdNMy3NuAF35jSlvD6Re2eZt65UTC9p9xenGTbdEwWrGZ6vGiu
         wNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795319576; x=1795924376;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b+r6XPfaUdJuFlB5RmbvVvkEeNjRjm4uTzzQBZy+VHg=;
        b=spogU2pptxjr8uJrHw3VKosQZ5YfzjZ62znRE81ewLt/MAWBSPLCJDJtaz0vFgRFSc
         Rek730XzfIBPmDucUN4eIpCMSI988vusL/jpMt2RoIXF6iOy+FHfmkHfQlKmC089fMnf
         e2kYlN5+TevxnX1KgZod7nW1usFBydif8guMIoBSz5dr+RR/6CLbqA248fAYaFmEKnJh
         xCNT6Wwq0/UL5STFkGQtg3KCdx0zbR8UQJWtKgOjSu/iqqXANRGXW018Hpp6wYiIX6cr
         /qScXDQEm2pJ/JmXULvaVmJky/JAOw/RVIoHPKm9F10iO/Ji4PJ/uPi8RC2haYFet9PX
         QUQQ==
X-Forwarded-Encrypted: i=1; AL+hErGYkr2/gDHnsJbnYyLojT/SrFly63ftV03SJknIBiDFt5qeWWZjIEEbpqFNTZ2KRpgmpeWOUoch2kv/XQQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+euKmdzfjeo4iuuEYoVIoV7PgsNR2TOxPlAHvwQxOxY3ZBa2Wm
	sNN8iPNFfR+E6IaINSlceNbZn48AI4OqLN+dGqdH3VYc9QvSSDoWrcKmAFn6QHLceoSfZQJKqhu
	9mBPAyr3AT7+Xhq4lEQ==
X-Received: from dyev10.prod.google.com ([2002:a05:7300:430a:b0:343:520f:7a80])
 (user=penghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:8807:20b0:380:c3e7:7814 with SMTP id 5a478bee46e88-3856f65e4aamr7582380eec.7.1795319574972;
 Sat, 21 Nov 2026 19:52:54 -0800 (PST)
Date: Sat, 21 Nov 2026 19:52:54 -0800
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
Message-ID: <20261122035254.2891197-1-penghuang@google.com>
Subject: [PATCH] sched/proxy, sched_ext: Skip proxy-exec on SCX owner with holding_cpu
From: Peng Huang <penghuang@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Tejun Heo <tj@kernel.org>, 
	Andrea Righi <arighi@nvidia.com>, sched-ext@lists.linux.dev
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, penghuang@google.com
Content-Type: text/plain; charset="UTF-8"

During remote DSQ consumption or dispatch_to_local_dsq(), another CPU
claims @p->scx.holding_cpu and drops the DSQ lock while switching to
@p's source rq lock. Because commit 13ae184e4b82 ("sched_ext: Handle
proxy-exec races in remote DSQ transfers") made proxy execution
compatible with sched_ext, find_proxy_task() on the source CPU can pick
such an owner while holding source rq->lock, forcing the transferring CPU
to abort the placement and bounce the task to reject_dsq once it acquires
source rq->lock.

Like task_on_rq_migrating(), an SCX task with holding_cpu >= 0 is in an
in-flight cross-rq lock handoff. Expose scx_task_held() in ext.h, have
find_proxy_task() yield to rq->idle via resched_idle when an SCX owner
is held so the transfer can complete, and pair the lockless READ_ONCE()
with WRITE_ONCE()/READ_ONCE() on holding_cpu updates.

Signed-off-by: Peng Huang <penghuang@google.com>
---
 kernel/sched/core.c    |  9 +++++++++
 kernel/sched/ext/ext.c | 14 +++++++-------
 kernel/sched/ext/ext.h |  6 ++++++
 3 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5ed660f099a5..8aa309d86a6c 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7108,6 +7108,15 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 		if (!task_on_rq_queued(owner) || task_cpu(owner) != this_cpu)
 			return NULL;
 
+		/*
+		 * Do not proxy-execute a sched_ext owner while another CPU has
+		 * claimed holding_cpu to transfer it off a DSQ before locking
+		 * this rq; yield the rq lock so the transfer can finish
+		 * without bouncing the owner into reject_dsq.
+		 */
+		if (unlikely(scx_task_held(owner)))
+			goto resched_idle;
+
 		if (owner == p) {
 			/*
 			 * It's possible we interleave with mutex_unlock like:
diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index e29c9c18e1ab..5202f750a3b5 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -2043,8 +2043,8 @@ void scx_dispatch_dequeue(struct rq *rq, struct task_struct *p)
 		 * but @p->scx.holding_cpu may be set. Clearing holding_cpu
 		 * tells dispatch_to_local_dsq() that it lost to a dequeue.
 		 */
-		if (p->scx.holding_cpu >= 0)
-			p->scx.holding_cpu = -1;
+		if (READ_ONCE(p->scx.holding_cpu) >= 0)
+			WRITE_ONCE(p->scx.holding_cpu, -1);
 
 		return;
 	}
@@ -2067,7 +2067,7 @@ void scx_dispatch_dequeue(struct rq *rq, struct task_struct *p)
 		 * unlink_dsq_and_switch_rq_lock() that it lost the race.
 		 */
 		WARN_ON_ONCE(!list_empty(&p->scx.dsq_list.node));
-		p->scx.holding_cpu = -1;
+		WRITE_ONCE(p->scx.holding_cpu, -1);
 	}
 	p->scx.dsq = NULL;
 
@@ -2978,7 +2978,7 @@ static bool unlink_dsq_and_switch_rq_lock(struct task_struct *p,
 
 	WARN_ON_ONCE(p->scx.holding_cpu >= 0);
 	scx_task_unlink_from_dsq(p, dsq);
-	p->scx.holding_cpu = cpu;
+	WRITE_ONCE(p->scx.holding_cpu, cpu);
 
 	raw_spin_unlock(&dsq->lock);
 	switch_rq_lock(locked_rq, src_rq);
@@ -2993,7 +2993,7 @@ static bool unlink_dsq_and_switch_rq_lock(struct task_struct *p,
 		 * holding_cpu with it so that no caller has to.
 		 */
 		p->scx.dsq = NULL;
-		p->scx.holding_cpu = -1;
+		WRITE_ONCE(p->scx.holding_cpu, -1);
 		scx_wait_dispatching(p);
 		return true;
 	}
@@ -3213,7 +3213,7 @@ static void dispatch_to_local_dsq(struct scx_sched *sch, struct rq *rq,
 	 * under transfer with holding_cpu, release DISPATCHING and then follow
 	 * the same protocol. See unlink_dsq_and_switch_rq_lock().
 	 */
-	p->scx.holding_cpu = raw_smp_processor_id();
+	WRITE_ONCE(p->scx.holding_cpu, raw_smp_processor_id());
 
 	/* store_release ensures that dequeue sees the above */
 	atomic_long_set_release(&p->scx.ops_state, SCX_OPSS_NONE);
@@ -3230,7 +3230,7 @@ static void dispatch_to_local_dsq(struct scx_sched *sch, struct rq *rq,
 		bool fallback = false;
 
 		/* the handshake is over, see unlink_dsq_and_switch_rq_lock() */
-		p->scx.holding_cpu = -1;
+		WRITE_ONCE(p->scx.holding_cpu, -1);
 
 		/*
 		 * If @p is staying on the same rq, there's no need to go
diff --git a/kernel/sched/ext/ext.h b/kernel/sched/ext/ext.h
index d32bc01071b0..f936300b5aea 100644
--- a/kernel/sched/ext/ext.h
+++ b/kernel/sched/ext/ext.h
@@ -54,6 +54,11 @@ static inline bool task_on_scx(const struct task_struct *p)
 	return scx_enabled() && p->sched_class == &ext_sched_class;
 }
 
+static inline bool scx_task_held(const struct task_struct *p)
+{
+	return task_on_scx(p) && READ_ONCE(p->scx.holding_cpu) >= 0;
+}
+
 #ifdef CONFIG_SCHED_CORE
 bool scx_prio_less(const struct task_struct *a, const struct task_struct *b,
 		   bool in_fi);
@@ -75,6 +80,7 @@ static inline void scx_prepare_setscheduler(struct task_struct *p, int policy) {
 static inline bool task_on_scx(const struct task_struct *p) { return false; }
 static inline bool scx_allow_ttwu_queue(const struct task_struct *p) { return true; }
 static inline bool scx_allow_proxy_exec(const struct task_struct *p) { return true; }
+static inline bool scx_task_held(const struct task_struct *p) { return false; }
 static inline void scx_proxy_donor_start(struct rq *rq) {}
 static inline void scx_proxy_reenqueue_retry(struct rq *rq,
 					     struct task_struct *next) {}
-- 
2.56.1.750.gf70dc682cf-goog

