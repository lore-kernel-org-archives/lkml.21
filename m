Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378489;
	b=dQ3u/k2svmhzxtEnU5IHG3Z1xE9uAngkviZpUTYoEg+bOuxIg8hLQh8mSvbmKNhjFD9t
	 km+/AgPJ9UmFECEmuq686xEUWiSoXqhYaupT7bABoEOu7R4HqDL5LhJ64CxkTgUzMY81j
	 8PYpG+SHKA+RzxZb7rWzAQAYUEqWM7ct4wCcPiiYPlM4hvGEuZjBi510RWJ1c3KlCcanm
	 /Q5wypG/qeHlf7RBR3xjvSmWZxhs70iOTJARw45JYBXxeBi1I1VmZDTnK6nb1fvfKX9sc
	 smOkH2UtYRfZjMVW8usEFlGC08RupIQSmzz1BYLbBtFfCZUPqe7bn75w+cjJL+c9K1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qzgTBfgxIfUP5W7y/eXEWnvcFhXPlfOZGJqPedmbfKI=;
	b=q8l9uzv51CYvx8WQCAgoTD7AcUjMyjPyZ8JKLlwP56dsvESV7jyhGL1Dcu6PiKhgf8KG
	 ISPLD8qph9SBMB0DY4s+oCPzazC+qwuVhcB37mcAQehM6ljG1fIy4sJuEhtwTNEo+8ktp
	 +ogsvjCoMKfhHybblum7POADcLtNRYIIkNluXGAxvHybR5EBDIVPUYnCCkEAqTzR1bEIM
	 8hanv9MtNnrq07CePHMjz1cBmrdGo5z8XExH0UjfapLml9dMy+lhauohi6/zuy99dw5X+
	 MDagDw0NsYzgThua5+Q2BlfNzuH0QtUT3Ebpp2zOzB24VVXk5rj6NfWQmTlB4iQVgjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DoI2Aywa;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91325606A680
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91325606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DoI2Aywa
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so2952583a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378487; x=1795983287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzgTBfgxIfUP5W7y/eXEWnvcFhXPlfOZGJqPedmbfKI=;
        b=DoI2AywanOkTCcmIL9RteRdrA8iencCXt5BORqBbjeF/aQe3YOz5KZ+oPsQLZkqhLY
         7jPMKjFOYN39WbScEPYG5GaWztTBBc7qW6RoAOnpFqYFRHgAVR0R8h1BpBWug86oP5AA
         iVXFk00n3wJw+JEn0LMJDYFKCicaTA/eeZTKOtDXLAaA0vvZ78dhTAkSLU86/j5vjq9O
         /NvkJU3dIX4fTb4zGf47qyET+ypuP5MVAVeHcLeExijC87ClmXzuMNRDzUrqlESQ0W0m
         rt3BsUidLg8dXW4tQKzIe98w3vVU5QxAZDOJYUX7NUF+SjQYQqc5Ww6EvNwQNjt0eKkD
         yKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378487; x=1795983287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qzgTBfgxIfUP5W7y/eXEWnvcFhXPlfOZGJqPedmbfKI=;
        b=CbZ49+1fYfzDohybmZ6OHp+H1c+QP+7zLcSjzZ/rywIIsyePOvq29tXn3PkfU4IpBM
         zIDpDpbNKiICLax9CkeKur1lX/aiZz9fBn/wo1CX02Z0Q0+hKOxjZdexFjiYZ6RYJIwJ
         /ZloE4J4Sl1r5ngz/M3ienc+JHgpSe/Ev6tGs7TQVJPr9eFlXFqp3UhVr/7xuO7tkKdV
         +twr80pymUYrNsJIyae6o8x1xupVaNhVW3bVtPrg7C9n1kRyudfYt6jKbPnuATFe9QKk
         9XN3SNsS6sZ/KG6xIvg0yPbMkIJ3WKW7WqhnYDaG0YlA73BffeKQVyHSLQsAhN7QI82d
         670g==
X-Forwarded-Encrypted: i=1; AL+hErG3gYvQdiGuK+mTxRNDWWAFModuQFnRkrTENDhf+Mgf0tBBegv+9yxtiH5XL4AzSFwc+tjRcpYlSJlT0GE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LHI69AdTfRQwWpCCNq5HuFk9vR8nxmym3ayaCfLFBvpipI2gZ
	ZUNjjhKDhUW3KqewRJe+0oF7T+yhADTyl+iMSvafSJdtfNzT9bbhepcl
X-Gm-Gg: AZFdTZf6aja2+8ECc/bdBrTZxZtUv4o+2+o+W7+tHecv3BCIlc0yXlEGehVVTmdm3xc
	5qf9UQnEqgdNndQ6JriVmXM8YjmWcTRqz4gzUgVlzadJxHpWxQDaJDp8N5Oc2V3qaLU6hOKJjMK
	CrWTV2u06dhmFJrbKt+Ovs7AQ00NECLgqMUXXJ3YAisLDsltFGVegoRUycFkSzc9bbw6t+WNm7R
	dhS83OOrzEO9v4G/zvte4/XZVQgzeJtDUgicDzVvkZOjFUjJa9xW0xuHvkbPMPifv23iOfY7ZyM
	4p+CzsXzjutzBIO2HK5bBr7hHmb8dkXMw7gqXjQ9BtClLXH4uShNmK/sPjK9roavNvcG9QvDxzX
	lz5rfJduYNuSa/dgFsG4O7XHUhBKpJOyzU8tkVj2qViav+XCx0Cjgynlsi46JZaTxS+3KiP7CMX
	umkRUi9owsKbNRrFFg1wk2kqDz+lmlp3SZFEdhronxCEJUxIDue4xKWVkQUuF+xPv5vkIgG9JqX
	WR3TnM5sgklL+sGlDsXJuVpv4y1X4hGPfsMa0AfebUPJa+x3/rwDrCj8JMmBaSxBw0se62dmnbQ
	kfMRHjgZbuoAH3VgtfemTYTMpSv/TOUF4qPFydaghOMB/OZYYrFFyiY+OJ0B9mxaQqLw3HEMzni
	xubzdNeAvlw==
X-Received: by 2002:a05:6402:23d0:b0:6b7:a2d1:b2e8 with SMTP id 4fb4d7f45d1cf-6ba37e69e00mr5979617a12.17.1795378486939;
        Sun, 22 Nov 2026 12:14:46 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:45 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 09/18] ARM: tegra: tegratab: Add thermal configuration
Date: Sun, 22 Nov 2026 22:13:58 +0200
Message-ID: <20261122201407.23742-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
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

Add thermal monitoring setup based on Palmas GP ADC sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index bb5788b2539cd..cbf9b45284033 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/thermal/thermal.h>
+
 #include "tegra114.dtsi"
 
 / {
@@ -983,6 +985,9 @@ fuel-gauge@36 {
 			monitored-battery = <&battery>;
 			power-supplies = <&bq24193>;
 
+			io-channels = <&thermistor>;
+			io-channel-names = "temp";
+
 			maxim,alert-low-soc-level = <10>;
 			maxim,double-soc;
 
@@ -1011,6 +1016,21 @@ usb_otg_vbus: usb-otg-vbus {
 		};
 	};
 
+	i2c@7000c400 {
+		status = "okay";
+		clock-frequency = <100000>;
+
+		power-sensor@44 {
+			compatible = "ti,ina230";
+			reg = <0x44>;
+
+			shunt-resistor = <5000>;
+
+			vs-supply = <&vdd_3v3_sys>;
+			#io-channel-cells = <1>;
+		};
+	};
+
 	i2c@7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
@@ -1025,6 +1045,21 @@ palmas: pmic@58 {
 
 			ti,system-power-controller;
 
+			palmas_gpadc: adc {
+				compatible = "ti,palmas-gpadc";
+
+				interrupt-parent = <&palmas>;
+				interrupts = <18 IRQ_TYPE_NONE>,
+					     <16 IRQ_TYPE_NONE>,
+					     <17 IRQ_TYPE_NONE>;
+
+				ti,channel0-current-microamp = <5>;
+				ti,channel3-current-microamp = <400>;
+				ti,enable-extended-delay;
+
+				#io-channel-cells = <1>;
+			};
+
 			palmas_extcon: extcon {
 				compatible = "ti,palmas-usb-vid";
 
@@ -1546,4 +1581,95 @@ vdd_3v3_com: regulator-com {
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
+
+	thermistor: thermal-sensor-thermistor {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+
+		io-channels = <&palmas_gpadc 1>;
+		io-channel-names = "sensor-channel";
+		#io-channel-cells = <0>;
+
+		temperature-lookup-table = <
+			(-40000) 2726  (-35000) 2708  (-30000) 2683  (-25000) 2649
+			(-20000) 2605  (-15000) 2547  (-10000) 2475   (-5000) 2386
+			       0 2279      5000 2154     10000 2012     15000 1857
+			   20000 1691     25000 1521     30000 1351     35000 1187
+			   40000 1032     45000  889     50000  761     55000  648
+			   60000  549     65000  464     70000  392     75000  330
+			   80000  279     85000  235     90000  199     95000  168
+			  100000  143    105000  121    110000  103    115000   88
+			  120000   76    125000   65 >;
+	};
+
+	tdiode: thermal-sensor-tdiode {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+
+		io-channels = <&palmas_gpadc 3>;
+		io-channel-names = "sensor-channel";
+		#io-channel-cells = <0>;
+
+		// TODO: add a table here -25C to 125C
+	};
+
+	thermal-zones {
+		thermistor-thermal {
+			polling-delay-passive = <1100>; /* milliseconds */
+			polling-delay = <15000>; /* milliseconds */
+
+			thermal-sensors = <&thermistor>;
+
+			trips {
+				thermistor_trip: thermistor-alert {
+					/* throttle at 55C until temperature drops to 53C */
+					temperature = <55000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				thermistor-crit {
+					/* shut down at 60C */
+					temperature = <60000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map-thermistor {
+					trip = <&thermistor_trip>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		tdiode-thermal {
+			polling-delay-passive = <1100>; /* milliseconds */
+			polling-delay = <15000>; /* milliseconds */
+
+			thermal-sensors = <&tdiode>;
+
+			trips {
+				tdiode_trip: tdiode-alert {
+					temperature = <60000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+			};
+
+			cooling-maps {
+				map-tdiode {
+					trip = <&tdiode_trip>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
 };
-- 
2.53.0

