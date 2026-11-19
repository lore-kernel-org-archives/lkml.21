Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082549;
	b=0NhPK1DNMquZtEjSQv4dS7FMS/vUl3zgVG9qzR6n9ETd/gGUFibOuBXUZEzwN/8nOTHB
	 DYJnNx+4JHRHPJQoJRHR5IA/yeMz9Q+HAOiz/+cmBiQdlEZUb9Q6C5xrmlmu5r/FAra+z
	 CC7MXQLF3Co8ji3SSXwqY43P/yePSVMKLjsZEcnUTgXsz/2Km4uwKZBo+ZZoptfrR8VDz
	 w4RoLe7HjO7lYP2q6vtje1JIWVGWTYdrASE7lsQWaPohVC2LwY+IqIT0r3Oz2J8/7Wmgk
	 LbHg7IhDo917v5YhmOo1FMS4//WT532hq3NvWgrzT1iBY+SweB++/NFguk1/1YpBkSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/oL/d63e2xaO/P/OLh85rsbWKHpvbqFNY1ZyDh443Xs=;
	b=c9EYo4164s6Ud5af4/m76P2AgOfLkfRiXLDgJA93oLBGo2lm9rrLoBBRWnqKhwCK6rTE
	 zWHqmEABDH00HyCsSpLEG+dJJ+1OyN3FWp8/zdUWoi0PEojyyCEQmM7pe6u5mgAvEk6PP
	 rZkm50bpBQDLhBkY8xwDxDm0/LnK/X9YZmwoUOvdoD2omB7A6R9C84QQxot/q5CFEPs+d
	 /XdxUcRd8UeZLYUQI6uYKSDU1p31qYxcYJkW/yh18rB/Egy9DKM14ZMr2R7QvkiVz1Kxc
	 U4L1szedSFPXJFgIKWDd/58EdnK/HPCQD/a2WU1vkDidvIvf6EBkFHN7dFocPC4SmFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VriFb/Io";
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B95A606A337
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B95A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VriFb/Io
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6d68de53053so1441185eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082548; x=1795687348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/oL/d63e2xaO/P/OLh85rsbWKHpvbqFNY1ZyDh443Xs=;
        b=VriFb/IomSMBKuss1NsRbwU1chZvjnuX9Ca7VX/RdWqqw1ULA7Fq2reX1LFXnkmx5C
         cw1bhkGPr8zB3cGPUQGh+xktyd8LYWZ02lHLHLWpihBPZ2nkJU27xAlWAfWHFJvNJ6xP
         svV1nIO3CQxoWaA10MULknSp5aHtzyCAdFMJutinY5/QBJAndCv3OecE7sE9NLB+hPxq
         fOnVJ04Vwh1mYdia92I8LWmdpwPH1PmqYhP4iESEIlFVqgHd3pLmkyYGUsZBpadc5Hbd
         Xd5wFtEhnScMRaNr8MIShJ96owOPI6bLblQlp9RSJnqiYQtVLQXpslJgw15oRQmvM7Sq
         OkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082548; x=1795687348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/oL/d63e2xaO/P/OLh85rsbWKHpvbqFNY1ZyDh443Xs=;
        b=DjI+jeP/ShEwkAMr1MDxkYiCSHtdhIv3fMBtumHpFWu2Xx/SHXAxhbnCTP0tLzgbZB
         RlZITn6E/MFm16gGHAXYUAUxUNOdJJ0eI5+wTquLZ8mh7RzE+bMs0XpO+d6d6WQ8u/iG
         uA3x4ovZkAoRftB41H6KRjzSBMeE07MDq4wC8K294vo2C2u+zSP44T62/KfVctDkFPqd
         j1VnuGeDZEZY5r21VVaKQeBTYbZoYE79eZ0e0Sch9JLRXpLFoO4MDpRbvxet5WHrvt15
         gaOcEk42RtkPbpUmG+zYLmVuRa5zEC1MPuZWhozpZORm4siZaxU+L3AODr/Fq5+1wSth
         nmUQ==
X-Forwarded-Encrypted: i=1; AL+hErGA+9MhDnFOQ8cTamWCGEMvrCQeiAri6FWAnbZdr3rS5if+LRbfGAcwzW0Eofukx/hLP69OYCXUCpPQdOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cRxWy3xAzlP9BpthSuZ7vuUy6KGhmSfhLIfJcCJw1i9DkjseF
	d2i8ksqg07DoZEQ/nQNgmk8T+sZWatYzqAwfnR6FJn/C9VQwgjpmJbrs
X-Gm-Gg: AYBFou28XMLlhjijFnOU7gVSvjPectkU/nfwJDzn/OVzyF+mx536FpG3a2bJbAUZz3N
	rhRT5y6csgWizqLsVDe6tRtkpQe4febWIoI4H4CR7SauuEMWEjsKXxbzyE+Ck5KI2wdTASOCPSQ
	IvPeM4b+WWOZlsvty8I+3u0tHy/idheOI603iKx196PiKnmNv8w2Dx5GbZDenX0CAeqDxgeEmFV
	wyU6aY06n8KyMTvQyKpEg+SrjzBydPtUPmKNzwxyvIyd4P4yO7dsIwQJtp3E1furhP1bXWa92Kw
	gyiJT3TSqWsPlnd8KYsv5eMQP+bMgB8X0vd+iR9u6pe7xUOHpBHrlcv0b3bWi9M6agi7orQ1Xej
	c+BdkwVLrnix9Es2SjF8KEVn24aJON/db6gQ9ZTPVbrJyzZuau8YtLM1B+CobTgwGGGh0vizmrz
	yd/LgXTogvXXpKxYBQwh5+DttYtha51kU4b9y1xDxaDqAkoAXnIgAbbGt0f4qyAQusAWCPPYArS
	P2nIhAs6oqIGLug8lj0f9wL8jF4jx6zQZC2+pKeueRSm5q3c7eG/3sUiD4arTJHVl+51+jacSoe
	LiERCbd32LKVYHtpth53Rp1v/x9SMoMFYoRPM+zXe7+f6UeaGkm6gwdZ0fDHdzd034+cOZRx0He
	ERF6s9gOe3nH8PyQ1yfA2IwQZ1rG6ottM08dTgwZ5pvuQrZGPPZulbs7e7Tww78igJC5vRjTYRz
	VBw9CWhITtU0aYrKgkKu1ZA25702zAh9BQtyoHePcV5XZu6CvDbfoeWfjtjaRm6LbPjrvqIQI7H
	w==
X-Received: by 2002:a05:6820:1ca8:b0:716:bf0d:7010 with SMTP id 006d021491bc7-71b297992demr2068946eaf.2.1795082547849;
        Thu, 19 Nov 2026 02:02:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b18fbb9a8sm3906194eaf.0.2026.11.19.02.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:02:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 03:01:35 -0700
Subject: [PATCH v10 1/7] dmaengine: dw: Fix XFER bit set, but channel not
 idle error
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
Message-Id: <20261119-submit-dw-dma-synchronize-v1-v10-1-3a737597a0d1@gmail.com>
References: <20261119-submit-dw-dma-synchronize-v1-v10-0-3a737597a0d1@gmail.com>
In-Reply-To: <20261119-submit-dw-dma-synchronize-v1-v10-0-3a737597a0d1@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.17-dev

From: Serge Semin <fancer.lancer@gmail.com>

If a client driver gets to use the DW DMAC engine device tougher
than usual, with occasional DMA-transfers termination and restart, then
the next error can be randomly spotted in the system log:

> dma dma0chan0: BUG: XFER bit set, but channel not idle!

For instance that happens in case of the 8250 UART port driver handling
the looped back high-speed traffic (in my case > 1.5Mbaud) by means of the
DMA-engine interface.

The error happens due to the two-staged nature of the DW DMAC IRQs
handling procedure and due to the critical section break in the meantime.
In particular in case if the DMA-transfer is terminated and restarted:
1. after the IRQ-handler submitted the tasklet but before the tasklet
   started handling the DMA-descriptors in dwc_scan_descriptors();
2. after the XFER completion flag was detected in the
   dwc_scan_descriptors() method, but before the dwc_complete_all() method
   is called
the error denoted above is printed due to the overlap of the last transfer
completion and the new transfer execution stages.

Clear the channel interrupt status when stopping it, and keep the XFER
check, descriptor detachment and queued-transfer restart in one locked
section. An empty active list needs no completion processing.

When the locked XFER recheck finds no event, only update residue. A stale
tasklet snapshot may belong to a terminated transfer, and a zero residue
only means the source has been read, not that destination writes have
finished. Requiring RAW.XFER also prevents the fallback scan from freeing
a descriptor still linked on active_list.

Fixes: 69cea5a00d31 ("dmaengine/dw_dmac: Replace spin_lock* with irqsave variants and enable submission from callback")
Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
[james: require a locked XFER event and handle an empty active list]
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 70 ++++++++++++++++++++-------------------------------
 1 file changed, 27 insertions(+), 43 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 575b7bb6af9a..2a9db9e39f5f 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -136,6 +136,12 @@ static inline void dwc_chan_disable(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	channel_clear_bit(dw, CH_EN, dwc->mask);
 	while (dma_readl(dw, CH_EN) & dwc->mask)
 		cpu_relax();
+
+	dma_writel(dw, CLEAR.XFER, dwc->mask);
+	dma_writel(dw, CLEAR.BLOCK, dwc->mask);
+	dma_writel(dw, CLEAR.SRC_TRAN, dwc->mask);
+	dma_writel(dw, CLEAR.DST_TRAN, dwc->mask);
+	dma_writel(dw, CLEAR.ERROR, dwc->mask);
 }
 
 /*----------------------------------------------------------------------*/
@@ -252,34 +258,6 @@ dwc_descriptor_complete(struct dw_dma_chan *dwc, struct dw_desc *desc,
 	dmaengine_desc_callback_invoke(&cb, NULL);
 }
 
-static void dwc_complete_all(struct dw_dma *dw, struct dw_dma_chan *dwc)
-{
-	struct dw_desc *desc, *_desc;
-	LIST_HEAD(list);
-	unsigned long flags;
-
-	spin_lock_irqsave(&dwc->lock, flags);
-	if (dma_readl(dw, CH_EN) & dwc->mask) {
-		dev_err(dmaengine_chan_dev(&dwc->chan),
-			"BUG: XFER bit set, but channel not idle!\n");
-
-		/* Try to continue after resetting the channel... */
-		dwc_chan_disable(dw, dwc);
-	}
-
-	/*
-	 * Submit queued descriptors ASAP, i.e. before we go through
-	 * the completed ones.
-	 */
-	list_splice_init(&dwc->active_list, &list);
-	dwc_dostart_first_queued(dwc);
-
-	spin_unlock_irqrestore(&dwc->lock, flags);
-
-	list_for_each_entry_safe(desc, _desc, &list, desc_node)
-		dwc_descriptor_complete(dwc, desc, true);
-}
-
 /* Returns how many bytes were already received from source */
 static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 {
@@ -297,6 +275,7 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	struct dw_desc *child;
 	u32 status_xfer;
 	unsigned long flags;
+	LIST_HEAD(list);
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	llp = channel_readl(dwc, LLP);
@@ -305,6 +284,10 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	if (status_xfer & dwc->mask) {
 		/* Everything we've submitted is done */
 		dma_writel(dw, CLEAR.XFER, dwc->mask);
+		if (list_empty(&dwc->active_list)) {
+			spin_unlock_irqrestore(&dwc->lock, flags);
+			return;
+		}
 
 		if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags)) {
 			struct list_head *head, *active = dwc->tx_node_active;
@@ -336,9 +319,23 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 			clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
 		}
 
+		if (dma_readl(dw, CH_EN) & dwc->mask) {
+			dev_err(dmaengine_chan_dev(&dwc->chan),
+				"BUG: XFER bit set, but channel not idle!\n");
+
+			/* Try to continue after resetting the channel... */
+			dwc_chan_disable(dw, dwc);
+		}
+
+		/* Detach the completed transfer before starting queued work. */
+		list_splice_init(&dwc->active_list, &list);
+		dwc_dostart_first_queued(dwc);
 		spin_unlock_irqrestore(&dwc->lock, flags);
 
-		dwc_complete_all(dw, dwc);
+		list_for_each_entry_safe(desc, _desc, &list, desc_node) {
+			list_del_init(&desc->desc_node);
+			dwc_descriptor_complete(dwc, desc, true);
+		}
 		return;
 	}
 
@@ -384,22 +381,9 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 			desc->residue -= child->len;
 		}
 
-		/*
-		 * No descriptors so far seem to be in progress, i.e.
-		 * this one must be done.
-		 */
-		spin_unlock_irqrestore(&dwc->lock, flags);
-		dwc_descriptor_complete(dwc, desc, true);
-		spin_lock_irqsave(&dwc->lock, flags);
 	}
 
-	dev_err(dmaengine_chan_dev(&dwc->chan),
-		"BUG: All descriptors done, but channel not idle!\n");
-
-	/* Try to continue after resetting the channel... */
-	dwc_chan_disable(dw, dwc);
-
-	dwc_dostart_first_queued(dwc);
+	/* Residue describes source reads; only RAW.XFER completes a transfer. */
 	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 

-- 
2.53.0

