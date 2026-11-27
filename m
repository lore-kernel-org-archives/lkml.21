Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781957;
	b=4PbSyfDUVOpyaGZCSC8y4/BdKMXbRyTQVUWOLR/zGb1SOJS+8LO8pFrwabPI4ywcmonf
	 X3QWtYF93v54kZrVJz+sOs/EI5fUrOK91xT9k8T1abWIcRp+El5MOGrVQByUUPFp7Xe8a
	 pdC5Hfiogfj3ugWtJ7UJWQCboyr9LIIXeDzVKgxj3uAUiuR8cxSTgWbeFXzibojGi+YMm
	 3oQ6bhrGfHPfbSBM4D4jUoDk6YsZctejIRDl1LBBbmcBcUMCmH/5Bd6gA6aIa/mduRHeW
	 WpolGH03bG+AMhnHWrRySTl3GfvB1pQpU2ORISpXEaoqhXfJt46DcEXSDWEN1+IcC7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qmoiYjlPD+Xn2b6TFwZys1qhd0znVC5RxZEyMOw5DJU=;
	b=A9jJiUNhQ7E6JoE0YOa7Kp2JzV8kLcZdJArXYvXy62ZhaG9VskxTlCM71zO4CzKudee7
	 /zC+zsMhtTbPvz8R2OkmKxtcsivHco97SottCi25WHiM8Hu6soKMZRdG5c2OvRRpWpcEF
	 RyPUYSi4XXtF+vPqZ/G0vgR+6Wjwh4o0EQzDkSkkF3uDnIevdTX4XQsFkjoCTyMlMCLXl
	 48o7i8eLJXPPP5RlCKdmUZ1qm62YCBBYKM2Y2jf9FWlciwCH3j6VEzNtPfnOQq37PlXNY
	 2MAWdtURe2YoxgtRPa6KHHM0Y2gbhUHMRr0oGVz4ALCai5mn857+5IUEusj0j8IAT3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="Uab/npfa";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B670A606B82E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B670A606B82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Uab/npfa
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so85267705e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781955; x=1796386755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmoiYjlPD+Xn2b6TFwZys1qhd0znVC5RxZEyMOw5DJU=;
        b=Uab/npfaAoMERFdLfsRHfMv3D5m93m5Z89zlLOvN9XGRJC00fHgYA4zUAlSvfXPj9V
         2vhJ8kj7KeIQLhpY33KuL2N4AB6FFUSx1Km4kTfwZiuSFoFLRGt62qXBDXECiYrycHSm
         7DsraX4S/HLVemJvM4Z04y6mHbSM2aP8N4qlaRardBRn5fP+16/wHW4elcrq0Yh9WIAe
         oFouu7oGno3RXlYVur2Vz9FRuGGuB6LpoC06IoEddumwCB0Rq01kajUL5LfGu4CPIUZG
         AwatjhOBNbc+nqTweOiBZnxMGyj8LbXEiSFGArP9DFiLZAKaclmrUl4LMHIobozmZop/
         c4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781955; x=1796386755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qmoiYjlPD+Xn2b6TFwZys1qhd0znVC5RxZEyMOw5DJU=;
        b=BrwU7O6NNjk8UaXesQrgeqSV/2x7tHTHP4gb0sCUKvTrn2rofVn2sEuJ02fHHf8Mfb
         2BzMdVb9m6+6I9J2flilGOn8v6Toyt+rmUPIhoGnHdsQFGnnfy134if1kRGRmU2SsZI8
         UkgYi2qHlszOARBrBVconxQineyWWYKKGMMIL5suWz3cmvoU4CSkYtg5tnt8ztj2+S0K
         cQSbBSq092xaRQ/Ye1cJ72lVnzfPg7iGqktHjwgrbXSldrFhJBxBkENS7L7x4ivjvwbE
         i8gX9bypFn69ki7IJeVHDpLfzZz/ak7WKhUfvr0/o9dtVFe6dD4G+KM4OZeKP4wMbtS+
         JQPA==
X-Forwarded-Encrypted: i=1; AL+hErHtM3FIICK01aZu0+OTdJ3H9slGeyDUrJLj8P4+Xk58KD6JpWXUToaJ1klHN0Fm/Lpa8oNBDVbtoAUSrUc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+M9aC0Xot52JaJ5+VIcReDBlU+ewur+G8Sd+lNhxqNWTkgNWkU
	FKudLpognGrNCf5q5UQFnhZ9fg193jhkoKLaa4A/LW1LdbskMu3xOAoE/rDd3tSm+38=
X-Gm-Gg: AZFdTZebbwu7r/XIjKLasJBvBYjIoA9Aza3JLCX6O6dppE3eKSt8FLisyrqDFKmUVHR
	z3sal5ccG9l68WNmBfSNGZYVls/fHDUPI/oP2CQHZJrO++8L+oQQD6z1UhrEjl2W8GCMqjG42tM
	eG1I6s6G4nGhwf80eao4Ng+0JFaTE4PsAKb8rdhN53RS45NkEr5DRuGbSyRFfJgw2ZB9KfXlQe/
	BAOtlPkoJHdhTNmuxlfFfXJgu5xiuTwY4nWHf6TZKOt4tH8aheGHRoeXN+pdVvU+oiGND8Bqng/
	ujfWv4vXNPXxx24kZ8X6gMkdhjHeScKeeDwjtmHSZYnfz1XW3ni1Cy3NNAAP87IjBtT/4P9CY85
	th7I3GOkQ/I0h9XET6k75IXaS6g77PdfxZtceyoZSG82YrVwUQmdKDz1HxPZKfPIt+Oi7MkwVya
	kEStHNpq0tT4GOUbtFfWK0cd4DKTPCyICiF2z4Rt4p0cFvxuM20MfYWR+jFWC+I5P2XxBA4BlRb
	z65ZppQm6qfzPCdD+Jj0PXmqI4chtYpEONK4bj4sYYzkEgwFI6d2UwIYU3GA3oLmvFLfWqGEHMJ
	jFEtRZ4h10J+yUxWT/5DQrE610Z9dyFi7V2j3JqZz1WrUyTboQ==
X-Received: by 2002:a05:600c:638e:b0:4bb:6c5e:b006 with SMTP id 5b1f17b1804b1-4bb887e265fmr462247745e9.3.1795781955134;
        Fri, 27 Nov 2026 04:19:15 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm623847775e9.1.2026.11.27.04.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:14 -0800 (PST)
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
Subject: [PATCH v4 24/28] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2712 40-bit DMA
Date: Fri, 27 Nov 2026 13:22:14 +0100
Message-ID: <20261127122236.4976-25-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
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

BCM2712 has six DMA channels (6 to 11) with the same 40-bit programming
model as the BCM2711 ones, each with a dedicated interrupt. Add a
compatible for them.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/dma/brcm,bcm2835-dma.yaml          | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index d4a7001d6f97..e844fea55fb4 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -17,7 +17,8 @@ description: |
 
   On BCM2711 the channels 11 to 14 of the same DMA block have a different
   programming model, which allows them to address 40 bits, and are described
-  by a separate node.
+  by a separate node. BCM2712 has six channels with the same programming
+  model, numbered from 6 to 11.
 
   The channel numbers used in the channel mask and in the interrupt names
   always refer to the whole DMA block, also when a node only describes some
@@ -38,11 +39,25 @@ allOf:
           maxItems: 4
       required:
         - interrupt-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2712-dma
+    then:
+      properties:
+        interrupts:
+          maxItems: 6
+        interrupt-names:
+          maxItems: 6
+      required:
+        - interrupt-names
 
 properties:
   compatible:
     enum:
       - brcm,bcm2711-dma
+      - brcm,bcm2712-dma
       - brcm,bcm2835-dma
 
   reg:
-- 
2.51.0

