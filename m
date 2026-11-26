Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700564;
	b=SiRnkymBtR4liFSHi8ognnYdZ4utYdVFMRYZnleEOFECXKIdeIzI10VqUr8HtyXBFYwt
	 9fRb5IdRbNbLHYu6kV7tRVyEy6lr5SydrX3+C2rnWF8v2/o5ZEr36zeXA0Ghxs5hkAZYi
	 v7FARCAVJU52SbnDdcMwU3e1WmTdLUn99bRd33hW2mdI+I7n7721SBHdKyYz4V56FJD4t
	 iI+M9SEuOfROWXkUHJRfB4W/BEP4K7KwA/0Din/J0kMmYDCAANB+xaKx/0yDPiDrY22bU
	 JnOpgItSo4aMYzHTaHDscSyD+Ouq+jgpUYfR4HBSA2pyIAvcHEi6Yhq/MTFBvoaJ2wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700564;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=wSEKEajLM9ooDBuCls/LQ3V2KNtkuaze/IwA+roNk8I=;
	b=OcuUdGQc+RQ0WZ0x8/e2knKP+JNhD3hQUQO0GM4FuHtLvAuZO9RsHW+6HeSkQ10mh4ri
	 eA4BTulkhkj5OR3C1zlIrbQEGdWCmoGp9Fw4pFTpCvnpZtqrT8NoB90zfKNmcVtItYnsD
	 8Nq3bf4r5aH38E/0SaRIAV2SBi45FVawkuDUM2d9Okj8UhxtWTEIdMG51WT6fOCXmU57i
	 EMVQ4oBZKfXLMeqV/dLuXOS1Hez1MFNTNZo2D8X1JA7y42A2MV/Zzwx7kykSP+aNZlvfo
	 uoYIscVWR8HcxBJ4jjhurChoGV/UWKk0ctxW6YDpeEunY7mly/5keivbkQzFRjuN+sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=izyB0PWS;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6A7606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B6A7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=izyB0PWS
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DB39A4E4167A;
	Thu, 26 Nov 2026 13:42:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A84C0604ED;
	Thu, 26 Nov 2026 13:42:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65DF611E68308;
	Thu, 26 Nov 2026 14:42:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795700561; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wSEKEajLM9ooDBuCls/LQ3V2KNtkuaze/IwA+roNk8I=;
	b=izyB0PWSIzxIKmoyxnoEQZZb3gWF3uf51YOoccZFb7Rde7BITmlz84CUUeJvZHBuFpN1rM
	ekveZX6FGry8rPFyDv/FMKL4RQSHY5rS9l/eaMujcER37gCFcIgwK6fCopPt8reOdgy7k+
	fmEvPLik2u/TZ2QanOiXQGU4CKVKOa4/WkjhyFg0q9Lvl14BsOxS0UB8fid1ivFsH8dvO4
	I226j2xhQzjASHTsqE0mH2QHowhzf+58PaPymiA4pUXxYQj9guz1GPTKlRTXjA2BrrGymB
	wT5bgKtWBOfA8FLaQ3qbfjehlGo0Msl0h6FarEDQcFU4yh7DkuEq4ALFmpVZ0g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Nov 2026 14:42:27 +0100
Subject: [PATCH v2 2/4] mtd: spi-nor: macronix: Drop redundant MX25L3255E
 QE settings
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
Message-Id: <20261126-macronix-upstreaming-spi-nor-cleanup-v2-2-672a59abed62@bootlin.com>
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

The MX25L3255E BFPT is JESD216 rev 0 (9 DWORDs), so spi_nor_parse_bfpt()
returns before it updates the QE mask. Since macronix_nor_default_init()
already sets a valid qe_mask[] for this part, there is no need to set
them here again.

Drop the now redundant assignments and keep only the 3-byte 1-4-4 page
program setup which is still required.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/macronix.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 163f1006130b..92241f7b0057 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -64,18 +64,9 @@ mx25l3255e_late_init_fixups(struct spi_nor *nor)
 	struct spi_nor_flash_parameter *params = nor->params;
 
 	/*
-	 * SFDP of MX25L3255E is JESD216, which does not include the Quad
-	 * Enable bit Requirement in BFPT. As a result, during BFPT parsing
-	 * the quad_enable mask is reset. Therefore, it is necessary to
-	 * correct this setting by late_init.
-	 */
-	params->qe_mask[0] = BIT(6);
-	params->qe_mask[1] = 0;
-
-	/*
-	 * In addition, MX25L3255E also supports 1-4-4 page program in 3-byte
-	 * address mode. However, since the 3-byte address 1-4-4 page program
-	 * is not defined in SFDP, it needs to be configured in late_init.
+	 * MX25L3255E supports 1-4-4 page program in 3-byte address mode.
+	 * However, since the 3-byte address 1-4-4 page program is not defined
+	 * in SFDP, it needs to be configured in late_init.
 	 */
 	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_4_4;
 	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_4_4],

-- 
2.56.0

