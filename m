Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223494;
	b=hoZtnkRjooYGSl53/ehECyzIHQDHrdGKs2hh/hm3z2FDsAF9j3tnLtrLO6wQ4rCWiHVF
	 53UXI3ULdGZYh6TGnH+YoaAJmvY2lSrsvzY8R+LSyCaB0tBtBOnyHzhT44eTobdqtj7tz
	 HORw3ssrkhVOAsb6pRzpBQT+MInw+8vh/T+wEuive/6J5JAe1B9DEYlXMQpyItgo57IOx
	 EtCfTQ72z/Xf3YeyUyy+bfcZWH9TftgMs3alOoScqfwLR8DPqFrEXfHrWAWPV3uffxHjN
	 FwDSh9BUF8BjGmHbJC8kvdOgDiu6Bri/hQZjmAqEnGQAex7qsg9Bsaf9T6JK0VJgd+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=J6dsf3PUVYR2e83j22FZDt4Y383GBQ5T4kYYqbMeWQw=;
	b=VR+o/nmbeU5kU6GI/JQCWdQqYLejc7xkgVP1b6/t5tWHp9kbsOxojl+kqW02f3pJZMqM
	 zVGJM7+HSrMAl6fguHlHfuZVCad891IlAjJSKMFxjN/InhqATC5eS3vyd+v5PBv3Yks/Z
	 HqbgLQeNeUgHZthJMxTFsjGzCCrp+Ek7Xd5tGTbX4xhaM1jQ4o4YhkhvfQqgG/8HGB58+
	 VjmF0XCxHdA+CgdwzkjM6ei1lkIX/xe/98+oy8Blx0t3QICS1+ONzHJXZkeEJQBWQWfoS
	 CsfOZVku1OibcpauXtV8iBcKTSg1YjSy4/m3zEsF0aEJAYDyxtDR2La9rhSwutsyhRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M6GFfhyL;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F01606C504
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40F01606C504
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M6GFfhyL
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4911df1e196so894501fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223491; x=1795828291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6dsf3PUVYR2e83j22FZDt4Y383GBQ5T4kYYqbMeWQw=;
        b=M6GFfhyLFW8DfjOvMdmqy3bxHtPqmLNc1P/sPXfNpid+YMsXYXx2W6kwsHGz/s14bJ
         90m3+0VN453mvcXZZYPC1QM+vvgEmh8iyRS+nyoNlq8V8K2PJlr6NP8/rfrf9wMER4dT
         JOdIV4mMvw2csNul0wmJB05rF+SCskD2TyD6BM8oEiK1+FbNZFvILijq31mrFnl8LqjP
         UAB/4GFznlBBUiVRR/wjFqDvE1G3VoTgtRhAkbtqLZlZbJQtC46cBz8v4EW5JYQlASUb
         IdQAw9YO9XRXsBZ5a6KTQpJU8RMiMGyOrwseXxxOVY+kNb3nApwzhzu+ix59tNTWFOKl
         C0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223491; x=1795828291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6dsf3PUVYR2e83j22FZDt4Y383GBQ5T4kYYqbMeWQw=;
        b=cmJC0CyRGNiccXR1VJaJD3aZAGX5xAY7TcMfLXErTFIRrDxTxuMF3sr9PHcJrT6ihO
         Ub1BATdvzEohotiVZlmEHTvZO/NpqCADVMsf9Kr3pmcWOPfndwjjTqE6N56N5r45nraq
         NK/+kTPqbDHUlOZlq0AA+0TeFdIv/130IzTyW37VKHS2JeujubqQnt19PGGJ5pn8sWhS
         0eJlWv93+s0jz2kepkNtypsqPb2EHMD6MCENigrpe/Dh9RH3sv7a8LiSNvsmpjcVJEBa
         rlpeQlh5uA99mmZpg189eMb67aiNqXfGcThyk7aX82dK9yQk3VuU0z+Nr9WQw/9OM7B3
         ej3w==
X-Forwarded-Encrypted: i=1; AL+hErHrJ+CkpKuHTDmUVCmDQj5CHpvVyzxnZ7Rmv7wrO9wfSyian6Or0s5f+3RD7msZTp0NPi5Bo0PLxq7q2CA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uD4LCNzRNrt7QPPgFHLKnQuwdk9PU1pfAUqXw924HX0Gngpmg
	MaOPCdjR+HksoUtSrgkJYrSkbCcf5RZR0ZpYCKgQ32NnW60GZAW0JMjc
X-Gm-Gg: AYBFou3PPqd8vYho6CCUcOx9lBrEVugO2nr5kyIbQFq1zS3p49jtxhxWykQ/EgYqZD9
	L3r1Jb/WhcHY5tZeJtwcQ2YteBLBC9I74xGlj8aKF3jlN7Qqj8/6EnORW+lZC3cr/Y2bzSu2MIn
	liLKMpgeRZBPmWvfvxc8fNWG2X7RgW9H4XPJ3ewZkK09NCt47yztsUNFOWwDiSloFT1r1rWM9BM
	6DH7XfcU8TAgHL2taJmi/8fknGJRsU6mt1jEBUKfUEbsqu8TEXRf9jGEa5CU7UP78ZJ/gws+0KP
	eQ1dSPwPOASgPC96hkz5NwCx6an2DWi24BjL7bqVqDuaJlt+MbnkaC9Jhr1iY+ABQ6opI16+Ev0
	9MnGEu1JqFhaR4egfnMTvyZ03ghO6IgBm+nUulvnAw1FirrlFTrTqkD1OIMeDj6xlCLsK8vQKgu
	lzdFipfGJNBWZzzk8WODtTkpLRi2Tgdn5qgIMTePa96GgLeMyAhOGA9I7Kiu2jLRHbI/CXAp8Dv
	nxQJbKkdvPoI1qJoNR7RHf5sWM+qZwFOkKzVkOkDvM4JwUsHJlZp/yONPkpH+ghzJ2uZVq6hNac
	UobEP2ed7tT8kfHUJw98ui1RypDnFe7OpgbKjW4/5pFEBLPDMkLYD95f6f4+eusok/Ix/XcXFcD
	Q0IEcJmWmh50rgCjETwYeT3tAVF5FFbQctWdj++D0aCnmsnm7lxWl7yYmPkWFt9f/qsE7N2ZbMD
	pGpctWDooOzOHsLK/ZzQqeVIIzG3IYbPQmcd9hDcT+aOUUI5vzFJaPgNyphDw4DadRPPGk6+3Xc
	g==
X-Received: by 2002:a05:6808:f07:b0:571:846e:6f08 with SMTP id 5614622812f47-57a06c1b05bmr5537864b6e.5.1795223490849;
        Fri, 20 Nov 2026 17:11:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:48 -0700
Subject: [PATCH v11 25/26] mtd: rawnand: sunxi: reuse ECC status within
 each transfer
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-25-9721b1905ef4@gmail.com>
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

The pattern ID register describes all slots in a completed transfer,
but the driver rereads it for each matching step. Four consecutive
hardware slots also share one correction-counter register, which the
driver rereads for each ordinary step in that group.

Take a fresh snapshot for each PIO step or DMA batch. When the
controller places the pattern-found bits in the ECC status register,
use the same read for both. Read the pattern ID at most once per batch
if any slot reports a pattern without an ECC error. Read each packed
counter word only when a slot needs it and reuse it for the other slots
in that group of four. Consume the results before starting the next
ECC transfer.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 87 ++++++++++++++++++++++++++++-----------
 1 file changed, 64 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index a722636f2e15..37f01801cf48 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1166,12 +1166,56 @@ struct sunxi_nfc_ecc_read {
 	bool read_raw_bbm;
 };
 
-static unsigned int sunxi_nfc_hw_ecc_read_count(struct nand_chip *nand, int slot)
+/*
+ * Transfer-local ECC results. Consume the pattern ID and correction counts
+ * before issuing another ECC transfer.
+ */
+struct sunxi_nfc_ecc_snapshot {
+	u32 status;
+	u32 pattern_found;
+	u32 pattern_id;
+	u32 count_reg;
+	u32 count;
+};
+
+static void sunxi_nfc_hw_ecc_read_pattern_id(struct nand_chip *nand,
+					     struct sunxi_nfc_ecc_snapshot *snapshot)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+
+	snapshot->pattern_id = readl(nfc->regs + NFC_REG_PAT_ID(nfc));
+}
+
+static void sunxi_nfc_hw_ecc_read_status(struct nand_chip *nand,
+					 struct sunxi_nfc_ecc_snapshot *snapshot)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	u32 pattern_found;
+
+	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
+	snapshot->pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	if (nfc->caps->reg_pat_found == NFC_REG_ECC_ST)
+		snapshot->status = pattern_found;
+	else
+		snapshot->status = readl(nfc->regs + NFC_REG_ECC_ST);
+	/* A new operation, including every PIO step, invalidates the count word. */
+	snapshot->count_reg = ~0U;
+}
+
+static unsigned int
+sunxi_nfc_hw_ecc_read_count(struct nand_chip *nand,
+			    struct sunxi_nfc_ecc_snapshot *snapshot, int slot)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	u32 count = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, slot));
+	u32 reg = NFC_REG_ECC_ERR_CNT(nfc, slot);
 
-	return NFC_ECC_ERR_CNT(slot, count);
+	/* Four consecutive DMA steps share one error-counter register. */
+	if (snapshot->count_reg != reg) {
+		snapshot->count = readl(nfc->regs + reg);
+		snapshot->count_reg = reg;
+	}
+
+	return NFC_ECC_ERR_CNT(slot, snapshot->count);
 }
 
 /*
@@ -1275,7 +1319,7 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 /* Interpret one PIO step or a completed DMA batch before reusing its status. */
 static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 				    struct sunxi_nfc_ecc_read *read,
-				    u32 status, u32 pattern_found,
+				    struct sunxi_nfc_ecc_snapshot *snapshot,
 				    int first_step, int nsteps)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -1286,6 +1330,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 	unsigned int reg_index = 0, user_data_sz;
 	int slot, ret;
 
+	if (snapshot->pattern_found & ~snapshot->status)
+		sunxi_nfc_hw_ecc_read_pattern_id(nand, snapshot);
+
 	for (slot = 0; slot < nsteps; slot++, reg_index += user_data_sz / 4) {
 		int step = first_step + slot;
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, step);
@@ -1297,16 +1344,15 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		if (step < read->first_req_step)
 			continue;
 
-		if (status & NFC_ECC_ERR(slot)) {
+		if (snapshot->status & NFC_ECC_ERR(slot)) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
 				memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
 			continue;
 		}
 
-		if (pattern_found & BIT(slot)) {
-			u32 pattern_id = readl(nfc->regs + NFC_REG_PAT_ID(nfc));
-			u8 pattern = pattern_id & BIT(slot) ? 0xff : 0;
+		if (snapshot->pattern_found & BIT(slot)) {
+			u8 pattern = snapshot->pattern_id & BIT(slot) ? 0xff : 0;
 
 			if (!read->dma || randomized)
 				memset(data, pattern, ecc->size);
@@ -1320,7 +1366,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 			continue;
 		}
 
-		bitflips = sunxi_nfc_hw_ecc_read_count(nand, slot);
+		bitflips = sunxi_nfc_hw_ecc_read_count(nand, snapshot, slot);
 
 		if (!read->dma)
 			memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
@@ -1353,14 +1399,14 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		sunxi_nfc_hw_ecc_update_stats(nand, &read->max_bitflips, bitflips);
 	}
 
-	if (!(status & NFC_ECC_ERR_MSK(nfc)))
+	if (!(snapshot->status & NFC_ECC_ERR_MSK(nfc)))
 		return 0;
 
 	/* Finish consuming the batch's corrected OOB before raw error rereads. */
 	for (slot = 0; slot < nsteps; slot++) {
 		int step = first_step + slot;
 
-		if (step < read->first_req_step || !(status & NFC_ECC_ERR(slot)))
+		if (step < read->first_req_step || !(snapshot->status & NFC_ECC_ERR(slot)))
 			continue;
 
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read, step);
@@ -1402,10 +1448,10 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	int data_off = step * ecc->size;
 	int oob_off = nand_to_mtd(nand)->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, step);
 	int page = read->page;
-	u32 pattern_found;
 	int ret;
 
 	if (*cur_off != data_off) {
@@ -1441,12 +1487,9 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	*cur_off = oob_off + ecc->bytes + user_data_sz;
 
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
-	return sunxi_nfc_oob_read_batch(nand, read,
-					readl(nfc->regs + NFC_REG_ECC_ST),
-					pattern_found, step, 1);
+	return sunxi_nfc_oob_read_batch(nand, read, &snapshot, step, 1);
 }
 
 static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
@@ -1457,10 +1500,11 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	struct scatterlist sg;
 	int page = read->page;
 	int ret, i;
-	u32 status, pattern_found, wait;
+	u32 wait;
 
 	if (first_step) {
 		ret = sunxi_nfc_read_column(nand, page, first_step * ecc->size,
@@ -1522,12 +1566,9 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	status = readl(nfc->regs + NFC_REG_ECC_ST);
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
-	return sunxi_nfc_oob_read_batch(nand, read, status, pattern_found,
-					first_step, nchunks);
+	return sunxi_nfc_oob_read_batch(nand, read, &snapshot, first_step, nchunks);
 }
 
 static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,

-- 
2.53.0

