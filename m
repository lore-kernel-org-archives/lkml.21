Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952963;
	b=iOpLaAUfyuztAInoUZEPYxOa3KSrRhf6eD0BOX/eGSdlQFI070XVHPwrdHB66ZlYc+yc
	 gTV4NZQjBDe4JsR8JUWQan0XSVrPWcnIUemkC/Ke7h+eF3bN6dlMvoXBi3/lVyvDdHs09
	 duRHlciVoGvEFY3M03ZnPb6u0vW/mUjThteFzuZ5cbwj/ue+EzchI1LRuP+YDjCaHdjKZ
	 2oioFdtF4BXKhdZdEYFtyWaKHAaLHc0rgP5Fmiol7MNBoJAZ4n+sJxg/xgJmfnrjHeHcm
	 QenThj8NFPLGnevmIUb0Qq/JiXzBI09+t0CP7MC1SarOu7aJ0HF/SZ0VR5B4s7rAq+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=u+qNamCxkMzKl4KY6j5kHOZ4VWCPeD2SfTKkXZTtvl0=;
	b=lc5bfnybJbsdd8qL1T8DUE2apCN7ygrjcWePwp234E1KJcyz4sfew6+HVY3PevCgh3fu
	 W+qJPbrZ4p6/1EK6NngsN19jJFok9I5UQ6TLN86MA9SmBPfUKy0Yvl7CHffEXNeo2NAnf
	 aR1Tee5fugTQIz9vLw0lvg7pZABNQLKVwJ+uwsNKmumd2Snc+x/6+fgLUjYuyfFPk8g0B
	 ZdTKdGgjMviHeWFItU8D3JeL84dumPOYJdEyVOzAIGrT1f1UNHI+3OVavPijGQXH3vMTH
	 +Isj33Gm5RbYZZwOBv30v+anrMBw0nV6qOAGwIQqsiDinOoUfPFTjzpacRIFY5D4HRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCvApCP4;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB189606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB189606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCvApCP4
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50933bdf4bso52000666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952961; x=1795557761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+qNamCxkMzKl4KY6j5kHOZ4VWCPeD2SfTKkXZTtvl0=;
        b=VCvApCP4krmDZivhPp043n01C7iwdTQqCKtQ/5A708TdGit+0FtbECizzQX4m5LuE5
         aehfHratggg4dCDRMWRzuemVKUJasBuQ6RWetxhuk8emIl24X9+9D+dpQOGqhS0D6Mr4
         aK96SPhsV+W0RGCZYmDf6KU4FpyCZoXZThzu5KCs7FiTgS2TrcXhXRXrvfx1UPvzAX0z
         RNcrM4Pntzoc+4ao3Sb6UDG6W/Ok6GAd3nWW0TI4CQUKTg6XKIPcngPFEND7fOVIYtU7
         dDE0TFR1dww0Cnzp0Y0btPIeKBQzekcoYfcY3U0dVzzkRnsZhNpevCqklavHIPmAeIh2
         lFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952961; x=1795557761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+qNamCxkMzKl4KY6j5kHOZ4VWCPeD2SfTKkXZTtvl0=;
        b=cYLABNUisjjX7gIAxqebmgkh4ihBVO2yIDui7kukXoUS8dnaIZIY471A3fjcVd+iW3
         C54sulsurF0G8e1SogIWWS/u8rQ8SY4jgjANUBqJwnGBZdwSFGv8z+x4Mxk07iucZwdN
         5Aohryej5bYOdBaoww2WX8dzaWdOKRNuxQtlWDczCO5BP/eeqAI4Z5qlosrx/C0cY771
         1xB8b3tpL+bLVPOpoMZE/VAuGPqjEKrMT/BF+qzqKh0tnkGR8jx0tU6g+Vmq/2JAQnnD
         Mxjqgs+C+Rt0Z7X91y4iiZb5c8pwmWE3UyKGI6wKSN8o/hBSCyHaTFvt9jgB6SVls6Rz
         yxyQ==
X-Forwarded-Encrypted: i=1; AL+hErGG+xD1e2e3bt5oYWvTuqXBwa9rkknVBsyjw4eyWIRyamgOxPfQPpBz479k+WZZWbwPzsoVKd7AHsedcLk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fKbdIkSWTaZGkkEcN/lQHyh0SSj0Wb1QsqPcXf/C+RW7cJ1Bz
	uisi7axr+g9cO+OhS0u8CE6thGXBQc211P7GpZgX4fQXFjtzxDNjbYCI
X-Gm-Gg: AYBFou2k6QZsO6lICEXk3lCr3ep64smBk+eh0rxXsmpgIWm1ulWtyx6klGyA5ubVw9w
	x0orqFhzOFXQUYt0aKt5A/msjsootaMPDDHFjEDewZ8pVB4XN03kgrmcaSHq5kYsF+j/UYGFO5N
	6cjYv77kdgqOcqAQtX9WFuGYku/mN8mepR4ASkrBXT2TjfAgwIkaMcnqeC4vhlkX8oneFzmk2KE
	TwITwwCCjAGSsahKNhBFiLoDbgvTfy6IKd55dh/WossVreCNgmpFaAZfBB/DnUFHv506QWf9eWL
	N9lnWqe/y33LxM/sN1Ws8r/l3jxZTDMInIcMlfxBamnSu/g6R4bxxoKPG+jeU4N75UGWIizVfna
	9O6hbiuDiRM0PYj9m+r8+q88qFy+QN6FkDO5SAqZdtPQQdOdD9Yblq8tFCBHCd9nCrHGuF5hpTX
	9rNTI06HBu+BPKQPimLWA2JxfdkLjqbo/J75rwBnsdRA3K01ceJ6CDKpn1FwxtA3jsTR9dbdMUH
	lcQHcfH90uK7jZ6DsD5DoaEBqk2qf53Dmwh3vZ+8Vk7n00/LnrH7RJLyf4AsBEwt/9I5ck+wyum
	XsZeB/6Cs6Ds6h+kRe2BcFJ9mXyqo/x/KYDczaVqMCqh/tSltA6HTB3NSg==
X-Received: by 2002:a17:907:728a:b0:c50:6222:7b1c with SMTP id a640c23a62f3a-c510e3c9618mr45908366b.23.1794952960855;
        Tue, 17 Nov 2026 14:02:40 -0800 (PST)
Received: from rea.tail766d.ts.net ([194.9.79.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510cb340fdsm25525266b.76.2026.11.17.14.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:02:40 -0800 (PST)
From: ImAthanasia <pwnzorius@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ImAthanasia <pwnzorius@gmail.com>
Subject: [PATCH] ARM: dts: armada-370: Add WD My Cloud EX2 (Gen1)
Date: Tue, 17 Nov 2026 22:02:17 +0000
Message-Id: <20261117220217.250710-1-pwnzorius@gmail.com>
X-Mailer: git-send-email 2.39.5
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

Hello,

This adds a board file for the Western Digital My Cloud EX2 (Gen1) NAS
(board RD-88F6710 "KingsCanyon", Marvell Armada 370 / 88F6710), which has
no mainline board file today.

Enabled by the board: both SATA ports, USB2 and USB3 hosts, gpio HDD
status LEDs, the 4-GPIO chassis fan (gpio-fan, 1500/1700/1800/2100 rpm
speed map), the rear reset button, mvneta ethernet with the Marvell
88E1510 phy (rgmii-id), fixed regulators gating USB and SATA disk power,
and the NAND controller with the stock fixed partition layout.

The NAND node sets "marvell,nand-keep-config". This is required on this
board: the stock bootloader programs controller timings that mainline does
not reproduce, and reprogramming them corrupts reads and aborts writes.
This is the established pattern for NAS boxes on this platform, not a WD
quirk: the same property (with nand-on-flash-bbt and ECC 4/512) is used by
armada-370-dlink-dns327l.dts, armada-370-netgear-rn102.dts and
armada-370-netgear-rn104.dts, and by WD's own EX2 Ultra / Mirror Gen2 board
file (arch/arm/boot/dts/marvell/armada-385-wd_cloud.dtsi in OpenWrt).

The file is derived from the Armada 370 DB reference design with the
community GPL description for the WD My Cloud Mirror Gen1 as the hardware
reference, adjusted to the EX2: NAND moved to the mainline
nand-controller + nand@0 binding (the legacy "nand@d0000" node has no reg
resource), and the gpio-fan node does not claim an alarm gpio overlapping
one of the fan speed GPIOs.

Tested on hardware with 6.12.117: boots unattended from NAND with a USB
root, RAID1 md0 assembles, LEDs/fan/ethernet/NAND operational; UBI/UBIFS
volumes attach, mount and persist across reboots. The DTB passes
dtbs_check with the same legacy-dtsi warning set as the existing
armada-370 boards (57, identical to armada-370-netgear-rn102.dtb), with
zero board-specific findings.

Tool-assistance disclosure: portions of this patch were prepared with the
help of an AI coding assistant; I reviewed, built, and tested the result on
hardware and take full responsibility for its content. Signed-off-by is
mine (human).

Best regards,
ImAthanasia
https://github.com/ImAthanasia


Signed-off-by: ImAthanasia <pwnzorius@gmail.com>
---
 arch/arm/boot/dts/marvell/Makefile            |   1 +
 .../marvell/armada-370-wd-my-cloud-ex2.dts    | 285 ++++++++++++++++++
 2 files changed, 286 insertions(+)
 create mode 100644 arch/arm/boot/dts/marvell/armada-370-wd-my-cloud-ex2.dts

diff --git a/arch/arm/boot/dts/marvell/Makefile b/arch/arm/boot/dts/marvell/Makefile
index fc4273b..e923397 100644
--- a/arch/arm/boot/dts/marvell/Makefile
+++ b/arch/arm/boot/dts/marvell/Makefile
@@ -164,6 +164,7 @@ dtb-$(CONFIG_MACH_KIRKWOOD) += \
 	kirkwood-ts419-6281.dtb \
 	kirkwood-ts419-6282.dtb
 
+dtb-$(CONFIG_MACH_ARMADA_370) += armada-370-wd-my-cloud-ex2.dtb
 dtb-$(CONFIG_MACH_ARMADA_370) += armada-370-wd-my-cloud-ex2-appliance.dtb
 dtb-$(CONFIG_MACH_ARMADA_370) += armada-370-wd-my-cloud-ex2-appliance-big.dtb
 dtb-$(CONFIG_MACH_ARMADA_370) += armada-370-wd-my-cloud-ex2-appliance-big-keepcfg.dtb
diff --git a/arch/arm/boot/dts/marvell/armada-370-wd-my-cloud-ex2.dts b/arch/arm/boot/dts/marvell/armada-370-wd-my-cloud-ex2.dts
new file mode 100644
index 0000000..6394ba0
--- /dev/null
+++ b/arch/arm/boot/dts/marvell/armada-370-wd-my-cloud-ex2.dts
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Device Tree file for the Western Digital My Cloud EX2 (Gen1)
+ *
+ * Board: RD-88F6710_Alpha_KingsCanyon, Marvell Armada 370 (88F6710)
+ *
+ * Derived from the Marvell Armada 370 DB reference design and the
+ * community WD My Cloud Mirror Gen1 description.
+ *
+ * Copyright (C) 2012 Marvell
+ *   Lior Amsalem <alior@marvell.com>
+ *   Gregory C Clement <gregory.clement@free-electrons.com>
+ *   Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+ *   Allester Fox <fox.axon@gmail.com>
+ */
+
+/dts-v1/;
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+#include "armada-370.dtsi"
+
+/ {
+	model = "WD My Cloud EX2 (Gen1)";
+	compatible = "wd,my-cloud-ex2", "marvell,armada370", "marvell,armada-370-xp";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x20000000>; /* 512 MiB */
+	};
+
+	soc {
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0xf1000000 0x100000
+			  MBUS_ID(0x01, 0xe0) 0 0xfff00000 0x100000
+			  MBUS_ID(0x09, 0x01) 0 0xf1100000 0x10000>;
+
+		internal-regs {
+			sata@a0000 {
+				nr-ports = <2>;
+				status = "okay";
+			};
+
+			usb@50000 {
+				status = "okay";
+			};
+
+			usb@51000 {
+				status = "okay";
+			};
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&reset_button_pin>;
+		pinctrl-names = "default";
+
+		reset-button {
+			label = "Reset Button";
+			linux,code = <KEY_RESTART>;
+			gpios = <&gpio2 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+
+		led-0 {
+			label = "hdd1-blue";
+			gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+		};
+
+		led-1 {
+			label = "hdd2-blue";
+			gpios = <&gpio1 23 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+		};
+
+		led-2 {
+			label = "hdd1-red";
+			gpios = <&gpio1 21 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+		};
+
+		led-3 {
+			label = "hdd2-red";
+			gpios = <&gpio1 20 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+		};
+	};
+
+	gpio-fan {
+		status = "okay";
+		compatible = "gpio-fan";
+		pinctrl-names = "default";
+		pinctrl-0 = <&fan_pins>;
+
+		gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>,
+			<&gpio0 16 GPIO_ACTIVE_HIGH>,
+			<&gpio1 0 GPIO_ACTIVE_HIGH>,
+			<&gpio0 6 GPIO_ACTIVE_HIGH>;
+		gpio-fan,speed-map = <0 0>,
+				     <1500 1>,
+				     <1700 2>,
+				     <1800 3>,
+				     <2100 4>;
+	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		pinctrl-0 = <&xhci_pwr_pin>;
+		pinctrl-names = "default";
+		regulator-name = "USB3.0 Port Power";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-always-on;
+		gpio = <&gpio0 13 GPIO_ACTIVE_HIGH>;
+	};
+
+	sata_1_power: regulator-sata1 {
+		compatible = "regulator-fixed";
+		regulator-name = "SATA-1 Power";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		startup-delay-us = <2000000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&gpio1 22 GPIO_ACTIVE_HIGH>;
+	};
+
+	sata_2_power: regulator-sata2 {
+		compatible = "regulator-fixed";
+		pinctrl-0 = <&sata_2_pwr_pin>;
+		pinctrl-names = "default";
+		regulator-name = "SATA-2 Power";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		startup-delay-us = <4000000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&gpio1 24 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&pciec {
+	status = "okay";
+
+	pcie@1,0 {
+		status = "okay";
+	};
+
+	pcie@2,0 {
+		status = "okay";
+	};
+};
+
+&pinctrl {
+	led_pins: led-pins {
+		marvell,pins = "mpp52", "mpp53", "mpp57", "mpp55";
+		marvell,function = "gpio";
+	};
+
+	fan_pins: fan-pins {
+		marvell,pins = "mpp6", "mpp8", "mpp16", "mpp32";
+		marvell,function = "gpio";
+	};
+
+	xhci_pwr_pin: xhci-pwr-pin {
+		marvell,pins = "mpp13";
+		marvell,function = "gpio";
+	};
+
+	sata_1_pwr_pin: sata-1-pwr-pin {
+		marvell,pins = "mpp54";
+		marvell,function = "gpio";
+	};
+
+	sata_2_pwr_pin: sata-2-pwr-pin {
+		marvell,pins = "mpp56";
+		marvell,function = "gpio";
+	};
+
+	uart1_pins: uart1-pins {
+		marvell,pins = "mpp60", "mpp61";
+		marvell,function = "uart1";
+	};
+
+	reset_button_pin: reset-button-pin {
+		marvell,pins = "mpp64";
+		marvell,function = "gpio";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-0 = <&uart1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&mdio {
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&eth1 {
+	phy = <&phy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <100000>;
+	status = "okay";
+};
+
+&nand_controller {
+	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		label = "pxa3xx_nand-0";
+		nand-rb = <0>;
+		marvell,nand-keep-config;
+		nand-on-flash-bbt;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0x00000000 0x00500000>;
+				read-only;
+			};
+
+			partition@500000 {
+				label = "uimage";
+				reg = <0x00500000 0x00500000>;
+			};
+
+			partition@a00000 {
+				label = "ramdisk";
+				reg = <0x00a00000 0x00500000>;
+			};
+
+			partition@f00000 {
+				label = "image.cfs";
+				reg = <0x00f00000 0x0c900000>;
+			};
+
+			partition@dd00000 {
+				label = "rescue-firmware";
+				reg = <0x0dd00000 0x00f00000>;
+			};
+
+			partition@ec00000 {
+				label = "config";
+				reg = <0x0ec00000 0x01400000>;
+			};
+
+			partition@d800000 {
+				label = "reserve";
+				reg = <0x0d800000 0x00500000>;
+			};
+		};
+	};
+};
-- 
2.39.5

