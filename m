Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518831;
	b=MXb8VfS7GB2v5LkjCF0Gp5Me6yjvjVQyY9Zb014PXacKbgAczMEFq5ZIdwX1OfcsB5Xo
	 zOgDPHQxDS4MjAJ3J7UEs+O1BN6yGhK4nTUmETz5sqhRaPziAYaNfE/jr36Gl7MFE/+iH
	 pKSrm0/ZZQ8KIgWoT4y+i8ixBlUeBFpRx29OkIEAPRNYjlHJbLC5fLvF18F7y3YSr0jcV
	 7df3oakEUDVSF0sveH07PKHqto67Y09iK8tQizS+Mw88r4Dau3scaDfIlvypWFmd/u5nN
	 aMhfnNtlVZhdV1EFCibo+tNwVZG4otBmd3EkSLzlV08DiPGEcPvaOKYzIBfI18W07OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yG2dCjBS4ggkEY33xu61CfV0q36FoceeadD9K8iGVnE=;
	b=QKa2d/ja3hU0VYbN7KjFsRoKwO0kAku2IafcocV0AA16Gw2CmWeoLKRIZoxR2ALdGVyY
	 mnfFtBg6x7SYHNCob6wRGNz8gSskF/egGufVLqWoJfKHFPMhrNUnPN0JJGZw+z7riE6hl
	 8g/AWcEaWUqn5hckwAAlG189x6Rcuug5t9vk5K7xvJmS0OS65mDODxQGvujbtBx+8VQny
	 ZmeOLx2AtEBGM7rLWFPxd2fsG9H6MuCw/CMo65WwJ3rq4y6CQX+6Z7aOYXV+AWEdJXcp0
	 EHwdVPdhJcQE3PPYRxVQw/ZL85XCyKPmiuiYpWaNKJocULRkKq1DzgRgYiW+CRIJzTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDrFrceU;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB609606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB609606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDrFrceU
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so38041045e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795518829; x=1796123629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yG2dCjBS4ggkEY33xu61CfV0q36FoceeadD9K8iGVnE=;
        b=fDrFrceUJv2oPRnXubjKtGLG+//ACaWZciX3qP56yxOm3nopWl0wgIQ++FBrvZ/FND
         t+mik1xF3OpSkYh5yrMsgHkPM7lLYYsgI6Qrpav/Ug+9pOCG05LMQHU85uTVn7qCEHnG
         BjOQ4zkPU9OGRN0OUd3Hf3S/Krklu3OETxGINuy8OWRI1EjY3U6ZsfX+5S7eBLXJv6R3
         X/JysY53uRRTFA/W5K15P04P9gMKFC9xRqEQ2Lfp9lhcKcbSNS908nraf4M06jknAlCD
         kDW5IKkTMnc12m2kwY4RcyDqpCS6GL5mmhOqPkkXfK3gSpX6VoLuofCXNce6sOSlKVzD
         fucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518829; x=1796123629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yG2dCjBS4ggkEY33xu61CfV0q36FoceeadD9K8iGVnE=;
        b=FY1vqgTcgBhMFU0qbwvNQSx6LZRBEraO/lOqSUYD3oXw7GD4QdCkcfL+JItEuuzDlZ
         zaF5L2LwXIVU7WxfMj9F1blRNQG40xGRRsCqOjo7xv7MLVaS53p+C8D3Lu54V3BiJsmn
         dA4b86403zJLxyPLhDXQoqOVTEy+II/E9y+RHAuQUQ7uJXXm1TYQ12zf0qsQKOH8HE7R
         jltBjsv9rr4TsNC7AgF2mn1YusYsLYAZ8tRnqNf/I296kZwrvxuECTuVWHu3VI7sZJHc
         BTrJFpppfoMm3kMjAe0q6OmsJqkN9fnEw07B1OvUE9n1ExP3mP6RezamrRQYy7tlSGkW
         rRFg==
X-Forwarded-Encrypted: i=1; AL+hErGICIEFrSHiim8Nwt1cA6VvuVjoC6thnqeTzdiuBBX7hLVEfDU7F3pdD8HSp9Rm1CnWpwyc2gFB1J+fKQc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8z3MxFOZYVyp5yZwO9L1Bmxr/+0OgXi4l4amMuttm4y8owcoMt
	RLVHvWvsI5/N4NdHsAQc6OFKZMDYfPFqesEM2qmaJWDmRroOQHXMcH2Q
X-Gm-Gg: AZFdTZe0w+PuXrIB6KCHkn6PYMiS7b/HyoMp7iVBoVJnLDN3uKtXFCYFm/7M38Xcxm4
	ZqjhtYuMivvLGf/h3Xg2XhOMgnECfxHhd/thmkEuxM28RbgADMsYUAAaGUp59uR5huW7t4Zuuoa
	7i7h++DVsEdUEvmzz269GEoC5vS0ztw3pLbbPAdrKZnPtydzAkr4RfK59gWCB+k8CoFk2xflP9R
	+MYHGQ1ZOQ5L1OXfONsxRoYdOO8kp3/mKc7PEiRe7YqUKj7a2CoTbcGule7ucJy/Ci/imEINhnq
	l0sEJW8inUdWkcKAx1ELaQNumVgoCztKsOhXfACv8DCETw/kryJ7xB8jDs7hc7MPFejB6xxaFaJ
	8YEzdOOTWnqginv8g2E+5I2tLuS72zEWMIJ4FGEvM9NFudLlcxQznKNdzYI617zauuYaG/erUGa
	iZZi6HtXFuPacjFveDl7daCETGYSaYZwhnQwu4Yt4wXmhnC3wapzUHSmMLwbOH7UUp1IA2p32Ue
	G/4OtcGIsKbTVY1PgCJT58CqYzEK8X4MFXlrJkQ47vvhLuvWIpjzaGwlAmDd8YQtqmOXI4whWzc
	qOWMZw093MOW8lHzBhYkZlysqCTIfTuMIyP0uoocGMpQsHs=
X-Received: by 2002:a05:600c:1d8c:b0:4bb:5345:606b with SMTP id 5b1f17b1804b1-4bb8882358dmr285246895e9.31.1795518828812;
        Tue, 24 Nov 2026 03:13:48 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm27642918f8f.5.2026.11.24.03.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:13:48 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v2] arm64: dts: amlogic: khadas-vim3: add SPI NOR flash overlay
Date: Tue, 24 Nov 2026 12:13:33 +0100
Message-ID: <20261124111333.33734-1-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103164730.160593-1-jnieto.alaber@gmail.com>
References: <20261103164730.160593-1-jnieto.alaber@gmail.com>
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

The Khadas VIM3 has a 16 MiB SPI NOR flash (W25Q128) whose data lines are
shared with the eMMC D4-D7 lines. Add an overlay that restricts the eMMC to
4-bit mode and enables the SPI NOR controller, exposing the flash as an MTD
device.

The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
nor_hold_wp_pins pinctrl group is intentionally not used.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
Changes in v2:
- Keep the original BayLibre copyright and mention the U-Boot
  meson-khadas-vim3-u-boot.dtsi origin (Neil Armstrong).

 arch/arm64/boot/dts/amlogic/Makefile          |  2 ++
 .../dts/amlogic/meson-khadas-vim3-spifc.dtso  | 28 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 57bc440fa55c..3714cbaaa03e 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-bananapi-m2s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-spifc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-ts050.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-cm4io.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-mnt-reform2.dtb
@@ -104,5 +105,6 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
 # Overlays
 meson-g12a-fbx8am-brcm-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-brcm.dtbo
 meson-g12a-fbx8am-realtek-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-realtek.dtbo
+meson-g12b-a311d-khadas-vim3-spifc-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-spifc.dtbo
 meson-g12b-a311d-khadas-vim3-ts050-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-ts050.dtbo
 meson-sm1-khadas-vim3l-ts050-dtbs	:= meson-sm1-khadas-vim3l.dtb meson-khadas-vim3-ts050.dtbo
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
new file mode 100644
index 000000000000..9f57d9433ee8
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (c) 2026 Jose Nieto <jnieto.alaber@gmail.com>
+ *
+ * The Khadas VIM3 on-board SPI NOR flash shares its data lines with the
+ * eMMC data lines 4-7. Restrict the eMMC to 4-bit mode to free D4-D7 and
+ * enable the SPI NOR controller, exposing the flash as an MTD device.
+ *
+ * Derived from the U-Boot arch/arm/dts/meson-khadas-vim3-u-boot.dtsi file.
+ *
+ * The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
+ * nor_hold_wp_pins pinctrl group is intentionally not used.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&sd_emmc_c {
+	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_4b_pins>, <&emmc_ds_pins>;
+	bus-width = <4>;
+};
+
+&spifc {
+	status = "okay";
+};
+
-- 
2.47.3

