Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795234517;
	b=RFSMhSplCG6Kyfm7VpWrjS4POeUUhYLebHxPqCqHlW2zNygy1Urpr6sPcVprtY6R5oNF
	 /zBNlHSfTtXRJCNbZ4P59Fk8Lw2ChX0Sx++HnL549RMuEiMh9MX9GER7JSF9pSLfCdR1I
	 ND4fJgMie/KsxxYnNz2P5065MivB3A4WLZMeoZa9E1+Zwz6/807RRHi0tzDTjp58lXdER
	 +bQtNmkVVKuMhCwD1hyWagE0PxLNzATxc6Ihu3ve/onNUHqwzGIQ4I2i0T7joapNxyaS7
	 G0DHAcfGvudF9z7ix8pHqexni93Lj5GdTBaGCqlYa7250TlRTObSEnVjB7SPs02OuNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795234517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hgHJBgvxGGFWiMpnIFalED87E2He5t3L7FJpRsCBKO8=;
	b=f0ekoZnxUJmxBYKQ10inAQmW75IB1OjFapP38sdwowhMKzprcNVgx0JsJoWAJPm1G0uU
	 LhB2IQ7DqUXZWqxRgpbLYg+XyqSHY0fMHI7pfs5Pb5iwWV/CHaj8rD/WJQoey6vvIlueJ
	 oisngtjDFbk1n9QCOzPiiCoafl1v4nhDwsRDtsd55EleRuts8uwwRkC00lIIUVDcUQUFU
	 49dvZKs8ydayl4Gccl3I9OkjcmhoiRkvQiHDKsu0gRZRF7bzM+fU//Q46vJ/ML+wI9rHJ
	 C1AaQKdWBwstcnIIpEGqsZSVvTIJt3+Jv8fMr1GOtklH+OjHcvBlk1mYl8RNl0X8Lig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=X6483a2w;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7F9606A335
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA7F9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=X6483a2w
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso13494055e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795234515; x=1795839315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgHJBgvxGGFWiMpnIFalED87E2He5t3L7FJpRsCBKO8=;
        b=X6483a2w4p26Y9N6Mysj2tfp9KyKJPEiML1zXikOU1R+yVgpWP1DySOpvT8jtiQeAz
         M+hf0qOOoLOi7tJl0Nkp5nsYSA2lYYxbqgWfrJutjKTy8Blfox2XR12aoeu+4e/DQuw4
         ZgIfAWl8Ah2JdDowDUoJjjjfpXH4YAkM8slPHAgasr02u/s3jTcWyAQ/kYwpvD7c/7fm
         AVO2oBEZtF2iv8SfeOWIi7GvTEuHLYAu2gTLnLHd9Exzz4cruYa9dLaoZZqkjODQudgY
         eUNrAI3QlVfo2+uhC6O090w9pFFaPpRFnOkvvafqG/fr2A0X4eJv9vTfm4ElOU+364Ca
         VbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795234515; x=1795839315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hgHJBgvxGGFWiMpnIFalED87E2He5t3L7FJpRsCBKO8=;
        b=zQnIiuFKfVNZYPEx34+VHW1LKCT8n9nvqiBaGZHRJSAI/UKrWgxd6M8nISZLRsNmT7
         zmf1vdVzJcZyP2KSQQ6Hh8pmEegqvC9hEd8Zf4J4wr83a5GX0clLgU+b5Iwfa042dhxV
         cVTtgtj6FjWqFtb7Izd32rBv+pb8GDk4lHIYgaX8+75mgVLhc2XYR02NFoP3sSZ2DmKE
         1aTAWKyqCkxWfsBhPq9MOxINzBuJRB7vKz0veR6Ss6jzY/5q5uuP60RmvbkAu1f2EeVL
         XlN1l9bcc5Wjm2tp1HNogKbBWsYep4iIbmfmbkGfk5Hc5nmGFDm0pjWbZHPQTWu1bQUM
         K9ow==
X-Forwarded-Encrypted: i=1; AL+hErGITrgNqoq0VHTE+ADA7BXKRKvcS3fntO8DBV+NhS9k8xEI8nzQmeOerWNfUtXtPmt+/I8DsJAaxKLrs/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8eOTocMQ0nJicvoQ7USzaEnma03GT/fnkahg8y9zHi4TEouWR
	LAYK1x7qky+U6pw9t/6nbfZSN6G6ezgxiuX0jtUB+dNDhS/0m+sw629YIGBjGV2yldQ=
X-Gm-Gg: AZFdTZeGqniOZm9j5tG8FnLgb7yFjIvmMrAiQ+bdRlEPme8NXcBpz2rU6PFe//VRJnN
	0Av0N50MJ0AzU+vpTIXVpLjM8SlOY3DjybIy9wElp4BPAYrFXS7J+Uvez09D4gkCYRzmm5enzwm
	yRqV0BEv6+MbmnN+PrmGGoObBTJXBumxkn9WFSMyFEbKYTOheidO+LupEi2r7AzxLLP6DSB+Ssa
	k96mycEvyqDObivveHUXJLsQYj6eQXoccHrJTCSChIJi5OfMGjtKP4KL4q8ngXMeHNqLKLCJduz
	0YAMk4PMYsOyhSFAxHiUVBA6qxWAuNdamnpKaLBIW01CI01fj0Hv/jui6YmuvuaUXXOvBc2VOw2
	btvkuoO3ZrsKSFTaolGALwHmdb9xlnHtU/B2WcS/FO89x+mp0UcLCtyWj2OAi7+O7CLAub2zYM+
	PO9LJZeKQ2stOvvIUVjSni2sxr/w6d1/iN9pZlcwlika09rOJmdoZLL05jEpr1CGvsjbpy4oWii
	iH6tB5k7hSmttX8N4/fZeQUGTjtudTofnT7AqWwYNLAFbHe/6ccrc62FaF/u5P9B+9BoCJ/c3v2
	2p+grxiFHpvuUWY3uuRu1iU/xwQyaJ/jFSuOWjKDu8cSSO4aIRV5JorIpAk1WilHftq4xMLApoD
	Gdg==
X-Received: by 2002:a05:600c:530e:b0:4ba:eb:eb9b with SMTP id 5b1f17b1804b1-4bb8880aba2mr117488895e9.8.1795234515232;
        Fri, 20 Nov 2026 20:15:15 -0800 (PST)
Received: from aerith (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm90032175e9.4.2026.11.20.20.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 20:15:14 -0800 (PST)
From: Qais Yousef <qyousef@layalina.io>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Christian Loehle <christian.loehle@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>,
	linux-kernel@vger.kernel.org,
	Kayra Cizmeci <kayracizmeci@gmail.com>,
	Qais Yousef <qyousef@layalina.io>,
	Wei Wang <wvw@google.com>
Subject: [PATCH v6 1/3] sched/uclamp: Fix race condition leading to imbalanced uclamp_rq
Date: Sat, 21 Nov 2026 04:15:05 +0000
Message-ID: <20261121041507.39582-2-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121041507.39582-1-qyousef@layalina.io>
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
Content-Transfer-Encoding: 8bit

Static keys are not guaranteed to be enabled atomically across CPUs.  Or
across callsites on the same CPUs. Which means when sched_uclamp_used is
enabled, some CPUs/callsites will return true for uclamp_is_used() while
others won't, leading to asymmetric uclamp_rq_{inc, dec}_id. If we
decrement without increment this is safe as documented in the code. But
an increment without a decrement is a problem and will leave the
uclamp_rq in a corrupt state.

The reported case seems to happen due to callsites on the same CPU not
seeing the flipped state.

Plugging the race is hard as discussed in [1]. Take it for granted and
do correction actions on going to idle to guarantee this state is
transient for a short period after uclamp_sched_used is enabled.

[1] https://lore.kernel.org/lkml/CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com/

Reported-by: Wei Wang <wvw@google.com>
Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 kernel/sched/core.c  |  2 +-
 kernel/sched/idle.c  | 19 +++++++++++++++++++
 kernel/sched/sched.h |  3 +++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index d7c3b43158dea..c6780358a7975 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2111,7 +2111,7 @@ static void uclamp_post_fork(struct task_struct *p)
 	uclamp_update_util_min_rt_default(p);
 }
 
-static void __init init_uclamp_rq(struct rq *rq)
+void init_uclamp_rq(struct rq *rq)
 {
 	enum uclamp_id clamp_id;
 	struct uclamp_rq *uc_rq = rq->uclamp;
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index 76f3c84ca6846..84301fc49e699 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -502,6 +502,25 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
 	 * lost_idle_time of clock_pelt
 	 */
 	update_idle_rq_clock_pelt(rq);
+
+	/*
+	 * Due to a race condition when enabling sched_uclamp_used static key,
+	 * we can end up with imbalance where uclamp_rq_inc_id() has happened
+	 * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't seen
+	 * the static key flipped. The race condition is unlikely, but ensure
+	 * the uclamp_rq() state is set properly on each entry to idle.
+	 *
+	 * The reset will cause the uclamp_max from uclamp_idle_value() to be
+	 * lost. Since we are imbalanced, hard to know what is right. So just
+	 * cleanup. This should be a transient error state once we recover
+	 * everything should work as expected.
+	 *
+	 * We need to be careful of some paths that can force idle with tasks
+	 * are still queued.
+	 */
+	if (uclamp_is_used() &&
+	    !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))
+		init_uclamp_rq(rq);
 }
 
 struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 7d2ec527b8a25..d87bdbd2121df 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3704,6 +3704,7 @@ static inline unsigned long cpu_util_rt(struct rq *rq)
 #ifdef CONFIG_UCLAMP_TASK
 
 unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
+void init_uclamp_rq(struct rq *rq);
 
 /*
  * When uclamp is compiled in, the aggregation at rq level is 'turned off'
@@ -3802,6 +3803,8 @@ uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
 	return SCHED_CAPACITY_SCALE;
 }
 
+static inline void init_uclamp_rq(struct rq *rq) {}
+
 static inline bool uclamp_rq_is_capped(struct rq *rq) { return false; }
 
 static inline bool uclamp_is_used(void)
-- 
2.53.0

