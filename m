Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797398;
	b=aLA+pDwpGWllAYFiPf1voG9sxUtSAO/+tGPqUnZIo5AeANb4XsIbkjkKueg7gc586L/p
	 YqEx0oqjhsaNcJM6xpP+ntuEpQQHCaAr1xqFAtKvn06j+DZZTso4gkBOeMPM6TICxWWRn
	 m88Smso6ByxwtxH8ZsSxoTR0sAYSQsPwsQHBjy539BOYM5Iq8IEi3I6Kxh/d/q+6vdubG
	 ayzRMp2kKk3fdQx9PWlfejAt5qcPNK3s7SGp/CitTspGwfLm3XgEHFZoYubJ03bL+Zg0C
	 hBBgtq9ng8hBDeOM1DFocp4MRAjk9uMbdopiEQwhtjpq/+cxIwuuXPYW7MKHfkzKkjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jZk2vXbxzjtX67c5jJifbTQJPrSiWJsANuJuPhZHRHs=;
	b=oI9Ck2a3ac/4lAogxmptsTeQbUzpXyoYO4uJFv13zcT7LsombhsUAye01L0WEGqUFipP
	 G5NDn5N592nBVk2Ukc3DyUytK6YGdM8BRu6hXLFaoJmI+VEIPLs0ixz6+Fd/5Ex9PxNTU
	 YVvRH0FDd/agpHBMjOb9yMed5kL2U269WynPFz+JkLJBCVNitR/bHJ9GBzkKZt3ThyYSS
	 FHtzY+it37vOlPmxGK8qffJfW9K/Xtj9mnite+uTVcMMOoLSnGaXXtQRPpfrdsU14mDDu
	 DOr5umqjTFwYK2XiPLr03j09KuKFYlzbCm+9WtQjdQe2Gx8ytP0lJvLhKUp5isYdURg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=px0QNtvo;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4011C606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4011C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=px0QNtvo
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5188e17487so397259466b.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797397; x=1796402197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZk2vXbxzjtX67c5jJifbTQJPrSiWJsANuJuPhZHRHs=;
        b=px0QNtvoc6glcKLk8fB9tGNePVpAPu8uPWj5MIuX4iq+2TsX49Rn/Tne38xCxYSwL6
         ZTpQQ2scyRDGfVZ2dQ3J0f7KVDcoZ3rbBCKwQ9YKXQblgIXVgeLjnNdCwRtyK72u4MEj
         ILl+S5SZLH6/nK3IHgPKUYJtdQOEoourGRoyJZ5lLFOGnHguXcNlCS5tYOqgzIYegMxP
         iU88B1A7vjce3GCFvIBlIanbNzHCOFwyw+QrMMYlRCsk8fm5P/JJosrWkTzcg9n5EgpD
         FPK5nPxpmmorp24ojOvruaJBL1goWGDpXnsGsvftylhvBkUq18+sOfrOhMp6y5/G7Ar3
         egJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797397; x=1796402197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jZk2vXbxzjtX67c5jJifbTQJPrSiWJsANuJuPhZHRHs=;
        b=vd8ijTYwteVUvXmyQPxGr8c8Rn3igbC7O8gbct1AOdO87p0wOIIw4+zU17+8ehKKot
         xQiWb4LS8HaaMUzA2RHSzIIDwhADNGu9/hyyiHFWpaTz/KPMoe9gzaUvHlXwDNnVjpMX
         XP5tTTKsQqvXSyzpMAqvL1JZVw8DlKTqUHcoh3kBkozgIalCGHMbQdychF6zFKmcld8z
         tpkXKLtWeIpYzbRr3CcW67oag18c97mn4hqreJPtiwL8gfaAxqxOVBgx7/2cuenPmmlD
         VFB5QpKCOQz49/dZ9qS6DpuMXsJafqAKxU6kq5di0t5QUwEVbididvFgCyWEw2KXM3P4
         7WSA==
X-Gm-Message-State: APuU4Z+J4tAUHsI3CB7bbwfbrmWXninwEsOqk+JeGmEh9Q+9mxHw3nnc
	qYavVMzrOHrhZY3R7pGB03NdZF1xoZx8gZJ6gIkNlX/m6jQmJ6pn96Vl
X-Gm-Gg: AZFdTZfyQzOoZ/IeeGUweY2ZA1BYKZGUFO4jCF35DuwJ1oJGXjaz58gdBHZB0ZaHLMu
	ImM8w3t0vXTCpZy5d0Dr4kethbpStDzDAoZbfQheHXcqLvaK7JcHCm8wHtUpfOqeGida/jEkcVY
	/2p4SM+rvvuDQ3KGSdgWqCzfN625qrQ4HAfEuZRYwFKDW9fFqr2wOGWezkdo7MAhKLhY4D7NWzv
	2rSVSCXZS8TwpXM7kA0lYrfQuP4c5mRYzvyiH/4iJRTISfN48WntM9enBqmmVrTuz2inwjhBhQ+
	NIOAQQ597ZNA6MwQsgwrU5QSyz4BJiYIKy+mVeyAmsBG7fKUTjNNSCi+A7HyzRe4YHcD3UckNIN
	CTN1QckxBeCq9yg3xyJkWWUj7e1cPwvR6MqiJeCB8OSQ6K0W5IQygV8vDSGWtlDSmZaT5cc9Dto
	bXknMlnka7AHCsJBBEGhPrQGio/qMVjsYGoVlLNIgSAEqpduONA+TPmG+NzKt6htyvHuzQwfkFo
	EKKoIYCNgrFE2Q5EPsKvQmp/ZUhdfenvsPx6/6t0ekwaW/wcZ8H4j+nQ2ZJzyfXcV5Tpt9fKXDJ
	pPn7PsE4BokR6BgYiWFohLZlc6Dfqttvza8uN71Usmxma7Qiq+dva8gPd4vvNBKR0dLrPzQoPtQ
	5OVqrNfwE8w==
X-Received: by 2002:a17:907:3e90:b0:c51:898c:ff with SMTP id a640c23a62f3a-c51898c01a9mr1186347466b.12.1795797396406;
        Fri, 27 Nov 2026 08:36:36 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae9dc7asm893079566b.41.2026.11.27.08.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:36:35 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 1/3] regulator: dt-bindings: maxim,max8907: Convert to DT schema
Date: Fri, 27 Nov 2026 18:36:10 +0200
Message-ID: <20261127163612.280186-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127163612.280186-1-clamor95@gmail.com>
References: <20261127163612.280186-1-clamor95@gmail.com>
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

Convert Maxim MAX8907 regulator binding from text to DT schema. Reference
to nvidia,tegra-regulators-coupling in child regulator nodes.

Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 283 ++++++++++++++++++
 2 files changed, 283 insertions(+), 69 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

diff --git a/Documentation/devicetree/bindings/regulator/max8907.txt b/Documentation/devicetree/bindings/regulator/max8907.txt
deleted file mode 100644
index 371eccd1cd689..0000000000000
--- a/Documentation/devicetree/bindings/regulator/max8907.txt
+++ /dev/null
@@ -1,69 +0,0 @@
-MAX8907 regulator
-
-Required properties:
-- compatible: "maxim,max8907"
-- reg: I2C slave address
-- interrupts: The interrupt output of the controller
-- mbatt-supply: The input supply for MBATT, BBAT, SDBY, VRTC.
-- in-v1-supply: The input supply for SD1.
-- in-v2-supply: The input supply for SD2.
-- in-v3-supply: The input supply for SD3.
-- in1-supply: The input supply for LDO1.
-...
-- in20-supply: The input supply for LDO20.
-- regulators: A node that houses a sub-node for each regulator within the
-  device. Each sub-node is identified using the node's name (or the deprecated
-  regulator-compatible property if present), with valid values listed below.
-  The content of each sub-node is defined by the standard binding for
-  regulators; see regulator.txt.
-
-Optional properties:
-- maxim,system-power-controller: Boolean property indicating that the PMIC
-  controls the overall system power.
-
-The valid names for regulators are:
-
-  sd1, sd2, sd3, ldo1, ldo2, ldo3, ldo4, ldo5, ldo6, ldo7, ldo8, ldo9, ldo10,
-  ldo11, ldo12, ldo13, ldo14, ldo15, ldo16, ldo17, ldo18, ldo19, ldo20, out5v,
-  out33v, bbat, sdby, vrtc.
-
-Example:
-
-		max8907@3c {
-			compatible = "maxim,max8907";
-			reg = <0x3c>;
-			interrupts = <0 86 0x4>;
-
-			maxim,system-power-controller;
-
-			mbatt-supply = <&some_reg>;
-			in-v1-supply = <&mbatt_reg>;
-			...
-			in1-supply = <&mbatt_reg>;
-			...
-
-			regulators {
-				mbatt_reg: mbatt {
-					regulator-name = "vbat_pmu";
-					regulator-min-microvolt = <5000000>;
-					regulator-max-microvolt = <5000000>;
-					regulator-always-on;
-				};
-
-				sd1 {
-					regulator-name = "nvvdd_sv1,vdd_cpu_pmu";
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
-					regulator-always-on;
-				};
-
-				sd2 {
-					regulator-name = "nvvdd_sv2,vdd_core";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					regulator-always-on;
-				};
-...
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
new file mode 100644
index 0000000000000..6cf8e93867e1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -0,0 +1,283 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX8907 PMIC
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: maxim,max8907
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  maxim,system-power-controller:
+    type: boolean
+    deprecated: true
+    description:
+      Telling whether or not this PMIC is controlling the system power.
+
+  system-power-controller: true
+
+  mbatt-supply:
+    description:
+      The input supply for MBATT, BBAT, SDBY, VRTC.
+
+  regulators:
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      "^(sd[1-3]|ldo([1-9]|1[0-9]|20)|bbat|mbatt|out(5v|33v)|sdby|vrtc)$":
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+        unevaluatedProperties: false
+
+patternProperties:
+  "^in-v[1-3]-supply$":
+    description:
+      The input supply for SD1, SD2 and SD3.
+
+  "^in([1-9]|1[0-9]|20)-supply$":
+    description:
+      The input supply for LDO1 - LDO20.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@3c {
+            compatible = "maxim,max8907";
+            reg = <0x3c>;
+            interrupts = <0 86 0x4>;
+
+            system-power-controller;
+
+            mbatt-supply = <&vdd_5v0_sys>;
+            in-v1-supply = <&vdd_3v3_vbat>;
+            in-v2-supply = <&vdd_3v3_vbat>;
+            in-v3-supply = <&vdd_3v3_vbat>;
+            in1-supply = <&vdd_3v3_vbat>;
+            in2-supply = <&vdd_1v8_vio>;
+            in3-supply = <&vdd_3v3_vbat>;
+            in4-supply = <&vdd_3v3_vbat>;
+            in5-supply = <&vdd_3v3_vbat>;
+            in6-supply = <&vdd_3v3_vbat>;
+            in7-supply = <&vdd_3v3_vbat>;
+            in8-supply = <&vdd_3v3_vbat>;
+            in9-supply = <&vdd_3v3_vbat>;
+            in10-supply = <&vdd_3v3_vbat>;
+            in11-supply = <&vdd_3v3_vbat>;
+            in12-supply = <&vdd_3v3_vbat>;
+            in13-supply = <&vdd_3v3_vbat>;
+            in14-supply = <&vdd_3v3_vbat>;
+            in15-supply = <&vdd_3v3_vbat>;
+            in16-supply = <&vdd_3v3_vbat>;
+            in17-supply = <&vdd_1v8_vio>;
+            in18-supply = <&vdd_3v3_vbat>;
+            in19-supply = <&vdd_3v3_vbat>;
+            in20-supply = <&vdd_3v3_vbat>;
+
+            regulators {
+                vdd_3v3_vbat: mbatt {
+                    regulator-name = "v_powerrail";
+                    regulator-always-on;
+                };
+
+                sd1 {
+                    regulator-name = "vcc_1v2_ddrio";
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <1200000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                vdd_core: sd2 {
+                    regulator-name = "vdd_core";
+                    regulator-min-microvolt = <950000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                vdd_1v8_vio: sd3 {
+                    regulator-name = "vcc_1v8_io";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                ldo1 {
+                    regulator-name = "vcc_3v3_ddr";
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                ldo2 {
+                    regulator-name = "vcc_1v1_pll";
+                    regulator-min-microvolt = <1100000>;
+                    regulator-max-microvolt = <1100000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                iovcc_1v8_lcd: ldo3 {
+                    regulator-name = "vcc_1v8_lcd";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-boot-on;
+                };
+
+                avdd_3v3_usb: ldo4 {
+                    regulator-name = "avdd_3v3_usb";
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                vcore_emmc: ldo5 {
+                    regulator-name = "vcc_2v8_emmc";
+                    regulator-min-microvolt = <2800000>;
+                    regulator-max-microvolt = <2800000>;
+                    regulator-boot-on;
+                };
+
+                vcc_hdmi_pll: ldo6 {
+                    regulator-name = "vcc_hdmi_pll";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                vcc_3v0_sensor: ldo7 {
+                    regulator-name = "vcc_3v0_sensor";
+                    regulator-min-microvolt = <3000000>;
+                    regulator-max-microvolt = <3000000>;
+                    regulator-boot-on;
+                };
+
+                vcc_1v8_sensor: ldo8 {
+                    regulator-name = "vcc_1v8_sensor";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-boot-on;
+                };
+
+                ldo9 {
+                    regulator-name = "vcc_3v3_fuse";
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+
+                vcc_3v1_touch: ldo10 {
+                    regulator-name = "vcc_3v1_touch";
+                    regulator-min-microvolt = <3100000>;
+                    regulator-max-microvolt = <3100000>;
+                    regulator-boot-on;
+                };
+
+                vdd_3v3_hdmi: ldo11 {
+                    regulator-name = "vdd_3v3_hdmi";
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+
+                vdd_usd: ldo12 {
+                    regulator-name = "vcc_2v8_sdio";
+                    regulator-min-microvolt = <2800000>;
+                    regulator-max-microvolt = <2800000>;
+                    regulator-boot-on;
+                };
+
+                vcc_3v0_motor: ldo13 {
+                    regulator-name = "vcc_3v0_motor";
+                    regulator-min-microvolt = <3000000>;
+                    regulator-max-microvolt = <3000000>;
+                };
+
+                vcc_2v8_lcd: ldo14 {
+                    regulator-name = "vcc_2v8_lcd";
+                    regulator-min-microvolt = <2800000>;
+                    regulator-max-microvolt = <2800000>;
+                    regulator-boot-on;
+                };
+
+                vcc_3v3_temp: ldo15 {
+                    regulator-name = "vcc_3v3_temp";
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                };
+
+                /* LDO16 is not used */
+
+                avdd_dsi_csi: ldo17 {
+                    regulator-name = "vcc_1v2_mipi";
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <1200000>;
+                };
+
+                ldo18 {
+                    regulator-name = "vcc_1v8_vi";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                vcc_1v8_touch: ldo19 {
+                    regulator-name = "vcc_1v8_touch";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-boot-on;
+                };
+
+                /* LDO20 is not used */
+
+                out5v {
+                    regulator-name = "usb0_vbus_reg";
+                    regulator-min-microvolt = <5000000>;
+                    regulator-max-microvolt = <5000000>;
+                };
+
+                /* OUT33V is not used */
+
+                bbat {
+                    regulator-name = "vcc_bbat";
+                };
+
+                vdd_rtc: sdby {
+                    regulator-name = "vcc_rtc";
+                    regulator-min-microvolt = <950000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                vrtc {
+                    regulator-name = "vrtc";
+                };
+            };
+        };
+    };
+...
-- 
2.53.0

