Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649518;
	b=hl26z8mXvz9Luqf0mAQJuBbop2s8qkm6s/sFIarqZ7qaBNlD9EjBUFR9FvM6084NeRDt
	 h9Cm8AjQe91hhhPuEDIWlFpae0Fhu0wkbP6H7FAWHAuKRzubyPtebKbjvmAU6IilNw4pw
	 GsSnhHn1rz6KWy8etbS6i6hOr0wdq9VQXxDsX7hD2i+WGPAKJAcG1kj6onkekRUykoXMv
	 QgZPBrW3eZPZcnlS66zZsxdLa/V+WqZ7TNgpf843I71boyfiW83pAkrL9nyoCcS96DwzE
	 tNTZnSxCzDUoxVpjgz6nHqR2orM2ikyPh52+xb30epTOdNKrqZIIxezahW6SfNx/YCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=eoTtAD1OqVBDFgxHKsrJhCe4WsEnyH1NTYB4QO/bzrM=;
	b=d73Gl+3rqRbvZS124iR4SoV63AfJHvEhhYMVNptfV0l63IBVai5PVzzMtxaTQJe+KaT6
	 P5uVqqlbM5kVb4jZ9F48bmiBsz+urYFPDWrKI5+1Uxs0Js6NMAJnEdTdz3KhEaUvuNUwN
	 NPOMZ25tWnQsHrvKzncsSByGe5t93JovmhtwA2AFgNltOi3T21/eeGTBd8mdyuzueykep
	 X1CgPq9Gt5ZiJXcgd0oNiG2XkOtq2+nBbYOuqT6+jpLgrSoIE5AKZo7MmiIQYpDuyMsMf
	 8c1bR/2RTqqaP5NSsMN/dkHABsR3xKB3CaKBt4mR2jZpRwLdBVtoPFYM9Wj/LdDBRNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O0pIAYnk;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E40606A6AA
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09E40606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O0pIAYnk
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e46e449e8so4127589f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649516; x=1796254316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eoTtAD1OqVBDFgxHKsrJhCe4WsEnyH1NTYB4QO/bzrM=;
        b=O0pIAYnkN3M9nAbcjAGHtTMBTv/k+CVwigewPhhHARHhQ6SqZx7k5ZaCwDezhoh9F/
         9pB0ThakEdYc8HBabkypvh8pnbtOwtBbYV3CG5qGPUGha1JWe8RVcnhcrPRWPmiJ6QTT
         AB7PzDDiM5wlpJuX/i3+NwdXhHIN7AF6P9nkCJudREkUnNnL2bnLn/zHffzcLUXTjd7g
         wBubR0I/t9p/L+mmwjaZSg0SM+4DOq1zP7hKHiIao6MOqb5Zcu8AiP5dS/ZOaGfjFQnu
         YzWFF/Ri6vV2fNNHBtpUcvhjusKMv5GwjgX11BhnrPb4dDs5nbq+SFqAGqyIjgY+syFI
         P0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649516; x=1796254316;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eoTtAD1OqVBDFgxHKsrJhCe4WsEnyH1NTYB4QO/bzrM=;
        b=auHf6U7G65cq/TBoo4Mfov3VNfYBaK4fcb3+ej9zFmzpLNU5oMAuuwS1Uhbs1M6FGZ
         /svCTuGZapWRiFkIuS3xioxTRXEZiUH5c6mjza3cVKtSI92qe/WMEFm3hI1mVijokLnD
         mZdV/3ys4gMndrAN4mMqGkP1rEufNYzn7Mx+8bbo456mF45jYbV0wNfxuWTAJ/8Kw2Ul
         h1dcgjm1LRGuNy4UCr70GHf36qHdDLt22Pop1uGM+AhqCfdwy2sQrgYT7DKOr4jhLliy
         Xwx+NrMU9meCTCjhX+r7nN10VwMp42p1FUjEUPWpJ9BAmdDxKFujOTMToLvfxwzp8jEV
         1YGQ==
X-Forwarded-Encrypted: i=1; AL+hErGeiwBezbQvMJKG83zylJrCD4Upi/GD6wWQ7Q56eFiGLkMfMiBGJBJEwFZ8XfFP22mRHf8JDtqaV3svahY=@vger.kernel.org
X-Gm-Message-State: APuU4Z87RWardF/9sPxefWsB52blSbh8LbJcfVH+P+lYiGNr+DJg/+ta
	FK2RIQGwnqzEFFn6A+hFnQybgdK/lKgdhQII9HLyD1+SfOjNnVRIFgC1
X-Gm-Gg: AZFdTZfFRKRVRyhocDnPWKFEbdZbzRJ/LzPGFSUwc2kYGgMRpwBpWAwOZIqtA0Bn5mV
	6v/TVWDzMVxH/AuShEahlrGSKsX6DQKyuEkFspgzlWuiDQE5YySW5EVB6p442oI8+TNcWmg03MT
	oo9k65Zvg7oeRp8cEUfN26uu+eXiO9+GY1qJI8kWMNmf31PxIJ1RMu/1oTL2RXRljYAUxTlHCR0
	zvAhD841cvU5gOx4L+m1kuSvyNUXDGlMpzTK/7jPjIfUC/3pv7fC9cwz/WPCkXpSRMfqImnA+tC
	P7ih+/wwRDWt2HhJZJzeYb3KQE7/jukOdRgpJ56GnoGieSFtaH7rs8HpBESanZ1n8VRy5q/yWZ9
	KNHu2iGooSf8OJCTVFem+p/E7dGDb3t8A4YGj9zDmpPpzQap1I+kgh4I4/InFAv1rZGlzm0hg+J
	VedtRroQeWEOK9mjEPx/v0ahE7k58s0K9LCASPXC0RIbfnkICzQ+Yp7oWG+nB4BlQQMH6aWRd/2
	GP8yYNxOi+VPQSIHL4itTb54p6vU+wEb1YTVko/l42MWZIsh7PeQKsfjBCvsvWynyUuwVfgbXT0
	475oGKPEm8FdiT1Icrip/lZqnKlZ9B0HQ0CGKcb1xwiT5qp6/rxUMx5jI2KHJs1jFl3L256srxw
	GHMqiyjZJcQ==
X-Received: by 2002:a05:600c:8906:b0:4bb:a60e:a316 with SMTP id 5b1f17b1804b1-4bba60ea355mr53876185e9.12.1795649516228;
        Wed, 25 Nov 2026 15:31:56 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm33573217f8f.17.2026.11.25.15.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:56 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH RFC 16/19] dt-bindings: riscv: Add Waveshare ESP32-P4-Module-DEV-KIT
Date: Wed, 25 Nov 2026 23:30:17 +0000
Message-ID: <20261125233020.1380594-17-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document the root compatible for the Waveshare ESP32-P4-Module-DEV-KIT
with the Espressif ESP32-P4 SoC compatible as its fallback.

AI assisted with writing and validating the schema.

Link: https://docs.waveshare.com/ESP32-P4-Module-DEV-KIT
Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 .../devicetree/bindings/riscv/espressif.yaml  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/espressif.yaml

diff --git a/Documentation/devicetree/bindings/riscv/espressif.yaml b/Documentation/devicetree/bindings/riscv/espressif.yaml
new file mode 100644
index 000000000000..564e93cd5f30
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/espressif.yaml
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/espressif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Espressif ESP32-P4-based boards
+
+maintainers:
+  - Vítor Hugo Silva <vitorhg20080@gmail.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    items:
+      - const: waveshare,esp32-p4-module-dev-kit
+      - const: esp,esp32p4
+
+additionalProperties: true
+
+...
-- 
2.56.1

