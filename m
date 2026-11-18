Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960484;
	b=HD7R/DjG6DX4W5xaZACow5kuKsscKpRmIoJ9nCdVoSoHnyYOjMiPz//J3yMbsbPPfgep
	 4HD9WrLJN9I0yagpRXslrBPgB3CgD6ClOM1BCCC1HrXjbetFir1oyxRf63xpVVxkdHgGy
	 pL2CQbpDWqjXSB98hixlZgZ17rlmHHupM27mZZm28hd1qRQulJlrCjsNvaN4adj53IBSi
	 JauSDYbr3peeLWwggmqp/hoWl8LYdSQJ7IVp+sefZmShv9jO6V7eDHfw74GEj/1RBoxoU
	 Zq6ZwL6Rzllpv/hjZuSkovhHT+4dn7GdCYMskRtqQ/l74IAiepC6xlW79LfVoX99sBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mZRahmf+nFgqKUzG9ukr/7RT5YTO4HPa5I75kKuTXUg=;
	b=UXASQJwa6ypJRGxw1rW72Jjcs5KUhvpjZmPC2GKKscE3xS2MX50L8zFvSza1BsCkUQ6G
	 Fh0JFnuijNUkFqPJId/fPod8uRhZaPM82ZA+Lm/MO0jzbB8pNaHxAEpUk8A1TLBX0za8N
	 RuXnzvBmkuMT7coI99WqNDltCWaYvbj3XjL0t3o/sbZ2a51uMbR//6gt4plZn6+kWmr22
	 GMYbSw0yqHPLWIVZkvBE03iCoBLQFQJO3Kjtrk0b/htxokEJDFPkD0xJBNFaheoB9j5Le
	 oIq1WCTJC+9ZREPRKFpchmNvKfkoLMgQTDUaiTjC0S8eahbKNaW+0i2Zv0oYcJhaP2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="z3fPrjW/";
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7998D606A338
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7998D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z3fPrjW/
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4af81963f35so148260b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794960483; x=1795565283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZRahmf+nFgqKUzG9ukr/7RT5YTO4HPa5I75kKuTXUg=;
        b=z3fPrjW/gupKsNppSFcMFAKkANtMeF0LeBowApEVDhFvET5+SYl6PpoEEqMUeVkQ3O
         jArYFHxOrL0W8f2FdMwzvfWVL+vEmhuI8XtrSlct3h2VYidI3F77ipT+y/59xsiR91Lo
         MlP9mdAWbtYKYIQeKETvt7KxVtFjc5K6SluzXLeF8FVtq9HAqgseAKysjM1518CnTdWH
         nWQ6NHGsk6KUpyb4DvTGmtd19LEDwMeneQohcMJ8qtqUm/AhoDwALXp2YkloSIs2uNqe
         ZXXtClScmXceEgBwjelEZuoSI4Z5ev2DiVISER5qUlG3pKWCQehZbQ3F7p7Mqsf4wsxo
         /5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960483; x=1795565283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZRahmf+nFgqKUzG9ukr/7RT5YTO4HPa5I75kKuTXUg=;
        b=VWOirKDS/EGjNuiduoXxLsH0sAv0VV2FRwY9MfeimCuRI9A7rPJzHUIxDUHjetLmJl
         CDJbHG+Rm+4Lo1oIZeE3k/2iTcfQUyt1d41zVCBXszCNPNjZZNtwgsZ8NDYe9J78b4sH
         87Y0IF0oLACKMoS+cRTf3Y5BfrONIz1djRu25CP9NKRsV8iUX2IMqW3Qhj2aY9FTfmk7
         mfgp42BjtFPRTsJcza9CkE4GZPyL4DKXXveDuZu1ASWmgK7HqlqF3pyadgbJUWGy/1I4
         hYdfp80tM7/b3J1fE6WlVk3Qa865XlN12Lsv5/eAtcMJdmC7xv+d5MTno900AwOdjWP/
         5DGA==
X-Forwarded-Encrypted: i=1; AL+hErGQM/s/QYRfC+DAzHpRr/w6FwUpZGJTkzqFlQz8USjRsc6TNgI6UDfJ1MKIBiOjrXDnUOWZVPIT8vlKLiU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/hQUmRSbHOjfTqJqbNi14nykkFsV2bZfDufNLtd4X0vBJ/MCq
	pg8X3IZAWbc7DR8DZRk4N49+gLRgqQhjR1vA8mt4Qqcjsn90kF32Lbaj
X-Gm-Gg: AYBFou19FVP0PeSiwYfIgtBsBlBomOs3fRBey9UKzVsSJMhHEYEhqRXBec/+VmXMD9J
	TiAXalv0cyimdJnihfM5QJDn77mxT+mwIchxmO2pqNcAj9+EkKmdXuZZ5pkqbhkJ6pTwEVIKnDL
	gvtBHdcVFXIVAYIT7XJtHiRnyYgc5C1twLdVcgTMuHwzWpkSIDNdSK1Bu8zcvN4iTQz5GXMV9FD
	wjXaB5Jok7ySGlWqcQrmFN8qbU+Rm39oDf1JGwcB52n+Y9vW98wkA7Tr7mb2H26anlaPSl+aMAe
	wL4Er+P6zO6XjUWqYvwIQZod/88a5yKFyt0nLXO2jTJgnc+fijT3D558o/Frt4omMf/+XitoqWn
	qmQcDBE0d6wXpVEwZYweiIQWaU7ZzlwGb65G/zgz9n3Le00iVQSNkEipUNCbs1gfpksUupNYlXf
	J38JGvGCc1sx7OpE1vGl1oRsOcaJpR5dj1FArF/sXdnyCqEfgDv5L7arJepLpEjekRlIYhthf+2
	b466KiV9kIMqLqJZryxgNyhmbmLG8AR7wUnjQogEjMpDYu/W0i9ui/96wkT2n1jmQssZBEdG6B9
	1V7ui/cBPIoagE06Q+h+GAf8EsCSXR0VVidkMMu6B1rKF7M4H/c0lI4+fCvOZf0dPHyf9hwp0sW
	k0utpRQ8WZ2p6TKsKtSuFtvcn8cYOn2erCSwksmI0yj0YqV5KyAlibx+bIxPJX8fUZt4rD1KOky
	leVbd7h8uSErl1LRrVEqjlp6J3uI7nHl478xLIFq+oEXJfFXanP6E=
X-Received: by 2002:a05:6808:15aa:b0:4e8:2150:2a1 with SMTP id 5614622812f47-57743134191mr1370941b6e.68.1794960483361;
        Tue, 17 Nov 2026 16:08:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777b393d40sm434954b6e.17.2026.11.17.16.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:08:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 17:07:47 -0700
Subject: [PATCH v7 8/8] dmaengine: dw-axi-dmac: guard shared IRQs across
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
Message-Id: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-8-d5f2309afd72@gmail.com>
References: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
In-Reply-To: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Requesting a shared interrupt allows the handler to run before probe has
enabled the clocks or registered the DMA channel devices. Initializing
the virtual channels first protects their locks, but does not make the
register accesses or channel-device diagnostics safe. The same register
access problem exists when another device raises a shared interrupt while
the controller is runtime-suspended.

Publish IRQ readiness after hardware initialization and DMA registration.
Once published, take a runtime PM reference only if the controller is
already active. This keeps the clocks enabled through the handler without
waking an idle controller for another device's interrupt. Drain handlers
before disabling clocks, including during forced system suspend, which
does not wait for their runtime PM references.

Keep the initial power reference until registration completes and mark
the manually resumed device active before enabling runtime PM. Balance
the clocks and reference on probe failure. Resume through runtime PM on
removal so an active controller does not acquire an extra clock reference.

Withdraw IRQ readiness and mask the controller before releasing its
shared IRQs. A handler already in flight can re-enable the source on
exit, so mask it again after draining all IRQs, while the clocks are
still enabled.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Closes: https://lore.kernel.org/r/sashiko-outbox-216269@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 77 ++++++++++++++++++++------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |  1 +
 2 files changed, 60 insertions(+), 18 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 0116c44d3bef..b1d753036744 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -276,6 +276,7 @@ static void axi_dma_hw_init(struct axi_dma_chip *chip)
 	for (i = 0; i < chip->dw->hdata->nr_channels; i++) {
 		axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
 		axi_chan_disable(&chip->dw->chan[i]);
+		axi_chan_irq_clear(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
 	}
 	ret = dma_set_mask_and_coherent(chip->dev, DMA_BIT_MASK(64));
 	if (ret)
@@ -1166,6 +1167,14 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 
 	u32 status, i;
 
+	/* Pair with publication after channel registration in dw_probe(). */
+	if (!smp_load_acquire(&chip->irq_ready))
+		return IRQ_NONE;
+
+	/* Shared interrupts can arrive while the controller is suspended. */
+	if (IS_ENABLED(CONFIG_PM) && pm_runtime_get_if_active(chip->dev) <= 0)
+		return IRQ_NONE;
+
 	/* Disable DMAC interrupts. We'll enable them after processing channels */
 	axi_dma_irq_disable(chip);
 
@@ -1191,6 +1200,9 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	/* Re-enable interrupts */
 	axi_dma_irq_enable(chip);
 
+	if (IS_ENABLED(CONFIG_PM))
+		pm_runtime_put(chip->dev);
+
 	return IRQ_HANDLED;
 }
 
@@ -1377,12 +1389,28 @@ static int dma_chan_resume(struct dma_chan *dchan)
 	return ret;
 }
 
-static int axi_dma_suspend(struct axi_dma_chip *chip)
+static void axi_dma_quiesce_irqs(struct axi_dma_chip *chip)
 {
 	axi_dma_irq_disable(chip);
-	axi_dma_disable(chip);
+	for (unsigned int i = 0; i < DMAC_MAX_CHANNELS; i++)
+		if (chip->irq[i] > 0)
+			synchronize_irq(chip->irq[i]);
+
+	/* A handler already in progress may have re-enabled interrupts. */
+	axi_dma_irq_disable(chip);
+}
 
+static void axi_dma_power_off(struct axi_dma_chip *chip)
+{
+	axi_dma_disable(chip);
 	clk_bulk_disable_unprepare(ARRAY_SIZE(chip->clks), chip->clks);
+}
+
+static int axi_dma_suspend(struct axi_dma_chip *chip)
+{
+	/* System sleep can suspend despite an IRQ handler's runtime PM reference. */
+	axi_dma_quiesce_irqs(chip);
+	axi_dma_power_off(chip);
 
 	return 0;
 }
@@ -1651,8 +1679,6 @@ static int dw_probe(struct platform_device *pdev)
 	dma_set_max_seg_size(&pdev->dev, MAX_BLOCK_SIZE);
 	platform_set_drvdata(pdev, chip);
 
-	pm_runtime_enable(chip->dev);
-
 	/*
 	 * We can't just call pm_runtime_get here instead of
 	 * pm_runtime_get_noresume + axi_dma_resume because we need
@@ -1661,16 +1687,23 @@ static int dw_probe(struct platform_device *pdev)
 	pm_runtime_get_noresume(chip->dev);
 	ret = axi_dma_resume(chip);
 	if (ret < 0)
-		goto err_pm_disable;
+		goto err_pm_put;
 
 	axi_dma_hw_init(chip);
 
-	pm_runtime_put(chip->dev);
+	ret = pm_runtime_set_active(chip->dev);
+	if (ret)
+		goto err_suspend;
+	pm_runtime_enable(chip->dev);
 
 	ret = dmaenginem_async_device_register(&dw->dma);
 	if (ret)
 		goto err_pm_disable;
 
+	/* Publish initialized hardware and channel devices to the IRQ handler. */
+	smp_store_release(&chip->irq_ready, true);
+	pm_runtime_put(chip->dev);
+
 	/* Register with OF helpers for DMA lookups */
 	ret = of_dma_controller_register(pdev->dev.of_node,
 					 dw_axi_dma_of_xlate, dw);
@@ -1685,6 +1718,11 @@ static int dw_probe(struct platform_device *pdev)
 
 err_pm_disable:
 	pm_runtime_disable(chip->dev);
+err_suspend:
+	axi_dma_suspend(chip);
+	pm_runtime_set_suspended(chip->dev);
+err_pm_put:
+	pm_runtime_put_noidle(chip->dev);
 
 	return ret;
 }
@@ -1697,21 +1735,24 @@ static void dw_remove(struct platform_device *pdev)
 	u32 i;
 	int ret;
 
-	/* Enable clk before accessing to registers */
-	ret = clk_bulk_prepare_enable(ARRAY_SIZE(chip->clks), chip->clks);
-	if (ret)
-		dev_warn(chip->dev, "failed to enable clocks before remove: %d\n",
-			 ret);
-	axi_dma_irq_disable(chip);
-	for (i = 0; i < dw->hdata->nr_channels; i++) {
-		axi_chan_disable(&chip->dw->chan[i]);
-		axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
+	WRITE_ONCE(chip->irq_ready, false);
+	ret = pm_runtime_resume_and_get(chip->dev);
+	pm_runtime_disable(chip->dev);
+	if (ret < 0) {
+		dev_warn(chip->dev, "failed to resume before remove: %d\n", ret);
+		goto free_irqs;
 	}
-	axi_dma_disable(chip);
 
-	pm_runtime_disable(chip->dev);
-	axi_dma_suspend(chip);
+	axi_dma_quiesce_irqs(chip);
+	for (i = 0; i < dw->hdata->nr_channels; i++) {
+		axi_chan_disable(&dw->chan[i]);
+		axi_chan_irq_disable(&dw->chan[i], DWAXIDMAC_IRQ_ALL);
+	}
+	axi_dma_power_off(chip);
+	pm_runtime_put_noidle(chip->dev);
+	pm_runtime_set_suspended(chip->dev);
 
+free_irqs:
 	for (i = 0; i < DMAC_MAX_CHANNELS; i++)
 		if (chip->irq[i] > 0)
 			devm_free_irq(chip->dev, chip->irq[i], chip);
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index b18c9880711a..926d14b23615 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -70,6 +70,7 @@ struct dw_axi_dma {
 struct axi_dma_chip {
 	struct device		*dev;
 	int			irq[DMAC_MAX_CHANNELS];
+	bool			irq_ready;
 	void __iomem		*regs;
 	void __iomem		*apb_regs;
 	struct clk_bulk_data	clks[2];

-- 
2.53.0

