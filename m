Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787156;
	b=cxwdBJs+vTQ6ViC+ilH2Xxbqrq34sjiETx+lVyFqg92ExlPkwqbUtv0k8NV0gQGb5SMy
	 piV0MlME3Yiaj49qUW9GP9ALhjp3+ufp8LiAJY4uLeijf/KTFNai7IlnH6a56mtvhJAUT
	 5G8JsofFp7pBjnoeNcAAizks+ZqFn1W4oHdiIuNxMuGslpOO58mcOS+FqoQq03UoFv+4j
	 Rd6QV1avsrG05Z2L87uqDqiTrvzr4zGPSbGi2YQ0BeWjqj4knip9mbHhAmf8xPNzrGcFH
	 gMKSeOnBxiTHuJnLcXO6OEFt0IEHRGiQgwjK3KUytnIFMCVhIJaqdrmexP3NHw4XAQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
	b=sXe+CP0/Zi8VaJejeB7kUfceI7iBGSdwi/bpd5QHTibYtq7K2UQhR1ZS4LlTU26I5DZO
	 7KH97BE7xDsDUpj2punhoMNDGXUjyCh7my9l/l+DMUGmjzPKQYIxvjw/YKENr+qyhEyHD
	 5hB+5XFSqxpXb2OrdsvOrVF3pj/HoD/OPomhqdIOchxURKigZqZvf/ofMBm7q7cF5vVmR
	 SE3LXbT9as/rjur9vUiWtkyV5MGXOHzI5kLTHFA0IAxnD1cNk8Zx7TbbL1Zc5AtNPXLG1
	 HKhhalUGIWsj8C0oKqNNYolSTGbv4HOK4Mtd+mII6PO8MUTyO81eCr/xcmAs4UNIJJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7bbcdEA;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F049E606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F049E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7bbcdEA
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f045b921caso46801325ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787155; x=1796391955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
        b=D7bbcdEAeE+MD1H9f/KFWjA1H0YHRcfugdEdaeaMX53BmxslbpOMfjMmcwOCT/CP4D
         t+lnzPTOsvEXQ2Q7ISIaj+E5yfcHPKhPGQiry2RCrntqhZbmL/6Vle/D+EH2+yH6s5am
         wGPpbc9db1bpOsHn6av5rYEiLdkf13qUxzTcycRzoD7zQezgjozlhhVDHeYMLoR/9HhO
         5h7L68EZbURFnZy/JazppYXdbp6uuIxO94o3KD0Ro0TxOaPrIPO9MfZh0rI0m8/9nASS
         Zr5OH1OxEOKb8sJcJ3ln5EwXap/ryFpk/erP/s9fU3MQBUxfelY0/7KAnBiV0C3dCqff
         Oz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787155; x=1796391955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
        b=E31uAjdhFqJtcNo215ot2BHB96Ewr2wDNKulHR7IaHcKhiZMSfuiL/JVLKS1vTFzgo
         Fbwx6wCK7442rP+KZHsaUE0kK88I3UemneRL0x9czP80zUv/qKXfXeSTv+P0cGgYh0QN
         vl7ywKwgo+Qj90Jp3rurrtfCkAXWRHn0IfkabWHL6uf7zVmCYOAVQBqb5CTyleSUayKp
         Kh6Malc1TPWxlictDUSYNxs6iSakmbQdYUTaykAKuOF2mlx2j2bFvUkEYF6okOPMR917
         056s0nWN1aGipv3cHQlzSe0pf5NLkadWFiMzftzQD+JS2LVSG/0ljS3Y0QW1NCIBOj9K
         u7oA==
X-Forwarded-Encrypted: i=1; AL+hErFKle3FRt60mPN38BQyCkGNVnaX+JNfJtKzD1dnerEnNp4qSixsAuiPXCSQq71DN4Z8TnVRbHufgZ1AHeM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lXvJxhLRHVWhyE4mvv3sdSd/5QTjsprUIj1kLo9D7ZVewA2Rl
	gR92Uy6b3WVZamNdCgSIt0mmFKfBF/wP03jbuOIo0CZZwlJLFTDwX0w83RrBGACFU/8=
X-Gm-Gg: AZFdTZfzIjeDgIHqnRJaktZEETdpa3X4hkVewmTi5xrH7DPRkyySxkoZEj91fYcEMfa
	F8txebDbYAryidYnQ5kDv7MaDcbgj8CKhx4nh96f2+TaJAQawoxMEtu490/0zABs3yZVG9KxRUF
	MeFrT97lBCKDwdFbaGalZ6b79RSbjjzAAt67XAAW+1hpjLhDSZUeQBXOH2beNv4cvO8OnsMiOWt
	Z7cRzrVhJMQAowR+fgb9odgYajgBrD5AKy+5lcZNhl1wDbQdhzc15aIo/6j4qYjBaiTacXPgBla
	wdgTe6oIQQ/uap6D36LV6n7kBhL8GB74P46uE2KkZp2qLj0/phXCxH602uLwi8yl+GCrahbYrGO
	DfI0u7pNQEgUI3pP3eK7Iytb7koy+jdPuj0k5GAcP6dJJFqLLhAsW+/9VDz2XUdIPpF+DhAyaEY
	Mj4lE4NN3Toli6/LVp2Jq4nuD6hNE/F+RXdd0b7vUs0QLqQaEncJEEOmbGmhK+ZzIt3wXM+hIpI
	b1RRnrufpAtf13ULB1LHmjFUjR+G+jLP7wsHFCsLYCKYfeF2pcvQds8r0Mzx3OTjV8TNw8nkdG4
	liIMbT3aRDSstRQFJMBDYPVA43F8q+WSiimLZcJuh2DM7Q==
X-Received: by 2002:a17:902:db08:b0:2ef:dff3:47e7 with SMTP id d9443c01a7336-2f03f170f5amr261112775ad.33.1795787155319;
        Fri, 27 Nov 2026 05:45:55 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:45:54 -0800 (PST)
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
Subject: [PATCH v5 4/7] media: dt-bindings: media: i2c: add OmniVision OV12A10
Date: Fri, 27 Nov 2026 20:45:04 +0700
Message-ID: <20261127134507.125513-5-hikmahgumelar@gmail.com>
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

