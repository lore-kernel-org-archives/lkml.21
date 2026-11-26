Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716715;
	b=o686F+iqjoOdPL8gbL82IhuNySEpzqYbuE7RFvtvXPOPqrje9pGwsCDagSGCh+YEHBoR
	 U33dJbEkvzuSK2ROfh+C90ETA+1PorAjU5ktAh4C+Y51gvBubr1CYRutMW1JG0eCmrPvT
	 7qRYirk3Ut5Me8xoP4VYDbH99Ln9zq5hv9QmUplgdirQewMiSk5BDB3oZligS5eKaxeHF
	 B7+s7KPl/aPC0CzezLnqg593UaZy3nx0o/lf7/T+9lWf8rdB8mErhdPsqYGPULN2KKVOs
	 v5k4Sl/cevf/QapTYMcZDrEjC6eJiarGFNfB3LvT2+M50ghX7n4LEF/5/CsxRogLJ1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ohcenfLUMndMbNU9mTZepLoct+4NVwlucM8NCOZrsDE=;
	b=XBEkYSLIEzhKhtddel8gUD89sgW+SlQlzVecXU22lMx+azf9CPxrRiNSXWJp1PeG/iPN
	 JQqAwIu/T568Va/fTD2TZIWJ31X2b7Cr4ZfCtgDtLNRDPrmcL72OcRu3m27dSxhkChfaj
	 Wr4+xZBAtAtTHsvE2/mI5WskkvxK+vu4Tc/S3Vml5XETgwyRhA+11Y3UwCsjb477/PDXQ
	 BYoKCx4Nhcn+TeYCnKFrFV5UNABykjRY9hNBSCC+BOHtELc+pEIIyq3T0gwDwWhnz6evI
	 drs2BOBrYUtiHS76SBtiCKcRVEzVCPGDKzVReIEaGZQedqJ9agVMM2xjTmGGbk41CVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFUy8yci;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A8B606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3A8B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFUy8yci
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b244fb7fffso7847649c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716714; x=1796321514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ohcenfLUMndMbNU9mTZepLoct+4NVwlucM8NCOZrsDE=;
        b=BFUy8yciA2wZCBYPBCFc7r6kP8CekNVrj73LFtzZZupLuq239O/THBkWIUSr9sn/3S
         WaqSuYBWD9WV9mZg2FXldC1oC1D6ABC/FoSVwJR41kzNIBVmR8ZiJtGWOwXi2kDWMM+1
         HyZ8b0JXjK4qUmuov+aKKZUtKz55WcabWMbLq0GeQ3cgR3U0BIFc/H2N91nsPFB38Sf6
         fVA6TzIyL8lgmzR1qQSOw64wDyZ6EvGwX+jVnXxXEq90MlcGKcbVGBs7MIam9gNrQUF4
         HTwJif5S+/VBl+HPetA//I5La415kjewoAKt2+mgV2Gbj/Xs0qc8RTedTKixPrasWU9a
         ejbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716714; x=1796321514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ohcenfLUMndMbNU9mTZepLoct+4NVwlucM8NCOZrsDE=;
        b=i7DlnBJ6mSzAaLRXaRnQ+dv4DxE5IbQdFo7UNL66oiejvMttDlqId0/swkscr2mTjt
         HbgHh578+bO2N9G2RHKAq5rDxoXjZGvg6CkJ0BYpwQ9hbUKZybQXRg3YG2avsC+Tbq2z
         4kCsjrMtiTLtxXswP61aMrgaKaDi3JLHDLEwmCRVPlQOj9ABasbIS1UOq5PtY+sJE8wl
         7xqhBu5le+IxEWAiCf3cBv9yT9uThl6QJYL2hECNeEYwNnKPu5jxSKmnF57iXiu/HLuT
         vcxN8/UqCdx58LGCgUYKN+GImhoWShypglpUXqp0vs+kkBDMHvRONx05j8K9/PFUH/8D
         L7bQ==
X-Forwarded-Encrypted: i=1; AL+hErEna6VsrICKG4mGwtF5u4VMZbpdouNA+D8BlGgclCi+24FFyliCS7d59cG7Z9fS2zWa/fBGTQbXOLbHBvM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k4A9qSNTTX6NSgzRUhKYFmxyHSHqN2v4J4OzKkejvwZXcgfvq
	n4bcS2/is8p2rHcAJOJLEWg7+sj2lyjf3OwSCDXwiPGY9d/Dtn3Q0PDo
X-Gm-Gg: AZFdTZdao0pvwFEfLavydtM+1yA8uXg/qfzkaGpTkgqzYBYssLfWVRoeJRJuot1/U02
	wKDzalTSTuxaYhJnfUU/qewiNuN1n386g9YJINjfSctC0i6wR9y3dH9o8iR9HfnvHRgWKDgjrPs
	ufR77j87OKH6EVRwilxKvymyOez+Iowwu2zTIoU7qdfzjK/HiR6eqxWobqJIFKrtfbtHDz3u5r/
	INdsHJi5kMzdOsUf3lTNHv23aIJEKc3EEmMJyr1rLsFA8QT/Q9lJWllJhM4eRTgQkDI9uK4bNsh
	/D6tf5j0aDyc6OQJDJVz3PoKhh2faoqOWSkXBooT3A3JO8YB2bw0ZGAqRSBAN5DaNFFYCkK1mPi
	Va5875msWHEdQcedQ2r+78QQjiBEN1sy9lifq94HkJCnuFz5TOn67phenLPKUKd9Z9ageR8xba6
	aDdAHvURoJQdZo69XciSzqo5bWim6d4qxOZyA1cxGIfVkkcqwHonsMWXxFYqAba3FYljtH1LRfB
	ySu/ISUQftApeXYx3UIE4EveEduQryZH740swfpg1c5tdk8NhTtXvCJtUtqRiDGUCzFL+mHF4YF
	nxKC6Kgn8qd4ibAjR1WO84mX+ctk6VSm4LGdweC3sdPoCxNabu9sBQzyMe4JOBU2W1y6t2XnjIH
	+sVXCjov2+CIsLh1WrSrVLVA=
X-Received: by 2002:a05:7022:f111:b0:1a8:ff0b:a4e1 with SMTP id a92af1059eb24-1b55688ee19mr25310636c88.18.1795716714042;
        Thu, 26 Nov 2026 10:11:54 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:53 -0800 (PST)
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
Subject: [PATCH v2 8/9] clocksource/drivers/timer-goldfish: Add device tree probing support
Date: Thu, 26 Nov 2026 18:11:00 +0000
Message-ID: <20261126181101.3715754-9-visitorckw@gmail.com>
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

The driver currently only supports board-level initialization via
goldfish_timer_init() on m68k virt.

Register a platform driver matching "google,goldfish-rtc" so device
tree platforms can also probe the timer. Since DT platforms typically
expose a single goldfish-rtc device that cannot be bound by both
drivers at once, depend on M68K || RTC_DRV_GOLDFISH=n in Kconfig to
avoid conflicting with rtc-goldfish whether built-in or as a module.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/Kconfig          |  5 +-
 drivers/clocksource/timer-goldfish.c | 93 +++++++++++++++++++++-------
 2 files changed, 74 insertions(+), 24 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index da83483296d5..852fb1f2d8d2 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -760,8 +760,9 @@ config MICROCHIP_PIT64B
 
 config GOLDFISH_TIMER
 	bool "Clocksource using goldfish-rtc"
-	depends on M68K || COMPILE_TEST
-	depends on RTC_DRV_GOLDFISH
+	depends on M68K || OF || COMPILE_TEST
+	depends on M68K || RTC_DRV_GOLDFISH=n
+	depends on HAS_IOMEM
 	help
 	  Support for the timer/counter of goldfish-rtc
 
diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index f5019a6bb340..b4b0388c01f9 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -5,6 +5,8 @@
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/goldfish.h>
@@ -102,15 +104,11 @@ static irqreturn_t goldfish_timer_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-int __init goldfish_timer_init(int irq, void __iomem *base)
+static int goldfish_timer_common_init(struct goldfish_timer *timerdrv,
+				      int irq, void __iomem *base)
 {
-	struct goldfish_timer *timerdrv;
 	int ret;
 
-	timerdrv = kzalloc_obj(*timerdrv);
-	if (!timerdrv)
-		return -ENOMEM;
-
 	timerdrv->base = base;
 	raw_spin_lock_init(&timerdrv->lock);
 
@@ -125,18 +123,6 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		.set_next_event		= goldfish_timer_next_event,
 	};
 
-	timerdrv->res = (struct resource){
-		.name  = "goldfish_timer",
-		.start = (unsigned long)base,
-		.end   = (unsigned long)base + 0xfff,
-	};
-
-	ret = request_resource(&iomem_resource, &timerdrv->res);
-	if (ret) {
-		pr_err("Cannot allocate '%s' resource\n", timerdrv->res.name);
-		goto err_free;
-	}
-
 	timerdrv->cs = (struct clocksource){
 		.name		= "goldfish_timer",
 		.rating		= 400,
@@ -148,26 +134,89 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 	ret = clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
 	if (ret) {
 		pr_err("Couldn't register goldfish-timer clocksource\n");
-		goto err_release_res;
+		return ret;
 	}
 
 	ret = request_irq(irq, goldfish_timer_irq, IRQF_TIMER,
 			  "goldfish_timer", timerdrv);
 	if (ret) {
 		pr_err("Couldn't register goldfish-timer interrupt\n");
-		goto err_unregister_cs;
+		clocksource_unregister(&timerdrv->cs);
+		return ret;
 	}
 
 	clockevents_config_and_register(&timerdrv->ced, NSEC_PER_SEC,
 					1, 0xffffffff);
 
 	return 0;
+}
+
+int __init goldfish_timer_init(int irq, void __iomem *base)
+{
+	struct goldfish_timer *timerdrv;
+	int ret;
+
+	timerdrv = kzalloc_obj(*timerdrv);
+	if (!timerdrv)
+		return -ENOMEM;
+
+	timerdrv->res = (struct resource){
+		.name  = "goldfish_timer",
+		.start = (unsigned long)base,
+		.end   = (unsigned long)base + 0xfff,
+	};
+
+	ret = request_resource(&iomem_resource, &timerdrv->res);
+	if (ret) {
+		pr_err("Cannot allocate '%s' resource\n", timerdrv->res.name);
+		goto err_free;
+	}
+
+	ret = goldfish_timer_common_init(timerdrv, irq, base);
+	if (ret)
+		goto err_release_res;
+
+	return 0;
 
-err_unregister_cs:
-	clocksource_unregister(&timerdrv->cs);
 err_release_res:
 	release_resource(&timerdrv->res);
 err_free:
 	kfree(timerdrv);
 	return ret;
 }
+
+static int goldfish_timer_probe(struct platform_device *pdev)
+{
+	struct goldfish_timer *timerdrv;
+	void __iomem *base;
+	int irq;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	timerdrv = devm_kzalloc(&pdev->dev, sizeof(*timerdrv), GFP_KERNEL);
+	if (!timerdrv)
+		return -ENOMEM;
+
+	return goldfish_timer_common_init(timerdrv, irq, base);
+}
+
+static const struct of_device_id goldfish_timer_of_match[] = {
+	{ .compatible = "google,goldfish-rtc", },
+	{},
+};
+
+static struct platform_driver goldfish_timer_driver = {
+	.probe = goldfish_timer_probe,
+	.driver = {
+		.name = "goldfish_timer",
+		.of_match_table = goldfish_timer_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(goldfish_timer_driver);
-- 
2.56.1.839.g22a8290db9-goog

