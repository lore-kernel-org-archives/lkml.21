Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629745;
	b=rnf+PybTVMkK4QCnLJ/ViwaRJxXObMJjaTk1Y67cm+XxeS9DUqAB6/NySORuPrVxsr29
	 NeDYCtldq65XQHNmL4/SkPXWEro2gLHMypAEoS67G75B8Z2Jw5vBKEj/X5xH6/sk0unQ+
	 WpfLkFL+HNOaqYN1hfIK+wEbKG++5rElI5CMrDw2UDdUgoDsvxj8ti4NsqPF73GZY2OdD
	 m8iyDO+LMbtOf4r6YmQQkc0yFCHMRYj5myFqTyr8cef5r6upz1j6N7WPDtfQnMNeUru8b
	 xKOzOlJvFNwagJXlL9meRbfjFN4d6XFNKNX/piQZpBCnGHzEQAqj2n9KDNvHtq1tX9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629745;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=WB/O/SzzxfI1IB+ENMpw/Jp+ewPq+nhyag1bzIRAVT4=;
	b=aN38tMopOY3O9GQNuRsBbu6mDw/V46W/082JMddiQKSC9eBV9eknpe3ex/nArGqPScUj
	 f6WiEMF0E/WXZMQpe56BbYkIX54gV+sJj6xmBJJdKvJqg/9Z92hWgaCrSN12E5WGmr7Jx
	 ApR0nfH8Rq+GnXgpEO+RWvJE0CILVj3szDllCUlM3dBDbwoFkeC5K2MG/oXSkZ00BvkSw
	 ytatUOWvp9LeY1/VZQWHi0RQVixu/pD9Y9C7+ZNxz1jPlsHyO7fFSqYcnkPyHEqvGHw0R
	 6rwJ1aBwoP6XGmPGF5+/m/I7rHEFM2dXnXp90GIhY4EI9WdYx7EjtLg62FMJ6ASd/mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Bjc0KQaI;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80628606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80628606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Bjc0KQaI
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 43B3EC6221E;
	Wed, 25 Nov 2026 18:02:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A96360480;
	Wed, 25 Nov 2026 18:02:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69D5711E6B0DF;
	Wed, 25 Nov 2026 19:02:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629738; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WB/O/SzzxfI1IB+ENMpw/Jp+ewPq+nhyag1bzIRAVT4=;
	b=Bjc0KQaINWjaBtAux9m+3Vgrc8Pyfwj6JNegOiBct9+ILRQczGnfmIcwZBGgKX6Hgw4rTP
	ysY822nEr33NeTV5kRonPBStd0VK3ChH7pWFl1blq0GuvPd5uBQnNEYkycA2W+7jWzQN7E
	4MSJ2l99WuW5StSmpCFcQj17N0uDlvmI8BErFiUue9GWT51W27e99KlsUKlie4VcOALqrq
	OALpFet9dOi5yRZGdxMMd4C+3320dgpp1aOimyuXd2Bwr0g5MG+ic0qqM1CE5Nqst5GFlG
	9xOFDSFf2++hkm+agyakZVfEWnjipS36hnc/Ju1bHVqbIYIqugDrGPwaw+WpMg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 19:01:34 +0100
Subject: [PATCH 1/4] mtd: spi-nor: macronix: Clear the default RDCR opcode
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
Message-Id: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-1-0d1ab783fd8b@bootlin.com>
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

The core defaults opcodes.read_sr2 to the JEDEC RDCR opcode (0x35).
Macronix flashes do not use 0x35 to access their configuration
register; they read it with 0x15, and some parts have no configuration
register at all.

Clear the opcode in the manufacturer default_init, which runs after the
core default and before the SFDP parsing. Parts that do support the
vendor opcode can then opt in from their own fixup.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/macronix.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index b3fdb4b2fa1c..2c6f507a2dde 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -333,6 +333,13 @@ static void macronix_nor_default_init(struct spi_nor *nor)
 {
 	nor->params->qe_mask[0] = BIT(6);
 	nor->params->qe_mask[1] = 0;
+
+	/*
+	 * The JEDEC RDCR opcode (0x35) is not valid for Macronix: some parts
+	 * have no CR at all, others use 0x15. Clear the core default. Parts
+	 * that do support the vendor opcode can opt-in from their own fixup.
+	 */
+	nor->params->opcodes.read_sr2 = 0;
 }
 
 static int macronix_nor_late_init(struct spi_nor *nor)

-- 
2.56.0

