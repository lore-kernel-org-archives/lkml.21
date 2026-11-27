Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810464;
	b=Q3U1XWwJ7Zhacr5FWBky7JSi4Z0fNz0mGqvIl+KRD/J1LZo99gk0r25YYAraWM9VjfAJ
	 osIqS5vz6QZS09mP0SSpzhb7K8hu1opvaVdrg7lZCll2LD0K93XXQRWfLKncCwGbzZPcy
	 q/QOBtvl9f1CiIRtsMIgm1Lm8v80Mt23zeTkjQic1xeCr4xdu4Xia8hvoMcgkFkK6D7Z7
	 aevrlJUt2db4FzvBtCvEK5ISnulh79jvN66o0ku8ATGTijOqs9QBERd9mNEIWMjx/1sEp
	 11fp5Zlyuj3JiaioFK2W2F4o3lV+mht7ne2caFv6i+mLkpCndEoslGwfnn6z6HgSv9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810464;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=2OzrTCLFRXHQ5G5PcwdIRVZPS7FUL7CLCrYOZTtcWGo=;
	b=ZZcZptGS3QUp3CQ6uqMv3Hs+JG0i0A0NqEiRyGpisQHVSVbcuyVsrwzrSIZlZAlZ54f/
	 WFJChX9I5wQDEXVkNMgbDo5Nt2BGdK6zgGjzRTDRrpuZcHXPh6I5C72AtjNJoKdgl/0H6
	 oWvps84wqzydRT2jzLJAgwMUbQMTjS+mO3OzxvDXo41yXAMv7fB9mkzl6d9+uKsN1DxSl
	 8FBJpBZQt+QheEnsc0iBpLegcxLSN+NDt+8VU+DNr3y5SZKmwk3b0qE//YdCDcc6CFfqK
	 T93NSodta3Gt9g6O8Jv0ps7eUHWMqC5rQxpC9fEroaExwBshooirnxJAVL9oWzawIOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H6HNp5ce;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1F5606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F1F5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H6HNp5ce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795810462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2OzrTCLFRXHQ5G5PcwdIRVZPS7FUL7CLCrYOZTtcWGo=;
	b=H6HNp5ceC09DmoHeNL0MjnWe2dqcrEdoIheGursxix15SZ3RdX9Iy2CHc8b2Jjdxn2/iKE
	YKSfgTNFAVZ9+8rLDD5b6MC1olZCpdpHyfYF++rNGvhBgmdtqCgE6BjRVKS0GBSSidHMe4
	t3sISsu/irLj6BDv9n954f5JSlEU7dU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-652-kVyebHtEN6SvC2uM12T_1Q-1; Fri,
 27 Nov 2026 20:14:17 +0000
X-MC-Unique: kVyebHtEN6SvC2uM12T_1Q-1
X-Mimecast-MFC-AGG-ID: kVyebHtEN6SvC2uM12T_1Q_1795810452
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 639931800556;
	Fri, 27 Nov 2026 20:14:12 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B4BB7436;
	Fri, 27 Nov 2026 20:14:02 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
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
Subject: [PATCH v10 08/10] x86/mm/pti: Introduce kernel_cr3_loaded
Date: Fri, 27 Nov 2026 21:12:19 +0100
Message-ID: <20261127201221.434876-9-vschneid@redhat.com>
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

Later commits will rely on being able to check whether a remote CPU is
using the kernel or the user CR3.

Add a per-cpu variable that will be updated right before switching to the
kernel CR3.

Note that this only adds the backing data, a later commit will drive the
updates.

pcpu access in early entry
==========================

The variable is accessed through two different ways:

1) The general case where swapgs has already been executed, and the usual
   gs-based per-cpu offset is usable. This requires mapping the variable in
   the userspace visible pages, since CR3 hasn't been switched to the
   kernel CR3 yet.
2) The paranoid case where swapgs has *not* be executed, in which case
   a CEA alias is used.

security concerns
=================

That variable does not contain any exploitable data, and being in the
.data..percpu..aligned section it occupies a whole page - that is, as long
as it is not the last variable in that section. AFAICT the last one is
always @entry_stack_storage (which by itself is a whole page), although I'm
not sure if that's a happy accident or if it is actually enforced somehow?

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/include/asm/cpu_entry_area.h |  4 +++
 arch/x86/include/asm/pti.h            | 11 ++++++++
 arch/x86/kernel/asm-offsets.c         |  3 ++
 arch/x86/mm/cpu_entry_area.c          |  5 ++++
 arch/x86/mm/pti.c                     | 40 +++++++++++++++++++--------
 5 files changed, 51 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/cpu_entry_area.h b/arch/x86/include/asm/cpu_entry_area.h
index 462fc34f13176..e321fd7f50d2b 100644
--- a/arch/x86/include/asm/cpu_entry_area.h
+++ b/arch/x86/include/asm/cpu_entry_area.h
@@ -127,6 +127,10 @@ struct cpu_entry_area {
 	 * Reserve enough fixmap PTEs.
 	 */
 	struct debug_store_buffers cpu_debug_buffers;
+
+#ifdef CONFIG_TRACK_CR3
+	atomic_t kernel_cr3_loaded __aligned(PAGE_SIZE);
+#endif
 };
 
 #define CPU_ENTRY_AREA_SIZE		(sizeof(struct cpu_entry_area))
diff --git a/arch/x86/include/asm/pti.h b/arch/x86/include/asm/pti.h
index 88d0a1ab1f77e..142b2d225c5eb 100644
--- a/arch/x86/include/asm/pti.h
+++ b/arch/x86/include/asm/pti.h
@@ -1,12 +1,23 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _ASM_X86_PTI_H
 #define _ASM_X86_PTI_H
+
+#ifdef CONFIG_TRACK_CR3
+#define KERNEL_CR3_IN_USER 0
+#define KERNEL_CR3_IN_KERNEL 1
+#endif
+
 #ifndef __ASSEMBLER__
 
 #ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
 extern void pti_init(void);
 extern void pti_check_boottime_disable(void);
 extern void pti_finalize(void);
+
+#ifdef CONFIG_TRACK_CR3
+DECLARE_PER_CPU_PAGE_ALIGNED(atomic_t, kernel_cr3_loaded);
+#endif
+
 #else
 static inline void pti_check_boottime_disable(void) { }
 #endif
diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index 081816888f7a0..5ba8d5b791e1f 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -117,6 +117,9 @@ static void __used common(void)
 	OFFSET(CPU_ENTRY_AREA_entry_stack, cpu_entry_area, entry_stack_page);
 	DEFINE(SIZEOF_entry_stack, sizeof(struct entry_stack));
 	DEFINE(MASK_entry_stack, (~(sizeof(struct entry_stack) - 1)));
+#ifdef CONFIG_TRACK_CR3
+	OFFSET(CPU_ENTRY_AREA_kernel_cr3, cpu_entry_area, kernel_cr3_loaded);
+#endif
 
 	/* Offset for fields in tss_struct */
 	OFFSET(TSS_sp0, tss_struct, x86_tss.sp0);
diff --git a/arch/x86/mm/cpu_entry_area.c b/arch/x86/mm/cpu_entry_area.c
index 575f863f3c75e..a8c3381432a57 100644
--- a/arch/x86/mm/cpu_entry_area.c
+++ b/arch/x86/mm/cpu_entry_area.c
@@ -202,6 +202,11 @@ static void __init setup_cpu_entry_area(unsigned int cpu)
 			     per_cpu_ptr(&entry_stack_storage, cpu), 1,
 			     PAGE_KERNEL);
 
+#ifdef CONFIG_TRACK_CR3
+	cea_map_percpu_pages(&cea->kernel_cr3_loaded,
+			     per_cpu_ptr(&kernel_cr3_loaded, cpu), 1,
+			     PAGE_KERNEL);
+#endif
 	/*
 	 * The Intel SDM says (Volume 3, 7.2.1):
 	 *
diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
index 598f553cc8713..69c03acceb1de 100644
--- a/arch/x86/mm/pti.c
+++ b/arch/x86/mm/pti.c
@@ -446,6 +446,22 @@ static void __init pti_clone_p4d(unsigned long addr)
 	*user_p4d = *kernel_p4d;
 }
 
+static void __init pti_clone_percpu(unsigned long va)
+{
+		phys_addr_t pa = per_cpu_ptr_to_phys((void *)va);
+		pte_t *target_pte;
+
+		target_pte = pti_user_pagetable_walk_pte(va, false);
+		if (WARN_ON(!target_pte))
+			return;
+
+		*target_pte = pfn_pte(pa >> PAGE_SHIFT, PAGE_KERNEL);
+}
+
+#ifdef CONFIG_TRACK_CR3
+DEFINE_PER_CPU_PAGE_ALIGNED(atomic_t, kernel_cr3_loaded) = ATOMIC_INIT(KERNEL_CR3_IN_KERNEL);
+#endif
+
 /*
  * Clone the CPU_ENTRY_AREA and associated data into the user space visible
  * page table.
@@ -456,25 +472,25 @@ static void __init pti_clone_user_shared(void)
 
 	pti_clone_p4d(CPU_ENTRY_AREA_BASE);
 
+	/*
+	 * This is done for all possible CPUs during boot to ensure that it's
+	 * propagated to all mms.
+	 */
 	for_each_possible_cpu(cpu) {
 		/*
 		 * The SYSCALL64 entry code needs one word of scratch space
 		 * in which to spill a register.  It lives in the sp2 slot
 		 * of the CPU's TSS.
-		 *
-		 * This is done for all possible CPUs during boot to ensure
-		 * that it's propagated to all mms.
 		 */
+		pti_clone_percpu((unsigned long)&per_cpu(cpu_tss_rw, cpu));
 
-		unsigned long va = (unsigned long)&per_cpu(cpu_tss_rw, cpu);
-		phys_addr_t pa = per_cpu_ptr_to_phys((void *)va);
-		pte_t *target_pte;
-
-		target_pte = pti_user_pagetable_walk_pte(va, false);
-		if (WARN_ON(!target_pte))
-			return;
-
-		*target_pte = pfn_pte(pa >> PAGE_SHIFT, PAGE_KERNEL);
+#ifdef CONFIG_TRACK_CR3
+		/*
+		 * The entry code needs access to the @kernel_cr3_loaded percpu
+		 * variable before the kernel CR3 is loaded.
+		 */
+		pti_clone_percpu((unsigned long)&per_cpu(kernel_cr3_loaded, cpu));
+#endif
 	}
 }
 
-- 
2.56.1

