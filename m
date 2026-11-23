Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432760;
	b=JpXN/p/4zGWH1ekMmreN+WU5fWbF/Y2pPP5OYFnJ9L05zemU3LLPR+VtkVcD5PgbONwu
	 v04dd+kYDQ1XHLEfn4oQcsPRtCVB2EvebchpNa00kpygRCuQbDHi/tYCaJi91EKQVNTBY
	 kemAec+No/MS5dNAhlqVp1SU8UQCejgXTIPUW1cmIxwqgo/fobNChuICotLUZvhJhs2fV
	 1DYX6nc0pTkiJNDClMqI7ijdq5hGqC3w9YS/99kHmL77tKxbiU0TICIJUykp+JsdqPtHw
	 PdxbiwpM9q94U8uywnMFQKJc5oK/NhqUN5HMhfDuaUONyiETht3tQomOEr2ajBwoY9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZTYyCf3yq+FPJgr8Karin0tCSx+qzJ4PS7WFFQlBVEg=;
	b=DmofwkjOy2DA5VTxOZrdm768Ek3v6S8yegeVeL/u7eZzMoJi4tzBMv/mCTDQ+rltStyj
	 YoeT0M8e0AzC6zI5EW4a5BoR0xgWa8QdiTIFIZOSJchsBnoA+4AXE21WGGnPfQ5/0emfd
	 ksJZNuCXHnpCJRBQRK84ALlS43Tm6ZUfzEA9xDHqPD6dTV4G9TPMDNE57rkUojTzaXsuW
	 3gXmIc5yDeL7b4FhAN4hgIrRvi8NOaZQ2ZX0cIRWGz9Ny9RE+Vgb3ABlcGaAvP4Vcsuu0
	 eTmb7OjbfEFQ7DpAPcjWxgI40iAvsfWyZItnkP/l51JC4qHipLQm26BV2Hrb2sTIBBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irj4LZ5k;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F90560A5BC0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F90560A5BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irj4LZ5k
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d28f75d62so522462566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432758; x=1796037558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZTYyCf3yq+FPJgr8Karin0tCSx+qzJ4PS7WFFQlBVEg=;
        b=irj4LZ5kRy6yRgUhGg1kbm92HcmMCoMLneUJ1641AVWfolLANDiIf3OmqL1qK0R86g
         Ztg59feCeB4uIqZUKmoBPxBg/H4XEYVkaT/eYEZiltNrG1SOnYRgzj3YAfeFfVEoJIWK
         1V8zI8+9kody6xxnD1ow7f5yu/kMdzDAEOkfRvWDx1qaHJaU1uqD9tbt1X9kQ8FYZ0yz
         +FvAag8XgfIO+LISFHNN6d5eq9vULtLoT2Pe+xNlwSAzXonylDjoWKMEgxRgc7a3ZBZV
         HK/8SCrP+GMGX7FMKXF8E9mc9oPeOQdPThDbIVyMdZ6aouGkPUI2Ik7Zu7LDLThHuUfO
         Bxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432758; x=1796037558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZTYyCf3yq+FPJgr8Karin0tCSx+qzJ4PS7WFFQlBVEg=;
        b=W5p+GnZRDv+Ly4jPgA4PYVgGfNMo5qC/sVgaIZ4d7YB2PwF3fMnAYtzC40lQDIHXAK
         akUgsrMOvXTcrg+BNnDwyKH/ymR+ErJZ+QIMR5xW11XNzYN3ax3wuEjlnZUH1px5c7zF
         PKiabxaS77dOKo7Zxd1Fw6erbXZFKNafMMGEXiLfGSv4Ub8wdFLi9ZVres2frqH73SHI
         KX4fXfF/Om6Y4lXlLhON6TiUwmyTjJMh48e+Cw1xx8FF2KkVCDUMW0v/pDeN6ey5Kf8W
         qIfSD39kYRSlTzsAVZhUmUWVBnFICoMie2ZzhEk7bdL9MTmfnQiTrkyT2pp+wTk7/puL
         eDBg==
X-Forwarded-Encrypted: i=1; AL+hErFCvzn24kdYVgSp+N3B7OFvNH3cPvrQcFsz7YULd4J5ZWEW1HSobp1rf/R1JiovPlIK25lYKnRQT5czPbo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LB/wsE2kdvWaMbtqWpOkAFILtrHKzo/bjHuOVweLLgdrvJc4Y
	RBcyacKlKEdnKGLHlt2X2mJgBy8QgCP8LX4fOQWYevedpIgZmIg3nBTl
X-Gm-Gg: AZFdTZd2a3645GZ9dx60fQDc+dguu3SQ4DFxGpS2TdtpS3CVkU0E5zTns1ZYi56AKf/
	Zkz4qKrBIVnZtylg0X4yiqCux6bU8B669wVf8yv09WUqjYgNQTszB33SC39ESeowtieyRJsGG4q
	O68H39vaoI4wmho8u7QIsrupOauzk7L54+0hhbyNYN9zi2PGq5CDDNRI5qzMqgGy8TqpP5rpijf
	SWJb73lJQif0z4QQr72sdei9qIE2YlSRtha9GMUIpbPl3XTJUjfMeW0Oqi5sHnyglGTGafa1oXX
	LtX8xTQelMnc+mULtJ/Ra0G8Zr+2+tlHE8ZBp3L7LaTncJXobp3tBV6OYZ/bPltoLEMF2Xa8dGi
	qzpRuA5ACbj0f8YRIF5ZRmFu30f7mAqts0H/36F2dNqdX04CrrAyRAbia55cXo8cQQJLNS5vLbl
	Sd3zNDleHS896P/rx2uqqP6dTZ9klXvOiJ7FB8BuOGz6/6WPlIdf2mksBoMMwst6zQPAk7vqmfm
	D70gWhgEuzTlRL9u6V+ETimai6hxAPw2mPKY9ctKITWC8ejbc2C5Eh+85OG/bo2uEtmAcOCns2r
	2oaF2qxPyCHGW/aAIzyKDWopIkBCVJ9MAuqogkunemwIR/zo0MwTXBcI63q6Pa/pTA==
X-Received: by 2002:a17:907:1396:b0:c48:a838:c16d with SMTP id a640c23a62f3a-c513ab4925bmr609639066b.30.1795432758535;
        Mon, 23 Nov 2026 03:19:18 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:18 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:40 +0300
Subject: [PATCH v3 7/7] arm64: dts: mediatek: Add Xiaomi Poco X4 GT
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
Message-Id: <20261123-initial-mt6895-v3-7-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add a device tree for the Xiaomi xaga board, which is sold as Xiaomi
Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i. It enables a serial
console on UART0 and the volume down key on the SoC keypad. The power
and volume up keys are connected to the MT6363 PMIC, which isn't
supported yet.

The DT only describes the memory that Linux itself uses, which is the
ramoops region. The bootloader updates the /memory node and adds the
firmware carveouts to /reserved-memory, so their addresses are not
hardcoded here. This DT must not be booted with a bootloader that does
not do this, as Linux would then use memory owned by the firmware.

The ramoops zone sizes place the console zone at the offset where the
bootloader expects to find it.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 arch/arm64/boot/dts/mediatek/Makefile              |  1 +
 .../arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts | 87 ++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a86fb313b1a9..d73489149ab5 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-sony-xperia-m5.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt6895-xiaomi-xaga.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-cudy-wr3000-v1.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
new file mode 100644
index 000000000000..7bfe0d438803
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2026 Alexander Letuchiy <asalde.le1@gmail.com>
+ */
+
+/dts-v1/;
+#include <dt-bindings/input/input.h>
+
+#include "mt6895.dtsi"
+
+/ {
+	model = "Xiaomi Poco X4 GT";
+	compatible = "xiaomi,xaga", "mediatek,mt6895";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		/* The size will be filled in by the bootloader */
+		reg = <0x0 0x40000000 0 0>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		/* The firmware carveouts are added by the bootloader. */
+
+		ramoops@48090000 {
+			compatible = "ramoops";
+			reg = <0 0x48090000 0 0xe0000>;
+			no-map;
+			console-size = <0x40000>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x10000>;
+			record-size = <0x10000>;
+		};
+	};
+};
+
+&keypad {
+	debounce-delay-ms = <32>;
+	keypad,num-columns = <1>;
+	keypad,num-rows = <1>;
+	linux,keymap = <MATRIX_KEY(0, 0, KEY_VOLUMEDOWN)>;
+	pinctrl-0 = <&keypad_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pio {
+	keypad_pins: keypad-pins {
+		pins-col {
+			pinmux = <PINMUX_GPIO107__FUNC_KPCOL0>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			input-enable;
+		};
+	};
+
+	uart0_pins: uart0-pins {
+		pins-rx {
+			pinmux = <PINMUX_GPIO88__FUNC_URXD0>;
+			bias-pull-up;
+			input-enable;
+		};
+
+		pins-tx {
+			pinmux = <PINMUX_GPIO89__FUNC_UTXD0>;
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};

-- 
2.56.0

