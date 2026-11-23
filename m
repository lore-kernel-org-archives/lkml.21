Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445624;
	b=tFANRUbKUN/J8y+XvyvTqAMtI97zi/DV3xQmwzHcI0TSJZmOWQ5MjZpss6b6Zoz9U8tW
	 x9RREyRIZVCR5btf5fTyd018OHFJdLVRaeHCKkehKA4Tkzv9dSGLqPuJYvORwq126b1FQ
	 j1lGeUHbxfVhJf/ig3GnEfhGagAauv4LSPoiEHM82ShmyhtoBh6wwv34uB/hHSpepvArQ
	 8qECPhVDo646LozgiOo5itmM34T+tpTQUqO+KLcl10ysmMBKQqIyR++1PmwmbqHho+NcP
	 FsT7KMFxzqCALiKKeXFCBtMkV0GTcV2S2c/GmX8CIPXtB95pyM9hPFhn5eErJCaX5Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zrHCc76aLS6mD7wsfBCrlZZx8i9gK6gdpTx6g5oieAs=;
	b=WBnmmvkuH4U8pt84+gMXHIK2mDFYQ1udPMBPtp6qEd/sIKxTbgrhNGmiW2e6JGhrgKWg
	 Y5nS1Iepw+Fu/ePTotcoaMm4dUbAYBcxXEtmkJKwPF3UY5I+bVCbSz+4a53614B9OeVLe
	 kNpX8jsFmPgUwqhIBCuXMfl9Npi576jK7XghGVkGjivotMGsJ939wlJsKFCsU1MZe5zwa
	 rS4pCu0xwXFuGLcyIsVKRlrY/1n1W3f4QQ+OItXwup6iHMoCgzOHsudD2B62tbv3x+TaH
	 uD7zbHcWyErCHQNFGM+AhHsvXjIyJ9aS7tVHyQ5vx4aiBEGbCp+/6yFjPeJmvfgHbBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NnumrRdf;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82682606A688
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82682606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NnumrRdf
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so2696356f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445623; x=1796050423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zrHCc76aLS6mD7wsfBCrlZZx8i9gK6gdpTx6g5oieAs=;
        b=NnumrRdfEux5gfgyZcOFK95vPXTjkeGWjRPizY4vGc1oc5gkOETNYiNoq1fkUnl0dM
         oeCG0ZX3cxg/z85w+zxVEKRBmU3WmgXi3B9BTQ5fkrpjcd7MNdP34a5zOLYBlkUcet/8
         EcLgl3sHpfxQkNNp+hj6n36kcfu2g7uMgdzH7XQmYzXBXRU38b5THI3pX5QRsq/zIQ7s
         VhiG3OQWjRdwTRM96qdcBQiU5gWsWEH0l88FKXVtRmn9bvkKI1GCbvXpKshiiv1F6UCv
         oRhj+qm09zUUznmdSbNle/aasJ0oJdIwG9ihReM5dnKf0DvBgNUoa0/wFxjgtlFMwuCr
         Wx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445623; x=1796050423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zrHCc76aLS6mD7wsfBCrlZZx8i9gK6gdpTx6g5oieAs=;
        b=go/YmgzaLkOcQcD/5N3bMC71nAYND9a+nTg8f2chMykWadMCp86LMDsAuh4CfiZnyI
         ZE0fU47Vr3tSpriT2CorMD/BeOmM4WxH9dtSdOKwMOfNczuypfj6+9pLJiXgy6gDu+eI
         f6MUh4joGRn9vZCfiNyv1TG7CKkzmCmG/VTt56NFNswV7wy2PQjtEVamYyU4VN7faHRk
         5pv38IaX2LbsVo21TKoJJ9+Rw9ZymsvM67ObYSw1OoKXFwAiFmRMNJklu4qEJExs+gjq
         rKA1tLaGthYup4BiuLPeQIVzQFr0t8pbQtN4LGRbuavch3zOYF2159oC6lF7dxqgcFI/
         T1FQ==
X-Forwarded-Encrypted: i=1; AL+hErEraCFoDYDrf4vF7eul30vluMF850qFmDhMnwX2grvevbakcZ7R9hTzgWwgXTZqoGlKOontL/9FgqyGVMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xZfOVQXjs+X5dcSMHYLEQSYuk7nFtd47NQ+vSR2dKCoPLny3O
	bl0SH/PDbCalzA47RDYx/E76LJfvn1yPNWcU6JnvDF77xVlBfJHzXa19MmzNHwXjwN9YfYPp21p
	jtr4X1cU=
X-Gm-Gg: AZFdTZdWWfo4UIlOY6h6hYYYa74TZ4655/esNmsumn3RDj4l+kYO/LBUZlmQD55fXSE
	1BNyxqbylxYWSHwWqjSRSh9Nwqr+l5/7DholtmO3ZZSpvYi55jWghjlfUwjWdqIW02NGFqnoENH
	b9i+dcGSUyOl5j41n4X53ChwANPcnKOhQec/AYoYSmProV7RYwp2BzXzIo9YD4QZW3vAxuhg/yo
	clQ6WwTm/m60qPZ16+zrtikj356wFA3/l/ollzaH0iEGB6dlXGQhsfEFcHdw+gDiPd/QNk10ROH
	WfpNWhDyJ8iwHjQgJfBrN2DUygKEVAZU0q1w31RC6LM1KMWbnUvp5Z1I6UpWMBJXjkU+1MBn/yo
	ZSKhoaMRk9R2xH6echQhyhBL2IfimudPXTG/jjXRBo4BteuZ4ehSTVfqgY1BOBLBSDzKdiIzYtL
	sDS0Nq32It64arQ39Ky1SSrEoGveJCwY46etncRy0MKa2S6OL66Q3g5iHejvY3il4/jrrxQ/AO2
	IweJfSb6IlZVcZD1Dx+1Tq8ACHY1Np1+v1oSzRytuJvhpVfsuM/u1knycl/SwE5YOP22lewT4nA
	XIga1Bq3h2TK/YD3QiwmJqXkmY5KsvBb8mkYmeEicYHv2zyk
X-Received: by 2002:a05:6000:22c2:b0:4ad:5e91:8fcb with SMTP id ffacd0b85a97d-4ad5e918ff5mr23600375f8f.25.1795445622898;
        Mon, 23 Nov 2026 06:53:42 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm22447029f8f.38.2026.11.23.06.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:42 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 07/28] dmaengine: bcm2835: Support common dma-channel-mask
Date: Mon, 23 Nov 2026 15:56:45 +0100
Message-ID: <20261123145728.29082-8-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
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

Nowadays there is a generic property for dma-channel-mask in the DMA
controller binding. So prefer this one instead of the old vendor specific
one. Print a warning in case the old one is used. Btw use the result of
of_property_read_u32() as return code in error case.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 51e3a40dbaec..1087157fb242 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -991,12 +991,19 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	}
 
 	/* Request DMA channel mask from device tree */
-	if (of_property_read_u32(pdev->dev.of_node,
-				 "brcm,dma-channel-mask",
-				 &chans_available)) {
-		dev_err(&pdev->dev, "Failed to get channel mask\n");
-		rc = -EINVAL;
-		goto err_no_dma;
+	rc = of_property_read_u32(pdev->dev.of_node, "dma-channel-mask",
+				  &chans_available);
+
+	if (rc) {
+		/* Try deprecated property */
+		if (of_property_read_u32(pdev->dev.of_node,
+					 "brcm,dma-channel-mask",
+					 &chans_available)) {
+			dev_err(&pdev->dev, "Failed to get channel mask\n");
+			goto err_no_dma;
+		}
+
+		dev_warn(&pdev->dev, "Please update DT blob\n");
 	}
 
 	/* get irqs for each channel that we support */
-- 
2.51.0

