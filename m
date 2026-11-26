Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710285;
	b=SKhytNoFXtvHXaMll2X4CU/4JvNdwWEPeKpWALDKK5dc/LrkkoeMSj84h0koJ5h2QI20
	 J9DaELUHZ5z4njMv72KBTY+LhenFrQiMa28J2Csk5sx01dJgCjnfO5r864lH09HYz/TBV
	 wDWt5DS3m5/S6YzC7tItXu4ODhguRXjHZS2Yoz3PUEbDln+RNa56jsfa4vg1NLgF99/3o
	 sivaqkkbA2uzSUvKj7fy5Po6eODxgKB282Ci2xPYEXLwg6mmMzJhiFbJqoJMoOwGW7Ejl
	 sG1D2eXf+Kl/Qs4Tu8l2ChGXFl/bPaF1JFfWntiT5u3qwmh4uaboEZtk7/zfcUvZVnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710285;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=9G0jPplphHBf20PHLRVgI4aYGcb669iPH0qvKLR0zNk=;
	b=CCV/7KLllmEfDNA781sVzZ4kf1bnGXzdEXZ4/gib28HBVDFHVSLrQuWt/nrBEZ2TRoFj
	 GnNxYmdQOEHUoc+6hfBzhYS6aoynjcYwYwpFOJ7KQGJt+X1MB9u/bUEOrlKQGkOl2iw93
	 +es11qdo0FfipCbJ+GkOURGEGKh4Yw4r83QlWnXL1/OPtY27kt+WPoKs7qoUB/opJK8TL
	 lHSHNA6tClSQBNI+XZhDw/yVDQssjM6wVBze+ufF2Ie9wpalAmu461GIp2tFRukCNrjA2
	 eLP1L4W8F1jANeVk9yUptL2v/xSexax1oLtyPjSiOdikn3EYKRiaspd+7VwCThqC8Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BUU8Nj5x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA123606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BUU8Nj5x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0971F000D8;
	Thu, 26 Nov 2026 16:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710285;
	bh=9G0jPplphHBf20PHLRVgI4aYGcb669iPH0qvKLR0zNk=;
	h=Date:From:To:Cc:Subject:References;
	b=BUU8Nj5x5gNPO4PXByKDaZp5D9B5HKuxoIVHKQ8R6DcUGe9MbbovEklaxQzrydMfe
	 dKTOlUs87BuhxV6KawOZOlJkg90oCkJy3Yxqt8e8yE+C//TxnfFW4Qs0QnhLiz5FRM
	 zcXdYfr4LkNK3UTWbdyu//8uCvClv8j8DTIuzC4Fp0/NNusWXiYWPJmzmNQtK8vFdT
	 6GdcWrzQIQLOHQ9GO+GXcjp+QDGABVXVnN7pWo7Grcvd++66+2FCFLeQVZG90oMN+C
	 x5UYGCOlFiXyEiuiKH2/2+v+s/CKgGYyDFFuauXAN4RnAaXAWfF4SlHNobb1qzUiXd
	 e6cFi9cfqGx9Q==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xWcH6-00000007bkT-2dbo;
	Thu, 26 Nov 2026 11:24:44 -0500
Message-ID: <20261126162444.434708485@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 26 Nov 2026 11:24:26 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Yury Norov <yury.norov@gmail.com>,
 Yury Norov <ynorov@nvidia.com>
Subject: [for-next][PATCH 03/15] tracing: Move non-trace_printk prototypes into trace_controls.h
References: <20261126162423.442922469@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

Remove the prototypes of the code that is not associated with
trace_printk() from trace_printk.h.

These control functions as well as ftrace_dump() and trace_dump_stack()
are used in cases where things go wrong.  The main use case is to do a
trace_dump_stack(); tracing_off(); ftrace_dump(); in a place that detected
that something went wrong, whereas, trace_printk() is added to normal code
during debugging and removed before committing upstream. The dump code is
fine to keep in production.

Link: https://patch.msgid.link/20261102202407.519348871@kernel.org
Suggested-by: Yury Norov <yury.norov@gmail.com>
Reviewed-by: Yury Norov <ynorov@nvidia.com>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 arch/powerpc/xmon/xmon.c         |  1 +
 arch/s390/kernel/ipl.c           |  1 +
 arch/s390/kernel/machine_kexec.c |  1 +
 drivers/gpu/drm/i915/i915_gem.h  |  1 +
 drivers/tty/sysrq.c              |  1 +
 include/linux/trace_controls.h   | 54 ++++++++++++++++++++++++++++++++
 include/linux/trace_printk.h     | 51 ------------------------------
 kernel/debug/debug_core.c        |  1 +
 kernel/panic.c                   |  1 +
 kernel/rcu/rcu.h                 |  1 +
 kernel/rcu/rcutorture.c          |  1 +
 kernel/trace/trace.h             |  1 +
 kernel/trace/trace_benchmark.c   |  1 +
 lib/sys_info.c                   |  1 +
 14 files changed, 66 insertions(+), 51 deletions(-)
 create mode 100644 include/linux/trace_controls.h

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 90a8d7a8f42d..5e1336e2cecd 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -27,6 +27,7 @@
 #include <linux/highmem.h>
 #include <linux/security.h>
 #include <linux/debugfs.h>
+#include <linux/trace_controls.h>
 
 #include <asm/ptrace.h>
 #include <asm/smp.h>
diff --git a/arch/s390/kernel/ipl.c b/arch/s390/kernel/ipl.c
index c441b1357492..3c8b693d3ed7 100644
--- a/arch/s390/kernel/ipl.c
+++ b/arch/s390/kernel/ipl.c
@@ -22,6 +22,7 @@
 #include <linux/debug_locks.h>
 #include <linux/vmalloc.h>
 #include <linux/secure_boot.h>
+#include <linux/trace_controls.h>
 #include <asm/asm-extable.h>
 #include <asm/machine.h>
 #include <asm/diag.h>
diff --git a/arch/s390/kernel/machine_kexec.c b/arch/s390/kernel/machine_kexec.c
index baeb3dcfc1c8..33f9a89eb3ad 100644
--- a/arch/s390/kernel/machine_kexec.c
+++ b/arch/s390/kernel/machine_kexec.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/reboot.h>
 #include <linux/ftrace.h>
+#include <linux/trace_controls.h>
 #include <linux/debug_locks.h>
 #include <linux/cpufeature.h>
 #include <asm/guarded_storage.h>
diff --git a/drivers/gpu/drm/i915/i915_gem.h b/drivers/gpu/drm/i915/i915_gem.h
index 80d9758fe684..5ec2ac13a5f0 100644
--- a/drivers/gpu/drm/i915/i915_gem.h
+++ b/drivers/gpu/drm/i915/i915_gem.h
@@ -116,6 +116,7 @@ int i915_gem_open(struct drm_i915_private *i915, struct drm_file *file);
 #endif
 
 #if IS_ENABLED(CONFIG_DRM_I915_TRACE_GEM)
+#include <linux/trace_controls.h>
 #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
 #define GEM_TRACE_ERR(...) do {						\
 	pr_err(__VA_ARGS__);						\
diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index f4571d05b496..eb85e6b97f18 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -324,6 +324,7 @@ static const struct sysrq_key_op sysrq_showstate_blocked_op = {
 };
 
 #ifdef CONFIG_TRACING
+#include <linux/trace_controls.h>
 #include <linux/ftrace.h>
 
 static void sysrq_ftrace_dump(u8 key)
diff --git a/include/linux/trace_controls.h b/include/linux/trace_controls.h
new file mode 100644
index 000000000000..995b97e963b4
--- /dev/null
+++ b/include/linux/trace_controls.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_TRACE_CONTROLS_H
+#define _LINUX_TRACE_CONTROLS_H
+
+
+/*
+ * General tracing related utility functions - trace_printk(),
+ * tracing_on/tracing_off and tracing_start()/tracing_stop
+ *
+ * Use tracing_on/tracing_off when you want to quickly turn on or off
+ * tracing. It simply enables or disables the recording of the trace events.
+ * This also corresponds to the user space /sys/kernel/tracing/tracing_on
+ * file, which gives a means for the kernel and userspace to interact.
+ * Place a tracing_off() in the kernel where you want tracing to end.
+ * From user space, examine the trace, and then echo 1 > tracing_on
+ * to continue tracing.
+ *
+ * tracing_stop/tracing_start has slightly more overhead. It is used
+ * by things like suspend to ram where disabling the recording of the
+ * trace is not enough, but tracing must actually stop because things
+ * like calling smp_processor_id() may crash the system.
+ *
+ * Most likely, you want to use tracing_on/tracing_off.
+ */
+enum ftrace_dump_mode {
+	DUMP_NONE,
+	DUMP_ALL,
+	DUMP_ORIG,
+	DUMP_PARAM,
+};
+
+#ifdef CONFIG_TRACING
+void tracing_on(void);
+void tracing_off(void);
+int tracing_is_on(void);
+void tracing_snapshot(void);
+void tracing_snapshot_alloc(void);
+void tracing_start(void);
+void tracing_stop(void);
+void trace_dump_stack(int skip);
+void ftrace_dump(enum ftrace_dump_mode oops_dump_mode);
+#else
+static inline void tracing_start(void) { }
+static inline void tracing_stop(void) { }
+static inline void tracing_on(void) { }
+static inline void tracing_off(void) { }
+static inline int tracing_is_on(void) { return 0; }
+static inline void tracing_snapshot(void) { }
+static inline void tracing_snapshot_alloc(void) { }
+static inline void trace_dump_stack(int skip) { }
+static inline void ftrace_dump(enum ftrace_dump_mode oops_dump_mode) { }
+#endif
+
+#endif /* _LINUX_TRACE_CONTROLS_H */
diff --git a/include/linux/trace_printk.h b/include/linux/trace_printk.h
index 3d54f440dccf..a488ea9e9f85 100644
--- a/include/linux/trace_printk.h
+++ b/include/linux/trace_printk.h
@@ -7,43 +7,7 @@
 #include <linux/stddef.h>
 #include <linux/stringify.h>
 
-/*
- * General tracing related utility functions - trace_printk(),
- * tracing_on/tracing_off and tracing_start()/tracing_stop
- *
- * Use tracing_on/tracing_off when you want to quickly turn on or off
- * tracing. It simply enables or disables the recording of the trace events.
- * This also corresponds to the user space /sys/kernel/tracing/tracing_on
- * file, which gives a means for the kernel and userspace to interact.
- * Place a tracing_off() in the kernel where you want tracing to end.
- * From user space, examine the trace, and then echo 1 > tracing_on
- * to continue tracing.
- *
- * tracing_stop/tracing_start has slightly more overhead. It is used
- * by things like suspend to ram where disabling the recording of the
- * trace is not enough, but tracing must actually stop because things
- * like calling smp_processor_id() may crash the system.
- *
- * Most likely, you want to use tracing_on/tracing_off.
- */
-
-enum ftrace_dump_mode {
-	DUMP_NONE,
-	DUMP_ALL,
-	DUMP_ORIG,
-	DUMP_PARAM,
-};
-
 #ifdef CONFIG_TRACING
-void tracing_on(void);
-void tracing_off(void);
-int tracing_is_on(void);
-void tracing_snapshot(void);
-void tracing_snapshot_alloc(void);
-
-extern void tracing_start(void);
-extern void tracing_stop(void);
-
 static inline __printf(1, 2)
 void ____trace_printk_check_format(const char *fmt, ...)
 {
@@ -149,8 +113,6 @@ int __trace_printk(unsigned long ip, const char *fmt, ...);
 extern int __trace_bputs(unsigned long ip, const char *str);
 extern int __trace_puts(unsigned long ip, const char *str);
 
-extern void trace_dump_stack(int skip);
-
 /*
  * The double __builtin_constant_p is because gcc will give us an error
  * if we try to allocate the static variable to fmt if it is not a
@@ -173,19 +135,7 @@ __ftrace_vbprintk(unsigned long ip, const char *fmt, va_list ap);
 
 extern __printf(2, 0) int
 __ftrace_vprintk(unsigned long ip, const char *fmt, va_list ap);
-
-extern void ftrace_dump(enum ftrace_dump_mode oops_dump_mode);
 #else
-static inline void tracing_start(void) { }
-static inline void tracing_stop(void) { }
-static inline void trace_dump_stack(int skip) { }
-
-static inline void tracing_on(void) { }
-static inline void tracing_off(void) { }
-static inline int tracing_is_on(void) { return 0; }
-static inline void tracing_snapshot(void) { }
-static inline void tracing_snapshot_alloc(void) { }
-
 static inline __printf(1, 2)
 int trace_printk(const char *fmt, ...)
 {
@@ -196,7 +146,6 @@ ftrace_vprintk(const char *fmt, va_list ap)
 {
 	return 0;
 }
-static inline void ftrace_dump(enum ftrace_dump_mode oops_dump_mode) { }
 #endif /* CONFIG_TRACING */
 
 #endif
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 1c9bc705c32c..342a3c1f202f 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -27,6 +27,7 @@
 
 #define pr_fmt(fmt) "KGDB: " fmt
 
+#include <linux/trace_controls.h>
 #include <linux/pid_namespace.h>
 #include <linux/clocksource.h>
 #include <linux/serial_core.h>
diff --git a/kernel/panic.c b/kernel/panic.c
index 91e48d33b7db..39376f270a9a 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -9,6 +9,7 @@
  * This function is used through-out the kernel (including mm and fs)
  * to indicate a major problem.
  */
+#include <linux/trace_controls.h>
 #include <linux/debug_locks.h>
 #include <linux/sched/debug.h>
 #include <linux/interrupt.h>
diff --git a/kernel/rcu/rcu.h b/kernel/rcu/rcu.h
index d60444bf3a02..e5583337b2f7 100644
--- a/kernel/rcu/rcu.h
+++ b/kernel/rcu/rcu.h
@@ -12,6 +12,7 @@
 
 #include <linux/slab.h>
 #include <trace/events/rcu.h>
+#include <linux/trace_controls.h>
 
 /*
  * Grace-period counter management.
diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 93ca7f06371e..c2b2baa50aa3 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -39,6 +39,7 @@
 #include <linux/srcu.h>
 #include <linux/slab.h>
 #include <linux/trace_clock.h>
+#include <linux/trace_controls.h>
 #include <asm/byteorder.h>
 #include <linux/torture.h>
 #include <linux/vmalloc.h>
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 1fec567e789e..2efb580d7a15 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -22,6 +22,7 @@
 #include <linux/ctype.h>
 #include <linux/once_lite.h>
 #include <linux/ftrace_regs.h>
+#include <linux/trace_controls.h>
 #include <linux/llist.h>
 
 #include "pid_list.h"
diff --git a/kernel/trace/trace_benchmark.c b/kernel/trace/trace_benchmark.c
index e19c32f2a938..69cc39008c36 100644
--- a/kernel/trace/trace_benchmark.c
+++ b/kernel/trace/trace_benchmark.c
@@ -3,6 +3,7 @@
 #include <linux/module.h>
 #include <linux/kthread.h>
 #include <linux/trace_clock.h>
+#include <linux/trace_controls.h>
 
 #define CREATE_TRACE_POINTS
 #include "trace_benchmark.h"
diff --git a/lib/sys_info.c b/lib/sys_info.c
index f32a06ec9ed4..e3c9ca05601b 100644
--- a/lib/sys_info.c
+++ b/lib/sys_info.c
@@ -8,6 +8,7 @@
 #include <linux/ftrace.h>
 #include <linux/nmi.h>
 #include <linux/sched/debug.h>
+#include <linux/trace_controls.h>
 #include <linux/string.h>
 #include <linux/sysctl.h>
 
-- 
2.53.0
