Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781954;
	b=znKPrF2ZXfgujYgrAdI9t+U0vccuympDJmFPGbriQfgwu+vB0rU+PflE+ec7Gsl3SMqw
	 m/kSghM8JMw8sv2BctyunF4C3WjYMhpsMtP1liQQ1vBFE9YTiS1c9+5ZA6I1mf8LlQfF0
	 8eAsQrQLjrVRXiHfPmhoWIr+XvsPCl9pWHI1dGyLmNhncpVNWZ4Q3F5eHvFk1U6cGLIus
	 PFvV04yJNeCKktgndDGhN69ICxO3jc5OZ4+A3XOJQNc4wJveL5s641WJmrt/5jpHrz0x7
	 T73DWrLEWOgA1CNqzUEx7akrjzPZu/uMLmYPIqLLEMIHqSk7l5uxLTUB/KHJG7q96DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R3AnFPOxgAgx5s9ofy+ghKg7a/HyXXQSnc09fl1YVw8=;
	b=FzaZjrsUG97CVEHO+GBLJn8jUbCPYU0YUsKfKzoL6njhxN2Ze0JPsNaasUc8wdUJvkQp
	 lFKmJCksLl6QHz2xkJI8Szbb06f50sXff0zQuJiwBoXprw9EDeSe8Fq8jY7VitsRtKEHe
	 pTnqAuebAlDFXpdexI3Y4b6tezFo4NWGRn1D2a85Tp1mFLZbg2WuG4MrmrdDXsXJT5d/1
	 A/gq9lAC5Opf3FhB4Gt1WIYhbHPtg/skNZ4Aq6OQyLO9lzyFG4grpA61kiYFfU3mM0EFi
	 sngjZy1mqwX2y4wHM4jg6k6M9WfVC8aat6w4rgFbIAhkh1b8mtwxk/LdaHi9EhOQ60w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="HtDJMx0/";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31391606B800
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31391606B800
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HtDJMx0/
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b467581b98so77467925e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781951; x=1796386751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3AnFPOxgAgx5s9ofy+ghKg7a/HyXXQSnc09fl1YVw8=;
        b=HtDJMx0//Ztf2mzoZz95DmiOpLMxYRts4sLL3SwarcjnV78nqWfuYjTJQg5TnS9aaE
         jsWsoEYKD7l+serS9ZgtXbhj4UBCI/haitQDZmwhu7DkpgdG6lEynM+ueKEaEya4jmMf
         RVOZ1CA6128q+uZfcfdJUysvqE684zpkHTzzg0A7m61t7xa5aEpIJ6CBczpS1ttvE70E
         t1SY88ATW3AAEHiIG3NEliyEJo3THf9pOdalkk29ZXe50atSLuS1qQkagDA5kxTg3dH1
         Ic/q/P1Gbs1oWbA//uJSsTcyiTiFFxE6pePcfo5Xsv27cbnz4XoZXO+WPAGzhw0eoKAg
         ZpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781951; x=1796386751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R3AnFPOxgAgx5s9ofy+ghKg7a/HyXXQSnc09fl1YVw8=;
        b=iub3nhr/N6TVdXJOTZQQwxrS76kUFq3AaJguc6R5RfRUi+o6TIMFaoRVT9T3xoZ4oo
         uE23ql0rtrXfTDYXtNBZ8WgbwdZFhTJYWzUAGFAxY9CL2QdyuvugF9Xr0OjPuWev8hhk
         nUkx8oSRXXXHT9hAnvlMPVQSQdfsDePulpP6MVfOr5y71AICDi5Ff3uwiMF1GfxlhlBv
         e4LSEh930SsUeX8gd0dNetTDylHTH9axxMgW2+LH7gVEQFH1uBk+dGx0SmBVuzDZHe7H
         RTtOw/nuLo+YBt28R/YamBmXa8tk3qjmwLQhVt3MBSVje11Y9ZyszLw+PJMBCE1yDU1l
         WseA==
X-Forwarded-Encrypted: i=1; AL+hErF66aeR0XsbPkSvbetzv4WZDskwdpwUGnelAbMwLQGtV0qgfvODUizTBK2RIT6kFSHS00RNZ5NvAkpgtzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ABUyGczPHRhmhRXXcWlO5lM65x4qmeXpMkWdZFdhgwDl497NN
	huhqshticCcP0Np5r2xDh8M8MrFyzpdd4Go0CUheszbH2oY1GR8VwZt7XSBxT9YCLkY=
X-Gm-Gg: AZFdTZf74RY7BFCS6zzvurc7sn2IXXe47OLANy/ED1JcRpieMCgCEbEjM8Be57udjFD
	MBdKM3nQoN4J9hbPMSIPB5Wpbh9KP1Jg9wckaM1Z7tDlOSYg0QvmnoIVWNbpcv3+rX0bRp+PD2p
	LP07zI4/1EbHcPSUZYJXsDjSTPAhnBxSLi9OmpJoy3VXQ94oeWLHJYeAaBxgBESwuR+TfLRJdBT
	ADGSmxB2E3GxieDh7EfUC3+AwPLFXpAzrXZ0V1HPhxnvz1Tc72AIA06L4qhejn8E+a13eJztK5t
	BVUBU3u9ejg4WvJiZ9zBfuKIxoShUYVi4kIflu4V040/VIqU8qsr5yoP4LdA97dzbWvr3zWFGCU
	y1okhDM25E2LIVHuEhBs3jsowNRxt5J7G9D9PIhGyg6NJRSLbv8fiY89TosFR2iCmM14gSC55qz
	x3IjqvW9Sbj6ji3y54BhB5F6UNAIWG9GbCE3aQ3yFAoJTY7LXV1tqX3NBqV2IYgpISp0Ezrr/Ak
	ToREuieZofIleJ8GDITI6T22IucB8qMiWQiD9IUGa6aR8jRntNkHG/xvLZZOjzIkfNYMYMdxjXc
	+U0Qyz691g+xE8k5Egzxtih0+2oz
X-Received: by 2002:a05:600c:a08b:b0:4bb:6651:9eda with SMTP id 5b1f17b1804b1-4bb88922ca4mr460860355e9.14.1795781951466;
        Fri, 27 Nov 2026 04:19:11 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm753770715e9.14.2026.11.27.04.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:11 -0800 (PST)
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
Subject: [PATCH v4 21/28] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 40-bit DMA
Date: Fri, 27 Nov 2026 13:22:11 +0100
Message-ID: <20261127122236.4976-22-andrea.porta@suse.com>
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
index 51ad8bc33d5b..d4a7001d6f97 100644
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
@@ -120,4 +145,22 @@ examples:
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

