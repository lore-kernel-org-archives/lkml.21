Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787180;
	b=4E+VQUK7PkhG5Rfb8JFllwksj/KmkvoSt2UgchTysSDZlVucK9zsPTlxCgQ+wHPVKLAS
	 Y56TDs/w2fG58nxu7mFjFmM97Q8cUzcZU1lUlB/u01w/2apd3R24ghBQRqrHAZwnFcOUG
	 +KMIBPNHCAiacxbDFic1xpXnNsaf1YA3iffXoHqCP/ShLFtQTFdgNzLOQhiwLU5bikhEw
	 XKO6kDliFmZX6lmvXekKYSfhJQJqwe/ZhKvNLVXxCasdbc62Q03iL32zzfl5z7QCZkiWh
	 U75qwfJkQeetRF/2VeAx3APmCC9XXhiXPICb0X8yYL0Mb2GcURlY0JytjUzqIYU3V2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xR4yuXTQOAyEDilHAtowb56eXirOM8/fc1liK2FFiQk=;
	b=if6oPOS+onBTQtalVGluoypYZyqm1MlhEk4zyrUpf7OG619AC7oqZeCMowwzgwAp/8fA
	 FqQgkDjfImVlTNmFcGpemO+KPLObstLJcuBooOPVd0G526q40NBDBKzBPf2ZVXpgjuHOC
	 B9OQWxVpLHlWK+tH0i5MI72kuzXeS8QfzgLg/uCzUSAJrTmg5vTCU8GNhReAGwZf/dVUf
	 HLMsf1xRUkKGUNyHiHIkqwp2tSzDbRo8OYF3hOYkSP1+kXq3k5sYcVx52VtYeylvLV4eA
	 NklIQF2wVHQyJ6KK2LZHPMr5R5c2eh6ImudMBsQUxc+djDoKjJMSlWF+x2FG6H+tCQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AGAU9Liq;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC16606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EC16606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AGAU9Liq
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f01f296937so60799125ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787180; x=1796391980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xR4yuXTQOAyEDilHAtowb56eXirOM8/fc1liK2FFiQk=;
        b=AGAU9LiqypIjJWbA2RTVEHqWz5tvzMFqIsD8s1V5CDz+EW7FfM3OriPXCqsaoNZLgQ
         nqGFaMjS4ne/xpB5yy/LZzPc1VcmsSa0irm6uqtGhsWDLTs8bXCwRpSK1Gv+NiCbX1yj
         bi3khFFKtSsb9eaQ7bGRDEvTyImK0razii0vhPgaANtQwHbgXf8J9+0yklkltlc32nf2
         Sq6z5R+lQF0DYvJi7G7iwrQKd4irmMu06/LWJtdZWchrqPOtPbHPDoygyDLNUyc+t6LP
         4bCmzj8Rg3nk5ZvfJi2xUVwYnxm13ocBw5dvFeK9vnGsPNppJGPRoRFwt76RQOhVgll1
         EaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787180; x=1796391980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xR4yuXTQOAyEDilHAtowb56eXirOM8/fc1liK2FFiQk=;
        b=gpcRY6txv30W6LM1oz0DMH7M9bE8KApsysP9tbBPwKAMoU3I2UMuUtMtOd0+9+9qje
         bcg8lFx7WdJcSLGB4Lc7pLd8rHDENA4PNGbTG+4MkFpxdmZCw+4M+ecfdMPWvnZLU796
         qU9ZculnaopzVBN1KtHOh819uLL0NKwks4yCxA0d2mqgXGgEBAIwJ+g60metiiA4LJkv
         P+Kr1YNufAxZNyHx1YY4HwvKQ5C4JnQlKnG/OAMajMd/lYYmt2vOM1MWBNLPsO6arwIB
         2gSuPhE5uFefxqA5pyJD/YI0nlmz6aMidKvud8cPQovqG4frfoeXg35x4tPrnaE2E+Vh
         Xkuw==
X-Forwarded-Encrypted: i=1; AL+hErHn3Tp9EtRCN+WCY6U1eY9hRV284QGNUI3ei1GdlfmUfjO1jQQfioKEPHVZU/pxenl6aJkyL215OBJSyrs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5G60Y5Wl7UJovMO2fSNJ7S+Y5LWGaIbD3DYWL0J7Jd5HfRZtG
	GXtefO+3d9NCiejwQ2n2Hc/I3vQ0zTkGDrnpF4ZnqjDt+Qrpe2Qx4CvZ
X-Gm-Gg: AZFdTZcjl3CsS38eaqQO1gt6Ddr7HpHT0yUYOQ0iUczQV5qZ00tYWHNDXStxUohio+j
	sG06cMa4VeVvuDCSHQoVl+SCRnEO+Rk3jrNp7yO0HXp/+qZTpkL9RBGNXGOEA5M9IwK/W4i5VzD
	MWD1+xfCn+MBdc3CTwGRCdHHIIQlSqYHnn1xd+BnD0n1Ml9cA9AH7TQWhHbLCxOs26B0p4oP2gP
	kmWYHBs+K1G5dPfhystsUcbiSzWhyj0gioneZ84b1Kwqt8XxLz4V/v/IAuGvKDWG1PaL236lA/2
	LOhGxfZ6JGx4g8IioAMUBsi2hyMTl2/uwjnCSNZCth1IFZHou3H1OtY7RbdjzjELRkLVncaTVD4
	Lt0TSlXkO1rv8o9OX0tNTjdThoJntjmlRRLyUQ2c+A0VC00YZeE2DxAJMtzqydLHJfla1X7xulJ
	83GiLP2flFWDfpCDjvsahhiA7IrgnClcsAsvPzbVLTNxNIvrbRR3F62GA99IDwOIXWaFSllQeGD
	2KHygxQLnac/5rFquUvF1TfGsn1QRHGEa1OwEgF/gubzV7ZC4cA90qKd24patL5LmkCHQqGKQQQ
	ZrGf16Q8QeHe5B5VMXcqauzmGr4TJWEJluwpwue4egFpBwM=
X-Received: by 2002:a17:902:cccc:b0:2f0:d976:651d with SMTP id d9443c01a7336-2f0d9767d6amr88871745ad.14.1795787179570;
        Fri, 27 Nov 2026 05:46:19 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:46:19 -0800 (PST)
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
Subject: [PATCH v5 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Fri, 27 Nov 2026 20:45:07 +0700
Message-ID: <20261127134507.125513-8-hikmahgumelar@gmail.com>
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

Enable CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10

rear and Samsung S5K5E8 front image sensors on the Xiaomi Mi A1.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
index fccb9c4360ca..d8db3567fd36 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -74,6 +74,108 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+	vreg_cam_avdd: regulator-cam-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam_avdd";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&cam_vreg_avdd_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&camss {
+	vdda-supply = <&pm8953_s3>;
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			csiphy0_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&rear_cam_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			csiphy2_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&front_cam_ep>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c0 {
+	camera@10 {
+		compatible = "ovti,ov12a10";
+		reg = <0x10>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		assigned-clock-rates = <24000000>;
+		pinctrl-0 = <&cam_sensor_rear_default &camss_mclk0_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		powerdown-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&vreg_cam_avdd>;
+		dvdd-supply = <&pm8953_l2>;
+		dovdd-supply = <&pm8953_l6>;
+
+		rotation = <270>;
+		orientation = <1>;
+
+		port {
+			rear_cam_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <216000000>;
+				remote-endpoint = <&csiphy0_ep>;
+			};
+		};
+	};
+};
+
+&cci_i2c1 {
+	camera@2d {
+		compatible = "samsung,s5k5e8";
+		reg = <0x2d>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+		pinctrl-0 = <&cam_sensor_front_default &camss_mclk1_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&pm8953_l22>;
+		dvdd-supply = <&pm8953_l23>;
+		dovdd-supply = <&pm8953_l6>;
+
+		rotation = <90>;
+		orientation = <0>;
+
+		port {
+			front_cam_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <418000000>;
+				remote-endpoint = <&csiphy2_ep>;
+			};
+		};
+	};
 };
 
 &hsusb_phy {
@@ -169,6 +271,7 @@ regulators {
 		vdd_l4_l5_l6_l7_l16_l19-supply = <&pm8953_s4>;
 		vdd_l8_l11_l12_l13_l14_l15-supply = <&vph_pwr>;
 		vdd_l9_l10_l17_l18_l22-supply = <&vph_pwr>;
+		vdd_l23-supply = <&pm8953_s3>;
 
 		pm8953_s1: s1 {
 			regulator-min-microvolt = <870000>;
@@ -302,6 +405,27 @@ gpio_hall_sensor_default: gpio-hall-sensor-state {
 		bias-pull-up;
 	};
 
+	cam_sensor_front_default: cam-sensor-front-default-state {
+		pins = "gpio129";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_sensor_rear_default: cam-sensor-rear-default-state {
+		pins = "gpio33", "gpio39";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_vreg_avdd_default: cam-vreg-avdd-default-state {
+		pins = "gpio62";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	ts_int_default: ts-int-default-state {
 		pins = "gpio65";
 		function = "gpio";
-- 
2.47.3

