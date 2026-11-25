Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629750;
	b=JCrsBDcRY1qdL+xijddzZUU0GRvx0116eqpgZ/lt+/bji1rPu6nHnNjPvc3YbzVRJSax
	 u6IGmYvYggbek/vYWfF9Lv/s5/Zv+SooDVOIBij+KiRepX8bXix5U4P3lJxiN7SR6Ls8z
	 DTwQpeqJRE1+ZDKugKfB/ecGmzlqF9cRfLFe95bG6X9nLrma41vQtWSIlEVHTJdbO1IJl
	 2NjTENgEWdQFDif/C824nW7ilDPifvJ90hYWmUOdxJfIZIkA0CW/tIJRYCYn7D0i5AxcL
	 E1az0Jugswf5yruUGbGI5kyHLwsLhXMsEh82upnU1xrDdwPYPU4lU4hZh5YvP84/dGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629750;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=amXACxc6kvuFOioEPYVn0GJszMbjP2vQ2jHUimjGnwU=;
	b=b9SogCz1Q8kMUQcmQ6vJ94EXPzcJRAoxkdLKtwNQDPl2TJ7Tg9HXHpYUdgkdxpezp0oI
	 2Yoy3SfUlUCyrpqrblvakYTuJot3AaNlb98aSw19UMlkPvOThBzm1e164puWvwLQ+SjRG
	 RfomaRH+gzJceoYA4n/1EohMyO9E35iE5Biy6nq4wjwgUub/AeH457lLXRy3nN4LlVW0P
	 2DilfSjpBrnM2apl5JXrV6N3iMyxu7WClDThotkLIfWODFuHUN+rXMhAQVqoloUNxS8VB
	 4l7qC0jwsvH6R0IriN4FMAudtmy2bOetJKWiuy5GJuQmwD25Eo5hspfCH+34H43NFfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="qc/fJomL";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588D7606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 588D7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qc/fJomL
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B126F1A17FB;
	Wed, 25 Nov 2026 18:02:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8041160480;
	Wed, 25 Nov 2026 18:02:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3A7811E6B08C;
	Wed, 25 Nov 2026 19:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629743; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=amXACxc6kvuFOioEPYVn0GJszMbjP2vQ2jHUimjGnwU=;
	b=qc/fJomL7OWuco4DNUdISPLPOLQbm1ca6x2KqzJ55u1ygNUJ7XS1a0tr3Lt38vWKY2QT0c
	k9bENsX3PlTwU3mVAta3QyUE3hro/h9hNUWWhIO3IFWPIqb9jk9anybyCZ5t4qo8ALLM/y
	HoTJUgUia9E9aTqAyN89enKS3nLiMyPu0hLrC/mqERDjj/05KGXmjTQJG5fCmFQQuwpIIa
	Wfcn6+4oRiW3n26XcPY5g6jpy6aAXR8NBlRzMTPYuWV/8scNzESXbWK8vlG7Fk0OBqZCjo
	1OgirsMoGbH4olu0KqhB3JzLxbyAMby7W2RR5VIrXY8wqIlnpzCl93hsQff45A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 19:01:35 +0100
Subject: [PATCH 2/4] mtd: spi-nor: macronix: Clear the RDCR opcode on
 MX25L3255E
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
Message-Id: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-2-0d1ab783fd8b@bootlin.com>
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

The MX25L3255E BFPT table is incorrect which leads to the RDCR opcode to
be reset. Make sure the configuration for this chip remains correct.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/macronix.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 2c6f507a2dde..0331f9f3f853 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -64,13 +64,14 @@ mx25l3255e_late_init_fixups(struct spi_nor *nor)
 	struct spi_nor_flash_parameter *params = nor->params;
 
 	/*
-	 * SFDP of MX25L3255E is JESD216, which does not include the Quad
-	 * Enable bit Requirement in BFPT. As a result, during BFPT parsing
-	 * the quad_enable mask is reset. Therefore, it is necessary to
-	 * correct this setting by late_init.
+	 * SFDP of MX25L3255E does not include the Quad Enable bit
+	 * Requirement in BFPT. As a result, during BFPT parsing the
+	 * quad_enable mask and RDCR opcode are reset. Ensure these
+	 * values remain valid.
 	 */
 	params->qe_mask[0] = BIT(6);
 	params->qe_mask[1] = 0;
+	params->opcodes.read_sr2 = 0;
 
 	/*
 	 * In addition, MX25L3255E also supports 1-4-4 page program in 3-byte

-- 
2.56.0

