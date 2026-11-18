Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021742;
	b=gYbSglVSecacfh8Zj3L55meQe4d2gEuSKOLbFijcIzLEWDRSOnd7nFnCG4vgjAILtYtK
	 cvaRUf7MXgZIS5WOH0e6y5Yjqdesgj7dcydm1Q1+Tb44eOEUh8xVQ6InCV/TJGD6i9TWY
	 eTZXF+HFQO5eM8B+hRZ5e0g8sh12iX4ycoW+MKafDR6DgF/o7WhfOcMyPzehLnX9fBpi/
	 BfVCRCJrwRiNb5CBsPP42GVE5BNUKA98dYAfwXK4WkwmeyqznHvJe8WybShDerapnbN4z
	 x1FKMX/ZBLITeyG1lWS2Xw+wYZIPE8IJjNNXTW56yAtOOZ+zp6fFoeLWsXm75NSrH3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021742;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=sE/BWVUqMnWUOkIC1yLNFVdbReXab+OeO5XnDYHyTjw=;
	b=fieMMqlA2xE/IUxitSY2ZC9FaYB6Taw7JxVcNUgHV7tshwyYd0v3ajkHE3JbcukHc1lL
	 KET2SmUsmopbfnl8D6IxK9wqA6ck1LIW0I3u9BnjXkgUKZEu3Rr7qv0/vBkE+yz8oE3Mx
	 2bmNOChm7z7Hrcsb2Culli9QjIVhVkTOvaq9N5cLO0YJnUCA9yfD7W4PQGp3Ar2L5DpZT
	 otylwT+O+Ksam/UDZGltbrR34/q/uVEbhQ2Kmg3KoIk/3zdPP0Izmr7QjANBVRpgUasPT
	 OTwoRGqt7G//VQXy0d6ShNc5+EECGj+N7HYvQoTeJB1gepXehFR1vKwRQ5+YIw6v6Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ERhDShHl;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC81606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AC81606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ERhDShHl
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 354E31A169B;
	Wed, 18 Nov 2026 17:09:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 080E05FE9B;
	Wed, 18 Nov 2026 17:09:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D53D611BC2A1E;
	Wed, 18 Nov 2026 18:08:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021736; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sE/BWVUqMnWUOkIC1yLNFVdbReXab+OeO5XnDYHyTjw=;
	b=ERhDShHlfTTtU/hweuWnLDBcB9SYUGDtUrBH7lGGjka/bYCSaneG/v9BP+erFGX12ncmPw
	8TkKKBnDwnY4h/KrX2rXghtK+pp0KRtAMsccSqufEsjIzSzGFC9jYtk6u6l9yE/vhik7SO
	ThxfJw0hQZFbIIQc525WPUTD5jTjZiI1UlEsCa1rhnyE99IXieBC3GhWnY+GxpnbZ0M3hh
	70hkwmILZL4GgEM5pJ5JpOl9bEQk0rhoUe6q1FreSgFwemTQgllUp4501tpqeS+80CDk0T
	LX8nbb0djgb51qk4tixgYcfHAwT3s8htKCDpc9/mI3vRw2HkDKwhfCNawdUmcw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:27 +0100
Subject: [PATCH v2 10/13] mtd: spinand: winbond: Add continuous read
 support for W25N02LV
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
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-10-55956313d6cb@bootlin.com>
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
testing 10 blocks from 0 to 9 (10 good), seed 27
success: verified 1310720 bytes read in 756.306 ms (1692.44 KiB/s)

$ flash_speed /dev/mtd0 -C
1 page read speed is 1580 KiB/s
2 page read speed is 1580 KiB/s
3 page read speed is 1615 KiB/s
4 page read speed is 1641 KiB/s
5 page read speed is 1643 KiB/s
6 page read speed is 1643 KiB/s
7 page read speed is 1657 KiB/s
8 page read speed is 1662 KiB/s
9 page read speed is 1680 KiB/s
10 page read speed is 1666 KiB/s
11 page read speed is 1692 KiB/s
12 page read speed is 1690 KiB/s
13 page read speed is 1677 KiB/s
14 page read speed is 1696 KiB/s
15 page read speed is 1690 KiB/s
16 page read speed is 1684 KiB/s
32 page read speed is 1684 KiB/s
64 page read speed is 1706 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index b7a31dc83327..cdfd5a5778c6 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -226,6 +226,17 @@ static SPINAND_OP_VARIANTS(w25nxxlv_read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 0));
 
+static SPINAND_OP_VARIANTS(w25nxxlv_cont_read_cache_variants,
+		WINBOND_CONT_READ_FROM_CACHE_1S_4D_4D_OP(11, NULL, 0, 66 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1D_4D_OP(5, NULL, 0, 66 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_4S_4S_OP(6, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_4S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_2S_2S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_2S_OP(4, NULL, 0, 0),
+		/* The 1S_1D_1D variant would require 4.5 dummy bytes, this is not possible */
+		WINBOND_CONT_READ_FROM_CACHE_FAST_1S_1S_1S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_1S_OP(3, NULL, 0, 0));
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(0, 2, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
@@ -819,11 +830,13 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x8a, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
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
 	SPINAND_INFO("W25N02LW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x12, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),

-- 
2.56.0

