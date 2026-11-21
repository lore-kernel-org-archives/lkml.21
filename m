Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223489;
	b=xKLBbpy5mEaZdCsmk050F33AxN+eFHVazxUY3DuwGbVjwMjVwlVs2/mqtNj1ZKNPVdsw
	 bmBPSaS0BpKElLQuihvIMY8Dcq12URoZThMsx4n5WJBTN/ztQqcRg9csSswBBDtR1trLL
	 wQMoJlQy1QpN7yfH7ZZ3G3lINxqHOBDJgo6QWyKqYIidCPYMEtbuc2fh3lz/XaBwv+2/8
	 GwE4j6DxA1TC32QqLgRtvUWb8h0ae0uYOlbTkQjxG03cWx0eATho3fDeI4MItqSkrux6h
	 DalbYZOK7xCGO1qdKHd2d/IErkE0AP8SECcwC6vL/2nvry94eMBTIEzqZ3cJB/sFJjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nC4NCaRVx/W369O2JGd3M3QVKSAL0tyZU8r4HK4S9iE=;
	b=rDfANh+aWgVczFtOfU4Q1eVhak2faerSmsly9Ns3r8KI2AfRV4Mq8nDe7k0TWbwOty9v
	 Aen+JKP23QbIgBXaZBuCEz1COjHCv3+IYGf0PRVlxVtt1wJmu1ehDFjvJ8ddzo/F7sWfn
	 LqB0ax0Dd2L5FdLzFsuzYoNxH49O9o5wUKIrVWXT9y0QM7UPZg1l++RUldqIx4NVJmkA3
	 nCPDQX+O9Sdc9kan2A1hCuDKtFAqtwcI+B2vV23hBHTq1/046P2Ax2EkD4pevo+RckIHg
	 Ybu8x1N9SbJD1B5jk9gOt1DpWNo4OQ4oNpgj621qYU191D404RCpHE2YN3Z1u6bUmAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=keaVGA8N;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4234560A5BD7
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4234560A5BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=keaVGA8N
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f84a55e31aso1013448a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223477; x=1795828277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nC4NCaRVx/W369O2JGd3M3QVKSAL0tyZU8r4HK4S9iE=;
        b=keaVGA8NABBtcCp9nGEza/T+C53VRHAm0qC1bd7ULSYtCrkZ9iU+I6Z6u9+cAp5dPJ
         tzQGHnIfeGSSYwAJ9WZivNCKW12ONd0Y29AN11PAXretiqFKiKHzNVvo9w5051cIHQlm
         3KPQN8nQpiG2MRxXfWKNo7IOGeJSWYvzo0qVHt2Y9IKWNvTI8uh2goiN8N19zutwOj1a
         GBf662CdXj7Hv+kV+1wFn4GN0Ucn8G6GrtY8qUSlo9N+SDRMINI00ZWtbn3rZxhIv94y
         GHJb1VFXagXl9OdPtKIOWbVi8yGLkUxTJL6ricHTYurBzr5upzJNTDXe61Z//qJx+R6L
         6Q4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223477; x=1795828277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nC4NCaRVx/W369O2JGd3M3QVKSAL0tyZU8r4HK4S9iE=;
        b=EUuThcMAUe915yBC79neO3adPWRFtWpkauXOj8t5ZOrWrz3BVlZP/aKU5WVS8iQHoJ
         ChU0goVVKnOTJ7d+JzVVA18+eNpzSE1xJeZm4oTMpMnOY4HHH49nPYW3q3Jy2TM2FHXH
         6cnaLkFxsFrKu9SeHOUvYHefzXflXTLhxoVQev4s9QgZonmBiDpiWzFmijv9E6e0FStx
         aopt0EXGmMaDjhRd0S0fXzDrqRK7SloYYRBUu9uCS2yU+46WvNZFZsDLI7KfeNU878TB
         L9AWsRPOwEBOk9H3QK7DaooIHgtpoXLzvqCeagVfwzR+0j1tfv0lvbQCaGVwDRS2qEgp
         pMcw==
X-Forwarded-Encrypted: i=1; AL+hErGFJwoIn+gKlxh/t6ct0HvtO10hX+9n9MB47RGEvlXMlfpmjlUdeRACjEkVxsfjrMmcnbPYzMmneaNqopc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nAWBslF1UoYOz2FQ0X4nc+gAHgEQp7yX5q2wudni+W4ioOFs0
	cLzCgxqQBCYGCEUT2ZB2VqR1xTHxOsepqNri1E7NxkVOiywjPZPj6P9V
X-Gm-Gg: AZFdTZc8q9JW2VWH05aIeRF/opq/YgqUgqnRUd5RSgDBczOWVqnR2Ke1uGOUQVSpsST
	wTKc2eMUmhrd9ZXo2yr8s8wnUicBExWIBthZJeEt34570B8/yYjIultDUNvU7u+EVNb3EhTeTym
	9gDME0Id1YLVfy0B0JMvEpe4dW8fAJqBwBgSXNRlAALT2ATNPnxA9AmEb4IdtMAtZT8kHRcRjsH
	0/baeUecPyrpP5LYYcdJmW7aRuKBy6aVJGPnrSmnzu4yE1okbmyzvkF14fNr+A/sI64xTH2TuEs
	Rvt0/WJ564ggcrmRSBYmZpx2slcFuTT9l0e64vT4as1Noc9HtsZxHCEHt1/pzZecD/wEzblGbl9
	Fgq8bY0Sed/oHBkU9tEg3lYMub0lu7NJ9xlRLQ6DjERvT9JMzEwemtxgdHL9kQVIXXP1OOScizJ
	0bekVhVz7r6YGoeiHsiVgO52sOYykKBDFkDQK5eKOtDWDIsvjIQDIgTaN/ZJBtRVzFnFcOWBSc1
	bNcgQMRRnoi/fhzCjqcKMKxFLSWtFKeq1mDHwcLtERdUlBEKLS2LMba10TiWjknHxQxA0X87pnw
	H2WwTuRDJTXITca+PQfLfZP/83gneahcyxWXSXFIZDD+sLPOAGVY1bAA6zJFYyMfA92Wi4OlzNf
	zMENj1Ogn+LLg9UvCsY2e1APRpsV7JfXYqb5AjBuEhb+GkdoQYcu+9akWuukvKFmIcnfTkMA2Q2
	ZKcFUsp7Qyg/DydSlmBLopJY1b0jTM4kLXrwkkLJAAW5P0lWFGHiBh
X-Received: by 2002:a05:6808:2384:b0:539:ad19:d0ca with SMTP id 5614622812f47-57a0ba5523emr5887168b6e.39.1795223477137;
        Fri, 20 Nov 2026 17:11:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:38 -0700
Subject: [PATCH v11 15/26] mtd: rawnand: sunxi: bound DMA batches by the
 user-data register bank
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-15-9721b1905ef4@gmail.com>
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

A whole-page DMA transfer on H6/H616 can run past the 128-byte bank of
registers holding ECC-protected OOB data. For example, a 16 KiB page
with BCH40/1024 and 1280 OOB bytes uses 160 bytes of protected data. A
page with 1664 OOB bytes uses 512. The on-flash layout allows up to 32
protected bytes per ECC step, but the register bank is shared by all
steps in one DMA transfer.

PIO can handle these layouts because it reuses register zero for each
step. Capping the page's allocation would instead move parity offsets on
flash and break compatibility with pages written through PIO. Split DMA
transfers without changing that allocation or the logical main-data and
OOB offsets.

Fill the first batch up to the 128-byte limit. Transfer each remaining
step in a separate batch, using hardware slot and user-data register
zero after explicitly selecting its main column and spare-area base.
PAGE_OP generates later main-data columns from hardware slot numbers,
not relative to the selected initial column. A multi-slot batch starting
partway through a page would therefore revisit an earlier column.
Single-slot later batches avoid those generated column changes. Pages
that already fit keep one DMA batch.

Program length fields from the batch's logical starting step, and
consume its protected OOB and ECC status before reusing the registers.
Keep erased state, correction counts and trailing OOB handling
page-wide. On a failed DMA read, discard all partial statistics before
the existing PIO retry.

Use one page-read setup or program-begin for the whole page, and send
program-end only after every batch and any trailing OOB succeed. A write
may fall back to PIO only if DMA preparation fails before its first
batch; never retry a write after part of the page has been transferred.
Raw access and the OOB layout reported to MTD remain unchanged.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260909085138.9A98A1F00A3D@smtp.kernel.org
Closes: https://lore.kernel.org/r/20260914031929.2E7091F000FF@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 201 ++++++++++++++++++++++++++------------
 1 file changed, 138 insertions(+), 63 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 7f9bc0237cea..7f93ce226f24 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -54,6 +54,7 @@
 #define NFC_REG_H6_RDATA_1	0x004C
 #define NFC_REG_A10_USER_DATA	0x0050
 #define NFC_REG_H6_USER_DATA	0x0080
+#define NFC_H6_USER_DATA_REGS	32
 #define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
 #define NFC_REG_H6_USER_DATA_LEN 0x0070
 /* A USER_DATA_LEN register can hold the length of 8 USER_DATA registers */
@@ -960,7 +961,36 @@ static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand, int step)
 	       sunxi_nfc_user_data_before(sunxi_nand, step);
 }
 
-/* PIO uses register zero; DMA concatenates user data within each transfer. */
+/* Keep the on-flash layout, but fit each DMA batch in the user-data bank. */
+static int sunxi_nfc_dma_batch_steps(struct nand_chip *nand,
+				     int first_step, int end_step)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	unsigned int user_data_sz = 0;
+	int i;
+
+	if (!nfc->caps->reg_user_data_len)
+		return end_step - first_step;
+
+	/*
+	 * PAGE_OP generates main-data columns from hardware slot zero, not
+	 * from the initial column. Use only slot zero after the first batch,
+	 * so the explicit column change selects each remaining logical step.
+	 */
+	if (first_step)
+		return 1;
+
+	for (i = first_step; i < end_step; i++) {
+		user_data_sz += sunxi_nfc_user_data_sz(sunxi_nand, i);
+		if (user_data_sz > NFC_H6_USER_DATA_REGS * sizeof(u32))
+			break;
+	}
+
+	return i - first_step;
+}
+
+/* PIO uses register zero; DMA concatenates user data within each batch. */
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 						unsigned int reg_index, bool bbm, int page,
 						unsigned int user_data_sz)
@@ -1345,30 +1375,32 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 					pattern_found, step, 1);
 }
 
-static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
-					    int oob_required, int page, int nchunks)
+static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
+					   struct sunxi_nfc_ecc_read *read,
+					   int first_step, int nchunks)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	struct sunxi_nfc_ecc_read read = {
-		.buf = buf,
-		.page = page,
-		.oob_required = oob_required,
-		.dma = true,
-	};
-	unsigned int corrected = mtd->ecc_stats.corrected;
-	unsigned int failed = mtd->ecc_stats.failed;
 	struct scatterlist sg;
+	int page = read->page;
 	int ret, i;
 	u32 status, pattern_found, wait;
 
+	if (first_step) {
+		ret = sunxi_nfc_read_column(nand, page, first_step * ecc->size,
+					    NULL, 0);
+		if (ret)
+			return ret;
+	}
+
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
 		return ret;
 
-	ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, nchunks,
+	ret = sunxi_nfc_dma_op_prepare(nfc, read->buf + first_step * ecc->size,
+				       ecc->size, nchunks,
 				       DMA_FROM_DEVICE, &sg);
 	if (ret)
 		return ret;
@@ -1376,7 +1408,12 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	sunxi_nfc_hw_ecc_enable(nand);
 	sunxi_nfc_reset_user_data_len(nfc);
 	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc, sunxi_nfc_user_data_sz(sunxi_nand, i), i);
+		sunxi_nfc_set_user_data_len(nfc,
+					    sunxi_nfc_user_data_sz(sunxi_nand, first_step + i), i);
+	/* exec_op() restores the page's spare base during column changes. */
+	if (first_step)
+		writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
+		       nfc->regs + NFC_REG_SPARE_AREA(nfc));
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 
@@ -1408,10 +1445,31 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	status = readl(nfc->regs + NFC_REG_ECC_ST);
 	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
 	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
-	ret = sunxi_nfc_oob_read_batch(nand, &read, status, pattern_found,
-				       0, nchunks);
-	if (ret)
-		goto err_stats;
+
+	return sunxi_nfc_oob_read_batch(nand, read, status, pattern_found,
+					first_step, nchunks);
+}
+
+static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
+					    int oob_required, int page, int nchunks)
+{
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	struct sunxi_nfc_ecc_read read = {
+		.buf = buf,
+		.page = page,
+		.oob_required = oob_required,
+		.dma = true,
+	};
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
+	int first_step, batch_steps, ret;
+
+	for (first_step = 0; first_step < nchunks; first_step += batch_steps) {
+		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, nchunks);
+		ret = sunxi_nfc_hw_ecc_read_batch_dma(nand, &read, first_step, batch_steps);
+		if (ret)
+			goto err_stats;
+	}
 
 	ret = sunxi_nfc_oob_finish_read(nand, &read, NULL);
 	if (ret < 0)
@@ -1688,71 +1746,88 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct scatterlist sg;
-	unsigned int reg_index = 0;
 	u32 wait;
-	int ret, i;
+	int first_step, batch_steps, ret, i;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
-	if (ret)
-		return ret;
+	for (first_step = 0; first_step < ecc->steps; first_step += batch_steps) {
+		unsigned int reg_index = 0;
 
-	ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, ecc->steps,
-				       DMA_TO_DEVICE, &sg);
-	if (ret)
-		goto pio_fallback;
+		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, ecc->steps);
+		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
+		if (ret)
+			return ret;
 
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < ecc->steps; i++) {
-		unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
-		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
-		const u8 *oob = nand->oob_poi + oob_off;
+		ret = sunxi_nfc_dma_op_prepare(nfc, buf + first_step * ecc->size,
+					       ecc->size, batch_steps, DMA_TO_DEVICE, &sg);
+		if (ret) {
+			/* Only retry before any part of the page has been transferred. */
+			if (first_step)
+				return ret;
+			goto pio_fallback;
+		}
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i, page,
-						    user_data_sz);
-		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
-		reg_index += user_data_sz / 4;
-	}
+		sunxi_nfc_reset_user_data_len(nfc);
+		for (i = first_step; i < first_step + batch_steps; i++) {
+			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
+			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
+			const u8 *oob = nand->oob_poi + oob_off;
 
-	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
-	if (ret) {
-		sunxi_nfc_dma_op_abort(nfc);
-		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
-		return ret;
-	}
+			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
+							    page, user_data_sz);
+			sunxi_nfc_set_user_data_len(nfc, user_data_sz, i - first_step);
+			reg_index += user_data_sz / 4;
+		}
 
-	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_randomizer_config(nand, page, false);
-	sunxi_nfc_randomizer_enable(nand);
+		if (first_step)
+			ret = nand_change_write_column_op(nand, first_step * ecc->size,
+							  NULL, 0, false);
+		else
+			ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+		if (ret) {
+			sunxi_nfc_dma_op_abort(nfc);
+			sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+			return ret;
+		}
 
-	writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG,
-	       nfc->regs + NFC_REG_WCMD_SET);
+		/* exec_op() restores the page's spare base during column changes. */
+		if (first_step)
+			writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
+			       nfc->regs + NFC_REG_SPARE_AREA(nfc));
+		sunxi_nfc_hw_ecc_enable(nand);
+		sunxi_nfc_randomizer_config(nand, page, false);
+		sunxi_nfc_randomizer_enable(nand);
 
-	wait = NFC_CMD_INT_FLAG;
+		writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG,
+		       nfc->regs + NFC_REG_WCMD_SET);
 
-	if (nfc->use_mdma)
-		wait |= NFC_DMA_INT_FLAG;
-	else
-		dma_async_issue_pending(nfc->dmac);
+		wait = NFC_CMD_INT_FLAG;
 
-	writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
-	       NFC_DATA_TRANS | NFC_ACCESS_DIR,
-	       nfc->regs + NFC_REG_CMD);
+		if (nfc->use_mdma)
+			wait |= NFC_DMA_INT_FLAG;
+		else
+			dma_async_issue_pending(nfc->dmac);
 
-	ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
-	if (ret)
-		sunxi_nfc_dma_op_abort(nfc);
+		writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
+		       NFC_DATA_TRANS | NFC_ACCESS_DIR,
+		       nfc->regs + NFC_REG_CMD);
 
-	sunxi_nfc_randomizer_disable(nand);
-	sunxi_nfc_hw_ecc_disable(nand);
+		ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
+		if (ret)
+			sunxi_nfc_dma_op_abort(nfc);
 
-	sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+		sunxi_nfc_randomizer_disable(nand);
+		sunxi_nfc_hw_ecc_disable(nand);
 
-	if (ret)
-		return ret;
+		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+
+		if (ret)
+			return ret;
+	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING)) {
 		/* TODO: use DMA to transfer extra OOB bytes ? */

-- 
2.53.0

