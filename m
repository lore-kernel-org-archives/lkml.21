Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223463;
	b=bMG78xg76O2Hf4KSCsp8gQvCVNJNEYjMZjkpukRmw5R9Pnl8xLtBZzUIfeeVHtUuGO9x
	 eaL52NEnZ0c+A5UJ93IFtmjGYpvHGz6OFYaeLXMvFRQ5kgYNtS5jliEd2qBBLJRgy/VkM
	 s1jCtb/Zqmbca2jGOrsH+GT5AAuUIkEoAUMZcUDmQIqZ4p1mySwmkgM3r6a+QAIJ/7kKg
	 jHPLpDt688E81WPXlvtX6aVoJSKYQ3hGhteSNNvU4n5sJ3JWjLogBCtqQWjT+dZpxfkqh
	 SVL2GSjySrEoODln+yjqiZF26UyBBPQi7b8MHe7+AXNssfaAFNTzV13VOUpHZyuYTHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8/B8gGukZxMNCk9kG+bQ03cwup62u0VomkG0JFdqRS0=;
	b=rOtABuNxzJDkYAmuJFn9onXlXtrE06ghy5ybb0+S9u5R7fAXOXAPnbzyyNoJWqMEwr9x
	 7hXbn0wfG4OZ1fGXbpXOs0OxgtQIBAOJoGvJSD5TRd2PEZQYtcsfvUZLaKDa6tzPedA0a
	 XpuO8Nd4BST7hT2EN3Tg7bZRFl5KFz4DkUdzkaCrxxtMY9MT/tzNCputoZpnOpekwkGwy
	 aCEMfnjqKYDButD+vGc7ptz2pO6GzDszXNM6Dxlnci4KrYusgoFy5kGjmiAHNRDv4xUIH
	 I7P8y9x6Rj/4+3Fa5T3OibhNLz5tVElkcryAZFFOTp5aG9LvTn5NCkuhxE+C5BFtOGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K7j+Md8W;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D052606A6A6
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D052606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K7j+Md8W
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4c5d8c7f326so664140b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223458; x=1795828258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/B8gGukZxMNCk9kG+bQ03cwup62u0VomkG0JFdqRS0=;
        b=K7j+Md8WLnplGjt6beXjGVW9VOqJhKWkWJOP1SRinco7njvxpt+4bOj/7Qe0CanTp6
         /mvzZbjqB6d2/hxrdzCtDWJpCY+jxdOd5D1wZF1qX4tN5uOMiJhbPM4204A/f2KPHeft
         rqlAvtjnu+6/RsgbhZr0ilISjbAPloolZAmRem3PvmdBUPTViloSFUoudmTny65hwOfi
         F6HJz5vymHu5aYPhiNgtXlajzMzVHedo/Ixc/WOjBk1iTzxWVd+MgrFNmU68ZVd68yl2
         +CBr9h7PR+1h9Rq/AnFFrHc49XRLG6D5u7HbewktevDpbhqCzJOFMXkaw7aax7OEUwTj
         1zXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223458; x=1795828258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/B8gGukZxMNCk9kG+bQ03cwup62u0VomkG0JFdqRS0=;
        b=ufG3+5aOsTdLi6WoDLqegKTPNHbux8ieAyrmixsCkvnMWEgePK4Og4mxklieBqvfGi
         FeGiYINe3ViSZ4QJxfPTHuPHFfe/HV0ZoHq/iPcwsZUAIkaV2AnVNGoRP1JKYNijJSxg
         ZZxrCft92Ua2Bces/AFATIgucoP5yFwIPM7MMv1G9mfY17Hi3uKmkXGqhC8hB5bw5jWj
         ucnDluZfDIM9h99/Te3ZgRXO6sSdxNvQnJfA+VmKj77JQrOSitvldlmZP99ZNFjvn6Q2
         J/YlV0IIn/hLb+8hHVvcLwgd+OdSxRKrHHUo9TZS7Wp0Na6NADC24uk0VUX4nmRlSOGu
         dv/A==
X-Forwarded-Encrypted: i=1; AL+hErFnq7HkynbdGmkZyQHwRxUo12X4J3c15K9n44mM2eZXX6K09bhKrpbF/oiI1Yd4fP+fP38dV9y/XHh/5iE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tne1zDpw1Aq5Cu9xSXp/s473DWH2yX0ZBCBBn+61snixXfLQJ
	fz8BDYCfH6dfJvGwRQct5XGuVdx8Jy09qwkPYd36eMOlUE2qD8FmTOMf
X-Gm-Gg: AYBFou35uHHlvLtXalqL1eT9AxGTc8mEyscre33NJQKi+uIf4mrYAAwwvjg6Wk5p3qg
	8URDItYYW+1qY3sZAI6hz3A6I4HThKvimN96Z9lO1JHebzNERnAiImmRWe3sVBv0LgYrYZAXqgX
	8YKN6BU+ZW4mMVy4meU4G9dIDN3eRpBAv3MAjQMUVXaJQzBlZBUDzNFy9d3/jRhNe9LSk1T/YBT
	St+0coYHIzhsU56Szpkg9Tq68YRRAjqNq6bvamtb2YrQO1lEUouL6oZOLY3XxO6Hxuo0iS8wW8u
	hnVxIMerW35pTogdqGIiey/EbZXwJwW8mdiKhlvrFpjRNZG6DHTSlwEHqlJD5zga6pEPaJ+Aacs
	fg5mLskMZs7zPN21ce61NqWOhjmDES8C2ykL2hTUPTusMmyn/37kUsgGHiJf5v7ghn6leJRfa+O
	5yx7R/v0orLc6oUsGOEamEaaCk/NxfmTZ4FTz2MlMr1K6EOcDR4jtXeqOWtwao+CXfEgOi9Nz2Q
	zucgQeSBwnhMtqEOSlgbvrNppYpOPCs0Yr46qdMUGHn/FZ64w4/KxjsPdIUIDGX2UO3m7qy3POe
	lX9ximTm0HNNEDxrXfx784hLRVwhAZ8M3EJlyt87/TnlH8W3q9raHCLyFERBArNg9P2eRFMKa8I
	5eROzTPnWSnA82pWbe+WiCk7g5H2t58/PcojgFYS9GjPjXOgsYAj9cb/+jK92kqDbTyCw5K6Fe3
	TQDpi/+ZI6UotH1lsMqSZLQ3T4fAn0fhtlDLCtE+cARiog7ybC+rAl84KL24/FirOEv8xDtd5T8
	w==
X-Received: by 2002:a05:6808:4f46:b0:4d6:90f3:74b2 with SMTP id 5614622812f47-57a0bb54161mr6128010b6e.50.1795223458025;
        Fri, 20 Nov 2026 17:10:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:10:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:25 -0700
Subject: [PATCH v11 02/26] mtd: rawnand: sunxi: compute protected OOB
 offsets from page geometry
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-2-9721b1905ef4@gmail.com>
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

PIO and DMA need the OOB offset of each ECC step. The driver finds it
by summing the protected lengths of all preceding steps, repeating the
same walk across a page. On H616 it also allocates a length array when
the chip is attached, although its entries follow a fixed rule.

On A10 and A23 each step has four protected bytes. Keep that rule
independent of the step count chosen at attach: the NAND core can fall
back to software ECC with a different geometry.

H616 assigns the available space to the earliest steps first, in
four-byte units up to 32 bytes per step. Store the total and the
per-step limit. The number of protected bytes before a given step is
then its index times the limit, capped at the page total. This gives
both the OOB and parity offsets without walking an array or allocating
memory at attach. Use the same four-byte encoding to program the
controller's length fields. The ECC strength and on-flash offsets do
not change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 132 ++++++++++++++------------------------
 1 file changed, 49 insertions(+), 83 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index c6001349266f..f57184927fe9 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -267,7 +267,8 @@ struct sunxi_nfc_timings {
  * @timing_ctl: TIMING_CTL register value for this NAND chip
  * @nsels: number of CS lines required by the NAND chip
  * @sels: array of CS lines descriptions
- * @user_data_bytes: array of user data lengths for all ECC steps
+ * @user_data_total: protected user bytes in a programmable layout
+ * @user_data_step: maximum bytes assigned to each step, zero for a fixed layout
  */
 struct sunxi_nand_chip {
 	struct list_head node;
@@ -276,7 +277,8 @@ struct sunxi_nand_chip {
 	unsigned long clk_rate;
 	u32 timing_cfg;
 	u32 timing_ctl;
-	u8 *user_data_bytes;
+	u16 user_data_total;
+	u8 user_data_step;
 	int nsels;
 	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
 };
@@ -327,11 +329,7 @@ struct sunxi_nfc_user_data_layout {
  * @nstrengths:		Size of @ecc_strengths
  * @max_ecc_steps:	Maximum supported steps for ECC, this is also the
  *			number of user data registers
- * @user_data_len_tab:  Table of lengths supported by USER_DATA_LEN register
- *			The table index is the value to set in NFC_USER_DATA_LEN
- *			registers, and the corresponding value is the number of
- *			bytes to write
- * @nuser_data_tab:	Size of @user_data_len_tab
+ * @max_user_data_len:	Maximum programmable user-data bytes per ECC step
  * @sram_size:		Size of the NAND controller SRAM
  * @timings:		Controller timing characteristics
  */
@@ -357,8 +355,7 @@ struct sunxi_nfc_caps {
 	unsigned int dma_maxburst;
 	const u8 *ecc_strengths;
 	unsigned int nstrengths;
-	const u8 *user_data_len_tab;
-	unsigned int nuser_data_tab;
+	unsigned int max_user_data_len;
 	unsigned int max_ecc_steps;
 	int sram_size;
 	const struct sunxi_nfc_timings *timings;
@@ -911,12 +908,21 @@ static inline u32 sunxi_nfc_buf_to_user_data(const u8 *buf)
 	return buf[0] | (buf[1] << 8) | (buf[2] << 16) | (buf[3] << 24);
 }
 
-static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand, int step)
+/* Earlier ECC steps take their full share before later steps use any bytes. */
+static unsigned int sunxi_nfc_user_data_before(struct sunxi_nand_chip *sunxi_nand,
+					       unsigned int step)
 {
-	if (!sunxi_nand->user_data_bytes)
-		return USER_DATA_SZ;
+	if (!sunxi_nand->user_data_step)
+		return step * USER_DATA_SZ;
+
+	return min_t(unsigned int, step * sunxi_nand->user_data_step,
+		     sunxi_nand->user_data_total);
+}
 
-	return sunxi_nand->user_data_bytes[step];
+static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand, int step)
+{
+	return sunxi_nfc_user_data_before(sunxi_nand, step + 1) -
+	       sunxi_nfc_user_data_before(sunxi_nand, step);
 }
 
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
@@ -977,34 +983,35 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 		writel(0, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, i));
 }
 
+static int sunxi_nfc_user_data_len_code(struct sunxi_nfc *nfc, int len)
+{
+	/* Each code counts four-byte words; larger codes are reserved. */
+	if (len < 0 || len > nfc->caps->max_user_data_len || !IS_ALIGNED(len, USER_DATA_SZ)) {
+		dev_warn(nfc->dev, "Unsupported length for user data reg: %d\n", len);
+		return -EINVAL;
+	}
+
+	return len / USER_DATA_SZ;
+}
+
 static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 					int len, int step)
 {
-	bool found = false;
 	u32 val;
-	int i;
+	int code;
 
 	/* not all SoCs have this register */
 	if (!nfc->caps->reg_user_data_len)
 		return;
 
-	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
-		if (len == nfc->caps->user_data_len_tab[i]) {
-			found = true;
-			break;
-		}
-	}
-
-	if (!found) {
-		dev_warn(nfc->dev,
-			 "Unsupported length for user data reg: %d\n", len);
+	code = sunxi_nfc_user_data_len_code(nfc, len);
+	if (code < 0)
 		return;
-	}
 
 	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
 
 	val &= ~NFC_USER_DATA_LEN_MSK(step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(step), i);
+	val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
 	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
 }
 
@@ -1204,13 +1211,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 static int sunxi_get_oob_offset(struct sunxi_nand_chip *sunxi_nand,
 				struct nand_ecc_ctrl *ecc, int step)
 {
-	int ecc_off = step * ecc->bytes;
-	int i;
-
-	for (i = 0; i < step; i++)
-		ecc_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-	return ecc_off;
+	return step * ecc->bytes + sunxi_nfc_user_data_before(sunxi_nand, step);
 }
 
 /*
@@ -1221,8 +1222,7 @@ static int sunxi_get_oob_offset(struct sunxi_nand_chip *sunxi_nand,
 static int sunxi_get_ecc_offset(struct sunxi_nand_chip *sunxi_nand,
 				struct nand_ecc_ctrl *ecc, int step)
 {
-	return sunxi_get_oob_offset(sunxi_nand, ecc, step) +
-		sunxi_nfc_user_data_sz(sunxi_nand, step);
+	return step * ecc->bytes + sunxi_nfc_user_data_before(sunxi_nand, step + 1);
 }
 
 static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
@@ -1991,10 +1991,7 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	unsigned int user_data_sz;
 
-	/*
-	 * The controller does not provide access to OOB bytes
-	 * past the end of the ECC data.
-	 */
+	/* Only ECC-protected user data is exposed as free OOB. */
 	if (section >= ecc->steps)
 		return -ERANGE;
 
@@ -2023,15 +2020,6 @@ static const struct mtd_ooblayout_ops sunxi_nand_ooblayout_ops = {
 	.free = sunxi_nand_ooblayout_free,
 };
 
-static void sunxi_nand_detach_chip(struct nand_chip *nand)
-{
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-
-	devm_kfree(nfc->dev, sunxi_nand->user_data_bytes);
-	sunxi_nand->user_data_bytes = NULL;
-}
-
 static unsigned int sunxi_nfc_fixed_min_user_data(int nsteps)
 {
 	/* Preserve the ECC strength selected with the legacy BBM allowance. */
@@ -2048,31 +2036,19 @@ static int sunxi_nfc_variable_init_user_data(struct nand_chip *nand, int nsteps)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	const struct sunxi_nfc_caps *c = nfc->caps;
-	int remaining_bytes = nand_to_mtd(nand)->oobsize - nand->ecc.bytes * nsteps;
-	int i, step;
+	const struct sunxi_nfc_caps *caps = nfc->caps;
+	unsigned int oobsize = nand_to_mtd(nand)->oobsize;
+	unsigned int parity = nsteps * nand->ecc.bytes;
+	unsigned int available;
 
-	if (nsteps <= 0)
-		return -EINVAL;
-
-	sunxi_nand->user_data_bytes = devm_kzalloc(nfc->dev, nsteps,
-						   GFP_KERNEL);
-	if (!sunxi_nand->user_data_bytes)
-		return -ENOMEM;
-
-	for (step = 0; (step < nsteps) && (remaining_bytes > 0); step++) {
-		for (i = 0; i < c->nuser_data_tab; i++) {
-			if (c->user_data_len_tab[i] > remaining_bytes)
-				break;
-			sunxi_nand->user_data_bytes[step] = c->user_data_len_tab[i];
-		}
-		remaining_bytes -= sunxi_nand->user_data_bytes[step];
-		if (sunxi_nand->user_data_bytes[step] == 0)
-			break;
-	}
-	if (sunxi_nand->user_data_bytes[0] < USER_DATA_SZ)
+	/* The first protected word must contain the bad-block marker. */
+	if (!nsteps || oobsize < parity + USER_DATA_SZ)
 		return -EINVAL;
 
+	/* Use as many complete words as fit after parity. */
+	available = min(oobsize - parity, nsteps * caps->max_user_data_len);
+	sunxi_nand->user_data_step = caps->max_user_data_len;
+	sunxi_nand->user_data_total = round_down(available, USER_DATA_SZ);
 	return 0;
 }
 
@@ -2094,7 +2070,6 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	const u8 *strengths = nfc->caps->ecc_strengths;
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_device *nanddev = mtd_to_nanddev(mtd);
-	int total_user_data_sz = 0;
 	int nsectors;
 	int ecc_mode;
 	int ret;
@@ -2179,10 +2154,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 			return ret;
 	}
 
-	for (i = 0; i < nsectors; i++)
-		total_user_data_sz += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-	if (mtd->oobsize < (ecc->bytes * nsectors + total_user_data_sz))
+	if (mtd->oobsize < sunxi_get_oob_offset(sunxi_nand, ecc, nsectors))
 		return -EINVAL;
 
 	ecc->read_oob = sunxi_nfc_hw_ecc_read_oob;
@@ -2413,7 +2385,6 @@ static int sunxi_nfc_exec_op(struct nand_chip *nand,
 
 static const struct nand_controller_ops sunxi_nand_controller_ops = {
 	.attach_chip = sunxi_nand_attach_chip,
-	.detach_chip = sunxi_nand_detach_chip,
 	.setup_interface = sunxi_nfc_setup_interface,
 	.exec_op = sunxi_nfc_exec_op,
 };
@@ -2712,10 +2683,6 @@ static const u8 sunxi_ecc_strengths_h6[] = {
 	16, 24, 28, 32, 40, 44, 48, 52, 56, 60, 64, 68, 72, 76, 80
 };
 
-static const u8 sunxi_user_data_len_h6[] = {
-	0, 4, 8, 12, 16, 20, 24, 28, 32
-};
-
 static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.has_ecc_block_512 = true,
 	.layout = &sunxi_nfc_fixed_layout,
@@ -2781,8 +2748,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
 	.dma_maxburst = 8,
 	.ecc_strengths = sunxi_ecc_strengths_h6,
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_h6),
-	.user_data_len_tab = sunxi_user_data_len_h6,
-	.nuser_data_tab = ARRAY_SIZE(sunxi_user_data_len_h6),
+	.max_user_data_len = 32,
 	.max_ecc_steps = 32,
 	.sram_size = 8192,
 	.timings = &sun50i_h616_nfc_timings,

-- 
2.53.0

