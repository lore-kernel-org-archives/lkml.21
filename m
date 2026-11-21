Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223497;
	b=haSAwaBc0J0DwIdzwmdGKqrQFuMCLSUQsrq5GAI6EgG5XTvd4rQKBfYTNtwJcTwV4zD4
	 SRJWBaRtrLNKlGgBD0UQf2BRRgGL8c36tg4xugLchNFjWnogdCL9FxSQHxoDmIUDoxXOG
	 X8JtLlEtDfgC+YRCc/qKL3fZZJpGdZ31A503hwUhzKb7BYQNTyARRoO6h1LOMwVd+aLbI
	 v9DkI/Xh6O7GfqcuyWirCdvNs31FgWL/5u6psjIZMtWmXNjf1iEPwyHINb1Ttrfrx49EY
	 XOYoD1Zp3dt0gv7jdWUCFlCKVcB1vYfqHT45e2ckPoYJ0TpmPSFF9cVoYF8UL7/wuQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3n0HsVfrCilvrywczliXObPQ3Hlxg0mpvZCNssFAoKg=;
	b=C/7EBNaDqyVkASHhoRvvdrei8eCF/lFT2+jRmz3jcbfsUMUjE5dvW1fBYSRrWX/IbAZD
	 7k3aLOvo3cMjqNFCkhHgwpauIi4lZg1yMJ6IDOWWliHZ/P+7b9rjN+VTUF6aaF/akX4iO
	 8NcP1BxsUaT452xZ/doDZF6xEmIuZoleUh5lY/UeAV4g6NH3D3h6UanGkAlRnsGRuE9Ms
	 eh87yq+hqLNo+I1kWkceeag0yt4fDkhS09r3puA0IDQtoDwQEthj8pwbaw048nJ423mnV
	 TgSYLG/0g+BzKcF63HijZnmHi+Um5SOMvBkWzFRxwiiztTfJRTbExrHhL00PKOG2GZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kXsb1HRm;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879E9606C51A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 879E9606C51A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kXsb1HRm
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-57728d859e9so756088b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223492; x=1795828292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3n0HsVfrCilvrywczliXObPQ3Hlxg0mpvZCNssFAoKg=;
        b=kXsb1HRm0z+DeTVpYv6IhvZkuBux7zkDW0H+eyUhG3WPdO2pLBZgRi+Y1sT+hZFGBJ
         khShRCN+z37iHVI6UYNV1hC+UQ31kK8pdFXY9yBPBVxnjT7fojGV641RO/RfYElC9apO
         D9fkHivqmDxXSzcgQ+GDUA6/9zLpJ5ud5VNeJryzsn/wWXq4eU1xYPizKhrNvaPQAVIy
         sHltgbROh3SG6u+LRjpP4YtjGYuDel9nkuVJTg7LQIKijmzyU+6JIjsh69fwbVrVvV91
         Pzljix0PiF7yV1aHfmuMT2dlqTUB97TQfpIE7LSI5VeyjtwjeLvncBizDAoL1FygAHa2
         mhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223492; x=1795828292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3n0HsVfrCilvrywczliXObPQ3Hlxg0mpvZCNssFAoKg=;
        b=k2k31IH3Q+7bkbZnXnOs4WQlW6ntzty7bsh0lWmfuTVZbG0RoM8mVp2UVbECQ6LE2K
         S/EaU63V2fXRUznv0gcob+AjVFO7HjD/zIpOlhwHij8bGECaX+UIwJzZldUX+Iowci6Y
         ll1+umHGjpX/TDcrOVWFrENlOtn+LahfcavLCPkwjRAIITa6owddMIz+K6odAEqD0jZP
         UQ2yA9ihyEYjv2i6J6R2J5JfH90TI8TNjoqDdm6/cBbehgByxmFVr9CdBvqwuwRc0gxX
         OzD+LtAV3141LG0zfsDh8OHM/cowCrJBk8fV7/P8NWnjELxKRKUmmOLlZdtA2s3Ds5lI
         tIRw==
X-Forwarded-Encrypted: i=1; AL+hErHh9jQBFgDalvCVfYK/4Bs5NPvMA656ua4RG7HcDdgJt1wxBr0Q4aRd3qDwync/GM8MomhG26swqx4kjHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z844HCxyNKzdXaJ8cZbXIlUxZtjARcKxW48dfnal9QRd0f3PRLH
	hiW9bdhaOuUqLg8QMBmfm7VZofHLLyHc6XaCWUaiQxcC2RHA6OYy63KQ
X-Gm-Gg: AYBFou3+VVayTguvP1nSM42BqW2A4MExshexbbtwEIfhdUSe510S4CGILH0uIvv6ifm
	VbUhHaYSspsWKayUIVJGtWhGdNagNgUv9SmI3I9omGz3dkmu6oW6pL7mKxJ9L+fHbUpkrbXm86o
	SSjme2jobySaDfkJydBKNCVzWlT8fKKGGAIfV8ZkyND3B63RMHAdhKxQNRQeT5kZvDHtcHOwy/Z
	2y559zpoQwjmYoclUqg/bXmA3I7215opbn0+/LsgFBsjDnatD5i31/kxhBbHigw6EHFFjp0Nft2
	4Gv87F1fVFompNK+4uuTFqN+qnRVjolnZG8xWHNxzxB0irDBsWEvAEutpSk3hRvy1BWZMBl0XRJ
	Zl7U2EdiPaeKDZCuTMipTjswWbflc8ryxN0Hln/NU2aTGGTNYSHpKQZTmSkKk5Y3sDa+MJInvTr
	0qqhZgkzr6p6ytnLRBSXxQmvjJpDwaj2cpsRV+xGC54/oiTx1UlP3cMmNRCPBU+2NZrkM0taiNS
	gl74e8Aew/EdMWGrAW2VnYCtWlLdfwrWnal+fEnAskMwzUtB/xZrhrQ2OprkRAHuoUtCpzAL6pv
	sLbBaO8vT4zDhEYXVeU0b08Rkbpb52IHcNe/JQk1f7vfO4LRIggfbnnm21hzq/NJtlW4pLI+qMj
	/vj8EdVkQxMjYB53lg16qnYl1iTPRSo2r0WFMI+VwD0ElFEnSdebkRTnczDNZSR6dhtrWM+nuRV
	6yZY3bvg5wXoVCxXebBrahcja08Z+IPGtcj56oAYezc9apCUlVAYWS
X-Received: by 2002:a05:6808:508f:b0:576:1161:cfeb with SMTP id 5614622812f47-57a0d4ed405mr6123275b6e.66.1795223492380;
        Fri, 20 Nov 2026 17:11:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:49 -0700
Subject: [PATCH v11 26/26] mtd: rawnand: sunxi: reduce user-data length
 register accesses
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-26-9721b1905ef4@gmail.com>
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

H6/H616 pack eight ECC steps' user-data length codes into each 32-bit
register. DMA currently clears all these registers, then
read-modify-writes one field per step, repeatedly accessing the same
words. Each code counts four-byte words; zero means no user data.

Build each packed value in memory and write it once per DMA batch,
including zeros for unused slots. Take each length from the batch's
logical step but encode it in the corresponding batch-local hardware
slot. Rewrite every register on each batch rather than caching values
across resets or changes of chip.

Use the same encoder for PIO. Each step writes the first packed word
with only slot zero set, so page setup only needs to clear the other
words. This also clears stale DMA slots before PIO uses the registers.
The lengths and on-flash layout do not change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 59 ++++++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 37f01801cf48..31f995a1f5d8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -57,7 +57,7 @@
 #define NFC_H6_USER_DATA_REGS	32
 #define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
 #define NFC_REG_H6_USER_DATA_LEN 0x0070
-/* A USER_DATA_LEN register can hold the length of 8 USER_DATA registers */
+/* Each USER_DATA_LEN register holds eight 4-bit ECC-step user-data length codes. */
 #define NFC_REG_USER_DATA_LEN_CAPACITY 8
 #define NFC_REG_USER_DATA_LEN(nfc, step) \
 	 (nfc->caps->reg_user_data_len + \
@@ -1061,10 +1061,7 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 		sunxi_nfc_randomize_bbm(nand, page, oob);
 }
 
-/*
- * On H6/H6 the user_data length has to be set in specific registers
- * before writing.
- */
+/* The first PIO step overwrites the first packed word; clear the rest. */
 static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 {
 	int loop_step = NFC_REG_USER_DATA_LEN_CAPACITY;
@@ -1073,7 +1070,7 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 	if (!nfc->caps->reg_user_data_len)
 		return;
 
-	for (int i = 0; i < nfc->caps->max_ecc_steps; i += loop_step)
+	for (int i = loop_step; i < nfc->caps->max_ecc_steps; i += loop_step)
 		writel(0, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, i));
 }
 
@@ -1088,10 +1085,8 @@ static int sunxi_nfc_user_data_len_code(struct sunxi_nfc *nfc, int len)
 	return len / USER_DATA_SZ;
 }
 
-static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int step)
+static void sunxi_nfc_set_user_data_len_pio(struct sunxi_nfc *nfc, int len)
 {
-	u32 val;
 	int code;
 
 	/* not all SoCs have this register */
@@ -1102,11 +1097,35 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 	if (code < 0)
 		return;
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	/* PIO uses only slot zero. */
+	writel(FIELD_PREP(NFC_USER_DATA_LEN_MSK(0), code),
+	       nfc->regs + NFC_REG_USER_DATA_LEN(nfc, 0));
+}
+
+static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand,
+					    int first_step, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	int first, step, len, code;
+	u32 val;
+
+	if (!nfc->caps->reg_user_data_len)
+		return;
 
-	val &= ~NFC_USER_DATA_LEN_MSK(step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	/* Write each packed register once, including zeroes for unused slots. */
+	for (first = 0; first < nfc->caps->max_ecc_steps;
+	     first += NFC_REG_USER_DATA_LEN_CAPACITY) {
+		val = 0;
+		for (step = first; step < nchunks &&
+		     step < first + NFC_REG_USER_DATA_LEN_CAPACITY; step++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, first_step + step);
+			code = sunxi_nfc_user_data_len_code(nfc, len);
+			if (code >= 0)
+				val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
+		}
+		writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, first));
+	}
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
@@ -1474,7 +1493,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, 0);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1503,7 +1522,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	struct sunxi_nfc_ecc_snapshot snapshot;
 	struct scatterlist sg;
 	int page = read->page;
-	int ret, i;
+	int ret;
 	u32 wait;
 
 	if (first_step) {
@@ -1524,10 +1543,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc,
-					    sunxi_nfc_user_data_sz(sunxi_nand, first_step + i), i);
+	sunxi_nfc_set_user_data_len_dma(nand, first_step, nchunks);
 	/* exec_op() restores the page's spare base during column changes. */
 	if (first_step)
 		writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
@@ -1645,7 +1661,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
 					    user_data_sz);
 
@@ -1900,7 +1916,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 			goto pio_fallback;
 		}
 
-		sunxi_nfc_reset_user_data_len(nfc);
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
 		for (i = first_step; i < first_step + batch_steps; i++) {
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -1908,7 +1924,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
 							    page, user_data_sz);
-			sunxi_nfc_set_user_data_len(nfc, user_data_sz, i - first_step);
 			reg_index += user_data_sz / 4;
 		}
 

-- 
2.53.0

