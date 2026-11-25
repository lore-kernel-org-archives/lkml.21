Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609977;
	b=I6UU5dm/ZtRAdOx7MDlQvYDCiXLcIBys1GpwcnfSJ/WMmYLCpB+iGrSR+eKxERqgi4tM
	 UiV2JFbQC8+7KSkAlZHK9L5vHl4vok0Z50jEbo+0DRS7cUzLaxooSrW/HX9gug6kY1wMC
	 d+EOhRjA7XYQV9RXcfX83TqrilK+az2ScXvwcAkzu+G+mzIcQ1DUOIJVYR+05kX18yU73
	 giphD4ttPowdWrhimRQCNHaVp9bTjpXDZNPUMdyYa/X7IIlXq+JAXcetxW3fCWYDkYHS1
	 xGDro1WpsqBJW/iz1px3q+gWJpBzCk3NcN7dgADahqFFFsUaYk061ExhIPhWzEdHcMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
	b=TSEMFLZfXcuQ6LduZYbM0kULDlStgd9y61CmEGPogMHwOvL4fIxmS6cTC3uPQsYRpXOG
	 MRI1NBPFrpnySgTjgWAwgZqAsnILYBwCsJhio/dYvHb1IyjecpfcNWfq9jMC5QFYiz6v2
	 G3+3YVsN5m+BtTi/K7ZLhBawrRD+Edl+yj+nNLCbZGHDN+ACX1EeI3uG2jPal6P66sj67
	 /6qk2bZIyUdJwKl+UUxG8wvkiD4hFjQzdHkALHsnWrRdW9PA9foA9nqXJY41eaZ1AADKJ
	 6flnqJZfhWrUdPCXp+CAbf5kvQF6j9zf4bjyAtGr8XlK51ybLzWthtdQLQ4Ny2nFUVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFw0of7v;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B16606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18B16606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFw0of7v
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b4a93d0814so1681103a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609976; x=1796214776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
        b=wFw0of7vrl/UYupGvwc1d1CRi+/6e/EN7A7sYCP3nbhQDhcX/Y1skD7RavLyQeOkZw
         IRMp5I+hBjc3wKEyhhcFeN6Il1U2Q1C/yjWHMD2alXL1jLUOQFf/DRRnRX3NlbUrx06J
         OUa3C56ISoskjoQ0/6QwwM+nRHd6DOyx6RAJvdsq9zb8gcLroTfWl8PzYO3y0H88uml/
         i9bQVE2mVvsSALntek32xUwl/3q9uOxlPkxXWdzcM3Z1z4fNM6QAYC4qMxk5zu8oE9TH
         uQ6dNPA2xPxvyQCgdrt8xKa4xf3MiLGBV4z4pvCiblpHGsNDb1gBcXeUGm5a9ehwO4jl
         mi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609976; x=1796214776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
        b=YfZ+ptfhxFHzrAQj2+ZzZoAfJMTmzSB+Qhjm3OEDMoHgG6lZ073yUYqJo9h5cswqX7
         NUbsSJ+G/tPUkV5uK85OKYbAq5MoelXZVacN56TFZ02SDzcHQO09xa5IRd2T7sWiiU+q
         0rsyybbU1YR8j/wnRpIySnLIpd0aI3/otkYI+cfNB08QmRlGwJktc2XjmkM8qulrRRlH
         ClkQhFBkpO2zKjnMzhz5LdcPaxwgsOU1WMk3KNQ+UvgRnuleNzZoObfPXGZSqGiHbdtd
         hQhbCHfl7h+eLbBuGFvWs2qteRkiyqv73k26a3wxHA/ATbkpxqRU18GhWzUINOqqOJlz
         qcqA==
X-Forwarded-Encrypted: i=1; AL+hErE2Pxc4jMh5SZ9kz3Rd57I0qhxwf0XTJzGI2agrpcfoUveLZ4fm72KJxNYgYHJhRnbbpL1oj1MgZSEmcVM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U4IGKOdwafquh70AsjxRpdXfYMbxz3ntNxOILJPM/iInBzCTj
	CVHi7w+sHcRwu+G3z8f1xiLBAAUVnZTInFujCf5mq2fDckli5Vxv/o1R
X-Gm-Gg: AZFdTZcTeIktGG53ZTs85MRQmSlT46Zb7GPQYjht5fpQnXDKIr1/rEqXFcJ/FzV7269
	CNh3x55W9dnl/RWOPpFEEvZAD0yZLIcU2LKEXTX36wXbsHogtKGKEQPT0/Sri10WcCxdnVII37R
	y70VfEuDeo3IaxgYXSe8apw8O+4uS5jk0tg8TPgTf5ytfqt0V7k2DB6s6H9kSnncye9QU5nzmxa
	2vl+ZvCBhcX2SfLzGScahMCPk6Qe7WE7sFZ1B5XYq6Bdepr99C4RO/+ZYYwycdvgAMwXZWluk/8
	oKBZIzUacjOeSgjDEF+eC2TyRk+z7fmHtDB3Gf3ETKwpR66qdpbwWNjw63Mh7MxwAUt6iYI/eHL
	Q9pevdDVnjZVywnVEMalGtAQzcfKKRRABugEnQUx6WSI7KAOJu5O5U1+09mdkE3XtEinfpmr/gx
	3VoPMLOYMMnGmPWuRDPZ2hIY0kW4xHr96yLGS9PQwA/YtF1zWeIzxZeGwI6H42OmzyqmnO/q71k
	I/QslSLuIzby8Ry1RCUovCAyFgDUzJtgeiUs+Ob6veidVx+5v8juyVxAYvEA4KZRLZu4bsqSHSV
	aYAYitvjIrI1PqM6jkucR2Cee3IddTJYCCcoVrg9L9AvQMC1
X-Received: by 2002:a17:90a:ec88:b0:3b1:3e7a:6d8e with SMTP id 98e67ed59e1d1-3b41c8e0c73mr14764645a91.10.1795609976464;
        Wed, 25 Nov 2026 04:32:56 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:56 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 4/7] media: dt-bindings: media: i2c: add OmniVision OV12A10
Date: Wed, 25 Nov 2026 19:31:43 +0700
Message-ID: <20261125123146.379057-5-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125123146.379057-1-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the OmniVision OV12A10 12-megapixel

MIPI CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/ovti,ov12a10.yaml      | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
new file mode 100644
index 000000000000..f27c304843ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov12a10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV12A10 1/2.8-inch 12Mp CMOS Image Sensor
+
+maintainers:
+  - Hikmah Gumelar <hikmahgumelar@gmail.com>
+
+description:
+  OmniVision OV12A10 is a 1/2.8-inch 12-megapixel CMOS active-pixel digital
+  image sensor with a 4-lane MIPI CSI-2 interface and I2C control bus.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov12a10
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
+  powerdown-gpios:
+    description: Active-low power-down GPIO.
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
+              - const: 3
+              - const: 4
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
+        camera-sensor@10 {
+            compatible = "ovti,ov12a10";
+            reg = <0x10>;
+            clocks = <&camss_mclk0>;
+            reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+            powerdown-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&vreg_cam_avdd>;
+            dvdd-supply = <&pm8953_l2>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <1 2 3 4>;
+                    remote-endpoint = <&csiphy0_ep>;
+                    link-frequencies = /bits/ 64 <216000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

