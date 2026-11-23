Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464835;
	b=tN59HnUOIQL6sJy0jImSZGzdy7r0lKmQ2iuHK2SPZ0IYqLkScs6SygpTMDZqnXXCg/IK
	 nOEa9/+NtZx2DrviX2EXV4brTXP6Zdsi9nOIuLcV4Mzy1dLW4T7835NxKtp/v1o9OC9jS
	 11RUOcPBpAXOTi7fw4PMiE3bMyTy5nOse5sJdBNSYtT8DhDnC6TvbBQHeERCTa3acPm87
	 BUEV3SN9I91ph/m0xgpdwVRUXF4yiCoeGcEO1rfXVxM07Vc/33ycM7N2mcnlz4NDxFKqX
	 P4w3/uQ0OxdtgSqhqpp9cKQt1/kOKKkLZ8t6OMc1tQM+/JwiyL6kM4PQkEwd7oIuf4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=OvpPMptrHzBE3IreIziZcS9fob5PN9ySIM3VZNI+Dzw=;
	b=GXfpn2l6QknXzoQqEM5QOXLK2WeoT7ra+tot3y6ppBkopEMjI5Qi1ct/E9K7fXyMgE+t
	 kSux46DE0EIZipEA2oOzVkXaCT3k1i7LoK0q96Kfgz5Hk154YtvkniQSCUHOmpnlZA/Tb
	 3/dEiFFDBM4LOVPpY4sE8c9Tb0BbAAYfQL2rATh/w/+bQB9xI9IuATy9Oy78uWy+HgS1p
	 ftV3knoEsa+kFbqDlkr3osLoyj6GVh4Vz4f9/O0faqS3Us6+uES3ksWqb4JqUq5jhKjwm
	 9TFzzjb/5O98UUlzGamwH/i+K0tL0TMtm+AZKRKpfBjl7pFyhaw4nEzrJ4nPKoUqCaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DDqnOq5x;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177F7606A680
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 177F7606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DDqnOq5x
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b25d977b91so3915250c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795464834; x=1796069634; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OvpPMptrHzBE3IreIziZcS9fob5PN9ySIM3VZNI+Dzw=;
        b=DDqnOq5xq6RaKiZmEG89Cm0Xgoq+vkkGqfz04Cx0/yNmgwsDn2fa8m6rNnMxKKBcvh
         Ebf68WwmVpiPA+oVpjp7/fAyBAdOD3v1PJw6r4zAAy1BkYZoxdHBQ9KM3292s21J28+E
         z4SYiBvNLWBPwy9s50UIlz4WV+dwPBu0D7QFCZ74zSWsTkOAQ2fkZ/ttjfePEBEr+Juo
         sKu591ZVGdNLIovcFl9zPlkbgDKxx3DNs9Ga+ASKhrZaQbgGrCEVbiWKyTOgCdLUOvgE
         jB/Q8g1qJ2Gx1bp3Jw/FNHMs167PuXg7CGSCX5VcbQPcuI7psBTo2D2XOgLBpxDpUpD1
         ou1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795464834; x=1796069634;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvpPMptrHzBE3IreIziZcS9fob5PN9ySIM3VZNI+Dzw=;
        b=lHuWlKC8+vCk5cAmezwrTGWZo3mBdrTZxEfWuESyWfsiB8bjHg+guPbBu1j+Dr0uyo
         vwZrXw6qp4vVS6VIg71/x4wvqRSJL3k29qLBs5WSdz4MES+SZJf6dmd+SD1Rva+pYJ1c
         0nGyhWRpKzpUdGipnZ/yyyrn9JLVxfTudB5yagc+hmKZCbEOkRbxvJSG7UmCC3nuw0j5
         vHuFwRGjauvVam31MbhPvd2EaIUfeoRi+ewx8vTQjDz7FELbOVQUTx7HP0NNapuot0Ki
         RkiyelTEhUM6HqMz5Nvajp2QLj9RZPbRflF+4DseQw4jkeQgUzARDVbcITUpQC+t0RH3
         Tl1Q==
X-Forwarded-Encrypted: i=1; AL+hErGxlpBVdHgJmODtPEHdb1CO0KXUVJU2JRxeaGTo9g96Hf6HpaN94Xv5WjzaWKozw8vgbNJ+JUDZFTCvoZQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ySrgDl+lybcLc/zDXmISv80C0V0Y9nNCHwTW624j3PPE9hbNo
	XHZPyAYHNmdJB7aqKuZivLjNyIq55b9yRL39wBCmvKFYwOylSzcJwkzeV8xUkANWOapwfK/pPLw
	IOax+bq08Ldqb9n2qZg==
X-Received: from dlbts3-n1.prod.google.com ([2002:a05:7022:b043:10b0:1b2:5271:f03b])
 (user=penghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:2810:b0:192:74cf:1db2 with SMTP id a92af1059eb24-1b5568650b5mr11311923c88.11.1795464833720;
 Mon, 23 Nov 2026 12:13:53 -0800 (PST)
Date: Mon, 23 Nov 2026 12:13:51 -0800
In-Reply-To: <cover.1795462673.git.penghuang@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122015729.2512645-1-penghuang@google.com> <cover.1795462673.git.penghuang@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <2b1ef28e12d12a1f894827b951910c1979d54d45.1795462673.git.penghuang@google.com>
Subject: [PATCH v2 2/2] sched_ext, sched/fair: Drain blocked load on scx_switched_all
From: Peng Huang <penghuang@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org, sched-ext@lists.linux.dev, 
	stable@vger.kernel.org, Peng Huang <penghuang@google.com>
Content-Type: text/plain; charset="UTF-8"

Tasks that exit or migrate while sleeping queue their PELT load and
utilization in cfs_rq->removed rather than deducting and propagating
immediately. When scx_enable() switches all fair tasks to sched_ext,
switched_from_fair() only visits cfs_rq chains that still hold live
fair tasks, leaving unvisited leaf cfs_rqs undrained in rq->cfs.avg.

Once __scx_switched_all is enabled, scheduler_tick() skips
sched_balance_trigger() and fair_sched_class is bypassed, freezing
blocked-load updates. Stale rq->cfs.avg.util_sum can then combine with
active RT/DL util_sum in update_idle_rq_clock_pelt() to exceed divider,
inflating rq->lost_idle_time and stalling rq_clock_pelt().

Export __sched_balance_update_blocked_averages() and call it on each
CPU in scx_enable()'s per-CPU scx_switched_all() loop so pending
cfs_rq->removed entries and task-group propagations are drained cleanly.

Fixes: f0e1a0643a59 ("sched_ext: Implement BPF extensible scheduler class")
Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
Cc: stable@vger.kernel.org
Signed-off-by: Peng Huang <penghuang@google.com>
---
 kernel/sched/ext/ext.c | 9 ++++-----
 kernel/sched/fair.c    | 7 ++++++-
 kernel/sched/sched.h   | 1 +
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 10de6bd865e8..f7c573092e17 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -9013,11 +9013,9 @@ static void scx_root_enable_workfn(struct kthread_work *work)
 		static_branch_enable(&__scx_switched_all);
 
 	/*
-	 * Detach the fair_server bandwidth reservation now that the switch
-	 * is fully committed. In full mode (!SCX_OPS_SWITCH_PARTIAL) no
-	 * task will ever run in the fair class, so give that bandwidth
-	 * back to the RT class. The matching ext_server attach already
-	 * happened earlier; this only releases bandwidth and cannot fail.
+	 * Detach the fair_server bandwidth reservation and drain any
+	 * remaining blocked or removed fair load now that the switch is
+	 * fully committed and periodic fair blocked-load updates stop.
 	 *
 	 * In partial mode keep fair_server attached.
 	 */
@@ -9028,6 +9026,7 @@ static void scx_root_enable_workfn(struct kthread_work *work)
 			guard(rq_lock_irqsave)(rq);
 			update_rq_clock(rq);
 			dl_server_detach_bw(&rq->fair_server);
+			__sched_balance_update_blocked_averages(rq);
 		}
 	}
 
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index f6c3bbb19557..f19f498e01a4 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11655,10 +11655,15 @@ static unsigned long task_h_load(struct task_struct *p)
 }
 #endif /* !CONFIG_FAIR_GROUP_SCHED */
 
-static void __sched_balance_update_blocked_averages(struct rq *rq)
+/*
+ * Update blocked PELT averages for RT/DL/IRQ and fair cfs_rqs on @rq.
+ * Caller must hold @rq's lock and have updated @rq's clock.
+ */
+void __sched_balance_update_blocked_averages(struct rq *rq)
 {
 	bool decayed = false, done = true;
 
+	lockdep_assert_rq_held(rq);
 	update_blocked_load_tick(rq);
 
 	decayed |= __update_blocked_others(rq, &done);
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 220927453a88..71a69f90e5df 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2977,6 +2977,7 @@ extern struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf);
 extern void update_group_capacity(struct sched_domain *sd, int cpu);
 
 extern void sched_balance_trigger(struct rq *rq);
+void __sched_balance_update_blocked_averages(struct rq *rq);
 
 extern int __set_cpus_allowed_ptr(struct task_struct *p, struct affinity_context *ctx);
 extern void set_cpus_allowed_common(struct task_struct *p, struct affinity_context *ctx);
-- 
2.56.1.831.g720f3f5937-goog

