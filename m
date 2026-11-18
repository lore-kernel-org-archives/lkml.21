Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021754;
	b=zzxUAwGGhXYOXFksUhznszNcjR76nD+Mwnsc5VuHqYA70VCqFaxxL/3LyUtOmZkyYMxy
	 miwp6AOu/bd7ULIi0dXsSAjyvFQbAoZp1c08JRcsz7MFuBd9PGXuszIL28qM2SZ0VSoys
	 hnqgUmu+5RLWlm+s4H+5oVjJ0S5P5fFMCriWcFyZVr5ramnK9h5p/vp5ExyOq5sbCFJB/
	 ppHhc+lSI94GttiLe8xZ8+2KAd9zHhgrxdrWCpSp+eFfRUsSSguW+T4NRp3mcjKY6+PDa
	 Mp1gAB7cmrXYCrsVeITZtldLbTfLC4xNuxvOQTIK7kzLB8HeAoLMZy4aJABl1+fQvYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021754;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=jhW1mkgCFuh0fRPmYFCPQdZgB0bUNNcOnQ/ukpdLbcM=;
	b=z3EdNa3tn4+EQ45PvBZSEuIpi2V6CFIb5cR/CWLQ+J7GvXSnPwOPWO5rN5GZKZDiSZb/
	 0KzOgkZoWvouUJ0WGMNgMB4wwEA/q+GKALrFP09axc63kqYYpxCTq+m9BpRCpLs3dKHcb
	 3fxfiQGC12IR44zIxO1KobnRpQDAiPRK46yM8j/bG7XZO0DQeytvCILKvGXjOE4ACpRNj
	 3JRLAMKiNcTNi2E+ua4ppfLemDvBXG4ol2pKQeSNU9R15eQR13/GNRqzEb3jDg2UzQUhy
	 lh5N5fNRxFe2jrnG7B0ObuCgOZ+0x6UZ3dEuDekMfl9b4HBeBqK4QAtPVKGaXwg/YVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dBrhBVfQ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5E660A2615
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E5E660A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dBrhBVfQ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 371C71A169B;
	Wed, 18 Nov 2026 17:09:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF9E85FE9B;
	Wed, 18 Nov 2026 17:09:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E1B711BC2A23;
	Wed, 18 Nov 2026 18:09:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021748; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jhW1mkgCFuh0fRPmYFCPQdZgB0bUNNcOnQ/ukpdLbcM=;
	b=dBrhBVfQLfbia3syyRLpvhvT9Jcl/cRXLNRXMo0QFgnQpwr1X1jOzuhjB9Tvt4sUSBYWcj
	dX5UJjeer3TPGKc+aR8mU7ZY2rWze4kTSqbUkv0v0awz5i32maHELyju0IqB/nLuQ/AbGb
	T4bnqRdRRZTvcCW9iTk8ScumXeZGB5Ozh3gn1dRKi1rlwL9cxDsloy1wiZNLtdy9etw+Ib
	2I2N7vxfN9nEWCxPEOmtfqLFgNWmWvHX0v0K+5AOm8/wxB2LnSREB3m1btwTJwM2SkaVZy
	Fl4ObwKvhSaWswiIs795ZQPkKW3vmZLUJ3UQHh07VqDuAYSaJLSCHBDoG5OlgQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:29 +0100
Subject: [PATCH v2 12/13] mtd: spinand: winbond: Add continuous read
 support for W25N02LW
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
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-12-55956313d6cb@bootlin.com>
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

LW chips follow the existing patterns, we can reuse the existing
set_cont_read() helper as well as the existing continuous read variants.

$ nandcontreadtest /dev/mtd0
testing 2 blocks from 0 to 1 (2 good), seed 22
success: verified 262144 bytes read in 202.780 ms (1262.45 KiB/s)

$ flash_speed /dev/mtd0 -C
1 page read speed is 1185 KiB/s
2 page read speed is 1207 KiB/s
3 page read speed is 1223 KiB/s
4 page read speed is 1242 KiB/s
5 page read speed is 1250 KiB/s
6 page read speed is 1263 KiB/s
7 page read speed is 1260 KiB/s
8 page read speed is 1267 KiB/s
9 page read speed is 1260 KiB/s
10 page read speed is 1263 KiB/s
11 page read speed is 1264 KiB/s
12 page read speed is 1263 KiB/s
13 page read speed is 1253 KiB/s
14 page read speed is 1272 KiB/s
15 page read speed is 1276 KiB/s
16 page read speed is 1267 KiB/s
32 page read speed is 1280 KiB/s
64 page read speed is 1280 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 1dc6d78a515d..b5fc8106bdab 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -841,11 +841,13 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x12, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&read_cache_variants,
+							&write_cache_variants,
+							&update_cache_variants,
+							&cont_read_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status),
+		     SPINAND_CONT_READ(w25n_set_cont_read)),
 	SPINAND_INFO("W35N02JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),

-- 
2.56.0

