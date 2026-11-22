Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795327300;
	b=LQCVtJNXwt+n5bF00+DvdCTr3r2JQbob3WhsU2dbluZaSivbNKMNhJTcO0RmriWw5F+F
	 Xvn/lSSHz7t6jkqbgEo01ZTVlqDBUpd8XM9D1sla8n0igG95PwS+l2JnDSTuv71fbQ9+N
	 P3BxnbpKYrMfvYgpeQjn7W0Mpn5VGNRapV1F7IFs+ei3s6lmeCxBfERQ7EyuG2HAPKjp/
	 l7sJFllRAd9bw1QY+bbQK+rDymRRVverAVkbKishMLAnE3Eln5bLWiXMkzSseEHDs35DB
	 L32q/sBZ3isUOCWaYI0g/v8KDqqW0GB8c1SZFjrMj4VnRc/vXNL7MFJvuU2L3ARYnAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327300;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PSaaih/TC6HtEPnPEaEMghzv6bsIxzEaN+ljYxDHnws=;
	b=yxJDF2BA0ePRbCjUtcoRTtcO0KKKSEd220y3hue6pOVSmQsWi6GWxCC88kbscsOSLWh9
	 /fx6ech8qSJdrURaOqR+11EjFb/LBaObk+XkJR3K0Ml4gEQSl5P/9/wByUG+EvXezc2y8
	 4AijML0cE/dIb0lRRDCzQ2qYKnstSM+7gVdq1cWogmSQ2q4xm0l53oXBrsOx5IJ3a3p7V
	 vYsBSWHxeTIcKkUzVFygoHxDa8nDED40Nenz+FJcT/zxevzxrKXVaapWVnzJ1gwXjIw5S
	 O0tJ6PiVLIUs4bxkktCQ+7PLSkn0QoNDepT9McbTtZ9lA+B01q429YFi9Idcni85l4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=rVN90wWv;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=DBAEzFGn;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D54460A2609
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D54460A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=rVN90wWv;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=DBAEzFGn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795327293;
 bh=PSaaih/TC6HtEPnPEaEMghzv6bsIxzEaN+ljYxDHnws=;
 b=rVN90wWv1NOw7Yh0cB3U4dio7JZmv2PyDBR2SOhiiBQnQ7OwHHwMXA2BjuSdorSBxhe29Phrj
 ncNjo17lAIkgKsTFoqfg0H/f+EwquEdAXjy0K5KhkolNe8RlSPOFE1n6cwUQuOC4w6fUKRG6iO8
 GSMwVpkrEFa18BJjxU0eXid8jMhyaYDuSDEb/BJNagKD8TpQ9iSDlTWuSkdhcYakGtahNrOr9UM
 xKvmndgMN/nRYWd9Jwr6dfviKLzbXjvJG4cqtrsAXLsK8v07g920zapLm8AsHUZCabTCWjqC7GG
 8M5DB9hkuFFYC8hT+kUOJ1PmM7uLslqgCLtUlFgc3NJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795327293;
 bh=PSaaih/TC6HtEPnPEaEMghzv6bsIxzEaN+ljYxDHnws=;
 b=DBAEzFGnDlypvTO3BJ4gPHzAnOytafYNjriYYAxLh4T/TBGPbRl8qxWsz3B8qX6WcXFiur2Q4
 G8S+Tary7Y2dzi42nf3V0IYXP8L2bPAplPy7bu3AJnPP4L53kiW6uft5wp6Za8igpa6QR7NDAa1
 7ziUUIEpAf+QE270AYpNkgM=
CFBL-Feedback-ID: 6b028538cff95ecda8c0938d:f74adc2c9755cd2d037dd43ccbb4b341
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b028538cff95ecda8c0938d
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.37
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
Subject: [PATCH v2 4/8] ARM: dts: rockchip: Add Luckfox Lyra and Lyra Plus boards
Date: Sun, 22 Nov 2026 06:01:07 +0000
Message-ID: <20261122060114.773624-5-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122060114.773624-1-jonas@kwiboo.se>
References: <20261122060114.773624-1-jonas@kwiboo.se>
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

Luckfox Lyra and Lyra Plus is powered by the Rockchip RK3506G2 SoC,
which integrates three Cortex-A7 cores, one Cortex-M0 core, and 128 MB
of DDR3 memory.

Link: https://wiki.luckfox.com/Luckfox-Lyra/Luckfox-Lyra
Link: https://wiki.luckfox.com/Luckfox-Lyra/Luckfox-Lyra-Plus
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- No change
---
 arch/arm/boot/dts/rockchip/Makefile           |   4 +-
 .../dts/rockchip/rk3506-luckfox-lyra-plus.dts |  31 +++++
 .../boot/dts/rockchip/rk3506-luckfox-lyra.dts |   9 ++
 .../dts/rockchip/rk3506-luckfox-lyra.dtsi     | 124 ++++++++++++++++++
 4 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra-plus.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dtsi

diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
index e9f9e0ac3bfd..df620116bb2d 100644
--- a/arch/arm/boot/dts/rockchip/Makefile
+++ b/arch/arm/boot/dts/rockchip/Makefile
@@ -45,4 +45,6 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rk3288-veyron-pinky.dtb \
 	rk3288-veyron-speedy.dtb \
 	rk3288-veyron-tiger.dtb \
-	rk3288-vyasa.dtb
+	rk3288-vyasa.dtb \
+	rk3506-luckfox-lyra-plus.dtb \
+	rk3506-luckfox-lyra.dtb
diff --git a/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra-plus.dts b/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra-plus.dts
new file mode 100644
index 000000000000..c8991f4179bd
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra-plus.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+#include "rk3506-luckfox-lyra.dtsi"
+
+/ {
+	model = "Luckfox Lyra Plus";
+	compatible = "luckfox,lyra-plus", "rockchip,rk3506";
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
diff --git a/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dts b/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dts
new file mode 100644
index 000000000000..b7f11c7c510f
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+#include "rk3506-luckfox-lyra.dtsi"
+
+/ {
+	model = "Luckfox Lyra";
+	compatible = "luckfox,lyra", "rockchip,rk3506";
+};
diff --git a/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dtsi b/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dtsi
new file mode 100644
index 000000000000..d02d3a18b052
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dtsi
@@ -0,0 +1,124 @@
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
+	vcc3v3_sd: regulator-3v3-sd {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_sd";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3>;
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
+&fspi {
+	status = "okay";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		bootph-pre-ram;
+		bootph-some-ram;
+		spi-max-frequency = <80000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+	};
+};
+
+&pinctrl {
+	leds {
+		/omit-if-no-ref/
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
+	vmmc-supply = <&vcc3v3_sd>;
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.56.1

