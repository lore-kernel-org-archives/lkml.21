Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445632;
	b=ClX0P+dgl5XG03bbQeaKXN9fC27HzbEloT+3r6zU9E3si/fmjq/zY+JauVcK+1WmzSXZ
	 0H/oov2tXAxPcpVwY2nDpD3XmI/yWYkl905EW0JfhukB0kuTUy1d8q2ArpwcdnqP0Hiyq
	 OfyPy2XeWWtT0QTVH2pUIX1b/Tm3kdSGEFUUaMKsuLOXwVbNMIhvu3v7duPw8Sp+YQ6vk
	 EAqCpOEl1NHt5F8pTPwdra7bbS7RhtvI+VocpznAoSXqTyHiINLx4gLV91HSUGWiiv437
	 JWmmk2PpCCIM4J1LRhkFZTosut0idU9cSx/MVzEfwj/oe2x+MLx2S2Yk+YNaoam8Khg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Zvqnrlc7MSEtVSmfRRlydngWRQ+r+L5CkYiMb5jwDlo=;
	b=pnhttfs8Cz2y4ygB9MSP+saUpQI4r3xf7mYC/cLaae9CyZLqvlW+PLjZ4K+cHOZ8cQTm
	 JR73WAeA9gizyrU0pCPw1IMUK86qOL3daET84CKFmIK+tk2QDJOTOpyrdVt9T7wD128tx
	 jwEzniRNuQ9xW2XW2Ix/qyhk5fmyKU7HHf/aCzIOXAyKkQsqZK9Hi09uNLkKmp9TDZe9h
	 ++S7EuH5ITkAnHxYHHw0d9xgY3E6UKaXmRuBLCxhlt7OV3rQDKpPdvg4UuBNTiqPdfhti
	 e4KTWuJMxUDSEFc1/MyyLrZZNPbo0eJdeEjLHK456qQQjyAblBddmMS7Wa/bqGSAHTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=doml4OEl;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9393E60A3821
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9393E60A3821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=doml4OEl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491846221ffso2858808f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445630; x=1796050430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zvqnrlc7MSEtVSmfRRlydngWRQ+r+L5CkYiMb5jwDlo=;
        b=doml4OElPORpXc2qIfAu85R+07zrXEfqpUSHMRiYnf+iTX1cMLpEuriwYq+Q2H68X7
         PC2QOCMsIkSU/dHqfVHpja2SkEdCsftBfz2xwWKXvqrWdVajli3t+7LpNualMFke2s+D
         uHNHN0MRxhLeFM3eAbm9P8TYx3O1sLEdaLws0xmLC00nUK1nv6Yl6ccXJqLPVGyhBL+z
         c/it0xyi8VkKFJPuEmdtO0vq0qvsR5pFlszibB/STIDQdopXznbHkybgBlbUC/TRHnUy
         3n6FEqR61hVkv7W3h1sxmJXxKAWwx94tf+FO6JUrGt4dg8l+RWyNXfjGftan+rJNrGte
         xYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445630; x=1796050430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zvqnrlc7MSEtVSmfRRlydngWRQ+r+L5CkYiMb5jwDlo=;
        b=reFDt6Uv5JR1ufw/D2I21GBKLoZZ44CE/lj/7hE0a/MDCX94C2eN5OBV8rf4jZLc2D
         z8pggJZicPtgLi8I5wWU+ZuHdJlr0IrugD7xGK/b/C7Q8J8lBghpR/fbGovLP6LYdogm
         ED8Y0E9CN7FVmBPTQPc7BE3GSWYO8RdLKV8CeemX6hxaQPSWEnVVlARdWnunTksRV5q3
         TtffkWWxnux/Kwrf8ZSrUOcn25vFhO3dM0v6J50aaQUFaxWO9k8iSeogeYpvg7Cv8fWK
         FtYeDbfIn4929PLb9St86LM3qY/ATWCkKUI+Rdsja97sS9fXJUUQ0hgOnkhcH2vW/nIM
         e3NQ==
X-Forwarded-Encrypted: i=1; AL+hErGzW8PbzKmt2kC2YPRN7fwTCQawBu4hmC/Jw8NfvLiAnGIs6T9LhA0r32g/l1yw/VUw50b3HSnSTLq6dj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LNAg3Q7B5yX6llq95tOrXWr2qI0gOPj3//EBweN03dhlbo4sl
	V/q1XYEyQj6g1Smy/BOxaZ4DySiAaqtQI+KQ0PrO3DcnAZawr8UkS97wJ3BBlr+qLUw=
X-Gm-Gg: AZFdTZdkCPWlgZGTZ/0e5ji/DIIg5KVKrpAzZGyvupJ4dx7FChomakZ9b5gSK4zcUB1
	HTjPMmyQ8wPSDYP5/cacDuBX4uw8cUJEFFdFLiPvuCg63kNoZ3zNDXJMx+p5kbZPNlrrIhC502u
	kglXic0mhplTPcXANMEt23ymko+ENxugFwtkgQk1L7z5vMiMg6S/CEtgKGlROihspXu+37dbTQJ
	nHIXdQOhyEOXPQXsJBalw0AyREe/kfqocuBpM2tWt0gcWFvbTfIdHOoLTfLPSBRAzelIazCxRWG
	7kstmz7dAs+VojGfxfjibu2/txfXHPHaYBydx0D8texG7oMw0jumb7+uqxS8HV0tMQZHqpQ9sL6
	BZ6+uMC57aYK1vQICljRdQjds29ozTjXiKk0UTPveNkfpaJRTkBcHnzxXf6RYZBRtwGiwopp5WC
	Gc3O9B8tTODhBrpKWIVcRuFfZxZA2V/aYRDLHquL16h+BbhangB4tPkCQE9ffg8518mzmhSCfd1
	2rGCAeHpeZ7gXrF/K+nLyv4yXxKV9kt2zj6HVe6QHx51X6K6It5/wtpIsMjf39cBFneQOMa6s5V
	+12IYNbl9oA8M9x1dumuZu8e4f8=
X-Received: by 2002:a05:6000:2313:b0:490:50c1:f359 with SMTP id ffacd0b85a97d-4abb4d70071mr25023593f8f.39.1795445629731;
        Mon, 23 Nov 2026 06:53:49 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm22090607f8f.30.2026.11.23.06.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:49 -0800 (PST)
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
Subject: [PATCH v3 12/28] dmaengine: bcm2835: pass dma_chan to generic functions
Date: Mon, 23 Nov 2026 15:56:50 +0100
Message-ID: <20261123145728.29082-13-andrea.porta@suse.com>
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

In preparation to support more platforms pass the dma_chan to the
generic functions. This provides access to the DMA device and possible
platform specific data.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 1d322cad4ca3..d048cb00ce5d 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -307,13 +307,14 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
 	bcm2835_dma_free_cb_chain(container_of(vd, struct bcm2835_desc, vd));
 }
 
-static bool bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
+static bool bcm2835_dma_create_cb_set_length(struct dma_chan *chan,
 					     struct bcm2835_dma_cb *control_block,
 					     size_t len,
 					     size_t period_len,
 					     size_t *total_len)
 {
-	size_t max_len = bcm2835_dma_max_frame_length(chan);
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
+	size_t max_len = bcm2835_dma_max_frame_length(c);
 
 	/* set the length taking lite-channel limitations into account */
 	control_block->length = min_t(u32, len, max_len);
@@ -423,7 +424,7 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 		/* set up length in control_block if requested */
 		if (buf_len) {
 			/* calculate length honoring period_length */
-			if (bcm2835_dma_create_cb_set_length(c, control_block,
+			if (bcm2835_dma_create_cb_set_length(chan, control_block,
 							     len, period_len,
 							     &total_len)) {
 				/* add extrainfo bits in info */
@@ -491,8 +492,9 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 	}
 }
 
-static void bcm2835_dma_abort(struct bcm2835_chan *c)
+static void bcm2835_dma_abort(struct dma_chan *chan)
 {
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	void __iomem *chan_base = c->chan_base;
 	long timeout = 100;
 
@@ -533,8 +535,9 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
 	writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
 }
 
-static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
+static void bcm2835_dma_start_desc(struct dma_chan *chan)
 {
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct virt_dma_desc *vd = vchan_next_desc(&c->vc);
 
 	if (!vd) {
@@ -553,7 +556,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 
 static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 {
-	struct bcm2835_chan *c = data;
+	struct dma_chan *chan = data;
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	unsigned long flags;
 
@@ -587,7 +591,7 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 			vchan_cyclic_callback(&d->vd);
 		} else if (!readl(c->chan_base + BCM2835_DMA_ADDR)) {
 			vchan_cookie_complete(&c->desc->vd);
-			bcm2835_dma_start_desc(c);
+			bcm2835_dma_start_desc(chan);
 		}
 	}
 
@@ -615,7 +619,7 @@ static int bcm2835_dma_alloc_chan_resources(struct dma_chan *chan)
 	}
 
 	return request_irq(c->irq_number, bcm2835_dma_callback,
-			   c->irq_flags, "DMA IRQ", c);
+			   c->irq_flags, "DMA IRQ", chan);
 }
 
 static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
@@ -623,7 +627,7 @@ static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 
 	vchan_free_chan_resources(&c->vc);
-	free_irq(c->irq_number, c);
+	free_irq(c->irq_number, chan);
 	dma_pool_destroy(c->cb_pool);
 
 	dev_dbg(c->vc.chan.device->dev, "Freeing DMA channel %u\n", c->ch);
@@ -704,7 +708,7 @@ static void bcm2835_dma_issue_pending(struct dma_chan *chan)
 
 	spin_lock_irqsave(&c->vc.lock, flags);
 	if (vchan_issue_pending(&c->vc) && !c->desc)
-		bcm2835_dma_start_desc(c);
+		bcm2835_dma_start_desc(chan);
 
 	spin_unlock_irqrestore(&c->vc.lock, flags);
 }
@@ -868,7 +872,7 @@ static int bcm2835_dma_terminate_all(struct dma_chan *chan)
 	if (c->desc) {
 		vchan_terminate_vdesc(&c->desc->vd);
 		c->desc = NULL;
-		bcm2835_dma_abort(c);
+		bcm2835_dma_abort(chan);
 	}
 
 	vchan_get_all_descriptors(&c->vc, &head);
-- 
2.51.0

