Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649445;
	b=AMi+bGr2ozDZMjN377TtiF/luCyrk1+g42ZfkdOi/9boOODd/uhjff/yJwThmVkJ7Xne
	 qBOW/CfYTUPG4UQV7U7auvTx79eaxaCokIlhNGpDenrKK+zC5s0FqM2/VIGoV5L03ggZH
	 ibNINfdNy3V3H22B6uC8qyuxsZJxGID+76x9jOsbzQdedgcnixqsjW4/EPL+nlrfgAmx6
	 8d5YdGkBCBflCtd4ki2Qq9n7xp9HnOalY1Pt2Lbvs/tIoYqQbEdmpC0vlNa0NkSZCRJL3
	 5KIk7EXF/le2FUGciVuMdydr+BV2dysPNP/aRVw7qdZ66WR4Ia8IB/yAO3D0aUlkebw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XZKFlp5gsRNkBx+db2V3y4H9FikR2/7OfwVsqbLrwRM=;
	b=F1nfA7sxmTHq9WFX8205V2kn1S19PAvQyDSD6cg0WTTq3TnGecJQ3An8zHAnsD/hH7ZJ
	 FjgjPy6X6ESw2SdomOGrkLU/l0IbopGsGCo0yowNz5uUYhq+jLeJjjKWXCJptmGE2hpoC
	 pwd9OStCasDBuuwh7axd9VWUwPNs7s3twn9cn7/K2ttBXVC0Sr7vKRSLXeldnKQGT0vZt
	 SVPfgKexFCBPShUZxw2D0lYOuDJu4yLD88Re24lI6RdgooitHMUNxj55dFRwfaAPpK0zy
	 PP8IFuU/iU5nMIa3CCPnb/yAHOwUbRKiFtSWsQ1oJ92X1/XuDKLGC38mXVbxX6yNKrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OaZcNind;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A88F606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A88F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OaZcNind
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso46653685e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649444; x=1796254244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XZKFlp5gsRNkBx+db2V3y4H9FikR2/7OfwVsqbLrwRM=;
        b=OaZcNindlVZTkWt/lkrLMkFezPyo79sZ86e9MOwDp6Lb4Q1oC4O0U2a2rFVe0Og9fy
         e7OMdDnP4g4AFj++mUj45KqLf8Oc1B12Cze0S+n3MMN8145ph0l5FlanhXViZL1BEoA3
         AEg8O9nuWTsfRpZEq+ZM8XWR0lUy+HJtvom76dtthN6atsRL/kSd615Ir2pc+PyM7Wgm
         zSqUj0JgOy9koffqWnFTI2tFM/YhjiDfMTHd+743oin1/mDjS2JnS59YUcnbDhv39qZN
         +dz+Zgx2a59YxDK/fYFzgsrxhH22KSlmIy3/ensLdZ574EsTma9NL/qLJ1ArRW3YLRiP
         ipFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649444; x=1796254244;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XZKFlp5gsRNkBx+db2V3y4H9FikR2/7OfwVsqbLrwRM=;
        b=B/WJ7EkaFDM9J0tT331onH4zv+XQno0bp8m8IF1MPO0dKIqwExcRJqNHNfloCAf+K8
         /N2Q6eJgAwIjMNiWd2xxOH2cvaeF6yXtsivTJ+pbvHQz+e+nZrofeJ0H1mzFSHiQXVnO
         wCbC0vfg4jqPhQgsJb7Zk23KnI/TFncSTpfS4oJJTYPilyLJaHwqaf0N4yZ+OTM+fS55
         yqAdqC+ROy5UOu2XENFfGvnTgtQe2bBQ+aRJ9K/t85K7VVdyxL/rP2qSv8OcAoCz5ruA
         hB9hjMVCYykH1ztpwgIY9+QWp7Qkfkud/Py0gb3TKgDrkNyPreHXJYdI02CYTo+7wz6e
         smOQ==
X-Forwarded-Encrypted: i=1; AL+hErH6s/42hZ+OoGW8027E9BIBm6xmRh6vQPcgzkzAgf47OskNFCk6LC1Be0+IkDWkCmTVJ4zk6SHXBViOWFc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QkG8l8yx2ovzvpv4mQ0FQpuFDL53n0GKkRDYb7SEacQw+KFSH
	PsGOnz50HZ1Dobd9klfw+A+EARbkKpBDTW5TqICMLOYkPZFr+n/Le02d
X-Gm-Gg: AZFdTZceX5USCVl6cj/F5rt5Gg0kD2laAGvOPC/z0KIp3UTmcURo9q/ydrDJSBOpWyU
	E1uM5quojgdYAeAUXKlaykyP72x17CSIbQV6g2IN5KIXyDpsIoBHEzSOrPZs2DD36lyBjX66S3B
	YiTDQlx2YBrMyw9Dz7if6/SYltpVPE+l3sPbnJX6PKSlulxBGgMBDOi/dQnWjVvjGyL2r6Cfrpo
	zSTRFFqlOla2YIGJIXbSywfo5NddyAgv6G7QuViIj4qtIhHQjUOcX1B2qungdKVbfqSsbec5tGt
	lRGm33DrlzZbK49URCxQMROADD6jNseKDjpmeS1Sr5xkifpBhO0jGw/w5nAWK8YytivTdNs4nY/
	FB9uvedfwhE4l6kXwqHyb9GASX+FOEG/sANG1RjUvZEguK+JgjTWB5nmpdRbzv7WFbr1UfZTXYC
	DSctf0YQ+a1K2vTiYI0P9mK6+OzWaLPzUYh1vSYk7+YnAe7gAPEUvadSBUzRlO1aSvaPIcZak2v
	yZE/VRGUkgM1eZ32wvruT3jP1gfAhidmYGvX9+M4J6C4prhpfgeJVBqAehYCMiaGw2NjVwYPafl
	w0W2KD7rHwhxyN3V0TagB3aoIl5fTyfcU0i1TuMtQCvhBQFo1Z2M1ROOYKwbvNhWD7a3tMCN6I7
	kQHvWyDVC+4cvnLSt+QLXXQPLh6ajRak=
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr407121945e9.34.1795649443783;
        Wed, 25 Nov 2026 15:30:43 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm36428994f8f.49.2026.11.25.15.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:30:43 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>
Subject: [PATCH RFC 03/19] dt-bindings: interrupt-controller: Add Espressif ESP32-P4 CLIC
Date: Wed, 25 Nov 2026 23:30:04 +0000
Message-ID: <20261125233020.1380594-4-vitorhg20080@gmail.com>
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

Describe the memory-mapped core-local interrupt controller on the ESP32-P4.
Define its two-cell interrupt specifier as the CLIC interrupt number and
trigger type.

AI assisted with drafting the schema.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 .../esp,esp32p4-clic.yaml                     | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/esp,esp32p4-clic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/esp,esp32p4-clic.yaml b/Documentation/devicetree/bindings/interrupt-controller/esp,esp32p4-clic.yaml
new file mode 100644
index 000000000000..2ef36e4e4019
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/esp,esp32p4-clic.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/esp,esp32p4-clic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Espressif ESP32-P4 Core-Local Interrupt Controller
+
+maintainers:
+  - Vítor Hugo Silva <vitorhg20080@gmail.com>
+
+description:
+  Each high-performance RISC-V core has a CLIC that receives the local
+  software and timer interrupts and interrupts from the interrupt matrix.
+
+properties:
+  compatible:
+    enum:
+      - esp,esp32p4-clic
+      - esp,esp32p4-v3-clic
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+    description:
+      The first cell is the CLIC interrupt number. Interrupts 3 and 7 are
+      the local machine-mode software and timer interrupts, respectively.
+      Interrupts 16 through 47 are inputs from the interrupt matrix.
+
+      The second cell is the trigger type defined in
+      dt-bindings/interrupt-controller/irq.h. Use IRQ_TYPE_LEVEL_HIGH for
+      the local CLINT interrupts and for signals from the interrupt matrix.
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@20800000 {
+        compatible = "esp,esp32p4-clic";
+        reg = <0x20800000 0x10000>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
-- 
2.56.1

