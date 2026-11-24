Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512277;
	b=QaL4Dl53pYbibXUpF6mW9nmXhJySrpKWpsez6tkWol4mBLKT2YMTmVTyo95ar4wiRfeh
	 Hc1hxVhUGhRN/+jxnYjRdSrkOkAZAI0O6E7zpwpHs0HqMSmzTLO2PNTfbrMOT9V3/puzy
	 QEyzJl5xISfvPfudJZ7851f+PJrkgGLOZpLDBB3LtnoftlI9hA+6xpr8OEGGsxIaqJKVS
	 Wn3rQhdBDf/Q3idIIjko/WuNjvFNSIErY9DwVGWtJDlZ7ES/zgaGRrx08jKQMoXVHqNuO
	 RPHm7HLA5hpZd4PxtkmAlCawH3NbpBe1de+HDqqQnqvtwrrRAIhLeaHkh5d7H3bX0Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512277;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=d0DarnFgFzWuuXMjS2pFabQsuPpoJoPiwUJ6AhTmMdw=;
	b=vRJFRjwTc5nSmhx9Fewfaf1XNeolIT46ipZQGBmM5j03r32+DrtK0/hobUPmkjwifU2u
	 lzdbFZhDtxrltHO4IgXg33kqdKPTEXCSaJZppvC8lGc1HEjUldm8cjOIVMWu16EdJ2O7X
	 Esi5FqKzgMlVUQF9LiRioSUe6KeFdxXsDo3Fd+6mBKPsk4HbnY7PY5zhvYTY2pPaIHwRD
	 J3DnDojXeiZMBJIKVEqalzKdgANovsVBtMN6FPTmZmgU/sl87hivB0+0hmGVScoHZMybG
	 Xkx47T+IGvTuk3zehPtePnuVGif58WeIY1gT3Wdsr14UnxJ2Zq+aA56iQRHTcApipRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=umRo2654;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963C1606A68C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 963C1606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=umRo2654
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B2FD4C2C643;
	Tue, 24 Nov 2026 09:24:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59475601E1;
	Tue, 24 Nov 2026 09:24:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E19511E68A4D;
	Tue, 24 Nov 2026 10:24:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795512274; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d0DarnFgFzWuuXMjS2pFabQsuPpoJoPiwUJ6AhTmMdw=;
	b=umRo2654NV/3X19URObCEfxEdOrbOR1rFIGR9fnAm/jg61vaw00un9Z//61kpae6/c4TO7
	IhAIqUFJxEvJiV3MBKhyIrDGn6z2bWkPnuUeuqOajWk+iy+KBr9DoCcTNAWeD5y8xYicfy
	EpP0niMgQtrg6LiEr2DPqCDh3LuvHZRDsz92Aiqxe+I3ctfXSmw/QJj5W1jQ47mvWN5bb6
	tqn924srQ/0iY+GVjksQ9zA6AozI3ESjXhRE72JSw+yRC4spO2ZDH6aplZQb8skpiUrgmP
	ZHbqUJ5e1xtGcmQ388mICSZod+s9Kyg8MNH7MO0/cRQbWh3nUL9PMoe6CGjLDw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Nov 2026 10:24:24 +0100
Subject: [PATCH v2 3/3] mtd: rawnand: cadence: Switch to
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
Message-Id: <20261124-perso-upstreaming-rawnand-fixes-v2-3-69db17ad07bd@bootlin.com>
References: <20261124-perso-upstreaming-rawnand-fixes-v2-0-69db17ad07bd@bootlin.com>
In-Reply-To: <20261124-perso-upstreaming-rawnand-fixes-v2-0-69db17ad07bd@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Use the dmaengine consumer accessor instead of open-coding it (as
already done in the remove path). Do it as well for the buffer mapping
done in cadence_nand_slave_dma_transfer() so that both ends of the
transfer are mapped against the same device, which matters for DMA
engines exposing a per-channel DMA device.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 912148f90ece..6f990469b8e5 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -1873,16 +1873,16 @@ static int cadence_nand_slave_dma_transfer(struct cdns_nand_ctrl *cdns_ctrl,
 {
 	DECLARE_COMPLETION_ONSTACK(finished);
 	struct dma_chan *chan;
-	struct dma_device *dma_dev;
 	dma_addr_t src_dma, dst_dma, buf_dma;
 	struct dma_async_tx_descriptor *tx;
+	struct device *dma_dev;
 	dma_cookie_t cookie;
 
 	chan = cdns_ctrl->dmac;
-	dma_dev = chan->device;
+	dma_dev = dmaengine_get_dma_device(chan);
 
-	buf_dma = dma_map_single(dma_dev->dev, buf, len, dir);
-	if (dma_mapping_error(dma_dev->dev, buf_dma)) {
+	buf_dma = dma_map_single(dma_dev, buf, len, dir);
+	if (dma_mapping_error(dma_dev, buf_dma)) {
 		dev_err(cdns_ctrl->dev, "Failed to map DMA buffer\n");
 		goto err;
 	}
@@ -1914,12 +1914,12 @@ static int cadence_nand_slave_dma_transfer(struct cdns_nand_ctrl *cdns_ctrl,
 	dma_async_issue_pending(cdns_ctrl->dmac);
 	wait_for_completion(&finished);
 
-	dma_unmap_single(dma_dev->dev, buf_dma, len, dir);
+	dma_unmap_single(dma_dev, buf_dma, len, dir);
 
 	return 0;
 
 err_unmap:
-	dma_unmap_single(dma_dev->dev, buf_dma, len, dir);
+	dma_unmap_single(dma_dev, buf_dma, len, dir);
 
 err:
 	dev_dbg(cdns_ctrl->dev, "Fall back to CPU I/O\n");
@@ -3134,8 +3134,8 @@ cadence_nand_irq_cleanup(int irqnum, struct cdns_nand_ctrl *cdns_ctrl)
 
 static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 {
+	struct device *dma_dev;
 	dma_cap_mask_t mask;
-	struct dma_device *dma_dev;
 	int ret;
 
 	cdns_ctrl->cdma_desc = dma_alloc_coherent(cdns_ctrl->dev,
@@ -3181,12 +3181,12 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
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
@@ -3210,7 +3210,7 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 
 unmap_dma_resource:
 	if (cdns_ctrl->dmac)
-		dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
+		dma_unmap_resource(dma_dev, cdns_ctrl->io.iova_dma,
 				   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
 
 dma_release_chnl:

-- 
2.56.0

