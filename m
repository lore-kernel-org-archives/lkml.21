Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437407;
	b=jpoxsdpwudoK0jbfTVQU5r2uVGdEG+7Oqsch70tDnEjNuz7EBYrSvWAtko5zv4k4rO5q
	 Aof8JmtGzQoqlM69WtH3ZkS9zyyg/WiDeu+6AgA+Wqxy8OmmwPezS2G+5AeRSmxDSrgNQ
	 AlsjBP+KoRr4Af+ldSY+SyFLj/WuGmpHXX4p8lqbkydnIrzRGg13w9Dxwq1yV0YRz6k8S
	 sXMnsS0PnbSbhAEb9/4TfHMKYLKdvNLuwfya13Xl7PpnAx2q9ohg78Y1qbEpnyCwCsKrX
	 LD3vZGJ2u6NByDU1TwbC0nsVGsXOdDNzVSZU7v0M9EfKfoOgcWrzjWTUYv5pvrFMKvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZZRwBHNibaWlFnpiuuEMtUB0YA/t47H+l2X5jKIQ1Dw=;
	b=vF3Z3/9GzKbWckbi8BhjBxi0p2FfBKlXapRH8MTXdgMspyfUCw4GKOJqKhMgPrN7P2Hn
	 Q4ysj2rizMnrdnDBMAHqNRAV+urt0DP1cxNLJMWrmCYP60XnbqZ+AixoXR5aGUEcefXsZ
	 qbbWPYXGvX6INawF8dexRC/aGFSCjosGJNiWj7Zmg19oZf6mVdO5WbvBslRproVpFbsRz
	 haUuTxkukluFDntzmEo2zzTdOEEw3RMPouC9YtTA2q7QOkmQesq7fWFZuelv9e4yZC0HW
	 tvKSigKGckSmIDo7hHRSKzXg3udIBTEuxPGJ1u1rDb7O4vX9miZHTut2Qf7UjhRWEAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=atlI4xhW;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50D960A2612
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B50D960A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=atlI4xhW
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3869b68caecso4153999eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437406; x=1796042206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZRwBHNibaWlFnpiuuEMtUB0YA/t47H+l2X5jKIQ1Dw=;
        b=atlI4xhWUQnHPQ9nkYx3mQO8Swph4K/bleOIqj2B5EWCD+vbxo7zUlwusUjhC8SBMI
         74SAW8d+AsGsQPS49KlhZ3wmObfzg3i8k6bjnLML1v3xvmi93htAIrRa3G5Mt47kUkbg
         8WPcf+BlbVDglyiG/AoRiiYZEv/QbipWZYqJLn/H5MvLp3vLv/WGzFZS8cZZUREwIitt
         q0EFaL7AhpJcMNbXN/xAKAu5BF0Ucd6YxQBsWhUGBV0e0YZUYNlHBOa0Xb/jU4GhT689
         kH9CLaUi8j8aRI+IOBYW7nODAPcyglZclBG0+lvwv1k4+VVdcc2GJXQFBiHF+2emdk/p
         nl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437406; x=1796042206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZZRwBHNibaWlFnpiuuEMtUB0YA/t47H+l2X5jKIQ1Dw=;
        b=m3D61fAr422mbLxaevZ4BO6a98FVb/czhFDaSImSszzZiMcVf5mEUircNm61c2wC1j
         vKirqhWl9so+n4Z90Bpf+Fkyuc7+UH4JalsJAH1Si5p0SCM3xOcfKwMOwpYecioHVmSz
         uEz4DdJ2Ggv+StVv2cuGK+esZs1dZMqP8trwBVNMdvo1s7FOSbaLSLhZNNEOngxEVfhT
         GtEN9DnLBzzQUh1ddkdm8NnWfMtI6yWinkTyxzvAJvwtHWFcXgFsc9EACBhmYSOEsmNq
         KgQV7xcvQQskwIgbaSHXb9M6S8eKlFmG9eXM8+79tR2ffY373yyPfmN0Aw4a0eNrJhM5
         Xbcw==
X-Forwarded-Encrypted: i=1; AL+hErGkYiZGi1HMirK4x7NwWSFvC3H/fuJNljQvWm+106xpnfSWVWkMoo3X4TqX248+mzy1dAvVNUL4A1CdJQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zBLIhZSWebC2lV4jTDMttg9HcYQki7YWZytxkV6TVPfPSe/uY
	gzGEvtW5oVuCT7+GdXg3EjmriKX+SW6SX2sHG1pH7j9rMD21h7wi1CYg
X-Gm-Gg: AZFdTZfL+NTQzNK+FcPLAVPovWzXKLDjQ0QYDuWiPtum/o6XKOthp+wQxCfDE2Fr8z+
	Hq/xxVGXoldQWRhD+1KI/Waj/eBWpwHTRqn6CKN/AAlT7zhEXQRgdxVe99IGWIvoAdblNYuqqFc
	yRJjOlcvugUKtRuSP76qPtDjGlgwErKFXJdnvYAjymBaae0CCNuImNs5QFgoIR3emhWnFIAsfG0
	Atgf6peuhDyO0n/Zp1o618VZIpEJriIkO1YAye2yMTYsypbslrxh7GiVsgIFGCsmLjIcB0wlJrF
	IDOrrAv/v26k3gCb/Hlye8zMNz39QJwA6ufITBEpygqrXjFaDTPi/Fm+ZRXiJwsoIsVNOw3Txo4
	KJ3+neFOcVgOLsh1P2LyOjgiR6aKR/cqdzItMzDTmYabn+8QehAS0APLa3XuCZqXZML2SE/w3xk
	VIW9cBJUJclb8srwZrMfwdzloeQ1Rlx0eGZ8PQtqMFrW4J//i8OH/DT9cwGWwcXecYewttNuxjD
	NApb0+rWVOKbmdRnVJ3WDaSXI4Cto1uxBxP2EOIwrNg8DjMNnL31sMmD/abgjqWsOrQgwb80oYE
	QBM7/90r+OlE3B+CaOxAcfYroBJGpLTUiDMt0TjHtoqUROAYaYL6si4MYBuJ1Y5j3Gw=
X-Received: by 2002:a05:693c:8209:b0:36a:4a68:84e5 with SMTP id 5a478bee46e88-3856f14bcfbmr12986753eec.8.1795437405845;
        Mon, 23 Nov 2026 04:36:45 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:36:45 -0800 (PST)
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
Subject: [PATCH v2 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 19:35:46 +0700
Message-ID: <20261123123546.152162-8-hikmahgumelar@gmail.com>
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

Enable the CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10
rear camera and Samsung S5K5E8 front camera on Xiaomi Mi A1 (tissot).

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
index fccb9c4360ca..5d4fd7f42042 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -308,6 +308,20 @@ ts_int_default: ts-int-default-state {
 		drive-strength = <2>;
 		bias-pull-up;
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
@@ -325,3 +339,103 @@ &usb3_dwc3 {
 	/delete-property/ usb-role-switch;
 	dr_mode = "peripheral";
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

