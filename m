Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781934;
	b=dj2NnxJYE79lTj7t30cJOdrjgi5e360L5XbwkNsfdVaivL50Tzhyans4Mc4ZrLOjcFEU
	 ilZyp4wTO+fdt3dHhxbY15UcvgT5yIc+Tng16Niiih/ZbAy6Tbstyb5zcQbLA7eO4XTrU
	 3vmKxcL70lkAFlUB1TguMVeZLSCJAoqevRIfVwxwQuEMvLmuaNXuOKQW5JbbG1LnKeyIp
	 P1JcWO/OF3PpoWkAa9oelTj+jbepoJp4//EB8M5LX2qTn4cLTSNLAtPrHxrUnAQahXLYq
	 +4YKJ9Q+djnvA6tSeUa4leMJlWSRysp1edDUOb9T6PWqQP2j2Qc4uydUce/KaC0s2Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tMNGeO93sTxsEO33pmW8bPBo/h98Zw55MeMFxQkFO1s=;
	b=zNBVwmiprWcoS+bIHYge8e+FeqJfC+6AhEQzWy4wv5IIFRnoW9Ig+HKmPDNUTy4FIRsm
	 xy7S5W4Vn7A/cphCw2oN+i5HToqPySSB9104pqhqkQ66XRP/s4ScV0hPnM0IWvWZiwQUg
	 fseTW3XM4EC2iaorw5W+VX9j4QJYX0QI7Y3wf61gCoanF8RVayb/vITwfF9V7BkNsVWdw
	 bRGUrhsjUI3DgYN51k2Je7qJEaNFWtlbuBS569ynr0Jgwx6qgRmg2Geu42x1wIygVzy38
	 deo/tQXAyULcGs2Cvs+ITkjM44H4jDTlshsZVhLZYCBa32FpUZ71kZ57rTPtwpiwzrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=f7V+6qQp;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A16606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16A16606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=f7V+6qQp
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso7233366f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781932; x=1796386732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMNGeO93sTxsEO33pmW8bPBo/h98Zw55MeMFxQkFO1s=;
        b=f7V+6qQp9oKQCCyIIuvhYzNaC0PSDlXmV9Kf87U58Jdd8Tfa3UwNQPJaDGJm55jY2X
         VY/VSZL9DjzgO71JIj+jKNYhtKYMfOTmiRhRLSvTW3Pmy7uiPzz6pOaFfmxELYynSdgd
         s5wquoBzlT+vnNbtdzTC4idxwJddDlexIyKaK+uW/0nMlgN47rIH1AsLXnohCWo7TsdF
         nfqd1KAGtBnCazYGG1sGY733YUGrXpyDrb+B2gQBwZKp7r/CS9hOzdaMAeMIj3ryyzc8
         RSvyb5npBLRcjTdu0wVgp3uliyFCYIJ80rIOKhHMdYzk9NpXFzReqmI16qTSCA67f61h
         Q5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781932; x=1796386732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tMNGeO93sTxsEO33pmW8bPBo/h98Zw55MeMFxQkFO1s=;
        b=M7rsXCk6SJtgotECgFaAxvaPP/Vd0Z5eDNeVcXNbJhYz/B0yhrnrn79P8Wd0wV5jFb
         eAlWT9mGFDo8rggiAOaAKqSUKhJA86KvwnCk1QSOBJynyrURhbxWHth4jrJe6sOloKT4
         lnqoMQAexst7uKoED1oMT44FS/kDLpXPGvWx3VuqXUQgD1h0S+dzdqFPRElfEZzbram/
         nNuM1TNr3b7DAaMDuLL07TCH1GtFjlF23Z8qVpgu5YwM79RbjO2kyrJ6AvjtHOf1gLxn
         55TfVtYBlZnr21z0VQdJ33qEHJLkZ+/o9EeWJ0F6/hRh+tNywtRVPlDux7cp9fO1uZBd
         79Rw==
X-Forwarded-Encrypted: i=1; AL+hErE/REK2+ftvLPBVcW504vlx6Y8RAEAEm9efIadQjx3AGHQf++dXPnKnafZKCtheJRaadptzHuCA1ZGpgt0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ni0sbqhoncRaVSACHMfCKlcxu5+D+iOtlCgxvG5+bbG6aqjCi
	/vof8vWoZE1Lr5R8/KuCVuLyjH5SVH+z3mMGGBYmB94kEB9CgaX+cHdJ9hOLfFt/n5A=
X-Gm-Gg: AZFdTZfORVD78ezTYXfJfPYO0loT6+/1By76HpV45Oc2nmDUfjXidr8CQIO2J21+uTV
	MjYQpln58RUXas+t1JBWTfmJFftHi1qlSnPMMltrZUWp3c7H1tpuB6mIGyptbUWYxEoX3rNdkNj
	4AsAjEh/5RmSkimgwScqZYxGCPGi4ufDT07p/+tvifIH9eYPxSUlubh5lHWvcuuvWu5g1o8GvvF
	RTmGer8jyY3mv42wsiqpDSuxfUodnUkvBKGUdUVjusMmTxlMEzt94j1WpVsOiiofPRv/WcK8p9p
	7gfrko3fNyg/SDYXi2KHhmejSEWexddVggBoZrOGENv3c3QponYp2SM21iDmWFk0oYtzPl3G27h
	MaXwU4JkmkKtp5LDxBODbuCqiM48PiKRVn/kzCxMV97OQfgzBUfDs+AXIQ+EwYTGEqmAQplhTcT
	bzjW7uVEEd1h1qa+MeyC6hJtzo3ERMMPsAY0T4A0jVWvNvdDTE4qnLuYqruy9hIED2+iquGWNl5
	eTmX4tS1u0NJADA+GbhMvajba2HAAj0MNNAgUkfrJnM57BWhfaDlfScQl40/PBvBvhj3S12A1g8
	u7dyRDZAmHgy7bMylz3cGglzSeSI
X-Received: by 2002:a05:6000:299c:10b0:4a7:9630:7b5a with SMTP id ffacd0b85a97d-4abb47b2043mr35030668f8f.47.1795781932170;
        Fri, 27 Nov 2026 04:18:52 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm44903360f8f.36.2026.11.27.04.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:51 -0800 (PST)
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
Subject: [PATCH v4 08/28] dmaengine: bcm2835: move CB info generation into separate function
Date: Fri, 27 Nov 2026 13:21:58 +0100
Message-ID: <20261127122236.4976-9-andrea.porta@suse.com>
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

Actually the generation of the Control Block info follows some simple
rules. So handle this with a separate function to avoid open coding
for every DMA operation. Another advantage is that we can easier
introduce other platforms with different info bits.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 53 +++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index d2e000e94347..eb306397b0fa 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -228,6 +228,33 @@ static inline struct bcm2835_desc *to_bcm2835_dma_desc(
 	return container_of(t, struct bcm2835_desc, vd.tx);
 }
 
+static u32 bcm2835_dma_prepare_cb_info(struct bcm2835_chan *c,
+				       enum dma_transfer_direction direction,
+				       bool zero_page)
+{
+	u32 result = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
+		     WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
+
+	if (direction == DMA_MEM_TO_MEM)
+		return result | BCM2835_DMA_D_INC | BCM2835_DMA_S_INC;
+
+	/* Setup DREQ channel */
+	if (c->dreq != 0)
+		result |= BCM2835_DMA_PER_MAP(c->dreq);
+
+	if (direction == DMA_DEV_TO_MEM) {
+		result |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
+	} else {
+		result |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
+
+		/* non-lite channels can write zeroes w/o accessing memory */
+		if (zero_page && !c->is_lite_channel)
+			result |= BCM2835_DMA_S_IGNORE;
+	}
+
+	return result;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -631,9 +658,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
-	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC |
-		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
-		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
+	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
@@ -664,8 +689,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
-		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
+	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t frames;
 
@@ -675,19 +699,14 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 		return NULL;
 	}
 
-	if (c->dreq != 0)
-		info |= BCM2835_DMA_PER_MAP(c->dreq);
-
 	if (direction == DMA_DEV_TO_MEM) {
 		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		src = c->cfg.src_addr;
-		info |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
 	} else {
 		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		dst = c->cfg.dst_addr;
-		info |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
 	}
 
 	/* count frames in sg list */
@@ -717,8 +736,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
-	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
-		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
+	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
+					       buf_addr == od->zero_page);
 	u32 extra = 0;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
@@ -749,26 +768,16 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 			      "%s: buffer_length (%zd) is not a multiple of period_len (%zd)\n",
 			      __func__, buf_len, period_len);
 
-	/* Setup DREQ channel */
-	if (c->dreq != 0)
-		info |= BCM2835_DMA_PER_MAP(c->dreq);
-
 	if (direction == DMA_DEV_TO_MEM) {
 		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		src = c->cfg.src_addr;
 		dst = buf_addr;
-		info |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
 	} else {
 		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		dst = c->cfg.dst_addr;
 		src = buf_addr;
-		info |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
-
-		/* non-lite channels can write zeroes w/o accessing memory */
-		if (buf_addr == od->zero_page && !c->is_lite_channel)
-			info |= BCM2835_DMA_S_IGNORE;
 	}
 
 	/* calculate number of frames */
-- 
2.51.0

