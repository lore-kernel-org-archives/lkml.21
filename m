Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960483;
	b=PzVRX0hZrT0mojSope6cacfAaVwYNeT0xa5nWILERCU0OyN/wcIwheetHGf6P3vrzril
	 BkCDocvvSZSarx2/A5M1383w7g5HISHQtzw8WKZfXQCGnbOB9Wgy3rVOITPljblnXgNup
	 tpzTxUZDwn0oExJUcSQRYhMFWFgOcmGgiVL+O9xXCWrLtK20fKNl0022wbKSrms+MO/yq
	 exaxWlw3gvUY3Vl3RwRly3yiwIWBn/zGncEooze88ki7mngvzAm1NpIwmcXMMzl1doq0T
	 DEBH6hoKAk6CKAp1YZsG2aiQv3t/SnzujkhS6FNwHKgWKQ2js/q0e60ovWE37MeV2jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fVtERnt1yagTDveFZiJK9CUhtwDO+IK5KagdoU7rqog=;
	b=IZWurOfXBViVy4TCEAEWk2ZbEtH1rtV9hbziSHFRtKY9PCrDthgspHvp4IXI1+VQSmj9
	 hpPtusJIuwAhOZLr2LH2uK0wFYAMX8CNF7axzeToEkBt4nfU1JLoOX14OJcBG+lvzTPpQ
	 e5k5I4jer96V80SH5eWrtc4bmLM8pxj0eYDMigr0zlp7Iu/dT6+sseT7MtKOJIufaF2on
	 ogsvrE/Exs1/HmMFPQNpMQKgx9wVEa1jiQl5LfD8jBGa5VnNrEoH8qxMconTuCBXJ2guc
	 ZR3E5eLjO6rebwH5NCgq1Y68gN9L0D4IFDCTRM2+sCIJsSBsA+pRVrqW57UIR0vqJtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Twnn6oHg;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF27606A885
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FF27606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Twnn6oHg
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4adea5b7a2fso157417fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794960482; x=1795565282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVtERnt1yagTDveFZiJK9CUhtwDO+IK5KagdoU7rqog=;
        b=Twnn6oHgLVr/9lhxumEC2LkQUw+5sp0zsbcRYQJsTybDl4RE7N+asuBKqbuBxXnRV8
         L3bMr1IO/JLbr3UVYAokFpl8l/wHDdPmERgtHFDFCofpniTBag9H5XK7mhmDuIqraX1N
         CtSKhKFVeJbc0iOorbYDWWLifQnxA0Lmk4v/90lZRGo48aoiM2WMmrAO+a19VxoD7f8e
         8sB994kABifSAZHmYawOOPu0UjYpMEVeSCbHTXb9Vjo9ehq123mZ2vryL+WI4llw6GJG
         tYMHNHTOckhsUDTV51s0JS7w9vW1A8yfdFJJbss6Fcrs4ZdZvbySxTJX9aUOWgmNjkIf
         6HrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960482; x=1795565282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVtERnt1yagTDveFZiJK9CUhtwDO+IK5KagdoU7rqog=;
        b=RA7jfLpUrANd8IGNTL1hUZQjrAm53AXvrBroMjTr9m6Mu95NgJSDzZyj1WTZ9U8RqN
         ZU0kbz1CQ53yONNkpiyLtYdRrAR6okxIG9FD2cDVPRQnsuxInVOzrYFg6sThfu2jHNGH
         NEHz9BWoH7UhZDhfdbUkivKKe9Lb3y6Hlbqrb4T+mu7AayK5FDGDcj0zzEwGL3x/on78
         DpGNcLcWTULO6h0TkbL1ENn9SLga7TQ1SNNWjrnOthQU+vq7B3XegM2d9WgLyXXj4o3B
         dBGCpxXyKXDwfmBu/qfsLbE795sZiJYJJXFmJEpeYWhCeJgMRJ15+VEToYmaybFIA3b4
         g+iw==
X-Forwarded-Encrypted: i=1; AL+hErFvHVVCx7IwBDFOn/Z9fXZ2E5pI2pXaLJBp4qil5QdIYnjfJ2qlzf+zQHvpzt5kAfu8VFhyfy/fH6zSZrk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8txwY/gBO0vHVIKQQnkn3+jVuzh1Nb6GIZbgZ9QX2SYvOBjl80
	/4gm9Szle0SFNBjSikbMGCGDxZwPFQ4tnt5qStZuLveGrCSsJwNYyxqs
X-Gm-Gg: AYBFou3ZE6m5o4bPm/KLGgOHYsqIjLhSQDo/OX1ORPECIgSXoeNpNfxH1eQ/HBjbhwu
	gKsbDB/T1S7WQJhG5xTr0T7LKXE2sAV3pP1yi1+KUOrkRbGjdG4iodP2JesRsIcAXD/h+K4SGnR
	Dx6zw3sxInK3qhNhaZ9/0XAzB9Jdv1tfXVDV3oIVjp2SJqEsBWsDI+BgG6+80LClAnxE+W/kGF0
	3qLyXIF3kryAHiQM8Fvy5ivqftU7LXkE72xIBBqMc7/f3l6F9KDe1+r7UXvL3aPQMce+eNhUNA1
	VGUETGqehlGSnACIsHd53h1AY1dcvBTgBBoGjsPnnp36v7oLvWuEc+b8t4pC6WSZ/ycsG6LV244
	Mv1rvo3m66vVyOaAjf7b/V0+rv35DIDVN05ELjWCT/dOO54zs2o9ugpIL0Jj7NB5lfm+MBTxp1C
	uwJcFWW17x5dWb5R2zz1uN8G/18AJFwsI/6TeNi6KLJFd+1EcrItmMoQPmFX3bIXd8OxlBQ9rkS
	lY5ICyvPwAKtyaBHFVpOEsqW1WPD++BzCDQgJRfcckDcSfMx2ouEfFRRtLqy4naGnFTH6xwPirf
	Ih0tFDAHxodkzsVptcvHOkFq4E+Aiy14N62X6HgkhqF9Wqqh0yvOm5fzjVFNwD2CjQbCCAbyFRf
	Y7Y694MDM39xwrvdgG1S+wuOlOcxoUFkpdQoUuZ/PikuTNNz/8ud6LcV1HnfhnI5ROqtGRTKe3z
	YL7qEjeVSPaD+i9NE3Gry9ILlRpgMnBAkkXsjLFkqpw01J//LIxes=
X-Received: by 2002:a05:6808:3a19:b0:571:d998:332a with SMTP id 5614622812f47-5773e848cfemr1518599b6e.47.1794960482162;
        Tue, 17 Nov 2026 16:08:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777b393d40sm434954b6e.17.2026.11.17.16.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:08:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 17:07:46 -0700
Subject: [PATCH v7 7/8] dmaengine: dw-axi-dmac: serialize interrupt status
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
Message-Id: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-7-d5f2309afd72@gmail.com>
References: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
In-Reply-To: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
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
index 97098367535f..0116c44d3bef 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -20,6 +20,7 @@
 #include <linux/iopoll.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/kernel.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_dma.h>
@@ -1071,9 +1072,8 @@ static void axi_chan_list_dump_lli(struct axi_dma_chan *chan,
 static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 {
 	struct virt_dma_desc *vd;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
+	lockdep_assert_held(&chan->vc.lock);
 
 	axi_chan_disable(chan);
 
@@ -1082,7 +1082,7 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 	if (!vd) {
 		dev_err(vchan_chan_dev(&chan->vc), "BUG: %s, IRQ with no descriptors\n",
 			axi_chan_name(chan));
-		goto out;
+		return;
 	}
 	/* Remove the completed descriptor from issued list */
 	list_del(&vd->node);
@@ -1099,9 +1099,6 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 	chan->desc = NULL;
 	chan->cyclic_restart = false;
 	axi_chan_start_first_queued(chan);
-
-out:
-	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
 static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
@@ -1110,11 +1107,11 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
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
@@ -1126,7 +1123,7 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 	if (!vd) {
 		dev_err(vchan_chan_dev(&chan->vc), "BUG: %s, IRQ with no descriptors\n",
 			axi_chan_name(chan));
-		goto out;
+		return;
 	}
 
 	desc = vd_to_axi_desc(vd);
@@ -1158,9 +1155,6 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 		chan->desc = NULL;
 		axi_chan_start_first_queued(chan);
 	}
-
-out:
-	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
 static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
@@ -1168,6 +1162,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	struct axi_dma_chip *chip = dev_id;
 	struct dw_axi_dma *dw = chip->dw;
 	struct axi_dma_chan *chan;
+	unsigned long flags;
 
 	u32 status, i;
 
@@ -1177,6 +1172,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	/* Poll, clear and process every channel interrupt status */
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
 		chan = &dw->chan[i];
+		spin_lock_irqsave(&chan->vc.lock, flags);
 		status = axi_chan_irq_read(chan);
 		/* Leave suspension status for the pause and resume paths. */
 		status &= ~DWAXIDMAC_IRQ_SUSPENDED;
@@ -1189,6 +1185,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 			axi_chan_handle_err(chan, status);
 		else if (status & DWAXIDMAC_IRQ_DMA_TRF)
 			axi_chan_block_xfer_complete(chan);
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
 	}
 
 	/* Re-enable interrupts */
@@ -1225,7 +1222,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 
 	vchan_terminate_all(&chan->vc);
 
-	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_ALL);
 	chan->desc = NULL;
 	chan->pause_requested = false;
 	chan->is_paused = false;
@@ -1599,10 +1596,6 @@ static int dw_probe(struct platform_device *pdev)
 	if (!dw->chan)
 		return -ENOMEM;
 
-	ret = axi_req_irqs(pdev, chip);
-	if (ret)
-		return ret;
-
 	INIT_LIST_HEAD(&dw->dma.channels);
 	for (i = 0; i < hdata->nr_channels; i++) {
 		struct axi_dma_chan *chan = &dw->chan[i];
@@ -1616,6 +1609,10 @@ static int dw_probe(struct platform_device *pdev)
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

