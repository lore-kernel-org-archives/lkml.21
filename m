Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670087;
	b=QVsj6B+sWIKaW6EBBhPy9bZnmmtHpQJvQ++mJnjou+1KcC2b7rZXwGp8V6WIQQf+kp+8
	 lbiNTHmitTMb7WZm6NeN3YJYVdakzYAcYLposVyfWr5eHH7OjrCmQfWd08kShXQDNjzzm
	 67zGno1etVegEEhEW+8Scc6A7F6gE2RQfSZMtSh4oq2Qq7eaN2/P1AWs7wb8vArK8pGMz
	 RaS5jK+PzyX/0HBIkk1i/XtFicwcqITEKJt9nl/VQfzfKUJ8Vnlcd6z2b4rs1fxcHfzQ3
	 69BFTsAydFoyjepdHyWpb4DQUdV5QfLXVuPdvpAgt4DD46oNUZhoVKXnZPTcDoWLcTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mmRg+npdomSnQkiVHRc5rk1wHVyq+4bVsNGtpxwqPCs=;
	b=zHMOudWn2qcjCFt92rTSaBH1GZidZVvzrCORt0CBCCBtXKMsuZQ3KeF+RBZ2v0aE3lac
	 cq0L9AztX3mDhLScu4lGz5GZZdDtH9o2UnAYdBOSGRKSdpbAYOaJU1oi8nqiq8OxIedaH
	 x2vxfcB/1HB3+qVqg4Cv90O45rnwsj9CE/7KerxJAooNu12L4urd8a4mUgljQWzjoJURT
	 m/WodK2lB3RsqsJ+QpXO7070Sr3+y6vbBSNsDl3bLcHq4JKYBqzledXMSsGmGeCEATjTB
	 edjA0xZYT1R9wfnMmrVdWHvAgTjUrKQUmZR4cv1wKMWil8bDxUG8U2bolWBvRrPYE3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gwxt3KYM;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B12606A337
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47B12606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gwxt3KYM
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49412eb1474so4249269f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795670086; x=1796274886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmRg+npdomSnQkiVHRc5rk1wHVyq+4bVsNGtpxwqPCs=;
        b=gwxt3KYM+sqedwf55mC4K9E+OwH8IMcmBo7rRvDuDJWX9IGUZH8Sc6fdYtNhAuwzSd
         nYuWNPjtgmvWfuLFDjCX3A/RtvxqIoNhTP+FvPoAuHOyFRbZ1yBY4YncByyoCHVxSjo2
         Ac4copIUwqxAXVJ3xDe+ihpG7radT0F7EK8ps7JG54Djtuc20D7eZCCTMybgGReLMWn0
         ucIb5/GHFr7ot2nrL6lVwku37CATS2nhG+coj6QhwSQy2D6+1dbFL6Wlml+Z/fFKb4WE
         yjlGD8UY7YcCa0+9GhaQb4/miUYa61zy/jq2iO1FeYA3RKPM0UdYoTBV93n+Qru8ndT7
         kxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670086; x=1796274886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mmRg+npdomSnQkiVHRc5rk1wHVyq+4bVsNGtpxwqPCs=;
        b=PzvSdTINZRuc1xEhWV/4nhw1pcYSYWspJBK3WcyN8iOJCL8OZvpmROrVCmIm9K0Uyt
         Rk39k9JXdvB7Tj6us2y+NWAQVS0vgwycIDc5y4BrvfaOO/ahKYpKc2JmX41FQcaNdjTF
         VgKYBfSUUBgL6bMnEObhC8EXrRkAMTmvwCHjqQEBdBFpv5CA5Ic5udYdOlLRI8ZATpsF
         woNzRyN5FrGS1bYbzdUxYThSy5VSF5iCvyF48C02rWvg8+iK4KmobyzTRp792dxccOG2
         1X4Z9cjQlgO4bl4hTWHM9EsDPIdPUo91EplsJHrlQkIr1EvkBeBjBnqIIQSNwl1gQtxr
         V7dA==
X-Forwarded-Encrypted: i=1; AL+hErFGEqWTTaWzkEweQJre0WlroguVt67szspz+BNit/fYjPfNy+2EO2+jWyloN4E96bX/b/d79u0317o//9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/PXKwkAX4A/KX3qienEba5etSItEnCZuwgHFgQzRQL0weuhfq
	m5BznwhzjdvFE5krqfRJO+XyQw28x/fWOP+9JrCaVSZGp2RDo6Rve+hYht5Ek7/XNys=
X-Gm-Gg: AZFdTZeh1+/6Pr0J4vmQnuB1p6kPUtUyOcbG2Eb8wsUPhB8o5Bgq0jQjh4J8o2o5dQa
	XUgdudRP+r3N86ks/OF2XNWcPOUekCoZhwNI0qVpO+lwPiLfpgknr980XukHoD+4TjqTlpAiRDH
	H8TZIuUlGGdF49CP/bCDAYI2uuccq/Z41vkXxB+ZnbsQ7yY8c7Ul9CQ6YgA/kPG4stL52K2Y05m
	LN21AJNm4saU+KJlzGJdajqEtLWwHlrxHLAu3ykI8JIuw/TaP+tXZF6u5UFgQHh4tzogll11koG
	Im+zaj/XAMnlV0HKW0Jif/ctKIcNsLSQHTBl5eANYqnLj30N3Xn23qVKPAb+yA9QK0wGUxzL3UL
	GL2MM+brvjUowix6OyVtnxp2trloLahtenAwQGwd8KiUuuN4x23mg27vrE6UKvkTkcAFZbbo6Od
	wc2oU2sPf2w3Jyod+qC9R9oJZ5rr73sNE3m/7IGqXdyFwHZPb6IqTs+5ETWB7EfAtluICkSkh/f
	J1chR9Aak/eOjHVax7aL8i6wNJRNmM+jDVPClXAlkgbt2l3B9FXzmbwcIYoqsn0nvl4KCfFRkKc
	bfzhDHXUw4Rd1Uj3mP1teA4cPR/rPH4PBYSXklGYOdXhiImx2uGVmQlrNM3AP+/3KFWzZt+WO4L
	03vaGnIZM
X-Received: by 2002:a05:6000:4a14:b0:49d:7e8c:e89c with SMTP id ffacd0b85a97d-4abb6a26cfbmr37246824f8f.42.1795670085607;
        Wed, 25 Nov 2026 21:14:45 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm39548128f8f.33.2026.11.25.21.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:14:44 -0800 (PST)
From: Qais Yousef <qyousef@layalina.io>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	"Chen, Yu C" <yu.c.chen@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org,
	Qais Yousef <qyousef@layalina.io>
Subject: [PATCH v3 04/10] sched/fair: Remove magic hardcoded margin in fits_capacity()
Date: Thu, 26 Nov 2026 05:14:23 +0000
Message-ID: <20261126051429.14091-5-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126051429.14091-1-qyousef@layalina.io>
References: <20261126051429.14091-1-qyousef@layalina.io>
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

Replace hardcoded margin value in fits_capacity() with better dynamic
logic.

80% margin is a magic value that has served its purpose for now, but it
no longer fits the variety of systems that exist today. If a system is
over powered specifically, this 80% will mean we leave a lot of capacity
unused before we decide to upmigrate on HMP system.

On many systems the little cores are under powered and the ability to
migrate faster away from them is desired.

Redefine misfit migration to mean the utilization threshold at which the
task would become misfit at the next tick event assuming it becomes an
always running task.

To calculate this threshold, we use the new approximate_util_avg()
function to find out the threshold, based on arch_scale_cpu_capacity()
the task will be misfit if it continues to run for a TICK_USEC which is
our worst case scenario for when misfit migration will kick in.

Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 kernel/sched/core.c     |  1 +
 kernel/sched/debug.c    | 10 +++++++++-
 kernel/sched/fair.c     | 15 +++++++++------
 kernel/sched/sched.h    | 26 ++++++++++++++++++++++++++
 kernel/sched/topology.c |  1 +
 5 files changed, 46 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index ea89471d4743c..5dd53cef22117 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -9071,6 +9071,7 @@ void __init sched_init(void)
 		RCU_INIT_POINTER(rq->sd, NULL);
 		RCU_INIT_POINTER(rq->rd, NULL);
 		rq->cpu_capacity = SCHED_CAPACITY_SCALE;
+		rq->fits_capacity_threshold = SCHED_CAPACITY_SCALE;
 		rq->balance_callback = &balance_push_callback;
 		rq->active_balance = 0;
 		rq->next_balance = jiffies;
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 869bea87d2ce0..94e65208807dd 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -736,7 +736,8 @@ static __init void debugfs_cpu_init(void)
 
 static __init int sched_init_debug(void)
 {
-	struct dentry __maybe_unused *numa, *llc;
+	struct dentry __maybe_unused *numa, *llc, *fct;
+	int cpu;
 
 	debugfs_sched = debugfs_create_dir("sched", NULL);
 
@@ -785,6 +786,13 @@ static __init int sched_init_debug(void)
 			   &llc_imb_pct);
 #endif
 
+	fct = debugfs_create_dir("fits_capacity_threshold", debugfs_sched);
+	for_each_possible_cpu(cpu) {
+		char name[16] = {};
+		sprintf(name, "cpu%d", cpu);
+		debugfs_create_ulong(name, 0644, fct, &cpu_rq(cpu)->fits_capacity_threshold);
+	}
+
 	debugfs_create_file("debug", 0444, debugfs_sched, NULL, &sched_debug_fops);
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 731d78155e654..e92b923b769ac 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -103,11 +103,15 @@ int __weak arch_asym_cpu_priority(int cpu)
 }
 
 /*
- * The margin used when comparing utilization with CPU capacity.
- *
- * (default: ~20%)
+ * fits_capacity() must ensure that a task will not be 'stuck' on a CPU with
+ * lower capacity for too long. This threshold is the util value at which if
+ * a task becomes always busy it could miss misfit migration load balance
+ * event. So we consider a task is misfit before it reaches this point.
  */
-#define fits_capacity(cap, max)	((cap) * 1280 < (max) * 1024)
+static inline bool fits_capacity(unsigned long util, int cpu)
+{
+	return util < cpu_rq(cpu)->fits_capacity_threshold;
+}
 
 /*
  * The margin used when comparing CPU capacities.
@@ -6213,14 +6217,13 @@ static inline int util_fits_cpu(unsigned long util,
 				unsigned long uclamp_max,
 				int cpu)
 {
-	unsigned long capacity = capacity_of(cpu);
 	unsigned long capacity_orig;
 	bool fits, uclamp_max_fits;
 
 	/*
 	 * Check if the real util fits without any uclamp boost/cap applied.
 	 */
-	fits = fits_capacity(util, capacity);
+	fits = fits_capacity(util, cpu);
 
 	if (!uclamp_is_used())
 		return fits;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 50cf07c364727..f4e6e85d45a07 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1324,6 +1324,7 @@ struct rq {
 	unsigned char		nohz_idle_balance;
 	unsigned char		idle_balance;
 
+	unsigned long		fits_capacity_threshold;
 	unsigned long		misfit_task_load;
 
 	/* For active balancing */
@@ -3780,6 +3781,31 @@ unsigned long sugov_effective_cpu_perf(int cpu, unsigned long actual,
 unsigned long approximate_util_avg(unsigned long util, u64 delta);
 u64 approximate_runtime(unsigned long util);
 
+static inline void update_fits_capacity_threshold(int cpu)
+{
+	struct rq *rq = cpu_rq(cpu);
+	u64 limit;
+
+	/*
+	 * Calculate the util at which the task must be considered a misfit.
+	 *
+	 * We must ensure that a task experiences the same ramp-up time to
+	 * reach max performance point of the system regardless of the CPU it
+	 * is running on (due to invariance, time will stretch and task will
+	 * take longer to achieve the same util value compared to a task
+	 * running on a big CPU) and a delay in misfit migration which depends
+	 * on TICK doesn't end up hurting it as it can happen after we would
+	 * have crossed this threshold.
+	 *
+	 * If capacity is too small that limit is less than TICK_USEC, this is
+	 * bad configuration and we'd have to skip this CPU always from
+	 * performance point of view.
+	 */
+	limit = approximate_runtime(arch_scale_cpu_capacity(cpu));
+	limit = limit > TICK_USEC ? limit - TICK_USEC : 0;
+	rq->fits_capacity_threshold = approximate_util_avg(0, limit);
+}
+
 /*
  * Verify the fitness of task @p to run on @cpu taking into account the
  * CPU original capacity and the runtime/deadline ratio of the task.
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 99878da03bce7..53ba488955a28 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -842,6 +842,7 @@ cpu_attach_domain(struct sched_domain *sd, struct root_domain *rd, int cpu)
 	destroy_sched_domains(tmp);
 
 	update_top_cache_domain(cpu);
+	update_fits_capacity_threshold(cpu);
 }
 
 struct s_data {
-- 
2.53.0

