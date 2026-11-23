Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413038;
	b=ssbSdiM6Th5YB9QMkmydmv40c2/N3frTFwWR7FM5QcUEfYh++RJEz7oFOU4CipyBzuAu
	 mXIU+ZnCnrVXAXwDsjWxcPM03IgP1KjtEWND4uU0uZahZP1lIrc1VxUMAhPfDqiDIi2p8
	 +yjSl9VFKPAHvHXFMMv49jApCXHjA7JNKX48lMqmkpZAFBs3le0a5rTV3ZmOJnXCflHE/
	 AM/1mLesf/x56EAZINUHb5HCfGh8VeBmJJqq8CGY3Oav4eJFJHQ4X2Rhac03rLNN3z9rZ
	 RJv5pb9z5fNRShlhdSUcIezeKTJCBdbtN6yG7ZIBM1WAJ0KdShOYDfY+vEb63hZgFkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uJIPp/YyH4t38dxL7yEdpa792ArQgfxLDKaGrdyjVJQ=;
	b=Zno8f8v/T2UXeX0mTyFnPGJg09HX/gA1JGPyfjU9NHQTgl45fvQ4l1LRPkMR0oesek4w
	 YVbTdScNo2Ju8S8jbVtwLDUt0DrvJa+rdtA94bzPZ4SYPmGSEko5a4jxIV6CidecCbmwR
	 DDH+mdBsTx9AqJjPksqDJizmXM0mifJXXWxFHFvhJTQLZ+KOhsRTg+JLNwqjyoc1TCeK8
	 bU7LlwCBCLWplnSMqwAI4KULt+YJMkFgehZGwBvL/Bm5kfggxxROKqht8maQ8ND8NKv+0
	 kMUofODGEMoBrGmkyAwSvzWbBRo/cqW9wHZO1ZV+fMEoS9BH9rUUzXoKMmikGtd2TEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WHDZge1j;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21891606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21891606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WHDZge1j
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f052ae3c86so13306795ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795413037; x=1796017837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJIPp/YyH4t38dxL7yEdpa792ArQgfxLDKaGrdyjVJQ=;
        b=WHDZge1jB23OVAiOmLpeLZ28nlSM+3aAA/NXF6HndWhhNj4mrT3lZRDFMWyppgiSVs
         6YrjR0YQWh/x5Vd2cOcyFj2Zu5tvE+quFJutdeXd6Hg5qj1WywPiz/Rdj0UX4fdlGnBM
         f5apwJ43l1FLhmFJDWx++mDahzop0AvufOpYlpF4JVEgal80DTJA/nBFX4tZ03bTWT4i
         9BshYlB3MOCib1lrn775NvHahUF4IRBpgcwt+iSPvBO6nlS7KRQTMpNpKZoCI5GaFm8s
         PDgr7QtLP7vZd6UQHr7w69islf70WAmbgyzBhBefam7XTUpu+Ss09BEgdEy1m3IgK1Dy
         ckhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413037; x=1796017837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uJIPp/YyH4t38dxL7yEdpa792ArQgfxLDKaGrdyjVJQ=;
        b=1rT4cQls9AnSd8wnaXJTyLB1vS+3ujb7UMtSCjWgI1p4pgDJ0b4zv6UKF5A+GPcm5N
         Iratt+ecdfBrEDe4B33vZhnpKeYtkn2iP6TFqZkavD/Wtd2iOtEV5HcaQY4nmXk8iSre
         JGtSI5jm7XUbjFXp9NFUzEdZX+OlIpHUuxwSnfC7GwcxD+GfIs7StgK25zL9O5UWJvKS
         OI6Zmx6ZsiYPYZilGHGARENEkifm6FPdUZt40LN+1gQSJN+/9svMy8QoWUHblv9seyXq
         NYIKEbdM40VFZqFQ/uU89li12oOQIB2pS/ZddpiaAP/fOVHeXn/Zi2fu0+ExgCRuspHP
         p3hg==
X-Forwarded-Encrypted: i=1; AL+hErGsUOqdHKSMyqhvw+VBm1jvKZ74e9tc3DMdNEGh2h9fig7hSV6p+C+nayBcWajKm4FXxb9LPS/nfS/OiI0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8meOgdiHMMmbDCQlytuX5kLwXYK65xkKlNwwvGIvZCZvDm2MJC
	sSkbB0Z4swBuhShSY9d/O1mG06HRRuySyJi3Kj4wOWGo6FMWyLmzdE1n
X-Gm-Gg: AZFdTZcyGASldefTII756Ums1g7dXf1qeYzM0m7ZchlQWNIgPp1nOwolXcaq3UrpO55
	FzVXVfAopL0pYOw2u6oXOw23fhF/QBiyFhoO8Ek276A0e9sv0kexzqCcBjPIrM1hWM3ILjWiRd6
	oaZw/P4OF2+yXrAUpM2ohRSe3DYGHK+7Tyap1ayLfn4YzBcDiCSuhU1EpdsZbuxDyM7RuHFl7mC
	0Q1iPaQ+CnMROaJHhHo/0ujJw0ZF0cvZqVh54iRG2Dg7LP1MkFQMEJKeYqro6P47B9gJxA2cPJD
	XCMg2u5Yw4na1F4xraDdSLhuFhk8lvmx2xGY9eDgg6GPjmuMq9NQrXuBIkxPUgD/WOsC2B2joD3
	aULz38eR3nKSany4Sk8DhGKgRv/0+q4a2M4I8KivCaIYXS7pFuVGwnZ90duqjK7JSW9SCNO2067
	A/NmH6yd4po/wPj9lO9NRWhpYhqNw76Q6jSZyY7tEgyT22Zb0EJfcb/t2zqU85hnEctunyhBI0S
	cVN1+4zLtEe2uATTZdJLz5d0mDlAGhBVpQVNnpSe9DTa1yL6LswWdSOl1JKNmg+NjYsb9hjCerT
	ETtdTuxbmLS4APmS7/2FfYbPqIQlwA==
X-Received: by 2002:a17:90b:17cd:b0:3b3:c998:6d6d with SMTP id 98e67ed59e1d1-3b41c95da50mr8892234a91.47.1795413037396;
        Sun, 22 Nov 2026 21:50:37 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b76sm46486325ad.50.2026.11.22.21.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:50:37 -0800 (PST)
From: "ping.li" <leeonion.muyu@gmail.com>
X-Google-Original-From: "ping.li" <ping.li@horizon.auto>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH 2/3] mtd: rawnand: intel: declare NAND_USES_DMA
Date: Mon, 23 Nov 2026 13:50:19 +0800
Message-Id: <20261123055020.1995251-3-ping.li@horizon.auto>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123055020.1995251-1-ping.li@horizon.auto>
References: <20261123055020.1995251-1-ping.li@horizon.auto>
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

From: Ping Li <leeonion.muyu@gmail.com>

ebu_nand_read_page_hwecc()/ebu_nand_write_page_hwecc() feed the
page buffers provided by the NAND core straight to the DMA
engine, but the driver never declares NAND_USES_DMA.  Because of
this, nand_base cannot know the controller DMAs these buffers and
never bounces non-linear-map ones (see the use_bounce_buf logic
in nand_do_read_ops()/nand_do_write_ops()).

Since the mtdchar MEMREAD/MEMWRITE ioctls allocate their buffers
with kvmalloc(), a heavily fragmented system can already feed a
vmalloc'd buffer into the controller's DMA engine, which is not a
valid dma_map_single() input.

Declare NAND_USES_DMA so that nand_base bounces non-linear-map
buffers through chip->data_buf, as the other DMA-capable
controllers already do.

Fixes: 83208e106a8e8 ("mtdchar: use kvmalloc() for potentially large allocations")
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

