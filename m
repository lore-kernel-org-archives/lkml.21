Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202054;
	b=OcCfEeIaM0w9Kl6BRdPhHp4h48kpikju8xdGP8hkAc3e0M8ORT9q7TbFen1l+2RQnWOu
	 b9XmavwkvxYUNXh/zkwc5w6xViAKKoPw5saSRuyfIqUFRLPYvCMU/qdx8tw6z7kljTfP4
	 EKX05I/tWeMZpwZQUBe4vWT9X8eceheF7+3cWnysKaqUhdTPLIpDzTxOB2bltnUp30B4W
	 72bY2G2VdgIEJKyzUfvHx8RFf/60aXbHIUHheGEu/FBLbkhI2WWWFKMYPOL9c/ki8jRvI
	 wHC1Vs5DTxu4MbhctpwxwtEeZcs6ucz73Ei07yYNlwmPH4LxT8+Hfb2Fmh9E7ojROsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=lXcJhRw0GkyIcp+Z+lj797v+WGYfXH6jpd253OJB95U=;
	b=J1CDHM8rCFxmZ+ZQpynOLhZBH/o608TfiEt60ykZYA3Er9zO6oBxOL5JMecAfnv3rv4m
	 D85i+1qpA7dzNf1oDwiqZNgZsNtRSf053VnHf4wg9QhTmzu3SZpYciQRNJR3C3c9BVy6h
	 AQi+H63y67BdEEkVEXi+ayT9yVmZjawRy5xU10aYx5yn6p1tHaSQKHB3jWEHKpLhSpBhu
	 HE8+vjjuoNJ8lVEOqIWFSoM6/P/1MoZA8mbfRxPacU9Yr+2p2fRNwBdxzMkDsN8W4EjkN
	 YNVqhTSPSGJFwqqU4MrgePBZ4c2nDMJOQdLtlInTSaJcGUCKrMKqLBpOQhc7aeNyoEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTTlopaR;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E30660A261B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E30660A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTTlopaR
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-71af0656bedso809546eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202049; x=1795806849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lXcJhRw0GkyIcp+Z+lj797v+WGYfXH6jpd253OJB95U=;
        b=kTTlopaR2KIAIgfDie50kv3fjqD8+HUqzuaCmYvDzehD/y6MhfCJL1jx+aURTBYHWB
         hgZCZVUBWrX2hppnZUiVFRe1gAr7xSBxJpRRRixtTp+jlFa7rWKq1ajJWbcCEAJMmsJg
         EJTjcIrm47HapgYTmOXe/+jPOZDXvt25l0cUutIVPs5RKGlcoMBaJ8x1FnTX1JoG5zlp
         rXeoOVuiiz5uttXz8043brrT+Rj91Uhf+o2YUoi8+TBnUbD69nbmYM7bxSYll185BkYB
         SpGKS0CZco3zJoNzw6Nba4dJhdqItkBuSjgHjlHpxVKOkEqJMfgLj1lZNRJN/zpE4Fi0
         V9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202049; x=1795806849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXcJhRw0GkyIcp+Z+lj797v+WGYfXH6jpd253OJB95U=;
        b=aiQYai8hFPXmbsmeB0BlMqNZdej2KvgGS0xumNyIObJYPJOq7lMgso6jXvyJCiUJKH
         6Z0WOw02cwNAPNB4ly+EcEXmit1nYUEsRsUO+F2dhNsWBSZ0RbBoDodYWIWnnqmWEDDO
         y9kZNQwRmu2CgnKw4IAC8qeZNbFYkl/DwKamu9SShi/XLT5woKQB7fC/+lvu7Op1CsCQ
         RZM54/UF0oeXuanUf87AJCfkSX4B45Q8hPv6tKIMieYsVVly119z+HBjXV6CxV7NEhXr
         FCgm30lqehUUkBxorccYFpyq8GFt6glWFegZ4JpTxzOXVF2AiYoiYrYjgV4IqAtswB8b
         hZRw==
X-Forwarded-Encrypted: i=1; AL+hErET22qZMAbO+Ml+ulHqmaM6ZWA14NtL419Au42HGXMyAlxQVhvAIE3wHLOlMoEyYhYFr85Yme323+1A7h0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SPy5bfu2Q66kFrLdpao43tKa3OGYpL6+51I4B3I6mNHg/fvOc
	JZoG63mJVcYlA5ewSDHKcnE59eetmcGBYzwJdv7cve87g8oGQ3myowA/
X-Gm-Gg: AYBFou2sKSeEY6cUlqigJ7xpznwoVDTDxs8B/fFKEtJuHZgzWqT8vuoDFk5ChcIDJWH
	VE1BPBywwXvQCLvSlnQvjTM3sB1of0SQ54CT4lJ/UfSrML4cbopWibVlHVtoqAWIc9yXQoJb772
	U7gPNIeU6QCSjaeRgDrGfzE3oD0PmZfmN2dl58qU/vrZ4Dw0lguP0V4CnnEV4zCswyWzovkuQz5
	2zTECjdcXBlPAM1R9zK/XphZYTjtL/Se2NAFwHJd9Uj7EB1rSJvClW2Yd6a3+T8WBqeLIeLK5d3
	vfOtK7VFW6+/MU0svevIYWb5zPLj3d3yTjHlbffWNiEQK17t15xAMxL8Af/xU5RXokYzKCDG7Ei
	pecDRCq0YB/UoeoqG5KPuFGK2KldUK+ZNV14/Xqbenl3sDC2MTMgnH3lpB0kOfkOlFGSsYniBmT
	Df6eyVdws7XVkFFPq1yFfrvA3/yFvP17GbxCTmaO8o1zSlBqKhYwzwQ8efwPHOKiVkA6QJvX50K
	W7K8WhLMky9ZcvEbZpLLy/mcwdK+y+/wdt+rI84X2G0+k4fEe9W1Y8v59EQzHbqQiyFAJFkAAXY
	p27eqKz42JM1WDrT6tXXL56sMDZb/cu9471wT9Baz6adyuqcsZU7zejcypMRZGpcQrR/00f6wu7
	SEPzxEAl+QfUFvx0GfD3uJdzFIMI8jtYRsy6yZF8/0OB8YI4Cg9Vj8v+CTcoYRpf/7s4JUOvLNU
	cCLwc3DZv/GRuN3nYhnhDIYNjFTmLyREZXd93B+4zg5bP80OnfX60P
X-Received: by 2002:a05:6820:55ca:20b0:71b:561:a13 with SMTP id 006d021491bc7-71b3947af20mr2530106eaf.39.1795202049421;
        Fri, 20 Nov 2026 11:14:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2654782a34.14.2026.11.20.11.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:14:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:13:59 -0700
Subject: [PATCH v9 9/9] dmaengine: dw-axi-dmac: guard shared IRQs across
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
Message-Id: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-9-48ab58961d6e@gmail.com>
References: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
In-Reply-To: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
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
off. During probe the device is runtime-active before DMAengine
registration finishes. Conversely, the controller can already signal an
interrupt during resume, before the PM core marks it active. Runtime PM
status alone therefore cannot tell the handler when it may touch channels.

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

