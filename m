Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455760;
	b=YsumGZuZ7kH+bTOn/gg8bU19SH94TCgA8d0OXHXc86rjtV2h0Q/1Z/XeMZ+QPJKIGou+
	 VYuIl93NyhnghaVec3KxLDG6YFpiXUdlnzpIKzbbCV2hShvjUk3WE7pGsqM7Zaqck0NRR
	 eQzYuh3ILYFYDECVWVabRae0tLDjHz7TeR3bxoe+eITt6l6A92k7aLiG6CSion7zF2YBv
	 KXMjinPlQFS2ubKswvBAaZ3DvjpzNDv7Ejxb8VOxtLPo+UGiR6StaN+OpyuBJ2t5wnqp2
	 WeeiuInzRqnMj9hK2HDWxG4/k3bjJSJbkfXTImXIdhfPkhRNphEME33C42BGn+3WYRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/iStH9VraSG0DXuR71oDMSPL4T/9R4xeacMR1pzctQI=;
	b=N995p5QsbtKboFMQW4xQ/OO+kmEro5ktmrOmRg17J3Zl4xXuOyRacORQxa0oVDWMLArV
	 qOU/ABvabwB9xQa/5YOos588CEDRYf65pktxiKH39Tv78dojCjKqGUQKUEe0cQAtEA2Dd
	 sOpFqP+hYjg+R0nojpmbawlFeAtthoySSRxU26+BQgpQf/er68nk8znLcHGYBqGp3t6q6
	 5gL7evv++JPJi70M76mQ3LhVpJTE8nzQi08rfN7GMyQHM7f861hCe1FVcjxnBU0CgA1Ks
	 FlvpCcYN4X8A1I/atnpoFDs08TCWDn8WgfNi7crBkAfouIq9QiIyIlWsZ6ODBlESAOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVBtNuMd;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F286606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F286606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVBtNuMd
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-862a5b64755so2043641a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455759; x=1796060559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/iStH9VraSG0DXuR71oDMSPL4T/9R4xeacMR1pzctQI=;
        b=gVBtNuMd/q335jjXDCOi0yWu5pK17sUKha3MbmDKTYTkrx5UPD7mR5c/2C+ShnQB3P
         bF34BE3BQjjEP3Do0KMdr8Rik1MmmYoIazPCgDhUT3yB0+/VN+6cOuMNadSmsd7fCpgn
         HNwBhLRqLzNuHyLffMVpdj1Hzv2p/naNTpj8eCyI5h6HMcipsAQF5jzeLvVtWimbnFCy
         tnt6HgtWSLd29irFKKV23OZ8fxsB78oXXknfi2itzaZ7nNR+07QT2qTYUzW0FHudy+XY
         CL4/3h57XeHawxcS61yUmVuUmBce3OdDixBtwYnvSYMF/FZbeWtZ2Unt7UYPooIngG8B
         InsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455759; x=1796060559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/iStH9VraSG0DXuR71oDMSPL4T/9R4xeacMR1pzctQI=;
        b=K8sZDOuUZu4gS1NA7HXG6pgqARG2G5vx66RbVXEcTqFNR3asrAgclE1k0Y/J9MX2XH
         OJ7SsEQRZ47K/nm5JlLuMP9bSxWlW8SrwzTbCTuouUKvH3CB3SqPYYzghQaeF570zxK8
         u0+Ed0YQQV+Xwz/1MgeqUb+lZb+WB/4qC2w3ENlM1Yu6/o8HQ04avlQ+WfbFp4z6e1BZ
         ptz6nx9/Jpb6wrKXdPSA1uKhM/9zlmkXMiJf/7An9zOoly7XCjW7snA3Jd3VXDVqB0aT
         MJbvdIu84MSPLTRDrEBMkkHdtdgn4D7AivVi3RjNF4MByHUm2iLeo6sdZN4b6yJ7r5Y3
         QP9Q==
X-Forwarded-Encrypted: i=1; AL+hErFx1X1zntMHie510buIxNHk47Qm6QNLG3xGIQrs240hnsyhapYRAx7h+rU1r/VAO1FpF0u56n5MEC/YZ0U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Zib13Uhc3y7gFRHuphC+BNWQfGkEKq8ax1dajB8m6SiLpEAUF
	YEQNrGqW7kSwK4qIaWYsFpmOhIvpAgxDUcJGuQUA3dXjjsQjVKFKsdfn
X-Gm-Gg: AZFdTZeV5Xx0jdivL64GhhW5ZAL4UQdcDM/4xumcIaynyLmPyyFegkVbwy79Mx/eyHY
	Xik6/893UxQcISQrBCUwNiZ6mg1EIPJtEKKDr8ZfbCwfNKr/lwknwB8HTt8Uk3PyUCQzklRJtjO
	mI0H8Rm3cWxLxRwC8F1+JwwFY6/7F5Bc8491wxcIqR1G97MVgJKXm/1+FiOXsKx1j3BKVYkHFus
	HSgN2l+ha6SS2/TSXemWEq5rmuCiLinqjjdjFlDh4rnymjpAGQvSIzixaoLgEGBYC7iYT+REnD7
	1ojqkO2Q+cQRobaxitSix4r4T++3z+YpjbQCXDWliIlhGJbtfVgKVxCU6HEFthYSe8xLcR9xyiz
	JPuDiK5JJrLReR7tzCvBKv10wy0kgkao6crFCWU9S9ad/sfiEqvGf2+BqeBm/JdEiKDZcoWAWAx
	M9lFPjDiI6d6vHOIG1GH5zcMxHWUvZ8CPn3Kl2kDLVKJB8GWbxw1+6I2OOZA+7dtVx38HBx6lUz
	NiYPEhc9jsc3Prk5xtZdLVHXQC+ktKw8chZk4r9VKqIczwZqZPg0GXQsnBaHFQeKz2k1XeQ8ERH
	gGCCjrRcj7CTABwCCbWxXWopj6BFNv/7j5B0n/eEgek5JW6qqAr5bkxuikvpznvUwGoDGrmhsV4
	ScnU7
X-Received: by 2002:a05:6830:4ac5:b0:81e:b506:592d with SMTP id 46e09a7af769-86315987fa5mr13350328a34.27.1795455758836;
        Mon, 23 Nov 2026 09:42:38 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86322db2d1asm7539853a34.4.2026.11.23.09.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:42:38 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: [PATCH v5 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Mon, 23 Nov 2026 12:42:36 -0500
Message-ID: <20261121-a733-cubie-a7s-dt-v5-3@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
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

Enable the serial console, PMIC and microSD slot for initial Cubie A7S
bring-up with vendor firmware. Describe the oscillator inputs and the
power tree using the Radxa A7S v1.10 schematic, sheets 4, 7 and 8. Keep
the boot-critical supplies enabled. Use the Radxa 5.15 BSP CPU and
GPU OPP envelopes for DCDC3/5 and DCDC4. Use its regulator readback
for DCDC2, BLDO1, DLDO1 and ELDO6, consistent with sheets 4 and 8
and the VCC-MCSI entry in the A733 datasheet.

Allow 0.50-0.60 V on DCDC6, covering the 0.50 V LPDDR5 and 0.60 V
LPDDR4X VDDQ options on sheet 5. Allow 1.05-1.10 V on DCDC7,
covering LPDDR5 VDD2H at 1.05 V and the 1.10 V DRAM rail shown on
sheets 4 and 5. The BSP readback was 0.56 V and 1.08 V, respectively.
Both fall inside the bounds, so those selector values can be kept
after DRAM training. Set the LVDS0 supply to 1.8 V per the A733
Datasheet v1.00, table 5-2, and leave its enable under consumer control.
Omit the unused UFS and codec regulator nodes (schematic sheets 4 and 6).

Use SWOUT2 for the card and the Port F VCC-IO path (sheets 4, 7 and 13).
Firmware must select the 3.3 V PF path for use with MMC0. CLDO5
supplies the separate 1.8 V input. The controller uses fixed signalling
with no VQMMC regulator and advertises no UHS modes. Describe the
active-high card-detect line on PF6 and its pull-down.

Add the PM2 power and PJ26 status LEDs, and the BL24C16F on I2C0 as
shown on sheets 7 and 16. The EEPROM is at 0x50 in Radxa's 5.15 DT.
PC7 drives an inverter that pulls the EEPROM's write-protect pin low.

Keep ALDO1 always on for Port L, which powers the PMIC's own bus.
Omit the Port L supply phandle, as on the Cubie A5E: requesting
it would require the PMIC regulator before the PMIC can be reached.
The A733 pinctrl voltage-mode fix is required for the bank supply
connections.

Link: https://dl.radxa.com/cubie/a7s/hw/radxa_cubie_a7s_schematic_v1.10.pdf
Link: https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7s/linux-5.15/board.dts#L372-L384
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---

v4 -> v5: Add GPIO LEDs and the I2C0 EEPROM. Drop the MMC alias,
50 MHz cap and vqmmc-supply, and describe MMC/SDIO high-speed and IRQ
capabilities. Describe the 3.3 V PF supply. Name and order the fixed
regulators, remove the UFS and codec rails, and document the
remaining always-on supplies. Add the DCDC2-7, BLDO1/2, DLDO1
and ELDO6 voltage constraints.

Untested on v5: physical rail voltages, visible LED operation, EEPROM
contents, writes and write protection, early and repeatable MMC reads,
MMC ios, SD writes, hotplug and 1.8 V switching, stimulated PMIC/NMI
interrupts, suspend, power-off and other boards.

 arch/arm64/boot/dts/allwinner/Makefile            |   1 +
 .../boot/dts/allwinner/sun60i-a733-cubie-a7s.dts  | 331 ++++++++++++++++++++
 2 files changed, 332 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index da39f02252d4..9d1e740ff19e 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -69,3 +69,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
new file mode 100644
index 000000000000..7451c00570fb
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
@@ -0,0 +1,331 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/dts-v1/;
+
+#include "sun60i-a733.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Radxa Cubie A7S";
+	compatible = "radxa,cubie-a7s", "allwinner,sun60i-a733";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		power-led {
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 */
+			default-state = "on";
+		};
+
+		status-led {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&pio 9 26 GPIO_ACTIVE_HIGH>; /* PJ26 */
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	osc32k: osc32k-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	/* board wide 5V supply from the USB-C connector */
+	reg_ps: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "ps";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	/* discrete ETA3521 DC/DC step-down regulator */
+	reg_ldo_input: regulator-2v4 {
+		compatible = "regulator-fixed";
+		regulator-name = "ldo-input";
+		/* Hardwired BLDO/CLDO input: 0.6 V * (1 + RP298 / RP299). */
+		regulator-min-microvolt = <2400000>;
+		regulator-max-microvolt = <2400000>;
+		regulator-always-on;
+		vin-supply = <&reg_ps>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu4 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu5 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu6 {
+	cpu-supply = <&reg_dcdc3>;
+};
+
+&cpu7 {
+	cpu-supply = <&reg_dcdc3>;
+};
+
+&hosc {
+	clock-frequency = <26000000>;
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pg_pins>;
+
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "belling,bl24c16f", "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+		vcc-supply = <&reg_aldo1>;
+		wp-gpios = <&pio 2 7 GPIO_ACTIVE_LOW>; /* PC7 via Q2 */
+	};
+};
+
+&mmc0 {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
+	disable-wp;
+	no-1-8-v;
+	vmmc-supply = <&reg_swout2>;
+
+	status = "okay";
+};
+
+&pio {
+	vcc-pb-supply = <&reg_swout2>;	/* via VCC-IO */
+	vcc-pc-supply = <&reg_cldo5>;
+	vcc-pd-supply = <&reg_swout1>;
+	vcc-pe-supply = <&reg_bldo1>;
+	/* PF uses VCC-IO at 3.3 V, with CLDO5 as the 1.8 V input. */
+	vcc-pf-supply = <&reg_swout2>;
+	vcc-pg-supply = <&reg_aldo1>;
+	vcc-ph-supply = <&reg_swout2>;
+	vcc-pj-supply = <&reg_swout1>;
+	vcc-pk-supply = <&reg_bldo1>;
+};
+
+&r_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_i2c0_pl_pins>;
+
+	status = "okay";
+
+	axp318w: pmic@36 {
+		compatible = "x-powers,axp318w";
+		reg = <0x36>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		aldo156in-supply = <&reg_ps>;
+		aldo234in-supply = <&reg_aldo1>;
+		bldoin-supply = <&reg_ldo_input>;
+		cldoin-supply = <&reg_ldo_input>;
+		dldoin-supply = <&reg_ps>;
+		eldoin-supply = <&reg_dcdc9>;
+		ips-supply = <&reg_ps>;
+		vin19-supply = <&reg_ps>;
+		vin23-supply = <&reg_ps>;
+		vin45-supply = <&reg_ps>;
+		vin678-supply = <&reg_ps>;
+
+		regulators {
+			reg_dcdc1: dcdc1 {
+				/* Board 3.3 V loads and the SWOUT1/2 input. */
+				regulator-name = "vcc-3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc2: dcdc2 {
+				/* System and DRAM core/PHY supply. */
+				regulator-name = "vdd-sys";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc3: dcdc3 {
+				/* Powers the running Cortex-A76 CPUs. */
+				regulator-name = "vdd-cpub";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc4: dcdc4 {
+				regulator-name = "vdd-gpu";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <960000>;
+			};
+
+			reg_dcdc5: dcdc5 {
+				/* Powers the running Cortex-A55 CPUs. */
+				regulator-name = "vdd-cpul";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc6: dcdc6 {
+				/* DRAM PHY and LPDDR4X/LPDDR5 VDDQ (via RP15). */
+				regulator-name = "vcc-draml";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <600000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc7: dcdc7 {
+				/* DRAM PHY and LPDDR5 VDD2H (VCC-DRAM). */
+				regulator-name = "vcc-dram";
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc9: dcdc9 {
+				regulator-name = "eldo-input";
+			};
+
+			reg_swout1: swout1 {
+				regulator-name = "vcc33-lcd";
+			};
+
+			reg_swout2: swout2 {
+				/* VCC-IO to the console and microSD. */
+				regulator-name = "vcc-io-card";
+				regulator-always-on;
+			};
+
+			reg_aldo1: aldo1 {
+				/* Port L powers the PMIC's own I2C bus. */
+				regulator-name = "vcc-pl";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-name = "vcc-pe-pk-mcsi";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-name = "vcc-lvds0";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo1: cldo1 {
+				regulator-name = "vdd18-lpddr";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_cldo2: cldo2 {
+				regulator-name = "vcc18-hdmi";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo3: cldo3 {
+				regulator-name = "vcc-pll-dram";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_cldo5: cldo5 {
+				regulator-name = "vcc18-pc-comb0";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_dldo1: dldo1 {
+				/* SoC eFuse supply has no SID regulator consumer. */
+				regulator-name = "vcc-efuse";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_eldo1: eldo1 {
+				regulator-name = "vdd2l-lpddr";
+				regulator-always-on;
+			};
+
+			reg_eldo6: eldo6 {
+				/* Standby CPU and USB supply. */
+				regulator-name = "vdd-cpus";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+			};
+
+			reg_rtc_ldo: rtc-ldo {
+				regulator-name = "vcc-rtc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&r_pio {
+	/* PL powers the PMIC bus itself; firmware must keep ALDO1 enabled. */
+	vcc-pm-supply = <&reg_aldo1>;
+};
+
+&rtc {
+	clocks = <&r_ccu CLK_BUS_R_RTC>, <&hosc>, <&r_ccu CLK_R_AHB>,
+		 <&osc32k>;
+	clock-names = "bus", "hosc", "ahb", "ext-osc32k";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+
+	status = "okay";
+};
-- 
2.53.0

