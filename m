Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451494;
	b=WFq6kWUhliqxDxyyBlS3946Xhh2vySVFiPI6f2QclROiC/bcw0jUbk8m8k2V4Fp9wFW2
	 ZJy+/zNGV83krdTZ8tP0GdnGfzQIdRjCHDbk7a49P6EAdhdgsO/FwpnQgNf3uE54p1D4Q
	 R0l+W/G1ltxlPpGN7VBCIskLcvDPqqCDwHVtYVxw+600q+JE/ToRZTk1jsZRLgrGGC8mf
	 8kBGhSdo7cX6vyILhmM54JQagN1kw1BF4qgpd+7JWlbImZc6gLXW1UNPWMmiC/ireafgr
	 aX2Jc4VrVSf+5at1O7AM5THHGKjjQWuflwk6Qbhe0m86M/NQevcB8Ky+n0L8X/7PTig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451494;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=DxnbPIhU4sDA4neH8cD/WEhfAnHIOjfVHGtlQj27qUk=;
	b=XICFhJ4cYHkxABhAoJNUF5ls/xrWZZU+aRIfJmOgccDwHBA26POboLVaAxlXZ9bIxhPA
	 w3Q5c5z020LoTKsRuX3qGO9zThx+eqp8w1p/lxisUzqIhqLk+8F0d4/hdNpnfxOTeQMe4
	 NVENywq6yoaUtSJNOzMl10JML9Bpq2FAMhjP+siVhgvkjoErIw1sv6q7ciLqeo3YNiVn+
	 rLZHwIPAyT4ZSUWLeVYaPSUxrlRllKz72PVM/7GBuF7QZw/j40jcBojB7DFc9lKwu2XV8
	 9Kk6Quq9ZKwWOgP4KBexQRDm0nKrtkQvNkD4dpjVABSUWpvVt3HwOLUdISMih3KV+Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=iIH94OWr;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=pbdWK9lt;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE9B606A31A;
	Mon, 23 Nov 2026 16:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAE9B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=iIH94OWr;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=pbdWK9lt
Date: Mon, 23 Nov 2026 16:31:27 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795451489;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DxnbPIhU4sDA4neH8cD/WEhfAnHIOjfVHGtlQj27qUk=;
	b=iIH94OWrGHNvNf1ijq4hS1PmCXXpCHs+1FsZqYH7I023HSlBQvNYNnheoPI7C2T7nga88d
	YRfamkC6E31XWDM8NXwsYXKNlpTDPj7EP5krj6cBJJWX56QUKDvL3K5fJcGmg5dIwrLF6Q
	coHJdldSquxHaaZt56kLNjL9TJ81v8dfU2k8R2Hq+YqPNQI5nrazgrSvqIv60crsxloIXi
	MvKoRSieL8n5GLCZprtKqG87rAaxLqUMMT0gsyHBs1nobb2WE9+s4VLVznWm9qXE4AE1K5
	9SVKT8ra/d7uNIs0bmfDihPqXnm4xar874SkQW/aXfA/1w52v1N3+GUB40gJXw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795451489;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DxnbPIhU4sDA4neH8cD/WEhfAnHIOjfVHGtlQj27qUk=;
	b=pbdWK9ltCj/e/kdToSozN2/cMjneaDPltpfQ2NOWY43oOndny+e8/esCpsI1QgUWaX4DrF
	OCburY5vG/aJosDA==
From: "tip-bot2 for Xin Li (Intel)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/entry] x86/cea: Prefix exception stack names with ESTACK_
Cc: "Xin Li (Intel)" <xin@zytor.com>, Sohil Mehta <sohil.mehta@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Binbin Wu <binbin.wu@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261120235025.2809042-2-sohil.mehta@intel.com>
References: <20261120235025.2809042-2-sohil.mehta@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179545148741.92412.5844266518161867015.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/entry branch of tip:

Commit-ID:     135dbd0519cf7f72af120801ec7dbb79275a362d
Gitweb:        https://git.kernel.org/tip/135dbd0519cf7f72af120801ec7dbb79275=
a362d
Author:        Xin Li (Intel) <xin@zytor.com>
AuthorDate:    Fri, 20 Nov 2026 15:50:24 -08:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Mon, 23 Nov 2026 08:23:40 -08:00

x86/cea: Prefix exception stack names with ESTACK_

Add the ESTACK_ prefix to the exception stack names to improve clarity
and readability. Without the prefix, names like DF, NMI, and DB are too
brief and potentially ambiguous.

This renaming also prepares for reaching the stacks by their enum
exception_stack_ordering value instead of by name.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Link: https://patch.msgid.link/20261120235025.2809042-2-sohil.mehta@intel.com
---
 arch/x86/coco/sev/noinstr.c           |  5 +++--
 arch/x86/coco/sev/vc-handle.c         |  3 ++-
 arch/x86/include/asm/cpu_entry_area.h | 26 +++++++++++++-------------
 arch/x86/kernel/cpu/common.c          | 10 +++++-----
 arch/x86/kernel/dumpstack_64.c        | 14 +++++++-------
 arch/x86/kernel/fred.c                |  6 +++---
 arch/x86/kernel/traps.c               |  2 +-
 arch/x86/mm/cpu_entry_area.c          | 12 ++++++------
 arch/x86/mm/fault.c                   |  2 +-
 9 files changed, 41 insertions(+), 39 deletions(-)

diff --git a/arch/x86/coco/sev/noinstr.c b/arch/x86/coco/sev/noinstr.c
index e1e03f1..8ff556d 100644
--- a/arch/x86/coco/sev/noinstr.c
+++ b/arch/x86/coco/sev/noinstr.c
@@ -31,7 +31,8 @@ static __always_inline bool on_vc_stack(struct pt_regs *reg=
s)
 	if (ip_within_syscall_gap(regs))
 		return false;
=20
-	return ((sp >=3D __this_cpu_ist_bottom_va(VC)) && (sp < __this_cpu_ist_top_=
va(VC)));
+	return ((sp >=3D __this_cpu_ist_bottom_va(ESTACK_VC)) &&
+		(sp <  __this_cpu_ist_top_va(ESTACK_VC)));
 }
=20
 /*
@@ -83,7 +84,7 @@ void noinstr __sev_es_ist_exit(void)
 	/* Read IST entry */
 	ist =3D __this_cpu_read(cpu_tss_rw.x86_tss.ist[IST_INDEX_VC]);
=20
-	if (WARN_ON(ist =3D=3D __this_cpu_ist_top_va(VC)))
+	if (WARN_ON(ist =3D=3D __this_cpu_ist_top_va(ESTACK_VC)))
 		return;
=20
 	/* Read back old IST entry and write it to the TSS */
diff --git a/arch/x86/coco/sev/vc-handle.c b/arch/x86/coco/sev/vc-handle.c
index f25d302..954df83 100644
--- a/arch/x86/coco/sev/vc-handle.c
+++ b/arch/x86/coco/sev/vc-handle.c
@@ -854,7 +854,8 @@ static enum es_result vc_handle_exitcode(struct es_em_ctx=
t *ctxt,
=20
 static __always_inline bool is_vc2_stack(unsigned long sp)
 {
-	return (sp >=3D __this_cpu_ist_bottom_va(VC2) && sp < __this_cpu_ist_top_va=
(VC2));
+	return (sp >=3D __this_cpu_ist_bottom_va(ESTACK_VC2) &&
+		sp <  __this_cpu_ist_top_va(ESTACK_VC2));
 }
=20
 static __always_inline bool vc_from_invalid_context(struct pt_regs *regs)
diff --git a/arch/x86/include/asm/cpu_entry_area.h b/arch/x86/include/asm/cpu=
_entry_area.h
index 462fc34..d0f884c 100644
--- a/arch/x86/include/asm/cpu_entry_area.h
+++ b/arch/x86/include/asm/cpu_entry_area.h
@@ -18,19 +18,19 @@
=20
 /* Macro to enforce the same ordering and stack sizes */
 #define ESTACKS_MEMBERS(guardsize, optional_stack_size)		\
-	char	DF_stack_guard[guardsize];			\
-	char	DF_stack[EXCEPTION_STKSZ];			\
-	char	NMI_stack_guard[guardsize];			\
-	char	NMI_stack[EXCEPTION_STKSZ];			\
-	char	DB_stack_guard[guardsize];			\
-	char	DB_stack[EXCEPTION_STKSZ];			\
-	char	MCE_stack_guard[guardsize];			\
-	char	MCE_stack[EXCEPTION_STKSZ];			\
-	char	VC_stack_guard[guardsize];			\
-	char	VC_stack[optional_stack_size];			\
-	char	VC2_stack_guard[guardsize];			\
-	char	VC2_stack[optional_stack_size];			\
-	char	IST_top_guard[guardsize];			\
+	char	ESTACK_DF_stack_guard[guardsize];		\
+	char	ESTACK_DF_stack[EXCEPTION_STKSZ];		\
+	char	ESTACK_NMI_stack_guard[guardsize];		\
+	char	ESTACK_NMI_stack[EXCEPTION_STKSZ];		\
+	char	ESTACK_DB_stack_guard[guardsize];		\
+	char	ESTACK_DB_stack[EXCEPTION_STKSZ];		\
+	char	ESTACK_MCE_stack_guard[guardsize];		\
+	char	ESTACK_MCE_stack[EXCEPTION_STKSZ];		\
+	char	ESTACK_VC_stack_guard[guardsize];		\
+	char	ESTACK_VC_stack[optional_stack_size];		\
+	char	ESTACK_VC2_stack_guard[guardsize];		\
+	char	ESTACK_VC2_stack[optional_stack_size];		\
+	char	ESTACK_IST_top_guard[guardsize];		\
=20
 /* The exception stacks' physical storage. No guard pages required */
 struct exception_stacks {
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 7e4eb70..b2a4138 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2380,12 +2380,12 @@ static inline void setup_getcpu(int cpu)
 static inline void tss_setup_ist(struct tss_struct *tss)
 {
 	/* Set up the per-CPU TSS IST stacks */
-	tss->x86_tss.ist[IST_INDEX_DF] =3D __this_cpu_ist_top_va(DF);
-	tss->x86_tss.ist[IST_INDEX_NMI] =3D __this_cpu_ist_top_va(NMI);
-	tss->x86_tss.ist[IST_INDEX_DB] =3D __this_cpu_ist_top_va(DB);
-	tss->x86_tss.ist[IST_INDEX_MCE] =3D __this_cpu_ist_top_va(MCE);
+	tss->x86_tss.ist[IST_INDEX_DF]	=3D __this_cpu_ist_top_va(ESTACK_DF);
+	tss->x86_tss.ist[IST_INDEX_NMI]	=3D __this_cpu_ist_top_va(ESTACK_NMI);
+	tss->x86_tss.ist[IST_INDEX_DB]	=3D __this_cpu_ist_top_va(ESTACK_DB);
+	tss->x86_tss.ist[IST_INDEX_MCE]	=3D __this_cpu_ist_top_va(ESTACK_MCE);
 	/* Only mapped when SEV-ES is active */
-	tss->x86_tss.ist[IST_INDEX_VC] =3D __this_cpu_ist_top_va(VC);
+	tss->x86_tss.ist[IST_INDEX_VC]	=3D __this_cpu_ist_top_va(ESTACK_VC);
 }
 #else /* CONFIG_X86_64 */
 static inline void tss_setup_ist(struct tss_struct *tss) { }
diff --git a/arch/x86/kernel/dumpstack_64.c b/arch/x86/kernel/dumpstack_64.c
index 6c5defd..40f51e2 100644
--- a/arch/x86/kernel/dumpstack_64.c
+++ b/arch/x86/kernel/dumpstack_64.c
@@ -73,7 +73,7 @@ struct estack_pages {
 	 PFN_DOWN(CEA_ESTACK_OFFS(st) + CEA_ESTACK_SIZE(st) - 1)] =3D {	\
 		.offs	=3D CEA_ESTACK_OFFS(st),				\
 		.size	=3D CEA_ESTACK_SIZE(st),				\
-		.type	=3D STACK_TYPE_EXCEPTION + ESTACK_ ##st, }
+		.type	=3D STACK_TYPE_EXCEPTION + st, }
=20
 /*
  * Array of exception stack page descriptors. If the stack is larger than
@@ -83,12 +83,12 @@ struct estack_pages {
  */
 static const
 struct estack_pages estack_pages[CEA_ESTACK_PAGES] ____cacheline_aligned =3D=
 {
-	EPAGERANGE(DF),
-	EPAGERANGE(NMI),
-	EPAGERANGE(DB),
-	EPAGERANGE(MCE),
-	EPAGERANGE(VC),
-	EPAGERANGE(VC2),
+	EPAGERANGE(ESTACK_DF),
+	EPAGERANGE(ESTACK_NMI),
+	EPAGERANGE(ESTACK_DB),
+	EPAGERANGE(ESTACK_MCE),
+	EPAGERANGE(ESTACK_VC),
+	EPAGERANGE(ESTACK_VC2),
 };
=20
 static __always_inline bool in_exception_stack(unsigned long *stack, struct =
stack_info *info)
diff --git a/arch/x86/kernel/fred.c b/arch/x86/kernel/fred.c
index 117aa06..1c452a3 100644
--- a/arch/x86/kernel/fred.c
+++ b/arch/x86/kernel/fred.c
@@ -84,7 +84,7 @@ void cpu_init_fred_rsps(void)
 	       FRED_STKLVL(X86_TRAP_DF,  FRED_DF_STACK_LEVEL));
=20
 	/* The FRED equivalents to IST stacks... */
-	wrmsrq(MSR_IA32_FRED_RSP1, __this_cpu_ist_top_va(DB));
-	wrmsrq(MSR_IA32_FRED_RSP2, __this_cpu_ist_top_va(NMI));
-	wrmsrq(MSR_IA32_FRED_RSP3, __this_cpu_ist_top_va(DF));
+	wrmsrq(MSR_IA32_FRED_RSP1, __this_cpu_ist_top_va(ESTACK_DB));
+	wrmsrq(MSR_IA32_FRED_RSP2, __this_cpu_ist_top_va(ESTACK_NMI));
+	wrmsrq(MSR_IA32_FRED_RSP3, __this_cpu_ist_top_va(ESTACK_DF));
 }
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 30aa836..8afd607 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -1075,7 +1075,7 @@ asmlinkage __visible noinstr struct pt_regs *vc_switch_=
off_ist(struct pt_regs *r
=20
 	if (!get_stack_info_noinstr(stack, current, &info) || info.type =3D=3D STAC=
K_TYPE_ENTRY ||
 	    info.type > STACK_TYPE_EXCEPTION_LAST)
-		sp =3D __this_cpu_ist_top_va(VC2);
+		sp =3D __this_cpu_ist_top_va(ESTACK_VC2);
=20
 sync:
 	/*
diff --git a/arch/x86/mm/cpu_entry_area.c b/arch/x86/mm/cpu_entry_area.c
index 575f863..9fa371a 100644
--- a/arch/x86/mm/cpu_entry_area.c
+++ b/arch/x86/mm/cpu_entry_area.c
@@ -151,15 +151,15 @@ static void __init percpu_setup_exception_stacks(unsign=
ed int cpu)
 	 * by guard pages so each stack must be mapped separately. DB2 is
 	 * not mapped; it just exists to catch triple nesting of #DB.
 	 */
-	cea_map_stack(DF);
-	cea_map_stack(NMI);
-	cea_map_stack(DB);
-	cea_map_stack(MCE);
+	cea_map_stack(ESTACK_DF);
+	cea_map_stack(ESTACK_NMI);
+	cea_map_stack(ESTACK_DB);
+	cea_map_stack(ESTACK_MCE);
=20
 	if (IS_ENABLED(CONFIG_AMD_MEM_ENCRYPT)) {
 		if (cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT)) {
-			cea_map_stack(VC);
-			cea_map_stack(VC2);
+			cea_map_stack(ESTACK_VC);
+			cea_map_stack(ESTACK_VC2);
 		}
 	}
 }
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index aa88370..37f9729 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -677,7 +677,7 @@ page_fault_oops(struct pt_regs *regs, unsigned long error=
_code,
 		 * and then double-fault, though, because we're likely to
 		 * break the console driver and lose most of the stack dump.
 		 */
-		call_on_stack(__this_cpu_ist_top_va(DF) - sizeof(void*),
+		call_on_stack(__this_cpu_ist_top_va(ESTACK_DF) - sizeof(void *),
 			      handle_stack_overflow,
 			      ASM_CALL_ARG3,
 			      , [arg1] "r" (regs), [arg2] "r" (address), [arg3] "r" (&info));
