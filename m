Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445621;
	b=1dJ7lGPdttAqNSxMEUrjmAgvgEFnB+ADMIUIY/gNRLsYTITIiZJzwFeSq3TiYaIO7l+Z
	 DbjKPeLc/YwhXQAa5hmnw1UP5lWF50jifqDNuGh9i643KK1rcCxd2okAEYxQWIzMNvhss
	 gf0y7UYRpQUSUrTBtcwmgZbZ7+Yadb3KuWGaXZP2BxwW8P9OZYDCvscD0w8CbVuob0O0H
	 oTyQCCInQb04fcMbPQevqMjIb2E5qCS7USJd/amh5kDQAB3gSxDNCrFALB4WuL43MBP/7
	 sN4dhCuslSVuhg/RQigwmp1q94RWT6mEYkSiMY9vXIfP7JVyLV5vmE+ClUdhHKEJBTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GrSoWjeoZdpdA2pLivwg9kOVjevNBkSDdhik7u3RWso=;
	b=iNwSYrcKvb067hzEtVHzdhxLatZe8Vo4IaHKKC9civ0xKLImH583mdnsiQdfic9ySLiH
	 aPvSoyGm1ppBSLqkBiIrnA8BUOyAs0nJpQ6UjDFdIQcyux4AC8Xe4csAUOanaUMmo4/Vv
	 yL4sGMPn3Eox04DIxOX0zvflo27EL4O9j5z3cMfUZxNeRRfPKVjZexUdbv8ZOapzwVm8p
	 I2q9isRrDNAV/r8zIOlGXOaeG4RxEMX7nAS3o4fRThpxJiwWVB/C18zrt7CtcdbMZt0aa
	 BsRpRkopWgxfj/8dLPfSYpaYHW7BkIrlIqmAZgQjlmEgXzu/BMfZ8JEK3IqKHJUzhtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I7xfCsQW;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F09C606A336
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F09C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I7xfCsQW
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so1937289f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445620; x=1796050420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GrSoWjeoZdpdA2pLivwg9kOVjevNBkSDdhik7u3RWso=;
        b=I7xfCsQWNGM6/3t3IFhuPig70szmaXPdWqHR4ICLd5EYf27TdS6LYX/3vN9VvL4QJq
         QqTt1vGn6XcO09FmNlVlM2JCkUMdRmbbccEZWIv3QW4PiQGOOfvsBC4Huh69PxiFsupZ
         iZvTlMvf53aouuFalLnWFe/2YWUwgPceGlafMd40ug/87CsMK3ysW12IfI5f44asr9iJ
         hqxhK/ff/NNMlFEJeuoN9quCJHovzK0Z4WISwy2gAHdxvXzPHFnZFdqz3/V7QbKFu/k+
         Tf4rGrfYp39AS7LxGmcc10xDf7/4WKW8h4xzNtxR1VD6M+konYD4HrgUbmpRBmnjyHTB
         4Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445620; x=1796050420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GrSoWjeoZdpdA2pLivwg9kOVjevNBkSDdhik7u3RWso=;
        b=XVfZ/8ZzpDc2/lSoIYEm+TxS0tq2rva+vwgs0r91Puw8eZ0X4Dbr4g01o7SqTLARho
         gn3dt2+e/aPEDb7tb1KxhBZ+BPyBWNPk8eRq/dKfA0cW/J4Wcim/m6wdgfbiHVq0aYAc
         dYp658CLyvXIDx3ZvT0bhoZLbK1+pUhvu1/kvqT4skXvhmryzzwkVXzHMhCLxqgHgncu
         LMtiYlKXbI2M82PfQB+kECr2aYzXoVkBZzeVMCbQiTC+BqZ5tJNsOI0vSbM4QHwTq0yT
         g8HS1UrfZhpGs2DSQ90D4ZaGpgbqZaxNKL5fokpJy8qW2hbCBpokBSuHvwvTqNEJvyBj
         n6Pg==
X-Forwarded-Encrypted: i=1; AL+hErHfHTKVVjwduL89mOSRT9TVx4DMktetURiHJrwP6N2WqrznBPAJNkJD2h8fBNqHNWR2tbL5b2kxiiGixZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fRZDC6BgknHim8BUq6ycZs6Yv0TIGfRCMxun7KLL7cuw+Rv1x
	zpWsjtI1AXVSPWMVAJJtOfcHhLV2Y0mokWv+fn/dkJHxTBGED2wUyRg3e4K+4wqdlsk=
X-Gm-Gg: AZFdTZd0qaGWlAIPIrAuDGVIlxRfcX0AVGteIVSJ/DwByNVa61PR1jyLZ9XiWCs30Qw
	pB3/LLdh7Tx9d6yDVz9kDfeh3dZLnEWNAGcPF9BfCUiScVdARbDlK59QT81HJ4QG3uGcWwbawz2
	QMO5fFimPyl3lQqnGQLd4etJ7Pd38GM+277ABhnXPblWlpDJoVDTrrJzu4UTpoEXehkZHVS5hg/
	po6IRjUtjeXyQ9Htz2CuArARajF0XEvOIunKYJb16XC6DJ+HA7UuU33rNbcBLa4ckkGTYUIJ5Of
	uYx/MKsg82JLHVoXArhcdhHjL6NUFDLJxuWa9tQyActKNkMjJxPQkM3Z+SVMBIuL0nTbU+b82qE
	HiwYFIP53w0MkjeaTtzvR1JDMr/gbNS8cKj0U+HRU1xGy/POj0ffi8TgYnltsZ+tPT2Gd1Frq6B
	DoqJG/d7Uq+khRIrXf8I2ruqNRlcHzumUHXLHE2OYMUoNQ6HRrpvLWnVVnnCenKyT+5tLPH6Kox
	nSMhbx8/m9dnTcKN0AACgxOTy+E7mijcgcNdzbueOlocyAbIr1gOboKN6NOTer6lQXNh3ESGEMT
	F5/KjJbJl6CLacGwnFB4LHgXbS0=
X-Received: by 2002:a05:600c:3e1a:b0:4bb:6814:7391 with SMTP id 5b1f17b1804b1-4bb8881921cmr233321345e9.25.1795445619780;
        Mon, 23 Nov 2026 06:53:39 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm663224295e9.4.2026.11.23.06.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:39 -0800 (PST)
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
Subject: [PATCH v3 05/28] dmaengine: bcm2835: Fixes for dma_abort
Date: Mon, 23 Nov 2026 15:56:43 +0100
Message-ID: <20261123145728.29082-6-andrea.porta@suse.com>
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

From: Dom Cobley <popcornmix@gmail.com>

There is a problem with the current abort scheme
when dma is blocked on a DREQ which prevents halting.

This is triggered by SPI driver which aborts dma
in this state and so leads to a halt timeout.

We attempt to abort the channel, which will work
if there is no blocked DREQ.

It it times out, we can assume there is no AXI
transfer in progress and reset anyway.

The length of the timeout is observed at ~20us.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 063e1b2aabe3..51e3a40dbaec 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -419,7 +419,7 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 static void bcm2835_dma_abort(struct bcm2835_chan *c)
 {
 	void __iomem *chan_base = c->chan_base;
-	long timeout = 10000;
+	long timeout = 100;
 
 	/*
 	 * A zero control block address means the channel is idle.
@@ -428,19 +428,33 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
 	if (!readl(chan_base + BCM2835_DMA_ADDR))
 		return;
 
-	/* Write 0 to the active bit - Pause the DMA */
-	writel(0, chan_base + BCM2835_DMA_CS);
+	/* We need to clear the next DMA block pending */
+	writel(0, chan_base + BCM2835_DMA_NEXTCB);
+
+	/* Abort the DMA, which needs to be enabled to complete */
+	writel(readl(chan_base + BCM2835_DMA_CS) | BCM2835_DMA_ABORT | BCM2835_DMA_ACTIVE,
+	       chan_base + BCM2835_DMA_CS);
 
-	/* Wait for any current AXI transfer to complete */
-	while ((readl(chan_base + BCM2835_DMA_CS) &
-		BCM2835_DMA_WAITING_FOR_WRITES) && --timeout)
+	/* wait for DMA to be aborted */
+	while ((readl(chan_base + BCM2835_DMA_CS) & BCM2835_DMA_ABORT) && --timeout)
 		cpu_relax();
 
-	/* Peripheral might be stuck and fail to signal AXI write responses */
-	if (!timeout)
+	/* Write 0 to the active bit - Pause the DMA */
+	writel(readl(chan_base + BCM2835_DMA_CS) & ~BCM2835_DMA_ACTIVE,
+	       chan_base + BCM2835_DMA_CS);
+
+	/*
+	 * Peripheral might be stuck and fail to complete
+	 * This is expected when dreqs are enabled but not asserted
+	 * so only report error in non dreq case
+	 */
+	if (!timeout && !(readl(chan_base + BCM2835_DMA_TI) &
+	   (BCM2835_DMA_S_DREQ | BCM2835_DMA_D_DREQ)))
 		dev_err(c->vc.chan.device->dev,
-			"failed to complete outstanding writes\n");
+			"failed to complete pause on dma %d (CS:%08x)\n", c->ch,
+			readl(chan_base + BCM2835_DMA_CS));
 
+	/* Set CS back to default state and reset the DMA */
 	writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
 }
 
-- 
2.51.0

