Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021725;
	b=BLJ1IFHq4u6aiU5nj3HSlW+P5AAoH76ZNIL1f23YeH97saS0lg2U8xBSR2pKnG0mJzOV
	 ZLSR+0AInNJAQ/Lgo4PRT5CAwqwPlHQQuU+Bz5L7T9F74Z5m8RgCLwcEziBOu5foqvqe0
	 IEt47DIayyxz8tKw8cEUigI8Hw6s3LMyuY/DSAd7Sdq+HgvlyWz1phL/YyG1m8R+5myqp
	 w1zyM1vbg1x2G/SBIk7DIVs2LgsfuH11TAfe5Btee6CEIFQSDLukVompHL3Fe+Nk9852M
	 lvlyFZjAyOVa26vyobiNM2IToxwzd/6tIULoGGu+AlXQfyytN+Lyglxb1ui309mM4Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021725;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=6ROAKWurGwQBQg21aa+Gk05SXIUj01611757YOXQEa8=;
	b=npLAOkr5q79jt3ZTsJZeMr9raG/Qkgt7Rm7foxvgC4hcXOCNaNSqVXvpsN3hXDKl1n/8
	 3pW2KL5HmkoT+lv5db7pfuP3V1Ilwi1yto9E9uwCeI+2Ihy3dKWI62az+KeFffJNVaAwT
	 xIevUotx/jCvfLjW/m/dmjEzpdCBVQCSHgBx3goexz/t7NX1jFJLmptyCNSWv782N7Ud6
	 1CNc3s8vbpMNrI0Hxooz65WVqrJZZCfvSSq5G/phTbJfw4KPDrgv1tTM6W8hfl5aVHin9
	 xyUwqfJvDmGAqONt6XIUduQdak41AnA4zGRq3wvoQniyTYwx2PROv4kx7hKzSVeHviw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2PlbO3JI;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982E460A2605
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 982E460A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2PlbO3JI
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3E7FCC4F77E;
	Wed, 18 Nov 2026 17:08:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A37C5FE9B;
	Wed, 18 Nov 2026 17:08:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16EFE11BC2A13;
	Wed, 18 Nov 2026 18:08:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021722; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6ROAKWurGwQBQg21aa+Gk05SXIUj01611757YOXQEa8=;
	b=2PlbO3JITOgySMHgWquiFiihtCxdGm4tmkTA6UOUTbcDNMRbmUSvAa2w8ZNL3Bo7TCTP5j
	xm7CnPZcBYIoobiS3kXQ5QcPXeSk3i3zm2n9asOGB8lt48lO7ntt5rSr4c/HhDRlyHu5K+
	ld5AvA09wp5IN5IHzTYCfFDgUkXVcgnhSfXpZNmK0MxYFTulwwyreQOJwxv1AtPaZFsacN
	7HIPH69EEjAqkhm8qg0GRfwLgSz0S5ke8V2b8wlA5ohMF/7vKB0hnegES+Ohi6VXENaIYC
	SsbDGmARx8jl1hvDNk+n3ungvqVu2u83sUjUCHcV7KsbqsyE+UsfwoptYAVWiQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:19 +0100
Subject: [PATCH v2 02/13] mtd: spinand: winbond: Generalize the KV OOB
 layout
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
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-2-55956313d6cb@bootlin.com>
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

All W25NxxKV and W25NxxKW chips use the same OOB layout. Rename the
helpers and structures to make it more obvious.

Reviewed-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 52 ++++++++++++++++++------------------------
 1 file changed, 22 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 49fa545a4113..bf5696037b75 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -318,16 +318,11 @@ static int w25n01kv_ooblayout_ecc(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-static int w25n02kv_ooblayout_ecc(struct mtd_info *mtd, int section,
-				  struct mtd_oob_region *region)
+static int w25nxxkv_kw_ooblayout_ecc(struct mtd_info *mtd, int section,
+				     struct mtd_oob_region *region)
 {
-	int num_sections = 4;
-	int offset = 64;
-
-	if (mtd->oobsize == 256) {
-		num_sections = 8;
-		offset = 128;
-	}
+	unsigned int offset = mtd->oobsize / 2;
+	unsigned int num_sections = mtd->writesize / 512;
 
 	if (section >= num_sections)
 		return -ERANGE;
@@ -338,24 +333,21 @@ static int w25n02kv_ooblayout_ecc(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-static int w25n02kv_ooblayout_free(struct mtd_info *mtd, int section,
-				   struct mtd_oob_region *region)
+/*
+ * The OOB layout is the same for all the W25NxxKV/KW/LV/LW chips: each
+ * 16-byte section holds 4 unprotected "User Data II" bytes followed by
+ * 12 ECC-protected "User Data I" bytes.
+ *
+ * This layout exposes both User Data I and II for backward compatibility.
+ */
+static int w25nxxkv_kw_ooblayout_free(struct mtd_info *mtd, int section,
+				      struct mtd_oob_region *region)
 {
-	int num_sections = 4;
-
-	if (mtd->oobsize == 256)
-		num_sections = 8;
+	unsigned int num_sections = mtd->writesize / 512;
 
 	if (section >= num_sections)
 		return -ERANGE;
 
-	/*
-	 * For at least W25N04KW and W25N04LW, this region is actually
-	 * split in two:
-	 * ECC-protected "User Data I" at + 4 offset, length 12
-	 * unprotected "User Data II" at + 2 offset, length 2
-	 * This returns the full region for backwards compatibility.
-	 */
 	region->offset = (16 * section) + 2;
 	region->length = 14;
 
@@ -364,12 +356,12 @@ static int w25n02kv_ooblayout_free(struct mtd_info *mtd, int section,
 
 static const struct mtd_ooblayout_ops w25n01kv_ooblayout = {
 	.ecc = w25n01kv_ooblayout_ecc,
-	.free = w25n02kv_ooblayout_free,
+	.free = w25nxxkv_kw_ooblayout_free,
 };
 
-static const struct mtd_ooblayout_ops w25n02kv_ooblayout = {
-	.ecc = w25n02kv_ooblayout_ecc,
-	.free = w25n02kv_ooblayout_free,
+static const struct mtd_ooblayout_ops w25nxxkv_kw_ooblayout = {
+	.ecc = w25nxxkv_kw_ooblayout_ecc,
+	.free = w25nxxkv_kw_ooblayout_free,
 };
 
 static int w25n08lw_ooblayout_ecc(struct mtd_info *mtd, int section,
@@ -786,7 +778,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W25N02KW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -795,7 +787,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W35N02JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),
@@ -818,7 +810,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W25N04KW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x23),
 		     NAND_MEMORG(1, 2048, 128, 64, 4096, 40, 1, 1, 1),
@@ -827,7 +819,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W25N04LW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb2, 0x23),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),

-- 
2.56.0

