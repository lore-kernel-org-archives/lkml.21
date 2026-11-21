Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223484;
	b=UIDMMPv1ensyML6ut8euBglQlX2lsgJIAFm4EgxgEr0nTHF/breZa0W5iXSn1Dz4t8h6
	 xc/XJtqCFKYQWOi2dudrh7EnGds9jDoZ4N24NjARgLYGnCEKEuOcUbKuR8XKpW1KXZFtS
	 0EWxJMgV+uEI18HHKkcb7b+tBDUOR88V4MMNOunkZaBSk9mVjPun5b6sP4VxzwcrB7zIe
	 GzUbD62eNN7xGJaFuWuKe465kK4je2GOLJHdH7kzcaxQvLB87bpr71fQhwUTIRB/94vuq
	 ikTGILQxzbHpaJU4JGW33fqTdyDFm5CdGZy+WI/YrFQr6ATHwHGyv0yGVaJPyIRya1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9R93eLtRuVCsdbuGEdtd6/wt6t26wDnU5PW4NiI4F68=;
	b=eXkY4/o7TNlOLDm27zidf7MSu93fX6PQfCtvpO6PVUHtgUf2oCK2TrMzUFGLuWqsWZfH
	 Eym5CpWzx7Dr2Y79uMXvcWxgOhrUviPLHw2NofTfcGD24PFnLQcGa6Al3eOvgkyRvo6e9
	 uOtGQoMHW5nSZ9D3ULhxpVX8ng5HlwCJjaOtw4jSgtcZnqCkH0JFXP2RUuwmcTHBOB2IS
	 Ej6g17pmu2dV/TY1klia/VgGAmH3aMYWCYo6hDCHw5N18o4ddGY5OpVgUInrr7SdNBUxT
	 EB+e3scE3YrkCZkJy9EmqTqxWRmi28HcVTpZUJhEOWENIqabLVWW6Mb82sY9+J21WeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e5TgMMm7;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6B660A6F6B
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C6B660A6F6B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e5TgMMm7
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4b28d7c729fso1188039b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223482; x=1795828282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9R93eLtRuVCsdbuGEdtd6/wt6t26wDnU5PW4NiI4F68=;
        b=e5TgMMm7+jQ8ffDKlXHHAXuEjTo4RJVZHVunPTHGE1LYtShLGSVfkURaaAAypnmbrG
         kaYDSwM1oi604+FYpctk6iFbjlIcD7n6VjdWpc4r1da1atEf1orbHyQzK1HXr/Y8wHAU
         TStIula0ruCnYI39A++ThrwUdZogQjXU21dKrLR4nY4hhvQE6hPddg3eV9YuOCgZp/VK
         vuj1qM6QH1h8P5cVDLgxoKkg73iL3oX8l8MUeVgbdqXH61KKt3coCtLtfW3b4lCcIiR5
         r9Kjt3Ii8zPONhALXGhmIxA5hUls9+Dp9YgnSjWXQMQd8C/q7ZgCQ+3Ua30zoHWuGbCT
         1aeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223482; x=1795828282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9R93eLtRuVCsdbuGEdtd6/wt6t26wDnU5PW4NiI4F68=;
        b=ntWY6J4TN/ty8H+sOILdiU1PHpbjB4HRYfjWzwZiv+ux/28LdBWiMC7vqDIg5ZfOpk
         HiDhWEbzMKR5ho/IbEIgoe1/Nt1O0aD0z08YGiPjzGxcLyiX6xW+XS7jw3onfbC4evCG
         fKan6redkbF+Pmar1CdMm3rumsxfjrshyAr9T17rfzLQHF2qADSspuAQ3dQloRqOB7uP
         88wfX3wJAqMRxUuuDfX0pDZCrapNK+/Rttb+uE6waJkXXed7uIbfFRTbO9XAqp1qXnsK
         bJg/YmHlmu581yGfDXOzljuCD7N+mI5LHTDvuvbb7YCqXJL3PcHJE/XBYiwePRB+dbzV
         w2rw==
X-Forwarded-Encrypted: i=1; AL+hErGnLZDCYNKFeCXs5rclPpLWmyLEmfjd446tey5NfDLyXWP5x7hPsh2z4oOfIyog5M68SEWe98oYGbtGsb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xVGnY4t3E5PoSXaF9/71Rj85hHp/6o1SzL5fKWSwm3cQDfiUy
	9XETfbIn/gXwczeqyXQIaHWVTwJccU2slMLVhtXj/02xp++Ad4Sx5uDa
X-Gm-Gg: AYBFou1/8D0EwDaJKLDfWXeWtnWTC4xGzwNjQQbE69pFl08vJ/IKAaVkC85eA1efqY3
	r8q3clRvZG9SVnPuSmFSYz34GlVNUDZfLOPTDZKC/YB8ayZPTKlocijtt21rgJXuNtTKZnayiZd
	JZk25nmJhlmfh/cjx9DBHXRgnzxQ8Wd5zfd7lHz9qzYixoCxlSHpiKf+OiVl9HebU/w3dbqI7Pc
	iR5rA0hHOn2eHTOsz/s+oYf/saUdRB/3xH4BfyQ4q5U7wRCT5STFCTKs6j0bdF6H2BG/5lh52jX
	LHgD4DoXS7ij/ycFk5o2n17nbLdfqogln9ZwjGsvrDaQu7zpjrK0BRya9haG/kn5vtlH8D7rbfm
	/O7/0RuGK6EdYt1KiCBJgaWVk3fM4dDjFYgU/AxYRftYewNENdwZAwqq4BLZ7QNe+Qb1JZRyjM8
	bZtc0pxYHP+ahOZnzhqCSpNjelpWTLDeQNNBub0PwjbP9jrfSuf3Yt1xHZ8sLLpGAj9Oe5nVKN3
	jlFLSzpMl7TNgqTZaU9maV8zNQeQ9rawV6nlvfUmQBigkpnTV0XcUlxWzIbt9f70RjFz2o5yWOs
	OkCqjG7So9r/WqlKNpNfNjMaqWXJ1HsF+PzrtukoyW/NjVnD7Cg8/gcUr09aGaP16/0sdaLqymK
	gmIof2s5hTX/AlrcbvKwgdwwK0Hhu/zQ4AFClJsD2aETPb8OEuxOtd7VZ26hcwdDUzyhk+eR9Cd
	oqqT+B0FG4kod8ehhsiQvgvmrVyYM2WFL83Tjt/31hzTUmYjtrbTXu
X-Received: by 2002:a05:6808:13c5:b0:573:52b1:bb00 with SMTP id 5614622812f47-57a09910c41mr6373784b6e.39.1795223482353;
        Fri, 20 Nov 2026 17:11:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:42 -0700
Subject: [PATCH v11 19/26] mtd: rawnand: sunxi: propagate chip clock setup
 errors
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-19-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev

If clk_set_rate() fails during chip selection, the next NAND command
can run with timings calculated for a clock rate that was never set.
The driver also caches the requested rate, so selecting the chip again
does not retry the change.

Return the clock error before programming the timings or updating the
cache. Propagate it through exec_op() and the DMA page writer so
neither starts a command at the wrong rate.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index ee68ef9bba33..37cc023db74e 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -628,16 +628,25 @@ static void sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
 		dmaengine_terminate_all(nfc->dmac);
 }
 
-static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
+static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
 	struct sunxi_nand_chip_sel *sel;
 	u32 ctl;
+	int ret;
 
 	if (cs >= sunxi_nand->nsels)
-		return;
+		return -EINVAL;
+
+	if (nfc->clk_rate != sunxi_nand->clk_rate) {
+		ret = clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
+		if (ret)
+			return ret;
+
+		nfc->clk_rate = sunxi_nand->clk_rate;
+	}
 
 	ctl = readl(nfc->regs + NFC_REG_CTL) &
 	      ~(NFC_PAGE_SHIFT_MSK | NFC_CE_SEL_MSK | NFC_RB_SEL_MSK | NFC_EN);
@@ -649,14 +658,11 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 
 	writel(mtd->writesize, nfc->regs + NFC_REG_SPARE_AREA(nfc));
 
-	if (nfc->clk_rate != sunxi_nand->clk_rate) {
-		clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
-		nfc->clk_rate = sunxi_nand->clk_rate;
-	}
-
 	writel(sunxi_nand->timing_ctl, nfc->regs + NFC_REG_TIMING_CTL);
 	writel(sunxi_nand->timing_cfg, nfc->regs + NFC_REG_TIMING_CFG);
 	writel(ctl, nfc->regs + NFC_REG_CTL);
+
+	return 0;
 }
 
 static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
@@ -1778,7 +1784,9 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	u32 wait;
 	int first_step, batch_steps, ret, i;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
+	ret = sunxi_nfc_select_chip(nand, nand->cur_cs);
+	if (ret)
+		return ret;
 
 	for (first_step = 0; first_step < ecc->steps; first_step += batch_steps) {
 		unsigned int reg_index = 0;
@@ -2519,9 +2527,13 @@ static int sunxi_nfc_exec_op(struct nand_chip *nand,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	const struct nand_op_parser *parser;
+	int ret;
 
-	if (!check_only)
-		sunxi_nfc_select_chip(nand, op->cs);
+	if (!check_only) {
+		ret = sunxi_nfc_select_chip(nand, op->cs);
+		if (ret)
+			return ret;
+	}
 
 	if (sunxi_nand->sels[op->cs].rb >= 0)
 		parser = &sunxi_nfc_op_parser;

-- 
2.53.0

