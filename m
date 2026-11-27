Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805907;
	b=3+qh2rDHgaV5oFlRIYINcF1DxuTBmNC2jMXZ0cgjDU810OoyuAxLpkioUhZLP9opq7Go
	 kbtKOTEMUccCJbk21qPM/e147DIUAg55dU4HnhPmlAuJ28qLn8Ejdblvl3agncsgnSXX4
	 tffjdAM02zEPQ2mzNP0ZrcYOsyYwTWwKfD/qI1DIKvwrbs5zRBNN1P8bhrP145a+D9OUr
	 hWAX4RhDWhRQTnlVWyVNiZA62MYeykWx5wskBHT8wwCJmAA4ICEPMNzwVTfnzqgf4Ogs7
	 R13tPH2L6lx8tyWAko+pyui8eyYiB0W3hfvDtOPw9vJ2tNwuiCa2CxDAyrf35JQN+uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805907;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uKCrPR60jaWb2Zhk534ZCZD0Kw22aJy6wHHdu9KIW1I=;
	b=wXHWJVzcu2Pwtios43h41VT50OYWGgbeaSB47IDGfMX9vTKvD2K9nWyHTn3AO8ESKIJy
	 wLcpu4gbzLlVkBD4vLtUoAm6IaS5uWM8LtGJnaQ2NEfShTUVtuM4w/BIDgJBDJbkLf0PD
	 vC/IGXmoZ7FdmiHOUVK+H20wdIIj2FY8lghYLS/uZFJJxHLcueHsQa465JLTODOgkn4k8
	 9kGYY/AuqmkScJWC1FraygDduHNBEQllQ2HlVIQblNRF4UPwLTRXZwxT5/4v4ttekc12V
	 NkWCjvjM96TmRV7SaaVjpa58tpRNxCqf3AtVtb5evPk0XL+fL40UAu8BeHyIYIo3SHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=d3YE0ITt;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4604606A6A4
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4604606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=d3YE0ITt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1795805905;
	bh=uKCrPR60jaWb2Zhk534ZCZD0Kw22aJy6wHHdu9KIW1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d3YE0ITtkvJEqGUDx/RAAneNdpWQc2mcwwJ2tq74i9QcNAJimQ/RxgcBZuAVBKKh6
	 SHsKaGqj/kQkZ43D2qPbj2/Vfy9MOynpFQhNFL6hdaAbNNqkQJpQw0Eo25V+BuTTeZ
	 J84w3DnYpAHZ5pNqOxT7pSDg0vB/lbIOHtKdZus695YfF2IRNG2RbWv5rokxqTzz1v
	 PcRw9+ap7eHvQcogQopxU9BahPx2U/wjlSCs2ZJRkoz1DdZVhZ3ew+bmVIC1viEM6Q
	 7ZR5oGD2JGZO+ju1a+ZjT8RYwyF/osEkfZrliuVEtcfTBCAmEpFPpdDuVqJLEc84KC
	 Fz4NMX6yeoXFw==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jbjNx1KnNzXX1;
	Fri, 27 Nov 2026 13:58:25 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH v2 12/16] x86/entry: Remove stale membarrier sync core comments
Date: Fri, 27 Nov 2026 13:58:17 -0500
Message-ID: <20261127185822.158216-13-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127185822.158216-1-mathieu.desnoyers@efficios.com>
References: <20261127185822.158216-1-mathieu.desnoyers@efficios.com>
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

Two comments state that the membarrier sync core command relies on
the IRET which returns from the IPI handler. This is no longer true
since commit a493d1ca1a03 ("x86/membarrier: Get rid of a dubious
optimization"): sync_core_before_usermode() serializes the core in
the IPI handler.

Remove both comments.

The comment of sync_core_before_usermode() lists the instructions
which return to user-space without serializing the core. Fix a typo
in it ("sysrel") and add ERETU, which FRED uses.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 arch/x86/entry/entry_32.S        | 5 -----
 arch/x86/entry/entry_64.S        | 4 ----
 arch/x86/include/asm/sync_core.h | 2 +-
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/x86/entry/entry_32.S b/arch/x86/entry/entry_32.S
index 92c0b4a94e0a..d47bb08afb24 100644
--- a/arch/x86/entry/entry_32.S
+++ b/arch/x86/entry/entry_32.S
@@ -954,11 +954,6 @@ restore_all_switch_stack:
 	RESTORE_REGS pop=4			# skip orig_eax/error_code
 	CLEAR_CPU_BUFFERS
 .Lirq_return:
-	/*
-	 * ARCH_HAS_MEMBARRIER_SYNC_CORE rely on IRET core serialization
-	 * when returning from IPI handler and when returning from
-	 * scheduler to user-space.
-	 */
 	iret
 
 .Lasm_iret_error:
diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 253f0a585927..b8661064232c 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -626,10 +626,6 @@ SYM_INNER_LABEL(restore_regs_and_return_to_kernel, SYM_L_GLOBAL)
 #endif
 	POP_REGS
 	addq	$8, %rsp	/* skip regs->orig_ax */
-	/*
-	 * ARCH_HAS_MEMBARRIER_SYNC_CORE rely on IRET core serialization
-	 * when returning from IPI handler.
-	 */
 #ifdef CONFIG_XEN_PV
 SYM_INNER_LABEL(early_xen_iret_patch, SYM_L_GLOBAL)
 	ANNOTATE_NOENDBR
diff --git a/arch/x86/include/asm/sync_core.h b/arch/x86/include/asm/sync_core.h
index df22113db9cd..0ab91f7e2020 100644
--- a/arch/x86/include/asm/sync_core.h
+++ b/arch/x86/include/asm/sync_core.h
@@ -91,7 +91,7 @@ static __always_inline void sync_core(void)
 /*
  * Ensure that a core serializing instruction is issued before returning
  * to user-mode. x86 implements return to user-space through sysexit,
- * sysrel, and sysretq, which are not core serializing.
+ * sysretl, sysretq and eretu, which are not core serializing.
  */
 static inline void sync_core_before_usermode(void)
 {
-- 
2.47.3

