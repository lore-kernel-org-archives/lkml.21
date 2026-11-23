Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445623;
	b=P+3dBu+Hp0c5lT06mMY6Q38YGjG0LnN9wpaxBvoKmq1B2ZO/hi37+ixcRBSNtgdSd7zL
	 GuNofagJJ12E5K3CxU3i3hKRQ8XBSw26fLaO6loTQLWEt2CNV/98W1c55NVu4d3gtCW/l
	 3Eb5KS+YpDgjk3rdwtpS09y8DeXXiH1S9mE7rLxUqaGLh7utuVSUh6QTWlnziaZh2mSE4
	 0pxjLsSL3zadvuwYmug67TtU1qsNyT9ELMiXbhpcSEQ0DDU43CN4GCm2MpfY3XNdIFKQv
	 bLVVir568W2CKKHcFSin385iI2g6FJe62kDtdCl4pUfwMnCG9a+zVgcu+MB0+p4Neig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/H68XX0nc4DQMcp3IW1hnsD4xLPw1PDfZHd0l5DhZUM=;
	b=w0GSNXMENF5lRqzpWpzC8krRa5DDkflklmILB5n5qi/tfI394p6CNDfuFCMwuRj6AYOF
	 qxRuK1wFj6AMd3bLAGW4DxIRhL4xLBlW1hKjh3OBVz7pTbnlDcY6J8zGh7zaIRUmFjCF/
	 eU1hvJhb44GMa2XAUPBktmk66fIdNMWv0s2ENFSQr4gprxuB+ULPIgBrJv9aCvyRzaAJR
	 RvPYIW/9ELbujxXUBmAuK+oU2lZUGPhtQjdkTOHVtNfZjqDjJDLkEApDeR6qBhxt/bVv+
	 akYai/bsTwvBS0QP4NqxK+Sjya49PyltEV4xQUIik64G84G6611kizezFCVoenUVZxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZnUczZGc;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B09606A6B5
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32B09606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZnUczZGc
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so31844365e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445621; x=1796050421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/H68XX0nc4DQMcp3IW1hnsD4xLPw1PDfZHd0l5DhZUM=;
        b=ZnUczZGce39WuLbA6SN2SJVn8NtyCeWSFRGoi71yGwH5CFHJAmI9skg+ZpHMMCs482
         WtoA2CviYyBJsEViW2o0/5gO9pPNI+uosQ+aBRug2FpcMlHO/PwdC/FuzSvKln40+eEq
         th5LtGwkkLXfXkK1eDhkaEZR75OFe483bxBd444Sc4CS0MBdgpAZkZHK15lCKchG2cGE
         04NgawBhYWp9EdxDPIHgxazeEYCGHs9jAaGnZ9SHUK3r3HEDqo466oztVBAsyQJ7tzFv
         Y7cnhytK27MgwaNkmUZiv3nztGhAzKAxdWRhfd8ieX0CV1vkkZYZG5E8sNKG/rN59RjZ
         W5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445621; x=1796050421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/H68XX0nc4DQMcp3IW1hnsD4xLPw1PDfZHd0l5DhZUM=;
        b=FrVRW/rp3x1PnPDjRLwaOlRBhKXMRF87+BzLETlgHtpmnoc9uLS98TzKug3mTCVopj
         Oq8MLUeotB+nvPYmNiKTfsZSbkNAxGKELwvNLW/sfJj448xDz6/A91j0pvB+geeU5X2d
         BEInxuM0kerS7wgBEbTC9vNArU7wZHoi09MDcnqR3oAoEuZD/l6Db0pZZafwLEA49UQM
         CgC+b6xmcZLqkEFJ5+21vEIkbG36aNWLOp10EHnt1JK4+FUK90iP01jY2e+rj896D5QU
         DiTZpMc4qcorWabQJVCZDBn4kinQLX5inUq0rL3H/Kda/mGKUycMKve3ezU/eCEDAdF9
         U+hA==
X-Forwarded-Encrypted: i=1; AL+hErHWkrjdv3I8qoI0PLMF3DPkAUO9vGkpirDCtxvkrMaCaMW0Ih0PDuiBVzhbCPFsor0TSL1rjAA8+MPg84M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HpvxHi1zHrhadyw8BgVgOYYPqhm6Y1PTAyxrQKeD628g2apdV
	2Im3/8uRIGflUV9lEvSCfAKFoQw9zdp8peS/oisNBZF32AbNwi5i645Oxp4MGBxe5q4=
X-Gm-Gg: AZFdTZfuc5xdACnIrTSF/lgRwnLuwUQblVSNB8sCzvOMh4CPThnBnPQWtTiGaLUGP7e
	OipEtJjVcuGH3kLAoOQhQQRl7XTUg5AOYh3Ks7aMhNil4fgD5aaWUJkdPobYAyDD5+/SCm29ItM
	Pv4uxAEGbyTUfvQxVduGnibK2qVY4BW34WkBdE0gBNUtLDm3YYFqq/igzxFw1fAChsZf3sjWog+
	wKh3+KvyaJdxMBoI/oQZblixy+m3om/zhzOoUOoxDoXDJhX+HuR2wGWlSKQuhoKXg66hdZUXVg5
	8ooTMpbom51kMCp9QrrgBK/3Hes77dM9FFt2FwQ8NocZErjEvwCHXgAwcuwckxt0dGDR33Z2tgu
	otvPimJ07sJTPYoN0RGzmhdTryaeXJtUYgAEd76IDEPNygMFiIiLwWq9lZL0sPEdlEaCoZTDdgm
	GfYHnsZJWDr1aonI62OznPG1nkZ2F4VMczKIueaP4c3E5E8k0iWIhi/7WLbmTvL/eLiHkziZsVp
	0JozJq0OQMN8Z/W01P6A9xMxkfTpK3NPiBSEiWswIV+/jFUQ+cgKyz2b39bTKfei5xCesJDH0mm
	NI0om+najcEkdkYxeIkXq8B0KqA=
X-Received: by 2002:a05:600d:1c:b0:4bb:685e:cc41 with SMTP id 5b1f17b1804b1-4bb8c526ac4mr199511415e9.8.1795445621520;
        Mon, 23 Nov 2026 06:53:41 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm173289665e9.3.2026.11.23.06.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:40 -0800 (PST)
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
Subject: [PATCH v3 06/28] dt-bindings: dma: brcm,bcm2835-dma: Document dma-channel-mask and DREQ flags
Date: Mon, 23 Nov 2026 15:56:44 +0100
Message-ID: <20261123145728.29082-7-andrea.porta@suse.com>
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

The available channels are currently described by the vendor specific
brcm,dma-channel-mask property, while the generic dma-channel-mask
property from dma-common.yaml carries exactly the same information.
Allow the generic property and mark the vendor one as deprecated,
requiring at least one of them, so that device trees can provide both
for compatibility with older kernels.

The single specifier cell is also not limited to the DREQ number: the
driver interprets some of the upper bits as per-channel flags (AXI
priorities, wide accesses, burst and write-response handling). Document
the meaning of those bits.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/dma/brcm,bcm2835-dma.yaml        | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index c9b9a5490826..f619e395cf0d 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -37,15 +37,30 @@ properties:
     maxItems: 16
 
   '#dma-cells':
-    description: The single cell represents the DREQ number.
+    description: |
+      The single cell contains the DREQ number in bits 0-4, optionally
+      combined with the following per-channel flags:
+        bits 16-19: AXI priority
+        bits 20-23: AXI panic priority
+        bit 24: use wide (128-bit) source reads
+        bit 25: use wide (128-bit) destination writes
+        bit 27: do not wait for AXI write responses
+        bit 28: wait for outstanding writes before signalling completion
+        bit 29: do not pause the channel when the debug signal is asserted
+        bit 30: use multi-beat bursts
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
 
@@ -54,7 +69,12 @@ required:
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
@@ -96,7 +116,7 @@ examples:
                         "dma14",
                         "dma-shared-all";
         #dma-cells = <1>;
-        brcm,dma-channel-mask = <0x7f35>;
+        dma-channel-mask = <0x7f35>;
     };
 
 ...
-- 
2.51.0

