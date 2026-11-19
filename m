Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104118;
	b=hx4nUdO8nn20G9xLa6aCU8Jjqm2wthzTP831jrToeFNk1ux5Sn+zVjkmibOGaqi0mJuZ
	 WbApmDtV2fZBk8esQfuumo8OtmbPj/TY5AlXFMVFaK/7iixWby68InmXwbt8ybMqGv6Yj
	 ASNufpZHBrVdD9z6XvJcEWnY3iUOnewJYq1vvbucYzFfnwJUkoU890U9Q25B79U/UXCPt
	 4nd9hKwulm3lpuA9YoY4GSSMN/GMR3SP9m66Zl0ZQc0TwoTgyF52DFDQn+lamt1bQvWRG
	 qCsB+UYm5/sClsqfnirp7qlE5QZilsCJSkH3dKCmXTPVLxssudeu0OY7DA3tN6r+Epw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=rfsGoBQIbogwRnnVczPLtH8aeHkW23Do7VnMP/YAMt8=;
	b=l4pvlLyXu3jADos6xuFI/r67gldHpilJlorpnKr9GUwXt4MUqQKQeu0n+UfeQStYQY0s
	 qGESR+HAXg8azud/qCdDiHb2QR73qkcRWOIJV/NQa/VsW0rCxJqQxjR+pp/OJ/VjH9Ej1
	 tZwwZAD4EMav3mtYWX+FKmbYTL+lTY4kBE6uz5nh4+/e4oIK6JcvWaKhyoSUV+7KPpF4D
	 VCdfEtPJy98RmiPHvjh3m/a0SkhAbR1uaMFQ0bYvePmWi5ZJdplM4+63jktJ1CgkC3nJX
	 2m+lD6QFDdkbuDwZyGQi0/OoDrgstdXqimTqDA121mBNDEC7mwtuE8rqOTAAJKBxrqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AHShgd2o;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C1A60A381C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C1A60A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AHShgd2o
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4d6981c67so15190777b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104117; x=1795708917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rfsGoBQIbogwRnnVczPLtH8aeHkW23Do7VnMP/YAMt8=;
        b=AHShgd2oeLMqBrr0sc7ZEvNlAG+K7PWEG/bWzutCIHJdFaft1/dhI00nz1BnT9hp20
         z0tyWXjkaFuAVyKiQUpDHHelnpuqv5JxSipGT/vot72LGj5vtYreb8zbqQT2YTZdPcWc
         nTblMcTjObC+P3KsLoIulu/JU0WzP6qWf16yhDrD1IXZ+Ljq4KGVYSuXCjCTG/3y78lv
         +AISzGfv8sDx0eqSq5TVPhojVGjKhCa9a3fD2LuccNF88MLydstQ/09Ar+ddpYG/zm7t
         teU0gYaJ6kflW3gW2q31Xjjb1+UsTjYFK+Tnl56O2Mp8j/+kpM39G7o2h8+dfsN6wrk3
         deug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104117; x=1795708917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rfsGoBQIbogwRnnVczPLtH8aeHkW23Do7VnMP/YAMt8=;
        b=g7b5k/HNbTUd/W7d5kayqOZrUfcIKSOv0zK4r4ZBuR+2953ofb5C/V4WNl2HgcGmeL
         9WfEDTJw9B5/XU4JWsqk9ymaDnu07/ik01N7MuS7Dvgd7BdZ/dOfb58y+piQYwcGiTqn
         ZBoAr6xAvpJlH+VGFX/mIbaOIjbtFuUVEfcoDMlUlYAti2R9fuI8aISfLJaeLiLfaHE/
         aZ219rB9a8YTkYrqD7DTO3ny92RJeZ4aOeR5nMHb7creyDLRTOngm1/X5AMzG6SXGi5t
         iyi8g+AWvgIQfsbG7hqSX4oU9VGGXs8X6Vj72iXcxnzLHcKIjYMu/4HaYILNj82aMhqd
         c7gw==
X-Forwarded-Encrypted: i=1; AL+hErEco39Q4lbqwZ2KMx64QttZGkbSNXoNgNw8vH3w30pzAHql1R8H9hwgFL/qMmcZZCFTICtoD6WQGwzF7xM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cjnXMW7bGgLrj+XxTiuUnGzgQ/zByybprT2x3UKSJoKYhTomu
	LYDrSjNn30YEJ0z+rCleq4n89wHMBi8SBkt+EW6Z9F5GakIWnBSHn8/1
X-Gm-Gg: AZFdTZcJNZvaMHxzk0JOf+8X9T/Hta2ZHpayE3KbNarS6MNm5cVLmquzr3zXmStMsvW
	+JT4OFoIIoeeGZxdcGtCPE1IjD4rXXIuwDD7yEvevpXyZN8+66pc1yrLpzAIQBye54MN9Rxpwto
	nv4DeXil9hC4tkxpxseJ7hPAT4uC4t5d/RztDrt1B8LhotAvnMUL0d/UqeVVjaxw4kgUzH7qB9K
	cAo9abpAV/psia55l/oWNeJv+CM8htOLbBvg0D079qM0J+uR68O8v51B3uGpmpgAaQfZGYkRAXN
	9/7TiQUpu16AmHFY8y3oJ4dXebwRPsOT73bAUmUMY+LeIko9K4sduA5hIJ5NGE41EQUMl4uMk5X
	R++UvgsI4OOw7c1XlcyAknmKVfvQbKYPdGb/ryOsfgrYU44Qg+olFuEI3yZ4lwt8SbSgzxXAJeh
	ckLAl4PyHGAYCz6RGcrcr7oysnHCpUa/WSYPT48jjKXqL3DhKQ4FF/dQ2q7esC3+s5iYv4yo8f7
	Mv+TdRff0B58BmY/4mD4y4hUonxAXwK8I57ymol2tXVllg3T6NP347vgEqvcPqOEeRmnUUjxGuK
	sASOAlKU/L8J9vssuBMckjVbmN26M1p8LS2Szd8klwPddNseIKZV7Vwpg37ZcEb7O2CBtLxKdIE
	W27lsJBpIZkyeSqO1T4pmOG1jK/ZXzsYU0EzwxBWNJria1ySsW9bqAIA2/GoP3qR7KXqGtvNvBp
	KAtoauwhdWtydzqHff/CxWqv4JOJItIgVkvdgzKglLexWyy6dmpNUJbc5H6qyvE/B3VmxYIRGh
X-Received: by 2002:a05:690c:6513:b0:8b1:88ad:1fce with SMTP id 00721157ae682-8b5204cfb03mr879257b3.42.1795104116589;
        Thu, 19 Nov 2026 08:01:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm623267b3.34.2026.11.19.08.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:01:02 -0700
Subject: [PATCH v8 7/9] dmaengine: dw-axi-dmac: serialize interrupt status
 with channel reuse
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
Message-Id: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-7-f8e7fe60594c@gmail.com>
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
In-Reply-To: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev

The interrupt handler reads and acknowledges channel status before taking
the channel lock. Termination can finish and a new transfer can start
before the handler takes that lock. The saved completion or error status
then applies to the new descriptor, stopping it and completing its cookie
before its DMA transfer has finished.

Termination also leaves completion and error status pending. A subsequent
interrupt can consume that status after the channel has been reused, even
if no handler was running when the old transfer was stopped.

Read and acknowledge status under the channel lock and keep it held while
processing the event. Move locking out of the completion and error helpers
into their sole caller, and clear all channel status after a successful
stop. Status collection, descriptor ownership and channel reuse then share
the same serialization.

Initialize the virtual channels before requesting the shared IRQs so every
lock is ready before the interrupt handler can run.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 31 ++++++++++++--------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 2547f9596ae6..2eeb902eaad3 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -21,6 +21,7 @@
 #include <linux/iopoll.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/kernel.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_dma.h>
@@ -1072,9 +1073,8 @@ static void axi_chan_list_dump_lli(struct axi_dma_chan *chan,
 static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 {
 	struct virt_dma_desc *vd;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
+	lockdep_assert_held(&chan->vc.lock);
 
 	axi_chan_disable(chan);
 
@@ -1083,7 +1083,7 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 	if (!vd) {
 		dev_err(vchan_chan_dev(&chan->vc), "BUG: %s, IRQ with no descriptors\n",
 			axi_chan_name(chan));
-		goto out;
+		return;
 	}
 	/* Remove the completed descriptor from issued list */
 	list_del(&vd->node);
@@ -1100,9 +1100,6 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 	chan->desc = NULL;
 	chan->cyclic_restart = false;
 	axi_chan_start_first_queued(chan);
-
-out:
-	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
 static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
@@ -1111,11 +1108,11 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 	struct axi_dma_hw_desc *hw_desc;
 	struct axi_dma_desc *desc;
 	struct virt_dma_desc *vd;
-	unsigned long flags;
 	u64 llp;
 	int i;
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
+	lockdep_assert_held(&chan->vc.lock);
+
 	if (unlikely(axi_chan_is_hw_enable(chan))) {
 		dev_err(vchan_chan_dev(&chan->vc), "BUG: %s caught DWAXIDMAC_IRQ_DMA_TRF, but channel not idle!\n",
 			axi_chan_name(chan));
@@ -1127,7 +1124,7 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 	if (!vd) {
 		dev_err(vchan_chan_dev(&chan->vc), "BUG: %s, IRQ with no descriptors\n",
 			axi_chan_name(chan));
-		goto out;
+		return;
 	}
 
 	desc = vd_to_axi_desc(vd);
@@ -1159,9 +1156,6 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 		chan->desc = NULL;
 		axi_chan_start_first_queued(chan);
 	}
-
-out:
-	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
 static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
@@ -1169,6 +1163,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	struct axi_dma_chip *chip = dev_id;
 	struct dw_axi_dma *dw = chip->dw;
 	struct axi_dma_chan *chan;
+	unsigned long flags;
 
 	u32 status, i;
 
@@ -1178,6 +1173,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	/* Poll, clear and process every channel interrupt status */
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
 		chan = &dw->chan[i];
+		spin_lock_irqsave(&chan->vc.lock, flags);
 		status = axi_chan_irq_read(chan);
 		/* Leave suspension status for the pause and resume paths. */
 		status &= ~DWAXIDMAC_IRQ_SUSPENDED;
@@ -1190,6 +1186,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 			axi_chan_handle_err(chan, status);
 		else if (status & DWAXIDMAC_IRQ_DMA_TRF)
 			axi_chan_block_xfer_complete(chan);
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
 	}
 
 	/* Re-enable interrupts */
@@ -1220,7 +1217,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 
 		vchan_terminate_all(&chan->vc);
 
-		axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+		axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_ALL);
 		chan->desc = NULL;
 		chan->pause_requested = false;
 		chan->is_paused = false;
@@ -1600,10 +1597,6 @@ static int dw_probe(struct platform_device *pdev)
 	if (!dw->chan)
 		return -ENOMEM;
 
-	ret = axi_req_irqs(pdev, chip);
-	if (ret)
-		return ret;
-
 	INIT_LIST_HEAD(&dw->dma.channels);
 	for (i = 0; i < hdata->nr_channels; i++) {
 		struct axi_dma_chan *chan = &dw->chan[i];
@@ -1617,6 +1610,10 @@ static int dw_probe(struct platform_device *pdev)
 		vchan_init(&chan->vc, &dw->dma);
 	}
 
+	ret = axi_req_irqs(pdev, chip);
+	if (ret)
+		return ret;
+
 	/* Set capabilities */
 	dma_cap_set(DMA_MEMCPY, dw->dma.cap_mask);
 	dma_cap_set(DMA_SLAVE, dw->dma.cap_mask);

-- 
2.53.0

