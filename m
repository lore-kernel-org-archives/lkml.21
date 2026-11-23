Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795407238;
	b=jRWQf+P27cnCxvFnMhuim4gTi8FlzKNpIrEvPLNpd3lyVL56AUKmCUuK7gw/PqzRopUM
	 OAdWSCSxMF/zxvOCctnOqIoVemaEOu62OngMf7lMiIo2isVhhRSGCh4fluHdbH3Qk0POU
	 kLPryZpBh+HItnBcYO6c/NI6Q7do3imlfd77LCymW6MeqsUw2hO4a1ElFJ7S2RNW0to26
	 M1Vwn5xTy6YmlZWq3V4LTQZHZMkYT2cSHz+fyKMr2vrKJUDkuL7oxdtF8RKNVSHDtjhbF
	 u81gTc8OurBUghKgnW+JrmxBTmVWiRjRzR0DUQm1Jt5I81dgo28NhLv5CfQsGrWi61Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795407238;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:MIME-Version:Message-ID:Robot-ID:Robot-Unsubscribe:
	 Precedence:Content-Type:Content-Transfer-Encoding;
	bh=7xIM2mR8FNeidxSfQ/YCxHs22kcFEEb+JDqR4SR/ZWg=;
	b=nyGDQqltYiFDfpGT5ujpx4HfbwrhbUq6sSyF8EECIa1kUE037eP0uGfiaUfzdJyQ+Hrc
	 1HgQiaGMGxTCPwpJNnefSiU7zxcHn3riUhH9qnd3NPDpDo/EDIKF5MldU6VFQCpnIyrsx
	 entx5/5OISb/8N/rTgmAI2b8Wm+3wOwya7zfvGLDmjR+I/8DvxvW0s9Fe8Mi6f9UHJC6t
	 BdfiXzBrRTZQacKpnbbH45u9kHNk9IdHMl4fOQ6vIzZFL/3FKPcP8oMTDTRSf4cuGDeUc
	 usq67wzOPbZv9XxYrijRz//8J1lhFV4ZmlmuDb5wEXVTZwPLMh/jXZPaWhZ77roFtWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="pGktV/+x";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MLid2z5k;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D899B606A31A;
	Mon, 23 Nov 2026 04:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D899B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pGktV/+x;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MLid2z5k
Date: Mon, 23 Nov 2026 04:13:53 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795407235;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=7xIM2mR8FNeidxSfQ/YCxHs22kcFEEb+JDqR4SR/ZWg=;
	b=pGktV/+xdRNnqAULMOZOyUFPN3EmALfLwW+e5fEj+ybAGj8c9cmoAl7kY72OO0wR9Ysf9w
	TgWBDcX5K/BgBZ29RzQ73N3sEwYOLcZp+lEbkmoKvSoQHnAG1OWx2utLothmgo5cGEM3rs
	JFwvr3DPGg3YQ2WSDAzune/x8XBVrDMnUgA0uut/2Cd4cUeQnpZtqdOK+vVnCxQGLDh/pe
	c17NlWkjoYuEAXwHJZAzypAuds0QPyevDbxH+f7VdPEqLeIn8lnqCOryUyx7xVkmZnatl0
	sg8EELAHeCDrTRirHm8GK3n3wNem+n108qEpDR21r1IIIzcHmblN/M1aiaAySQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795407235;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=7xIM2mR8FNeidxSfQ/YCxHs22kcFEEb+JDqR4SR/ZWg=;
	b=MLid2z5k/dyC1Lrm1YyZ36W1LCvxBKnXPf3OKnPbjLYs/ZHal6alwwJ/p2KGFKw5UIjm4X
	VkA2QRUbh67CUpCg==
From: "tip-bot2 for Atish Patra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] x86/entry: Make SafeRET robust also against NMIs
Cc: Atish Patra <atishp@meta.com>, Thomas Gleixner <tglx@kernel.org>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,  <stable@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179540723375.92412.1041661720569219328.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     86d477c009ed7f3a24b420b7f4aa314fabe36be3
Gitweb:        https://git.kernel.org/tip/86d477c009ed7f3a24b420b7f4aa314fabe=
36be3
Author:        Atish Patra <atishp@meta.com>
AuthorDate:    Wed, 18 Nov 2026 19:19:17 -08:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Sun, 22 Nov 2026 19:39:15 -08:00

x86/entry: Make SafeRET robust also against NMIs

On NMI entry, the kernel copies three exception frames which are used in
crazy ways in order to be able to handle nested NMIs.

However, when that handler interrupts a SafeRET sequence of a #VC
exception, it would copy the SafeRET-unfixed rSP and rIP into those
frames.

paranoid_entry() later will fix up the original frame but the IRET frame
which is the one actually used to return from the NMI handler remains
unfixed, leaving the two frames inconsistent.

And because this is a #VC exception which gets to use
__sev_es_ist_enter() to handle NMIs raised in the #VC exception entry
code, that function will use the fixed up stack pointer from pt_regs.

However, in doing so, it will overwrite the return address which the
stale IRET frame still needs, leading up to the NMI returning to the
old, now stale VC stack slot.

Convert the SafeRET frame fixup code to asm and change it so that it
can get a frame passed in and it can correct it before it gets worked on
later.

And because it is an asm macro, it doesn't need the LFENCE speculation
stopper anymore.

Fixes: 7e7f81cf6f5c ("x86/bugs: Make Safe-RET robust against interrupt inject=
ion")
Signed-off-by: Atish Patra <atishp@meta.com>
Co-developed-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Cc: <stable@kernel.org>
---
 arch/x86/entry/entry_64.S            |  7 +-
 arch/x86/include/asm/nospec-branch.h | 83 ++++++++++++++-------------
 arch/x86/kernel/cpu/bugs.c           | 39 +-------------
 arch/x86/lib/retpoline.S             |  6 +-
 4 files changed, 54 insertions(+), 81 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 253f0a5..7cfc617 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -937,7 +937,7 @@ SYM_CODE_START(paranoid_entry)
 	IBRS_ENTER save_reg=3D%r15
 	UNTRAIN_RET_FROM_CALL
=20
-	HANDLE_INTR_SAFERET 8(%rsp)
+	FIXUP_INTR_SAFERET %rsp
=20
 	RET
 SYM_CODE_END(paranoid_entry)
@@ -1044,7 +1044,7 @@ SYM_CODE_START(error_entry)
=20
 	VALIDATE_UNRET_END
=20
-	HANDLE_INTR_SAFERET 8(%rsp)
+	FIXUP_INTR_SAFERET %rsp
=20
 	cmpq	$.Lgs_change, RIP+8(%rsp)
 	jne	.Lerror_entry_done_lfence
@@ -1205,6 +1205,9 @@ SYM_CODE_START(asm_exc_nmi)
 	jmp	swapgs_restore_regs_and_return_to_usermode
=20
 .Lnmi_from_kernel:
+	/* Repair the source frame before inspecting or copying it. */
+	FIXUP_NMI_INTR_SAFERET %rsp
+
 	/*
 	 * Here's what our stack frame will look like:
 	 * +---------------------------------------------------------+
diff --git a/arch/x86/include/asm/nospec-branch.h b/arch/x86/include/asm/nosp=
ec-branch.h
index 1abeb9a..6455443 100644
--- a/arch/x86/include/asm/nospec-branch.h
+++ b/arch/x86/include/asm/nospec-branch.h
@@ -185,42 +185,39 @@
  *
  * The Safe-RET sequence is:
  *
- * CALL
- * LEA 8(%RSP), %RSP
- * RET
+ *	CALL	L1
+ * L1:	LEA	8(%RSP), %RSP
+ * L2:	RET
  *
- * The two CMPs below check whether RIP points to after the CALL or after the
- * LEA.
+ * The C equivalent of the ASM sequence below is:
  *
- * The LFENCE below is to address this particular speculation case:
+ *	if (ptr->RIP > L2)	// After RET?
+ *		goto done;
+ *	if (ptr->RIP < L1)	// Before LEA ?
+ *		goto done;
+ *	if (ptr->RIP =3D=3D L1)	// At LEA ?
+ *		ptr->RSP +=3D 8;	// Emulate LEA
+ *	tmp =3D *ptr->RSP;	// Read original return IP
+ *	ptr->RIP =3D tmp;		// Overwrite interrupt return IP
+ *	ptr->RSP +=3D 8;		// Emulate RET
  *
- * 1. Userspace runs and poisons the BTB around the safe-RET routine
- *
- * 2. Userspace triggers some kind of exception
- *
- * 3. Kernel executes error_entry() and mis-speculates the branch into think=
ing
- *    it actually came from kernel space
- *
- * 4. The kernel then further mis-speculates that the exception occurred due
- *    to an interrupted safe-RET
- *
- * 5. The handle_interrupted_saferet() routine speculatively executes and
- *    speculatively does a safe-RET. But this is unsafe since it was never
- *    untrained.
- *
- * The LFENCE fixes this by ensuring step 5 is never reached speculatively.
- * Note that this LFENCE only occurs if safe-RET was actually interrupted (so
- * it's outside of the normal path).
+ * This ensures that this interrupt returns to the original return IP without
+ * resuming the interrupted safe-RET sequence.
  */
-#define __HANDLE_INTR_SAFERET(name, pt_regs)		\
-	cmpq	$(name), RIP+pt_regs;			\
-	jb	1f;					\
-	cmpq	$(name)+5, RIP+pt_regs;			\
-	ja	1f;					\
-	lfence;						\
-	leaq	pt_regs, %rdi;				\
-	call	handle_interrupted_saferet;		\
-	1:
+#define __FIXUP_INTR_SAFERET(name, ptr, rip_offs, rsp_offs)	\
+	cmpq	$(name)+5, rip_offs(ptr);			\
+	ja	2f;						\
+	cmpq	$(name), rip_offs(ptr);				\
+	jb	2f;						\
+	jne	1f;						\
+	addq	$8, rsp_offs(ptr);				\
+	1:;							\
+	movq	rsp_offs(ptr), %rdx;				\
+	movq	(%rdx), %rdx;					\
+	movq	%rdx, rip_offs(ptr);				\
+	addq	$8, rsp_offs(ptr);				\
+	2:
+
=20
 #ifdef __ASSEMBLER__
=20
@@ -305,7 +302,7 @@
 .macro CALL_UNTRAIN_RET
 #if defined(CONFIG_MITIGATION_UNRET_ENTRY) || defined(CONFIG_MITIGATION_SRSO)
 	ALTERNATIVE_2 "", "call entry_untrain_ret", X86_FEATURE_UNRET, \
-		          "call srso_alias_untrain_ret", X86_FEATURE_SRSO_ALIAS
+			  "call srso_alias_untrain_ret", X86_FEATURE_SRSO_ALIAS
 #endif
 .endm
=20
@@ -339,12 +336,25 @@
 #define UNTRAIN_RET_FROM_CALL \
 	__UNTRAIN_RET X86_FEATURE_ENTRY_IBPB, __stringify(RESET_CALL_DEPTH_FROM_CAL=
L)
=20
-.macro HANDLE_INTR_SAFERET pt_regs
+.macro FIXUP_INTR_SAFERET pt_regs
 #ifdef CONFIG_MITIGATION_SRSO
 	ALTERNATIVE_2 "", \
-	__stringify(__HANDLE_INTR_SAFERET(srso_safe_ret, \pt_regs)), X86_FEATURE_SR=
SO, \
-	__stringify(__HANDLE_INTR_SAFERET(srso_alias_safe_ret, \pt_regs)), X86_FEAT=
URE_SRSO_ALIAS
+	__stringify(__FIXUP_INTR_SAFERET(srso_safe_ret, \pt_regs, RIP+8, RSP+8)), X=
86_FEATURE_SRSO, \
+	__stringify(__FIXUP_INTR_SAFERET(srso_alias_safe_ret, \pt_regs, RIP+8, RSP+=
8)), X86_FEATURE_SRSO_ALIAS
+#endif
+.endm
=20
+/*
+ * Note the offsets encoding below:
+ *
+ * The IRET frame at call site in asm_exc_nmi() starts at 8(%rsp) (NMI handl=
er
+ * users %rdx as a temp var so it pushes it on the stack on entry).
+ */
+.macro FIXUP_NMI_INTR_SAFERET fptr
+#ifdef CONFIG_MITIGATION_SRSO
+	ALTERNATIVE_2 "", \
+	__stringify(__FIXUP_INTR_SAFERET(srso_safe_ret, \fptr, RIP-RIP+8, RSP-RIP+8=
)), X86_FEATURE_SRSO, \
+	__stringify(__FIXUP_INTR_SAFERET(srso_alias_safe_ret, \fptr, RIP-RIP+8, RSP=
-RIP+8)), X86_FEATURE_SRSO_ALIAS
 #endif
 .endm
=20
@@ -681,7 +691,6 @@ static __always_inline void x86_idle_clear_cpu_buffers(vo=
id)
=20
 void srso_safe_ret(void);
 void srso_alias_safe_ret(void);
-void handle_interrupted_saferet(struct pt_regs *regs);
=20
 #endif /* __ASSEMBLER__ */
=20
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 4ced10c..8c2c831 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -3787,42 +3787,3 @@ void __warn_thunk(void)
 {
 	WARN_ONCE(1, "Unpatched return thunk in use. This should not happen!\n");
 }
-
-#ifdef CONFIG_MITIGATION_SRSO
-/*
- * Called during exception/interrupt entry if interrupted during the
- * safe-RET sequence.  The safe-RET sequence consists of 3 instructions:
- *
- *	CALL
- *	LEA 8(%RSP), %RSP
- *	RET
- *
- * An interrupt after the CALL or after the LEA could potentially lead
- * to branch predictor poisoning and results in the sequence not being
- * able to be safely resumed.
- *
- * Therefore, modify the regs state as if the remaining part of the
- * safe-RET sequence executed so the interrupt returns back to the
- * desired return target, instead of the to the safe-RET sequence.
- */
-void noinstr handle_interrupted_saferet(struct pt_regs *regs)
-{
-	unsigned long rip =3D regs->ip;
-
-	if (rip =3D=3D (unsigned long) srso_safe_ret ||
-	    rip =3D=3D (unsigned long) srso_alias_safe_ret) {
-	    /* Modify stack pointer as if LEA executed: */
-	    regs->sp +=3D 8;
-	}
-
-	/*
-	 * Adjust registers as if RET executed:
-	 *
-	 * 1. Read the return address off the stack and into rIP:
-	 */
-	regs->ip =3D *(unsigned long *)(regs->sp);
-
-	/* 2. Pop rIP off the stack: */
-	regs->sp +=3D 8;
-}
-#endif /* CONFIG_MITIGATION_SRSO */
diff --git a/arch/x86/lib/retpoline.S b/arch/x86/lib/retpoline.S
index f9ca1d8..376119f 100644
--- a/arch/x86/lib/retpoline.S
+++ b/arch/x86/lib/retpoline.S
@@ -210,13 +210,13 @@ SYM_CODE_START_NOALIGN(srso_alias_safe_ret)
=20
 	/*
 	 * Tell objtool that those are not function pointers referenced by
-	 * __HANDLE_INTR_SAFERET(). Below too.
+	 * FIXUP_[NMI_]INTR_SAFERET(). Below too.
 	 */
 	ANNOTATE_NOENDBR
=20
 	/*
 	 * Safe-RET sequence. If you need to change it, adjust
-	 * handle_interrupted_saferet() too.
+	 * FIXUP_[NMI_]INTR_SAFERET() too.
 	 */
 	lea 8(%_ASM_SP), %_ASM_SP
 	UNWIND_HINT_FUNC
@@ -261,7 +261,7 @@ SYM_CODE_START_LOCAL_NOALIGN(srso_untrain_ret)
 SYM_INNER_LABEL(srso_safe_ret, SYM_L_GLOBAL)
 	/*
 	 * Safe-RET sequence. If you need to change it, adjust
-	 * handle_interrupted_saferet() too.
+	 * FIXUP_[NMI_]INTR_SAFERET() too.
 	 */
 	lea 8(%_ASM_SP), %_ASM_SP
 	ret
