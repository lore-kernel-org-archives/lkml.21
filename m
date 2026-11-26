Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700563;
	b=Ef6ZrEXLph9ZKGLSjZ7HC1QFcXPnS1olcmCtxkMxL2CHwjNsLQYhPP9bXhe0FHpqEPMA
	 WnVynVE3xlEPjBNj6aD8rHDE+IDG0PqmA6krhSvgdjourOOtzC/iUuMGtCJWYiTCWI8gD
	 q1ap2GZw2lbsYHFCJh2Kn5YLFsNcwMvz2TYizn8Z/xXlRv6PfhHcCKuD7UP3ep9PtDAv0
	 AXiRD7f9KGz5DycoGZoTbvTAD2ga/JwXKT6zb8BAROwXo2WDtKZCrPBNZw4yQLETIEG2m
	 /oTyu6Aq25or7WdtHhL1HNmzW/fYhSR3TRdla2czI46P94cjCIs6UJOLMBszBti6teg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700563;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=tcpLrBX/t5+43fRsmRy2vkgzzwO0kLioQKusayRaqCE=;
	b=zSBdzbGUgILj6syawbRY+s6zow8+oeDXhw4SrUXxUHbKsAxBn/M3sunftUqId/4NckPp
	 UX4X0sY1VQuA/XFpjoXEUfSQkjNXhuDyHRrREstSpQ2f29JpLdhZk/z0MYAqIk29eruWC
	 c1Ee2mNDJjTbXzCNApHLN7Ub4WYXWOq3Z0mQ/KNOJXyTFXXpWsULi5LiI+DN1+La6RqWL
	 xda+CPFqteF6VDXj7huHUL+Qu/w//WxFuL0K0+sgGDN+v0ncwYe/uwzz7WwM8IaoizBXW
	 d3BBVUDVZy3jox1DnLiJUbMnNuwK443oLv7MiOCJuRfGlmrwsSI4FRt/+VuZf5QkFxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hBnwyFWC;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B83606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70B83606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hBnwyFWC
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4A7F3C2B9D1;
	Thu, 26 Nov 2026 13:42:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F17EB604ED;
	Thu, 26 Nov 2026 13:42:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3020D11E682FC;
	Thu, 26 Nov 2026 14:42:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795700559; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tcpLrBX/t5+43fRsmRy2vkgzzwO0kLioQKusayRaqCE=;
	b=hBnwyFWCDuGhklgN8a+pXBIjLFWtvoEwOPMGV1dHtxBVRq8UeK1QskqIup6fnn+MAs+QI3
	f/zvDOMS0z7s7Or8/KFs+ytNkYJk0nP4y8xpXAuRM7Ogn+abtq+n+Y3LW4l+hOEPKHL6G2
	T/xjQh/UdSh5fXNDte2v0g6Lmg04d3fi04hhxQLD4QQdkw48PWiCIqHeD4fcRnpg4aml91
	CvnjML+7w8cTbHiCPO28bVs3FuGwLifnhB6316FTAB9SbfkggYi4O3tbutgbcqpIaT3lMP
	sx1k9m8BZDoZE5Qq1SSJgFTg3Z7jv176zGI+A70r+rNsT0x5jK8GfsyTpOfgrg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Nov 2026 14:42:26 +0100
Subject: [PATCH v2 1/4] mtd: spi-nor: macronix: Clear the default RDCR
 opcode
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
Message-Id: <20261126-macronix-upstreaming-spi-nor-cleanup-v2-1-672a59abed62@bootlin.com>
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

The core defaults opcodes.read_sr2 to the JEDEC RDCR opcode (0x35) and
opcodes.write_sr1_and_sr2 to the 16-bit Write Status command. Macronix
flashes do not use 0x35 to access their configuration register; they
read it with 0x15, and some parts have no configuration register at all.
A 16-bit write would then send zeroes to a register we cannot read.

Clear the RDCR opcode and default to 1-byte SR1 writes in the
manufacturer default_init, which runs after the core default and before
the SFDP parsing. Parts that do support the vendor opcode can opt in from
their own fixup, and SFDP will still select 16-bit writes for parts that
require them.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/macronix.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index b3fdb4b2fa1c..163f1006130b 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -333,6 +333,16 @@ static void macronix_nor_default_init(struct spi_nor *nor)
 {
 	nor->params->qe_mask[0] = BIT(6);
 	nor->params->qe_mask[1] = 0;
+
+	/*
+	 * The JEDEC RDCR opcode (0x35) is not valid for Macronix: some parts
+	 * have no CR at all, others use 0x15. Clear the core default. Parts
+	 * that do support the vendor opcode but do not carry proper SFDP tables
+	 * can opt-in from their own fixup.
+	 */
+	nor->params->opcodes.read_sr2 = 0;
+	nor->params->opcodes.write_sr1 = SPINOR_OP_WRSR;
+	nor->params->opcodes.write_sr1_and_sr2 = 0;
 }
 
 static int macronix_nor_late_init(struct spi_nor *nor)

-- 
2.56.0

