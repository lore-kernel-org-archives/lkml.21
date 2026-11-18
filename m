Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021726;
	b=ntxuLxyGfdzwKyswokPkv4T0BvdxCKdbsBCSg8vqI22vwR3QrUUFZhSILgKZf0AVDLzL
	 Z58kGizi3WJRrxpcBByn7L+HIeMX5F0kzey/MwlGzjfi1xcwGQJDiKpAcx3LYek9EhEBS
	 +tVAVx+ahGunyymgEckjChEvDeD2+37AWDNTjpvdv7+Ri/4QG7b1b3U1FjxNiCROs4w2g
	 fihC+3DxY6GUngik4Ny58imQEMq2pbBfBVMvvOGGHRRb2iLj8TCrREXHR+5UmCiE4O2vj
	 NYqPGQe3Cc/mSiX4+M73Iqzuixvzc1zuw/6y++wct+KNiOfWTDOxEKfPiGS3YCr5r8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021726;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=nIo1pAkIk8swxehsOJTufgrMJR12HIoBthNUBkOnOis=;
	b=DD6sQcm/QPOzrVHjY70P5wWCQu6+exIpKawAYC4BtB8I5o38LXdoUWMcOOG7/joOv3DL
	 keBS2wsJAiE9XiXK2iolm4ujXDEYsMJWI/2Itsclz2VCQqtQrLDLSmiTH/SxC8lxOOmlM
	 P0QIX4QjWruNz9b5OQ9Pexx/863OoDXdrzua1i6fpAixDxab/wNdpeKzJQpDsrsH6/gco
	 NQphWOtwaeDuphPq6bmmtdtSDUkfJEwB15vJStbANCsR50PSdr0+ZcnBLzkspuFTLW/19
	 aRg00Xw/UzMMi/3B7BCI2mCEf8zq1Rb0LCfVX79ubkooggwTigiTuuzNVV09OVKZmAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=O4QWvleZ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CF860A2623
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53CF860A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=O4QWvleZ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 05EF71A16CB;
	Wed, 18 Nov 2026 17:08:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4A1F5FE9B;
	Wed, 18 Nov 2026 17:08:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7AA011BC2A08;
	Wed, 18 Nov 2026 18:08:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021723; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nIo1pAkIk8swxehsOJTufgrMJR12HIoBthNUBkOnOis=;
	b=O4QWvleZ9nJ3tN6xQFd0NOJm81A+AYhCzN0DRG18tOZGaLqwrAYGuR9T5/De4Bqb6WlbuH
	pjNxhwqAf8KZl/tNA4yCY21T0+zl5NkCDcl4TcInZKkNVHFuiy1QqQ88xtIEirkrNHknBY
	DRqVAXCbxSNVi7If97CCHz5+3VLW4q7YJSEgT9Gu/v4fAEfqsUfROHeNNiLvas9B64cZJi
	Q0uU7IFjJUatjFlChDvPSMMoAJq66f6KNrEtZxz4pox2zbSYFkpH9QKAYnwS7fkJR4RBjq
	Gy2EBNSemzIjnwbQUrDSuu91hM3eUz3SzPsvS/n1QcN+oXAg3OmK709RYod5uQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:20 +0100
Subject: [PATCH v2 03/13] mtd: spinand: winbond: Generalize the LW OOB
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
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-3-55956313d6cb@bootlin.com>
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

All W25NxxLV and W25NxxLW chips use the same OOB layout. Rename the
helpers and structures to make it more obvious, and improve the comment
to reflect this situation.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 43 ++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index bf5696037b75..0288788ff0d0 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -339,6 +339,8 @@ static int w25nxxkv_kw_ooblayout_ecc(struct mtd_info *mtd, int section,
  * 12 ECC-protected "User Data I" bytes.
  *
  * This layout exposes both User Data I and II for backward compatibility.
+ * See w25nxxlv_lw_ooblayout_free() for a variant that only exposes the
+ * ECC-protected bytes.
  */
 static int w25nxxkv_kw_ooblayout_free(struct mtd_info *mtd, int section,
 				      struct mtd_oob_region *region)
@@ -364,37 +366,38 @@ static const struct mtd_ooblayout_ops w25nxxkv_kw_ooblayout = {
 	.free = w25nxxkv_kw_ooblayout_free,
 };
 
-static int w25n08lw_ooblayout_ecc(struct mtd_info *mtd, int section,
-				  struct mtd_oob_region *region)
+/*
+ * The second half of the OOB is not accessible when the on-die ECC
+ * engine is enabled. This prevents accessing the ECC bytes.
+ */
+static int w25nxxlv_lw_ooblayout_ecc(struct mtd_info *mtd, int section,
+				     struct mtd_oob_region *region)
 {
-	/*
-	 * With ecc enabled the parity bits are not accessible. So we can
-	 * only see page + 128. Without ecc the full page + 256 is accessible.
-	 * To make it simple just return the area as not accessible.
-	 */
 	return -ERANGE;
 }
 
-static int w25n08lw_ooblayout_free(struct mtd_info *mtd, int section,
-				   struct mtd_oob_region *region)
+/*
+ * Same layout as w25nxxkv_kw_ooblayout_free(), except that only the
+ * ECC-protected "User Data I" bytes are exposed. The non ECC-protected
+ * "User Data II" bytes are not exposed.
+ */
+static int w25nxxlv_lw_ooblayout_free(struct mtd_info *mtd, int section,
+				      struct mtd_oob_region *region)
 {
-	if (section > 7)
+	unsigned int num_sections = mtd->writesize / 512;
+
+	if (section >= num_sections)
 		return -ERANGE;
 
-	/*
-	 * Only expose the ECC protected "User Data I" bytes. The "User Data II"
-	 * bytes at offset + 2 are not covered by the on-die ECC engine, and the
-	 * first two bytes of the section hold the BBM.
-	 */
 	region->offset = (16 * section) + 4;
 	region->length = 12;
 
 	return 0;
 }
 
-static const struct mtd_ooblayout_ops w25n08lw_ooblayout = {
-	.ecc = w25n08lw_ooblayout_ecc,
-	.free = w25n08lw_ooblayout_free,
+static const struct mtd_ooblayout_ops w25nxxlv_lw_ooblayout = {
+	.ecc = w25nxxlv_lw_ooblayout_ecc,
+	.free = w25nxxlv_lw_ooblayout_free,
 };
 
 static int w25n01jw_ooblayout_ecc(struct mtd_info *mtd, int section,
@@ -828,7 +831,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n08lw_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W35N04JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),
@@ -852,7 +855,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 							&update_cache_variants,
 							&cont_read_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n08lw_ooblayout, w25n02kv_ecc_get_status),
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25n02kv_ecc_get_status),
 		     SPINAND_CONT_READ(w25n0xjw_set_cont_read)),
 };
 

-- 
2.56.0

