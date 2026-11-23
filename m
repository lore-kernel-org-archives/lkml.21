Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432115;
	b=ub0zCi6C2lpVWGhqcMmT5WKzCGVKcOuj5SVa85r4TxtVuMO7V3abii8Yl/2rF2p87Q4w
	 cp7nQCrZOvNrmhIVrWeD7pP4x9/RG4omYhbmkioxP5EGwHBFJpjz5qnAkbfDmPkjoFMGi
	 nVqPnF5HX8IQtihDR9g3a4Q2Z8b2A5D2jo7iDO/t1+hfKOh41GkX3uQaF992Tx1d3XQ3X
	 /BtoUehsIsn7QlGgoi0WLH3uzVE/3pFo6rhdgfH+vixOYBRZahHUKVmCQMonI8FYLhf9b
	 yx2JjEfxZG0bRk5JsL/LzIwEUUbJkcxS69xr4J+N+cNUCp8Zht6hx/QfDvyfqXUZOaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
	b=ZC+ExI4MUhUOn1WiD90fMfO8x8MLq8lcx7CArSKlfVrqFsjMtzjYJSjfBZeDgtips7lO
	 krMzfprzCgbkEqYEmqvgEYtNi0qoMsaN1Urau64lge5i1BSs4ibpyLXg9X0fG9ko2BxBp
	 frV6EYbH8o2W6EZcoficENOy1p3a4nmvySF6YSwB0pvRZyFtmTv41qUXauimnzvtJ3Uuv
	 BXUHX7wPaQWRAgWs0+CJUn8+nkwMGOuFsrz1OiCNEWEdXXfNa4+pnpEJ44ShCby+/zM+V
	 UAra2RxzZ5ZN5cLXYXpdIIizHQrsXzqji+o9vViFpiE9r+TLCOqSEW+zK+NUks2Y6lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdMpA+3X;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549ED606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 549ED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdMpA+3X
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3acec6677so4401592c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432113; x=1796036913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=kdMpA+3XEIpWJhRS0Cf/pmEdcgIkOQFvMDyFXDhVHlrltr7setMvk12Eq5Fw/oUozO
         ARismXyoNbCSoI01ed6CtEwAy9cYw+tXXBPhv/0+Fr6Tu5sxBskpG7CN5/+XS2alDltZ
         sNDYUqnOc5ZXU1EAOUmUooKZgc/OKtZSTGBDRgWf26KYnmIgGVrvbP2lT/n/n5iWEqIH
         c/nmBEfIw0e1dCac2inrtRLqu5kewWHzHfWn1euJZedgvxfVLOcNnrGHCzc5Geo2LAmX
         vCzjk9trv0j8wKgVzqsSU99Zvzy0q/AR0s6oDGOiFiC86Hzw8Qr6VQDdaZmegnZT1hgm
         xVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432113; x=1796036913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=aWUnD/BbkIPIdxUob3YLpf++FUkHPcERuux2u3iaG3J9UxPEbr0LkXU7SJ7AzAKLCT
         SHk62sX2QmcodLRYxzElUn3mIaYvQCv+wX1MCP3WFQ4O/RMj1KuRMuEUhLzFGGVNV7fH
         d/ZzjZ6Z9ITcmQNVpn3Qhc36Zo8ngnJXn8KYa5qABz0O1SA/8ZkQDKg1MYXDwS0KDeWX
         6IYfksoKP+0pGmGmA/tHOm8t3QlbenhN7BXc/T1U1GFu+TS/ZAPgb1JK0YZoUYlo4GdS
         yLiQAWS7NSPtYp2DWJrT9HhEDW3vb0a5xagt91EZTrGt1t6rsI4zjqrdeZy3vnWhBKCG
         LzUg==
X-Forwarded-Encrypted: i=1; AL+hErEDVfAPxFI5ATRvte4ArJXH5y+nCi4H3rgh/8Hg3b8WfCG+qMPbri3UxlmcVvhWvg6jLDcTGT0mPv7TJnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IWdp8BM01+er/nWeE2T5TRbsypBQMadkiwlBC3ojaJVi/3GA6
	EiA2uQZg8h9jbayozyQBNrHwOElSc4UGIXemi4cSIAED6zhsPFP+H/dg
X-Gm-Gg: AZFdTZd+QI2/i/Lqt1gs7l7piu8i4AwSUat5w3iPqiUTjw40oiKi/+qiY/Aw7MKgU9M
	y4yCsXYFDhYjMMSS7a5jB1PkbjjFu9yW54vohyoOukrhxTaoEwSZey4qS/zQQ9oSAiE7CCX9Pq4
	Y9HaqckMfPwCO0+is4J9zsXEe+Zuh6IJNuluUNcLCRsy5tBmhYv5uS9zgrkoPcjSfGExz2lHKtL
	FBmTVkD7DmmH3xgOWxH2En/jWFT2ijyrXQRmZTwOiMRgta92JscCkIr+eTLnxHyephkRbgZBOUa
	ZPVeLeu4mnoy+3+9JbnaEsBfkFJLE+KBw65gBHZKEP7HfvdPXxSgZBD9U0L4jkI8vesAD7mc0tT
	kVwchxrntYunPK5FQmKkHZ/8N5LjNNq+Ie70wTCYR4DZtqmhAWE8W38WFBCeTM+CZHwAY7mq2mW
	F9yIRE5cudqxU6JSPJXZz/tbtXK4r+E0eRyJge7YDPOWbUUiHEMXZkiBoYh3m8EGfjIByLLIIUR
	gF1nG2fpAEL2Fahu0uEnhtyy5WxUgX4CTUqJTpPHMp863stV9Kl3+masH0083uIIRxbJGu6xisI
	kKjjul0i5Gtt2acpnN4RieFEdu3xP97DUfRZQU8wpnfsMA==
X-Received: by 2002:a05:7022:3b8e:b0:1b5:10cf:c402 with SMTP id a92af1059eb24-1b5568a17d9mr12384482c88.10.1795432113393;
        Mon, 23 Nov 2026 03:08:33 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:33 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/6] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Mon, 23 Nov 2026 18:08:01 +0700
Message-ID: <20261123110805.119610-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel MIPI
CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
new file mode 100644
index 000000000000..0e440209c3fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org
+$schema: http://devicetree.org
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
+              - const: 0
+              - const: 1
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
+                    data-lanes = <0 1>;
+                    remote-endpoint = <&csiphy2_ep>;
+                    link-frequencies = /bits/ 64 <418000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

