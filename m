Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445627;
	b=VYZmmLpslx+xcZAew93e+z+ZzxHT34pS1Iiy+yBUq/z9IMZXCElosmZ/iwZ41N4fl0fZ
	 bcAFK9nVkbs2FNkfC4PRpcekt5YkGlLPxS6lKQCdJIeXnRyRWbqVQ/t/m2kXxa4rOeqwJ
	 W63lsZeGM85DzPw/88OBDbeRHGkfTfOzvxTRrR/nxF/ktrBzI2v2dgYnos6HoWTTLFlXh
	 3gzpuJpu54gKDQ4fw+z50WfE1keu5zQa2p0Bl//FcVgOZ96HWclgdacTp8Buo5tsJPh0X
	 yoAFGAzkrGzM+qLPAtiN57lseH1EjiQz6SAnNwZcBoUIXclxDAIDCGfnqIp30ywvl/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AI8HWgrEJm2ajFDDgXXsC9dIqWcTrg87ImDVMUpFPTg=;
	b=anOuhJCXVTBJVkIXoLvJl7BIgY7eUbnMS+eUK/AAhBSG2VBYi38fN/RcyZ/w0zMq53vj
	 LLCBTxfCHnlppZtSWRX5b5+Q5iJkeUXZy/3/HunJYmMXbeCrz3rK/y1KCf3VTWzrll0NZ
	 T5y1ysVfr3Hj0Zsh+3zRrq7gSwzQxFaGlmZZE4Bgz6D5XYOVGUsX+ZJWR4oLvVGreQAND
	 ZmFbI0hLWeYM90BxMK00CVlmvbjJKzID1lY0EXzoIio7UH4lUrH2h0qrCdY52jch2Y7T2
	 N7KcGetvNS3cUkfKmBVwd1jl3Gr+tsogoGT4yHajJlGukX+Nn6NYh7mggkPORu+bS8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bwxI8bLH;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A18A60A3801
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A18A60A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bwxI8bLH
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4aa5833c263so3229064f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445626; x=1796050426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AI8HWgrEJm2ajFDDgXXsC9dIqWcTrg87ImDVMUpFPTg=;
        b=bwxI8bLHOXzCkukkySsdy+BztufD7qqK6tEHG8JJzXYchAYVfWByKO8ouhWKyAETIL
         kG3eNeoL42N8Q+Td7tGYU3LjbMT/uXuqs/QpbNar/ZYAFFPGBwrR1XfCK5clzwD8zCHW
         I1uUP1YrObVUM/AAyySDahq5Y127aNypfaPY8zWYON3jhQ8ZL1r0QDIqKMM1fiLyAfey
         bIlzUjpzaBf3siCaa7kDA8TX7dXruTs59WbQvYUlSE6yFs6ND0Flwc6sR6KGMrlwjMAD
         yFzBttc+Iz4UXKUl/6AM/nKr+a5tk+/5gbjlt/TsYUeNbS9jbe07s0Kxl4cAl3vLtlzw
         rlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445626; x=1796050426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AI8HWgrEJm2ajFDDgXXsC9dIqWcTrg87ImDVMUpFPTg=;
        b=dqb4OOzVMq5naOUaEjbdoDod2cm9vJWZQ3JbOZxqxt+qs8B3xPBj4pKkagr+ToK0dO
         a8LRl51fcPuJQBR6qjI75SNO/IxysAYM4+szl2rmHQAZDshQMz1KhHO8Rrrisgp2VsPG
         DHtPw1MkRjF4+9awBN+QckqEzHKC5nuWco0QAK4JJhvtEtPu6i3ZhvHLSW2DTIr4eUPM
         TZ5nmvkyYRa6JDD8Ow5DtmOvjk+ty0f/mLsYvZRUd79WFILm08G3LleGCKO1k7iLt0Y3
         ID25NS8zu1Nzg6GKsuUG/HgAdFlzPaZhyo0hDvjB2/5+EDYDwGRDEBvty31jfyDNthGU
         D/+A==
X-Forwarded-Encrypted: i=1; AL+hErEjB7zHnN4RsAbEq4YCZH5n1QtVPKgRDlE0AOg9wFruqb2MtrjuwT+441XV85H+KPJ1C0dNYal9SbKPrqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/1Crsube4FykyAV1lw4R+CKJSTw7lbt4VoDUi17dpNqEDQ9r+
	hheG3HcbXWAQtek5jThXZeR6MVj1K9RMmOXs3XMFHg85MATrFwOnDvWxKdOv1SFNFd8=
X-Gm-Gg: AZFdTZcB7EcES0dK4jrap4xrigMJ81pVPwPUrJ77QWnqx/7ZoiRDFwloTZA0+SRCLFZ
	GXfCw+rhz0SiqtAyoRGZutQDThKZEC5sfa6HIQB/IpjnvlVN1cw2jVdkXX3ia3ad9e9H6iKYPAP
	7k7stYNvIYRvumH2dGHVzE33zrlzc4zqycmlx0QqIVIg1HKOHEfdDz6sXftV8mGvR76kBD6Iyos
	SM1F93KITquEvoFv1i98duWbw2IYuVM+7IAdh411EkxmlYVWsUQf2M5uwtLEBUEKlY/qgfnnb0W
	g2DzeSlDyiWRTaakOlUrSRDjAXQIEg2XDedkYctyzquS7sJ5kLKYLlNn2hwuHwn2yYG9/qE6Q1L
	sx0Mi7U3VJu7R/9FCZVnBVQU0aguJTQXJi0SfK3PmyWxYwBRTqBFBET5FJ8U4BxpPfVSl1TL/2X
	5bkvpi5VCK1ESRE6ASVE7mAo1qz7G7f6DmJM/Dj7HA+CJpwJv/5CxBh5zUh6UQJGiNb3UiKtjh6
	Q/rZkzIB8Cx0VK+9/H0AhJDiUAhNWRCI2xgJheFSfkc/j7I/ovi4xiomA23c0IZSBQ/WuFK8ze9
	q83J6Ib1m277Io/9wL9CGKxml5M4NQ4ETqSivxfscuSf61Q6
X-Received: by 2002:a05:6000:2210:b0:48d:facb:5937 with SMTP id ffacd0b85a97d-4abab5ea340mr24200572f8f.7.1795445625624;
        Mon, 23 Nov 2026 06:53:45 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm21988037f8f.56.2026.11.23.06.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:44 -0800 (PST)
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
Subject: [PATCH v3 09/28] dmaengine: bcm2835: move CB final extra info generation into function
Date: Mon, 23 Nov 2026 15:56:47 +0100
Message-ID: <20261123145728.29082-10-andrea.porta@suse.com>
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

Similar to the info generation, generate the final extra info with a
separate function. This is necessary to introduce other platforms
with different info bits.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index adf3508246ec..77b3e2f58ac5 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -253,6 +253,26 @@ static u32 bcm2835_dma_prepare_cb_info(struct bcm2835_chan *c,
 	return result;
 }
 
+static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
+					enum dma_transfer_direction direction,
+					bool cyclic, bool final,
+					unsigned long flags)
+{
+	u32 result = 0;
+
+	if (cyclic) {
+		if (flags & DMA_PREP_INTERRUPT)
+			result |= BCM2835_DMA_INT_EN;
+	} else {
+		if (!final)
+			return 0;
+
+		result |= BCM2835_DMA_INT_EN;
+	}
+
+	return result;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -668,7 +688,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
-	u32 extra = BCM2835_DMA_INT_EN;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, DMA_MEM_TO_MEM, false,
+						 true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -699,7 +720,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
 	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
-	u32 extra = BCM2835_DMA_INT_EN;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, false, true, 0);
 	size_t frames;
 
 	if (!is_slave_direction(direction)) {
@@ -747,7 +768,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	dma_addr_t src, dst;
 	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
 					       buf_addr == od->zero_page);
-	u32 extra = 0;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, true, true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -763,9 +784,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 		return NULL;
 	}
 
-	if (flags & DMA_PREP_INTERRUPT)
-		extra |= BCM2835_DMA_INT_EN;
-	else
+	if (!(flags & DMA_PREP_INTERRUPT))
 		period_len = buf_len;
 
 	/*
-- 
2.51.0

