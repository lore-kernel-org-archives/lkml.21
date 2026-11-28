Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795875321;
	b=mrRdqaLfCUKq63sdWtL5kzaeZZr5OiFbZ743F5YDqYF6GWJ+IKZA6jz2XtfKDQqVSKMl
	 avjbtIOIbAVoY0L4C1XeK7ykb+7Qy/CS0zXCCVTZsBLqdsQrnTY0p2QX8wERSGnaCjykN
	 xyaIRimQnHMe0cbHm53NkI+LD/5CJ5A0l4CYYTt2us1klBL2rN5itWyTqR8k2NtIYmzyR
	 IvVQjhWvlx3gAQbDHuyEU//Lmcz7IoLnTywSssBjkwQnfgEcSqqcHnRR+OVYQiz8Q8jhj
	 sJYoyPaZddfeio2IzukYl86+6YHUrj71NMcK7mtcdN9WzK8ZqTHkQB0Ch3EEibIqelg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795875321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=he4/rKCDgbdZk3ll2x91Vj1rujh0RIHLy9dZg3Zrwz0=;
	b=Rb3lMD/urk9S0ucMvRfBQuXFggolawzGxNuMK32SqKc3w7YeC8YAe95lqlQfkJNhW5MG
	 CN5CGY5zQUANkRwmgEzjvoq9iIO4pwvWBoNOfNwTB2iaVMxMBdcTxJq1OsrsOGK97TLgS
	 0QLamqNZnBg7lMEbzq2Ln0CPzV0ryxOxdhuWPRe3jzFIFPvLN0LZ+B/CNT5RRlme3Y61O
	 zdUGQkX5JA6qDq/xAN8iX5RsHEDBL8glQCa1j4jyvH/2H2N5ZbURkF6bqjIUGOa9xv/3W
	 5hwlWSJ7aVX5kHgnKpI9j+Nax/1HIDDe3QTe+xEmTgXIyd/abusvOdApE2HDFZdrkiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yRpcwWTB;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AA5606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0AA5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yRpcwWTB
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so6874122eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875320; x=1796480120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=he4/rKCDgbdZk3ll2x91Vj1rujh0RIHLy9dZg3Zrwz0=;
        b=yRpcwWTBKAfBHmSL2M5j4D7BiiVv+5v/Y93NurmtSFbLUKusop6h8FuTgMWSoOBtxC
         qePrHUGiLUyFe9My+DqUz16gKzoueTzWrpOcG4PE5Sa/2vtsAoUAxs00jKEXAU0Mk4gb
         88LIKfaQz+N0Ed/BQlvemKsx7Z8s91YqDychRFMeJR9Gjo0L88LG4bpcX/4NJ1UZdtp+
         0vVUz206unHPv6HhqWqgfHHdoGtWjPl47CXD1WkFupd0zYkyUnQqMOMjxkpuJu2C7pp6
         WjRK3dPBq4bcIPKMScQ+0EKKEqJSzu+DMa3rrPacCfGu90O7GVUNU4IZPun8Tj7hTr3j
         +Usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875320; x=1796480120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=he4/rKCDgbdZk3ll2x91Vj1rujh0RIHLy9dZg3Zrwz0=;
        b=gzEp7vPwpUEVN8rDH0rTQbmqiML1OYyXHVcrypPPBKiL2gUAewHWNgLfGNN29c2Mo5
         IYjKSDAhyHJSE055dsjDhgpfDEFbW9ztpBNg5566IdcCdR/AVrjN+pQrNITtSeIHK5Uw
         IBxoPjveN8AIlxSHmZx0aRmVXd5xf1uQIu+ZbDbYeblyEI3oDyJVrowozlGLfIed0ZoM
         IeV43++najYhDXnm4TJRfgbZwJJ73wqGBHSILzLQn2fFJazVGKNF8Uqw7RfSYRJq2V8a
         x25scGoPFfZoucYDyWLwxeoV41sriZJ4iZp+LFucsIeMrthz6tQV70J48TUINUiKrM9s
         mtUA==
X-Forwarded-Encrypted: i=1; AL+hErFAvNtuA8Cn3TqPZpRtJ6+uNRLSBAYXmbfq2eoYLkNeUcXxmvAy3n4lDjJCD+hxBS+feOP+wEPtyKWaKjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z84K88EeBJdtSaiHBoaRtr5PW9aTur4dzt6OyKKHwvuG8zI8PmJ
	yBwMcsYWirDe0IspANJlmtE9UMrz9eEbIouLQjYqOzcUX5MNBL7vR860
X-Gm-Gg: AZFdTZexULPknNFYucdb6ZuMulYpGQbV3e5uxDjBu5qm4euUIlHHKbdPBsQjJZjRHw5
	gxkYhVpZcjKDQujJyhRW3Hpd7DWwhQdIQGnWhhTNvS0mjg9Y/1eheTwRzr/p8rMCxCdTs9/s+cn
	/5o3FMBweR1SmTqe6chMmcKQHLKawgCgYjz8uHuwjkQXAKVwBkQdfhX10K9rzrw0lsqh71KueM2
	KOARC+gmO6a2QfnUA/PEP34rEPHSvsScZ+ptO9YDk9y9wVxfS5lpJPjqmjZoF6zRvW74f7zh8Ek
	p+gHKM9aWPyp3q7BfMIou9LSJvIwOCzYFfM/BWzV6VDE7Z6f4yPmfjLn4jt+ro7oInlDzJ3FkX4
	Ee+AYmVJqYEXtfjF+R6JD1NnyyvSPUgbsXfyuuzJQF1RrW0+EVI8nhiqfEJxsIbLSPDmtcUjWMw
	FiOt/UvpcIloskkuIAzjynC5SqQKfftLX9aycwz1b/QppnAip8cVwh1GcDnxXMYs11+IuC6YWA3
	MQnxerpNkzw6H5wgAR+b4ME/Ok2bSfSjUKmI0k9wR8GtGYKSIsxdthkYLIvRqgyFYwXNfjEtqH2
	WpXn8pXRicBLmOH1tRlqA9+dy1FpuV/ipD/Vcli1IVYw8m4grq1drG79I9JOpqNDNFKZ8HiHz1h
	4IsaP0w4Z7ZQR6IaZ+lHMziUFn8S5
X-Received: by 2002:a05:693c:8859:b0:386:b826:3f9 with SMTP id 5a478bee46e88-386b82605b9mr16717778eec.7.1795875319705;
        Sat, 28 Nov 2026 06:15:19 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.15.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:15:19 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH 2/6] arm64: dts: mediatek: mt8189: Add SPI controllers
Date: Sat, 28 Nov 2026 19:44:26 +0530
Message-ID: <20261128141443.13065-3-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261128141443.13065-1-sinha.aryan03@gmail.com>
References: <20261128141443.13065-1-sinha.aryan03@gmail.com>
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

MT8189 has six SPI controllers. Add them, disabled, so boards can enable
the ones they use. Chromebooks need this for the EC, which sits on SPI0.

The nodes follow the downstream ChromeOS kernel's mt8189.dtsi, with the
clock providers renamed to match this file.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8189.dtsi | 84 ++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8189.dtsi b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
index b64882a93..e0883da15 100644
--- a/arch/arm64/boot/dts/mediatek/mt8189.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
@@ -484,6 +484,90 @@ uart3: serial@11004000 {
 			status = "disabled";
 		};
 
+		spi0: spi@11010800 {
+			compatible = "mediatek,mt8189-spi", "mediatek,mt6991-spi";
+			reg = <0 0x11010800 0 0x100>;
+			#address-cells = <1>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI0_SEL>,
+				 <&peri_ao CLK_PERAO_SPI0_B>,
+				 <&peri_ao CLK_PERAO_SPI0_H>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			interrupts = <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH 0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi1: spi@11011800 {
+			compatible = "mediatek,mt8189-spi", "mediatek,mt6991-spi";
+			reg = <0 0x11011800 0 0x100>;
+			#address-cells = <1>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI1_SEL>,
+				 <&peri_ao CLK_PERAO_SPI1_B>,
+				 <&peri_ao CLK_PERAO_SPI1_H>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			interrupts = <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH 0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi2: spi@11012800 {
+			compatible = "mediatek,mt8189-spi", "mediatek,mt6991-spi";
+			reg = <0 0x11012800 0 0x100>;
+			#address-cells = <1>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI2_SEL>,
+				 <&peri_ao CLK_PERAO_SPI2_B>,
+				 <&peri_ao CLK_PERAO_SPI2_H>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH 0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi3: spi@11013800 {
+			compatible = "mediatek,mt8189-spi", "mediatek,mt6991-spi";
+			reg = <0 0x11013800 0 0x100>;
+			#address-cells = <1>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI3_SEL>,
+				 <&peri_ao CLK_PERAO_SPI3_B>,
+				 <&peri_ao CLK_PERAO_SPI3_H>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi4: spi@11014800 {
+			compatible = "mediatek,mt8189-spi", "mediatek,mt6991-spi";
+			reg = <0 0x11014800 0 0x100>;
+			#address-cells = <1>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI4_SEL>,
+				 <&peri_ao CLK_PERAO_SPI4_B>,
+				 <&peri_ao CLK_PERAO_SPI4_H>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi5: spi@11015800 {
+			compatible = "mediatek,mt8189-spi", "mediatek,mt6991-spi";
+			reg = <0 0x11015800 0 0x100>;
+			#address-cells = <1>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI5_SEL>,
+				 <&peri_ao CLK_PERAO_SPI5_B>,
+				 <&peri_ao CLK_PERAO_SPI5_H>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH 0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		auxadc: adc@11019000 {
 			compatible = "mediatek,mt8189-auxadc", "mediatek,mt8173-auxadc";
 			reg = <0 0x11019000 0 0x1000>;
-- 
2.46.0

