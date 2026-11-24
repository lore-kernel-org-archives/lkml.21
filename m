Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512275;
	b=X/wWDyg/T9HaG0rnUJPP4kQISiI53S4A0zsKDKbnmk6of/t+loNeNhzPG1p+SdB1lAXs
	 d8Mv7Vg428nanXnSx5cQPIv/LNZzrwC4JFO+iR4ev6GW5BYPsL06r+lKxVNr5bsHBlxiv
	 8DEzDdxQL1zIRs2MWl4vKRrutKParh53rEqjivkDGykDrZUbH3K+f1qclHwrkcguJGDYT
	 Q7mU2MMXN8aiKHz2cVaSHzE3s5zz502X4TB/EdGutaF4k6GXH9tove0LaGDSls3Hv52rY
	 RBKEZ6zGrOoSnCm4/Ri6/DzYjBA+CLVg88XZN4e5XN6qvbNNRdWyYHMY9mk9PdEspJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512275;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=OCZOn+cqE7e8uuH9fPsFEjtoD65VvfhvTdGx7l8MCeE=;
	b=4ZZnnXnq+5ynbaNzI3Ozid1RSjLTPKoouoPSdEea7bHkOsTUyvr5AFo5ty85w2BXsAPy
	 q2EPdQi2C3+2wJh0HH4aLe2yNAvmTj2zmDDAtVchozLvZEDaIsLOotlCNbqcoZFaE9GY5
	 0SVAQxD3I80jPTS6aar7924xeqAiyl39aliVFnqHHLOPPBk+DufmULF/36WM0zAFtKJGo
	 2iH08omTUMNBxX/NL3q0EhAB+2kI06qUoCk1N6cOqK/C7OR4spEUUKPHIeWS+EzGLAxPY
	 MEVVygf3kRaGxOWjsFSh6+GNzR07Na+FNUQv7vLgTKKM1wA3O0RTTqLk4SlXZOGPscA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dNW5k8sX;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4370E606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4370E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dNW5k8sX
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F14E91A17B5;
	Tue, 24 Nov 2026 09:24:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7B31601E1;
	Tue, 24 Nov 2026 09:24:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 673A611E6A5BF;
	Tue, 24 Nov 2026 10:24:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795512271; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OCZOn+cqE7e8uuH9fPsFEjtoD65VvfhvTdGx7l8MCeE=;
	b=dNW5k8sXvh1W/kPRuVNQeI14Vqtp//01RcYQiJNKcHQ+cK4q/r5fWeRlzqFIOpo0bjHetP
	0hJ8I8v/bmuluyuXhqU7600QkyVnBXLK8IEipLHfvut5iSfR3D98wWqAdrwD5gSaq/Ngq5
	7bU2hLB2I3i+6avpvAcAyKQuKau56fhCwvYpfVo+wW9OD5A50aPorrB9b+voL6AmL06XfO
	GuLchSnHqPwBlgKleYiF2I+fhPJ7w29Ets0mm1q6+bNMB8aMryqso+I1NXZioO5k9nMTzC
	1EkvTda2kNdhIWlg4BfUES6buUZI+I14THRKDTdI1+3U6LmsWSn3s6vHV9r0BA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Nov 2026 10:24:22 +0100
Subject: [PATCH v2 1/3] mtd: rawnand: cadence: Fix DMA device dereference
 when DMA is disabled
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
Message-Id: <20261124-perso-upstreaming-rawnand-fixes-v2-1-69db17ad07bd@bootlin.com>
References: <20261124-perso-upstreaming-rawnand-fixes-v2-0-69db17ad07bd@bootlin.com>
In-Reply-To: <20261124-perso-upstreaming-rawnand-fixes-v2-0-69db17ad07bd@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Move the DMA resource mapping into the has_dma branch and only unmap the
resource when a DMA channel was actually acquired.

Fixes: 5c56bf214af8 ("mtd: rawnand: cadence: fix DMA device NULL pointer dereference")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/all/202603252339.fQzI6oc8-lkp@intel.com/
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/all/202609010758.3N8tYZdG-lkp@intel.com/
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index e19ceb2d5dfc..42cc62b36457 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -3168,17 +3168,17 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 					    "%d: Failed to get a DMA channel\n", ret);
 			goto disable_irq;
 		}
-	}
 
-	dma_dev = cdns_ctrl->dmac->device;
-	cdns_ctrl->io.iova_dma = dma_map_resource(dma_dev->dev, cdns_ctrl->io.dma,
-						  cdns_ctrl->io.size,
-						  DMA_BIDIRECTIONAL, 0);
+		dma_dev = cdns_ctrl->dmac->device;
+		cdns_ctrl->io.iova_dma = dma_map_resource(dma_dev->dev, cdns_ctrl->io.dma,
+							  cdns_ctrl->io.size,
+							  DMA_BIDIRECTIONAL, 0);
 
-	ret = dma_mapping_error(dma_dev->dev, cdns_ctrl->io.iova_dma);
-	if (ret) {
-		dev_err(cdns_ctrl->dev, "Failed to map I/O resource to DMA\n");
-		goto dma_release_chnl;
+		ret = dma_mapping_error(dma_dev->dev, cdns_ctrl->io.iova_dma);
+		if (ret) {
+			dev_err(cdns_ctrl->dev, "Failed to map I/O resource to DMA\n");
+			goto dma_release_chnl;
+		}
 	}
 
 	nand_controller_init(&cdns_ctrl->controller);
@@ -3204,8 +3204,9 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 	return 0;
 
 unmap_dma_resource:
-	dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
-			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
+	if (cdns_ctrl->dmac)
+		dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
+				   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
 
 dma_release_chnl:
 	if (cdns_ctrl->dmac)

-- 
2.56.0

