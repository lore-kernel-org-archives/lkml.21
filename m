Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810483;
	b=bZOVOG9+R87mgghEaXKf83CpZWkzL55aFaPnoGpfHECLfbs3TsltetJgiJsUu+28ptHw
	 sLyRyVtOWDbBbIV76nX9QhipL2AQbYrYIGzCt3c1dVEgE3HxFHwVmw9Tow68dJHhuDYpv
	 Vnb1r9/kVx6VCOpB4h6rRvO0VmLfxO9p63iXIYt4AFnIFoX4tuM39cE4XfFMlkip61poR
	 apomrCM0Sq3cYgulx16Rd4ltdyqjKqkuEw107e8Mk6lkh3Drim5t8ENhxj6ogzbSlVQnF
	 04k8Q61LFLyEOZRJq2Clxl4hPrc2MywxMXPliD+y2czR/8dusK/fCPmbDHQnaVKCGTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810483;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=UAs3m0+hmOGS9KUATaDf0cRtbK0/lffklyzWvZCuBu4=;
	b=i9jqsPmQeSQVulK3NolaHS06Cnjd68/eA+VIj+KQY2/gxPn2WIRdu31IKWi+nei1r43M
	 LiRnBKiMLar/Erffa4NhbFposso39+LIuu8uuj63oFxJ1dmxxC3lVwk1T2iI2l0CpkcMV
	 y9O/Y1wLlciu1YE+n21ESmwNtNv6MEzAeKPGz+rgFaSBFlqRD1XMrgtlBRTH0lX79qrx7
	 DbIxOyHXzk7SdcMarwqgPvYhGz0vj5Voi8cRK1/FpkSZono/RgAIdpfdQ/rFL0hwfmRfC
	 eWVcVaml4xv08VkMONAkIrkvzkbw23SLDqz6Pgwpm84fDmKZIManZbRn31ff2yF9VHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hZJOpbl0;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCAE606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CCAE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hZJOpbl0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795810481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UAs3m0+hmOGS9KUATaDf0cRtbK0/lffklyzWvZCuBu4=;
	b=hZJOpbl0XSS4tJkcA7FEkUjI8rkfqFezRmLxtAnNBMBmOtgrHAkmdj8uEgfDod5JS5+CZX
	SkcTfe1tx5TKhc2pqchau/2sRFvTjFXSKgtUvVepe+VkSYuWfJagkFD3qfpGP8aKWTgXic
	xEepbD1Hr1KnEQVeYYExYDzdBi+mdSE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-MpJrS3IPM6OR1U2olx6NDQ-1; Fri,
 27 Nov 2026 20:14:36 +0000
X-MC-Unique: MpJrS3IPM6OR1U2olx6NDQ-1
X-Mimecast-MFC-AGG-ID: MpJrS3IPM6OR1U2olx6NDQ_1795810472
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 417D81800361;
	Fri, 27 Nov 2026 20:14:32 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6C08D5B1;
	Fri, 27 Nov 2026 20:14:22 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>,
	Rik van Riel <riel@surriel.com>,
	Jann Horn <jannh@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Daniel Wagner <dwagner@suse.de>,
	Petr Tesarik <ptesarik@suse.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Dan Beimborn <Dan.Beimborn@qube-rt.com>,
	"Pak Hung Vincent Chiu" <pak-hung.chiu@qube-rt.com>
Subject: [PATCH v10 10/10] context_tracking,x86: Quiesce kernel text patching IPIs when tracking CR3 switches
Date: Fri, 27 Nov 2026 21:12:21 +0100
Message-ID: <20261127201221.434876-11-vschneid@redhat.com>
In-Reply-To: <20261127201221.434876-1-vschneid@redhat.com>
References: <20261127201221.434876-1-vschneid@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

text_poke_bp_batch() sends IPIs to all online CPUs to synchronize
them vs the newly patched instruction. CPUs that are executing in userspace
do not need this synchronization to happen immediately, and this is
actually harmful interference for NOHZ_FULL CPUs.

As the synchronization IPIs are sent using a blocking call, returning from
text_poke_bp_batch() implies all CPUs will observe the patched
instruction(s), and this should be preserved even if the IPI is quiesced.
In other words, to safely postpone this synchronization, any kernel
instruction leading to the execution of the postponed instruction
sync must *not* be mutable (patchable) at runtime.

This means we must pay attention to mutable instructions in the early entry
code:
- alternatives
- static keys
- static calls
- all sorts of probes (kprobes/ftrace/bpf/???)

The early entry code is noinstr, which gets rid of the probes.

Alternatives are safe, because it's boot-time patching (before SMP is
even brought up) which is before any IPI quiescing can happen.

This leaves us with static keys and static calls. Any static key used in
early entry code should be only forever-enabled at boot time, IOW
__ro_after_init (pretty much like alternatives). Exceptions to that will
now be caught by objtool.

The postponed instruction sync is the CR3 RMW done as part of
kPTI when switching to the kernel page table:

  SDM vol2 chapter 4.3 - Move to/from control registers:
  ```
  MOV CR* instructions, except for MOV CR8, are serializing instructions.
  ```

Leverage the new kernel_cr3_loaded signal and the kPTI CR3 RMW to quiesce
sync_core() IPIs targeting NOHZ_FULL CPUs.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/include/asm/text-patching.h |  5 +++
 arch/x86/kernel/alternative.c        | 59 +++++++++++++++++++++++++---
 arch/x86/kernel/kprobes/core.c       |  4 +-
 arch/x86/kernel/kprobes/opt.c        |  4 +-
 arch/x86/kernel/module.c             |  2 +-
 include/asm-generic/sections.h       | 14 +++++++
 6 files changed, 77 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index ea09381070e82..25dc52f423cc0 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -33,6 +33,11 @@ extern void text_poke_apply_relocation(u8 *buf, const u8 * const instr, size_t i
  */
 extern void *text_poke(void *addr, const void *opcode, size_t len);
 extern void smp_text_poke_sync_each_cpu(void);
+#ifdef CONFIG_TRACK_CR3
+extern void smp_text_poke_sync_each_cpu_quiescable(void);
+#else
+#define smp_text_poke_sync_each_cpu_quiescable smp_text_poke_sync_each_cpu
+#endif
 extern void *text_poke_kgdb(void *addr, const void *opcode, size_t len);
 extern void *text_poke_copy(void *addr, const void *opcode, size_t len);
 #define text_poke_copy text_poke_copy
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 582c6d8307d15..283c94394c0b9 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -9,6 +9,7 @@
 #include <linux/cleanup.h>
 #include <linux/kgdb.h>
 #include <linux/mmap_lock.h>
+#include <linux/sched/isolation.h>
 
 #include <asm/text-patching.h>
 #include <asm/insn.h>
@@ -16,6 +17,7 @@
 #include <asm/ibt.h>
 #include <asm/set_memory.h>
 #include <asm/nmi.h>
+#include <asm/tlbflush.h>
 
 int __read_mostly alternatives_patched;
 
@@ -2636,11 +2638,46 @@ static void do_sync_core(void *info)
 	sync_core();
 }
 
+static void __smp_text_poke_sync_each_cpu(smp_cond_func_t cond_func)
+{
+	on_each_cpu_cond(cond_func, do_sync_core, NULL, 1);
+}
+
 void smp_text_poke_sync_each_cpu(void)
 {
-	on_each_cpu(do_sync_core, NULL, 1);
+	__smp_text_poke_sync_each_cpu(NULL);
 }
 
+#ifdef CONFIG_TRACK_CR3
+/*
+ * This returns true if the IPI must be sent to @cpu;
+ *
+ * do that if @cpu is a housekeeping CPU, or if it is already executing
+ * in kernelspace.
+ */
+static bool kernel_cr3_poke_quiesce_cond(int cpu, void *info)
+{
+	if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
+		return true;
+
+	return atomic_read(&per_cpu(kernel_cr3_loaded, cpu)) & KERNEL_CR3_IN_KERNEL;
+}
+
+void smp_text_poke_sync_each_cpu_quiescable(void)
+{
+	/*
+	 * Pairs with the MOV CR3 serializing instruction in SWITCH_TO_KERNEL_CR3
+	 *
+	 * Ensures any previous operations are visible on a remote CPU
+	 * entering the kernel and updating CR3, if this one decides to quiesce
+	 * the IPI.
+	 */
+	smp_mb();
+
+	__smp_text_poke_sync_each_cpu(kernel_cr3_poke_quiesce_cond);
+}
+#endif
+
 /*
  * NOTE: crazy scheme to allow patching Jcc.d32 but not increase the size of
  * this thing. When len == 6 everything is prefixed with 0x0f and we map
@@ -2808,6 +2845,7 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
  */
 void smp_text_poke_batch_finish(void)
 {
+	void (*sync_fn)(void) = smp_text_poke_sync_each_cpu_quiescable;
 	unsigned char int3 = INT3_INSN_OPCODE;
 	unsigned int i;
 	int do_sync;
@@ -2844,11 +2882,20 @@ void smp_text_poke_batch_finish(void)
 	 * First step: add a INT3 trap to the address that will be patched.
 	 */
 	for (i = 0; i < text_poke_array.nr_entries; i++) {
-		text_poke_array.vec[i].old = *(u8 *)text_poke_addr(&text_poke_array.vec[i]);
-		text_poke(text_poke_addr(&text_poke_array.vec[i]), &int3, INT3_INSN_SIZE);
+		void *addr = text_poke_addr(&text_poke_array.vec[i]);
+
+		/*
+		 * There's no safe way to defer IPIs for patching text in
+		 * entry, record whether there is at least one such poke.
+		 */
+		if (is_kernel_entrytext((unsigned long)addr))
+			sync_fn = smp_text_poke_sync_each_cpu;
+
+		text_poke_array.vec[i].old = *((u8 *)addr);
+		text_poke(addr, &int3, INT3_INSN_SIZE);
 	}
 
-	smp_text_poke_sync_each_cpu();
+	sync_fn();
 
 	/*
 	 * Second step: update all but the first byte of the patched range.
@@ -2910,7 +2957,7 @@ void smp_text_poke_batch_finish(void)
 		 * not necessary and we'd be safe even without it. But
 		 * better safe than sorry (plus there's not only Intel).
 		 */
-		smp_text_poke_sync_each_cpu();
+		sync_fn();
 	}
 
 	/*
@@ -2931,7 +2978,7 @@ void smp_text_poke_batch_finish(void)
 	}
 
 	if (do_sync)
-		smp_text_poke_sync_each_cpu();
+		sync_fn();
 
 	/*
 	 * Remove and wait for refs to be zero.
diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
index 133ff20caccd4..84cbc92853259 100644
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -785,7 +785,7 @@ void arch_arm_kprobe(struct kprobe *p)
 	u8 int3 = INT3_INSN_OPCODE;
 
 	text_poke(p->addr, &int3, 1);
-	smp_text_poke_sync_each_cpu();
+	smp_text_poke_sync_each_cpu_quiescable();
 	perf_event_text_poke(p->addr, &p->opcode, 1, &int3, 1);
 }
 
@@ -795,7 +795,7 @@ void arch_disarm_kprobe(struct kprobe *p)
 
 	perf_event_text_poke(p->addr, &int3, 1, &p->opcode, 1);
 	text_poke(p->addr, &p->opcode, 1);
-	smp_text_poke_sync_each_cpu();
+	smp_text_poke_sync_each_cpu_quiescable();
 }
 
 void arch_remove_kprobe(struct kprobe *p)
diff --git a/arch/x86/kernel/kprobes/opt.c b/arch/x86/kernel/kprobes/opt.c
index 3f8fea52619f9..87979b93e1dd0 100644
--- a/arch/x86/kernel/kprobes/opt.c
+++ b/arch/x86/kernel/kprobes/opt.c
@@ -508,11 +508,11 @@ void arch_unoptimize_kprobe(struct optimized_kprobe *op)
 	       JMP32_INSN_SIZE - INT3_INSN_SIZE);
 
 	text_poke(addr, new, INT3_INSN_SIZE);
-	smp_text_poke_sync_each_cpu();
+	smp_text_poke_sync_each_cpu_quiescable();
 	text_poke(addr + INT3_INSN_SIZE,
 		  new + INT3_INSN_SIZE,
 		  JMP32_INSN_SIZE - INT3_INSN_SIZE);
-	smp_text_poke_sync_each_cpu();
+	smp_text_poke_sync_each_cpu_quiescable();
 
 	perf_event_text_poke(op->kp.addr, old, JMP32_INSN_SIZE, new, JMP32_INSN_SIZE);
 }
diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index 33080ad889b71..ce8acafc932ed 100644
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -194,7 +194,7 @@ static int write_relocate_add(Elf64_Shdr *sechdrs,
 				   write, apply);
 
 	if (!early) {
-		smp_text_poke_sync_each_cpu();
+		smp_text_poke_sync_each_cpu_quiescable();
 		mutex_unlock(&text_mutex);
 	}
 
diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
index 0755bc39b0d80..7496d26a85a4c 100644
--- a/include/asm-generic/sections.h
+++ b/include/asm-generic/sections.h
@@ -199,6 +199,20 @@ static inline bool is_kernel_inittext(unsigned long addr)
 	       addr < (unsigned long)_einittext;
 }
 
+/**
+ * is_kernel_entrytext - checks if the pointer address is located in the
+ *                      .entry.text section
+ *
+ * @addr: address to check
+ *
+ * Returns: true if the address is located in .entry.text, false otherwise.
+ */
+static inline bool is_kernel_entrytext(unsigned long addr)
+{
+	return addr >= (unsigned long)__entry_text_start &&
+	       addr < (unsigned long)__entry_text_end;
+}
+
 /**
  * __is_kernel_text - checks if the pointer address is located in the
  *                    .text section
-- 
2.56.1

