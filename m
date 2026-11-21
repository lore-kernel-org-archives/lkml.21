Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223471;
	b=DiHK5MppdK26ZvmJ9IzS0Yta0cd62AIDqCla2Tu41aGOTcohF0AaMRE/A596uGECGj3O
	 PmbP32AyQt5RBkU52xEpO2TSG/wqMRugRviBkELHfjq1q5fgFB0NdQ8N0uw2lxV4ITQVV
	 NfAdwUxBVH1yeoy5yC/zwP8xvYdEBT5ix8YN2XM8IQPvzJCbJhIzg0ZVMAXGuzvT8ypUv
	 Kguo6wHOGU/edyGWA+edJMnn7o2G40Thj3jvUlGkwrYL8PV4E62HeYn30dXNzHdbxHBnI
	 N+4agXyRPFpziwAxJmp7y/d3s/tHJF/14ilvATGYcI0vrgoFGe/Lat9wc+NtWEsUIPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tDxDnDKQmgOhb7t9CqFuoW8PN9zlg37X4nU+lrooV8U=;
	b=duy9n6bftBqUepahSkKFh8H8vaK6fSJUDzmCA7jyBMTIBldpRqlVwNSVDqmtbAnwQpsG
	 SpG39Z6OEX4iKkmACHOP2dzBfmAy5bsjqF2EuLQ0VTB/QpkNbDrMkRj3FTWR+1muEe1xo
	 M7Hy4MtsqjxMcbBuqFQLAuXMyLXr+WUCC/8r4jSGN9f5ZMZaFfZe/2BIANkzywyHlLwSJ
	 x75Iu5lGvBGeStk8ddcKPFhW2YUJCy88dwwwxDlwH3SgyVgaC6V5j3z5BtCUW9paD/fG/
	 KQ0IfYQzzO/avq6a2xttp+SibxQxoxKB8dC52jQCYGs0uz07J1X0eTweJKiG4aUs2Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yx5gheen;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C599D60A2625
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C599D60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yx5gheen
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4a451915d8aso1058761b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223466; x=1795828266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDxDnDKQmgOhb7t9CqFuoW8PN9zlg37X4nU+lrooV8U=;
        b=yx5gheenrepbzKlY6Zc758JhtUoa27vxVHp6l2Dj+Nk65HcFNRkrroyys3ZK+FR76t
         lAqpw2Ak6QhnWujbws5tJbIXpgJ1T/9gir9C3lJijMuPJnPuGbEhILWihsBMjXHaTsly
         KrjUw4gS4nZvvSmXYufKzmFWQSNBf9KIZBnmvZAhJRxD1514PL/gSJI2tgsdyncO2jYG
         KeOn+yxOXNVw+eH1GTgvs7MZwx0kcuGLzBmZETtB0usZ61lSwaBaiIHNjMqIo3og+8jH
         Dl/+xNmg+r2C4OpnA07VUqt+6E/OFP7J0mp5HErff/jDHWagNAEagTKgqEspU7ydLGht
         lhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223466; x=1795828266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDxDnDKQmgOhb7t9CqFuoW8PN9zlg37X4nU+lrooV8U=;
        b=VAtpkThU1+xc/x0ngWLXOxoSZ+XnMj5p31clF2tJpsPBka6z8gR1Un4Tp1NfhVoUSP
         sz5uvsvpl6gZf0AfX/Gaa19vSOynhaxlMAR1Kj9Ci2mexLa/wG7IEzwSt+/OcBXxZJeJ
         9mpuJzt72p/e32klhZbZNa6eX2XIf25soCJWW+ZkQey94fNeGK4BP8B2o8i/sQRBYJ36
         YRKmvedXJ6L5khbNsFSlAYOr7As640C/NK+cOTayykTXAUMoZDgXOFUKdSd1BoirJEUE
         Z+HYCFcvLtCxQ2q8VW0jnxV7et2HhwW2klifPnuJzRvEzsDZLG5qQJIK3fhd32FseDYv
         ZKPA==
X-Forwarded-Encrypted: i=1; AL+hErGHkPGp/j5BwkZpCjCEVZj97OVobdPo07YNiD1lOIOa1PBH8FxaCNFcaLcG+b9AZ5kSUolmonWh/Qvg8I0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fWh3NHXjbSoWlDM3PyDHng8bdsnPr0A33GjQAoU1eHKC+C6iD
	bQwlK31UCVRVAnCB99g6zGAS7bvk/ErFAvdXX4vMlWgtgbxcEn0tKDmp
X-Gm-Gg: AYBFou3TuymjpmOFyQLFizEM4YFfmo/N7cQuZ6/6La4XGAqpzEqT7xG5Xd3nO0OwOoH
	eBN6mf+O1/8tbAhkEc6Fe/sXS8S3EUj8CAaPs5xkvazcC8CHUslF+EXpprPjjRKfIP3GOlJfW1j
	AA3uy/n6XXd2w1t9peG6PJbdwFjARhIeckCGmsqfhUXH04Gz/SrYKl4HYF5B/cdPX5cZTrrhNRA
	xcfL9PT6QLhGyf+9NhpoVqmCE775yGqP+Ru3LUojBuSRlpBNzb4/icsddqvWeOO09MgzUpq7m5j
	n1JR68hYDqgfhM0FK3Ad3V8IuZXDsG5LRSWk/Q2erm7oC5YEv/Q3M40t5T3NTmNWiwNDOzDZIPI
	aK1iGBOXUG3WvkHDl9ZRwSzXfKr/TpZ1EiW+/lQY3faMAlan0WbmCJzyEX32npXVrZO2z6tNF31
	vU3QN3fZn267NipolbAZh6VfrNWUPePlDi61Tz884OVMgx6j/xj1t6UtnFi47aVReMWYdzCjiaO
	Od9NVA1j8re8uskKp6lRgBsZx21q7kqdoMGUwGE1ZzKpSyr00qRr8+RGb5bbsFOGwCzwIpj7mk/
	1GUWr9nj/etGilkVMzy8ybky+I9oOogJduzU4qxjWpkR+NTtVDFtjPn0SmrmCaHRdRWfZ5YSV1o
	hcFcpm0zqbecpsJS6obF2I7VWwHdSQewsAXBJDPXX8WGd9P53ba2rzLk8TT/i/3B1U1w9LWY2YB
	A3990zLYGz7U54vxQDr9tVbPHSPOTckTrp+lxBAuZE4MqJDCcnqFui
X-Received: by 2002:a05:6808:244c:b0:557:4340:4d47 with SMTP id 5614622812f47-57a09400d0amr6720622b6e.35.1795223465752;
        Fri, 20 Nov 2026 17:11:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:30 -0700
Subject: [PATCH v11 07/26] mtd: rawnand: sunxi: propagate page-setup and
 erased-check errors
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-7-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev

If the NAND read command or ready wait times out, an ECC read can report
success with stale data: the callbacks ignore the error from
nand_read_page_op() and continue with the page transfer. Return the
setup error before starting PIO or DMA.

After an ECC error, the driver checks the physical data and OOB for
an erased chunk. It rereads main data if scrambling was enabled and
always rereads OOB. If either reread fails, propagate that error
instead of checking stale data or counting a transport failure as an
ECC result. Leave uncorrectable media errors in the ECC statistics
for the NAND core's normal retry handling.

Route PIO read errors through ECC disable. DMA has already released its
transfer resources before interpreting the results, and its caller
retries a failed read in PIO. Restore the corrected/failed counters from
before that DMA attempt so earlier steps are not counted again by the
retry; leave bad-block counters unchanged.

Fixes: 97d90da8a886 ("mtd: nand: provide several helpers to do common NAND operations")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 45 ++++++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9d7e3e6f22b2..c5e429318de2 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1120,11 +1120,16 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	int ret;
 
 	/* Check the physical representation for bitflips in erased pages. */
-	if (nand->options & NAND_NEED_SCRAMBLING)
-		sunxi_nfc_read_column(nand, read->page, data_off, data, ecc->size);
+	if (nand->options & NAND_NEED_SCRAMBLING) {
+		ret = sunxi_nfc_read_column(nand, read->page, data_off, data, ecc->size);
+		if (ret)
+			return ret;
+	}
 
-	sunxi_nfc_read_column(nand, read->page, nand_to_mtd(nand)->writesize + oob_off,
-			      oob, oob_len);
+	ret = sunxi_nfc_read_column(nand, read->page, nand_to_mtd(nand)->writesize + oob_off,
+				    oob, oob_len);
+	if (ret)
+		return ret;
 
 	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
 					  ecc->strength);
@@ -1308,6 +1313,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct sunxi_nfc_ecc_read read = {
 		.buf = buf,
@@ -1315,6 +1321,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 		.oob_required = oob_required,
 		.dma = true,
 	};
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
 	struct scatterlist sg;
 	int ret, i;
 	u32 status, pattern_found, wait;
@@ -1366,9 +1374,19 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	ret = sunxi_nfc_oob_read_batch(nand, &read, status, pattern_found,
 				       0, nchunks);
 	if (ret)
-		return ret;
+		goto err_stats;
 
-	return sunxi_nfc_oob_finish_read(nand, &read, NULL);
+	ret = sunxi_nfc_oob_finish_read(nand, &read, NULL);
+	if (ret < 0)
+		goto err_stats;
+
+	return ret;
+
+err_stats:
+	/* The caller retries the whole read in PIO mode. */
+	mtd->ecc_stats.corrected = corrected;
+	mtd->ecc_stats.failed = failed;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
@@ -1453,7 +1471,9 @@ static int sunxi_nfc_hw_ecc_read_chunks_pio(struct nand_chip *nand, u8 *buf,
 	};
 	int ret, step, cur_off = 0;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1461,10 +1481,11 @@ static int sunxi_nfc_hw_ecc_read_chunks_pio(struct nand_chip *nand, u8 *buf,
 	for (step = first_step; step < end_step; step++) {
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, step, &cur_off);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	ret = sunxi_nfc_oob_finish_read(nand, &read, &cur_off);
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
 	return ret;
@@ -1482,7 +1503,9 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
 					       nand->ecc.steps);
@@ -1510,7 +1533,9 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
 	if (ret >= 0)

-- 
2.53.0

