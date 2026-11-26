Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670090;
	b=i7BXbMpWaWiM1DqAg0YWeg0LL5KQSSWVpOD5zukwfl+/GO03pTPQ1+PA5kNlzleWPkLa
	 HvMgGbaz6jUaOPiXhmuBc/stGnQ5iv6ise4nZa91qSufm0ebcBbbf0CAZTJZNtI51IeAq
	 0Wy6WQadBi/yVubIdDlfiWQn63wPfQdE8g4M5eaYqV3WXOJal/6REpiTytPglzFvhqpa9
	 zINdElDyF/AtOZgVLWGkLCGh1E19FVMCd+RjayUCI0NHIl/yqPQtdhSBYkxFipt499r7/
	 DTdi2WsZq8d3WuapAykuBsdY5xeFj+ylGgLP9PdsMenzWTrv58taPkvOQ8wArtxqROg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h2oLnRG4MF78Xudi/WMlQ5bt7OOxOzkVOxw2lvz0PY0=;
	b=gLuXGOD5rLijqr98QszPPncXn6X8tBC0YoOojlNyTIwbjJBEuQUDpztXEd9ONwe0hHPI
	 O0FF9vt7U29BeBs1Qc/X+CweWHftWUG3wOaaY7oCae9tUE0ameA0CcMnAhrvGVnucpZrP
	 GDgZZNts88g9flM9yoDIhHOnuWwnoShy8/SrNyyrXB6kv/k9r8OSPd3OfKa2t7sLq7ijf
	 HThfBQIHkI5pveBsNXSgelFHf6LezAwt2G2mE5L3oS3tqH9a3Uviqnrul62m1osgfdZxf
	 6ixk9WC4wpcs20E5aSYX0sQh8z0YWRIygW51qOaT2Zt3TBk2B0osSbJBapof6aZzUqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G7Bg8bgZ;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B23606A336
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7B23606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G7Bg8bgZ
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49a92144733so3234662f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795670088; x=1796274888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2oLnRG4MF78Xudi/WMlQ5bt7OOxOzkVOxw2lvz0PY0=;
        b=G7Bg8bgZzPQI+J9cSgWov0SOeFRpv+ovs37uqooYTE/XmIjsmJ8+0wxfsUu1GKsXli
         HS1elG7eNKd8yjPuR98a8CerHz7id8NrBZRqy6jzIEepHvy4PPmZw0ebrrHmTCq0AnoV
         9AxFSXA8FePpKphfaR2QTeMcntaOxzckJu7poEdXsbqnWC8YAckMhAJLeGqysHdZs4n1
         3ySgOSkTw8rQT5uGvxescnyMPT0YEi4Mu9XJZFyQR0FETJoAvBpK0ScH7sv4xyED/LXx
         iL7Vz7OtBjZLftqpDvK6DYx4AvTeNyk2CX30/G+ssMdJghi16X6gx6qv4pyA2CpfnpRt
         P9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670088; x=1796274888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h2oLnRG4MF78Xudi/WMlQ5bt7OOxOzkVOxw2lvz0PY0=;
        b=evcUqk1e8CMk+jcNPSTZ9heN/XAxOT/N9t+Tae4Ixni+gQVV/cMgQqlqVcaSnoq2Yr
         xZ5gIEyKp/RyovGyV4CC83s3N/fZ2qmv+q7oAWsUHmb5b0Oxdre4OvDX6R3RqCV9/R/0
         71H9n/x0IyPNyNIoeX3adqN7RMNV7SHTePmdBZT0G5MMJMib4CVl0g8U6k5dzhW0QczF
         lvPAvSyn/ugA8swxLLlHzJvhFYRfKFXhPBi8vZM1RqHwSKbdX6obtjrSbxmGywL6m2T/
         FVsSjvb4vyzdEMtiYdSRbDJYcJPDhzKJsuudE71cHDG3z2ylGgghuYWKLfj19HvcmNO+
         RcOQ==
X-Forwarded-Encrypted: i=1; AL+hErGacpTu2yK92XWuwsLDF7Te6D3Y+eRoCMmp5GQ0/jPB80dnySItYXHeKL3WRpjjHZj/Ve5ymFphHS5fYng=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AU4yuqZzVszfavvLawplADm5kIgM9iF9zjW6l8V8fw/TshWDa
	90QV80iBN3ctUVnQIumf5xPDx4FYBL8T0fPwLf70vc9r9lhE7oSOHC8M/c+N1TAnME8=
X-Gm-Gg: AZFdTZdcZj0ORGaQrlgoH4reEqFvgITbQ3pfypegkwhsZ9VBG3IoKQzXMko7bubDoiN
	7/xNesCVcR3w5OgFvV3sVlfYDrAFbnot1F0ZVh3+l23K6skOnq9Wn23gal8PwXrhl/zyxwhjXpa
	KLRyxaSno4c8Ba56f2rThc2IJ/3jJ5MuxFI4n/eqXDWt0Dfu0DztjJ27qGsy3sPIDzsCDQ9CZlt
	VeeJUHtweDS5LY5gay8yulFdx1TbONLii/Ku00tEC5h8/+/r8Io1iHqHpUV9cxzt/O69iXLyHEg
	nAU8EndCamyhFxMTKJF0fAVeJB0TVXXBsnSnw3N2aX7TJbu22PbkJuL0T/itYTFQPcqDeiGsEFR
	raOp+UNfYsQ1d0k3+Suo/ArM20RfJ5bWJQuWaMM93AEf1aDDdrVBn9KdGmzPD8aa/SsR/BqV4O1
	iq4HiJ7g5PQoJgMZTM0/5nl5cAY8wDgK8PzpOxbIZ6OAgoGKrep2LzbpYUc5FAbVYccjyg2IPZi
	enZ62ya8F896dY6WxO6BJsHEluUeLjhmYtopVkVtc0jPXTSnAsygLtnbDz0nJo5PvXq7rc4/+nb
	VVWRbaVrAA5aL6UX8b5cop7aa0zgcpFpbcm4X8/xtrfDCKAmvqpIdZxHOx1F8mXvUM21Vph6OeN
	fxKlUG1gB
X-Received: by 2002:a5d:64ef:0:b0:4b3:e605:1654 with SMTP id ffacd0b85a97d-4b3e60517c0mr20282273f8f.52.1795670088028;
        Wed, 25 Nov 2026 21:14:48 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm39548128f8f.33.2026.11.25.21.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:14:46 -0800 (PST)
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
Subject: [PATCH v3 05/10] sched: cpufreq: Remove magic 1.25 headroom from sugov_apply_dvfs_headroom()
Date: Thu, 26 Nov 2026 05:14:24 +0000
Message-ID: <20261126051429.14091-6-qyousef@layalina.io>
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

Replace 1.25 headroom in sugov_apply_dvfs_headroom() with better dynamic
logic.

Instead of the magical 1.25 headroom, use the new approximate_util_avg()
to provide headroom based on the dvfs_update_delay, which is the period
at which the cpufreq governor will send DVFS updates to the hardware, or
TICK_USEC which is the max delay for util signal to change and promote
a cpufreq update; whichever is higher.

Add a new percpu dvfs_update_delay that can be cheaply accessed whenever
sugov_apply_dvfs_headroom() is called. We expect cpufreq governors that
rely on util to drive its DVFS logic/algorithm to populate these percpu
variables. schedutil is the only such governor at the moment.

The behavior of schedutil will change. Some systems will experience
faster dvfs rampup (because of higher TICK or rate_limit_us), others
will experience slower rampup.

The impact on performance should not be visible if not for the black
hole effect of utilization invariance. A problem that will be addressed
in later patches.

CONST_DVFS_HEADROOM sched_feat allows reverting back to the old behavior
for easy backward compatibility.

Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 kernel/sched/core.c              |  1 +
 kernel/sched/cpufreq_schedutil.c | 31 +++++++++++++++++++++++++------
 kernel/sched/features.h          |  6 ++++++
 kernel/sched/sched.h             |  9 +++++++++
 4 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5dd53cef22117..97d3cceba22c0 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -128,6 +128,7 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(sched_dl_server_start_tp);
 EXPORT_TRACEPOINT_SYMBOL_GPL(sched_dl_server_stop_tp);
 
 DEFINE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
+DEFINE_PER_CPU_READ_MOSTLY(u64, dvfs_update_delay);
 DEFINE_PER_CPU(struct rnd_state, sched_rnd_state);
 
 #ifdef CONFIG_SCHED_PROXY_EXEC
diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
index 4d781b394baa8..04d0182759609 100644
--- a/kernel/sched/cpufreq_schedutil.c
+++ b/kernel/sched/cpufreq_schedutil.c
@@ -239,13 +239,25 @@ static unsigned int get_next_freq(struct sugov_policy *sg_policy,
  * to run at adequate performance point.
  *
  * This function provides enough headroom to provide adequate performance
- * assuming the CPU continues to be busy.
+ * assuming the CPU continues to be busy. This headroom is based on the
+ * dvfs_update_delay of the cpufreq governor or TICK_USEC, whichever is higher.
  *
- * At the moment it is a constant multiplication with 1.25.
+ * Ideally we should pick max(dvfs_updae_delay, min(curr.se.slice, TICK_USEC)),
+ * but reading curr.se.slice requires holding the rq_lock which is hard/not
+ * feasible.
+ *
+ * XXX: Should we provide headroom when the util is decaying?
  */
-static inline unsigned long sugov_apply_dvfs_headroom(unsigned long util)
+static inline unsigned long sugov_apply_dvfs_headroom(unsigned long util, int cpu)
 {
-	return util + (util >> 2);
+	u64 delay;
+
+	if (sched_feat(CONST_DVFS_HEADROOM))
+		return util + (util >> 2);
+
+	delay = max(TICK_USEC, per_cpu(dvfs_update_delay, cpu));
+
+	return approximate_util_avg(util, delay);
 }
 
 unsigned long sugov_effective_cpu_perf(int cpu, unsigned long actual,
@@ -253,7 +265,7 @@ unsigned long sugov_effective_cpu_perf(int cpu, unsigned long actual,
 				 unsigned long max)
 {
 	/* Add dvfs headroom to actual utilization */
-	actual = sugov_apply_dvfs_headroom(actual);
+	actual = sugov_apply_dvfs_headroom(actual, cpu);
 	/* Actually we don't need to target the max performance */
 	if (actual < max)
 		max = actual;
@@ -642,15 +654,20 @@ rate_limit_us_store(struct gov_attr_set *attr_set, const char *buf, size_t count
 	struct sugov_tunables *tunables = to_sugov_tunables(attr_set);
 	struct sugov_policy *sg_policy;
 	unsigned int rate_limit_us;
+	int cpu;
 
 	if (kstrtouint(buf, 10, &rate_limit_us))
 		return -EINVAL;
 
 	tunables->rate_limit_us = rate_limit_us;
 
-	list_for_each_entry(sg_policy, &attr_set->policy_list, tunables_hook)
+	list_for_each_entry(sg_policy, &attr_set->policy_list, tunables_hook) {
 		sugov_update_rate_limit_us(sg_policy);
 
+		for_each_cpu(cpu, sg_policy->policy->cpus)
+			per_cpu(dvfs_update_delay, cpu) = rate_limit_us;
+	}
+
 	return count;
 }
 
@@ -913,6 +930,8 @@ static int sugov_start(struct cpufreq_policy *policy)
 		memset(sg_cpu, 0, sizeof(*sg_cpu));
 		sg_cpu->cpu = cpu;
 		sg_cpu->sg_policy = sg_policy;
+
+		per_cpu(dvfs_update_delay, cpu) = sg_policy->tunables->rate_limit_us;
 	}
 
 	/*
diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index 8f0dee8fc4755..500ece3e341fe 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -142,3 +142,9 @@ SCHED_FEAT(LATENCY_WARN, false)
  */
 SCHED_FEAT(NI_RANDOM, true)
 SCHED_FEAT(NI_RATE, true)
+
+/*
+ * For backward compatibility. Use the constant 1.25 dvfs headroom in
+ * schedutil instead of the dynamic one.
+ */
+SCHED_FEAT(CONST_DVFS_HEADROOM, false)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index f4e6e85d45a07..27c18701de35c 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3806,6 +3806,15 @@ static inline void update_fits_capacity_threshold(int cpu)
 	rq->fits_capacity_threshold = approximate_util_avg(0, limit);
 }
 
+/*
+ * Any governor that relies on util signal to drive DVFS, must populate these
+ * percpu dvfs_update_delay variables.
+ *
+ * It should describe the rate/delay at which the governor sends DVFS freq
+ * update to the hardware in us.
+ */
+DECLARE_PER_CPU_READ_MOSTLY(u64, dvfs_update_delay);
+
 /*
  * Verify the fitness of task @p to run on @cpu taking into account the
  * CPU original capacity and the runtime/deadline ratio of the task.
-- 
2.53.0

