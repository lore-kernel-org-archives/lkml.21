Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443758;
	b=Y9Izuj1E4vnhE8sjywCNfBr/VZuHRzKX/HEDvF44mEH3PqVMPy8np+Ou8ZFJ/m5Uz7yP
	 ozgkEi1hhXAxIO1k2wzhEMCq4OzQhVJWeGU8lEJ0ATuMNujs8+9R6ugQ09PKT+k0eUFFE
	 ZBy6QFpuvrIar/RlZcSIpVwmTf5ELKIFq3Xrz/xwTMzsJFPgEXg7J/2A9GnZc5m1aVqgl
	 HDuOjwmvc1j3plgynxJDMPSdv25RFaTU/hsvlrFxHNXjotT+bZQg+l634/zkAXrDZq3B0
	 1Mm78UO92hAtnFGs3M6TEGww7oBV2uW3tBflQfkd05l0OqYOAgaDT4i42qBr0jcLXxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kD8O5puOfG0iheU7XPAAEXfV6psMblSZ2+dPBGXa1+c=;
	b=Ym90L4PfIDxKRmPn+sMHpheo3hq2+DuRm4fXRM8ANylBRryCFs70wBFg/F/8cOF1G2m/
	 iMz/sTfIRIzySXAojrl01QNcIfGVlui/xdEAUgVVva++qxNI+auM8fu2JlJTW0gF3oqyq
	 n8CTbpjBizfWGkXc9YX5lMl79nbpi3GynsvaAL29vUsbU+GNvabxK92kYOx2dO8nOHFcI
	 hhMLUZxbDUeeVjbBxoNoQRSIzNCc4k16uGxpMcGYHfb36Fmuu27OvYB96FeGAfJsfkAgP
	 aiU+Ouh/ZukaLOwU5H8Cgg9lpIPrEOA6iaqFcEMOJswrjSbx+8XSBvOwrmaYvmhznkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GTqgWQuu;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FCC606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41FCC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GTqgWQuu
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2761c69fbso2112846c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443757; x=1796048557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kD8O5puOfG0iheU7XPAAEXfV6psMblSZ2+dPBGXa1+c=;
        b=GTqgWQuu8m9TNH9RM6F8e5K8483tf+gEqXQ9hcyIUr1TlBb1rNOOioETbPXFkvIW0+
         a1cYQ0rUiWoR7tpEUqKFPd854qWJcmJXcTnJudSlo+HL8BRvLleDXqPRFBbQdyIs2oD2
         /UJfBYEQXYGDJ1iFTJ7DbpM6KYhcy5N3uQrJXXYS5hjxvWbyc/qWHR/DdT05+pS5iEJU
         uWq5ybnUBvFYwM6by25oZRhSEy8O1SJEZ9MMRxNgoRs7MN0RRfOHbw0t4vvaMZdXAuen
         gHiueAhn18/yAK1fmFW+mDGwZtfGFlquLeimGxDofj8/B/+zNHZB0nJFUfVCARcekTw0
         Jb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443757; x=1796048557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kD8O5puOfG0iheU7XPAAEXfV6psMblSZ2+dPBGXa1+c=;
        b=oy93w7A75meLbYtQXYYdY/5XySIS75PZh+DDBxHzdpkvab0+BER/W5JFSQuuMKlTLj
         qoCM8Bjy2OO6qwbc+qXoz9xw7wbEBUSN5UqQcV7TkkZQgneLmpwXQU5ZbSreJ2wKRUrC
         jW1Ks1ZaSjES5RuQXPBTrTXAD+xfoy2x+NkAyzgt1QBUy5tlB4KoG8Es1aUxicGB/3LZ
         CeZa3jHt2ambCwT3BDdyAJpMe5Tm9eY08ScZBiOyAdogIX7bpi+i7k7/YF7jCRfnCORD
         6UavFeAtPF0ml3t1qqDCEAc9Md14Np3rFqjwjwaYfQGqJkanmrtvk9I2ZA6qdUnOStgb
         qvJw==
X-Forwarded-Encrypted: i=1; AL+hErEaUd91gdGkMTd5WiJBLlE0nMuFSkBAu7BrEAbdrzc78dzDTbP9AQ2XmWSaCzeB+I2f6prUI+rvNXk65FE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cL9Ktbhi+VtU1YhgqIbMB9Of5ZLSXrlMRWCeDmY3r+sI0h+yM
	H9SNrghpIofVfGRVK4AzAYTRCSq4o7LrvyrlyJGw5Qqd7t6jP7TR3OY3EWm8zN1S
X-Gm-Gg: AZFdTZdcBW3P1sTxxG7GXIb6ytVbFzz9m2lica2xAKuCSd0ZZik9zdkhSNYAoOQm6yp
	p97jaBWDCJqEa8M1dOV8JJrydXA7OQk+ZRJVRwhVfjmf6EVCEwos/gcPIUIUsGeDR6OjhcKdRuv
	tVQk8ZnkQMiFe4jsv0gOf+YU8pzddd5AaRSUUIwxmlu8ey9SW62A/FcQO8vunvzbWbkJeW2qOEv
	+SvUT2R2tYcJE0beXJRzjfVewNMUqM4vGlhZA20Sp47XGjlr7IVJDgN+QqM9pNZTNRU6JKl6WrI
	o71uydn8KXwW+lJ+qFw9iWCmBG/0IaDkX7WUwAa5gsJf6HDANJfhwyGuj0MZSH4ww6+dISBH9qi
	8UZV9jsmjt+//vLnbFb35QcOIcrWHmTz3zZpQ5eu2yEhL/5um9DM2jeRLX0vBfj8JNwWgUDqWhW
	JgnIK5B/FVSZSvJv/556/GVDINJ5y89fo26DtUlMfOQqDk5vqoRp1WT6Cv576Z1soejYTtxHeMk
	cwDi/OsAJgoIhc0FLdNZCtBSZzPDg4ZdzYCcEqoWE2pPLqTjpSitV0yZPw8DXCfCXSX0TD3QgiJ
	y/oF4RDb+5YPYoFwDphmaJIg9BIxh1SNBKM1Fz/UN4qnn6J4ENiW88nM51IcRgmkDOAzmtmTzoU
	lX5mzfw+XX8TDfIgMhhWcvw==
X-Received: by 2002:a05:7022:ea45:b0:1b5:31db:cc3e with SMTP id a92af1059eb24-1b5568b2b4bmr10864171c88.11.1795443757139;
        Mon, 23 Nov 2026 06:22:37 -0800 (PST)
Received: from acemagic-m1 ([2401:7400:c804:b668:a7dc:f03c:3f60:caaf])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm38385854eec.28.2026.11.23.06.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:22:36 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Linus Walleij <linusw@kernel.org>,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: bcm: support more than two CPUs on BCMBCA
Date: Mon, 23 Nov 2026 22:22:00 +0800
Message-ID: <20261123142203.3860616-3-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123142203.3860616-1-hjf3108@gmail.com>
References: <20261123142203.3860616-1-hjf3108@gmail.com>
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

BCMBCA Cortex-A7 SoCs can have more than two cores, such as the
quad-core BCM6755. Extend the CFE SMP support to all secondary CPUs.

CFE parks every secondary CPU on the same mailbox, and the wakeup SGI
wakes all offline CPUs at once. Hold them in a pen and release them one
at a time.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 arch/arm/mach-bcm/Makefile         |  1 +
 arch/arm/mach-bcm/bcmbca_headsmp.S | 26 +++++++++++++++++
 arch/arm/mach-bcm/bcmbca_smp.h     |  9 ++++++
 arch/arm/mach-bcm/board_bcmbca.c   | 46 ++++++++++++++++++++++++------
 4 files changed, 73 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/mach-bcm/bcmbca_headsmp.S
 create mode 100644 arch/arm/mach-bcm/bcmbca_smp.h

diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
index fcc4e0174a..c3cd2959bc 100644
--- a/arch/arm/mach-bcm/Makefile
+++ b/arch/arm/mach-bcm/Makefile
@@ -60,4 +60,5 @@ endif
 ifeq ($(CONFIG_ARCH_BCMBCA),y)
 obj-y				+= board_bcmbca.o
 obj-$(CONFIG_SMP)		+= bcm63xx_smp.o bcm63xx_pmb.o
+obj-$(CONFIG_SMP)		+= bcmbca_headsmp.o
 endif
diff --git a/arch/arm/mach-bcm/bcmbca_headsmp.S b/arch/arm/mach-bcm/bcmbca_headsmp.S
new file mode 100644
index 0000000000..3d0d0d97be
--- /dev/null
+++ b/arch/arm/mach-bcm/bcmbca_headsmp.S
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * All CPUs will wake up on an SGI. Wait in the holding pen until
+ * bcmbca_cpu_release matches the MPIDR.
+ *
+ * Based on arch/arm/mach-versatile/headsmp.S
+ */
+#include <linux/linkage.h>
+#include <asm/assembler.h>
+
+	.arm
+ENTRY(bcmbca_secondary_startup)
+ ARM_BE8(setend	be)
+ THUMB(	badr	r9, 1f		)
+ THUMB(	bx	r9		)
+ THUMB(	.thumb			)
+ THUMB(1:			)
+	mrc	p15, 0, r0, c0, c0, 5
+	bic	r0, #0xff000000
+	adr_l	r6, bcmbca_cpu_release
+pen:	ldr	r7, [r6]
+	cmp	r7, r0
+	bne	pen
+
+	b	secondary_startup
+ENDPROC(bcmbca_secondary_startup)
diff --git a/arch/arm/mach-bcm/bcmbca_smp.h b/arch/arm/mach-bcm/bcmbca_smp.h
new file mode 100644
index 0000000000..30055cf766
--- /dev/null
+++ b/arch/arm/mach-bcm/bcmbca_smp.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __BCMBCA_SMP_H
+#define __BCMBCA_SMP_H
+
+extern int bcmbca_cpu_release;
+
+void bcmbca_secondary_startup(void);
+
+#endif /* __BCMBCA_SMP_H */
diff --git a/arch/arm/mach-bcm/board_bcmbca.c b/arch/arm/mach-bcm/board_bcmbca.c
index 248b8bd776..1afba1d680 100644
--- a/arch/arm/mach-bcm/board_bcmbca.c
+++ b/arch/arm/mach-bcm/board_bcmbca.c
@@ -1,14 +1,20 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (C) 2024 Linus Walleij <linus.walleij@linaro.org>
 
+#include <linux/cache.h>
+#include <linux/cacheflush.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/of.h>
 #include <linux/smp.h>
+#include <linux/units.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 #include <asm/smp_plat.h>
 
+#include "bcmbca_smp.h"
+
 #ifdef CONFIG_DEBUG_BCMBCA
 /* This is needed for LL-debug/earlyprintk/debug-macro.S */
 static struct map_desc bcmbca_io_desc[] __initdata = {
@@ -29,16 +35,28 @@ static void __init bcmbca_map_io(void)
 }
 
 #ifdef CONFIG_SMP
+int bcmbca_cpu_release __cacheline_aligned = -1;
+
+static void bcmbca_write_cpu_release(int val)
+{
+	WRITE_ONCE(bcmbca_cpu_release, val);
+	/* Order release write before cache clean and wakeup IPI */
+	smp_wmb();
+	sync_cache_w(&bcmbca_cpu_release);
+}
+
+static void bcmbca_secondary_init(unsigned int cpu)
+{
+	/* Let the primary processor know we're out of the pen */
+	bcmbca_write_cpu_release(-1);
+}
+
 static int bcmbca_boot_secondary(unsigned int cpu, struct task_struct *idle)
 {
 	struct device_node *np;
 	void __iomem *mailbox;
 	u32 release_addr;
-	int ret;
-
-	/* CFE has already powered up CPU1 and left it waiting in WFI. */
-	if (cpu_logical_map(cpu) != 1)
-		return -EINVAL;
+	int release, ret;
 
 	np = of_get_cpu_node(cpu, NULL);
 	if (!np)
@@ -58,17 +76,27 @@ static int bcmbca_boot_secondary(unsigned int cpu, struct task_struct *idle)
 	/*
 	 * The CFE stub reads GPIO GeneralPurpose after an interrupt and
 	 * branches to it in ARM state. Clear any Thumb function pointer
-	 * tag and complete the MMIO write before sending the wakeup IPI.
+	 * tag and complete the MMIO write before opening the pen and
+	 * sending the wakeup IPI.
 	 */
-	writel(__pa_symbol(secondary_startup_arm) & ~1, mailbox);
+	writel(__pa_symbol(bcmbca_secondary_startup) & ~1, mailbox);
 	dsb(sy);
-	arch_send_wakeup_ipi_mask(cpumask_of(cpu));
 	iounmap(mailbox);
 
-	return 0;
+	bcmbca_write_cpu_release(cpu_logical_map(cpu));
+	arch_send_wakeup_ipi_mask(cpumask_of(cpu));
+
+	ret = read_poll_timeout_atomic(smp_load_acquire, release,
+				       release == -1, 10, USEC_PER_SEC, false,
+				       &bcmbca_cpu_release);
+	if (ret)
+		bcmbca_write_cpu_release(-1);
+
+	return ret;
 }
 
 static const struct smp_operations bcmbca_smp_ops __initconst = {
+	.smp_secondary_init = bcmbca_secondary_init,
 	.smp_boot_secondary = bcmbca_boot_secondary,
 };
 
-- 
2.53.0

