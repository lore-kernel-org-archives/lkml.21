Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781927;
	b=zimwj4MPAoVzxyOMzvHJXZlljKiIwkHbfzjGRRhA+jJV4xo5dTMsrdeWtQaEn0UwEWiI
	 v2Z3G14JvBmKGY5WKghGDseOxyGkdcjMs6HnKiCzUHxbw1pMOsTnbBDw3Rgn/RQQ83Aik
	 20qchSSaantFJ1dXF1LtCuA0ffaBa1/yPqRM3kIM5wcBwIxubn2uUx9RbdoJ3z7+J0VGR
	 cooyuUOZH7CT2c1UeB0rejYfkKJT6ns6uXjshJevpZSuAMjKQ5c9wc9KfFt0fUIbvWdUa
	 Y/3LqriLCkj8YkiwXjHELziH7eaALuQn6gTdMpsUvW4+KBs2TK5EPC078LCZjof+gDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CKw4sWprE2Ul+TtVWYzdYET0k07qC46nb2OuMsfTntI=;
	b=qcgL3rY68tY8nDpTTx6QuYJwunUcjfZgyROLlVJsO48HwCbsRhwInKmh6XJzSoskZpKq
	 Vr+MHxlIbYAGwvLgXYcLgxfY1JUBVfxb54cH3z2McBYpY80zNak445s49LFd0HCu3vJ2z
	 is+bEcE7m6zk+M7kTW5TudlvROmf3xUQafyewR5RAMDVopHPYxT03mkK4E0xtkRC8kuFr
	 Kqf5mEY7nyq0BZsgCyCUR1Wpul6R58PAva4RdkbYnM1QaefQcaKR/KJ4x8t4eleDH8DAE
	 VyIFPvRX55bZGWtJD4DQM5ZHNgMsmA7KnRH5dw6tQFcS1SwiyMrITK7xZCQlN9uy68w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gm4YxnjT;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA8606A681
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDBA8606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gm4YxnjT
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4aa5833c263so7728492f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781925; x=1796386725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKw4sWprE2Ul+TtVWYzdYET0k07qC46nb2OuMsfTntI=;
        b=gm4YxnjTJo8cvnBF12yR3Ois9lkRxPejDTQhHNxMexm4Ty5zn+7vU5a1wL+3t2B4F9
         aTlXtTNE0AQtCp5S4gHpgS278hDDMIQDtTP2F08ro2/sSw56agYQTISfcjWeZKj3Wsjx
         azeVmSwOu51jzBSRC+5ynKGHwQ1DMU0fC2R95BTKF58SN+vjLmlXvjEYFLvUp+xL4+ON
         gW28DPEOx+RcOP1a/qJYmeR6pacpYSIxy+abEhVBKxpSwZOZz4oAOcfjKTLi17pGESIF
         ZzFvKqIRRuMI1zNrOfu64ZBaKksP2eMBbQ4nTF7Vo1nZAIxXJQwxBNzlz1ZcRLnhK9+B
         +SwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781925; x=1796386725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CKw4sWprE2Ul+TtVWYzdYET0k07qC46nb2OuMsfTntI=;
        b=l10puK8fmRC17QE38cTiIq4KDA50eL8AhrMo/oue+Zn4stre5qG8HSmmbqVf1+HGhD
         EhW/ZTSvIijxxauH6WXLN3oqA7xb0tQB99yR7Uqh6PI2vqvcu9mplV0gWXu6x5qoWgRR
         Is0fO/Zbj1A+Mt5UBuldXw66635MjvaDQnzEQSbGJX1WJQhSp42X/9JeohpPH6zu182p
         7/gktE+8Pn1Ffe/p4TL/2l1DCjqw8oEjEZhKYjRBniCDo87vfJgfBGLXkcRqmAogOKW5
         NCGZ1l0UTbol9PCHVp0NalwK6bAepxAKKIpUZQkGhyGVk8JWsD4YGy6yyHmeOF8DFVAc
         Hxdw==
X-Forwarded-Encrypted: i=1; AL+hErG/TjVFGi2kLQ5r4mFPpZ406+UPCnC/P7QNNT4YhFmcSBfkv0+vY2ZSWcW6KxTmVQQThPAvYhATVu7CGts=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UP/yGEc8LJxdfnDIL/fbQvHDWqywHyGMYFNpq7ELhHMvw66hN
	35HahWHrCiDyUEXZBLeqn4ecqBW0cVWwGVWY5VmUdabmB166fw3MbL4k4VN5Ucex08I=
X-Gm-Gg: AZFdTZe5I3BTlSD/Q5dQv29BSFWGZtpbYhNoIoCgrlRR0Cnw8eiHe0OiLJ/D2hbtFL+
	WZqkMoMHIsUVB3LjhinnUBk7WkATxeNP/CtPWw/ss+X0qfPElpfr2rNmjyUO63l9ELZW2oOi6bp
	EKG/NPpt6SHg9O0INTN2r//LGtahgnHk1hRzQrPnkVZciMWWVlzxu4cvakBZktZVIi24uYGFBFl
	ZGGyjWbvX0TTv8iQffIX75v6bmEl+1aH4QJNgqCyMY6Vd4WEF6fl4lvyL+ihZaUMMedeZZjY0SS
	y4pCidfSiwoXo2IgV5/AL5oTEoE0kz90LkFZQRAg4yR7neRNIw7ixbD82OZSOIiD/TwLbR+e+mJ
	Ah+GODJTPkf96uwdlLbe6FRO0K2lXywNZPr0U0Kv8yCtvIJ0IO4G5duN8J7X0tUwGsou6WBC9An
	RWyGuNDkNZL3jroyj7EwwOELzXH4iUbc4EoXR2VoIqgQKnYAgp4MZKSdem99RJltPIoi/daeoZB
	USMuQWv3XCMeWtWk5wu8p+WXbvPdNKxYpuXuyYQg6yDpK0Fb0E7QtIZitLnw4Y4pnumPZ7CLc/f
	zWQSa8YJz03xgkdzW7kOLeBcsgFl
X-Received: by 2002:a05:600c:1911:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4bb8880cf84mr498430495e9.16.1795781925146;
        Fri, 27 Nov 2026 04:18:45 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm673667305e9.5.2026.11.27.04.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:44 -0800 (PST)
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
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v4 03/28] dmaengine: bcm2835: Add support for per-channel flags
Date: Fri, 27 Nov 2026 13:21:53 +0100
Message-ID: <20261127122236.4976-4-andrea.porta@suse.com>
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

From: Phil Elwell <phil@raspberrypi.org>

Add the ability to interpret the high bits of the dreq specifier as
flags to be included in the DMA_CS register: the AXI priority and panic
priority (used e.g. by the HDMI audio channels to keep the MAI FIFO fed),
the wait for outstanding writes before signalling completion and the
DISDEBUG flag. The original motivation for this change was the ability
to set the DISDEBUG flag for SD card transfers to avoid corruption when
using the VPU debugger.

The flags occupy the same bits as the corresponding fields of the CS
register, so they only need to be masked.

Since the flags now affect every transfer issued on the channel, clear
the dreq when the channel is released, so that a later user requesting
the channel by capability (e.g. for memcpy) does not inherit the flags
of the previous DT client.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 036a7a1727a5..5a9854a3c08e 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -33,6 +33,8 @@
 #include <linux/of.h>
 #include <linux/of_dma.h>
 
+#include <dt-bindings/dma/brcm,bcm2835-dma.h>
+
 #include "virt-dma.h"
 
 #define BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED 14
@@ -143,6 +145,15 @@ struct bcm2835_desc {
 #define BCM2835_DMA_WAIT(x)	FIELD_PREP(GENMASK(25, 21), x) /* add DMA-wait cycles */
 #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
 
+/*
+ * Flags of the DMA specifier to be set in the CS register, they have the
+ * same layout as the corresponding CS register fields.
+ */
+#define BCM2835_DMA_CS_FLAGS(x) ((x) & (BCM2835_DMA_FLAG_PRIORITY(15) | \
+				      BCM2835_DMA_FLAG_PANIC_PRIORITY(15) | \
+				      BCM2835_DMA_FLAG_WAIT_FOR_WRITES | \
+				      BCM2835_DMA_FLAG_DIS_DEBUG))
+
 /* debug register bits */
 #define BCM2835_DMA_DEBUG_LAST_NOT_SET_ERR	BIT(0)
 #define BCM2835_DMA_DEBUG_FIFO_ERR		BIT(1)
@@ -435,7 +446,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 	c->desc = to_bcm2835_dma_desc(&vd->tx);
 
 	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
-	writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
+	writel(BCM2835_DMA_ACTIVE | BCM2835_DMA_CS_FLAGS(c->dreq),
+	       c->chan_base + BCM2835_DMA_CS);
 }
 
 static irqreturn_t bcm2835_dma_callback(int irq, void *data)
@@ -462,7 +474,8 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 	 * if this IRQ handler is threaded.) If the channel is finished, it
 	 * will remain idle despite the ACTIVE flag being set.
 	 */
-	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE,
+	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE |
+	       BCM2835_DMA_CS_FLAGS(c->dreq),
 	       c->chan_base + BCM2835_DMA_CS);
 
 	d = c->desc;
@@ -512,6 +525,9 @@ static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
 	free_irq(c->irq_number, c);
 	dma_pool_destroy(c->cb_pool);
 
+	/* do not leak the flags of a DT client to the next user */
+	c->dreq = 0;
+
 	dev_dbg(c->vc.chan.device->dev, "Freeing DMA channel %u\n", c->ch);
 }
 
-- 
2.51.0

