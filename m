Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091984;
	b=UOyeYHbgKrKi0X8PhF0oVbemZd0mxTTWR9kQqWPC9tX7g8l9IiHGRMcS0FdIdKRdW0fs
	 2Eex4YOiyK44GwO8a2BdOV5VrcgVfUjWgQvf4FpbvGGKCCTQUtAhKoqMTuVkcclcZlmVB
	 UxMd30YoDFQh4RUV7h5VZsuaHV1VpkLNR/dkAYUDU+uOm9XE2IJlodWFg89pCqjyF+MPO
	 yCWbwSAyGwlFjFuyV3EYIA4O2nFBp1PwJTgbzk4P4ROJg3Zxvg4MCLbmTWDOy6Z34p48k
	 0aIK0+ArtomDPzQRaOos9VGv8I2Q+nvD/wGiF/9pYqwe3BVJhbuMCLaNAaYccyisZeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=POb977I28H1EmGdZnC0Fze71NPJTvy/cbOUR/blKh9w=;
	b=MUpruT5JRPkptYWY/j6GIQa2vR/tywiBdVQr/M6Ojfpo7QuGQGANJm/2y7HasfTa6YCK
	 l1D1Uhvxveba7niSkR2HkbyzEY8OsbqsHGYdQi6WaU1YC+S7TQhqDPYx8Aki33GKYXmKi
	 Tc/r3hLGtElkUcM0TaJhThGwOEONoba8He32ONA4fHgqR5rmVDxnAj4gV9CmcmZYLerYr
	 l1V7kAwsbNmwrG2nPtYJ3HBNdw0K7aEZ3FourzQK2TF2QssPX4mTp5je61kRRjv1q/lJ1
	 Fm7zBYkIyrta9bKxmzvXrhbil9Yh0rY+thTkwlAP32/KX66k6gJiPwonomXrbUcou6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=Ms4JQz4L;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DE660A262A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83DE660A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=Ms4JQz4L
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9e53d011eso17566695ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795091984; x=1795696784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POb977I28H1EmGdZnC0Fze71NPJTvy/cbOUR/blKh9w=;
        b=Ms4JQz4LT8mQ3IpH5qqoeUPAVqfpsdrgqYD4LjmFlA42lwmJEErCtHZS+fgnbb5Idw
         DwpE/oO8N64gqYxDCVdoriEEuDFEy5IIEBVBt6A2m/aeUvCjSnSffnCqG5eQxEdrC0Ff
         SjzaZ2MgtHlxBPdR5jIIPC8i/YdJ4TvTaWQjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091984; x=1795696784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=POb977I28H1EmGdZnC0Fze71NPJTvy/cbOUR/blKh9w=;
        b=Hi0mdjLi4Cg79iMw0T3y5yplD2g/wieE+MAw2GLaW+D3/qcH18CJDPIFRrfJwPBWvf
         Gw7tmTQtLo3u/zxidzMiMcMzKOYoSmxsd+LmAWpkjG+3gVuL92GR5WP/nLHp/6DAutbP
         ULquqT1Ma0b+q+Zk0vshXtiqrOrBdgn5EPzPRedLJvIKBSBsdqXMRI6ITQwGUpQhoP/h
         dQOGLMnVhzi+wpzpqwxNATy/NRBRcFloMsaCdOMYb5Y1K2P6TBbfzBLOaJd5ziS15s4n
         6/5cboT8Ek/GNVdwSxzKAktGFhjebD0C1mJOJtZYDD8bTCY+vvSeyQm6O+Q41vKm2nvL
         /Gbg==
X-Gm-Message-State: APuU4Z8zqB7zV80NwxE0QFQ2Pr9JkAZB7qyPwr8bAm6UmgGGvgyknnYK
	yTtWO3xK4hIhn6tWescx8ZuSpxkUVOB1AQTHqZTSwI8BH5uNBSau5i65FctYd6G7uZE=
X-Gm-Gg: AZFdTZe5axFP6d1tDCBGvSS9ikzQBAYJ2cuixKGWtzF/heaiNTTuftaPOueQU/Zncq4
	LSptoi0OX1JBBjCCdkM9N8yKMWUai9D/2I8fpmPUlw7tCht5XXISEZA0xqwGnVXVRSwX4thjCox
	RhCjcmpULxFvwB7GhP9+j7hUcv2Kdtq1JB5JIj/qT4smKH4vsMjQC95ovnLd+PY99t+8UXpMh+5
	qJeajQPXT5+jWLOxo24UGGuW8FmgfjDprVfmCjfEePzFDGPFX2wGzcFb8Wa1IsNblKBX8J1bRR0
	VAnGff7IMclDTEKv4dqeAreeXBR+357h0RqlRcQxBqUEop9C0Ta0fTMc9ggo+QeyfRVmqWRnu/l
	PvuFeBbYU35s2DGTkKw06VRbXyu58E8UYYnJYPb3TUKkjze/QAP9dfReQ039xrLFsW/On+lLvJh
	j6zYqz0rOZL3keAAGOO8gfwmG7XGA2cFA3Il8Rfh1QCoewxRkID4TarljTL+qLHYTEDgsWmVuc0
	sBY18C+TZWICx4Y+PIXl9+78/qGiqgv9vUoJ+t5Ti07DFt3YnpGn5OcDEUqx1iPnu7XfImi7rbz
	vUEyTWaR7Xn4cGifOiLNefBvM8c5gLJvhLMA1jxhCXzMFu65QZBseF4pRZ0D7pT1LPysTw==
X-Received: by 2002:a17:90b:3812:b0:3ac:b2e6:317d with SMTP id 98e67ed59e1d1-3b3d07669f1mr6494733a91.35.1795091983707;
        Thu, 19 Nov 2026 04:39:43 -0800 (PST)
Received: from shiro (p1799054-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.207.155.54])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm2696299a91.5.2026.11.19.04.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:39:43 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	gerg@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 1/4] m68k: Add and use wrapper for FPU inline asm
Date: Thu, 19 Nov 2026 21:35:55 +0900
Message-ID: <20261119123558.2108296-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119123558.2108296-1-daniel@0x0f.com>
References: <20261119123558.2108296-1-daniel@0x0f.com>
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

The assembler will refuse to assemble instructions that aren't
supported on the current "chip". This includes the FPU instructions.

For inline asm blocks that need to use chip specific instructions
we manually set chip to the one needed to get the assembler to take
the instructions and since chip propagates to all of the following
inline asm blocks in the same source file we set it to generic "68k"
after the instructions.

The problem with this is that in a kernel built for only the 68040 or
68060 "68k" doesn't allow for the FPU instructions. Currently if the
above pattern happens earlier in the same file (maybe via an include)
chip will be set to 68k and FPU instructions will fail to assemble.

FPU instructions are a bit of pain because we also need to consider
coldfire. Coldfire doesn't want the same chip as classic m68k.

Add FPU_ASM() to wrap FPU instruction inline asm and do the right
chip dance for classic m68k and coldfire, and use it in signal.c
where the fsave/frestore were duplicated for coldfire.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/include/asm/fpu.h |  6 ++++
 arch/m68k/kernel/process.c  | 19 ++++++-----
 arch/m68k/kernel/setup_mm.c |  2 +-
 arch/m68k/kernel/signal.c   | 63 +++++++++----------------------------
 4 files changed, 32 insertions(+), 58 deletions(-)

diff --git a/arch/m68k/include/asm/fpu.h b/arch/m68k/include/asm/fpu.h
index ab12be88d75f..5ff246444e67 100644
--- a/arch/m68k/include/asm/fpu.h
+++ b/arch/m68k/include/asm/fpu.h
@@ -21,4 +21,10 @@
 #define FPSTATESIZE (0)
 #endif
 
+#ifdef CONFIG_COLDFIRE
+#define FPU_ASM(insns)	insns
+#else
+#define FPU_ASM(insns)	".chip 68k/68881\n\t" insns "\n\t.chip 68k"
+#endif
+
 #endif /* __M68K_FPU_H */
diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index f5a07a70e938..ef76d2aea12c 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -34,6 +34,7 @@
 #include <linux/uaccess.h>
 #include <linux/elfcore.h>
 
+#include <asm/fpu.h>
 #include <asm/traps.h>
 #include <asm/machdep.h>
 #include <asm/setup.h>
@@ -97,7 +98,7 @@ void flush_thread(void)
 #ifdef CONFIG_FPU
 	if (!FPU_IS_EMU) {
 		unsigned long zero = 0;
-		asm volatile("frestore %0": :"m" (zero));
+		asm volatile (FPU_ASM("frestore %0") : : "m" (zero));
 	}
 #endif
 }
@@ -182,7 +183,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 #ifdef CONFIG_FPU
 	if (!FPU_IS_EMU) {
 		/* Copy the current fpu state */
-		asm volatile ("fsave %0" : : "m" (p->thread.fpstate[0]) : "memory");
+		asm volatile (FPU_ASM("fsave %0")
+			      : : "m" (p->thread.fpstate[0]) : "memory");
 
 		if (!CPU_IS_060 ? p->thread.fpstate[0] : p->thread.fpstate[2]) {
 			if (CPU_IS_COLDFIRE) {
@@ -197,8 +199,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 						"m" (p->thread.fpcntl[2])
 					      : "memory");
 			} else {
-				asm volatile ("fmovemx %/fp0-%/fp7,%0\n\t"
-					      "fmoveml %/fpiar/%/fpcr/%/fpsr,%1"
+				asm volatile (FPU_ASM("fmovemx %/fp0-%/fp7,%0\n\t"
+						      "fmoveml %/fpiar/%/fpcr/%/fpsr,%1")
 					      :
 					      : "m" (p->thread.fp[0]),
 						"m" (p->thread.fpcntl[0])
@@ -207,7 +209,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		}
 
 		/* Restore the state in case the fpu was busy */
-		asm volatile ("frestore %0" : : "m" (p->thread.fpstate[0]));
+		asm volatile (FPU_ASM("frestore %0")
+			      : : "m" (p->thread.fpstate[0]));
 	}
 #endif /* CONFIG_FPU */
 
@@ -235,7 +238,7 @@ int elf_core_copy_task_fpregs(struct task_struct *t, elf_fpregset_t *fpu)
 		char fpustate[216];
 
 		/* First dump the fpu context to avoid protocol violation.  */
-		asm volatile ("fsave %0" :: "m" (fpustate[0]) : "memory");
+		asm volatile (FPU_ASM("fsave %0") : : "m" (fpustate[0]) : "memory");
 		if (!CPU_IS_060 ? !fpustate[0] : !fpustate[2])
 			return 0;
 
@@ -251,11 +254,11 @@ int elf_core_copy_task_fpregs(struct task_struct *t, elf_fpregset_t *fpu)
 					"m" (fpu->fpregs[0])
 				      : "memory");
 		} else {
-			asm volatile ("fmovem %/fpiar/%/fpcr/%/fpsr,%0"
+			asm volatile (FPU_ASM("fmovem %/fpiar/%/fpcr/%/fpsr,%0")
 				      :
 				      : "m" (fpu->fpcntl[0])
 				      : "memory");
-			asm volatile ("fmovemx %/fp0-%/fp7,%0"
+			asm volatile (FPU_ASM("fmovemx %/fp0-%/fp7,%0")
 				      :
 				      : "m" (fpu->fpregs[0])
 				      : "memory");
diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index c7e8de0d34bb..51b5881078cd 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -223,7 +223,7 @@ void __init setup_arch(char **cmdline_p)
 	/* clear the fpu if we have one */
 	if (m68k_fputype & (FPU_68881|FPU_68882|FPU_68040|FPU_68060|FPU_COLDFIRE)) {
 		volatile int zero = 0;
-		asm volatile ("frestore %0" : : "m" (zero));
+		asm volatile (FPU_ASM("frestore %0") : : "m" (zero));
 	}
 #endif
 
diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
index e628b859ef21..fa36d519de69 100644
--- a/arch/m68k/kernel/signal.c
+++ b/arch/m68k/kernel/signal.c
@@ -45,6 +45,7 @@
 #include <linux/extable.h>
 #include <linux/resume_user_mode.h>
 
+#include <asm/fpu.h>
 #include <asm/setup.h>
 #include <linux/uaccess.h>
 #include <asm/traps.h>
@@ -306,24 +307,15 @@ static inline int restore_fpu_state(struct sigcontext *sc)
 				    "m" (sc->sc_fpcntl[1]),
 				    "m" (sc->sc_fpcntl[2]));
 	    } else {
-		__asm__ volatile (".chip 68k/68881\n\t"
-				  "fmovemx %0,%%fp0-%%fp1\n\t"
-				  "fmoveml %1,%%fpcr/%%fpsr/%%fpiar\n\t"
-				  ".chip 68k"
+		__asm__ volatile (FPU_ASM("fmovemx %0,%%fp0-%%fp1\n\t"
+					  "fmoveml %1,%%fpcr/%%fpsr/%%fpiar")
 				  : /* no outputs */
 				  : "m" (*sc->sc_fpregs),
 				    "m" (*sc->sc_fpcntl));
 	    }
 	}
 
-	if (CPU_IS_COLDFIRE) {
-		__asm__ volatile ("frestore %0" : : "m" (*sc->sc_fpstate));
-	} else {
-		__asm__ volatile (".chip 68k/68881\n\t"
-				  "frestore %0\n\t"
-				  ".chip 68k"
-				  : : "m" (*sc->sc_fpstate));
-	}
+	__asm__ volatile (FPU_ASM("frestore %0") : : "m" (*sc->sc_fpstate));
 	err = 0;
 
 out:
@@ -397,10 +389,8 @@ static inline int rt_restore_fpu_state(struct ucontext __user *uc)
 					    "m" (fpregs.f_fpcntl[1]),
 					    "m" (fpregs.f_fpcntl[2]));
 		} else {
-			__asm__ volatile (".chip 68k/68881\n\t"
-					  "fmovemx %0,%%fp0-%%fp7\n\t"
-					  "fmoveml %1,%%fpcr/%%fpsr/%%fpiar\n\t"
-					  ".chip 68k"
+			__asm__ volatile (FPU_ASM("fmovemx %0,%%fp0-%%fp7\n\t"
+						  "fmoveml %1,%%fpcr/%%fpsr/%%fpiar")
 					  : /* no outputs */
 					  : "m" (*fpregs.f_fpregs),
 					    "m" (*fpregs.f_fpcntl));
@@ -411,14 +401,7 @@ static inline int rt_restore_fpu_state(struct ucontext __user *uc)
 			     context_size))
 		goto out;
 
-	if (CPU_IS_COLDFIRE) {
-		__asm__ volatile ("frestore %0" : : "m" (*fpstate));
-	} else {
-		__asm__ volatile (".chip 68k/68881\n\t"
-				  "frestore %0\n\t"
-				  ".chip 68k"
-				  : : "m" (*fpstate));
-	}
+	__asm__ volatile (FPU_ASM("frestore %0") : : "m" (*fpstate));
 	err = 0;
 
 out:
@@ -437,15 +420,8 @@ static inline void save_fpu_state(struct sigcontext *sc, struct pt_regs *regs)
 		return;
 	}
 
-	if (CPU_IS_COLDFIRE) {
-		__asm__ volatile ("fsave %0"
-				  : : "m" (*sc->sc_fpstate) : "memory");
-	} else {
-		__asm__ volatile (".chip 68k/68881\n\t"
-				  "fsave %0\n\t"
-				  ".chip 68k"
-				  : : "m" (*sc->sc_fpstate) : "memory");
-	}
+	__asm__ volatile (FPU_ASM("fsave %0")
+			  : : "m" (*sc->sc_fpstate) : "memory");
 
 	if (CPU_IS_060 ? sc->sc_fpstate[2] : sc->sc_fpstate[0]) {
 		fpu_version = sc->sc_fpstate[0];
@@ -469,10 +445,8 @@ static inline void save_fpu_state(struct sigcontext *sc, struct pt_regs *regs)
 					  : /* no inputs */
 					  : "memory");
 		} else {
-			__asm__ volatile (".chip 68k/68881\n\t"
-					  "fmovemx %%fp0-%%fp1,%0\n\t"
-					  "fmoveml %%fpcr/%%fpsr/%%fpiar,%1\n\t"
-					  ".chip 68k"
+			__asm__ volatile (FPU_ASM("fmovemx %%fp0-%%fp1,%0\n\t"
+						  "fmoveml %%fpcr/%%fpsr/%%fpiar,%1")
 					  : "=m" (*sc->sc_fpregs),
 					    "=m" (*sc->sc_fpcntl)
 					  : /* no inputs */
@@ -497,14 +471,7 @@ static inline int rt_save_fpu_state(struct ucontext __user *uc, struct pt_regs *
 		return err;
 	}
 
-	if (CPU_IS_COLDFIRE) {
-		__asm__ volatile ("fsave %0" : : "m" (*fpstate) : "memory");
-	} else {
-		__asm__ volatile (".chip 68k/68881\n\t"
-				  "fsave %0\n\t"
-				  ".chip 68k"
-				  : : "m" (*fpstate) : "memory");
-	}
+	__asm__ volatile (FPU_ASM("fsave %0") : : "m" (*fpstate) : "memory");
 
 	err |= __put_user(*(long *)fpstate, (long __user *)&uc->uc_fpstate);
 	if (CPU_IS_060 ? fpstate[2] : fpstate[0]) {
@@ -531,10 +498,8 @@ static inline int rt_save_fpu_state(struct ucontext __user *uc, struct pt_regs *
 					  : /* no inputs */
 					  : "memory");
 		} else {
-			__asm__ volatile (".chip 68k/68881\n\t"
-					  "fmovemx %%fp0-%%fp7,%0\n\t"
-					  "fmoveml %%fpcr/%%fpsr/%%fpiar,%1\n\t"
-					  ".chip 68k"
+			__asm__ volatile (FPU_ASM("fmovemx %%fp0-%%fp7,%0\n\t"
+						  "fmoveml %%fpcr/%%fpsr/%%fpiar,%1")
 					  : "=m" (*fpregs.f_fpregs),
 					    "=m" (*fpregs.f_fpcntl)
 					  : /* no inputs */
-- 
2.55.0

