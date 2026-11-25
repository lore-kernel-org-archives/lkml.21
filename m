Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607476;
	b=1nag0z4yQCWDby1ao3tDyp5/kjDiL9ePXgSA/oYhQcZXMNt/FxP/0DtrNQm7BZBqwe0N
	 M6Q8fEosA6ehWPsM7DCiC/8sjV5alZxx3uargaTeo06GK9idOf9jy/A6ePQwu5FUb50DI
	 VU9Bv9Eva9yZQQTHc2FXLT8uUnerBRGyvwUSS/cps/dd6cbuyynTABOuM0vglNoweu9Lb
	 jcamxHrPmUu63Nb6cDo5vZH6JzYOA7gtZv+WDI/44mriJN5m/baqV+9Wokiud+qcz1Iw2
	 EIg9venY8H/c8IdkeYE0iGhmzGYOw9QiOB/6F5oOuwSU2SpKbU0QBidsrZYBwOsWdeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MA+Kx+uKQP6OM3muhrQQ7gMLzt5UOS5UjDB/PUfvv7E=;
	b=CKcc1qC614UIEOg3Z3QEZWl0vIKKwyIUqQyc2RD4or1PFMbJkR54PUTMoyw1UdmlmcYD
	 vOMILhmykfGegPgR6nQ48IJo9BBzAKahgValrm3N0d7prbXut1g6umVYXzpEB1cfbzCID
	 nSJGNxJaNLi5KWOSwET1ovA/j6AjcdQivFU/Qr79rfgQI6rhYY85BsjEfAp25yJknmQ2j
	 jay3gOWfJjNMDoYsJV6BdCTqUl0aowsgNFwOAl2zn3+UvIcr6xEarfKl4e/ysmYdWtkcc
	 vrALMiUkH0coW7PbykjoNzxVMxW4FSDemo2rtEWArtKzKknPsbhGoDGgUGlCe/AZGxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwmBSJ8G;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329A0606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 329A0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwmBSJ8G
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso2376167a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607475; x=1796212275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MA+Kx+uKQP6OM3muhrQQ7gMLzt5UOS5UjDB/PUfvv7E=;
        b=RwmBSJ8GqgITrxaU4LDYQ3Z0v0Jlt2WeqeydwXMxNzV3UfJTK31DXYyE7fBrWHh/Y5
         6ZBWKJQdYXQjR/FijFHbAF3rT2bhD1ded5jk/VuZVdhrcMs4BysPB3fwYssfOt9WjELP
         Hr8NdGvlsLpCJb2xSNQ6EQ53nb+uF8b159C2gZaN+7eAQMbJj7PilBpy/HiGRBCEipe/
         91HJL1f19Z/+gTgg1Ai684Y/hCXJSgCx39RknWyE+7GqtOdAOw41FTaVfpZl0mY6lsPF
         RtQ3pyh8LY0tL+th5lF3j86vfnwRR4DovA6BJHrq4uo3YSY8dUTU0iBfZRslBXZvOSdu
         LMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607475; x=1796212275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MA+Kx+uKQP6OM3muhrQQ7gMLzt5UOS5UjDB/PUfvv7E=;
        b=NmUJYuLY8G1boHSRGtkUbmkHWc/1bvxbyOJcdtPyT0MRDWBWqnnP7BgqxQX3n4YYPr
         cZr5Evmxj1p70CkzRtw8blP9hrNYgvY5FCT4bc3qzCSCic23+hr6zLg4w58GQie0dfpL
         cgrQhmA+lQWAxFTYaYQ/222agq6X3VYRiRCh/ay1XpiUvO7LRs7zlOkqjdrBLPOn/Yo1
         w/mKjjXwOzvVScZ2D7G4m+qdqLBK7R18t/NA0Eo0+8IJSsWw3jNGoOZ0+8goJSZHhyL7
         VCgXJqMiGo6RqS2m8PKVZRQ3yWYTM2jsjugSITWBBD1M5HWWczt7xkyocESQjfZ+HBky
         n9cg==
X-Forwarded-Encrypted: i=1; AL+hErG8TuZB9eEVKHoMzKMEP6IQFjrcIY8OX1TZfGn5X+DHRlm74enQZBBj4yPIjN+FudsEixKYjnewwwBoRYA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/R/GB+TWFlA9kcf/7AUya6hya27pbyHmEoUWLUzhpARME3d+V/
	7cKoN70mpG/YwC96lArjQsVKFUP/UBKL3vkzfQcGXqYfBskp1s9cAwPz
X-Gm-Gg: AZFdTZeH8e5dQVYWYaEMBqHZeexcsETMcRqqRdztjmFSxMiSmvsfPNNcSBxqClotBhY
	5nSeWeY/FAOUo0yP79ZIN/B31FTbBMS2wJkMuydjNNKnPCCgkE8+fNLBcWMvinABg0bE4qp/ZHD
	z25CnddKt8b2pYa12fxB5ydRo2hrpPpEOOpuBtAPWWWMmWJ6evvpT6+DMJpaaMDieSad5cqU50T
	9kVh/ARVmJOMGtus0UCxS67urBEnlGv0y2m/KLT+UKdviPDInmd+QrahBxFznyXK/9KsqZeu2cH
	w66HI515CROb/dTLbSOopZHuT56/cCxxngv5rMKgOgZLzOJXPaAVf3Ta0V7PFfkF384464/io31
	CBN4wIiiRwukgTbIysKAiZTkNUBqdy3/LKMVYrUxjGdk6LtRbJLxbG1YhFkm45Kf7DslkYFmSvN
	SBiosjUOgtJmm4hJtgNmnSa1SdG2YcldOmakKgmAcThwo65fEYe5SYHJNj9AHWkvzjBxWOl372h
	pDssJxuRjsAibTaWMCW0PH8elTQ3u1bWbVDDb8i/GlNCnzvJ0qQf3OUPJuCg4FYba9fvO5//38j
	i60x8VD4pId7oTqIGhMBcPDu+CqW1WzRyw==
X-Received: by 2002:a17:90a:ec88:b0:3b1:3e7a:6d8e with SMTP id 98e67ed59e1d1-3b41c8e0c73mr14680529a91.10.1795607475481;
        Wed, 25 Nov 2026 03:51:15 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm30569662a91.15.2026.11.25.03.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:51:15 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 1/3] mtd: rawnand: intel: declare NAND_USES_DMA
Date: Wed, 25 Nov 2026 19:51:06 +0800
Message-Id: <20261125115108.4147741-2-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125115108.4147741-1-leeonion.muyu@gmail.com>
References: <20261125092538.1938516-1-leeonion.muyu@gmail.com>
 <20261125115108.4147741-1-leeonion.muyu@gmail.com>
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

