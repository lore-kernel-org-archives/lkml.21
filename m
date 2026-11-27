Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.108.101.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795823039;
	b=A8Ac03AE9Ayfp0f1onYXX5eVflHKBN0NKhlpRU6Bnrj0s+vihn/F9+LrYZVzM5VbnpRu
	 q6WKa4MN5J+mMKtkBjvRFz6tYFCOy3KFdhMyJomUTjdpVL6ETx2hp97ecD6OihxBvDL9k
	 OfuOjF5we63eXpYZ/3Aw46XPKGNbmba1soYdqitjt5Z7ORbEH2rwzE8nimiICL4vd/Zd9
	 nCysXF/s+eGZF+abZnjp53bDbBOWFOo4RR1jGWptyFgWR3u0PM8e7FI1xbXZ1R5wKWITt
	 3/vWEmwORkLNy81QVBPdXialX5ufUTgJZcKpViQI2oIeOootIeiXU1UZels9hVlszXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795823039;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hyH5xctCfSmUQx/A63BfRYH7Qc0jBej0X1hV87nxors=;
	b=EP0w53sujfJZsuDPvf9HhTb94x/IPNq6DxVEA5y8yyVoz4Zs43FBdPmke/HnuqAPyskz
	 kQszxHWHkjGiBMmPwNywIhW5eoE8pf/fVfYqKr9u2ZQLjglxaY6Y5OIKyBW6FHDYheV1U
	 ruyGOyqyJ/FIwB12jSuBYTXGEXfaDbhyDs12+cGi4MU6+dK44pdQdog6zIukDpYItVaF/
	 pgD/erkhryyzhUl+bOcN7417o/RXWN/pj5MDYeAXI91j9PKiF/royX6rVZbzzj/Pn47dN
	 mJDX4WqXEaPiDc5JL4RFne3rkPyH/rGZgvmG6QlVu7PFCE8N6aiSOgPQsGsGzadt/zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vitkazik.cz;
	spf=pass smtp.mailfrom=vitkazik.cz;
	dkim=pass header.d=vitkazik.cz header.i=@vitkazik.cz header.a=ed25519-sha256 header.s=v1-ed25519-20261107 header.b=3vrt049d;
	dkim=pass header.d=vitkazik.cz header.i=@vitkazik.cz header.a=rsa-sha256 header.s=v1-rsa-20261107 header.b=vOEWq44Y;
	arc=none smtp.remote-ip=78.108.101.136
Received: from mail.vitkazik.cz (unknown [78.108.101.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D57606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3D57606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vitkazik.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vitkazik.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=vitkazik.cz header.i=@vitkazik.cz header.a=ed25519-sha256 header.s=v1-ed25519-20261107 header.b=3vrt049d;
	dkim=pass (2048-bit key, unprotected) header.d=vitkazik.cz header.i=@vitkazik.cz header.a=rsa-sha256 header.s=v1-rsa-20261107 header.b=vOEWq44Y
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20261107; d=vitkazik.cz; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1795823030; bh=hyH5xctCfSmUQx/A63BfRYH
	7Qc0jBej0X1hV87nxors=; b=3vrt049dWpX4YUJfs90CfIcbtHU/GLnzfXgfI50wm0yjDw/e77
	e2vM/Hj2wKlLlNQeI7sCDXzOulMpHqZvlaAw==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20261107; d=vitkazik.cz; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1795823030; bh=hyH5xctCfSmUQx/A63BfRYH
	7Qc0jBej0X1hV87nxors=; b=vOEWq44Y/9Kyp7Cf58NHxARHNku8nULR6CQtw+GemC7E56dAxz
	1MxMBJaq3OGgVNu1ulnPxEl5y1AiszGueNhw8lECmUI3sLUuBGukdk8iiuuR/ZJn1qjBk6ogomr
	el9wfqfquINls3q3AkZdxrIUi+GaR9xx2JOwuwktK3+mzoYjASC6hR2LYeIvyi7xNs1QXVkIWko
	n99/jX8V3U3Iw6nMrDXzjXTgdGtCNVIiNvBdQT+lZnYJWgveeTIULN2k6P9+wekGBzq2BDB6ymM
	R2viY1k/jLir3UmWJHF8fOXhLdlgT0TT8CLtulyXeXXXPeGeWesf+PBSrH1p14++Ezw==;
From: =?UTF-8?q?V=C3=ADt=20Kaz=C3=ADk?= <vitkazik@vitkazik.cz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: tudor.ambarus@linaro.org,
	m.felsch@pengutronix.de,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?V=C3=ADt=20Kaz=C3=ADk?= <vitkazik@vitkazik.cz>
Subject: [PATCH v2] mtd: spinand: micron: add support for MT29F1G01AAADD
Date: Sat, 28 Nov 2026 00:43:01 +0100
Message-ID: <20261127234301.262679-1-vitkazik@vitkazik.cz>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for the Micron MT29F1G01AAADD (M68A), a 1Gb 3.3V SPI NAND
with 2048+64 byte pages, 64 pages per block, two planes and 4-bit
on-die ECC.

The 64 spare bytes are split into four 16-byte sections, each with
2 reserved bytes, 2 bytes of unprotected metadata, 4 bytes of
ECC protected metadata and 8 ECC bytes. Add a layout that exposes
only the ECC protected bytes 4-7 of each section as free OOB space.

Tested on a Motorola NCAP-500 (Atheros AR7242) running OpenWrt
with kernel 6.18.64, using UBI with UBIFS.
The chip is detected correctly:

  spi-nand spi0.1: Micron SPI NAND was found.
  spi-nand spi0.1: 128 MiB, block size: 128 KiB,
  page size: 2048, OOB size: 64

Signed-off-by: Vít Kazík <vitkazik@vitkazik.cz>
---
v2:
- expose only bytes 4-7 of each section as free OOB space

 drivers/mtd/nand/spi/micron.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 36f6cbbd7462..34a8ea77c3fe 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -134,6 +134,24 @@ static const struct mtd_ooblayout_ops micron_4_ooblayout = {
 	.free = micron_4_ooblayout_free,
 };
 
+static int micron_m68a_ooblayout_free(struct mtd_info *mtd, int section,
+				      struct mtd_oob_region *region)
+{
+	if (section >= 4)
+		return -ERANGE;
+
+	/* 2 bytes for the BBM + 2 bytes of non-ECC protected memory */
+	region->offset = (section * 16) + 4;
+	region->length = 4;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops micron_m68a_ooblayout = {
+	.ecc = micron_4_ooblayout_ecc,
+	.free = micron_m68a_ooblayout_free,
+};
+
 static int micron_select_target(struct spinand_device *spinand,
 				unsigned int target)
 {
@@ -404,6 +422,16 @@ static const struct spinand_info micron_spinand_table[] = {
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status),
 		     SPINAND_SELECT_TARGET(micron_select_target)),
+	/* M68A 1Gb 3.3V */
+	SPINAND_INFO("MT29F1G01AAADD",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x12),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 2, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&x4_read_cache_variants,
+					      &x1_write_cache_variants,
+					      &x1_update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&micron_m68a_ooblayout, NULL)),
 	/* M69A 2Gb 3.3V */
 	SPINAND_INFO("MT29F2G01AAAED",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x9F),

base-commit: ec1e844b9486302a488abc03ea918db60709766e
-- 
2.56.1

