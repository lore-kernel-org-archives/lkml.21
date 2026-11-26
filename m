Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729498;
	b=RDE3XkA5247Tao3XpCOHHcgdAYthDToVA1MIzoL/nQEKw7u/gzxQe77HCQrERCRLPhli
	 bCBXmMuGTCcEfzWl9QbVUFmZy/+lt3UoSDk1LVbWoozIj95x5zJ1H7t6cTldiT2hn7xLt
	 uKLapvT2487D3YlrwlrxUfyRuFsOoat+wswHNYStATM0arUEASxx2z2XI9QcgunhxWV99
	 r+5QQhhhK40w5ukMwLgW2sLeEp02uDTsqhgQ9417g0RMmKLIBdacongSTG0XUobMgvEMo
	 2ksTSXWoUx1kglWjs5jGkQFd6wpHEw/OJrxzNzK7qm8kNSg5vuyF2itHFhlXdn/0pyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rgoIgw35YcjRzBDNQLX8AgVyjJr3fxJKdB7QZhfiyn4=;
	b=lsqizMowljeWH8HDz2WPuU22F6JVnWHQwPffPGznXH8x+YGB9ioigLjCvk+iKvBRocrJ
	 dv9JramkhCoISi3voJjQ+K1dk7AqirSYTx1xahvxT5nQH96GrO69HNO0C+YCFutyudv2n
	 Pi36cLZVcS+Q4B0XR4CdG/reX8wFFBMTcCRdyWsg2r+jWUfpumZEchShWDGKXAsCXOeuz
	 Jb8Rw951ijkO3ZQeokCsaxhO35wZGAi/7RoYahhT3DfBBGHY5Y1JWMvxFbvUqjDLRTnS1
	 12FkEA7jhe3Ia9FqtRRiTTwPHKbC+4/lYZZFP6OQzXLKXNSMUrqV415vvdeSs3U4y5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=if2OflbX;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D327606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D327606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=if2OflbX
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dee593f18so6980705f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729496; x=1796334296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgoIgw35YcjRzBDNQLX8AgVyjJr3fxJKdB7QZhfiyn4=;
        b=if2OflbXmuyYRo69Gt8pGtCfSeU63GKVpVfStzqrfGvxVvesiVnUccGjkhxUvJqe8E
         xWXuXZU+N86i3ohOWcmahDecGw7GQu9W/xU4+vtJpzOJKX5B4QqNFWYkmvK0dPA6XBnM
         xsNNi4w5DxRKP4/Xav9NwhrxEVUjGktCWkbzcH357qbjmRDKa3H9G0zETVsvWBlvUHII
         yp1lZWZEUEmB7nb10lR5Xoe4d0yykkVuXHL9vk1ZB8iSL7lllcWpRPdepvmFzLw/3zBm
         Qlsnr16KpXz90H2gVAL5W+HR+EMs4lxq1It5Jn2JK/nH54wEpgSe//gfDWfOzuWggbU+
         w2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729496; x=1796334296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rgoIgw35YcjRzBDNQLX8AgVyjJr3fxJKdB7QZhfiyn4=;
        b=LeWwqJ7z2GAD7IXUt9+Ci91B/TARgRcGdZLpsd7VmW6HJcZBQ7NSNCTvZfJJ/OaBuL
         ZGHRP1IIbokEREagBp1AJhg/Ah3rTURlig/I/Z0h/neftzG5tpglCQqczVwqM0fnHvb/
         FXjkJiqISM9xW7HcIWoMLXH6EnJKHJTivwbksUvar7+9jsH3S7+UcbIOC6i/JCb2pM1E
         107660hG3lRDKYQsvXW2DsJNW02zVG9qHv3S1L/ow4KVfm0Wll+VP6uQO2zVLXGzntxc
         HgJuNoXkw7Izta+8EE/FaSxbktJeLUdNOJJk5oZdyf2ruvfFGcDAa3FrT0Z2RsaN1q7H
         wqLw==
X-Forwarded-Encrypted: i=1; AL+hErE+7jeA0hciV4GneRu+YuF7Y533cB+zWYtw6HcNKkEscV2tROCKEAI4uUEx1a9CKPS6wHgKXKAsOPe7gwc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QF8rYf0fRxV58180zN458Gf9aXRpn6vL/t/x2z4lMuWQ7nKNr
	sM3a5w+S7HwEfNBIUIKyCBjnz6V/E1GZZKtriYX0OD7IvEf4EhK/Ck12
X-Gm-Gg: AZFdTZdtwXSQsiY9CwYz1egO/pbQvyohjnUXNhgIIS4lXE/H+rc9yWXKNDrLO7ot0RB
	Fn0KLb/kHqENWaVb/LO9att25foHVd8c+S7aKcRBfMFkDsft/DFVWwlfuXQQp7HhbT9aOoHcmAh
	L/AQKUmVlqSLEV9bU5blee+qs1sUwdVb2oLi+qZhnMwdpr4xwtlGRa69jl4o50Y8ErAHqVFhwcf
	P+KK+7q9Gnp/uZP1NYr40YHJT583y0t7EJE+Q6yceKMJfGaPMh/Z9XCH7/BTY7sf73snvm4OPSK
	H4GxZ5yhQMkFTNItao06xklkMM/i5asn/nZVLC4pQWCdRgLEtxzJE3XVHEMz/V4DfHfwR1MjlGK
	Skgrq2d0EBlmif4L3NtmSAqXFb0ZPCT4Bex5Uni/ymhfDU2ZJI40NzG1BPs9Me7nExlKclpwJ7H
	XLohIjrYBwGrfcvN3I7uo0UXO433nD2Y9oi+thVzGuuhGyGgVHYK6JDjUh83BSr5R0S56NExkTA
	1jDJZBgLp5yMB/5SdV3+Kks69/T0yAnvNyMMAvBrZzeFMxOBFtnx2Li4pbcbVS8M1Y5uUkHpyQn
	6qBSK18uI9nlP8TPeyaaUFlm5M2Gldn+4lOOSCSbPDgx+JaVGrVLUxeHtggwBdId/5zMkR47aHT
	YOLC0hCEJXhBaLlw+tOjBKPdWpSg0sK1GOMPv0NAh7oo2/tOiXiNF6pwnT9N81HJ+Uhx5vbfJaR
	MYz6IZFNwj1onsQdCBoIF7a6/otvLO/ZU1IEAZXaixvSzAeYf6bYgJk7d2kAMG7HFe/+LHPSnH+
	fW4ZiSMpTdJn4VvWERgimmwI8RLQh/TAEJ2bifZ3Q==
X-Received: by 2002:a5d:5846:0:b0:4a6:4ac6:d950 with SMTP id ffacd0b85a97d-4abb400ae95mr45098156f8f.39.1795729495913;
        Thu, 26 Nov 2026 13:44:55 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:54 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] arm64: dts: allwinner: h616: Enable HDMI on several boards
Date: Thu, 26 Nov 2026 22:44:33 +0100
Message-ID: <20261126214433.3562326-12-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

Now that H616 display pipeline is added, enable HDMI on several boards.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../dts/allwinner/sun50i-h313-tanix-tx1.dts   | 30 +++++++++++++++++++
 .../allwinner/sun50i-h616-orangepi-zero.dtsi  | 25 ++++++++++++++++
 .../allwinner/sun50i-h616-orangepi-zero2.dts  |  5 ++++
 .../dts/allwinner/sun50i-h616-x96-mate.dts    | 30 +++++++++++++++++++
 .../allwinner/sun50i-h618-orangepi-zero3.dts  |  5 ++++
 .../sun50i-h618-transpeed-8k618-t.dts         | 30 +++++++++++++++++++
 .../sun50i-h618-yuzukihd-chameleon.dts        | 30 +++++++++++++++++++
 7 files changed, 155 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
index 7906b79c0389..c5226a427eaa 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
@@ -26,6 +26,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -75,6 +86,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -84,6 +99,17 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	hvcc-supply = <&reg_aldo1>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &ir {
 	status = "okay";
 };
@@ -178,6 +204,10 @@ reg_dcdc3: dcdc3 {
 	};
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
index 0d3e761f6466..51c8ebdbdc88 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
@@ -22,6 +22,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -64,6 +75,10 @@ &codec {
 	status = "okay";
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci1 {
 	status = "okay";
 };
@@ -81,6 +96,12 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -113,6 +134,10 @@ flash@0 {
 	};
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index 90c25e12e189..0f25b043e020 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -28,6 +28,11 @@ &gpu {
 	mali-supply = <&reg_dcdcc>;
 };
 
+&hdmi {
+	hvcc-supply = <&reg_bldo1>;
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_dcdce>;
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
index 085f3e4e8eaa..568de6f57015 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
@@ -23,6 +23,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	reg_vcc5v: vcc5v {
 		/* board wide 5V supply directly from the DC input */
 		compatible = "regulator-fixed";
@@ -42,6 +53,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdca>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -55,6 +70,17 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	hvcc-supply = <&reg_bldo1>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &ir {
 	status = "okay";
 };
@@ -202,6 +228,10 @@ sw {
 	};
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
index c51d4d9120de..4a1754eeb0b6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
@@ -31,6 +31,11 @@ &gpu {
 	mali-supply = <&reg_dcdc1>;
 };
 
+&hdmi {
+	hvcc-supply = <&reg_aldo1>;
+	status = "okay";
+};
+
 &mmc0 {
 	/*
 	 * The schematic shows the card detect pin wired up to PF6, via an
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
index efe0faa252f5..2f09a5cabed5 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
@@ -24,6 +24,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	reg_vcc5v: vcc5v {
 		/* board wide 5V supply directly from the DC input */
 		compatible = "regulator-fixed";
@@ -61,6 +72,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -74,6 +89,17 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	hvcc-supply = <&reg_aldo1>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &ir {
 	status = "okay";
 };
@@ -177,6 +203,10 @@ &pio {
 	vcc-pi-supply = <&reg_dldo1>;
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
index 9e275f0217ec..11b087dad0c1 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
@@ -24,6 +24,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	reg_vcc5v: vcc5v {
 		/* board wide 5V supply directly from the USB-C socket */
 		compatible = "regulator-fixed";
@@ -52,6 +63,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -73,6 +88,17 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	hvcc-supply = <&reg_aldo1>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &mmc0 {
 	bus-width = <4>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
@@ -187,6 +213,10 @@ reg_dcdc3: dcdc3 {
 	};
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
-- 
2.43.0

