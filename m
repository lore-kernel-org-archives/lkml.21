Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649468;
	b=OoFpa+h72chd+0MHxBmuKty0201gJlDec25niN9psUC5XqS0+/9xV1uqZG5EMYxhu/1S
	 brNkNKfHPp6SzrNoP76O/S/ELzhQMH/6dRgG6X3YqfcKfl3BLnoonaVmc1V0jsbeSAZhh
	 +FF7jSg9G6c+0otUr2tMNRRVHPugxRjl/eua5QF6kd0LvUbWg1bmC/1bhHz3n311tGYNn
	 onsuzbcusHdOrxruA+ExVoKgxd7RuYguV5o+skwSM6VTt3O22rTSAPrVJCykhdbQIVdDe
	 IpesYcxohqFIhpA1XIqPpEcWiXBSfonJjjJCRpeCz6zAMkZZTgVOp7G3O9HS7zdAIKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jE8tLg0LupH7ClQVfxPt5vWJCv8YBby0udaIwTLsjng=;
	b=JJawZRxRFHGAk1S2bEJUsJW6YA7erBHxBuyAjhwTYIWhLuagEVHcLracw3KAkF7vLI+9
	 yFkPj03iC8FdKXFSCw1v9WmeIVzqC8Q+FRKNa+TQHWKD7zjt+UhRs6aBQanCWarw3PUuI
	 mClidOUvNpE/KRUo+iTdzWSzA+f4dZCXEKELB4LGYVFXXJb7aUg65hGZXyR/Iv7ARESgC
	 TFNOKVC50DbL+J8kgIubhhq3ACcTI0GWiBHWmbHBD3AL97LeV1b5jMay4fIVnLy9gQCoQ
	 JZLL+GQUJ2xYpDiWY1gA+vS0TxbUMwwW7Upk/6pdPqr2l2bFQvYzZwfl2k6QNKcvA7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Feghz8HE;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA3E606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDA3E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Feghz8HE
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-497614c95f0so3629576f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649466; x=1796254266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jE8tLg0LupH7ClQVfxPt5vWJCv8YBby0udaIwTLsjng=;
        b=Feghz8HEtVN2aVqR8lImNvX7JfypMwrv+PoazFwNIjQqSmg6RH6P9E49xAXyTSEeQp
         YqLxql7P/ORNAA+a8uQZItuFlZwG8XIU8CIi7sqwFZyVxIk1sSDw+dgAObINhemRw/QD
         NeZGZefgy/fHSIRHY/Fh7fBkGub2YuUaktJUqU/Oga/7hYciBsQL2fp5FUxOj8cpn4Un
         U4ApT/gBwfrl3/lOjkH8+9yUwch9shGvjLfioCuW16cbMpt0CLCGdvUslDZYhLpBcMiM
         Gh6e7B1UGAEeAOkrwt7IdHCbLBXqp32i66m52P7ZcolHd4GIpD2vsHbni+Z0Yv5QYg68
         TSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649466; x=1796254266;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jE8tLg0LupH7ClQVfxPt5vWJCv8YBby0udaIwTLsjng=;
        b=IA/Y5xBfY9Xwl/piVaynBzMkM6hIu4Q1uqa28sk1+1JFZPznhdhcYootKl4s9xyHpx
         U0Xlihzn8rDCq/4FUTIJVxqDXICYtdVeUj0QIl+sxfDOpJW0QjIyoykXnDXfkXQ1ZImW
         AIEwbxKjW7PaXX61Dxit1N7/NhYQdSDCAL/jD5m7fY1gGvEjgjC0U9Bnf26DzScCuNR1
         9poJfcruphEcGJmn6mBMstx01XbO+Y2pDQaxDEJZSGEwRYK3MCAbtpxP599/ear5NjD6
         UObApqwiuJ75muTXu1zRJcVWsK6P0gbA0fEc+H+T8NJ9EvtPgW0w7nOLFhXq7+2Ued7Z
         tVJw==
X-Forwarded-Encrypted: i=1; AL+hErGnFWHzK8l+h4wS34Sff9q9lXex2Rgo7uaDZgoYzk/Z3PzZTVIcOe4dWra5nMwY1zCUad+btHslWZKUDqI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HvDXEIAZT9yvBy9bA2Zvb/Wi/lsZmOPEXEqoOS7mfZJA8MV7A
	i+I3GORxWVQhrl6O2C7y1tL0wAxYlVx2U0E0WDgv739hjyZU4+63YpTe
X-Gm-Gg: AZFdTZcasvYO9/vqik9/o9WvOhOddExwWj9jYiAz/7aKwUDh0JVLl38vj0/7slpCVVG
	bW+9XDGddH+X6wKoZ6uFK/S9O/55oYGhi/k13/3o6qEYjEc9WsC0lnTSCRKcjC+gtqb3cLiOs0I
	4tvcg0wDLfvsjsCt+5InigPYJOrhCZOPQJaJnjUZyqm9YkqEDYUPEHU6tHI/hUhYWT+JcMUlFpz
	qcliqiYxmTscW1T7uwukSUP95sc9KCr6MEb+y53YM+MrAUi+HNMX1ZKxnlOc5Z/IGhlDGyyl1y2
	yPPag98oDJBpZFkyW35ReC0dVQdVfeeTgRVL8+pFiNKlw6ZWcETL1KMPWQGHqRhf0RbrXbJ9Jzj
	npLWauxI4OXUX0u4uo6jZjNEeKCGY+IE1XPXlEmgKvSMuAS9lkOL6fXgLMrsonLp7qqlUqpP5ao
	7hED4CWoUc5QQdsTLVuDPHeUcUjOj6hnAZdfWxKCcKJok4Tf55Siu+DaVX48vpPXu01kIpqFUnV
	ierAFn+hUD6PACEG0KxQxiVrPVKkkz8S1OQHR4tZvIFWd3RTmOG/lGXljcgo6v3Xu1zVkxB6ZUV
	gSBMTJmvawYGBTbAigSOkpmjeg0dXvjbFfn5QKkmF4m1QcrBNv/Z0afRX9MDSWN51xvqMbyOKrC
	n5/Wa1DP91Q==
X-Received: by 2002:a05:6000:4381:b0:4a6:5a2a:f5a3 with SMTP id ffacd0b85a97d-4abaa9773abmr40228173f8f.3.1795649466298;
        Wed, 25 Nov 2026 15:31:06 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm44084859f8f.21.2026.11.25.15.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:06 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH RFC 08/19] clocksource/drivers/timer-clint: Add Espressif ESP32-P4 support
Date: Wed, 25 Nov 2026 23:30:09 +0000
Message-ID: <20261125233020.1380594-9-vitorhg20080@gmail.com>
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

The ESP32-P4 delivers machine-mode timer interrupts through the CLIC.
Select the ESP32-P4 handling by compatible string, parse the two-cell
interrupt specifier and clear the timer interrupt through mtimecmp.

Program mtimecmp with three 32-bit writes to prevent an intermediate
compare value from triggering an early interrupt on RV32.

Enable the ESP32-P4 mtime counter before registering the clocksource
so it can be used even if firmware stopped it.

Tested on a Waveshare ESP32-P4-Module-DEV-KIT. Verified CLINT
clocksource selection and delivery of timer interrupts.

AI assisted with driver development.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 drivers/clocksource/timer-clint.c | 57 ++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index e56eee7e3781..bf5bae077d7a 100644
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
@@ -130,13 +157,22 @@ static int clint_timer_starting_cpu(unsigned int cpu)
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
+	if (!clint_uses_clic)
+		enable_percpu_irq(clint_ipi_irq,
+				  irq_get_trigger_type(clint_ipi_irq));
+
 	return 0;
 }
 
@@ -155,7 +191,10 @@ static irqreturn_t clint_timer_interrupt(int irq, void *dev_id)
 {
 	struct clock_event_device *evdev = this_cpu_ptr(&clint_clock_event);
 
-	csr_clear(CSR_IE, IE_TIE);
+	if (clint_uses_clic)
+		esp32p4_clint_shutdown(evdev);
+	else
+		csr_clear(CSR_IE, IE_TIE);
 	evdev->event_handler(evdev);
 
 	return IRQ_HANDLED;
@@ -163,6 +202,7 @@ static irqreturn_t clint_timer_interrupt(int irq, void *dev_id)
 
 static int __init clint_timer_init_dt(struct device_node *np)
 {
+	bool esp32p4 = of_device_is_compatible(np, "esp,esp32p4-clint");
 	int rc;
 	u32 i, nr_irqs;
 	void __iomem *base;
@@ -179,7 +219,7 @@ static int __init clint_timer_init_dt(struct device_node *np)
 			continue;
 		}
 
-		if ((oirq.args_count != 1) ||
+		if (oirq.args_count != (esp32p4 ? 2 : 1) ||
 		    (oirq.args[0] != RV_IRQ_TIMER &&
 		     oirq.args[0] != RV_IRQ_SOFT)) {
 			pr_err("%pOFP: invalid irq %d (hwirq %d)\n",
@@ -212,10 +252,18 @@ static int __init clint_timer_init_dt(struct device_node *np)
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
@@ -275,3 +323,4 @@ fail_iounmap:
 
 TIMER_OF_DECLARE(clint_timer, "riscv,clint0", clint_timer_init_dt);
 TIMER_OF_DECLARE(clint_timer1, "sifive,clint0", clint_timer_init_dt);
+TIMER_OF_DECLARE(esp32p4_clint, "esp,esp32p4-clint", clint_timer_init_dt);
-- 
2.56.1

