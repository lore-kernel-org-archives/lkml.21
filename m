Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378486;
	b=ty2IcG1bTsnQN7GB7GB0Zl7AzeCZC4rpUeUR4IkGeoz7vkUM+Er07aAg2QEHWir7l+EW
	 OShDzHIR7MgYTVLrVZHXZednUl8mdxu8avEkV0zi5XWp8eNYbMX3mbLQsmMdL/NhlXjeO
	 HG2Sfl3VxhQfylCtn0vyjNhLhDRUkvcBpjzcXpK7AVxIttIlvko9m7azG/lx95pwJfuZO
	 iCY7tczc38Hx4TeabEicaT5k0oHWzQEk3U/QjQf0RIPNviKV+J1g645FVcqiGgMvx6XE4
	 Y+CX/3COxB9oMQs0oohbC65elNWIJjL8mWrJIJakNwKwf5LQrTARX4KGM/av6Tq/kAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=tqLwe6+0JoMMxyiooOlwMvbknZ3XaI9g0cAtNiC83UI=;
	b=5gi6xGOgtgGQjG7PBBRN1C4r6nJaSZTdZcYjDTbwMtevt3mxS1r9BteMAeqr271sTj0+
	 WoARjpKQS9bquaBWjzOfzWqdt94XFjvuu9iYK0AQss3NxZdWhsaENL2x1lVOnd35B+WGW
	 sp1gsPYXHU8l9jNG7s1RDXLYlDcdrPBWkadukNNwCrHPzO7tktrP/46PZIuT9oJgR+Bsg
	 kf9t/ZhSQAuP3D53T28VlkqW+lPGIhCgz0Wz7JXoKOy4q6zeuc3+82KxOEGemmlXK4u/t
	 yMYjQ9RX3ClIUCjevDVTz6k6Egwk0mXv7+MgEv0SLmr+mv164V6EYpFonvzOsvByRkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yppbj1xt;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B3D606A689
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37B3D606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yppbj1xt
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so3186016a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378485; x=1795983285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tqLwe6+0JoMMxyiooOlwMvbknZ3XaI9g0cAtNiC83UI=;
        b=yppbj1xtN75l6P8tn83PjOJ+DLOquw9vfG2lxjJU6n5f3ReTDp4ci37K+B/XDneFhD
         LLhMUDlQf4scGGD/ovVz6/K49f7XpVv0s6vMhDIbHwU61h0zMJb7qLd7r+QrzLrL47Rx
         85KjLrfTeR8WXAr/Ic/cpkIAkATh7teZpGgrlwxn2aOQVRVVWL/TeU/NcQMqxXY+MXsa
         egDDPEekksEMoLWpMJhCfWhdXogMWeB5EBWDdQsOe0c5ve82c8u60DAGmQN47aPQMlcQ
         qokJXzr8b7EfqBgVequ8+UsRj7L+i1QsV0NMrlJw4yMLUMlMB0ZnOs9jH4p3Lm1AXlGQ
         9diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378485; x=1795983285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tqLwe6+0JoMMxyiooOlwMvbknZ3XaI9g0cAtNiC83UI=;
        b=ALQqXn96p8YB8iAp77nQJvkrs2bDTnLawLas7NO1xsAt7xbQ3UivJs4xujqsGDikZ9
         J7pLCCt5mbCa1hN3G+YsRLjhixqPZueANxS3X77ys4CfLGyPho3dotmwiyRbyGy/e7hx
         3bh5Qnlu5698pfIAeKo4ZEgVwW8eKzj8NeBBZuSYs4aDAa83aGrdf9mKmqh4IO0rbTch
         lsIgfLJhoX94RInEAKJBCWp6XsMLHFwUuMBXBG2BLY51L4UlyDjEuqx8rWrK3E9ETjg8
         xma+w9wmHtvUCyiZ69NT9LW+d9zWWRcnDQVoe+Cr4GGzhgsfVZ685aWyDAtokI20dBWl
         8r4Q==
X-Forwarded-Encrypted: i=1; AL+hErEqAOpU8ZTBDbsiQpOHsj2bSErE18ceUU8j0/x3sCWoA5LK4nqX7nprvL6K7Ah67xC6WpVbqAKZt3kLEG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bc2TITb+lB33et6RqeW9frMeqHfq0IfZsEuqZK6QClCqKeUrC
	46ousmr261qusgmTmdwt3kLTvM7++ir+wjhg33S1MQMdJduebzzzhPqC9yKNAg==
X-Gm-Gg: AZFdTZcSAqH4fG8cmXy0MszRGfY80jBqQgbMAA5pvHOAucVhDI66HOTVHtxoBWZ/NWZ
	kgvHfMrblR7HtwLN47h0p6Z/kfUXZJwlduTC4NLRyT8E1Wo/8HzmSf/t58lWaQ/x0Gpvk0CzlhA
	zIje4Yh3ftmS1s91Sj3s3bIhMtOF2wXocoRjHK884Iaprt8C3zZXVF/Ucr4ogGBayuTm4YwgzpA
	oCYOVUDKQB9LnZBILDuFopPmS31Ni1kQIywplL88Du9R4P8rai6NcT1+7cbz7gmklL1jih07hOC
	77AO0Wt+dONyOc5EN+CVv71RlEBK9uTy0C1uVBJV4i0tbWoVLk/bNT+YT+xv8LJGcpNeTetgR9O
	xdV1jzKGgjA4d5k7qoKqDPSDiYF7gyW4r9DEGSPodUFMjE9N1jZTa3WEUtVvp76/loKpgc+PO2H
	QSYc5Gis9p+vQZytIUBHHdnWJ+s8EX27xjowSUJ7X/mZbETNveNWZgLnuNU+Ot2hp3KRzK2uqiL
	t3WltAKsczRHP3301o8BGz2bQ2ZoVNeaK/S2fpKPwqPxu4aZYRQPloEF34CvKVh7BUjVMA20OjV
	JD40llir3h0iVU4romjAN24DPpdk53TECz6RXTWsbWQldrT/5B2RGKNIUZWgG5DlShtZc0ow+XI
	rVKfG2grdDQ==
X-Received: by 2002:a05:6402:3222:b0:6b8:7e86:3e90 with SMTP id 4fb4d7f45d1cf-6ba654bcff6mr3922317a12.38.1795378484595;
        Sun, 22 Nov 2026 12:14:44 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:44 -0800 (PST)
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
Subject: [PATCH v1 08/18] ARM: tegra: tegratab: Configure wireless devices
Date: Sun, 22 Nov 2026 22:13:57 +0200
Message-ID: <20261122201407.23742-9-clamor95@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The tegratab uses the Texas Instruments WL1801 (WiLink 8) single-band
combo module — providing Wi-Fi, Bluetooth, and Bluetooth Low Energy (LE)
for wireless communications. Additionally, the tegranote7c variant
incorporates an Icera i500 modem for LTE support.

The Wi-Fi interface is connected to MMC1 (SDIO), and Bluetooth is linked
to UART-B.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 51 +++++++++++++++++++
 .../nvidia/tegra114-nvidia-tegratab-p1640.dts | 12 +++++
 .../nvidia/tegra114-nvidia-tegratab-p1988.dts |  5 ++
 3 files changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index b7a14e24df79b..bb5788b2539cd 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -18,6 +18,7 @@ aliases {
 		mmc2 = &sdmmc1; /* WiFi */
 
 		serial0 = &uartd;
+		serial1 = &uartc; /* Bluetooth */
 	};
 
 	firmware {
@@ -934,6 +935,30 @@ drive-gma {
 		};
 	};
 
+	serial@70006200 {
+		compatible = "nvidia,tegra114-hsuart", "nvidia,tegra30-hsuart";
+		reset-names = "serial";
+		/delete-property/ reg-shift;
+		status = "okay";
+
+		nvidia,adjust-baud-rates = <0 9600 100>,
+					   <9600 115200 200>,
+					   <1000000 4000000 136>;
+
+		bluetooth {
+			compatible = "ti,wl1801-st";
+			max-speed = <3000000>;
+
+			clocks = <&palmas_clk32k>;
+			clock-names = "ext_clock";
+
+			enable-gpios = <&gpio TEGRA_GPIO(R, 1) GPIO_ACTIVE_HIGH>;
+
+			vbat-supply = <&vdd_3v3_com>;
+			vio-supply = <&vdd_1v8_vio>;
+		};
+	};
+
 	serial@70006300 {
 		/delete-property/ dmas;
 		/delete-property/ dma-names;
@@ -1015,6 +1040,11 @@ palmas_gpio: gpio {
 				#gpio-cells = <2>;
 			};
 
+			palmas_clk32k: palmas_clk32kg@0 {
+				compatible = "ti,palmas-clk32kg";
+				#clock-cells = <0>;
+			};
+
 			pinmux {
 				compatible = "ti,tps65913-pinctrl";
 				ti,palmas-enable-dvfs1;
@@ -1281,8 +1311,20 @@ sdmmc1: mmc@78000000 {
 		nvidia,default-tap = <0x2>;
 		nvidia,default-trim = <0x2>;
 
+		mmc-pwrseq = <&wl18xx_wifi_pwrseq>;
 		vmmc-supply = <&vdd_3v3_com>;
 		vqmmc-supply = <&vdd_1v8_vio>;
+
+		wifi@2 {
+			compatible = "ti,wl1801";
+			reg = <2>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(U, 5) IRQ_TYPE_LEVEL_HIGH>;
+
+			ref-clock-frequency = <26000000>;
+			tcxo-clock-frequency = <26000000>;
+		};
 	};
 
 	/* MicroSD */
@@ -1409,6 +1451,15 @@ key-volume-up {
 		};
 	};
 
+	wl18xx_wifi_pwrseq: pwrseq-wifi {
+		compatible = "mmc-pwrseq-simple";
+
+		reset-gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
+
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <100>;
+	};
+
 	vdd_5v0_sys: regulator-5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_5v0_sys";
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
index 409df3de17a82..8177e4f7db489 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
@@ -6,4 +6,16 @@
 / {
 	model = "Nvidia Tegra Note 7 (P1640)";
 	compatible = "nvidia,tegratab", "nvidia,tegra114";
+
+	pwrseq-wifi {
+		clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_3>;
+		clock-names = "ext_clock";
+
+		assigned-clocks = <&tegra_car TEGRA114_CLK_EXTERN3>,
+				  <&tegra_pmc TEGRA_PMC_CLK_OUT_3>;
+		assigned-clock-rates = <32768>;
+
+		assigned-clock-parents = <&tegra_car TEGRA114_CLK_CLK_32K>,
+					 <&tegra_car TEGRA114_CLK_EXTERN3>;
+	};
 };
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
index f461a2c492b1f..9447203eeda36 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
@@ -19,6 +19,11 @@ ldo4 {
 		};
 	};
 
+	pwrseq-wifi {
+		clocks = <&palmas_clk32k>;
+		clock-names = "ext_clock";
+	};
+
 	regulator-gyro {
 		gpio = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
-- 
2.53.0

