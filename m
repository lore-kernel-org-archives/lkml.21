Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643103;
	b=CrgV9dFGi7fbGjNl6XCSzCTpsop6iPCn36VMwEodrCoaUhD6WoDDC1NiDqd7zIBkyJA6
	 0guU8MDXq5EQBNoU54jSmBrXi1MpDUAScGlZWIg+7/7i3c5oZ7UeghkygdeTcts/THv/M
	 EtGAnumDLC57n+RCGyiSYfWcsBpdrW1DPEnHmL3WLK/uFtalwfIZuEdo64D5iNyQHpgxE
	 5zsfe4UtltEan4gE+tKwrAH4ca0sIqpWKdBlsX2kfawWOKsIQSQLfse8pbHI6PKtydaOJ
	 /MwGhoG8NiCZZi2f2fLEATIWkKcM/4WfQ6mI5ubDu1sPaNyyJyxGhBTHhITHeqVKcQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643103;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+cUG8gA9hiKJyOSsgiNcUCH0QMEPPWjPVr18k4rmwCs=;
	b=J5dikMRinbDzZ7qXTxlg/JdhTPdg5FxFpKlt88l16JxIemNE8Sm3LskdB4UXLXrNPl53
	 3LUTdFLyLvILm9wDCx+L+9c/DO20gpL+IwvdmFGzu2FWcFGeEnBII4yNzhysYqkU+gu8q
	 HPbbIqZJoixNmHQrrSUsyS79D+xRY32+zmumwsVLwRIyCYqCN+NJQqjMksO2ytQQIC2Xu
	 arKQDUvueclwHw6slisMUwatJg0GxRL8YWll2/5C+qs3qBZvfjBYq6JbRN0SPIKlSBf8G
	 V7cz9dCYmki/17xEwgTsb0oyx9cmItOlTj+cXFsB0Yco3rXYSvw382oqsuNbtazLs7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=ozRGw9VG;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=lttgVqvb;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32158606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32158606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=ozRGw9VG;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=lttgVqvb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795643101;
 bh=+cUG8gA9hiKJyOSsgiNcUCH0QMEPPWjPVr18k4rmwCs=;
 b=ozRGw9VGx4bLNFQJZVIvqL8GFgP4xYCq71EUCWnZO/Ij0UbUDEhIj10e+uOqTKQ9Jwbup8zYQ
 /y/HeqHUHvzYdyQu9y8F1kwlcHSWWSCs40UiqTMAphUg6xLLCw83Hn92ZqrMpbTrBC9T+BY02Ay
 6cVtk0DOjsoxddcadQU9i84WxTJRWSNv0DrKxpNSmGCH4TdmBkKvfgqMnLq6PK5mhZGy7BoOs07
 e3fhyXH070jxcM7Kjc4YyNTBlmSwWtpMFB355yxKnIvhnJ/WCh0gKZ2Gbs8e37bWRZv3FVyXfQX
 kfgOtsrE1Ha6oUNhrNODADPTQ6GYQt6Hj/DzWteeyB/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795643101;
 bh=+cUG8gA9hiKJyOSsgiNcUCH0QMEPPWjPVr18k4rmwCs=;
 b=lttgVqvbdkvVnH5ScnFcA1YrrpryvRQ+mhybAAG1TP0YSdC21ohiyrJIwEDFOWQNqckA55+dT
 KqVWMEzMGmp2ue5D8yLB8w2kG5Qu2gvh1HEd91YWN3wRgHv/Z2tndI4f/qCzdoW+wWPfEgXZRHQ
 yanfyeQqG+epcGBuBQGlTU0=
CFBL-Feedback-ID: 6b0756c9f930f38bf754f9cc:8e331a1fcfe7d174c8ba0dfb4bdda1e6
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0756c9f930f38bf754f9cc
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.39
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 5/6] ARM: dts: rockchip: Add Luckfox Lyra Ultra board
Date: Wed, 25 Nov 2026 21:44:17 +0000
Message-ID: <20261125214421.1580359-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125214421.1580359-1-jonas@kwiboo.se>
References: <20261125214421.1580359-1-jonas@kwiboo.se>
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

Luckfox Lyra Ultra is powered by the Rockchip RK3506B SoC, which
integrates three Cortex-A7 cores and one Cortex-M0 core. It includes
512 MB of DDR3 memory, 8 GB of eMMC storage, MIPI DSI, Ethernet, and
IO expansion interfaces.

Link: https://wiki.luckfox.com/Luckfox-Lyra/Luckfox-Lyra-Ultra
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v3:
- Drop unnecessary /omit-if-no-ref/ on led1
Changes in v2:
- No change
---
 arch/arm/boot/dts/rockchip/Makefile           |  3 +-
 .../rockchip/rk3506b-luckfox-lyra-ultra.dts   | 31 ++++++
 .../dts/rockchip/rk3506b-luckfox-lyra.dtsi    | 99 +++++++++++++++++++
 3 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-ultra.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra.dtsi

diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
index df620116bb2d..9a699bb8fc5a 100644
--- a/arch/arm/boot/dts/rockchip/Makefile
+++ b/arch/arm/boot/dts/rockchip/Makefile
@@ -47,4 +47,5 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rk3288-veyron-tiger.dtb \
 	rk3288-vyasa.dtb \
 	rk3506-luckfox-lyra-plus.dtb \
-	rk3506-luckfox-lyra.dtb
+	rk3506-luckfox-lyra.dtb \
+	rk3506b-luckfox-lyra-ultra.dtb
diff --git a/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-ultra.dts b/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-ultra.dts
new file mode 100644
index 000000000000..5a3eb35eb70e
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-ultra.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+#include "rk3506b-luckfox-lyra.dtsi"
+
+/ {
+	model = "Luckfox Lyra Ultra";
+	compatible = "luckfox,lyra-ultra", "rockchip,rk3506";
+
+	aliases {
+		ethernet0 = &gmac1;
+	};
+};
+
+&gmac1 {
+	assigned-clocks = <&cru CLK_MAC1>;
+	assigned-clock-rates = <50000000>;
+	phy-handle = <&rmii_phy1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth_rmii1_miim>, <&eth_rmii1_tx_bus2>,
+		    <&eth_rmii1_rx_bus2>, <&eth_rmii1_clk>;
+	clock_in_out = "output";
+	status = "okay";
+};
+
+&mdio1 {
+	rmii_phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
+};
diff --git a/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra.dtsi b/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra.dtsi
new file mode 100644
index 000000000000..bf19b1da110e
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra.dtsi
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include "rk3506.dtsi"
+
+/ {
+	aliases {
+		mmc0 = &sdmmc;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:1500000n8";
+	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 1>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-recovery {
+			label = "Recovery";
+			press-threshold-microvolt = <0>;
+			linux,code = <KEY_VENDOR>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "on";
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&led1>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	vcc_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+	};
+
+	vcc_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_sys: regulator-5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+};
+
+&pinctrl {
+	leds {
+		led1: led1 {
+			rockchip,pins = <1 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdmmc {
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	disable-wp;
+	no-sdio;
+	vmmc-supply = <&vcc_3v3>;
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.56.1

