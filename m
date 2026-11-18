Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021734;
	b=wCzH9gKkcGwjThUkpVTzJQOp826uVxmjSmvcjMeXR9mW5CdgDz49IRqdGF/c9VRtiUu6
	 58aazpsMRVU0gFYt9v+tYFCrdTqIarTl5RMJBaf+iV80FlWbJd1O5hvKinZH3eXnaG5yQ
	 a1PCGi5yIvgEyOw599Ya/FK+SPjVbyWuT9eYr1NB89Jh5JSgGbSOJ6WS505i4P/JC6Lo5
	 cb6Jot79eHTx4dsyIEJL/cp91ZH/lE5kzBJ56SAtfZ52sSUVJuHFhpSsLm3K35W/BsAyM
	 1RIpYdCvM8GlXzi0drnKxzeRd6+y9wO8Saqd2W+5swxfzYSmA/ZmLGWFqgUqV4oSYhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021734;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=A5JlbZJI3umD9XjT8yfedRIJM9oGZ0SLsJ1pWHpRvjU=;
	b=vUPHezLaEkSyEQv6OkbhRL6ODO7L3lO3mDXAD+Zf8aF+p1MyvMDQu0wnWP8xN8T6em4w
	 RAoDBhyXc39v72PfC3IpAKIpkl0rP7ezHT5rlgKY847IQdfsSZp5D5W6bK1YKUIGSGqh4
	 CmZU7XkZ22gPeJvMmEoLirOEkJSRDlyHO/QJHV8g8V2XV4ddF5bA6DMwaERbCipOCKjhr
	 dXjK12RXE/2wSJLVa11wz87Qwii7IWtL1kZTUaeyn+Vz28D94n+vgBHHTH2xQ2Y7Oxe9f
	 4lyCu4c01BW52GSx99m8JiInRRnG/nFZ8O/cPNfn8Br8kZ4QmLhfmDBi/+rD68DR5wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uFTWiu3E;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D6F60A381E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13D6F60A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uFTWiu3E
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9700DC4F77B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:08:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B2FB85FE9B;
	Wed, 18 Nov 2026 17:08:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 364C011BC2A1B;
	Wed, 18 Nov 2026 18:08:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021731; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A5JlbZJI3umD9XjT8yfedRIJM9oGZ0SLsJ1pWHpRvjU=;
	b=uFTWiu3EejVFnXDfhNqpOyOCximAG9/5Ih4PW2o2FqmTZ4cxWYjuqQl4KMH4Ta2cv7lAEc
	gsEnz+heQ/r9MrGdYWUyb5WWHTLo+cYlNbc5tL/FV6yIHw7oqKvJkzwHwtDEg8y7Tjy63O
	vnYKsmy00lZTcEYh8JZ8Ww5dyaMDwEkPV+iwu4Xkbmkgxi1bV94x+DZ/9rqJtf1niQpMGO
	55nQV5j+Th1s85A24KKHS184rvFmkV+5xwovNValoQw9lcnSGtTXo2V7fKdtaiHNJ5UXuI
	Q+L2TNCw6mNlMUIZbUR38X7T3fUQ8k8FrOQoBN5rdPv/+PHwaueUBsxOp+gN+A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:24 +0100
Subject: [PATCH v2 07/13] mtd: spinand: winbond: Add basic support for
 W25N02LV
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
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-7-55956313d6cb@bootlin.com>
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

$ nandbiterrs -i /dev/mtd0
incremental biterrors test
Successfully corrected 0 bit errors per subpage
Inserted biterror @ 0/5
Read reported 1 corrected bit errors
Successfully corrected 1 bit errors per subpage
Inserted biterror @ 0/2
Read reported 2 corrected bit errors
Successfully corrected 2 bit errors per subpage
Inserted biterror @ 0/0
Read reported 3 corrected bit errors
Successfully corrected 3 bit errors per subpage
Inserted biterror @ 1/7
Read reported 4 corrected bit errors
Successfully corrected 4 bit errors per subpage
Inserted biterror @ 1/5
Read reported 5 corrected bit errors
Successfully corrected 5 bit errors per subpage
Inserted biterror @ 1/2
Read reported 6 corrected bit errors
Successfully corrected 6 bit errors per subpage
Inserted biterror @ 1/0
Read reported 7 corrected bit errors
Successfully corrected 7 bit errors per subpage
Inserted biterror @ 2/6
Read reported 8 corrected bit errors
Successfully corrected 8 bit errors per subpage
Inserted biterror @ 2/5
Failed to recover 1 bitflips
Read error after 9 bit errors per page

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 6beda45366c8..8f29b5a2bd47 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -210,6 +210,22 @@ static SPINAND_OP_VARIANTS(cont_read_cache_dual_quad_dtr_variants,
 		/* The 1S_1D_1D variant would require 4.5 dummy bytes, this is not possible */
 		WINBOND_CONT_READ_FROM_CACHE_FAST_1S_1S_1S_OP(4, NULL, 0, 0));
 
+/*
+ * Unlike the other devices, W25NxxLV/LW capable chips have an absolute maximum
+ * frequency of 133MHz.
+ */
+
+static SPINAND_OP_VARIANTS(w25nxxlv_read_cache_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_1S_4D_4D_OP(0, 8, NULL, 0, 66 * HZ_PER_MHZ),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_4D_OP(0, 2, NULL, 0, 66 * HZ_PER_MHZ),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(0, 2, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_2S_2S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_1D_OP(0, 2, NULL, 0, 66 * HZ_PER_MHZ),
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 0));
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(0, 2, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
@@ -799,6 +815,15 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
+	SPINAND_INFO("W25N02LV", /* 3.3V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x8a, 0x22),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&w25nxxlv_read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W35N02JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),

-- 
2.56.0

