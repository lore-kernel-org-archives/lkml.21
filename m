Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598752;
	b=IYphyEDnozoK//DX+K9u2n8sYQaufOxILxQ2Ctr+5pVrDfr2Ed462YZhiGLWEfbKP8cV
	 pKiBdpdF1uI0MS29UBuei3bRkoWK7qio+oomWtpt+NtopaIREA0knA4HBocqqIf0O//rr
	 IIKUiFs251CeL32Mf8c+TsEHkIxtVnC5+EwyjeKyL+zSexZboHr1xSK5m6H9H5ewSjeDp
	 fxtEfMjTHxorRyTE/2dlOgqB3x2d/IfPFiQMkkdIoS1Td2S7O1jLDoL17TKgQTIdXx5wT
	 EPkpTmBA77WebaGSoaH1eWkwJ4fbQyQWhHHfhtsrdNn/Og7ObTCMWm85IRwUU5ZWK3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X58yRtM32801RbbTP1Ym4v2U/VBocOatJPea1zyP738=;
	b=bhKwjj4m4Peg5v9xnXxAWRvS/9QWOEiKq6lFHOmo7NHshDkdR70oFoNG1eQp1xHrEZRy
	 J8JGruL2LgxmZS8Cgels44d0sEf8SVLDkG1gw7TZMezYiznu0CeGfrRkAzvNPwxVGXxF0
	 odKH+gY5TM9O+Wdt8f0TuTIFHVd3Mg5Ml04+l/3KEzuETf9jqjFRd8oeCey+Eqkj0SBsb
	 LVEknpWezdgWvnCkwWwDu2EtT+XjBtZyNriBL45e7l6qumKNk73twt6m4v89Gglgp0t7v
	 SJk6cU15rv9UW6cdcJY3Qm1/SjWNM4SHZg3fmAmRxDR4ovlBAdNDNrHWjBYduPKEBYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hsZvZPJb;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08AD606A331
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A08AD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hsZvZPJb
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f037bc348dso44499245ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795598751; x=1796203551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X58yRtM32801RbbTP1Ym4v2U/VBocOatJPea1zyP738=;
        b=hsZvZPJb3NT4UDJ0b4V8Kr/96kKPVBcBqTFr27/wnRwqcHCMOHxQDXlvpc25xjNMLC
         egvTft9ijtp3Ya9chXTMNBstVwIjcYAaGI6IAFOOBW9QwHZ9U41zX94t0jqLvUcDbqFS
         2EwZE4KmYTVyD5CSsNeO+MeAL8lpSebZJahoNvWVfvmOMrz7Kmkv3bdLQ8gBPq3OFFg1
         Oc7J5Ts8p7MCaSnRWkWBXZnkBwvqI/Qv62z3ibl6qPBqKYwso+FsSuJRefrcHSIenEwp
         A/3lo130dlAT24vgP6hyJyVeyjChqDMY6x89It2W+gU5pkU7dqBOlVCVmWOrpirr7tft
         3ZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598751; x=1796203551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X58yRtM32801RbbTP1Ym4v2U/VBocOatJPea1zyP738=;
        b=w32yuwRTn6LeRI/6ae/ozVxrrZuf5/HYNZNl6SR2+GYVnEiMS83JsuVMLmTueyArSZ
         OX8ncPbJS92b4iqARptocDjfXJR0Aj9YbSjSkbtZx8k6AfpRYvtDIWLrnyTnEH5XeXlU
         HYQCN1QiP4mezJ28yDSJq7wThdxi2VNfcnxmVRUHxxKkPe8w+0PcJAEc8ZgFQ9MAY7/F
         24RZwo96U9A/tZZsYBlFma/xnSfSfrsCUGf1Tajtqbq1oW2W36y59VeCq43qHy1DjVLs
         bsjN4E6Ye6FCmKdVMPikA4pNM/0m0E88r3MG9GB1EdjQZMY3Ruy7fnUgWsSwxjagD0S0
         JTNQ==
X-Forwarded-Encrypted: i=1; AL+hErEzzIBlw1eKRAcglszz6FYL2woPpcO/t5fS7k4ekmSku+m9mt8ReaKAck3hMj6I6kFIXPL1PCoT2Kta+f8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VwZdeWtw1YerKvS7BsBGVkgA/bSEdwW6Uh3vDDNEint6EEJxR
	Kc2Hsg9D6IgfnaKSe9WB3fZeiBR9Vq61ADnPfndlonkz6oXMYBhWDEMh
X-Gm-Gg: AZFdTZdfb6dmUgWqK3MrC6nI9J0oa+3Ohen2iPdaQ5T32ooPMB6KxY9ef1YLZqhpyUa
	P7WjgKcSHAIiiobwF+QD2WV4Y+120zmLhluFSU3KUosXmpTuByyfMdKqUV8LIQsN8n2B/ikaDzd
	LLmlSGD2e2rEnflD/TW15wYZtQShXgseJV9+jy7RyZwjQhp/Xlpd89Fp01hSAjdA+oB5Ug+7810
	xxuX91R9DnQVeHgJtoQyQn7zrN+Ce0gN8oLr/bP4zIBDGjbm/WjnM3UUMxJQgmD0re3jz3IKQZM
	pTQhFAtvInnkw5TrnPXLDZ+D+5CIvS1RuDXXjsmJ1Aj187AAvE7KFo3/yJ7TSwUqKbyQA9esw/5
	Ak3LFOEMLRFsH45svYpOAegB+avB1vRulnH0j9oPjeQKmBc4T6n3sN+ksX4CAp7bW/cDya4pemx
	QFpb2y4+wWezFVTSfXvl962CuedDBY+igJKMnDyzTcpsKPcjY2zata/O1x8vd6n4hlY0ieSYYIp
	HzwCoapHFwy+eqBYy8pt6IrY3mZmLTxkyjsl7lEQrnkZeEWINr22Q5x69vYW7+5GBuHgsaCaI0b
	56OiIim1tFoOAhE4SRoGFLDpJkz4GPOB+g==
X-Received: by 2002:a17:902:ce82:b0:2ef:e9df:2422 with SMTP id d9443c01a7336-2f03f1cf4e6mr174997205ad.16.1795598750820;
        Wed, 25 Nov 2026 01:25:50 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f142b8bsm80883155ad.70.2026.11.25.01.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:25:50 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
Date: Wed, 25 Nov 2026 17:25:38 +0800
Message-Id: <20261125092538.1938516-4-leeonion.muyu@gmail.com>
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

r852_do_dma() feeds the buffers provided by the NAND core straight
to dma_map_single(), which is only valid for linear-map addresses,
but the driver never declares NAND_USES_DMA.  Because of this,
nand_base cannot know the controller DMAs these buffers and never
bounces non-linear-map ones.  Such buffers are not hypothetical:
mtdblock's write cache is vmalloc'ed and UBIFS passes vmalloc'ed
LPT buffers.

Declare NAND_USES_DMA so that nand_base bounces non-linear-map
buffers through chip->data_buf, as the other DMA-capable
controllers do.  The existing local bounce in r852_do_dma() is
still needed for the hardware's 512-byte alignment requirement,
which the core condition (chip->buf_align, default 1) does not
cover.

Fixes: 67e054e919248 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..f930e8cc80e6 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -640,6 +640,16 @@ static int r852_register_nand_device(struct r852_device *dev)
 	if (dev->readonly)
 		dev->chip->options |= NAND_ROM;
 
+	/*
+	 * r852_do_dma() feeds the buffers provided by the NAND core
+	 * straight to dma_map_single(), so ask nand_base to bounce
+	 * non-linear-map buffers.  The local bounce in r852_do_dma()
+	 * is still needed for the hardware's 512-byte alignment
+	 * requirement, which the core condition (chip->buf_align,
+	 * default 1) does not cover.
+	 */
+	dev->chip->options |= NAND_USES_DMA;
+
 	r852_engine_enable(dev);
 
 	if (sm_register_device(mtd, dev->sm))
-- 
2.34.1

