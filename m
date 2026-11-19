Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104120;
	b=rAQ6N5W9j4cOOeQ0jqfZ5jHmh69WjkE53fxZxqFVWAXtswFeThXvZ1dG7PRTWI2bk6dy
	 ScTpGUqSHNDMXsrvxN0C/0sSYkK/t3V/2lkAn9IIVFImqgcvDGGr0cmlKxmnQ6/qAg4iV
	 re7cfBuG8+V0iZ7ZB1FSCNHboK0R+z+M57Nv6VZokld83lX44D2K2f/bANAR+wNAMXtLS
	 plkm0bDNAXDuePpDmmbVasWc64/+K0PVdrowm96jN+04sWNpIComBCgzkIEsvWUf+8BaG
	 r7WE0yjRA2cgLbG4VSwnSDibAZ2mqzPfChQ71qMwaO4GxtaMOb1O1f7m/iMKiP/ylIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=iK6zyPeBY1pH/t4BLMOptSyyu5CkzAyptNTdF8l1WS8=;
	b=hO46spTJIDRS/dpPIlujwfBdeV9gwhXJAMRwkG44vl5JyM1ZKC7dbkyn7z3LsksN3Zmr
	 Ts68xIZCw25hgVUJOb2Cd8OdxxN8Z1Ub6ZCmstigXnEZOksuPNuDcYXypwf4XKUcYUWcn
	 o0/g6iPuD4YhcsN0esodWFMcGJzSSaUoBe3WhXUdEou3kaKow5WAdfIUh3jJO+3rhHbLw
	 pjHYMjzfPxNP9RVhUvmL6v5VtQU6FWx0vDMH9TM92gQg37/ETdtCKCvqsd0kVwqcKtWIq
	 aVfCii44y90hEGedXbEDhhxFsBx+Ilu5fRJUKGdvIij4AkYnN3kv2u8gOr08O84kC8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fj2Upmrl;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9843460A2627
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9843460A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fj2Upmrl
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b4d6981c67so15191697b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104119; x=1795708919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iK6zyPeBY1pH/t4BLMOptSyyu5CkzAyptNTdF8l1WS8=;
        b=Fj2Upmrl8xZxiAEuQY3yOXiMg9GVGVjNFbIcqXifeL4/JacH5y0989zwudxq5Mzxwu
         ZcRtTVnP4rHsEHP/vJYqi3Lh/ClwldeRg6pvQvHhSHIz3lNFbpqApHZ4UPWQeXREouRz
         Twa2d3Ar/ftUY/TYMJhs2cb6T/gEo8RH+vQUs5PykRk94rKC1EZG1FAkk12F9wSqq1IE
         ruKDJw7Igrtv5W5c1ZauhmtrL6p3Vp/WjT4b/oTPsSnQ6G21Jmgr+IfoZWSWHlDap03S
         L3ExXPP0QYJFKhJR7suzQYs2ZvJO7OVyn5Fn/gvb3THhXABjCRkPmdfkdUCZ687GPG0l
         PcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104119; x=1795708919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iK6zyPeBY1pH/t4BLMOptSyyu5CkzAyptNTdF8l1WS8=;
        b=F3/VygHy96epLl46SrozLe4uiRAS9PJKq/co9HbYANmnPitn6AORLE9lqSdOD3mH80
         RG4rgzG1qDgg7ht7GeevY1yJ5cC4vA84kK6IeH2vXObw4v0VoibDl7PU86b1kGVetqc2
         la6heAoR1zopzE2QkyMKbxHu4PXNPSfrNAEKimiA1dOrK/rGQzxX1Xhx/dS1tzvN0sU+
         RRPRTR9J3tJgqpSVA3yN7+CIY5owSKAYRqP0fSbK9VDguXF0ieWBE1NoRVRAX4PLm1bC
         PkNIjXno0CpciGezncbvsjm1usn8djwW4kR1tdrQrSdw0BzcZVmDSg+21TIVaZpaFs6f
         oKqg==
X-Forwarded-Encrypted: i=1; AL+hErFOBP8Uq4mFbXEP69ot/PnkLt3icn+g6e5llUn44vRifpMhKTe1/1jxVjIJCNTd02uCrNwWkMX7kKbZIoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OULZ1iuiI99Aptp32G5guaaR5IJgH8oupWWNsrTTxIaYhB1eQ
	9xZjItf+wqJGPQ6TJoGLGM9HgWIaQMwH9OrbJdmMv476cAbJEROmOxgf
X-Gm-Gg: AZFdTZd1HviJuxLofQ5OEGfgflAno1EhUtdssX3L9KlkhR3jA3llTPbAuMTgWYXPJ/I
	a+KkqVqAorBokIxfFSS0/tDaF1658GGbXiXXzcmvrkNooFh31lAKIcss2Lxmm1hs5vRDBCog0ft
	GN0W4CfC80d429cCs9fnHnIfaIvLtwBTDFmswfRfhRU93L2t3XJOi3N4EPUf5bqCk1SqovIgCab
	ChFzvyA+1TV57XvfgZdABdvdY7yQUETvCQNysASPpD6uTVdoWD46WvFicMNFOch7CGYLvS96EuB
	lrbBiiQxjQ7QfhYgKk23ITvrSVCfZCCgWOp6STARQozBW0q9bNkBD6HlK9Fuh4KKrSAgha49tgj
	w9IrgxqN/BkllllIig71s/xJQqHVHkCT4dQCHVON4Z7+WDKgTpkhx9BWnQ8EI0W938q+tWbGv8t
	J8Vog6qwzBpJ8FYZj/lXTiZf2vAR1GtLddl+ydqIi8Hn3KwwEtJ/Del6Gldt0Ud0MSewnCqAiL+
	cfX4mEjdoaO6LbQjIn0wLrE874J0sW6ttQGopjIXA6zvvsjHG3gVoVXnfMnstARH8goA9gL5MJb
	lNGJizPnCW1MA/4NhI8mtTobEzDOVXZ6+3UShnR+pglQCq5b0+dO/fPzJJfSEtXXu0i1+4lBGm+
	GuSiVZemWP0T1Fy3uXAM+Pup0z9VwQEju0pHcHZe7oCUqcQT5foMvtEznflSJHPBQHf6CAHg5Lf
	y4m4GJdPjGEn1dXTH6B6xnT6yzLtZ167L1zj4xTtTMYxu9dVdnPzA=
X-Received: by 2002:a05:690c:4a06:b0:8b4:d66a:2002 with SMTP id 00721157ae682-8b520515e7fmr753147b3.65.1795104119507;
        Thu, 19 Nov 2026 08:01:59 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm623267b3.34.2026.11.19.08.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:01:04 -0700
Subject: [PATCH v8 9/9] dmaengine: dw-axi-dmac: guard shared IRQs across
 the controller lifetime
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-9-f8e7fe60594c@gmail.com>
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
In-Reply-To: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

An interrupt from another device on the shared line can run the handler
before the DMA channel devices exist or while the register clocks are
off. Checking the runtime PM status in the handler is not sufficient:
the controller can already signal an interrupt in the resume callback,
before the PM core marks the device active.

Mask the controller and clear stale channel status before requesting
the IRQs. Keep the global mask in place until DMA registration returns.
A transfer that completes during registration leaves its channel status
pending and is serviced when the controller interrupts are enabled.

Serialize the hardware mask and handler readiness under a chip lock.
Mask the source before withdrawing the handler and prevent a handler
already processing channels from re-enabling it on exit. Drain each IRQ
before disabling the clocks. This also covers forced system suspend and
lets removal leave an already suspended controller powered down.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Closes: https://lore.kernel.org/r/sashiko-outbox-216269@kernel.org/
Link: https://lore.kernel.org/r/sashiko-outbox-219846@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 119 ++++++++++++++++---------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |   3 +
 2 files changed, 81 insertions(+), 41 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 531705f8f89b..eab3c31f77df 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -277,6 +277,7 @@ static void axi_dma_hw_init(struct axi_dma_chip *chip)
 	for (i = 0; i < chip->dw->hdata->nr_channels; i++) {
 		axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
 		axi_chan_disable(&chip->dw->chan[i]);
+		axi_chan_irq_clear(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
 	}
 	ret = dma_set_mask_and_coherent(chip->dev, DMA_BIT_MASK(64));
 	if (ret)
@@ -1167,8 +1168,11 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 
 	u32 status, i;
 
-	/* Disable DMAC interrupts. We'll enable them after processing channels */
-	axi_dma_irq_disable(chip);
+	scoped_guard(spinlock_irqsave, &chip->irq_lock) {
+		if (!chip->irq_ready)
+			return IRQ_NONE;
+		axi_dma_irq_disable(chip);
+	}
 
 	/* Poll, clear and process every channel interrupt status */
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
@@ -1189,8 +1193,10 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 		spin_unlock_irqrestore(&chan->vc.lock, flags);
 	}
 
-	/* Re-enable interrupts */
-	axi_dma_irq_enable(chip);
+	scoped_guard(spinlock_irqsave, &chip->irq_lock) {
+		if (chip->irq_ready)
+			axi_dma_irq_enable(chip);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -1378,17 +1384,39 @@ static int dma_chan_resume(struct dma_chan *dchan)
 	return ret;
 }
 
-static int axi_dma_suspend(struct axi_dma_chip *chip)
+static void axi_dma_start_irqs(struct axi_dma_chip *chip)
 {
-	axi_dma_irq_disable(chip);
-	axi_dma_disable(chip);
+	guard(spinlock_irqsave)(&chip->irq_lock);
 
-	clk_bulk_disable_unprepare(ARRAY_SIZE(chip->clks), chip->clks);
+	chip->irq_ready = true;
+	axi_dma_irq_enable(chip);
+}
 
-	return 0;
+static bool axi_dma_quiesce_irqs(struct axi_dma_chip *chip)
+{
+	scoped_guard(spinlock_irqsave, &chip->irq_lock) {
+		if (!chip->irq_ready)
+			return false;
+		axi_dma_irq_disable(chip);
+		/* Flush the mask before withdrawing the handler. */
+		axi_dma_ioread32(chip, DMAC_CFG);
+		chip->irq_ready = false;
+	}
+
+	for (unsigned int i = 0; i < DMAC_MAX_CHANNELS; i++)
+		if (chip->irq[i] > 0)
+			synchronize_irq(chip->irq[i]);
+
+	return true;
+}
+
+static void axi_dma_power_off(struct axi_dma_chip *chip)
+{
+	axi_dma_disable(chip);
+	clk_bulk_disable_unprepare(ARRAY_SIZE(chip->clks), chip->clks);
 }
 
-static int axi_dma_resume(struct axi_dma_chip *chip)
+static int axi_dma_power_on(struct axi_dma_chip *chip)
 {
 	int ret;
 
@@ -1396,8 +1424,8 @@ static int axi_dma_resume(struct axi_dma_chip *chip)
 	if (ret < 0)
 		return ret;
 
+	axi_dma_irq_disable(chip);
 	axi_dma_enable(chip);
-	axi_dma_irq_enable(chip);
 
 	return 0;
 }
@@ -1406,14 +1434,23 @@ static int __maybe_unused axi_dma_runtime_suspend(struct device *dev)
 {
 	struct axi_dma_chip *chip = dev_get_drvdata(dev);
 
-	return axi_dma_suspend(chip);
+	if (axi_dma_quiesce_irqs(chip))
+		axi_dma_power_off(chip);
+
+	return 0;
 }
 
 static int __maybe_unused axi_dma_runtime_resume(struct device *dev)
 {
 	struct axi_dma_chip *chip = dev_get_drvdata(dev);
+	int ret;
 
-	return axi_dma_resume(chip);
+	ret = axi_dma_power_on(chip);
+	if (ret)
+		return ret;
+
+	axi_dma_start_irqs(chip);
+	return 0;
 }
 
 static struct dma_chan *dw_axi_dma_of_xlate(struct of_phandle_args *dma_spec,
@@ -1560,6 +1597,7 @@ static int dw_probe(struct platform_device *pdev)
 	chip->dw = dw;
 	chip->dev = &pdev->dev;
 	chip->dw->hdata = hdata;
+	spin_lock_init(&chip->irq_lock);
 
 	chip->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->regs))
@@ -1614,10 +1652,6 @@ static int dw_probe(struct platform_device *pdev)
 		vchan_init(&chan->vc, &dw->dma);
 	}
 
-	ret = axi_req_irqs(pdev, chip);
-	if (ret)
-		return ret;
-
 	/* Set capabilities */
 	dma_cap_set(DMA_MEMCPY, dw->dma.cap_mask);
 	dma_cap_set(DMA_SLAVE, dw->dma.cap_mask);
@@ -1656,26 +1690,30 @@ static int dw_probe(struct platform_device *pdev)
 	dma_set_max_seg_size(&pdev->dev, MAX_BLOCK_SIZE);
 	platform_set_drvdata(pdev, chip);
 
-	pm_runtime_enable(chip->dev);
-
-	/*
-	 * We can't just call pm_runtime_get here instead of
-	 * pm_runtime_get_noresume + axi_dma_resume because we need
-	 * driver to work also without Runtime PM.
-	 */
+	/* Power up explicitly so probe also works without runtime PM. */
 	pm_runtime_get_noresume(chip->dev);
-	ret = axi_dma_resume(chip);
+	ret = axi_dma_power_on(chip);
 	if (ret < 0)
-		goto err_pm_disable;
+		goto err_pm_put;
 
 	axi_dma_hw_init(chip);
 
-	pm_runtime_put(chip->dev);
+	ret = axi_req_irqs(pdev, chip);
+	if (ret)
+		goto err_power_off;
+
+	ret = pm_runtime_set_active(chip->dev);
+	if (ret)
+		goto err_power_off;
+	pm_runtime_enable(chip->dev);
 
 	ret = dmaenginem_async_device_register(&dw->dma);
 	if (ret)
 		goto err_pm_disable;
 
+	axi_dma_start_irqs(chip);
+	pm_runtime_put(chip->dev);
+
 	/* Register with OF helpers for DMA lookups */
 	ret = of_dma_controller_register(pdev->dev.of_node,
 					 dw_axi_dma_of_xlate, dw);
@@ -1690,6 +1728,11 @@ static int dw_probe(struct platform_device *pdev)
 
 err_pm_disable:
 	pm_runtime_disable(chip->dev);
+err_power_off:
+	axi_dma_power_off(chip);
+	pm_runtime_set_suspended(chip->dev);
+err_pm_put:
+	pm_runtime_put_noidle(chip->dev);
 
 	return ret;
 }
@@ -1700,22 +1743,16 @@ static void dw_remove(struct platform_device *pdev)
 	struct dw_axi_dma *dw = chip->dw;
 	struct axi_dma_chan *chan, *_chan;
 	u32 i;
-	int ret;
-
-	/* Enable clk before accessing to registers */
-	ret = clk_bulk_prepare_enable(ARRAY_SIZE(chip->clks), chip->clks);
-	if (ret)
-		dev_warn(chip->dev, "failed to enable clocks before remove: %d\n",
-			 ret);
-	axi_dma_irq_disable(chip);
-	for (i = 0; i < dw->hdata->nr_channels; i++) {
-		axi_chan_disable(&chip->dw->chan[i]);
-		axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
-	}
-	axi_dma_disable(chip);
 
 	pm_runtime_disable(chip->dev);
-	axi_dma_suspend(chip);
+	if (axi_dma_quiesce_irqs(chip)) {
+		for (i = 0; i < dw->hdata->nr_channels; i++) {
+			axi_chan_disable(&dw->chan[i]);
+			axi_chan_irq_disable(&dw->chan[i], DWAXIDMAC_IRQ_ALL);
+		}
+		axi_dma_power_off(chip);
+	}
+	pm_runtime_set_suspended(chip->dev);
 
 	for (i = 0; i < DMAC_MAX_CHANNELS; i++)
 		if (chip->irq[i] > 0)
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index b18c9880711a..80e4632c0d55 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -14,6 +14,7 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dmaengine.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 
 #include "../virt-dma.h"
@@ -70,6 +71,8 @@ struct dw_axi_dma {
 struct axi_dma_chip {
 	struct device		*dev;
 	int			irq[DMAC_MAX_CHANNELS];
+	spinlock_t		irq_lock; /* Protects irq_ready and the global IRQ mask. */
+	bool			irq_ready;
 	void __iomem		*regs;
 	void __iomem		*apb_regs;
 	struct clk_bulk_data	clks[2];

-- 
2.53.0

