Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587387;
	b=hk9m4wtvEWppIG+XOxaS6mgqIQptgZ14hus9VLtBq4eEVGOamA+oWGYqtcFqfd+ZsI/j
	 1GYQQaQsUP1EhOEvxZXsC1a468nJmtWrp5kXSZWnQJi8q0MVFjngWzLe/kt7ZgW1wTczq
	 f17nv8YTp05j7qZiGSAPtegFkKJ7HJLXTV89OfoDYIFQAwChaCNNqANrhZqBaCaanDubt
	 4BrNbX+bLoinhp4AiT0HTu6YMLTLPSlxzSXHiR0dYMpsi7npsZ6jARpyhfAr3nAbrwjQ3
	 8zpSGMkpCEgYgGT8Xmw1k9g/G9Xoh8U6q3sg31qFxxZqh2kkmzlKrPlAngau3/PrTQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=AdyfYbqQ/HNRByTzpopFuDR8r0ryyJKSQ/AYqA2vA7w=;
	b=vefrtVqtg6ZxU7fyZyHq+KPAMIepNlQdvQPEIaG0mrrRm0WlrCrXZAid1dOw+GD0XEW8
	 SOInsGd9Myr7Pv1vw4BPTOGXb64hoEw0IzsucSICzNBNam+Aliwa2YlYX1SsoLssH7GOF
	 PCqHZS9fa15WPx8U1mlbyc+7HoiNif2vFhqxLMqMkYYTabilTSX4f/0JLm375AYjjByZf
	 /pBhb2aWoKRnFDJZJqQZUHftZ8Rgh9GoQHdr8YpdRZPilGeIQnj62rCxxBKPUzf0O7ODW
	 7SLYwm2B6J9XRY+5OCzJ9ueImii+u48Eab1nH8VbZusPluHWUUF6CmyR6Jm2+8SjqMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="jEtwpb/R";
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00736070A10
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A00736070A10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jEtwpb/R
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c55ba309c2so6158680b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587386; x=1796192186; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdyfYbqQ/HNRByTzpopFuDR8r0ryyJKSQ/AYqA2vA7w=;
        b=jEtwpb/RQktYzLUJVB3ug70jiI0/DW7o3ME7DBtEbYGZ+oj2kxKVnGexaOC060gZs0
         xDROSnnSnktgWD8o1wWNhTlomoH0rx8kMvAYpB4vC+BHAyn+8vZM1KYYx07MU++MZV2x
         QYRJLZAgrYEXU6GdGTaYypWW6bzGcuzZ0tO+dkq4lW+VrSyWSBRt7FHyl0di2jFqlJWj
         kK1+zkSY6yKwD7SMGIxeulkiXLnxCbsIibNbOQ46tOCp2cTUBdl+8yV2HogizElUCcSO
         g6VIn74dhEP4VABfSraxL1lcdpsxRfLRZL61Y9NoKPUvKSYyOlWgoQ91uwKte2Ttausp
         bFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587386; x=1796192186;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AdyfYbqQ/HNRByTzpopFuDR8r0ryyJKSQ/AYqA2vA7w=;
        b=1OqExgHnbLwSjlYhK3csp8thKhQMQRfbuxxjM9nKxyBz6zOIHRHupT4BNbmq2uE+wU
         jXdYUWMGnGjjFnOBUlyeHq+o6vTj8+CGakhU8xKlYRobDY9nuwotrOlva1V6UcUQXpp/
         bI9lCrexJEUjPL569GwBSjSTE/pRp23vTu4iUBtvEgBJqXqJRjjNgKLMcTdLeCgs3li8
         89U+klgQpLKXzQmUKa845zwtjOvhCelWC2wr3nGuXnTNaH29Q1sEzzIWQ/CXiTvRqCF5
         TSpHX3tSHTJeqafySMVjnHkpF8WP8f6j5e43nK1gvhEZ11Ej0uhdSSx1B2oeRqEhsx8g
         Ea7w==
X-Gm-Message-State: APuU4Z+agMc8B0JRoBkFk7rnkVpvBCR47QXA++Hwy7RbXBOP/0SX9yPG
	eCoLY3FQtOqKBRtwh8lBEoeuusOtkOYQvMeUnA6dkSmSlwUOAL2XzdEpIcklBYBdCen70YHzUMw
	Me8iTS9Txv0Y/diphdSFONTvq8nTUeBJrGINrh1cgl5QFVZyCLb7C6+AJszhoWlzCqAyVTjV/rY
	flpCobi9CgJr6he/fv9MATifxw5H7rJvx6p/2ncBEzoe+gLFzX9w==
X-Received: from oix3-n1.prod.google.com ([2002:a05:6808:a543:10b0:56d:7b0c:945f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:2208:b0:4d6:92b3:5c8d
 with SMTP id 5614622812f47-57a0dd479f9mr21031753b6e.67.1795587385204; Tue, 24
 Nov 2026 22:16:25 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:07 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-15-irogers@google.com>
Subject: [RFC PATCH v2 14/30] arm64: unwind_user: Support Minimal DWARF CFI
 and FP user unwinding
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Wire up CONFIG_HAVE_UNWIND_USER_CFI and CONFIG_HAVE_UNWIND_USER_FP on
arm64 by providing arch/arm64/include/asm/unwind_user.h and
unwind_user_sigreturn():

 - Populate DWARF CFI register mappings for both 64-bit AArch64
   (ws=8, sp=31, fp=29, lr=30) and 32-bit AArch32 compat tasks
   (ws=4, sp=13, fp=11, lr=14).
 - Expose the user frame pointer (x29 / compat_fp) and link register
   (x30 / compat_lr) via unwind_user_frame_pointer() and
   unwind_user_link_register(), and override unwind_user_fp_sets_sp() to
   return false because AArch64 frame records live at the bottom of the
   callee's stack frame rather than at caller_sp - 16.
 - Implement unwind_user_sigreturn() in arch/arm64/kernel/signal.c to
   recover pc, sp, x29, and x30 directly from rt_sigframe.uc.uc_mcontext
   at __kernel_rt_sigreturn when state->sp_valid is true (falling back
   to user->next_frame via FP otherwise), preserving interrupted leaf
   functions and SA_ONSTACK alternate signal stacks.
 - Strip user-space pointer authentication codes via
   ptrauth_strip_user_insn_pac() (and clear Thumb bit 0 for compat user
   tasks) in unwind_user_strip_pac(), and define ARCH_INIT_USER_FP_FRAME
   for both 64-bit AArch64 PCS frame records and 32-bit AArch32
   compat_frame_tail layouts.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 arch/arm64/Kconfig                   |   2 +
 arch/arm64/include/asm/unwind_user.h | 145 +++++++++++++++++++++++++++
 arch/arm64/kernel/signal.c           |  55 ++++++++++
 3 files changed, 202 insertions(+)
 create mode 100644 arch/arm64/include/asm/unwind_user.h

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index ee0f263f477d..918d7e278f7d 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -228,6 +228,8 @@ config ARM64
 	select HAVE_STACKPROTECTOR
 	select HAVE_STATIC_CALL if CFI
 	select HAVE_SYSCALL_TRACEPOINTS
+	select HAVE_UNWIND_USER_CFI
+	select HAVE_UNWIND_USER_FP
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
diff --git a/arch/arm64/include/asm/unwind_user.h b/arch/arm64/include/asm/unwind_user.h
new file mode 100644
index 000000000000..919fbc406747
--- /dev/null
+++ b/arch/arm64/include/asm/unwind_user.h
@@ -0,0 +1,145 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_ARM64_UNWIND_USER_H
+#define __ASM_ARM64_UNWIND_USER_H
+
+#ifdef CONFIG_UNWIND_USER
+
+#include <linux/sched.h>
+#include <linux/sched/task_stack.h>
+#include <linux/unwind_dwarf_cfi.h>
+#include <linux/unwind_user_types.h>
+#include <asm/compiler.h>
+#include <asm/ptrace.h>
+
+/**
+ * unwind_user_word_size() - Return the user-space word size in bytes on arm64
+ * @regs: User-mode register state.
+ *
+ * Return: 4 for AArch32 compat user mode, or 8 for AArch64 user mode.
+ */
+static inline int unwind_user_word_size(struct pt_regs *regs)
+{
+	return compat_user_mode(regs) ? 4 : 8;
+}
+
+/**
+ * unwind_user_frame_pointer() - Fetch the user frame pointer from @regs
+ * @regs: User-mode register state.
+ *
+ * Return: r11 (compat_fp) for AArch32 compat tasks, or x29 for AArch64 tasks.
+ */
+static inline unsigned long unwind_user_frame_pointer(struct pt_regs *regs)
+{
+	return compat_user_mode(regs) ? regs->compat_fp : frame_pointer(regs);
+}
+
+#define unwind_user_frame_pointer unwind_user_frame_pointer
+
+/**
+ * unwind_user_fp_sets_sp() - Indicate ARM64 FP records do not recover caller SP
+ *
+ * AArch64 PCS places {x29, x30} at the bottom of the callee's frame rather than
+ * adjacent to the caller's stack pointer, so FP unwinding only yields a lower
+ * bound on the caller's SP.
+ *
+ * Return: Always false on arm64.
+ */
+static inline bool unwind_user_fp_sets_sp(void)
+{
+	return false;
+}
+
+#define unwind_user_fp_sets_sp unwind_user_fp_sets_sp
+
+/**
+ * unwind_user_link_register() - Fetch the user link register from @regs
+ * @regs: User-mode register state.
+ * @ra: Output link register value (r14 for AArch32 compat, x30 for AArch64).
+ *
+ * Return: Always true on arm64 because a link register is architecturally
+ * present in both AArch64 and AArch32 execution states.
+ */
+static inline bool unwind_user_link_register(struct pt_regs *regs,
+					     unsigned long *ra)
+{
+	if (compat_user_mode(regs))
+		*ra = regs->compat_lr;
+	else
+		*ra = procedure_link_pointer(regs);
+	return true;
+}
+
+#define unwind_user_link_register unwind_user_link_register
+
+/**
+ * unwind_user_strip_pac() - Normalize user return address on arm64
+ * @ip: Recovered user return address.
+ * @ra_signed: Whether CFI marked the return address as PAC-signed (unused;
+ *             arm64 strips user instruction PAC bits unconditionally via the
+ *             task's configured pointer authentication mask).
+ *
+ * Return: @ip with Thumb bit 0 cleared for AArch32 compat tasks, or @ip with
+ * user instruction PAC bits stripped for AArch64 tasks.
+ */
+static inline unsigned long unwind_user_strip_pac(unsigned long ip,
+						  bool ra_signed)
+{
+	if (IS_ENABLED(CONFIG_COMPAT) &&
+	    compat_user_mode(task_pt_regs(current)))
+		return ip & ~1UL;
+	return ptrauth_strip_user_insn_pac(ip);
+}
+
+#define unwind_user_strip_pac unwind_user_strip_pac
+
+/**
+ * unwind_user_cfi_arch() - Populate AArch64/AArch32 DWARF register numbers
+ * @ws: User word size in bytes (8 for AArch64, 4 for AArch32 compat).
+ * @arch: Output DWARF CFI architecture descriptor.
+ *
+ * Return: true if @ws is 4 or 8, false otherwise.
+ */
+static inline bool unwind_user_cfi_arch(unsigned int ws,
+					struct dwarf_cfi_arch *arch)
+{
+	if (ws == 8) {
+		*arch = (struct dwarf_cfi_arch){
+			.ws	= 8,
+			.sp_reg	= 31,	/* sp */
+			.fp_reg	= 29,	/* x29 */
+			.ra_reg	= 30,	/* x30 (lr) */
+		};
+		return true;
+	}
+	if (ws == 4) {
+		*arch = (struct dwarf_cfi_arch){
+			.ws	= 4,
+			.sp_reg	= 13,	/* r13 (sp) */
+			.fp_reg	= 11,	/* r11 (fp) */
+			.ra_reg	= 14,	/* r14 (lr) */
+		};
+		return true;
+	}
+	return false;
+}
+
+bool unwind_user_sigreturn(struct unwind_user_state *state);
+#define unwind_user_sigreturn unwind_user_sigreturn
+
+#endif /* CONFIG_UNWIND_USER */
+
+#ifdef CONFIG_HAVE_UNWIND_USER_FP
+
+/*
+ * AArch64 PCS stores {fp, lr} at [fp, fp + 16), while 32-bit AArch32 compat
+ * APCS stores struct compat_frame_tail {fp, sp, lr} at [compat_fp - 12, compat_fp).
+ */
+#define ARCH_INIT_USER_FP_FRAME(ws)			\
+	.cfa_off	= (ws) == 8 ? 2 * (ws) : 0,	\
+	.ra_off		= -1 * (ws),			\
+	.fp_off		= (ws) == 8 ? -2 * (ws) : -3 * (ws), \
+	.use_fp		= true,
+
+#endif /* CONFIG_HAVE_UNWIND_USER_FP */
+
+#endif /* __ASM_ARM64_UNWIND_USER_H */
diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 80398ac83c3b..1cc4f3992e1a 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -21,6 +21,7 @@
 #include <linux/rseq.h>
 #include <linux/syscalls.h>
 #include <linux/pkeys.h>
+#include <linux/unwind_user.h>
 
 #include <asm/daifflags.h>
 #include <asm/debug-monitors.h>
@@ -1705,6 +1706,60 @@ void __init minsigstksz_setup(void)
 		16; /* max alignment padding */
 }
 
+#ifdef CONFIG_UNWIND_USER
+/**
+ * unwind_user_sigreturn() - Unwind an AArch64 vDSO rt_sigreturn signal frame
+ * @state: Current user unwind state.
+ *
+ * __kernel_rt_sigreturn intentionally omits .eh_frame directives in the arm64
+ * vDSO so libgcc uses its sigcontext fallback path, and the synthetic
+ * user->next_frame FP record skips the interrupted PC. Recover the interrupted
+ * PC, SP, x29, and x30 directly from &rt_sigframe.uc.uc_mcontext so leaf
+ * functions, -fomit-frame-pointer code, and alternate signal stacks unwind
+ * accurately.
+ *
+ * Return: true if @state was at __kernel_rt_sigreturn and advanced to the
+ * interrupted user context, false otherwise.
+ */
+bool unwind_user_sigreturn(struct unwind_user_state *state)
+{
+	struct mm_struct *mm = current->mm;
+	struct rt_sigframe __user *sf;
+	unsigned long sigtramp;
+	u64 fp_lr[2], sp_pc[2];
+
+	if (!mm || state->ws != 8 || !state->sp_valid || !mm->context.vdso)
+		return false;
+
+	sigtramp = (unsigned long)VDSO_SYMBOL(mm->context.vdso, sigtramp);
+	if (state->ip != sigtramp &&
+	    !(state->topmost && state->ip == sigtramp + 4))
+		return false;
+
+	if (state->sp & 0xfUL)
+		return false;
+
+	sf = (struct rt_sigframe __user *)state->sp;
+	if (copy_from_user(fp_lr, &sf->uc.uc_mcontext.regs[29], sizeof(fp_lr)) ||
+	    copy_from_user(sp_pc, &sf->uc.uc_mcontext.sp, sizeof(sp_pc)))
+		return false;
+
+	sp_pc[1] = ptrauth_strip_user_insn_pac(sp_pc[1]);
+	if ((sp_pc[0] & 7ULL) || !sp_pc[1])
+		return false;
+
+	state->fp = fp_lr[0];
+	state->ra = ptrauth_strip_user_insn_pac(fp_lr[1]);
+	state->sp = sp_pc[0];
+	state->ip = sp_pc[1];
+	state->ra_valid = true;
+	state->sp_valid = true;
+	state->signal = true;
+	state->topmost = false;
+	return true;
+}
+#endif
+
 /*
  * Compile-time assertions for siginfo_t offsets. Check NSIG* as well, as
  * changes likely come with new fields that should be added below.
-- 
2.56.1.831.g720f3f5937-goog

