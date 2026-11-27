Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810471;
	b=zLTPGyHBd5FjI20nMqcWd82egEpxzGaZwBbk+qoc09NzOPW1kcZjSUIBFlVPNpzVoTOT
	 0NJMcTFS57o4nZTNXdL6hX8fkoo0xbgkTowAYraxtHk7E+YPnZUgWZossVEyNrjWtQ7RP
	 8siHpGCmRLRFbMieZoOHL+kv+SThNPUHpEKVWWLsPG3cDa174jYD5CLNZOd8N5lr76e4H
	 Vk3Z2r8NxEr1pv+sZATGgCHQnzxx4X0pUcONzamzHdOxXWsm/UHHyy6wYxwfq/HGbwNox
	 xG9DL0cgJ3u0j8snQ3xfTsLpYay9pXdE3dL5Ih84gc2Ac8sDAfsiKsF8IpkBb95p49A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810471;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=VtVT1PL9qtLAI0wGHd4Yx/5bH0OWaunX/DrQioCum8E=;
	b=Lv+Mfj0ZV8FNoouYrunckPEdGNZ1cGlEtl7HzDDsjGYurfOOkAlU4Z2hL+aKnO4Ke4c2
	 QgLTVcK9n2rINN5O1NcV+3dUuapB/Vh9eWeXtHdGhXGHJB1gPS0rWM38P3pKNha+icf2X
	 MjbLDIAHznjO0F4oCcJB2jzLy2lD/4VGdNJPuQkv+neH/yCETRBRgTmO0nP5yiIuWjYgh
	 pQ6cQpUnaQohbVC+Ab9CWZyhqopPQQRD4nxzFFeMG3Gpm14iS5xFnBus9NCbVi/PTf2Sf
	 DKxFBRnmTM1c2zkoJ5+c0dsRC5cfafVkM8F2BRbK82RyRrklq5j0fsia9tC3oM9IP5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UZK9JJHT;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF26606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BF26606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UZK9JJHT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795810469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VtVT1PL9qtLAI0wGHd4Yx/5bH0OWaunX/DrQioCum8E=;
	b=UZK9JJHT0vsSVBoLQ6IWpnvp7NHpqCYt5K7sokRI7sdHcCP7lpLru2sQCROkI+6nK/3jMP
	ioJoJg5EdJjK89C7ot08mHUrHi5/LkoP5cssqXJpg1Kw7YW2UaOzo7v+d9z3/LWYSF8k/B
	k3f53I83wZgOl7yFsk6xZRKYzfUZDyA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-489-Q0nnnHUINhmQaUSRqNdDvg-1; Fri,
 27 Nov 2026 20:14:26 +0000
X-MC-Unique: Q0nnnHUINhmQaUSRqNdDvg-1
X-Mimecast-MFC-AGG-ID: Q0nnnHUINhmQaUSRqNdDvg_1795810462
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0F9541944AA5;
	Fri, 27 Nov 2026 20:14:22 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BF428436;
	Fri, 27 Nov 2026 20:14:12 +0000 (UTC)
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
Subject: [PATCH v10 09/10] x86/mm/pti: Drive kernel_cr3_loaded
Date: Fri, 27 Nov 2026 21:12:20 +0100
Message-ID: <20261127201221.434876-10-vschneid@redhat.com>
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

This per-CPU variable needs to be updated before the actual CR3 write, IOW
it always immediately precedes it:

  KERNEL_CR3_LOADED := 1
  SWITCH_TO_KERNEL_CR3
  [...]
  KERNEL_CR3_LOADED := 0
  SWITCH_TO_USER_CR3

NMI reentry considerations
==========================

NMIs are cheeky and can occur e.g. after @kernel_cr3_loaded has been updated
but before the actual CR3 has been switched. This requires some extra care when
exiting the NMI to *not* restore @kernel_cr3_loaded to its userland value.

That part is implemented by abusing bit #60 of the CR3 which is reserved;
it itself is never written to in the actual CR3, but is fiddled in its
register copy.

Per the Intel SDM:

```Volume 3, Chapter 5.1.4 Enumeration of Paging Features by CPUID
This width is referred to as MAXPHYADDR. MAXPHYADDR is at most 52.
```

```Volume 3, Chapter 5.5.2 Use of CR3 with Ordinary 4-Level Paging and 5-Level Paging
| Bit position | Contents                                                                               |
|--------------+----------------------------------------------------------------------------------------|
|         11:0 | PCID                                                                                   |
|       M-1:12 | Physical address of the 4-KByte aligned PML4 table used for linear-address translation |
|         60:M | Reserved (must be 0)                                                                   |
|           61 | Enables LAM57 for user pointers; Section 4.4.3                                         |
|           62 | Enables LAM48 for user pointers; ignored if bit 61 is set                              |
|           63 | Reserved (must be 0)                                                                   |
```

unconditional update
=====================

This will only be really useful for NOHZ_FULL CPUs, but it should be
cheaper to unconditionally update a never-used per-CPU variable living in
its own cacheline than to check a shared cpumask such as
  housekeeping_cpumask(HK_TYPE_KERNEL_NOISE)
at every entry.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/Kconfig                            | 14 ++++
 arch/x86/entry/calling.h                    | 71 +++++++++++++++++++++
 arch/x86/include/uapi/asm/processor-flags.h |  3 +
 kernel/sched/isolation.c                    |  9 ++-
 4 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec5ecacb..cc8bc8a47b0f4 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2163,6 +2163,20 @@ config ADDRESS_MASKING
 	  The capability can be used for efficient address sanitizers (ASAN)
 	  implementation and for optimizations in JITs.
 
+config TRACK_CR3
+       def_bool n
+       prompt "Track which CR3 is in use"
+       depends on X86_64 && MITIGATION_PAGE_TABLE_ISOLATION && NO_HZ_FULL
+       help
+	 This option adds a software signal that allows checking remotely
+	 whether a CPU is using the user or the kernel page table.
+
+	 This allows further optimizations for NOHZ_FULL CPUs.
+
+	 This obviously makes the user<->kernel transition overhead even worse.
+
+	 If unsure, say N.
+
 config HOTPLUG_CPU
 	def_bool y
 	depends on SMP
diff --git a/arch/x86/entry/calling.h b/arch/x86/entry/calling.h
index 77e2d920a6407..e28e41a011394 100644
--- a/arch/x86/entry/calling.h
+++ b/arch/x86/entry/calling.h
@@ -9,6 +9,8 @@
 #include <asm/ptrace-abi.h>
 #include <asm/msr.h>
 #include <asm/nospec-branch.h>
+#include <asm/jump_label.h>
+#include <asm/pti.h>
 
 /*
 
@@ -170,9 +172,74 @@ For 32-bit we have the following conventions - kernel is built with
 	andq    $(~PTI_USER_PGTABLE_AND_PCID_MASK), \reg
 .endm
 
+.macro TRACK_CR3_KERNEL_ENTRY
+#ifdef CONFIG_TRACK_CR3
+	STATIC_BRANCH_FALSE_LIKELY housekeeping_overridden, .Lend_\@
+	orl $KERNEL_CR3_IN_KERNEL, PER_CPU_VAR(kernel_cr3_loaded)
+.Lend_\@:
+#endif // CONFIG_TRACK_CR3
+.endm
+
+.macro TRACK_CR3_KERNEL_EXIT
+#ifdef CONFIG_TRACK_CR3
+	STATIC_BRANCH_FALSE_LIKELY housekeeping_overridden, .Lend_\@
+	movl $KERNEL_CR3_IN_USER, PER_CPU_VAR(kernel_cr3_loaded)
+.Lend_\@:
+#endif // CONFIG_TRACK_CR3
+.endm
+
+.macro PARANOID_TRACK_CR3_KERNEL_ENTRY scratch_reg:req save_reg:req
+#ifdef CONFIG_TRACK_CR3
+	STATIC_BRANCH_FALSE_LIKELY housekeeping_overridden, .Lend_\@
+
+	/*
+	 * Due to FSGSBASE hilarity, we don't have a viable GS to rely on to
+	 * do a classic percpu access here.
+	 * Instead, fetch the percpu address via the CEA.
+	 */
+	subq $10, %rsp
+	sgdt (%rsp)
+	movq 2(%rsp), \scratch_reg /* GDT address */
+	addq $10, %rsp
+
+	/*
+	 * We may have just interrupted another entry that has set
+	 * $KERNEL_CR3_IN_KERNEL, but hasn't written to CR3 yet.
+	 * Abuse \save_reg to remember that at exit and to leave
+	 * @kernel_cr3_loaded as it was.
+	 */
+	testl $KERNEL_CR3_IN_KERNEL, CPU_ENTRY_AREA_kernel_cr3(\scratch_reg)
+	jz .Ltrack_\@
+	bts $X86_CR3_REENTRY_BIT, \save_reg
+	jmp .Lend_restore_\@
+.Ltrack_\@:
+	movl $KERNEL_CR3_IN_KERNEL, CPU_ENTRY_AREA_kernel_cr3(\scratch_reg)
+.Lend_restore_\@:
+	/* CEA hackery done; restore @scratch_reg */
+	mov \save_reg, \scratch_reg
+	btr $X86_CR3_REENTRY_BIT, \scratch_reg
+.Lend_\@:
+#endif // CONFIG_TRACK_CR3
+.endm
+
+.macro PARANOID_TRACK_CR3_KERNEL_EXIT save_reg:req
+#ifdef CONFIG_TRACK_CR3
+	STATIC_BRANCH_FALSE_LIKELY housekeeping_overridden, .Lend_\@
+	/*
+	 * If we entered with @kernel_cr3_loaded already written to, leave it
+	 * as is.
+	 */
+	btr $X86_CR3_REENTRY_BIT, \save_reg
+	jc .Lend_\@
+	movl $KERNEL_CR3_IN_USER, PER_CPU_VAR(kernel_cr3_loaded)
+.Lend_\@:
+#endif // CONFIG_TRACK_CR3
+.endm
+
 .macro SWITCH_TO_KERNEL_CR3 scratch_reg:req
 	ALTERNATIVE "jmp .Lend_\@", "", X86_FEATURE_PTI
 	mov	%cr3, \scratch_reg
+	TRACK_CR3_KERNEL_ENTRY
 	ADJUST_KERNEL_CR3 \scratch_reg
 	mov	\scratch_reg, %cr3
 .Lend_\@:
@@ -182,6 +249,7 @@ For 32-bit we have the following conventions - kernel is built with
 	PER_CPU_VAR(cpu_tlbstate + TLB_STATE_user_pcid_flush_mask)
 
 .macro SWITCH_TO_USER_CR3 scratch_reg:req scratch_reg2:req
+	TRACK_CR3_KERNEL_EXIT
 	mov	%cr3, \scratch_reg
 
 	ALTERNATIVE "jmp .Lwrcr3_\@", "", X86_FEATURE_PCID
@@ -239,6 +307,7 @@ For 32-bit we have the following conventions - kernel is built with
 	bt	$PTI_USER_PGTABLE_BIT, \scratch_reg
 	jnc	.Ldone_\@
 
+	PARANOID_TRACK_CR3_KERNEL_ENTRY \scratch_reg \save_reg
 	ADJUST_KERNEL_CR3 \scratch_reg
 	movq	\scratch_reg, %cr3
 
@@ -257,6 +326,8 @@ For 32-bit we have the following conventions - kernel is built with
 	bt	$PTI_USER_PGTABLE_BIT, \save_reg
 	jnc	.Lend_\@
 
+	PARANOID_TRACK_CR3_KERNEL_EXIT \save_reg
+
 	ALTERNATIVE "jmp .Lwrcr3_\@", "", X86_FEATURE_PCID
 
 	/*
diff --git a/arch/x86/include/uapi/asm/processor-flags.h b/arch/x86/include/uapi/asm/processor-flags.h
index 81d0c8bf11377..279c745db7cf1 100644
--- a/arch/x86/include/uapi/asm/processor-flags.h
+++ b/arch/x86/include/uapi/asm/processor-flags.h
@@ -82,6 +82,9 @@
 #define X86_CR3_PCID_BITS	12
 #define X86_CR3_PCID_MASK	(_AC((1UL << X86_CR3_PCID_BITS) - 1, UL))
 
+#define X86_CR3_REENTRY_BIT 60 /* NOT a CPU flag, but a pure software abuse of the CR3 layout */
+#define X86_CR3_REENTRY    _BITULL(X86_CR3_REENTRY_BIT)
+
 #define X86_CR3_LAM_U57_BIT	61 /* Activate LAM for userspace, 62:57 bits masked */
 #define X86_CR3_LAM_U57		_BITULL(X86_CR3_LAM_U57_BIT)
 #define X86_CR3_LAM_U48_BIT	62 /* Activate LAM for userspace, 62:48 bits masked */
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 156025ef81b75..90640c9e7f811 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -19,7 +19,14 @@ enum hk_flags {
 	HK_FLAG_KERNEL_NOISE	= BIT(HK_TYPE_KERNEL_NOISE),
 };
 
-DEFINE_STATIC_KEY_FALSE(housekeeping_overridden);
+/*
+ * This key is accessed in early entry code to drive the CPU isolation IPI
+ * quiescing mechanism. This happens before a serializing instruction has been
+ * executed in the entry path. This is acceptable as a stale value will only be
+ * observed during transient CPU isolation states, and the updated value will be
+ * acted upon at the next kernel exit.
+ */
+DEFINE_STATIC_KEY_FALSE_ENTRY(housekeeping_overridden);
 EXPORT_SYMBOL_GPL(housekeeping_overridden);
 
 struct housekeeping {
-- 
2.56.1

