Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859578;
	b=QKRhom9x57JdFVBdt/HLKT5XViBECkbBFh6F7M3FV0PsoDyYLdNHRIc6acXN/aDd9sN3
	 qSaeuYzT6obN/XdQr7yaN9paQBz6yNxad4Lcc8K9lLyCRn8CEsGqwBj5j6dd3ZnNdlPEu
	 nojUXICX1Wv2onPR16IlJ7bmvthNf9S/YQZxmdTVSz1yoOZtdtlofEbyK0URNX5QrBP+9
	 DZeiW3RNnQV9KLEzGl6fk/WDAazCE4GwOzTn9KoUZkiEWcOlIcZw+T6vCBkd5oFssrRz7
	 BE7cn5mi0uqw4K2uk6uUxB7FIwVstFZg3Op6VAEU1D1t3QturlLdAbLGdrKy5z7x5Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZrDq8tmdXzrkRgk1EoLyp7UlG92pPquVxMGIdXH3Fx0=;
	b=JwgfcS4ryqjjROjlkiubqDk5ugDt3B8tRv1wJVxlr2RISek1XsHaDMznudfkQ0mFIjA0
	 txbAr/W4DkJcIwCcu5/LUd2lSoUjKivqMnem6/aL77XvcmO4SEuCXCt2G7k47zlkIer4C
	 Oe1z2M+kicdMblzRpNSPh4NWxBqbNBp6M5WzTCvzFtVmm2ayCLAuvHprbUvGIgM1L8WXq
	 W4yz83HAcvVAW9CZvnHBlh/lkqzM0rHVXltP9V9JViGlaWibGoJKZnkTU2vESLzrtWw47
	 KIcCvCZK3zf525+rCa1gMeTUrktgD2C34Z5AsXTZa+fbruIwlSGfQGoAIKsII1iPU+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JpZPCOLK;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1D1606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C1D1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JpZPCOLK
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b5489c6b26so340506a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795859576; x=1796464376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrDq8tmdXzrkRgk1EoLyp7UlG92pPquVxMGIdXH3Fx0=;
        b=JpZPCOLKihjhC54iE80DsTFiWB0WOiroTCP6RaP0QY4f/sGWw2No+kxvLzlw6ooiAC
         w2ZD7DxxHugKlTtihaWxpDg1p65PNSNh76epTkMBymL6Pa+qwbek+33VsL435MOgzNjq
         c3M3xi9+eThTvwrS+bQvMF6UOAhvH1DYtRqSDVzY9zm/LEG4KHmfU5NQZ84bfraAjyTX
         GluHRNILBBXLELdcCq9Uu+D9UYExHkL1czsoqgBWk18pyb3m9v3J66vPgzt4CX3BTiNv
         89Bwk792vHSHl0gfh8iKN9sJnlB6ccsBzK0GyzIuk8SEgKknSLz7IOtwy2RYe2e2JdxX
         OG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795859576; x=1796464376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrDq8tmdXzrkRgk1EoLyp7UlG92pPquVxMGIdXH3Fx0=;
        b=pa8iKB8CCseyNrI2Hj4YXVZFiOcCJABj/yrpQ2b3phW/bAM32ketIEbHhdL6Qs0M2b
         rayxjGrojFCDkmEhl4v6gTOmNCQxl7Z+uQRsa5OahFtQ+y+NDnzhh7FMfTpsd0t9FZnj
         LBLvt1eoo6Co98bo3us4BUs7pnRLIzGFi7yjzxMq8ko4ujxkQ8fhH2rajDnsXA6V35LP
         j+ZfIID8neGBH0MKFPuruRlPiBA3af+ZKWND+/J+qQI5x2u0dl/NWHOPEf9UFDKbUWhh
         m/4ltMRGf2k1CRFIfxyIvo6hThNIowp0F7n/MW9DSVJfFTUWU52THuO2AZF6L6d4B90c
         r7xg==
X-Forwarded-Encrypted: i=1; AL+hErEyzvGwC/s4UNNlX6EP7EGfXdDoDPvZrz3Z9cN1Zb3cC8omzl9UycUHoxZadM/gWwoKrDCwNlqCQZPEYrw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IKoWT4fNxLRc8BKAdUMOdOiY/SxlQ+jmQhqVKRTnDoYHaT1gT
	WdgbzuQOk2GYks0bkEM0e1QKPTggq1ybiH/0kwDxdWm3sdzRxqsArCo5rzroQOJ5Ujo=
X-Gm-Gg: AZFdTZdsUAUTV5DmJVMn68qyUw7Bqefm4JbB5hYGAlVqEfrZSUIqsTp7NwXd69qSg9s
	2/gsJCUxm2Bubg9MXdB/+YloOsNjLFcj6e0TP8UuDEJc8A90a+RKGRl1fPNSVkJDNPFr5mAZfzZ
	jQTg91lPELNFFJ+/lo/J/Msz4svBNKDi1tK3VhrqSGZ/Y10rasdWxx2eihrr6wy/DaHJq8/sEVC
	QfIeFu15cC3iaBGsn6Sq7xnwI686KS+UUN1zq9EXeuEDKaPmurot1aBuA80tqsWUwMnYbBu4kaE
	qGOB9rJnpKIBdaV1D64GFiBuTD9M+ihLYapdAcp25lEsCSDAXhh0EhKcbm4UAMWwVf7s9vtW8Kd
	C6gcr5QiSkgs595YLCD+xSmQslweVDi+1ODC6QdfS60bCpz1cgNQoYA9abSxrNuj3CBqbhyUdgF
	5/SqBYDLimi1ONvSNU0KuXpsLeqHB3rLxIUA6s3NnF8fBnvum65pJfKps2GjfBz3kJhhuT/GATc
	Y11M9sAgsUr0+yMJvHXA5L9TW/8UBqeMwCjib8Uf5Fm+yJfDBvdS6UISbbXo2S8GDH92zzTCy2y
	H4g9XDt+UMUes7RefoRuo/9HZ5uQQNdu2w8EjGclhIJ/o0RvRxp/42eU4qfe00HobgYOuT2x3dt
	7l92FgBKcCMlSjeYDtHvfe0OQoClxaeMWQjw=
X-Received: by 2002:a17:90b:2f8f:b0:3b3:b0f4:1bf7 with SMTP id 98e67ed59e1d1-3b41c8d460emr27534660a91.23.1795859576339;
        Sat, 28 Nov 2026 01:52:56 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm29481748a91.0.2026.11.28.01.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:52:56 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH v3] ARM: npcm: Add CPU hotplug callbacks for kexec support
Date: Sat, 28 Nov 2026 09:52:54 +0000
Message-ID: <20261128095254.358131-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
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

kexec_load() fails with -EINVAL on NPCM7xx because the platform does not
provide the CPU hotplug callbacks that machine_kexec_prepare() requires
on SMP systems. Add them.

The NPCM7xx cannot reset or power down a single core, so hand an offlined
core back to the boot ROM instead of leaving it in a WFI loop in kernel
text. The dying core switches to a static stack, takes the identity
mapping, disables caches and branch prediction, flushes L1, leaves
coherency, turns the MMU off and jumps to the reset vector in the ROM.
The ROM then parks it as it does after a real reset, overwriting SCRPAD
and waiting in WFE for npcm7xx_smp_boot_secondary(). The core can
therefore be brought back online, and it no longer executes from RAM that
a kexec'd kernel is free to overwrite.

cpu_kill() waits for the ROM to overwrite the kernel entry point left in
SCRPAD before reporting the core dead.

Map the GCR once in smp_prepare_cpus() since it is now also needed after
init.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
Changes in v3:
- Park offlined secondary cores back in the boot ROM reset vector instead of a
  WFI loop in kernel text so cores can be re-onlined and do not execute from
  RAM across kexec.
- Poll GCR SCRPAD in cpu_kill() until the ROM overwrites the kernel entry
  point, and map GCR once in smp_prepare_cpus().
- Drop Tomer's Reviewed-by due to the implementation rewrite.
- Link to v2: https://lore.kernel.org/r/20231102101009.15104-1-william@wkennington.com

Changes in v2:
- Fix NPCM7xx/NPCN8xx typo in the commit message.

 arch/arm/mach-npcm/headsmp.S |  38 ++++++++++++
 arch/arm/mach-npcm/platsmp.c | 109 ++++++++++++++++++++++++++++-------
 2 files changed, 127 insertions(+), 20 deletions(-)

diff --git a/arch/arm/mach-npcm/headsmp.S b/arch/arm/mach-npcm/headsmp.S
index 84d2b6daaf0b..1718b70b7e1d 100644
--- a/arch/arm/mach-npcm/headsmp.S
+++ b/arch/arm/mach-npcm/headsmp.S
@@ -5,6 +5,7 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
 #include <asm/assembler.h>
+#include <asm/cp15.h>
 
 .arch armv7-a
 
@@ -17,3 +18,40 @@ ENTRY(npcm7xx_secondary_startup)
 
 	b	secondary_startup
 ENDPROC(npcm7xx_secondary_startup)
+
+#ifdef CONFIG_HOTPLUG_CPU
+/*
+ * void npcm7xx_cpu_park(unsigned long phys_reset, unsigned long rom_addr)
+ *
+ * Exit cache coherency and jump back to the boot ROM reset vector via
+ * cpu_reset() in the identity mapping.  Must be called after
+ * setup_mm_for_reboot() with IRQs and FIQs disabled, and must not access
+ * memory or the stack once SCTLR.C is cleared.
+ */
+ENTRY(npcm7xx_cpu_park)
+	mov	r7, r0
+	mov	r8, r1
+
+	mrc	p15, 0, r0, c1, c0, 0
+	bic	r0, r0, #(CR_I | CR_Z)
+	bic	r0, r0, #(CR_C | CR_A)
+	mcr	p15, 0, r0, c1, c0, 0
+	isb
+
+	bl	v7_flush_dcache_louis
+
+	mrc	p15, 0, r0, c1, c0, 1
+	bic	r0, r0, #(1 << 6)		@ clear ACTLR.SMP
+	mcr	p15, 0, r0, c1, c0, 1
+
+	mov	r0, #0
+	mcr	p15, 0, r0, c7, c5, 0		@ ICIALLU
+	mcr	p15, 0, r0, c7, c5, 6		@ BPIALL
+	dsb
+	isb
+
+	mov	r0, r8
+	mov	r1, #0
+	bx	r7
+ENDPROC(npcm7xx_cpu_park)
+#endif
diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
index 4c1fc9983746..6055d44075ac 100644
--- a/arch/arm/mach-npcm/platsmp.c
+++ b/arch/arm/mach-npcm/platsmp.c
@@ -7,37 +7,35 @@
 #include <linux/delay.h>
 #include <linux/smp.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <asm/cacheflush.h>
+#include <asm/idmap.h>
+#include <asm/irqflags.h>
+#include <asm/proc-fns.h>
 #include <asm/smp.h>
 #include <asm/smp_plat.h>
 #include <asm/smp_scu.h>
 
 #define NPCM7XX_SCRPAD_REG 0x13c
 
+/* The boot ROM is mapped at the high vectors and holds the reset vector. */
+#define NPCM7XX_ROM_RESET_VECTOR 0xffff0000
+
 extern void npcm7xx_secondary_startup(void);
+#ifdef CONFIG_HOTPLUG_CPU
+extern void __noreturn npcm7xx_cpu_park(unsigned long phys_reset,
+					unsigned long rom_addr);
+#endif
+
+static void __iomem *gcr_base;
 
 static int npcm7xx_smp_boot_secondary(unsigned int cpu,
 				      struct task_struct *idle)
 {
-	struct device_node *gcr_np;
-	void __iomem *gcr_base;
-	int ret = 0;
-
-	gcr_np = of_find_compatible_node(NULL, NULL, "nuvoton,npcm750-gcr");
-	if (!gcr_np) {
-		pr_err("no gcr device node\n");
-		ret = -ENODEV;
-		goto out;
-	}
-	gcr_base = of_iomap(gcr_np, 0);
-	of_node_put(gcr_np);
-	if (!gcr_base) {
-		pr_err("could not iomap gcr");
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!gcr_base)
+		return -ENODEV;
 
 	/* give boot ROM kernel start address. */
 	iowrite32(__pa_symbol(npcm7xx_secondary_startup), gcr_base +
@@ -45,13 +43,12 @@ static int npcm7xx_smp_boot_secondary(unsigned int cpu,
 	/* make sure the previous write is seen by all observers. */
 	dsb_sev();
 
-	iounmap(gcr_base);
-out:
-	return ret;
+	return 0;
 }
 
 static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
 {
+	struct device_node *gcr_np;
 	struct device_node *scu_np;
 	void __iomem *scu_base;
 
@@ -70,11 +67,83 @@ static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
 	scu_enable(scu_base);
 
 	iounmap(scu_base);
+
+	gcr_np = of_find_compatible_node(NULL, NULL, "nuvoton,npcm750-gcr");
+	if (!gcr_np) {
+		pr_err("no gcr device node\n");
+		return;
+	}
+	gcr_base = of_iomap(gcr_np, 0);
+	of_node_put(gcr_np);
+	if (!gcr_base)
+		pr_err("could not iomap gcr\n");
+}
+
+#ifdef CONFIG_HOTPLUG_CPU
+/*
+ * The dying CPU moves to this stack before it takes the identity mapping,
+ * because its vmapped idle stack is not guaranteed to be mapped there. One
+ * stack is enough: CPU hotplug is serialised and npcm7xx_cpu_kill() waits
+ * for the CPU to leave the kernel.
+ */
+static u64 npcm7xx_cpu_die_stack[64];
+
+/*
+ * The SoC cannot reset or power down a single core, so hand the core back
+ * to the boot ROM instead. Entered through the reset vector with the MMU
+ * and caches off, the ROM parks a secondary core the same way it does
+ * after a real reset: it overwrites SCRPAD and waits in WFE for
+ * npcm7xx_smp_boot_secondary(). The core no longer executes from RAM.
+ */
+static void __noreturn npcm7xx_cpu_reset(void)
+{
+	unsigned long phys_reset = virt_to_idmap(cpu_reset);
+
+	setup_mm_for_reboot();
+	npcm7xx_cpu_park(phys_reset, NPCM7XX_ROM_RESET_VECTOR);
+}
+
+static void npcm7xx_cpu_die(unsigned int cpu)
+{
+	u64 *stack = npcm7xx_cpu_die_stack +
+		     ARRAY_SIZE(npcm7xx_cpu_die_stack);
+
+	local_fiq_disable();
+
+	asm volatile("mov\tsp, %0\n\t"
+		     "mov\tfp, #0\n\t"
+		     "bx\t%1"
+		     :
+		     : "r" (stack), "r" (npcm7xx_cpu_reset)
+		     : "memory");
+
+	unreachable();
+}
+
+static int npcm7xx_cpu_kill(unsigned int cpu)
+{
+	u32 val;
+
+	if (!gcr_base)
+		return 0;
+
+	/*
+	 * The boot ROM overwrites the kernel entry point left in SCRPAD once
+	 * the core is parked, so wait for that before declaring it dead.
+	 */
+	return !readl_poll_timeout(gcr_base + NPCM7XX_SCRPAD_REG, val,
+				   val != __pa_symbol(npcm7xx_secondary_startup),
+				   100, 100 * USEC_PER_MSEC);
 }
+#endif
 
 static struct smp_operations npcm7xx_smp_ops __initdata = {
 	.smp_prepare_cpus = npcm7xx_smp_prepare_cpus,
 	.smp_boot_secondary = npcm7xx_smp_boot_secondary,
+#ifdef CONFIG_HOTPLUG_CPU
+	.cpu_die = npcm7xx_cpu_die,
+	.cpu_kill = npcm7xx_cpu_kill,
+#endif
 };
 
 CPU_METHOD_OF_DECLARE(npcm7xx_smp, "nuvoton,npcm750-smp", &npcm7xx_smp_ops);
