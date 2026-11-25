Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609965;
	b=ZUipXD+MKA3j5VBqzos68620NQh2p/ymPUc64E6EFUUbkWbLpppWtWbIs28WTy29gNni
	 TYZLVOJtaVTpnU9ATwRPEeP9wMvMoD7Rj1IWROBVwSEagPu3kVKYxZ/7XqLXE83zi/+VT
	 Wkk/8xrA9hxLSGeUDW1RL0jOQPY/Xp9Hb/geJkNTzkvjBn0GN+XGjxJsej7DdkkRsgZGB
	 /GvS2oCbFDXgBElH3hmIqsTR55bX2UpsLnCvcVH2lM1coSpwPffFWnFrozLXGVf09hTe6
	 tC8O3k3Q7rcuUjPKt/8gugq21kDa39tOKiouF8HDzfUTlN4zD6yb8Wfj2OMwypq0tEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
	b=N8P9BLcDB9MBgYLLTBHIyUy9nhsPp5AnbA+1DXraObSv7rV7tqXpUbOBr7HW+DFS2fjJ
	 fDKpVMS2wCwNJjauyXt8JtpClQygi6r7R8aJVROiQn9qWy5pQn6mSiB64mZzUXM27RCs0
	 1mwD3y0yhB9V2+BD+FRQWgL3ZSgwCEJ+CbbzeAxyxak8LSS4uZ28xAUKNLwy8p75sWLl4
	 klSPgLPj21j/mmTXwPHhZEQ+Q9+6d1DDyD2teXevyf7tpsJ2BbZgAf9L9lrXuf/zYluiM
	 TJr8oOyTpHk0gBILWKeJi/gBa/TMVkOpJIWBs1chRzN9dRIZZH1QlAww+vxHNp0giXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NANt/KWh";
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631E4606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 631E4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NANt/KWh
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cde1479f76fso3194024a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609965; x=1796214765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=NANt/KWhIDdvCOeY4utjDOeqLYM4twhmFG1ItWWr3HFT9jCk4yOM+BgBGWNOd5ahZu
         etyEMApCd3o8OOE7+A7McFA3J75fbpLKjLtKw4hs8S5XrQQ3oi6X0ow3zlWFZzwAzFtI
         wLCY/cPCP0Bb74osRlvhcYTbXoe7C86voPzvRciY/wVa5IvEHzGTJpVQwj9Os04aI/v+
         FDcmPfmq+U1YC6K73kI0mm49vPu2QV4pucYa2aEF4YvQWHV23zNY1kpx+bFRH1NOOu3K
         zYibLiQlcmSvn3TzewhtK1BOYPKuemoEFLkGTqdUtQcJKNSFWRXHvmddFInF3mz273cp
         cFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609965; x=1796214765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=lWDkU+YxuOAKyFPe0HjgkUNj+amsYjTLlkcHxwGQ4s4M1xuT66l+/qvJt644VbIHbw
         oYb3h1L63FPW059yxV2gaWp0LCIuJoQkFIQrXn6oMMT1VCUn+CTqZQvRxvP48CRx2/m0
         jCXhjGgKmqDxFDzFq8jwkqgi4LZJ4iof8ZETARCPakNqmUUSjklE33JD/GWxhVmwJt/D
         4XmQLUMTx/5F6h+Frn3UroUQa89oCBli+GxJOYgVPU1QksZnuzoRWanSmG9xDIdMG5O3
         nHEeYOyS4r0m47/JstykfzCpwH6vmwY75kKbHUjmbL2q4YwEVJLMitSqvqZCIp5lTO/g
         CcUg==
X-Forwarded-Encrypted: i=1; AL+hErFYIUofC2mvQEAz6cHsmf1tQU7azMmK+uQ/sx7CBC3ob6IpRGvhfltju/XLPYEclG2xvHEREb292X1NsPE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NtW2FrVyxXRaEjfywNI5a/pngJDfQm0xvK+veKKTfrwSGBdUR
	LxIM18ImOWsdJsOXrnfE0rM5tu1LkKuqsUxHseU/Tfhsu8e3vhS3LuA8
X-Gm-Gg: AZFdTZcCbic3ISQNfUq8PHKO/m3dR9w9vQnyq+862GxFE8YfTblWXZrSQGZbKwW02ZW
	UWZHZbaxEjEEmmXiknVIKnDf1Kf69Ol2+h3sAjs9YlvMkTj5jZF+2+CuhUZ+JBABMXC9t0GlEvm
	SrJQA9tmi7AS8LTmORv6GyuGsdi7xdGuttgetitaxrcfV9RlYTASmSiifZJ2GbU7ykyXw5A66LO
	YPDUAI3CyKvQvVUHM4qDxgdFSOSIS15511YH6P0LMkd4f3wSi9mtrOdBhyNumh5vIgktubOb3eR
	jC9EV/WZqoD90pkO9PZiN8r9dRgQn8/ofwo+gf77hcO+JSkf7+tXD2BeFGNhHMFL22qyJKvTG1u
	uIcxTwCigblB61pA36giKf3V0Kfg1EkVeqOZr/619Y49d78ItMc+qz/mLK52mfdPtIjQrAy+7q2
	6PwDjFacdUpAzqjkCNEO+A9GNyz9hpVlkWTkYCUH77DJ2obpFHtfuagTWEKr1cwAoKzQr/c3rUE
	hbEJ/V3G/Wmy2k4mkMpYKvvZ9LURm0O3kxIIc+6ikPiUJUWYrDZgABD44kVJrACsmTo0Ut+rSHk
	rrMRLc/4BCeaVK2DP7xLlCc+HH4GBjx4lItOcdmGM7Xeqt4=
X-Received: by 2002:a17:90b:380e:b0:3a6:e99b:bbdb with SMTP id 98e67ed59e1d1-3b41c9493ccmr17317487a91.50.1795609964791;
        Wed, 25 Nov 2026 04:32:44 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:44 -0800 (PST)
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
Subject: [PATCH v4 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Wed, 25 Nov 2026 19:31:41 +0700
Message-ID: <20261125123146.379057-3-hikmahgumelar@gmail.com>
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

