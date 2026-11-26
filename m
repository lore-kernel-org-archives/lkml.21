Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700567;
	b=gF4yqrOeqR3JqdCgIk5JBNPfO6LQviOYAtbmob5a1OpfD6qE/vROSKmxU1muqcjs2Oqn
	 FcQbvFF/+GinjvGR9qNZlePu5++QqTM2nYpzTQiVHbkq2mOLgnYzl5h3L6NRHPLEl6mov
	 RCMfQfz/SUZNmEnzQIJJ7WSNNYJfQTlWdCB5wydsOJdq6zOwUGTgnbLT0hNBlKX+S+MSk
	 t8VTO2Jcf3nqbR3ffGLjMxqF4ddAC5HgZA/kUshDZzkt4q+wP9tAQ86/4UXCm9QMbei6V
	 srRQR6487KqBo4fLYW5L8LrGIcT/smaW4ZbBTTJNPI/2nYyAy3FneVdJT6D/GCnObSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700567;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=3095QNJMgLH6+yo7OjVuLRKdi5eQatKLHIizwuOF54w=;
	b=S2mObAO0LGfmOkSQ0f6h7QpaEtl1N/rU+Fioq22NY0Q+eJyX5+tFHsNdMx1swSXF0cUI
	 YpT2oWWxjcRH07B9J4a+5o1Opibeh9j/2kMhphvgvRpAYTpeZKaqcpQ4+RcyV0boBjnOG
	 rV8V4gKjx06p58llbfrweC+juFNQTRbTpIdffTA40+E1hPY5L/IpOnXZYIRSx1t3eR8g5
	 TWnWDvB6ITszhDVqXYr2CcFgLWVJfH8T0U63W/lTcpsZriJ9f5513+BdzxvTM7aGagrDm
	 o9C3qjpGcH7MMhMxJnndsZVP7sCofPuLsZH/bTRF+Lj843FLie1By9W0NdWzR8t0X8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EaMoWkKl;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AEC606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93AEC606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EaMoWkKl
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 273DD4E4179F;
	Thu, 26 Nov 2026 13:42:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8D15604ED;
	Thu, 26 Nov 2026 13:42:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62A9D11E6830D;
	Thu, 26 Nov 2026 14:42:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795700564; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3095QNJMgLH6+yo7OjVuLRKdi5eQatKLHIizwuOF54w=;
	b=EaMoWkKli2zKOZtwu4Gj7IOI5GwM7R7SW+P+iqKuAMv/okK45/zsHb36s5I69HfN9diWKd
	MSFQ+u50MBX+eziGjjWIokA1BPzLFql4bRUTi1mnDyOZNhLjxEhxZTLAfV90MxRPHYSwrZ
	cXSWd1WEMVBMJLQbzXZ2LfWUoVA3b2IY0Jk8kiaLb4yQ2+fysT/DKohNHxjbbITbc4yHlv
	BG0fbV0umz0/ym2z8xxc4D5mSQ4ceWIBabKAV5ewUW+sjUclcAusn+hGbwUnerI9KuS7Hw
	6cLMZkTSZOEnUweeflD5ezJFLOUklVItCJhuh4B9bXz7UGi6Edp6a6aOjwWNYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Nov 2026 14:42:28 +0100
Subject: [PATCH v2 3/4] mtd: spi-nor: macronix: Enable RDCR for the parts
 that support it
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
Message-Id: <20261126-macronix-upstreaming-spi-nor-cleanup-v2-3-672a59abed62@bootlin.com>
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

Some Macronix parts have support for reading SR2, in which case the
opcode 0x15 will be used. Since the opcode is now cleared by default,
opt-in for the parts whose datasheet documents RDCR.

Sometimes the JEDEC ID is not useful since Macronix has re-used IDs
across incompatible parts. In this case, another discriminant is used on
top (eg. SFDP support or 4B addressing capability):
- 128 Mbit variants (typically MX25L12805D) have no RDCR, but the
  MX25L12833F and MX25L12845G are SFDP-capable and have RDCR support.
  Use the SFDP presence to discriminate the RDCR capability.
- 256 Mbit variants have no RDCR support, except the MX25L25635F and
  MX25L25645G parts which happen to also be 4-byte-capable. Use that
  capability to discriminate RDCR support.

Some parts have no RDCR support at all. For those, SFDP overwrites the
manufacturer defaults and restores the JEDEC opcode (0x35) and 16-bit
writes when the BFPT reports QER_NONE. Clear them again from the
catch-all late_init, which runs before the per-part opt-in fixups.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/macronix.c | 60 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 92241f7b0057..9a40c2b14cb4 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -14,6 +14,7 @@
 #define MXIC_NOR_ADDR_CR2_DC	0x00000300	/* CR2 address for setting dummy cycles */
 #define MXIC_NOR_REG_DOPI_EN	0x2		/* Enable Octal DTR */
 #define MXIC_NOR_REG_SPI_EN	0x0		/* Enable SPI */
+#define MXIC_NOR_OP_RDCR	0x15		/* Read Configuration Register opcode */
 
 /* Convert dummy cycles to bit pattern */
 #define MXIC_NOR_REG_DC(p) \
@@ -25,6 +26,27 @@
 		   SPI_MEM_OP_NO_DUMMY,				\
 		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
 
+/*
+ * RDCR support is not tied to the presence of SFDP, but the SFDP
+ * presence is sometimes enough to discriminate parts with the same
+ * JEDEC ID wrt their RDCR support.
+ */
+static bool macronix_nor_has_sfdp(const struct spi_nor *nor)
+{
+	return nor->sfdp;
+}
+
+static int macronix_rdcr_late_init(struct spi_nor *nor)
+{
+	nor->params->opcodes.read_sr2 = MXIC_NOR_OP_RDCR;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups macronix_rdcr_fixups = {
+	.late_init = macronix_rdcr_late_init,
+};
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -38,9 +60,15 @@ mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 	 * We need a way to differentiate MX25L25635E and MX25L25635F, and it
 	 * seems that the F version advertises support for Fast Read 4-4-4 in
 	 * its BFPT table.
+	 *
+	 * The MX25L25635F and MX25L25645G variants also have a configuration
+	 * register readable with RDCR; the MX25L25635E does not. Use the same
+	 * Fast Read 4-4-4 bit to enable both.
 	 */
-	if (bfpt->dwords[SFDP_DWORD(5)] & BFPT_DWORD5_FAST_READ_4_4_4)
+	if (bfpt->dwords[SFDP_DWORD(5)] & BFPT_DWORD5_FAST_READ_4_4_4) {
 		nor->params->flags |= SNOR_F_4B_OPCODES;
+		nor->params->opcodes.read_sr2 = MXIC_NOR_OP_RDCR;
+	}
 
 	return 0;
 }
@@ -338,9 +366,22 @@ static void macronix_nor_default_init(struct spi_nor *nor)
 
 static int macronix_nor_late_init(struct spi_nor *nor)
 {
-	if (!nor->params->set_4byte_addr_mode)
-		nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
-	nor->params->set_octal_dtr = macronix_nor_set_octal_dtr;
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	/*
+	 * SFDP restores the JEDEC RDCR opcode (0x35) and 16-bit writes when
+	 * the BFPT reports QER_NONE. Macronix does not use 0x35, and a
+	 * 16-bit WRSR would send zeroes to a CR we cannot read. Clear them
+	 * again; the per-part 0x15 opt-in fixups run after this one.
+	 */
+	if (params->opcodes.read_sr2 == SPINOR_OP_RDCR) {
+		params->opcodes.read_sr2 = 0;
+		params->opcodes.write_sr1_and_sr2 = 0;
+	}
+
+	if (!params->set_4byte_addr_mode)
+		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
+	params->set_octal_dtr = macronix_nor_set_octal_dtr;
 
 	return 0;
 }
@@ -352,6 +393,17 @@ static const struct spi_nor_fixups macronix_nor_fixups = {
 
 static const struct spi_nor_fixup macronix_fixups[] = {
 	{ .fixups = &macronix_nor_fixups },
+	{ .id = SNOR_ID(0xc2, 0x20, 0x18), .match = macronix_nor_has_sfdp,
+	  .fixups = &macronix_rdcr_fixups },
+	{ .id = SNOR_ID(0xc2, 0x20, 0x1a), .fixups = &macronix_rdcr_fixups },
+	{ .id = SNOR_ID(0xc2, 0x20, 0x1b), .fixups = &macronix_rdcr_fixups },
+	{ .id = SNOR_ID(0xc2, 0x20, 0x1c), .fixups = &macronix_rdcr_fixups },
+	{ .id = SNOR_ID(0xc2, 0x23, 0x14), .fixups = &macronix_rdcr_fixups },
+	{ .id = SNOR_ID(0xc2, 0x25, 0x3a), .fixups = &macronix_rdcr_fixups },
+	{ .id = SNOR_ID(0xc2, 0x25, 0x3b), .fixups = &macronix_rdcr_fixups },
+	{ .id = SNOR_ID(0xc2, 0x25, 0x3c), .fixups = &macronix_rdcr_fixups },
+	{ .id = SNOR_ID(0xc2, 0x28, 0x15), .fixups = &macronix_rdcr_fixups },
+	{ .id = SNOR_ID(0xc2, 0x28, 0x16), .fixups = &macronix_rdcr_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x18), .fixups = &mx25l12805d_4pp3b_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x19), .fixups = &mx25l25635_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x1a), .fixups = &macronix_qpp4b_fixups,

-- 
2.56.0

