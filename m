Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442281;
	b=BCK4+72y0xwet4LZ67935Bhyac6rRv5a2wyzN0RhUhch5Ogxm/XFTnjnNnt1G/UdI1bU
	 doe7glrpkgkfGVmpWgMsUGIClnbx6la1JXbXvOijm3Bf+ORTOY99hYqXt13qXMheFjhbM
	 V6ovW10e7WAGub4KQEnM4YiXvXOOOqdZRNHg3jYgu51piDiZDn9T4OLaNv8yvSqNPA0Mr
	 Dmq3P3KtfhdFBFVPCu/375ba/fpdQeNBXfonrdVN2N+gHKor3q8q5Ow+RBDkfOiybK0JA
	 ztx2/linvtsCEOwy7llZsT0rXn3D/+Vwh+679rPziPOiTQHf3GkbUXkEpkCRZePWyLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yDelI9gFR5dN8eX/1JQw6j2gQKfnpmpubkgbPy7dHek=;
	b=ojg1GE9n437Jni3o00R2rf++y/jUaQJgQ1QuS7ijd8ySOUVgjktlpFpGq03L3ZOeMgJC
	 lkrNKui2Ui9ZrPxAk2PFMrzDn6iXHUjJIt4M/p5c4pYF7x58agxCmf+iMwYZS3v7y7aaE
	 4mHiUMDSHWvzrcFD79Efmb2cV63VXo3zJoAhG2Xih0otaoJ1BWDNrk7AZ8vAVqSB9M23q
	 eKB9Lpv3Y0ftn6REq8D6cdKgDbsEvcdTSsFiNuY5aVoiZ7+vsAqvwMXHByTe0oDWGzCKJ
	 DUfhBEgWJoriCSapc4dN72BRfdElF3Hb3sMx3KbKgw4CgIBxiFlMTRcc7l63vOMPenA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tw49dP4f;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996C8606A6A8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 996C8606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tw49dP4f
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2063556f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795442280; x=1796047080; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yDelI9gFR5dN8eX/1JQw6j2gQKfnpmpubkgbPy7dHek=;
        b=tw49dP4fnJYaZZlyeNKp26lpcUpyM0P8MQmX6k0KDtODNsyAO4SYxNJ5KpwKk27pEB
         9JtxxFIcK+/AaV1nDN8Nrxn5/7ExZ0C/7wydKOjiwytZLNILUzWrj/Pe4jvM7/B+UxbU
         31dXx/QnwbIucN3YBIaMl7rj9hkCIzahM4nPK+Kwpt0gZjB+M/JQZuw9BeebIQGeW0tG
         //J15Jh+fvyEyWIhjMSfwa6E2n4wPDRGWLMnqrezK5uk2Q6IUYrXaWiRryKSVKPuyj1c
         HLUD0NNJReQ9SeJMTdoT+E0SrP3GlfOHlHuLnwE6qh6TBs1fxIQC0RdiUgl0yFk2cmam
         K5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442280; x=1796047080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDelI9gFR5dN8eX/1JQw6j2gQKfnpmpubkgbPy7dHek=;
        b=e3tB6cZep2p8qEpOIWGeemJ1dlOgKrFo3vUc7kO5zAk56gVahv7wuzQUD0r6S1G6ci
         QBK8XZcbYQE8P4tEODw+JzOdrR+cSUQ2du32Ig8YmLk/BdfrhgP9bZ4OpIBXv2a+5lhg
         SrvMwe1Jbi9nLHshX88yXZ7MlI4TCQkUjsXhA/CKFCNDw4Qa4K/gBL9/vz6nQpPCLRRz
         6jMl9t+Mg0xCf29DU0TeaeOZFqWGZko66NgoQcZpysKnB6oQuaxL35GZXqp2PEl0Y/0n
         CjgXK2Ga/IUXYxopc0rINQmTcNtRU5qj+NEAz69Fc155JUeigizGLtwzTjWsBAFO3xWP
         oX4w==
X-Forwarded-Encrypted: i=1; AL+hErGISUf9yLcxLw0WzHpVwM9MHKflSY0Jxd4eGb/wbjuCbuyrbkQqqSfdL3jyuEoiB61UgftwWQK598PtMcM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UvS/IpzRACYUeWG8d2hGpJ2QoheN9ZIYwJlEXtV9xOzgt/O6M
	h6lqr5Kir5/Oaax5bTADOyXLRyHG5l8dK0jaCx8hIomiv1/sr3DgWL2s
X-Gm-Gg: AZFdTZeiv4NCCj6OJ7hNoVV4tUALo1S9KvMx+oJtmxz/nPjyVxdyPwrcGkIDkmrX5wh
	HF0xO2xc6yOENS++gchcDewCxRUCsAhicfYpb4dTTF01KxaFP63E6jLmqXaduj2NDTqkA5HUCar
	RN92Wok0FUz3lptvlnmvgGNrZJ4IJ+rQABQ53WsPe79Tik0euvJk1xFIUxwtey7fpp+0wvBZjJD
	+mDIbLs4PT/eX6bdqskgWpKv8/um2NRkXSqh+y9Hob1pRG7xPWmpHt+RAQcPEDvmd8oF5jELSku
	GvXVcbDM8UNIWPcLcxbC30DJeNmfjhZkNdfInXajsxFA3KaZyzEi+ck9eBP2APqijfIxuwFiv7z
	7i6bErn30kCVbEqhw6T2QFFC1yEbNQBA3qPMnKPqK4yuAwVfbWHKFSP+l4mc6f9c4N7uY7DlThO
	gScQxEh8ZbqJECn33Vz/NHRKCRrnMZKTtJmlog2ycvffr889x6JfUh+6+xPoMJNrOd+PZcPqob4
	zPovhiQKsaRkajkM8+L18jhg6ihGpbBqwOgtoY2jDbfbPHnqmeCCybe7hyJ4CItHtAFry6Vk+G6
	lsNOSi6LfhP+re64q/M13SZ+aeqyOg8PuoVh+dpDfOXpW5gB8CuxwtvfYyhzOWiZ/w==
X-Received: by 2002:a05:6000:1846:b0:4af:e519:ccce with SMTP id ffacd0b85a97d-4afe519cec9mr14522510f8f.6.1795442279918;
        Mon, 23 Nov 2026 05:57:59 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d6f4:1401:6558:1dff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm22109308f8f.36.2026.11.23.05.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:57:59 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 23 Nov 2026 13:57:54 +0000
Subject: [PATCH v2 2/3] arm64: dts: renesas: rzg3l-smarc-som: Enable
 SD/eMMC on SDHI0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-sdhi_rzg3l-v2-2-bad3a6358849@bp.renesas.com>
References: <20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com>
In-Reply-To: <20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795442277; l=5265;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=Bo8XAslU2XXROdYj3SnpHRKllgNOzCn/MvrVdg42wH0=;
 b=MxGfmnugUF0UshsIwKctb6QqNQnmgoZWUU2lHseAb0K6Icyo99zy9Ze/sGrtXtXKxa4bJJN21
 PQV9ogW5kl8CeKVOhsT+T59h1jxPvP+AWJ0D8e1D9g7l41KaPC/7nuI
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for enabling SD card or eMMC on SDHI0 on the RZ/G3L SMARC
SoM. The selection between SD and eMMC is controlled by the
SW_SD0_DEV_SEL macro in the board DTS, which must match the position
of switch SYS.1 on the SoM. By default, eMMC is enabled.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2
- Fixed the typo RZG2L_PORT_PINMUX -> RZG3L_PORT_PINMUX.
- Collected tag.
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |   1 +
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   | 143 +++++++++++++++++++++
 2 files changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index e9b7b3280615..3699712d8bf1 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -9,6 +9,7 @@
 
 /* Switch selection settings */
 #define RZ_BOOT_MODE3		1
+#define SW_SD0_DEV_SEL		0
 #define SW_SD2_EN		0
 #define SW_DPI_EN		0
 #define SW_GPIO4		1
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 91b2d0d43104..e64a611aebec 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -9,6 +9,10 @@
  * Please set the below switch position on the SoM and the corresponding macro
  * on the board DTS:
  *
+ * Switch position SYS.1, Macro SW_SD0_DEV_SEL:
+ *      0 - SD0 is connected to eMMC (default)
+ *      1 - SD0 is connected to uSD0 card
+ *
  * Switch position SYS.2, Macro SW_I3C_EN:
  *      0 - SMARC_I2C_GP is enabled
  *      1 - I3C is enabled
@@ -37,6 +41,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		i2c0 = &i2c0;
+		mmc0 = &sdhi0;
 	};
 
 	memory@48000000 {
@@ -78,6 +83,19 @@ reg_3p3v: regulator-3p3v {
 		regulator-always-on;
 	};
 
+#if SW_SD0_DEV_SEL
+	vqmmc_sd0_pvdd: vqmmc-sd0-pvdd {
+		compatible = "regulator-gpio";
+		regulator-name = "SD0_PVDD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pinctrl RZG3L_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
+		gpios-states = <0>;
+		states = <3300000 0>, <1800000 1>;
+		regulator-ramp-delay = <1200>;
+	};
+#endif
+
 	x2_clk: x2-clock {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -241,7 +259,132 @@ i2c0_pins: i2c0 {
 		pinmux = <RZG3L_PORT_PINMUX(L, 2, 4)>, /* RIIC0_SCL */
 			 <RZG3L_PORT_PINMUX(L, 3, 4)>; /* RIIC0_SDA */
 	};
+
+	sd0-pwr-en-hog {
+		gpio-hog;
+		gpios = <RZG3L_GPIO(5, 1) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd0_pwr_en";
+	};
+
+	sdhi0_emmc_pins: sd0-emmc {
+		sd0-clk {
+			pins = "SD0_CLK";
+			power-source = <1800>;
+			drive-strength-microamp = <9000>;
+		};
+
+		sd0-cmd {
+			pins = "SD0_CMD";
+			input-enable;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-data {
+			pins = "SD0_DAT0", "SD0_DAT1", "SD0_DAT2", "SD0_DAT3",
+			       "SD0_DAT4", "SD0_DAT5", "SD0_DAT6", "SD0_DAT7";
+			input-enable;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-rst {
+			pins = "SD0_RST#";
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-ds {
+			pins = "SD0_DS";
+			input-enable;
+			bias-pull-down;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+	};
+
+	sdhi0_usd_pins: sd0-usd {
+		sd0-cd {
+			pinmux = <RZG3L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */
+		};
+
+		sd0-clk {
+			pins = "SD0_CLK";
+			drive-strength-microamp = <8000>;
+			power-source = <3300>;
+		};
+
+		sd0-cmd {
+			pins = "SD0_CMD";
+			input-enable;
+			drive-strength-microamp = <8000>;
+			power-source = <3300>;
+		};
+
+		sd0-data {
+			pins = "SD0_DAT0", "SD0_DAT1", "SD0_DAT2", "SD0_DAT3";
+			input-enable;
+			drive-strength-microamp = <8000>;
+			power-source = <3300>;
+		};
+	};
+
+	sdhi0_usd_uhs_pins: sd0-usd-uhs {
+		sd0-cd {
+			pinmux = <RZG3L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */
+		};
+
+		sd0-clk {
+			pins = "SD0_CLK";
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-cmd {
+			pins = "SD0_CMD";
+			input-enable;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-data {
+			pins = "SD0_DAT0", "SD0_DAT1", "SD0_DAT2", "SD0_DAT3";
+			input-enable;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+	};
+};
+
+#if (SW_SD0_DEV_SEL)
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_usd_pins>;
+	pinctrl-1 = <&sdhi0_usd_uhs_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sd0_pvdd>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+#else
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_emmc_pins>;
+	pinctrl-1 = <&sdhi0_emmc_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	bus-width = <8>;
+	mmc-hs200-1_8v;
+	non-removable;
+	fixed-emmc-driver-type = <1>;
+	status = "okay";
 };
+#endif
 
 &wdt0 {
 	timeout-sec = <60>;

-- 
2.43.0

