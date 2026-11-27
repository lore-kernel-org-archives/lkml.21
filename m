Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781943;
	b=nqTPULFBEglT7q6lBTnkNmM7UQd+EujM+ZaiZC9+g4ACpdAGKsYvZjnntKq001tgizJE
	 0y42CLYRqvJBi7hXJwyxUTAa4G42yzYZ75B9fsUBLO4Rlt+ttNGe5NTcT9ApQnNROguEb
	 csZ3bgNxtsCwzaIhpLGg1OWSI8DUcONPb1UYI4bYjJR6aQKKde8GGn5tU7snRFQzHueqi
	 CmW5Rg0bn/rt9QRn2jLuj/u7FV3p8cCC7RlBpOQsucfYQKcZajy63dKE2El9mdy35fKv7
	 bxwWa08+30iugeLt3Wl5g7+bo6pX+7goF/X72wzEuh+g/ntmv58MeUnplwobzYHXQHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ioy1KdcErYaMkTRDj2OIu5TCOK8ONgfVlgAZynRl4ik=;
	b=vzkFx41d4kB3LogVyQtPhABI+mPSW4Efa5MPftQejib896+V4xllpu2S4XH6A6wCwCQh
	 uIZM7YFBbUpSTgRpfInXPSfu5nX0VuUNCyFh7iu6L4I0XhF8+iotDZHSh456HOWi+NRKu
	 AzPJqD+wLe6cVcgM8NgRpjEn4r21HQMRngDFSvA5mSOfL9zOt6DlIha7R+A9ZlV+8t2JN
	 ABAvOjJfFffD5q8G59/rDqWXAkyTYMnNf3SqhbxzFEXwDr19dLjwe8GC6nsxZ1opcUb8y
	 sz2mIy79FgVMZPkhaYZoOg32NT4m4NcSqvbhk9Ewq3OKggh6sgYF608w+AVH8O1OmCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gSqWaNQY;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5CE606A683
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5CE606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gSqWaNQY
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so5033739f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781942; x=1796386742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ioy1KdcErYaMkTRDj2OIu5TCOK8ONgfVlgAZynRl4ik=;
        b=gSqWaNQYAxNCeCuAON6Rjsn0JBd8Snp9gggxIGTl9OxJKFC39dN9QKB9X8dw2xVtcH
         UYVjqIlMlx1a0ceek/5jeL5jHfzWGB3ydff9wmwBLuClUjIqOIajpxstwaS6q/yY+Ke/
         oUG2D973cndHs0nIkjGsE/u+Ccp6SVhuiwU3+f9ndE524eWYNp2ilRQYlbtwPSStqoEk
         rRRb6NlTRz7DWnVC4BYKbrL1sGbWE6ffeRMxWyScNmCIWpMUZCwLucO+B3/pPhJ4BciQ
         qE24D5v2k/j88u4bWj9hjKb5AwrAjKXGmWz9Debv8SWTLpHG7SFfmwKFaBtDFkjAzuYv
         fibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781942; x=1796386742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ioy1KdcErYaMkTRDj2OIu5TCOK8ONgfVlgAZynRl4ik=;
        b=gqRhsBD7zAXgKHczazkIpoVr4Ds66NaXdI5rd56pbTa9vtJfBy2pfDtNZ6SioiMjhs
         tVgKoZHvJkIh5PYR3HNlZX/LmSjhBqzph3A8a4s1Bi9flRVGnULXIigJ1f7ZgVTWhaKV
         l1FLtg/JOsKA1wpCp5XV4FEAz8fCG0HwQxupYGk6ER07Zzmzr4xbTxl1ayWPybW2uoxX
         W2Fm/oE2SD1/MYKln6NLN3QwY3e9i3QA/pQV6QONuKkCGIBDMkaIT6JfxI81fpqmcceb
         BXgPW9ziZA2GWf9YO9jtVBcuLrIusLXDQYxNoF2+dXRtHD/auq0AD6wkFxFvi2VJJmI4
         ScWQ==
X-Forwarded-Encrypted: i=1; AL+hErHrO3UZa73tB4i2KsZO++ekPcSb3Z3jx0JGPUf3+bMV5rhSEQ8TOiEijMTxB0IibQ6cKq3D/Z5K7XnQ8M4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GCYFNv7U59mRP1YPsvZ2wZvL1+5o0bl+8z+YRPuqs0UscjEpH
	9a/vfXN0t7Guj9VZ1Dhk5C1AqS8a+B5eFLzkI73EcEr0aMqOMtNOhHQRP1pQ30HYgKI=
X-Gm-Gg: AZFdTZd+xLHQvCnCTplMt1+cMUuWoS7SVKjhdedOV+6YixV/6rpI/prtp7sQUVn4hXP
	as3K5WEjmAdqwoS8R79dAwk78DxslYbaLOSGGf7eBQ46L2zWsZGivh/RZgu9nTCT5+lacGWlBM/
	uf5RpFJLE/o1sz0IM1Pj7LNvYcV7UJC3qtzNBt9xqSG4mtiuudEbEROPUzJXSDHcgbKMk5SmgM1
	iPGeF3TN9/yyGS8tYDp+wLQ4gCagTLiRmDYf1QoyGsDvFNrixH+YvD1fIdY1DuEyV7zZ77u3L5E
	STyTAgY8qFLvJlvFcr1I/dvuJ0A0yx2TTMGy1rzATfGFBROF72xqeAUES4PuprrVdyaMDnM3Gv8
	Uj7PEC8CmW2gBhnpMH1sqPy5umfYlt08L3Lri6Nhah8JdOvHm2h8MeuGFPa4VlWVvnZChNXHd6W
	DY/6+2FdHYO732aZfunzenDBmWu4oJNqhDaam51yguBW3G3HIgKderTUOQWYQlShs+E4VLfnJCY
	a4HuXG63t98cwHa/9qzQD5hvsDVrNu7IIwiO4DoP+sL5CB43MlIkFzarxmPqtWf68XqZn346r4w
	ozMnp7UArm44kx1v7udA/GLuCP7b
X-Received: by 2002:a05:600c:4ecd:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4bb8881e81cmr508102915e9.29.1795781941754;
        Fri, 27 Nov 2026 04:19:01 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm623834055e9.1.2026.11.27.04.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:01 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>,
	Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org
Subject: [PATCH v4 15/28] spi: bcm2835: Pass the CPU physical address of the FIFO to the DMA engine
Date: Fri, 27 Nov 2026 13:22:05 +0100
Message-ID: <20261127122236.4976-16-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
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

The addresses in struct dma_slave_config are CPU physical addresses, and
the DMA controller driver is responsible for translating them into its
own view of the bus. The driver instead reads the untranslated address
out of its reg property, which only happens to be what the BCM2835 DMA
controller expects because the DMA engine driver used the address
verbatim.

Now that the DMA engine driver translates slave addresses itself, use the
CPU physical address of the register resource, which also gets rid of
the open coded parsing of the DT node.

Also zero-initialize the slave configuration: the TX channel only sets
the destination address, while the DMA engine driver now maps every
address that is provided.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/spi/spi-bcm2835.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index cc5748973281..c40157e4516a 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -24,7 +24,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h> /* FIXME: using GPIO lookup tables */
@@ -888,23 +887,12 @@ static void bcm2835_dma_release(struct spi_controller *ctlr,
 }
 
 static int bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
-			    struct bcm2835_spi *bs)
+			    struct bcm2835_spi *bs, phys_addr_t phys_base)
 {
-	struct dma_slave_config slave_config;
+	struct dma_slave_config slave_config = {};
 	struct device *tx_dma_dev;
-	const __be32 *addr;
-	dma_addr_t dma_reg_base;
 	int ret;
 
-	/* base address in dma-space */
-	addr = of_get_address(ctlr->dev.of_node, 0, NULL, NULL);
-	if (!addr) {
-		dev_err(dev, "could not get DMA-register address - not using dma mode\n");
-		/* Fall back to interrupt mode */
-		return 0;
-	}
-	dma_reg_base = be32_to_cpup(addr);
-
 	/* get tx/rx dma */
 	ctlr->dma_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(ctlr->dma_tx)) {
@@ -926,7 +914,7 @@ static int bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
 	 * or, in case of an RX-only transfer, cyclically copies from the zero
 	 * page to the FIFO using a preallocated, reusable descriptor.
 	 */
-	slave_config.dst_addr = (u32)(dma_reg_base + BCM2835_SPI_FIFO);
+	slave_config.dst_addr = phys_base + BCM2835_SPI_FIFO;
 	slave_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 
 	ret = dmaengine_slave_config(ctlr->dma_tx, &slave_config);
@@ -967,9 +955,9 @@ static int bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
 	 * RX FIFO or, in case of a TX-only transfer, cyclically writes a
 	 * precalculated value to the CS register to clear the RX FIFO.
 	 */
-	slave_config.src_addr = (u32)(dma_reg_base + BCM2835_SPI_FIFO);
+	slave_config.src_addr = phys_base + BCM2835_SPI_FIFO;
 	slave_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-	slave_config.dst_addr = (u32)(dma_reg_base + BCM2835_SPI_CS);
+	slave_config.dst_addr = phys_base + BCM2835_SPI_CS;
 	slave_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 
 	ret = dmaengine_slave_config(ctlr->dma_rx, &slave_config);
@@ -1355,6 +1343,7 @@ static int bcm2835_spi_probe(struct platform_device *pdev)
 {
 	struct spi_controller *ctlr;
 	struct bcm2835_spi *bs;
+	struct resource *res;
 	int err;
 
 	ctlr = devm_spi_alloc_host(&pdev->dev, sizeof(*bs));
@@ -1377,7 +1366,7 @@ static int bcm2835_spi_probe(struct platform_device *pdev)
 	bs = spi_controller_get_devdata(ctlr);
 	bs->ctlr = ctlr;
 
-	bs->regs = devm_platform_ioremap_resource(pdev, 0);
+	bs->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(bs->regs))
 		return PTR_ERR(bs->regs);
 
@@ -1394,7 +1383,7 @@ static int bcm2835_spi_probe(struct platform_device *pdev)
 
 	bs->clk_hz = clk_get_rate(bs->clk);
 
-	err = bcm2835_dma_init(ctlr, &pdev->dev, bs);
+	err = bcm2835_dma_init(ctlr, &pdev->dev, bs, res->start);
 	if (err)
 		return err;
 
-- 
2.51.0

