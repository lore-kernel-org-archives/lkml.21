Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021749;
	b=LJxr3o3Mg/sD9oL1crsQTA9/CGJG7VexIKx62Q6wL78PgXO5NDWKRsI1hqUFquzLmGe8
	 sCLDQ3YnlLH4sDQ6POEdC8mYytgSRiD/kQy49y43qOs1N1xwjH2NlvRpOIAcXQW9bBn1o
	 y6GjH3teQs9yJzKrUmLyS3PxS7b4KNPM1VupeFquYh4YHClgmsE33cDTKO/Rk3bmZ1FkL
	 ae2YfB76UO6O+tHvyShml35NdYQwOC0jraJGlw0+XKwtbZzdJ0D84/ZexVP0PcW3f6y/N
	 og1O2ox9r4FPM+E4jpGU3hsTAeeSc4YXGDknRZQxMJG9DRR1YrPqDHZ/N5hTbebjvwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021749;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=fLqr/v68/oCbAC/szyoyk5IrhiQHgk4K8tIbryhT7Ag=;
	b=DAz65+7gPIF5/kx5xWkZw5qw8I6iO4Dj0la8QhfAF0aLxGJcb/CcbgXaeUefTiKBkNyx
	 6mU7QiB0lVD/E+5Zb3gmnSLq+EkDhCUL2P3PaqzdOrn8Ozmv8kcIScp5QBVeHw2NAMWPK
	 PAKX6iDmAe+QYjJXRdV4jGZ3n6magR8DAyD62vyCUYSCZGJnUAhsQbN/YfCQjENf3mEbc
	 rMgxxDAijfWs4it72RZhZpkrpBcqN/39IGRWuByYxuEZhxPFGfBmOE7LGZaZcI4As3Sqn
	 FOTqE7OMwil/48iRfGatq7MfpISxQvC0lfi98ee0U+uNf5ysE++Q6RMk9O42yt/hgAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xJrAuTrm;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73417606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73417606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xJrAuTrm
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D11D6C4F77B;
	Wed, 18 Nov 2026 17:09:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ECAAE5FE9B;
	Wed, 18 Nov 2026 17:09:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A36511BC2A2D;
	Wed, 18 Nov 2026 18:09:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021742; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fLqr/v68/oCbAC/szyoyk5IrhiQHgk4K8tIbryhT7Ag=;
	b=xJrAuTrmVWZ0G2Hsq9tQoPRD6+uxXd/k88UB0spCmlPi51Ro8tbP2h3BZ5RqVG+kx1ycjw
	KLoA1/fjcSRwnejqpZ/gXUEA83vBuAWeIYbOY+phfgytIqOID5oxb3/ignhmfDne2Q3Z0c
	17fkKalqv++MGZfkKGqB6J7Vfhd5psDQ09cYZtoGrbr2AardIXjxJ1LEZMa+8wo0jdMWUy
	0xehm5sLvY2dYBzeBOZADV/qIb2FyLuGUYVNaF/j+ouJWyGqaOnOaOAkAvBPx3cnPppkts
	3oTa2TbtWbfZCM5XdgcGKGsJxfdRvpEBXn88r13lz1yjwbJ/ggucER60dymEKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:28 +0100
Subject: [PATCH v2 11/13] mtd: spinand: winbond: Add continuous read
 support for W25N04LV
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
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-11-55956313d6cb@bootlin.com>
References: <20261118-winbond-master-w25nxxlvw-v2-0-55956313d6cb@bootlin.com>
In-Reply-To: <20261118-winbond-master-w25nxxlvw-v2-0-55956313d6cb@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Daisuke Mizobuchi <mizo@atmark-techno.com>, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

LV chips have DDR support, otherwise they support the same variants as
the other chips.

$ nandcontreadtest /dev/mtd0
testing 2 blocks from 0 to 1 (2 good), seed 29
success: verified 524288 bytes read in 291.735 ms (1755.02 KiB/s)

$ flash_speed /dev/mtd0 -C
1 page read speed is 1673 KiB/s
2 page read speed is 1718 KiB/s
3 page read speed is 1737 KiB/s
4 page read speed is 1741 KiB/s
5 page read speed is 1764 KiB/s
6 page read speed is 1764 KiB/s
7 page read speed is 1762 KiB/s
8 page read speed is 1753 KiB/s
9 page read speed is 1774 KiB/s
10 page read speed is 1764 KiB/s
11 page read speed is 1774 KiB/s
12 page read speed is 1777 KiB/s
13 page read speed is 1777 KiB/s
14 page read speed is 1763 KiB/s
15 page read speed is 1777 KiB/s
16 page read speed is 1790 KiB/s
32 page read speed is 1777 KiB/s
64 page read speed is 1777 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index cdfd5a5778c6..1dc6d78a515d 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -882,11 +882,13 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x8b, 0x23),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&w25nxxlv_read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&w25nxxlv_read_cache_variants,
+							&write_cache_variants,
+							&update_cache_variants,
+							&w25nxxlv_cont_read_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status),
+		     SPINAND_CONT_READ(w25n_set_cont_read)),
 	SPINAND_INFO("W25N04LW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb2, 0x23),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),

-- 
2.56.0

