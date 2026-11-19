Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093384;
	b=1dLK2XruXBGCV3xcG6mrsGisn5QZ6T6C2d1vu0cpnl29EKDktLttg7gYAQQ0SdqRmaRD
	 b6KxbtLpuy0Le3K4nekgvxawjod0FZYejmsq09GUIYD2U2Kszk73Md8riDG67jqQEzE6K
	 PciYSWJUFZR+8xR+MThZMyqBoPFi3NvUoc0n3mekyIJoWPhiuuYLudyUJwgsDqOQQBKOI
	 TlxaYlaJBcsumbtIUnwESyQJJlplqN2hBsq3Un3Uyrk1SZfPjXcEaD+P1Ht0RPmkA9485
	 OBLYAbLZkTsxGEUXKkKT1esNesB6TYtN0pSc7QYeYpfCdFPxm/0Eyl3ki3l+kRarlLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093384;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=aL0jgiPtzhil0KpFawBXinj/QQv48JBjlj38ZiNZEuM=;
	b=yCrZmvK3vpslDoRVxm2ZNU+sYlFwXkUzu8tCuhWm6ofDgfTbcgwFb8/FAVfWHJUhHxq6
	 vCzEZ/uufUgMehAmDyX4CqS0246yI+22C/SEl5Gn60WN4K17X2+x8V3rMM58h61iBkxAh
	 OOT8eAl1sGJYG786ET30G8yoAWnpNLn3wiTf9nqYYbJaCKVR1GjBl75TTvkQ2Ky4hpY8W
	 vjmi1xCoeFd9fNjQOsNT5Y8n/5EAOgHuupvZjyjoGhiCD1vi+aDg++C3FFXzT6RP7rlIH
	 0SLYkDJs22UP9hltgVOY0N+Upz/F8Z9T1ooqjKFSWmKh9ONROVFr5sK3necmjJXqbaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ozIDSRhk;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40DC606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F40DC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ozIDSRhk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aL0jgiPtzhil0KpFawBXinj/QQv48JBjlj38ZiNZEuM=; b=ozIDSRhkrvcdQhk/OavKarXPHX
	VDgOpRhWAapzMceDXUDwOdO131kw/hv8xDNyINdGllqdrthbX/e7s+IVyrSstaWmfAB2RSvFuYG3w
	Jwm25GyHIPzew5zC3F8FJhBeBpRx1N3e9CSzfFkWSVfoBZ+cigs0b+/pGk7tXX2GjrsTB2a2YyuY5
	KUZ+qgCf1SNhGphngBXOfk3fnIuHm4Km/n3xl5ptAGK3/w84YM4asU3kJYXqfVPALO4PGo5h/qnGI
	qmMQ0A9X1eMYmc4TiGgNXdMr3Jm2cKO+TWn1XiPB6aPasSosZ+7mXwHf88DRZzxamJwwVXnAQ6mSp
	/B3BsKQg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1my-0000000HF5s-2Q5F;
	Thu, 19 Nov 2026 13:02:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 002B130072F; Thu, 19 Nov 2026 14:02:54 +0100 (CET)
Date: Thu, 19 Nov 2026 14:02:54 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	david.kaplan@amd.com
Subject: Re: [PATCH v4 2/9] stop_machine: Add NMI-based execution path
Message-ID: <20261119130254.GS2668200@noisy.programming.kicks-ass.net>
References: <20261104182322.578066-1-chang.seok.bae@intel.com>
 <20261104182322.578066-3-chang.seok.bae@intel.com>
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
In-Reply-To: <20261104182322.578066-3-chang.seok.bae@intel.com>

On Wed, Nov 04, 2026 at 06:23:15PM +0000, Chang S. Bae wrote:
> The x86 microcode loader is currently the primary user for this. But
> other architectures are not expected to use it. Add a build option to
> make it opt-in.

FWIW, that's disgusting! The micro-code that loads the micro-code should
damn well disable all exceptions itself, it can manage the NMI state
much saner than we can, but also SMI and god knows what else.

Anyway, how about something a little like this completely untested
below?

I didn't bother with the noinstr, but it shouldn't be too hard to add
that back in I suppose. But I see very little reason for it, since (1)
see above, micro-code should do this, and (2) see the CONFIG_DEBUG_ENTRY
bit in entry_64.S right above repeat_nmi:.



---
 arch/x86/include/asm/stop_machine.h |  20 +++++++
 arch/x86/kernel/irq_work.c          |  17 +++++-
 arch/x86/kernel/nmi.c               |   4 ++
 kernel/stop_machine.c               | 105 ++++++++++++++++++++++++++++++++++--
 4 files changed, 140 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/stop_machine.h b/arch/x86/include/asm/stop_machine.h
new file mode 100644
index 000000000000..c178aa1d0697
--- /dev/null
+++ b/arch/x86/include/asm/stop_machine.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_STOP_MACHINE_H
+#define _ASM_STOP_MACHINE_H
+
+#include <linux/static_call_types.h>
+#include <asm/irq_work.h>
+
+extern void stop_machine_ipi_proto(void);
+
+DECLARE_STATIC_CALL(stop_machine_ipi, stop_machine_ipi_proto);
+
+static inline bool arch_stop_machine_has_ipi(void)
+{
+	return arch_irq_work_has_interrupt();
+}
+#define arch_stop_machine_has_ipi arch_stop_machine_has_ipi
+
+extern void arch_stop_machine_ipi_raise(bool nmi);
+
+#endif /* _ASM_STOP_MACHINE_H */
diff --git a/arch/x86/kernel/irq_work.c b/arch/x86/kernel/irq_work.c
index 308c62411ff4..7ef8ceff4236 100644
--- a/arch/x86/kernel/irq_work.c
+++ b/arch/x86/kernel/irq_work.c
@@ -12,6 +12,8 @@
 #include <asm/idtentry.h>
 #include <asm/trace/irq_vectors.h>
 #include <linux/interrupt.h>
+#include <asm/stop_machine.h>
+#include <linux/static_call.h>
 
 #ifdef CONFIG_X86_LOCAL_APIC
 DEFINE_IDTENTRY_SYSVEC(sysvec_irq_work)
@@ -19,16 +21,27 @@ DEFINE_IDTENTRY_SYSVEC(sysvec_irq_work)
 	apic_eoi();
 	trace_irq_work_entry(IRQ_WORK_VECTOR);
 	inc_irq_stat(IRQ_WORK);
+	static_call_cond(stop_machine_ipi)();
 	irq_work_run();
 	trace_irq_work_exit(IRQ_WORK_VECTOR);
 }
 
+static inline void __arch_irq_work_raise(int vector)
+{
+	__apic_send_IPI_self(vector);
+	apic_wait_icr_idle();
+}
+
 void arch_irq_work_raise(void)
 {
 	if (!arch_irq_work_has_interrupt())
 		return;
 
-	__apic_send_IPI_self(IRQ_WORK_VECTOR);
-	apic_wait_icr_idle();
+	__arch_irq_work_raise(IRQ_WORK_VECTOR);
+}
+
+void arch_stop_machine_ipi_raise(bool nmi)
+{
+	__arch_irq_work_raise(nmi ? NMI_VECTOR : IRQ_WORK_VECTOR);
 }
 #endif
diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index cb46da482c85..6389437862f2 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -25,6 +25,7 @@
 #include <linux/atomic.h>
 #include <linux/sched/clock.h>
 #include <linux/kvm_types.h>
+#include <linux/static_call.h>
 
 #include <asm/cpu_entry_area.h>
 #include <asm/traps.h>
@@ -37,6 +38,7 @@
 #include <asm/microcode.h>
 #include <asm/sev.h>
 #include <asm/fred.h>
+#include <asm/stop_machine.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/nmi.h>
@@ -390,6 +392,8 @@ static noinstr void default_do_nmi(struct pt_regs *regs)
 
 	instrumentation_begin();
 
+	static_call_cond(stop_machine_ipi)();
+
 	if (microcode_nmi_handler_enabled() && microcode_nmi_handler())
 		goto out;
 
diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
index d085ba1f4b44..a11ce3181c61 100644
--- a/kernel/stop_machine.c
+++ b/kernel/stop_machine.c
@@ -23,6 +23,8 @@
 #include <linux/atomic.h>
 #include <linux/nmi.h>
 #include <linux/sched/wake_q.h>
+#include <linux/static_call.h>
+#include <asm/stop_machine.h>
 
 /*
  * Structure to determine completion condition and record errors.  May
@@ -45,6 +47,9 @@ struct cpu_stopper {
 	struct cpu_stop_work	stop_work;	/* for stop_cpus */
 	unsigned long		caller;
 	cpu_stop_fn_t		fn;
+
+	struct multi_stop_data	*msdata;
+	int			ret;
 };
 
 static DEFINE_PER_CPU(struct cpu_stopper, cpu_stopper);
@@ -162,6 +167,8 @@ enum multi_stop_state {
 	MULTI_STOP_DISABLE_IRQ,
 	/* Run the function */
 	MULTI_STOP_RUN,
+	/* Cleanup */
+	MULTI_STOP_CLEANUP,
 	/* Exit */
 	MULTI_STOP_EXIT,
 };
@@ -175,6 +182,7 @@ struct multi_stop_data {
 
 	enum multi_stop_state	state;
 	atomic_t		thread_ack;
+	bool			nmi;
 };
 
 static void set_state(struct multi_stop_data *msdata,
@@ -182,8 +190,7 @@ static void set_state(struct multi_stop_data *msdata,
 {
 	/* Reset ack counter. */
 	atomic_set(&msdata->thread_ack, msdata->num_threads);
-	smp_wmb();
-	WRITE_ONCE(msdata->state, newstate);
+	smp_store_release(&msdata->state, newstate);
 }
 
 /* Last one to ack a state moves to the next state. */
@@ -198,6 +205,50 @@ notrace void __weak stop_machine_yield(const struct cpumask *cpumask)
 	cpu_relax();
 }
 
+static void stop_machine_ipi_func(void);
+
+DEFINE_STATIC_CALL_NULL(stop_machine_ipi, stop_machine_ipi_func);
+
+static void stop_machine_ipi_prepare(bool is_first, bool is_active)
+{
+	struct cpu_stopper *stopper = this_cpu_ptr(&cpu_stopper);
+
+	stopper->ret = !!is_active;
+	if (is_first)
+		static_call_update(stop_machine_ipi, stop_machine_ipi_func);
+}
+
+#ifndef arch_stop_machine_has_ipi
+static inline bool stop_machine_has_ipi(void)
+{
+	return false;
+}
+#endif
+
+static void stop_machine_ipi_raise(struct multi_stop_data *msdata)
+{
+	struct cpu_stopper *stopper = this_cpu_ptr(&cpu_stopper);
+
+	scoped_guard(irq) {
+		stopper->msdata = msdata;
+		arch_stop_machine_ipi_raise(msdata->nmi);
+	}
+
+	/* Wait for IPI to hit. */
+	while (READ_ONCE(stopper->msdata))
+		cpu_relax();
+}
+
+static int stop_machine_ipi_cleanup(bool is_first)
+{
+	struct cpu_stopper *stopper = this_cpu_ptr(&cpu_stopper);
+
+	if (is_first)
+		static_call_update(stop_machine_ipi, NULL);
+
+	return stopper->ret;
+}
+
 /* This is the cpu_stop function which stops the CPU. */
 static int multi_cpu_stop(void *data)
 {
@@ -205,8 +256,8 @@ static int multi_cpu_stop(void *data)
 	enum multi_stop_state newstate, curstate = MULTI_STOP_NONE;
 	int cpu = smp_processor_id(), err = 0;
 	const struct cpumask *cpumask;
+	bool is_active, is_first, ipi;
 	unsigned long flags;
-	bool is_active;
 
 	/*
 	 * When called from stop_machine_from_inactive_cpu(), irq might
@@ -216,21 +267,34 @@ static int multi_cpu_stop(void *data)
 
 	if (!msdata->active_cpus) {
 		cpumask = cpu_online_mask;
-		is_active = cpu == cpumask_first(cpumask);
+		is_first = cpu == cpumask_first(cpumask);
+		is_active = is_first;
 	} else {
 		cpumask = msdata->active_cpus;
+		is_first = cpu == cpumask_first(cpumask);
 		is_active = cpumask_test_cpu(cpu, cpumask);
 	}
 
+	ipi = arch_stop_machine_has_ipi();
+
 	/* Simple state machine */
 	do {
 		/* Chill out and ensure we re-read multi_stop_state. */
+again:
 		stop_machine_yield(cpumask);
 		newstate = READ_ONCE(msdata->state);
 		if (newstate != curstate) {
 			curstate = newstate;
 			switch (curstate) {
+			case MULTI_STOP_PREPARE:
+				if (ipi)
+					stop_machine_ipi_prepare(is_first, is_active);
+				break;
 			case MULTI_STOP_DISABLE_IRQ:
+				if (ipi) {
+					stop_machine_ipi_raise(msdata);
+					goto again;
+				}
 				local_irq_disable();
 				hard_irq_disable();
 				break;
@@ -238,6 +302,10 @@ static int multi_cpu_stop(void *data)
 				if (is_active)
 					err = msdata->fn(msdata->data);
 				break;
+			case MULTI_STOP_CLEANUP:
+				if (ipi)
+					err = stop_machine_ipi_cleanup(is_first);
+				break;
 			default:
 				break;
 			}
@@ -258,6 +326,35 @@ static int multi_cpu_stop(void *data)
 	return err;
 }
 
+static void stop_machine_ipi_func(void)
+{
+	struct cpu_stopper *stopper = this_cpu_ptr(&cpu_stopper);
+	struct multi_stop_data *msdata = stopper->msdata;
+	enum multi_stop_state newstate, curstate = MULTI_STOP_NONE;
+
+	if (!msdata)
+		return;
+
+	do {
+		cpu_relax();
+		newstate = READ_ONCE(msdata->state);
+		if (newstate != curstate) {
+			curstate = newstate;
+			switch (curstate) {
+			case MULTI_STOP_RUN:
+				if (stopper->ret)
+					stopper->ret = msdata->fn(msdata->data);
+				break;
+			default:
+				break;
+			}
+		}
+		ack_state(msdata);
+	} while (curstate <= MULTI_STOP_RUN);
+
+	stopper->msdata = NULL;
+}
+
 static int cpu_stop_queue_two_works(int cpu1, struct cpu_stop_work *work1,
 				    int cpu2, struct cpu_stop_work *work2)
 {
