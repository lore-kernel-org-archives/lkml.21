Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629753;
	b=kOUFcvgqQ0hE/IKSuXM363WqcEHGbSpRcsFlyWtEtOS1LsOY6NMPzuhlmeHGMSGr+1OZ
	 WzqJ2H0A8AdMZcjLOCkJxuTD/VYCztz+AJ+ar4ltYkjhkoFkXvsPg0hr19QU48NVWA55N
	 aYM1vEzskjWE/FReoXdcoYlUlyPL1TI/e9TpXr8Z6GZfVRV1FMQAos5pdiu51yrrJM8u4
	 YcTOWbZN5F5wdFDGLdgLvCD2OfdhScEIm8KIurICyNz8UA3WMqqRsqw6e2Ulykg7a+QbS
	 lNkIpRgEGLRcAuawLl8Ne2HzBxCO6ohp9tvCoxtS9QCmrUlkcYmr2RJAF2sLMvyGW8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629753;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=KTR0ygwIoRmaPIBtyiX7BsdvTJ5z0Oozx9s5oZ/qdZY=;
	b=RRu70dJLq2Kkh/qypoftGXvBhQbpP9lJESmnMSKNfQpL2sVHQwCUP0AwUK9Aju9rHrZK
	 Sap1vyqb/orWeuNIrjS66D+rWbYcnjyjRxJJRral3SOF/BjM7mMgyLAm5WPK2UcB63NDY
	 wsTEKgc8hCdeEQgbGwCiYJPnghWKItRagSAmwBoFEFH9W7rtc4KNjvo6mlrco5kJ0ERPq
	 9QrGLZaXst5o+e1EcuuR7Q4Y5+CMUOPzNfTUbbUHgC7puciCScwNR1hGhd0nOBwDUoqvV
	 2G1n/cF3cp1kjiK3EHR8dk5bbo9yQEaW5LjZn5jqnBbPmYCn/SF4pwNC1tiTYnGJ5FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=T27uX+Mn;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A268606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A268606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=T27uX+Mn
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A0EC24E41798;
	Wed, 25 Nov 2026 18:02:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EA2760480;
	Wed, 25 Nov 2026 18:02:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43BF911E6B0E1;
	Wed, 25 Nov 2026 19:02:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629750; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KTR0ygwIoRmaPIBtyiX7BsdvTJ5z0Oozx9s5oZ/qdZY=;
	b=T27uX+Mn8UOU9tXDuaK+KU/6KYJRU+av+lU9nCYfeKU0T+QrFPvz4qAXoDdtJBujWlBlln
	Ss5hkIY0KNaXEvPj5Xqq2oJcAqnpG88UTxcKc5DYITiujimmN2JXRROHLAv7ju94NKtb7l
	JLD197IJkm7YPbMzhoLYUtP1RecTLNIMZvDcl5xmUbGulkUDG91zMZNWlVVskBlcvJRaZx
	8piXZCm5mFRPMyJSxufapJx/tNH7Yh06lBvtTY3RYBn2XLyRAxXKso2uTVS2W7WTGZ2ky8
	1EjzFrt2mdR0r64wWK5sdIhcGX/N+SZgccJKouBg8Lg27ZZS71/fVSllIJDhNw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 19:01:37 +0100
Subject: [PATCH 4/4] mtd: spi-nor: macronix: Describe locking support for
 MX25L51245G
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
Message-Id: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-4-0d1ab783fd8b@bootlin.com>
References: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-0-0d1ab783fd8b@bootlin.com>
In-Reply-To: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-0-0d1ab783fd8b@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The MX25L51245G, MX25L51273G and MX66L51235F share JEDEC ID 0xc2201a.
They have the same 4-bit block protection scheme as the MX25L12805D:
BP0-BP3 in the status register. Their Top/Bottom select bit is however
located in the configuration register (bit 3) and is OTP, which means
TB choice cannot be supported as-is and would anyway become
inconsistent once the TB bit set.

Read the configuration register in a fixup and enable locking iff TB is
cleared.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/macronix.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index bbc41af14882..87fdbd6c3800 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -15,6 +15,7 @@
 #define MXIC_NOR_REG_DOPI_EN	0x2		/* Enable Octal DTR */
 #define MXIC_NOR_REG_SPI_EN	0x0		/* Enable SPI */
 #define MXIC_NOR_OP_RDCR	0x15		/* Read Configuration Register opcode */
+#define MXIC_NOR_CR_TB		BIT(3)		/* Top/Bottom select, OTP */
 
 /* Convert dummy cycles to bit pattern */
 #define MXIC_NOR_REG_DC(p) \
@@ -86,6 +87,37 @@ macronix_qpp4b_post_sfdp_fixups(struct spi_nor *nor)
 	return 0;
 }
 
+static int
+mx25l51245_late_init(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	/*
+	 * Locking is optional, so leave locking disabled if the CR cannot be
+	 * read (e.g. the controller does not support the 0x15 opcode).
+	 */
+	if (spi_nor_read_sr2(nor, nor->bouncebuf))
+		return 0;
+
+	/*
+	 * MX25L51245G supports locking, but TB bit is OTP. Since a TB=1 bit
+	 * cannot be supported with the current software, prevent locking
+	 * entirely in this case. Also do not advertize the TB bit at all to
+	 * the capabilities set consistent.
+	 */
+	if (nor->bouncebuf[0] & MXIC_NOR_CR_TB)
+		dev_dbg(nor->dev, "TB is set, bottom protection not supported\n");
+	else
+		params->flags |= SNOR_F_HAS_LOCK | SNOR_F_HAS_4BIT_BP;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups mx25l51245_fixups = {
+	.late_init = mx25l51245_late_init,
+	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
+};
+
 static int
 mx25l3255e_late_init_fixups(struct spi_nor *nor)
 {
@@ -400,7 +432,7 @@ static const struct spi_nor_fixup macronix_fixups[] = {
 	{ .id = SNOR_ID(0xc2, 0x28, 0x16), .fixups = &macronix_rdcr_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x18), .fixups = &mx25l12805d_4pp3b_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x19), .fixups = &mx25l25635_fixups },
-	{ .id = SNOR_ID(0xc2, 0x20, 0x1a), .fixups = &macronix_qpp4b_fixups,
+	{ .id = SNOR_ID(0xc2, 0x20, 0x1a), .fixups = &mx25l51245_fixups,
 	  .fixup_flags = SPI_NOR_4B_OPCODES },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x1b), .fixups = &macronix_qpp4b_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x1c), .fixups = &macronix_qpp4b_fixups },

-- 
2.56.0

