Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629751;
	b=YvDvQoz0o14J/fRkgQ6L2Y9PfRT3FDpn6jEYpCRA3XHF/Z1fkrbURDJz9hb91sHc067Z
	 YY+4F0ZS9YFioGWfe+me79qBrcYeW5caLKveuWsax+4cgy7Ife6EkQcf+5JlBDUn7huWl
	 18jNUaV+7krg/0aKeLiU+eH20qCRD0kxuT2KMdgvJ+jS8j30+04IXVO03TS2Yg8XtbOvO
	 4OVMBjrL43wu1N2gr5GU+rHk4jl8QJo7stgvP/9hEUM5c+Fbt0ogAvcyXoSncVabAgB26
	 c5ezZmdZOx0qoyTCa6VHoflxRSqRQKkEKCYqtrmae/HbLSgVhTOQSRD+5fp4Cw9JSsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629751;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=JZlnY/+8JJmnOxK7DEynKE5pye32jZM2rFINNsb4/44=;
	b=Z+XJf4FDvDdn5WEhz/AuWHJkL+bAp3yN9yE9U5ukyaZWq3W3HRbdH5sClNtaJ4OdN+OC
	 cKx4mjhXFvL+HBGkJAITFlIrgiGONlvnN8vGhO2KKeJB4bqZ3AvOy1hCRHodhsmv8WVo2
	 HrdmY9Nh//O97ZB4IWJiRYWfELQwwTXNyboxjtjYry9SwPWOXayT++LljFrj8d5rZGn84
	 JO+9n3Vuev3Hr3P0KCzuG3o1zXywFEpAt0ey5keum2FFWfkIjkUFkRIkcf76sb36JMEgz
	 s75KBtsxtTdrcku9aYkwrpefiPqVHQc708smUuyWkzhG43N8yFO4L5MLjGxewoGDI8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="Dz7/791y";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396DE606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 396DE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Dz7/791y
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E34721A17FC
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:02:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8FBC60480;
	Wed, 25 Nov 2026 18:02:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0916C11E6B0E0;
	Wed, 25 Nov 2026 19:02:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629748; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JZlnY/+8JJmnOxK7DEynKE5pye32jZM2rFINNsb4/44=;
	b=Dz7/791y6DOcsoJ6Xolq8A02fbHxxw1hGzWlHyUz7cMi/06D6uRh1Fhgl73/l/ScJDsBkx
	iaVamKA5R5H1ZWyfnlYuMAgO7XIBPPFLEtw3cDCOEu0ZRMS+I8WKR/vltxB01qIwy2+HJs
	2+L+Ji7x4PbYopITZJG9MzEkGWyD5fsehNXJIRiGKRIf3NGR6I0tKPhQsEvyWfXdWhomfs
	Wmr4dVc8q9H1LRAaPGxmLCba2p0P7Ph0oQ0zm5AlsuEJJDaiHIN+2ezdk62DJDK0VQh4de
	WzvtE/lnfftr2t4WYAgAeKjux1VYjwFDZBXZa4K+WHvPeHwhlYvWDT8R4tzSDg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 19:01:36 +0100
Subject: [PATCH 3/4] mtd: spi-nor: macronix: Enable RDCR for the parts that
 support it
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
Message-Id: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-3-0d1ab783fd8b@bootlin.com>
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

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/macronix.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 0331f9f3f853..bbc41af14882 100644
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
@@ -359,6 +387,17 @@ static const struct spi_nor_fixups macronix_nor_fixups = {
 
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

