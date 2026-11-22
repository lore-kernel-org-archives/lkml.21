Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378506;
	b=Gk1fp8vsrl64O9Bo27U/0KHknr+64dBALS7uehI5aJx0P4lD8678nBbRN0wSpb6K8d/v
	 R43y1c6tu9XSIscD90HwlsRl7vkvUPBKC9xCL1ZX899BQoc3sI8BQGQ+bUrixXv0270Sc
	 3DQCZHQvX2JXlNtux+/fXbdOramfgPZU/BsvJVTVmtw12QIfvvFUpKV1Ti6EkNEOrivhz
	 YZk/6uuSFNNgQ8RVIcPtA3/iP06qJ/W+TvZZFGdrd1uQerJgZ/U67qgyLzSqlQvcdiNHf
	 FhEG2Ff+PXZf/4ERsQx+GU0dCkyGGFg5eqWoaBFKDtanjkFPohcRbkdn7KIRSjFiUDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YfTCUFkmVonj2+Ucb0O5WgQRRtR1yvF0haaOsUxTjRk=;
	b=owA51NQwofK1QHWA7z8U0uxwmgPeONBY2iKrLxHra3OTj/0J1vMty/RS76u5zUL82zLI
	 ZZyWm9hqP/WVPj6DTCbv+PSrswmJRUXLMO5pEPOwB8vUg7jkPQlpMBqVnRshcIcPcol6u
	 WNuvM2pvOQtZkCoFD+M47Z70sG3cpBXPy6f3SAGxsm6sjUTbqLQ+Yxf5jVf+BobnjArdN
	 3z9pr4Z6o4RXF9mDDlYph+zd8Aujdp9WKcTNlgPpVwb0eg495iYqfdxXbFsLrygrfSjGI
	 fn5O7Q1R5MqTqkYC7Lt2q0ODxj179egprJzLIzw3JIyEMKy8loyKxlqyUdxmuK+hWhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4SXdbiY;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA89606A33E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FA89606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4SXdbiY
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso3143109a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378505; x=1795983305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfTCUFkmVonj2+Ucb0O5WgQRRtR1yvF0haaOsUxTjRk=;
        b=Z4SXdbiYfkuPtgwH+tNzW+Vb47lUeDOfaNR/2hDbdcdZ3Nu2hbwnMis04+77sBl87d
         fA98IX4DgiHSqwvvYZTK/x38P6u99PUdRLDFPaKOu1XgO6pBYpbPMSvTw5q7WI5VmnyH
         HqD1R5Y3PMGU4e4S0+XSSsTQjW3KY+t1pxoRf+XgAd8oF/R1EG8b+XIjIluQDGzJA8vy
         g1h69nok9HmOTL27lnrWkXW1qa41xMfhQyoBwX5W4IBh8vPx5d2NwrSDJrp5mk1ojlKK
         cFT7h6ISM4qPXILaxjb0O18k9kdmWifxdI+DlcY7SWo3rC3Dv2hQnLzTWZHpmZX9eGCQ
         1WQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378505; x=1795983305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YfTCUFkmVonj2+Ucb0O5WgQRRtR1yvF0haaOsUxTjRk=;
        b=EUzc+xfRCP27oiurZOrRCS58D0zOrX2kMFNniZfPRyVKK/2WSbU4I/U3+8q5HHqvAG
         0nk3eYQuC8SOvHukAQAPXeMmAwoJIXOd4nyNtH6YY/28vdVn83q8HdOr2CQiGd6G0l19
         a771doRZIYkD3J+aTOaRYvek4cYUNi8ss+xZ6AMBHF1CufxTiSt54za626uEQuTxYHkM
         KgGyRQ8b3lGb3kAAu6Lu8r5ubKAovDKK/EJwKr6X/IqNlQ607IQwtb7YyDzox5QRm1jy
         4rQBTb9pTFylyHATTByIWqwtsSh2fT3PZJNpepDKqcVCl699c7Toq3o6AdA/xpnjrQMB
         I4Mw==
X-Forwarded-Encrypted: i=1; AL+hErGNFr3A7nIqTh1/SWytnsPF2RHgVV/jySjWAqPubDFZFGRygKcL/MC0YDLcyr3Zw4WjbcTG6K2sVN3urkc=@vger.kernel.org
X-Gm-Message-State: APuU4Z92FeKhY1RA/FHmS9DYDXKIils38ELfLzVzIIJBnJMu74jLptew
	9aw1YsTnyg3Z5nALi2dTimD3zEUn1tqHON130Q10pf620ghtzdKhlrjYqSD9Yg==
X-Gm-Gg: AZFdTZcrGkvbTw6LdGBOPEh7u2w5ntQj5aOKh1/xow+YZMp/JlrpwtitTvy3iCErLVi
	zG4FnCExkOUJpFa4LJ3gHG/doWlUlU+uEI55y8tK5QOpwY0lrnYvQTmu97WWQlfLy1aPPzU2mtJ
	tnHHY0WWc5bzXjpTjKfG/rLq8um+bDSDmfso4WiMHCC3BmJr8Y/XqnudOElM62sPttCMvE2v6Fr
	UovzwPId1Bs6ITVITn6nKtMOvwpqXhyBfWKutHQvBfYwGrqCdPtst/nl1ZSTBuqi8fnZmq3yxiy
	mcfQCvR0SCqdpZy2NBFNU+zlnmF0zrNORb09DLdpYKkOxZ5PoKaz3Jj2JcLaihiaCUIuRirTwue
	mbnjE9T5ssZGIjT5Qy+jd/3wgrAeMCtcFq6OZs8g4ImHjBhAszflYWko/lJcO/v1tKBQDubVjzm
	TWRAVDE63NQ29pUwSiBQYQo4EXkXvlk0KInG+dcEZTZ3YBmgpRNheoZcckahgDS60yfGtsUbjss
	IdgYWb3QS9IEDjB/V4qin+4zz400DB+FqygLvxAdeWDv8dT/Jnlc2ovBaRgLJ9/SsR2AYIB//uo
	shZAeci5AeJBwldAkBQJIo4qRTvcLE4xTgiBMwh0fUr1UhYcEex+JE2Kgg/MP9zz/ey2l8+iIjf
	K+xpkW9omGQ==
X-Received: by 2002:a05:6402:1941:b0:6ba:7bee:e0b0 with SMTP id 4fb4d7f45d1cf-6ba7beee4dfmr2785151a12.8.1795378504730;
        Sun, 22 Nov 2026 12:15:04 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:15:03 -0800 (PST)
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
Subject: [PATCH v1 17/18] ARM: tegra: tegratab: Add video input configuration
Date: Sun, 22 Nov 2026 22:14:06 +0200
Message-ID: <20261122201407.23742-18-clamor95@gmail.com>
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

Add camera nodes, VI and CSI graphs, and interlink them.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 1e9df07dadc98..99f0d1c345e63 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/thermal/thermal.h>
 
 #include "tegra114.dtsi"
@@ -61,6 +63,91 @@ trustzone@bfe00000 {
 	};
 
 	host1x@50000000 {
+		vi@54080000 {
+			status = "okay";
+
+			csi@800 {
+				status = "okay";
+
+				avdd-dsi-csi-supply = <&avdd_dsi_csi>;
+
+				/* CSI-A */
+				channel@0 {
+					reg = <0>;
+
+					nvidia,mipi-calibrate = <&mipi 0x003>; /* CSIA & CSIB pads */
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						csia_input: endpoint {
+							data-lanes = <1 2>;
+							remote-endpoint = <&rear_camera_output>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						csia_output: endpoint {
+							remote-endpoint = <&vi_ppa_input>;
+						};
+					};
+				};
+
+				/* CSI-B */
+				channel@1 {
+					reg = <1>;
+
+					nvidia,mipi-calibrate = <&mipi 0x00c>; /* CSIC & CSID pads */
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						csib_input: endpoint {
+							data-lanes = <3>;
+							remote-endpoint = <&front_camera_output>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						csib_output: endpoint {
+							remote-endpoint = <&vi_ppb_input>;
+						};
+					};
+				};
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					vi_ppa_input: endpoint {
+						remote-endpoint = <&csia_output>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					vi_ppb_input: endpoint {
+						remote-endpoint = <&csib_output>;
+					};
+				};
+			};
+		};
+
 		hdmi@54280000 {
 			status = "okay";
 
@@ -1270,6 +1357,82 @@ power-sensor@44 {
 		};
 	};
 
+	i2c@7000c500 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		ad5823: coil@c {
+			compatible = "adi,ad5823";
+			reg = <0x0c>;
+
+			VANA-supply = <&avdd_2v8_front>;
+			enable-gpios = <&gpio TEGRA_GPIO(BB, 7) GPIO_ACTIVE_HIGH>;
+		};
+
+		rear-camera@10 {
+			compatible = "ovti,ov5693";
+			reg = <0x10>;
+
+			reset-gpios = <&gpio TEGRA_GPIO(BB, 5) GPIO_ACTIVE_LOW>;
+
+			clocks = <&tegra_car TEGRA114_CLK_CSUS>;
+			clock-names = "xvclk";
+
+			avdd-supply = <&avdd_2v7_rear>;
+			dvdd-supply = <&vdd_1v8_vio>; // vdd_1v2_cam
+			dovdd-supply = <&vddio_1v8_cam>;
+
+			orientation = <MEDIA_ORIENTATION_BACK>;
+			rotation = <90>;
+
+//			lens-focus = <&ad5823>;
+
+			assigned-clocks = <&tegra_car TEGRA114_CLK_VI_SENSOR>,
+					  <&tegra_car TEGRA114_CLK_CSUS>;
+			assigned-clock-rates = <24000000>;
+			assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>,
+						 <&tegra_car TEGRA114_CLK_VI_SENSOR>;
+
+			port {
+				rear_camera_output: endpoint {
+					data-lanes = <1 2>;
+					bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+					link-frequencies = /bits/ 64 <400000000>;
+					remote-endpoint = <&csia_input>;
+				};
+			};
+		};
+
+		front-camera@21 {
+			compatible = "ovti,ov7695";
+			reg = <0x21>;
+
+			clocks = <&tegra_car TEGRA114_CLK_CSUS>;
+
+			enable-gpios = <&gpio TEGRA_GPIO(BB, 3) GPIO_ACTIVE_HIGH>;
+
+			vdddo-supply = <&vddio_1v8_cam>;
+			vdda-supply = <&avdd_2v8_front>;
+			vddd-supply = <&vdd_1v8_vio>;
+
+			orientation = <MEDIA_ORIENTATION_FRONT>;
+
+			assigned-clocks = <&tegra_car TEGRA114_CLK_VI_SENSOR>,
+					  <&tegra_car TEGRA114_CLK_CSUS>;
+			assigned-clock-rates = <24000000>;
+			assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>,
+						 <&tegra_car TEGRA114_CLK_VI_SENSOR>;
+
+			port {
+				front_camera_output: endpoint {
+					data-lanes = <3>;
+					link-frequencies = /bits/ 64 <96000000>;
+					remote-endpoint = <&csib_input>;
+				};
+			};
+		};
+	};
+
 	hdmi_ddc: i2c@7000c700 {
 		status = "okay";
 		clock-frequency = <100000>;
-- 
2.53.0

