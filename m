Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795234516;
	b=zJy9T1ALfwEQbqccKUmOrjElbPJ5CoYbMk/ZqhcYw7qUwW+7dOi1RCklR8F5WqJ6/yXV
	 gSqx2ySeWydZo9ZDAnkm5ptdojwu0tmuXNPA3lL8+1EjzmeDgJgBLNslf5EbrrcNDmgMD
	 7k1GvOCwMPgbV/3l1qy6C3+IR8Z5zVnWHtTRIA0QOA3UXiRoF1c/4W6QffsHeOs9B0CNG
	 IGiXQfaZroPVvZocDArEQeb+tHN7QIRKMM3bYSbqy4JK11K64j7952aRMHg3muv/H20Xj
	 8vvrlcSbht8qPQtmxRWKPN7oKMdBaIIl38KKhnSBziX35YF7yOwm9MgfG0/5TkyQOwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795234516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5TFNXkztMqdNL1xqF9e3pJY52o5WIsjk/FwNP+Xy6j8=;
	b=mzVbgPtdUDKYsuIEwpnCGDyvS7nM1OpDnkSTvxcmPFjIwEm3CG2yEr/UIOLvxOyx/tvF
	 IYk268RQLoMAWXc3Dp7C/gtQo3rEkZk7ICDmRpIre2Cmae32ssWngb/tRf+XjtGz0/3V7
	 g4K2Ug4MNlG4IUhTX5bMUl1kn0KpIW9hoj+SM4Dg+XSSstW8O4DKyJH9pjrotmAJ/GEgp
	 lMiymui/tsCxwu3uyRF1zWrU6GtaFwW0n/+dfDwJxoqnu37nVBbUK1RM0wVmZtZ29Ml07
	 xKjOWrpKCBPROMiFS/d7ARtMHcRmjOSLOqO+ns+1w6RFP0sH+0Hm1LCuBnZT/hU9EgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y8MW1e8i;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD56606A691
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DD56606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y8MW1e8i
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so14790815e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795234513; x=1795839313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5TFNXkztMqdNL1xqF9e3pJY52o5WIsjk/FwNP+Xy6j8=;
        b=Y8MW1e8iuwCSfNs1oTKU34oU+BBSksqufTAz4dGSgVOjyjTgsCLUvMyJdyqCxxyAc6
         sI+ZOhBj8UTfMDNbA1+J1pziSV+Kl7quV2U7PGFlFKhLjQpzIJSpMigvDqckGlTVxMQ/
         iIFLXAlYuMjc8LxnATZj3Wa/BYOyxzcLm2hlA8X0SIcGVYp/GAhfvjfJMco9yaFmY0hJ
         gMtaeNbFQC6hdvgUwOjsgX6RvHRPerWsqtQngOk1CZD31mJxG9BLRz4ROtqN6L2sWcBS
         jbyaJD+qnSTiiuLg09lpbnrsZiYbMTpzb0CoVguOPT5J+FNSABCBNwaQUM0z4ItX+9cb
         gXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795234513; x=1795839313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TFNXkztMqdNL1xqF9e3pJY52o5WIsjk/FwNP+Xy6j8=;
        b=Fl2o0ZiN8dtp50caCedEYHvcDKi0qlNfNlR+jAWJgZn2W7rTuLxtRPJiNMGX/qjEK+
         0tTSv1/Bq1WTZKMq++RBfKsY+sjTKb9BlSsEPQbQfRhtmGtsRiBft2W4V/ARMem3jPgj
         A/cgdCynpJpc1/bIAIiOF2hAMwsqxWtE1mfSvObHgNoAjTPPxpK3EqQe+ojB7qD4npd9
         kuNIoMRSw7MEbgMuw17N9ABnVdO3hYakHUl5dUCOaDVlnFAGkaFvgqQNpCavpaZzC4EK
         ZO1MXoA+LH/6J6f6SeKYboAyKgjiPhFT7z4FlMzdZzwI4bQogNkXcd0tCnMYnedX2tLH
         Meyg==
X-Forwarded-Encrypted: i=1; AL+hErE+JwuR6hBZaHeeVj2BJbhZ/Ok+Guyfjf3yze9zgvl1z6e7+gPCf8ZTRaWJYYzwJlF6menAZibDGJqcTSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tg4BUB7ImpFiuBNQ245oFzwoGZmbGj3rLNxXiSXKGBzlx39Bu
	Xr1QM5Ji9Diugty1ZF80SOE1MdNxQIC+QS1+9dT8xeqPVpvMivNQzVm+Vo8DfSDIfNU=
X-Gm-Gg: AZFdTZfvZOVTsg5k9ZBEnOXzn6h8YoHGwtKVPeoGtey1VXUVSR/RzPEoC64qHMizVb/
	tgoVYZMLTKALEVhT4+GS4LYlrp4uKsN13+Hf0HOrtyYIM7/5fb7AW83abJB/fmOrm9ysS+4+ijc
	bQztmyxsQbXufyn3OYc5AuAWeUBbgLMAwA0L5Jc00KtvAcrrNNUcTOe7hn3LBym13uPV+N8fs14
	ve3EIB8KR6TPXjbG6NdWd9uUHrxqabihaDEdtmRMvuaD2lQrEcXXK9YQE9qxv2gezkPQVfcXvp8
	eKa1nhHyJNMrXfLbv2mUb6EAb/elNmrLP3k6jKdiZvU/Yb+lqXqiRGWCJPQ8iAULAJl4T4YQLG8
	mAs13z2rveh9Up5sd+de45+ab5sigzVl0cZQykxYOHakIROjukSmEsBN2k1IPiyuLki++kC+vwG
	q1SKQiQSrDa3h13k50YA/7/Z5742K6EgH6zEgdM7yaNKjGq10/KM+v2MW9/BO97qtMHMxWMOPv0
	RXcZRavfQdUiQjK9mX62MsmnjKg1tLCbeKiYbqZZT+tOJKV4p5SURsYP4q7ps4L4vIaNtCH0lcC
	yw4Bkg46u/XQxEA8C/emRWtqLrKOMCltOwwmcb/a5maVFyXKWliy612Blr3V9B+M83y1IrJdlPZ
	10w==
X-Received: by 2002:a05:600c:1c1f:b0:4bb:6847:7943 with SMTP id 5b1f17b1804b1-4bb88814510mr134126455e9.26.1795234512460;
        Fri, 20 Nov 2026 20:15:12 -0800 (PST)
Received: from aerith (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm90032175e9.4.2026.11.20.20.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 20:15:11 -0800 (PST)
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
	Qais Yousef <qyousef@layalina.io>
Subject: [PATCH v6 0/3] Fix uclamp race against non atomic static key enable
Date: Sat, 21 Nov 2026 04:15:04 +0000
Message-ID: <20261121041507.39582-1-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
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

Latest version drops the partial revert (patch 3 in v5) as RT group
throttling is going to be marked as broken and anyway a proper fix will
require non trivial rewrite how dequeue happens for throttled tasks or
full revert of subtracting nr_running added 10 years ago. Both of which
is not appealing and with the proposal to mark this feature as broken,
better leave it and hopefully just delete the problem area.

So in summary RT throttling is not fixed and being ignored. Fair
throttling is fixed by pairing uclamp_rq_inc/dec with
add/sub_nr_running. For RT, we do that in inc/dec_tasks() which are
called when tasks are actually enqueued/dequeued - as stated will fail
in RT throttling case. Given the minor severity of the problem and
effort required to restructure part of RT group throttling that is being
marked broken as we speak, I think this should do.

Changes since v5:
	- Drop patch 3 to partial revert subtracting rq->nr_running for
	  RT throttling.
	- Drop fixes tag from patch 1 as the series now is partially
	  fixed and not suitable for LTS.

Changes since v4:
	- Fix problems in fair/RT throttling logic that were exposed by
	  the original fix.

Changes since v3:
	- Fix Sashiko report about force_idle paths where
	  rq->nr_running is not 0 highlighted by Christian
	- Update patch 1 commit message to reflect jump_label call
	  sites on the same CPU might not be updated atomically too

Changes since v2:
	- Use uclamp_rq_is_idle() instead of scanning buckets to detect
	  imbalance
	- Do some cleanup on accessing the flag as an additional patch

Changes since v1:
	- Fix kernel test robot report due to missing static inline in dummy
	  definition of init_uclamp_rq()

Tested with the patch below to force imbalance via sched_feat. I could see the
warning appearing and frequencies spiking during imbalance. Correct behavior is
restored when sched_feat is disabled where the idle entry reset fixes things
up.

I had a mix of uclamp_max mainly used in the system via schedqosd.

	diff --git a/kernel/sched/core.c b/kernel/sched/core.c
	index a2035d66270b9..14f9f1e419e02 100644
	--- a/kernel/sched/core.c
	+++ b/kernel/sched/core.c
	@@ -1889,6 +1889,11 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
		for_each_clamp_id(clamp_id)
			uclamp_rq_inc_id(rq, p, clamp_id);

	+       if (sched_feat(UCLAMP_IMBALANCED)) {
	+               for_each_clamp_id(clamp_id)
	+                       uclamp_rq_inc_id(rq, p, clamp_id);
	+       }
	+
		/* Reset clamp idle holding when there is one RUNNABLE task */
		if (uclamp_rq_is_idle(rq))
			uclamp_rq_clear_idle(rq);
	diff --git a/kernel/sched/features.h b/kernel/sched/features.h
	index 8f0dee8fc4755..b59e532500fd9 100644
	--- a/kernel/sched/features.h
	+++ b/kernel/sched/features.h
	@@ -142,3 +142,5 @@ SCHED_FEAT(LATENCY_WARN, false)
	  */
	 SCHED_FEAT(NI_RANDOM, true)
	 SCHED_FEAT(NI_RATE, true)
	+
	+SCHED_FEAT(UCLAMP_IMBALANCED, false)
	diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
	index 84301fc49e699..dbc3f5e1a7e01 100644
	--- a/kernel/sched/idle.c
	+++ b/kernel/sched/idle.c
	@@ -519,7 +519,7 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
		 * are still queued.
		 */
		if (uclamp_is_used() &&
	-           !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))
	+           !rq->nr_running && unlikely(WARN_ON(!uclamp_rq_is_idle(rq))))
			init_uclamp_rq(rq);
	 }

Qais Yousef (3):
  sched/uclamp: Fix race condition leading to imbalanced uclamp_rq
  sched/uclamp: Use wrappers instead of open coding UCLAMP_FLAG_IDLE
  sched/uclamp: Move uclamp_rq_{inc, dec}() from core.c

 kernel/sched/core.c    | 49 +++++++++++++++---------------------------
 kernel/sched/ext/ext.c |  6 ++----
 kernel/sched/fair.c    |  6 ++----
 kernel/sched/idle.c    | 19 ++++++++++++++++
 kernel/sched/rt.c      | 10 +++++----
 kernel/sched/sched.h   | 21 ++++++++++++++----
 6 files changed, 63 insertions(+), 48 deletions(-)

-- 
2.53.0

