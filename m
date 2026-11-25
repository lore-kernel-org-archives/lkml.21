Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795646899;
	b=OUq9BPZEJWYrd7/etDsqGGdBj/KaUkvE9SLI3wY5aaTwxHFky4dSiR+S4dgz2gvzd5Kd
	 oOd5DjXs+9YjwjjRtnD4u7pUKBK9HcML2My7TRJ+f3L7b0FfSMYJV5GXx9rwhuNbaY/kT
	 ME2KGAUBhSoN9yHHVEYWPsezXpPuYpqOz0fda92CXfb9PpCQA7AVVWX5UoHG7GSzv2duc
	 Yjj37WSd7nBTMes42p0uAh1SD3PP868kZeF+/zUgLAMEwSOPN9QEb9lW8T+ytMcDZNbuV
	 dJ3kCjqR9Cy/0KrO5MboH3PpgdatRuAfL0ohDWXcSE80kiWhxR8gcenWTYlzk1UfuZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=7tRuFgMuB99J/oxiCPG8qMEKnmKaJLPlSDVtXwerW48=;
	b=yv7Nsq5ttnHPKb2tPoPVnzd2HxSFPd6hDSOAHDSvjHFlKurCDQQF/mluiOkcd7Cn2y7F
	 vFrMtclYUehvDhdm1d3BGw0mL3/yFn5Vr5mdkM3ii9Ph3nuJUoqDINCtSKGrBtC2Pb/bv
	 pCij+QDkp2OlYIzy33ilyK5GmjTRDHOa+sbOLJnNooQIny15s/DFG2//KwPFGT0r6EZgl
	 P4gABMYLyRaLb7KIEYbiOHA0VeodYSohY+YjdM5KeOGyQz3ixVsF8uMPyVicOJXa0Hs3k
	 FQ9sn60YbQi6kVdNEuZtant0SBoHm3qmJxZvh8LP8gk+z+8SpUh5VmzbNjYO/WpOvMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Yl410lpA;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B683606A68C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B683606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Yl410lpA
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so5641512f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795646895; x=1796251695; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7tRuFgMuB99J/oxiCPG8qMEKnmKaJLPlSDVtXwerW48=;
        b=Yl410lpAa49CNft8T/gvIV/GRgb/m5WqMKouQU/xHxR77Zy+e0K8mkhCfjTK3SHPgK
         mn4uOV2VuSlh4i6+2+xiDIvM93HGoxpomWGIlLLo4B57yjALgnYT7oHSTChl7BdgRQRm
         FESYFrpIiHg+3a1kBsvZb3MJ8ujCKkwPeO79eXqhrG5X3vy/I+NDpKrZLauCVldig92Y
         5Q2j9WRKTnm60TM6dduiREN1jc1De/1A3uvfbZJb/Ht1yb9oWEdVSZlZlHjxPq0Vp9bw
         1vMkhkFAtDV/pXI7zspIyqxN98Uajns92kT6AcavTLvDWOTNMOIhEiU35CZaFODKq7qJ
         j6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795646895; x=1796251695;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7tRuFgMuB99J/oxiCPG8qMEKnmKaJLPlSDVtXwerW48=;
        b=ROjVbXaIwLl4t71j7ucNoqhgCy6HgtzT6VLgp6mnVvbu419jkMyQWtSC62w4FIbA7p
         IoB2zK9LAAMTJOdiEaJjSgo0xiEATR7BRI84vPtjy8NKiNaR8z3A7/Zg7i45P1aERfLV
         yEHCwO/P1B4LAcRZ5VHX2uxBagykoLDf5U2eG4Pmg0KVk8EvG2bCu0cd6V2nt0lXGvrt
         cBzbbfCpjqd+CZErWrotg1r6d7/rQwn+odsbeuBikWzO/HskN7mR4x+ZeJxJJyokp2Fp
         LMeyYfyBLN9jKplba628/+3XqRtCq5j+brvAEtNl19e+OIpuLB8Tp/19RKLOWY9QsErh
         hZ9w==
X-Forwarded-Encrypted: i=1; AL+hErGKhYOpBAGbA+/NS3EGBfQprvdapsHRNsWjjYfpSCFyQcyDX3TSJ/Wk32S8LO/1zEminXkbuxbwMiFD5+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1CMoMcp8UlnXQK9/Y0uREVWclii3ruv2bsljf5f5toKgCseCY
	BtMXP9920Ot42lynJJES9JzqseB0TinNvQAgSsTDk6nq9kbCo//7suPW48or0q1Wew==
X-Gm-Gg: AZFdTZcBL5T+ty54RkhBitYbadRwMWtAMLvYL9msfSt6NUSabQwufLIqCjufZcilAg9
	6j9uEYiQmpoY3HxVvQgFqJPbdLetqXGK1remlswsFttuh55DJI1UR0mDDfkF9nXGNc6NtSvSEQ+
	qXM4P6FCtn+DraTaZF7GqSLhkKoH8gsfC5VMhcum3c/PwR6/vJ2X/hoOthKd/896gywAdrz8Fq1
	77nrSAkFNUjjIs98t21p91W2ZvcuebWA2LyUpWVdhL+tRYRqa9ciOhHtZ9FsGOio/AbqwY7A7rC
	CL/fi+rI55ePISi5ukTyRuXRJEQNUoWtWIZB/TH0zjFDuLmWECbm6+NJ70bj3awKkMp1uatopA5
	hTnZ3bSGaU8228WjLecvCLbyNbsny2f+YWwL4EkuzeQIw26SxSYwOWMYHipRnI9yehf+r01hZyO
	/GSJpWFl9ZkaAW8GJ2dEc1KdUQH+XXo2PZbfylAOarIQY8D4E84TrfCj+ffB3+Fmv4Itp/QTIDc
	fIIJNxh4POjfYVpNZ1dQHhflsaUqYExFRBUrJVqozS6BI4UgkAhSueOMsZYOACYEqzjbH/s3dLE
	TaXo9hdyHDEi+Szu/42KAJgpz8tMA/vhMSnQIw+7x58DAaeKU3gVX1vGXrIl3EHiGFRyOYqBghW
	OlASCLc16lmcz2LidimF9
X-Received: by 2002:a05:6000:2601:b0:491:68e2:bf2f with SMTP id ffacd0b85a97d-4abb9642f3fmr43161693f8f.52.1795646894508;
        Wed, 25 Nov 2026 14:48:14 -0800 (PST)
Received: from elver.google.com (124.100.205.35.bc.googleusercontent.com. [35.205.100.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm38542491f8f.29.2026.11.25.14.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:48:13 -0800 (PST)
Date: Wed, 25 Nov 2026 22:48:08 +0000
From: Marco Elver <elver@google.com>
To: KunWu Chan <kunwu.chan@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Dmitry Vyukov <dvyukov@google.com>, linux-arch@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH] kcsan: Detect cross-CPU races on
 {READ,WRITE}_ONCE_THIS_CPU()
Message-ID: <awdlqAbyRyJdSVeG@elver.google.com>
References: <20261123135148.1146372-1-elver@google.com>
 <CAN_Opa_TKjDAWz8EQaw6ro=joymwurpcy-k_x=q4E6TLt6ZpUQ@mail.gmail.com>
 <CANpmjNNOVD3KVrau5KD4WzqxoMkZZoJCfdPzvjLmZsGy9zXBug@mail.gmail.com>
 <CAN_Opa9zKzSptpNOnCzaW_EK0oT=HDDVoJxy5Q0crM+6b9bR_g@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN_Opa9zKzSptpNOnCzaW_EK0oT=HDDVoJxy5Q0crM+6b9bR_g@mail.gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)

On Wed, Nov 25, 2026 at 05:40PM +0800, KunWu Chan wrote:
[...]
> Makes sense to keep the test in both configurations.
> 
> I reran the three new KUnit cases on next-20261123 with rcutorture
> disabled, using the same image with interruptible watchers on and
> off.  Both runs passed all three cases at all seven thread counts
> (21/21 per run, no skips).
> 
> With watchers on, I checked the console reports for both remote
> cases.  The two accesses were on different CPUs in each report.
> The earlier -EBUSY and remote_read failures did not reproduce.
> The separate 60-second rcutorture run also completed without any
> reports involving got_idle_tick or tick_nohz_handler.
> 
> One question about the IRQ-off path.  A local NMI can still write
> to the watched address while its KCSAN checks are disabled.  If
> that changes the sampled value and no other access hits the
> watchpoint, is an unknown-origin report expected for THIS_CPU?

Yeah, but we can suppress it:

diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index 51340bf1d4a3..b3e0c2627712 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -689,7 +689,9 @@ kcsan_setup_watchpoint(const volatile void *ptr, size_t size, int type, unsigned
 		kcsan_report_known_origin(ptr, size, type, ip,
 					  value_change, watchpoint - watchpoints,
 					  old, new, access_mask);
-	} else if (value_change == KCSAN_VALUE_CHANGE_TRUE) {
+	} else if (value_change == KCSAN_VALUE_CHANGE_TRUE &&
+		   /* May be due to a permitted write from NMI on this CPU. */
+		   !(type & KCSAN_ACCESS_THIS_CPU)) {
 		/* Inferring a race, since the value should not have changed. */
 
 		atomic_long_inc(&kcsan_counters[KCSAN_COUNTER_RACES_UNKNOWN_ORIGIN]);


The downside is not detecting races with uninstrumented code, but usage
of *_ONCE_THIS_CPU() is still rare, and if someone wants that coverage
back, we can think of something better. In general, I find the unknown-
origin reports not all that helpful in many cases, so my preference is
to just ignore those.

> Tested-by: Kunwu Chan <kunwu.chan@gmail.com>

Below is the complete v2 patch with the unknown-origin suppression.

Thanks,
-- Marco

------ >8 ------

From: Marco Elver <elver@google.com>
Date: Mon, 23 Nov 2026 11:03:32 +0000
Subject: [PATCH v2] kcsan: Detect cross-CPU races on {READ,WRITE}_ONCE_THIS_CPU()

READ_ONCE_THIS_CPU() and WRITE_ONCE_THIS_CPU() identify accesses to
per-CPU data that are intended to race only with other contexts on the
same CPU. So far they are plain READ_ONCE() and WRITE_ONCE(): no marked
accesses involving them are reported, incl. from other CPUs.

Make the new accessors assert exclusivity but ignore same-CPU accesses:
READ_ONCE_THIS_CPU() asserts no concurrent writers,
WRITE_ONCE_THIS_CPU() asserts no concurrent accesses.

For KCSAN to ignore racing accesses from other contexts on the same CPU,
introduce KCSAN_ACCESS_THIS_CPU, which makes KCSAN keep interrupts
disabled while the watchpoint is set up. A value change without a racing
access is not reported for these accesses, since it may be due to a
permitted write from an NMI on the same CPU.

With that, any racing accesses (incl. marked ones) from other CPUs
involving READ_ONCE_THIS_CPU() and WRITE_ONCE_THIS_CPU() will be
reported as "KCSAN: assert: race ...".

Suggested-by: KunWu Chan <kunwu.chan@gmail.com>
Tested-by: Kunwu Chan <kunwu.chan@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Marco Elver <elver@google.com>
---
 include/asm-generic/rwonce.h | 22 +++++++--
 include/linux/kcsan-checks.h |  1 +
 kernel/kcsan/core.c          | 10 +++-
 kernel/kcsan/kcsan_test.c    | 90 ++++++++++++++++++++++++++++++++++++
 4 files changed, 117 insertions(+), 6 deletions(-)

diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
index 3dc65a3310fb..e2d563096738 100644
--- a/include/asm-generic/rwonce.h
+++ b/include/asm-generic/rwonce.h
@@ -66,11 +66,25 @@ do {									\
  * which are intended to race only with accesses from other execution
  * contexts on the same CPU, e.g. task and interrupt context.
  *
- * For now, these are simple wrappers around READ_ONCE() and
- * WRITE_ONCE().
+ * With KCSAN, concurrent writes (for READ_ONCE_THIS_CPU()) or any concurrent
+ * accesses (for WRITE_ONCE_THIS_CPU()) from other CPUs are reported.
  */
-#define READ_ONCE_THIS_CPU(x)		READ_ONCE(x)
-#define WRITE_ONCE_THIS_CPU(x, val)	WRITE_ONCE(x, val)
+#define READ_ONCE_THIS_CPU(x)						\
+({									\
+	auto __tc_p = &(x);						\
+	kcsan_check_access(__tc_p, sizeof(*__tc_p),			\
+			   KCSAN_ACCESS_ASSERT | KCSAN_ACCESS_THIS_CPU);\
+	READ_ONCE(*__tc_p);						\
+})
+
+#define WRITE_ONCE_THIS_CPU(x, val)					\
+do {									\
+	auto __tc_p = &(x);						\
+	kcsan_check_access(__tc_p, sizeof(*__tc_p),			\
+			   KCSAN_ACCESS_ASSERT | KCSAN_ACCESS_WRITE |	\
+			   KCSAN_ACCESS_THIS_CPU);			\
+	WRITE_ONCE(*__tc_p, val);					\
+} while (0)
 
 static __no_sanitize_or_inline
 unsigned long __read_once_word_nocheck(const void *addr)
diff --git a/include/linux/kcsan-checks.h b/include/linux/kcsan-checks.h
index e135dacaa90f..afe50fe351fa 100644
--- a/include/linux/kcsan-checks.h
+++ b/include/linux/kcsan-checks.h
@@ -20,6 +20,7 @@
 /* The following are special, and never due to compiler instrumentation. */
 #define KCSAN_ACCESS_ASSERT	(1 << 3) /* Access is an assertion. */
 #define KCSAN_ACCESS_SCOPED	(1 << 4) /* Access is a scoped access. */
+#define KCSAN_ACCESS_THIS_CPU	(1 << 5) /* Ignore races from same-CPU accesses. */
 
 /*
  * __kcsan_*: Always calls into the runtime when KCSAN is enabled. This may be used
diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index 26755add7cdb..b3e0c2627712 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -567,9 +567,13 @@ kcsan_setup_watchpoint(const volatile void *ptr, size_t size, int type, unsigned
 	 *	1. Races of the reordered access with interrupts. To avoid, if
 	 *	   the current access is reorder_access, disable interrupts.
 	 *	2. Avoid races of scoped accesses from nested interrupts (below).
+	 *
+	 * Similarly, KCSAN_ACCESS_THIS_CPU accesses may only race with
+	 * interrupts on the same CPU: disable interrupts, so that only races
+	 * with other CPUs are detected.
 	 */
 	is_reorder_access = find_reorder_access(ctx, ptr, size, type, ip);
-	if (is_reorder_access)
+	if (is_reorder_access || (type & KCSAN_ACCESS_THIS_CPU))
 		interrupt_watcher = false;
 	/*
 	 * Avoid races of scoped accesses from nested interrupts (or scheduler).
@@ -685,7 +689,9 @@ kcsan_setup_watchpoint(const volatile void *ptr, size_t size, int type, unsigned
 		kcsan_report_known_origin(ptr, size, type, ip,
 					  value_change, watchpoint - watchpoints,
 					  old, new, access_mask);
-	} else if (value_change == KCSAN_VALUE_CHANGE_TRUE) {
+	} else if (value_change == KCSAN_VALUE_CHANGE_TRUE &&
+		   /* May be due to a permitted write from NMI on this CPU. */
+		   !(type & KCSAN_ACCESS_THIS_CPU)) {
 		/* Inferring a race, since the value should not have changed. */
 
 		atomic_long_inc(&kcsan_counters[KCSAN_COUNTER_RACES_UNKNOWN_ORIGIN]);
diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
index 1c8853f14dae..3e9689492abe 100644
--- a/kernel/kcsan/kcsan_test.c
+++ b/kernel/kcsan/kcsan_test.c
@@ -22,6 +22,7 @@
 #include <linux/kcsan-checks.h>
 #include <linux/kernel.h>
 #include <linux/mutex.h>
+#include <linux/percpu.h>
 #include <linux/sched.h>
 #include <linux/seqlock.h>
 #include <linux/spinlock.h>
@@ -337,6 +338,7 @@ static struct {
 	long val[8];
 } test_struct;
 static long __data_racy test_data_racy;
+static DEFINE_PER_CPU(long, test_pcpu_var);
 static DEFINE_SEQLOCK(test_seqlock);
 static DEFINE_SPINLOCK(test_spinlock);
 static DEFINE_MUTEX(test_mutex);
@@ -403,6 +405,34 @@ static noinline void test_kernel_assert_access(void)
 	ASSERT_EXCLUSIVE_ACCESS(test_var);
 }
 
+static noinline void test_kernel_read_this_cpu(void)
+{
+	sink_value(READ_ONCE_THIS_CPU(test_var));
+}
+
+static noinline void test_kernel_write_this_cpu(void)
+{
+	WRITE_ONCE_THIS_CPU(test_var, 42);
+}
+
+static noinline void test_kernel_write_this_cpu_local(void)
+{
+	preempt_disable();
+	WRITE_ONCE_THIS_CPU(*this_cpu_ptr(&test_pcpu_var), 1);
+	preempt_enable();
+}
+
+static noinline void test_kernel_reset_this_cpu_local(void)
+{
+	long *p;
+
+	preempt_disable();
+	p = this_cpu_ptr(&test_pcpu_var);
+	if (READ_ONCE_THIS_CPU(*p))
+		WRITE_ONCE_THIS_CPU(*p, 0);
+	preempt_enable();
+}
+
 #define TEST_CHANGE_BITS 0xff00ff00
 
 static noinline void test_kernel_change_bits(void)
@@ -1223,6 +1253,63 @@ static void test_assert_exclusive_access_scoped(struct kunit *test)
 	KUNIT_EXPECT_FALSE(test, match_expect_inscope);
 }
 
+/* Test that remote writes racing with READ_ONCE_THIS_CPU() are reported. */
+__no_kcsan
+static void test_this_cpu_remote_write(struct kunit *test)
+{
+	struct expect_report expect = {
+		.access = {
+			{ test_kernel_read_this_cpu, &test_var, sizeof(test_var), KCSAN_ACCESS_ASSERT },
+			{ test_kernel_write_atomic, &test_var, sizeof(test_var), KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ATOMIC },
+		},
+	};
+	bool match_expect = false;
+
+	KCSAN_TEST_REQUIRES(test, !IS_ENABLED(CONFIG_KCSAN_IGNORE_ATOMICS));
+
+	begin_test_checks(test_kernel_read_this_cpu, test_kernel_write_atomic);
+	do {
+		match_expect = report_matches(&expect);
+	} while (!end_test_checks(match_expect));
+	KUNIT_EXPECT_TRUE(test, match_expect);
+}
+
+/* Test that remote reads racing with WRITE_ONCE_THIS_CPU() are reported. */
+__no_kcsan
+static void test_this_cpu_remote_read(struct kunit *test)
+{
+	struct expect_report expect = {
+		.access = {
+			{ test_kernel_write_this_cpu, &test_var, sizeof(test_var), KCSAN_ACCESS_ASSERT | KCSAN_ACCESS_WRITE },
+			{ test_kernel_read, &test_var, sizeof(test_var), 0 },
+		},
+	};
+	bool match_expect = false;
+
+	begin_test_checks(test_kernel_write_this_cpu, test_kernel_read);
+	do {
+		match_expect = report_matches(&expect);
+	} while (!end_test_checks(match_expect));
+	KUNIT_EXPECT_TRUE(test, match_expect);
+}
+
+/*
+ * Test that races between task and interrupt on the same CPU's instance are not
+ * reported; the test threads' timers access the same per-CPU instance as the
+ * interrupted thread. Only meaningful with CONFIG_KCSAN_INTERRUPT_WATCHER=y.
+ */
+__no_kcsan
+static void test_this_cpu_local_noreport(struct kunit *test)
+{
+	bool match_never = false;
+
+	begin_test_checks(test_kernel_write_this_cpu_local, test_kernel_reset_this_cpu_local);
+	do {
+		match_never = report_available();
+	} while (!end_test_checks(match_never));
+	KUNIT_EXPECT_FALSE(test, match_never);
+}
+
 /*
  * jiffies is special (declared to be volatile) and its accesses are typically
  * not marked; this test ensures that the compiler nor KCSAN gets confused about
@@ -1485,6 +1572,9 @@ static struct kunit_case kcsan_test_cases[] = {
 	KCSAN_KUNIT_CASE(test_assert_exclusive_bits_nochange),
 	KCSAN_KUNIT_CASE(test_assert_exclusive_writer_scoped),
 	KCSAN_KUNIT_CASE(test_assert_exclusive_access_scoped),
+	KCSAN_KUNIT_CASE(test_this_cpu_remote_write),
+	KCSAN_KUNIT_CASE(test_this_cpu_remote_read),
+	KCSAN_KUNIT_CASE(test_this_cpu_local_noreport),
 	KCSAN_KUNIT_CASE(test_jiffies_noreport),
 	KCSAN_KUNIT_CASE(test_seqlock_noreport),
 	KCSAN_KUNIT_CASE(test_atomic_builtins),
-- 
2.56.1.839.g22a8290db9-goog

