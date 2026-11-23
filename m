Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437389;
	b=V23VZZ4Ys/T5HWZXgdnOTED4mnwSD2L8z925mCb7Oe8uQrUWdoULqRU8rzVQ8eqMPjbK
	 s1+CXmsUzy89U1RWbEyeOny3pS1Qd9OBj7iIPrSKM+ue5Z6YhB2zCWOPMQCd2uSDe64FM
	 E+vsKC4/6v2X3oJ14PCAfw8FYVyympTaxo97snf8guP8syOv725urxxTBy480PrdASzqr
	 7o3gVfEoMQsvYiS5HkEexgMRALVOSD8SLGoft3fq7TxqnR01xE4Dbepl+gNHsIcadUF2k
	 Bbx4pVpb7y5GqPCMGZ1UO3Lar90/MAJyLlV+U2AUzTg5CF42Yls4EBytC6Uh4Yn2u8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g38Wd/fBM+0JtbWwdm5SkFifhCj05iHQZ7N1COQVm+U=;
	b=MHw5Uk+AWfI6m0pJfE9RG7v+HJ6VnMX1ww5aaBe4FyPUMeiblymjIxwqPfqyRdwG+XFF
	 pI2dUN/JgokBg1p3hTiCvljbJ3SZQWatnADaboPrAlpA7xny3V7ByrwHZrZ5M9Md14imM
	 rOQsPu5m55mjL/9allpojNc35zgUpCU0oPHDOfPceA1ILeKJdKoH2tRBH+TmWmoqePgb5
	 Tjl7tqOaAqwCv+YFARTyFoNeI52Ng7HnY/w/abATD/Odm1PxvUFoHi/uk+12KjPxEMOis
	 cKZABhteSOqXeY8XFLc9qnJR0vgY1BBwUMEJB/oa+uSEa5oikRpYstkbFfRDhBKNolw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yFIfOuub;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C347606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C347606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yFIfOuub
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-382f4710a17so5495458eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437388; x=1796042188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g38Wd/fBM+0JtbWwdm5SkFifhCj05iHQZ7N1COQVm+U=;
        b=yFIfOuubNJlRUiOAFhmidvQBzSz0FkCm4XkWaYqNdoz2/f5GMQWhYHJfM0Q6x0yvWL
         10OOYhlU5VYd8kjDUCdqP0SszuzKHRMOmDaNdbJRS+tpeMrTNxlRshs3ILiv09Bw8FX3
         zSuUaj1Cvtsnbw3TPGbvqdsQ5uXBYmeA7QKxLUpzV/vNzcF0Z2Vs7QgCT9obfFX9ICL7
         H6MdVnytyOhs4j6GOIn8GmBqkQ8IrvCedOG4Wvlc9Fm7q03+RJKuTJ3uiBHwnSShlkIt
         y2X149Dzoo7Stf8oNmCLrGwA1WE/7Arap7WVpgxWRr3PbK2SNtjVM0K7JwAkJ6IZCAss
         Ev4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437388; x=1796042188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g38Wd/fBM+0JtbWwdm5SkFifhCj05iHQZ7N1COQVm+U=;
        b=XMsni+pcuqprt9/uHvPm+1SzKaZkVosluHgvhTE8R+IkoYqIf998oSjFEYBghujsoq
         CsIiZe9+djGqo4x0e+ZkXDQKI6ZAlKD0p8HvQmnIEftGz5xf08trPWTvAM8yWG3NZVoM
         61Jer2KdsNtbc6CcgRSS1M+w+FSfmLcNV96df2ernmqWi/o0DrdJA7OSTOggd9j0ycuA
         iaB9toZxJK7EbkI9nxoJy6O+q13vMc2SNwR8PMDep5YRlcXzedWMA0yhooLmpXzYEdtJ
         7CPQnEC5E28IgBt6Z7Cxl5efHXDWz5Nxe+j1ywfbVmZG3ub+KOPomnOqD6ivzNeL1U5y
         gMuQ==
X-Forwarded-Encrypted: i=1; AL+hErFPuZ4eMYToo/7huNwGjWimk/GXDDjgxDW1EZ0CTUn1Sh7P+mIv+RmerUKPd2i9dx4e18yLynXXSwr9JhE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JjdVqeBs2SF8ErUOCPRRhXDpQr2Ob0g4PC9HR/nE9U/JBlFGW
	fydaRvaeKdW+0vw4DSec2mCHp6PuZqJRYN1jqmFUYbozA6nXcxPzeZ+Q
X-Gm-Gg: AZFdTZf2jShCAlNDotrMUHwJSUxxQDKOLU/V1b9KoGKnMUaUG3x1dN4aUSplD+4KHRh
	ziZAi7DOI1og+H7zXalar72HnRApIoipIh9KdlkO8T8XzORkV/A/ifrdK1Vmj8tr8PhA8FdweiK
	AzgCE/2Vq5RUlgbavykNvDcpV/wC8LqIiQ98r3xxosFaSI6TLkUBzB7BnevX5q6w2in3lHuha0I
	ZUdWywBsolMBPc+xfXbo2083+v6ppYO2I8oqJNV2v+/sIj7abiP7OtBzLMDFnjIjvhV0vfvdN5W
	PuLp1jk3txTI7Aen4qWbPdQMGrGBvWjxqklO2DsF2F8W8DdgvPRncqTk3L7oALY5zkIZ8p7YB9e
	b0OMn8UbWWMVPVjflt0WJytnAshGpaT91ksJkpm9/9nwU5jqHh/4OYFx/XF5TisCjxjG44wyHLE
	iSdO2VbHtANypaLJqmajuwOVOZPsi1p45fgvNS7vDr4ABlOiFq9iS/vamF1g8j+BAafHJP52Bu9
	oyHrfwLMn4pdWArVyziS1c39fR7nWssSc7+8h/797yp1XrSv8kxC7j+iNv6K+lo3FrXz1KV6gmC
	/VW9LgenTE/lDEyQzMQypEYNXY55HsN9DtIL5mdFeOFaZw==
X-Received: by 2002:a05:7300:b089:b0:386:9c9f:83d8 with SMTP id 5a478bee46e88-3869c9f86bbmr8057978eec.17.1795437388482;
        Mon, 23 Nov 2026 04:36:28 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:36:28 -0800 (PST)
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
Subject: [PATCH v2 4/7] media: dt-bindings: media: i2c: add OmniVision OV12A10
Date: Mon, 23 Nov 2026 19:35:43 +0700
Message-ID: <20261123123546.152162-5-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the OmniVision OV12A10 12-megapixel
MIPI CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/ovti,ov12a10.yaml      | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
new file mode 100644
index 000000000000..6919277c2b3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org
+$schema: http://devicetree.org
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
+  pwdn-gpios:
+    description: Active-low power-down GPIO.
+    maxItems: 1
+
+  vana-gpios:
+    description: Active-high analog power enable GPIO.
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
+              - const: 2
+              - const: 3
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
+            pwdn-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+            vana-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+            avdd-supply = <&pm8953_l22>;
+            dvdd-supply = <&pm8953_l2>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <0 1 2 3>;
+                    remote-endpoint = <&csiphy0_ep>;
+                    link-frequencies = /bits/ 64 <216000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

