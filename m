Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447731;
	b=J0x0kwzmqkjJYXRbY97u85AmRwMfjDrCCUWgoWVPQzosn9oRbPWgI2U7p0/yXWFfciWY
	 /uA6E7h3DEfvXxZ7N8N9kPTg+pE3/7x6kAn0Om/iDi+4vLykQXSMkJHKzMcoyIt0CAyZZ
	 5UsOGCfDpc5pGqcdeUtfjLmSiFSxGIfwACOCp0WQk3fMjpHxKwuk3cZ/mgYdCCH5y6iQK
	 5SZshbRpOnDrX+UThMjaEe95s7JYAo2xIIIwaaaf+Gz8JIqPQ7tt2sLDTWIq/IhW0wNY+
	 jhHLNUF05YbjcSmITCa6e44phu4uDGpoRL7ugWH0+S47awO+Ckrddt1/3JVO9jJQwxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xjPkJu8X2nBBkbwoz/3Q9ZztknethPFV/hq8GuXmGeg=;
	b=mIk9vhYPReJN2TZvzjBH/U0zO1cBEsH4xbHlJLJWq9xwHYd8Y6WjOAYGYY7afCeGPJVW
	 V2C3TMRUAdz1FqaDDzE8rdV2V2g/sEQDECZX4dyx1CRvhEviDkLU/H2lrFTg/t65TWjLw
	 5C4G+Z11BqfgViykmkpuLUcpXcoIIg1yfaE4Bpqpm2cpDFidE6i3WK1SjQB+tUvQ7a9p1
	 jt8G0bvOfSY4aW5CTWzC6Ho8Ko0wNnBheOor/L49BdERb54NIn3cLCRdbDh4irEdCi7rQ
	 vj9T/X+vikMo2H4J5fpgQ1rZPLJ0W/x8C/gQO5T9BEqvxq8RILTUuc/piJiNFt2t1Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qaN8tz2s;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978B9606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 978B9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qaN8tz2s
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38587f3de36so4140373eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447730; x=1796052530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjPkJu8X2nBBkbwoz/3Q9ZztknethPFV/hq8GuXmGeg=;
        b=qaN8tz2s6QjWaNTQiTog+fsjkYaL/oPgbb/v7AnoTrd8bU0uoUSwKkNT8dzhR+i73u
         icf9jPTeOWH8XY+3QBmRu9W2BLgFcMzVH0jzRUTmx+5K480YeSVMjIMh6HMIEMLsuKjX
         luCitgg41QLf0IW5yF5mKQ2rtXhnDhkUtd1hM1xT84fobvegCRgTXbKlMwK0Ai5GlV9g
         9YRYCVwNlrXlDd8JsjOTLcLBpPZVBuznpXMjgSwx3qrxmUHZln8iwn54DRgbmz6Tt+jF
         IkErDcjC2ELpglQszvZhQ9f/WhdcIcZ0fw3024FJMxh3bATjPaEMfhnF7WPeDWxuJXz2
         tWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447730; x=1796052530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjPkJu8X2nBBkbwoz/3Q9ZztknethPFV/hq8GuXmGeg=;
        b=V5cKNFI9sRQ4kUOgu8zp55+WP7fnoRivc4VdjxKcooSkzBEpwgLyVnZSGWPb7+OMFg
         t1JPn2ZTZqrrsHwrIQ4ilV3/LJgF2XuBXIULAdEXZmRffg4JHeOgpMeXmWp2pL5hyGBT
         d68kU5lRQffF5UA5uxKkt9LhpZmmhQ0WWgksFJQ6F3BL3zjn4g4akCtx98CTz9x+z+lE
         xdrnkMRopa7nDb/S/GlL5/t0hTOb8FROLKl9h7RjXLpooVAqTKnXHz/HCwhtp8xqZnPR
         6H76ty8LzBTjl3bDJskopYaXGPFC7M/RpRMS14n2VKpY7JDjC+ZKxI6hRJ7gOXldkDS2
         ONZQ==
X-Forwarded-Encrypted: i=1; AL+hErHHHfgVJTQ36ffyttW2pq9+pmdsgR6GRsHoEhX2pJFhVXgHd2TsxqX2XtRUdriGvtooyIglfcE+6IOt62w=@vger.kernel.org
X-Gm-Message-State: APuU4Z89rEO+vPJu30OABlds6BBnFpmSz47O1I8OhsTk26NWjmy+gFri
	NBVahTsTuczPz4wxlMJjNoeRvkM8h0eUsdcOf6XpmcQhP5atHjSBItzB
X-Gm-Gg: AZFdTZeiUHSgyG5LJgBQ1P3SeNOE4lNzxXCxP3jn+kh9KnKFTvWF1I77jB76nw+DFB2
	eRtA7EHOjXV5flJvWhJHSWdIATh2XFU94K+UxpiI+xktOwiwZi6atgWUt/MfsFjSI/uLUHLt0O2
	9tRMS13QfE0b6SMhJ1YydAQnwt+pCXgOiC+27/HZbB8MtoQeN2vSP6lXs1FiTxPeytWKJZ/guDm
	3DPu1XU61RptJbqxb5S01hs9HDHfItkJpJGCXFWSUND33+ZxqEzBN9v2r5gt13Iql9kdW03AZY0
	6ewgI6ahSQPcvIj8hyF3svCtCrt9qX6i2lAjIBqGC3Bq0XGb3ZEWZ3AkJK5UbivY+cmYkDSzTLt
	BXIpzM7xBIxFteHzTSevHUZXSqQlxT0Nx33BR9V56wS05DAWMRDyC3LdriX4iFFFA1cLxWJLyee
	GD5AQu17+1DsMSrQZdmJBuYG1GJgOZKQyVymqMNftNPNmzinxfrsJfJwNi2bq1QoL/dp19eFz9/
	3zYSvIB8qqIEHNix3YCXqCFpLH3XzZvA/DTIeZuFFw2Jfo9V01dYJNogoMRL6Gf6EBh3FbUVyVo
	fsF/JtIKkKhKcKq8nvHVu6NDXgxWdZUvaw/l7jUMv8J7Sg==
X-Received: by 2002:a05:693c:42d9:b0:386:bc40:1508 with SMTP id 5a478bee46e88-386bc40185bmr455177eec.14.1795447729747;
        Mon, 23 Nov 2026 07:28:49 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:49 -0800 (PST)
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
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 22:27:22 +0700
Message-ID: <20261123152722.168879-8-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123152722.168879-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
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

Enable CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10 rear and Samsung S5K5E8 front image sensors on the Xiaomi Mi A1.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
index fccb9c4360ca..e41cbd4d01b2 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -74,6 +74,104 @@ vph_pwr: vph-pwr-regulator {
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
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&rear_cam_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			csiphy2_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <1 2>;
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
@@ -302,6 +400,27 @@ gpio_hall_sensor_default: gpio-hall-sensor-state {
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

