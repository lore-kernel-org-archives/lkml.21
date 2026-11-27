Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781931;
	b=KMXuRfKZquEc03+bVmWvJbXV7UtPE5l2/u7Eg2EbtoxPa0IMTS9NfnEpIxlzF/m/Orlw
	 XEIqh8q1OSPZCJVrYcy9iJpnmuUdbLh9JGP8/wIa8isdKmwU3cAQfrgXEz7PaAhb56Dck
	 /fC4ScMIul5M66gyuZiIhpFVwS/GsmwliBIAFTh5layL5bz1YfIOU01Q3oR+Kzq5dFxx4
	 FuuZrS4FDgeXnf/9A3b38MHLJ4aWZz4W9RF+XqdNSEQ7AJoWPvU5IKTUZPD05LYNZG3bu
	 ugzK4BACQO+poCyuDjBNwBjoQT7VcJTbBBIjtzQn3LhRuMhrZjSx8rNV5bgqsrvNxpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fe54TCs34sdjcHDpXrVtFkvlLgVi62aI0olf7UQPt/k=;
	b=zaoR9kJe+2i8YEN4UAtOBDoX7VeoT+u5GA2xVsvYchqRLsc5W7bRhblnGmDnPrjR+Dzi
	 5+5oZ6m317KbouA0VJr56gWEvTtbm1QSgJaGjGkpFSAjo1+RMkefTynbW94WmhReT7nXc
	 0SVhY1hoHNPQBHAsnpeErJYin8Edj950F8pQegq/k+XG3JhniiBT80poeqg633uHg0RId
	 msUihFvR/GzKfnJf58o56WIVjwdUAAsOfdwRUUYrNJRS4l/zuoeaIVWBwp0UeBQVU2lpQ
	 wVMuhUmqmDY4Rm6ANkM4ThDV1v2jQVXNGNXEpDaxFxaOBe3txeu6u/+mehgZcJ1RYRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=H63zCcdE;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CCE60A2606
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1CCE60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=H63zCcdE
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso26281635e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781929; x=1796386729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fe54TCs34sdjcHDpXrVtFkvlLgVi62aI0olf7UQPt/k=;
        b=H63zCcdE8v8z38ylXUNkl0BtOyn7d6plpHm2Zqev9QRdI3N+jCsz1ux3c58bR/omVs
         Tti5Nt9EfL0oZLwXP6Kg78um7P0Tetfg0nuOuepo++jWs5cKJZJ6pVGywi5Gxd9DAcQM
         xRExX5WT5UyB6FfbHu2rtYVDZBFRlzQG3cgvWz7w0+nrt3r91O/DJYgaSaRtdJh7emiG
         gT0W6/+0b3wYhrS0QVQhW8ACkxBQjB4JGzlxgvrRMWvDCmyeawz/GgaTnvwZgF3Ou9Ol
         kxTMnCRAhKXArM7FjuAgO9KgBwSIRx5nEqpe97fnL9QnTh35A+V/+WnhbgXfoQyi6lDc
         HwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781929; x=1796386729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fe54TCs34sdjcHDpXrVtFkvlLgVi62aI0olf7UQPt/k=;
        b=fUjP/G80gaXct9UfhLPuCtz0gWuvoRrfDnTKSa2mtJLMQzV3r1dc4v1eWRCh0KLeLz
         TeXk+LzcBqPilZ4LsVEp2a8zOSThJ2w06q+WS0X+BTwSUn+ASDyLk2Ct89BbHUcDiWOC
         Du7iLyMTKoHeQ1j7YabYwJDrgnb7FZHpgMLc0e+simVDXACCMqmexc9562ZOCk8kmCFD
         UjFn8f27kHFtjVCYi7dWe2CYbH9Vdoigga2DviIDj9PqyI9HEdLPHp+fh1wN2YUeBlur
         SCxhebX/dRAlC5SeRp0Rn1XkVRRKq77TZfmQCaXoWBYobhcUJm14GKqydlWGiLvDsESP
         tu7w==
X-Forwarded-Encrypted: i=1; AL+hErGL5zADPbNfs6YQjuqSA6dhfS52uWzN2LTWN+kw807MQdbO9dvLTaZa8stYHqugu6GKP6bcP8nc0jew9dE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VnCuPqKAyovvtHHyrsV67rEF7MxPsDfNYyppP2H8bs8ALBJE+
	Hbo2VU29vR9Nr3OASUxRLVQegYf5XOt0//hqXy/Cc3FZt3cFhtrmVWqtvJCj51w0Tg8=
X-Gm-Gg: AZFdTZdDxsG4KXF8J94/UoouyNkM44azQPx9IzF234btsbCkkzS4hy6JEBVKhU9mLKE
	8QnkTyMumMzn0N+khS9ymOwbYq8L5qVK+iJ1raesL4H/y2CISyV0YshRt59gy5TUJuWH9B6Kht4
	iDEF/Q7J0IBw0Z7+RRntFfOPhjEFnuV5d+uQ9PY0IkUAR0Ts8Ks0LteQTHXdJWCl55pXbOVvgdj
	ilHlC4jxxM3kZBSLEjEjoSX+yK6UScZBt/KpXJlNsxtCeLR04duW4bdfA7+F8oBQv6kbAaStKp2
	hBhnLZPDSnDpVkqN1XQoZJzGMMUUTKjEqtpw609HxJslPZPYfXcCAv+fVZ5x+q1UYWz76+VIqx9
	vWxE7kKQmPous5gxVk56QyTmmBrJu9OzfG3QuR24BwNGZyhUxEOblybdVEhix5X7yAp2pcYyjGx
	jttTHlJ71sZK8Jm97TPjLQCJQ/AJJIBrjWw+aajPZK9tp/zpo9FRd/H8ylpKg2GUuC5pxMxz6Nd
	r9TPxqSpsUgA3r6wycp0tsVqCN6oSBqU8OqnN3kLTvNKJoBBqNzLBg+ETOcKAezdfWsk0vrOMZV
	OcT7mu83p/FWdQVpSef3l0oc+DqT
X-Received: by 2002:a05:600c:a085:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4bb887ca0dfmr515690305e9.4.1795781929355;
        Fri, 27 Nov 2026 04:18:49 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm568064995e9.9.2026.11.27.04.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:49 -0800 (PST)
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
Subject: [PATCH v4 06/28] dt-bindings: dma: brcm,bcm2835-dma: Allow the generic dma-channel-mask
Date: Fri, 27 Nov 2026 13:21:56 +0100
Message-ID: <20261127122236.4976-7-andrea.porta@suse.com>
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

The available channels are currently described by the vendor specific
brcm,dma-channel-mask property, while the generic dma-channel-mask
property from dma-common.yaml carries exactly the same information.
Allow the generic property and mark the vendor one as deprecated,
requiring at least one of them, so that device trees can provide both
for compatibility with older kernels.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../devicetree/bindings/dma/brcm,bcm2835-dma.yaml  | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index f81740e49301..51ad8bc33d5b 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -51,12 +51,17 @@ properties:
         bit 30: use multi-beat bursts
     const: 1
 
+  dma-channel-mask:
+    maxItems: 1
+
   brcm,dma-channel-mask:
     $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
     description:
       Bitmask of available DMA channels in ascending order that are
       not reserved by firmware and are available to the
       kernel. i.e. first channel corresponds to LSB.
+      Use the generic dma-channel-mask property instead.
 
 unevaluatedProperties: false
 
@@ -65,7 +70,12 @@ required:
   - reg
   - interrupts
   - "#dma-cells"
-  - brcm,dma-channel-mask
+
+anyOf:
+  - required:
+      - dma-channel-mask
+  - required:
+      - brcm,dma-channel-mask
 
 examples:
   - |
@@ -107,7 +117,7 @@ examples:
                         "dma14",
                         "dma-shared-all";
         #dma-cells = <1>;
-        brcm,dma-channel-mask = <0x7f35>;
+        dma-channel-mask = <0x7f35>;
     };
 
 ...
-- 
2.51.0

