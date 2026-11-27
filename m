Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781926;
	b=3ywsdARSjZK7g1DSuDezn3vIbs6Cgu18S5WXyRiGpkVrLdg10AcvIXlpbfKhwCS4KjIj
	 M5aHAS1BXJGLQg7M08GL6wmTv2JmAGTfO/VfNSRivK8vksthwkFBISRB4yS0Xunze9Flm
	 sgP6qLwCOUCDgo/BiLYQyuZ/RIf+AdpL3RTR7v12RBFVFL0MMU/umtJE6ODcIz6HhnmnI
	 6bD1c4ycuR+4hfGXRn6xBDnnmShVLbMS9lLH8/8gPzhUiI+AuWUEfVDXw7JjDJO61etln
	 pGWDojEcsAczG+Zu8E2WpkHn8K5v85vfOdkXr2CibADkhknIdSpZrFYKN8IJA1WSMsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nnn/mFpoR7L3dnATqzoKoqtIs3zKchqzDBWjzMLVr8g=;
	b=UsCa+W4hXzowI22dD4bnm+GaZSVJdckULmxg0rAWrGW6gQwvGW2ARNsx8zqdFGDH7rdb
	 dpkBuQs1tIrUEh8CuL6zREfV0D63iuN6K1PImTx74ej3SX6RwaEyHHclEV/3HooOBDFgt
	 Lvj2q50ptXNUxEJQ+/i8e/YGY/fYAtRd88tpBtOCnDmourKSUCad6o804lxZzYo3r+c8v
	 WUrgsEzQEZB/UwNkRo5U31xIZPdmuZWSRJpD4OMgtDrCnwdXaQxzSNUOOf6SeqoSfun69
	 VzHUW9/4X1oQANhcwP1JST7AlNi9qrEWZujn6THOMesBQD3XU68y+yOV5+/xUuW6qAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SM47LHuP;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989C7606A696
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 989C7606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SM47LHuP
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so5033525f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781924; x=1796386724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnn/mFpoR7L3dnATqzoKoqtIs3zKchqzDBWjzMLVr8g=;
        b=SM47LHuPhTeAXndjkqj6zx/iIGjRZu9YMHQ/bxgxsXVsjd93y1tAIlNTKJ+2FJ3KRo
         lgcnesAPP/2v8JH9utitM8SbbIyYjSHjGjCqG4Eg8WRhJ/KwRBAVFqh4spWziDMtXsZL
         SQIn+woZGCT70hnYh7SLvDhdl/WOcV3HeEtvW/C4mgl3bQDaVXFpbFjQ6NYDVUiCU9F4
         4cyeqOboJoFqvia7EUA2pNJs7ed76fW0wjqjLxWnEWVi5ruNhD8JM/5muIKqmjG6fUFP
         0fEaVhfPfi4naerv+cwwg1wa/NLwQtuPpok7AyyGNxOI5KwijvnmPzK04kkBNaZx15E/
         flVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781924; x=1796386724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nnn/mFpoR7L3dnATqzoKoqtIs3zKchqzDBWjzMLVr8g=;
        b=lEmPCamLi3SNzaZIUQb6qK3L1/iyPxor8P1juD1hmeWz0ChOitEOQ7kPLW64nDnQZW
         06AbO2iohyzQL77luVwHqgvYsdI0al2YtejnIgpo1Gqgvj0JulJqL7azq+UaHoAHKLih
         /Jz4DhvhG9B2BwfAecc4IbeB3xMJvs/G4SBBdIixJs5cXMlibPaNlFQkguU8V4BKK2WF
         rwff7y3nlEVrGTGuzn0jRXjvqGP/oVsdv6/xfB+Nph5C8QDh4DwArTuaiM0oqx4MiqD/
         NSS+GCPEQIygz/OD68PjNstAX7kDJ22viPA8ekJsIvqYLWx+tAHKrQav70ltNETyE6SN
         5fMQ==
X-Forwarded-Encrypted: i=1; AL+hErF9W6nU0WO+imJLdo1kufRCOzEd76vhpOp7Del4eu/X4pZ90g3XkkgawUddXBGW74E6JfSARxj4x61L76M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sogzsl6Q2zqm0luSUbLAd3gj2Vx7WEG4XUZhWSrrTvd+eSOsI
	XAPVqmimFq8ePO+xwwP5ya4+UKAScgxwlHCRDnrq+hZEhiLs8LnGjT7Nc+5Wo+RgHvo=
X-Gm-Gg: AZFdTZdoQLe7e6JuVrXrvEKh1o8wO98iDDLnngp9M3dXZXF2txT7CLGjgRzNeft8yXZ
	cR8M1awiM6QdGRlsiVOhjXdagwXuXBpElzAfX97ooloUSed4zKocdtGUYTOe9NwdxnVGxAWsQBt
	j+wZLIG8ALSM51C2TiYeObZbJo2LGKfudpDfQABGAMftyA6JJ89FvwNY+/xAGHvf8FvT/3QufRL
	i+hJt826bkpChaOmk1y5Zr07P+a2hn3in2L+5jZfWZcu10ARxn9y9rgLKjEBmLtsRntlfB1CUFQ
	tj4JI8H8AgJBfZLdCjElMe9eYnlkSd7f33I3CtibX14hpDFty2rD2xDKhi+sEkLCyiwgVz0KEKN
	7Pk2hZ7ISgqNlV5XobFGNXPxbVAlYmWzK2VHasfznSy9SPYu1OA7dFoiW9nFAdcxhZyWcDoMum8
	PT+nWyizflJbxID/DEaHIElUK7CtdwEuR8fxA+tY85ShHlMjWh9g8DaQCM2Uww7AWYy6I7rwH1+
	FyyXl2s4Z5QqdlCTC3vGHVpxSv49KZX3lN3Ehg7LKjr03j2QvjHunz6cz/egTf6Quyi+DLshIa1
	1hK3ZqkyRegk4ksGAldK5wyjlD+y
X-Received: by 2002:a5d:64c9:0:b0:4a6:bc53:2478 with SMTP id ffacd0b85a97d-4abb0d5256fmr47792743f8f.13.1795781923925;
        Fri, 27 Nov 2026 04:18:43 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm47786781f8f.13.2026.11.27.04.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:43 -0800 (PST)
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
Subject: [PATCH v4 02/28] dt-bindings: dma: brcm,bcm2835-dma: Document the flags of the DREQ cell
Date: Fri, 27 Nov 2026 13:21:52 +0100
Message-ID: <20261127122236.4976-3-andrea.porta@suse.com>
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

The single specifier cell is not limited to the DREQ number: the upper
bits carry per-channel flags (AXI priorities, wide accesses, burst and
write-response handling), which the downstream Raspberry Pi device trees
have been using for years and which the driver is going to support.

Document the meaning of those bits and add a header defining them, so
that device trees do not need to open code them.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/dma/brcm,bcm2835-dma.yaml        | 13 ++++++++-
 include/dt-bindings/dma/brcm,bcm2835-dma.h    | 27 +++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/dma/brcm,bcm2835-dma.h

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index c9b9a5490826..f81740e49301 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -37,7 +37,18 @@ properties:
     maxItems: 16
 
   '#dma-cells':
-    description: The single cell represents the DREQ number.
+    description: |
+      The single cell contains the DREQ number in bits 0-4, optionally
+      combined with the following per-channel flags, which are defined in
+      include/dt-bindings/dma/brcm,bcm2835-dma.h:
+        bits 16-19: AXI priority
+        bits 20-23: AXI panic priority
+        bit 24: use wide (128-bit) source reads
+        bit 25: use wide (128-bit) destination writes
+        bit 27: do not wait for AXI write responses
+        bit 28: wait for outstanding writes before signalling completion
+        bit 29: do not pause the channel when the debug signal is asserted
+        bit 30: use multi-beat bursts
     const: 1
 
   brcm,dma-channel-mask:
diff --git a/include/dt-bindings/dma/brcm,bcm2835-dma.h b/include/dt-bindings/dma/brcm,bcm2835-dma.h
new file mode 100644
index 000000000000..ace34c32a860
--- /dev/null
+++ b/include/dt-bindings/dma/brcm,bcm2835-dma.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Flags of the DMA specifier of the BCM2835 DMA controller. They are ORed
+ * with the DREQ number in the single cell of the specifier.
+ */
+
+#ifndef _DT_BINDINGS_DMA_BRCM_BCM2835_DMA_H
+#define _DT_BINDINGS_DMA_BRCM_BCM2835_DMA_H
+
+/* AXI priority (0-15) of the channel */
+#define BCM2835_DMA_FLAG_PRIORITY(x)		(((x) & 0xf) << 16)
+/* AXI panic priority (0-15) of the channel */
+#define BCM2835_DMA_FLAG_PANIC_PRIORITY(x)	(((x) & 0xf) << 20)
+/* Use wide (128-bit) source reads */
+#define BCM2835_DMA_FLAG_WIDE_SOURCE		(1 << 24)
+/* Use wide (128-bit) destination writes */
+#define BCM2835_DMA_FLAG_WIDE_DEST		(1 << 25)
+/* Do not wait for the AXI write responses */
+#define BCM2835_DMA_FLAG_NO_WAIT_RESP		(1 << 27)
+/* Wait for the outstanding writes before signalling completion */
+#define BCM2835_DMA_FLAG_WAIT_FOR_WRITES	(1 << 28)
+/* Do not pause the channel when the debug signal is asserted */
+#define BCM2835_DMA_FLAG_DIS_DEBUG		(1 << 29)
+/* Use multi-beat bursts */
+#define BCM2835_DMA_FLAG_BURST			(1 << 30)
+
+#endif /* _DT_BINDINGS_DMA_BRCM_BCM2835_DMA_H */
-- 
2.51.0

