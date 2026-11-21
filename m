Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.108.101.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304624;
	b=be8L83MUYFgZKrcvl43GxVJstGbnEbRloZDSga5sp9xXUtU2fqsZLkeyqbHKx925vdQH
	 LtyZy2ZWcTCFTMVKyQBSFzjFU+4iDp8zWXCGM+VyuUN5h5HchmNAAVMHpCbdCzZ2z0bZC
	 M5HeUW0h6TATnHCi6xAJyu8RFl/36Nr2IKbDR8tILbd1MFBpuNWs3OStiRRADNr04n/ub
	 kOathlfn2w4chyJXFwrdokYFTZ9v09TqGac4TdEAXCbimDRLh6p8iZjuf+5CPi6OKz+SB
	 997JH3PbuzgkgHPlU1dj1Xn3Av80UUgMQPFfiTrYwO4xQe4mkiDwZl+Np8QEaa3jxTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304624;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dQxHVLXRVtvTiVK3ZDZFUT2JZy2SgYhBAEXijNGW5Ak=;
	b=RnKZWTsMrLctsKGz+FKBQGjTw7rdey2wsElrmvi1uzJ7xi4Ytib/hE+PhaN9KVObuWJ5
	 BfB97VMZshKdn95aIITM/jKsn1r5HsV8qfVX+sbEV6aV9+H+HcO/YGaMlSWkbir6o0QeE
	 8TZ/QtQpyczhHxAszyg1hLzjh9kIWHvN2Z1J08woesUghwCxNeTGVo0o47MCemY6tOwkY
	 ncAIrSsJtk2nptmbwu4CoQz0HVBBP1JCTpxYf8G1C+Fe+/4kXhhYC+6v2gDhwj722EZr4
	 YxPBpi2vl3fE8jHSywxdsDfpc9MuFaaPjWEw00vzqbsdmYq2OxTFLmdzF7C9we88FWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vitkazik.cz;
	spf=pass smtp.mailfrom=vitkazik.cz;
	dkim=pass header.d=vitkazik.cz header.i=@vitkazik.cz header.a=ed25519-sha256 header.s=v1-ed25519-20261107 header.b=DhTcSk5g;
	dkim=pass header.d=vitkazik.cz header.i=@vitkazik.cz header.a=rsa-sha256 header.s=v1-rsa-20261107 header.b=p3y1RGps;
	arc=none smtp.remote-ip=78.108.101.136
Received: from mail.vitkazik.cz (unknown [78.108.101.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABED606A683
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ABED606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vitkazik.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vitkazik.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=vitkazik.cz header.i=@vitkazik.cz header.a=ed25519-sha256 header.s=v1-ed25519-20261107 header.b=DhTcSk5g;
	dkim=pass (2048-bit key, unprotected) header.d=vitkazik.cz header.i=@vitkazik.cz header.a=rsa-sha256 header.s=v1-rsa-20261107 header.b=p3y1RGps
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20261107; d=vitkazik.cz; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1795304609; bh=dQxHVLXRVtvTiVK3ZDZFUT2
	JZy2SgYhBAEXijNGW5Ak=; b=DhTcSk5gg7W9N7KvtLhlquKHbMZa4TvdAUkT8LKpvq67haQz2U
	2IyOi1+ZayUbvhX2Ar4V5/kOEvUxVWxsNkCA==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20261107; d=vitkazik.cz; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1795304609; bh=dQxHVLXRVtvTiVK3ZDZFUT2
	JZy2SgYhBAEXijNGW5Ak=; b=p3y1RGpsyLwg5jvxIQAW6ow4EQ5F6b1nNU1PijVEzuqQrcvJjv
	dAD1DZbhmLen2EOdVLpZNii4CRZo2UArs3zs6axnDwEjt3SrMuImOPkkwT9IemZjGGZ3fvWEsUm
	FSrKOhSwvZv3eg6Ntc8FoBF0xctxYKOHctfZqMjSy5yTsHWe5na3Dc61aCzdlCNZ+dlZnDUnBWu
	ngeAsKRMRhEUCAq55oaw9MmF3jjpyS182/bEctrlVx1g5g6jSZSLLfJV0WF3T7WocctcY0uYX4f
	W0rG3BTwXeDY4TZr9l7a1Z7oK+4Uv2aFkyyWIuFupXl4VWDK5O+QBk7c42IQjwBeqDQ==;
From: =?UTF-8?q?V=C3=ADt=20Kaz=C3=ADk?= <vitkazik@vitkazik.cz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: tudor.ambarus@linaro.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?V=C3=ADt=20Kaz=C3=ADk?= <vitkazik@vitkazik.cz>
Subject: [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
Date: Sun, 22 Nov 2026 00:41:24 +0100
Message-ID: <20261121234125.16093-1-vitkazik@vitkazik.cz>
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
2 reserved bytes, 6 free bytes and 8 ECC bytes. The existing
micron_4_ooblayout reports the reserved bytes of sections 1-3 as
free, so add a layout that exposes only bytes 2-7 of each section.

Tested on a Motorola NCAP-500 (Atheros AR7242) running OpenWrt
with kernel 6.18.39, using UBI with UBIFS for about 3 months.
The chip is detected correctly:

spi-nand spi0.1: Micron SPI NAND was found.
spi-nand spi0.1: 128 MiB, block size: 128 KiB,
page size: 2048, OOB size: 64

Signed-off-by: Vít Kazík <vitkazik@vitkazik.cz>
---
 drivers/mtd/nand/spi/micron.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 36f6cbbd7462..cc6eff0e54c2 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -134,6 +134,23 @@ static const struct mtd_ooblayout_ops micron_4_ooblayout = {
 	.free = micron_4_ooblayout_free,
 };
 
+static int micron_m68a_ooblayout_free(struct mtd_info *mtd, int section,
+				      struct mtd_oob_region *region)
+{
+	if (section >= 4)
+		return -ERANGE;
+
+	region->offset = (section * 16) + 2;
+	region->length = 6;
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
@@ -404,6 +421,16 @@ static const struct spinand_info micron_spinand_table[] = {
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

