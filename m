Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670094;
	b=ZXUcpQG1QL51DcQL5yZcj2QoEvboBGAHMFsv/zTUDRQiDJCkcbmcZLLF2tUHhH87I1ml
	 c6A4uMTXYtcm6rhmEBtwG1ADl7e0ku/uhXI2yUqLI12SI5gzI02DKQPx/FKrQp5Wrr1mA
	 qkUdf2Sr11RIToHTA57+A+tFrv01Q8aZY1IeMkepRSMTkWmOuW87lDRGF0LLkT52hrUCr
	 4yFT01zuAmb8ChrJes5gKPQSx9z3sJhPvlt1PXWNHaMA9yKCsFKldiblGvE8BGRATc8bw
	 OOvZSk5CSPDteHaBCGgWilqIU0Sf7EE9MCbJ8mObVkrkBwUzKO4SAoSb6//9C+o75PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lgQPl9/Jm9YO4ucbmFJ/8RH4xwQ8bNcwiPJtv6zxhJk=;
	b=widd78Tozaiyc5fM4iNOwOlutmFkiEJr/vKxHWr25cJfeismCKYEo5P/DE1jwsutaYuN
	 f14Wpj2LdvUqqeDxojbAxIA7DulsxJugHQNcMiTwLI0GcVpM02VC1Ywc26c2w1dTYDQxI
	 /k/8fz9UbTB+HyRdVlGwvILne6G78hLrw6DpMPG2N0/KqvEzZ+a5Ij1g7nSPv3QNrP9/z
	 f3HFyBiz5tDDIz035t8pyNzu5ypjstyaVgPxWBQPDz5bWCdFeADW8wiNw6edY0oODWbQ2
	 BiSdh3RltxdtZ/O/j9S3QPxjwI7RNmHIwB+JwDsMHxMrApthsUloeyJeeHBRlAW4XmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=olUBQOGy;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40962606A335
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40962606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=olUBQOGy
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so5824328f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795670092; x=1796274892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lgQPl9/Jm9YO4ucbmFJ/8RH4xwQ8bNcwiPJtv6zxhJk=;
        b=olUBQOGy1CfhzS5pEXWT47TR4HQbYO+RsHU3DjLojhcvHLhQb6QoNAJMHZvSCxN6de
         88bCreTXvMYZM1/qa/K8zps9MyxUgWz43LlAgaZQ7KBu5AVJFhbPAl1CRszfQlxyZ5xy
         cpQSsKZtKssr7nplzX4E4GkvMvM1euEJYmoanIoJKp+JIsfDX3/iHnaHIVB0jB18/cdl
         LxANZkj+Le+JxAXw945EjCqS6sze5LhrDNWRmYSv/QvLzcQKxvc6S8+bl5Ngf516yiCH
         8EdOKJ9n/ugohOPZTfkESr/Ga5TPD7zxk5wg0mTxMj6jp7ewaw2pTY0lM59K+uHHjlZK
         cpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670092; x=1796274892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lgQPl9/Jm9YO4ucbmFJ/8RH4xwQ8bNcwiPJtv6zxhJk=;
        b=nRWp0+xDcjWcYUFYhDbssaYLhfGnGXKDh+U5vsMoO4JzyR7ZTOWkAnXj+juBqwptxv
         WOZKYleFxpKviUaJrMybEJwKeRcracULPGwpRz24qqms2gaVmlCo45dzHCcF8E+S1aaF
         Hba8iHXAtdR8pvuKoqy3mFGcxH+z8TJeI8BMQRCkC/94iBgxBjnHafwzGEOphsT4brMB
         H6k2QMMXP5Nmb9+dlyApiiXXznXhVYZzRkXqITKW6BUFdSEHLgoelYRRrAvngfkNyKnD
         8+GO316EAQiW5ZD3/DoCSiTiq8+pgqmF+d649ObRB+r+hG53IA3cQ6jjqYy9jyrdjb5q
         LTzA==
X-Forwarded-Encrypted: i=1; AL+hErFwWQEIcuvcWMghzm7x1JOEjfS8vhlcTO8KwVPuIJgoffIAHLNjCrJC82wnWV4ICGPLLXRMOgX+7kvQCKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+L9BTqM/6dghEHztHkAtY7UmA6fZJrJyddb96QosOvDeEQzrwq
	sOjA6nrB1g1jYVx66pzddGe2IOLJF/MVcHxQOEFuAwlIsZmNGW8U2NRO3kzVP3LktXA=
X-Gm-Gg: AZFdTZck07+prNxzDXKrG9hkF127z0rJXWMlIscAlnLdUZXNQFHQylj06rCYZ9g+AK2
	F0NVGu7pgclzcOMZ619Uwzsp9RfFTJj50Gw3noNpao5IX2YjaAPPKrP/keuwIYZ1Ah6M0HSyJ4M
	eHclRCygVsHh5beodcWN+8ds1LtJthfdT6A6H/Oxavrekn+iaya7T8uE2tB2NsamKWaah9s35yw
	IYuxLfOG76UkOhIkd5hp/XZ2O3+zKMhaFb+1gzkoS5Ui39bVIiOTDNvPhfUNc06NFIyEB33Ue6u
	CgXpiDN7XSWGSkm/+Pt5FUHNMtFl47DgWZBTy0FJ+4+7tVgdCF9EuPE8O/Lhs/9OYbfquzDC1J+
	SffEpT3YBI/2phAgEusDHbUX8I7tyjOhQjD4PCTAgRjzF1+vqzrEi5/kAe7pZ2NWDrk/qOQpAXQ
	t47wE1ah1KBqcDHMcaeA0/qceq2n0N+yrMBSeQzBQ+kcMZY5s4lCCkNPOnL4dwq/3YLimfxEtWw
	9g4dkeJ8nqFCt1gnfnbh6pZoHe75M4ovau2Ue5jAeAkAHUY2BnyXLR82P5isso3Wbp6rZz1/G88
	rUHxJ4W7Rx6xP1jUpHVXXm0N6BtF815J2TgIijk+dMYSeMU5aS8O8I0LjSj+pMT/VwyetAORCIe
	C+jTzy+Fp
X-Received: by 2002:a5d:64ef:0:b0:4a7:5eea:fd1b with SMTP id ffacd0b85a97d-4abb954dafcmr38373523f8f.49.1795670092366;
        Wed, 25 Nov 2026 21:14:52 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm39548128f8f.33.2026.11.25.21.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:14:51 -0800 (PST)
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
Subject: [PATCH v3 07/10] sched/fair: util_est: Take into account periodic tasks
Date: Thu, 26 Nov 2026 05:14:26 +0000
Message-ID: <20261126051429.14091-8-qyousef@layalina.io>
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

The new faster rampup is great for performance. But terrible for power.
We want the faster rampup to be only applied for tasks that are
transitioning from one periodic/steady state to another periodic/steady
state. But if they are stably periodic, then the faster rampup doesn't
make sense as util_avg describes their computational demand accurately
and we can rely on that to make accurate decision. And preserve the
power savings from being exact with the resources we give to this task
(ie: smaller DVFS headroom).

We detect periodic tasks based on util_avg across util_est_update()
calls. If it is rising, then the task is going through a transition.

We rely on util_avg being stable for periodic tasks with very little
variations around one stable point.

Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 include/linux/sched.h |  2 ++
 kernel/sched/core.c   |  2 ++
 kernel/sched/fair.c   | 37 ++++++++++++++++++++++++++-----------
 3 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index d54117ab4c882..ea3af512006ad 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -928,6 +928,8 @@ struct task_struct {
 	struct uclamp_se		uclamp[UCLAMP_CNT];
 #endif
 
+	unsigned long			util_avg_dequeued;
+
 	struct sched_statistics         stats;
 
 #ifdef CONFIG_PREEMPT_NOTIFIERS
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index b8c0cf9153768..13a66045c5be5 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4689,6 +4689,8 @@ static void __sched_fork(u64 clone_flags, struct task_struct *p)
 #endif
 #endif
 
+	p->util_avg_dequeued		= 0;
+
 #ifdef CONFIG_SCHEDSTATS
 	/* Even if schedstat is disabled, there should not be garbage */
 	memset(&p->stats, 0, sizeof(p->stats));
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index a8dbd81e71590..7129347746436 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5980,6 +5980,9 @@ static void detach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
 
 #define UTIL_EST_MARGIN (SCHED_CAPACITY_SCALE / 100)
 
+static inline unsigned long task_util(struct task_struct *p);
+static inline unsigned long task_util_dequeued(struct task_struct *p);
+
 static inline void util_est_update(struct sched_entity *se, bool running)
 {
 	unsigned int ewma, dequeued, last_ewma_diff;
@@ -5997,18 +6000,22 @@ static inline void util_est_update(struct sched_entity *se, bool running)
 	 * quickly to settle down to our new util_avg.
 	 */
 	if (running) {
-		u64 delta = p->se.delta_exec;
-		unsigned int prev_ewma = ewma & ~UTIL_AVG_UNCHANGED;
+		if (task_util(p) > task_util_dequeued(p) &&
+		    task_util(p) - task_util_dequeued(p) > UTIL_EST_MARGIN) {
+			u64 delta = p->se.delta_exec;
+			unsigned int prev_ewma = ewma & ~UTIL_AVG_UNCHANGED;
 
-		do_div(delta, 1000);
-		ewma = approximate_util_avg(prev_ewma, delta);
-		/*
-		 * Keep accumulating delta_exec if it is too small to cause
-		 * a change.
-		 */
-		if (ewma != prev_ewma)
-			p->se.delta_exec = 0;
-		goto done_running;
+			do_div(delta, 1000);
+			ewma = approximate_util_avg(prev_ewma, delta);
+			/*
+			 * Keep accumulating delta_exec if it is too small to cause
+			 * a change.
+			 */
+			if (ewma != prev_ewma)
+				p->se.delta_exec = 0;
+			goto done_running;
+		}
+		return;
 	} else {
 		p->se.delta_exec = 0;
 	}
@@ -6023,6 +6030,9 @@ static inline void util_est_update(struct sched_entity *se, bool running)
 	/* Get utilization at dequeue */
 	dequeued = READ_ONCE(se->avg.util_avg);
 
+	if (!task_on_rq_migrating(p))
+		p->util_avg_dequeued = dequeued;
+
 	/*
 	 * Reset EWMA on utilization increases, the moving average is used only
 	 * to smooth utilization decreases.
@@ -6185,6 +6195,11 @@ static inline unsigned long task_util(struct task_struct *p)
 	return READ_ONCE(p->se.avg.util_avg);
 }
 
+static inline unsigned long task_util_dequeued(struct task_struct *p)
+{
+	return READ_ONCE(p->util_avg_dequeued);
+}
+
 static inline unsigned long _task_util_est(struct task_struct *p)
 {
 	return READ_ONCE(p->se.avg.util_est) & ~UTIL_AVG_UNCHANGED;
-- 
2.53.0

