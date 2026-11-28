Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850177;
	b=1hSL7QBgxKwIzjUe/3wQrvWPSrrvh+lWuuagNZGX6yRcg/gmJrYqZ5blNRUrW953dccI
	 hw4Dqca+w+3yRgXvRQ9kQZLVAmtetwzr8jtLeISYK5Xs4aap/ojsi/750zqA4BTKEKKUj
	 TCW9AdTJ5URpJOmdYYlJd8GQ12G9yd3oNBb6hBfrE7i/aom2gB6oJsCSxM/YQZF7LOIl7
	 c5OnwciKrI/6Ni0asvhJkv0i3oMkknAqpfT3jt8zbZRVO4OglChc7RG0Q1mcC3YkRpHbi
	 FSHArddKrglMukNoC43eIXlCO2wg4xaDyt7Ii6z/AOTMqQSsz9N6mHf+kPn+IKRvg+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850177;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nkqPjgBZvW1pC8TxlESj4YMTVjlgjKCqkchJPtVa1yk=;
	b=iFZ+SJXUTnruKJZxwQXNqmmblec2HLLfKqwm/uszs1Qe9L6J6F7ysztbUGCjDjQlkJ9m
	 mUERzizDIMffetpICNfkQ+aHcgolbgxnF6RPHP0auEWG/IKmxJCzAXYJ3srRQd9ZyYAwx
	 cawhMbIDIVpKs4k1HslUJqw1YOn26Ee6TLOMxe00uvNCvHrdqfllnmkEkz22jY/vo3NL7
	 dXnPf9Inu9DnGs/e158JbnIiK6EEhQOHZvvSGbeSCT+0x0FLoC7q6EPlMq6FQcCyqNiWp
	 1+CmBTEoTWGs/vxWS/T1TbFWdvzPjYc7bLVODvs39VSmfsXzlkxE6/TdrTYbKNF7HqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7DE606A6A0
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA7DE606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so7911135f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850175; x=1796454975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkqPjgBZvW1pC8TxlESj4YMTVjlgjKCqkchJPtVa1yk=;
        b=tzs8Des6cC/GiCqQrqMnB7RgpXichRsQHEir8g7adgP9jHbN/J2SWuS41vSRvVurRX
         pfeHl347PKx95u3LZ8rk5grNED99sS+YIA6XazNMSt2JL+HAEc3mOha2ywhDpmu1S2SJ
         uloMoTMEnFtzW1OcFkeBU5I+hXkoCQdolOg2qcKa/eePHs9f5vaHe5dtSrFtrQWIJurW
         zVBusnqo3VvZD1N0wDT6kMQC8kXd71U6hCmOnsUYQ2kzuewr40s+msPzFDqpSFv44Tu7
         FKl1pdWElxKsfXrL4gFYLza7uon8VhC97ruqHOIEWsZA7djB7eI0Ua8QioqD+KKC+f/u
         9f8Q==
X-Forwarded-Encrypted: i=1; AL+hErHkDzAaxhDjWmzs0iJlyMhewpC0R7YSlsdYqeDksGE5Z83Np+zWbNW3NuPw01HyLMVa/Rm4qTDggUFzD3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Tmg2f0xkwgEGHH2xPnE3udqX/kZ42xlqYNHD4+Ua6SowmmTLM
	MAqt1BTD7rhMXkai/IHtDrhDCRGqb3QN0sRbn6QTyRLJ2BRZ6BXzEbNl
X-Gm-Gg: AZFdTZfmoBdMWDWTjBwifOulsnuE6qSozkR3GviQb2m6YHc9gFIrq+iY7b/nzaS0RK4
	ZnR0GQbFeCE98BNFr4st35qY1CMuZew0wrUA8tCPjY0p0fv51yGp+96zO/c/tAUQxVLnAxKwUTg
	PfG9sNDOubuDIII+ga0C9samspQTLZP0thm0fsp2uegVczzb+4dU8Jq2UcKIMH49PmmJbwr0b9+
	iMQoxWrtWLTGRDOgzQ37AoNYHNnxkdovQ6CtduBuZE9f/QJF7F/TTgXZrcoFloKyrW2rLaYoSfp
	PBN03vSHMNdCBaxPcVuklwy59wRchEDiVBRYEeknEcPwDXCf/jrUzC0ZR0btkrUAi18te5NJxmD
	gubLM+GCai8nNklW0uLp2E9SlCRhsfQmUlgo7WbFg8nLiKbTqp/jF68i3oiB71xl4c9rIz2/4g2
	OLZU0iYbndjq41cr4N7U1zmkOv8fVrHxEqNWQP7t1ZNwM0JK+GXAR7P9E5Jsg/selZLjp64fM1x
	oBcILZIS+WnbyYjPbWIhMRjIZopE0x5FJs872pvdZ0TRwFDFH/jtiaIv+s+50hEzt38SyFLeUrs
	RX/0/qpcdQ5E/xSndC7rnorb8QR6Au7rSspb/GhmsHyeC+OSXVhACdYYFSnQG9Z63oBc9qc2kAT
	iYCTWlcysSZGqxsYOaIYjC6oN
X-Received: by 2002:a05:600d:1c:b0:4bb:9dbd:feb7 with SMTP id 5b1f17b1804b1-4bb9dbdff35mr278936495e9.9.1795850175157;
        Fri, 27 Nov 2026 23:16:15 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:14 -0800 (PST)
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
Cc: Igor Velkov <iav@iav.lv>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/4] arm64: dts: amlogic: t7: add the ethernet controller
Date: Sat, 28 Nov 2026 07:16:09 +0000
Message-ID: <20261128071610.27855-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071610.27855-1-tanure@linux.com>
References: <20261128071610.27855-1-tanure@linux.com>
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

