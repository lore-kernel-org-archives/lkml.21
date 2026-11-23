Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437378;
	b=kzIqPEJvCTWa8cnDY2hPIlfd57jxv7tGC0PaP/qT6gO2pAWPXGLdrIkYS2VMAvWKMPst
	 z+R1mH0vU81fJPIou6D4YaCGTOCUcRnTlETFB3GJCqXRSN+WKhMTiJ96pYJR+PnFj6AXU
	 BITJIFx/e6QJfDmIe5D2bhgPi1sbkG1GJZeEt2ttEYyXO/lNaH8tQkUdgyMRE8KbrJ/Ud
	 ZbflnJk3fWr5ed9h4fpNacQYmObuZPrYTtKRonbd7hKXXsbx/fg1l2jhi4RNzF4QwfY97
	 HHMC0fpddZFWrscjk+EMLtP0NVuity3CwvI2YonImgolhvagqz2P4NtpNq7Gyzj/M/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
	b=udvlnPSQi0Wxc2wPxEuI76Yg013TjETKfqEsHQ4urrq64jUQrQM42iFBXB32XNrafTe0
	 CbFuqGXRwOD+05g3tyKj7raB0QoF4yfpHHnVH1P8QCtCASEK/cknXquzZvcn9kxKiX7s8
	 XdUf0m94dAhOrlVjcBPtPk72yOooJodkKuy1oxS8bUif+zJICvdMzgrySjYS08a6IA57c
	 kO29gk5vV8jen5CowAdC8j7cuAB71maMLYB4e2EwWkSpCOq7uWWVypEKshP1QZI/t2Svj
	 IxaCZ6yF2q5pZJCuLAUvvcYnKMjyv3pwitPh66Frsi6czDYARGNGEgu9M8XtdoIzL2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6i2UD+8;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871AD606A339
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 871AD606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6i2UD+8
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38692f62b22so1846069eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437377; x=1796042177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=R6i2UD+8+1SWXf6raMYqaGU6H0ZivEnYsZ600TnGXzjRiBt2okNAeVKSlYBYOoW5Nq
         sTjhq6t3svnLQy8/KKx48rxekAp41/oU8wMvLXcUJHSlB5ws6nby/8WiCuiIEWqZLPUr
         6OGGhhdkAW1bGGOeS9cZHZv2TtjQaATT+kczHXZnkMDVUZZZvTfIXWopXsEX6nkGPNCE
         +7IuT+u4Ag53FHsuExyb3aJTlEaKFfKiNEBtMP6fFKFDY5fqs9/0WjfiJDyXqyqAxzcp
         2ShqeKYlzL0+vd4juk0LrKZE8XEezjB3tuvKz1g483yqW+hjXYLFccv2syX2DSBi9/YX
         lD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437377; x=1796042177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=MO88VD4JeimVjzI0t1iz0KMRDu6s9AeX9ODuRDsR7x6NCus6Fg4i0F2mpisVPd/Pto
         eVmF5zaFnkT878We2uU5xm0/H3sfrLa4oPLMwuAYFvf0kjPOzJ50u3dKRRjOKNrW5mhv
         BZ4H5ZgaZoxXbpmFZZELA4lFXypDS9FRkAQ75kEICT3pGu36jGmbwo4qOwcbAm0A+vqA
         HQEi2gdazlC8wHH09Q81YJRHYFauqsFsDzGo3m0o+l3iJ93lBi9yAKoVnrqb/oGkQ/16
         B9C1dAnKLxrx1Pqw6DfJ26Lih6iwbGH5K/6KUhZ4+g0nUjFNnR9DmQQYqAGjdFndPbXc
         y9VQ==
X-Forwarded-Encrypted: i=1; AL+hErH0nVlEOUEmCGEweMrrgIrArjb/VWhfsX3r9VeBC/fUXNd7gfptoacHDxiZ58i5TUF/awd3Cwnn7b/GOkw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VocrLtbtKSXBVj7SDzvUyD2+ckamzNp7BcPoPLzX6LgKaoB3D
	tXB1XAQvwIs1lF1LbulhbQuGxLz/fVQpnhTNvE31miwcd/7n3A84wZPT
X-Gm-Gg: AZFdTZeXAaaVHfxS/p3DU0LujQIPrKvJCET995IDwCDB8B42PbNa7wCVrbKFSQrM3mU
	vgXmXgMOzt3LCufTlonFuHM8XBik2KNe1/nSzl+XQKybWvHPEFGnc9yywYCk0ZVpsNamyzsEGIv
	5X+0jasrBYkJ26b5Bgkd1Y3ATX4GGZKQxGRYDVoYw0zS6qdNdtoOXzKag96/GMtxnquCxJM+FNU
	uaW1Bf1hXZ13pgWGqIlAgRHiZdHVv2iGb2gu8Az77bxp+QdenJ56PHqGk10o2n3e0iYWANmQ3/5
	fhU+ywsYB4bcn7Ow+aeEjRXKkapjIgz2w/TigmOyjhypVC7y4k+6A0sSI6prkfQb5q/eivZT49H
	zYttGfv2F52fWB9uQMHkS1mOgkD1xE2yjPoZk3gaLBpeLLres47bhpaSJmMvgs5lEfogU9d2Jqk
	OekBXIlxt3hIdb7ArxXfzkvvC3VfAsFt/cSPlUaa9iqk/6G9YVFfXHRqmuE8QzoY9OuiPGYopFj
	LnPZgZLt/lqmqW6PUAGw/0r3DZcAX8JQuQJfSHRD8R3+DahpD09Lm8isjRO/hDTAhKfD5slJT7+
	8FAJpGRdXU2WB77HM+i5EJBFIo91+9hDSY4ng9B9DcpDKUxN8nZFuSsSg39A3INdNzU=
X-Received: by 2002:a05:693c:88cc:10b0:386:b306:4ff6 with SMTP id 5a478bee46e88-386b3065916mr2485851eec.21.1795437376602;
        Mon, 23 Nov 2026 04:36:16 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:36:16 -0800 (PST)
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
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Mon, 23 Nov 2026 19:35:41 +0700
Message-ID: <20261123123546.152162-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
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

