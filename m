Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656525;
	b=VkmmS07b4zMYkl1ohQqq+h84c/R1SHX1zMRovF0nSH24RrY0h1H8+e3LUil/W6qzd4Cb
	 Jg7py4recmUTZnvuCO5v6vn8lUNJSp4EUAHoW9/jX4s1zGfUubJ/crnKNvYIxz3Ur+v8h
	 xWalgJf7dgyLRX+FS7paxgrxmVpqhvdVRHNY5L5xriaZDsLkE9hnAob4RY6JONxbbOneh
	 dhbxcv7ySKpxeFvhJzakpD/4PIn8vjiurDURx5WO3w2FLQMS7Nq1YPKP1ev1RXCpDV5I9
	 hd9cFcEPzwgHcMAejaLIJJ51+91Cgt20vjP3sckSMipCrPzG9/CQlDE2s3Y5kY1V+tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d+faODTeetJ5zgYytlsVTjoyrqNS8XmyX+KccLiASwM=;
	b=F7zYMq5rSfBoC1iRD0D0+ph7718M8Lx89GBqDlS21RoueKhf42lk/QBKCH1sIe81bDJX
	 QQ4rpXk9/JqxBZQmwAEmrMaLwXA9u8iRnnThJQjIe39UJRsKa1pqxxpkyPCiLHNUuAnB/
	 S3hDz1zQpIz0r2vS8TfFpSJ/5/nDgSzxf36CwU91Mq+aqm/G7CrVyRNC4JQSEIKlpcY7s
	 hfMoRSVXyPycsImnUStP56NHJ8PI1fIMtWJjgQVo3gAgs7TvDzzRjC1jPQxWAyud6c07z
	 KLngTy3X8SJxPLihVXqwROQg+/LT1quxz4c5TTZMBSOJ0lAsjeaYKH6jAt1ZvdMRHkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GcNxpOlM;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A80606A330
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98A80606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GcNxpOlM
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso5646455f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795656523; x=1796261323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+faODTeetJ5zgYytlsVTjoyrqNS8XmyX+KccLiASwM=;
        b=GcNxpOlMW0/TTwXfGrseD04PrD28f/VkTaOQ+5qlcfVHYarjLF9yb/LFkKFhwOkdWW
         BJZN5kTsTdRMhXrcx0aHnDxe8wV9kmob0gEDFCr+JK3yZr/l48KWBSdu9oFNNFusjtol
         byYxA3ItpL5Zfr8V/hS2YhLBthb+Ra2PSPwUdgnimJ168em5Svb0+h6oIDHvl6AxdthP
         /z2qwCOXCrh+dVeu7Qg0dD4u6QO9dQPegJyDicrsI8HRq/WwZGQaiRKPruJdzImyAZfd
         dEAA6UtGNQdzban+f6aA4nGBKdTY8uX7d+9f/ifWDQkD7duuEHwXgCzyXwUFy0uo5gC8
         qlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795656523; x=1796261323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d+faODTeetJ5zgYytlsVTjoyrqNS8XmyX+KccLiASwM=;
        b=xdTZ9onlNpb/hb7lqIsMGt/EyQ4qWvx7yrejlVhRqemwh9HsXOCaeLRcIsJQy8CGEz
         Cfyyk1VSycsrq2/Ztx/T881/BUXRLjL6T9EcuBmlhkjrn1WE0J4oiCdhpM7kiB3wrRcR
         1JnhN6p2pLinJFfRDiBHvuBiZobpo8S/CSImUJhkbl3iWWdTYQu6qmzoW+enrK8s3Lbq
         KckWGGrbjbQVAaLwTLNyWhcsHRGA2AQqtcBbOjGb4B6dQYpQWwb0NyKLn/e0XjUrDzyC
         8z9CgF+5DLaYPp85r7iXcemkckphw8yyfN9eX0JoUZuheyagCVl14S7bptTwY/+oNLG8
         fB2g==
X-Forwarded-Encrypted: i=1; AL+hErHTB0dY3l83JW7/T/v2fvvwj1TWnKKiYFZq9cB66i5n3vx4ZccCFia2sK6S5/sEokYPW9VdScqoKDEzpTE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZLH1Ec+llN0cPgHl1JPb+Y0oVR9WWIt+WsqAgUOOLp/QX/kru
	1XEeGcwqxlJlmuWk4quEpMYD2Ef79nOxEhoA4t+spqBDhp6SI7/YZZ5UGCMHVVrT9KM=
X-Gm-Gg: AZFdTZd0IZvZP6J2Ngovsqk7z70GI2wMC9sjnhKntvvXJ6apyZyEYUYpZKoychAaGFN
	IPhs9cOBVrx/F2F754ObJ6x/NGBFMH8+EeIkWiyTwIl1WBQSCm2iFKcsW6qzni4c7GXieNoUvpb
	GS5OkVnQsR1Or7Iu7Jcb+63a0SCOjtNuyfSG7tj0b7TA49xhLKLkxlzY9QaeVTM/fo/aNyZ53IQ
	AYs/pmOMKffI7drUTOzvxFbDYxlz2z9b4AkVUB/zQSJ8J+189jSAa6zZwNI2BcW429Oo+1gnSNf
	LUiFY5oFNe28ML6tNI9maecB3lwoSYWbRG/GwgUUfE/isQkiCYUP3b3bBF4eBgtshFqO9JolixH
	DHPp+oqlu0t4g/bf8Gh0xgXgaRtk9/Lqz8rLuRMe2B+u2h81LRQkGpUt3B0iC0rUWJ+p2oymPOT
	K8lN8d4dcYUfRxHMKEwFv0Wl2WlTh0qWQnDtTgTItP77zMY2Iqg4lY55efYbQYNh0ylZgDwJWFT
	gp7Zwuas9xxMCYRN4XwB+AdXrMEAh6PnM2Zm8WQC00QtYdyIj5W+M7X70Ffkj4wrJxOgG0nkL/m
	J1ygj112sOOOYCOvvonuGE6Fu5nIUwEW1+4KtTJpu3iRePu0LTFI8ldVAVGLuCDKrXx50r7MwW+
	gU8v5ZGqdAfH+y97YhXEekrUSBzfxEA==
X-Received: by 2002:a05:6000:2601:b0:491:68e2:bf2f with SMTP id ffacd0b85a97d-4abb9642f3fmr43709049f8f.52.1795656522934;
        Wed, 25 Nov 2026 17:28:42 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm30520335f8f.35.2026.11.25.17.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:28:41 -0800 (PST)
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
Subject: [PATCH v7 1/3] sched/uclamp: Fix race condition leading to imbalanced uclamp_rq
Date: Thu, 26 Nov 2026 01:28:34 +0000
Message-ID: <20261126012836.15205-2-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126012836.15205-1-qyousef@layalina.io>
References: <20261126012836.15205-1-qyousef@layalina.io>
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

Update init_uclamp_rq() so that we do uclamp_rq_set() to ensure
WRITE_ONCE() is used to update the value field and keep KCSAN happy.

Plugging the race is hard as discussed in [1]. Take it for granted and
do correction actions on going to idle to guarantee this state is
transient for a short period after uclamp_sched_used is enabled.

[1] https://lore.kernel.org/lkml/CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com/

Reported-by: Wei Wang <wvw@google.com>
Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 kernel/sched/core.c  |  7 +++----
 kernel/sched/idle.c  | 19 +++++++++++++++++++
 kernel/sched/sched.h |  3 +++
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index ea89471d4743c..23009278cc9a4 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2139,15 +2139,14 @@ static void uclamp_post_fork(struct task_struct *p)
 	uclamp_update_util_min_rt_default(p);
 }
 
-static void __init init_uclamp_rq(struct rq *rq)
+void init_uclamp_rq(struct rq *rq)
 {
 	enum uclamp_id clamp_id;
 	struct uclamp_rq *uc_rq = rq->uclamp;
 
 	for_each_clamp_id(clamp_id) {
-		uc_rq[clamp_id] = (struct uclamp_rq) {
-			.value = uclamp_none(clamp_id)
-		};
+		 memset(uc_rq[clamp_id].bucket, 0, sizeof(uc_rq[clamp_id].bucket));
+		uclamp_rq_set(rq, clamp_id, uclamp_none(clamp_id));
 	}
 
 	rq->uclamp_flags = UCLAMP_FLAG_IDLE;
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index 451b4846219d5..c3882e3fbdf78 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -506,6 +506,25 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
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
index 32f76551a0c5e..3cbaea9e29406 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3815,6 +3815,7 @@ static inline unsigned long cpu_util_rt(struct rq *rq)
 #ifdef CONFIG_UCLAMP_TASK
 
 unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
+void init_uclamp_rq(struct rq *rq);
 
 /*
  * When uclamp is compiled in, the aggregation at rq level is 'turned off'
@@ -3913,6 +3914,8 @@ uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
 	return SCHED_CAPACITY_SCALE;
 }
 
+static inline void init_uclamp_rq(struct rq *rq) {}
+
 static inline bool uclamp_rq_is_capped(struct rq *rq) { return false; }
 
 static inline bool uclamp_is_used(void)
-- 
2.53.0

