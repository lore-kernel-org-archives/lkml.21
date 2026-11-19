Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053304;
	b=jmwTn+ge6q/EUSVQX09F8/wgWJcF1iKYTItAa26/JMHF/ZBzNsPAF3HRXWUhkKZG0szm
	 hGkoC25RuIJ9w2Xyu5LjzJ2MEh4roh8byhbFAGu1pFuA/oU9QaYdCRC9c1JEzFsWNa40Q
	 /K2pn24Ld0Jq4PM3Wtf1qaRovX2HF47aQoAH2hAFULg7QFs4FHEQsD/xnJA42vHKBSetK
	 uJUv/XYjhRicqznhtktWNHSMxPQch0pNPBhuHr3Yh5N8egbaajHWO+4y3m2RSkKtM5C16
	 JpuUoMir+T+NxZ8MAbOczxlse8FXzD9tdIqPcNzCS5qgLCyQBWDhyw3AB/YAjfJbktA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k+WMPALfSKiMPy/d/A+agv70fM3OBBS8SZaWeV0CxA4=;
	b=RIPcNUGE3J6RR10ZyrIKVa9UodSQkVbiYAyJOrU5/iraOcjvvnnegdMxgubPZlhGGz0I
	 Kjo7Bf/ippity4CGQi75WLSVDk4Dtxo7oOtsESrzae96r/p1oK/Pmw+QqCe1DjvqpNk5R
	 g1FPcaXUItkRHMvfmBVpd/W/HAobSZUeG20QCe/k+o/y/9t1ikPtIU9YLv4zSTKjMn80G
	 9DMEMUaiAnvKQh5zEdBwH6hXg/RjDFrsx0S4GA/TWF6uYT2/KGKqaCoHMB51MRUQ33qQJ
	 WGfO4lJQOIDS5VTuZ6BM3DkjPDVYk9H7f6YjvLUT/z0eqmsgFJk+S2DSjt76YSK2sug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aQ/MZsGf";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F15660A263A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F15660A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aQ/MZsGf
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1521982a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795053303; x=1795658103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k+WMPALfSKiMPy/d/A+agv70fM3OBBS8SZaWeV0CxA4=;
        b=aQ/MZsGfp9Q2b9JWyglvGPtuIpwf13MDLXLjJwVU4RypkG22DojCJOADY/noZPAxrt
         NLfImzj9F1g9nJYHRrrmC06y27vAG3nxo0vRX0UTsatStsDUup3b9HH52d9H6KEOaekC
         q94ukcIYNffcmZs39wTQOQQcEgeC1RcrQNEovBqRONbdjjjwxttpHXlIi5WgOnEdZV7R
         vS6wGifQkYo8n51zpbZDOEBT56pNIbxlxvfOKMr5UhwghEb2y7PeX1l/SeiA79h23itG
         vfaxsqeL94a/wMiqGSTh7d1kzuN0UcQ3w/Kev1eUwO8cqXH0OTcNc8miKnKccm8vV7UJ
         Kjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795053303; x=1795658103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k+WMPALfSKiMPy/d/A+agv70fM3OBBS8SZaWeV0CxA4=;
        b=IMgWkhjaMt0Q4QjHAmH40V9rehVAfMcadv/hKqDjf5l7VhOJk+VnXO1IMbs2NcSmXr
         JE6vMpoHiEBPKcgmOkGHf8pREQWlBWqFW1JO62egay+4RIBlomddPGPiI9fl/6zDlGN4
         Oqp+XwrFf0fQ/ey3ZiIIU2WlG/Aa+7WnZz/1JiRpj9z66JjHuWwaeHeitvcjKlE4/+Mk
         Ag6buLZxVRJcp/25SXNyAnrAH2iFIjz1laZXtf0ZhKAdCrtXBJCbniYFFWurZXVeED0U
         CgHMDxtUGu11gJUFbJJsdv6d3drT+/C6z+LE+bWaXdS1Ap3RIaUoEVddEafacTvhk0fN
         w+SQ==
X-Forwarded-Encrypted: i=1; AL+hErGopBEf6plogCmcn5jsVtgi07Q0lGDiUvPhnN/gXtWSZoeYMiJ3kHEzWSNAv73tx4xuDG4v4ByegZ8Epto=@vger.kernel.org
X-Gm-Message-State: APuU4Z+afyTxrH94bdWx54l4J1Ixwf9nWllQfbnuT+SUwy3eITSRW7IZ
	JWiueVgKZzF+RcpskImAOlPV6/mJm5tvzmIQJIwGlBwTxVveiwVZ/I1v
X-Gm-Gg: AZFdTZeyq4MYq8NLIhaUttq1wQjd31TBxB+2shz87EBu+/o6tM4PPhQy/Jm60ZO/KlC
	/AqUbSoEyUrxYV6ni3lNOUT+i+yBrbddTwAhvm7eJFSGCOsRe0BrphRMF1C066MzRxHoc0Qc6CX
	nNkf1iAzrSKbG16DjH654YwFXUC8CAzxcZELyBg+rDbfT0BAsmoVInNts9MlqR8p8gEG90LinJr
	8IskXEj8PFhzvp0HW698lUAPbluPPDuhUGKv8P8gpncgPeS28TQ5LtP7+vA3L5+oqbx7tj2hxEn
	zkeb4q/Jr9G94USO1GSKQU+/JKNaFnOENJpG5RVd1qJacLdnH+BaWINzxhzvpQIBlbjw0rNmsMJ
	g6GxmI2axIlwJzJvOS7PA0blZBiCyCmtju3Jor44Dg5rSHjyNs6wwoxJfoacdrzOfpTIcOI+T6z
	A4hzuSNBhoVKK2oH4WqniFOW1OM4l1l2p7l8JZdQoH9/0cBwUOGIIT8087oed4atnmuXLx6cLdR
	T8rk7plGRJAQTLc6s3vGoyhG3+jztXDzlMzEkXhhjyRw4IiiWMfGtCG4GewYzeV01XnaNr+EiB9
	CD/UqDsw3DqQWLxZpnCCcyrlweBfjf7RiI8WmtAs8QDYL6XvNcu4t8581KYKsqLADFz/vo6BPMY
	XCZgxd+y9KORqmPo=
X-Received: by 2002:a17:90b:56d0:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3b3d07d4ecfmr4226653a91.50.1795053303195;
        Wed, 18 Nov 2026 17:55:03 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe03c3d4sm773081a91.14.2026.11.18.17.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:55:02 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>
Subject: [PATCH v3 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Date: Thu, 19 Nov 2026 09:54:47 +0800
Message-Id: <20261119015447.160470-3-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261119015447.160470-1-shanchun1218@gmail.com>
References: <20261119015447.160470-1-shanchun1218@gmail.com>
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

Add a driver for the PDMA controller found in the Nuvoton MA35D1 SoC.
It supports up to 10 channels with memory-to-memory, slave scatter-gather
and cyclic transfers.

Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
---
 drivers/dma/Kconfig       |  12 +
 drivers/dma/Makefile      |   1 +
 drivers/dma/ma35d1-pdma.c | 662 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 675 insertions(+)
 create mode 100644 drivers/dma/ma35d1-pdma.c

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 01f96a8257e5..3d4d09e459f1 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -404,6 +404,18 @@ config LPC32XX_DMAMUX
 	  Support for PL080 multiplexed DMA request lines on
 	  LPC32XX platrofm.
 
+config MA35D1_PDMA
+	tristate "Nuvoton MA35D1 PDMA Engine"
+	depends on ARCH_MA35 || COMPILE_TEST
+	select DMA_ENGINE
+	select DMA_VIRTUAL_CHANNELS
+	help
+	  Support the Nuvoton MA35D1 PDMA engine. This engine is integrated
+	  into Nuvoton MA35D1 chips. This DMA controller can transfer data
+	  from memory to memory, memory to peripheral and peripheral to memory.
+	  If you have a board based on such a SoC and wish to use DMA, say Y
+	  or M here.
+
 config MCF_EDMA
 	tristate "Freescale eDMA engine support, ColdFire mcf5441x SoCs"
 	depends on M5441x || (COMPILE_TEST && FSL_EDMA=n)
diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
index f62d12b08e15..dd99f7d12d4d 100644
--- a/drivers/dma/Makefile
+++ b/drivers/dma/Makefile
@@ -52,6 +52,7 @@ obj-y += idxd/
 obj-$(CONFIG_K3_DMA) += k3dma.o
 obj-$(CONFIG_LPC18XX_DMAMUX) += lpc18xx-dmamux.o
 obj-$(CONFIG_LPC32XX_DMAMUX) += lpc32xx-dmamux.o
+obj-$(CONFIG_MA35D1_PDMA) += ma35d1-pdma.o
 obj-$(CONFIG_MILBEAUT_HDMAC) += milbeaut-hdmac.o
 obj-$(CONFIG_MILBEAUT_XDMAC) += milbeaut-xdmac.o
 obj-$(CONFIG_MMP_PDMA) += mmp_pdma.o
diff --git a/drivers/dma/ma35d1-pdma.c b/drivers/dma/ma35d1-pdma.c
new file mode 100644
index 000000000000..0d6a74404321
--- /dev/null
+++ b/drivers/dma/ma35d1-pdma.c
@@ -0,0 +1,662 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Nuvoton MA35D1 PDMA controller driver
+ *
+ * Copyright (C) 2026 Nuvoton Technology Corp.
+ *
+ * Author: Shan-Chun Hung <shanchun1218@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmaengine.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_dma.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include "virt-dma.h"
+
+/* PDMA registers */
+#define PDMA_DSCT_CTL		0x000
+#define PDMA_DSCT_SA		0x004
+#define PDMA_DSCT_DA		0x008
+#define PDMA_DSCT_NEXT		0x00c
+#define PDMA_CHCTL		0x400
+#define PDMA_SWREQ		0x408
+#define PDMA_INTEN		0x418
+#define PDMA_ABTSTS		0x420
+#define PDMA_TDSTS		0x424
+#define PDMA_CHRST		0x460
+#define PDMA_REQSEL		0x480
+
+/* Bitfields in PDMA registers */
+#define PDMA_OP_BASIC		BIT(0)
+#define PDMA_OP_SCATTER		BIT(1)
+#define PDMA_OP_MSK		GENMASK(1, 0)
+#define PDMA_TXTYPE		BIT(2)
+#define PDMA_TBINTDIS		BIT(7)
+#define PDMA_SAFIX		GENMASK(9, 8)
+#define PDMA_DAFIX		GENMASK(11, 10)
+
+#define PDMA_MAX_CHANS		10
+#define PDMA_MAX_CHAN_BEATS	(U16_MAX + 1)
+
+#define PDMA_WIDTH(w)		FIELD_PREP(GENMASK(13, 12), (w) >> 1)
+#define PDMA_TXCNT(cnt)		FIELD_PREP(GENMASK(31, 16), (cnt) - 1)
+#define PDMA_CH_OFFSET(ch)	((ch) * 0x10)
+
+#define PDMA_SLAVE_BUSWIDTHS	(BIT(DMA_SLAVE_BUSWIDTH_1_BYTE)  | \
+				 BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) | \
+				 BIT(DMA_SLAVE_BUSWIDTH_4_BYTES))
+
+struct ma35d1_sg {
+	u32 ctl;
+	u32 src;
+	u32 dst;
+	u32 next;
+};
+
+struct ma35d1_desc {
+	struct ma35d1_chan *ch;
+	bool cyclic;
+	struct virt_dma_desc vd;
+	dma_addr_t dma_addr;
+	size_t dma_len;
+	u32 sg_len;
+	struct ma35d1_sg *sg;
+};
+
+struct ma35d1_chan {
+	struct device *dev;
+	struct ma35d1_pdmadev *pdmadev;
+	struct virt_dma_chan vc;
+	void __iomem *base;
+	int id;
+	struct ma35d1_desc *desc;
+	struct dma_slave_config cfg;
+	/* second #dma-cells argument from devicetree */
+	u32 request;
+};
+
+struct ma35d1_pdmadev {
+	struct dma_device ddev;
+	/* protects read-modify-write of shared controller registers */
+	spinlock_t lock;
+	int irq;
+	struct ma35d1_chan channels[PDMA_MAX_CHANS];
+};
+
+static inline struct ma35d1_chan *to_ma35d1_pdma_chan(struct dma_chan *c)
+{
+	return container_of(c, struct ma35d1_chan, vc.chan);
+}
+
+static inline struct ma35d1_desc *to_ma35d1_pdma_desc(struct virt_dma_desc *vd)
+{
+	return container_of(vd, struct ma35d1_desc, vd);
+}
+
+static inline void ma35d1_pdma_reg_set(struct ma35d1_chan *ch, u32 offset, u32 mask)
+{
+	writel(readl(ch->base + offset) | mask, ch->base + offset);
+}
+
+static inline void ma35d1_pdma_reg_clear(struct ma35d1_chan *ch, u32 offset, u32 mask)
+{
+	writel(readl(ch->base + offset) & ~mask, ch->base + offset);
+}
+
+static void ma35d1_pdma_desc_free(struct virt_dma_desc *vd)
+{
+	struct ma35d1_desc *d = to_ma35d1_pdma_desc(vd);
+
+	dma_free_coherent(d->ch->dev, d->dma_len, d->sg, d->dma_addr);
+	kfree(d);
+}
+
+static int ma35d1_terminate_all(struct dma_chan *chan)
+{
+	LIST_HEAD(head);
+	struct ma35d1_chan *ch = to_ma35d1_pdma_chan(chan);
+	unsigned long flags, pdmadev_flags;
+
+	spin_lock_irqsave(&ch->vc.lock, flags);
+
+	spin_lock_irqsave(&ch->pdmadev->lock, pdmadev_flags);
+	ma35d1_pdma_reg_clear(ch, PDMA_CHCTL, BIT(ch->id));
+	spin_unlock_irqrestore(&ch->pdmadev->lock, pdmadev_flags);
+
+	writel(BIT(ch->id), ch->base + PDMA_TDSTS);
+	writel(BIT(ch->id), ch->base + PDMA_ABTSTS);
+
+	if (ch->desc) {
+		vchan_terminate_vdesc(&ch->desc->vd);
+		ch->desc = NULL;
+	}
+
+	vchan_get_all_descriptors(&ch->vc, &head);
+	list_splice_tail(&head, &ch->vc.desc_terminated);
+	spin_unlock_irqrestore(&ch->vc.lock, flags);
+
+	return 0;
+}
+
+static void ma35d1_synchronize(struct dma_chan *chan)
+{
+	struct ma35d1_chan *ch = to_ma35d1_pdma_chan(chan);
+
+	vchan_synchronize(&ch->vc);
+}
+
+static void ma35d1_pdma_setup_channel(struct ma35d1_chan *ch)
+{
+	u32 offset, reg, shift;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ch->pdmadev->lock, flags);
+
+	if ((readl(ch->base + PDMA_CH_OFFSET(ch->id)) & GENMASK(1, 0)) != 0) {
+		reg = readl(ch->base + PDMA_CHCTL);
+		writel(0, ch->base + PDMA_CH_OFFSET(ch->id));
+		ma35d1_pdma_reg_set(ch, PDMA_CHRST, BIT(ch->id));
+		writel(reg | BIT(ch->id), ch->base + PDMA_CHCTL);
+	} else {
+		writel(0, ch->base + PDMA_CH_OFFSET(ch->id));
+		ma35d1_pdma_reg_set(ch, PDMA_CHCTL, BIT(ch->id));
+	}
+	ma35d1_pdma_reg_set(ch, PDMA_INTEN, BIT(ch->id));
+
+	offset = PDMA_REQSEL + (ch->id & ~GENMASK(1, 0));
+	shift = (ch->id & GENMASK(1, 0)) * 8;
+	ma35d1_pdma_reg_clear(ch, offset, GENMASK(7, 0) << shift);
+	ma35d1_pdma_reg_set(ch, offset, ch->request << shift);
+
+	spin_unlock_irqrestore(&ch->pdmadev->lock, flags);
+}
+
+static int ma35d1_slave_config(struct dma_chan *chan, struct dma_slave_config *cfg)
+{
+	struct ma35d1_chan *ch = to_ma35d1_pdma_chan(chan);
+
+	memcpy(&ch->cfg, cfg, sizeof(*cfg));
+
+	return 0;
+}
+
+static int ma35d1_slave_width(struct ma35d1_chan *ch, enum dma_transfer_direction dir)
+{
+	enum dma_slave_buswidth width;
+
+	if (dir == DMA_MEM_TO_DEV) {
+		width = ch->cfg.dst_addr_width;
+	} else if (dir == DMA_DEV_TO_MEM) {
+		width = ch->cfg.src_addr_width;
+	} else {
+		dev_err(ch->dev, "invalid DMA direction %d\n", dir);
+		return -EINVAL;
+	}
+
+	if (width != DMA_SLAVE_BUSWIDTH_1_BYTE && width != DMA_SLAVE_BUSWIDTH_2_BYTES &&
+	    width != DMA_SLAVE_BUSWIDTH_4_BYTES) {
+		dev_err(ch->dev, "invalid DMA width %d\n", width);
+		return -EINVAL;
+	}
+
+	return width;
+}
+
+static struct ma35d1_desc *ma35d1_desc_alloc(struct ma35d1_chan *ch, u32 sg_len)
+{
+	struct ma35d1_desc *d;
+
+	d = kzalloc_obj(*d, GFP_NOWAIT);
+	if (!d)
+		return NULL;
+
+	d->sg_len = sg_len;
+	d->dma_len = sizeof(*d->sg) * sg_len;
+	d->sg = dma_alloc_coherent(ch->dev, d->dma_len, &d->dma_addr, GFP_NOWAIT);
+	if (!d->sg) {
+		kfree(d);
+		return NULL;
+	}
+
+	return d;
+}
+
+static struct dma_async_tx_descriptor *
+ma35d1_desc_prep_done(struct ma35d1_chan *ch, struct ma35d1_desc *d, bool cyclic,
+		      unsigned long tx_flags)
+{
+	d->cyclic = cyclic;
+	d->ch = ch;
+
+	return vchan_tx_prep(&ch->vc, &d->vd, tx_flags);
+}
+
+static struct dma_async_tx_descriptor *
+ma35d1_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dst, dma_addr_t src,
+		       size_t len, unsigned long tx_flags)
+{
+	int i;
+	size_t tlen, max_chunk;
+	struct ma35d1_chan *ch = to_ma35d1_pdma_chan(chan);
+	struct ma35d1_desc *d;
+	u32 sg_len, width = 1;
+
+	if (ch->request != 0) {
+		dev_err(ch->dev, "%s: channel is bound to a peripheral request\n", __func__);
+		return NULL;
+	}
+
+	if (!len) {
+		dev_err(ch->dev, "invalid memcpy length\n");
+		return NULL;
+	}
+
+	/* Use 32-bit transfers when possible for higher throughput. */
+	if (IS_ALIGNED(src, 4) && IS_ALIGNED(dst, 4) && IS_ALIGNED(len, 4))
+		width = 4;
+
+	max_chunk = (size_t)PDMA_MAX_CHAN_BEATS * width;
+
+	sg_len = DIV_ROUND_UP_ULL(len, max_chunk);
+	d = ma35d1_desc_alloc(ch, sg_len);
+	if (!d)
+		return NULL;
+
+	for (i = 0; i < sg_len; i++) {
+		tlen = min_t(size_t, len, max_chunk);
+		d->sg[i].src = src;
+		d->sg[i].dst = dst;
+		d->sg[i].ctl = PDMA_WIDTH(width) | PDMA_TXCNT(tlen / width) | PDMA_TBINTDIS |
+				PDMA_OP_SCATTER;
+		d->sg[i].next = d->dma_addr + PDMA_CH_OFFSET(i + 1);
+		src += tlen;
+		dst += tlen;
+		len -= tlen;
+	}
+	d->sg[sg_len - 1].ctl &= ~(PDMA_OP_MSK | PDMA_TBINTDIS);
+	d->sg[sg_len - 1].ctl |= PDMA_OP_BASIC;
+
+	return ma35d1_desc_prep_done(ch, d, false, tx_flags);
+}
+
+static struct dma_async_tx_descriptor *
+ma35d1_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
+		     u32 sg_len, enum dma_transfer_direction dir,
+		     unsigned long tx_flags, void *context)
+{
+	int i, width;
+	struct ma35d1_chan *ch = to_ma35d1_pdma_chan(chan);
+	struct ma35d1_desc *d;
+	struct scatterlist *sgent;
+
+	width = ma35d1_slave_width(ch, dir);
+	if (width < 0)
+		return NULL;
+
+	if (!sg_len) {
+		dev_err(ch->dev, "SG entry length is zero\n");
+		return NULL;
+	}
+
+	for_each_sg(sgl, sgent, sg_len, i) {
+		unsigned int len = sg_dma_len(sgent);
+
+		if (!len || len % width || len / width > PDMA_MAX_CHAN_BEATS) {
+			dev_err(ch->dev, "invalid SG segment length %u\n", len);
+			return NULL;
+		}
+
+		if (!IS_ALIGNED(sg_dma_address(sgent), width)) {
+			dev_err(ch->dev, "SG address not aligned to DMA width\n");
+			return NULL;
+		}
+	}
+
+	d = ma35d1_desc_alloc(ch, sg_len);
+	if (!d)
+		return NULL;
+
+	for_each_sg(sgl, sgent, sg_len, i) {
+		if (dir == DMA_MEM_TO_DEV) {
+			d->sg[i].ctl = PDMA_WIDTH(width) | PDMA_DAFIX;
+			d->sg[i].src = sg_dma_address(sgent);
+			d->sg[i].dst = ch->cfg.dst_addr;
+		} else {
+			d->sg[i].ctl = PDMA_WIDTH(width) | PDMA_SAFIX;
+			d->sg[i].src = ch->cfg.src_addr;
+			d->sg[i].dst = sg_dma_address(sgent);
+		}
+		d->sg[i].ctl |= PDMA_TXCNT(sg_dma_len(sgent) / width) | PDMA_TBINTDIS |
+				PDMA_TXTYPE | PDMA_OP_SCATTER;
+		d->sg[i].next = d->dma_addr + PDMA_CH_OFFSET(i + 1);
+	}
+
+	d->sg[sg_len - 1].ctl &= ~(PDMA_OP_MSK | PDMA_TBINTDIS);
+	d->sg[sg_len - 1].ctl |= PDMA_OP_BASIC;
+
+	return ma35d1_desc_prep_done(ch, d, false, tx_flags);
+}
+
+static struct dma_async_tx_descriptor *
+ma35d1_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t dma_addr, size_t buf_len,
+		       size_t period_len, enum dma_transfer_direction dir,
+		       unsigned long flags)
+{
+	int i, sg_len, width;
+	size_t offset = 0;
+	struct ma35d1_chan *ch = to_ma35d1_pdma_chan(chan);
+	struct ma35d1_desc *d;
+
+	width = ma35d1_slave_width(ch, dir);
+	if (width < 0)
+		return NULL;
+
+	if (!buf_len || !period_len || period_len / width > PDMA_MAX_CHAN_BEATS) {
+		dev_err(ch->dev, "Invalid buffer/period length\n");
+		return NULL;
+	}
+
+	if (buf_len % period_len) {
+		dev_err(ch->dev, "Buffer length not multiple of period length\n");
+		return NULL;
+	}
+
+	if (period_len % width) {
+		dev_err(ch->dev, "Period length must be a multiple of DMA width\n");
+		return NULL;
+	}
+
+	if (!IS_ALIGNED(dma_addr, width)) {
+		dev_err(ch->dev, "Buffer address not aligned to DMA width\n");
+		return NULL;
+	}
+
+	sg_len = buf_len / period_len;
+	d = ma35d1_desc_alloc(ch, sg_len);
+	if (!d)
+		return NULL;
+
+	/* Split the buffer into period size chunks. */
+	for (offset = 0, i = 0; offset < buf_len; offset += period_len, i++) {
+		if (dir == DMA_MEM_TO_DEV) {
+			d->sg[i].ctl = PDMA_WIDTH(width) | PDMA_TXCNT(period_len / width) |
+					PDMA_DAFIX;
+			d->sg[i].src = dma_addr + offset;
+			d->sg[i].dst = ch->cfg.dst_addr;
+		} else {
+			d->sg[i].ctl = PDMA_WIDTH(width) | PDMA_TXCNT(period_len / width) |
+					PDMA_SAFIX;
+			d->sg[i].src = ch->cfg.src_addr;
+			d->sg[i].dst = dma_addr + offset;
+		}
+		d->sg[i].ctl |= PDMA_TXTYPE | PDMA_OP_SCATTER;
+		d->sg[i].next = d->dma_addr + PDMA_CH_OFFSET(i + 1);
+	}
+	d->sg[sg_len - 1].next = d->dma_addr;
+
+	return ma35d1_desc_prep_done(ch, d, true, flags);
+}
+
+static struct dma_chan *ma35d1_of_xlate(struct of_phandle_args *dma_spec, struct of_dma *of)
+{
+	struct ma35d1_pdmadev *pdmadev = of->of_dma_data;
+	struct dma_chan *chan;
+	unsigned int chan_id, reqsel;
+
+	if (dma_spec->args_count != 2)
+		return NULL;
+
+	chan_id = dma_spec->args[0];
+	reqsel = dma_spec->args[1];
+	if (chan_id >= PDMA_MAX_CHANS || reqsel > GENMASK(7, 0))
+		return NULL;
+
+	chan = dma_get_slave_channel(&pdmadev->channels[chan_id].vc.chan);
+	if (chan)
+		pdmadev->channels[chan_id].request = reqsel;
+
+	return chan;
+}
+
+static void ma35d1_free_chan_resources(struct dma_chan *chan)
+{
+	struct ma35d1_chan *ch = to_ma35d1_pdma_chan(chan);
+
+	ma35d1_terminate_all(chan);
+	vchan_free_chan_resources(&ch->vc);
+	ch->request = 0;
+	memset(&ch->cfg, 0, sizeof(ch->cfg));
+}
+
+static void ma35d1_pdma_start(struct ma35d1_chan *ch)
+{
+	struct ma35d1_desc *d = ch->desc;
+
+	if (d->sg_len == 1 && !d->cyclic) {
+		writel(d->sg[0].src, ch->base + PDMA_CH_OFFSET(ch->id) + PDMA_DSCT_SA);
+		writel(d->sg[0].dst, ch->base + PDMA_CH_OFFSET(ch->id) + PDMA_DSCT_DA);
+		writel(d->sg[0].ctl, ch->base + PDMA_CH_OFFSET(ch->id) + PDMA_DSCT_CTL);
+	} else {
+		writel(d->dma_addr, ch->base + PDMA_CH_OFFSET(ch->id) + PDMA_DSCT_NEXT);
+		ma35d1_pdma_reg_clear(ch, PDMA_CH_OFFSET(ch->id) + PDMA_DSCT_CTL, PDMA_OP_MSK);
+		ma35d1_pdma_reg_set(ch, PDMA_CH_OFFSET(ch->id) + PDMA_DSCT_CTL, PDMA_OP_SCATTER);
+	}
+
+	/* Memory-to-memory has no peripheral request, so trigger it by software. */
+	if (ch->request == 0)
+		writel(BIT(ch->id), ch->base + PDMA_SWREQ);
+}
+
+static void ma35d1_pdma_start_desc(struct dma_chan *chan)
+{
+	struct ma35d1_chan *ch = to_ma35d1_pdma_chan(chan);
+	struct virt_dma_desc *vd;
+
+	vd = vchan_next_desc(&ch->vc);
+	if (!vd) {
+		ch->desc = NULL;
+		return;
+	}
+
+	list_del(&vd->node);
+	ch->desc = to_ma35d1_pdma_desc(vd);
+	ma35d1_pdma_setup_channel(ch);
+	ma35d1_pdma_start(ch);
+}
+
+static void ma35d1_issue_pending(struct dma_chan *chan)
+{
+	struct ma35d1_chan *ch = to_ma35d1_pdma_chan(chan);
+	unsigned long flags;
+
+	spin_lock_irqsave(&ch->vc.lock, flags);
+
+	if (vchan_issue_pending(&ch->vc) && !ch->desc)
+		ma35d1_pdma_start_desc(chan);
+
+	spin_unlock_irqrestore(&ch->vc.lock, flags);
+}
+
+static void ma35d1_pdma_complete(struct ma35d1_chan *ch)
+{
+	if (!ch->desc)
+		return;
+
+	vchan_cookie_complete(&ch->desc->vd);
+	ma35d1_pdma_start_desc(&ch->vc.chan);
+}
+
+static irqreturn_t ma35d1_pdma_interrupt(int irq, void *devid)
+{
+	struct ma35d1_pdmadev *pdmadev = devid;
+	unsigned long pending, done, abort;
+	struct ma35d1_chan *ch;
+	unsigned long flags;
+	int i;
+
+	done = readl(pdmadev->channels[0].base + PDMA_TDSTS);
+	abort = readl(pdmadev->channels[0].base + PDMA_ABTSTS);
+	pending = done | abort;
+	if (!pending)
+		return IRQ_NONE;
+
+	writel(done, pdmadev->channels[0].base + PDMA_TDSTS);
+	writel(abort, pdmadev->channels[0].base + PDMA_ABTSTS);
+
+	for_each_set_bit(i, &pending, PDMA_MAX_CHANS) {
+		ch = &pdmadev->channels[i];
+
+		spin_lock_irqsave(&ch->vc.lock, flags);
+
+		if (ch->desc) {
+			if (test_bit(i, &abort) && ch->desc->cyclic) {
+				vchan_terminate_vdesc(&ch->desc->vd);
+				ch->desc = NULL;
+			} else if (test_bit(i, &abort)) {
+				ch->desc->vd.tx_result.result = DMA_TRANS_ABORTED;
+				ma35d1_pdma_complete(ch);
+			} else if (ch->desc->cyclic) {
+				vchan_cyclic_callback(&ch->desc->vd);
+			} else {
+				ma35d1_pdma_complete(ch);
+			}
+		}
+
+		spin_unlock_irqrestore(&ch->vc.lock, flags);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void ma35d1_pdma_teardown(void *data)
+{
+	struct ma35d1_pdmadev *pdmadev = data;
+	void __iomem *base = pdmadev->channels[0].base;
+	int i;
+
+	writel(0, base + PDMA_CHCTL);
+	writel(0, base + PDMA_INTEN);
+
+	for (i = 0; i < PDMA_MAX_CHANS; i++)
+		tasklet_kill(&pdmadev->channels[i].vc.task);
+}
+
+static int ma35d1_pdma_probe(struct platform_device *pdev)
+{
+	int i, ret;
+	struct clk *pdma_clk;
+	struct reset_control *rst;
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	struct ma35d1_chan *ch;
+	struct ma35d1_pdmadev *pdmadev;
+	void __iomem *reg_base;
+
+	pdma_clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(pdma_clk))
+		return dev_err_probe(dev, PTR_ERR(pdma_clk), "Failed to get clk\n");
+
+	rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst), "Failed to get reset\n");
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (ret)
+		return ret;
+
+	pdmadev = devm_kzalloc(dev, sizeof(*pdmadev), GFP_KERNEL);
+	if (!pdmadev)
+		return -ENOMEM;
+
+	pdmadev->irq = platform_get_irq(pdev, 0);
+	if (pdmadev->irq < 0)
+		return pdmadev->irq;
+
+	reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg_base))
+		return dev_err_probe(dev, PTR_ERR(reg_base),
+				     "Failed to map pdma global registers\n");
+
+	dma_cap_zero(pdmadev->ddev.cap_mask);
+	dma_cap_set(DMA_SLAVE, pdmadev->ddev.cap_mask);
+	dma_cap_set(DMA_PRIVATE, pdmadev->ddev.cap_mask);
+	dma_cap_set(DMA_MEMCPY, pdmadev->ddev.cap_mask);
+	dma_cap_set(DMA_CYCLIC, pdmadev->ddev.cap_mask);
+
+	pdmadev->ddev.dev = dev;
+	pdmadev->ddev.copy_align = DMAENGINE_ALIGN_1_BYTE;
+	pdmadev->ddev.src_addr_widths = PDMA_SLAVE_BUSWIDTHS;
+	pdmadev->ddev.dst_addr_widths = PDMA_SLAVE_BUSWIDTHS;
+	pdmadev->ddev.directions = BIT(DMA_MEM_TO_DEV) | BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_MEM);
+	pdmadev->ddev.device_prep_dma_memcpy = ma35d1_prep_dma_memcpy;
+	pdmadev->ddev.device_prep_slave_sg = ma35d1_prep_slave_sg;
+	pdmadev->ddev.device_prep_dma_cyclic = ma35d1_prep_dma_cyclic;
+	pdmadev->ddev.device_free_chan_resources = ma35d1_free_chan_resources;
+	pdmadev->ddev.device_issue_pending = ma35d1_issue_pending;
+	pdmadev->ddev.device_tx_status = dma_cookie_status;
+	pdmadev->ddev.device_config = ma35d1_slave_config;
+	pdmadev->ddev.device_terminate_all = ma35d1_terminate_all;
+	pdmadev->ddev.device_synchronize = ma35d1_synchronize;
+
+	spin_lock_init(&pdmadev->lock);
+	INIT_LIST_HEAD(&pdmadev->ddev.channels);
+	for (i = 0; i < PDMA_MAX_CHANS; i++) {
+		ch = &pdmadev->channels[i];
+		ch->dev = dev;
+		ch->pdmadev = pdmadev;
+		ch->id = i;
+		ch->base = reg_base;
+		ch->vc.desc_free = ma35d1_pdma_desc_free;
+		vchan_init(&ch->vc, &pdmadev->ddev);
+	}
+
+	ret = devm_add_action_or_reset(dev, ma35d1_pdma_teardown, pdmadev);
+	if (ret)
+		return ret;
+
+	ret = dmaenginem_async_device_register(&pdmadev->ddev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register DMA device\n");
+
+	ret = devm_request_irq(dev, pdmadev->irq, ma35d1_pdma_interrupt, 0, pdev->name, pdmadev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
+
+	ret = devm_of_dma_controller_register(dev, node, ma35d1_of_xlate, pdmadev);
+	if (ret)
+		return dev_err_probe(dev, ret, "of_dma_controller_register failed\n");
+
+	return 0;
+}
+
+static const struct of_device_id ma35d1_pdma_match[] = {
+	{ .compatible = "nuvoton,ma35d1-pdma" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ma35d1_pdma_match);
+
+static struct platform_driver ma35d1_pdma_driver = {
+	.probe = ma35d1_pdma_probe,
+	.driver = {
+		.name = "ma35d1-pdma",
+		.of_match_table = ma35d1_pdma_match,
+	},
+};
+module_platform_driver(ma35d1_pdma_driver);
+
+MODULE_DESCRIPTION("PDMA controller driver for Nuvoton MA35D1");
+MODULE_AUTHOR("Shan-Chun Hung <shanchun1218@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

