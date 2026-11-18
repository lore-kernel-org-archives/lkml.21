Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021731;
	b=3no/9Q/vxXollK45wQn+72icUSO192s8J5rmOcADv4lZTeI1cHfVREei4mXg4ftA1U/R
	 EVndliA74gkJEVY2vIJnb5SO2XA1N+4vXHVRasZhtaYTak1N0Q64Nz1AXo4/lsqbt8Y+a
	 eaNsUFT5e5Gg1c40lUOgcpkh0uCiVZuXjwIPOzldgxhKdsZKfTXse4m5SMYrrAUBpsteZ
	 iGR/SbjpQ5viwFD/xMaCcYGW86KpD+I1uWa/Nqq5xeih8I23hxJICyzpryEoLDyPpVwAb
	 rfZHfsjw4kqbcQkZOqk28HnhpRe0VDRMryk/rIqWQZauDhSHtRlAGju8O+ahCgG7dTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021731;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=RIDasA6Yo41X2XxZNHY5eia5WhYTwzwGV1LE+WbpzdM=;
	b=bqIMkUTpyBkl40ovpIBDc6aldAznqH3sz+p9RKp2HIxxmRmokPvNzOEyHQJ7dBgmLUPZ
	 LDyg+DC2WPd7aEG7D+2Wbgp2kQ1XooNwgdFBwhDrbkB604wZhaxYNaGDo6ADwm6SbRuPG
	 Nuw0q0dYWi5y6pMS2ii5hBitB7EuRB0hK2+GXDa9Sh8WqK3jbX6wHteNFjT0BU+20kXue
	 g/4Ecqhrj9xWJ7ddOc7QcMnNuPPN42E6vh0FpXHzmgzYurj/+hDKmTqhvWOky7TkcuYYZ
	 eyXy7U4JP25ew5rkf6nQHZve2HND7ZJzYfTOT8saR7V/Svbbk+x3hkrHGa92nO5r+bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="yFgTK/0s";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9FA60A2635
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA9FA60A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=yFgTK/0s
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7C6061A16E2
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:08:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E79A5FE9B;
	Wed, 18 Nov 2026 17:08:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 480B211BC2A16;
	Wed, 18 Nov 2026 18:08:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021727; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RIDasA6Yo41X2XxZNHY5eia5WhYTwzwGV1LE+WbpzdM=;
	b=yFgTK/0snPLl/MHHufweKXDArDgT51/Uw8vZxy0jELUVs8HSnSdLLurj1ZToKnO8tqQsip
	W7evaKBQiY/9P0O84gZzeKd5tDBXuqSku+2Y5oGTgW6MhBPak1sqTRKkJ4sg51Rkur/z54
	pqJxXnz6ZrKDnTSSoRr5jd7ymtn/OsEv0a46brsSxLKcnpLawe5mbavt+dSQee7Qkr7JOA
	D0gU8Zpd4hqLAbVHCz+L+nQeFsT0lHj4Qqi2d4QwlkO3NabvUsFknOvklcJybnMCgFIE4D
	ADCupgSIcRZUCg2fJRmUv9BXMRYqU3aKSZYnPfWXEOuvP1ChtDNdWDr+2MVMfw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:22 +0100
Subject: [PATCH v2 05/13] mtd: spinand: winbond: Rename the
 ->ecc_get_status() helper
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
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-5-55956313d6cb@bootlin.com>
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

Most W25N chips (KV, LV, KW, LW) seem to share the same helper.

Rename the helper to clarify its use.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 95b6c3b80eea..e3cd6950e61e 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -470,8 +470,8 @@ static const struct mtd_ooblayout_ops w35n01jw_ooblayout = {
 	.free = w35n01jw_ooblayout_free,
 };
 
-static int w25n02kv_ecc_get_status(struct spinand_device *spinand,
-				   u8 status)
+static int w25nxxkv_kw_lv_lw_ecc_get_status(struct spinand_device *spinand,
+					    u8 status)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 mbf = 0;
@@ -735,7 +735,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n01kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25n01kv_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W35N01JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdc, 0x21),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 1, 1),
@@ -781,7 +781,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W25N02KW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -790,7 +790,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W35N02JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),
@@ -813,7 +813,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W25N04KW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x23),
 		     NAND_MEMORG(1, 2048, 128, 64, 4096, 40, 1, 1, 1),
@@ -822,7 +822,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W25N04LW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb2, 0x23),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -831,7 +831,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W35N04JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),
@@ -855,7 +855,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 							&update_cache_variants,
 							&cont_read_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25n02kv_ecc_get_status),
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status),
 		     SPINAND_CONT_READ(w25n_set_cont_read)),
 };
 

-- 
2.56.0

