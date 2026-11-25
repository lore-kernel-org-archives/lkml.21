Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609996;
	b=IMa8NeSyJEFX+6b7KsHNKyBuul8IvNYm6xMmeeTJB1jzXVGjfXmAIHP/TTmSY1TSVO5P
	 KSwTbaemqmPHBuctyP+lRjuOJJ3RlfFjb3KdtjMU3GTCKJVxR3i9MxedMhNBGbF7e+eJZ
	 JRQzawZ8vjzNMNX9z/dsYg/XMoTG8IB156WYAzZ+VPqGD2ZhB/zsfGuOvSgSFc6P/o+42
	 c97ZbMO2HAsGMiwbMNgmfFoQLJPhg0cuIkgXbLSb/YT3ghaGaAgBrMO4wguT3tUCUeqgB
	 F8Uqsx6iEezsIrtYAkrg9IqLBl+qfR6CA7sMpQmVZT39qZWTsPGow/N+Tdu+Ggcz1mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u9UxTbIvHn2NymkmK6sTzYgQuFVw5L2GmRCY+f1oSYM=;
	b=MJM35e5ZbhRDurJ0SnXs4OjSEBedzvxVQ5PusAljDwwdYzVnGB06YWZNFUCYoZVuZTsc
	 Ze/uqZMPILXL4nOfc2r2+GCTb7dW+8llRewgwZdQEeCw0k2T5Y4XVh1bzmXDIzam9zzLZ
	 e39NoGPFn+jVaa4ws0p3yHPrxncWnnyHT+Q1FxEts6NLwXo0N8M2iWbMzrXASAMLl2E6U
	 nofsrlMYnOc/XY3Lnl45/GEZsJKW1Lv1u1CtE2QtIkyPe+EAlCaqrEGv7tlkd7fOh70dT
	 F2eaA2OMyw5ifehB6/MbI2rBZqC7b41A5NMcg8NUlyb4RLiHZ0+bKKQspd4yH9ppmCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qgf/rxEJ";
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7911A606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7911A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qgf/rxEJ
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd69954c755so4095060a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609996; x=1796214796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9UxTbIvHn2NymkmK6sTzYgQuFVw5L2GmRCY+f1oSYM=;
        b=qgf/rxEJbxbQk0k4cDRQ2CUScsPmBOb32E8eV7SSGbTmDRbgYCKL+rs+qu6txu3x7S
         cjI9087SNrGDsqNfxE7Tww5wmtC89VG8WHBtct8fjTrDhGiSrgUzWq92HybFy66Q7+Mh
         7sLaY0t19HW9EWdOuhDlzCjKhu7VJeJZlX19RhOvEmTfIxy0YdZ0cg4oZddsm0G0wbyl
         I8wjsPiXsqdS4IV5HSPD2d9HiAm/91i+D31wPtwHpvD+wyjmVk5TOzZTRcB2sCf1BHI+
         IvmHh7ZTosiAVRfVsx+BQrfehi6Ert+W6ekLsS8rYMVaFjKWiLOh0/4JqEmJZn84vZy0
         5WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609996; x=1796214796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u9UxTbIvHn2NymkmK6sTzYgQuFVw5L2GmRCY+f1oSYM=;
        b=t9v+dF6yL+VRMm5L4TGZrCJ16FQRLdWb9gIvLl3PoHDFPGd+pA/aAq+3Ex8i88cD/H
         bsDNyfPqfPcQ/g69GMY6caGFrBwp1i71QZSJEKKBN+fVH3AD3C5gxJFREGXB7SZYSrug
         YY+7Os9ST4Zf3b+Vzc9/cwIpERp6Qs12cC90X42FMk6VF00S5GQH71GYJmVXQvP/o2Xc
         ImFDme0q0j6KpfYR2ZQlU1OoXTrbrYJVoNRvIJZRY7n5nJFyuxt2K/jtzI12h8vxUALu
         tkQUQsGX5AfuuXfOXyAznfrX2r1Stt+D3KrqyIEWWaCDW++6grelU7JS0zQ9RB48GqlS
         ng8g==
X-Forwarded-Encrypted: i=1; AL+hErFhPFxoZHYBWBnDn8xuRR+8EpC2IwJKfD4t3WIBMXPD7XCgD/VfrKfnLQrnsWQaNp08eEufiEoKUXaszXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xd1chs93V2PVqMY2xrb+PWx5KH91H20LHpi61BDCVTbrhZ4+/
	f7BnBgS2kJvZkItWg73GTJ6b4xQMlVlkGtm82/8QnQAOKkLKokJ3RDa6
X-Gm-Gg: AZFdTZeuAS6PElK81k0jb/a8S/gxeaziTVl6ynsEINvly9GQ2un3bwo2zvpaamm3l5o
	zPHgmLMRkt4KM4dZw48CONBFSP0l6xLmJpj82KexCMIvX/6G2SIWop9Yl90WOo/yIMfMCHxHLJo
	jAEmabdFvrMmMROBPC2LjtFHvSzQD7wYiQSDAJvL4F1ZUdNwerfw5LpZnRTIIVDwPNFrVB03KJ1
	+/WvT8kE7SSolW6t3Zixb5+e20LxNP+k25yPRXplZBi1gx9l7wl6VuNdiPBkN/gQmkBVRF4MSC2
	+DmP+ubpe/vMh/yU0BZAcnGzxpGBQsUspjXFMubBbJVCAv3aghI4EzFC1SOD1OrqC2G+93rdU3R
	Ir29fWpzf9n9OiMIZ3uFzmXyWiwBA0Iw5JoD+FDZDJpeWhGmp+/H1mrP/kGVIpPTFBpAdHIcp8A
	O5iPEkdyzUNHk4F3Cksvv0eiA+PrzgbA4o5ZPVW75GFSKusifqBXyNHXW4AjHpzOjCDxSlMEevM
	2IvkrqEv2vOS2RhXpupRAo0zldfoqAcqzwDZOeODpb+wxkoM/JL+OWk/npC6WCo9wsaKUgqvqhf
	sUf5UP9IY3BMZJvvK6F+85RFeal8gkzVlmMqJxf1jlg6b0ftSx6CVgVJgLH5DcLwSNLW
X-Received: by 2002:a17:90a:e7d0:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b41cb3276cmr17251989a91.60.1795609995742;
        Wed, 25 Nov 2026 04:33:15 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:33:15 -0800 (PST)
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
Subject: [PATCH v4 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Wed, 25 Nov 2026 19:31:46 +0700
Message-ID: <20261125123146.379057-8-hikmahgumelar@gmail.com>
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

Enable CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10

rear and Samsung S5K5E8 front image sensors on the Xiaomi Mi A1.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
index fccb9c4360ca..87db6b18d191 100644
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
@@ -154,6 +256,7 @@ &pmi8950_wled {
 };
 
 &rpm_requests {
+	vdd_l23-supply = <&pm8953_s3>;
 	regulators {
 		compatible = "qcom,rpm-pm8953-regulators";
 
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

