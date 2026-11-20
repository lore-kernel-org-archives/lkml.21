Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190467;
	b=s9X+S4ZZ1Y/nw8GKmle8ld3YGhtdhuKuLXvX6OG/zGPouQ2b+YDZqiJTqlasO9wXUj0w
	 g2q8pz/hLxmeTCECxghXtkYTVUEXv2xZeLF7tbNOQrrjTFLPuFRfq9PnfB9xqSCxKG3BM
	 sf3DzzWGRUUSdfojbHpXjFOIOHTgv7ctO6fvH7ZEy50FoX9WY0zpS0v/UV4gxGyywyh0R
	 kPFpp3Xu024XQSTZ/5vn+S9tgkcrjXajXPdYVQrZ8Cn0dsfk2DVzRFAf4jLTs8pwTIr7F
	 sagAOeHaxigAuF0i8U7XBPB3+ofQlMqPFtGYTDc0HT5aXnGsG6KhqiDSpAgjHcjPCmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=uBZHDjcp8OHvO+9HMmytd8ayAJCp+xM1stb3TXPJ8UI=;
	b=Ndx106RdzCBTRwxEpThu407T3kR/adziY7saj9CeLAOeEUf06Y+M9f2TLjaJNUq1GpqM
	 +bgAyFj3TpmhxQg2qwfZa6OyVzcah2DMV75SKh0E5FOcB0w8irJAhpaLUeoo8VdII2Vxm
	 fPYPHCyE0FRm7uwwcLtnYchAwTNeiE5RCCJEYDlcjmzAnuV0JGKWpXtneosfUAljpW6bs
	 C9WBtFU+8/pUVVyKU4ExeBrCK9VzSrTcugxuJ9Ntb18zm7vaiBRZm/KyzB2qB2JcJ6tDu
	 bFMllizoa8BPmVxENeR5ngBNarMAFxzh1HqDv4vxl+6ZERVzEuFHmePV3ye496sdgAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CL4/odGq";
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D998D606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D998D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CL4/odGq
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4b0348a4c79so748707fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190465; x=1795795265; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uBZHDjcp8OHvO+9HMmytd8ayAJCp+xM1stb3TXPJ8UI=;
        b=CL4/odGqwxn1x+qFwRN0IkYjVun6FvoE+jTEmoQlbKjqzeOactDnuS3KyGIRPfKDwO
         4PfM57PTQHiqCPhLh2MmikbBBWH97kWf7SmNKWR7AhJfb6o/4H+FlzLPYrbeBgHoJdzz
         M6GG2I0QV+R3iiSl4YOP+BVvaKFTA1qtZCRsLg/ZgtO0a05Waq3ZfGQkL5VpVHI8f67U
         0C/k3vAmz1/isg+y1S0p4mlrMvTQ9Fbmk2/9RDuG32hd4jPYKhILe1jijtzBSLDNFmRk
         A05luy5pfQU6aAQX70vpuz22Bh5hgvrrg8uP6wHADLwKfe63fKqg9vvMy/1VWlo3jC5J
         2IgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190465; x=1795795265;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uBZHDjcp8OHvO+9HMmytd8ayAJCp+xM1stb3TXPJ8UI=;
        b=q4l3zEHjiiWwisex7dJ/8DvEw2pTbOqRdI/WnImweRDoDb5BHxuj8dKdk9itG/jGEc
         2pdgzXREjr60eUpGGAIXg1lg90ey3mRaYcC+eVZ+cA24mN5jpAhuGquXoWgQC3IUf6QT
         HIoZHWMj8TafOCrelr7SsCqS9wdDCUDv+zIckd7v8ByxNL+gpS1JvoXlY5mI2VBhBw/E
         6atISrV1xa2OwndnNHASZfwU7+8NaO66qlI03Pv29KlHoSkNFuAl+mlGWFyNFbQrD5U8
         zpb7AeUPdpC+iJsMBp2Do4UwRqVX6vq7jdBzOkPdYZiBr1w/kBofrONdLQ0d3fcS/Ojm
         sAUQ==
X-Forwarded-Encrypted: i=1; AL+hErGiuZUUfYaS++wmoy/PRVO24kFsmrDhw3IaZgAB/ZfWwHfMwtyfdKzw3Csj0tBNSqor3HFemP+sA/Epvcs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Cq+daqLUYdlSHoE6d1PmYZjHYN9ZGUDhUEM/3nzHEVV8ljchO
	PdfmgY3+jndnVA34k6XKstF7YR92yCH7iLMepn/4P302VNRRkuEDnjcN
X-Gm-Gg: AZFdTZc5N/pNfffmnHE2iQmz9WLaHyBIQgmOnZ9cLh6/sx3PlCMQlUhrmT5zndk2HWb
	lc/tXMgzIqO/D0aSg8WMDvz4wi49Q0Jq8bJAShKNl2YNSZIpGvKu4SQ6ZmO/6kkgMquNQovkzqA
	IinLkJNuYO67OQ/D04moH0dmEc58tVKDrdBVUj4EbTzlnCqGiziZu/Uk5GbcpR2QoklKHjXzXgb
	+P/xcWHJG4kE9SyJ4qoDZU/vZYrBWAUig2pR11QQGLXY9nhiyirMAinuGCx4jLlZBLnOoR1PUhq
	mNBBoP8bc3pgIizAdaua4bp83S2yGHavraOrIkE+ZQssof6FMz/oPgcVxLMNlkf0VsZUyHmLEdP
	qAU9037t2ns6a3kepZa4roa3AN5lxbxM5d/no4YScTEiFHy9+x3Rwix9t4IMmpK8s+hun5m3vg+
	UbW2YzZnJ9HrV7HEqtqJDYyVsgk4qmvzxq1EfRWIZdETCOD6pFDz6j9uYp+UugaCZaSKIOr6jry
	klYOAdHG+CKI0wTIer6gCls1W0vtfUxu/xV4ikoPIB5HkiHbFhwxBal6ySUr7q3jjU96eZvvITR
	zzHbaibwhh+OIIHydoKhPdsKlcGSTAAIiosmH4pfIwpGl/QfiaOH81PPae72iOobgruAoG6ZT8h
	jn6PVICS8CFfS2Y/MuXKpb2gnaDCqjQXDQWfDBWqZUvht5FKpsxkAJ1ylyaSFJyPUVE+ZVifYkJ
	PZgB4d/XPGXSiUynjteY0zv15w19R0013dEUh74IJtRW/65AGr/no=
X-Received: by 2002:a05:6870:b93:b0:4a9:5bde:8484 with SMTP id 586e51a60fabf-4bc85402f1dmr3040217fac.51.1795190460802;
        Fri, 20 Nov 2026 08:01:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bd044fc4besm2161534fac.7.2026.11.20.08.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:01:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 09:00:53 -0700
Subject: [PATCH v2] mtd: rawnand: atmel: keep the HSMC clock on until the
 NFC IRQ is freed
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
Message-Id: <20261120-submit-atmel-nand-irq-teardown-v1-v2-1-7460e7c8c163@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBBFr0K6doRSgujKexgXpR1hDC3aVtQQ7
 m6LcW8ymz9/8ubNzKMj9OyQzczhRJ5GG0O5yZjqpe0QSMfMyqKsOS924B+toQAyGBzASquB3B0
 CSqfHp4WJw2VflKLYKd7olkXOzeGFXuuP0/mbI+SKKiRwumilR2idtKpPKxN0nsi5xVdIfU8+j
 O69Sk48cX4+zR8+cTiIiteVUI1AFMfOSBq2ajTsvCzLByGyZ7cEAQAA
X-Change-ID: 20261107-submit-atmel-nand-irq-teardown-v1-f902307c18db
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

When the Atmel NAND driver is unbound on a system using the legacy DT
binding, another device on the shared interrupt line can still cause the
NFC handler to read registers after the HSMC clock has been disabled.
The remove callback turns off the clock, but devres releases the IRQ
only after the callback returns.

Register a clock cleanup action before requesting the IRQ. Devres then
drains the handler before disabling and releasing the clock, both on
removal and when probe fails after requesting the IRQ.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Use a devres action for clock cleanup so devres releases the IRQ first.
- Link to v1: https://patch.msgid.link/20261108-submit-atmel-nand-irq-teardown-v1-v1-1-341643c83ee3@gmail.com
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 56 ++++++++++++++--------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index b86d080bcb2c..ce5e13276d2e 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -263,9 +263,6 @@ struct atmel_hsmc_nand_controller {
 	struct completion complete;
 	u32 cfg;
 	int irq;
-
-	/* Only used when instantiating from legacy DT bindings. */
-	struct clk *clk;
 };
 
 static inline struct atmel_hsmc_nand_controller *
@@ -2151,6 +2148,14 @@ atmel_smc_nand_controller_init(struct atmel_smc_nand_controller *nc)
 	return 0;
 }
 
+static void atmel_hsmc_nand_clk_cleanup(void *data)
+{
+	struct clk *clk = data;
+
+	clk_disable_unprepare(clk);
+	clk_put(clk);
+}
+
 static int
 atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 {
@@ -2164,6 +2169,7 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 	struct device_node *nand_np, *nfc_np;
 	void __iomem *iomem;
 	struct resource res;
+	struct clk *clk;
 	int ret;
 
 	nand_np = dev->of_node;
@@ -2173,41 +2179,46 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 		return -ENODEV;
 	}
 
-	nc->clk = of_clk_get(nfc_np, 0);
-	if (IS_ERR(nc->clk)) {
-		ret = PTR_ERR(nc->clk);
+	clk = of_clk_get(nfc_np, 0);
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
 		dev_err(dev, "Failed to retrieve HSMC clock (err = %d)\n",
 			ret);
 		goto out;
 	}
 
-	ret = clk_prepare_enable(nc->clk);
+	ret = clk_prepare_enable(clk);
 	if (ret) {
 		dev_err(dev, "Failed to enable the HSMC clock (err = %d)\n",
 			ret);
-		goto out_put_clk;
+		clk_put(clk);
+		goto out;
 	}
 
+	ret = devm_add_action_or_reset(dev, atmel_hsmc_nand_clk_cleanup, clk);
+	if (ret)
+		goto out;
+
 	nc->irq = of_irq_get(nand_np, 0);
 	if (nc->irq <= 0) {
 		ret = nc->irq ?: -ENXIO;
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "Failed to get IRQ number (err = %d)\n",
 				ret);
-		goto out_disable_clk;
+		goto out;
 	}
 
 	ret = of_address_to_resource(nfc_np, 0, &res);
 	if (ret) {
 		dev_err(dev, "Invalid or missing NFC IO resource (err = %d)\n",
 			ret);
-		goto out_disable_clk;
+		goto out;
 	}
 
 	iomem = devm_ioremap_resource(dev, &res);
 	if (IS_ERR(iomem)) {
 		ret = PTR_ERR(iomem);
-		goto out_disable_clk;
+		goto out;
 	}
 
 	regmap_conf.name = "nfc-io";
@@ -2217,20 +2228,20 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 		ret = PTR_ERR(nc->io);
 		dev_err(dev, "Could not create NFC IO regmap (err = %d)\n",
 			ret);
-		goto out_disable_clk;
+		goto out;
 	}
 
 	ret = of_address_to_resource(nfc_np, 1, &res);
 	if (ret) {
 		dev_err(dev, "Invalid or missing HSMC resource (err = %d)\n",
 			ret);
-		goto out_disable_clk;
+		goto out;
 	}
 
 	iomem = devm_ioremap_resource(dev, &res);
 	if (IS_ERR(iomem)) {
 		ret = PTR_ERR(iomem);
-		goto out_disable_clk;
+		goto out;
 	}
 
 	regmap_conf.name = "smc";
@@ -2240,30 +2251,24 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 		ret = PTR_ERR(nc->base.smc);
 		dev_err(dev, "Could not create NFC IO regmap (err = %d)\n",
 			ret);
-		goto out_disable_clk;
+		goto out;
 	}
 
 	ret = of_address_to_resource(nfc_np, 2, &res);
 	if (ret) {
 		dev_err(dev, "Invalid or missing SRAM resource (err = %d)\n",
 			ret);
-		goto out_disable_clk;
+		goto out;
 	}
 
 	nc->sram.virt = devm_ioremap_resource(dev, &res);
 	if (IS_ERR(nc->sram.virt)) {
 		ret = PTR_ERR(nc->sram.virt);
-		goto out_disable_clk;
+		goto out;
 	}
 
 	nc->sram.dma = res.start;
 
-	goto out;
-
-out_disable_clk:
-	clk_disable_unprepare(nc->clk);
-out_put_clk:
-	clk_put(nc->clk);
 out:
 	of_node_put(nfc_np);
 
@@ -2345,11 +2350,6 @@ atmel_hsmc_nand_controller_remove(struct atmel_nand_controller *nc)
 			      (unsigned long)hsmc_nc->sram.virt,
 			      ATMEL_NFC_SRAM_SIZE);
 
-	if (hsmc_nc->clk) {
-		clk_disable_unprepare(hsmc_nc->clk);
-		clk_put(hsmc_nc->clk);
-	}
-
 	atmel_nand_controller_cleanup(nc);
 
 	return 0;

---
base-commit: ec1e844b9486302a488abc03ea918db60709766e
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
change-id: 20261107-submit-atmel-nand-irq-teardown-v1-f902307c18db

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

