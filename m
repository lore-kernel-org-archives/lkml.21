Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445648;
	b=fkT2Mgl7iI3CddRB/WnyEIvRkNSR/NrohL8nY2mjc9r9tNUspAOiGMqqw5Fb0f2vTmR0
	 Y24XaM+iEo/caSpcvWfDbe9pkgcwqpjZs5bbblt6hT4nHiQVoA97BoZimkzyHQnABzwp3
	 Rr3ZlgE7MlI9wONv4pLnEbcc1kwo8L0coMopYEHJ8YcxjDT/sZuMJguMEOjNlLNX/6mkE
	 5ptQTQAPXHmF0w4W58Pcmo4S/hTFExtZI8gUDpaq3K2szH22aEJuervJycOstACDgDEMr
	 3kZUThg3V2haDq46QjUqLPQRzs7wCmBflccDSZhI5aM2kIJrksCsZzommw2GBHEWIGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1ORwnkX7J2hOX5n3O1ta3audEQJV0+CKETTB/1+Lf3w=;
	b=rQPQMUmRHNGFLakbkbUsTiiVdNkPj+qrEtFf8FXKZqo234XGqbq0XV06nyQXdCir3jKt
	 VYElQ3fyV+FjxIouUsDawFCxP2hx4g5J2si/Ffdv9dBI4zGXANMaF9+QR5znV+Slcj0z7
	 vv4a2JOQlF9lYZiA6OYiU0ZJprL0tEg5uyRseQ/OJutemrZYVbqX1YwR2PVNjC0+0jors
	 iyd74B+T9Gxx9e+iMeqAXTz+abUp2sBDy+SPIKBXaQzvo9h61rYznqdge42WiMJlOvPCV
	 8g19K/a9XNEJoP2A7tapx6i4qOuJLIrKxTLN6WTK4+kjkr+xDmLBFf1/iyqLzVBc7jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AdpIuPTA;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC4D606B09A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EC4D606B09A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AdpIuPTA
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a357b1c649so2009535f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445645; x=1796050445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ORwnkX7J2hOX5n3O1ta3audEQJV0+CKETTB/1+Lf3w=;
        b=AdpIuPTAFtxQYe9e3oALunPMgkqq0WHN1wt9+08FmpsjDYbHHpHxDFFVZwKeqUSpHD
         e/I+U4W9fQQHvYUN+JQNJB+TTjjDdKIhytaLLI1AWvxFsJEW/JBrKoXnrLKKT5LtvCcs
         y6VW0kEllA9NWqHJ8Zp0u0LYHEXKQnel2rSLe7Q0X7JIL9SwB9O4HWjIarn6OXpPXZwq
         DBlLLMXg/pkkHqdBzcwPpNgNojFnkhD3ZwRn0K2N+dLT+xWM0lm1b2ADoOq1dOeAiQ/d
         ayYymBoeLQlJmXNJak6YAbfv/y6eV+Bh8VT7+E/Y4wBMbRV2MX07VIXuNbOz98vmIgqu
         0a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445645; x=1796050445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ORwnkX7J2hOX5n3O1ta3audEQJV0+CKETTB/1+Lf3w=;
        b=x6jGBD5bflnwla7hFp8jTTQ4D/ovUT8Z2ZlcZT3Cd2Mq8TsHk4lq/UWgLLDTkuRGx3
         MwV9TYzXKxOUP5yRVIYRJ7oSj9OnsTRkvzsFj52+cs46Pes3UlEhrNaT6X1tVP7Ngx+8
         sijV/nJj69nl7Nw5yWV5PJVfAKnT5YcE5odunuEmwTgHsLy/D751swTEYHOF1OPJVg1+
         nkXa4n2DjvqxeAg3GpvtOlnlHbFNgceqvkpJyd+PODw30MgmTZM+q9sythr/rCRLDLz5
         Sia7M4ykkifMTApQDy18TtxoVgQgyG7Xu1wG3hARvijksYmuErxLyBj05xUFR4mlZDbP
         Q/+w==
X-Forwarded-Encrypted: i=1; AL+hErG9zCn1RB/lWaWQu+ouqq3ddDkRnZDB/nWU1yrtWMUz8L5wmt68fJRcTLY7ni2OZeYUrxAoF0mtb+S7WjI=@vger.kernel.org
X-Gm-Message-State: APuU4Z93sAAsVWEE+vO4Zo7bfB2/5bYa91n1a/604LTIC6WAGoX5vho2
	YZ0SDrs8OiEzBECD7uWEXORxMYbaemGIIdQZ58foUilS6xsdLhOmlMu0v0J5TF7sNOc=
X-Gm-Gg: AZFdTZeNzPbf7eYWDMioYR+OTMxAthuuRE7hou9d7wjY2zJYxj+8Ae7g3IzpWcmQ66H
	XMb4p+s/nKRE2nYhm6F4VcCUQHBvcD8hKfu+aOFLMVVlQdVuPDqFGbdTM+X6qjKn/jz1o6arJ4K
	85yQbXrB+jMb8CavyYDI6DSMkXIZgEbWSN+3tt0KsyC6oDvPHAhccXMehgOAu3ItxcmwO4l9762
	ExaqzSPrR04TnF923RlSDphfH5fiECm6dpTJQ279IL0wB4mdVA0dWZGTUiSsVu+SVv1cZDat3k3
	gqQMTznnN+qEOH8H2XoHIQxCxF00PPqhUankBx2VhcPtGduihLgrbxkTGlB5DU+ivoB+wBQZB3v
	OTO3E3mFSBAlCSdCdi2Xk3+RcCEvC2D96gR7cNhqKddr7mRdwV9eq8Fyco1wR2FH35qkC/rMBzc
	JnaWULse+nPI909EbQNzPzML6upyl+uCEWytIdJnSrQuaRC8e5s5gjMpo0k+cRVy/HWIn2OF890
	9G/xUMk9/21Y4TugoBq6/NFrGhPjD5qwWg+vysErrG+esATE9IqBfXilf3rOC+RHMJd/kYcFxvP
	TERWQIpMsN3T3QMyImiyWA2WxIuiT7UN7m1b5n1YnLpt5c8S
X-Received: by 2002:a5d:5d87:0:b0:499:9f62:d64c with SMTP id ffacd0b85a97d-4abaf64be07mr25689240f8f.10.1795445645615;
        Mon, 23 Nov 2026 06:54:05 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm22057256f8f.20.2026.11.23.06.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:05 -0800 (PST)
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
Subject: [PATCH v3 24/28] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2712 40-bit DMA
Date: Mon, 23 Nov 2026 15:57:02 +0100
Message-ID: <20261123145728.29082-25-andrea.porta@suse.com>
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

BCM2712 has six DMA channels (6 to 11) with the same 40-bit programming
model as the BCM2711 ones, each with a dedicated interrupt. Add a
compatible for them.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/dma/brcm,bcm2835-dma.yaml          | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index b53652d5146b..0c74cc1d223e 100644
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

