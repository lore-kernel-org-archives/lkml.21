Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700569;
	b=blZbKdjmvKcmjpJC/1Pk7+txe4L1+Ik5Pqq9If5C5lGaAMvx41prf/oZJs7TbA4VJiDJ
	 KRM9e7BcKMv+iEboGLeb4qdlZmPs7yQ6LSlrDYJzItKUN1Lx+8WvkidDIaas+kskiFNwQ
	 Ooma6cbtEEUtXFxrRBfdRzbPTO8/5MbOwIU/LH49VvhfyIqmef65LpOqiAM8Y3E0jobU3
	 nr/cDHTi6jdWBkZW+O6Pi6T2ouWsJSikJBcbHIDbIWyR0uU+iOfYCfigRYO2nGb33Q8Sp
	 a4BtI5jEgyWuJbisjwZaxHpAIKoK3yCf7VgbUNuQsu48KTCvML2BBhoqrp23MAnlYiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700569;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=C+zlYm8XOv9lDruCz8zt6yvmvSgz2YtAFpzwlSl9RtA=;
	b=Nj47WcDTTzgLhzSDWlm1K3dSpoz8iKs0LREIQeoaJBkIVYwO2mYAojbo+oqNjvidZ3Ip
	 7PGeVvjzzVjp4q3dtpAsSjP8iZCUGdVvtivXLdTuhRulhpiKmnSgNoMmTWHbvm9X6aWOA
	 dkDExDzl8EmPOpRjEzKKsz1iJ2/eQZvI6NPvAwKjBkD/W968FKYwKPgxlI348+iLjjN02
	 3vFLLX0759dOxJbQWP4Mha1N+eaReSh3RmtTW1MTLQxP19cDLbiG/IIjbAk4EzBCXpb0I
	 7fwrwtDzYyhGN0UJUdvf5fpXIN4wtSXqr66vIdvzFeI7Mw3Zm012eNsHyyPe4Yog72w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1AOuqAUb;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE673606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE673606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1AOuqAUb
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A84BF4E417A1;
	Thu, 26 Nov 2026 13:42:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E370604ED;
	Thu, 26 Nov 2026 13:42:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0ED211E68018;
	Thu, 26 Nov 2026 14:42:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795700566; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=C+zlYm8XOv9lDruCz8zt6yvmvSgz2YtAFpzwlSl9RtA=;
	b=1AOuqAUbUzkHOVUrXbC8OuNdgZdmdkNzmQmub8NURF5O6JAA4bj//5a7UhOyP3FT1azVmr
	4gAfa1qTKY/6HcQ/vhBsxgxzHuCwZJNYYGuRE8zdCb1upVV/1pEgxNoNB01M0JkSTegYIm
	sXSirqozCMgaT4nMPn1gz8TRUaChU0gf/w2rV78BZHDiUMfVpx42xkJoLB5r2Q6QP7Pcrb
	ftKotuGpcVL3kpKRmFYpA9xvxmop5zK/oM+vMkldgt8d4tAAW3L4EJvsRnt4MCPdxZc1cs
	WX78Yn0UtfBHADdwg4nvcFGZZEU4n8t0MjZfI59fuPDWNZwXv0o+d87j8JADoA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Nov 2026 14:42:29 +0100
Subject: [PATCH v2 4/4] mtd: spi-nor: macronix: Describe locking support
 for MX25L51245G
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
Message-Id: <20261126-macronix-upstreaming-spi-nor-cleanup-v2-4-672a59abed62@bootlin.com>
References: <20261126-macronix-upstreaming-spi-nor-cleanup-v2-0-672a59abed62@bootlin.com>
In-Reply-To: <20261126-macronix-upstreaming-spi-nor-cleanup-v2-0-672a59abed62@bootlin.com>
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
 drivers/mtd/spi-nor/macronix.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 9a40c2b14cb4..06ebd5482bc8 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -15,6 +15,7 @@
 #define MXIC_NOR_REG_DOPI_EN	0x2		/* Enable Octal DTR */
 #define MXIC_NOR_REG_SPI_EN	0x0		/* Enable SPI */
 #define MXIC_NOR_OP_RDCR	0x15		/* Read Configuration Register opcode */
+#define MXIC_NOR_CR_TB		BIT(3)		/* Top/Bottom select, OTP */
 
 /* Convert dummy cycles to bit pattern */
 #define MXIC_NOR_REG_DC(p) \
@@ -86,6 +87,38 @@ macronix_qpp4b_post_sfdp_fixups(struct spi_nor *nor)
 	return 0;
 }
 
+static int
+mx25l51245_late_init(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+	u8 cr;
+
+	/*
+	 * Locking is optional, so leave locking disabled if the CR cannot be
+	 * read (e.g. the controller does not support the 0x15 opcode).
+	 */
+	if (spi_nor_read_sr2(nor, &cr))
+		return 0;
+
+	/*
+	 * MX25L51245G supports locking, but TB bit is OTP. Since a TB=1 bit
+	 * cannot be supported with the current software, prevent locking
+	 * entirely in this case. Also do not advertize the TB bit at all to
+	 * the capabilities set consistent.
+	 */
+	if (cr & MXIC_NOR_CR_TB)
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
@@ -406,7 +439,7 @@ static const struct spi_nor_fixup macronix_fixups[] = {
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

