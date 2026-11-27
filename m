Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787141;
	b=whYovMEC/GAyLKew729glByZU4FTxgfcFuW3iDsOKJFoIdcPjqRriQ+sm78W7qmYNboK
	 MdTkRgdvhuEoM07uTklTm8Ra82zd/iBwv7CV/lXtR0f0o5OqWT8NncF4nwnOIcZuWZwfV
	 scNgJ+Mzt6dBOh3S9Rq+mcSKL92dCiEgkjkZOHTSax9QvyFgHLx/GebK1Cl50/ID/+3Fe
	 IFgm2tiz47YxvLEW4lwdz7pi3qWHtGMDHwILEjTEdDzxaqDHwOlZ0+EJkzQnGE7Mx5VNb
	 qIsesOgYl1ebmOYGYeKcoG1tjLPlOTNGX6iV0GCK586SywG6Qg26OczzSyQndE+Q+EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
	b=ohma+XuxK/RUOgzCUHiGj9RiNNqIldfyuAjR4DXA/Obtme2OaIp6BZII61n0zL7kf/RC
	 fc351R8j4NUZIUTOzg4CNSIin4fNXWj0GEHhW6PWT97+3BsXBx9ltpy3jqlDY+CGqbe/m
	 gxMKsJd8zrBYgHMr/V05tDz2f8U00iA81ysNqXrgZFKO/vW0ilGcLM31ED+xRJv2NRQAd
	 c4Q1xlbinMBSxUD4jmsMFZbk1bCXNLi0nRhWNpNKgc7iAxitv91DZhk2hPxLicP19cIZB
	 A1mU+Srx61lvta05NcIs+GHaXSi57xzP3Gp1RHWXyZnrgkKuNZEHXUAxIBeMdO/y4kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqWC59HF;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6092606A336
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6092606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqWC59HF
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f03920c4a0so50357585ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787140; x=1796391940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=zqWC59HFBxeqnkwiJcA/vmF7PXqaSn4cPlghUfmvZNV5G3RaxpsuHbuhncRjcKUvVL
         RgVWQMgdXN58QHoMug3raBl6dLYdDukfKBAcgyeL28e2BM5cL5Hxg45qmG4jBDawc7S7
         lAEjzMp0sak/BpEjHW6drFOVkxWkD/DpzpIzeKtu6KfB+8s94kiR9T6TxqTYjNvoZOVW
         uloDbZg5rFJzZY5VgoLAdc+uiTL38cnKFgWeKaB+TMTTtan+bHjkFDVKszaB2FV/MKDt
         qUJrHVLE83u4ZrxeAcFD4bNulHhzew7Ez/XbUGlvtHVKZZZmkem3K3rPoh5EatDDP2EL
         X1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787140; x=1796391940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=baRNu9q5P8+iNB0sB1txg2kCDwJhGTo1KGVNq7qFBuaYokLXCQaokHYQnhAZX+y+oN
         kmBk+OD+GDccEHTU7oADkCYQtYpz9Up/4ozvhqSVeBvsHflZ2B65w7zPkKPzU/5vKX4U
         F5ia5zOGYgGy+4PHlAvUUy/+gmOQ50ww73wr/iN6cMjQLbu+f2iyUn/7NHP6Q6Wy/Nau
         ccxQL5TNrxoKncUzYIY/UN41D6SkDKUiy4XBg0jv1rLI/ZghktuhSWsIIhBuP6/3PNfH
         20niCdUGvTeF03tHMCG6ig4pYhfIND3XINOrxiiUi874xqwaSANaAOAb6rfe/wC30a1+
         Mimg==
X-Forwarded-Encrypted: i=1; AL+hErEVZZkORom+zT7AapUsek5hgr1ZpA8CV49xj/EfW+Fv4MN8NuSwpNj9t7ioP/YMiT3KlZPa0h+9Gk8Ywtc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Gagv2K1bPdGU6koDvsAL7sv5QJhPrqjsgW1KAmrgd9amR/iJR
	UAjKMhwPcxo4/E7tBCBM+VRDWT81XqhsB1C4zgWA+t6NQc5/L171/YZr
X-Gm-Gg: AZFdTZdYxiWJAU1nDuN0dm3FYxixW5uTrCl9TxW2MrZ3qIOO+KDGdzgxrlnoIKQTDbc
	/mcJNctwfUHSbmyMMZhmlP/jSTBmKhtIHjdTuimT0jS8i0m12hdqo1dJDPgy79O8Riww5W6eERX
	VYAgZkEznEaUUwMIdADGvoiIQ/GycWK8W9sZ86S930WzUAhPBVQRcx/XXpTFCccymsGIo0CgmDQ
	ii5GO3rfmURzXs0kqdBuI1bNt4pCUHBBTKykfv4daGDPtithc/kLnxaBenWUKS7MxT5zbwdqf4a
	p94YSs/G2B1xfRBintuJafh0vndPJZRmDTkYQrbiPz4zrlQ2rKJhh2PbT/zMjnKIUG7F0CesoXu
	+ehFbYhcmvyJEIBQci1VFV3w+T0/6dDxUNOdyQ6HF7Z8dBab1eMAXtqzhv+g3bVBgmIlNI0GJgW
	B2yB5Ap3RvHQn0O+HBfNbfeaXBTw69G7WGSaDnlgONGItLsfxiFjE+RYmmsMm5JF16W2whGqMcb
	x1F5O2WDkVbdgh575JCc+RK3a5hEv7sND+kPGqZ/gVR/fQzx7jv27aWdwbQWYvHd/NS06dipmmX
	uYO01JjiRIfbqvpJ8Vy26kyir+ID+OQo19V8zklaW2F+3A==
X-Received: by 2002:a17:902:d2cf:b0:2dd:b6e7:ac1b with SMTP id d9443c01a7336-2f03ef3d3b0mr270576165ad.2.1795787140051;
        Fri, 27 Nov 2026 05:45:40 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:45:39 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Fri, 27 Nov 2026 20:45:02 +0700
Message-ID: <20261127134507.125513-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127134507.125513-1-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel

MIPI CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
new file mode 100644
index 000000000000..7c538e48ca25
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k5e8.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K5E8 1/5-inch 5Mp CMOS Image Sensor
+
+maintainers:
+  - Hikmah Gumelar <hikmahgumelar@gmail.com>
+
+description:
+  Samsung S5K5E8 is a 1/5-inch 5-megapixel CMOS active-pixel digital image
+  sensor with a 2-lane MIPI CSI-2 interface and I2C control bus.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5k5e8
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  reset-gpios:
+    description: Active-low reset GPIO.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply (2.8V).
+
+  dvdd-supply:
+    description: Digital core power supply (1.2V).
+
+  dovdd-supply:
+    description: Digital I/O power supply (1.8V).
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dvdd-supply
+  - dovdd-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@2d {
+            compatible = "samsung,s5k5e8";
+            reg = <0x2d>;
+            clocks = <&camss_mclk1>;
+            reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&pm8953_l22>;
+            dvdd-supply = <&pm8953_l23>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <1 2>;
+                    remote-endpoint = <&csiphy2_ep>;
+                    link-frequencies = /bits/ 64 <418000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

