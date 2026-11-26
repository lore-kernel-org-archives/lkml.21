Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716685;
	b=bqCUaPgiFrw2wzd7SBJzLlaA4t8x498+iY/SuRqmivm/kE7SQq8l+oeEvZuter/PSBc1
	 F9sRsSJwY4xNlcLh2zAlxnjQVXcH01w8NsYerl2kQMgnJXf42SHb/UU8W+o1t2zXO/iJv
	 7EgE6WO4qNXEa1EbNCLHSxnqRdA8+SO/nnxCLoZyDb2x+/3aJ0kUAYRDuSVSEuK6CNKcY
	 3+DTCY7yJZG87xRDchva6WNeF8TYO4yjemKG9omfQr2O1987kUE/E6QinY2XOdSo0Expf
	 8/RVwI6JtgWS633xPCPX1T+CXT1zkF1bx1BzrJjEYqRzYI2CVizHUbsBm+zGUwlTIFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sv7Rf1rucixu4R1GE8Wfa1cFo464t6/j9QkDaOQ/q4A=;
	b=X8Gwamw5jA3zVwWolOvt+d7zm6RCIROor8xRsq2zwB1mg0xFsfhrBhuX3G2Ctqnon571
	 De3zxiP5I9ww7DwAQKU4VM1x8Jw3M9bKVwUMffvfXEWIsuWuMs9tHu7asj/Bd1Qxg2hYc
	 8mOAK2wAdlCjF4gvGNNHQfkvPfjo9+5uS/7/Q2ug8nzWMdwZXnw0UwtyWJ/RK0ODVg84F
	 i5qUcxwbagjkxltBiITpWq9FMGoUHAvb1vI7xzBwZN5WHA2Cuu+fQnrRrtgEWyYC85PKx
	 Dz3CO27iFlUUochMbCD2I3XYYLNmRNXGjBW5BVAYnLeWtNsx1e5Xy5l8lXG8UIGPQpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JN+XCm5C;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59748606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59748606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JN+XCm5C
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1ae58d17cd9so8174339c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716684; x=1796321484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sv7Rf1rucixu4R1GE8Wfa1cFo464t6/j9QkDaOQ/q4A=;
        b=JN+XCm5C5qUY+ciW5i/SKrzcji91u/qIfbHZAxVtUPHr9h1A+gMajLPfsUqcgyx8+r
         +COWACtca3e75+YKfHDiWT9umJLKf3PaHj/bXifVsxD2a0XWCqlcm5r3n6My5PCs+3Pn
         SPH6GEIKz5irRQremBOiExcfs0ONVSSFIFGHAX3yAzQl/7E2hdmwmLpYIj1PxF7ToWkr
         vVAIcXrTJ9oSA/weB3Qce6/5SNL4mF+3LbuEkYaYIJ4O0FrZCGFUXcdwFkmIsiAymuTV
         BduEH+Fqf6NeecyB5GL7DfNliJtcgy5l9kW4ttT/kj0PCiUrfeu1whd9NxmgtL2fecpR
         +ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716684; x=1796321484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sv7Rf1rucixu4R1GE8Wfa1cFo464t6/j9QkDaOQ/q4A=;
        b=iIx7nPGXg3zTPOU3+4lOhc35OSw7J+H1ZPkFdzZb1SvyMGfcMCrKeY1S9LLg6VKehk
         u51UgJmdMrGB8Jw6XEokx50GC3FBDB0OlSXYoprkcKGnoEFFPuIFjuKIWVyHQG+hEUrn
         Abr0ru5KLa1vE2u3RbSiGESQRTTIh4sKl3+gMo6gQCbc5g0DRvAUgI25bqGdU+rql5PI
         Ktz2N2XRFJP6l22N1kF+o4GwdA6sh3muft+CXAgDoqeGn4o/niS1KLaRZ1qsT6/EoHfL
         iSYbA05p0gQSZDHBsXqO6FzPMBBZ3EDwvrlVyaGlR4cd/N8y20g4AhWV9XtIooPgVQHC
         5O5Q==
X-Forwarded-Encrypted: i=1; AL+hErGgDP4g/9YopTyoiD88ckzw2+HMQW3AFu+PcPXgCZBadd9e/52RDKj+03rz8MykN53ni596+/V3xiRVLew=@vger.kernel.org
X-Gm-Message-State: APuU4Z83Wc8ggRMUICfEW1PbOpc5Qw8i1jJ6QPKFF7C6Klt2vjsVxgr1
	YE5hhPmZriUrdkM5ThOK1qdTNLZH2Rn99K1WHoYvIM6aMW+oL9eiRNPp
X-Gm-Gg: AZFdTZcAMvTPo1ox+hCgwVckPs8IRpeoU3/ZSzqhsGxm0DFb4em08ap8Vl8f1VIXsF9
	0b9Dpq52yHJEBT6fOvZRcbOJ1RaCDLRj+CXYFTdjbXRVUFM4S1lD9IgH+OxhpKhv13P7pWbJLuq
	BQ3qh05nKjRXleLhZsIET9bPNHuwcFoaiAreOZtJ0IOOImt9QKwegp/kFGXjS6m1ddnNy0UFdzC
	EoYo34GL21tDnr2NXehlPqCsRu92msioJ2QlGItsAlDjyBzsJuxnejZ+JGkwDsaOW1NuiWbYOfa
	Vq1222tQQ+ZDPK+/OMCJKN+C694PTuOKWzAtH7dqD8Ly8sE6hYnfS32lMf7hL0reVup1Uw6p6KJ
	Ikhg6UCFV2H3p/HALtTNm78376DKePOtRrFi9yyEvl4BDBMRNK3u+dRLIbU3sV7oUzt1+xorF1i
	vYs8DNRPP/HOKl1iEH0VXwir1AIJfm7Jkm5oqu6DnKCLEAExwcL1xJfherNEGxy7MsMB8W3Rvpl
	NxcNk1Yslk5jBsStYoftvZEVZcCYIvevCuCtwrsJWvz/BzMJLzGi6tcfWoBfCKC8zNci5y3kWl+
	VoKR1NeweCkKRf9j3kyn4tayKOekMyizJ/lPQDOJJmXSHqhAq4YTirGSz0rwaJuo08k+hevITl/
	RqOIn67HfldGIKp81q9JFbm2BGUp2OAiF6MIugFPaYrcU
X-Received: by 2002:a05:701b:2604:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1b5568b9037mr21805969c88.27.1795716684439;
        Thu, 26 Nov 2026 10:11:24 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:24 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 1/9] clocksource/drivers/timer-goldfish: Fix latch corruption with spinlock
Date: Thu, 26 Nov 2026 18:10:53 +0000
Message-ID: <20261126181101.3715754-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126181101.3715754-1-visitorckw@gmail.com>
References: <20261126181101.3715754-1-visitorckw@gmail.com>
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

Reading TIMER_TIME_LOW latches the upper 32 bits of the current time
into TIMER_TIME_HIGH. Because goldfish_timer_read() reads these two
registers without synchronization, a concurrent reader from an interrupt
or another CPU can read TIMER_TIME_LOW in between and overwrite the
latched high bits.

Protect the register read sequence with a raw spinlock.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 3fe12c7ee7b7..cc02b012ff76 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -6,6 +6,7 @@
 #include <linux/clockchips.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/goldfish.h>
 #include <clocksource/timer-goldfish.h>
 
@@ -14,6 +15,7 @@ struct goldfish_timer {
 	struct clock_event_device ced;
 	struct resource res;
 	void __iomem *base;
+	raw_spinlock_t lock;
 };
 
 static struct goldfish_timer *ced_to_gf(struct clock_event_device *ced)
@@ -30,6 +32,7 @@ static u64 goldfish_timer_read(struct clocksource *cs)
 {
 	struct goldfish_timer *timerdrv = cs_to_gf(cs);
 	void __iomem *base = timerdrv->base;
+	unsigned long flags;
 	u32 time_low, time_high;
 	u64 ticks;
 
@@ -37,8 +40,10 @@ static u64 goldfish_timer_read(struct clocksource *cs)
 	 * time_low: get low bits of current time and update time_high
 	 * time_high: get high bits of time at last time_low read
 	 */
+	raw_spin_lock_irqsave(&timerdrv->lock, flags);
 	time_low = gf_ioread32(base + TIMER_TIME_LOW);
 	time_high = gf_ioread32(base + TIMER_TIME_HIGH);
+	raw_spin_unlock_irqrestore(&timerdrv->lock, flags);
 
 	ticks = ((u64)time_high << 32) | time_low;
 
@@ -107,6 +112,7 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		return -ENOMEM;
 
 	timerdrv->base = base;
+	raw_spin_lock_init(&timerdrv->lock);
 
 	timerdrv->ced = (struct clock_event_device){
 		.name			= "goldfish_timer",
-- 
2.56.1.839.g22a8290db9-goog

