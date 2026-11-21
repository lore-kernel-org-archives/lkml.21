Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223469;
	b=q4AycO0uDc6LUEHhZX2oCQrNn/RlVTBtbBQGwh+w39NCLEhlJJxtLs0ilrnlAMtEpOW+
	 RUoH6VZsrfgjb7M0VJrszqrBTK4eiwfrv0Xp4eZ4NGSCJbNBqDJPykNGm0ybr6zl8c8Ac
	 gQtLDYIUcPBK+ehnX5OEh7QNMONn9LyNa9gTX7etKQrNuNhH17ciJz2scc2Am13GISzJ/
	 Fz0BUd3kxHR5bSrxQIPVK7wgawwUo7k6CN/CgXAAjK8k8I3kt7WJ1UADMFSBysWMFgPGa
	 v7OWekQ/STuL4c73nYWe7/oU7ZMm3xDk4GoRi9tUrQOWzLDp+wFc1/kP/aZeQrnkSZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0IrAGyQNQ+9vmexJ3HX+RGvKm7PP0ZR37lEcYjBayK8=;
	b=PDdeI569WrLgLdFESxuTCyiqnAxJncd9Gp/npiX0YUCU2f6hH5FBC8F5mBXerjhnjsCn
	 4O1qqBWlVmGx94nW1MS+jODLK5DP+PLov42vuJCRjuN6wXIDCw/Qln5xCECOHPdzCV2kd
	 6eh8A0GwvFvd95fiCuuSf4yRXeNN/VTxv9/SR7MO2FJE7i1zd+G7PAOmKR9KBP5vX2mqk
	 MOHK/0KSlw4dl4t/By0NGOwbsAQoHNz1nZPeVduenonJXJy04QJqO3kCckbP1WBRLWg2Z
	 7kAwCpWFY1jdbaWnpZMWel649nJvENoKnyL85u73Atn5TawPo9R/xVv5dXFGEW6qvxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wA+gocC3;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1EB606A6A7
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F1EB606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wA+gocC3
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-717080a2d50so1386320eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223464; x=1795828264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0IrAGyQNQ+9vmexJ3HX+RGvKm7PP0ZR37lEcYjBayK8=;
        b=wA+gocC3cINfQJysjlhm1wWwd9fwDKpCIMdkLBs9xSFYRo514mTsibmbMjvsFTyuJZ
         qISsD72LyACapDfMi19sBBXYXhyhZ/PE7drKYWmrrkj+CKfPMlSPH4QvE2qwnM7fnHii
         aujPxAfhrB7c82uB1bjbzrjfDrXoBQUy/zhKTTHJdARTS/7rLqa/a2h16T3C3A9r7YtS
         oiBGH9Gm/AsimfLVkcjiMiGuBTyISsBjhJmDjykcybmMVt/zNjZVEygxtOvaOOI8yFaZ
         MZQksI24r1PF4xAF12pZVcA4IbpefNWFRTBDy0ruq/ZF+JweCulKT/Nl7FUlqtfYVvlF
         89AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223464; x=1795828264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IrAGyQNQ+9vmexJ3HX+RGvKm7PP0ZR37lEcYjBayK8=;
        b=iqvkk8orFUupzaja1j8GRMlcI4QofwwVJ5M1+W9vLJNzQKcFTDojvNOQPZf1Gyocp7
         01Qi8uj/QEAzcUvdLMJi9Sg/Zz8YYSJ9x89RADxbzBRDmLi64+OIVc23+J7hoEvpg4GE
         P8NzT0/0xhJ+h+/iR3roZJ/zO1WuHOeEsGcyZGo0zO+4iFbSIp0J5xLlm4xQXjLrM2/8
         JI7bC1t0AU10QGGEoMWvpotbGxullIP3O6bABOkPaE9Yf9pY86/TjPbdiQnL7KRbZ9fR
         ILg0o4JBEuOMYtMc9o5Jxc3iz5fb1zwJf8o+NhxR1uhCtalrMbniXfV9bpmjq2wL2Z6c
         0xIg==
X-Forwarded-Encrypted: i=1; AL+hErH8d4xKaZrgcfk7w0Bm4CyGbvEA6mAENFvIEMKUvm8eQnr9us2JrVuo5td7m/3439EZAjL6eQ7iT3Bf+uk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PD5lrOnii9vK7VDtRSSe2AdQVh47wOyhBqEHbeE7ngQuX3KUP
	z06nUX3BLCSn0EWJa2Dhu8++/KVuKvN6dd6LvsJOERgw1IDVJsiVKjJg
X-Gm-Gg: AYBFou2Vx1tXE1uzp90n6qr4N/OO1C0ZQuHbIDdyPXa9DGAGwcRfHm+8ZstlTWr7NK2
	ZzqvNPyEOwuMyhX/GPxUGsPE5CU9vBDUgZeHCYKhh4cF9BThFleipeuEJSJe6CuNH5EB+zhabb5
	QvD0hdPnREyFMFIJ/tvv2gGbeLAimW7cg8v3azuc8+vDOEOO+EyYU7XyFNN4b7xBgQ2BWP3IkRd
	ssXvQ4aYurT4C8aw2znW3/JbogpdWFsxeuPxzanQUXaYhj/s9wTl009wtYg5bk8WRStBMeKzPFS
	wJuYuYoM/ZCiSc/HrAkdqg+q1ErhUm8I/dLCOjSwP/D/AUXEkmXH6pjEo/SNlgZl5W9204EI780
	HCTlrFJOCDz1VpRXHljIZilzLlh2YJdotbilEnYp96TWjuR/XF1F0vkqaaVtlZgpcS6U4xgRXVL
	LxElHiXVLbdrjWsSZiDrIDwp6uCRFfetaoGm9Pk3qs5qKkSHkjyJOdbQ7N5G1AKBVRhD6LzPszE
	QsBsiRcK1TqpeNGpbSRmM8XEypehsQQ7kCjhMEk5lpGUB+nGbdHBgYzkxjBKXWLbBmr3dsRqyg1
	eZz8ONhCPtw0zdnBR/wSgONWt4fuT4+aQt1J2bIrJJldROaKBGOKo9P82MKfGSgIH6oondO8Psy
	Pk5STw3DiWh3xIojnW0g+Ubh9MPk9JojvpR47sbxJMW4vzqNKjmj2CHUz+q9JtKetRTlnJ1xjEl
	1h/kWI54pKOX4P4jiXkc4BP/nNXcS+XTNJbvCatoDrJ9H7g0/3dwsr
X-Received: by 2002:a05:6808:6d93:b0:571:4e99:7942 with SMTP id 5614622812f47-57a0b65aeb8mr5797462b6e.48.1795223464361;
        Fri, 20 Nov 2026 17:11:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:29 -0700
Subject: [PATCH v11 06/26] mtd: rawnand: sunxi: use page reads to
 reposition small-page NAND
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-6-9721b1905ef4@gmail.com>
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
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev

On a chip with 512-byte pages, an ECC read can fetch bytes from the
wrong column. The driver uses nand_change_read_column_op() to move
between main data and OOB and to reread a possibly erased chunk. That
helper rejects small pages because it uses large-page random-output
commands. Some callers then continue without repositioning the chip.

Use nand_read_page_op() to select the requested small-page column.
The NAND core chooses READ0, READ1 or READOOB and sends the page
address again. Keep the random-column command on larger pages.

Use PIO for full-page ECC reads and writes on small pages: the DMA
sequencer uses large-page random-column commands. Sequential small-page
writes need no change-column command.

This fixes the command sequence for an otherwise supported layout. On
8-bit small-page NAND the factory marker at byte 5 still lies outside
the reserved marker bytes. On 16-bit NAND the core uses byte 0, but
the driver does not program the controller for a 16-bit bus.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260913041642.E28F81F000FF@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 086618dee999..9d7e3e6f22b2 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1028,6 +1028,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
+static int sunxi_nfc_read_column(struct nand_chip *nand, int page,
+				 unsigned int column, void *buf, unsigned int len)
+{
+	/* Small-page NAND needs a new READ0/READ1/READOOB and the page address. */
+	if (nand_to_mtd(nand)->writesize <= 512)
+		return nand_read_page_op(nand, page, column, buf, len);
+
+	return nand_change_read_column_op(nand, column, buf, len, false);
+}
+
 /* Shared across a read's transfers; buf remains the full-page buffer base. */
 struct sunxi_nfc_ecc_read {
 	u8 *buf;
@@ -1111,10 +1121,10 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
 	/* Check the physical representation for bitflips in erased pages. */
 	if (nand->options & NAND_NEED_SCRAMBLING)
-		nand_change_read_column_op(nand, data_off, data, ecc->size, false);
+		sunxi_nfc_read_column(nand, read->page, data_off, data, ecc->size);
 
-	nand_change_read_column_op(nand, nand_to_mtd(nand)->writesize + oob_off,
-				   oob, oob_len, false);
+	sunxi_nfc_read_column(nand, read->page, nand_to_mtd(nand)->writesize + oob_off,
+			      oob, oob_len);
 
 	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
 					  ecc->strength);
@@ -1141,8 +1151,8 @@ static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize))
-		nand_change_read_column_op(nand, mtd->writesize + offset,
-					   NULL, 0, false);
+		sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+				      NULL, 0);
 
 	if (!randomize)
 		sunxi_nfc_read_buf(nand, oob + offset, len);
@@ -1200,11 +1210,12 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		if (read->oob_required) {
 			/* Keep the existing PIO and DMA representations of parity. */
 			if (read->dma) {
-				nand_change_read_column_op(nand, mtd->writesize + oob_off,
-							   oob, ecc->bytes + user_data_sz, false);
+				sunxi_nfc_read_column(nand, read->page,
+						      mtd->writesize + oob_off,
+						      oob, ecc->bytes + user_data_sz);
 			} else {
-				nand_change_read_column_op(nand, mtd->writesize + oob_off,
-							   NULL, 0, false);
+				sunxi_nfc_read_column(nand, read->page,
+						      mtd->writesize + oob_off, NULL, 0);
 				sunxi_nfc_randomizer_read_buf(nand, oob,
 							      ecc->bytes + user_data_sz,
 							      true, read->page);
@@ -1260,12 +1271,12 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	int ret;
 
 	if (*cur_off != data_off)
-		nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 
 	sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
 
 	if (data_off + ecc->size != oob_off)
-		nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
@@ -2105,7 +2116,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);
 
-	if (nfc->dmac || nfc->use_mdma) {
+	/* The DMA page sequencer uses large-page random-column commands. */
+	if (mtd->writesize > 512 && (nfc->dmac || nfc->use_mdma)) {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
 		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma;
 		ecc->write_page = sunxi_nfc_hw_ecc_write_page_dma;

-- 
2.53.0

