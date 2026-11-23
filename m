Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445630;
	b=0Al5eZUmj0sz2locubmB3f2L4OfTELF6OIPVc/tquszDoLMvA9VTZuV9Mxq9fdsK5MEn
	 p6mkdkcu2EMUciqGKH0w10UwV7MVSTZPPqPMIoT98gkIoYX/v0Fe7aHsN8l7WkqhgSi+N
	 /2oizX4IOCJKHIb9EN6icFY9x8NXQETH2zxBuLyQ5IbXvLz2vxGKu+0p0UnrSunaugy8y
	 3R4nZg6pTLPUD4QYuVxw4ZXKimy69O4eFbcwdRKsLVzZXWGZu0R7HgTl0skGaQysX+NW0
	 iwCKmfXUJFycjia1JgEr3Saxxq2FZNIv4G4F4e54QnYYPL3lTWA481J52X449jDbs2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5yhgBCJg6Ol4mS/XuoylZsC4b2QM4BZ8ZLa608R7/9c=;
	b=40J8oVGCG9N4Togkl+DnDwoI8+fgb7jQYQXeIORHDrGXvs124NUNXNQ1xJ3NGNQqqe47
	 UZimhEJKMVrYeB36Oo9NEzqPBBk4F3T6OjPWDtOmHVlbXR+M7zcDixU+WSKHiGGotmiSI
	 nLJKMPbTC0tHLUnZSwC96T8FuYOe5auv4FrUbZtNOKB5rDGxtTwZ907tPoLAG+NXd91y8
	 hek2obsgoDCXX2M2SynCpyjlH8Cw6m2Fb+NPMRhq41spuJGh4nqBMEh+WJnJ2ya0vyCZJ
	 UlTG0whLcoNuyphNR6dtiOW3lWTY1HvghkHP3bie2T/Xkz+8I5tohGfzsgsPZfAkJ8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cyRv6t8i;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CDC60A3822
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3CDC60A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cyRv6t8i
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so23022995e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445628; x=1796050428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5yhgBCJg6Ol4mS/XuoylZsC4b2QM4BZ8ZLa608R7/9c=;
        b=cyRv6t8i0ryTCz6Z2Qp5DeJzLjUQqrzZBtXy1hmUHgfy2Lu8zzmCtm5AKQcVmZaFgy
         njdGxl78F+6wGg6uBPFTXVei1DMtDGgeDBjUgkEczAudxsGb09YWWuHBE3mhT3Rk+BGa
         0RRk3q1JxmhVmjG2BkgvA+vvaik+dZ8ujxmE7k6tksIdaA0tgawFDTBapIzyJJxKOd72
         1FZ6uc75s4X6wWSFFluhTrcRkO6xGtL2tVSYGguLGmm71Pz7Hmfw9HvBBAg5n3iDZJa8
         +iER3lkqpOnNe4uBfzFj9hLS+zNxRXomZzEnuE7DQFVQmoLX0dto74cacBUvmpYqAHMm
         0iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445628; x=1796050428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5yhgBCJg6Ol4mS/XuoylZsC4b2QM4BZ8ZLa608R7/9c=;
        b=ZJxqTboy+ZglJc1XjPN2Hrwt6AKF2E5p/oOheP/pK7FIJ+VrE0MuIPrUb3iLYmwgDV
         /Yo9eThXaggGl1YJJ7qb5YYLjvNyvrQku21Q6u+lAYvc3B9EE6eTkAVxvhwpEpPxtn/b
         InA148GV4QlXCRp8dokI8nWTWSgr5EqhomlXibc62qXTIe6dO5xuT+t/i9vlvgozDQ0S
         AZdrdp9mSduKUtQPcSlW0DLz84jgQWpnQZA2hhqde90Qmt2YLX9AB4Uc4p7XEk8diSU8
         f/9TeHLLjYm/6e08z326bSkKGpmcrIKT4eN4Ge8smrfPmB/3bse5s5V0MJLwCJIc4Cid
         vx1w==
X-Forwarded-Encrypted: i=1; AL+hErH0ihLXpCDsBSX1PtEEe+rENnoryh6VLyTozJORI1K51tAZtuoRYYugcKZUhInU5CMAapWnKnpqeHyx2NY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3EZKwqbnZJoV993UGiYqg5hjPevSjadjCZOyMSBp3g039xyLR
	XT7pCl08g5rnFcoles+sV2aAlJHMSnePZYaiab3SNi5Io46Jp/9LRrtCZgXEUwF6sJw=
X-Gm-Gg: AZFdTZcs1nIWefyMteb8JfJDDu1GW6ufFW2f7upxd392m7dUBnYFJnSAH+7Uku7B3mc
	D1bw4y0mVKmTiEm4olDiWTRvfzm5gopUS3ROxhJGDYHEwRmK+fXSAFjq6QCvJe4n37A7chmP97u
	hOvKkJluqERHBgiNukoBmY2AacVcsDGOlU6haDVgjr3iCGv4dMwO+YYiVMkeWuT3fpGJJeHaC0b
	EsIFas96+eBv32DN94KE35Sooxyfgx0FGsT1qGfSn7EpCDxShB4pXg9EufE+yIVSWd5Q20snGw5
	m174k0/B0HMnd2TRZEHzSUB5N5sNqAddLZAQ19apMFYNoeCfyjPJCpzQxvuUt2YDF36iimG91SZ
	nUwWXq0nuirM98J908qMBhAMkHkHFXlwM62GWCku4V663IG6Axux2StoT6PBcYo8ytexMSO5+Lp
	Vz7Vq0LRCOKUsnqfJWgv2T7dNqmbnmaNxpBvlPNHk7A8s+SbgUh8W765x+y3qJhxeWSo9ey5o8S
	2e8J9NFR/8fJKngMIvXVB6EpVUtHf45WX7prps4BnoYddL3iDNRGkJGmGRkvgLM4DzVlhKJpwkz
	FFDqB73DX32Ckg503u8eojaxYn0=
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr284054745e9.6.1795445628208;
        Mon, 23 Nov 2026 06:53:48 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm23613117f8f.31.2026.11.23.06.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:47 -0800 (PST)
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
Subject: [PATCH v3 11/28] dmaengine: bcm2835: drop info parameters
Date: Mon, 23 Nov 2026 15:56:49 +0100
Message-ID: <20261123145728.29082-12-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
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

The parameters info and finalextrainfo are platform specific. So drop
them by generating them within bcm2835_dma_create_cb_chain().

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 80 +++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 41 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 6180a2737e07..1d322cad4ca3 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -307,12 +307,11 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
 	bcm2835_dma_free_cb_chain(container_of(vd, struct bcm2835_desc, vd));
 }
 
-static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
+static bool bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
 					     struct bcm2835_dma_cb *control_block,
 					     size_t len,
 					     size_t period_len,
-					     size_t *total_len,
-					     u32 finalextrainfo)
+					     size_t *total_len)
 {
 	size_t max_len = bcm2835_dma_max_frame_length(chan);
 
@@ -321,7 +320,7 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
 
 	/* finished if we have no period_length */
 	if (!period_len)
-		return;
+		return false;
 
 	/*
 	 * period_len means: that we need to generate
@@ -335,7 +334,7 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
 	if (*total_len + control_block->length < period_len) {
 		/* update number of bytes in this period so far */
 		*total_len += control_block->length;
-		return;
+		return false;
 	}
 
 	/* calculate the length that remains to reach period_length */
@@ -344,8 +343,7 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
 	/* reset total_length for next period */
 	*total_len = 0;
 
-	/* add extrainfo bits in info */
-	control_block->info |= finalextrainfo;
+	return true;
 }
 
 /**
@@ -354,7 +352,6 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
  * @chan:           the @dma_chan for which we run this
  * @direction:      the direction in which we transfer
  * @cyclic:         it is a cyclic transfer
- * @info:           the default info bits to apply per controlblock
  * @frames:         number of controlblocks to allocate
  * @src:            the src address to assign
  * @dst:            the dst address to assign
@@ -362,25 +359,27 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
  * @period_len:     the period length when to apply @finalextrainfo
  *                  in addition to the last transfer
  *                  this will also break some control-blocks early
- * @finalextrainfo: additional bits in last controlblock
- *                  (or when period_len is reached in case of cyclic)
  * @gfp:            the GFP flag to use for allocation
+ * @flags:          the dmaengine prep flags (DMA_PREP_*) of the transfer
  */
 static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 					struct dma_chan *chan,
 					enum dma_transfer_direction direction,
-					bool cyclic, u32 info,
-					u32 finalextrainfo,
-					size_t frames, dma_addr_t src,
-					dma_addr_t dst, size_t buf_len,
-					size_t period_len, gfp_t gfp)
+					bool cyclic, size_t frames,
+					dma_addr_t src,	dma_addr_t dst,
+					size_t buf_len, size_t period_len,
+					gfp_t gfp, unsigned long flags)
 {
+	struct bcm2835_dmadev *od = to_bcm2835_dma_dev(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	size_t len = buf_len, total_len;
 	size_t frame;
 	struct bcm2835_desc *d;
 	struct bcm2835_cb_entry *cb_entry;
 	struct bcm2835_dma_cb *control_block;
+	u32 extrainfo = bcm2835_dma_prepare_cb_extra(c, direction, cyclic,
+						     false, flags);
+	bool zero_page = false;
 
 	if (!frames)
 		return NULL;
@@ -394,6 +393,14 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 	d->dir = direction;
 	d->cyclic = cyclic;
 
+	switch (direction) {
+	case DMA_MEM_TO_MEM:
+	case DMA_DEV_TO_MEM:
+		break;
+	default:
+		zero_page = src == od->zero_page;
+	}
+
 	/*
 	 * Iterate over all frames, create a control block
 	 * for each frame and link them together.
@@ -407,7 +414,8 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 
 		/* fill in the control block */
 		control_block = cb_entry->cb;
-		control_block->info = info;
+		control_block->info = bcm2835_dma_prepare_cb_info(c, direction,
+								  zero_page);
 		control_block->src = src;
 		control_block->dst = dst;
 		control_block->stride = 0;
@@ -415,10 +423,12 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 		/* set up length in control_block if requested */
 		if (buf_len) {
 			/* calculate length honoring period_length */
-			bcm2835_dma_create_cb_set_length(c, control_block,
-							 len, period_len,
-							 &total_len,
-							 cyclic ? finalextrainfo : 0);
+			if (bcm2835_dma_create_cb_set_length(c, control_block,
+							     len, period_len,
+							     &total_len)) {
+				/* add extrainfo bits in info */
+				control_block->info |= extrainfo;
+			}
 
 			/* calculate new remaining length */
 			len -= control_block->length;
@@ -439,7 +449,9 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 	}
 
 	/* the last frame requires extra flags */
-	d->cb_list[d->frames - 1].cb->info |= finalextrainfo;
+	extrainfo = bcm2835_dma_prepare_cb_extra(c, direction, cyclic, true,
+						 flags);
+	d->cb_list[d->frames - 1].cb->info |= extrainfo;
 
 	/* detect a size mismatch */
 	if (buf_len && d->size != buf_len)
@@ -703,9 +715,6 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
-	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
-	u32 extra = bcm2835_dma_prepare_cb_extra(c, DMA_MEM_TO_MEM, false,
-						 true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -717,9 +726,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	frames = bcm2835_dma_frames_for_length(len, max_len);
 
 	/* allocate the CB chain - this also fills in the pointers */
-	d = bcm2835_dma_create_cb_chain(chan, DMA_MEM_TO_MEM, false,
-					info, extra, frames,
-					src, dst, len, 0, GFP_KERNEL);
+	d = bcm2835_dma_create_cb_chain(chan, DMA_MEM_TO_MEM, false, frames,
+					src, dst, len, 0, GFP_KERNEL, 0);
 	if (!d)
 		return NULL;
 
@@ -735,8 +743,6 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
-	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, false, true, 0);
 	size_t frames;
 
 	if (!is_slave_direction(direction)) {
@@ -759,10 +765,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	frames = sg_nents_for_dma(sgl, sg_len, bcm2835_dma_max_frame_length(c));
 
 	/* allocate the CB chain */
-	d = bcm2835_dma_create_cb_chain(chan, direction, false,
-					info, extra,
-					frames, src, dst, 0, 0,
-					GFP_NOWAIT);
+	d = bcm2835_dma_create_cb_chain(chan, direction, false, frames, src,
+					dst, 0, 0, GFP_NOWAIT, 0);
 	if (!d)
 		return NULL;
 
@@ -778,13 +782,9 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	size_t period_len, enum dma_transfer_direction direction,
 	unsigned long flags)
 {
-	struct bcm2835_dmadev *od = to_bcm2835_dma_dev(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
-	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
-					       buf_addr == od->zero_page);
-	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, true, true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -835,10 +835,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	 * note that we need to use GFP_NOWAIT, as the ALSA i2s dmaengine
 	 * implementation calls prep_dma_cyclic with interrupts disabled.
 	 */
-	d = bcm2835_dma_create_cb_chain(chan, direction, true,
-					info, extra,
-					frames, src, dst, buf_len,
-					period_len, GFP_NOWAIT);
+	d = bcm2835_dma_create_cb_chain(chan, direction, true, frames, src, dst,
+					buf_len, period_len, GFP_NOWAIT, flags);
 	if (!d)
 		return NULL;
 
-- 
2.51.0

