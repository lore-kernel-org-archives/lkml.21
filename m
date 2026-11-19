Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126468;
	b=dUZtR7n824FMvd8XAf9UtYPRwX3BQ0UWNA7eJpU+xqA7pii9bSXEby5TveYvFPIwJZ6L
	 mnLRxX8rwTj6vlFuJWbUPJtq29UEKu5E4P1IDo1AYu3oDy7zNMbIt4y7SL0bhazECOOM/
	 PEDcO5HT2nn6+Mp5s3LbPQxESkOZKmO6IqXLiJDhDdanFiuJdDCgA03vE99Is95ALiGqS
	 IeZhu1hQdL15Ob4DCXPaH0AE4kAjHg7N//D4SsqEJkWrswdu+omOhsFtyRialHMQ4ZoOK
	 kHsnWdUpS7x3erj0Uh7qnz2z0JInlpZItZoHrh6DPzr6BlqIYam48MVISZwlqb4PcCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126468;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=jZeCS40OK7HJbunFqLZIEhdAmegoej64W6ZGj2lsJew=;
	b=CsxhTjZ/hhNRAD99yd1MkLQMMK9443idAcUqJk/aQ6nglSaYle6R6L61nzRbpF0LOOGA
	 vHxYV7Oi4zFqtPTXnHxGGsMZc8WX0SdI2/9ta7h4SAZd4f7yibKOOJZJHNkJy9sD93OY+
	 GQ2OZDNSkFVhS6LU0j5DPcVxmXSZFq8HZ1LC4O86lfr4MChghnw/aTD1PV3pX5CoA9Fzu
	 Eb8LpPRHMXHdauYJw9WcNoMRI5y3Dg+zI+rLQzcvbxekv8loJQj4XTO5AqlC6ybmZF1Dj
	 suuIPH5/DByM8mKApvPoOzF8SzXJ+3+cH4OTwDIKgK9W7SyCgbUVwrPuQjHeFyDxeTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HnDol19v;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B78B606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B78B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HnDol19v
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A45B64E41676;
	Thu, 19 Nov 2026 22:14:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A66B6035B;
	Thu, 19 Nov 2026 22:14:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBD9711BC0623;
	Thu, 19 Nov 2026 23:14:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795126461; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jZeCS40OK7HJbunFqLZIEhdAmegoej64W6ZGj2lsJew=;
	b=HnDol19vEThSW//G26TjA3IwmN2arDWpipauVIqyaxQvuHFpeb6/SsMZEjFFC7N+BMJ5QV
	IakBhW/pWgnx8SpRENr4+rR56l/qcUJWfhQmiM0I+XYXMf0EuSx8MgtJrgP2KlElapQAEQ
	UoMJEJ6toKSLrYErPCSf23BbskIoaX4RR6zQrx4nLd3d14ZJc+y30KUmMUNU0kUrfR7u11
	pbDxXdkuni1+kvwhwYvM2XZ34mxkxsSUsUkipni6lDoJtqIpojAM2TfdstYPoBRqDpfTV6
	KaE3RlbmGxKX7sRUeZoouF6dXn+nHUrw/xjdVqcLwHH1XZ92IiTBfOHGC0+HpQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 19 Nov 2026 23:13:52 +0100
Subject: [PATCH 2/4] mtd: spi-nor: Factorize out the bank mask derivation
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
Message-Id: <20261119-macronix-upstreaming-spi-nor-rww-guard-v1-2-da72ad9c2d4e@bootlin.com>
References: <20261119-macronix-upstreaming-spi-nor-rww-guard-v1-0-da72ad9c2d4e@bootlin.com>
In-Reply-To: <20261119-macronix-upstreaming-spi-nor-rww-guard-v1-0-da72ad9c2d4e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Cheng Ming Lin <linchengming884@gmail.com>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The program/erase and read helpers each walk the bank range to test it
against used_banks, and do it again when ending the operations to clear
the bits. Create a helper to compute those masks.

No functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 60 ++++++++++++++++++++--------------------------
 1 file changed, 26 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index fdd6ff1e0aba..7394c9a17334 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1152,6 +1152,20 @@ static void spi_nor_offset_to_banks(u64 bank_size, loff_t start, size_t len,
 	*last = DIV_ROUND_DOWN_ULL(start + len - 1, bank_size);
 }
 
+static unsigned int spi_nor_banks_mask(struct spi_nor *nor, loff_t start,
+				       size_t len)
+{
+	unsigned int mask = 0;
+	u8 first, last;
+	int bank;
+
+	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
+	for (bank = first; bank <= last; bank++)
+		mask |= BIT(bank);
+
+	return mask;
+}
+
 /* Generic helpers for internal locking and serialization */
 static bool spi_nor_rww_start_io(struct spi_nor *nor)
 {
@@ -1254,24 +1268,18 @@ void spi_nor_unlock_and_unprep(struct spi_nor *nor)
 static bool spi_nor_rww_start_pe(struct spi_nor *nor, loff_t start, size_t len)
 {
 	struct spi_nor_rww *rww = &nor->rww;
-	unsigned int used_banks = 0;
-	u8 first, last;
-	int bank;
+	unsigned int banks;
 
 	guard(mutex)(&nor->lock);
 
 	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
 		return false;
 
-	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
-	for (bank = first; bank <= last; bank++) {
-		if (rww->used_banks & BIT(bank))
-			return false;
+	banks = spi_nor_banks_mask(nor, start, len);
+	if (rww->used_banks & banks)
+		return false;
 
-		used_banks |= BIT(bank);
-	}
-
-	rww->used_banks |= used_banks;
+	rww->used_banks |= banks;
 	rww->ongoing_pe = true;
 
 	return true;
@@ -1280,15 +1288,10 @@ static bool spi_nor_rww_start_pe(struct spi_nor *nor, loff_t start, size_t len)
 static void spi_nor_rww_end_pe(struct spi_nor *nor, loff_t start, size_t len)
 {
 	struct spi_nor_rww *rww = &nor->rww;
-	u8 first, last;
-	int bank;
 
 	guard(mutex)(&nor->lock);
 
-	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
-	for (bank = first; bank <= last; bank++)
-		rww->used_banks &= ~BIT(bank);
-
+	rww->used_banks &= ~spi_nor_banks_mask(nor, start, len);
 	rww->ongoing_pe = false;
 }
 
@@ -1330,24 +1333,18 @@ static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t start, size
 static bool spi_nor_rww_start_rd(struct spi_nor *nor, loff_t start, size_t len)
 {
 	struct spi_nor_rww *rww = &nor->rww;
-	unsigned int used_banks = 0;
-	u8 first, last;
-	int bank;
+	unsigned int banks;
 
 	guard(mutex)(&nor->lock);
 
 	if (rww->ongoing_io || rww->ongoing_rd)
 		return false;
 
-	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
-	for (bank = first; bank <= last; bank++) {
-		if (rww->used_banks & BIT(bank))
-			return false;
+	banks = spi_nor_banks_mask(nor, start, len);
+	if (rww->used_banks & banks)
+		return false;
 
-		used_banks |= BIT(bank);
-	}
-
-	rww->used_banks |= used_banks;
+	rww->used_banks |= banks;
 	rww->ongoing_io = true;
 	rww->ongoing_rd = true;
 
@@ -1357,15 +1354,10 @@ static bool spi_nor_rww_start_rd(struct spi_nor *nor, loff_t start, size_t len)
 static void spi_nor_rww_end_rd(struct spi_nor *nor, loff_t start, size_t len)
 {
 	struct spi_nor_rww *rww = &nor->rww;
-	u8 first, last;
-	int bank;
 
 	guard(mutex)(&nor->lock);
 
-	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
-	for (bank = first; bank <= last; bank++)
-		nor->rww.used_banks &= ~BIT(bank);
-
+	rww->used_banks &= ~spi_nor_banks_mask(nor, start, len);
 	rww->ongoing_io = false;
 	rww->ongoing_rd = false;
 }

-- 
2.56.0

