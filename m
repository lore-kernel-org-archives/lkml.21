Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609306;
	b=jSSb7KvjdRxpSDY1w4l4igB5j7cqgvMPTUEkAIQLfE6CwLB2Obhys65StTXT9XNrYiCy
	 EEQZDl/3lYjq8jO36tPPzuCozB4pp7g8Xxn6KiXqWlEb9FcwgB9dSZ/lAdNL7UpZCeAdo
	 Ks7zUL6Usi9Jlbjl0pdXjj2GVTgVowTS79bs4eBviS7rxbedqQy0KyHI1u/EOAWe1noe5
	 ETFmMVTNmN/7C+6FHG64YRyVi6OSM8oSavdLp5O1RbBTOnMfFhziMqdHQ79krEzLZw8c+
	 8yKfG+LSVczMZrz9IKbScVgUFr4509al14ET0bUk8lF2MXrfmFurnt2YiQdYoqSdZOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MA+Kx+uKQP6OM3muhrQQ7gMLzt5UOS5UjDB/PUfvv7E=;
	b=RSjpElyWIBs7Px2CB9/14jmT6oLnHFYq89btjuldO0+4KA7jdAPwgaa4mJxzJleNeeNZ
	 fiBqMz3r5dXQlhcXkZ+K1WSdhK9O+ZpLYR3f5O5AzmtNlBQSCJVd4YGnGGPDS6paUe4Sl
	 eDzuc+cL2/4UW6ypWnaGTtUK1kPQRfqwni5A0gCgVRalbG8pWq7XSga0OwQL/mdLafbLG
	 NK97smCPdmcYHeLnfDQdk2yNrQeZJe4Gr/83qvLWwxeyexURKWkVTTuvFM3O1GFSJ56on
	 Kvg13W4gt9jb7FeinTWXs8b6QQWwNFdSEzcPCwM/IBRQGjwZNrX1Oep4bGXOWHcdx+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQ7tVrvg;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08623606A335
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08623606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQ7tVrvg
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a070755c8cso2742524b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609305; x=1796214105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MA+Kx+uKQP6OM3muhrQQ7gMLzt5UOS5UjDB/PUfvv7E=;
        b=SQ7tVrvgLwEpKg/dLncg5k3nm1AW6DlK3MzIRxWHfEFYxIUSgU+pEFVBWmLtSqhRAf
         cDNcL04vHuB2g4ruka7p3ZhQZ9RSTR13frc8ReyxZsKXO5hWNlkhMXqcTHgvEujwvDXE
         B+IKebgDnatZc7R7okaBERbKSJ6Vm9G4tI0cRTRdcHKjFFI0BBcpPiU7Dv4YI/ybjRRH
         xtvhYCNbjxhjup6G4BXDyWdIH5FuOqWdD+a1m4q4BUkw0FhQQWifbf4BYI2by48nO1K0
         LIHoQ83IteO873Hcc+QgxDxjOu4s1a5qds2nmum2eQDph5GQHsZvmEN4yQXYliprzMq5
         g+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609305; x=1796214105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MA+Kx+uKQP6OM3muhrQQ7gMLzt5UOS5UjDB/PUfvv7E=;
        b=imEclcwx5pMEG9vqSmyFAP5Lr57SPeGbSI0mj/moB8NyFlr/ffpzLSdP3XhbXAgjiG
         5sGi27+o0aSDbG1hhSlTmCnVdTbKz3pdr2o/gcgPR6V4DTCHqM7vhikMnp4TEkrFGozX
         FDLXB7/C7p+HKKNHentgH663lzzoPwyiBgOXGRO5PjKj7LYS02WyfFIbh+ojgyXqYFIy
         JfQvzcdW7ClyznVQ3K8DNpk0kREAdb7BGaVg9mutua/CuOgZXT8mdUBLMDgtjOrmAV5z
         mB/Y+AoIQvmvCHK86ue2gGGJLwGPOpw86AlqVkFysXxxMQxIs/w1A83Mcj4h2MEoXzAE
         EOHw==
X-Forwarded-Encrypted: i=1; AL+hErGZ6wJF0g7AorOvbCmg1/vsppgtf5lX5exFxssU3jA9DaKQq+OTABlYdJ+mRY/9FoWBvtQIRAjPPnaTYuU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w/u+zTfyVKeeRvgzCEy4mJYTZD2HJkq3ExZre2ULsPG4kX+TH
	uRL73K/uj7AkK5cM2U55rIICJT4a+4OzBnPmxz/Y6sYY0mNVYSXgAgGJ
X-Gm-Gg: AZFdTZfuPJoTwczBl8xnZSa+u+/klvvcqntVA9ctFwQEg1mRZ0V7TBU+RyMQbCLlxq1
	Ki6gCQyHLiLsVOE/oj13heN9GyXj68MxUtnLVPuEhKtGa0FDVuc1fGzfR1PTefs8o3iUggJ9PQr
	1hG3WnKuxPY4zQqLt24c1KGCVxi7IQAtCzlb4tWXLi95QKEAEvVpB648NO+xlIvdX6ttHqWu7aF
	J2yCij0WMkwcGMrib213DXVVbpwuDu+QHC57LBqLLx8bvPgLJBud8rAypQQuzT/OXAh3xPSULfC
	src18iVd0QZSz92hbyl0LgrHfiVz02q+IVWgRzLEhlc0bND7gPCbacC/UO/u2YmwFb3SyDZrpxu
	avHXHK35taDgOiZT7CJIGiaDC/jcO64rkQMxMoxmxWeTAPY4e6qHQGg0kOqQWOfOv2XtqDbVcCY
	St1nQSiXw96BWv9VvlSQBj2feNWsGUBmwckp1urfVQgyM0UjMGWZSX+z38AOWhLoAi5K/C4OQdJ
	4Ref7Y6LNu3DVD7gmWuFeEKhcgvjNEzRV+eUCqAH34e8d3qORcln6H+3qYRjePYv6jPWXBEWBHZ
	uN1X/156t7DrgmCJal2mrMFhnk87Y5nJQg==
X-Received: by 2002:a05:6a00:2d8e:b0:869:9298:ba59 with SMTP id d2e1a72fcca58-8c876741225mr17478088b3a.0.1795609305329;
        Wed, 25 Nov 2026 04:21:45 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c89dsm8688656b3a.13.2026.11.25.04.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:21:44 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 1/3] mtd: rawnand: intel: declare NAND_USES_DMA
Date: Wed, 25 Nov 2026 20:21:33 +0800
Message-Id: <20261125122135.44696-2-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125122135.44696-1-leeonion.muyu@gmail.com>
References: <20261125115108.4147741-1-leeonion.muyu@gmail.com>
 <20261125122135.44696-1-leeonion.muyu@gmail.com>
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

