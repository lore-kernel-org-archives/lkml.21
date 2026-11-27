Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781930;
	b=g4KDcov3XBXl2/uGXt88znxR11UoZFkH6GpXgiNJp9I0HlEXI74MCci1QhVLLRRGymuj
	 KmJLyYbkvHysaCEc18AOAfH4/5blW5ZkLeklqrqVPaTw1zYbHIE8SGTI0e/fjk0JahcB4
	 3/4adhJfADGZQ/PAmvxLlfuqLd7iOOagv0Iv3xJEm41ovjxXK/JALOYJmCyGacT6cSAIz
	 QlYdG9I+Y5Ou5YwsROi50ACbxJKBtpSxZ8leFuD/HWHbK3vbRY35ChSaUrOk+8OYNmm4/
	 W1dka26ASkkW+g/NTigeWNX6JZrz8NYAyintTyKymdl1G4+HOVlv3TRLd2zYVWRDsXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vskOlk6iNdjLrDbrz+V+LdGLIEjB8hQEQkTipBa/9eo=;
	b=zPiOVbrSDDckSQzCQ/2EsFKtdnXMXq8FUvPcdI5159UbW5ShgttQV6S4JeurKnZmsFTU
	 BcR5F542YvYIWuPLrtM3qPBaAAdB2MHLKAK1/ryFxPnrh+CX74GJ6sA3cAZF+yhxMKJx+
	 etjMONL1d7R8Hg14QbIQXgTrH4W1fJMmePJSLRDuUPyo75Zoa18LcV9fl+Oyqlf3AXhke
	 7WE/jhsYbzgYfZX87X4D/bAhwdqunOfiv8N5sgyrDYX++d1OLiiZnwJDrBAH7kiP5i5MF
	 4IC0jl+sk33OaUPyyrR8g+7jkN+Zrz8FFTimp2S3C3WETi36WYuHaBB63Dhr1Alx/Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fYf09Nic;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4287606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4287606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fYf09Nic
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso3649665f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781928; x=1796386728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vskOlk6iNdjLrDbrz+V+LdGLIEjB8hQEQkTipBa/9eo=;
        b=fYf09NicfVWgyxF3gWBZIQJ2eF5Nns6NRnHBxU3wviTGwC76zLKdGRuVoY0JA5iDJa
         f+Dqk2xJm2x2Uq4yfYcql2NdrZvn/cTKhJUBBb07krT3zQVSmINGk4pBzbskjeVx/WsW
         vwfj/SmZD4q7RJ10wta50QwifmpDq3ir0UfBsyaXHgTdzW2fAGVlzOoJVz9z/ycMOqKs
         Iv1xC5NEsc3i0eolDIHF5nNs/MOciz3ouL7alROMNSeTPWTyhajZa4gWsHU3rILivl1G
         tNOuWHADcduH5V4QbSoIdES4e2EtnmYF0NPvL7jbJmZNwd/86cU+Xc4z4uP7AALYN9kk
         3ifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781928; x=1796386728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vskOlk6iNdjLrDbrz+V+LdGLIEjB8hQEQkTipBa/9eo=;
        b=bpf+T8CM5HDGLMAkjmqE4TU1h4qGgAAbw+VIW88bpNBkn74hw2lD9OpbeQXXe6NSQi
         xue6k+VTbRVHmCCjj3VFOopJkXjaxepmHe6IP2t+gF36X7DM/sl6O3PThqBEnEUi2sCw
         IBmV3nNz6gPGs0D9b42x9rPxI7xcBqRGQ2vbMroR7bre39vkZFLFWWURL35hz3iAoAlS
         3zHncOyF2DASiPsEpcToGPhMBr1caOVcfMY/DjKaQLyuuCMf8XXIKLS8wOeM5Ix/BEFp
         OuywkEwUWNTPr/X8Ei+CoqZ0kZohy4O+wH1G9CMOaGbzViizzQ6X7kdAp9FV3/Nv7l17
         WrBQ==
X-Forwarded-Encrypted: i=1; AL+hErGOuf407g2AqL4Ucz8BTdCxTKClaJGG4/KII8JU496ohZxljJNheGVbs3eA/vE9BfJgeq2QUINRe+ATuFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BLgDiiBuunNM4fuZ98KAht4jdQyTNxXK0j4HE4qkBMMG5AdJG
	u1AFi6UJ4xzSM9lwBeZ7FElcG/oMD9jja2ZJZSjHeaGO9BGJERGlXS7Wy/JgSOwb/QY=
X-Gm-Gg: AZFdTZeQlPIFO5O/y0lTOjE1vWfejIcdZDGqV3jmYqKyNjaMDLWBsB76e94NshFn1uP
	eTAC+KSQOPODWfLjkTm336xy3lXAS5q9ph8DVUzLIxgMRZbQm43zQ/IOiBRu5TG4J8QxPGLo89o
	alxkSfA/CSmOGHfAKCmSmHqFzNe4Np8HrUspUJmVU0aPjYPW45+ZmtRvyk9dOww2ReRGqfw48bQ
	LnEj9AAqBql43ljKi761SEMrGORainjGTlpl2M1kVL43OsVqSV0nUXMMFgPsnN6211C1nHfSxyk
	GhR+0GtcPDtUwxYA40Fc1V0CJd/+TMkA9DJRY8HX/qdAJNRl5BhijUUhwlqP//W0v0J2cwP8hx8
	vqF9AyF/OhDidLBOWJZRVWyAJ/2otELDUYNON8kcg1HhH+YFEyi+ls6jdqhO3C0cgG0RnJ51Qjt
	osxWYSEHSzRyZRVExh3ZFlIICIvDGtgKFzmGaxYKr5eSF1Dsu6DHejkJofEhdPsiDL7/VOrTUVw
	Ze+/vBLqFsz55nK07VtP307Cb87NPv4Gyvvvf9fWt1YHV8jsmBm82MWiPXr0PZRpTDCZP2/6awc
	BDSqTD5SYlfje29iXwUieoYHkmZ/
X-Received: by 2002:a05:6000:310a:b0:491:286f:8e63 with SMTP id ffacd0b85a97d-4abaf7401fdmr52410705f8f.14.1795781928055;
        Fri, 27 Nov 2026 04:18:48 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm44157829f8f.34.2026.11.27.04.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:47 -0800 (PST)
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
Subject: [PATCH v4 05/28] dmaengine: bcm2835: Support dma flags for multi-beat burst
Date: Fri, 27 Nov 2026 13:21:55 +0100
Message-ID: <20261127122236.4976-6-andrea.porta@suse.com>
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

From: Dom Cobley <popcornmix@gmail.com>

Use bit 30 of the dreq value to enable multi-beat bursts on a channel.
This improves DMA performance and is required for HDMI audio.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 7bd1fbb2c36d..d65a93be5fa1 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -165,6 +165,8 @@ struct bcm2835_desc {
 			BCM2835_DMA_S_WIDTH : 0)
 #define WIDE_DEST(x) (((x) & BCM2835_DMA_FLAG_WIDE_DEST) ? \
 		      BCM2835_DMA_D_WIDTH : 0)
+#define BURST_LENGTH(x) (((x) & BCM2835_DMA_FLAG_BURST) ? \
+			 BCM2835_DMA_BURST_LENGTH(3) : 0)
 
 /* debug register bits */
 #define BCM2835_DMA_DEBUG_LAST_NOT_SET_ERR	BIT(0)
@@ -630,7 +632,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC |
-		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
+		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
+		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
@@ -661,8 +664,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = WAIT_RESP(c->dreq) |
-		   WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
+	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
+		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t frames;
 
@@ -714,7 +717,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
-	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
+	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
+		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
 	u32 extra = 0;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
-- 
2.51.0

