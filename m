Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660272;
	b=GkdA2NMyj0d7HLHI7r6hYUfpel/MxIbg66XJb7FIDwfObSWXYLBPD6PJG2vYmY2sqjMF
	 wnpaYAzeFakjwz4ojQUiBgDcEUPRJ3vgXJwscNDtTcKLgL8CQxBHa6MdXALWHclrxUfsE
	 Qzii9pDs1OzFN0Ws6OB9Kvo9xC631uqTs8CeAPn1TXVR5Mm9K59K17T+VWcHNj8SXXJyv
	 w/7RkQYKEv9X8tVPfnrrC0nqjtXK7AtD6LmrLwIejOzLNrs9J1vzU68gsmgl3bj0/Gfx3
	 NXj9IaoA+6DwSOEyKDaj4v2CUscS2hTl3hfnmEZfalE2uKAybcAAsIQe3GFoZ5FxQrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NA3dxPx5kpLeZIBZWy1VGAvPGIUfeVILehoK5Z42ZCI=;
	b=oWy3aEynBqazED4V4DLZX0yo0y+JK3ZNcuZWu7Vc1PMfQkGDCOx3N//PgFQa5l3PhFKj
	 cgL8OzKmtPO7B7IOYMuhNFF0dU+/MFQQ0+ivtvVUqzur1cmu9SLPQ0MtJYnd9VKtGsGFE
	 IHPiYpx7Y1OwX48/C+f7bcrcwLyd5vX7hePUmprUvmeuRUgyJumBxU0srluB/cES3ElNB
	 5GkBxgPkvamRkwTUvxg+0R+7k8b8V80NXS4Qp/ViwTg0JyQwwZet86uQupOOPbwEGdpnL
	 9TmSu7/xwd4VWnblg/ve5pcDFRFddIXLPj8ZZFmNeGR6DFyPZJK0Vtv7dy7AKa4RTMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LUquglpk;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC14606A6A6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AC14606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LUquglpk
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dee593f18so6018215f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660271; x=1796265071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NA3dxPx5kpLeZIBZWy1VGAvPGIUfeVILehoK5Z42ZCI=;
        b=LUquglpk9Yta9sPSg26o2HWSPXSKMYtImXRdZQ0zz/gF21pMkwWUrO4VG/7fKlRbU1
         hldloSMca2+7ATdQZJ+ekLZumicx7xeS37zCJYGF7GlEivaJ9biDuX3WOU0UUL55T4pO
         wq4bGxdY26aURiY6ApiQNzvZFCudo3GdvuIE71gwAyPl+nFKJUcI9+0S/8DXX6pztYQj
         qNiZ3kfC7b2NOI7tb2TGu57y8R/nhX067IyQRIIao2JxNDOe4coe8LmXZBmXvinat/+j
         EgDepwUvIKrNvb2nYXXSUjSCrMWx1BxbkrJPJA4x+vI+/YVDrZOtbyPvs7FkR5HCzli3
         JuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660271; x=1796265071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NA3dxPx5kpLeZIBZWy1VGAvPGIUfeVILehoK5Z42ZCI=;
        b=oEo5y4JMNVr6ZnZZBdMIyLMRZNjQaY/Gf1I+KRHKv4dr7tRxbC9mELZcS2p+x7zMYP
         M6aVoOcgyxfGKq1OEneIWHkg+fv4iosnoxZ6FiVbhvOAAtwuRLHchs3GORauB90mzuw4
         K906geuH1EfQnFrdlY0mJrVDU5f6p8QA2mGqmfKfdAKrejjPjPY6L1VATFP5D5xuE8xE
         BD3EgQqI6yhIFmPHS0+5URRuXAdeBo0vMJ/LU3v0cgV/UUjJufmeWEfCsmN3t8E2v1yi
         EpGy+W0gBQGb0lrgoXE61ff0Wnk1y2Tpg7Kx1aogMCP+TgSlSHu3OJzsLbF9tDpvwphg
         VVMg==
X-Forwarded-Encrypted: i=1; AL+hErHo6Gpay4ciDDvMvaBeLMdgtkaQB63Y7nXUgnRCmaF5z7iqkdJ5hlQ+6vPJFXEkvqQZDUSdA/7vZQtAjG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fx1MBAI66WmIzyfGlx4fgHxIncwiNkz0YXxhHdwEardHDohxo
	AT4qnPZJp9XIs52sZ1RXpx/T6ytE4Y1BK6LqMgEfGbGic2YDEHrQhIpx
X-Gm-Gg: AZFdTZcJJ3rFy83z3/oXqrcxfe1JszJ6UUpu3yWRaok24I7hwDWyXSioWh+/cY7a2XP
	qXqoTkoS5XA0V32431gV/jT+Qyf1MCe6WkA8ftklFkgs6Q2f1A85vZd5LIJ/zyQ2ThzXzu5J5xg
	VhNJ26P4fS/WdthvkUoMsFWBL3vps4TEeIUutuQ2WlhBduUiYug5ChUZrk/IH0TyX5opyrp9VC5
	HgvwH9+3LBNPE+zrqPuedSn5vATKP5MxefXgAr1wgqbruoQPQMLvn9STbBn7yIKJNoZ8Gs4l3kI
	2o6rtZNEyXhgmYET8TUtg6R/8p0HSpzKSgCj/5SvRPaJTFOM6IDGf64p1L4BvtAOqwzsC5GoV7y
	kvgRBuh8dm3dv3gkVMNbPueNEahmwewfYScrmU0imuWSIk+uEEaIfmzaAAs1eD+ahOcZKqAjSdf
	WuyxlW9naZx5YkUXN6SZKT9ICTJd9Ab918B9WCt6uB8SBlM02Zsvt/jbWBHViXgIUOUyxtwotwf
	RchPdHdk5Sxss9/JxDNIWcd3iWSwXiAKQK7/N+M2/xXSUiRI/jlRRk1h3XRNIOg1rcsSP4PqPzG
	z/5ow/L731SWSuJ2XB1dbEuWLHq0VnxPX2ylXPaOoRWDXVx8HnN24q0sL5luXBios/Qy7ntV5Sd
	pKdGJdIp1qobbCI5+IjeJAsUgLf7qpItk7nkfY6cyV+VKx497IFYdFDwoqIcg8GetSw2bvTG5Ar
	Obbs85KKvY2uZ5hWyot4dkGuHVWflJyufe9ckS2g==
X-Received: by 2002:a5d:59c3:0:b0:4b5:b60:4814 with SMTP id ffacd0b85a97d-4b50b60487bmr20466444f8f.54.1795660270516;
        Wed, 25 Nov 2026 18:31:10 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b10e-d501-d0c4-b021-8d77-e472.310.pool.telefonica.de. [2a02:3100:b10e:d501:d0c4:b021:8d77:e472])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm37722445f8f.20.2026.11.25.18.31.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 18:31:10 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Song Liu <song@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] sched/preempt: Check preempt counts in notrace helpers
Date: Thu, 26 Nov 2026 03:30:54 +0100
Message-Id: <87f882f6c8a66a3d293b6ec00612fd5f25cb2edd.1795631277.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1795631277.git.kmehltretter@gmail.com>
References: <cover.1795631277.git.kmehltretter@gmail.com>
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

The notrace preemption macros use raw count updates even with
CONFIG_DEBUG_PREEMPT, bypassing the underflow and near-overflow checks
used by ordinary operations.

Add checked noinstr helpers for notrace preemption-count updates and use
them in preempt_disable_notrace(), preempt_enable_notrace() and
preempt_enable_no_resched_notrace(). Export the out-of-line helpers for
module callers and retain raw updates when CONFIG_DEBUG_PREEMPT is
disabled. Remove the now-unused __preempt_count_inc() and
__preempt_count_dec() macros.

Share validation with preempt_count_add() and preempt_count_sub(),
leaving their preemption-latency tracing and ordering unchanged.

DEBUG_LOCKS_WARN_ON() evaluates its condition before entering its
instrumentation region. Branch profiling would therefore call
ftrace_likely_update() from noinstr text. Make the Branch Profiling
Kconfig choice depend on !DEBUG_PREEMPT, covering both
PROFILE_ANNOTATED_BRANCHES and PROFILE_ALL_BRANCHES without changing
non-debug configurations.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20261029093219.GH1779021@noisy.programming.kicks-ass.net
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v2:
- Replace the kernel/sched/Makefile CFLAGS_core.o override with a
  !DEBUG_PREEMPT dependency on the Branch Profiling Kconfig choice
  (Steven Rostedt), covering both PROFILE_ANNOTATED_BRANCHES and
  PROFILE_ALL_BRANCHES.
- Remove unused __preempt_count_inc() and __preempt_count_dec() macros
  and clarify the changelog wording (Hongyan Xia).
 include/linux/preempt.h | 23 +++++++++++++++++------
 kernel/sched/core.c     | 40 ++++++++++++++++++++++++++++++++++++----
 kernel/trace/Kconfig    |  1 +
 3 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index 06ff44a4b8b..b60fce55a35 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -217,6 +217,17 @@ static __always_inline unsigned char interrupt_context_level(void)
  */
 #define in_atomic_preempt_off() (preempt_count() != PREEMPT_DISABLE_OFFSET)
 
+#ifdef CONFIG_DEBUG_PREEMPT
+void preempt_count_add_notrace(int val);
+void preempt_count_sub_notrace(int val);
+#define preempt_count_dec_and_test_notrace() \
+	({ preempt_count_sub_notrace(1); should_resched(0); })
+#else
+#define preempt_count_add_notrace(val)	__preempt_count_add(val)
+#define preempt_count_sub_notrace(val)	__preempt_count_sub(val)
+#define preempt_count_dec_and_test_notrace() __preempt_count_dec_and_test()
+#endif
+
 #if defined(CONFIG_DEBUG_PREEMPT) || defined(CONFIG_TRACE_PREEMPT_TOGGLE)
 extern void preempt_count_add(int val);
 extern void preempt_count_sub(int val);
@@ -228,8 +239,8 @@ extern void preempt_count_sub(int val);
 #define preempt_count_dec_and_test() __preempt_count_dec_and_test()
 #endif
 
-#define __preempt_count_inc() __preempt_count_add(1)
-#define __preempt_count_dec() __preempt_count_sub(1)
+#define preempt_count_inc_notrace() preempt_count_add_notrace(1)
+#define preempt_count_dec_notrace() preempt_count_sub_notrace(1)
 
 #define preempt_count_inc() preempt_count_add(1)
 #define preempt_count_dec() preempt_count_sub(1)
@@ -263,7 +274,7 @@ do { \
 #define preempt_enable_notrace() \
 do { \
 	barrier(); \
-	if (unlikely(__preempt_count_dec_and_test())) \
+	if (unlikely(preempt_count_dec_and_test_notrace())) \
 		__preempt_schedule_notrace(); \
 } while (0)
 
@@ -283,7 +294,7 @@ do { \
 #define preempt_enable_notrace() \
 do { \
 	barrier(); \
-	__preempt_count_dec(); \
+	preempt_count_dec_notrace(); \
 } while (0)
 
 #define preempt_check_resched() do { } while (0)
@@ -291,14 +302,14 @@ do { \
 
 #define preempt_disable_notrace() \
 do { \
-	__preempt_count_inc(); \
+	preempt_count_inc_notrace(); \
 	barrier(); \
 } while (0)
 
 #define preempt_enable_no_resched_notrace() \
 do { \
 	barrier(); \
-	__preempt_count_dec(); \
+	preempt_count_dec_notrace(); \
 } while (0)
 
 #else /* !CONFIG_PREEMPT_COUNT */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 515b9d0353c..017549d1f72 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6040,7 +6040,7 @@ static inline void preempt_latency_start(int val)
 	}
 }
 
-void preempt_count_add(int val)
+static __always_inline bool __preempt_count_add_checked(int val)
 {
 #ifdef CONFIG_DEBUG_PREEMPT
 	/*
@@ -6052,7 +6052,7 @@ void preempt_count_add(int val)
 	 */
 	if (!IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS) &&
 	    DEBUG_LOCKS_WARN_ON((preempt_count() < 0)))
-		return;
+		return false;
 #endif
 	__preempt_count_add(val);
 #ifdef CONFIG_DEBUG_PREEMPT
@@ -6062,6 +6062,21 @@ void preempt_count_add(int val)
 	DEBUG_LOCKS_WARN_ON((preempt_count() & PREEMPT_MASK) >=
 				PREEMPT_MASK - 10);
 #endif
+	return true;
+}
+
+#ifdef CONFIG_DEBUG_PREEMPT
+void noinstr preempt_count_add_notrace(int val)
+{
+	__preempt_count_add_checked(val);
+}
+EXPORT_SYMBOL(preempt_count_add_notrace);
+#endif
+
+void preempt_count_add(int val)
+{
+	if (!__preempt_count_add_checked(val))
+		return;
 	preempt_latency_start(val);
 }
 EXPORT_SYMBOL(preempt_count_add);
@@ -6077,7 +6092,7 @@ static inline void preempt_latency_stop(int val)
 		trace_preempt_on(CALLER_ADDR0, get_lock_parent_ip());
 }
 
-void preempt_count_sub(int val)
+static __always_inline bool preempt_count_sub_debug_checks(int val)
 {
 #ifdef CONFIG_DEBUG_PREEMPT
 	/*
@@ -6087,15 +6102,32 @@ void preempt_count_sub(int val)
 	unsigned int pc = preempt_count();
 
 	if (DEBUG_LOCKS_WARN_ON(pc - uval > pc))
-		return;
+		return false;
 	/*
 	 * Is the spinlock portion underflowing?
 	 */
 	if (DEBUG_LOCKS_WARN_ON((val < PREEMPT_MASK) &&
 			!(preempt_count() & PREEMPT_MASK)))
+		return false;
+#endif
+	return true;
+}
+
+#ifdef CONFIG_DEBUG_PREEMPT
+void noinstr preempt_count_sub_notrace(int val)
+{
+	if (!preempt_count_sub_debug_checks(val))
 		return;
+	__preempt_count_sub(val);
+}
+EXPORT_SYMBOL(preempt_count_sub_notrace);
 #endif
 
+void preempt_count_sub(int val)
+{
+	if (!preempt_count_sub_debug_checks(val))
+		return;
+
 	preempt_latency_stop(val);
 	__preempt_count_sub(val);
 }
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 35d043b1933..a940dbe551b 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -663,6 +663,7 @@ config TRACE_BRANCH_PROFILING
 
 choice
 	prompt "Branch Profiling"
+	depends on !DEBUG_PREEMPT
 	default BRANCH_PROFILE_NONE
 	help
 	 The branch profiling is a software profiler. It will add hooks
-- 
2.39.5 (Apple Git-154)

