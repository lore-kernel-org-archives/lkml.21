Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432136;
	b=ctK3GSRjNSs+7RZBHoGDlsFoKRHTDX1jBl38iHnOLyMkzXFUjyomZ9xqSCTh5HCz588s
	 jJ3iC47G7jfjtJpSEC0EZsR3sk+qn7Orhq6PHch6wpMJvCAhu0niAmS+kSvuxStpk+f8L
	 DDVpsoCvIrEIIzwaEf2FpvggDirDIeAxy3tcplQslLF6Jj+dazTb81KG4Nhn8ZKzgQ+hV
	 oWVPw2UHGwZgSE5KU8BU5Mi3Vo72HwekJ9YmVDy35aUvllBercEE/aTcwgKXdGumH2nor
	 0gI5C0TKbaTpO6XFatShQZqfcxj/s1D7DRHvIlKiaz4ugsRFhV3qvhgAqg5w39tnm8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xPfVHiYNEgedGdsEEXACtNCGn8S+xuE6Ru5ISfJrNXA=;
	b=RraJIp1PG+ymGFZvoFNA3/xpmG5GQpqTwKYr4guiljOkMdXhdyrx2kaqgi9r1ZiA6aEx
	 /Im+y9G/vUgazpb2YQuBhJERhqvdJVoH+ZUPuReDFdHVhn99usA8kPJR3PZfhG4hfBC01
	 PcsT0WTq6WSwjO7nXQAe/UAwy82IQmEdFOM1KLkcIjz4erGfVEk1Mg5kHTkbG4kvXyw4N
	 s9/o8r2DoqOfWX/tBGUNZyQZ4IaUeLPLWQO/hPraDhq54xZYxHSn/BRvtdcqpDMQMlAMU
	 2Ug3pJ2qmdM+sPTPlYPAsi89QvI8PdIxVqjOdZp2wI9C5yhwen58MFOj4o81bOZKUEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GV3Ox3m/";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988C8606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 988C8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GV3Ox3m/
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b546061d58so7053072c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432136; x=1796036936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPfVHiYNEgedGdsEEXACtNCGn8S+xuE6Ru5ISfJrNXA=;
        b=GV3Ox3m/nwlScDSi01EojkTUY3OAbqwZCcsZyEc3A2ODjDkx63iQHWMPBypXLaUTdt
         vYXuXfgTZWM4Wt45ElJVAx4k6HmH+ATHBmBKr04VQE0xixKP2pFKqCpHKvNTCjBNSEyI
         cd6fpPdiLLgaHK2kNST1nJi0tKTbw37CW9QXC8soarFdkCGcU3UicgTNAW0QCFHTFzHD
         p7XT7/rZOK09ZHvbQsm0WIlxgtwIyQ+Wzlcmo/ErjYanKDDJB5TujuSnj0gOfUhEvUsu
         L+236Z2ijkpTolk5xRoNNPEXp4ru1FCx1VqOnmwz/zaD688iFhL7Xqt/HWC4bNA+T0Mf
         zKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432136; x=1796036936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xPfVHiYNEgedGdsEEXACtNCGn8S+xuE6Ru5ISfJrNXA=;
        b=hsouro6xv+MVi8z9qNTjZ/FR49NJhGcEf2STAD9EEejE3bxD1UW7x7pzXQIrR5C7GL
         K7l0pzuuhRNyLhMUmIO6GhnJ6Y6mzD5sIrHZzvU/+OBesC40qXfSGmZST7Fm/rROytsR
         6AztGGLT2juv5hyoDVZ3qpmZG7X3CvgpDFGZ0elq+HpCT7u0Zmn0tQyzApAixbRG+r7O
         MCD1aEg55JpfUCOVDXo6GHl94YKW9ZDeDrYX+NgrpaSoYFoOuaOV/OEfi3twgaUilKdE
         OWRNOXVGI9dPTucEpa4d6XI0sWD60DrTQcj1YFG3fin8pMfmXxiad6yT4RI7/Na1zjMz
         YvyA==
X-Forwarded-Encrypted: i=1; AL+hErHkeS8nEfYhyu0abeWthAFEV4ElggKt/3t1sxpRbI6uik8mfJTOe9UtwfRBvRJRAwptnuoJZylPDTbwaD8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UsB4ZgPOrI3dVKqxhGLw4hEtYIgL8Snj8e7khm2HuiC5+5JDO
	qhLoWIYeYxr8CoGdgppwG3m/hHCoBDlTv+IrNDFD6sEETeNupPLuZZYo
X-Gm-Gg: AZFdTZcFoZc1/H6GTvwlw08rQTAPYa3zHqE+9/nkwvoGJ34MeLWnhI2fXONF97GdKhC
	gAJWxoO+RTFM1sGKkItdei2NYhGQb/Cet5IuTD2dyS0+QFp/4zIUghvoxSTJ7+Jwii/GharmUb4
	9bsN/pQvn2gaCLQYwlbBdHw92dVq/EYhnKo2kh0lM7BHkciEbXDc0vmtTSiaa7X/0P+TmKFSoyR
	2fMpiQe5d8SJH83yrjFkF+7FKCGeRPmpI5NBVfnmipsuoY+aZwT0gO9bdzYV9TwTg9cMpK7vI0C
	bA+6Gvx4GkP5K8xc4luZZxp5rLKQBvBipcXHAEMDqM5dwjuoNana8CdZD3sEZape7oUNxgFzJao
	QFJn18tuhYL8HqhpAK3EkhbiDI0j6u8Tqx+smpyR+YQ5htOFYSLkMq6s8Tp2VtogYNGvgAzKjtW
	rrHREJy7hQBfdxB1qA6kET428wg4MEVyiAz9550/9qK9FHYOQfUY++2E4f1V3+5dnr0HEV4mTSY
	K6wJrVPd8gQ9gFZ+8GiAb8mIpVKcZhGN+qfeHpsJA+7oMQNu0TAUhYdn9NC9ouWxsD557Bk/toe
	u2qtnbgzIu/x6P3zwX1aGQ9Q/yQf3o6QZOSYsLjVOFMeWg==
X-Received: by 2002:a05:701b:2704:b0:1b5:4f6d:8277 with SMTP id a92af1059eb24-1b5568e78b1mr11025822c88.26.1795432135606;
        Mon, 23 Nov 2026 03:08:55 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:55 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 18:08:05 +0700
Message-ID: <20261123110805.119610-7-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

Enable the CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10
rear camera and Samsung S5K5E8 front camera on Xiaomi Mi A1 (tissot).

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
index 8ba7982fcd81..40a14301ee3f 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -271,6 +271,20 @@ headphones_amp_default: headphones-switch-default-state {
 		bias-disable;
 		output-low;
 	};
+
+	cam_sensor_rear_default: cam-sensor-rear-default-state {
+		pins = "gpio33", "gpio39", "gpio62";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
+
+	cam_sensor_front_default: cam-sensor-front-default-state {
+		pins = "gpio129";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
 };
 
 &uart_0 {
@@ -288,3 +302,103 @@ &wcd_codec {
 	qcom,mbhc-vthreshold-high = <91 259 488 488 488>;
 	qcom,mbhc-vthreshold-low = <91 259 488 488 488>;
 };
+
+&camss {
+	status = "okay";
+	vdda-supply = <&pm8953_s3>;
+
+	ports {
+		port@0 {
+			reg = <0>;
+			csiphy0_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&rear_cam_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&cci0_default>,
+		    <&cci1_default>,
+		    <&camss_mclk0_default>,
+		    <&camss_mclk1_default>,
+		    <&camss_mclk2_default>;
+
+	status = "okay";
+};
+
+&cci_i2c0 {
+	camera-sensor@10 {
+		compatible = "ovti,ov12a10";
+		reg = <0x10>;
+		clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		pinctrl-0 = <&cam_sensor_rear_default>;
+		pinctrl-names = "default";
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pwdn-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+		vana-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+		avdd-supply = <&pm8953_l22>;
+		dvdd-supply = <&pm8953_l2>;
+		dovdd-supply = <&pm8953_l6>;
+		rotation = <270>;
+		orientation = <1>;
+		status = "okay";
+		port {
+			rear_cam_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy0_ep>;
+				link-frequencies = /bits/ 64 <216000000>;
+			};
+		};
+	};
+};
+
+&cci_i2c1 {
+	camera-sensor@2d {
+		compatible = "samsung,s5k5e8";
+		reg = <0x2d>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		pinctrl-0 = <&cam_sensor_front_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&pm8953_l22>;
+		dvdd-supply = <&pm8953_l23>;
+		dovdd-supply = <&pm8953_l6>;
+		rotation = <90>;
+		orientation = <0>;
+
+		status = "okay";
+
+		port {
+			front_cam_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&csiphy2_ep>;
+				link-frequencies = /bits/ 64 <418000000>;
+			};
+		};
+	};
+};
+
+&pm8953_l23 {
+	regulator-min-microvolt = <1200000>;
+};
+
+&pm8953_l2 {
+	regulator-min-microvolt = <1200000>;
+	regulator-max-microvolt = <1225000>;
+};
-- 
2.47.3

