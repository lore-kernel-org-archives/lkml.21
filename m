Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796310;
	b=Tfo2tbCR3UpZa3GQCu6ykF6U88SO/zVHw4zRDRZ0/7W8LcMMPUqcQk2z6SadLgDmHTKS
	 7VSR5Pwa2L9tGwzxpbzgdh+tB4H1Eh5BjOJExaxxi/wUP97z9l7T8KvdPhb7cNvJO17bc
	 i96032b0a9mWLBgKuzFfq/huZUr50P9gvE2rgD/67mcSyjnHUZHHImrDZP7l+UYXLA1dC
	 6phpW1XDpaprtyo4G5fEiUsZVE0LHv62ZaQcqJJe4yzBAhZaNR80UXNddggHBpXFCevDY
	 iNhdrzpzcRltO6nZAYzWBm9maJ7GlNPBpK+kYqMT8FDP0K7oGCrubCQottN5w9nGQlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Kr13DuyWLOWEbolqswEDjBCQ2Np9FP0d95Dzadr2L70=;
	b=OTEJwpa1wDZgEIRIWZIDkunNP5fTGVUwf7lY4/O3HhyzxdUPGbVJ3CYrAo3ePGMUyrA1
	 DWwVXgCutHt1qAvGBjLCwQ7LuSsweiuRxPbFk/Fti4ULYEc76fv00vbtlhwoF0qLw0+V5
	 Xmh2F8hPIqSWifrrFmtAUkHt263jjtelmQhXP7MiIycOZX25ILYWoLUSj9ItGsybkO8dj
	 Mudf1keRznAzRvNHl60Qe/Z9XO/aK1t7BXtDV4zuOYfXfbuLuzdW+7w/dlLwZnjgavj9c
	 eD3gOWy5JkexeQPzQ5shgB8AWBdvLkOwtzpQTfcXYDyGvcY3mMcYqDdkMBxUyRepmgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ncXqvhnO;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F5E606A337
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5F5E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ncXqvhnO
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so54471415e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795796306; x=1796401106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kr13DuyWLOWEbolqswEDjBCQ2Np9FP0d95Dzadr2L70=;
        b=ncXqvhnO/g9d3lXexsdqCJ7vpPUBwU2CK860KziiO5W8GasMH/nYbeIxTV2e2izn5H
         LUD2bki6qKFSHS1G9F+YwSmyUXf35Wvw+sx76W/O1B2I/Hy3kx8mpMNfJZRVL8HB47j/
         kP849WH/FeASXP5vXmDSwek77jvYtGEqaJWPxfIYj1gN8Q5B2Eh8D4bv3N0E7JesgwnL
         GFKlN4OkztKvmn677yvDpGI07HJpcFeWkAnSMglR1P3hKrGbc2jmBJvp82ICULwfoYeS
         2RQ5MhOd0V2MYAI70HRUzl7DneoVxfTtY1vY1igLRAkZbpX9OwRNiM5gddhsjyL5mZt6
         Coow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795796306; x=1796401106;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kr13DuyWLOWEbolqswEDjBCQ2Np9FP0d95Dzadr2L70=;
        b=NxCtfanONo4piM4cLv7kjERaK70SRg39KgcOHrHEASrEFM5ncsPwR2hWs0ewz39PZ4
         OvAGssgRGDG6R3lzMvtxr5Pqap98a6DkS+JeglplreWXR/G7RZSQh60YjNd62yZsBcfI
         XVA+KPb3hZhZGUYq/flk3H4JvyY8WMr7vuLGHqh7Aeci87EgPPbTKpa+nfp0sA7YM+d4
         3ox2BimY8NCsMKdFoVbw9qc6L7kUeBqao2j7N0C2A19WaTeDUT9jIxe68wok8gKvqour
         unw/49ntWtLZdx8mRfcPvXlIIGm3j7vEm2247qsCRPwnItBoa5hOy2NfSIDT5J/BeegR
         5LCQ==
X-Forwarded-Encrypted: i=1; AL+hErE0EmJ043oQQeZOXuM180fv3nFJQNH4v3nFcCsCri0uDNDoDll8xkzbKp8h4wnGrOgqUVZhlQTS5mTUidw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9elqncGdBwlbMTsef0HuwrWG91H53cp5wS9YZGdsV2TSeFDFPD
	7MkDYuoNYvMOswl5Tf/4jnpZ2y/tel7sbizq5W4nHadFaADVQ5bMr8zc1yEkoU4KzXA=
X-Gm-Gg: AZFdTZcwz9J5Vmxpfa0MlYKmg70MClvH/Jc7hWhb+oQJ/BJyahvnRcNDeigERzhPgUk
	BkevIe6RILkymT6vInmrPF40Fw3InTrPzOMajg+zDtofPCMAnhnf5cGXuvnqQy3C8mJmtZcqUCV
	SbtmxD+Y0SY4IOknt2x6nhlkOa5NlqzEY5chSHvf4/JAvqYBrWY4LgHL2aUg5x863/C+ytgQQSa
	Gabg3X2Pob9iRRSdBV7t9JXxrHmNyLSNJmiCdgapVFXVR2hVTjV6+Sh1pBYk0YfA2A/qVCnLIZI
	LGR1PtF5qU+ATo1WNAAd0x7/nwkLxA32Xj9RWCGjI3in3XOD9w9GxMY+Sr3d/3buW9OBt9KqLn+
	N0/3rtEBWKFgjKgfKgabe1mcNfipk7Vmw3nnK8Y+i78ZvKMp+hY6Olfg70oKwrBJ85fZ3/iJALt
	8qqWj8jAo+YmPuCK2JqzHFMeUBesH1qRlM5tktooFWZUzLpT57dWufhQ4SxKxcsmlIGx0SNn04J
	xsM/wvyqW8ijtsa+s3wrIa0S1XxEeUicDtuX/U6h15oKvC4ZqbZVllqjqYmqNXRgyH0H8PynfYr
	dGnd6IESirKe0fGOXpmDJr2ty31bVQiscMTgcOzkIF71KmeQoemPpXD/O+FdObCWhdcJUS4NNc1
	aV7kXf0g=
X-Received: by 2002:a05:600d:12:b0:4bb:8143:e182 with SMTP id 5b1f17b1804b1-4bb88800168mr397614005e9.5.1795796305824;
        Fri, 27 Nov 2026 08:18:25 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bba3d3679bsm109985755e9.2.2026.11.27.08.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:18:25 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: daniel.lezcano@kernel.org,
	tglx@kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	=?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
Subject: [PATCH RFC v2] clocksource/drivers/timer-clint: Add Espressif ESP32-P4 support
Date: Fri, 27 Nov 2026 16:18:23 +0000
Message-ID: <20261127161823.131126-1-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-9-vitorhg20080@gmail.com>
References: <20261125233020.1380594-9-vitorhg20080@gmail.com>
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

The ESP32-P4 delivers machine-mode timer interrupts through the CLIC.
Select the ESP32-P4 handling by compatible string, parse the two-cell
interrupt specifier and clear the timer interrupt through mtimecmp.

Program mtimecmp with three 32-bit writes to prevent an intermediate
compare value from triggering an early interrupt on RV32.

Enable the ESP32-P4 mtime counter before registering the clocksource
so it can be used even if firmware stopped it.

Require CONFIG_RISCV_ESP32P4_CLIC for the ESP32-P4 compatible. The CLIC
driver in this series supports a single hart, so this path leaves the
software interrupt masked. Other CLINT compatibles retain their
existing IPI setup.

Tested on a Waveshare ESP32-P4-Module-DEV-KIT. Verified CLINT
clocksource selection and delivery of timer interrupts.

AI assisted with driver development.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
Changes in v2:
- Require the ESP32-P4 CLIC configuration before probing the ESP32-P4 CLINT.
- Explain why the single-hart CLIC path leaves the software IRQ masked.
- Compile-tested with RV32 NOMMU, both with ESP32-P4 CLIC and with
  generic M-mode SMP.

This replaces patch 8/19 from v1 and uses the CLIC support introduced
earlier in that series.
v1: https://lore.kernel.org/all/20261125233020.1380594-9-vitorhg20080@gmail.com/

 drivers/clocksource/timer-clint.c | 61 +++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index e56eee7..fa525e2 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -20,6 +20,7 @@
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
+#include <linux/limits.h>
 #include <linux/of_irq.h>
 #include <linux/smp.h>
 #include <linux/timex.h>
@@ -31,6 +32,8 @@
 #define CLINT_IPI_OFF		0
 #define CLINT_TIMER_CMP_OFF	0x4000
 #define CLINT_TIMER_VAL_OFF	0xbff8
+#define ESP32P4_CLINT_MTIME_CTL_OFF	0x4010
+#define ESP32P4_CLINT_MTIME_EN		BIT(0)
 
 /* CLINT manages IPI and Timer for RISC-V M-mode  */
 static u32 __iomem *clint_ipi_base;
@@ -39,6 +42,7 @@ static u64 __iomem *clint_timer_cmp;
 static u64 __iomem *clint_timer_val;
 static unsigned long clint_timer_freq;
 static unsigned int clint_timer_irq;
+static bool clint_uses_clic __ro_after_init;
 
 #ifdef CONFIG_RISCV_M_MODE
 u64 __iomem *clint_time_val;
@@ -119,6 +123,29 @@ static int clint_clock_next_event(unsigned long delta,
 	return 0;
 }
 
+static void esp32p4_clint_write_cmp(u64 value)
+{
+	u32 __iomem *cmp = (u32 __iomem *)clint_timer_cmp;
+
+	/* Keep the intermediate RV32 compare values from expiring early. */
+	writel_relaxed(U32_MAX, cmp);
+	writel_relaxed((u32)(value >> 32), cmp + 1);
+	writel_relaxed((u32)value, cmp);
+}
+
+static int esp32p4_clint_next_event(unsigned long delta,
+				    struct clock_event_device *ce)
+{
+	esp32p4_clint_write_cmp(clint_get_cycles64() + delta);
+	return 0;
+}
+
+static int esp32p4_clint_shutdown(struct clock_event_device *ce)
+{
+	esp32p4_clint_write_cmp(U64_MAX);
+	return 0;
+}
+
 static DEFINE_PER_CPU(struct clock_event_device, clint_clock_event) = {
 	.name		= "clint_clockevent",
 	.features	= CLOCK_EVT_FEAT_ONESHOT,
@@ -130,13 +157,23 @@ static int clint_timer_starting_cpu(unsigned int cpu)
 {
 	struct clock_event_device *ce = per_cpu_ptr(&clint_clock_event, cpu);
 
+	if (clint_uses_clic) {
+		ce->set_next_event = esp32p4_clint_next_event;
+		ce->set_state_shutdown = esp32p4_clint_shutdown;
+		ce->set_state_oneshot_stopped = esp32p4_clint_shutdown;
+		esp32p4_clint_shutdown(ce);
+	}
+
 	ce->cpumask = cpumask_of(cpu);
 	clockevents_config_and_register(ce, clint_timer_freq, 100, ULONG_MAX);
 
 	enable_percpu_irq(clint_timer_irq,
 			  irq_get_trigger_type(clint_timer_irq));
-	enable_percpu_irq(clint_ipi_irq,
-			  irq_get_trigger_type(clint_ipi_irq));
+	/* The ESP32-P4 CLIC path runs on a single hart and needs no IPIs. */
+	if (!clint_uses_clic)
+		enable_percpu_irq(clint_ipi_irq,
+				  irq_get_trigger_type(clint_ipi_irq));
+
 	return 0;
 }
 
@@ -155,7 +192,10 @@ static irqreturn_t clint_timer_interrupt(int irq, void *dev_id)
 {
 	struct clock_event_device *evdev = this_cpu_ptr(&clint_clock_event);
 
-	csr_clear(CSR_IE, IE_TIE);
+	if (clint_uses_clic)
+		esp32p4_clint_shutdown(evdev);
+	else
+		csr_clear(CSR_IE, IE_TIE);
 	evdev->event_handler(evdev);
 
 	return IRQ_HANDLED;
@@ -163,11 +203,15 @@ static irqreturn_t clint_timer_interrupt(int irq, void *dev_id)
 
 static int __init clint_timer_init_dt(struct device_node *np)
 {
+	bool esp32p4 = of_device_is_compatible(np, "esp,esp32p4-clint");
 	int rc;
 	u32 i, nr_irqs;
 	void __iomem *base;
 	struct of_phandle_args oirq;
 
+	if (esp32p4 && !IS_ENABLED(CONFIG_RISCV_ESP32P4_CLIC))
+		return -ENODEV;
+
 	/*
 	 * Ensure that CLINT device interrupts are either RV_IRQ_TIMER or
 	 * RV_IRQ_SOFT. If it's anything else then we ignore the device.
@@ -179,7 +223,7 @@ static int __init clint_timer_init_dt(struct device_node *np)
 			continue;
 		}
 
-		if ((oirq.args_count != 1) ||
+		if (oirq.args_count != (esp32p4 ? 2 : 1) ||
 		    (oirq.args[0] != RV_IRQ_TIMER &&
 		     oirq.args[0] != RV_IRQ_SOFT)) {
 			pr_err("%pOFP: invalid irq %d (hwirq %d)\n",
@@ -212,10 +256,18 @@ static int __init clint_timer_init_dt(struct device_node *np)
 		return -ENODEV;
 	}
 
+	if (esp32p4) {
+		void __iomem *ctl = base + ESP32P4_CLINT_MTIME_CTL_OFF;
+		u32 val = readl(ctl);
+
+		writel(val | ESP32P4_CLINT_MTIME_EN, ctl);
+	}
+
 	clint_ipi_base = base + CLINT_IPI_OFF;
 	clint_timer_cmp = base + CLINT_TIMER_CMP_OFF;
 	clint_timer_val = base + CLINT_TIMER_VAL_OFF;
 	clint_timer_freq = riscv_timebase;
+	clint_uses_clic = esp32p4;
 
 #ifdef CONFIG_RISCV_M_MODE
 	/*
@@ -275,3 +327,4 @@ fail_iounmap:
 
 TIMER_OF_DECLARE(clint_timer, "riscv,clint0", clint_timer_init_dt);
 TIMER_OF_DECLARE(clint_timer1, "sifive,clint0", clint_timer_init_dt);
+TIMER_OF_DECLARE(esp32p4_clint, "esp,esp32p4-clint", clint_timer_init_dt);
