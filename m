Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649442;
	b=GV+vScQ0gqTZJcj1ooaEU6US+ix5HbV88L1O1Gd7F5ecgA+piZEQPeLNk8yxwyUFCP8Y
	 elADaEZZHMTwTSlQ7QKDGSQXAJez15f/nrCMCaT+YTIjh5HvmhqmH9RKSGnTABFhWxADX
	 h3/ciRT5yvHiP85jJsm9YAwZII4l6xSwG8fRgIBMF96+aZGCECg1UBzYQvp4Vd5RsdXO6
	 FH4/tmvgZJah8OAUMCMY42q1q3sy2loUSiPkGzkZWpIzg02d1yqVLL9kkSMfR+a8ugsSf
	 S8Uyh4q1CxkOmU3LwxUZcWheMlrYq4Iy2PsgFq8LD8z0VD7Ne1kIVyE+qxuL3xx88bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=k1Ij9HGRNVPxHOypgke3ebIZ/asDfBx2BgBH8YIUh70=;
	b=xTpx71vY2nd/lWnVqvLmK00rLol6ahgjrB1NN41ul202QKWHy/zEjTs05R7EuzWIq4i9
	 h5wkUdPflCfKV08xZvydSFazznlJMa7DfjxfwCv5tKDx5+duOQBEhllMjUfbzdTGyEb3N
	 6+Zook6daMhW5LWeBFot/oIkif1vZlIxcyqJxYbxSWtl9dfeXx8o4TFKOs5HV2Ztg6R5G
	 r2nAIB2CORXzpBZn9HpcTskzittKHxs+mPdDsGB9lbhIlIiy8vf/EPEQiXGwZw+nrS+i8
	 EYRuS76nge4C7XrRMx44bcygGnFL9KV3iF5GuMctfM+7gHYXz3qJCJntAh80dyegMrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cRZVjhQV;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13865606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13865606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cRZVjhQV
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso5593841f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649440; x=1796254240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k1Ij9HGRNVPxHOypgke3ebIZ/asDfBx2BgBH8YIUh70=;
        b=cRZVjhQVJNxnitQ0BaR5Ma8MvwOI/7MtLd8Kx5VJ34jKIWrcFw9QLivdS94GEaW/Ac
         3oyXmhbMUSPtyUdiKFc7EM2DbkAcDSoBFUQxhl+JJn+7qQuykBUVVXBDLLJuwudIDBQw
         UAsWVVlnwKYxflFLp/tRbY3T9fmHoHkqMxPqXWa4kCbOOzWIY/evG+SPz9W5wWlDSWft
         sjuel1QB+B8SgmbTEV9JWjYImuPgTVqFRdcR5R7cDs5mZVUiTNQdH8EhkXXTrzwCwg3D
         +JNfQW5aPrvs+iYQ3uwf6sg2c7Q3oOG//CxU/t9pEpqA2GKbYaZpF5wtvgRwsVMpvhdU
         4q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649440; x=1796254240;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1Ij9HGRNVPxHOypgke3ebIZ/asDfBx2BgBH8YIUh70=;
        b=1vA1M7MuMHgrnqWdPg9s+8op3Vn9VjuI/1F0kI4qQPjpn8Rl0EjYp4tuQwsofOlUjB
         8dehCaiXFbzn4MqfXy3iVKtbo3YDiqq/dgnoWkF32uwCHDGwD+sw88OdfY5ZG4xwIAPy
         f+Y8WaG83PzHUMVaYE8EOc00zzU/2uAcGa/4dab38MQ53VrmAVFS3IxAGr4RiqddWuNU
         uKqAomYDEGN/cxsB/r9Fg/oNg8xkg0Sgl2WRqfm7EOJpY7op8ZTDU3Brw277jBMVlT5U
         F9MEIl2/BoGjJJFUijKwjTgh7299yF0l9etD7cF32CJ053wuXBCmtViBnxgLYxPpFgUO
         7yjw==
X-Forwarded-Encrypted: i=1; AL+hErEXlJ3b8vnhqx3tITdJPNbzawC/NfXs6KaXSnsx76lB6ZEOgeaVi6+SpP26bYY2bnSwikDLUDGDXC5//7k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CfuJxDzaV6Tz/jzsSeL6T9z+JfsOp4v+euqL2hBi32HIcpBrS
	Wlcb/4WdyuMJM5qISkHzhhIBDm17eKLR7GhmRsg8hlU8jB44o/GN9uuPN/nAeEKP3Bg=
X-Gm-Gg: AZFdTZcNnHgKyawPelsqr6OGjexbA0Db1Gt/0MOEqcwEcc0KnTsb+ZPk8GdGhSYdqjQ
	dR3xG0hXcGUSdwgQ+8zicIC0kRGLyFyyg6BNmPExGH8LaORaZBDmQKrwsjJXayNl4XdoRP98Oeg
	FPMXfiOfZD3jRc/CDgMQwd++/Cgd8ieDrtMDKq7fKQVvn/PzRvJ1D0OYdXr/jLYJMcoPg3z4Zmk
	JJ+E8vgCI+53DEpxYkb+ygvvh1oS7ns4IYXGlLNj3SzkoievfkmHS0B0Gcx5C5VEVngK0mhouZZ
	wb7x/d8Q75M6GkgoByfB0dOVuORkXjzM4awDsxNKjOvh+vC52tgs3ysneD28VHI95Gz1dxOGeNN
	topNUaydAvN/Hk661QdOox15KvHK1hzBY/VkA2rOArveCyXf5DWu0WRPaP0MT6e7rwU1obixkhF
	ONphtEpCcE38L0XUWOMrwcbWwz3TPserkG4YO474UqsQwiZBVgxsJaH4SQpQwP2E1CQqbaAt5ox
	hzmj+pKZ1tub3JqEGsyOh46u2xpNY2Km7ci9PX9AZjUPSxkyutw1G9Esco97xGylwQl/uhNp4Ro
	wUzQEIwtjmzxMIcoo3K4a5DZ4wiu029ndKLFrFDICQC/CW8tsTvl2kjQIKllEzC5uHpyaBriWzX
	L7iwPHdRItQ==
X-Received: by 2002:a05:6000:4284:b0:48e:3b53:e100 with SMTP id ffacd0b85a97d-4abb9edfd7cmr38748071f8f.56.1795649440438;
        Wed, 25 Nov 2026 15:30:40 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680483sm37411248f8f.28.2026.11.25.15.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:30:40 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [PATCH RFC 02/19] riscv: Handle ESP32-P4 CLIC trap context
Date: Wed, 25 Nov 2026 23:30:03 +0000
Message-ID: <20261125233020.1380594-3-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
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
Content-Transfer-Encoding: 8bit

The ESP32-P4 CLIC encodes trap return state alongside the cause
code and interrupt flag in mcause. The RISC-V exception dispatcher
expects only the cause code and interrupt flag.

Save the raw mcause in pt_regs, normalize the cause for dispatch
and translate MPP and MPIE into the saved status layout. Restore
the saved interrupt level and rebuild MPP and MPIE from pt_regs
on the non-vectored trap return path.

The current CLIC level stays active until mret. irq_exit_rcu() can
run softirqs with interrupts enabled, and irqentry_exit() can
schedule before the final mret. Holding the hardirq level across
either path blocks interrupts at that level or below.

Restore the interrupted context's level with an M-mode mret
after the hardirq handler and before irq_exit_rcu(). Keep interrupts
masked across this intermediate return and retain the original
trap frame.

Tested on a Waveshare ESP32-P4-Module-DEV-KIT with revision v3.2
silicon. The kernel booted to a UART shell, completed 20 consecutive
two-process pipelines and continued to receive CLINT timer and UART0
interrupts.

AI assisted with the assembly and JTAG diagnosis.

Link: https://documentation.espressif.com/esp32-p4_technical_reference_manual_en.pdf
Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  4 ++
 arch/riscv/include/asm/ptrace.h         |  4 ++
 arch/riscv/kernel/asm-offsets.c         |  3 ++
 arch/riscv/kernel/entry.S               | 61 +++++++++++++++++++++++++
 arch/riscv/kernel/traps.c               |  4 ++
 5 files changed, 76 insertions(+)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index a0ca9efff267..e0fec71022f9 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -64,4 +64,8 @@ asmlinkage void handle_bad_stack(struct pt_regs *regs);
 asmlinkage void do_page_fault(struct pt_regs *regs);
 asmlinkage void do_irq(struct pt_regs *regs);
 
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+asmlinkage void esp32p4_clic_restore_irq_level(unsigned long cause);
+#endif
+
 #endif /* _ASM_RISCV_PROTOTYPES_H */
diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index addc8188152f..5729fbac0b57 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -53,6 +53,10 @@ struct pt_regs {
 	unsigned long cause;
 	/* a0 value before the syscall */
 	unsigned long orig_a0;
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+	/* Raw mcause for CLIC trap return */
+	unsigned long clic_mcause;
+#endif
 };
 
 #define PTRACE_SYSEMU			0x1f
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index a75f0cfea1e9..9f8310dd0a6e 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -130,6 +130,9 @@ void asm_offsets(void)
 	OFFSET(PT_STATUS, pt_regs, status);
 	OFFSET(PT_BADADDR, pt_regs, badaddr);
 	OFFSET(PT_CAUSE, pt_regs, cause);
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+	OFFSET(PT_CLIC_MCAUSE, pt_regs, clic_mcause);
+#endif
 
 	OFFSET(SUSPEND_CONTEXT_REGS, suspend_context, regs);
 
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index f659bf62bb39..91269ab82c60 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -196,6 +196,22 @@ SYM_CODE_START(handle_exception)
 	csrr s2, CSR_EPC
 	csrr s3, CSR_TVAL
 	csrr s4, CSR_CAUSE
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+	REG_S s4, PT_CLIC_MCAUSE(sp)
+	/* Translate CLIC MPP and MPIE into the saved mstatus layout. */
+	li t0, ~(SR_MPP | SR_MPIE)
+	and s1, s1, t0
+	srli t0, s4, 28 - 11
+	li t1, SR_MPP
+	and t0, t0, t1
+	or s1, s1, t0
+	srli t0, s4, 27 - 7
+	andi t0, t0, SR_MPIE
+	or s1, s1, t0
+	/* Keep the interrupt flag and the six bit CLIC cause code. */
+	li t0, CAUSE_IRQ_FLAG | 0x3f
+	and s4, s4, t0
+#endif
 	csrr s5, CSR_SCRATCH
 	REG_S s0, PT_SP(sp)
 	REG_S s1, PT_STATUS(sp)
@@ -311,6 +327,25 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 
 	csrw CSR_STATUS, a0
 	csrw CSR_EPC, a2
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+	/*
+	 * Preserve INT, MPIL and CODE from the saved trap.
+	 * Clear MINHV so mret uses mepc as an instruction address.
+	 */
+	REG_L a3, PT_CLIC_MCAUSE(sp)
+	li a4, CAUSE_IRQ_FLAG | (0xff << 16) | 0x3f
+	and a3, a3, a4
+
+	/* Rebuild MPP and MPIE from the current pt_regs status. */
+	li a4, SR_MPP
+	and a4, a0, a4
+	slli a4, a4, 28 - 11
+	or a3, a3, a4
+	andi a4, a0, SR_MPIE
+	slli a4, a4, 27 - 7
+	or a3, a3, a4
+	csrw CSR_CAUSE, a3
+#endif
 
 	REG_L x1,  PT_RA(sp)
 	REG_L x3,  PT_GP(sp)
@@ -329,6 +364,32 @@ SYM_INNER_LABEL(ret_from_exception_end, SYM_L_GLOBAL)
 SYM_CODE_END(ret_from_exception)
 ASM_NOKPROBE(ret_from_exception)
 
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+/* Restore MPIL from the IRQ frame without leaving M-mode. */
+SYM_FUNC_START(esp32p4_clic_restore_irq_level)
+	csrr t0, CSR_CAUSE
+	csrr t1, CSR_EPC
+	csrrci t2, CSR_STATUS, SR_IE
+
+	li t3, CAUSE_IRQ_FLAG | (0xff << 16) | 0x3f
+	and a0, a0, t3
+	/* MPP=M and MPIE=0 keep interrupts disabled on the synthetic return. */
+	li t3, 3 << 28
+	or a0, a0, t3
+	csrw CSR_CAUSE, a0
+	lla a0, .Lclic_irq_level_restored
+	csrw CSR_EPC, a0
+	mret
+
+.Lclic_irq_level_restored:
+	csrw CSR_CAUSE, t0
+	csrw CSR_EPC, t1
+	csrw CSR_STATUS, t2
+	ret
+SYM_FUNC_END(esp32p4_clic_restore_irq_level)
+ASM_NOKPROBE(esp32p4_clic_restore_irq_level)
+#endif
+
 #ifdef CONFIG_VMAP_STACK
 SYM_CODE_START_LOCAL(handle_kernel_stack_overflow)
 	/* we reach here from kernel context, sscratch must be 0 */
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f8292adda099..28343a601969 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -428,6 +428,10 @@ static void noinstr handle_riscv_irq(struct pt_regs *regs)
 	old_regs = set_irq_regs(regs);
 	handle_arch_irq(regs);
 	set_irq_regs(old_regs);
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+	/* Restore the interrupted level before irq_exit_rcu() can run softirqs. */
+	esp32p4_clic_restore_irq_level(regs->clic_mcause);
+#endif
 	irq_exit_rcu();
 }
 
-- 
2.56.1

