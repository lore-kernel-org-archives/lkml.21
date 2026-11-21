Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296671;
	b=zgZ/9h8Wb3IdE5g14r2dAA28ZIpQtUwPosvXsueC/y4vXpUR+KVMtg9QOFmWb0hvLD/w
	 XHo64pobcMuXQdi9UK4t+pIfz+UO9H4axdf9G/av4HA6s1Us0dvdpjib6MU9wbZrEC4dZ
	 UyIvy4pi8yQTXnL9KQKTnWkVvpolG9sM4ElGsDJI5nlkI623xJmJbJLC6+iGxnlKmWCoT
	 YOvFFYGwQj9tvZ5oHo+n6Udn3gZ/FkBRHNt2UCI+HiBazh2+txEYlvbaJE3pMd/gYwI5V
	 NfyamIM42LG5Oo18wYedNW8rcqiQSG8TUTXp2a2bqFascdtBL9+6/ZpCD/RzwdjSt5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296671;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nkqPjgBZvW1pC8TxlESj4YMTVjlgjKCqkchJPtVa1yk=;
	b=i+oKhYxoLJEYTPUJVl4nNFH2QtXce4+80gN0hkY7zHzAQDOgdpMLkMdw7oDU2a7eoL3d
	 ZwNKFM+RTOHGGqgSlgToti9fHTYV8gY/UUJEtz6rdwRF6URFWyzH0TRYCdo5wMqGqaiYq
	 ZLXMFT15oYV8hLCpDZaSObHzZv/6JKoO4HTZ1k2Zb3VA+tmFvG/6reBahIz0DPj924+3T
	 JlQaTzZ18vvKN058ZGQok+isDKYmNTxNJM1X1k+nfYt0J9s6NYC8/ayYaUBGmQmvhKeKh
	 g3gBlnoULdm3Sj4OMksTsVZ+0zwIdjSjxkiYqQ0ldnCeHXfxVZeRGHO+XHORHjD5IrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292AE606A693
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 292AE606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492690dd5daso1509584f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:31:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296670; x=1795901470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkqPjgBZvW1pC8TxlESj4YMTVjlgjKCqkchJPtVa1yk=;
        b=PG485fzcDv7BHGLu935z0mXUbttyeooHyCdqn3UlwekQqhXVb5AK22Rrey78M55OPB
         Kz3798tac6uj45nE/iwIJxTUVJNrsSde94+hT+fn3MCYx290CXlzKEOzT0297/0G0R+x
         7lFoDI5ppBNPzbDY977N+1K2YshW0gzNZia6TMNIQjMlXzxq1T941hAgtmP/fMB0262p
         geySQzhA+ApeRaywaBoY2DAFF4YOcAa5LNIjMVSkim4AyGREPwe2gBuXCm/PPuing07Q
         MVDBeBxtBlCGe7sW8zbXRWKZ3L3xejukkumA67aXmQwIwXeK3rMUldRsjwCKDuEGzTfE
         3fvg==
X-Forwarded-Encrypted: i=1; AL+hErG3RHMjEOh1Gye2Hzr+03QUwpungFrKYXEQr4dQKNb3OIoeWl37VM6ofCQ+dpr6tK0O8WWX2HX6xlG7ptI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pS5K6e9yiNLv7wefEONsgu/uS5/RZ8jWaM3MjWreDlYGxchor
	9uu/2DfF0fyEk6FkppMPcBrjXN3r5qSo/OrzK1xQBwni4Pj/k5w+V4Ts
X-Gm-Gg: AZFdTZe3m8yDp1ZKtskena0b41rTLV1P+QwD6eTP1VTQ7B7d6wxM8FfnwuC65qtC7fZ
	ucG3Cntwfe7vwo/OR69XfQD2SYzMeF6ounJDcRXNXpc853BgCuNofQ2w+p6zOl94n6uuhybWcuj
	Tp+9yRWM3On2snfjrv7euE6TMEad71GW4EN/WI+9jkbyl6wYvHDz0ze4QqeyrRe1IRGcB0tH7x2
	LKBN0bg1wkGGkmyiiIu+0gRFSgrN4uIlYEbgLsKYUMUjSdMyO0IFSG/HxePVEQliHE1eNBcp7i3
	wUoSiHLvyb9NHa+OEhcESK9pcWVQ1r/HgcTD2/Dm1UYfcGcrilxvB4iL4jV4vJUXGOLehCnB4fL
	KO7M6/cyTAioJV9rxRQYCpaL1HgfR1QIxYczm9gLbq7NfK/kpw8rxRCtRPxtW38ng0ZG+cxDMcZ
	dfInTi88UbfhoDBb122qnp7rRANrM70fdDEe+kRkp7+PARd1iX4m+BaIdUI+pYAWX76w6V/3bI+
	L3clmswGZeaAdxRuGZUy8jO6bL7E8lK2CZui6XS5QXsL5VMuYnMECWunM2eXmldaiPXtQBPXZyq
	xg4Eb6h55BhAk42EBBFbGEfeZSmnUeSrEdX0d8KBauiTOn2SJHe0W4crGlheE7E44XzvbCh1nUC
	dH05Pq7L50jpW443jQ+Qd/ys=
X-Received: by 2002:a05:6000:4a15:b0:49f:eb4b:faa3 with SMTP id ffacd0b85a97d-4abb2168f46mr13243799f8f.9.1795296669533;
        Sat, 21 Nov 2026 13:31:09 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:09 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
Date: Sat, 21 Nov 2026 21:31:01 +0000
Message-ID: <20261121213102.143130-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121213102.143130-1-tanure@linux.com>
References: <20261121213102.143130-1-tanure@linux.com>
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

The SoC has a Synopsys gigabit MAC, glue registers for the interface
type and clock timing, and a multiplexer that points the management bus
at the on-chip 100M PHY or the external pins. None of it was described.

The controller reaches memory through a pipeline stage with a gate
nothing else claims, so it is switched off as unused. The
glue registers share a clock with the multiplexer, which probes after
the controller has programmed them: unless the controller holds that
clock, the writes are lost and the port keeps the
bootloader's delays.

The multiplexer and the on-chip PHY bus start disabled: a board enables
the multiplexer with the controller, and the on-chip bus only when it
uses that PHY.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 58 +++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7bd53ec16607..eb7f46c98b0b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -250,6 +250,31 @@
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		ethmac: ethernet@fdc00000 {
+			compatible = "amlogic,t7-dwmac", "snps,dwmac-5.10a";
+			reg = <0x0 0xfdc00000 0x0 0x10000>,
+			      <0x0 0xfe024000 0x0 0x8>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clkc_periphs CLKID_SYS_ETH>,
+				 <&scmi_clk CLKID_FCLK_DIV2>,
+				 <&mpll CLKID_MPLL2>,
+				 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>,
+				 <&clkc_periphs CLKID_SYS_ETHPHY>;
+			clock-names = "stmmaceth", "clkin0", "clkin1", "pipeline",
+				      "pclk";
+			power-domains = <&pwrc PWRC_T7_ETH_ID>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		apb4: bus@fe000000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xfe000000 0x0 0x480000>;
@@ -645,6 +670,39 @@
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
 
+			eth_phy: mdio-multiplexer@28000 {
+				compatible = "amlogic,t7-mdio-mux", "amlogic,g12a-mdio-mux";
+				reg = <0x0 0x28000 0x0 0xa4>;
+				clocks = <&clkc_periphs CLKID_SYS_ETHPHY>,
+					 <&xtal>,
+					 <&scmi_clk CLKID_FCLK_50M>;
+				clock-names = "pclk", "clkin0", "clkin1";
+				mdio-parent-bus = <&mdio0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+
+				ext_mdio: mdio@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				int_mdio: mdio@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					status = "disabled";
+
+					internal_ephy: ethernet-phy@8 {
+						compatible = "ethernet-phy-id0180.3301",
+							     "ethernet-phy-ieee802.3-c22";
+						interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
+						reg = <8>;
+					};
+				};
+			};
+
 			uart_a: serial@78000 {
 				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
 				reg = <0x0 0x78000 0x0 0x18>;
-- 
2.56.1

