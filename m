Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670096;
	b=BtjNzXOS9nDz3cFOVfzWXawDCiVMQ+41ZMBvZMXOMVVODfWpZluEjLmA+RqG5sVi7H8Q
	 52Gw1FfsY8wk1ARFWv3e1s86pEpbtrZUBGGWFF42vBzIVKkf+AuPTz2XwYe+OhfuhdNyp
	 tqWKeKKXr7QcbIRYhuhKCbBdHffjNDyNaLf3Lt/NOoev2Vu3cXbgykjGifngf0EG34AXM
	 C0/hHqJthRXlShpEsXygkA383IAFSa7JU2+OwF28MA+J3Fe9Ha97lcI5B1q2OE4HnORSd
	 w7csNs7n1OTPjPudeogtb6v/O3G9ALHd8GntfSgSmXkuQpWoyvp24WVIi0f25Afjy5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5KJCVSkn54z9cg61j9emwWV4pAn4TZto82u6cLhHQJQ=;
	b=HnjV6Sw0YQC4BpMbxbrSAeKDWjwDaf+Ik9ri40rD0yy0UkwLpebYF8K/fju7Xvzc3DKM
	 p4jSngXA8WnLjFmVULs3nTJ8Db0QlYU9afsDRc2WrO3S8j/VoWHbxe7YNGqX0FgFGG/tv
	 CQMTf4rAeik/SJrPoLlq23mgpx6KPUEam9Igoog19niZA/g3O13TRkYpq4uB1DDY5Wftg
	 /mtYTml4VGVELA0HQheztgA18xqtpD7JdpI4h8HxuY+pAYQZkIJE9AMM3vqiS12l649yr
	 AZ14OHJ/cAubjQ8V1s8GQt8vUcEwoewneHNM1zgJVvQ6CSY2G2Pa49Ud+kLkutcABiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZUeFIq2Y;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0252E606A330
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0252E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZUeFIq2Y
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so4626887f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795670094; x=1796274894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5KJCVSkn54z9cg61j9emwWV4pAn4TZto82u6cLhHQJQ=;
        b=ZUeFIq2YVM6xFW2blZJUOWgZpIwt+xqZM0JVskhQrba1qhmzdyBM5bPqBJ3/pWTO0U
         4RtTcQEIP6PhDv+Ryi5/mOKAfGXajdUMSkcOgDV+Onqc8plrfAKQ3dCjEsrlCLjMo4KF
         A6VVsrGFUH7Qy/8GaB32ZQ1hGSO52SZxvacVEsywIjPjWL9h/mAdhixUkfEmUu6esDgk
         DCiG2so7gQ8drcDCY5v6c5RAVj7zGi57opFpZW96YQPi/VaLRcdZ801/EslAnkLAcjjp
         OVnNuAn/+qV68kJR/8IQ0AOVJ/btiEHsD7THAXZqYQgQkUtreUo6dk2DciXYmpTj2q2/
         TmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670094; x=1796274894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5KJCVSkn54z9cg61j9emwWV4pAn4TZto82u6cLhHQJQ=;
        b=JfZ0sj5bvOEY6+CFlA/c8intgT6QRHCt4iFSopcLNXLzgZjHn3WcKoHl5IsCMPloQ/
         uGoyutN3Zn3igFED4UmQknKGypCnIleqlCgqUC/LJUY7YyavgNZN9S9IL7JazNLRfVmy
         T75TSp8m1RIXz2jHCSCZMxqQdzIV1aLZ4AWAh1DHzx6jbuRZZrSX3Wvlmc/BBCSjB1gk
         9gMxNPes7x2/Mpo6INHxL9JIfyn8gRWvoBG/U/lzlmmFHdnIcGx7UggJvDJiQrgtJw+M
         aRBTbj09FE7mD08Ruyzizh9/fVss2vQxyQxM2WZJf/QTbiWP9zH/pTKXL52EE777wmO1
         fykw==
X-Forwarded-Encrypted: i=1; AL+hErE7p0DJg5sf5JqS3uNAmrpXEJnYnir4Ruo3IYLIRvQ4lwldqPON5OPoBlPvCz9BqnnerdZkTLf8e8pvj+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZYTItKOPtHDhwkKG00Wdwn9zqQIYZLLMWE9PthQ3MFVWSyVqK
	2ob8pwoK4TV+RO75OBobUsMiJE43Vd4o7oTrSgbChE2HAqe+e9+JtUOLy2DzzdWBuR8=
X-Gm-Gg: AZFdTZckfynn2VYXn76o3nWVpmh5+DgOk3y2T5YJuuqyTJE2XDgjC45kkxkd1WGLRrv
	Fx8tpzkOfSq9XWRIYBeMMXJLCPprWz8Sz4TTy9J8km2eoDcMCfmbRgz2ZdrH9Wyx+ruNdKFwVKE
	XVtrz1CU9qSKvRodChqf5qdFpl8xGJcqdrs37RT2otCfb2jswE4L7A3MQhsAQAsTSeZ3LMeoehn
	zbzrONW0uYCOUQ+XGQ6mAEx40h6QQxat/gzo7EFQ5DqDG27Mwb6N9gJDE9MJz20z6yH/aFEDV8a
	lV3wtUyDc0PUlRuI4FcBVlA/X/on2ui+L1IvKXiAFQY1orpyGg7EN038xiWFJjo7GDwh1ELgcLX
	NxPRTHB+uWQPvbNMLRA4HMJs/ukQkUCzKMWHxpS4OX5FqlsISo3DiqkT0UbI/PzW5v+wel1fLhY
	SDROYn4pI+7J9KzwAAEw0Co6ZGAIYANJmgVVWXqyaMlFqX/Lcz/OsCw276ojob7GdB6i6IpiF2O
	pvBzO66GEaboWi0gOtalqh+4l5di9eHo4YlfMpPI0C9E4JrwqS11MmaKH01pRMTrJn+sVfT+cHh
	09ErpGojFTRY7Ui/DZrqBNDpic8A4Z4Uukz4YWX8ILQfd9mCKuhIA4/9NsFTmN6+eySnQSPzk9V
	EytZsT7khmQ==
X-Received: by 2002:a05:6000:402c:b0:4a3:41e1:9d16 with SMTP id ffacd0b85a97d-4abb19c05d0mr39004126f8f.25.1795670094345;
        Wed, 25 Nov 2026 21:14:54 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm39548128f8f.33.2026.11.25.21.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:14:53 -0800 (PST)
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
Subject: [PATCH v3 08/10] sched/debugfs: Add rampup_multiplier to debugfs
Date: Thu, 26 Nov 2026 05:14:27 +0000
Message-ID: <20261126051429.14091-9-qyousef@layalina.io>
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

Bursty tasks are hard to predict. To use resources efficiently, the
system would like to be exact as much as possible. But this poses
a challenge for these bursty tasks that need to get access to more
resources quickly.

The new sysctl_sched_qos_default_rampup_multiplier allows userspace to
do that.  As the name implies, it only helps them to transition to
a higher performance state when they get _busier_. That is perfectly
periodic tasks by definition are not going through a transition and will
run at a constant performance level. It is the tasks that need to
transition from one periodic state to another periodic state that is at
a higher level that this rampup_multiplier will help with. It also slows
down the ewma decay of util_est which should help those bursty tasks to
keep their faster rampup.

This should work complimentary with uclamp. uclamp tells the system
about min and max perf requirements which can be applied immediately.

rampup_multiplier is about reactiveness to change in behavior;
specifically when a task gets a sudden burst of work and gets busier.

In practice this is found to be a much better control than uclamp_min as
it is relative parameter and doesn't require absolute description. It
allows the task to go through the motion faster without knowing exactly
how busy it can get at any particular point of time.

The intention is for this rampup multiplier to be applied only during
a burst. It has no effect on perfectly periodic tasks.

This is purely to set the default behavior. The intention is to provide
per task interface later on.

Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 kernel/sched/debug.c | 2 ++
 kernel/sched/fair.c  | 7 ++++++-
 kernel/sched/sched.h | 1 +
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 94e65208807dd..56d520f076dd4 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -756,6 +756,8 @@ static __init int sched_init_debug(void)
 	debugfs_create_u32("migration_cost_ns", 0644, debugfs_sched, &sysctl_sched_migration_cost);
 	debugfs_create_u32("nr_migrate", 0644, debugfs_sched, &sysctl_sched_nr_migrate);
 
+	debugfs_create_u32("rampup_multiplier", 0644, debugfs_sched, &sysctl_sched_qos_default_rampup_multiplier);
+
 	sched_domains_mutex_lock();
 	update_sched_domain_debugfs();
 	sched_domains_mutex_unlock();
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7129347746436..8af44a20fb423 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -87,6 +87,8 @@ static unsigned int normalized_sysctl_sched_base_slice	= 700000ULL;
 
 __read_mostly unsigned int sysctl_sched_migration_cost	= 500000UL;
 
+__read_mostly unsigned int sysctl_sched_qos_default_rampup_multiplier	= 4;
+
 static int __init setup_sched_thermal_decay_shift(char *str)
 {
 	pr_warn("Ignoring the deprecated sched_thermal_decay_shift= option\n");
@@ -5985,6 +5987,7 @@ static inline unsigned long task_util_dequeued(struct task_struct *p);
 
 static inline void util_est_update(struct sched_entity *se, bool running)
 {
+	unsigned long rampup_multiplier = READ_ONCE(sysctl_sched_qos_default_rampup_multiplier);
 	unsigned int ewma, dequeued, last_ewma_diff;
 	struct task_struct *p = task_of(se);
 
@@ -6006,7 +6009,7 @@ static inline void util_est_update(struct sched_entity *se, bool running)
 			unsigned int prev_ewma = ewma & ~UTIL_AVG_UNCHANGED;
 
 			do_div(delta, 1000);
-			ewma = approximate_util_avg(prev_ewma, delta);
+			ewma = approximate_util_avg(prev_ewma, delta * rampup_multiplier);
 			/*
 			 * Keep accumulating delta_exec if it is too small to cause
 			 * a change.
@@ -6074,6 +6077,8 @@ static inline void util_est_update(struct sched_entity *se, bool running)
 	 * 0.25, thus making w=1/4 ( >>= UTIL_EST_WEIGHT_SHIFT)
 	 */
 	ewma <<= UTIL_EST_WEIGHT_SHIFT;
+	if (rampup_multiplier)
+		last_ewma_diff /= rampup_multiplier;
 	ewma  -= last_ewma_diff;
 	ewma >>= UTIL_EST_WEIGHT_SHIFT;
 done:
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 27c18701de35c..eea6129c5cba7 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3270,6 +3270,7 @@ static inline void __attach_tasks(struct rq *rq, struct list_head *tasks)
 
 extern __read_mostly unsigned int sysctl_sched_nr_migrate;
 extern __read_mostly unsigned int sysctl_sched_migration_cost;
+extern __read_mostly unsigned int sysctl_sched_qos_default_rampup_multiplier;
 
 extern unsigned int sysctl_sched_base_slice;
 
-- 
2.53.0

