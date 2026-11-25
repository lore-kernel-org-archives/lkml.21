Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638158;
	b=5qRsVD7vSOO1NRgfH6h6U/pSRBw6zzCj/hLIbfl1s3yxUrpdpF6rLcdnpJ4C2VjgF5rP
	 5SUxJm+ySdpvYTn+EvIWJ0r0JqseJbkcXPEqdkwtpK44NiBEBrd2/aO7i1ySMi3gjAU2a
	 ouM1nJmIk1Oq3QtTTlymNwaxGTexLPi+tk3FOfsjGzxei6BJPphrsQzzLsvF/ew1IvGAb
	 z43BNBVn9/tLpeuCfuc6D21wbo4RRvLGabw2eRcWkQ5iAsQnZXLrqSlszv1VaIroniCck
	 x5PnT65QfbJinawX01ySWuk8SYhjYeAGgk2Tf6dD4irGgret59PYQUY91iMQebER4ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638158;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=0KrHNk+oD9Hb9TFBnf9d2wavExw3z/x/bPGkwY/46cQ=;
	b=XvzeIP0/sOja4K0k7rDwgwkFtqXc5DPTR/rRJ3JHYPu49HlqbkkTHNmm3WnV6ZcQW75m
	 vZlfCEBMls5vQ28kx7FxEBhJNx50j5IjtsZQs6dUyXTE1qrus1vj2MQWW2zx4tcKg2dO1
	 RCyC8myJpK3vCxgsF2iuEwmO9ItZz3b6h5vxmh42/xEEZvwJ4nIYtMl/F8k5ZwvtdYOlM
	 Wt0G6OG5KDqE56yip3VZO6pol6qXKysAmK5EQW+DWdmP8q9gOUxHKjG9wlYXDiRXuoAEY
	 EOJ7cZYu3mFdQDxy/HyT0Gd1dikINZuWxKcLHLcYOMflYe94I5jDmLRdXpWU5+a9mQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13382606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13382606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4e2ec4b42so33949997b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:22:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638157; x=1796242957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0KrHNk+oD9Hb9TFBnf9d2wavExw3z/x/bPGkwY/46cQ=;
        b=ABfvrs6ZqywgfUIhgjmtmPVY75kVAh04+IWX4s7wLLC/H8Cj11f6zZUpyShCo/QArq
         laxd56tJ7R43Dgqv8jDsuhtv3W5PGEfzzEpVfwIMLWqtvnnDhIwgRWK/LswGbfg/KYuq
         S9Y3xY8F4+2iQMAMXZQLrM2NNDoYTkxR6bH71gA5nyX4LEM58VLvD4b7Duj0/JPW9FO5
         OdCFrf7Cn4h/UAG+LJC4wWNin0Rl3C/wlJUcJ5P7lunoyUVjF77q3xlVGfpDYFKHoo/E
         N0PfD+8r9cBl2O3PrR89LbSDBcs4zdGxz+QAqzeN/soK9GW6xQ9pgL74A7KiZ0QeJDOw
         wTqQ==
X-Forwarded-Encrypted: i=1; AL+hErEIRNGG1MfK4UCMbiCvFeFYR48ugIpCJWqAByLQLrHRkVDOUuj7UwwFylfdtfU1NSZJBpJytnCIstH5GQA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/5UUmsV6GhuPcacnTHdOchCE8h4C5ZUTQQtv6l1tiN8tSSi5u
	E/Wnmj+CsI2+Mp17gN9JwCy8mh0fMIW6tt3RxJBwTrqogDhckA/91mLL1PfGiA0lTx0=
X-Gm-Gg: AZFdTZcjLpbKIJzyYcvM6xEYrymUMgdB2zU614rokjL5MldjaNFJ9UZEoEk8p/h5zX3
	K32yrg3sro5ULgLlLZ4iEf8uk5klIpfubdbLpBA0WM2IWPCHdrBGbIryJF5Lh1IFqF1msky8XXj
	VJtmTTzbTt4TGvqDMeGacTE+9iKUAdAqZFIP6ixKXzvEmL6zY2UX2GvXP3yQtpgbdPoIVi1UlL4
	OWjDqXvKJmdZzEz9MvbV27vb2d0WhodiWTvAhI3h7NG23rrDXwQG84tdYakAWlzhoJf+Ega3kTG
	SQhcO9GJyZe5mhX5hYrJFTQJvsYNQOcGkuS9bKtM23yMzS22yfvQc9MR/9m9cEb6wppDJ2f6pvD
	KSnG27PHOZFjbrFvY4vUjyErVk96klEEL6MEW0JiqQzcI2x0STaeZ5tpw7RIqND1E110OpbGnlb
	4Ut/1/xfiGcF/qCjyUmAKK/AZjmCKKzdbPp9f3BvFiY1kSXZVP0nn0pAAYUS0/FoBaRI15gX47t
	IkhQ26Rudd983h0yWiRlvsVtoKK40O+bKYK05UhtgM/c1wPoXP3/7SEYMeyGbUymSP5dVoMcjvE
	BP0lEzVpn0NXBIx3TgkRX5DKoX6trZWtG1/xZx8s/NWwJvM+0xjtYqMluVq470ayjbLeU7jPOS+
	7GpuniSAT8Jo74eyeCSYL2CsEHCOWZDVHEUxGpyfJu9cdpbSBGqjXJCuR8XXMn4/Lg2e45hklQp
	nAUMEDVuGNvb/GYDcwKSWsPMBCGflqYGk/ekVPx4RI1o9TxQ==
X-Received: by 2002:a05:690c:905:b0:8b4:dfc2:bea3 with SMTP id 00721157ae682-8b5204e9094mr93671177b3.50.1795638157142;
        Wed, 25 Nov 2026 12:22:37 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201bb6c7sm77074377b3.6.2026.11.25.12.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:22:36 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 25 Nov 2026 15:22:30 -0500
Subject: [PATCH v2 3/6] dt-bindings: iio: potentiometer: Add Analog Devices
 AD5246
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
Message-Id: <20261125-iio-ad5246-v2-3-8feeb630f0b6@telaak.dev>
References: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
In-Reply-To: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0

The AD5246 is a 128-position digital rheostat on I2C, in 5, 10, 50 and
100 kOhm versions. The end-to-end resistance sets the scale the driver
reports and cannot be read from the device, so each version gets its own
compatible, named in kOhm as for the AD5272, with no fallback between
them. There is no fallback to the MCP4017 compatibles either: the
AD5246's step is 1/128 of the end-to-end value, not 1/127. It uses the
same protocol as the MCP4017/18/19 and the mcp4018 driver supports it,
so list the binding with that driver in MAINTAINERS.

It gets its own binding rather than a trivial-devices entry so that it
can describe its supply and be an IIO channel provider
(#io-channel-cells) for a consumer such as dpot-dac.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 .../bindings/iio/potentiometer/adi,ad5246-005.yaml | 54 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/potentiometer/adi,ad5246-005.yaml b/Documentation/devicetree/bindings/iio/potentiometer/adi,ad5246-005.yaml
new file mode 100644
index 000000000000..9215de612a08
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/potentiometer/adi,ad5246-005.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/potentiometer/adi,ad5246-005.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AD5246 digital rheostat
+
+maintainers:
+  - Joseph Telaak <joseph@telaak.dev>
+
+description: |
+  128-position digital rheostat with an I2C interface. The compatible
+  names the end-to-end resistance in kOhm.
+
+  Datasheet: https://www.analog.com/en/products/ad5246.html
+
+properties:
+  compatible:
+    enum:
+      - adi,ad5246-005
+      - adi,ad5246-010
+      - adi,ad5246-050
+      - adi,ad5246-100
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+  "#io-channel-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        potentiometer@2e {
+            compatible = "adi,ad5246-010";
+            reg = <0x2e>;
+            vdd-supply = <&reg_3v3>;
+            #io-channel-cells = <0>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index ef6033c5edf3..b680f922d9bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16691,6 +16691,7 @@ MCP4018 AND MCP4531 MICROCHIP DIGITAL POTENTIOMETER DRIVERS
 M:	Peter Rosin <peda@lysator.liu.se>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/iio/potentiometer/adi,ad5246-005.yaml
 F:	drivers/iio/potentiometer/mcp4018.c
 F:	drivers/iio/potentiometer/mcp4531.c
 

-- 
Git-155)

