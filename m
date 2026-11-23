Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445643;
	b=MYEGZ5k27Kj2eyWEs5C6bwVXp6OvSMfvdje8an5SN6rGKDYnOznTGIUTSOtSbhL5DMiU
	 /bL3nW4dl4uI7Q735GtaUPFLnUskRApfWMx+Qx1yyYv17RrqOJ2q0oefs+m67pHqOWEBE
	 mfKvEvnrZG62JNGXcDGzJyHd1sK+i+2uJHYdlUwdB0EoC1VrsZ82Vt36hqQ1/yXpAEa7r
	 XY8KwHxdCGUMvQdluvFetEXXc+HoDm4TafVt37gFU/AUh8KtTCopHema9nk0XDZ/Mw7eP
	 twP7Q6uUjM1CkAXBr3P2m8EGgSix8I/IElb6KYfBTHzDrMLdd1eOpH0xRkq0bcnL5Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2ojavuWL7IswiT9p/75gc6DxtN1C14kg/yxfkQH6rLY=;
	b=HSTpUU7+pD0XiuH6n6XJ+ct91GtS4o4QmJQzKwBA+grHQKT4719tMuuoWpljqlsk16MR
	 r0EwCHPgaKVtidS+mt9uF/yYVY1lvzeZPQROgPz3eXG0HybcX3el7NPM1jYHW835hM/gB
	 hPxn1lot18RsJ5it0nP8RuG4BZ3H2mXmyfXA0dLbsS7hhiFKqZ/99YlfUMf/rKw0sUjF0
	 tlkt1JHy/hiAO+cGiaXFEzNI0N2tt1jq5Fu6VAvuFxRDhYaaJ6ypooto8XCP9i/CClis6
	 f+V9151zE6zOc/kDXAOPJ7fI8FrSaApZisBp6qoQM0JHmTbZo3hj8JUo5T9mkqsEwOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=g77FX1do;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B76606C1AB
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65B76606C1AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=g77FX1do
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so2826648f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445642; x=1796050442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ojavuWL7IswiT9p/75gc6DxtN1C14kg/yxfkQH6rLY=;
        b=g77FX1dofGNAbQCzLkV0oWFpCzG9twT+vmYldF/KZ31YTTHjq8FiANr6UygbxVzgVC
         ob/k6JCn2z/t9CoAjeTx9EI4u3nsyv0rRqgY8CuK1LupvIu09qzcNKgtT35OZXLqSuv2
         NTTdu7o7B5OKVftBcY2yskHYNrO0VdZVu2nvjnOJDLrLBy/FeZGO+ET4/TPArXADyJeP
         ArZkCwELVQP5u4fHLYb302TPDJ5TM5T8XOd8/IuD7SCOte2lgEKn2vm0qcsmYhixGYaa
         VNhVWxfcex07ZYMvBgtkQpXmwXgiMFteHq07UvO/llr11roOWfc6BpWbyC0rHeC7pjhL
         lnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445642; x=1796050442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ojavuWL7IswiT9p/75gc6DxtN1C14kg/yxfkQH6rLY=;
        b=PkgVL1traP63SXk+x/HwDNR8ymRSMLQsqEu8Tj60UzIlmIjw4KlvJcQKWCBxLZQX0A
         QkAmxGklG1KvvooRwciltx2a5AKyw9QO/Qz1P1x0gYeJtng2jh2YDBQTeVpr1/Z8/BbX
         UOnbL4/uuYtNPFVT9i7R974pYR/fQxtIq/E3JQGx6ymYNX/lPMHgAVem2wprGwggU0HY
         5+jRKbfYwudIfWNXqJExvO/sREEV8duWDHbr353dHl92v260tcIewEDDhl4U42/lw3bp
         gog4gU+cS78Xa3AiWU7cPmyfKK3VJoCHa2mf/AIIGxKOSq/AKK9ckgBJnxnfmLsmhUsi
         gluA==
X-Forwarded-Encrypted: i=1; AL+hErGuudnwJpuGC9EgTzp6/rspTrPeM5MCW90rQ6UThFZh9c83/RcbJ3H+2lzXD1y1ECcei66KzF7+MHEX4dc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YJvv1VRIoUa7xUjAzwoeb5aYcZD0vr5VptOOiT0P9A9QDTcFy
	EdrC+7KXhEJ4pDa9YiMKlxM+Hwx6OLQKUssB1y5deaW4cltFVfpUUOpyXQvEFJeE7f8=
X-Gm-Gg: AZFdTZf/2nW3dT6IZhe3LdTD71dpQ1OB1SC4JmuaCotnF+eMl5zdl9D4NsJITJigdi7
	owly0xW3ieBdIsbdXP57xmwAWUHIkwcQPzgK4wMWRtQJ6jqC3WcRDBzUf9LifPGutXMuq1DfUWc
	jxhwoY/Sb6//9iuzszoEpNeS63at0DvRBPmtoLrDgSufEUOABY60YHFAAXkNG+4ajWuocs/Wvb4
	13h9oEMBiqw09vX9ze6fzqqFmCXoY1bDCTWMj84NuStvQH1zmI969Py8oR1RrGdAl319tuFd5XU
	pEF/oWQeoOU4Bh1hME1CHMhUBiV/5/+BM757cbXIqfvK2fNU11oE5uWlCXKKe6NkFOLCLkcsLQz
	MUPwtIqEUiax9Fqjw95xzfjwlrwIEbRQaS3nkL1rLSfgwyDK4KrElcZhkcAuHZjWg28icBfJgdB
	bGeGqlY2y/KUgKJsCjZ0AzQJb0LdOXaHrJFLR4cbuud6QzfcWN5CPwgI7r61Y8DfaFWp8lqk8/S
	oOGwHO0jVh238FAhc9jdrU7RvXVebZ3Enypnmqgxfz8/2OsoK4Dk2MnjTZcY4aOZskEnUQG2fdW
	33CgC3bKajI5qHKgc/sV0EseVdE=
X-Received: by 2002:adf:e886:0:b0:48e:3ebc:d242 with SMTP id ffacd0b85a97d-4abb2dda339mr17523667f8f.37.1795445641765;
        Mon, 23 Nov 2026 06:54:01 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm26379033f8f.21.2026.11.23.06.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:01 -0800 (PST)
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
Subject: [PATCH v3 21/28] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 40-bit DMA
Date: Mon, 23 Nov 2026 15:56:59 +0100
Message-ID: <20261123145728.29082-22-andrea.porta@suse.com>
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

On BCM2711 the last four channels of the DMA block (11 to 14) have a
different programming model allowing them to address 40 bits, and are
described by a separate node with their own compatible. Each of them
has a dedicated interrupt.

Constrain the interrupt names, whose numbering refers to the whole DMA
block also for nodes describing a subset of the channels, and require
them for the new compatible.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/dma/brcm,bcm2835-dma.yaml        | 47 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index f619e395cf0d..b53652d5146b 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -9,18 +9,41 @@ title: BCM2835 DMA controller
 maintainers:
   - Nicolas Saenz Julienne <nsaenz@kernel.org>
 
-description:
+description: |
   The BCM2835 DMA controller has 16 channels in total. Only the lower
   13 channels have an associated IRQ. Some arbitrary channels are used by the
   VideoCore firmware (1,3,6,7 in the current firmware version). The channels
   0, 2 and 3 have special functionality and should not be used by the driver.
 
+  On BCM2711 the channels 11 to 14 of the same DMA block have a different
+  programming model, which allows them to address 40 bits, and are described
+  by a separate node.
+
+  The channel numbers used in the channel mask and in the interrupt names
+  always refer to the whole DMA block, also when a node only describes some
+  of its channels.
+
 allOf:
   - $ref: dma-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2711-dma
+    then:
+      properties:
+        interrupts:
+          maxItems: 4
+        interrupt-names:
+          maxItems: 4
+      required:
+        - interrupt-names
 
 properties:
   compatible:
-    const: brcm,bcm2835-dma
+    enum:
+      - brcm,bcm2711-dma
+      - brcm,bcm2835-dma
 
   reg:
     maxItems: 1
@@ -35,6 +58,8 @@ properties:
   interrupt-names:
     minItems: 1
     maxItems: 16
+    items:
+      pattern: "^dma([0-9]|1[0-4]|-shared-all)$"
 
   '#dma-cells':
     description: |
@@ -119,4 +144,22 @@ examples:
         dma-channel-mask = <0x7f35>;
     };
 
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dma-controller@7e007b00 {
+      compatible = "brcm,bcm2711-dma";
+      reg = <0x7e007b00 0x400>;
+      interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "dma11",
+                        "dma12",
+                        "dma13",
+                        "dma14";
+      #dma-cells = <1>;
+      dma-channel-mask = <0x7000>;
+    };
+
 ...
-- 
2.51.0

