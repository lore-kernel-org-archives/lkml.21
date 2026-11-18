Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992284;
	b=JKfvi6HMsFiLZOcPwljOKNW3KNt9tx4u708xlt8VHbLqz3zI3EcOhYjfN9EC+wciRgkz
	 q9xLqMRZ1zNB3oL8VmMnozeP6TLoyB4h5TTGLmfphUUIBCmbJ8wD9OG0Ne93zL4YsnMYw
	 fWVjgN7cbqxQ4nH9W28WJ4fewd4qdQ/zC+lZiS29awZqTkpJXZ3PB6/51RjdwSQEb9jhk
	 Du4QgQ7Si8zOIcFMqp05djFjCAAV0kdgullOKUOfMbDyMRhbZDnzaq9hSe41UqJOvR++G
	 ikkCxC2mdgF9MZGRnskBMNPS1I1bhpZHZNCjn+umdKIA2Fs91QrleU8chXCgExCuSdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992284;
	h=DMARC-Filter:DKIM-Signature:Mime-Version:References:From:In-Reply-To:
	 Cc:Subject:Date:X-Lms-Return-Path:X-Mailer:Content-Type:To:Message-Id:
	 Content-Transfer-Encoding:X-Original-From:Received;
	bh=mejuaNi7Gw6EMtifS+cvih2W/toAxrfb+yYMr1OlBcE=;
	b=aiK5tD1SG69cm0elwp8RjJ8B6SzI50ZFzjf0XEXChY+gf5hIWOWYsaNvCrRNGU6zKHY0
	 tKZyqLeCX0os+rbeVt9FeBqyXb+U3oha57VhZ6z9JLf/QegQcmCEJAsI3J0m2C1kltvp8
	 BExePxv5rmGHioDfqIXgNi3m7Gaq+05/imVZqkL9yS+p6wOo3VMqC7ELyPifpEnzxNr+T
	 NglVClum6Tes37bnZgGP8pHa51TLseKtDkEgtD51lRDqbC03oX7ggeAgX7bVnDNer/Nn9
	 WW0p1ji3CKReLkibajTuMOhGpq8/QvUjYoNh5qCsNyoVnwKjjzZ+MnL+ceN5v6I5vBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=W3KJI4dt;
	arc=none smtp.remote-ip=209.127.231.57
Received: from va-2-57.ptr.blmpb.com (va-2-57.ptr.blmpb.com [209.127.231.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44320606A338
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44320606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=W3KJI4dt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992279;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=mejuaNi7Gw6EMtifS+cvih2W/toAxrfb+yYMr1OlBcE=;
 b=W3KJI4dt12NsUYzCAdgeohCA9vyFB/YXik/TdOlMOKiDjf8JfaoMKoM3YmvgJQY2JAJUSg
 brJ3Es/WE+/2mUQn45fWVcWpGLaNIGzw9qZ7QAPTx9tws8qanIBS8YChikDOzMLQkNWpir
 5qri5Q6bZuRGhSP8fJhOr9dsAtuJDpJhoJCDR56+nHyEo/efXbpUA/MLnpq9ZhFGcNTERL
 hA7BpGwynA5ZIQa5TlZN39Q7rVgzTeTmMVdRZOpdUm/jCs09vSSrOMV/xrH0+zMhXNB1LP
 rMqFM+EqJlX6br28FCmHvYfOwDOq8CyQ+2/v4t+3crzN3VtsEOnzr4IV9FnyDg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
From: "Wang Yang" <yang.wang@deepcomputing.io>
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/9] dt-bindings: embedded-controller: Add SpacemiT K3 EC window
Date: Wed, 18 Nov 2026 16:57:35 +0800
X-Lms-Return-Path: <lba+26afd6895+459010+vger.kernel.org+yang.wang@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
Message-Id: <20261118085742.1817536-3-yang.wang@deepcomputing.io>
Content-Transfer-Encoding: 7bit
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:57:56 +0800

Describe the K3-specific non-linear peripheral window in a vendor
binding. Reuse the existing EC keyboard schema and keep the Google EC
binding unchanged. Point the vendor controller child schema at this
binding.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 .../bindings/bus/spacemit,k3-espi.yaml        |  2 +-
 .../spacemit,k3-cros-ec.yaml                  | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/spacemit,k3-cros-ec.yaml

diff --git a/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml b/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml
index 30985ee0a..545cc2609 100644
--- a/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml
+++ b/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml
@@ -112,7 +112,7 @@ properties:
 
 patternProperties:
   '^ec@[0-9a-f]+$':
-    $ref: /schemas/embedded-controller/google,cros-ec.yaml#
+    $ref: /schemas/embedded-controller/spacemit,k3-cros-ec.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/embedded-controller/spacemit,k3-cros-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/spacemit,k3-cros-ec.yaml
new file mode 100644
index 000000000..971e7b32d
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/spacemit,k3-cros-ec.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/spacemit,k3-cros-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ChromeOS EC on the SpacemiT K3 peripheral window
+
+maintainers:
+  - Wang Yang <yang.wang@deepcomputing.io>
+
+description: |
+  The embedded controller implements ChromeOS EC host commands through the
+  memory-mapped peripheral window of the SpacemiT K3 eSPI controller. The
+  window uses a non-linear LPC register layout. Offset 0x00 provides host
+  command writes and status reads; offset 0x01 provides host data/results.
+  Protocol v2 arguments and parameters are at 0x10 and 0x18, protocol v3
+  packets at 0x100, and the EC memory map at 0x200. This programming interface
+  is distinct from an EC connected to an ordinary SPI controller.
+
+properties:
+  compatible:
+    const: spacemit,k3-cros-ec
+
+  reg:
+    maxItems: 1
+    description: EC peripheral memory window, at least 0x300 bytes.
+
+  interrupts:
+    maxItems: 1
+
+  wakeup-source: true
+
+  keyboard-controller:
+    $ref: /schemas/input/google,cros-ec-keyb.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bus {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ec@0 {
+            compatible = "spacemit,k3-cros-ec";
+            reg = <0x0 0x1000>;
+            interrupt-parent = <&gpio>;
+            interrupts = <1 11 IRQ_TYPE_EDGE_RISING>;
+        };
+    };
-- 
2.43.0
