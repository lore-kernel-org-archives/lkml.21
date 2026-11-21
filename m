Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223486;
	b=uDLY13K/vBDWlsY7p2KrSIT6I6ZrdycBPdaX+cQPQOof/dGmX/nc+g0Vqa7UNfO8dW65
	 AqkTRiiJIYMTr1w2UDa51sSUY0MVXTgFoGH9oyp7hgxuXu5l0s5KDq7Jz5bP1g8FyVb88
	 yV1D3c5CYCpW+VqmWz/8/A5w91maTvqU9nF/vobGlhjAWgL8+5XZVLCOugyekMkPOfzNs
	 RZgA2k9FDx1gyJwRARfKL38YxPYak19tRVoyjIULd0RD+K6Moa/IyHZILveo+RN2VRgqo
	 Z/RN/anmy5fPV+lkO4EgcVwdpFbFke7CysJSTLUoW8LzTAgW6Kca/qN6XqPT9pXMSfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dWkb9R9dFJf53WgY0/fb7qetN7PVplL4lJbH2mVBctQ=;
	b=4la7CZfPuRZE9OY2QzdGRvWrv2TlVwZIF2H33ZexF/PV9Gkya8/ir4eX7/MjrjeUrF02
	 71F0XPg/0SH+Xy3akjxS6dSn9VIh8GJAJvN311VS73/w6nYhzX2hfiyKwgA2CLc88tZIM
	 /GDdhUUSzxRsOqITtpPD6IqwheJI/+N/CrlKDcv+shz5oDVmurc7jo7gLgKe2QwNcPBaq
	 1IIjwWcPx44scCDj2kP1kolHVu69Wvj6SOjMOjbOMsznrHP+uC5z6DV2kWSkHu0U9wUVs
	 a/spzFg5vPrO7tRcRzw9AxeFfcDjIMDP5R0yEFTo+CbV6QQFe3v/9pqOjz+8bE1kg4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CLt/7c2D";
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF19A606ACC3
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF19A606ACC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CLt/7c2D
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-53ec92375d2so924194b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223484; x=1795828284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWkb9R9dFJf53WgY0/fb7qetN7PVplL4lJbH2mVBctQ=;
        b=CLt/7c2D9bgcj1VCDJD/Yx9MziudHQSEBWpHHhHw8bDVn+e+sJu6zChF9D19FvYIZy
         K/LXd35F8IJt3f1TryrwwBkAmOXUV0jttvhBLSuW+JJyaBG5Gf3uxe9brV1ANpwkLNa1
         V84SILZhe0vO8U4nj9w84AYtvc/gOwL9cADHaVNNi1DuUjGNZfT+k4q+4QNV8wzqm54P
         uaGdIta7yIH4iKLtpkQRNkvKLB4o0QEQ6j1TnyUNGQ7RJWugw9ZGDPq/52vPS3J55/Xl
         A4Z+Suiw9OvroDWKW/rEuJjZ2rG6/aP62VlWrWZzg9pkMA9DJgdWjmCV6gQdeNN7VpfG
         o0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223484; x=1795828284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWkb9R9dFJf53WgY0/fb7qetN7PVplL4lJbH2mVBctQ=;
        b=I+qiHelPF2HuQDgaFh2bKvcUot6BpQHrEIeBIKWA1eapjUVvQAFMe8wuvQ3vGye6Us
         3MlAU1pg3hitCo3BxGHQzSM2KbQqrs76sLYWu3hdT+7dwXUDzvueupJduKl0wwnG3O/S
         6E/Nu5f1AVHMnKSJFXRDqUr0+zh8asdZjIYILMhnTlD6VQ2B4eNns0/Gvk0pvNZ98Qq+
         gkDbMt1ButQvE5U4mHGCQvDWjzjAPnwjKcmt8lXcaARtZfRHtl79gBJvRCGu0FL5D343
         YxJp2fPeGHLtGwhw1/r33jDyYJJuK2R8yyDb/8F7v78SOcf8sIZIkH3+hZ5x1SE+iGJE
         puwA==
X-Forwarded-Encrypted: i=1; AL+hErFF11nivLK1++tNwBYHHjbLxXA1fb/jEyShvk5xiUzm7v28NQUOuqgXRiJn5c25ff8fHvikh6L4OAnHaME=@vger.kernel.org
X-Gm-Message-State: APuU4Z8imTUmbxiLg0YZt1SzQxDqeJgTgyxyGnDME6FpNUKOIhL1hNWx
	Zo9Q6UBZM+XwlfTnmXKg9YCr9+4SkeQIjVPVmQXX7/OWjlYI1Mhpo+0d
X-Gm-Gg: AYBFou2VRa0Lhf1zTxw+jZ4MVcjkS42q+uszDVPn99fCEmSEyden1QzIKuAkkRaM2Y9
	KZ3CQQ05MvOQ6WwyYU9Fys3ZpsvTiKjITTSLa+YC4sGt5VoahMW/8s/roEEjTGbZaVdnhvbfk5/
	k6wMfHkocKhw5ZvvpEgGmFt6QExXH5UarfJatFUl5XfyyGQ6HRFmW3HEkOBYOxJO5F3ttn4VHxx
	tyFN65nmJmR9LAnIyQ535lJs2f9Q1F6fVUOd2ttCIq/M3mB9ITYPtZHRY0ERHt6OfcZhGjghNjJ
	oN2GxOjb/+TRgUoH+K4cD2uWj+9dVW9+LlptHXh1rTosnyXk+wTIYXPhKeshThilnucPn9msCkw
	uVK4vxH1I4gScK/aZ9Up2p4m/dvwbvWI7g4Nnh5DsKGQeFMdlCoFDTzPscPk7Z/h1zBND2Sszrj
	+Kqi3STuPFCGPgfSaweiyEsKWH60+j+Mot8QDQ+DL9VS6hRFuHTjtwE9s5jkAkZJYTNuz+p0lTC
	I6n9pfUdaT+QkK0kkbvs5w90q1HTIsVsgBTsfns6C9eEYe+gcXxRC2lkpTQUwCBmEUgKTOsVdEo
	N/pqOIuSGteu/XabHIghJGTh/VKc0ZJWrXYmk5JdfA5h7a8Jp9wc4JN9lTUvhwubydxhQGFOjPT
	DACpKZpdzDR4jVqvcthhPg+B46K0uUavxslc+mkqIB11UcoZUmoaHDOwGsqV1uVIskE6HUTo9jQ
	SwjUgPmLa5dhmfium/VdXgRdiSYQ7yJQx8ruN1MvG+kLTSVeAEmtj0
X-Received: by 2002:a05:6808:4fdf:b0:571:b166:3d77 with SMTP id 5614622812f47-57a0af33b0amr6477590b6e.27.1795223483689;
        Fri, 20 Nov 2026 17:11:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:43 -0700
Subject: [PATCH v11 20/26] mtd: rawnand: sunxi: limit buffer transfers to
 the command byte count
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-20-9721b1905ef4@gmail.com>
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

On H616 a page operation can report success after reading or writing
only part of a large unprotected OOB tail. The controller has 8 KiB of
SRAM, but its normal-command byte count has only ten bits, with zero
encoding 1024 bytes. The buffer helpers use the SRAM size as their
limit and advance by the requested length, even when the controller
transfers fewer bytes.

The operation parser already splits data transfers at 1024 bytes, but
the extra-OOB helpers call the buffer helpers directly. Share the
parser's byte-count limit with the buffer helpers and keep each chunk
within the controller's SRAM. Larger buffers are transferred in
successive commands; controllers with 1 KiB of SRAM keep their
existing chunk size.

Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 37cc023db74e..4478189bf920 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -89,6 +89,9 @@
 #define NFC_RAM0_BASE		0x0400
 #define NFC_RAM1_BASE		0x0800
 
+/* Maximum byte count for a normal data-transfer command. */
+#define NFC_MAX_BYTE_COUNT	1024
+
 /* define bit use in NFC_CTL */
 #define NFC_EN			BIT(0)
 #define NFC_RESET		BIT(1)
@@ -667,7 +670,7 @@ static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 
 static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
 {
-	return min(len, nfc->caps->sram_size);
+	return min3(len, nfc->caps->sram_size, NFC_MAX_BYTE_COUNT);
 }
 
 static int sunxi_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
@@ -2498,11 +2501,11 @@ static const struct nand_op_parser sunxi_nfc_op_parser = NAND_OP_PARSER(
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
-			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 1024)),
+			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, NFC_MAX_BYTE_COUNT)),
 	NAND_OP_PARSER_PATTERN(sunxi_nfc_exec_subop,
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
-			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, 1024),
+			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, NFC_MAX_BYTE_COUNT),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
 );
@@ -2512,11 +2515,11 @@ static const struct nand_op_parser sunxi_nfc_norb_op_parser = NAND_OP_PARSER(
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
-			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 1024)),
+			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, NFC_MAX_BYTE_COUNT)),
 	NAND_OP_PARSER_PATTERN(sunxi_nfc_exec_subop,
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
-			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, 1024),
+			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, NFC_MAX_BYTE_COUNT),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true)),
 	NAND_OP_PARSER_PATTERN(sunxi_nfc_soft_waitrdy,
 			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),

-- 
2.53.0

