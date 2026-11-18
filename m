Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021732;
	b=muo1+CgVRjDwju/erRbOqtQVKp3di5XXdNajgska6tLBAgWpbeMrFvxYdD8gsrNPHCR/
	 IVKuuognYyb9m6AKYWQ8A0CMa/U0aJVRe8HfNJ45bC/CN1jnOm2/iOnnpDlFnknZ6mXUm
	 BRIt1lq9/1pzyqEOZv4m40t5oza9uRgB+FDDBdckbiZF5E4cfOPZXZ9N1upnS20hNMto3
	 Nb2OZxY8QaGIxCxrLalfAuOj2htLkHo8X95+sCWZoOuRZ6000r/+zcuvJ3VClWOybOY6B
	 bANAWMZF+OnL+PaD8qHrAfNVw0wwAaQKZfdxTRW/afWKyKCzHkG7PmnZDlXn1wFcmVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021732;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=kbZvxEQTLb3YU1ecR2Xm0WW6ueRaIVM1hk43jde/uHs=;
	b=llRVVDulP4qbDTFLPHIz5LWomazzBSYZHX1FsDkVe3JCgdHpTl530L+fiVlC3jwNkKEO
	 PyR0bBM1KgTczZXf1UfmBqd9jyGphDH5CUj20G572DSqiqReIRIaGDexfN6BagaXBfHjX
	 kVYL2xHp4Zj04IDotbd6lSUPcXFECXa+htp9fFVXVyjR+9oUo7KdLqLxBirt4bX/sC56c
	 7srsEOw+BNg2xCArLZSEcwE0b55Brjl5NxSoxQCuI89DZ0eB27T5+8esOpju5x7riiLYh
	 A7qIwdsJF2rFIbx2a/z4S7o3oDlH722uFGfLnH2p7h0dHotaOu2QuRWe9+f85I8lQlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wmOyO1OA;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2BE60A3808
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D2BE60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wmOyO1OA
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DC4DE4E41636
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:08:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD2945FE9B;
	Wed, 18 Nov 2026 17:08:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8FD2811BC2A08;
	Wed, 18 Nov 2026 18:08:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021729; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kbZvxEQTLb3YU1ecR2Xm0WW6ueRaIVM1hk43jde/uHs=;
	b=wmOyO1OAjJfO/RrrLdhE4/Vwd4d+WwwrQAvtxBnbjHO8z/Zya7A6ZMzjuXnvbA+iAhCCY3
	Lf6DZ9EZrfylmyWUlKr+ICCqoGB7Ox/lJBWarI7k0/KwNXw/mYsigS722dae2QhsGHXKu2
	DIJaZpQxMMQ2wAedFXZi02TYUX4tv4lj31+BtGtMp1ESv1/RfdyY5zJaIwNCEqlJBQD+pR
	ooz81NU0X94fSLtGzU8qf2wjP+KdpedyB9stb44bbup0ocgp+4NDCY6a3Hk/j6Gd6tqmEy
	Sb0O3YtHeTuahH8GTbd0h8eoCS7ez6g4+r6f/3zAG2WmE9BX0MqvsJn+r3n7vw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:23 +0100
Subject: [PATCH v2 06/13] mtd: spinand: winbond: Add 1S_1S_1S continuous
 read variant
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
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-6-55956313d6cb@bootlin.com>
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

The speed jump is not amazing, yet the feature exists and brings a few %
of extra speed.

$ flash_speed /dev/mtd0 -C
...
page read speed is 966 KiB/s
testing multiple pages read speed
2 page read speed is 977 KiB/s
3 page read speed is 984 KiB/s
4 page read speed is 984 KiB/s
5 page read speed is 987 KiB/s
6 page read speed is 991 KiB/s
7 page read speed is 992 KiB/s
8 page read speed is 988 KiB/s
9 page read speed is 992 KiB/s
10 page read speed is 991 KiB/s
11 page read speed is 995 KiB/s
12 page read speed is 991 KiB/s
13 page read speed is 995 KiB/s
14 page read speed is 995 KiB/s
15 page read speed is 995 KiB/s
16 page read speed is 996 KiB/s
32 page read speed is 992 KiB/s
64 page read speed is 996 KiB/s
...

Data integrity can be checked with the new mtd-utils tool:

$ nandcontreadtest /dev/mtd0
testing 2 blocks from 0 to 1 (2 good), seed 37
success: verified 524288 bytes read in 517.787 ms (988.82 KiB/s)

Link: https://lore.kernel.org/linux-mtd/20261030144108.2211604-1-miquel.raynal@bootlin.com
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index e3cd6950e61e..6beda45366c8 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -39,6 +39,13 @@
  * always at least provide the column. Keep using address cycles, but
  * reduce the number of dummy cycles accordingly.
  */
+#define WINBOND_CONT_READ_FROM_CACHE_1S_1S_1S_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),				\
+		   SPI_MEM_OP_ADDR(1, 0, 1),				\
+		   SPI_MEM_OP_DUMMY(ndummy - 1, 1),			\
+		   SPI_MEM_OP_DATA_IN(len, buf, 1),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
 #define WINBOND_CONT_READ_FROM_CACHE_FAST_1S_1S_1S_OP(ndummy, buf, len, freq) \
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0b, 1),				\
 		   SPI_MEM_OP_ADDR(1, 0, 1),				\
@@ -216,7 +223,8 @@ static SPINAND_OP_VARIANTS(cont_read_cache_variants,
 		WINBOND_CONT_READ_FROM_CACHE_1S_1S_4S_OP(4, NULL, 0, 0),
 		WINBOND_CONT_READ_FROM_CACHE_1S_2S_2S_OP(4, NULL, 0, 0),
 		WINBOND_CONT_READ_FROM_CACHE_1S_1S_2S_OP(4, NULL, 0, 0),
-		WINBOND_CONT_READ_FROM_CACHE_FAST_1S_1S_1S_OP(4, NULL, 0, 0));
+		WINBOND_CONT_READ_FROM_CACHE_FAST_1S_1S_1S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_1S_OP(3, NULL, 0, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_1S_1S_4S_OP(true, 0, NULL, 0),

-- 
2.56.0

