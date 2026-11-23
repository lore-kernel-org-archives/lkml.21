Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456071;
	b=FJVTVTGIuLlaF9PpHXV96/QnPQ1qDN+r8lIOKok5J8SK82+vK8zntiATcMOB3sP17TRQ
	 HEbxHh/PJ1wheqm7fTG86eZ3aXVikx+hA17AIVGnKeDZivqYtkxhAPmJnipzahKPPPklv
	 QWMGYW6rk8iJnt41x+s2Kz2ujF3lwg86njOoH30Jm99LPyY8kOIQupO8CjhZv5MYT1zIf
	 l8xPIn0HIwjjxCncV4juAa2h7nQwBJw5HNHNiJ03f/aIdzIjLO1PpOT+IHDv2HqGMXRtk
	 rYRDv8NlLXlgXF428F9qsco6bsEHFeoC7RJqzM/euTsFJQlxbE7NANimtRv28Zn+blQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/diyqg7QY/1MGJvSdYZlxv7HwRgm18oyLDb6CPRKmRg=;
	b=P/2HJ0iEU9KDLiRjEI79dkMm/XMkiP4WKUypxBJ8vtNCFvrgcu8OlDhKEqI2sUkvocXe
	 kjnkyUISHmEWXQeWf/Q31a4oXDIzFX9/DAq5u9TMqSJGZIIqSSqinbKqQNwWr7uUmHLLH
	 apNGJMIAPs3v5Rg3ax26FycWLZ7q6UCtAYmea89hj8rqplFZqmm0IAFah+qeFjCPw2icz
	 kaDYOrGWVyqyAWkgbRypCgRc5pbT6DADwx07/luwZJiRAuuegENeRtOSEPnosg8YEKzid
	 YObQcBOgQj5G+hdeb+XtNYAhODBnTXvic/pGz6c/fpwcbKsIYAJgTN5+TXxUbZkoBAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Fw0LYjMd;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FA4606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92FA4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Fw0LYjMd
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so34653175e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795456069; x=1796060869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/diyqg7QY/1MGJvSdYZlxv7HwRgm18oyLDb6CPRKmRg=;
        b=Fw0LYjMdNO5O+fKyGXuahm4T3ZA0tBUynFcP5e3RQhDak1KXv7kTGTwQ8B2C0XYdF+
         NdvGJ+TPFO9MzWB7gKjDO8b37zNsIVMamnPDRtMuf67IYkgu+V2N/GwokGE4anB/Lr0x
         0sm3j3YlL0HRsU0Hn4+vlOifekBjj9BzDpQGxXzV+3oiUNbWP9LWFc7G/vRg7alojvrd
         JhU2b2bWQsuPTBZ7fiS4n5D7182yql4cUE/l0nRMUsk3qxfU5g5n7YzJ/c9sYS+oFIMR
         pdnVHkFOK6MERSVA+CAyQo4ZPysKN6yqkXFivxGsgJ/qOyV99wx2SrbG0kzk8jL6TtQi
         543A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795456069; x=1796060869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/diyqg7QY/1MGJvSdYZlxv7HwRgm18oyLDb6CPRKmRg=;
        b=CkfGXofAAtKUyCxX9cdiHsY0wIBTF7jPUXvjSmaYx02LSQfUCYo5SMDUcRMnwU1jxO
         8/NsjHUzrngU+h8UH1bSLJp9bK2NZeRfnEKiW3HrNIiSRwvHl1dnoAV+rccaHlHmx81U
         M0CAUrwL2e2cTlAbhKZz6HNEMtEXd6zx8tr0geAxlObm1L67mSQEbObnmeUrIKxj2w0F
         qmcgQpc8s78I6foZU6BmHiQYMhMJtZR1eAqaeg6xYdA5kQo/s3x46qfWDokVDtqtWVBA
         FM8IomNzkmv3itdAhJXRaKOB8M13J7QJiGWRIp7G0uyQlb2Yt8i3iPeivfU4Gb0ZtALA
         vVPg==
X-Forwarded-Encrypted: i=1; AL+hErHsghZ5NMZ3SajwsIQedc7R+1NGHHc9APqaVYVScA+9WWOzCVRXbFhS8qXmcNdbjBN6Xurrq4mI7aVpSw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bmoz4GYsaWc6Z3YcAqR16LWwyejokPzhDyDtbAj9GZyk1vu1A
	N4ah14z1VTlKAAorZ9MM1JDbriFecdfrz8zXrHvROArpeLoSxKX/dlwZNGgInW2Cql8=
X-Gm-Gg: AZFdTZc7RGz0cOh0S2q4JBt7gb5qHAqvlGOaB5r0VkihBqTZLxmXao+0Q2SNfj2mP0V
	QgOLACIVpa4tQQ/a/AV3tRChozqSCe3GCIYhZ3bGQ01JbzgRl7Q+9rDTlUshzOZwjBFL84RwG7Z
	Kx7RtM8yUViuUE3InSttSO4H9fzeD+B0Pl3N1thPrLLBvKjsq1jpaU2hB8TI6ZceXRrI4S2EMim
	ZSay6fQpt4IxxYlEuWTxCzZjN1G8k+E49DSEUd8hrhA4RBZC2nLPIVCRWG1d2U8eIcKOZuMkfXo
	abM4XE32k/cSTIg7KbADohOJnrF4hESG084R4OBADFnqoQh/xlCdwLKt9LnGnUSyNOkepobj6Dy
	hmv2NMpr7n9C4WQDlA8KxtOhbqPKt7zTER/4+pFiVg5zyUU8fEbFavMmcIFDVMjcPRWtctW2InZ
	wrQLoWUKRERWgaXUsiKRcuYJAv1S7XBEF/NqzshTGo+9M3Y9VCl8pLMOUxNA2ToGHX3SmwOZmCa
	ZM7a8+UU1Rj3h6q7agS2p/BU1wWCdCYlUfPHY/Xe3SR2bgj4ORMMoDj4J0jfetA/WjGlUwt7ZLL
	R67x788iJQzS08xkHt+VqxjnfW1PAKJtRf8GKgTUVcc2Xne3gG0GSnAycl4xuZnOOXnJ5+BU
X-Received: by 2002:a05:600c:12cb:b0:4a2:1104:7ca7 with SMTP id 5b1f17b1804b1-4bb861576bemr201776855e9.11.1795456068750;
        Mon, 23 Nov 2026 09:47:48 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm22961413f8f.47.2026.11.23.09.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:47:48 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 23 Nov 2026 18:47:44 +0100
Subject: [PATCH v7 1/3] dt-bindings: iio: add: document the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-topic-sm8x50-iio-max34417-adc-v7-1-d8f87edc5086@linaro.org>
References: <20261123-topic-sm8x50-iio-max34417-adc-v7-0-d8f87edc5086@linaro.org>
In-Reply-To: <20261123-topic-sm8x50-iio-max34417-adc-v7-0-d8f87edc5086@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux@analog.com, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3254;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=rt+RNgD7W/568mSoPzZilfLHyJVHF2C60dxHxMFmmgI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBHxBRfomQxxpolpa2aqorGkCEfADtz3GDNhlpg/M
 qA/TshOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawR8QQAKCRB33NvayMhJ0f1UD/
 9JT6eSD9g+rYaKuN6OIDV5uIkMVQ39cRb0ytYVU7ksXhx51u6wupxlGGZnS86YnFaev8zMCXiS7puU
 KNONQPONw8GvIp7PidSusICoOw4uLYbQGDBeMWjjL4HxSicrpXqF5AxzONY4vGC36GVvL1TOCLcuxr
 GQLnrSryRFu0g+/2ZhVzVf1fOBj/Q1ug7GM3XiYGRaKlZBTEi9ooa14P6yKiKi82Rt0KuJehf07Go2
 i6ATE+KebwTyUpClUw3bvLDiNcoabqGs/mqt9HrZWHa1TJUMsDIFmdclHqe2pSMuSiF0yrBKJ18yJz
 RmYQj0609ySYwL24CKEPPoPNkZ4cm2a+oErGdGevEVfWkEX2hea32BTniVRS7d7hhezTc4B7vOeQ4i
 Awd7dYUsUnY3ah+8tadVZQzQ7yov6YwgjMRGvvmh9IcB/gjpow4qr9+aXV4lzdafcTYkavrRQBnvkv
 Sb9hFDWJvZYvxkEiAi9B2lfxanzMy7SL8Id/NZZTsQlHD3DfLfRioNi8PNR1yH86h0QgcHOfu85mwg
 Yqqc17EmepLgUOQqfqayi5uKKiR6xGIwsoq49oU+Engkf9c5GH3xiY0J5Y66p54z4lScP4vpRJZzJV
 qHKqDp4eFua5L/kb6oTk8Q45CTyqFQy7dt9oEUzNRG6I5teYmlaKe0bN1vog==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Analog Devices MAX34417 Four-Channel High Dynamic Range Power
Accumulator used to monitor power consumption of portable systems.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/iio/adc/adi,max34417.yaml  | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,max34417.yaml b/Documentation/devicetree/bindings/iio/adc/adi,max34417.yaml
new file mode 100644
index 000000000000..77934a9baa81
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adi,max34417.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/adi,max34417.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MAX34417 Four-Channel High Dynamic Range Power Accumulator
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description: |
+  The MAX34417 is a specialized current and voltage monitor used to determine
+  power consumption of portable systems. The device has a very wide dynamic
+  range (20,000:1) that allows for the accurate measurement of power in such
+  systems. The device is configured and monitored with a standard I2C/SMBus
+  serial interface. The unidirectional current sensor offers precision
+  high-side operation with a low full-scale sense voltage.
+
+  Specifications about the device can be found at:
+  https://www.analog.com/media/en/technical-documentation/data-sheets/max34417.pdf
+
+properties:
+  compatible:
+    const: adi,max34417
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  vdd-supply: true
+  vio-supply: true
+
+patternProperties:
+  "^channel@[0-3]$":
+    $ref: adc.yaml
+    type: object
+    description:
+      Represents the internal channels of the sensor.
+
+    properties:
+      reg:
+        items:
+          - minimum: 0
+            maximum: 3
+
+      shunt-resistor-micro-ohms:
+        description:
+          Value in micro Ohms of the shunt resistor connected between the RS+ and RS- inputs.
+        minimum: 1000
+        maximum: 100000
+        default: 1000
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - vio-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@10 {
+            compatible = "adi,max34417";
+            reg = <0x10>;
+
+            vdd-supply = <&max34417_vdd>;
+            vio-supply = <&max34417_vio>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0>;
+                label = "ch0";
+                shunt-resistor-micro-ohms = <5000>;
+            };
+
+            channel@1 {
+                reg = <1>;
+                label = "ch1";
+            };
+
+            channel@2 {
+                reg = <2>;
+            };
+        };
+    };

-- 
2.34.1

