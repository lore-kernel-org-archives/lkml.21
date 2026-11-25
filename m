Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649525;
	b=yWyi15h7X5F9neidkOJ65T+fh7UiHzfT3+EMoxjuaM2+mwQHpyNlH74/1WZ5qN1N8sgN
	 1G67keMT0Mcb/6NR3BrdU/rl2DXKpwghVQyF6htUMulGUfIkLu3gnWJFudZb9OBitbVPJ
	 UVFa0Hj18vuAjlwkrJwFAHkJgC1kxopmLwoNz5IdiB7ZFwrDhNGQW/mh/Sd/WJ2Clz5AP
	 x4VogsKLNcTbxtXbmVeBqz7RApuhjAxE9LHr3TGca+Dxtfjau6jj6Ntjze6fphu10+txx
	 JpQOQh/AdWsECThQGf6KzsXa2NQeAV040jGj4QkYSJzu+bcCKdLHoJoX7xsSVrvPhdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ZlVPxpw04CeXrcuckgG9gRUvr8QzkEIp3OzwElDk6ZE=;
	b=VgAEvIQINnGgol67NzZlTGw438pDI602VIr9lSeUaUHUfNHDquen4DLGBmFu3+rfeiGe
	 ZBIN3kJjqTiF7NbEdk7Va+SC5p7kgmPyEZH+E/s/aKh7r1cVuST8yIV9wO5i2tj/lkpuC
	 nyMh1ud/Clkskved7yLGigHLYndn58FQZKKLrqXGQHr7KzhtM2TvobKMuhP4ffWsI/cdK
	 2UTPbAo9LgVJwenv2WtjLnsYzTeU+vVAjFK7n2UQO2/E6WHh08qIWkb7pw/7WZyj4cONM
	 VcaGVekyDaYSh7bJcKO/Qy3YfP2QRC+/BI5213HFut6dTAZvpgJtZvDzRdZnSvApTlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g/NqC1qt";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B260606A6A5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B260606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g/NqC1qt
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492f0a1b685so4459923f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649523; x=1796254323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZlVPxpw04CeXrcuckgG9gRUvr8QzkEIp3OzwElDk6ZE=;
        b=g/NqC1qtssT8iPVoLdhIM+ghphV3dQq7EnxQcsbIazQo9CzyDFKNSsL5M019Z4BU7z
         1fRZFN6pHoVQijRDmsp08C6b9BIWQ4RfkqanNA4/Mxpq4dUAsnTneBc6KvRVenae6kTq
         SHl9PgLpGn2meI4J9PHA1oUoNjzy6yCbu9bR/u+7/TgfMLqrwK9B8okKw/FxMS95JOAQ
         rtULO2PW3ffyv37FAmrjyghSdnLJy1uc7GxTiGRYepWjJPTVPpCBY1EMgkCn/tYBuHVj
         O5AyAiEv0j94eoE7R6kb7sEv27tiXYY2DPqLNt0e9ih5qJQ+DnHM2ZE0gJnheU5atYuN
         B63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649523; x=1796254323;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlVPxpw04CeXrcuckgG9gRUvr8QzkEIp3OzwElDk6ZE=;
        b=v7IBNU2UqrRDWf8LJQ+YYdZzXSPM/NjEOw4oc98fKQFdq6nQUAtRuwJq6vUKnb1IXs
         H3V9qfal7r9ighKYG62jc61hK1eRJI0J4T0cJlxTaIJM2ZdUBM+12lAnWvrG8aW97MDr
         2cssMqKG0xmrrizPU5vZCL8BiUaVxRuIrk1Kse8taWqgDS+n2s1tCt5DwjsLfTaFmwWP
         rtmLSesQgG1QChl1BxMuMIu8Hzqjzt7tfuKhlDVMk5tx31wYhyW802/o6V/ERo2RDnN1
         ttmItY3Q8XMvexrIG2BkBhuK28SP8FX6MrQN/T3ndOe+96TFWq3i9aoriRtm1L46yFfh
         29MA==
X-Forwarded-Encrypted: i=1; AL+hErEaFIte1y/29187MSVYeLCTzj1EPtDGiHK/ZjzgHCsEdCi9w8GXcd3dQsTrwhZAVJ0MMhzXUb968DplRVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yrP+CkS4+lWammb3PiJgNPh2hFDkBIe3Znk8yXTV+uQoPZjIx
	KSxTuYVmbBqyKPn82SFzUCV7UzECs1XG5Vh4nYBKY1r7xTLT6bAKM9zd
X-Gm-Gg: AZFdTZclHnraWHcxjzO9OEV3VyqCETSzaS3QyQyl2aFktk1MAxx8TRM7fYLQeHDYTTk
	7ZWL5pA3Cr+ogMMy0MFi/k708j7l/jsFdxVK3OUaQz/jHc7xSyRgEgX77hdE45h5C9y+DeWBbvj
	/w3tiLkNVHZXToH6hEfIbZHZNS2sPGajfgVSLdq8ahGJ3dEf1QVx0UeE9NMa9FexigmN93W6kAm
	ViccSkwlcJUUpuKgJ1xq/94bQ8jZl9/pcf1TQY8mWQxzzgp6nfJIWu3q/zxi81vXyzSmhZLI/Mv
	JIT34Vz2AbNxmCr71L9bhywGP3cXy1gqf3hRYyZgsi1m/gzde3vPJ6Jh6HeBHVWJMLpolri1FXQ
	rzDANE8ivNptBPYMZfy+AXuZfOOA1AlgmqDyrUOvBLVJ5XMFL2DgwGp9V8QHMpWpg1st7Tjkrud
	eQnD3oLqxpMgB/6Swdupkj26/smfTUOwestuEvKPcASnEry5R1ptWab4OmGRxOKxJr/ZdjN+YA4
	j07GSjkjZ8wNsEE5BxO7mvaGKGEkAog5tWTJFLfDKDxNDuLX8IienS8pvRNikB3XMy6sMfn52cx
	UMLIkiQ4A+kCNns9N5uOSgToSwSSQXrr6h0NPkPn263Nt9zdePPpaySpGNSdAyqfO5cmEmpnRzb
	Jqd2M57ljMA==
X-Received: by 2002:a05:6000:2409:b0:48f:d7cd:a5af with SMTP id ffacd0b85a97d-4aba56f5488mr36258812f8f.0.1795649523589;
        Wed, 25 Nov 2026 15:32:03 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm36432985f8f.49.2026.11.25.15.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:32:03 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH RFC 18/19] riscv: dts: Add Waveshare ESP32-P4-Module-DEV-KIT
Date: Wed, 25 Nov 2026 23:30:19 +0000
Message-ID: <20261125233020.1380594-19-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
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

Add the initial ESP32-P4 SoC description for the CLIC, CLINT,
interrupt matrix and UART0. Describe the board's 32 MiB of PSRAM and
the 40 MHz clock used by UART0.

Build the board DTB when ESP32-P4 CLIC support is enabled. The initial
device tree supports booting to a UART shell on the Waveshare board.
Use UART0 as the default console at 115200 baud.

Describe both HP harts in the ESP32-P4 SoC device tree.
The initial Linux support runs on the boot hart only.

Select the revision 3.x interrupt matrix on the Waveshare board.

The CLINT timebase follows the CPU's clock. The firmware must populate
/cpus/timebase-frequency with the actual rate before booting Linux.

AI assisted with formatting the DTS and validating the resulting DTB.

Link: https://docs.waveshare.com/ESP32-P4-Module-DEV-KIT
Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 arch/riscv/boot/dts/Makefile                  |  1 +
 arch/riscv/boot/dts/espressif/Makefile        |  2 +
 .../esp32p4-waveshare-module-dev-kit.dts      | 46 +++++++++++++
 arch/riscv/boot/dts/espressif/esp32p4.dtsi    | 64 +++++++++++++++++++
 4 files changed, 113 insertions(+)
 create mode 100644 arch/riscv/boot/dts/espressif/Makefile
 create mode 100644 arch/riscv/boot/dts/espressif/esp32p4-waveshare-module-dev-kit.dts
 create mode 100644 arch/riscv/boot/dts/espressif/esp32p4.dtsi

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 69d8751fb17c..fa0f23de2616 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -3,6 +3,7 @@ subdir-y += allwinner
 subdir-y += andes
 subdir-y += anlogic
 subdir-y += canaan
+subdir-y += espressif
 subdir-y += eswin
 subdir-y += microchip
 subdir-y += renesas
diff --git a/arch/riscv/boot/dts/espressif/Makefile b/arch/riscv/boot/dts/espressif/Makefile
new file mode 100644
index 000000000000..fd89616862fb
--- /dev/null
+++ b/arch/riscv/boot/dts/espressif/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_RISCV_ESP32P4_CLIC) += esp32p4-waveshare-module-dev-kit.dtb
diff --git a/arch/riscv/boot/dts/espressif/esp32p4-waveshare-module-dev-kit.dts b/arch/riscv/boot/dts/espressif/esp32p4-waveshare-module-dev-kit.dts
new file mode 100644
index 000000000000..bdef328e19ef
--- /dev/null
+++ b/arch/riscv/boot/dts/espressif/esp32p4-waveshare-module-dev-kit.dts
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/dts-v1/;
+
+#include "esp32p4.dtsi"
+
+/ {
+	model = "Waveshare ESP32-P4-Module-DEV-KIT";
+	compatible = "waveshare,esp32-p4-module-dev-kit", "esp,esp32p4";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	xtal40m: clock-40000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+	};
+
+	memory@48000000 {
+		device_type = "memory";
+		reg = <0x48000000 0x02000000>;
+	};
+};
+
+&clic {
+	compatible = "esp,esp32p4-v3-clic";
+};
+
+&intmtx0 {
+	compatible = "esp,esp32p4-v3-intmtx";
+
+	status = "okay";
+};
+
+&uart0 {
+	clocks = <&xtal40m>;
+
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/espressif/esp32p4.dtsi b/arch/riscv/boot/dts/espressif/esp32p4.dtsi
new file mode 100644
index 000000000000..211eef62b52e
--- /dev/null
+++ b/arch/riscv/boot/dts/espressif/esp32p4.dtsi
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		/* Firmware supplies the timebase-frequency before boot. */
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "esp,esp32p4-hp", "riscv";
+			reg = <0>;
+			mmu-type = "riscv,none";
+			riscv,isa-base = "rv32i";
+			riscv,isa-extensions = "i", "m", "a", "f", "c",
+					       "zicsr", "zifencei";
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "esp,esp32p4-hp", "riscv";
+			reg = <1>;
+			mmu-type = "riscv,none";
+			riscv,isa-base = "rv32i";
+			riscv,isa-extensions = "i", "m", "a", "f", "c",
+					       "zicsr", "zifencei";
+		};
+	};
+
+	clic: interrupt-controller@20800000 {
+		compatible = "esp,esp32p4-clic";
+		reg = <0x20800000 0x10000>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	intmtx0: interrupt-controller@500d6000 {
+		compatible = "esp,esp32p4-intmtx";
+		reg = <0x500d6000 0x400>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		#address-cells = <0>;
+		interrupt-parent = <&clic>;
+
+		status = "disabled";
+	};
+
+	uart0: serial@500ca000 {
+		compatible = "esp,esp32p4-uart";
+		reg = <0x500ca000 0x1000>;
+		interrupts-extended = <&intmtx0 31 IRQ_TYPE_LEVEL_HIGH>;
+
+		status = "disabled";
+	};
+
+	timer@20000000 {
+		compatible = "esp,esp32p4-clint";
+		reg = <0x20000000 0x10000>;
+		interrupts-extended = <&clic 3 IRQ_TYPE_LEVEL_HIGH>,
+				      <&clic 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
2.56.1

