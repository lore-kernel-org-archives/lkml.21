Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127296;
	b=eYhIaIaac8Aavvz5kK/0XU7TSF/r20urqWx9GH+7NPysYEls7pDVOnW+YsYhHSAB4oiF
	 4N6NqbCOZjHUJ4LXHj8wofqfBhIAxprpd2ZljAZNVqSFjD0BZz3GR1Iax3TN3+iqV4be2
	 jUh0RAflXSjSxn0udsrizb+ZLwGiRpr4Sm0sKE9xSYfDSD1blBd4/O8zahKCQCshaNGfa
	 ecGffjeBXQCczLqTH8alaLJQNLkfyv8QUS/Gr1bNkx0nqwK8vCUDq42W4iMGnSWMXVj9C
	 EOrSsX4tZgH26KC4K/VbUvC147fC7Jpil3X4eOcDd3rggPPXSVSI06mpOQeyjjRyOcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127296;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=RBwbTuzG8Tf8ZY+XdUTzmmrIkAT0P/6hihVvntI9HGQ=;
	b=DbMb8Es8Z0oSHcAVfD/TNgH1UER+SFJTLvwm5mXQQU3Wa/5xSvvSIOuoZpOjKEbLRzvB
	 DfjG/m36PxhEUqzAHeUKIaMQPY8+BNsdcSc9jSVd0QVFRWKrzA6hh/vnZWhCd0LbVCch7
	 Yu+eyhgzNjo8rjAUv+9CJHEfw4a2fiMNVpuTHUvJs6RJP8sEaH4n3vu/v9QinH0ovOHMP
	 oHKuk/fvEc9WQxiCyl1bAypV0mIqT1HjuOEA53x1daRSQSDwr6bpSinq7t80MrBj6E47j
	 G3X3qx5/XxNblNLCB0JtLu0Y3uGC4r0Wbs/xUlIpRxgdPMIg//YlwRBesCcgWHSjpBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZnctWx2c;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A123C606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A123C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZnctWx2c
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6275E1A172B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:28:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 37F586035B;
	Thu, 19 Nov 2026 22:28:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2EFF11BC0D8D;
	Thu, 19 Nov 2026 23:28:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795127289; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RBwbTuzG8Tf8ZY+XdUTzmmrIkAT0P/6hihVvntI9HGQ=;
	b=ZnctWx2crOylXJMlJuzjMTRRGJz72eoVfjnlrxcvv/nxwvMiHMHinDUZDO5WX031Avjrof
	GeL1kCBEb4WVnwFnJYjrksGvky0sodKWSc+wfpzvktRXekEbIbzu9F1UgoWZxY6wuiDVQo
	fpd2I7YC7owENHRis2wX/qvYsH69jQsuQFDs1yYs38ZsPEv6JOT7per788YwtXen3lKco3
	mWsbrt4zyqiPRlHX8DP3u4lV6E/7nkmp1P/+ZssDfIKBYfRro1rg4GRdyBn4OwajVpXmqn
	fhScp4H2810eZ6iAJIn3cOTDYfGkTh/os9v2g7n0ElOn7C3zAgEYKoEuju9QDw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 19 Nov 2026 23:27:57 +0100
Subject: [PATCH 2/2] mtd: rawnand: cadence: Switch to
 dmaengine_get_dma_device()
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
Message-Id: <20261119-perso-upstreaming-rawnand-fixes-v1-2-0c95641b550c@bootlin.com>
References: <20261119-perso-upstreaming-rawnand-fixes-v1-0-0c95641b550c@bootlin.com>
In-Reply-To: <20261119-perso-upstreaming-rawnand-fixes-v1-0-0c95641b550c@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Use the dmaengine consumer accessor instead of open-coding it (as
already done in the remove path).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 42cc62b36457..2ab59ec6e732 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -3126,7 +3126,6 @@ cadence_nand_irq_cleanup(int irqnum, struct cdns_nand_ctrl *cdns_ctrl)
 static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 {
 	dma_cap_mask_t mask;
-	struct dma_device *dma_dev;
 	int ret;
 
 	cdns_ctrl->cdma_desc = dma_alloc_coherent(cdns_ctrl->dev,
@@ -3162,6 +3161,8 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 	dma_cap_set(DMA_MEMCPY, mask);
 
 	if (cdns_ctrl->caps1->has_dma) {
+		struct device *dma_dev;
+
 		cdns_ctrl->dmac = dma_request_chan_by_mask(&mask);
 		if (IS_ERR(cdns_ctrl->dmac)) {
 			ret = dev_err_probe(cdns_ctrl->dev, PTR_ERR(cdns_ctrl->dmac),
@@ -3169,12 +3170,12 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 			goto disable_irq;
 		}
 
-		dma_dev = cdns_ctrl->dmac->device;
-		cdns_ctrl->io.iova_dma = dma_map_resource(dma_dev->dev, cdns_ctrl->io.dma,
+		dma_dev = dmaengine_get_dma_device(cdns_ctrl->dmac);
+		cdns_ctrl->io.iova_dma = dma_map_resource(dma_dev, cdns_ctrl->io.dma,
 							  cdns_ctrl->io.size,
 							  DMA_BIDIRECTIONAL, 0);
 
-		ret = dma_mapping_error(dma_dev->dev, cdns_ctrl->io.iova_dma);
+		ret = dma_mapping_error(dma_dev, cdns_ctrl->io.iova_dma);
 		if (ret) {
 			dev_err(cdns_ctrl->dev, "Failed to map I/O resource to DMA\n");
 			goto dma_release_chnl;
@@ -3205,8 +3206,9 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 
 unmap_dma_resource:
 	if (cdns_ctrl->dmac)
-		dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
-				   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
+		dma_unmap_resource(dmaengine_get_dma_device(cdns_ctrl->dmac),
+				   cdns_ctrl->io.iova_dma, cdns_ctrl->io.size,
+				   DMA_BIDIRECTIONAL, 0);
 
 dma_release_chnl:
 	if (cdns_ctrl->dmac)

-- 
2.56.0

