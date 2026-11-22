Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335555;
	b=g/NQXjjmE+zjR3GFR60BN++RW7EmiaCJ0sKgqxO8fN1cKt4Bt5zsCU/JMUEL0d9s8egQ
	 jrnSwosEnA/x6B4ITafG94WoBIOAnAga9zL8d1g6e33YTXL72i+eEFpCjPruIntmcSnKi
	 H4YqgrHi5K3Alfcg5rpIlrboG4PXnm3JkHNKpgLU23W+GSeKwBC5FSY6effjXITzj7H3U
	 I8muAHdg6EPgVgKlerwShrgWXvbvwOA4O/kSXEWciECqNTIHWSovv+rQWUDJAq4whVg4u
	 NAFtuX2goE1NwtfKGnB9g8FWHmPxBLocLrO8/bvwM5+0ccySR4Iv9ttg4BUHXVClm3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1z7RmYK1NjDMEO9+xJDI+w73bgLEkLKZ4jmIOyAvUDw=;
	b=u+jn8o/DUCsWomMNNSJ02CPkhQBRm8QqB1qZn9RjhX81NwUW5+2JAxUfeGbmnWDC2DhZ
	 KmSHrT17y9vhTX0gOi/0yFaTLkZkvIM29U9lCQ9z9bezbkG5MioWI0jmQhisOGDpGbqsV
	 617twpiPtZC8dvwjd5fZGGb75SXKUG7Am7StUkwjiVXMxrXoWsA5OrmLR8iWYKBpM7tW7
	 vztbLuoTYDLl9LmSD42+3bJSlOrYUsce7Pm02XCqgybcMJvEhgwAoq7oGUoI3prHzlQ6U
	 e7BcZuBTv/5c1djSIO1rdCFU0IpZ5veSsVVntH0cBGq72LaC6Z4kqN+r92j1QGqSo0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6I0jWd4;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F46606A339
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76F46606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6I0jWd4
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c515369b627so176604066b.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335554; x=1795940354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1z7RmYK1NjDMEO9+xJDI+w73bgLEkLKZ4jmIOyAvUDw=;
        b=S6I0jWd46JjblZGAlLs4RFsDKuFGeS94c9BZRRtzar8dwKM+p//r8lstUq4/YNmlwr
         9lPnMQcLJO0UKcvMGbq8uv2TtdnPjflX2QXaq5BgdORQTlv0qzyY0T9l3ND/nIcMJKZy
         qGYQ1m/qdGRKlMrAgCIm/zPTzsW2wxUwWJIDjnY/M6TOtpwgeiwoDoxx7NU8CfEvYKT0
         WU9KY7Qd9u7Sb4q66kCmmkIAPXtjdKBGl0MObZYSTMZZeCBKHhXL5lQMq2wivfdYkvKZ
         7Woaev+4t5Zo2IMK4uf4/dUonjt5ZdB9S77OY1/XEau2iuABQVddDxCTqxDAKG5zz609
         63nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335554; x=1795940354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1z7RmYK1NjDMEO9+xJDI+w73bgLEkLKZ4jmIOyAvUDw=;
        b=it619da2aK79VVAXavytB0nXIb7Pd/Br2UyNIVfAM4dgkYT+iKnW51AGht+elESQOw
         5Z5Joq+dYx+9txsMOccpED4HQ0vKTO4hNkWxhDCWChFzliWQoPT5TAE9Pbj15Kua9ty3
         asBijbBnnSQUEGWZfDGSW55w4SrEGgXyDZnkiL9upPv+sLHIHIkNWKgZ7zIr1BK0M0cA
         YV7W+9b8tfAAWBKJtFwttXcVyKy7NXGLEFq0difXUzZW8u6r9iI2vHrgVD04iXHHk8au
         CskkgvgzoqY3ysFbSuDE7y6ovsBpHsxvqBNTdVKdshYZPXbfVNJfAb9ex1Syr5BbGOsY
         vb8Q==
X-Forwarded-Encrypted: i=1; AL+hErH9X4Y4zZXLYxoEmzssX2x1ZIrIgYr3FxsuBZd/4DE5fKOmmAa2b9fGeUU7HYGQs2yxA73/bOg7RXvOa4E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5+43GXbEpmdTghj0YyLUHd6onxF2HUmyBi0EekVVI9ObDHE27
	JbhnkHU/mKfQKNsrjuoFO+REGSUaIIujm0F/JASRWzHDnB94pdUVG4lA
X-Gm-Gg: AZFdTZcATM8U9UfMLjhSftPnEnlGivye4+A5ijCLqcRrKHdV3iP7W0UoVj6t4e2YFor
	CFhVMwpti3VbgIed9/qBNcg3WtSCNDMYWMSGLoFk/b3ed5P6/bFt3t4M9DOl5zU2zV5dkGFIfsz
	HCcqYAPNKv+QnnAZX7RPdhUE9cahuCyMLIVNaEVMXGhvagrytbibuEOjSEGBozThVOlYnQaEiBo
	+czxg2hpfj+FCJLtg6l1j2WQB5VQocASQWBZwfwLyFSKmupOIbVskZ9GuLAvqHxQmGKiUB7jecW
	s9n0zfawIaSzv7q2Fv90ex0255Icn0mWXTvUE3dsptMeIoBpCZokjwOROUkEquDS9u5HL1uyNDU
	Vs9EY9ryiWFPJH4EzQye4Jc/zlR1tA/37vMUN++Q7N/IypHxDyVtID5NQ7X/U8WnpyfgPK2btlG
	aTR17z7AkUSdvFyDr8R41xQeGJ9gQ2bpMUAWwYJ/XR9z6PKPGlo/8faG2TsZ4Ck9yvo7pXkQPP9
	QQKsyh8u1TQQfR19bEA9nvAvyxHZozGeGGf0i9g8wwTCyHkwMYGeykxAqwrfn2Z2NlGlvN+EF/L
	fx9Mo/LjnDa6LPf6kOYc8CrPSW/JVXH44UbUec0LEqsA2mFbmuaK58/kOA6z7DtgpaqQLGbG0TC
	VcCHACOHkTxA=
X-Received: by 2002:a05:6402:13cb:b0:6ba:4bf3:4a2 with SMTP id 4fb4d7f45d1cf-6ba4bf305c0mr4401281a12.17.1795335553806;
        Sun, 22 Nov 2026 00:19:13 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:19:12 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 11/12] dt-bindings: display: tegra: Document 8-bit CPU parallel interface
Date: Sun, 22 Nov 2026 10:18:19 +0200
Message-ID: <20261122081820.53199-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122081820.53199-1-clamor95@gmail.com>
References: <20261122081820.53199-1-clamor95@gmail.com>
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

Document 8-bit CPU parallel MIPI DBI Type B interface provided by
Tegra20/30 SoCs display controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-dbi.yaml     | 108 ++++++++++++++++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |  15 +++
 2 files changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
new file mode 100644
index 0000000000000..6a34202f80765
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-dbi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nvidia Tegra Display Controller based MIPI DBI Type B interface
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description: The display controller in Tegra20/30 SoCs features an
+  8-bit SPI interface that closely resembles the MIPI DBI Type B
+  protocol and is referred to as '8-bit CPU'. Each display controller
+  provides two such interfaces, which can be used to send MIPI DCS
+  commands to initialize and control the panel while image data is
+  transmitted via 16/18/24-line RGB.
+
+properties:
+  nvidia,interface:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of DBI interface used, 0 - primary, 1 - secondary. If
+      property is not set, primary will be used.
+    enum: [ 0, 1 ]
+
+  panel:
+    type: object
+    description: Node of supported panel driven by the bridge.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Video port for RGB input.
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              bus-width:
+                enum: [ 16, 18, 24 ]
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for DBI output (panel or connector).
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - panel
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dbi {
+        nvidia,interface = <0>;
+
+        panel {
+            compatible = "hit,tx10d07vm0baa";
+
+            reset-gpios = <&gpio 175 GPIO_ACTIVE_LOW>;
+
+            avci-supply = <&vcc_2v8_lcd>;
+            iovcc-supply = <&iovcc_1v8_lcd>;
+
+            backlight = <&backlight>;
+
+            port {
+                panel_input: endpoint {
+                    remote-endpoint = <&bridge_output>;
+                };
+            };
+        };
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                bridge_input: endpoint {
+                    remote-endpoint = <&dpi_output>;
+                    bus-width = <24>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                bridge_output: endpoint {
+                    remote-endpoint = <&panel_input>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
index 69be95afd5627..a014bf0dd508d 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
@@ -76,6 +76,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: A list of phandles of outputs that this display controller can drive.
 
+  dbi:
+    $ref: /schemas/display/tegra/nvidia,tegra20-dbi.yaml#
+
   rgb:
     type: object
 
@@ -155,6 +158,18 @@ allOf:
             - const: wind
             - const: wint
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra114-dc
+              - nvidia,tegra124-dc
+              - nvidia,tegra210-dc
+    then:
+      properties:
+        dbi: false
+
 additionalProperties: false
 
 required:
-- 
2.53.0

