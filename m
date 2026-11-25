Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598746;
	b=wU5/v9tyC6zt2ELuDf7nP8proplu8snMHb3iOYA6xeFpPOFJ/o3SsjQCnBMQQv4VEQj9
	 Ta7E5DA8u9Rj8kpMoDfxVVgj7DgWDCnQbVFWKJ0PBq1LkA7hHWrOB8vXS0BulCGLGWys0
	 1P2PUGFJaRRCNtmkX5K2hU/uVessSK2vZxdTlkNmAVJK1t4dRPveI366+FP///cCsri9/
	 N8bqXO8rI5qTnHuKjMxS9Qc4Eskrb7klVyoevCKAMFkvTVCkOb04JRZ5gQUdkzuhml9Xd
	 AqeZhRb6WOgpHJhWy/F4uZNZbhlqIB3Zl98iIbUXmI9PVfsDd53nuJWSPA3WbeOVmFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MA+Kx+uKQP6OM3muhrQQ7gMLzt5UOS5UjDB/PUfvv7E=;
	b=VS8Q23HB0/RJAvL2fMDSOBjJD6H1hKLh3Ex4xGDueug7MuShGpf2q6FFffuXL0GSCUa2
	 g/g/j7h3XImyg5DIahX+NmFNlPIyzZrg/OYvWyHl/WwxFQDGEcU5HzbpzJQ64BdzE3DaN
	 UpF8l/H8h6tfdcYRKg1tO7hsUlSL9mfRQila0rztJqMz6nAaiSuT0fxtMaU2iopPdtKR8
	 7PViz5Ou9ihhanpMQASMfd2mSJQCnb0bklYjJiH6Z1P2wQ3J0ElQaxFXTmy1+eEZbn83T
	 mz5p0jzz7TbGTeWhmok1urgvMsXNnmR4yP7c54rXErgqINfZz1WToOp7xTthywLD4tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sBMrm9gd;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085C5606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 085C5606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sBMrm9gd
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cde5a7d7849so2382760a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795598745; x=1796203545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MA+Kx+uKQP6OM3muhrQQ7gMLzt5UOS5UjDB/PUfvv7E=;
        b=sBMrm9gdnqus0HEyZ36TPEXC7ztphsOoxttRcx58PwveXj4ts+/sEZ3Pm/8yQLq+4m
         pqiE1cUtwgmMxjyyEqI/KrkAg5MG3TWGdH1LxO4BdY/iAHEFgmy3yQVg7I29/MTVqMIs
         I7fOxdpjjiMPL/u1w1D8E79viUZD/8ZcSvyAugxA1Up/CqFm2BPlG6vnCrKj8pEmnvxg
         TCHaA4e7Au0f6q81Zfvsg3nmHG6KG+MBtr7qqQeqWbELDMi0GOwaRuqH2uMfCe8Nwz4N
         SrKiuqSmRcdurwl9gZHN9kpTjVe8v8WuFtJaYgZUo2tJuVdg1d6+3QH2DXtXegEpyZfP
         cW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598745; x=1796203545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MA+Kx+uKQP6OM3muhrQQ7gMLzt5UOS5UjDB/PUfvv7E=;
        b=QGL3EdGyukuILnUqbMWbUA5/SOTWBpcKAGszlLot+oKx1Tg9Chb8lT/OjUPaBHssUG
         77WGfdsVdv1sgxkUbdjmpjKflctCZ0o6wDUtKcGqDZvYgCwHF9IHStZxrEbUrcf/A7Wf
         ffyH06NPCYZaJElMf4yBs0G249+w48NeXH/Gr567W5bIbgA7a4v0KAdhmI5QgNs+wNZ/
         xsSaYhk4sTPP7mSepXEvKjjcCsuGKBcqpirQduD5WpyEBrGVFfaYhPr27CKHfYxf/agA
         l6ihbHQtaIFSJD7i21E+DHCyGzM5ci2TO+TQMho8tKAi9bQreNvkcO6WoYeIt6nROYK1
         842g==
X-Forwarded-Encrypted: i=1; AL+hErEV8yTbsLa1jS8jiDPbs2gQCb8g/4vkDdMm6C39ya0XtWyX0OC6FfCVJ3SBUDSoNZUBxD2H2w4RYyyEJ/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IKBCqWT2zhVsx9gY34bgnuk2RIJA9STZsbs0RZOmbGxpn6xSL
	m2aTEDOg48D4o1kWql3dii4DETv6EBKMhw++pq4jnjqXAZWKCWclfL34
X-Gm-Gg: AZFdTZdTrg69Zrv5uPfjikL3zU+kQL2BJEEkrzArIUkAm8PojVQ0trQ834k0tEQPiAm
	ZVvaqr9klGcEzQbk48yeq8EzL9TsPEdxRlljp9j0y1Cw7u6mkzPe4h9LWYwSxZ3PVO8n5FgEkra
	HdO3FeB3a0YDccp9r+xraIKq92Svjrh5tJqPP5c75TAXHwjvAbd+DJ36NrcHtyOlV1EyLYPBi0r
	/lefXBHroNNRNQGz5VWp7s8J+P9HyeLhWVblMlWBmMwDV9I5BFoTAeOgSf7FYzAGI+gHg1Z6VE3
	Zmdb2KgduBll0yxpUV9nBedN06XhZXX+b8yifaWZ8e18+IwsWFeM8OcmDIh2iSt3fXcXiyR9KmQ
	KILtzeZDlE7mCUlQTvDjF72BrWzGYO3zRrHq4FJyox0HCo45BWI7Td9BC1XYeuzmbFJlqTuiZXu
	lOBNLIjPnS172eMnQFjy9FXhvUSa1+fcpTmXxZNyaLQRUAzjODIPjxeXuFOupFBt5SynqOKiX+W
	Heu4UfniP8OcmiEsuZIhfBYNsEdtJSSWnRV4b82pKE7l0tDOTsMGIOsg9/oBuXO/w7YCo6YG5yC
	P+mNg2YNpSMA5f1HSeulrqMJUIC6qo1CLw==
X-Received: by 2002:a17:90b:2f0e:b0:3b4:fd89:5f97 with SMTP id 98e67ed59e1d1-3b4fd8969ffmr544920a91.33.1795598745341;
        Wed, 25 Nov 2026 01:25:45 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f142b8bsm80883155ad.70.2026.11.25.01.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:25:45 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/3] mtd: rawnand: intel: declare NAND_USES_DMA
Date: Wed, 25 Nov 2026 17:25:36 +0800
Message-Id: <20261125092538.1938516-2-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125092538.1938516-1-leeonion.muyu@gmail.com>
References: <20261123070440.3060882-1-leeonion.muyu@gmail.com>
 <20261125092538.1938516-1-leeonion.muyu@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ebu_nand_read_page_hwecc()/ebu_nand_write_page_hwecc() feed the
page buffers provided by the NAND core straight to the DMA
engine, but the driver never declares NAND_USES_DMA.  Because of
this, nand_base cannot know the controller DMAs these buffers and
never bounces non-linear-map ones (see the use_bounce_buf logic
in nand_do_read_ops()/nand_do_write_ops()).

Non-linear-map buffers are not hypothetical here: mtdblock's
write cache is vmalloc'ed and UBIFS passes vmalloc'ed LPT buffers,
so such buffers can reach the controller's DMA engine, for which
they are not a valid dma_map_single() input.

Declare NAND_USES_DMA so that nand_base bounces non-linear-map
buffers through chip->data_buf, as the other DMA-capable
controllers (arasan, denali, meson, mtk, nuvoton...) already do.

Fixes: 0b1039f016e8a ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index cfb4b231e067..1f493fb426d6 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -688,6 +688,7 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	nand = &ebu_host->chip;
 	nand->controller = &ebu_host->controller;
 	nand->controller->ops = &ebu_nand_controller_ops;
+	nand->options |= NAND_USES_DMA;
 
 	/* Scan to find existence of the device */
 	ret = nand_scan(&ebu_host->chip, 1);
-- 
2.34.1

