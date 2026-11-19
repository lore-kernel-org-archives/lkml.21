Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111390;
	b=4Hr6fWLIoSTFTu2Xt1zUaFc6cFL5Lp3dHEITR4coPHBYFQDZprERp5MfpXHqcP3VyXZ0
	 S7vtfU/HxQyS7mcqtTHJqencj6bqW2GBNeRCm9gfSvPOHPT96TNZdbArqgDTdI+38ODbt
	 PnWdNmUlTK1r0bOKIQfgyCoLnuDuU7nMO7lRtw/LfnX8Me1iUiWFIpcNijtY0eGXDdSIZ
	 KlAEFyCGsI3NSqSElX4mONEGPQlNZqx6Ef9DSyhM7RlsraNtq1DEY5tTSY3u3tI1yGjYK
	 k4I5wkKGnNF2P9pEZ4yVO5bzduHgCzupAY4BGIJkEy/jTCUTRlbROjZ7o+Dp9FkBUhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
	b=x4xuE+irBlD9+o31SKtDjvo+r+GFhTru84SRGLwkB9nqiji4R3DVpV3z3J+HhKsFQsNK
	 IdxVQt3rTFrGmYirDxLgmfpZlF4sCuMaqj8KN5Pen2GHWwLQgwqmOWzv7EXI4d967+TD5
	 sA6OLv/inTcji0YC4MsCorqF+Ep6fhvInC0G3ANl+H2rYqKmP+TPyvvgIc/jHMpzLCqFX
	 9n6pdMkun0Z9VAqv5gztAIgOdJy0k/juTpxSHBPL7iKeCm6/Ofu3UEiLwooxTqLmNm4vV
	 oV4hvon1xZfQe7O0cCsNE8F9v9eOU16T0ZJYjpnwXfiZx4pLWK9VzTJuz45LMrdgFOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzRNPf51;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7D7606A333
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C7D7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzRNPf51
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-703be215729so4518eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111389; x=1795716189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
        b=fzRNPf515yOTUM7GQIR5y2GWzmgvJd98uCwhAzFHCQTfZTRxWKOVI4uFLxPDCUhzEO
         csealtC7PMGowcKCUW93tRfedWxQgYp0whXXWN07WjKOkCsNBKBoC9SUxr7Uqauc0fBc
         vs+W3JwusJ9foX4WIaSISR9/VxtfnkH0SCtWAdJRA6O4n1zmpOgZr9GyPejh4wu2afe9
         A/Rt5IVQhu01UB029MLMxs7MYDOoX+0WrrCDRCiBa3AUeYDeKcUwLYZ96Izby7V4VEQp
         Nx1lCAs8XSmvA72RHn6FGZnQ4hJ8gD3XHta0u64LX6dM7w9SNh7I0iP7JbNTbaOMUHiY
         Gwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111389; x=1795716189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
        b=H5B0Nal+kojWulYei0NJ09ZIbcBJ5wsVNn9GR/BLkh/STK5S1M6foum6H5YPQUO9Ga
         CxIY/qiUCMHOQj5dxN4oRwHM0/BdwJiyArp90byIlygNtVEdRUetaOn8oLpuMUIZl+Ut
         vpZRoDuhW4LRnlg/oGsTkriyKqlnXAin+5La0lzkJJydREcvHLNDYfWOtZctddFkWc5W
         maDXbjCGJz9UlitzL54bpGG8xsHUjWUCxYJuQc+oBKpmWeJMBrgqQeDnXgNBTQQPGXUM
         cRRXRCMolZXdKNCswfMPuXgYZa2Yb6nfFNlugiuUFEwl/vK92n3/4XVFC2O9SKH7a2uC
         jung==
X-Forwarded-Encrypted: i=1; AL+hErFidMYbyCECWSb5JMEybK7Bz7CGkEXqMrdSBhtLnH9vIaftKtI6lv0BhQArXtjpzmaGd6BSNgj3gRr2U7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MHWj794qbhGsxMBiAj1GvKHqQxnAWXC8gdrXa6jzNz6zNc+IT
	IdoIEfI9h0venHH4Uus8umhjHlBOQqoDh6VFfJAWqd3nNI5RgFpWKomd
X-Gm-Gg: AYBFou2F4TfB5PXzv9PBMcWxNi+ioHxc62jpmFhv1IaP5EF0EgkKQO7YhBvnVNbbi5X
	9pnEy8IjwzOl4ziOYlm1QR+OR4CxIn5oQPMHhZW15u7YTNZM1irZuJYNjE1ma6KbcGz7sIIPSqa
	odAiLqC6yCQFgyTcV37jhwDSwb94XJtTCb7p3KbuhsLgUQWhkKBeFoTdTiuh2kO7gpYoERMt4GT
	dW/1F1VL/wCqaIaD5tvMRgomfW/iHvAp+boc7pHGeI2weB1wJIGC5UD4lE0wi8XmIrWmdRf8VNx
	s82kCVRy9+Ln8p9bktAhRrviBLCkEv3I+PAWzXphEypP80vt7q9ZGFH4SpNp/iATO513e3D9Tot
	jpo2aRroNt+kMcGnL2MCOhMcnXhCkLNFgeiiS1vjJrWHZyiumAdJExux2XDROJ7tGlv0Gke+gJT
	SU2+rSKT5U0hO0hLVBUepx0WeM9xKRMWDjgWljdf29UD9XfI6UVCXG9DaO1oYiI2y1//lrve+uw
	86WIksbaLt7vwenBogX1HOAB1X46wBVWWR/QfRaxtk0V/PkWumGur6p+4EBEZrIAUgjok/B17As
	x+mV9TNF3KiHF/7rIl+dUUxnTlWpT64ho+o/vIiHRAjekRXLhwJjlScCGpmwX3G0Bopbzwglr2o
	awoF0XFJEtgN2K9r9Twiweg0qJfRBM3K+bUHDJWi96fNg5burp90JAmzQaUokg/ijmRhGDS1uzT
	6Z7oyWgfbvN/UyY9sy1j3NRBWaxXjvRntViJ2vKQySi3Db3n8OjMkv
X-Received: by 2002:a05:6820:614:b0:71a:f794:49c6 with SMTP id 006d021491bc7-71b39566d0cmr341259eaf.69.1795111388904;
        Thu, 19 Nov 2026 10:03:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b3806ef20sm448478eaf.7.2026.11.19.10.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:03:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 11:02:22 -0700
Subject: [PATCH v3 2/3] dmaengine: sun4i: retain cyclic descriptors until
 callbacks drain
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
Message-Id: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-2-3935aef58db9@gmail.com>
References: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
In-Reply-To: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

A cyclic IRQ queues a virt-dma tasklet with a pointer to the active
descriptor. sun4i_dma_terminate_all() frees it without clearing the queued
cyclic callback or waiting for one which has already started. The tasklet
can subsequently access the freed descriptor. There is no
device_synchronize callback to let clients drain these callbacks before
releasing their own resources either.

Serialize both half-transfer and end-transfer IRQ handling with termination
under the virtual-channel lock. Recheck the physical-channel association
after acquiring that lock so an IRQ which looked up the channel before
termination cannot use its detached transfer state.

Use vchan_terminate_all() to retire descriptors until synchronization. This
clears any pending cyclic callback. Retain them until a new synchronize
callback has waited for the IRQ handler and drained the tasklet. Drain
callbacks before freeing channel resources as well. Termination itself
remains usable from atomic context and from a completion callback.

The shared helper retains all collected descriptors. An in-flight
non-cyclic callback still owns its descriptor on the tasklet's private
list and retires it when the callback returns.

Fixes: b096c1377d1e ("dmaengine: sun4i: Add support for the DMA engine on sun[457]i SoCs")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun4i-dma.c | 41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index 225e4a53502b..b0c91dab62f0 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -293,10 +293,20 @@ static int convert_buswidth(enum dma_slave_buswidth addr_width)
 	return (addr_width >> 1);
 }
 
+static void sun4i_dma_synchronize(struct dma_chan *chan)
+{
+	struct sun4i_dma_dev *priv = to_sun4i_dma_dev(chan->device);
+	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
+
+	synchronize_irq(priv->irq);
+	vchan_synchronize(&vchan->vc);
+}
+
 static void sun4i_dma_free_chan_resources(struct dma_chan *chan)
 {
 	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
 
+	sun4i_dma_synchronize(chan);
 	vchan_free_chan_resources(&vchan->vc);
 }
 
@@ -322,7 +332,7 @@ static struct sun4i_dma_pchan *find_and_use_pchan(struct sun4i_dma_dev *priv,
 	spin_lock_irqsave(&priv->lock, flags);
 	for_each_clear_bit_from(i, priv->pchans_used, max) {
 		pchan = &pchans[i];
-		pchan->vchan = vchan;
+		WRITE_ONCE(pchan->vchan, vchan);
 		set_bit(i, priv->pchans_used);
 		break;
 	}
@@ -339,7 +349,7 @@ static void release_pchan(struct sun4i_dma_dev *priv,
 
 	spin_lock_irqsave(&priv->lock, flags);
 
-	pchan->vchan = NULL;
+	WRITE_ONCE(pchan->vchan, NULL);
 	clear_bit(nr, priv->pchans_used);
 
 	spin_unlock_irqrestore(&priv->lock, flags);
@@ -970,13 +980,11 @@ static int sun4i_dma_terminate_all(struct dma_chan *chan)
 {
 	struct sun4i_dma_dev *priv = to_sun4i_dma_dev(chan->device);
 	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
-	struct sun4i_dma_pchan *pchan = vchan->pchan;
-	LIST_HEAD(head);
+	struct sun4i_dma_pchan *pchan;
 	unsigned long flags;
 
 	spin_lock_irqsave(&vchan->vc.lock, flags);
-	vchan_get_all_descriptors(&vchan->vc, &head);
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	pchan = vchan->pchan;
 
 	/*
 	 * Clearing the configuration register will halt the pchan. Interrupts
@@ -991,13 +999,14 @@ static int sun4i_dma_terminate_all(struct dma_chan *chan)
 		release_pchan(priv, pchan);
 	}
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
 	/* Clear these so the vchan is usable again */
 	vchan->processing = NULL;
 	vchan->pchan = NULL;
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	vchan->contract = NULL;
 
-	vchan_dma_desc_free_list(&vchan->vc, &head);
+	/* A tasklet may already be using the active cyclic descriptor. */
+	vchan_terminate_all(&vchan->vc);
+	spin_unlock_irqrestore(&vchan->vc.lock, flags);
 
 	return 0;
 }
@@ -1128,9 +1137,15 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 
 	for_each_set_bit(bit, &pendirq, 32) {
 		pchan = &pchans[bit >> 1];
-		vchan = pchan->vchan;
+		vchan = READ_ONCE(pchan->vchan);
 		if (!vchan) /* a terminated channel may still interrupt */
 			continue;
+
+		spin_lock(&vchan->vc.lock);
+		if (vchan->pchan != pchan || !vchan->processing) {
+			spin_unlock(&vchan->vc.lock);
+			continue;
+		}
 		contract = vchan->contract;
 
 		/*
@@ -1138,8 +1153,6 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 		 * interrupt (odd bit)
 		 */
 		if (bit & 1) {
-			spin_lock(&vchan->vc.lock);
-
 			/*
 			 * Move the promise into the completed list now that
 			 * we're done with it
@@ -1173,8 +1186,6 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 				disableirqs |= BIT(bit);
 				release_pchan(priv, pchan);
 			}
-
-			spin_unlock(&vchan->vc.lock);
 		} else {
 			/* Half done interrupt */
 			if (contract->is_cyclic)
@@ -1182,6 +1193,7 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 			else
 				disableirqs |= BIT(bit);
 		}
+		spin_unlock(&vchan->vc.lock);
 	}
 
 	/* Disable the IRQs for events we handled */
@@ -1276,6 +1288,7 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 	priv->slave.device_prep_dma_cyclic	= sun4i_dma_prep_dma_cyclic;
 	priv->slave.device_config		= sun4i_dma_config;
 	priv->slave.device_terminate_all	= sun4i_dma_terminate_all;
+	priv->slave.device_synchronize	= sun4i_dma_synchronize;
 	priv->slave.copy_align			= 2;
 	priv->slave.src_addr_widths		= BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 						  BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |

-- 
2.53.0

