Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021756;
	b=U1SSLMSXGlvlvhZJ1bsibfmAMIPWQo9fuA4smJ7prRkDMTkx6PWGtg8ee40n33Jhl6gx
	 0zpK+hx2h+FTxOjjSpKJ48pmbXOrkEaZNTC0IEM5ixm1QEyXl7mSCXnJanSs8bD1513Pf
	 1hfssBOYiiipBeUkj+hmxHi9bBNWm/9yftJuKFyjUF1RhvqhhRFUkALUhcIek11fHh+JJ
	 qlu4e+obeL0J/IHvD5qm+KJ+ueigBVqNG5Qpx3xUW8P6mmRDgTtKeT3ANzlCNfmAd9GOg
	 kXPLb44Awf8mg1RCFdq1pHTFdv7pmPN2usP8aU/CYo6X02SopZoxvt7EXP2Blh7Q45Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021756;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=e7P+FJnxya4pOGd5pTwD3sfIJZYBPzaG+u4emxUjteg=;
	b=Gig6TF2m2sHN3Qmel5V4MRwWJ4AMz5IDZTjaznPpsMVTungjviHzs4KEGDQIw57NSdhw
	 2gZWOQWY0arppmuDw/+vJu/muZ+hRFynzNJrFEA2X5n9zsQFHZsVS1u3qHb7avLiec1tW
	 n6gsZLo84aFxdwMOSCFiL1i2EMG0i2EL7b/wAwYRyrXYw5BxVqj++w1DSZVpGEsTn/GDh
	 Ck4pFFPeoDRIA6MSaj+SKXuUxKPzxScGGRhVFn1Jygnt4j6WGQY7i/aOWWxE1OKiYUjIY
	 ySkiRG4zxG5oWN/goBLkbj6AJ9iauwhdjRGowzsP30uacgbos/PYdkFOvyO4/f/BKsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XJLsq9tf;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC3E60A3804
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AC3E60A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XJLsq9tf
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4911D4E41635;
	Wed, 18 Nov 2026 17:09:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BA425FE9B;
	Wed, 18 Nov 2026 17:09:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 64A4A11BC2A1B;
	Wed, 18 Nov 2026 18:09:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021753; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e7P+FJnxya4pOGd5pTwD3sfIJZYBPzaG+u4emxUjteg=;
	b=XJLsq9tfUK5pU6Ulixfoq6TQKKBwsqdaJ6KUcBtEWEConL7FWobzTRnMXHkLjyC5k73/99
	rWsDE2znucz8bREPkFYm8M53FasWV459l2Eg5a5/sZJM/rAIV6MG8Xn/hQdmQa6PC3KXlD
	mTpi2gNQM+PCOIMmYdyIfMByZ2N+Dj4EU8JHF6cxmj0fLedt0TZHDmrbi2x+RgjQs3kjkx
	QrgaNmV3PAj9iSvG1NaVL5on0eXxVTt56ir934Sym+68Fjic/+N2eaCjjIGOsEitNTzrHt
	e5Lhprjwl3GTmks+BwY9W4JFmcaCMRxeIRH6J6liv9uvG1ufSABwBXxe5XS+eg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:30 +0100
Subject: [PATCH v2 13/13] mtd: spinand: winbond: Add continuous read
 support for W25N04LW
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
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-13-55956313d6cb@bootlin.com>
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
success: verified 524288 bytes read in 405.770 ms (1261.80 KiB/s)

$ flash_speed /dev/mtd0 -C
1 page read speed is 1230 KiB/s
2 page read speed is 1242 KiB/s
3 page read speed is 1247 KiB/s
4 page read speed is 1261 KiB/s
5 page read speed is 1263 KiB/s
6 page read speed is 1263 KiB/s
7 page read speed is 1266 KiB/s
8 page read speed is 1261 KiB/s
9 page read speed is 1272 KiB/s
10 page read speed is 1269 KiB/s
11 page read speed is 1271 KiB/s
12 page read speed is 1269 KiB/s
13 page read speed is 1268 KiB/s
14 page read speed is 1272 KiB/s
15 page read speed is 1276 KiB/s
16 page read speed is 1273 KiB/s
32 page read speed is 1273 KiB/s
64 page read speed is 1261 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index b5fc8106bdab..1f7f5c7c8224 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -895,11 +895,13 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb2, 0x23),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
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
 	SPINAND_INFO("W35N04JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),

-- 
2.56.0

