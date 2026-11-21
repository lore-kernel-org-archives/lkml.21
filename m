Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223480;
	b=mkPyk6c95fEwd0JyxWfKg2iGEk+KXD/+RZ5HLre6DXp0Urnkpm3LiLj+56D5OaEnwg2M
	 EOYKuV59hsY2QPPQh0WQ48wb/6fj3gL3wHsu6Yxtqp+44Ic8AbbqrMu4S5yvGAtUcs0qV
	 37N5DP4rsPj+lFZbmOShtxXs4xgXivckPtdAVVqWJzvzAo7e0de8uGvcTx1jHpqQBCH4v
	 2kZBMG7c/bBvTRp1HxnNN/l+WniL8ty/HdAhLJ9WXWwxkW3TMuysCUjPLpQzMyLb8jkuu
	 KESpX0csuuOqRgnMS8eOLfJG0MDsoeOZDddSJ1CyzwVj6EjW07gJYBXXingpmwfvMXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=V/ZOEZdBIX9Ht5ZtaAIcNRRvXcoTuAbgmishigtjssc=;
	b=f/6QDqSuP3JuTgMWKYcG2wFMYX37QvEXNI8HXaL4iI5Zm7qPA9jrYKW+Boy4Sdoo7IFV
	 ujYMLoICN3wxmZ+Y9tvvvXbhVu/DQ6dSaXa5H6cDhDVV9PlgJXMScaQRPwYYGl9DYS0BI
	 5yXBxkugS5TEDcwYDWnynursJwoDIXsmm40z9uoIT9eva9mAnhAzPstAxWYkn/qrvawXS
	 WVFfLPhIa0CBSyVUyCJBct2gBSPwXtw+J6T8g7JPtPk8dflOd/LJW6cs6rqCZKyZQJe9G
	 3jKK0h/unEkRtb9Mwp3+AuWNKvIQtx81kHoTMij//PG4uKQBiDMY4VYPcqIBE41dZfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qqXc0xhq;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDDE60A261B
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EDDE60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qqXc0xhq
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-53c156ba662so884517b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223474; x=1795828274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/ZOEZdBIX9Ht5ZtaAIcNRRvXcoTuAbgmishigtjssc=;
        b=qqXc0xhqFvOrz+emUqcN50LcyxA/hdj19c9/d3ED+FnXynpC2MziW3rvSCPpPSdxHz
         jVNAIn3jfcWZl3roiF1TgWJseGquJQX3I5f870z6DJt41sX3SQMa8uysQxD1SQFsEqq4
         DGwv2MqjjNqEgchHT5ArCT8pE/WFrf+grTxlSxcBnwAe4mcyB0ZXs+MrqITvH/oVHrl/
         0Uh2+kO7Urn4H1AcQ0Zp4cmE9CDg0T7bXoLEgSGjUhSD5lnZ1/z8AWX9P4NEIuFiYKfQ
         9JSgMvgICxYJSmnrmxAQtfWYYAonBNe24ynX/Ow8Q3rVplLCDwUVvmfLc9AuCHskBDUF
         idOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223474; x=1795828274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/ZOEZdBIX9Ht5ZtaAIcNRRvXcoTuAbgmishigtjssc=;
        b=fGltLNz8TFJnH5DHw+cj/2roAjXMuFPN19YlcJftlQaXv2kIQZwzjE8yIg2l6ZkM1q
         k6UmoRcGyjw/tStLhLA3HQ+S/2eV2KcvcUurmC2L2hpYPL4rWiTKbPs7nluWbYs2KQxu
         ZyejFcLjZtummzyPNjjaNTVJLmRm8Z23UcQrsqZx+ZubXnAdBjT4ejFdwkcDt1M6vyu/
         mIbC74S52bcz6/MIBSTNARnnLFrVqrjeHUKRMjXDAAiKaB+2mmxOa+rup1iZ73f952Ry
         5AqhrjXReNg3ME68471mo2Ij11g4KnVQl/+wfZoRtt0bUHO6c+gHUTShDIYEKOhrKIRU
         gcdA==
X-Forwarded-Encrypted: i=1; AL+hErGYyUzXOIMDICYDB2DZpmwB2C1laCl8m66xMwyaorvBBLJyFcbor6DZssDH3Naxs/3K5d8bjpxzs6qDOVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8f0Y/m9TcTHkWWAHpwOuOCw4TNN6DXSvM/WKeJDiv8RNCPs0sB
	hhBSitDh4Wsw4O8a8KWYC1Sbt6TL0W2L/aVKoG02X1b71i6gwcxfFcL6
X-Gm-Gg: AYBFou0iygA9rJfr9YR4GBebqZDgsmIbc/7c/VTY2jeT1evkjxbKPchFwJv/LgIHvlI
	1Q4bAaOetSHzEV2+1b/pZGKmIz85TwDWn+s2zUFo+Qrsr2lNxX5NNxtcO/MXMdGPV8uIv8LxNvS
	rlluLHqco3HwU/z33y5C6x2pzFLGxtcJN0OuvDCWetKNQ6eKSzQ2p8ZCgYLpLqP03/u0TQp11aI
	DMZCrFcApHjXyJ8E5Al+P3XxT+w+BnLgVt2DukT+mFAkmXQY7QCLt6QU0LbzWjJ6wL/HSiFLdG/
	klHIH4K7WfHFaXivSZ6yNPbM8fhTLv7Y0QnS1+UEhyFROvbleeRf0NfsyNEoeXR1vgZsPDISZcQ
	3VyD52NpHZpkenNaOZWTn7Jj036osySAQoO1pFRkbYn0JtYgr4+uhP+zKSPNn9QhVFeHG0YDcrL
	+UZawed7DWGomMUe64a32znZP5I5tRI9RIqUHi/FxDM1mSRc9m/zr5Fvo7bhQQzJ0RzEg1rbeTc
	KBYFHER24XPPA2xIU1ukZcK0MkmXwmFURD+q8VhW7GnaZZ30f/gUJc3BrE61fjJDadSXaWuTC7j
	GQNf5aAZ/1F6T+5ZxzGdpVEnP/ULyXEJsPJu7W8eGfKCKLGFiTPOE/zb/CSx4eO1mSXSVWsNg5a
	CxVl8n1TeZ4ALR2Tr4as+HJ5V2noA8RWx4bsTUsR0WHX+e7BipeA8X6iBAXB0+hIiMwEhsfqmpa
	Ngj0NHintI8GcEaaVQDJ0fPnrougOTEE4NAOFATWHSvZ/C3wM08dn5
X-Received: by 2002:a05:6808:130a:b0:573:7a6b:f32c with SMTP id 5614622812f47-57a0c4b923bmr5275123b6e.50.1795223474187;
        Fri, 20 Nov 2026 17:11:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:36 -0700
Subject: [PATCH v11 13/26] mtd: rawnand: sunxi: propagate buffer and column
 transfer errors
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-13-9721b1905ef4@gmail.com>
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

A NAND read can report success with missing bytes or bytes from the
wrong column. A write can send PAGEPROG after transferring only part
of the intended data. The SRAM transfer helpers stop on a FIFO or
completion timeout but return no status, and the hardware-ECC paths
ignore some column-change errors, including when fetching OOB after
DMA.

Return the transfer status through the randomizer and OOB helpers to the
page callbacks. A read with a NULL destination still fills controller
SRAM for ECC and must report errors even though it does not copy to
memory. Disable the randomizer after either transfer outcome, and use
the page callbacks' error exits to disable ECC and skip program-end.
Update a tracked OOB column only after the requested transfer succeeds.

Keep transport status separate from the maximum corrected-bit count:
zero from a successful OOB read must not erase a positive correction
result. If an OOB read after DMA fails, restore that attempt's
corrected/failed counters before the caller retries the page in PIO.
Compare the tracked write column against the absolute column of the
OOB tail. Otherwise a small-page PIO write that has already reached the
right column would now fail on an unnecessary change-column command.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 175 +++++++++++++++++++++++++-------------
 1 file changed, 117 insertions(+), 58 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e76f7cc67081..712648864407 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -663,7 +663,7 @@ static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
 	return min(len, nfc->caps->sram_size);
 }
 
-static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
+static int sunxi_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
@@ -679,7 +679,7 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
-			break;
+			return ret;
 
 		writel(cnt, nfc->regs + NFC_REG_CNT);
 		tmp = NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD;
@@ -691,17 +691,19 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 
 		ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, poll, 0);
 		if (ret)
-			break;
+			return ret;
 
 		if (buf)
 			memcpy_fromio(buf + offs, nfc->regs + NFC_RAM0_BASE,
 				      cnt);
 		offs += cnt;
 	}
+
+	return 0;
 }
 
-static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
-				int len)
+static int sunxi_nfc_write_buf(struct nand_chip *nand, const u8 *buf,
+			       int len)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
@@ -717,7 +719,7 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
-			break;
+			return ret;
 
 		writel(cnt, nfc->regs + NFC_REG_CNT);
 		memcpy_toio(nfc->regs + NFC_RAM0_BASE, buf + offs, cnt);
@@ -731,10 +733,12 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 
 		ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, poll, 0);
 		if (ret)
-			break;
+			return ret;
 
 		offs += cnt;
 	}
+
+	return 0;
 }
 
 /* These seed values have been extracted from Allwinner's BSP */
@@ -884,23 +888,31 @@ static void sunxi_nfc_randomize_bbm(struct nand_chip *nand, int page, u8 *bbm)
 	bbm[1] ^= sunxi_nfc_randomizer_step(state, 8);
 }
 
-static void sunxi_nfc_randomizer_write_buf(struct nand_chip *nand,
-					   const uint8_t *buf, int len,
-					   bool ecc, int page)
+static int sunxi_nfc_randomizer_write_buf(struct nand_chip *nand,
+					  const u8 *buf, int len,
+					  bool ecc, int page)
 {
+	int ret;
+
 	sunxi_nfc_randomizer_config(nand, page, ecc);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_write_buf(nand, buf, len);
+	ret = sunxi_nfc_write_buf(nand, buf, len);
 	sunxi_nfc_randomizer_disable(nand);
+
+	return ret;
 }
 
-static void sunxi_nfc_randomizer_read_buf(struct nand_chip *nand, uint8_t *buf,
-					  int len, bool ecc, int page)
+static int sunxi_nfc_randomizer_read_buf(struct nand_chip *nand, u8 *buf,
+					 int len, bool ecc, int page)
 {
+	int ret;
+
 	sunxi_nfc_randomizer_config(nand, page, ecc);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_read_buf(nand, buf, len);
+	ret = sunxi_nfc_read_buf(nand, buf, len);
 	sunxi_nfc_randomizer_disable(nand);
+
+	return ret;
 }
 
 static void sunxi_nfc_hw_ecc_enable(struct nand_chip *nand)
@@ -1135,31 +1147,39 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	return 0;
 }
 
-static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
-					    u8 *oob, int *cur_off,
-					    bool randomize, int page)
+static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
+					   u8 *oob, int *cur_off,
+					   bool randomize, int page)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int offset = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	int len = mtd->oobsize - offset;
+	int ret;
 
 	if (len <= 0)
-		return;
+		return 0;
 
-	if (!cur_off || *cur_off != (offset + mtd->writesize))
-		sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
-				      NULL, 0);
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
+		if (ret)
+			return ret;
+	}
 
 	if (!randomize)
-		sunxi_nfc_read_buf(nand, oob + offset, len);
+		ret = sunxi_nfc_read_buf(nand, oob + offset, len);
 	else
-		sunxi_nfc_randomizer_read_buf(nand, oob + offset, len,
-					      false, page);
+		ret = sunxi_nfc_randomizer_read_buf(nand, oob + offset, len,
+						    false, page);
+	if (ret)
+		return ret;
 
 	if (cur_off)
 		*cur_off = mtd->oobsize + mtd->writesize;
+
+	return 0;
 }
 
 /* Interpret one PIO step or a completed DMA batch before reusing its status. */
@@ -1212,15 +1232,22 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		if (read->oob_required) {
 			/* Keep the existing PIO and DMA representations of parity. */
 			if (read->dma) {
-				sunxi_nfc_read_column(nand, read->page,
-						      mtd->writesize + oob_off,
-						      oob, ecc->bytes + user_data_sz);
+				ret = sunxi_nfc_read_column(nand, read->page,
+							    mtd->writesize + oob_off,
+							    oob, ecc->bytes + user_data_sz);
+				if (ret)
+					return ret;
 			} else {
-				sunxi_nfc_read_column(nand, read->page,
-						      mtd->writesize + oob_off, NULL, 0);
-				sunxi_nfc_randomizer_read_buf(nand, oob,
-							      ecc->bytes + user_data_sz,
-							      true, read->page);
+				ret = sunxi_nfc_read_column(nand, read->page,
+							    mtd->writesize + oob_off, NULL, 0);
+				if (ret)
+					return ret;
+
+				ret = sunxi_nfc_randomizer_read_buf(nand, oob,
+								    ecc->bytes + user_data_sz,
+								    true, read->page);
+				if (ret)
+					return ret;
 			}
 
 			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !step,
@@ -1251,9 +1278,14 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 static int sunxi_nfc_oob_finish_read(struct nand_chip *nand,
 				     struct sunxi_nfc_ecc_read *read, int *cur_off)
 {
-	if (read->oob_required)
-		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, cur_off,
-						!read->has_erased_chunk, read->page);
+	int ret;
+
+	if (read->oob_required) {
+		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, cur_off,
+						      !read->has_erased_chunk, read->page);
+		if (ret)
+			return ret;
+	}
 
 	return read->max_bitflips;
 }
@@ -1272,13 +1304,21 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	u32 pattern_found;
 	int ret;
 
-	if (*cur_off != data_off)
-		sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
+	if (*cur_off != data_off) {
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
+		if (ret)
+			return ret;
+	}
 
-	sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
+	ret = sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
+	if (ret)
+		return ret;
 
-	if (data_off + ecc->size != oob_off)
-		sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
+	if (data_off + ecc->size != oob_off) {
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
+		if (ret)
+			return ret;
+	}
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
@@ -1401,13 +1441,21 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	/* From the controller point of view, we are at step 0 */
 	const int nfc_step = 0;
 
-	if (data_off != *cur_off)
-		nand_change_write_column_op(nand, data_off, NULL, 0, false);
+	if (data_off != *cur_off) {
+		ret = nand_change_write_column_op(nand, data_off, NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
-	sunxi_nfc_randomizer_write_buf(nand, data, ecc->size, false, page);
+	ret = sunxi_nfc_randomizer_write_buf(nand, data, ecc->size, false, page);
+	if (ret)
+		return ret;
 
-	if (data_off + ecc->size != oob_off)
-		nand_change_write_column_op(nand, oob_off, NULL, 0, false);
+	if (data_off + ecc->size != oob_off) {
+		ret = nand_change_write_column_op(nand, oob_off, NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
@@ -1433,27 +1481,35 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	return 0;
 }
 
-static void sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
-					     u8 *oob, int *cur_off,
-					     int page)
+static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
+					    u8 *oob, int *cur_off,
+					    int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int offset = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	int len = mtd->oobsize - offset;
+	int ret;
 
 	if (len <= 0)
-		return;
+		return 0;
 
-	if (!cur_off || *cur_off != offset)
-		nand_change_write_column_op(nand, offset + mtd->writesize,
-					    NULL, 0, false);
+	if (!cur_off || *cur_off != offset + mtd->writesize) {
+		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
+						  NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
-	sunxi_nfc_randomizer_write_buf(nand, oob + offset, len, false, page);
+	ret = sunxi_nfc_randomizer_write_buf(nand, oob + offset, len, false, page);
+	if (ret)
+		return ret;
 
 	if (cur_off)
 		*cur_off = mtd->oobsize + mtd->writesize;
+
+	return 0;
 }
 
 static int sunxi_nfc_hw_ecc_read_chunks_pio(struct nand_chip *nand, u8 *buf,
@@ -1574,8 +1630,8 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
-		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
-						 &cur_off, page);
+		ret = sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
+						       &cur_off, page);
 
 out:
 	sunxi_nfc_hw_ecc_disable(nand);
@@ -1698,10 +1754,13 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
+	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING)) {
 		/* TODO: use DMA to transfer extra OOB bytes ? */
-		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
-						 NULL, page);
+		ret = sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
+						       NULL, page);
+		if (ret)
+			return ret;
+	}
 
 	return nand_prog_page_end_op(nand);
 

-- 
2.53.0

