Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445626;
	b=14u0vOiBO3a/jHSDxvQwfV3eh6hGi08sN+knv489R3S2d88qcrJRGr1MROuXNXW0eECl
	 xntefogJhZzUwTS7TOQWD45qsDD3NmTY026QgRiOJ5XdVgbjXVttBtRi7mkdq5xtCtoSa
	 /Kff+ksMwfyshO98Q3AwPOLrFF+1fwxyFna4z/BtJz4r73tUooffabvKPslzvTDBN0I8+
	 6CFowpLSdvWKeZue0hPXJa321OnLi2hBdc8w7OQ9OoDe2F+sB+oMVhr588vIBR0Fkyfrb
	 WCG0adldR8dko0k0nMYqQ+5ZJecw9hvJ50RmV8umtlb2z4Q94h9G6UnIQCXwXcBsLgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UWP/pp1IkbQnXI16iTnJsuqUrrWyENmPbInF4rvzvak=;
	b=Cw+vvxSvvWZAfCvF+4rCQBtbs+vp2M10G4+Gh3Pk0DpLeLPtYY9K2ZR5Hk8kau7yZjvL
	 iet0fC9GYgHts//yoHNWpg84Wm3VaYRJq3DFhAGQAChMpeX7kY47cBTzGaWpHmbt2aq9O
	 nAsqem+p9dvxR/ugcQCr8wDtdqOjJZ4AE/PCv8lA2K+pux4J2X/Ee7UPcs0nrtPoFcvz8
	 4V6rnCfuzq02vwLsGqP0/nRWZ9fv4YEcrYQcq4fXm59zam/ytOU4R87SLv+4fgW7Le0yN
	 GQxTPThwRMzdAYS5ZemwA/U5UMX5xKf9K3lyZCQyAiiEcNzy1z5rwwmVzR3ijo9OeVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="T/rcodwa";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B340C606A6A7
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B340C606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=T/rcodwa
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492690dd5daso2568636f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445624; x=1796050424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWP/pp1IkbQnXI16iTnJsuqUrrWyENmPbInF4rvzvak=;
        b=T/rcodwaI+pYX6a9H0SSzhyWNNDRr/NH+uv1nJvb9bdWXPK/kw6TQPItEKQTaSDMos
         8femRe7oAqiaHvnvAgDI/uNgg6K5t3LDifubnNgeuLlgvDhFKaQxbNRZWt1CRf5oun2l
         1cD/y+xY3s+j9WQ+yjgeZKhQqi1WzCGUEaE5vdBYisk5Up9Y+teyxRJOuNF8tK5qLbUE
         e+6Ymz1xRLd4KdPrw/oyMYZhaZ9V+tjHP7LMdwQJvQq1JUnXdfEDXqA/VyT2gCVSssy1
         S0axTP3zjhjmrOUkieYAAZPFiI/Vr1rUsIQDirJu/Ww+/us1auBMk+HR1QWEdXsEf9ai
         C5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445624; x=1796050424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UWP/pp1IkbQnXI16iTnJsuqUrrWyENmPbInF4rvzvak=;
        b=PY06pR9VjPWnvPNtJmc+6kc2yUIgR5R2zNlJpINUtNOm09GVvwDZy6axB5s2zx/65f
         DXIURL7Y++RuDklwVdMdjR5paRzWBEUU6t5Ad3K6sO+MHuI74C4rACOmd6RtTnpGhPZh
         gqOH07oRAx+QLnjs+YTX9YVGlW5VEVQZ2YNDqHHIFWATHe2PwzsdIK3gwpzRdkR6g51y
         1gpXuEOPUYwMF57rweWk2y1QuhRl/MQHpyjC83XG8qD0aX2wzdZzFsxhHCNIAYzTLA+M
         xipQwfiC1j1cQQAuobcZHuvD5S6D6BKjd/AsP+vjTAt6+GLPZiDlCclnUDKo/NBkXmBV
         RInw==
X-Forwarded-Encrypted: i=1; AL+hErGjZOxF58RCk/qmjIDFyZtMhxHF/4WkNGSnh4eyX1L/Y3kPvp5TTtzypji7UXq1dfPN6f1xOnQXpguQPbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yRZW9fBPYgEw6UwMU2PMfJXXUgofg84i8NoGyN+1tT2Jmol9z
	K74Ddgh/5aTYkrKQWoRrtPmBQn+SaoCjmF0KmELtE8eYs6FpbecT3y01Ka0Lx4sAAoc=
X-Gm-Gg: AZFdTZdaRgMkdE1o/yga/qxxfQkB5M+FG8BSHXWZKLcJnCfKGj+ox0JKTrsYkb+pzFy
	fI5SlTvkeCIsInYYdainakElWMTzI1k2bNY+WFChCxZd6mD+TmHR+hJlSDkCtrzNif5SseX8VOT
	l48oh9RSw0XFUctpW6wsSpvUn94TNpOZAYjle4PWQX3h2Tgq0qb/07IS1QGzV4ZSbcz+ssMtPAa
	fh52kNnu168XanOLiRpug3sjZB+Anj8obvE11EOA0FEE89muVgPcd9yJOQ6dSWUtxfJjhHMua8J
	iIII51s8W9mk7xo8AWORx2KR7t4LvSmh4ExTN+4u3KlvcF5go+eDWKi5a7hMSSQQFBqSf7uHel7
	2dEin/US2C2ozyBqfcAHuoKJjLjl2fkY5JwoD3x8kF4CA3XVK6KsxWSh/WTCQ3w37XJhS3KfrX+
	9pwGVTu3xZVITLGgV/Uc+Wc1/gRAheMZE9euYmBfb8w7DZLzIetXxQymsWV9wrgyj+gkNvTrOlg
	sk8/0xWkDEzqPAQfsb5vgzt2SPBOIEFQ1VOfqHXfdVqis2gbkehiNXcM4A+wmLsMXibuhbX0Obc
	ysfTeEDcnMx5XdOMhP0sCErpKHQ=
X-Received: by 2002:a05:600c:1c21:b0:4bb:52bd:a3c7 with SMTP id 5b1f17b1804b1-4bb88804d41mr307783175e9.6.1795445624072;
        Mon, 23 Nov 2026 06:53:44 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm172540125e9.2.2026.11.23.06.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:43 -0800 (PST)
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
Subject: [PATCH v3 08/28] dmaengine: bcm2835: move CB info generation into separate function
Date: Mon, 23 Nov 2026 15:56:46 +0100
Message-ID: <20261123145728.29082-9-andrea.porta@suse.com>
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
index 1087157fb242..adf3508246ec 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -226,6 +226,33 @@ static inline struct bcm2835_desc *to_bcm2835_dma_desc(
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
@@ -640,9 +667,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
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
@@ -673,8 +698,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
-		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
+	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t frames;
 
@@ -684,19 +708,14 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
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
@@ -726,8 +745,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
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
@@ -758,26 +777,16 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
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

